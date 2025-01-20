@interface MIPMultiverseIdentifier(NanoMusicSync)
+ (id)_multiverseIdentifiersWithPIDs:()NanoMusicSync groupingType:;
+ (id)_pidsFromSyncIDs:()NanoMusicSync containerClass:;
+ (id)midDataArrayFromAlbumSyncIDs:()NanoMusicSync;
+ (id)midDataArrayFromPlaylistSyncIDs:()NanoMusicSync;
+ (id)midDataFromAlbumPID:()NanoMusicSync;
+ (id)midDataFromPlaylistPID:()NanoMusicSync;
+ (id)midDataFromPlaylistSyncID:()NanoMusicSync;
+ (id)pidFromMIDData:()NanoMusicSync;
+ (id)pidsFromMIDDataArray:()NanoMusicSync;
+ (uint64_t)midDataArrayFromAlbumPIDs:()NanoMusicSync;
+ (uint64_t)midDataArrayFromPlaylistPIDs:()NanoMusicSync;
@end

@implementation MIPMultiverseIdentifier(NanoMusicSync)

+ (id)midDataArrayFromAlbumSyncIDs:()NanoMusicSync
{
  id v4 = a3;
  v5 = [a1 _pidsFromSyncIDs:v4 containerClass:objc_opt_class()];

  v6 = [a1 _multiverseIdentifiersWithPIDs:v5 groupingType:1];

  return v6;
}

+ (id)midDataArrayFromPlaylistSyncIDs:()NanoMusicSync
{
  id v4 = a3;
  v5 = [a1 _pidsFromSyncIDs:v4 containerClass:objc_opt_class()];

  v6 = [a1 _multiverseIdentifiersWithPIDs:v5 groupingType:6];

  return v6;
}

+ (id)midDataFromPlaylistSyncID:()NanoMusicSync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v10 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v10 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  v7 = objc_msgSend(a1, "midDataArrayFromPlaylistSyncIDs:", v6, v10, v11);
  v8 = [v7 firstObject];

  return v8;
}

+ (uint64_t)midDataArrayFromAlbumPIDs:()NanoMusicSync
{
  return [a1 _multiverseIdentifiersWithPIDs:a3 groupingType:1];
}

+ (uint64_t)midDataArrayFromPlaylistPIDs:()NanoMusicSync
{
  return [a1 _multiverseIdentifiersWithPIDs:a3 groupingType:6];
}

+ (id)midDataFromAlbumPID:()NanoMusicSync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v10 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v10 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  v7 = objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", v6, 1, v10, v11);
  v8 = [v7 firstObject];

  return v8;
}

+ (id)midDataFromPlaylistPID:()NanoMusicSync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v10 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v10 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  v7 = objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", v6, 6, v10, v11);
  v8 = [v7 firstObject];

  return v8;
}

+ (id)pidFromMIDData:()NanoMusicSync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v10 = a3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v10 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  v7 = objc_msgSend(a1, "pidsFromMIDDataArray:", v6, v10, v11);
  v8 = [v7 firstObject];

  return v8;
}

+ (id)pidsFromMIDDataArray:()NanoMusicSync
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)[objc_alloc(MEMORY[0x263F573E8]) initWithData:*(void *)(*((void *)&v18 + 1) + 8 * v9)];
        uint64_t v11 = [MEMORY[0x263F11E40] defaultMediaLibrary];
        v12 = [v11 entityWithMultiverseIdentifier:v10];

        if (v12)
        {
          uint64_t v13 = [v12 persistentID];
          v14 = [NSNumber numberWithLongLong:v13];
          [v4 addObject:v14];

          v15 = NMLogForCategory(5);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v23 = v13;
            __int16 v24 = 2114;
            v25 = v10;
            _os_log_impl(&dword_2228FD000, v15, OS_LOG_TYPE_INFO, "[NMSyncDefaults] Found PID %lld which matches MID %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v15 = NMLogForCategory(5);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v23 = (uint64_t)v10;
            _os_log_error_impl(&dword_2228FD000, v15, OS_LOG_TYPE_ERROR, "[NMSyncDefaults] Failed to create entity->PID for MID: %{public}@", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  v16 = (void *)[v4 copy];

  return v16;
}

+ (id)_multiverseIdentifiersWithPIDs:()NanoMusicSync groupingType:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138543618;
    long long v20 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        v14 = objc_msgSend(MEMORY[0x263F11E40], "defaultMediaLibrary", v20, (void)v21);
        v15 = objc_msgSend(v14, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", objc_msgSend(v13, "longLongValue"), a4);

        if (v15)
        {
          v16 = [v15 data];
          [v6 addObject:v16];

          v17 = NMLogForCategory(5);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v26 = v15;
            __int16 v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_2228FD000, v17, OS_LOG_TYPE_INFO, "[NMSyncDefaults] Created MID %{public}@ for PID %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v17 = NMLogForCategory(5);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = v13;
            __int16 v27 = 2048;
            v28 = a4;
            _os_log_error_impl(&dword_2228FD000, v17, OS_LOG_TYPE_ERROR, "[NMSyncDefaults] Failed to create multiverse id for pid: %{public}@, type: %ld", buf, 0x16u);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[v6 copy];

  return v18;
}

+ (id)_pidsFromSyncIDs:()NanoMusicSync containerClass:
{
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (objc_opt_class() == a4)
  {
    uint64_t v8 = (id *)MEMORY[0x263F57370];
  }
  else
  {
    if (objc_opt_class() != a4)
    {
      id v6 = 0;
      int v7 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = (id *)MEMORY[0x263F57300];
  }
  id v6 = *v8;
  int v7 = 1;
LABEL_7:
  long long v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  if (v7)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v11 = [MEMORY[0x263F57428] predicateWithProperty:v6 values:v5];
    uint64_t v12 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
    long long v24 = (void *)v11;
    uint64_t v13 = [a4 unrestrictedQueryWithLibrary:v12 predicate:v11 orderingTerms:0];

    v32[0] = v6;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __74__MIPMultiverseIdentifier_NanoMusicSync___pidsFromSyncIDs_containerClass___block_invoke;
    v29[3] = &unk_264634858;
    id v15 = v10;
    id v30 = v15;
    [v13 enumeratePersistentIDsAndProperties:v14 usingBlock:v29];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          if (v21) {
            [v9 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v18);
    }
  }
  long long v22 = (void *)[v9 copy];

  return v22;
}

@end