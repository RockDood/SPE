/**
*  dropBox
*
*  converts fak's into Medkits
*
*  Domain: Client
**/
while {true} do {
  _bulwarkContents = itemCargo bulwarkBox;
  _allFaks = _bulwarkContents select {_x in ["FirstAidKit", "SPE_GER_FirstAidKit", "SPE_US_FirstAidKit"]};

  if (count _allFaks >= 15) then {
    for "_i" from 1 to 15 do {
      _fakIndex = floor (random (count _allFaks));
      _fakToRemove = _allFaks select _fakIndex;
      _bulwarkContents = _bulwarkContents - [_fakToRemove];
      _allFaks deleteAt _fakIndex;
    };
	clearItemCargoGlobal  bulwarkBox;
    bulwarkBox addItemCargoGlobal ["Medikit", 1];
    {
        bulwarkBox addItemCargoGlobal [_x, 1];
    } forEach _bulwarkContents;
    hint "true";
  };
};