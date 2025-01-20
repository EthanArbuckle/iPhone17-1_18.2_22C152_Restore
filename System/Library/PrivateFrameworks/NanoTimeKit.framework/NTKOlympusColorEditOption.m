@interface NTKOlympusColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorNameForColorValue:(unint64_t)a3;
+ (id)colorNameForColorValue:(unint64_t)a3 collectionName:(id *)a4;
+ (id)pigmentFaceDomain;
+ (unint64_t)colorCodeForPigmentEditOption:(id)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKOlympusColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

- (id)localizedName
{
  v2 = [(NTKOlympusColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1230);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1231);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1231);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1231, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1232 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_1229;
    _orderedValuesForDevice____colors_1229 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1232;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1230);
  id v13 = (id)_orderedValuesForDevice____colors_1229;

  return v13;
}

void __53__NTKOlympusColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_1229;
  _orderedValuesForDevice____colors_1229 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    v6 = _EnumValueRange(0x1AuLL, 0x1EuLL);
    id v7 = [&unk_1F16EA3D8 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    id v7 = &unk_1F16EA3D8;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  int v9 = [v3 supportsCapability:v8];

  if (v9)
  {
    id v10 = _EnumValueRange(0x1FuLL, 0x27uLL);
    uint64_t v11 = [v7 arrayByAddingObjectsFromArray:v10];

    id v7 = (void *)v11;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  int v13 = [v3 supportsCapability:v12];

  if (v13)
  {
    v14 = _EnumValueRange(0x28uLL, 0x30uLL);
    uint64_t v15 = [v7 arrayByAddingObjectsFromArray:v14];

    id v7 = (void *)v15;
  }

  return v7;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  if ([v4 supportsCapability:v5])
  {

    goto LABEL_9;
  }
  id v6 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGraceEOlympusColors___lock);
  id WeakRetained = objc_loadWeakRetained(&_NTKNewToGraceEOlympusColors___cachedDevice);
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&_NTKNewToGraceEOlympusColors___cachedDevice);
    if (v9 == v6)
    {
      uint64_t v10 = [v6 version];
      uint64_t v11 = _NTKNewToGraceEOlympusColors___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&_NTKNewToGraceEOlympusColors___cachedDevice, v6);
  _NTKNewToGraceEOlympusColors___previousCLKDeviceVersion = [v6 version];

  ___NTKNewToGraceEOlympusColors_block_invoke();
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGraceEOlympusColors___lock);
  id v13 = (id)_NTKNewToGraceEOlympusColors_olympusGraceEColors;

  char v14 = objc_msgSend(v13, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if (v14) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  if ([v4 supportsCapability:v15])
  {

    goto LABEL_18;
  }
  id v16 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToHunterOlympusColors___lock);
  id v17 = objc_loadWeakRetained(&_NTKNewToHunterOlympusColors___cachedDevice);
  if (v17)
  {
    v18 = v17;
    id v19 = objc_loadWeakRetained(&_NTKNewToHunterOlympusColors___cachedDevice);
    if (v19 == v16)
    {
      uint64_t v20 = [v16 version];
      uint64_t v21 = _NTKNewToHunterOlympusColors___previousCLKDeviceVersion;

      if (v20 == v21) {
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  id v22 = objc_storeWeak(&_NTKNewToHunterOlympusColors___cachedDevice, v16);
  _NTKNewToHunterOlympusColors___previousCLKDeviceVersion = [v16 version];

  ___NTKNewToHunterOlympusColors_block_invoke();
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToHunterOlympusColors___lock);
  id v23 = (id)_NTKNewToHunterOlympusColors_hunterColors;

  char v24 = objc_msgSend(v23, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if ((v24 & 1) == 0)
  {
LABEL_18:
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
    if ([v4 supportsCapability:v26])
    {

      char v25 = 1;
      goto LABEL_26;
    }
    id v27 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToHunterEOlympusColors___lock);
    id v28 = objc_loadWeakRetained(&_NTKNewToHunterEOlympusColors___cachedDevice);
    if (v28)
    {
      v29 = v28;
      id v30 = objc_loadWeakRetained(&_NTKNewToHunterEOlympusColors___cachedDevice);
      if (v30 == v27)
      {
        uint64_t v31 = [v27 version];
        uint64_t v32 = _NTKNewToHunterEOlympusColors___previousCLKDeviceVersion;

        if (v31 == v32)
        {
LABEL_25:
          os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToHunterEOlympusColors___lock);
          id v34 = (id)_NTKNewToHunterEOlympusColors_hunterEColors;

          char v35 = objc_msgSend(v34, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
          char v25 = v35 ^ 1;
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    id v33 = objc_storeWeak(&_NTKNewToHunterEOlympusColors___cachedDevice, v27);
    _NTKNewToHunterEOlympusColors___previousCLKDeviceVersion = [v27 version];

    ___NTKNewToHunterEOlympusColors_block_invoke();
    goto LABEL_25;
  }
LABEL_17:
  char v25 = 0;
LABEL_26:

  return v25;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"color-%lu", a4, a3);
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NTKOlympusColorEditOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_1239 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1239, block);
  }
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleStringDict;
}

void __57__NTKOlympusColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleStringDict;
  _valueToFaceBundleStringDict_valueToFaceBundleStringDict = v2;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_opt_class();
  int v5 = [*(id *)(a1 + 32) device];
  id v6 = [v4 _orderedValuesForDevice:v5];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = NSString;
        id v13 = [v11 stringValue];
        char v14 = [v12 stringWithFormat:@"color %@", v13];
        [(id)_valueToFaceBundleStringDict_valueToFaceBundleStringDict setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

+ (id)pigmentFaceDomain
{
  return @"victoryHybrid";
}

- (id)pigmentEditOption
{
  id v6 = @"victoryHybrid";
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "colorNameForColorValue:collectionName:", -[NTKOlympusColorEditOption color](self, "color"), &v6);
  id v3 = v6;
  id v4 = [[NTKPigmentEditOption alloc] initWithOptionName:v2 collectionName:v3];

  return v4;
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  uint64_t v5 = 0;
  id v3 = [a1 colorNameForColorValue:a3 collectionName:&v5];

  return v3;
}

+ (id)colorNameForColorValue:(unint64_t)a3 collectionName:(id *)a4
{
  switch(a3)
  {
    case 0uLL:
      id v4 = @"anthracite";
      goto LABEL_32;
    case 1uLL:
      id v4 = @"black";
      uint64_t v5 = @"anthracite";
      goto LABEL_34;
    case 2uLL:
      *a4 = @"victory";
      id v6 = @"volt";
      break;
    case 3uLL:
      uint64_t v7 = 2;
      goto LABEL_52;
    case 4uLL:
      uint64_t v8 = 2;
      goto LABEL_54;
    case 5uLL:
      *a4 = @"victory";
      id v6 = @"purePlatinum";
      break;
    case 6uLL:
      uint64_t v7 = 5;
      goto LABEL_52;
    case 7uLL:
      uint64_t v8 = 5;
      goto LABEL_54;
    case 8uLL:
      *a4 = @"victory";
      id v6 = @"totalOrange";
      break;
    case 9uLL:
      uint64_t v7 = 8;
      goto LABEL_52;
    case 0xAuLL:
      uint64_t v8 = 8;
      goto LABEL_54;
    case 0xBuLL:
      *a4 = @"victory";
      id v6 = @"auroraGreen";
      break;
    case 0xCuLL:
      uint64_t v7 = 11;
      goto LABEL_52;
    case 0xDuLL:
      uint64_t v8 = 11;
      goto LABEL_54;
    case 0xEuLL:
      *a4 = @"victory";
      id v6 = @"celestialTeal";
      break;
    case 0xFuLL:
      uint64_t v7 = 14;
      goto LABEL_52;
    case 0x10uLL:
      uint64_t v8 = 14;
      goto LABEL_54;
    case 0x11uLL:
      *a4 = @"victory";
      id v6 = @"royalPulse";
      break;
    case 0x12uLL:
      uint64_t v7 = 17;
      goto LABEL_52;
    case 0x13uLL:
      uint64_t v8 = 17;
      goto LABEL_54;
    case 0x14uLL:
      *a4 = @"victory";
      id v6 = @"pinkBlast";
      break;
    case 0x15uLL:
      uint64_t v7 = 20;
      goto LABEL_52;
    case 0x16uLL:
      uint64_t v8 = 20;
      goto LABEL_54;
    case 0x17uLL:
      *a4 = @"victory";
      id v6 = @"desertSand";
      break;
    case 0x18uLL:
      uint64_t v7 = 23;
      goto LABEL_52;
    case 0x19uLL:
      uint64_t v8 = 23;
      goto LABEL_54;
    case 0x1AuLL:
      *a4 = @"victory";
      id v6 = @"midnightTurquoise";
      break;
    case 0x1BuLL:
      uint64_t v7 = 26;
      goto LABEL_52;
    case 0x1CuLL:
      uint64_t v8 = 26;
      goto LABEL_54;
    case 0x1DuLL:
      id v4 = @"limeBlast";
LABEL_32:
      uint64_t v5 = @"black";
      goto LABEL_34;
    case 0x1EuLL:
      id v4 = @"black";
      uint64_t v5 = @"limeBlast";
LABEL_34:
      ntk_duotone(@"victory", (uint64_t)v4, @"victory", v5);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1FuLL:
      *a4 = @"victory";
      id v6 = @"spruceAura";
      break;
    case 0x20uLL:
      uint64_t v7 = 31;
      goto LABEL_52;
    case 0x21uLL:
      uint64_t v8 = 31;
      goto LABEL_54;
    case 0x22uLL:
      *a4 = @"victory";
      id v6 = @"blueBlack";
      break;
    case 0x23uLL:
      uint64_t v7 = 34;
      goto LABEL_52;
    case 0x24uLL:
      uint64_t v8 = 34;
      goto LABEL_54;
    case 0x25uLL:
      *a4 = @"victory";
      id v6 = @"obsidianMist";
      break;
    case 0x26uLL:
      uint64_t v7 = 37;
      goto LABEL_52;
    case 0x27uLL:
      uint64_t v8 = 37;
      goto LABEL_54;
    case 0x28uLL:
      *a4 = @"victory";
      id v6 = @"hasta";
      break;
    case 0x29uLL:
      uint64_t v7 = 40;
      goto LABEL_52;
    case 0x2AuLL:
      uint64_t v8 = 40;
      goto LABEL_54;
    case 0x2BuLL:
      *a4 = @"victory";
      id v6 = @"chlorineBlue";
      break;
    case 0x2CuLL:
      uint64_t v7 = 43;
      goto LABEL_52;
    case 0x2DuLL:
      uint64_t v8 = 43;
      goto LABEL_54;
    case 0x2EuLL:
      *a4 = @"victory";
      id v6 = @"ironstone";
      break;
    case 0x2FuLL:
      uint64_t v7 = 46;
LABEL_52:
      objc_msgSend(a1, "colorNameForColorValue:", v7, a4);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = @"black";
      uint64_t v11 = v9;
      goto LABEL_55;
    case 0x30uLL:
      uint64_t v8 = 46;
LABEL_54:
      objc_msgSend(a1, "colorNameForColorValue:", v8, a4);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = @"black";
      uint64_t v10 = v9;
LABEL_55:
      ntk_duotone(@"victory", (uint64_t)v11, @"victory", v10);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (unint64_t)colorCodeForPigmentEditOption:(id)a3 forDevice:(id)a4
{
  id v4 = [a1 legacyOptionWithPigmentEditOption:a3 forDevice:a4];
  unint64_t v5 = [v4 color];

  return v5;
}

@end