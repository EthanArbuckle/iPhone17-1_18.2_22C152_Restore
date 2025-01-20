@interface NTKKaleidoscopeAssetOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKKaleidoscopeAssetOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4CC676F2-E761-4AA8-AE40-1A40F3868BDE"];
  int v6 = [v3 supportsCapability:v5];

  if (v6) {
    [v4 addObjectsFromArray:&unk_1F16EA420];
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A19F7B33-B4B5-4859-8FDD-DEDA6FD71895"];
  int v8 = [v3 supportsCapability:v7];

  if (v8) {
    [v4 addObjectsFromArray:&unk_1F16EA438];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  int v10 = [v3 supportsCapability:v9];

  if (v10) {
    [v4 addObjectsFromArray:&unk_1F16EA450];
  }
  if ([v3 nrDeviceVersion] >= 0x50000) {
    [v4 addObjectsFromArray:&unk_1F16EA468];
  }
  [v4 addObjectsFromArray:&unk_1F16EA480];

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"asset-%lu", a4, a3 + 1);
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if ([a4 nrDeviceVersion] < 0x50000)
  {
    v5 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_ASSET_%lu";
  }
  else
  {
    v5 = [@"EDIT_OPTION_LABEL_KALEIDOSCOPE_ASSET_%lu" stringByAppendingString:@"_5_0"];
  }
  int v6 = objc_msgSend(NSString, "stringWithFormat:", v5, a3 + 1);

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1403 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1403, &__block_literal_global_1405);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1402;
  return v2;
}

void __58__NTKKaleidoscopeAssetOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[33] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"asset 1";
  v3[1] = @"asset 2";
  v2[2] = &unk_1F16E39F0;
  v2[3] = &unk_1F16E39C0;
  v3[2] = @"asset 3";
  v3[3] = @"asset 4";
  v2[4] = &unk_1F16E3978;
  v2[5] = &unk_1F16E3960;
  v3[4] = @"asset 5";
  v3[5] = @"asset 6";
  v2[6] = &unk_1F16E34C8;
  v2[7] = &unk_1F16E3918;
  v3[6] = @"asset 7";
  v3[7] = @"asset 8";
  v2[8] = &unk_1F16E3930;
  v2[9] = &unk_1F16E34B0;
  v3[8] = @"asset 9";
  v3[9] = @"asset 10";
  v2[10] = &unk_1F16E3690;
  v2[11] = &unk_1F16E3AB0;
  v3[10] = @"asset 11";
  v3[11] = @"asset 12";
  v2[12] = &unk_1F16E3AE0;
  v2[13] = &unk_1F16E3B70;
  v3[12] = @"asset 13";
  v3[13] = @"asset 14";
  v2[14] = &unk_1F16E3B88;
  v2[15] = &unk_1F16E3BA0;
  v3[14] = @"asset 15";
  v3[15] = @"asset 16";
  v2[16] = &unk_1F16E39D8;
  v2[17] = &unk_1F16E3468;
  v3[16] = @"asset 17";
  v3[17] = @"asset 18";
  v2[18] = &unk_1F16E3600;
  v2[19] = &unk_1F16E3438;
  v3[18] = @"asset 19";
  v3[19] = @"asset 20";
  v2[20] = &unk_1F16E3450;
  v2[21] = &unk_1F16E3480;
  v3[20] = @"asset 21";
  v3[21] = @"asset 22";
  v2[22] = &unk_1F16E3A80;
  v2[23] = &unk_1F16E3BE8;
  v3[22] = @"asset 23";
  v3[23] = @"asset 24";
  v2[24] = &unk_1F16E3CD8;
  v2[25] = &unk_1F16E3AC8;
  v3[24] = @"asset 25";
  v3[25] = @"asset 26";
  v2[26] = &unk_1F16E3CC0;
  v2[27] = &unk_1F16E3BD0;
  v3[26] = @"asset 27";
  v3[27] = @"asset 28";
  v2[28] = &unk_1F16E3A20;
  v2[29] = &unk_1F16E3B40;
  v3[28] = @"asset 29";
  v3[29] = @"asset 30";
  v2[30] = &unk_1F16E3A08;
  v2[31] = &unk_1F16E3B58;
  v3[30] = @"asset 31";
  v3[31] = @"asset 32";
  v2[32] = &unk_1F16E3420;
  v3[32] = @"asset 33";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:33];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1402;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1402 = v0;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  if ([v4 nrDeviceVersion] >> 16 > 4)
  {
LABEL_9:
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
    if ([v4 supportsCapability:v15])
    {

      char v14 = 1;
      goto LABEL_17;
    }
    id v16 = [(NTKEditOption *)self device];
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___lock);
    id WeakRetained = objc_loadWeakRetained(&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___cachedDevice);
    if (WeakRetained)
    {
      v18 = WeakRetained;
      id v19 = objc_loadWeakRetained(&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___cachedDevice);
      if (v19 == v16)
      {
        uint64_t v20 = [v16 version];
        uint64_t v21 = _NTKNew2020SpringSummerColorsKaleidoscopeAssets___previousCLKDeviceVersion;

        if (v20 == v21)
        {
LABEL_16:
          os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___lock);
          id v23 = (id)_NTKNew2020SpringSummerColorsKaleidoscopeAssets_kaleidoscopeSpring2020Assets;

          char v24 = objc_msgSend(v23, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
          char v14 = v24 ^ 1;
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    id v22 = objc_storeWeak(&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___cachedDevice, v16);
    _NTKNew2020SpringSummerColorsKaleidoscopeAssets___previousCLKDeviceVersion = [v16 version];

    ___NTKNew2020SpringSummerColorsKaleidoscopeAssets_block_invoke();
    goto LABEL_16;
  }
  id v5 = [(NTKEditOption *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGloryKaleidoscopeAssets___lock);
  id v6 = objc_loadWeakRetained(&_NTKNewToGloryKaleidoscopeAssets___cachedDevice);
  if (v6)
  {
    v7 = v6;
    id v8 = objc_loadWeakRetained(&_NTKNewToGloryKaleidoscopeAssets___cachedDevice);
    if (v8 == v5)
    {
      uint64_t v9 = [v5 version];
      uint64_t v10 = _NTKNewToGloryKaleidoscopeAssets___previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&_NTKNewToGloryKaleidoscopeAssets___cachedDevice, v5);
  _NTKNewToGloryKaleidoscopeAssets___previousCLKDeviceVersion = [v5 version];

  ___NTKNewToGloryKaleidoscopeAssets_block_invoke();
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGloryKaleidoscopeAssets___lock);
  id v12 = (id)_NTKNewToGloryKaleidoscopeAssets_kaleidoscopeGloryAssets;

  char v13 = objc_msgSend(v12, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }
  char v14 = 0;
LABEL_17:

  return v14;
}

@end