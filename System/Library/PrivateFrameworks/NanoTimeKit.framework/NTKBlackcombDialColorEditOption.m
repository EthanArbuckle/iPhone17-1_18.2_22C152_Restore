@interface NTKBlackcombDialColorEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKBlackcombDialColorEditOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1855);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1856);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1856);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1856, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1857 = [v3 version];

    v10 = (void *)_orderedValuesForDevice____colors_1854;
    _orderedValuesForDevice____colors_1854 = (uint64_t)&unk_1F16EA540;

    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1857;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1855);
  id v11 = (id)_orderedValuesForDevice____colors_1854;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"white";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"black";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"EDIT_OPTION_LABEL_BLACKCOMB_DIAL_WHITE";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_BLACKCOMB_DIAL_BLACK";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1870 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1870, &__block_literal_global_1872);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1869;

  return v2;
}

void __63__NTKBlackcombDialColorEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"style 1";
  v3[1] = @"style 2";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1869;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1869 = v0;
}

@end