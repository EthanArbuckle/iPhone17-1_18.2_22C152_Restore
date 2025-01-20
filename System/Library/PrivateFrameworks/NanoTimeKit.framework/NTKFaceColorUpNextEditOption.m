@interface NTKFaceColorUpNextEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
@end

@implementation NTKFaceColorUpNextEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_843);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_844);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_844);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_844, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_845 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_842;
    _orderedValuesForDevice____colors_842 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_845;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_843);
  id v13 = (id)_orderedValuesForDevice____colors_842;

  return v13;
}

void __56__NTKFaceColorUpNextEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_842;
  _orderedValuesForDevice____colors_842 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 nrDeviceVersion] >= 0x50000)
  {
    [v3 isRunningGraceOrLater];
    id v4 = &unk_1F16EA2A0;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if ([v6 nrDeviceVersion] >= 0x50000)
  {
    if (a3 == 201)
    {
      id v7 = @"siri-dark";
    }
    else if (a3 == 202)
    {
      id v7 = @"siri-grey";
    }
    else
    {
      v9.receiver = a1;
      v9.super_class = (Class)&OBJC_METACLASS___NTKFaceColorUpNextEditOption;
      objc_msgSendSuper2(&v9, sel__snapshotKeyForValue_forDevice_, a3, v6);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = &stru_1F1635E90;
  }

  return v7;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  return [a3 nrDeviceVersion] >> 16 > 4;
}

@end