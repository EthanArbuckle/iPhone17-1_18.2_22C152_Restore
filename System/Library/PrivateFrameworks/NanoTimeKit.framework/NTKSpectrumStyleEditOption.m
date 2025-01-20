@interface NTKSpectrumStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKSpectrumStyleEditOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1664);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1665);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1665);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1665, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1666 = [v3 version];

    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F16EA4E0];
    v11 = (void *)_orderedValuesForDevice____styles_1663;
    _orderedValuesForDevice____styles_1663 = v10;

    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1666;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1664);
  id v12 = (id)_orderedValuesForDevice____styles_1663;

  return v12;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E62C7F20[a3];
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E62C7F38[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1691 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1691, &__block_literal_global_1693);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1690;

  return v2;
}

void __58__NTKSpectrumStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"one";
  v3[1] = @"two";
  v2[2] = &unk_1F16E39F0;
  v3[2] = @"three";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1690;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1690 = v0;
}

@end