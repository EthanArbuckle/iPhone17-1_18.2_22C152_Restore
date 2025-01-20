@interface NTKDualTimeStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKDualTimeStyleEditOption

- (int64_t)swatchStyle
{
  return 1;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1736);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1737);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1737);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1737, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1738 = [v3 version];

    __54__NTKDualTimeStyleEditOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1738;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1736);
  id v10 = (id)_orderedValuesForDevice____styles_1735;

  return v10;
}

void __54__NTKDualTimeStyleEditOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0 = _EnumValueRange(0, 1uLL);
  v1 = (void *)_orderedValuesForDevice____styles_1735;
  _orderedValuesForDevice____styles_1735 = v0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"digital";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"analog";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"EDIT_OPTION_LABEL_DUAL_TIME_STYLE_DIGITAL";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_DUAL_TIME_STYLE_ANALOG";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1748 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1748, &__block_literal_global_1750);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1747;

  return v2;
}

void __58__NTKDualTimeStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"analog";
  v3[1] = @"digital";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1747;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1747 = v0;
}

@end