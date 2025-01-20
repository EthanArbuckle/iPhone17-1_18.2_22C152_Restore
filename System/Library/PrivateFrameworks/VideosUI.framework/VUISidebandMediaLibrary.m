@interface VUISidebandMediaLibrary
+ (void)initialize;
+ (void)setDeleteAllVideosAndKeysOnInitializationForAppRemoval:(BOOL)a3;
- (BOOL)_invalidateKeysForVideoManagedObject:(id)a3 saveWhenDone:(BOOL)a4 invalidateImmediately:(BOOL)a5;
- (BOOL)_removeDownloadedMediaForVideoManagedObject:(id)a3 markAsDeleted:(BOOL)a4 saveWhenDone:(BOOL)a5 invalidateImmediately:(BOOL)a6;
- (BOOL)hasDownloadingVideosWithSeasonCanonicalId:(id)a3;
- (NSManagedObjectContext)backgroundManagedObjectContext;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)serialQueue;
- (VUISidebandMediaLibrary)initWithManager:(id)a3;
- (id)_availableComingSoonVideos;
- (id)_comingSoonVideoForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_downloadedVideosForNonSignedInUsers;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)_mainContextManagedObjectsForObjects:(id)a3;
- (id)_managedObjectWithEntityName:(id)a3 predicate:(id)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6;
- (id)_movieForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_objectsWithFetchRequest:(id)a3 usingMainThreadContext:(BOOL)a4;
- (id)_tvEpisodeForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_tvSeasonForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_tvSeasonForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_tvSeriesForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_tvSeriesForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5;
- (id)_videosMarkedAsDeleted;
- (id)allFpsKeyDeletionInfos;
- (id)comingSoonObjectWithCanonicalID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4;
- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3;
- (id)episodesWithDownloadStates:(id)a3 seasonCanonicalId:(id)a4 usingMainThreadContext:(BOOL)a5;
- (id)episodesWithDownloadStates:(id)a3 showCanonicalId:(id)a4 usingMainThreadContext:(BOOL)a5;
- (id)episodesWithSeasonCanonicalIds:(id)a3 usingMainThreadContext:(BOOL)a4;
- (id)existingFpsKeyInfoForKeyURI:(id)a3;
- (id)fpsKeyInfoForVideo:(id)a3 keyURI:(id)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6;
- (id)imageInfoForSeries:(id)a3 imageType:(unint64_t)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6;
- (id)imageInfoForVideo:(id)a3 imageType:(unint64_t)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6;
- (id)mainContextVideoForVideo:(id)a3;
- (id)performFetch:(id)a3;
- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4;
- (id)seasonForCanonicalIDOrAdamID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)seriesForCanonicalIDOrAdamID:(id)a3;
- (id)title;
- (id)videoForAdamID:(id)a3 useMainThreadContext:(BOOL)a4;
- (id)videoForMPMediaItem:(id)a3;
- (id)videoForPlayable:(id)a3;
- (id)videosForAdamIDs:(id)a3 useMainThreadContext:(BOOL)a4;
- (id)videosWithDownloadState:(int64_t)a3 entitlementTypes:(id)a4 sortDescriptors:(id)a5 useMainThreadContext:(BOOL)a6;
- (id)videosWithDownloadStates:(id)a3 entitlementTypes:(id)a4 sortDescriptors:(id)a5 useMainThreadContext:(BOOL)a6;
- (id)videosWithExpiredDownloadsUsingMainThreadContext:(BOOL)a3;
- (unint64_t)_countForFetchRequest:(id)a3 usingMainThreadContext:(BOOL)a4;
- (unint64_t)countOfComingSoonVideosWithSeasonCanonicalId:(id)a3;
- (unint64_t)countOfComingSoonVideosWithShowCanonicalId:(id)a3;
- (unint64_t)countOfDownloadedOrDownloadingOrEnqueuedSubscriptionVideosForNonMainQueue;
- (unint64_t)countOfDownloadedOrDownloadingVideosWithSeasonCanonicalId:(id)a3;
- (unint64_t)countOfDownloadedVideosWithSeasonCanonicalId:(id)a3;
- (void)_activeAccountDidChange:(id)a3;
- (void)_deleteComingSoonVideoManagedObjects:(id)a3;
- (void)_deleteOrphanedDownloads;
- (void)_deleteVideoManagedObjects:(id)a3;
- (void)_mainQueueManagedObjectContextDidSave:(id)a3;
- (void)_migrateVideoExpirationDateAndAllowsManualRenewal;
- (void)_pruneVideosAtAppLaunchWithCompletion:(id)a3;
- (void)_removeDownloadsForNonSignedInUsers;
- (void)dealloc;
- (void)deleteFPSKeyDeletionInfo:(id)a3;
- (void)deleteFPSKeyDeletionInfos:(id)a3;
- (void)invalidateKeysForVideoManagedObject:(id)a3;
- (void)invalidateKeysForVideoManagedObjects:(id)a3;
- (void)removeDownloadedMediaForVideoManagedObject:(id)a3 markAsDeleted:(BOOL)a4 invalidateImmediately:(BOOL)a5;
- (void)removeDownloadedMediaForVideoManagedObjects:(id)a3 markAsDeleted:(BOOL)a4 invalidateImmediately:(BOOL)a5;
- (void)saveChangesToManagedObjects;
- (void)setBackgroundManagedObjectContext:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation VUISidebandMediaLibrary

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_261(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3 == [*(id *)(a1 + 40) count])
  {
    v4 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_2;
    v17[3] = &unk_1E6DF5290;
    id v18 = v2;
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 40);
    [v4 enumerateObjectsUsingBlock:v17];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_3;
  block[3] = &unk_1E6DF52B8;
  objc_copyWeak(&v16, (id *)(a1 + 104));
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  v7 = *(void **)(a1 + 88);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v15 = *(id *)(a1 + 96);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v2 = [v1 firstObject];

  if ([v2 length])
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v49 = 0;
    v4 = [v3 contentsOfDirectoryAtPath:v2 error:&v49];
    id v5 = v49;

    uint64_t v6 = &unk_1EBFC8000;
    if (v5 && os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_cold_1();
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v46;
      uint64_t v30 = *(void *)v46;
      v31 = v2;
      do
      {
        uint64_t v10 = 0;
        uint64_t v32 = v8;
        do
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v45 + 1) + 8 * v10);
          if (objc_msgSend(v11, "hasPrefix:", @"com.apple.UserManagedAssets", v30, v31))
          {
            uint64_t v35 = v10;
            id v12 = [v2 stringByAppendingPathComponent:v11];
            uint64_t v13 = *((void *)v6 + 322);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v52 = v12;
              _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Downloads directory path: %@", buf, 0xCu);
            }
            if ([v12 length])
            {

              id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v44 = 0;
              id v15 = [v14 contentsOfDirectoryAtPath:v12 error:&v44];
              id v16 = v44;

              if (v16)
              {
                v17 = *((void *)v6 + 322);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v52 = v16;
                  _os_log_error_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_ERROR, "Unable to retrieve downloads directory contents: %@", buf, 0xCu);
                }
              }
              id v34 = v16;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              id v18 = v15;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v50 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v41 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                    v24 = [v23 pathExtension];
                    if ([v24 isEqualToString:@"movpkg"])
                    {
                    }
                    else
                    {
                      v25 = [v23 pathExtension];
                      int v26 = [v25 isEqualToString:@"m4v"];

                      if (!v26) {
                        continue;
                      }
                    }
                    v27 = [v12 stringByAppendingPathComponent:v23];
                    if ([v27 length])
                    {
                      v28 = sLogObject_2;
                      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v52 = v27;
                        _os_log_debug_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEBUG, "Found download path on file system: %@", buf, 0xCu);
                      }
                      [*(id *)(a1 + 32) addObject:v27];
                    }
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v50 count:16];
                }
                while (v20);
              }

              uint64_t v9 = v30;
              id v2 = v31;
              uint64_t v6 = &unk_1EBFC8000;
              id v5 = v34;
              uint64_t v8 = v32;
            }

            uint64_t v10 = v35;
          }
          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v8);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_253;
  block[3] = &unk_1E6DF3F68;
  int8x16_t v37 = *(int8x16_t *)(a1 + 32);
  id v29 = (id)v37.i64[0];
  int8x16_t v39 = vextq_s8(v37, v37, 8uLL);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__VUISidebandMediaLibrary__countForFetchRequest_usingMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __106__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_sortDescriptors_useMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSManagedObjectContext)backgroundManagedObjectContext
{
  return self->_backgroundManagedObjectContext;
}

void __63__VUISidebandMediaLibrary__downloadedVideosForNonSignedInUsers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __76__VUISidebandMediaLibrary__migrateVideoExpirationDateAndAllowsManualRenewal__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __53__VUISidebandMediaLibrary__availableComingSoonVideos__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __49__VUISidebandMediaLibrary_allFpsKeyDeletionInfos__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __49__VUISidebandMediaLibrary__videosMarkedAsDeleted__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke_65(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) persistentContainer];
  id v7 = (id)[v2 newBackgroundContext];

  [v7 setUndoManager:0];
  [*(id *)(a1 + 32) setBackgroundManagedObjectContext:v7];
  uint64_t v3 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v4 = [v3 viewContext];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUndoManager:0];
}

void __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __106__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_sortDescriptors_useMainThreadContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setBackgroundManagedObjectContext:(id)a3
{
}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v3 addObjectsFromArray:*(void *)(a1 + 32)];
  [v3 addObjectsFromArray:*(void *)(a1 + 40)];
  [v3 addObjectsFromArray:*(void *)(a1 + 48)];
  if (![*(id *)(a1 + 56) count])
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    goto LABEL_27;
  }
  uint64_t v4 = [*(id *)(a1 + 64) _mainContextManagedObjectsForObjects:*(void *)(a1 + 56)];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v5)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = v5;
  id v37 = v3;
  id v38 = WeakRetained;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      id v12 = objc_msgSend(v11, "availabilityEndDate", v37, v38);
      if (![v11 allowsManualRenewal])
      {
        uint64_t v14 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v15 = v14;
          id v16 = "Deleting expired video since it does not allow manual renewal";
          goto LABEL_17;
        }
LABEL_18:
        [*(id *)(a1 + 64) _removeDownloadedMediaForVideoManagedObject:v11 markAsDeleted:0 saveWhenDone:0 invalidateImmediately:1];
        ++v8;
        goto LABEL_19;
      }
      if (v12 && !objc_msgSend(v12, "vui_isInTheFuture"))
      {
        uint64_t v17 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v15 = v17;
          id v16 = "Deleting expired video even though it allows manual renewal, since it is outside the availability window";
LABEL_17:
          _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        }
        goto LABEL_18;
      }
      uint64_t v13 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating (but not deleting) expired video since it allows manual key renewal and is still within availability window", buf, 2u);
      }
      [*(id *)(a1 + 64) _invalidateKeysForVideoManagedObject:v11 saveWhenDone:0 invalidateImmediately:1];
      ++v7;
LABEL_19:
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  }
  while (v6);
  if (v8) {
    [*(id *)(a1 + 64) saveChangesToManagedObjects];
  }
  id v3 = v37;
  id WeakRetained = v38;
LABEL_26:

LABEL_27:
  id v18 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v8;
    _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "On launch, deleted downloads for %lu expired videos", buf, 0xCu);
  }
  uint64_t v19 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v7;
    _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "On launch, invalidated downloads for %lu expired videos", buf, 0xCu);
  }
  uint64_t v20 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    uint64_t v22 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v22;
    _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Will prune %lu managed object(s) on launch, of which:", buf, 0xCu);
  }
  v23 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(void **)(a1 + 32);
    v25 = v23;
    uint64_t v26 = [v24 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v26;
    _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "           %lu object(s) are marked as deleted", buf, 0xCu);
  }
  v27 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(void **)(a1 + 40);
    id v29 = v27;
    uint64_t v30 = [v28 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v30;
    _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "           %lu object(s) have downloads for non-signed-in users", buf, 0xCu);
  }
  v31 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = *(void **)(a1 + 48);
    v33 = v31;
    uint64_t v34 = [v32 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = v34;
    _os_log_impl(&dword_1E2BD7000, v33, OS_LOG_TYPE_DEFAULT, "           %lu object(s) have downloads but the download is missing", buf, 0xCu);
  }
  if ([v3 count])
  {
    uint64_t v35 = [v3 allObjects];
    [WeakRetained _deleteVideoManagedObjects:v35];
  }
  if ([*(id *)(a1 + 72) count]) {
    [WeakRetained _deleteComingSoonVideoManagedObjects:*(void *)(a1 + 72)];
  }
  [*(id *)(a1 + 64) _deleteOrphanedDownloads];
  uint64_t v36 = *(void *)(a1 + 80);
  if (v36) {
    (*(void (**)(void))(v36 + 16))();
  }
}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.SidebandMediaLibrary.Init.ObjectContext", "", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) serialQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __43__VUISidebandMediaLibrary_initWithManager___block_invoke_65;
  uint64_t v13 = &unk_1E6DF4130;
  id v14 = *(id *)(a1 + 32);
  id v15 = &v17;
  dispatch_sync(v3, &v10);

  uint64_t v4 = VUISignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.SidebandMediaLibrary.Init.ObjectContext", "", buf, 2u);
  }

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v10, v11, v12, v13);
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__mainQueueManagedObjectContextDidSave_ name:*MEMORY[0x1E4F1BE20] object:v18[5]];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 40) selector:sel__activeAccountDidChange_ name:*MEMORY[0x1E4FA83B0] object:0];

  [*(id *)(a1 + 32) _postContentsDidChangeNotification];
  uint64_t v7 = +[VUIOfflineKeyRenewalManager sharedInstance];
  [v7 updateKeyRenewalAndExpiration];

  uint64_t v8 = +[VUISecureInvalidationManager sharedInstance];
  [v8 invalidateKeysForDeletedVideos];

  uint64_t v9 = +[VUIDownloadManager sharedInstance];
  [v9 initializeDownloadManager];

  _Block_object_dispose(&v17, 8);
}

- (void)_deleteOrphanedDownloads
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = dispatch_get_global_queue(9, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke;
  v6[3] = &unk_1E6DF3F68;
  id v7 = v3;
  uint64_t v8 = self;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_253(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_2;
  block[3] = &unk_1E6DF4B00;
  uint64_t v14 = a1;
  void block[4] = *(void *)(a1 + 32);
  block[5] = &v24;
  dispatch_sync(v2, block);

  id v3 = [(id)v25[5] executeFetchRequest:v15 error:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "localPlaybackURL", v14);
        uint64_t v10 = [v9 path];

        if (v10)
        {
          uint64_t v11 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v10;
            _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "SidebandMediaLibrary - download path found: %@", buf, 0xCu);
          }
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v32 count:16];
    }
    while (v6);
  }

  id v12 = dispatch_get_global_queue(21, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_254;
  v16[3] = &unk_1E6DF3F68;
  id v17 = *(id *)(v14 + 40);
  id v18 = v4;
  id v13 = v4;
  dispatch_async(v12, v16);

  _Block_object_dispose(&v24, 8);
}

void __106__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_sortDescriptors_useMainThreadContext___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) executeFetchRequest:a1[4] error:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)countOfDownloadedOrDownloadingOrEnqueuedSubscriptionVideosForNonMainQueue
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %ld || %K == %ld || %K == %ld) && (%K == NIL OR %K IN %@)", @"downloadState", 1, @"downloadState", 3, @"downloadState", 2, @"entitlementType", @"entitlementType", &unk_1F3F3E198];
  [v3 setPredicate:v4];
  unint64_t v5 = [(VUISidebandMediaLibrary *)self _countForFetchRequest:v3 usingMainThreadContext:0];

  return v5;
}

- (unint64_t)_countForFetchRequest:(id)a3 usingMainThreadContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  if (v4)
  {
    uint64_t v7 = [(VUISidebandMediaLibrary *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__VUISidebandMediaLibrary__countForFetchRequest_usingMainThreadContext___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v19;
    dispatch_sync(v7, block);

    uint64_t v8 = [(id)v20[5] countForFetchRequest:v6 error:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      v26[3] = v8;
    }
  }
  else
  {
    uint64_t v9 = [(VUISidebandMediaLibrary *)self serialQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__VUISidebandMediaLibrary__countForFetchRequest_usingMainThreadContext___block_invoke_2;
    v17[3] = &unk_1E6DF4B00;
    void v17[4] = self;
    v17[5] = &v19;
    dispatch_sync(v9, v17);

    uint64_t v10 = (void *)v20[5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__VUISidebandMediaLibrary__countForFetchRequest_usingMainThreadContext___block_invoke_3;
    v13[3] = &unk_1E6DF51C8;
    id v15 = &v19;
    id v14 = v6;
    id v16 = &v25;
    [v10 performBlockAndWait:v13];
  }
  unint64_t v11 = v26[3];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

- (id)videosWithExpiredDownloadsUsingMainThreadContext:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES AND %K == NO AND %K == %ld", @"hasExpirationDate", @"markedAsDeleted", @"downloadState", 0);
  [v5 setPredicate:v6];
  uint64_t v7 = [(VUISidebandMediaLibrary *)self _objectsWithFetchRequest:v5 usingMainThreadContext:v3];

  return v7;
}

- (id)_objectsWithFetchRequest:(id)a3 usingMainThreadContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__1;
  uint64_t v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  id v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  [(VUISidebandMediaLibrary *)self serialQueue];
  if (v4) {
    uint64_t v7 = {;
  }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v20;
    dispatch_sync(v7, block);

    uint64_t v8 = [(id)v21[5] executeFetchRequest:v6 error:0];
    uint64_t v9 = (void *)v27[5];
    v27[5] = v8;
  }
  else {
    uint64_t v10 = {;
  }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_2;
    v18[3] = &unk_1E6DF4B00;
    v18[4] = self;
    v18[5] = &v20;
    dispatch_sync(v10, v18);

    unint64_t v11 = (void *)v21[5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_3;
    v14[3] = &unk_1E6DF5150;
    id v16 = &v26;
    id v17 = &v20;
    id v15 = v6;
    [v11 performBlockAndWait:v14];
    uint64_t v9 = v15;
  }

  id v12 = (id)v27[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (id)allFpsKeyDeletionInfos
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"FPSKeyDeletionInfo"];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__1;
  id v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  BOOL v4 = [(VUISidebandMediaLibrary *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__VUISidebandMediaLibrary_allFpsKeyDeletionInfos__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = [(id)v9[5] executeFetchRequest:v3 error:0];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke_64(uint64_t a1)
{
  [*(id *)(a1 + 32) _migrateVideoExpirationDateAndAllowsManualRenewal];
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VUISidebandMediaLibrary_initWithManager___block_invoke_2;
  v3[3] = &unk_1E6DF3F68;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 _pruneVideosAtAppLaunchWithCompletion:v3];
}

- (void)_pruneVideosAtAppLaunchWithCompletion:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  val = self;
  if (sDeleteAllEntriesOnInitialization)
  {
    id v4 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Deleting all videos and keys", buf, 2u);
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
    *(void *)buf = 0;
    v60 = buf;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__1;
    v63 = __Block_byref_object_dispose__1;
    id v64 = 0;
    id v6 = [(VUISidebandMediaLibrary *)val serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = val;
    block[5] = buf;
    dispatch_sync(v6, block);

    uint64_t v7 = [*((id *)v60 + 5) executeFetchRequest:v5 error:0];
    id obj = (id)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ComingSoonVideo"];

    uint64_t v8 = [*((id *)v60 + 5) executeFetchRequest:obj error:0];
    [(VUISidebandMediaLibrary *)val _deleteVideoManagedObjects:v7];
    [(VUISidebandMediaLibrary *)val _deleteComingSoonVideoManagedObjects:v8];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v31 = [(VUISidebandMediaLibrary *)self _videosMarkedAsDeleted];
    uint64_t v30 = [(VUISidebandMediaLibrary *)self _downloadedVideosForNonSignedInUsers];
    uint64_t v9 = [(VUISidebandMediaLibrary *)self videosWithDownloadState:2 entitlementTypes:0 sortDescriptors:0 useMainThreadContext:1];
    id v29 = [(VUISidebandMediaLibrary *)val _availableComingSoonVideos];
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v55 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v15 = [v14 fpsKeyInfo];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v65 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v51;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v51 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = [*(id *)(*((void *)&v50 + 1) + 8 * j) expirationDate];
                uint64_t v20 = v19;
                if (v19 && objc_msgSend(v19, "vui_isInThePast"))
                {
                  [v36 addObject:v14];

                  goto LABEL_21;
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v65 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_21:

          uint64_t v21 = [v14 localPlaybackURL];
          if (v21)
          {
            [v37 addObject:v14];
            [v10 addObject:v21];
          }
          else
          {
            [v34 addObject:v14];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v11);
    }

    objc_initWeak((id *)buf, val);
    uint64_t v22 = dispatch_get_global_queue(21, 0);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_261;
    v39[3] = &unk_1E6DF52E0;
    id v40 = v10;
    id v41 = v37;
    id v42 = v34;
    id v23 = v34;
    id v24 = v37;
    id v38 = v10;
    objc_copyWeak(&v49, (id *)buf);
    id v43 = v31;
    id v44 = v30;
    id v45 = v36;
    uint64_t v46 = val;
    id v47 = v29;
    id v48 = v32;
    id v25 = v29;
    id v26 = v36;
    id v27 = v30;
    id v28 = v31;
    dispatch_async(v22, v39);

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);
  }
}

- (id)_videosMarkedAsDeleted
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"markedAsDeleted");
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  id v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  [v3 setPredicate:v4];
  id v5 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VUISidebandMediaLibrary__videosMarkedAsDeleted__block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v9;
  dispatch_sync(v5, block);

  id v6 = [(id)v10[5] executeFetchRequest:v3 error:0];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_migrateVideoExpirationDateAndAllowsManualRenewal
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__1;
  uint64_t v46 = __Block_byref_object_dispose__1;
  id v47 = 0;
  BOOL v3 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VUISidebandMediaLibrary__migrateVideoExpirationDateAndAllowsManualRenewal__block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v42;
  id v23 = self;
  dispatch_sync(v3, block);

  [(id)v43[5] executeFetchRequest:v24 error:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v26 = *(void *)v38;
    uint64_t v27 = v4;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(__CFString **)(*((void *)&v37 + 1) + 8 * i);
        if (([(__CFString *)v6 hasExpirationDate] & 1) == 0)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v7 = [(__CFString *)v6 fpsKeyInfo];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v53 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v34;
            while (2)
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v34 != v9) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v11 = [*(id *)(*((void *)&v33 + 1) + 8 * j) expirationDate];
                BOOL v12 = v11 == 0;

                if (!v12)
                {
                  id v13 = sLogObject_2;
                  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v49 = v6;
                    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Setting hasExpirationDate to YES for %@", buf, 0xCu);
                  }
                  char v5 = 1;
                  [(__CFString *)v6 setHasExpirationDate:1];
                  goto LABEL_19;
                }
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v53 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
LABEL_19:
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = [(__CFString *)v6 fpsKeyInfo];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v52 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v30;
          do
          {
            for (uint64_t k = 0; k != v15; ++k)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v14);
              }
              id v18 = *(void **)(*((void *)&v29 + 1) + 8 * k);
              int v19 = [(__CFString *)v6 allowsManualRenewal];
              if (v19 != [v18 allowsManualRenewal])
              {
                uint64_t v20 = (id)sLogObject_2;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  int v21 = [v18 allowsManualRenewal];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v22 = @"NO";
                  if (v21) {
                    uint64_t v22 = @"YES";
                  }
                  id v49 = v22;
                  __int16 v50 = 2112;
                  long long v51 = v6;
                  _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Setting allowsManualRenewal to %@ for %@", buf, 0x16u);
                }

                -[__CFString setAllowsManualRenewal:](v6, "setAllowsManualRenewal:", [v18 allowsManualRenewal]);
                char v5 = 1;
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v52 count:16];
          }
          while (v15);
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v27);

    if (v5) {
      [(VUISidebandMediaLibrary *)v23 saveChangesToManagedObjects];
    }
  }
  else
  {
  }
  _Block_object_dispose(&v42, 8);
}

- (id)_downloadedVideosForNonSignedInUsers
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (+[VUIUtilities isInRetailDemoMode])
  {
    BOOL v3 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Device is in retail demo mode; not deleting downloads for non-signed-in users",
        buf,
        2u);
    }
    uint64_t v4 = 0;
  }
  else
  {
    char v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
    uint64_t v7 = objc_msgSend(v6, "ams_DSID");

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
    *(void *)buf = 0;
    id v18 = buf;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__1;
    int v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %ld", @"downloadState", 2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v9;
    if (v7)
    {
      id v10 = v9;
      if (([v7 isEqualToNumber:&unk_1F3F3C710] & 1) == 0)
      {
        uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"dsid", v7];
        BOOL v12 = (void *)MEMORY[0x1E4F28BA0];
        v23[0] = v9;
        v23[1] = v11;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        id v10 = [v12 andPredicateWithSubpredicates:v13];
      }
    }
    [v8 setPredicate:v10];
    id v14 = [(VUISidebandMediaLibrary *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__VUISidebandMediaLibrary__downloadedVideosForNonSignedInUsers__block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = buf;
    dispatch_sync(v14, block);

    uint64_t v4 = [*((id *)v18 + 5) executeFetchRequest:v8 error:0];

    _Block_object_dispose(buf, 8);
  }
  return v4;
}

- (id)videoForAdamID:(id)a3 useMainThreadContext:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    id v12 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    uint64_t v8 = [v6 arrayWithObjects:&v12 count:1];

    id v9 = -[VUISidebandMediaLibrary videosForAdamIDs:useMainThreadContext:](self, "videosForAdamIDs:useMainThreadContext:", v8, v4, v12, v13);
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)videosWithDownloadState:(int64_t)a3 entitlementTypes:(id)a4 sortDescriptors:(id)a5 useMainThreadContext:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 numberWithLongLong:a3];
  uint64_t v15 = [v10 setWithObject:v14];
  uint64_t v16 = [(VUISidebandMediaLibrary *)self videosWithDownloadStates:v15 entitlementTypes:v13 sortDescriptors:v12 useMainThreadContext:v6];

  return v16;
}

- (id)videosForAdamIDs:(id)a3 useMainThreadContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1;
  long long v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"adamID", v6];
  if (v4)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__1;
    uint64_t v26 = __Block_byref_object_dispose__1;
    id v27 = 0;
    id v9 = [(VUISidebandMediaLibrary *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v22;
    dispatch_sync(v9, block);

    [v8 setPredicate:v7];
    uint64_t v10 = [(id)v23[5] executeFetchRequest:v8 error:0];
    uint64_t v11 = (void *)v29[5];
    v29[5] = v10;

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__1;
    uint64_t v26 = __Block_byref_object_dispose__1;
    id v27 = 0;
    id v12 = [(VUISidebandMediaLibrary *)self serialQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_2;
    v20[3] = &unk_1E6DF4B00;
    v20[4] = self;
    v20[5] = &v22;
    dispatch_sync(v12, v20);

    id v13 = (void *)v23[5];
    if (v13)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_3;
      v16[3] = &unk_1E6DF5128;
      id v17 = v7;
      id v18 = &v28;
      uint64_t v19 = &v22;
      [v13 performBlockAndWait:v16];
    }
    _Block_object_dispose(&v22, 8);
  }
  id v14 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v14;
}

- (id)videosWithDownloadStates:(id)a3 entitlementTypes:(id)a4 sortDescriptors:(id)a5 useMainThreadContext:(BOOL)a6
{
  BOOL v6 = a6;
  v44[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"downloadState", v10];
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__1;
  uint64_t v42 = __Block_byref_object_dispose__1;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__1;
  long long v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  if (v11)
  {
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"entitlementType", v11];
    uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
    v44[0] = v14;
    v44[1] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];

    id v14 = (void *)v18;
  }
  [v13 setPredicate:v14];
  if (v12) {
    [v13 setSortDescriptors:v12];
  }
  [(VUISidebandMediaLibrary *)self serialQueue];
  if (v6) {
    uint64_t v19 = {;
  }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_sortDescriptors_useMainThreadContext___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v32;
    dispatch_sync(v19, block);

    uint64_t v20 = [(id)v33[5] executeFetchRequest:v13 error:0];
    int v21 = (void *)v39[5];
    v39[5] = v20;
  }
  else {
    uint64_t v22 = {;
  }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __106__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_sortDescriptors_useMainThreadContext___block_invoke_2;
    v30[3] = &unk_1E6DF4B00;
    v30[4] = self;
    v30[5] = &v32;
    dispatch_sync(v22, v30);

    id v23 = (void *)v33[5];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __106__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_sortDescriptors_useMainThreadContext___block_invoke_3;
    v26[3] = &unk_1E6DF5150;
    uint64_t v28 = &v38;
    long long v29 = &v32;
    id v27 = v13;
    [v23 performBlockAndWait:v26];
    int v21 = v27;
  }

  id v24 = (id)v39[5];
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v24;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (id)_availableComingSoonVideos
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ComingSoonVideo"];
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  char v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K < %@", @"availabilityStartDate", v4];
  [v3 setPredicate:v5];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  BOOL v6 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VUISidebandMediaLibrary__availableComingSoonVideos__block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v10;
  dispatch_sync(v6, block);

  id v7 = [(id)v11[5] executeFetchRequest:v3 error:0];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (VUISidebandMediaLibrary)initWithManager:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_alloc_init(VUISidebandLibraryIdentifier);
  v22.receiver = self;
  v22.super_class = (Class)VUISidebandMediaLibrary;
  BOOL v6 = [(VUIMediaLibrary *)&v22 initWithIdentifier:v5 type:0 manager:v4];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("Sideband media library serial queue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    id v9 = [(NSPersistentContainer *)[VUIPersistentContainer alloc] initWithName:@"SidebandLibraryModel"];
    persistentContainer = v6->_persistentContainer;
    v6->_persistentContainer = &v9->super;

    if (!v6->_persistentContainer && os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      -[VUISidebandMediaLibrary initWithManager:]();
    }
    objc_initWeak(&location, v6);
    id v11 = [(NSPersistentContainer *)v6->_persistentContainer persistentStoreDescriptions];
    BOOL v12 = [v11 count] == 0;

    id v13 = sLogObject_2;
    if (v12)
    {
      id v15 = (id)sLogObject_2;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = +[VUIPersistentContainer defaultDirectoryURL];
        [(VUISidebandMediaLibrary *)v16 initWithManager:v15];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Loading persistent store", buf, 2u);
      }
      id v14 = v6->_persistentContainer;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __43__VUISidebandMediaLibrary_initWithManager___block_invoke;
      v18[3] = &unk_1E6DF5100;
      objc_copyWeak(&v20, &location);
      uint64_t v19 = v6;
      [(NSPersistentContainer *)v14 loadPersistentStoresWithCompletionHandler:v18];

      objc_destroyWeak(&v20);
    }
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __72__VUISidebandMediaLibrary__countForFetchRequest_usingMainThreadContext___block_invoke_3(void *a1)
{
  uint64_t result = [*(id *)(*(void *)(a1[5] + 8) + 40) countForFetchRequest:a1[4] error:0];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_18);
  }
}

void __37__VUISidebandMediaLibrary_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.VideosUI", "VUISidebandMediaLibrary");
  v1 = (void *)sLogObject_2;
  sLogObject_2 = (uint64_t)v0;
}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Loaded persistent store with description: %@ error: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dumpDatabaseToLogIfEnabled];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__VUISidebandMediaLibrary_initWithManager___block_invoke_64;
  v10[3] = &unk_1E6DF3F68;
  id v11 = WeakRetained;
  id v12 = *(id *)(a1 + 32);
  id v9 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_254(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412546;
    long long v13 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8, v13) & 1) == 0)
        {
          id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v14 = 0;
          int v10 = [v9 removeItemAtPath:v8 error:&v14];
          id v11 = v14;

          id v12 = sLogObject_2;
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v20 = v8;
              _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Removed orphaned download at path %@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            uint64_t v20 = v8;
            __int16 v21 = 2112;
            id v22 = v11;
            _os_log_error_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_ERROR, "Failed to Remove orphaned download at path %@.  Error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

+ (void)setDeleteAllVideosAndKeysOnInitializationForAppRemoval:(BOOL)a3
{
  sDeleteAllEntriesOnInitialization = a3;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUISidebandMediaLibrary;
  [(VUIMediaLibraryImageLoader *)&v4 dealloc];
}

- (id)videoForPlayable:(id)a3
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 adamID];
  id v6 = [v4 playbackURL];
  if (v5 && [v5 length] && v6)
  {
    uint64_t v7 = [v4 canonicalID];
    uint64_t v8 = [v4 mediaType];
    char v150 = 0;
    id v9 = [v4 downloadURL];
    int v10 = +[VUIMediaInfo playbackURLOverrideForOriginalURL:v6 adamID:v5 canonicalID:v7];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;

      id v6 = v12;
      id v9 = v6;
    }
    id v140 = v6;
    v141 = (void *)v7;
    v138 = v11;
    v139 = v8;
    v142 = v9;
    v143 = self;
    if ([v8 isEqualToString:@"Movie"])
    {
      id v13 = [(VUISidebandMediaLibrary *)self _movieForAdamID:v5 createIfNeeded:1 wasCreated:&v150];
      goto LABEL_59;
    }
    if (![v8 isEqualToString:@"Episode"])
    {
      id v13 = 0;
      goto LABEL_59;
    }
    id v14 = [v4 showCanonicalID];
    long long v15 = [v4 seasonCanonicalID];
    v136 = [v4 showAdamID];
    v134 = [v4 seasonAdamID];
    if (![v14 length] && !objc_msgSend(v136, "length"))
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
        -[VUISidebandMediaLibrary videoForPlayable:].cold.7();
      }
      id v13 = 0;
      goto LABEL_58;
    }
    unsigned __int8 v149 = 0;
    long long v16 = [(VUISidebandMediaLibrary *)self _tvEpisodeForAdamID:v5 createIfNeeded:1 wasCreated:&v150];
    if (![v14 length]
      || ([(VUISidebandMediaLibrary *)self _tvSeriesForCanonicalID:v14 createIfNeeded:0 wasCreated:0], (long long v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (![v136 length]
        || ([(VUISidebandMediaLibrary *)self _tvSeriesForAdamID:v136 createIfNeeded:0 wasCreated:0], (long long v17 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ([v14 length]) {
          [(VUISidebandMediaLibrary *)self _tvSeriesForCanonicalID:v14 createIfNeeded:1 wasCreated:&v149];
        }
        else {
        long long v17 = [(VUISidebandMediaLibrary *)self _tvSeriesForAdamID:v136 createIfNeeded:1 wasCreated:&v149];
        }
      }
    }
    id v13 = v16;
    int v18 = v149;
    uint64_t v19 = (id)sLogObject_2;
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (!v20) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      __int16 v21 = "Created managed object for series";
    }
    else
    {
      if (!v20) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      __int16 v21 = "Using existing managed object for series but updating its metadata";
    }
    _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_32:

    id v22 = [v4 metadata];
    id v23 = [v22 episodeNumber];
    [v13 setEpisodeNumberInSeason:v23];

    uint64_t v24 = [v4 metadata];
    id v25 = [v24 fractionalEpisodeNumber];
    [v13 setFractionalEpisodeNumberInSeason:v25];

    uint64_t v26 = [v4 metadata];
    id v27 = [v26 episodeIndexInSeries];
    [v13 setEpisodeNumberInSeries:v27];

    [v17 setCanonicalID:v14];
    [v17 setAdamID:v136];
    uint64_t v28 = [v4 metadata];
    long long v29 = [v28 showTitle];
    [v17 setTitle:v29];

    [v17 addEpisodesObject:v13];
    uint64_t v30 = [v4 metadata];
    long long v31 = [v30 showArtworkURLFormat];

    uint64_t v32 = [v4 metadata];
    v132 = [v32 showArtworkWidth];

    id v33 = [v4 metadata];
    v130 = [v33 showArtworkHeight];

    if (v17)
    {
      if ([v31 length]
        && ([v132 doubleValue], v34 > 0.0)
        && ([v130 doubleValue], v35 > 0.0))
      {
        long long v36 = [(VUISidebandMediaLibrary *)self imageInfoForSeries:v17 imageType:0 createIfNeeded:1 wasCreated:0];
        [v36 setImageType:0];
        [v36 setUrlFormat:v31];
        [v132 doubleValue];
        -[NSObject setCanonicalWidth:](v36, "setCanonicalWidth:");
        [v130 doubleValue];
        -[NSObject setCanonicalHeight:](v36, "setCanonicalHeight:");
        [v36 setSeries:v17];
      }
      else
      {
        long long v36 = (id)sLogObject_2;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[VUISidebandMediaLibrary videoForPlayable:].cold.8();
        }
      }
    }
    if (![v15 length] && !objc_msgSend(v134, "length")) {
      goto LABEL_57;
    }
    unsigned __int8 v148 = 0;
    if (![v15 length]
      || ([(VUISidebandMediaLibrary *)v143 _tvSeasonForCanonicalID:v15 createIfNeeded:0 wasCreated:0], (id v37 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (![v134 length]
        || ([(VUISidebandMediaLibrary *)v143 _tvSeasonForAdamID:v134 createIfNeeded:0 wasCreated:0], (id v37 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ([v15 length]) {
          [(VUISidebandMediaLibrary *)v143 _tvSeasonForCanonicalID:v15 createIfNeeded:1 wasCreated:&v148];
        }
        else {
        id v37 = [(VUISidebandMediaLibrary *)v143 _tvSeasonForAdamID:v134 createIfNeeded:1 wasCreated:&v148];
        }
      }
    }
    int v38 = v148;
    long long v39 = (id)sLogObject_2;
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        id v41 = "Created managed object for season";
LABEL_55:
        _os_log_impl(&dword_1E2BD7000, v39, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
      }
    }
    else if (v40)
    {
      *(_WORD *)buf = 0;
      id v41 = "Using existing managed object for season but updating its metadata";
      goto LABEL_55;
    }

    [v37 setCanonicalID:v15];
    [v37 setAdamID:v134];
    uint64_t v42 = [v4 metadata];
    id v43 = [v42 seasonNumber];
    [v37 setSeasonNumber:v43];

    uint64_t v44 = [v4 metadata];
    id v45 = [v44 seasonTitle];
    [v37 setTitle:v45];

    [v17 addSeasonsObject:v37];
    [v13 setSeason:v37];

    id v6 = v140;
LABEL_57:

    uint64_t v7 = (uint64_t)v141;
LABEL_58:

    id v9 = v142;
LABEL_59:
    [v13 setCanonicalID:v7];
    uint64_t v46 = [v4 fpsCertificateURL];
    [v13 setFpsCertificateURL:v46];

    id v47 = [v4 fpsKeyServerURL];
    [v13 setFpsKeyServerURL:v47];

    id v48 = [v4 fpsNonceURL];
    [v13 setFpsNonceURL:v48];

    [v13 setPlaybackURL:v6];
    [v13 setDownloadURL:v9];
    id v49 = [v4 metadata];
    __int16 v50 = [v49 title];
    [v13 setTitle:v50];

    long long v51 = [v4 metadata];
    long long v52 = [v51 mediaDescription];
    [v13 setMediaDescription:v52];

    [v13 setAdamID:v5];
    long long v53 = [v4 externalID];
    [v13 setExternalID:v53];

    long long v54 = [v4 channelID];
    [v13 setBrandID:v54];

    uint64_t v55 = [v4 channelName];
    [v13 setBrandName:v55];

    long long v56 = [v4 metadata];
    long long v57 = [v56 ratingValue];
    [v13 setContentRatingRank:v57];

    v58 = [v4 metadata];
    v59 = [v58 ratingDomain];
    [v13 setContentRatingDomain:v59];

    v60 = [v4 metadata];
    uint64_t v61 = [v60 duration];
    [v13 setDuration:v61];

    v62 = [v4 referenceID];
    [v13 setReferenceID:v62];

    v63 = [v4 playablePassThrough];
    [v13 setPlayablePassThrough:v63];

    id v64 = [v4 hlsProgramID];
    [v13 setProgramID:v64];

    v65 = [v4 metadata];
    v66 = [v65 genre];
    uint64_t v67 = [v66 length];

    v68 = [v4 metadata];
    v69 = v68;
    if (v67) {
      [v68 genre];
    }
    else {
    v70 = [v68 sportName];
    }
    [v13 setGenreName:v70];

    v71 = [v4 metadata];
    v72 = [v71 type];
    objc_msgSend(v13, "setIsSportingEvent:", objc_msgSend(v72, "isEqualToString:", @"SportingEvent"));

    v73 = [v4 metadata];
    v74 = [v73 releasedDate];
    [v13 setReleaseDate:v74];

    v75 = [v4 metadata];
    objc_msgSend(v13, "setIsAdultContent:", objc_msgSend(v75, "isAdultContent"));

    v76 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v77 = objc_msgSend(v76, "ams_activeiTunesAccount");
    v78 = objc_msgSend(v77, "ams_DSID");
    [v13 setDsid:v78];

    v79 = [v4 requiredAgeForPlayback];
    [v13 setRequiredAgeForPlayback:v79];

    v80 = [v4 frequencyOfAgeConfirmation];
    [v13 setFrequencyOfAgeConfirmation:v80];

    v81 = [v4 rtcServiceIdentifier];
    [v13 setRtcServiceIdentifier:v81];

    [v13 setMarkedAsDeleted:0];
    v82 = [v4 tvAppDeeplinkURL];
    [v13 setShareURL:v82];

    v83 = [v4 buyParams];
    [v13 setBuyParams:v83];

    v84 = [v4 rentalID];
    [v13 setRentalID:v84];

    [v13 setDownloadedPlaybackMode:0];
    if ([v4 isSubscription])
    {
      uint64_t v85 = 1;
    }
    else if ([v4 isiTunesPurchaseOrRental])
    {
      if ([v4 isRental])
      {
        uint64_t v85 = 3;
      }
      else if ([v4 isFamilySharingContent])
      {
        uint64_t v85 = 4;
      }
      else
      {
        uint64_t v85 = 2;
      }
    }
    else
    {
      v86 = (id)sLogObject_2;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v86, OS_LOG_TYPE_DEFAULT, "Unknown entitlement type for video", buf, 2u);
      }

      uint64_t v85 = 0;
    }
    v87 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v85];
    [v13 setEntitlementType:v87];

    uint64_t v88 = [v4 fpsAdditionalServerParams];
    if (v88 && [MEMORY[0x1E4F28D90] isValidJSONObject:v88])
    {
      id v147 = 0;
      v89 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v88 options:0 error:&v147];
      id v90 = v147;
      if ([v89 length])
      {
        [v13 setAdditionalFPSRequestParamsJSONData:v89];
      }
      else
      {
        v91 = (id)sLogObject_2;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
          -[VUISidebandMediaLibrary videoForPlayable:].cold.6();
        }
      }
    }
    uint64_t v92 = [v4 vpafMetrics];
    if (v92 && [MEMORY[0x1E4F28D90] isValidJSONObject:v92])
    {
      id v146 = 0;
      v93 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v92 options:0 error:&v146];
      id v94 = v146;
      if ([v93 length])
      {
        [v13 setVpafMetricsJSONData:v93];
      }
      else
      {
        v95 = (id)sLogObject_2;
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
          -[VUISidebandMediaLibrary videoForPlayable:].cold.5();
        }
      }
    }
    v135 = (void *)v92;
    v96 = [v4 mediaMetrics];
    if (v96 && [MEMORY[0x1E4F28D90] isValidJSONObject:v96])
    {
      id v145 = 0;
      v97 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v96 options:0 error:&v145];
      id v98 = v145;
      if ([v97 length])
      {
        [v13 setMediaMetricsJSONData:v97];
      }
      else
      {
        v99 = (id)sLogObject_2;
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v152 = v98;
          _os_log_impl(&dword_1E2BD7000, v99, OS_LOG_TYPE_DEFAULT, "Unable to serialize mediaMetrics data: %@", buf, 0xCu);
        }
      }
    }
    v100 = [v4 playbackModes];
    if (v100 && [MEMORY[0x1E4F28D90] isValidJSONObject:v100])
    {
      id v144 = 0;
      v101 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v100 options:0 error:&v144];
      id v102 = v144;
      if ([v101 length])
      {
        [v13 setPlaybackModesJSONData:v101];
      }
      else
      {
        v103 = (id)sLogObject_2;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v152 = v102;
          _os_log_impl(&dword_1E2BD7000, v103, OS_LOG_TYPE_DEFAULT, "Unable to serialize playbackModes data: %@", buf, 0xCu);
        }
      }
    }
    v137 = (void *)v88;
    v104 = [v4 metadata];
    v105 = [v104 artworkURLFormat];

    v106 = [v4 metadata];
    v107 = [v106 artworkWidth];

    v108 = [v4 metadata];
    v109 = [v108 artworkHeight];

    if (v13)
    {
      if ([v105 length]
        && ([v107 doubleValue], v110 > 0.0)
        && ([v109 doubleValue], v111 > 0.0))
      {
        v112 = [(VUISidebandMediaLibrary *)v143 imageInfoForVideo:v13 imageType:0 createIfNeeded:1 wasCreated:0];
        [v112 setImageType:0];
        [v112 setUrlFormat:v105];
        [v107 doubleValue];
        -[NSObject setCanonicalWidth:](v112, "setCanonicalWidth:");
        [v109 doubleValue];
        -[NSObject setCanonicalHeight:](v112, "setCanonicalHeight:");
        [v112 setVideo:v13];
      }
      else
      {
        v112 = (id)sLogObject_2;
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
          -[VUISidebandMediaLibrary videoForPlayable:].cold.4();
        }
      }
    }
    v131 = v105;
    v133 = v107;
    v113 = v109;
    v114 = [v4 metadata];
    v115 = [v114 previewFrameURLFormat];

    v116 = [v4 metadata];
    v117 = [v116 previewFrameWidth];

    v118 = [v4 metadata];
    v119 = [v118 previewFrameHeight];

    if (v13)
    {
      if ([v115 length]
        && ([v117 doubleValue], v120 > 0.0)
        && ([v119 doubleValue], v121 > 0.0))
      {
        v122 = [(VUISidebandMediaLibrary *)v143 imageInfoForVideo:v13 imageType:1 createIfNeeded:1 wasCreated:0];
        [v122 setImageType:1];
        [v122 setUrlFormat:v115];
        [v117 doubleValue];
        -[NSObject setCanonicalWidth:](v122, "setCanonicalWidth:");
        [v119 doubleValue];
        -[NSObject setCanonicalHeight:](v122, "setCanonicalHeight:");
        [v122 setVideo:v13];
      }
      else
      {
        v122 = (id)sLogObject_2;
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
          -[VUISidebandMediaLibrary videoForPlayable:]();
        }
      }

      if ([v115 length]
        && ([v117 doubleValue], v123 > 0.0)
        && ([v119 doubleValue], v124 > 0.0))
      {
        v125 = [(VUISidebandMediaLibrary *)v143 imageInfoForVideo:v13 imageType:2 createIfNeeded:1 wasCreated:0];
        [v125 setImageType:2];
        [v125 setUrlFormat:v115];
        [v117 doubleValue];
        -[NSObject setCanonicalWidth:](v125, "setCanonicalWidth:");
        [v119 doubleValue];
        -[NSObject setCanonicalHeight:](v125, "setCanonicalHeight:");
        [v125 setVideo:v13];
      }
      else
      {
        v125 = (id)sLogObject_2;
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
          -[VUISidebandMediaLibrary videoForPlayable:]();
        }
      }

      if (!v150)
      {
        v126 = (id)sLogObject_2;
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v126, OS_LOG_TYPE_DEFAULT, "Using existing managed object for video but updating its metadata", buf, 2u);
        }
LABEL_133:

        goto LABEL_134;
      }
    }
    else if (!v150)
    {
LABEL_134:
      [(VUISidebandMediaLibrary *)v143 saveChangesToManagedObjects];

      id v6 = v140;
      goto LABEL_135;
    }
    v127 = (id)sLogObject_2;
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v127, OS_LOG_TYPE_DEFAULT, "Created managed object for video", buf, 2u);
    }

    [v13 setDownloadState:0];
    v126 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setDateAdded:v126];
    goto LABEL_133;
  }
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
    -[VUISidebandMediaLibrary videoForPlayable:]();
  }
  id v13 = 0;
LABEL_135:
  id v128 = v13;

  return v128;
}

- (id)videoForMPMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForProperty:*MEMORY[0x1E4F31500]];
  id v6 = v5;
  if (v5 && [v5 longLongValue])
  {
    char v34 = 0;
    uint64_t v7 = [v6 stringValue];
    uint64_t v8 = [v4 valueForProperty:*MEMORY[0x1E4F31388]];
    id v9 = (void *)[v8 length];
    if (v9)
    {
      id v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    }
    id v10 = v9;
    __int16 v11 = [v4 mediaType];
    id v12 = +[VUIMediaInfo playbackURLOverrideForOriginalURL:v10 adamID:v7 canonicalID:0];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;

      id v15 = v14;
      id v10 = v15;
    }
    if ((v11 & 0x100) != 0)
    {
      uint64_t v17 = [(VUISidebandMediaLibrary *)self _movieForAdamID:v7 createIfNeeded:1 wasCreated:&v34];
    }
    else
    {
      if ((v11 & 0x200) == 0)
      {
        long long v16 = 0;
LABEL_16:
        long long v31 = v8;
        int v18 = [v4 valueForProperty:*MEMORY[0x1E4F31538]];
        [v16 setTitle:v18];

        uint64_t v19 = [v4 valueForProperty:*MEMORY[0x1E4F31510]];
        [v16 setBuyParams:v19];

        if ([v4 isRental])
        {
          BOOL v20 = [v4 valueForProperty:*MEMORY[0x1E4F31518]];
          [v16 setRentalID:v20];
        }
        [v16 setPlaybackURL:v10];
        [v16 setDownloadURL:v10];
        [v16 setAdamID:v7];
        __int16 v21 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        id v22 = objc_msgSend(v21, "ams_activeiTunesAccount");
        id v23 = objc_msgSend(v22, "ams_DSID");
        [v16 setDsid:v23];

        [v16 setMarkedAsDeleted:0];
        if ([v4 isRental]) {
          uint64_t v24 = 3;
        }
        else {
          uint64_t v24 = 2;
        }
        id v25 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v24];
        [v16 setEntitlementType:v25];

        if (v34)
        {
          uint64_t v26 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Created managed object for video", buf, 2u);
          }
          [v16 setDownloadState:0];
          id v27 = [MEMORY[0x1E4F1C9C8] date];
          [v16 setDateAdded:v27];

          uint64_t v28 = v31;
        }
        else
        {
          uint64_t v28 = v31;
          if (v16)
          {
            uint64_t v30 = sLogObject_2;
            if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v32 = 0;
              _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Using existing managed object for video but updating its metadata", v32, 2u);
            }
          }
        }
        [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];

        goto LABEL_26;
      }
      uint64_t v17 = [(VUISidebandMediaLibrary *)self _tvEpisodeForAdamID:v7 createIfNeeded:1 wasCreated:&v34];
    }
    long long v16 = (void *)v17;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
    -[VUISidebandMediaLibrary videoForMPMediaItem:]();
  }
  long long v16 = 0;
LABEL_26:

  return v16;
}

void __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_3(void *a1)
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Video"];
  [v5 setPredicate:a1[4]];
  uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) executeFetchRequest:v5 error:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fpsKeyInfoForVideo:(id)a3 keyURI:(id)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v27 = 0;
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K == %@", @"video", v10, @"keyURI", v11];
  id v13 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"FPSKeyInfo" predicate:v12 createIfNeeded:v7 wasCreated:&v27];
  BOOL v14 = v27;
  if (a6) {
    *a6 = v27;
  }
  if (v14)
  {
    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"keyURI", v11];
    long long v16 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"FPSKeyDeletionInfo" predicate:v15 createIfNeeded:0 wasCreated:0];
    if (v16)
    {
      uint64_t v17 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Deleting existing key deletion info object since new key was created for the same content", buf, 2u);
      }
      *(void *)buf = 0;
      id v22 = buf;
      uint64_t v23 = 0x3032000000;
      uint64_t v24 = __Block_byref_object_copy__1;
      id v25 = __Block_byref_object_dispose__1;
      id v26 = 0;
      int v18 = [(VUISidebandMediaLibrary *)self serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__VUISidebandMediaLibrary_fpsKeyInfoForVideo_keyURI_createIfNeeded_wasCreated___block_invoke;
      block[3] = &unk_1E6DF4B00;
      void block[4] = self;
      block[5] = buf;
      dispatch_sync(v18, block);

      [*((id *)v22 + 5) deleteObject:v16];
      _Block_object_dispose(buf, 8);
    }
  }

  return v13;
}

void __79__VUISidebandMediaLibrary_fpsKeyInfoForVideo_keyURI_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)existingFpsKeyInfoForKeyURI:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"keyURI", a3];
  id v5 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"FPSKeyInfo" predicate:v4 createIfNeeded:0 wasCreated:0];

  return v5;
}

- (id)imageInfoForVideo:(id)a3 imageType:(unint64_t)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K == %lu", @"video", v10, @"imageType", a4];
  BOOL v24 = 0;
  id v12 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"VideoImageInfo" predicate:v11 createIfNeeded:v7 wasCreated:&v24];
  if (v24)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = __Block_byref_object_copy__1;
    id v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    id v13 = [(VUISidebandMediaLibrary *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__VUISidebandMediaLibrary_imageInfoForVideo_imageType_createIfNeeded_wasCreated___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v18;
    dispatch_sync(v13, block);

    BOOL v14 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = @"ImageData";
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Creating managed object for entity name %@", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ImageData" inManagedObjectContext:v19[5]];
    [v12 setImageData:v15];

    _Block_object_dispose(&v18, 8);
  }
  if (a6) {
    *a6 = v24;
  }

  return v12;
}

void __81__VUISidebandMediaLibrary_imageInfoForVideo_imageType_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)imageInfoForSeries:(id)a3 imageType:(unint64_t)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K == %lu", @"series", v10, @"imageType", a4];
  BOOL v24 = 0;
  id v12 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"TVSeriesImageInfo" predicate:v11 createIfNeeded:v7 wasCreated:&v24];
  if (v24)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = __Block_byref_object_copy__1;
    id v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    id v13 = [(VUISidebandMediaLibrary *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__VUISidebandMediaLibrary_imageInfoForSeries_imageType_createIfNeeded_wasCreated___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v18;
    dispatch_sync(v13, block);

    BOOL v14 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = @"ImageData";
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Creating managed object for entity name %@", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ImageData" inManagedObjectContext:v19[5]];
    [v12 setImageData:v15];

    _Block_object_dispose(&v18, 8);
  }
  if (a6) {
    *a6 = v24;
  }

  return v12;
}

void __82__VUISidebandMediaLibrary_imageInfoForSeries_imageType_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)deleteFPSKeyDeletionInfo:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];

    -[VUISidebandMediaLibrary deleteFPSKeyDeletionInfos:](self, "deleteFPSKeyDeletionInfos:", v6, v7, v8);
  }
}

- (void)deleteFPSKeyDeletionInfos:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = __Block_byref_object_copy__1;
    id v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    id v5 = [(VUISidebandMediaLibrary *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__VUISidebandMediaLibrary_deleteFPSKeyDeletionInfos___block_invoke;
    block[3] = &unk_1E6DF4B00;
    void block[4] = self;
    block[5] = &v18;
    id v12 = self;
    dispatch_sync(v5, block);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v11 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v10;
            _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Deleting managed object %@", buf, 0xCu);
          }
          [(id)v19[5] deleteObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v26 count:16];
      }
      while (v7);
    }

    [(VUISidebandMediaLibrary *)v12 saveChangesToManagedObjects];
    _Block_object_dispose(&v18, 8);
  }
}

void __53__VUISidebandMediaLibrary_deleteFPSKeyDeletionInfos___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)seriesForCanonicalIDOrAdamID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(VUISidebandMediaLibrary *)self _tvSeriesForCanonicalID:v4 createIfNeeded:0 wasCreated:0];
    if (!v5)
    {
      id v5 = [(VUISidebandMediaLibrary *)self _tvSeriesForAdamID:v4 createIfNeeded:0 wasCreated:0];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)seasonForCanonicalIDOrAdamID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = [(VUISidebandMediaLibrary *)self _tvSeasonForCanonicalID:v6 createIfNeeded:v4 wasCreated:0];
    if (!v7)
    {
      uint64_t v7 = [(VUISidebandMediaLibrary *)self _tvSeasonForAdamID:v6 createIfNeeded:v4 wasCreated:0];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)comingSoonObjectWithCanonicalID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = [(VUISidebandMediaLibrary *)self _comingSoonVideoForCanonicalID:v6 createIfNeeded:v4 wasCreated:0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)episodesWithDownloadStates:(id)a3 seasonCanonicalId:(id)a4 usingMainThreadContext:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithEntityName:@"TVEpisode"];
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND %K IN %@ AND season.canonicalID == %@", @"markedAsDeleted", @"downloadState", v10, v9];

  [v11 setPredicate:v12];
  long long v13 = [(VUISidebandMediaLibrary *)self _objectsWithFetchRequest:v11 usingMainThreadContext:v5];

  return v13;
}

- (id)episodesWithDownloadStates:(id)a3 showCanonicalId:(id)a4 usingMainThreadContext:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithEntityName:@"TVEpisode"];
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND %K IN %@ AND series.canonicalID == %@", @"markedAsDeleted", @"downloadState", v10, v9];

  [v11 setPredicate:v12];
  long long v13 = [(VUISidebandMediaLibrary *)self _objectsWithFetchRequest:v11 usingMainThreadContext:v5];

  return v13;
}

- (id)episodesWithSeasonCanonicalIds:(id)a3 usingMainThreadContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithEntityName:@"TVEpisode"];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND season.canonicalID IN %@", @"markedAsDeleted", v7];

  [v8 setPredicate:v9];
  id v10 = [(VUISidebandMediaLibrary *)self _objectsWithFetchRequest:v8 usingMainThreadContext:v4];

  return v10;
}

- (void)removeDownloadedMediaForVideoManagedObject:(id)a3 markAsDeleted:(BOOL)a4 invalidateImmediately:(BOOL)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    id v11 = a3;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a3;
    id v10 = [v8 arrayWithObjects:&v11 count:1];

    -[VUISidebandMediaLibrary removeDownloadedMediaForVideoManagedObjects:markAsDeleted:invalidateImmediately:](self, "removeDownloadedMediaForVideoManagedObjects:markAsDeleted:invalidateImmediately:", v10, v6, v5, v11, v12);
  }
}

- (void)removeDownloadedMediaForVideoManagedObjects:(id)a3 markAsDeleted:(BOOL)a4 invalidateImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = -[VUISidebandMediaLibrary mainContextVideoForVideo:](self, "mainContextVideoForVideo:", *(void *)(*((void *)&v15 + 1) + 8 * v13), (void)v15);
          [(VUISidebandMediaLibrary *)self _removeDownloadedMediaForVideoManagedObject:v14 markAsDeleted:v6 saveWhenDone:0 invalidateImmediately:v5];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];
  }
}

- (void)invalidateKeysForVideoManagedObject:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    BOOL v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    BOOL v6 = [v4 arrayWithObjects:&v7 count:1];

    -[VUISidebandMediaLibrary invalidateKeysForVideoManagedObjects:](self, "invalidateKeysForVideoManagedObjects:", v6, v7, v8);
  }
}

- (void)invalidateKeysForVideoManagedObjects:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[VUISidebandMediaLibrary mainContextVideoForVideo:](self, "mainContextVideoForVideo:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
          [(VUISidebandMediaLibrary *)self _invalidateKeysForVideoManagedObject:v10 saveWhenDone:0 invalidateImmediately:1];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];
  }
}

- (void)saveChangesToManagedObjects
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "no changes on context, early return of save changes", v2, v3, v4, v5, v6);
}

void __54__VUISidebandMediaLibrary_saveChangesToManagedObjects__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)mainContextVideoForVideo:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint8_t v6 = [v4 arrayWithObjects:&v10 count:1];

    uint64_t v7 = -[VUISidebandMediaLibrary _mainContextManagedObjectsForObjects:](self, "_mainContextManagedObjectsForObjects:", v6, v10, v11);
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)title
{
  uint64_t v2 = +[VUILocalizationManager sharedInstance];
  uint64_t v3 = [v2 localizedStringForKey:@"LIBRARY"];

  return v3;
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  objc_initWeak(&location, self);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  uint8_t v6 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v19;
  dispatch_sync(v6, block);

  uint64_t v7 = (void *)v20[5];
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E6DF5178;
    objc_copyWeak(&v15, &location);
    long long v14 = &v19;
    id v12 = v5;
    id v13 = v4;
    [v7 performBlock:v11];

    objc_destroyWeak(&v15);
  }
  else
  {
    uint64_t v8 = [(VUIMediaLibrary *)self manager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E6DF3DD0;
    id v17 = v4;
    [v8 _enqueueCompletionQueueBlock:v16];
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];
  _Block_object_dispose(&v19, 8);

  objc_destroyWeak(&location);
  return v9;
}

void __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Movie"];
  uint64_t v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"TVEpisode"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NIL OR %K IN %@", @"entitlementType", @"entitlementType", &unk_1F3F3E1B0];
  [v2 setPredicate:v4];
  [v3 setPredicate:v4];
  [v2 setFetchLimit:1];
  [v3 setFetchLimit:1];
  id v24 = v2;
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) executeFetchRequest:v2 error:0];
  uint8_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) executeFetchRequest:v3 error:0];
  id v23 = v5;
  if ([v5 count])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = +[VUIMediaEntityType movie];
    [v7 addObject:v8];
  }
  if ([v6 count])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = +[VUIMediaEntityType episode];
    [v9 addObject:v10];
  }
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = +[VUIMediaLibraryUtilities mediaItemEntityTypesSortComparator];
  [v11 sortUsingComparator:v12];

  id v13 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Video"];
  long long v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %ld", @"downloadState", 2);
  id v15 = (void *)MEMORY[0x1E4F28BA0];
  v29[0] = v14;
  v29[1] = v4;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v17 = [v15 andPredicateWithSubpredicates:v16];

  [v13 setPredicate:v17];
  [v13 setFetchLimit:1];
  long long v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) executeFetchRequest:v13 error:0];
  uint64_t v19 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
  [(VUIMediaItemEntityTypesFetchResponse *)v19 setMediaItemEntityTypes:*(void *)(a1 + 32)];
  -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](v19, "setLocalMediaItemsAvailable:", [v18 count] != 0);
  uint64_t v20 = [WeakRetained manager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_189;
  v26[3] = &unk_1E6DF41E8;
  id v21 = *(id *)(a1 + 40);
  uint64_t v27 = v19;
  id v28 = v21;
  id v22 = v19;
  [v20 _enqueueCompletionQueueBlock:v26];
}

uint64_t __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_189(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__1;
  uint64_t v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  uint64_t v9 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v23;
  dispatch_sync(v9, block);

  id v10 = (void *)v24[5];
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
    v14[3] = &unk_1E6DF51A0;
    objc_copyWeak(&v19, &location);
    id v15 = v6;
    long long v18 = &v23;
    id v16 = v8;
    id v17 = v7;
    [v10 performBlock:v14];

    objc_destroyWeak(&v19);
  }
  else
  {
    uint64_t v11 = [(VUIMediaLibrary *)self manager];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
    v20[3] = &unk_1E6DF3DD0;
    id v21 = v7;
    [v11 _enqueueCompletionQueueBlock:v20];
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];
  _Block_object_dispose(&v23, 8);

  objc_destroyWeak(&location);
  return v12;
}

void __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  uint64_t v98 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v94 = [obj countByEnumeratingWithState:&v143 objects:v153 count:16];
  if (v94)
  {
    uint64_t v93 = *(void *)v144;
    uint64_t v3 = &off_1E6DF2000;
    id v109 = WeakRetained;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v144 != v93) {
          objc_enumerationMutation(obj);
        }
        uint64_t v97 = v4;
        id v5 = *(void **)(*((void *)&v143 + 1) + 8 * v4);
        id v113 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v6 = [v5 range];
        uint64_t v95 = v7;
        unint64_t v96 = v6;
        long long v139 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        v115 = v5;
        id v99 = [v5 mediaEntityTypes];
        uint64_t v8 = v98;
        uint64_t v101 = [v99 countByEnumeratingWithState:&v139 objects:v152 count:16];
        if (v101)
        {
          uint64_t v100 = *(void *)v140;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v140 != v100) {
                objc_enumerationMutation(v99);
              }
              id v10 = *(void **)(*((void *)&v139 + 1) + 8 * v9);
              uint64_t v11 = [v3[261] movie];
              if (v10 == (void *)v11)
              {

LABEL_37:
                uint64_t v105 = v9;
                char v34 = [v3[261] movie];
                double v35 = @"TVEpisode";
                if (v10 == v34) {
                  double v35 = @"Movie";
                }
                long long v36 = v35;

                v103 = v36;
                id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:v36];
                int v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NIL OR %K IN %@", @"entitlementType", @"entitlementType", &unk_1F3F3E1C8];
                [v37 setPredicate:v38];
                uint64_t v39 = v8;
                id v106 = v37;
                BOOL v40 = [*(id *)(*(void *)(*(void *)(v8 + 56) + 8) + 40) executeFetchRequest:v37 error:0];
                long long v135 = 0u;
                long long v136 = 0u;
                long long v137 = 0u;
                long long v138 = 0u;
                uint64_t v41 = [v40 countByEnumeratingWithState:&v135 objects:v151 count:16];
                if (v41)
                {
                  uint64_t v42 = v41;
                  uint64_t v43 = *(void *)v136;
                  do
                  {
                    for (uint64_t i = 0; i != v42; ++i)
                    {
                      if (*(void *)v136 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      uint64_t v45 = *(void *)(*((void *)&v135 + 1) + 8 * i);
                      uint64_t v46 = [VUISidebandMediaItem alloc];
                      id v47 = [v115 properties];
                      id v48 = [(VUISidebandMediaItem *)v46 initWithMediaLibrary:WeakRetained videoManagedObject:v45 requestedProperties:v47];

                      [v113 addObject:v48];
                    }
                    uint64_t v42 = [v40 countByEnumeratingWithState:&v135 objects:v151 count:16];
                  }
                  while (v42);
                }

                uint64_t v3 = &off_1E6DF2000;
                id v16 = v103;
                uint64_t v9 = v105;
                uint64_t v8 = v39;
                goto LABEL_47;
              }
              id v12 = (void *)v11;
              id v13 = [v3[261] episode];

              if (v10 == v13) {
                goto LABEL_37;
              }
              long long v14 = [v3[261] show];

              if (v10 == v14)
              {
                id v16 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"TVSeries"];
                id v49 = [*(id *)(*(void *)(*(void *)(v8 + 56) + 8) + 40) executeFetchRequest:v16 error:0];
                long long v131 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                long long v134 = 0u;
                id v106 = v49;
                uint64_t v111 = [v49 countByEnumeratingWithState:&v131 objects:v150 count:16];
                if (v111)
                {
                  id v102 = v16;
                  uint64_t v104 = v9;
                  uint64_t v108 = *(void *)v132;
                  do
                  {
                    for (uint64_t j = 0; j != v111; ++j)
                    {
                      if (*(void *)v132 != v108) {
                        objc_enumerationMutation(v106);
                      }
                      long long v51 = *(void **)(*((void *)&v131 + 1) + 8 * j);
                      long long v127 = 0u;
                      long long v128 = 0u;
                      long long v129 = 0u;
                      long long v130 = 0u;
                      long long v52 = [v51 episodes];
                      uint64_t v53 = [v52 countByEnumeratingWithState:&v127 objects:v149 count:16];
                      if (v53)
                      {
                        uint64_t v54 = v53;
                        uint64_t v55 = *(void *)v128;
                        while (2)
                        {
                          for (uint64_t k = 0; k != v54; ++k)
                          {
                            if (*(void *)v128 != v55) {
                              objc_enumerationMutation(v52);
                            }
                            long long v57 = *(void **)(*((void *)&v127 + 1) + 8 * k);
                            uint64_t v58 = [v57 entitlementType];
                            if (!v58) {
                              goto LABEL_67;
                            }
                            v59 = (void *)v58;
                            v60 = [v57 entitlementType];
                            if ([v60 isEqualToNumber:&unk_1F3F3C6C8])
                            {

LABEL_67:
                              v63 = [VUISidebandSeriesMediaCollection alloc];
                              id v64 = [v115 properties];
                              v65 = [(VUISidebandSeriesMediaCollection *)v63 initWithMediaLibrary:v109 seriesManagedObject:v51 requestedProperties:v64];

                              [v113 addObject:v65];
                              goto LABEL_68;
                            }
                            uint64_t v61 = [v57 entitlementType];
                            int v62 = [v61 isEqualToNumber:&unk_1F3F3C6E0];

                            if (v62) {
                              goto LABEL_67;
                            }
                          }
                          uint64_t v54 = [v52 countByEnumeratingWithState:&v127 objects:v149 count:16];
                          if (v54) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_68:
                    }
                    uint64_t v111 = [v106 countByEnumeratingWithState:&v131 objects:v150 count:16];
                  }
                  while (v111);
                  goto LABEL_70;
                }
              }
              else
              {
                id v15 = [v3[261] season];

                if (v10 != v15) {
                  goto LABEL_48;
                }
                id v16 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"TVSeason"];
                id v17 = [*(id *)(*(void *)(*(void *)(v8 + 56) + 8) + 40) executeFetchRequest:v16 error:0];
                long long v123 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                long long v126 = 0u;
                id v106 = v17;
                uint64_t v110 = [v17 countByEnumeratingWithState:&v123 objects:v148 count:16];
                if (v110)
                {
                  id v102 = v16;
                  uint64_t v104 = v9;
                  uint64_t v107 = *(void *)v124;
                  do
                  {
                    for (uint64_t m = 0; m != v110; ++m)
                    {
                      if (*(void *)v124 != v107) {
                        objc_enumerationMutation(v106);
                      }
                      id v19 = *(void **)(*((void *)&v123 + 1) + 8 * m);
                      long long v119 = 0u;
                      long long v120 = 0u;
                      long long v121 = 0u;
                      long long v122 = 0u;
                      uint64_t v20 = [v19 episodes];
                      uint64_t v21 = [v20 countByEnumeratingWithState:&v119 objects:v147 count:16];
                      if (v21)
                      {
                        uint64_t v22 = v21;
                        uint64_t v23 = *(void *)v120;
                        while (2)
                        {
                          for (uint64_t n = 0; n != v22; ++n)
                          {
                            if (*(void *)v120 != v23) {
                              objc_enumerationMutation(v20);
                            }
                            uint64_t v25 = *(void **)(*((void *)&v119 + 1) + 8 * n);
                            uint64_t v26 = [v25 entitlementType];
                            if (!v26) {
                              goto LABEL_32;
                            }
                            uint64_t v27 = (void *)v26;
                            id v28 = [v25 entitlementType];
                            if ([v28 isEqualToNumber:&unk_1F3F3C6C8])
                            {

LABEL_32:
                              long long v31 = [VUISidebandSeasonMediaCollection alloc];
                              uint64_t v32 = [v115 properties];
                              id v33 = [(VUISidebandSeasonMediaCollection *)v31 initWithMediaLibrary:v109 seasonManagedObject:v19 requestedProperties:v32];

                              [v113 addObject:v33];
                              goto LABEL_33;
                            }
                            long long v29 = [v25 entitlementType];
                            int v30 = [v29 isEqualToNumber:&unk_1F3F3C6E0];

                            if (v30) {
                              goto LABEL_32;
                            }
                          }
                          uint64_t v22 = [v20 countByEnumeratingWithState:&v119 objects:v147 count:16];
                          if (v22) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_33:
                    }
                    uint64_t v110 = [v106 countByEnumeratingWithState:&v123 objects:v148 count:16];
                  }
                  while (v110);
LABEL_70:
                  id WeakRetained = v109;
                  uint64_t v8 = v98;
                  uint64_t v3 = &off_1E6DF2000;
                  id v16 = v102;
                  uint64_t v9 = v104;
                }
              }
LABEL_47:

LABEL_48:
              ++v9;
            }
            while (v9 != v101);
            uint64_t v66 = [v99 countByEnumeratingWithState:&v139 objects:v152 count:16];
            uint64_t v101 = v66;
          }
          while (v66);
        }

        id v67 = v113;
        v68 = [v115 predicate];

        v69 = v67;
        if (v68)
        {
          v70 = [v115 predicate];
          v69 = [v67 filteredArrayUsingPredicate:v70];
        }
        uint64_t v72 = v95;
        unint64_t v71 = v96;
        if (v96 == 0x7FFFFFFFFFFFFFFFLL || v95 == 0)
        {
          v74 = v69;
        }
        else
        {
          id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v74 = v75;
          if (v96 < v96 + v95)
          {
            do
            {
              if (v71 >= [v69 count]) {
                break;
              }
              v76 = [v69 objectAtIndex:v71];
              [v74 addObject:v76];

              ++v71;
              --v72;
            }
            while (v72);
          }
        }
        id v77 = v74;
        v78 = VUISidebandMediaItemKind();
        if ([v115 _isItemsFetch])
        {
          uint64_t v79 = VUISidebandMediaItemKind();
        }
        else if ([v115 _isShowsFetch])
        {
          uint64_t v79 = VUISidebandSeriesMediaCollectionKind();
        }
        else
        {
          if (![v115 _isSeasonsFetch]) {
            goto LABEL_91;
          }
          uint64_t v79 = VUISidebandSeasonMediaCollectionKind();
        }
        v80 = (void *)v79;

        v78 = v80;
LABEL_91:
        uint64_t v81 = [v115 _manualSortDescriptorsWithMediaEntityKind:v78 propertiesRequiredForSort:0];
        v82 = v77;
        if (v81)
        {
          v82 = [v77 sortedArrayUsingDescriptors:v81];
        }
        v83 = [v115 _sortIndexPropertyKeyWithMediaEntityKind:v78];
        v114 = (void *)v81;
        if (v83)
        {
          v84 = +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:v82 sortIndexPropertyKey:v83];
        }
        else
        {
          v84 = 0;
        }
        uint64_t v85 = [v115 groupingKeyPath];
        if (v85)
        {
          id v112 = v77;
          id v86 = v67;
          v87 = [v115 groupingSortComparator];
          uint64_t v88 = +[VUIMediaLibraryUtilities groupingForMediaEntities:v82 groupingKeyPath:v85 groupingSortComparator:v87 performDefaultSort:1 sortIndexPropertyKey:v83];

          if ([v115 _shouldGenerateGroupingSortIndexes])
          {
            v89 = +[VUIMediaLibraryUtilities sortIndexesForGrouping:v88];
          }
          else
          {
            v89 = 0;
          }
          id v67 = v86;
          id v77 = v112;
        }
        else
        {
          uint64_t v88 = 0;
          v89 = 0;
        }
        id v90 = objc_alloc_init(VUIMediaEntityFetchResponse);
        [(VUIMediaEntityFetchResponse *)v90 setMediaEntities:v82];
        [(VUIMediaEntityFetchResponse *)v90 setSortIndexes:v84];
        [(VUIMediaEntityFetchResponse *)v90 setGrouping:v88];
        [(VUIMediaEntityFetchResponse *)v90 setGroupingSortIndexes:v89];
        [*(id *)(v98 + 40) addObject:v90];

        uint64_t v4 = v97 + 1;
        id WeakRetained = v109;
        uint64_t v3 = &off_1E6DF2000;
      }
      while (v97 + 1 != v94);
      uint64_t v94 = [obj countByEnumeratingWithState:&v143 objects:v153 count:16];
    }
    while (v94);
  }

  v91 = [WeakRetained manager];
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4;
  v116[3] = &unk_1E6DF41E8;
  id v118 = *(id *)(v98 + 48);
  id v117 = *(id *)(v98 + 40);
  [v91 _enqueueCompletionQueueBlock:v116];
}

uint64_t __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = [(VUIMediaLibrary *)self manager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__VUISidebandMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E6DF3DD0;
    id v10 = v5;
    [v6 _enqueueCompletionQueueBlock:v9];
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3C38]) initWithOperation:0];

  return v7;
}

uint64_t __61__VUISidebandMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_imageLoaderIdentifier
{
  return @"Sideband library";
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v4 = v3) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The imageLoaderObject parameter must be an instance of VUISidebandMediaEntityImageLoadParams"];
    id v4 = 0;
  }

  return v4;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  uint64_t v9 = -[VUIImageLoadParamsOperation initWithParams:scaleToSize:cropToFit:]([VUISidebandMediaEntityImageLoadOperation alloc], "initWithParams:scaleToSize:cropToFit:", v8, v5, width, height);

  return v9;
}

- (id)_movieForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"adamID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"Movie" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

- (id)_tvEpisodeForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"adamID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"TVEpisode" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

- (id)_tvSeasonForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"canonicalID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"TVSeason" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

- (id)_tvSeasonForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"adamID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"TVSeason" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

- (id)_comingSoonVideoForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"canonicalID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"ComingSoonVideo" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

- (id)_tvSeriesForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"canonicalID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"TVSeries" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

- (id)_tvSeriesForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"adamID", a3];
  uint64_t v9 = [(VUISidebandMediaLibrary *)self _managedObjectWithEntityName:@"TVSeries" predicate:v8 createIfNeeded:v6 wasCreated:a5];

  return v9;
}

void __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) executeFetchRequest:a1[4] error:0];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __72__VUISidebandMediaLibrary__countForFetchRequest_usingMainThreadContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_managedObjectWithEntityName:(id)a3 predicate:(id)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a6) {
    *a6 = 0;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:v10];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  id v13 = [(VUISidebandMediaLibrary *)self serialQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__VUISidebandMediaLibrary__managedObjectWithEntityName_predicate_createIfNeeded_wasCreated___block_invoke;
  v18[3] = &unk_1E6DF4B00;
  void v18[4] = self;
  v18[5] = &v19;
  dispatch_sync(v13, v18);

  [v12 setPredicate:v11];
  long long v14 = [(id)v20[5] executeFetchRequest:v12 error:0];
  id v15 = [v14 firstObject];
  if (!v15 && v7)
  {
    id v16 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Creating managed object for entity name %@", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:v10 inManagedObjectContext:v20[5]];
    if (a6) {
      *a6 = 1;
    }
  }

  _Block_object_dispose(&v19, 8);
  return v15;
}

void __92__VUISidebandMediaLibrary__managedObjectWithEntityName_predicate_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_removeDownloadedMediaForVideoManagedObject:(id)a3 markAsDeleted:(BOOL)a4 saveWhenDone:(BOOL)a5 invalidateImmediately:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 localPlaybackURL];
    id v13 = sLogObject_2;
    BOOL v14 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v12;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Deleting downloaded video at %@", buf, 0xCu);
      }
      [v11 setLocalPlaybackURL:0];
      id v15 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke;
      block[3] = &unk_1E6DF3D58;
      id v22 = v12;
      dispatch_async(v15, block);
    }
    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "No file path exists for managed object; not deleting existing downloaded video",
        buf,
        2u);
    }
    id v17 = sLogObject_2;
    BOOL v18 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Marking video as deleted", buf, 2u);
      }
      [v11 setMarkedAsDeleted:1];
      [v11 setHasExpirationDate:0];
      [v11 setAllowsManualRenewal:0];
      [v11 setAvailabilityEndDate:0];
      [v11 setShouldMarkAsDeletedAfterCancellationOrFailure:0];
    }
    else if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "NOT marking video as deleted", buf, 2u);
    }
    BOOL v16 = [(VUISidebandMediaLibrary *)self _invalidateKeysForVideoManagedObject:v11 saveWhenDone:0 invalidateImmediately:v6];
    uint64_t v19 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Removing offline FPS keys from database and setting state to NotDownloaded", buf, 2u);
    }
    [v11 setDownloadState:0];
    [v11 setEnqueuedOrder:0];
    if (v7) {
      [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      -[VUISidebandMediaLibrary _removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:]();
    }
    BOOL v16 = 0;
  }

  return v16;
}

void __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = (uint64_t *)(a1 + 32);
  id v9 = 0;
  int v5 = [v2 removeItemAtURL:v4 error:&v9];
  id v6 = v9;

  BOOL v7 = sLogObject_2;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted file; removing local playback URL from database",
        v8,
        2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
  {
    __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke_cold_1(v3, (uint64_t)v6, v7);
  }
}

- (BOOL)_invalidateKeysForVideoManagedObject:(id)a3 saveWhenDone:(BOOL)a4 invalidateImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  if (!v53)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR)) {
      -[VUISidebandMediaLibrary _invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:]();
    }
    BOOL v39 = 0;
    goto LABEL_43;
  }
  uint64_t v63 = 0;
  id v64 = &v63;
  uint64_t v65 = 0x3032000000;
  uint64_t v66 = __Block_byref_object_copy__1;
  id v67 = __Block_byref_object_dispose__1;
  id v68 = 0;
  BOOL v7 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v63;
  long long v52 = self;
  dispatch_sync(v7, block);

  BOOL v8 = (id)sLogObject_2;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v53 fpsKeyInfo];
    uint64_t v10 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v71 = v10;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu key info(s) for this video.  Finding one to use for invalidation", buf, 0xCu);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = [v53 fpsKeyInfo];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (!v12)
  {
LABEL_20:

    goto LABEL_28;
  }
  uint64_t v13 = *(void *)v59;
LABEL_6:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v59 != v13) {
      objc_enumerationMutation(v11);
    }
    id v15 = *(void **)(*((void *)&v58 + 1) + 8 * v14);
    if (([v15 isLowValue] & 1) == 0) {
      break;
    }
    BOOL v16 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v71 = (uint64_t)v15;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring low value key that cannot be used for invalidation: %@", buf, 0xCu);
    }
LABEL_18:
    if (v12 == ++v14)
    {
      uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v69 count:16];
      if (v12) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
  id v17 = [v15 expirationDate];
  BOOL v18 = v17;
  if (v17)
  {
    if ((objc_msgSend(v17, "vui_isInTheFuture") & 1) == 0)
    {
      uint64_t v19 = [v15 playbackExpirationStartDate];
      BOOL v20 = v19 == 0;

      if (v20)
      {
        uint64_t v21 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v71 = (uint64_t)v15;
          _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Not invalidating expired key: %@", buf, 0xCu);
        }

        goto LABEL_18;
      }
    }
  }
  id v22 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v71 = (uint64_t)v15;
    _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Found key to invalidate: %@", buf, 0xCu);
  }
  id v23 = v15;

  if (v23)
  {
    id v24 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v25 = [v23 contentID];
    id v26 = [v24 predicateWithFormat:@"%K == %@", @"contentID", v25];

    uint64_t v27 = [(VUISidebandMediaLibrary *)v52 _managedObjectWithEntityName:@"FPSKeyDeletionInfo" predicate:v26 createIfNeeded:1 wasCreated:0];
    id v28 = [v53 fpsKeyServerURL];
    [v27 setFpsKeyServerURL:v28];

    long long v29 = [v53 fpsNonceURL];
    [v27 setFpsNonceURL:v29];

    int v30 = [v53 additionalFPSRequestParamsJSONData];
    [v27 setAdditionalFPSRequestParamsJSONData:v30];

    long long v31 = [v53 dsid];
    [v27 setDsid:v31];

    uint64_t v32 = [v23 keyURI];
    [v27 setKeyURI:v32];

    id v33 = [v23 keyData];
    [v27 setKeyData:v33];

    char v34 = [v23 expirationDate];
    [v27 setExpirationDate:v34];

    double v35 = [v23 playbackExpirationStartDate];
    [v27 setPlaybackExpirationStartDate:v35];

    long long v36 = [v23 contentID];
    [v27 setContentID:v36];

    if (!v5)
    {
      id v37 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, "Created key deletion info, but invalidateImmediately is NO.  Will add to penalty box to prevent invalidation, and will skip invalidation", buf, 2u);
      }
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_230;
    v55[3] = &unk_1E6DF51F0;
    BOOL v57 = v5;
    id v56 = v27;
    id v38 = v27;
    dispatch_async(MEMORY[0x1E4F14428], v55);

    BOOL v39 = 1;
    goto LABEL_40;
  }
LABEL_28:
  if (!v5)
  {
LABEL_37:
    id v48 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v48, OS_LOG_TYPE_DEFAULT, "No key info exists for invalidation", buf, 2u);
    }
    goto LABEL_39;
  }
  BOOL v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"FPSKeyDeletionInfo"];
  uint64_t v41 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v42 = [v53 adamID];
  uint64_t v43 = [v41 predicateWithFormat:@"%K == %@", @"contentID", v42];

  [v40 setPredicate:v43];
  uint64_t v44 = [(id)v64[5] executeFetchRequest:v40 error:0];
  if (![v44 count])
  {

    goto LABEL_37;
  }
  uint64_t v45 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v45, OS_LOG_TYPE_DEFAULT, "No key info exists for invalidation, but found a previously existing deletion info for this video.  Removing it from the penalty box and performing invalidation", buf, 2u);
  }
  uint64_t v46 = +[VUISecureInvalidationManager sharedInstance];
  id v47 = [v44 firstObject];
  [v46 removeDeletionInfoFromPenaltyBox:v47];

  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_233);
LABEL_39:
  BOOL v39 = 0;
  id v23 = 0;
LABEL_40:
  id v49 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v49, OS_LOG_TYPE_DEFAULT, "Removing offline FPS keys from database", buf, 2u);
  }
  __int16 v50 = [v53 fpsKeyInfo];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_234;
  v54[3] = &unk_1E6DF5218;
  v54[4] = &v63;
  [v50 enumerateObjectsUsingBlock:v54];

  _Block_object_dispose(&v63, 8);
LABEL_43:

  return v39;
}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_230(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = +[VUISecureInvalidationManager sharedInstance];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (v2)
  {
    [v3 removeDeletionInfoFromPenaltyBox:v4];

    id v5 = +[VUISecureInvalidationManager sharedInstance];
    [v5 invalidateKeysForDeletedVideos];
  }
  else
  {
    [v3 addDeletionInfoToPenaltyBox:v4];
  }
}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_231()
{
  id v0 = +[VUISecureInvalidationManager sharedInstance];
  [v0 invalidateKeysForDeletedVideos];
}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_234(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) deleteObject:a2];
  int v2 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v3 = +[VUIOfflineKeyRenewalManager sharedInstance];
  [v2 cancelPreviousPerformRequestsWithTarget:v3 selector:sel_updateKeyRenewalAndExpiration object:0];

  id v4 = +[VUIOfflineKeyRenewalManager sharedInstance];
  [v4 performSelector:sel_updateKeyRenewalAndExpiration withObject:0 afterDelay:0.0];
}

- (void)_mainQueueManagedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  id v6 = [v4 userInfo];
  BOOL v7 = [v6 objectForKey:*MEMORY[0x1E4F1BDF8]];

  BOOL v8 = [v4 userInfo];
  id v9 = [v8 objectForKey:*MEMORY[0x1E4F1BFA8]];

  uint64_t v10 = [v4 userInfo];
  id v11 = [v10 objectForKey:*MEMORY[0x1E4F1BDC0]];

  if ([v7 count])
  {
    uint64_t v12 = [v5 setByAddingObjectsFromSet:v7];

    id v5 = (id)v12;
  }
  if ([v9 count])
  {
    uint64_t v13 = [v5 setByAddingObjectsFromSet:v9];

    id v5 = (id)v13;
  }
  if ([v11 count])
  {
    uint64_t v14 = [v5 setByAddingObjectsFromSet:v11];

    id v5 = (id)v14;
  }
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke;
  v31[3] = &unk_1E6DF5240;
  v31[4] = v32;
  [v5 enumerateObjectsUsingBlock:v31];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__1;
  long long v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  id v15 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_2;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v25;
  dispatch_sync(v15, block);

  objc_initWeak(&location, self);
  BOOL v16 = (void *)v26[5];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_3;
  v18[3] = &unk_1E6DF5268;
  BOOL v20 = &v25;
  id v17 = v4;
  id v19 = v17;
  uint64_t v21 = v32;
  objc_copyWeak(&v22, &location);
  [v16 performBlock:v18];
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v32, 8);
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundManagedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 32)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Done merging changes to background context; Will post media library contents did change notification on next run loop",
        buf,
        2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_241;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v4, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v4);
  }
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_241(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postContentsDidChangeNotification];
}

- (id)_mainContextManagedObjectsForObjects:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  id v6 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VUISidebandMediaLibrary__mainContextManagedObjectsForObjects___block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v19;
  dispatch_sync(v6, block);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objectID", (void)v14);
        uint64_t v12 = [(id)v20[5] objectWithID:v11];
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
  return v5;
}

void __64__VUISidebandMediaLibrary__mainContextManagedObjectsForObjects___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_deleteVideoManagedObjects:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  uint64_t v3 = -[VUISidebandMediaLibrary _mainContextManagedObjectsForObjects:](self, "_mainContextManagedObjectsForObjects:");
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  int v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v69 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 |= [(VUISidebandMediaLibrary *)self _removeDownloadedMediaForVideoManagedObject:*(void *)(*((void *)&v68 + 1) + 8 * i) markAsDeleted:1 saveWhenDone:0 invalidateImmediately:1];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v5);
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v65 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v15 = [v14 series];
          long long v16 = [v14 season];
          if (v15) {
            [v8 addObject:v15];
          }
          if (v16) {
            [v9 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v11);
  }

  uint64_t v58 = 0;
  long long v59 = &v58;
  uint64_t v60 = 0x3032000000;
  long long v61 = __Block_byref_object_copy__1;
  int v62 = __Block_byref_object_dispose__1;
  id v63 = 0;
  long long v17 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VUISidebandMediaLibrary__deleteVideoManagedObjects___block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v58;
  dispatch_sync(v17, block);

  uint64_t v42 = v9;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v10;
  uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v76 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v53 + 1) + 8 * k);
        id v22 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v21;
          _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Deleting managed object %@", buf, 0xCu);
        }
        [(id)v59[5] deleteObject:v21];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v76 count:16];
    }
    while (v18);
  }

  [(id)v59[5] processPendingChanges];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v23 = v42;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v73 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v50;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void **)(*((void *)&v49 + 1) + 8 * m);
        id v28 = [v27 episodes];
        BOOL v29 = [v28 count] == 0;

        if (v29)
        {
          id v30 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v27;
            _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "No more episodes exist for season.  Deleting managed object %@", buf, 0xCu);
          }
          [(id)v59[5] deleteObject:v27];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v73 count:16];
    }
    while (v24);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v31 = v8;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v72 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v31);
        }
        double v35 = *(void **)(*((void *)&v45 + 1) + 8 * n);
        long long v36 = [v35 episodes];
        BOOL v37 = [v36 count] == 0;

        if (v37)
        {
          id v38 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v35;
            _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "No more episodes exist for series.  Deleting managed object %@", buf, 0xCu);
          }
          [(id)v59[5] deleteObject:v35];
        }
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v72 count:16];
    }
    while (v32);
  }

  [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];
  if ((v4 & 1) == 0)
  {
    BOOL v39 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v39, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because no videos will be invalidated", buf, 2u);
    }
    BOOL v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 postNotificationName:@"VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification" object:0];
  }
  _Block_object_dispose(&v58, 8);
}

void __54__VUISidebandMediaLibrary__deleteVideoManagedObjects___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_deleteComingSoonVideoManagedObjects:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int v4 = -[VUISidebandMediaLibrary _mainContextManagedObjectsForObjects:](self, "_mainContextManagedObjectsForObjects:");
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  id v5 = [(VUISidebandMediaLibrary *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VUISidebandMediaLibrary__deleteComingSoonVideoManagedObjects___block_invoke;
  block[3] = &unk_1E6DF4B00;
  void block[4] = self;
  block[5] = &v18;
  dispatch_sync(v5, block);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v10;
          _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Deleting coming soon managed object %@", buf, 0xCu);
        }
        [(id)v19[5] deleteObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v26 count:16];
    }
    while (v7);
  }

  [(id)v19[5] processPendingChanges];
  [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];
  _Block_object_dispose(&v18, 8);
}

void __64__VUISidebandMediaLibrary__deleteComingSoonVideoManagedObjects___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = [a2 path];
  if (!v9 || (char v5 = [*(id *)(a1 + 32) fileExistsAtPath:v9], v6 = (void *)v9, (v5 & 1) == 0))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 48) objectAtIndex:a3];
    [v7 addObject:v8];

    id v6 = (void *)v9;
  }
}

- (void)_removeDownloadsForNonSignedInUsers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUISidebandMediaLibrary *)self _downloadedVideosForNonSignedInUsers];
  int v4 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v3 count];
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Removing %lu downloads for users that are not signed in", buf, 0xCu);
  }
  if ([v3 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[VUISidebandMediaLibrary _removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:](self, "_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), 1, 0, 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(VUISidebandMediaLibrary *)self saveChangesToManagedObjects];
  }
}

- (void)_activeAccountDidChange:(id)a3
{
  int v4 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Active account did change", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUISidebandMediaLibrary__activeAccountDidChange___block_invoke;
  block[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v6, buf);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __51__VUISidebandMediaLibrary__activeAccountDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeDownloadsForNonSignedInUsers];
}

- (id)performFetch:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__1;
  long long v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  char v5 = [(VUISidebandMediaLibrary *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__VUISidebandMediaLibrary_performFetch___block_invoke;
  v8[3] = &unk_1E6DF4B00;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = [(id)v10[5] executeFetchRequest:v4 error:0];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__VUISidebandMediaLibrary_performFetch___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentContainer];
  uint64_t v2 = [v5 viewContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_backgroundManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (unint64_t)countOfDownloadedVideosWithSeasonCanonicalId:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithEntityName:@"TVEpisode"];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND %K == %@ AND season.canonicalID == %@", @"markedAsDeleted", @"downloadState", &unk_1F3F3DFB8, v5];

  [v6 setPredicate:v7];
  unint64_t v8 = [(VUISidebandMediaLibrary *)self countForFetchRequest:v6 usingMainThreadContext:1];

  return v8;
}

- (unint64_t)countOfDownloadedOrDownloadingVideosWithSeasonCanonicalId:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithEntityName:@"TVEpisode"];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3DFB8, &unk_1F3F3DFD0, &unk_1F3F3DFE8, 0);
  unint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND %K IN %@ AND season.canonicalID == %@", @"markedAsDeleted", @"downloadState", v7, v5];

  [v6 setPredicate:v8];
  unint64_t v9 = [(VUISidebandMediaLibrary *)self countForFetchRequest:v6 usingMainThreadContext:1];

  return v9;
}

- (BOOL)hasDownloadingVideosWithSeasonCanonicalId:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithEntityName:@"TVEpisode"];
  [v6 setFetchLimit:1];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3DFD0, &unk_1F3F3DFE8, 0);
  unint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NO AND %K IN %@ AND season.canonicalID == %@", @"markedAsDeleted", @"downloadState", v7, v5];

  [v6 setPredicate:v8];
  LOBYTE(self) = [(VUISidebandMediaLibrary *)self countForFetchRequest:v6 usingMainThreadContext:1] != 0;

  return (char)self;
}

- (unint64_t)countOfComingSoonVideosWithShowCanonicalId:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUISidebandMediaLibrary *)self seriesForCanonicalIDOrAdamID:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "seasons", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) comingSoonVideos];
        v7 += [v10 count];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)countOfComingSoonVideosWithSeasonCanonicalId:(id)a3
{
  uint64_t v3 = [(VUISidebandMediaLibrary *)self seasonForCanonicalIDOrAdamID:a3 createIfNeeded:0];
  id v4 = [v3 comingSoonVideos];
  unint64_t v5 = [v4 count];

  return v5;
}

- (void)initWithManager:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to load store descriptions for defaultDirectoryURL %@", buf, 0xCu);
}

- (void)initWithManager:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to find sideband library managed object model", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to find/add video because it has no adam ID or playback URL is nil", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to save video post play image because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.3()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to save video preview frame because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.4()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to save video cover art because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.5()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to serialize vpafMetrics data: %@", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.6()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to serialize fpsAdditionalServerParams data: %@", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.7()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to find/add managed object for video because it has no series canonical ID", v2, v3, v4, v5, v6);
}

- (void)videoForPlayable:.cold.8()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to save series cover art because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
}

- (void)videoForMPMediaItem:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to find/add video because it has no adam ID", v2, v3, v4, v5, v6);
}

- (void)_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to remove media because video managed object is nil", v2, v3, v4, v5, v6);
}

void __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to delete contents at %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to invalidate keys because video managed object is nil", v2, v3, v4, v5, v6);
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to retrieve Library directory contents: %@", v2, v3, v4, v5, v6);
}

- (void)_pruneVideosAtAppLaunchWithCompletion:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4 = objc_begin_catch(a1);
  *a3 = v4;
  id v5 = v4;
  uint8_t v6 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because an exception occurred", v7, 2u);
  }
}

@end