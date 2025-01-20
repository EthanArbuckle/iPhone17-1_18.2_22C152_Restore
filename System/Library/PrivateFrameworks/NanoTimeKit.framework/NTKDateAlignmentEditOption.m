@interface NTKDateAlignmentEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
@end

@implementation NTKDateAlignmentEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_940);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_941);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_941);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_941, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_942 = [v3 version];

    __54__NTKDateAlignmentEditOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_942;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_940);
  id v10 = (id)_orderedValuesForDevice____styles;

  return v10;
}

void __54__NTKDateAlignmentEditOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0 = _EnumValueRange(0, 1uLL);
  v1 = (void *)_orderedValuesForDevice____styles;
  _orderedValuesForDevice____styles = v0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"bottom";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"top";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"EDIT_OPTION_LABEL_DATE_ALIGNMENT_BOTTOM";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_DATE_ALIGNMENT_TOP";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_958 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_958, &__block_literal_global_960);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_957;
  return v2;
}

void __58__NTKDateAlignmentEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"top";
  v3[1] = @"bottom";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_957;
  _valueToFaceBundleStringDict_valueToFaceBundleString_957 = v0;
}

@end