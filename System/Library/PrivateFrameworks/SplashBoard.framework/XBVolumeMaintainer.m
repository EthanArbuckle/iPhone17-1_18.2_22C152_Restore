@interface XBVolumeMaintainer
+ (void)configure:(id)a3;
@end

@implementation XBVolumeMaintainer

+ (void)configure:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__XBVolumeMaintainer_configure___block_invoke;
  block[3] = &unk_2646A5938;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __32__XBVolumeMaintainer_configure___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __32__XBVolumeMaintainer_configure___block_invoke_2;
  handler[3] = &unk_2646A5E50;
  id v4 = *(id *)(a1 + 32);
  xpc_activity_register("com.apple.SplashBoard", v2, handler);
}

void __32__XBVolumeMaintainer_configure___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = [MEMORY[0x263EFF910] date];
  id v3 = [v2 dateByAddingTimeInterval:-259200.0];

  v27 = [MEMORY[0x263EFF910] now];
  v28 = v3;
  uint64_t v4 = __32__XBVolumeMaintainer_configure___block_invoke_3((uint64_t)v27, v3, v27);
  id v5 = [*(id *)(a1 + 32) recentlyUsedBundleIDs];
  unint64_t v6 = [v5 count];
  if (v6 >= 0xA) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = v6;
  }
  v25 = v5;
  uint64_t v8 = objc_msgSend(v5, "subarrayWithRange:", 0, v7);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v24 = (void *)v8;
  [v9 addObjectsFromArray:v8];
  v26 = (void *)v4;
  [v9 addObjectsFromArray:v4];
  v10 = [*(id *)(a1 + 32) allInstalledApplications];
  v23 = v9;
  v11 = [v9 allObjects];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v18 = [v17 bundleIdentifier];
        uint64_t v19 = [v11 containsObject:v18];
        v20 = XBLogPurge();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v21 = @"uncommon";
          if (v19) {
            v21 = @"recent";
          }
          v34 = v18;
          __int16 v35 = 2114;
          v36 = v21;
          _os_log_impl(&dword_2232AB000, v20, OS_LOG_TYPE_DEFAULT, "Marking %{public}@ as %{public}@", buf, 0x16u);
        }

        v22 = [[XBApplicationSnapshotManifest alloc] initWithApplicationInfo:v17];
        [(XBApplicationSnapshotManifest *)v22 updateSnapshotsAPFSPurgability:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v14);
  }
}

id __32__XBVolumeMaintainer_configure___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v58[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v42 = MEMORY[0x223CB2D30]();
  id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  uint64_t v7 = (void *)MEMORY[0x263F08730];
  uint64_t v8 = (void *)MEMORY[0x263F35110];
  id v9 = [MEMORY[0x263F35028] extensionHostIdentifier];
  v10 = [v8 predicateForObjectsWithMetadataKey:v9];
  uint64_t v11 = [v7 notPredicateWithSubpredicate:v10];

  id v43 = v5;
  id v44 = v4;
  uint64_t v12 = [MEMORY[0x263F35110] predicateForEventsWithStartInDateRangeFrom:v4 to:v5];
  uint64_t v13 = (void *)MEMORY[0x263F08730];
  v40 = (void *)v12;
  v41 = (void *)v11;
  v58[0] = v12;
  v58[1] = v11;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  v46 = [v13 andPredicateWithSubpredicates:v14];

  v45 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:0];
  id v15 = 0;
  uint64_t v16 = 0;
  while (1)
  {
    v17 = (void *)MEMORY[0x223CB2D30]();
    v18 = (void *)MEMORY[0x263F35090];
    uint64_t v19 = [MEMORY[0x263F35148] appUsageStream];
    v57 = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    v56 = v45;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    v22 = [v18 eventQueryWithPredicate:v46 eventStreams:v20 offset:v16 limit:32 sortDescriptors:v21];

    v23 = [MEMORY[0x263F350B8] knowledgeStore];
    id v52 = 0;
    v24 = [v23 executeQuery:v22 error:&v52];
    id v25 = v52;

    if (v25) {
      break;
    }
    context = v17;
    uint64_t v26 = [v24 count];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v15 = v24;
    uint64_t v27 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v49 != v29) {
            objc_enumerationMutation(v15);
          }
          long long v31 = [*(id *)(*((void *)&v48 + 1) + 8 * i) stringValue];
          if (v31) {
            [v6 addObject:v31];
          }
        }
        uint64_t v28 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v28);
    }
    v16 += v26;

    if ([v15 count] != 32)
    {
      long long v32 = [v6 array];
      v34 = v43;
      v33 = v44;
      v36 = v41;
      __int16 v35 = (void *)v42;
      v37 = v40;
      goto LABEL_17;
    }
  }
  uint64_t v38 = XBLogPurge();
  v37 = v40;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v55 = v25;
    _os_log_impl(&dword_2232AB000, v38, OS_LOG_TYPE_DEFAULT, "Failed to obtain recently used applications with error: %{public}@", buf, 0xCu);
  }

  long long v32 = (void *)MEMORY[0x263EFFA68];
  v34 = v43;
  v33 = v44;
  v36 = v41;
  __int16 v35 = (void *)v42;
LABEL_17:

  return v32;
}

@end