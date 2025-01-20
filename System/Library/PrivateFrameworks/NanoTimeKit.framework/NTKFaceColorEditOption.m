@interface NTKFaceColorEditOption
+ (BOOL)value:(int64_t)a3 existsInDevice:(id)a4;
+ (id)__allOrderedColors;
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)__valueToFaceBundleStringDict;
+ (id)_optionByValidatingValueOfInvalidOption:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_thirdPartyValues;
+ (id)pigmentFaceDomain;
+ (id)standardColorEditOptionsForDevice:(id)a3;
+ (id)standardColorValuesForDevice:(id)a3;
+ (id)standardColorsWithColorClass:(Class)a3 forDevice:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKFaceColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return 0;
}

+ (id)_optionByValidatingValueOfInvalidOption:(id)a3
{
  id v3 = a3;
  v4 = [v3 device];
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4))
  {
    uint64_t v5 = [v3 _value];
    uint64_t v6 = [v4 collectionType];
    uint64_t v7 = [v4 materialType];
    v8 = objc_opt_class();
    uint64_t v9 = 1000;
    switch(v5)
    {
      case 'd':
        break;
      case 'e':
        uint64_t v10 = 1001;
        if (v7 != 8) {
          uint64_t v10 = 1002;
        }
        if (v7 == 10) {
          uint64_t v9 = 1000;
        }
        else {
          uint64_t v9 = v10;
        }
        break;
      case 'f':
        if (v6 == 5) {
          goto LABEL_13;
        }
        uint64_t v9 = 54;
        break;
      case 'g':
        if (v6 == 6) {
          goto LABEL_13;
        }
        uint64_t v9 = 39;
        break;
      default:
        if (v5 != 53) {
          goto LABEL_13;
        }
        break;
    }
    v11 = [v8 optionWithFaceColor:v9 forDevice:v4];
  }
  else
  {
LABEL_13:
    v11 = 0;
  }

  return v11;
}

+ (id)_thirdPartyValues
{
  return &unk_1F16EA1C8;
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesRestrictedByDevice____cachedDevice, v3);
    _orderedValuesRestrictedByDevice____previousCLKDeviceVersion = [v3 version];

    __59__NTKFaceColorEditOption__orderedValuesRestrictedByDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesRestrictedByDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock);
  id v11 = (id)_orderedValuesRestrictedByDevice__hardwareSpecificValues;

  return v11;
}

void __59__NTKFaceColorEditOption__orderedValuesRestrictedByDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  v4 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues;
  _orderedValuesRestrictedByDevice__hardwareSpecificValues = v3;

  uint64_t v5 = [v2 collectionType];
  id v6 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "_orderedValuesRestrictedByDevice collectionType:%ld", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = &unk_1F16E33A8;
  switch(v5)
  {
    case 3:
      if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v2) & 1) == 0)
      {
        uint64_t v7 = &unk_1F16E33D8;
        goto LABEL_10;
      }
      break;
    case 4:
      if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v2) & 1) == 0)
      {
        uint64_t v7 = &unk_1F16E33F0;
        goto LABEL_10;
      }
      break;
    case 5:
      goto LABEL_10;
    case 8:
      if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v2) & 1) == 0)
      {
        uint64_t v7 = &unk_1F16E3408;
LABEL_10:
        [(id)_orderedValuesRestrictedByDevice__hardwareSpecificValues addObject:v7];
      }
      break;
    default:
      break;
  }
}

+ (id)standardColorEditOptionsForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&standardColorEditOptionsForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&standardColorEditOptionsForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&standardColorEditOptionsForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&standardColorEditOptionsForDevice____cachedDevice, v4);
    standardColorEditOptionsForDevice____previousCLKDeviceVersion = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__NTKFaceColorEditOption_standardColorEditOptionsForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __60__NTKFaceColorEditOption_standardColorEditOptionsForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = standardColorEditOptionsForDevice____previousCLKDeviceVersion;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&standardColorEditOptionsForDevice____lock);
  id v11 = (id)standardColorEditOptionsForDevice__colors;

  return v11;
}

void __60__NTKFaceColorEditOption_standardColorEditOptionsForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) standardColorValuesForDevice:v3];
  uint64_t v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(a1 + 32), "optionWithFaceColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "integerValue", (void)v14), v3);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v5 copy];
  v13 = (void *)standardColorEditOptionsForDevice__colors;
  standardColorEditOptionsForDevice__colors = v12;
}

+ (id)standardColorValuesForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 nrDeviceVersion] >= 0x50000)
  {
    if ([v3 nrDeviceVersion] >> 9 >= 0x281)
    {
      if ([v3 nrDeviceVersion] >= 0x60000)
      {
        uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
        int v6 = [v3 supportsCapability:v5];

        if (v6)
        {
          uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
          int v8 = [v3 supportsCapability:v7];

          if (v8)
          {
            uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
            int v10 = [v3 supportsCapability:v9];

            id v4 = &unk_1F16EA258;
            if (v10) {
              id v4 = &unk_1F16EA270;
            }
          }
          else
          {
            id v4 = &unk_1F16EA240;
          }
        }
        else
        {
          id v4 = &unk_1F16EA228;
        }
      }
      else
      {
        id v4 = &unk_1F16EA210;
      }
    }
    else
    {
      id v4 = &unk_1F16EA1F8;
    }
  }
  else
  {
    id v4 = &unk_1F16EA1E0;
  }
  id v11 = (void *)standardColorValuesForDevice__orderedColors;
  standardColorValuesForDevice__orderedColors = (uint64_t)v4;

  id v12 = (id)standardColorValuesForDevice__orderedColors;
  return v12;
}

+ (id)standardColorsWithColorClass:(Class)a3 forDevice:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&standardColorsWithColorClass_forDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&standardColorsWithColorClass_forDevice____cachedDevice);
  if (WeakRetained)
  {
    int v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&standardColorsWithColorClass_forDevice____cachedDevice);
    if (v9 == v6)
    {
      uint64_t v10 = [v6 version];
      uint64_t v11 = standardColorsWithColorClass_forDevice____previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&standardColorsWithColorClass_forDevice____cachedDevice, v6);
  standardColorsWithColorClass_forDevice____previousCLKDeviceVersion = [v6 version];

  uint64_t v13 = objc_opt_new();
  long long v14 = (void *)standardColorsWithColorClass_forDevice__standardColorsCache;
  standardColorsWithColorClass_forDevice__standardColorsCache = v13;

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&standardColorsWithColorClass_forDevice____lock);
  id v15 = a1;
  objc_sync_enter(v15);
  long long v16 = NSStringFromClass(a3);
  long long v17 = [(id)standardColorsWithColorClass_forDevice__standardColorsCache objectForKey:v16];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(objc_class *)a3 standardColorEditOptionsForDevice:v6];
    [(id)standardColorsWithColorClass_forDevice__standardColorsCache setObject:v19 forKey:v16];
  }

  objc_sync_exit(v15);
  return v19;
}

+ (BOOL)value:(int64_t)a3 existsInDevice:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 nrDeviceVersion];
  unsigned int v7 = v6;
  if (!(v6 >> 18))
  {
    int v8 = NTKNewToFortuneColors();
    char v9 = [v8 containsIndex:a3];

    if (v9) {
      goto LABEL_26;
    }
    if (v7 >> 9 <= 0x180)
    {
      uint64_t v10 = NTKNewToElectricColors();
      char v11 = [v10 containsIndex:a3];

      if (v11) {
        goto LABEL_26;
      }
    }
LABEL_7:
    id v12 = NTKNewToEmperorColors();
    char v13 = [v12 containsIndex:a3];

    if (v13) {
      goto LABEL_26;
    }
    goto LABEL_10;
  }
  if (v6 >> 8 <= 0x402) {
    goto LABEL_7;
  }
  if (HIWORD(v6) <= 4u)
  {
LABEL_10:
    long long v14 = NTKNewToGloryColors();
    char v15 = [v14 containsIndex:a3];

    if (v15) {
      goto LABEL_26;
    }
    goto LABEL_13;
  }
  if (v6 >> 9 > 0x280)
  {
    if (v6 >> 17 > 2) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_13:
  long long v16 = NTKNewToGloryEColors();
  char v17 = [v16 containsIndex:a3];

  if (v17) {
    goto LABEL_26;
  }
LABEL_16:
  v18 = NTKNewToGraceColors();
  char v19 = [v18 containsIndex:a3];

  if (v19) {
    goto LABEL_26;
  }
LABEL_17:
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  if ([v5 supportsCapability:v20])
  {
  }
  else
  {
    v21 = NTKNewToGraceEColors();
    char v22 = [v21 containsIndex:a3];

    if (v22) {
      goto LABEL_26;
    }
  }
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  if ([v5 supportsCapability:v23])
  {
  }
  else
  {
    v24 = NTKNewToHunterColors();
    char v25 = [v24 containsIndex:a3];

    if (v25) {
      goto LABEL_26;
    }
  }
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  if ([v5 supportsCapability:v26])
  {

    goto LABEL_28;
  }
  v27 = NTKNewToHunterEColors();
  char v28 = [v27 containsIndex:a3];

  if (v28)
  {
LABEL_26:
    char v29 = 0;
    goto LABEL_27;
  }
LABEL_28:
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v5))
  {
    char v29 = 1;
  }
  else
  {
    v31 = NTKDistinctSportPlusAndEditionColors();
    char v32 = [v31 containsIndex:a3];

    char v29 = v32 ^ 1;
  }
LABEL_27:

  return v29;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "value:existsInDevice:", -[NTKValueEditOption _value](self, "_value"), v4);

  return (char)self;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_0);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unsigned int v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_0);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_0, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_0 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    id v12 = (void *)_orderedValuesForDevice____colors;
    _orderedValuesForDevice____colors = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_0;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_0);
  id v13 = (id)_orderedValuesForDevice____colors;

  return v13;
}

void __50__NTKFaceColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  id v3 = (void *)_orderedValuesForDevice____colors;
  _orderedValuesForDevice____colors = v2;
}

+ (id)__allOrderedColors
{
  uint64_t v2 = (void *)[&unk_1F16EA288 mutableCopy];
  return v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "__allOrderedColors");
  unsigned int v6 = [(id)objc_opt_class() _orderedValuesRestrictedByDevice:v4];
  id v7 = [v6 reverseObjectEnumerator];
  uint64_t v8 = [v7 allObjects];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        [v5 insertObject:*(void *)(*((void *)&v24 + 1) + 8 * i) atIndex:0];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  long long v14 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __51__NTKFaceColorEditOption___orderedValuesForDevice___block_invoke;
  v21 = &unk_1E62C7DC0;
  id v22 = v4;
  id v23 = a1;
  id v15 = v4;
  long long v16 = [v14 predicateWithBlock:&v18];
  objc_msgSend(v5, "filterUsingPredicate:", v16, v18, v19, v20, v21);

  return v5;
}

uint64_t __51__NTKFaceColorEditOption___orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [a2 integerValue];
  uint64_t v5 = *(void *)(a1 + 32);
  return [v3 value:v4 existsInDevice:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKFaceColorEditOption;
  if ([(NTKValueEditOption *)&v15 isEqual:v4])
  {
    uint64_t v5 = objc_opt_class();
    unsigned int v6 = [(NTKEditOption *)self device];
    id v7 = [v5 _orderedValuesRestrictedByDevice:v6];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKValueEditOption _value](self, "_value"));
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      uint64_t v10 = [(NTKEditOption *)self device];
      uint64_t v11 = [v10 materialType];
      uint64_t v12 = [v4 device];
      BOOL v13 = v11 == [v12 materialType];
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  unsigned int v6 = v5;
  id v7 = 0;
  if ((uint64_t)a3 > 999)
  {
    uint64_t v8 = @"gold-generic-2";
    int v9 = @"gold-generic-3";
    if (a3 != 1002) {
      int v9 = 0;
    }
    if (a3 != 1001) {
      uint64_t v8 = v9;
    }
    if (a3 == 1000) {
      id v7 = @"gold-generic-1";
    }
    else {
      id v7 = v8;
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        id v7 = @"pink";
        break;
      case 1uLL:
        id v7 = @"purple";
        break;
      case 2uLL:
        id v7 = @"blue";
        break;
      case 3uLL:
        id v7 = @"green";
        break;
      case 4uLL:
        id v7 = @"yellow";
        break;
      case 5uLL:
        id v7 = @"orange";
        break;
      case 6uLL:
        id v7 = @"red";
        break;
      case 7uLL:
        id v7 = @"white";
        break;
      case 8uLL:
        id v7 = @"dark-orange";
        break;
      case 9uLL:
        id v7 = @"turquoise";
        break;
      case 0xAuLL:
        id v7 = @"midnight-blue";
        break;
      case 0xBuLL:
        id v7 = @"lavender";
        break;
      case 0xCuLL:
        id v7 = @"vintage-rose";
        break;
      case 0xDuLL:
        id v7 = @"walnut";
        break;
      case 0xEuLL:
        id v7 = @"stone";
        break;
      case 0xFuLL:
        id v7 = @"antique-white";
        break;
      case 0x10uLL:
        id v7 = @"light-blue";
        break;
      case 0x11uLL:
        id v7 = @"mint";
        break;
      case 0x12uLL:
        id v7 = @"lilac";
        break;
      case 0x13uLL:
        id v7 = @"royal-blue";
        break;
      case 0x14uLL:
        id v7 = @"light-pink";
        break;
      case 0x15uLL:
        id v7 = @"apricot";
        break;
      case 0x16uLL:
        id v7 = @"ocean-blue";
        break;
      case 0x17uLL:
        id v7 = @"cocoa";
        break;
      case 0x18uLL:
        id v7 = @"ice-white";
        break;
      case 0x19uLL:
        id v7 = @"pink-sand";
        break;
      case 0x1AuLL:
        id v7 = @"gray";
        break;
      case 0x1BuLL:
        id v7 = @"pebble";
        break;
      case 0x1CuLL:
        id v7 = @"azure";
        break;
      case 0x1DuLL:
        id v7 = @"camellia";
        break;
      case 0x1EuLL:
        id v7 = @"mist-blue";
        break;
      case 0x1FuLL:
        id v7 = @"flamingo";
        break;
      case 0x20uLL:
        id v7 = @"pollen";
        break;
      case 0x21uLL:
        id v7 = @"soft-white";
        break;
      case 0x22uLL:
        id v7 = @"blue-cobalt";
        break;
      case 0x23uLL:
        id v7 = @"dark-olive";
        break;
      case 0x24uLL:
        id v7 = @"violet";
        break;
      case 0x25uLL:
        id v7 = @"rose-red";
        break;
      case 0x27uLL:
        id v7 = @"flash";
        break;
      case 0x28uLL:
        id v7 = @"dark-teal";
        break;
      case 0x29uLL:
        id v7 = @"electric-pink";
        break;
      case 0x2AuLL:
        id v7 = @"peach";
        break;
      case 0x2BuLL:
        id v7 = @"denim-blue";
        break;
      case 0x2CuLL:
        id v7 = @"flash-light";
        break;
      case 0x2DuLL:
        id v7 = @"nectarine";
        break;
      case 0x2EuLL:
        id v7 = @"mellow-yellow";
        break;
      case 0x2FuLL:
        id v7 = @"storm-gray";
        break;
      case 0x30uLL:
        id v7 = @"pacific-green";
        break;
      case 0x31uLL:
        id v7 = @"blue-horizon";
        break;
      case 0x32uLL:
        id v7 = @"indigo";
        break;
      case 0x33uLL:
        id v7 = @"lavender-gray";
        break;
      case 0x34uLL:
        id v7 = @"hibiscus";
        break;
      case 0x35uLL:
        id v7 = @"blush-gold-steel";
        break;
      case 0x36uLL:
        id v7 = @"papaya";
        break;
      case 0x37uLL:
        id v7 = @"canary-yellow";
        break;
      case 0x38uLL:
        id v7 = @"spearmint";
        break;
      case 0x39uLL:
        id v7 = @"cerulean";
        break;
      case 0x3AuLL:
        id v7 = @"delft-blue";
        break;
      case 0x3BuLL:
        id v7 = @"dragon-fruit";
        break;
      case 0x3CuLL:
        id v7 = @"pine-green";
        break;
      case 0x3DuLL:
        id v7 = @"lemon-cream";
        break;
      case 0x3EuLL:
        id v7 = @"alaskan-blue";
        break;
      case 0x3FuLL:
        id v7 = @"pomegranate";
        break;
      case 0x40uLL:
        id v7 = @"khaki";
        break;
      case 0x41uLL:
        id v7 = @"beryl";
        break;
      case 0x42uLL:
        id v7 = @"camel";
        break;
      case 0x43uLL:
        id v7 = @"sea-foam";
        break;
      case 0x44uLL:
        id v7 = @"surf-blue";
        break;
      case 0x45uLL:
        id v7 = @"cactus";
        break;
      case 0x46uLL:
        id v7 = @"linen-blue";
        break;
      case 0x47uLL:
        id v7 = @"grapefruit";
        break;
      case 0x48uLL:
        id v7 = @"neon-pink";
        break;
      case 0x49uLL:
        id v7 = @"coastal-gray";
        break;
      case 0x4AuLL:
        id v7 = @"PinkCitrus";
        break;
      case 0x4BuLL:
        id v7 = @"DeepNavy";
        break;
      case 0x4CuLL:
        id v7 = @"CyprusGreen";
        break;
      case 0x4DuLL:
        id v7 = @"Cream";
        break;
      case 0x4EuLL:
        id v7 = @"Kumquat";
        break;
      case 0x4FuLL:
        id v7 = @"NorthernBlue";
        break;
      case 0x50uLL:
        id v7 = @"Plum";
        break;
      case 0x51uLL:
        id v7 = @"ElectricOrange";
        break;
      case 0x52uLL:
        id v7 = @"Sunflower";
        break;
      case 0x53uLL:
        id v7 = @"Pistachio";
        break;
      case 0x54uLL:
        id v7 = @"CloudBlue";
        break;
      case 0x55uLL:
        id v7 = @"Abyss";
        break;
      case 0x56uLL:
        id v7 = @"SeaSalt";
        break;
      case 0x57uLL:
        id v7 = @"Olive";
        break;
      case 0x58uLL:
        id v7 = @"MallardGreen";
        break;
      case 0x64uLL:
        uint64_t v10 = [v5 materialType];
        uint64_t v11 = @"edition";
        if (v10 == 6) {
          uint64_t v11 = @"edition rose gold";
        }
        if (v10 == 5) {
          id v7 = @"edition gold";
        }
        else {
          id v7 = v11;
        }
        break;
      case 0x65uLL:
        uint64_t v12 = [v5 materialType];
        if ((unint64_t)(v12 - 7) >= 4) {
          id v7 = @"sport+";
        }
        else {
          id v7 = off_1E62C7E00[v12 - 7];
        }
        break;
      case 0x66uLL:
        id v7 = @"zeus";
        break;
      case 0x67uLL:
        id v7 = @"victory";
        break;
      case 0x68uLL:
        id v7 = @"explorer";
        break;
      case 0x69uLL:
        id v7 = @"whistler-black";
        break;
      case 0xC8uLL:
        id v7 = @"multi";
        break;
      default:
        break;
    }
  }

  return v7;
}

- (id)localizedName
{
  uint64_t v2 = [(NTKFaceColorEditOption *)self pigmentEditOption];
  id v3 = [v2 localizedName];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  return +[NTKFaceColorEditOption __valueToFaceBundleStringDict];
}

+ (id)__valueToFaceBundleStringDict
{
  if (__valueToFaceBundleStringDict_onceToken != -1) {
    dispatch_once(&__valueToFaceBundleStringDict_onceToken, &__block_literal_global_753);
  }
  uint64_t v2 = (void *)__valueToFaceBundleStringDict_valueToFaceBundleString;
  return v2;
}

void __55__NTKFaceColorEditOption___valueToFaceBundleStringDict__block_invoke()
{
  v3[100] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"pink";
  v3[1] = @"purple";
  v2[2] = &unk_1F16E39F0;
  v2[3] = &unk_1F16E39C0;
  v3[2] = @"blue";
  v3[3] = @"green";
  v2[4] = &unk_1F16E3978;
  v2[5] = &unk_1F16E3960;
  v3[4] = @"yellow";
  v3[5] = @"orange";
  v2[6] = &unk_1F16E34C8;
  v2[7] = &unk_1F16E3918;
  v3[6] = @"red";
  v3[7] = @"white";
  v2[8] = &unk_1F16E33D8;
  v2[9] = &unk_1F16E33F0;
  v3[8] = @"rose gold";
  v3[9] = @"rose gold sport";
  v2[10] = &unk_1F16E3C18;
  v2[11] = &unk_1F16E3C30;
  v3[10] = @"gold generic 1";
  v3[11] = @"gold generic 2";
  v2[12] = &unk_1F16E3C48;
  v2[13] = &unk_1F16E33A8;
  v3[12] = @"gold generic 3";
  v3[13] = @"Hermès";
  v2[14] = &unk_1F16E3C60;
  v2[15] = &unk_1F16E3C78;
  v3[14] = @"siri";
  v3[15] = @"siri grey";
  v2[16] = &unk_1F16E33C0;
  v2[17] = &unk_1F16E3C90;
  v3[16] = @"victory";
  v3[17] = @"explorer";
  v2[18] = &unk_1F16E3CA8;
  v2[19] = &unk_1F16E3930;
  v3[18] = @"multicolor";
  v3[19] = @"dark orange";
  v2[20] = &unk_1F16E34B0;
  v2[21] = &unk_1F16E3690;
  v3[20] = @"turquoise";
  v3[21] = @"midnight blue";
  v2[22] = &unk_1F16E3AB0;
  v2[23] = &unk_1F16E3AE0;
  v3[22] = @"lavender";
  v3[23] = @"vintage rose";
  v2[24] = &unk_1F16E3B70;
  v2[25] = &unk_1F16E3B88;
  v3[24] = @"walnut";
  v3[25] = @"stone";
  v2[26] = &unk_1F16E3BA0;
  v2[27] = &unk_1F16E39D8;
  v3[26] = @"antique white";
  v3[27] = @"light blue";
  v2[28] = &unk_1F16E3CC0;
  v2[29] = &unk_1F16E3468;
  v3[28] = @"gray";
  v3[29] = @"mint";
  v2[30] = &unk_1F16E3600;
  v2[31] = &unk_1F16E3438;
  v3[30] = @"lilac";
  v3[31] = @"royal blue";
  v2[32] = &unk_1F16E3450;
  v2[33] = &unk_1F16E3480;
  v3[32] = @"light pink";
  v3[33] = @"apricot";
  v2[34] = &unk_1F16E3A80;
  v2[35] = &unk_1F16E3BE8;
  v3[34] = @"ocean blue";
  v3[35] = @"cocoa";
  v2[36] = &unk_1F16E3CD8;
  v2[37] = &unk_1F16E3AC8;
  v3[36] = @"ice white";
  v3[37] = @"pink sand";
  v2[38] = &unk_1F16E3BD0;
  v2[39] = &unk_1F16E3A20;
  v3[38] = @"pebble";
  v3[39] = @"azure";
  v2[40] = &unk_1F16E3B40;
  v2[41] = &unk_1F16E3A08;
  v3[40] = @"camelia";
  v3[41] = @"mist blue";
  v2[42] = &unk_1F16E3B58;
  v2[43] = &unk_1F16E3420;
  v3[42] = @"flamingo";
  v3[43] = @"pollen";
  v2[44] = &unk_1F16E34E0;
  v2[45] = &unk_1F16E3558;
  v3[44] = @"nectarine";
  v3[45] = @"mellow yellow";
  v2[46] = &unk_1F16E34F8;
  v2[47] = &unk_1F16E3570;
  v3[46] = @"storm gray";
  v3[47] = @"pacific green";
  v2[48] = &unk_1F16E3510;
  v2[49] = &unk_1F16E3528;
  v3[48] = @"blue horizon";
  v3[49] = @"indigo";
  v2[50] = &unk_1F16E3540;
  v2[51] = &unk_1F16E3588;
  v3[50] = @"lavender gray";
  v3[51] = @"hibiscus";
  v2[52] = &unk_1F16E3408;
  v2[53] = &unk_1F16E3BB8;
  v3[52] = @"blush gold steel";
  v3[53] = @"soft white";
  v2[54] = &unk_1F16E3A38;
  v2[55] = &unk_1F16E3C00;
  v3[54] = @"blue cobalt";
  v3[55] = @"dark olive";
  v2[56] = &unk_1F16E3A98;
  v2[57] = &unk_1F16E3B28;
  v3[56] = @"violet";
  v3[57] = @"rose red";
  v2[58] = &unk_1F16E39A8;
  v2[59] = &unk_1F16E3A50;
  v3[58] = @"flash";
  v3[59] = @"dark teal";
  v2[60] = &unk_1F16E3B10;
  v2[61] = &unk_1F16E3948;
  v3[60] = @"electric pink";
  v3[61] = @"peach";
  v2[62] = &unk_1F16E3A68;
  v2[63] = &unk_1F16E3990;
  v3[62] = @"denim blue";
  v3[63] = @"flash light";
  v2[64] = &unk_1F16E35A0;
  v3[64] = @"papaya";
  v2[65] = &unk_1F16E35B8;
  v3[65] = @"canary yellow";
  v2[66] = &unk_1F16E35D0;
  v3[66] = @"spearmint";
  v2[67] = &unk_1F16E35E8;
  v3[67] = @"cerulean";
  v2[68] = &unk_1F16E3618;
  v3[68] = @"delft blue";
  v2[69] = &unk_1F16E3630;
  v3[69] = @"dragon fruit";
  v2[70] = &unk_1F16E36F0;
  v3[70] = @"pine green";
  v2[71] = &unk_1F16E3678;
  v3[71] = @"lemon cream";
  v2[72] = &unk_1F16E3660;
  v3[72] = @"alaskan blue";
  v2[73] = &unk_1F16E36A8;
  v3[73] = @"pomegranate";
  v2[74] = &unk_1F16E36D8;
  v3[74] = @"khaki";
  v2[75] = &unk_1F16E3648;
  v3[75] = @"beryl";
  v2[76] = &unk_1F16E36C0;
  v3[76] = @"camel";
  v2[77] = &unk_1F16E3708;
  v3[77] = @"sea foam";
  v2[78] = &unk_1F16E3720;
  v3[78] = @"surf blue";
  v2[79] = &unk_1F16E3738;
  v3[79] = @"cactus";
  v2[80] = &unk_1F16E3750;
  v3[80] = @"linen blue";
  v2[81] = &unk_1F16E3768;
  v3[81] = @"grapefruit";
  v2[82] = &unk_1F16E3780;
  v3[82] = @"neon pink";
  v2[83] = &unk_1F16E3798;
  v3[83] = @"coastal gray";
  v2[84] = &unk_1F16E37B0;
  v3[84] = @"PinkCitrus";
  v2[85] = &unk_1F16E37C8;
  v3[85] = @"DeepNavy";
  v2[86] = &unk_1F16E37E0;
  v3[86] = @"CyprusGreen";
  v2[87] = &unk_1F16E37F8;
  v3[87] = @"FallCream";
  v2[88] = &unk_1F16E3810;
  v3[88] = @"Kumquat";
  v2[89] = &unk_1F16E3828;
  v3[89] = @"NorthernBlue";
  v2[90] = &unk_1F16E3840;
  v3[90] = @"Plum";
  v2[91] = &unk_1F16E3858;
  v3[91] = @"ElectricOrange";
  v2[92] = &unk_1F16E3870;
  v3[92] = @"Sunflower";
  v2[93] = &unk_1F16E3888;
  v3[93] = @"Pistachio";
  v2[94] = &unk_1F16E38A0;
  v3[94] = @"CloudBlue";
  v2[95] = &unk_1F16E38B8;
  v3[95] = @"Abyss";
  v2[96] = &unk_1F16E38D0;
  v3[96] = @"SeaSalt";
  v2[97] = &unk_1F16E38E8;
  v3[97] = @"Olive";
  v2[98] = &unk_1F16E3900;
  v3[98] = @"MallardGreen";
  v2[99] = &unk_1F16E3CF0;
  v3[99] = @"whistler black";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:100];
  v1 = (void *)__valueToFaceBundleStringDict_valueToFaceBundleString;
  __valueToFaceBundleStringDict_valueToFaceBundleString = v0;
}

- (id)pigmentEditOption
{
  id v6 = 0;
  id v7 = 0;
  NTKFaceColorNameAndCollection([(NTKValueEditOption *)self _value], &v7, &v6);
  id v2 = v7;
  id v3 = v6;
  id v4 = [[NTKPigmentEditOption alloc] initWithOptionName:v2 collectionName:v3];

  return v4;
}

@end