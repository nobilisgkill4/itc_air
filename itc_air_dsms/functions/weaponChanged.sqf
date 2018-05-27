_plane = vehicle player;
_weapon = currentWeapon _plane;

_profiles = _plane getVariable "profiles";
_profileIndex = (_plane getVariable "profiles") findIf {(_x # 0 # 0) == _weapon};
_profile = _profiles # _profileIndex;

_profile params ["_profileSettings","_releaseSettings","_profileVariables"];
_profileSettings params ["_weapon","_profileName","_ammo","_station","_type"];
_releaseSettings params ["_release_mode","_rip_mode","_rip_qty","_rip_dist"];
_plane setVariable ["profileName", _profileName];
(vehicle player) setVariable ["autolaser",false];
if(_type == "bomb") then {
  _plane setVariable ["rip_mode", _rip_mode];
  _plane setVariable ["rip_qty", _rip_qty];
  _plane setVariable ["rip_dist", _rip_dist];
  [_profileVariables] call itc_air_dsms_fnc_profileSetLegacyVariables;
};
if(_type == "rocket") then {
  _plane setVariable ["rip_mode", _rip_mode];
  _plane setVariable ["rip_qty", _rip_qty];
  _plane setVariable ["rip_dist", 1];
};
(uiNameSpace getVariable "ITC_AIR_MFD_L") setVariable ["profileChanged",true];
(uiNameSpace getVariable "ITC_AIR_MFD_R") setVariable ["profileChanged",true];
