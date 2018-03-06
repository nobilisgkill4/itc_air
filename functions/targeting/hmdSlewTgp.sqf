if(!((vehicle player) isKindOf "Air")) exitWith {};
_capableHMD = (configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "itc_air" >> "hmd")  call BIS_fnc_getCfgData;
_capableTGP = (configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "itc_air" >> "tgp")  call BIS_fnc_getCfgData;
if(isNil {_capableHMD} || isNil {_capableTGP}) exitWith {};

_plane = vehicle player;
_targetPos = (ATLtoASL (screenToWorld [0.5,0.5]));
_plane setPilotCameraTarget _targetPos;