@interface NTKWhistlerAnalogColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
- (int64_t)swatchStyle;
@end

@implementation NTKWhistlerAnalogColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1655);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1656);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1656);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1656, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1657 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_1654;
    _orderedValuesForDevice____colors_1654 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1657;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1655);
  id v13 = (id)_orderedValuesForDevice____colors_1654;

  return v13;
}

void __60__NTKWhistlerAnalogColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_1654;
  _orderedValuesForDevice____colors_1654 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NTKWhistlerAnalogColorEditOption;
  v3 = objc_msgSendSuper2(&v7, sel___orderedValuesForDevice_, a3);
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:&unk_1F16E3918];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", &unk_1F16E3918, &unk_1F16E3CF0, 0);
  [v5 addObjectsFromArray:v4];

  return v5;
}

@end