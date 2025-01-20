@interface NTKFaceColorMonochromeEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
@end

@implementation NTKFaceColorMonochromeEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_834);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_835);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_835);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_835, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_836 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_833;
    _orderedValuesForDevice____colors_833 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_836;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_834);
  id v13 = (id)_orderedValuesForDevice____colors_833;

  return v13;
}

void __60__NTKFaceColorMonochromeEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_833;
  _orderedValuesForDevice____colors_833 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKFaceColorMonochromeEditOption;
  v3 = objc_msgSendSuper2(&v6, sel___orderedValuesForDevice_, a3);
  id v4 = (void *)[v3 mutableCopy];

  [v4 insertObject:&unk_1F16E3CA8 atIndex:0];
  [v4 removeObject:&unk_1F16E3918];

  return v4;
}

@end