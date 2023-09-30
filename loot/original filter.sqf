 _count =  count (configFile >> "CfgWeapons");
for "_x" from 0 to (_count-1) do {
	_weap = ((configFile >> "CfgWeapons") select _x);
	if (isClass _weap) then {
		if (getnumber (_weap >> "scope") == 2) then {
			if (isClass (_weap >> "ItemInfo")) then {
				_infoType = (getnumber (_weap >> "ItemInfo" >> "Type"));
				switch (_infoType) do {
					case 605: {_hats = _hats + [configName _weap];};
					case 801: {_uniforms = _uniforms + [configName _weap];};
					case 701: {_vests = _vests + [configName _weap];};
					case 201: {_optics = _optics + [configName _weap];};
					case 301: {_railAttach = _railAttach + [configName _weap];};
					case 601: {_items = _items + [configName _weap];};
					case 620: {_items = _items + [configName _weap];}; // Toolkit
					case 619: {_items = _items + [configName _weap];}; // Medikit
					case 621: {_items = _items + [configName _weap];}; // UAV terminal
					case 616: {_items = _items + [configName _weap];}; // NVG
					case 401: {_items = _items + [configName _weap];}; // First Aid Kit
				};
			};
			if (!isClass (_weap >> "LinkedItems")) then {
				if (count(getarray (_weap >> "magazines")) !=0 ) then {
					_type = getnumber (_weap >> "type");
					switch (_type) do {
						case 1: {_primaries = _primaries + [configName _weap];};
						case 3: {_secondaries = _secondaries + [configName _weap];};
						case 4: {_launchers = _launchers + [configName _weap];};
					};
				};
			};
			if ( isClass(_weap >> "LinkedItems" >> "LinkedItemsUnder") && !isClass(_weap >> "LinkedItems" >> "LinkedItemsAcc") && !isClass(_weap >> "LinkedItems" >> "LinkedItemsMuzzle") && !isClass(_weap >> "LinkedItems" >> "LinkedItemsOptic")) then {
				if (count(getarray (_weap >> "magazines")) !=0 ) then {
					_primaries = _primaries + [configName _weap];
				};
			};
    };
  };
};