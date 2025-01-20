@interface NTKKaleidoscopeStyleOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (int64_t)indexForStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKKaleidoscopeStyleOption

- (int64_t)swatchStyle
{
  v2 = [(NTKEditOption *)self device];
  uint64_t v3 = [v2 deviceCategory];

  if (v3 == 1) {
    return 1;
  }
  else {
    return 3;
  }
}

+ (int64_t)indexForStyle:(unint64_t)a3 forDevice:(id)a4
{
  v5 = [a1 _orderedValuesForDevice:a4];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  int64_t v7 = [v5 indexOfObject:v6];

  return v7;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1328);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1329);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1329);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1329, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1330 = [v3 version];

    __54__NTKKaleidoscopeStyleOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1330;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1328);
  id v11 = (id)_orderedValuesForDevice____styles_1327;

  return v11;
}

void __54__NTKKaleidoscopeStyleOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _EnumValueRange(0, 2uLL);
  v4 = (void *)_orderedValuesForDevice____styles_1327;
  _orderedValuesForDevice____styles_1327 = v3;

  uint64_t v5 = [v2 deviceCategory];
  if (v5 != 1)
  {
    uint64_t v6 = [&unk_1F16EA408 arrayByAddingObjectsFromArray:_orderedValuesForDevice____styles_1327];
    uint64_t v7 = (void *)_orderedValuesForDevice____styles_1327;
    _orderedValuesForDevice____styles_1327 = v6;
  }
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E62C7ED0[a3];
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  switch(a3)
  {
    case 0uLL:
      if ([v5 deviceCategory] == 1) {
        uint64_t v7 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_FACETED_CLASSIC";
      }
      else {
        uint64_t v7 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_FACETED";
      }
      break;
    case 1uLL:
      uint64_t v7 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_RADIAL";
      break;
    case 2uLL:
      uint64_t v7 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_LIMIT";
      break;
    case 3uLL:
      uint64_t v7 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_FSFACET";
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1364 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1364, &__block_literal_global_1366);
  }
  id v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1363;

  return v2;
}

void __58__NTKKaleidoscopeStyleOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"faceted";
  v3[1] = @"radial";
  v2[2] = &unk_1F16E39F0;
  v2[3] = &unk_1F16E39C0;
  v3[2] = @"limit";
  v3[3] = @"fullscreen facet";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1363;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1363 = v0;
}

@end