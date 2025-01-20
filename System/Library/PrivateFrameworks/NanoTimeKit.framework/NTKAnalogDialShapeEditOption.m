@interface NTKAnalogDialShapeEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithShape:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)_value;
@end

@implementation NTKAnalogDialShapeEditOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)optionWithShape:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if ([v6 deviceCategory] == 1) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = a3;
  }
  v8 = [a1 _optionWithValue:v7 forDevice:v6];

  return v8;
}

- (unint64_t)_value
{
  v3 = [(NTKEditOption *)self device];
  uint64_t v4 = [v3 deviceCategory];

  if (v4 == 1) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NTKAnalogDialShapeEditOption;
  return [(NTKValueEditOption *)&v6 _value];
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1701);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1702);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1702);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesRestrictedByDevice____cachedDevice_1702, v3);
    _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1703 = [v3 version];

    __65__NTKAnalogDialShapeEditOption__orderedValuesRestrictedByDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1703;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1701);
  id v11 = (id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1700;

  return v11;
}

void __65__NTKAnalogDialShapeEditOption__orderedValuesRestrictedByDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1700;
  _orderedValuesRestrictedByDevice__hardwareSpecificValues_1700 = v3;

  uint64_t v5 = [v2 deviceCategory];
  if (v5 != 1)
  {
    id v6 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1700;
    [v6 addObject:&unk_1F16E3498];
  }
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1706);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1707);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1707);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1707, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1708 = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__NTKAnalogDialShapeEditOption__orderedValuesForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __56__NTKAnalogDialShapeEditOption__orderedValuesForDevice___block_invoke((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1708;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1706);
  id v11 = (id)_orderedValuesForDevice__dialShapes;

  return v11;
}

void __56__NTKAnalogDialShapeEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _orderedValuesRestrictedByDevice:a2];
  uint64_t v3 = (void *)_orderedValuesForDevice__dialShapes;
  _orderedValuesForDevice__dialShapes = v2;

  uint64_t v4 = [(id)_orderedValuesForDevice__dialShapes arrayByAddingObjectsFromArray:&unk_1F16EA4F8];
  uint64_t v5 = (void *)_orderedValuesForDevice__dialShapes;
  _orderedValuesForDevice__dialShapes = v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4 = @"fullscreen";
  if (a3 != 1) {
    uint64_t v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"circular";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4 = @"EDIT_OPTION_LABEL_ANALOG_DIAL_SHAPE_FULLSCREEN";
  if (a3 != 1) {
    uint64_t v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_ANALOG_DIAL_SHAPE_CIRCULAR";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1725 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1725, &__block_literal_global_1727);
  }
  uint64_t v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1724;

  return v2;
}

void __60__NTKAnalogDialShapeEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"circular";
  v3[1] = @"fullscreen";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1724;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1724 = v0;
}

@end