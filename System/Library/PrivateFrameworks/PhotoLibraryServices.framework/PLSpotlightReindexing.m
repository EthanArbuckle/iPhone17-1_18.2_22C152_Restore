@interface PLSpotlightReindexing
+ (BOOL)shouldReindexAllItemsForLibraryIdentifier:(int64_t)a3;
+ (id)_deleteFileInDirectoryURL:(id)a3;
+ (id)_mutableReindexingDictionaryInDirectoryURL:(id)a3;
+ (id)_recordReindexAllItemsForBundleID:(id)a3 directoryURL:(id)a4 reindexReason:(id)a5;
+ (id)_recordReindexIdentifiersWithIdentifiers:(id)a3 bundleID:(id)a4 directoryURL:(id)a5;
+ (id)_searchDirectoryURL;
+ (id)_writeReindexingDictionary:(id)a3 toDirectoryURL:(id)a4;
+ (id)deleteFile;
+ (id)eraseReindexIdentifiers;
+ (id)recordReindexAllItemsForBundleID:(id)a3 reindexReason:(id)a4;
+ (id)recordReindexIdentifiersWithIdentifiers:(id)a3 bundleID:(id)a4;
+ (id)reindexIdentifiers;
+ (id)spotlightReasonForReindexingAllItemsForLibraryIdentifier:(int64_t)a3;
+ (void)drainSpotlightReindexIdentifiersIfNeededForLibrary:(id)a3;
@end

@implementation PLSpotlightReindexing

+ (id)_writeReindexingDictionary:(id)a3 toDirectoryURL:(id)a4
{
  id v5 = a4;
  id v20 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v20];
  id v7 = v20;
  if (v6)
  {
    v8 = [v5 URLByAppendingPathComponent:@"spotlightProgress.plist"];
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = 0;
    char v10 = [v9 removeItemAtURL:v8 error:&v19];
    id v11 = v19;

    if (v10 & 1) != 0 || (PLIsErrorFileNotFound())
    {
      id v18 = 0;
      int v12 = [v6 writeToURL:v8 options:1073741825 error:&v18];
      id v13 = v18;
      v14 = (void *)MEMORY[0x1E4F8B9B8];
      if (v12)
      {
        v15 = [MEMORY[0x1E4F1CA98] null];
        v16 = [v14 successWithResult:v15];
      }
      else
      {
        v16 = [MEMORY[0x1E4F8B9B8] failureWithError:v13];
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F8B9B8] failureWithError:v11];
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F8B9B8] failureWithError:v7];
  }

  return v16;
}

+ (id)_mutableReindexingDictionaryInDirectoryURL:(id)a3
{
  v3 = [a3 URLByAppendingPathComponent:@"spotlightProgress.plist"];
  id v9 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v3 error:&v9];
  id v5 = v9;
  if (PLIsErrorFileNotFound())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    v4 = v6;
  }
  if (v4) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v4];
  }
  else {
  id v7 = [MEMORY[0x1E4F8B9B8] failureWithError:v5];
  }

  return v7;
}

+ (id)_recordReindexIdentifiersWithIdentifiers:(id)a3 bundleID:(id)a4 directoryURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a1 _mutableReindexingDictionaryInDirectoryURL:v8];
  if ([v9 isFailure])
  {
    id v10 = v9;
  }
  else
  {
    id v11 = [v9 result];
    int v12 = [v11 objectForKeyedSubscript:@"PLReindexAllEntries"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4F8B9B8];
      v15 = [MEMORY[0x1E4F1CA98] null];
      id v10 = [v14 successWithResult:v15];
    }
    else
    {
      v15 = [v11 objectForKeyedSubscript:@"PLReindexIdentifiers"];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v17 = v16;
      if (v15) {
        [v16 addObjectsFromArray:v15];
      }
      [v17 addObjectsFromArray:v7];
      id v18 = [v17 allObjects];
      [v11 setObject:v18 forKeyedSubscript:@"PLReindexIdentifiers"];

      id v10 = [a1 _writeReindexingDictionary:v11 toDirectoryURL:v8];
    }
  }

  return v10;
}

+ (id)_recordReindexAllItemsForBundleID:(id)a3 directoryURL:(id)a4 reindexReason:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  if ([v7 length])
  {
    v18[0] = @"PLReindexAllEntries";
    v18[1] = @"PLReindexAllEntriesReason";
    v19[0] = MEMORY[0x1E4F1CC38];
    v19[1] = v7;
    id v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = v19;
    id v11 = (__CFString **)v18;
    uint64_t v12 = 2;
  }
  else
  {
    id v16 = @"PLReindexAllEntries";
    uint64_t v17 = MEMORY[0x1E4F1CC38];
    id v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = &v17;
    id v11 = &v16;
    uint64_t v12 = 1;
  }
  int v13 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
  v14 = [a1 _writeReindexingDictionary:v13 toDirectoryURL:v8];

  return v14;
}

+ (id)_deleteFileInDirectoryURL:(id)a3
{
  v3 = [a3 URLByAppendingPathComponent:@"spotlightProgress.plist"];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  char v5 = [v4 removeItemAtURL:v3 error:&v11];
  id v6 = v11;

  if ((v5 & 1) != 0 || PLIsErrorFileNotFound())
  {
    id v7 = (void *)MEMORY[0x1E4F8B9B8];
    id v8 = [MEMORY[0x1E4F1CA98] null];
    id v9 = [v7 successWithResult:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
  }

  return v9;
}

+ (id)_searchDirectoryURL
{
  v2 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:1];
  v3 = +[PLPhotoLibraryBundleController sharedBundleController];
  v4 = [v3 lookupOrCreateBundleForLibraryURL:v2];

  char v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [v4 pathManager];
  id v7 = [v6 searchIndexDirectory];
  id v8 = [v5 fileURLWithPath:v7 isDirectory:1];

  return v8;
}

+ (void)drainSpotlightReindexIdentifiersIfNeededForLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 libraryServicesManager];
  uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

  if (v5 != 3
    && !+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:v5])
  {
    id v6 = +[PLSpotlightReindexing reindexIdentifiers];
    if ([v6 isFailure])
    {
      id v7 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v6 error];
        *(_DWORD *)buf = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to load spotlight reindex identifiers with error: %@", buf, 0xCu);
      }
    }
    else
    {
      id v9 = [v6 result];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __76__PLSpotlightReindexing_drainSpotlightReindexIdentifiersIfNeededForLibrary___block_invoke;
      v15 = &unk_1E5875E18;
      id v16 = v6;
      id v17 = v3;
      [v17 performTransactionAndWait:&v12];
      id v11 = +[PLSpotlightReindexing eraseReindexIdentifiers];

      id v7 = v16;
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __76__PLSpotlightReindexing_drainSpotlightReindexIdentifiersIfNeededForLibrary___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) result];
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "Adding jobs for reindexing identifiers for Spotlight reindex request: %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "result", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        uint64_t v10 = [*(id *)(a1 + 40) managedObjectContext];
        id v11 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v9 flags:236 managedObjectContext:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

+ (id)eraseReindexIdentifiers
{
  id v3 = [a1 _searchDirectoryURL];
  v4 = [a1 _mutableReindexingDictionaryInDirectoryURL:v3];

  if ([v4 isFailure])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v6 = [v4 error];
    uint64_t v7 = [v5 failureWithError:v6];
  }
  else
  {
    uint64_t v6 = [v4 result];
    [v6 setObject:0 forKeyedSubscript:@"PLReindexIdentifiers"];
    uint64_t v8 = [a1 _searchDirectoryURL];
    uint64_t v7 = [a1 _writeReindexingDictionary:v6 toDirectoryURL:v8];
  }
  return v7;
}

+ (id)reindexIdentifiers
{
  id v3 = [a1 _searchDirectoryURL];
  v4 = [a1 _mutableReindexingDictionaryInDirectoryURL:v3];

  if ([v4 isFailure])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v6 = [v4 error];
    uint64_t v7 = [v5 failureWithError:v6];
  }
  else
  {
    uint64_t v6 = [v4 result];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"PLReindexIdentifiers"];
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v7 = [MEMORY[0x1E4F8B9B8] successWithResult:v9];
  }
  return v7;
}

+ (id)spotlightReasonForReindexingAllItemsForLibraryIdentifier:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(a1, "_searchDirectoryURL", a3);
  uint64_t v5 = [a1 _mutableReindexingDictionaryInDirectoryURL:v4];

  if ([v5 isSuccess])
  {
    uint64_t v6 = [v5 result];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"PLReindexAllEntriesReason"];
  }
  else
  {
    uint64_t v8 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 error];
      int v11 = 138412290;
      long long v12 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to read Spotlight's reason for reindexing all items: %@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldReindexAllItemsForLibraryIdentifier:(int64_t)a3
{
  if (a3 == 3
    || +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:"))
  {
    return 0;
  }
  uint64_t v5 = [a1 _searchDirectoryURL];
  uint64_t v6 = [a1 _mutableReindexingDictionaryInDirectoryURL:v5];

  if ([v6 isSuccess])
  {
    uint64_t v7 = [v6 result];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"PLReindexAllEntries"];
    char v4 = [v8 BOOLValue];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (id)recordReindexIdentifiersWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 _searchDirectoryURL];
  uint64_t v9 = [a1 _recordReindexIdentifiersWithIdentifiers:v7 bundleID:v6 directoryURL:v8];

  return v9;
}

+ (id)recordReindexAllItemsForBundleID:(id)a3 reindexReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 _searchDirectoryURL];
  uint64_t v9 = [a1 _recordReindexAllItemsForBundleID:v7 directoryURL:v8 reindexReason:v6];

  return v9;
}

+ (id)deleteFile
{
  id v3 = [a1 _searchDirectoryURL];
  char v4 = [a1 _deleteFileInDirectoryURL:v3];

  return v4;
}

@end