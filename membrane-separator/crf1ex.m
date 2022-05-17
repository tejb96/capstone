function res = crf1ex(t, Pm, alpa, ph, pl, r ,qf, xf, theta, xr,L)
% Membrane separation process for binary feed using cross-flow model
%clear all;
%crfdata;
Pa = Pm(1); Pb = Pm(2); D1 = ((1-alpa)*r + alpa)/2;
F1 = -((1-alpa)*r - 1)/2; E1 = alpa/2 - D1.*F1;
R1 = 1./(2*D1-1); S1 = (alpa.*(D1-1) + F1)./((2*D1 - 1).*(alpa/2 - F1));
T1 = 1./(1 - D1 - E1./F1);
i0 = xr./(1-xr); i2 = xf./(1-xf);
ur = -D1.*i0 + sqrt((D1.^2).*i0.^2 + 2*E1.*i0 + F1.^2);
uf = -D1.*i2 + sqrt((D1.^2).*i2.^2 + 2*E1.*i2 + F1.^2);
theta = 1 - ((1-xf)./(1-xr)).*((uf-E1./D1)./(ur-E1./D1)).^R1...
.*((uf-alpa+F1)./(ur-alpa+F1)).^S1 .*((uf-F1)./(ur-F1)).^T1;
yp = (xf - (1-theta)*xr)/theta;
Ami = quad(@(x) mArea(x,D1,E1,F1,R1,S1,T1,alpa,r,xf,uf), i0, i2);
Am = Ami*qf*t/(ph*Pb); rc = theta*yp./xf; % recovery ratio
L =( Am/(2*pi()*5*100))/100;%m
Pf=ph*1333.2239;%pa
Tstp=273;%K
T=301;%K
Pstp=101325;%pa
q=19.6067;%m3/s
ploss=(18.51*1e-6*8*L*q)/(pi()*500^4);%Pa
ph=(Pf-ploss)/1333.2239;%cmHg
% Calculated variables: yp(permeate mole fraction), Am(area)
% theta(stage-cut) or xr(reject composition)
% Results: results = [yp, xr, Am, theta, rc]
res.yp = yp; res.theta = theta; res.Am = Am; res.rc = rc; res.xr = xr; res.ploss=ploss; res.L=L; res.ph=ph;
end
