@interface NSArray(PreviewDeviceInfoAppearanceAdditions)
- (id)ic_deviceInfosByAddingAppearances;
@end

@implementation NSArray(PreviewDeviceInfoAppearanceAdditions)

- (id)ic_deviceInfosByAddingAppearances
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        v9 = ICDynamicCast();
        if (v9)
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __82__NSArray_PreviewDeviceInfoAppearanceAdditions__ic_deviceInfosByAddingAppearances__block_invoke;
          v12[3] = &unk_1E64A70D8;
          v12[4] = v8;
          id v13 = v2;
          +[ICAppearanceInfo enumerateAppearanceTypesUsingBlock:v12];
        }
        else
        {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"checkedDeviceInfo != ((void *)0)", "-[NSArray(PreviewDeviceInfoAppearanceAdditions) ic_deviceInfosByAddingAppearances]", 1, 0, @"Trying to add appearances to an array of devices infos, but the array contains something other than a device info, skipping %@", v8 functionName simulateCrash showAlert format];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v10 = (void *)[v2 copy];
  return v10;
}

@end