@interface NTKVictoryColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorNameForColorValue:(unint64_t)a3;
+ (id)fall2020VictoryColors;
+ (id)gloryEVictoryColors;
+ (id)gloryVictoryColors;
+ (id)graceVictoryColors;
+ (id)pigmentFaceDomain;
+ (id)spring2020VictoryColors;
+ (unint64_t)colorCodeForPigmentEditOption:(id)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentCollectionName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKVictoryColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return 0;
}

- (id)localizedName
{
  v2 = [(NTKVictoryColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 nrDeviceVersion];
  unsigned int v6 = v5;
  if (!(v5 >> 18))
  {
    id v7 = [(NTKEditOption *)self device];
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToFortuneVictoryColors___lock);
    id WeakRetained = objc_loadWeakRetained(&_NTKNewToFortuneVictoryColors___cachedDevice);
    if (WeakRetained)
    {
      v9 = WeakRetained;
      id v10 = objc_loadWeakRetained(&_NTKNewToFortuneVictoryColors___cachedDevice);
      if (v10 == v7)
      {
        uint64_t v11 = [v7 version];
        uint64_t v12 = _NTKNewToFortuneVictoryColors___previousCLKDeviceVersion;

        if (v11 == v12) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    id v13 = objc_storeWeak(&_NTKNewToFortuneVictoryColors___cachedDevice, v7);
    _NTKNewToFortuneVictoryColors___previousCLKDeviceVersion = [v7 version];

    ___NTKNewToFortuneVictoryColors_block_invoke();
LABEL_11:
    os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToFortuneVictoryColors___lock);
    id v14 = (id)_NTKNewToFortuneVictoryColors_victoryFortuneColors;

    char v15 = objc_msgSend(v14, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
    if (v15) {
      goto LABEL_46;
    }
    if (v6 >> 9 > 0x180)
    {
LABEL_19:
      id v25 = [(NTKEditOption *)self device];
      os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGloryVictoryColors___lock);
      id v26 = objc_loadWeakRetained(&_NTKNewToGloryVictoryColors___cachedDevice);
      if (v26)
      {
        v27 = v26;
        id v28 = objc_loadWeakRetained(&_NTKNewToGloryVictoryColors___cachedDevice);
        if (v28 == v25)
        {
          uint64_t v29 = [v25 version];
          uint64_t v30 = _NTKNewToGloryVictoryColors___previousCLKDeviceVersion;

          if (v29 == v30) {
            goto LABEL_24;
          }
        }
        else
        {
        }
      }
      id v31 = objc_storeWeak(&_NTKNewToGloryVictoryColors___cachedDevice, v25);
      _NTKNewToGloryVictoryColors___previousCLKDeviceVersion = [v25 version];

      ___NTKNewToGloryVictoryColors_block_invoke();
LABEL_24:
      os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGloryVictoryColors___lock);
      id v32 = (id)_NTKNewToGloryVictoryColors_victoryGloryColors;

      char v33 = objc_msgSend(v32, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
      if (v33) {
        goto LABEL_46;
      }
LABEL_25:
      id v34 = [(NTKEditOption *)self device];
      os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGloryEVictoryColors___lock);
      id v35 = objc_loadWeakRetained(&_NTKNewToGloryEVictoryColors___cachedDevice);
      if (v35)
      {
        v36 = v35;
        id v37 = objc_loadWeakRetained(&_NTKNewToGloryEVictoryColors___cachedDevice);
        if (v37 == v34)
        {
          uint64_t v38 = [v34 version];
          uint64_t v39 = _NTKNewToGloryEVictoryColors___previousCLKDeviceVersion;

          if (v38 == v39) {
            goto LABEL_30;
          }
        }
        else
        {
        }
      }
      id v40 = objc_storeWeak(&_NTKNewToGloryEVictoryColors___cachedDevice, v34);
      _NTKNewToGloryEVictoryColors___previousCLKDeviceVersion = [v34 version];

      ___NTKNewToGloryEVictoryColors_block_invoke();
LABEL_30:
      os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGloryEVictoryColors___lock);
      id v41 = (id)_NTKNewToGloryEVictoryColors_victoryGloryEColors;

      char v42 = objc_msgSend(v41, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
      if (v42) {
        goto LABEL_46;
      }
      goto LABEL_31;
    }
    id v16 = [(NTKEditOption *)self device];
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToElectricVictoryColors___lock);
    id v17 = objc_loadWeakRetained(&_NTKNewToElectricVictoryColors___cachedDevice);
    if (v17)
    {
      v18 = v17;
      id v19 = objc_loadWeakRetained(&_NTKNewToElectricVictoryColors___cachedDevice);
      if (v19 == v16)
      {
        uint64_t v20 = [v16 version];
        uint64_t v21 = _NTKNewToElectricVictoryColors___previousCLKDeviceVersion;

        if (v20 == v21) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    id v22 = objc_storeWeak(&_NTKNewToElectricVictoryColors___cachedDevice, v16);
    _NTKNewToElectricVictoryColors___previousCLKDeviceVersion = [v16 version];

    ___NTKNewToElectricVictoryColors_block_invoke();
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToElectricVictoryColors___lock);
    id v23 = (id)_NTKNewToElectricVictoryColors_victoryElectricColors;

    char v24 = objc_msgSend(v23, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
    if (v24) {
      goto LABEL_46;
    }
    goto LABEL_19;
  }
  if (HIWORD(v5) <= 4u) {
    goto LABEL_19;
  }
  if (v5 < 0x50200) {
    goto LABEL_25;
  }
  if (v5 >> 17 > 2) {
    goto LABEL_37;
  }
LABEL_31:
  id v43 = [(NTKEditOption *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGraceVictoryColors___lock);
  id v44 = objc_loadWeakRetained(&_NTKNewToGraceVictoryColors___cachedDevice);
  if (v44)
  {
    v45 = v44;
    id v46 = objc_loadWeakRetained(&_NTKNewToGraceVictoryColors___cachedDevice);
    if (v46 == v43)
    {
      uint64_t v47 = [v43 version];
      uint64_t v48 = _NTKNewToGraceVictoryColors___previousCLKDeviceVersion;

      if (v47 == v48) {
        goto LABEL_36;
      }
    }
    else
    {
    }
  }
  id v49 = objc_storeWeak(&_NTKNewToGraceVictoryColors___cachedDevice, v43);
  _NTKNewToGraceVictoryColors___previousCLKDeviceVersion = [v43 version];

  ___NTKNewToGraceVictoryColors_block_invoke();
LABEL_36:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGraceVictoryColors___lock);
  id v50 = (id)_NTKNewToGraceVictoryColors_victoryGraceColors;

  char v51 = objc_msgSend(v50, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if (v51) {
    goto LABEL_46;
  }
LABEL_37:
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  if ([v4 supportsCapability:v52])
  {
  }
  else
  {
    v53 = [(NTKEditOption *)self device];
    v54 = _NTKNewToGraceEVictoryColors(v53);
    char v55 = objc_msgSend(v54, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));

    if (v55) {
      goto LABEL_46;
    }
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) == 0
    && ([v4 isExplorer] & 1) == 0
    && [(NTKValueEditOption *)self _value] == 100)
  {
    goto LABEL_46;
  }
  v56 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  if ([v4 supportsCapability:v56])
  {

    goto LABEL_48;
  }
  v57 = [(NTKEditOption *)self device];
  v58 = _NTKNewToHunterVictoryColors(v57);
  char v59 = objc_msgSend(v58, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));

  if (v59)
  {
LABEL_46:
    char v60 = 0;
    goto LABEL_47;
  }
LABEL_48:
  v62 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  if ([v4 supportsCapability:v62])
  {

    char v60 = 1;
  }
  else
  {
    v63 = [(NTKEditOption *)self device];
    v64 = _NTKNewToHunterEVictoryColors(v63);
    char v65 = objc_msgSend(v64, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));

    char v60 = v65 ^ 1;
  }
LABEL_47:

  return v60;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_969);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_970);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unsigned int v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_970);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_970, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_971 = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__NTKVictoryColorEditOption__orderedValuesForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __53__NTKVictoryColorEditOption__orderedValuesForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_971;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_969);
  id v11 = (id)_orderedValuesForDevice____colors_968;

  return v11;
}

void __53__NTKVictoryColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _orderedValuesRestrictedByDevice:v14];
  id v4 = (void *)_orderedValuesForDevice____colors_968;
  _orderedValuesForDevice____colors_968 = v3;

  uint64_t v5 = [(id)_orderedValuesForDevice____colors_968 arrayByAddingObjectsFromArray:&unk_1F16EA2B8];
  unsigned int v6 = (void *)_orderedValuesForDevice____colors_968;
  _orderedValuesForDevice____colors_968 = v5;

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if (![v14 supportsCapability:v7]) {
    goto LABEL_4;
  }
  char v8 = NTKGizmoOrCompanionAreRussian(v14);

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(id)_orderedValuesForDevice____colors_968 arrayByAddingObjectsFromArray:&unk_1F16EA2D0];
    id v7 = (void *)_orderedValuesForDevice____colors_968;
    _orderedValuesForDevice____colors_968 = v9;
LABEL_4:
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v14) & 1) != 0
    || [v14 isExplorer])
  {
    uint64_t v10 = [(id)_orderedValuesForDevice____colors_968 arrayByAddingObject:&unk_1F16E33D8];
    id v11 = (void *)_orderedValuesForDevice____colors_968;
    _orderedValuesForDevice____colors_968 = v10;
  }
  uint64_t v12 = [(id)_orderedValuesForDevice____colors_968 arrayByAddingObjectsFromArray:&unk_1F16EA2E8];
  id v13 = (void *)_orderedValuesForDevice____colors_968;
  _orderedValuesForDevice____colors_968 = v12;
}

+ (id)fall2020VictoryColors
{
  v2 = [a1 spring2020VictoryColors];
  uint64_t v3 = [v2 arrayByExcludingObjectsInArray:&unk_1F16EA318];
  id v4 = [&unk_1F16EA300 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)spring2020VictoryColors
{
  v2 = [a1 graceVictoryColors];
  uint64_t v3 = [v2 arrayByExcludingObjectsInArray:&unk_1F16EA348];
  id v4 = [&unk_1F16EA330 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)graceVictoryColors
{
  v2 = [a1 gloryEVictoryColors];
  uint64_t v3 = [v2 arrayByExcludingObjectsInArray:&unk_1F16EA378];
  id v4 = [&unk_1F16EA360 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)gloryEVictoryColors
{
  v2 = [a1 gloryVictoryColors];
  uint64_t v3 = [v2 arrayByExcludingObjectsInArray:&unk_1F16EA3A8];
  id v4 = [&unk_1F16EA390 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)gloryVictoryColors
{
  return &unk_1F16EA3C0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  switch(a3)
  {
    case 0uLL:
      id result = @"white";
      break;
    case 1uLL:
      id result = @"green-white";
      break;
    case 2uLL:
      id result = @"green";
      break;
    case 3uLL:
      id result = @"blue-orbit";
      break;
    case 4uLL:
      id result = @"indigo";
      break;
    case 5uLL:
      id result = @"violet-dust";
      break;
    case 6uLL:
      id result = @"light-violet";
      break;
    case 7uLL:
      id result = @"anthracite";
      break;
    case 8uLL:
      id result = @"light-bone";
      break;
    case 9uLL:
      id result = @"solar-red";
      break;
    case 0xAuLL:
      id result = @"total-orange";
      break;
    case 0xBuLL:
      id result = @"cargo-khaki";
      break;
    case 0xCuLL:
      id result = @"barely-rose";
      break;
    case 0xDuLL:
      id result = @"wolf-gray";
      break;
    case 0xEuLL:
      id result = @"light-silver";
      break;
    case 0xFuLL:
      id result = @"particle-beige";
      break;
    case 0x10uLL:
      id result = @"aurora-green";
      break;
    case 0x11uLL:
      id result = @"obsidian-indigo";
      break;
    case 0x12uLL:
      id result = @"terra-blush";
      break;
    case 0x13uLL:
      id result = @"smoky-mauve";
      break;
    case 0x14uLL:
      id result = @"olive-flak";
      break;
    case 0x15uLL:
      id result = @"celestial-teal";
      break;
    case 0x16uLL:
      id result = @"teal-tint";
      break;
    case 0x17uLL:
      id result = @"hyper-grape";
      break;
    case 0x18uLL:
      id result = @"spruce-fog";
      break;
    case 0x19uLL:
      id result = @"desert-sand";
      break;
    case 0x1AuLL:
      id result = @"royal-pulse";
      break;
    case 0x1BuLL:
      id result = @"pink-blast";
      break;
    case 0x1CuLL:
      id result = @"midnight-turquoise";
      break;
    case 0x1DuLL:
      id result = @"lime-blast";
      break;
    case 0x1EuLL:
      id result = @"multicolor-1";
      break;
    case 0x1FuLL:
      id result = @"spruce-aura";
      break;
    case 0x20uLL:
      id result = @"blue-black";
      break;
    case 0x21uLL:
      id result = @"obsidian-mist";
      break;
    case 0x22uLL:
      id result = @"hasta";
      break;
    case 0x23uLL:
      id result = @"chlorine-blue";
      break;
    case 0x24uLL:
      id result = @"ironstone";
      break;
    default:
      if (a3 == 100) {
        id result = @"explorer";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1114 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1114, &__block_literal_global_1116);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1113;
  return v2;
}

void __57__NTKVictoryColorEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[38] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E39F0;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"green";
  v3[1] = @"mint";
  v2[2] = &unk_1F16E3AF8;
  v2[3] = &unk_1F16E39C0;
  v3[2] = @"white";
  v3[3] = @"blue orbit";
  v2[4] = &unk_1F16E3978;
  v2[5] = &unk_1F16E3960;
  v3[4] = @"indigo";
  v3[5] = @"violet dust";
  v2[6] = &unk_1F16E34C8;
  v2[7] = &unk_1F16E3918;
  v3[6] = @"light violet";
  v3[7] = @"anthracite";
  v2[8] = &unk_1F16E3930;
  v2[9] = &unk_1F16E33D8;
  v3[8] = @"light bone";
  v3[9] = @"explorer";
  v2[10] = &unk_1F16E34B0;
  v2[11] = &unk_1F16E3690;
  v3[10] = @"solar red";
  v3[11] = @"total orange";
  v2[12] = &unk_1F16E3AB0;
  v2[13] = &unk_1F16E3AE0;
  v3[12] = @"cargo khaki";
  v3[13] = @"barely rose";
  v2[14] = &unk_1F16E3B70;
  v2[15] = &unk_1F16E3B88;
  v3[14] = @"wolf gray";
  v3[15] = @"light silver";
  v2[16] = &unk_1F16E3BA0;
  v2[17] = &unk_1F16E39D8;
  v3[16] = @"particle beige";
  v3[17] = @"aurora green";
  v2[18] = &unk_1F16E3468;
  v2[19] = &unk_1F16E3600;
  v3[18] = @"obsidian indigo";
  v3[19] = @"terra blush";
  v2[20] = &unk_1F16E3438;
  v2[21] = &unk_1F16E3450;
  v3[20] = @"smoky mauve";
  v3[21] = @"olive flak";
  v2[22] = &unk_1F16E3480;
  v2[23] = &unk_1F16E3A80;
  v3[22] = @"celestial teal";
  v3[23] = @"teal tint";
  v2[24] = &unk_1F16E3BE8;
  v2[25] = &unk_1F16E3CD8;
  v3[24] = @"hyper grape";
  v3[25] = @"spruce fog";
  v2[26] = &unk_1F16E3AC8;
  v2[27] = &unk_1F16E3CC0;
  v3[26] = @"desert sand";
  v3[27] = @"royal pulse";
  v2[28] = &unk_1F16E3BD0;
  v2[29] = &unk_1F16E3A20;
  v3[28] = @"pink blast";
  v3[29] = @"midnight turquoise";
  v2[30] = &unk_1F16E3B40;
  v2[31] = &unk_1F16E3A08;
  v3[30] = @"lime blast";
  v3[31] = @"multicolor 1";
  v2[32] = &unk_1F16E3B58;
  v2[33] = &unk_1F16E3420;
  v3[32] = @"spruce aura";
  v3[33] = @"blue black";
  v2[34] = &unk_1F16E3BB8;
  v2[35] = &unk_1F16E3A38;
  v3[34] = @"obsidian mist";
  v3[35] = @"hasta";
  v2[36] = &unk_1F16E3C00;
  v2[37] = &unk_1F16E3A98;
  v3[36] = @"chlorine-blue";
  v3[37] = @"ironstone";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:38];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1113;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1113 = v0;
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  uint64_t v3 = objc_opt_new();
  return v3;
}

- (id)pigmentCollectionName
{
  return @"victory";
}

- (id)pigmentEditOption
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "colorNameForColorValue:", -[NTKVictoryColorEditOption victoryColor](self, "victoryColor"));
  id v4 = [(NTKVictoryColorEditOption *)self pigmentCollectionName];
  if ([(NTKVictoryColorEditOption *)self victoryColor] == 30)
  {
    uint64_t v5 = +[NTKPigmentEditOption pigmentNamed:@"special.rainbow"];
  }
  else
  {
    uint64_t v5 = [[NTKPigmentEditOption alloc] initWithOptionName:v3 collectionName:v4];
  }
  unsigned int v6 = v5;

  return v6;
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = @"white";
      break;
    case 1uLL:
      unsigned int v6 = [a1 colorNameForColorValue:0];
      id v7 = [a1 colorNameForColorValue:2];
      ntk_duotone(@"victory", (uint64_t)v6, @"victory", v7);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 2uLL:
      id v4 = @"volt";
      break;
    case 3uLL:
      id v4 = @"blueOrbit";
      break;
    case 4uLL:
      id v4 = @"indigo";
      break;
    case 5uLL:
      id v4 = @"violetDust";
      break;
    case 6uLL:
      id v4 = @"lightViolet";
      break;
    case 7uLL:
      id v4 = @"anthracite";
      break;
    case 8uLL:
      id v4 = @"lightBone";
      break;
    case 9uLL:
      id v4 = @"brightCrimson";
      break;
    case 0xAuLL:
      id v4 = @"totalOrange";
      break;
    case 0xBuLL:
      id v4 = @"cargoKhaki";
      break;
    case 0xCuLL:
      id v4 = @"barelyRose";
      break;
    case 0xDuLL:
      id v4 = @"wolfGray";
      break;
    case 0xEuLL:
      id v4 = @"lightSilver";
      break;
    case 0xFuLL:
      id v4 = @"particleBeige";
      break;
    case 0x10uLL:
      id v4 = @"auroraGreen";
      break;
    case 0x11uLL:
      id v4 = @"obsidianIndigo";
      break;
    case 0x12uLL:
      id v4 = @"terraBlush";
      break;
    case 0x13uLL:
      id v4 = @"smokyMauve";
      break;
    case 0x14uLL:
      id v4 = @"oliveFlak";
      break;
    case 0x15uLL:
      id v4 = @"celestialTeal";
      break;
    case 0x16uLL:
      id v4 = @"tealTint";
      break;
    case 0x17uLL:
      id v4 = @"hyperGrape";
      break;
    case 0x18uLL:
      id v4 = @"spruceFog";
      break;
    case 0x19uLL:
      id v4 = @"desertSand";
      break;
    case 0x1AuLL:
      id v4 = @"royalPulse";
      break;
    case 0x1BuLL:
      id v4 = @"pinkBlast";
      break;
    case 0x1CuLL:
      id v4 = @"midnightTurquoise";
      break;
    case 0x1DuLL:
      id v4 = @"limeBlast";
      break;
    case 0x1EuLL:
      id v4 = @"rainbow";
      break;
    case 0x1FuLL:
      id v4 = @"spruceAura";
      break;
    case 0x20uLL:
      id v4 = @"blueBlack";
      break;
    case 0x21uLL:
      id v4 = @"obsidianMist";
      break;
    case 0x22uLL:
      id v4 = @"hasta";
      break;
    case 0x23uLL:
      id v4 = @"chlorineBlue";
      break;
    case 0x24uLL:
      id v4 = @"ironstone";
      break;
    default:
      if (a3 == 100)
      {
        uint64_t v5 = [a1 colorNameForColorValue:0];
        ntk_duotone(@"seasons.spring2015", (uint64_t)v5, @"explorer", @"red");
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v4 = 0;
      }
      break;
  }
  return v4;
}

+ (unint64_t)colorCodeForPigmentEditOption:(id)a3 forDevice:(id)a4
{
  id v4 = [a1 legacyOptionWithPigmentEditOption:a3 forDevice:a4];
  unint64_t v5 = [v4 victoryColor];

  return v5;
}

@end