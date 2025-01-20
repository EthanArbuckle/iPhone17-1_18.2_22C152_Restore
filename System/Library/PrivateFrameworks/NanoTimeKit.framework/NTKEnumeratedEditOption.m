@interface NTKEnumeratedEditOption
+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)domain;
+ (id)legacyOptionWithName:(id)a3 forDevice:(id)a4;
+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4;
+ (id)optionAtIndex:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionsRestrictedByDevice:(id)a3;
+ (unint64_t)indexOfOption:(id)a3 forDevice:(id)a4;
+ (unint64_t)numberOfOptionsForDevice:(id)a3;
@end

@implementation NTKEnumeratedEditOption

+ (id)legacyOptionWithName:(id)a3 forDevice:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  objc_sync_enter(v7);
  os_unfair_lock_lock((os_unfair_lock_t)&legacyOptionWithName_forDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&legacyOptionWithName_forDevice____cachedDevice);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    id v10 = objc_loadWeakRetained(&legacyOptionWithName_forDevice____cachedDevice);
    if (v10 == v6)
    {
      uint64_t v11 = [v6 version];
      uint64_t v12 = legacyOptionWithName_forDevice____previousCLKDeviceVersion;

      if (v11 == v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&legacyOptionWithName_forDevice____cachedDevice, v6);
  legacyOptionWithName_forDevice____previousCLKDeviceVersion = [v6 version];

  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = (void *)legacyOptionWithName_forDevice__mappingOptionsByClass;
  legacyOptionWithName_forDevice__mappingOptionsByClass = v14;

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&legacyOptionWithName_forDevice____lock);
  v16 = (void *)legacyOptionWithName_forDevice__mappingOptionsByClass;
  v17 = NSStringFromClass((Class)a1);
  v18 = [v16 objectForKeyedSubscript:v17];

  if (!v18)
  {
    v18 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v19 = [a1 numberOfOptionsForDevice:v6];
    if (v19)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        v21 = [a1 optionAtIndex:i forDevice:v6];
        if ([v21 conformsToProtocol:&unk_1FCDEF740])
        {
          v22 = [v21 pigmentEditOption];
          v23 = [v22 fullname];
          [v18 setObject:v21 forKeyedSubscript:v23];
        }
      }
    }
    v24 = (void *)legacyOptionWithName_forDevice__mappingOptionsByClass;
    v25 = NSStringFromClass((Class)a1);
    [v24 setObject:v18 forKeyedSubscript:v25];
  }
  v26 = [v18 objectForKeyedSubscript:v28];

  objc_sync_exit(v7);
  return v26;
}

+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  v7 = [a3 fullname];
  v8 = [a1 legacyOptionWithName:v7 forDevice:v6];

  return v8;
}

+ (id)domain
{
  return 0;
}

+ (unint64_t)numberOfOptionsForDevice:(id)a3
{
  v3 = [a1 _orderedValuesForDevice:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

+ (id)optionAtIndex:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  v7 = [a1 _orderedValuesForDevice:v6];
  unint64_t v8 = [v7 count];

  if (v8 <= a3) {
    a3 = 0;
  }
  v9 = [a1 _orderedValuesForDevice:v6];
  id v10 = [v9 objectAtIndex:a3];
  uint64_t v11 = [v10 unsignedIntegerValue];

  uint64_t v12 = [a1 _optionWithValue:v11 forDevice:v6];

  return v12;
}

+ (unint64_t)indexOfOption:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 _value];
  unint64_t v8 = [a1 _orderedValuesForDevice:v6];

  v9 = [NSNumber numberWithUnsignedInteger:v7];
  unint64_t v10 = [v8 indexOfObject:v9];

  return v10;
}

+ (id)optionsRestrictedByDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(a1, "_orderedValuesRestrictedByDevice:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_optionWithValue:forDevice:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntValue"), v4);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = [a1 _orderedValuesForDevice:a4];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [v6 containsObject:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[NTKEnumeratedEditOption _valueIsValid:forDevice:]((uint64_t)a1, a3, v9);
    }
  }
  return v8;
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return 0;
}

+ (void)_valueIsValid:(NSObject *)a3 forDevice:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "%@: invalid value (%@)", (uint8_t *)&v6, 0x16u);
}

@end