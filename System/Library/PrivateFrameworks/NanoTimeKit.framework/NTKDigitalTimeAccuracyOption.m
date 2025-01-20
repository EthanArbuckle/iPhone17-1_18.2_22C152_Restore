@interface NTKDigitalTimeAccuracyOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (int64_t)indexForAccuracy:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
@end

@implementation NTKDigitalTimeAccuracyOption

+ (int64_t)indexForAccuracy:(unint64_t)a3 forDevice:(id)a4
{
  v5 = [a1 _orderedValuesForDevice:a4];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  int64_t v7 = [v5 indexOfObject:v6];

  return v7;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1297);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1298);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1298);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1298, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1299 = [v3 version];

    __56__NTKDigitalTimeAccuracyOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1299;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1297);
  id v10 = (id)_orderedValuesForDevice____styles_1296;

  return v10;
}

void __56__NTKDigitalTimeAccuracyOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0 = _EnumValueRange(0, 1uLL);
  v1 = (void *)_orderedValuesForDevice____styles_1296;
  _orderedValuesForDevice____styles_1296 = v0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"minutes";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"seconds";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"EDIT_OPTION_LABEL_DIGITAL_TIME_ACCURACY_MINUTES";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_DIGITAL_TIME_ACCURACY_SECONDS";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1315 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1315, &__block_literal_global_1317);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1314;

  return v2;
}

void __60__NTKDigitalTimeAccuracyOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"seconds";
  v3[1] = @"minutes";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1314;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1314 = v0;
}

@end