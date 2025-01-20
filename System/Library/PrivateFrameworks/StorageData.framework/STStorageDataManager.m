@interface STStorageDataManager
+ (id)applicationRecords;
+ (id)computeBundleRemappings:(id)a3;
+ (id)computeCategoriesForApps:(id)a3;
+ (id)getLocalAppId:(id)a3 foreignAppId:(id)a4;
+ (id)overridesFor:(id)a3;
+ (id)sharedContainersFor:(id)a3;
+ (id)updateAppsWithPrevious:(id)a3 usageBundles:(id)a4 skipAppRecordBlock:(id)a5;
+ (void)fixClonesInPhotosAndMessages:(id)a3;
@end

@implementation STStorageDataManager

+ (id)applicationRecords
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  v4 = [v3 allObjects];
  [v2 addObjectsFromArray:v4];

  v5 = [MEMORY[0x263F01878] enumeratorWithOptions:64];
  v6 = [v5 allObjects];
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (id)sharedContainersFor:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v3;
  uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v7 = [v6 groupContainerURLs];
        v8 = [v7 allKeys];
        v9 = [v6 bundleIdentifier];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [v7 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * j)];
              v16 = [v15 path];
              if ([v16 length]) {
                AddToMultiDict(v4, v16, v9);
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  return v4;
}

+ (id)computeCategoriesForApps:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(STMutableSizeDict);
  long long v24 = STKeyForCategory(0);
  long long v23 = STKeyForCategory(7u);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v10 = [v9 internalSizes];
        uint64_t v11 = [v9 externalSizes];
        char v12 = [v9 userVisible];
        id v13 = v24;
        if ((v12 & 1) == 0)
        {
          id v14 = v23;

          id v13 = v14;
        }
        [(STMutableSizeDict *)v4 addSize:v10 toKey:v13];
        if (v11)
        {
          v15 = [a1 overridesFor:v9];
          unsigned int v16 = [v15 category];

          if (v16) {
            char v17 = 1;
          }
          else {
            char v17 = v12;
          }
          if (v17)
          {
            STKeyForCategory(v16);
            id v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v18 = v23;
          }
          uint64_t v19 = v18;
          [(STMutableSizeDict *)v4 addSize:v11 toKey:v18];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)computeBundleRemappings:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v9 = [v8 bundleIdentifier];
        id v10 = [v8 bundleIdentifier];
        [v4 setObject:v9 forKeyedSubscript:v10];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v11 = [v8 counterpartIdentifiers];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * j);
              char v17 = [v4 objectForKeyedSubscript:v16];

              if (!v17)
              {
                id v18 = [v8 bundleIdentifier];
                [v4 setObject:v18 forKeyedSubscript:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)overridesFor:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleIdentifier];
  uint64_t v5 = +[STAppOverrides overridesFor:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v3 appRecord];

    if (v6)
    {
      uint64_t v7 = [v3 appRecord];
      id v6 = +[STAppOverrides overridesForApplication:v7];
    }
  }

  return v6;
}

+ (id)getLocalAppId:(id)a3 foreignAppId:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:v5];
  uint64_t v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;

  return v9;
}

+ (id)updateAppsWithPrevious:(id)a3 usageBundles:(id)a4 skipAppRecordBlock:(id)a5
{
  uint64_t v289 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v243 = (uint64_t (**)(id, void))a5;
  __uint64_t v239 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v240 = v7;
  if (v7)
  {
    v250 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v280 = 0u;
    long long v281 = 0u;
    long long v282 = 0u;
    long long v283 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v280 objects:v288 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v281;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v281 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v280 + 1) + 8 * i);
          v15 = [v14 bundleIdentifier];
          [v250 setObject:v14 forKey:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v280 objects:v288 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v250 = 0;
  }
  v246 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v16 = [(id)objc_opt_class() applicationRecords];
  uint64_t v17 = +[STStorageDataManager computeBundleRemappings:v16];
  v248 = objc_opt_new();
  __uint64_t v238 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  long long v276 = 0u;
  long long v277 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  id v18 = [v8 allAppsWithUsageBundles];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v276 objects:v287 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v277;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v277 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v276 + 1) + 8 * j);
        long long v24 = [v8 usageBundleForIdentifier:v23];
        long long v25 = +[STStorageDataManager getLocalAppId:v17 foreignAppId:v23];
        [v248 setObject:v24 forKeyedSubscript:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v276 objects:v287 count:16];
    }
    while (v20);
  }
  v241 = v8;
  v242 = (void *)v17;

  long long v274 = 0u;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  obuint64_t j = v16;
  uint64_t v26 = [obj countByEnumeratingWithState:&v272 objects:v286 count:16];
  long long v27 = v243;
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v273;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v273 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void **)(*((void *)&v272 + 1) + 8 * k);
        if (!v27 || (v27[2](v27, *(void *)(*((void *)&v272 + 1) + 8 * k)) & 1) == 0)
        {
          uint64_t v32 = [v31 bundleIdentifier];
          STLog(1, @"Listing app : %@", v33, v34, v35, v36, v37, v38, (uint64_t)v32);

          v39 = [v31 bundleIdentifier];
          v40 = [v250 objectForKey:v39];
          v41 = v40;
          if (!v40)
          {
            v42 = [STStorageApp alloc];
            v43 = [v248 objectForKey:v39];
            v41 = [(STStorageApp *)v42 initWithAppRecord:v31 usageBundle:v43];

            long long v27 = v243;
            v44 = [a1 overridesFor:v41];
            -[STStorageApp setForceVisible:](v41, "setForceVisible:", [v44 forceVisible]);
            -[STStorageApp setForceHidden:](v41, "setForceHidden:", [v44 forceHidden]);
          }
          [v246 setObject:v41 forKey:v39];
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v272 objects:v286 count:16];
    }
    while (v28);
  }

  v45 = [v250 objectForKey:@"com.apple.fakeapp.System"];
  if (!v45)
  {
    v46 = [STStorageApp alloc];
    v47 = STNameForCategoryKey(@"CAT_SYSTEM");
    v45 = [(STStorageApp *)v46 initWithBundleIdentifier:@"com.apple.fakeapp.System" name:v47 vendorName:@"Apple Inc."];

    [(STStorageApp *)v45 setAppKind:1];
    [(STStorageApp *)v45 setForceHidden:1];
    v48 = +[STSizeVector fixed:STSizeOfSystemVolume()];
    [(STStorageApp *)v45 setExternalSizes:v48];
  }
  v49 = [(STStorageApp *)v45 appIdentifier];
  v50 = v246;
  v237 = v45;
  [v246 setObject:v45 forKey:v49];

  __uint64_t v234 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v51 = +[STStorageApp sizeOfPluginKitContainers];
  v52 = (void *)v17;
  if (v51)
  {
    v53 = [v250 objectForKey:@"com.apple.fakeapp.PluginKit.hidden"];
    if (!v53)
    {
      v54 = [STStorageApp alloc];
      v55 = STStorageDataLocStr(@"App Plugins");
      v53 = [(STStorageApp *)v54 initWithBundleIdentifier:@"com.apple.fakeapp.PluginKit.hidden" name:v55 vendorName:@"Apple Inc."];

      [(STStorageApp *)v53 setAppKind:3];
      [(STStorageApp *)v53 setForceHidden:1];
    }
    [(STStorageApp *)v53 setExternalSizes:v51];
    v56 = [(STStorageApp *)v53 appIdentifier];
    [v246 setObject:v53 forKey:v56];
  }
  v236 = (void *)v51;
  __uint64_t v232 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [v246 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_10];
  v57 = STGetCurrentMediaUsage();
  v58 = objc_alloc_init(STMutableSizeDict);
  v59 = +[STAppOverrides overrides];
  v235 = v57;
  v60 = STSelectMediaUsage(v57, v59);

  [(STMutableSizeDict *)v58 plusEquals:v60];
  v61 = +[STAppOverrides overrides];
  v62 = STComputeFSOverrides(v61);

  [(STMutableSizeDict *)v58 plusEquals:v62];
  v63 = +[STAppOverrides overrides];
  v64 = STComputeCacheDeleteOverrides(v63);

  [(STMutableSizeDict *)v58 plusEquals:v64];
  v65 = +[STAppOverrides overrides];
  uint64_t v66 = STComputeUsageBundleData(v241, v65);

  v233 = (void *)v66;
  [(STMutableSizeDict *)v58 plusEquals:v66];
  v67 = STMessagesExternalDataSize();
  [(STMutableSizeDict *)v58 addSize:v67 toKey:@"com.apple.MobileSMS"];

  v68 = [MEMORY[0x263F53C50] sharedConnection];
  LODWORD(v64) = [v68 isiCloudDriveAllowed];

  if (!v64) {
    goto LABEL_50;
  }
  v69 = +[STStorageCacheDelete sharedMonitor];
  v70 = [v69 cacheDeleteDict];

  v71 = [v70 objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  uint64_t v72 = [v70 objectForKeyedSubscript:@"com.apple.bird.cache-delete"];
  uint64_t v73 = [v71 objectForKeyedSubscript:@"com.apple.bird.cache-delete"];
  if (v72 | v73)
  {
    if (v72 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      STLog(3, @"'com.apple.bird.cache-delete' value must be an NSNumber.\ncacheDeleteDict value: %@", v74, v75, v76, v77, v78, v79, (uint64_t)v70);
      char v80 = 1;
      if (!v73) {
        goto LABEL_44;
      }
    }
    else
    {
      char v80 = 0;
      if (!v73)
      {
LABEL_44:
        if ((v80 & 1) == 0)
        {
          v230 = v71;
          v87 = [v250 objectForKey:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
          if (!v87)
          {
            v88 = [STStorageApp alloc];
            v89 = STStorageDataLocStr(@"ICLOUD_DRIVE");
            v87 = [(STStorageApp *)v88 initWithBundleIdentifier:@"com.apple.CloudDocs.iCloudDriveFileProvider" name:v89 vendorName:0];

            [(STStorageApp *)v87 setAppKind:3];
          }
          v90 = +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", [(id)v73 longLongValue], objc_msgSend((id)v72, "longLongValue"));
          [(STStorageApp *)v87 setExternalSizes:v90];

          STLog(1, @"Listing app container : %@", v91, v92, v93, v94, v95, v96, @"com.apple.CloudDocs.iCloudDriveFileProvider");
          [v246 setObject:v87 forKey:@"com.apple.CloudDocs.iCloudDriveFileProvider"];

          v71 = v230;
        }
        goto LABEL_49;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_44;
    }
    STLog(3, @"'com.apple.bird.cache-delete' value must be an NSNumber.\nCACHE_DELETE_ITEMIZED_NONPURGEABLE value: %@", v81, v82, v83, v84, v85, v86, (uint64_t)v71);
  }
LABEL_49:

  v52 = v242;
  v50 = v246;
LABEL_50:
  v97 = +[STFileProviderMonitor sharedMonitor];
  v98 = [v97 fpDomains];

  v99 = +[STAppOverrides overrides];
  v100 = STFileProviderExternalDataSize(v98);
  [(STMutableSizeDict *)v58 plusEquals:v100];

  v247 = v58;
  v101 = [(STSizeDict *)v58 remapKeys:v52 removeMissing:0];
  v270[0] = MEMORY[0x263EF8330];
  v270[1] = 3221225472;
  v270[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_2;
  v270[3] = &unk_264305690;
  id v102 = v50;
  id v271 = v102;
  [v248 enumerateKeysAndObjectsUsingBlock:v270];
  v231 = v101;
  v103 = [v101 dictionary];
  v267[0] = MEMORY[0x263EF8330];
  v267[1] = 3221225472;
  v267[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_3;
  v267[3] = &unk_2643056B8;
  id v104 = v102;
  id v268 = v104;
  id v249 = v248;
  id v269 = v249;
  [v103 enumerateKeysAndObjectsUsingBlock:v267];

  __uint64_t v229 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  long long v263 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  long long v266 = 0u;
  id v105 = v98;
  uint64_t v106 = [v105 countByEnumeratingWithState:&v263 objects:v285 count:16];
  if (!v106) {
    goto LABEL_69;
  }
  uint64_t v107 = v106;
  uint64_t v108 = *(void *)v264;
  do
  {
    uint64_t v109 = 0;
    do
    {
      if (*(void *)v264 != v108) {
        objc_enumerationMutation(v105);
      }
      v110 = *(void **)(*((void *)&v263 + 1) + 8 * v109);
      v111 = [v110 topLevelBundleIdentifier];
      v112 = v111;
      if (v111)
      {
        id v113 = v111;
      }
      else
      {
        id v113 = [v110 providerID];
      }
      v114 = v113;

      v115 = [v104 objectForKey:v114];
      v116 = v115;
      if (v115)
      {
        [v115 setFpDomain:v110];
        if ([v114 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
        {
          v117 = v116;
          uint64_t v118 = 5;
LABEL_61:
          [v117 setAppKind:v118];
          goto LABEL_65;
        }
        v119 = [v116 appRecord];
        if (v119)
        {
        }
        else
        {
          v120 = [v116 usageBundle];

          if (!v120)
          {
            v121 = [v110 providerDisplayName];
            [v116 setName:v121];

            v117 = v116;
            uint64_t v118 = 4;
            goto LABEL_61;
          }
        }
      }
LABEL_65:

      ++v109;
    }
    while (v107 != v109);
    uint64_t v122 = [v105 countByEnumeratingWithState:&v263 objects:v285 count:16];
    uint64_t v107 = v122;
  }
  while (v122);
LABEL_69:

  __uint64_t v227 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v123 = +[STUpdateMonitor sharedMonitor];
  uint64_t v124 = [v123 currentUpdateSize];
  STLog(1, @"Current update size (%lld)", v125, v126, v127, v128, v129, v130, v124);
  if (v124)
  {
    v131 = [v123 bundleIdentifier];
    v132 = [v250 objectForKey:v131];
    if (!v132)
    {
      v133 = [STStorageApp alloc];
      v134 = STStorageDataLocStr(@"SOFTWARE_UPDATE");
      v132 = [(STStorageApp *)v133 initWithBundleIdentifier:v131 name:v134 vendorName:0];

      [(STStorageApp *)v132 setAppKind:3];
      v135 = [v241 usageBundleForIdentifier:@"com.apple.Preferences"];
      [(STStorageApp *)v132 setUsageBundle:v135];
    }
    v136 = [v123 currentUpdateName];
    [(STStorageApp *)v132 setName:v136];

    v137 = +[STSizeVector docsAndData:v124];
    [(STStorageApp *)v132 setExternalSizes:v137];

    STLog(1, @"Listing app container : %@", v138, v139, v140, v141, v142, v143, (uint64_t)v131);
    [v104 setObject:v132 forKey:v131];
  }
  v228 = v123;
  __uint64_t v224 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v226 = [(id)objc_opt_class() sharedContainersFor:obj];
  v225 = +[STMSizer containersWithClass:7];
  v144 = [v225 allValues];
  v145 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v144, "count"));
  long long v259 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  long long v262 = 0u;
  id v146 = v144;
  uint64_t v147 = [v146 countByEnumeratingWithState:&v259 objects:v284 count:16];
  if (v147)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *(void *)v260;
    do
    {
      for (uint64_t m = 0; m != v148; ++m)
      {
        if (*(void *)v260 != v149) {
          objc_enumerationMutation(v146);
        }
        v151 = *(void **)(*((void *)&v259 + 1) + 8 * m);
        v152 = [v151 url];
        v153 = [v152 path];
        [v145 setObject:v151 forKey:v153];
      }
      uint64_t v148 = [v146 countByEnumeratingWithState:&v259 objects:v284 count:16];
    }
    while (v148);
  }

  v154 = objc_opt_new();
  v254[0] = MEMORY[0x263EF8330];
  v254[1] = 3221225472;
  v254[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_4;
  v254[3] = &unk_2643056E0;
  id v255 = v145;
  id v155 = v104;
  id v256 = v155;
  id v257 = v154;
  id v258 = v250;
  id v251 = v250;
  id v222 = v154;
  id v223 = v145;
  [v226 enumerateKeysAndObjectsUsingBlock:v254];
  __uint64_t v156 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v252[0] = MEMORY[0x263EF8330];
  v252[1] = 3221225472;
  v252[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_5;
  v252[3] = &unk_264305708;
  id v253 = v155;
  id v157 = v155;
  [v222 enumerateKeysAndObjectsUsingBlock:v252];
  __uint64_t v158 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [a1 fixClonesInPhotosAndMessages:v157];
  __uint64_t v159 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, @"%0.3f secs: load app records", v160, v161, v162, v163, v164, v165, COERCE__INT64((double)(uint64_t)(v238 - v239) / 1000000000.0));
  STLog(1, @"%0.3f secs: build app objects", v166, v167, v168, v169, v170, v171, COERCE__INT64((double)(uint64_t)(v234 - v238) / 1000000000.0));
  STLog(1, @"%0.3f secs: add pluginkit sizes", v172, v173, v174, v175, v176, v177, COERCE__INT64((double)(uint64_t)(v232 - v234) / 1000000000.0));
  STLog(1, @"%0.3f secs: size apps", v178, v179, v180, v181, v182, v183, COERCE__INT64((double)(uint64_t)(v229 - v232) / 1000000000.0));
  STLog(1, @"%0.3f secs: size extern data", v184, v185, v186, v187, v188, v189, COERCE__INT64((double)(uint64_t)(v227 - v229) / 1000000000.0));
  STLog(1, @"%0.3f secs: add file providers", v190, v191, v192, v193, v194, v195, COERCE__INT64((double)(uint64_t)(v224 - v227) / 1000000000.0));
  STLog(1, @"%0.3f secs: add system updates", v196, v197, v198, v199, v200, v201, COERCE__INT64((double)(uint64_t)(v156 - v224) / 1000000000.0));
  STLog(1, @"%0.3f secs: add pseudo apps", v202, v203, v204, v205, v206, v207, COERCE__INT64((double)(uint64_t)(v158 - v156) / 1000000000.0));
  STLog(1, @"%0.3f secs: apply fixes", v208, v209, v210, v211, v212, v213, COERCE__INT64((double)(uint64_t)(v159 - v158) / 1000000000.0));
  STLog(1, @"%0.3f secs: load apps total", v214, v215, v216, v217, v218, v219, COERCE__INT64((double)(uint64_t)(v159 - v239) / 1000000000.0));
  v220 = [v157 allValues];

  return v220;
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [v4 setAssetPurgeableSize:STMSizeOfPurgeableAssets(a2)];
}

id __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return getOrCreateApp(*(void **)(a1 + 32), a2, a3);
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 objectForKeyedSubscript:v7];
  getOrCreateApp(v4, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setExternalSizes:v6];
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v81 = [*(id *)(a1 + 32) objectForKey:v5];
  if (v81)
  {
    if ([v6 count])
    {
      id v7 = [v81 identifier];
      char v8 = [v7 isEqualToString:@"group.com.apple.FileProvider.LocalStorage"];

      if ((v8 & 1) == 0)
      {
        uint64_t v78 = v5;
        char v80 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        uint64_t v79 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v77 = v6;
        id v9 = v6;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v86 objects:v92 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v87;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v87 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v86 + 1) + 8 * i);
              v15 = [*(id *)(a1 + 40) objectForKey:v14];
              if (v15)
              {
                uint64_t v16 = a1;
                uint64_t v17 = +[STAppOverrides overridesFor:v14];
                id v18 = [v17 includeContainers];

                uint64_t v19 = [v81 identifier];
                char v20 = [v18 containsObject:v19];

                if (v20)
                {
                  uint64_t v31 = [v81 identifier];
                  STLog(1, @"Overriding association between container %@ and app %@", v32, v33, v34, v35, v36, v37, (uint64_t)v31);

                  AddToMultiDict(*(void **)(v16 + 48), v14, v81);
                  goto LABEL_21;
                }
                [v80 addObject:v15];
                if ([v15 userVisible]) {
                  [v79 addObject:v15];
                }

                a1 = v16;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v86 objects:v92 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v21 = [v79 count];
        if (v21 == 1)
        {
          uint64_t v38 = [v81 identifier];
          v39 = [v79 firstObject];
          uint64_t v75 = [v39 bundleIdentifier];
          STLog(1, @"Associating container %@ to %@", v40, v41, v42, v43, v44, v45, (uint64_t)v38);

          v46 = *(void **)(a1 + 48);
          id v9 = [v79 firstObject];
          v15 = [v9 bundleIdentifier];
          AddToMultiDict(v46, v15, v81);
LABEL_21:
          id v5 = v78;
        }
        else
        {
          if (!v21)
          {
            id v6 = v77;
            id v5 = v78;
            if (![v80 count])
            {
LABEL_24:

              goto LABEL_25;
            }
            long long v22 = [v81 identifier];
            uint64_t v23 = [v80 firstObject];
            uint64_t v74 = [v23 bundleIdentifier];
            STLog(1, @"No visible apps claim the container %@, associating to %@", v24, v25, v26, v27, v28, v29, (uint64_t)v22);

            uint64_t v30 = *(void **)(a1 + 48);
            id v9 = [v80 firstObject];
            v15 = [v9 bundleIdentifier];
            AddToMultiDict(v30, v15, v81);
LABEL_23:

            goto LABEL_24;
          }
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v47 = v79;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v82 objects:v91 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v83;
            while (2)
            {
              for (uint64_t j = 0; j != v49; ++j)
              {
                if (*(void *)v83 != v50) {
                  objc_enumerationMutation(v47);
                }
                v52 = *(void **)(*((void *)&v82 + 1) + 8 * j);
                v53 = [v81 identifier];
                v54 = [v52 bundleIdentifier];
                int v55 = [v53 hasSuffix:v54];

                if (v55)
                {
                  v57 = [v81 identifier];
                  uint64_t v76 = [v52 bundleIdentifier];
                  STLog(1, @"Force associating container %@ to %@", v58, v59, v60, v61, v62, v63, (uint64_t)v57);

                  v64 = *(void **)(a1 + 48);
                  v15 = [v52 bundleIdentifier];
                  AddToMultiDict(v64, v15, v81);
                  id v9 = v47;
                  goto LABEL_21;
                }
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v82 objects:v91 count:16];
              if (v49) {
                continue;
              }
              break;
            }
          }

          id v5 = v78;
          id v9 = [v78 lastPathComponent];
          uint64_t v56 = [*(id *)(a1 + 56) objectForKey:v9];
          if (!v56)
          {
            if ([v47 count]) {
              v65 = v47;
            }
            else {
              v65 = v80;
            }
            v15 = MakePseudoAppForContainer(v9, v65);
            v90 = v81;
            uint64_t v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
            [v15 setSharedContainers:v66];

            v67 = [v81 identifier];
            id v6 = v77;
            if (![v47 count]) {
              [v80 count];
            }
            STLog(1, @"Creating fake app for group container %@, %ld owners", v68, v69, v70, v71, v72, v73, (uint64_t)v67);

            [*(id *)(a1 + 40) setObject:v15 forKey:v9];
            goto LABEL_23;
          }
          v15 = (void *)v56;
          [*(id *)(a1 + 40) setObject:v56 forKey:v9];
        }
        id v6 = v77;
        goto LABEL_23;
      }
    }
  }
LABEL_25:
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  id v6 = v5;
  if (v5) {
    [v5 setSharedContainers:v7];
  }
}

+ (void)fixClonesInPhotosAndMessages:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = STMSizesOfClones(@"/private/var/mobile/Library/SMS/Attachments/");
  id v5 = STMSizesOfClones(@"/private/var/mobile/Library/Photos/Libraries/Syndication.photoslibrary/");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        uint64_t v14 = v13;
        if (v13)
        {
          v10 += [v13 unsignedLongLongValue];
          uint64_t v9 = (v9 + 1);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  uint64_t v26 = STFormattedSize(v10);
  STLog(4, @"fix applied: message/photos: %u shared clones using %@", v15, v16, v17, v18, v19, v20, v9);

  uint64_t v21 = [v3 objectForKeyedSubscript:@"com.apple.mobileslideshow"];
  long long v22 = [v21 externalSizes];
  uint64_t v23 = +[STSizeVector purgeable:v10];
  uint64_t v24 = [v22 plus:v23];
  uint64_t v25 = [v3 objectForKeyedSubscript:@"com.apple.mobileslideshow"];
  [v25 setExternalSizes:v24];
}

@end