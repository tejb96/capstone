function result = memb

clear all;
% crfdata.m: cross-flow calculation data
t = 0.01; % membrane thickness (cm)
Pm = [18.31 4.01]*1e-10; % permeability(cm^3*cm/(s*cm^2*cmHg)
alpa = Pm(1)/Pm(2); % ratio of permeabilities
ph = 500000/1333.2239; % feed side pressure(cmHg)
pl = 101325/1333.2239; % permeate side pressure(cmHg)
r = pl/ph; % pressure ratio (Plow/Phigh)
qf = 451333333; % feed rate(cm^3/s(STP))
xf = 0.2192; % Feed composition (mole fraction)
theta = []; % stage-cut
%L=[];
xrr = [0.15:-0.01:0.0]; % desired reject composition (mole fraction)
xn = [(1-xrr)*100];
%xr2=0.1; 
%xr3=0.05;
%xr4=0.01;
%result = struct(15,8);
j=16;
for i=1:j
     xr=xrr(i);    
    res=crf1ex(t, Pm, alpa, ph, pl, r ,qf, xf, theta, xr);
    result(i)=res;
    thetaa(i)=res.theta*100;
    i=i+1;
end

plot(thetaa,xn);
%axis([20 90 85 100]);
yticks(80:2.5:100)
xlim([20 90]);
%ylim([80 100]);
title('Nitrogen Purity and Stage Cut');
xlabel('Stage Cut (%)');
ylabel('Nitrogen Purity in Retentate');
%res2=crf1ex(t, Pm, alpa, res.ph, pl, r ,qf, res.xr, res.theta, xr2);
%res3=crf1ex(t, Pm, alpa, res2.ph, pl, r ,qf, res2.xr, res2.theta, xr3);
%res4=crf1ex(t, Pm, alpa, res3.ph, pl, r ,qf, res3.xr, res3.theta, xr4);

end
