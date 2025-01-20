@interface PGGraphMemoryProcessorHelper
+ (id)_fetchLocalMemoriesWithFetchOptions:(id)a3;
+ (id)_localMemoryByUniqueIdentifierInPhotoLibrary:(id)a3 withAdditionalPredicate:(id)a4;
+ (id)localMemoryByUniqueIdentifierForMemoryUUIDs:(id)a3 inPhotoLibrary:(id)a4;
+ (id)localMemoryByUniqueIdentifierInPhotoLibrary:(id)a3;
+ (id)localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:(id)a3 inPhotoLibrary:(id)a4;
+ (void)resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:(id)a3 inPhotoLibrary:(id)a4;
+ (void)resetLocalMemoryLastEnrichmentDateOfMemoriesWithUniqueIdentifiers:(id)a3 localMemoryByUniqueIdentifierCache:(id)a4 inPhotoLibrary:(id)a5;
@end

@implementation PGGraphMemoryProcessorHelper

+ (void)resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__PGGraphMemoryProcessorHelper_resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories_inPhotoLibrary___block_invoke;
    v17[3] = &unk_1E68F0B18;
    id v7 = v5;
    id v18 = v7;
    id v16 = 0;
    int v8 = [v6 performChangesAndWait:v17 error:&v16];
    id v9 = v16;
    v10 = +[PGLogging sharedLogging];
    v11 = [v10 loggingConnection];

    v12 = v11;
    v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v7 count];
        *(_DWORD *)buf = 67109120;
        int v20 = v14;
        _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoryProcessorHelper] Successfully reset %d local memories", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v7 count];
      *(_DWORD *)buf = 67109378;
      int v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGGraphMemoryProcessorHelper] Failed to reset %d local memories, error=%@", buf, 0x12u);
    }
  }
}

void __109__PGGraphMemoryProcessorHelper_resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories_inPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x1E4F39170], "changeRequestForMemory:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setLastEnrichmentDate:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (void)resetLocalMemoryLastEnrichmentDateOfMemoriesWithUniqueIdentifiers:(id)a3 localMemoryByUniqueIdentifierCache:(id)a4 inPhotoLibrary:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    long long v10 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v15), (void)v17);
          if (v16) {
            [v10 addObject:v16];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    [(id)objc_opt_class() resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:v10 inPhotoLibrary:v9];
  }
}

+ (id)_fetchLocalMemoriesWithFetchOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[PGLogging sharedLogging];
  uint64_t v5 = [v4 loggingConnection];

  id v16 = v3;
  id v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [v13 graphMemoryIdentifier];
        if (v14)
        {
          [v7 setObject:v13 forKeyedSubscript:v14];
        }
        else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v13;
          _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[PGGraphMemoryProcessorHelper] graphMemoryIdentifier is nil for %@", buf, 0xCu);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)_localMemoryByUniqueIdentifierInPhotoLibrary:(id)a3 withAdditionalPredicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"pendingState", 2);
  [v7 addObject:v8];

  if (v6) {
    [v7 addObject:v6];
  }
  uint64_t v9 = [v5 librarySpecificFetchOptions];
  [v9 setIncludeLocalMemories:1];
  [v9 setIncludeRejectedMemories:1];
  uint64_t v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  [v9 setInternalPredicate:v10];

  uint64_t v11 = [(id)objc_opt_class() _fetchLocalMemoriesWithFetchOptions:v9];

  return v11;
}

+ (id)localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"graphMemoryIdentifier", v6];
    uint64_t v9 = [a1 _localMemoryByUniqueIdentifierInPhotoLibrary:v7 withAdditionalPredicate:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

+ (id)localMemoryByUniqueIdentifierForMemoryUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v6];
    uint64_t v9 = [a1 _localMemoryByUniqueIdentifierInPhotoLibrary:v7 withAdditionalPredicate:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

+ (id)localMemoryByUniqueIdentifierInPhotoLibrary:(id)a3
{
  return (id)[a1 _localMemoryByUniqueIdentifierInPhotoLibrary:a3 withAdditionalPredicate:0];
}

@end