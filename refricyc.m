%function calculates coefficient of performance and the cooling capacity at
%any given variables of isentropic efficiency and mass flow rates at states 1 and 3 
function[cop,ccap,st] = refricyc(st1,st3,efficom,mr)
clear, clc
u = cmu.units;
%states variable groups at state1 and at state3
%assume state1 as a saturated vapor while state3 is a saturated liquid
st = [st1',st3']

%Assume input power to the compressor as P
%p = 70;

%isentropic energy efficiency of the compressor is calculated as the ratio
%of the product of actual mass-flow-rate and the change in isentropic
%enthalpy in the compressor to the input power on the shaft of the compssor
%equation of calculating the coefficient of performance n = mass flow
%rate*change in isentropic enthalpy/P

%Actual coefficient of performance is calculated as the ratio of the
%capacity of the compressor and the change in enthalpy in the evaporator to
%the input power on the shaft of the compressor, CoP =mass flow rate*change
%in evaporator enthalpy/P
%Coefficient of entropy is obtained by the product of the isentropic  efficiency of the
%thermodynamic cycle and the isentropic efficiency of the compressor

%Coefficient of entropy equation
cop = efficom.^2;

%The equation of the rate of heat removal is obtained from the equation of
%multiplication of the mass flow rate and the change in enthalpy 

%let evaporator pressure be Pe
double Pevap = 3*u.Pevaporator;

%let condenser pressure be Pcond
double Pcond = 3*u.Pcondenser;
Peffective = Pevap - Pcond;
%Assume the values have been 
ccap = mr*Peffective';
%refricyc = [cop,ccap];
