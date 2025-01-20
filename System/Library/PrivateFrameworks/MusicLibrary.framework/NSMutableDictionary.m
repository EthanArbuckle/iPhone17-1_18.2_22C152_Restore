@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

void __64__NSMutableDictionary_ML3ArtworkAdditions__mergeWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      os_log_t v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v9 = [v8 mutableCopy];

        os_log_t v8 = (os_log_t)v9;
      }
      [v8 mergeWithDictionary:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        os_log_t v8 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v10 = [v8 mutableCopy];

          os_log_t v8 = (os_log_t)v10;
        }
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v11 = v6;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
              if ((-[NSObject containsObject:](v8, "containsObject:", v16, (void)v17) & 1) == 0) {
                [v8 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v27 count:16];
          }
          while (v13);
        }
      }
      else
      {
        os_log_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v22 = v5;
          __int16 v23 = 2114;
          v24 = v7;
          __int16 v25 = 2114;
          id v26 = v6;
          _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Conflict merging items from dictionary for key %{public}@: %{public}@ => %{public}@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

@end