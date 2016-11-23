%function to calculate the quality of the refrigerant, the rate of heat
%removed from the refrigerated space for a mass flow rate of 0.25 kg/s and
%the coefficient of performance
function[x,Qdot,COP] = hw9partc()
clear, clc
%An adiabatic process has no heat transfer
%An adiabatic process without friction is isentropic
%for isentropic compressor, state 2 and state 3 are assumed to be equal

%Assigning the mass flow rate variable
mr = 0.25;

%Assume different temperatures of into the evaporator and out:values
%derived from steam tables
Pin = 632.2;        %saturated liquid at 0.4MPa
Pout = 2748.1;      %saturated vapor enthalpy of 0.4MPa
hfg = 2113.7;        %hfg value at 0.4MPa

%equation of calculating the quality of the refrigerant using entropy
%For an isontrepic process, Sout is the output entropy at the evaporator.
%Since the pressure in in the flash chamber and compressor are 0.4MPa, all
%entropy parameters are equal from the steam table
Sout = 9.340;
Sf = 9.340;
Sfg = 9.340;

x = (Sout - Sf)/Sfg;

%using the first law to obtain the heat removed from the refrigerated space
Qevap = mr*(Pout-Pin);
W =sqrt((mr)^2*(Pout-hfg)^2);

%calculating the heat rejected from the refrigerated space: the evaporator
%heat transfer
Qdot = Qevap + W;

%calculating the coefficient of performance
%obtained from the equation of heat and work Qevap and W
COP = Qevap/W;


%displaying the output of the quality, the rate of heat removed from the     
%refrigerated space and the coeffiecient of performance
X = [ 'The quality of the refrigerant is: ',num2str(x)];
disp(X)

Qdot1 = ['The value of heat removed from the refrigerated space is: ',num2str(Qdot),'kW'];
disp(Qdot1)

cop = ['The coefficient of performance is: ', num2str(COP)];
disp(cop)

end
