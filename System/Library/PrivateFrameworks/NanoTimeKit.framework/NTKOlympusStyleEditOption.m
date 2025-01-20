@interface NTKOlympusStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKOlympusStyleEditOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1259);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1260);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1260);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1260, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1261 = [v3 version];

    v10 = (void *)_orderedValuesForDevice____styles_1258;
    _orderedValuesForDevice____styles_1258 = (uint64_t)&unk_1F16EA3F0;

    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1261;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1259);
  id v11 = (id)_orderedValuesForDevice____styles_1258;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_1E62C7E90 + a3);
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_1E62C7EB0 + a3);
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1286 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1286, &__block_literal_global_1288);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1285;
  return v2;
}

void __57__NTKOlympusStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E39F0;
  v2[1] = &unk_1F16E39C0;
  v3[0] = @"style 1";
  v3[1] = @"style 2";
  v2[2] = &unk_1F16E3AF8;
  v3[2] = @"style 3";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1285;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1285 = v0;
}

@end