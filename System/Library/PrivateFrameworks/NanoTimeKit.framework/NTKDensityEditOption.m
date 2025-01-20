@interface NTKDensityEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKDensityEditOption

- (int64_t)swatchStyle
{
  return 1;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_868);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_869);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_869);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_869, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_870 = [v3 version];

    __48__NTKDensityEditOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_870;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_868);
  id v10 = (id)_orderedValuesForDevice____densities;

  return v10;
}

void __48__NTKDensityEditOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0 = _EnumValueRange(0, 3uLL);
  v1 = (void *)_orderedValuesForDevice____densities;
  _orderedValuesForDevice____densities = v0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E62C7E20[a3];
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E62C7E40[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1, &__block_literal_global_898);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1;
  return v2;
}

void __52__NTKDensityEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"minimal";
  v3[1] = @"simple";
  v2[2] = &unk_1F16E39F0;
  v2[3] = &unk_1F16E39C0;
  v3[2] = @"medium";
  v3[3] = @"detailed";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1 = v0;
}

@end