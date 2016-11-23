%A function to determine the lowest temperature that can be obtained, the
%coefficient of performance and the mass flow rate of air for a
%refrigeration rate of 12kW
%The lowest temperature before calculating Tmin is -15 which is equivalent
%to 258K
function[Tmin,COP,mdot] = hw9partd()
clear, clc

%Obtaining the lowest temperature for this cycle: Let this be Tlowest
%calculating the exit temperature first

T1 = 258;        %input temperature to turbine the in Kelvin


%pressure ratio, Rp
Rp = 4;

%Calculate the ratio of specific heats, Rh
%Let Cv be 1.4 and Cp 1.005
Cv = 1.4;
Cp = 1.005;

Rh = Cv/Cp;

%Calculating the ideal temperature T3 using the pressure ration and the
%constant specific heats
T3 = (T1*Rp)^(1-Rh);

%Calculating overall isentropic efficiency
nt = 0.8;        %isentropic efficiency of the turbine
nc = 0.75;       %isentropic efficiency of the compressor

ne = nt*nc;


%using the isentropic efficiency to calculate the exit temperature,T2 and
%determine the lowest temperature Tmin

T2 = (ne*(T3-T1)) + T1;

if(T2 > T1)
    Tmin = T1;
else
    Tmin = T2;
end

%mass flow is determined using the refrigerating capacity, in this case
%12kW

%From steam tables, at -7 degrees, h1 = hf = 1437.6, s1 = sf = 5.419,
%corresponding enthalpy is 1610.5, therefore ideal enthalpy

Eideal = 1610.5 - 1437.6; %ideal change in enthalpy

Eactual = Eideal/nc ;      %actual enthalpy change

h2 = 1437.6 + Eactual;     %Actual value of enthalpy with compressor efficiency factor

%Calculating the power input based on turbine efficiency


Pinput = 12 * nt;

%Obtaining the mass flow ratio

mdot = Pinput/(h2-1437.6);

%Calculating the heat input to the evaporator, obtain h4 value from steam
%table

Hinput = mdot*(1437.6 - 323.1);

%Calculating the coefficient of performance of the refrigerator

COP = Hinput/Pinput;


Tminimum = [ 'The lowest temperature that can be obtained by this cycle is: ',num2str(Tmin),' Kelvin'];
disp(Tminimum)

cop = [ 'The coefficient of performance of this cycle is: ',num2str(COP)];
disp(cop)

mass_flow_rate = ['The mass flow rate of air in this cycle is: ',num2str(mdot),' Kg/s'];
disp(mass_flow_rate)










