@interface NTKFaceColorModularEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
@end

@implementation NTKFaceColorModularEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_825);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_826);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_826);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_826, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_827 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_824;
    _orderedValuesForDevice____colors_824 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_827;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_825);
  id v13 = (id)_orderedValuesForDevice____colors_824;

  return v13;
}

void __57__NTKFaceColorModularEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_824;
  _orderedValuesForDevice____colors_824 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKFaceColorModularEditOption;
  v3 = objc_msgSendSuper2(&v6, sel___orderedValuesForDevice_, a3);
  id v4 = (void *)[v3 mutableCopy];

  [v4 insertObject:&unk_1F16E3CA8 atIndex:0];
  return v4;
}

@end