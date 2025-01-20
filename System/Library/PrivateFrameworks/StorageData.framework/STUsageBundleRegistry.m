@interface STUsageBundleRegistry
- (NSDictionary)reporters;
- (NSDictionary)usageApps;
- (STUsageBundleRegistry)init;
- (id)allAppsWithUsageBundles;
- (id)loadBundlesForReporters:(id)a3;
- (id)loadReporters;
- (id)usageBundleForIdentifier:(id)a3;
- (void)setReporters:(id)a3;
- (void)setUsageApps:(id)a3;
@end

@implementation STUsageBundleRegistry

- (STUsageBundleRegistry)init
{
  v9.receiver = self;
  v9.super_class = (Class)STUsageBundleRegistry;
  v2 = [(STUsageBundleRegistry *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(STUsageBundleRegistry *)v2 loadReporters];
    reporters = v3->_reporters;
    v3->_reporters = (NSDictionary *)v4;

    uint64_t v6 = [(STUsageBundleRegistry *)v3 loadBundlesForReporters:v3->_reporters];
    usageApps = v3->_usageApps;
    v3->_usageApps = (NSDictionary *)v6;
  }
  return v3;
}

- (id)loadReporters
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  __uint64_t v42 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v2 = [MEMORY[0x263F08850] defaultManager];
  v43 = [NSURL fileURLWithPath:@"/System/Library/UsageBundles" isDirectory:1];
  v3 = objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
  if (STStorageIsInternalInstall())
  {
    uint64_t v4 = [NSURL fileURLWithPath:@"/AppleInternal/Library/UsageBundles"];
    v5 = [v2 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:6 error:0];
    uint64_t v6 = [v3 arrayByAddingObjectsFromArray:v5];

    v3 = (void *)v6;
  }
  v7 = [NSURL fileURLWithPath:@"/System/Cryptexes/App/System/Library/UsageBundles"];
  v44 = v2;
  v8 = [v2 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:6 error:0];
  objc_super v9 = [v3 arrayByAddingObjectsFromArray:v8];

  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v47;
    unint64_t v14 = 0x264304000uLL;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v17 = [v16 pathExtension];
        int v18 = [v17 isEqualToString:@"bundle"];

        if (v18)
        {
          v19 = [v16 lastPathComponent];
          v20 = [*(id *)(v14 + 3944) overridesFor:v19];
          char v21 = [v20 ignore];

          if ((v21 & 1) == 0)
          {
            v22 = [MEMORY[0x263F086E0] bundleWithURL:v16];
            v23 = (objc_class *)[v22 principalClass];
            if ([(objc_class *)v23 conformsToProtocol:&unk_26C932B20])
            {
              id v24 = objc_alloc_init(v23);
              if (v24)
              {
                [v16 lastPathComponent];
                id v25 = v10;
                v27 = unint64_t v26 = v14;
                STLog(1, @"Listing app bundle reporter for %@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);

                unint64_t v14 = v26;
                id v10 = v25;
                [v45 setObject:v24 forKey:v16];
              }
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v12);
  }

  __uint64_t v34 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, @"%0.3f secs: load usage reporters", v35, v36, v37, v38, v39, v40, COERCE__INT64((double)(v34 - v42) / 1000000000.0));

  return v45;
}

- (id)loadBundlesForReporters:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  __uint64_t v45 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v4 = +[STAppOverrides overrides];
  long long v49 = v3;
  v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v7 = [v4 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v13 = [v4 objectForKeyedSubscript:v12];
        unint64_t v14 = [v13 usageBundleOverride];
        if (v14) {
          [v6 setObject:v12 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v9);
  }
  long long v46 = v4;

  [v49 allKeys];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v58 + 1) + 8 * v15);
        uint64_t v17 = [v16 lastPathComponent];
        int v18 = [v49 objectForKey:v16];
        v19 = +[STUsageBundleOverrides overridesFor:v17];
        uint64_t v20 = [v19 replaceWithZeroSizeApp];

        v52 = (void *)v17;
        uint64_t v53 = v15;
        uint64_t v51 = (void *)v20;
        if (v20)
        {
          char v21 = [MEMORY[0x263F5FCF0] usageBundleAppForBundleWithIdentifier:v20 withTotalSize:0.0];
          v67 = v21;
          v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
        }
        else
        {
          v22 = [v18 usageBundleApps];
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v66 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v55 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              [v28 setUsageBundleStorageReporter:v18];
              uint64_t v29 = [v28 bundleIdentifier];
              uint64_t v30 = [v6 objectForKeyedSubscript:v29];

              if (!v30)
              {
                uint64_t v30 = [v28 bundleIdentifier];
              }
              STLog(1, @"Listing app bundle : %@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
              [v5 setObject:v28 forKey:v30];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v66 count:16];
          }
          while (v25);
        }

        uint64_t v15 = v53 + 1;
      }
      while (v53 + 1 != v50);
      uint64_t v50 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v50);
  }
  __uint64_t v37 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, @"%0.3f secs: load usage bundles", v38, v39, v40, v41, v42, v43, COERCE__INT64((double)(v37 - v45) / 1000000000.0));

  return v5;
}

- (id)usageBundleForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"com.apple."])
  {
    v5 = [(NSDictionary *)self->_usageApps objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allAppsWithUsageBundles
{
  return [(NSDictionary *)self->_usageApps allKeys];
}

- (NSDictionary)reporters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReporters:(id)a3
{
}

- (NSDictionary)usageApps
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUsageApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageApps, 0);

  objc_storeStrong((id *)&self->_reporters, 0);
}

@end