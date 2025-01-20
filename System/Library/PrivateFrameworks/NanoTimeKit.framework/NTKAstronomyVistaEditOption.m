@interface NTKAstronomyVistaEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKAstronomyVistaEditOption

- (int64_t)swatchStyle
{
  return 1;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_906);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_907);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_907);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_907, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_908 = [v3 version];

    __55__NTKAstronomyVistaEditOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_908;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_906);
  id v11 = (id)_orderedValuesForDevice____themes;

  return v11;
}

void __55__NTKAstronomyVistaEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 nrDeviceVersion] >= 0x50000)
  {
    uint64_t v2 = _EnumValueRange(0, 2uLL);
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4F1CBF0];
  }
  id v3 = (void *)_orderedValuesForDevice____themes;
  _orderedValuesForDevice____themes = v2;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E62C7E60[a3];
  }
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E62C7E78[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_930 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_930, &__block_literal_global_932);
  }
  uint64_t v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_929;

  return v2;
}

void __59__NTKAstronomyVistaEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"earth";
  v3[1] = @"luna";
  v2[2] = &unk_1F16E39F0;
  v3[2] = @"orrery";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_929;
  _valueToFaceBundleStringDict_valueToFaceBundleString_929 = v0;
}

@end