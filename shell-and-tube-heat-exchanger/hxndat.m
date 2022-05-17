% hxndat.m: Shell-and-tube heat exchanger data
% Two values of reference temperatures and physical properties at the two
% reference temperatures for tube and shell fluids
Trt = [504 403]; Trs = [333 293]; % reference temperatures (tube air and shell water)(K)
rhoreft = [0.7 0.876]; rhorefs = [983.2 998.21]; % densities (kg/m^3)
mureft = [0.02687 0.02299]; murefs = [0.4665 1.002]; % viscosities (mNs/m^2)
xkreft = [0.0402 0.03367]; xkrefs = [0.6543 0.5984]; % heat conductivities (W/m/K)
cpreft = [1130 1014]; cprefs = [4184.3 4181.8]; % heat capacities (J/kg/K)
% Heat exchanger geometry
Do = 800; Di = 700; % tube outside diameter (Do,mm) and inside diameter (Di,mm)
Xkw = 385; % heat conductivity of tube wall (W/m/K)
L = 7; % tube length (m)
Ls = 27; % tube sheet thickness (mm)
rf = 0.025; % tube roughness(mm)
Nt = 52; % total number of tubes in tube bundle
Layout = 2; % tube layout (1:triangular, 2:in-line square, 3:rotated square)
Pt = 1.05*Do; % tube pitch (mm)
Nss = 0; % number of pairs of sealing strips
Npass = 1; % number of passes
Rdt = 0.00036; Rds = 0.00018; % fouling resistance (m^2*K/W)
Ds = 7165; % shell inside diameter(mm)
Dotl = 550; % shell outside tube limit(mm)
Dsb = 4.45; % shell-baffle clearance(mm)
Lbin = 165; Lbout = 165; % inlet and outlet baffle spacing(mm)
Lbc = 450; % central baffle spacing(mm)
Lc = 0.25*Ds; % baffle cut(mm)
% Specification of key variables
Ti1 = 504; Ti2 = 403; % inlet and outlet temperatures for tube-side(K)
Ts1 = 293; % Shell-side(hot stream) inlet temperature(K)
Ws = 14.28; % Shell-side(hot stream) mass flow rate(kg/s)
fsT = 2; fsS = 1; % state of tube-side and shell-side fluids(1:liquid, 2:vapor)
ptype = 0; % problem type
Ts2 = 333; % guess outlet temperature of shell-side fluid
Wi = 22.93; % guess tube-side flow rate