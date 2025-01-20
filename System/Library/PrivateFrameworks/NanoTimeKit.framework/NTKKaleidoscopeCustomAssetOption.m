@interface NTKKaleidoscopeCustomAssetOption
+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
@end

@implementation NTKKaleidoscopeCustomAssetOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1414);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1415);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1415);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1415, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1416 = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__NTKKaleidoscopeCustomAssetOption__orderedValuesForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __60__NTKKaleidoscopeCustomAssetOption__orderedValuesForDevice___block_invoke((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1416;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1414);
  id v11 = (id)_orderedValuesForDevice____styles_1413;

  return v11;
}

void __60__NTKKaleidoscopeCustomAssetOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___NTKKaleidoscopeCustomAssetOption;
  v2 = objc_msgSendSuper2(&v5, sel__orderedValuesForDevice_, a2);
  uint64_t v3 = [&unk_1F16EA498 arrayByAddingObjectsFromArray:v2];
  id v4 = (void *)_orderedValuesForDevice____styles_1413;
  _orderedValuesForDevice____styles_1413 = v3;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 1000)
  {
    v6 = @"asset-custom";
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKKaleidoscopeCustomAssetOption;
    objc_msgSendSuper2(&v8, sel__snapshotKeyForValue_forDevice_, a3, a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 1000)
  {
    v6 = @"EDIT_OPTION_LABEL_KALEIDOSCOPE_ASSET_CUSTOM";
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKKaleidoscopeCustomAssetOption;
    objc_msgSendSuper2(&v8, sel__nameLocalizationKeyForValue_forDevice_, a3, a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 1000)
  {
    uint64_t v5 = NTKClockFaceLocalizedString(@"KALEIDOSCOPE_CHOOSE_PHOTO", @"Choose Photo…");
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__NTKKaleidoscopeCustomAssetOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_1436 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1436, block);
  }
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1435;
}

void __64__NTKKaleidoscopeCustomAssetOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)NTKKaleidoscopeCustomAssetOption;
  v1 = objc_msgSendSuper2(&v5, sel__valueToFaceBundleStringDict);
  v2 = (void *)[v1 mutableCopy];

  [v2 setObject:@"asset custom" forKeyedSubscript:&unk_1F16E3C18];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1435;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1435 = v3;
}

@end