@interface PHANanoRegistryWrapper
+ (BOOL)hasValidWatchPaired;
@end

@implementation PHANanoRegistryWrapper

+ (BOOL)hasValidWatchPaired
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v3 = [v2 getAllDevices];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x1E4F79DA0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 valueForProperty:v8];
        if (v11)
        {
        }
        else
        {
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F27862F8-5179-4DB0-9F89-179EA7CB4011"];
          int v13 = [v10 supportsCapability:v12];

          if (v13)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v16 = 0;
              _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[PHANanoRegistryWrapper] has valid watch paired", v16, 2u);
            }

            BOOL v14 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[PHANanoRegistryWrapper] no valid watch paired", v16, 2u);
    BOOL v14 = 0;
  }
LABEL_16:

  return v14;
}

@end