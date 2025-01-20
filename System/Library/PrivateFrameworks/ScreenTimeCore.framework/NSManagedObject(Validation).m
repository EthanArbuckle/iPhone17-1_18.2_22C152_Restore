@interface NSManagedObject(Validation)
- (uint64_t)parseValidationErrors:()Validation otherErrors:;
@end

@implementation NSManagedObject(Validation)

- (uint64_t)parseValidationErrors:()Validation otherErrors:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    v24 = a3;
    Class v6 = NSClassFromString(&cfstr_Xctestprobe.isa);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
          v13 = +[STLog coreDataValidation];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v12;
            _os_log_fault_impl(&dword_1DA519000, v13, OS_LOG_TYPE_FAULT, "ScreenTime CoreData Validation failed with: %{public}@", buf, 0xCu);
          }

          if (!v6)
          {
            v14 = -[CoreDataValidationCoreAnalyticsEvent initWithValidationError:]([CoreDataValidationCoreAnalyticsEvent alloc], "initWithValidationError:", [v12 code]);
            +[STCoreAnalyticsReporter reportEvent:v14];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v9);
    }

    int v15 = _os_feature_enabled_impl();
    if (v15)
    {
      if ([v7 count] == 1)
      {
        v16 = [v7 allObjects];
        void *v24 = [v16 firstObject];
      }
      else
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F281F8];
        uint64_t v20 = *MEMORY[0x1E4F28228];
        v30[0] = @"ScreenTime Multiple validation errors occurred.";
        uint64_t v21 = *MEMORY[0x1E4F1BDC8];
        v29[0] = v20;
        v29[1] = v21;
        v16 = (void *)[v7 copy];
        v30[1] = v16;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
        void *v24 = [v18 errorWithDomain:v19 code:1560 userInfo:v22];
      }
    }
    uint64_t v17 = v15 ^ 1u;
  }
  else
  {
    uint64_t v17 = 1;
  }

  return v17;
}

@end