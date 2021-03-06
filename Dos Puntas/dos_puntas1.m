function [A] = dos_puntas1(V,pasos,duracion)
format shortEng
global obj1;
obj1 = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x05E6::0x2601::4046332::0::INSTR', 'Tag', '');
% Create the VISA-USB object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = visa('NI', 'USB0::0x05E6::0x2601::4046332::0::INSTR');
else
    fclose(obj1);
    obj1 = obj1(1)
end

% Connect to instrument object, obj1.
fopen(obj1);
fprintf(obj1,'smua.reset()');
% Communicating with instrument object, obj1.

A=dos_puntas(obj1,V,pasos,duracion);



% Disconnect all objects.
fclose(obj1);

% Clean up all objects.
delete(obj1);



end

