@interface XBApplicationSnapshotManifestImpl
+ (BOOL)isUnderMemoryPressure;
+ (BOOL)supportsSecureCoding;
+ (id)_snapshotPredicateForRequest:(id)a3;
+ (id)acquireManifestForContainerIdentity:(id)a3 store:(id)a4 creatingIfNecessary:(BOOL)a5;
+ (int64_t)_outputFormatForSnapshot:(id)a3;
+ (void)_configureSnapshot:(id)a3 withCompatibilityInfo:(id)a4 forLaunchRequest:(id)a5;
+ (void)_workloop_noteManifestInvalidated:(id)a3;
+ (void)initialize;
+ (void)relinquishManifest:(id)a3;
- (BOOL)_access_snapshotsConsideredUnpurgableByAPFS;
- (BOOL)_access_validateWithContainerIdentity:(id)a3;
- (BOOL)_imageAccessQueue_saveData:(id)a3 forSnapshot:(id)a4;
- (BOOL)_invalidate;
- (BOOL)_validateWithContainerIdentity:(id)a3;
- (BOOL)snapshotsConsideredUnpurgableByAPFS;
- (NSString)description;
- (XBApplicationSnapshotManifestImpl)init;
- (XBApplicationSnapshotManifestImpl)initWithCoder:(id)a3;
- (XBSnapshotContainerIdentity)containerIdentity;
- (XBSnapshotManifestIdentity)identity;
- (id)_access_allSnapshotGroups;
- (id)_access_snapshotGroupForID:(id)a3 creatingIfNeeded:(BOOL)a4;
- (id)_access_snapshotsForGroupIDs:(id)a3;
- (id)_access_snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4;
- (id)_access_snapshotsMatchingPredicate:(id)a3;
- (id)_allSnapshotGroups;
- (id)_createSnapshotWithGroupID:(id)a3 generationContext:(id)a4;
- (id)_descriptionForStateCaptureWithMultilinePrefix:(id)a3;
- (id)_generatableSnapshotForGroupID:(id)a3 generationContext:(id)a4;
- (id)_initWithContainerIdentity:(id)a3;
- (id)_snapshotGroupsByID;
- (id)bundleIdentifier;
- (id)containerPath;
- (id)createSnapshotWithGroupID:(id)a3;
- (id)createVariantForSnapshot:(id)a3 withIdentifier:(id)a4;
- (id)defaultGroupIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)snapshotsForGroupID:(id)a3;
- (id)snapshotsForGroupID:(id)a3 fetchRequest:(id)a4;
- (id)snapshotsForGroupID:(id)a3 matchingPredicate:(id)a4;
- (id)snapshotsForGroupIDs:(id)a3;
- (id)snapshotsForGroupIDs:(id)a3 fetchRequest:(id)a4;
- (id)snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_access_accessSnapshotsWithBlock:(id)a3 completion:(id)a4;
- (void)_access_addSnapshotToGroup:(id)a3;
- (void)_access_deletePaths:(id)a3;
- (void)_access_deleteSnapshots:(id)a3;
- (void)_access_doArchiveWithCompletions:(id)a3;
- (void)_access_gatherPaths:(id)a3 forSnapshot:(id)a4;
- (void)_access_purgeSnapshotsWithProtectedContent;
- (void)_access_updateSnapshotsAPFSPurgability:(BOOL)a3;
- (void)_access_workloop_reapExpiredAndInvalidSnapshots;
- (void)_addSnapshotToGroup:(id)a3;
- (void)_commonInit;
- (void)_didGenerateImage:(BOOL)a3 imageGenerationSignal:(id)a4 logIdentifier:(id)a5 imageGeneratedHandler:(id)a6 qos:(unsigned int)a7;
- (void)_didGenerateImageData:(id)a3 forSnapshot:(id)a4 imageWasGenerated:(BOOL)a5 imageDataGenerationSignal:(id)a6 logIdentifier:(id)a7 didSaveHandler:(id)a8 qos:(unsigned int)a9 writeToFileIfSupported:(BOOL)a10;
- (void)_handleMemoryPressure;
- (void)_noteDirtied;
- (void)_reapExpiredAndInvalidSnapshots;
- (void)_scheduleArchivingIfNecessaryWithCompletion:(id)a3;
- (void)_scheduleArchivingIfNecessaryWithDelay:(double)a3 completion:(id)a4;
- (void)_setContainerIdentity:(id)a3;
- (void)_synchronizeDataStoreWithCompletion:(id)a3;
- (void)_workloop_checkClientCount;
- (void)_workloop_decrementClientCount;
- (void)_workloop_incrementClientCount;
- (void)_workloop_reallyCheckClientCount;
- (void)archive;
- (void)beginSnapshotAccessTransaction:(id)a3 completion:(id)a4;
- (void)beginTrackingImageDeletions;
- (void)dealloc;
- (void)deleteAllSnapshots;
- (void)deleteSnapshot:(id)a3;
- (void)deleteSnapshots:(id)a3;
- (void)deleteSnapshotsForGroupID:(id)a3;
- (void)deleteSnapshotsForGroupID:(id)a3 matchingPredicate:(id)a4;
- (void)deleteSnapshotsForGroupID:(id)a3 predicateBuilder:(id)a4;
- (void)deleteSnapshotsMatchingPredicate:(id)a3;
- (void)deleteSnapshotsUsingPredicateBuilder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingImageDeletions;
- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7;
- (void)purgeSnapshotsWithProtectedContent;
- (void)saveSnapshot:(id)a3 atPath:(id)a4 withContext:(id)a5;
- (void)updateSnapshotsAPFSPurgability:(BOOL)a3;
@end

@implementation XBApplicationSnapshotManifestImpl

- (void)_access_workloop_reapExpiredAndInvalidSnapshots
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_2232AB000, v0, v1, "%{public}@ Cancelling reaping timer as we've just reaped", v2, v3, v4, v5, v6);
}

- (id)snapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v12 = a3;
  uint8_t v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:matchingPredicate:](self, "snapshotsForGroupIDs:matchingPredicate:", v9, v7, v12, v13);

  return v10;
}

- (id)snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  id v8 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v6 matchingPredicate:v7];
  os_unfair_lock_unlock(&self->_accessLock);
  v9 = XBLogFetchRequests();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    int v12 = 138413058;
    uint64_t v13 = logIdentifier;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_2232AB000, v9, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:matchingPredicate: given groupIDs: %@; predicate: %@; returning matchingSnapshots:\n%@",
      (uint8_t *)&v12,
      0x2Au);
  }

  return v8;
}

- (id)snapshotsForGroupIDs:(id)a3 fetchRequest:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 predicate];
  v9 = XBLogFetchRequests();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    *(_DWORD *)buf = 138412802;
    v54 = logIdentifier;
    __int16 v55 = 2112;
    id v56 = v6;
    __int16 v57 = 2112;
    id v58 = v7;
    _os_log_debug_impl(&dword_2232AB000, v9, OS_LOG_TYPE_DEBUG, "[%@] BEGIN snapshotsForGroupIDs:fetchRequest: groupIDs: %@; fetchRequest: %@",
      buf,
      0x20u);
  }

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v49 = self;
  if (v8)
  {
    v11 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v6 matchingPredicate:v8];
    int v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = XBLogFetchRequests();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = self->_logIdentifier;
      objc_msgSend(v12, "bs_map:", &__block_literal_global_234);
      v16 = id v15 = v6;
      *(_DWORD *)buf = 138412802;
      v54 = v14;
      self = v49;
      __int16 v55 = 2112;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v16;
      _os_log_debug_impl(&dword_2232AB000, v13, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has predicate %@; retrieved matchingSnapshots:\n\t%@",
        buf,
        0x20u);

      id v6 = v15;
    }
  }
  else
  {
    id v17 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v6];
    int v12 = (void *)[v17 mutableCopy];

    uint64_t v13 = XBLogFetchRequests();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:]((uint64_t)self, v12);
    }
  }

  os_unfair_lock_unlock(p_accessLock);
  __int16 v18 = [v7 fallbackGenerationContext];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = [v18 launchRequest];
    v21 = [v20 urlSchemeName];
    v22 = [v19 applicationCompatibilityInfo];
    v23 = v22;
    v48 = v8;
    if (v21 && v22 && ([v22 launchInterfaceExistsForScheme:v21] & 1) == 0)
    {
      id v24 = v6;
      v25 = (void *)[v20 copy];

      [v25 setUrlSchemeName:0];
      v26 = XBLogFetchRequests();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:]();
      }

      uint64_t v20 = v25;
      id v6 = v24;
      self = v49;
    }
    v27 = +[XBApplicationSnapshotManifestImpl _snapshotPredicateForRequest:v20];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_238;
    v50[3] = &unk_2646A5F70;
    id v28 = v27;
    id v51 = v28;
    v52 = self;
    v29 = [v12 indexesOfObjectsPassingTest:v50];
    if (![v29 count])
    {
      id v46 = v6;
      v30 = [v19 launchRequest];
      uint64_t v31 = [v30 groupID];
      v32 = self;
      v33 = (void *)v31;
      [(XBApplicationSnapshotManifestImpl *)v32 _generatableSnapshotForGroupID:v31 generationContext:v19];
      uint64_t v34 = v47 = v12;

      v35 = (void *)v34;
      int v12 = v47;

      [v47 addObject:v35];
      v36 = XBLogFetchRequests();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v45 = v49->_logIdentifier;
        [v35 logIdentifier];
        v44 = v43 = v35;
        *(_DWORD *)buf = 138412802;
        v54 = v45;
        __int16 v55 = 2112;
        id v56 = v28;
        __int16 v57 = 2112;
        id v58 = v44;
        _os_log_debug_impl(&dword_2232AB000, v36, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has fallbackPredicate %@, no snapshot matched, so generated and added fallbackSnapshot:\n\t%@", buf, 0x20u);

        v35 = v43;
        int v12 = v47;
      }

      id v6 = v46;
    }

    id v8 = v48;
  }
  v37 = [v7 sortDescriptors];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    v39 = [v7 NSSortDescriptors];
    [v12 sortUsingDescriptors:v39];

    v40 = XBLogFetchRequests();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:]((uint64_t)v49, v12);
    }
  }
  return v12;
}

- (id)_access_snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23 = self;
  os_unfair_lock_assert_owner(&self->_accessLock);
  id v8 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        __int16 v14 = [(NSMutableDictionary *)v23->_snapshotGroupsByID objectForKey:v13];
        id v15 = [v14 snapshots];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              if ([v7 evaluateWithObject:v20]) {
                [v8 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v17);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (id)_snapshotPredicateForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[XBApplicationSnapshotPredicate predicate];
  uint64_t v5 = [v3 launchInterfaceIdentifier];
  if (v5) {
    [v4 setLaunchInterfaceIdentifier:v5];
  }
  id v6 = [v3 urlSchemeName];
  [v4 setScheme:v6];

  [v4 setContentTypeMask:2];
  [v3 referenceSize];
  objc_msgSend(v4, "setReferenceSize:");
  objc_msgSend(v4, "setInterfaceOrientationMask:", XBInterfaceOrientationMaskForInterfaceOrientationPair(objc_msgSend(v3, "interfaceOrientation")));
  objc_msgSend(v4, "setStatusBarStateMask:", XBStatusBarStateMaskForStatusBarState(objc_msgSend(v3, "statusBarState")));
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  id v7 = [v3 customSafeAreaInsets];
  [v4 setCustomSafeAreaInsets:v7];

  return v4;
}

- (void)_access_gatherPaths:(id)a3 forSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_accessLock);
  id v8 = [v7 path];

  if (v8)
  {
    uint64_t v9 = [v7 path];
    [v6 addObject:v9];
  }
  uint64_t v10 = [v7 variants];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__XBApplicationSnapshotManifestImpl__access_gatherPaths_forSnapshot___block_invoke;
  v12[3] = &unk_2646A6260;
  id v13 = v6;
  id v11 = v6;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 100));
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000;
  id v6 = __Block_byref_object_copy__2;
  id v7 = __Block_byref_object_dispose__2;
  id v8 = 0;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_3;
  v2[3] = &unk_2646A60F8;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = &v3;
  dispatch_sync((dispatch_queue_t)__ManifestArchiveSchedulingQueue, v2);
  objc_msgSend(*(id *)(a1 + 32), "_access_doArchiveWithCompletions:", v4[5]);
  objc_msgSend(*(id *)(a1 + 32), "_workloop_checkClientCount");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 100));
  _Block_object_dispose(&v3, 8);
}

- (void)_workloop_checkClientCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke;
  block[3] = &unk_2646A5938;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_access_doArchiveWithCompletions:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _access_workloop_reapExpiredAndInvalidSnapshots];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_snapshotGroupsByID allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v28 + 1) + 8 * v9) snapshots];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          int v12 = 1;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_11:

  id v13 = [(XBApplicationSnapshotManifestImpl *)self bundleIdentifier];
  __int16 v14 = [(XBSnapshotManifestIdentity *)self->_identity store];
  id v15 = XBLogFileManifest();
  uint64_t v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543618;
      v33 = logIdentifier;
      __int16 v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_2232AB000, v16, OS_LOG_TYPE_INFO, "%{public}@ Archiving manifest (%p).", buf, 0x16u);
    }

    id v27 = 0;
    uint64_t v18 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v27];
    id v19 = v27;
    if (!v18)
    {
      uint64_t v20 = XBLogFileManifest();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[XBApplicationSnapshotManifestImpl _access_doArchiveWithCompletions:]();
      }
    }
    [v14 persistManifestData:v18 forBundleIdentifier:v13];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_logIdentifier;
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_impl(&dword_2232AB000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ We don't have any snapshots, so we're clearing our manifest data.", buf, 0xCu);
    }

    [v14 clearManifestDataForBundleIdentifier:v13];
  }
  if ([v4 count])
  {
    v22 = dispatch_get_global_queue(21, 0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke;
    v23[3] = &unk_2646A57C0;
    id v24 = v14;
    id v25 = v13;
    id v26 = v4;
    dispatch_async(v22, v23);
  }
}

- (id)bundleIdentifier
{
  uint64_t v2 = [(XBApplicationSnapshotManifestImpl *)self containerIdentity];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (XBSnapshotContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)_access_deleteSnapshots:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = 0;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v8 = 138543874;
    long long v24 = v8;
    do
    {
      uint64_t v12 = 0;
      id v13 = v10;
      uint64_t v25 = v9;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        __int16 v14 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        id v26 = v13;
        int v15 = objc_msgSend(v14, "_shouldDeleteFileOnPurge:", &v26, v24);
        id v10 = v26;

        if (v15)
        {
          uint64_t v16 = XBLogFileManifest();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v11;
            id v18 = v6;
            id v19 = v5;
            logIdentifier = self->_logIdentifier;
            v21 = [v14 logIdentifier];
            *(_DWORD *)buf = v24;
            v32 = logIdentifier;
            uint64_t v5 = v19;
            id v6 = v18;
            uint64_t v11 = v17;
            uint64_t v9 = v25;
            __int16 v33 = 2114;
            __int16 v34 = v21;
            __int16 v35 = 2114;
            id v36 = v10;
            _os_log_impl(&dword_2232AB000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting snapshot %{public}@ for reason: %{public}@", buf, 0x20u);
          }
          [(XBApplicationSnapshotManifestImpl *)self _access_gatherPaths:v5 forSnapshot:v14];
        }
        v22 = [v14 groupID];
        v23 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotGroupForID:v22 creatingIfNeeded:0];

        if ([v23 removeSnapshot:v14]) {
          [(XBApplicationSnapshotManifestImpl *)self _noteDirtied];
        }
        [v14 _invalidate];

        ++v12;
        id v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  [(XBApplicationSnapshotManifestImpl *)self _access_deletePaths:v5];
}

void __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 100));
  --*(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 80))
  {
    uint64_t v3 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  [*(id *)(a1 + 32) _scheduleArchivingIfNecessaryWithCompletion:0];
  uint64_t v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 100);
  os_unfair_lock_unlock(v5);
}

- (void)_noteDirtied
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__XBApplicationSnapshotManifestImpl__noteDirtied__block_invoke;
  block[3] = &unk_2646A5938;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)__ManifestArchiveSchedulingQueue, block);
}

- (void)_scheduleArchivingIfNecessaryWithDelay:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = __ManifestArchiveSchedulingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke;
  block[3] = &unk_2646A6120;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)_scheduleArchivingIfNecessaryWithCompletion:(id)a3
{
}

uint64_t __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_290(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteDirtied];
}

- (id)_access_snapshotGroupForID:(id)a3 creatingIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  uint64_t v7 = [(NSMutableDictionary *)self->_snapshotGroupsByID objectForKey:v6];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = (id)v7;
  }
  if (v8 && v4)
  {
    id v10 = [XBApplicationSnapshotGroup alloc];
    double v11 = [(XBApplicationSnapshotManifestImpl *)self containerIdentity];
    id v9 = [(XBApplicationSnapshotGroup *)v10 _initWithIdentifier:v6 containerIdentity:v11];

    [(NSMutableDictionary *)self->_snapshotGroupsByID setObject:v9 forKey:v6];
  }

  return v9;
}

- (void)_access_deletePaths:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  if ([v4 count])
  {
    uint64_t v5 = XBLogFileManifest();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = logIdentifier;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_2232AB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting paths: %@", buf, 0x16u);
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke;
  v8[3] = &unk_2646A61E8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [(XBApplicationSnapshotManifestImpl *)self _access_accessSnapshotsWithBlock:v8 completion:0];
}

void __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v1 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 100));
  os_unfair_lock_lock(*v1 + 25);
  uint64_t v2 = XBLogSnapshotReaper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_cold_1();
  }

  [*(id *)&(*v1)[14]._os_unfair_lock_opaque invalidate];
  uint64_t v3 = *(void **)&(*v1)[14]._os_unfair_lock_opaque;
  *(void *)&(*v1)[14]._os_unfair_lock_opaque = 0;

  id v4 = *v1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_290;
  v5[3] = &unk_2646A5938;
  v5[4] = v4;
  [(os_unfair_lock_s *)v4 _access_accessSnapshotsWithBlock:0 completion:v5];
  os_unfair_lock_unlock(*v1 + 25);
}

- (void)_access_accessSnapshotsWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  BOOL v8 = _os_activity_create(&dword_2232AB000, "XBCapture", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  os_unfair_lock_assert_owner(&self->_accessLock);
  unint64_t pendingOperations = self->_pendingOperations;
  if (!pendingOperations)
  {
    id v10 = (NSFileManager *)objc_alloc_init(MEMORY[0x263F08850]);
    imageAccessFileManger = self->_imageAccessFileManger;
    self->_imageAccessFileManger = v10;

    unint64_t pendingOperations = self->_pendingOperations;
  }
  self->_unint64_t pendingOperations = pendingOperations + 1;
  uint64_t v12 = __ManifestImageAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke;
  block[3] = &unk_2646A6198;
  block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);

  os_activity_scope_leave(&state);
}

- (id)defaultGroupIdentifier
{
  uint64_t v2 = [(XBApplicationSnapshotManifestImpl *)self identity];
  uint64_t v3 = [v2 defaultGroupIdentifier];

  return v3;
}

- (XBSnapshotManifestIdentity)identity
{
  return self->_identity;
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_238(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if ([*(id *)(a1 + 32) evaluateWithObject:v6]
    && [v6 isValid])
  {
    *a4 = 1;
    id v7 = XBLogFetchRequests();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 112);
      uint64_t v12 = [v6 logIdentifier];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_debug_impl(&dword_2232AB000, v7, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has fallbackPredicate %@ and found matching snapshot %@; will not generate",
        (uint8_t *)&v13,
        0x20u);
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __49__XBApplicationSnapshotManifestImpl__noteDirtied__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 96) = 1;
  return result;
}

uint64_t __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workloop_reallyCheckClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(a1 + 32) + 48));
  }
  uint64_t v3 = __ManifestSerialWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke_2;
  v4[3] = &unk_2646A60D0;
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke_2;
  v7[3] = &unk_2646A61C0;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke_2;
  block[3] = &unk_2646A5938;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__ManifestSerialWorkQueue, block);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:3 forKey:@"version"];
  if ([(NSMutableDictionary *)self->_snapshotGroupsByID count]) {
    [v4 encodeObject:self->_snapshotGroupsByID forKey:@"snapshots"];
  }
}

void __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 80))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v1 + 88));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v1 + 97) = 0;
}

void __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 97) && *(unsigned char *)(v2 + 96))
  {
    *(unsigned char *)(v2 + 97) = 1;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_2;
    v20[3] = &unk_2646A5938;
    v20[4] = *(void *)(a1 + 32);
    uint64_t v3 = (void *)MEMORY[0x223CB2F50](v20);
    double v4 = *(double *)(a1 + 48);
    if (v4 == 0.0)
    {
      dispatch_sync((dispatch_queue_t)__ManifestSerialWorkQueue, v3);
    }
    else
    {
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      id v6 = __ManifestSerialWorkQueue;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      __int16 v17 = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_4;
      id v18 = &unk_2646A60A8;
      id v19 = v3;
      dispatch_after(v5, v6, &v15);
    }
  }
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v8 + 97))
    {
      if (!*(void *)(v8 + 88))
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void **)(v10 + 88);
        *(void *)(v10 + 88) = v9;

        id v7 = *(void **)(a1 + 40);
      }
      uint64_t v12 = objc_msgSend(v7, "copy", v15, v16, v17, v18);
      int v13 = *(void **)(*(void *)(a1 + 32) + 88);
      uint64_t v14 = (void *)MEMORY[0x223CB2F50]();
      [v13 addObject:v14];
    }
    else
    {
      uint64_t v12 = dispatch_get_global_queue(21, 0);
      dispatch_async(v12, v7);
    }
  }
}

- (void)_workloop_reallyCheckClientCount
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_2232AB000, v0, v1, "%{public}@ Cancelling reaping timer as we're invalidating (no clients or work remaining)", v2, v3, v4, v5, v6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __memoryPressureStatus = 1;
    dispatch_source_t v2 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 7uLL, (dispatch_queue_t)__ManifestSerialWorkQueue);
    uint64_t v3 = (void *)__memoryPressureSource;
    __memoryPressureSource = (uint64_t)v2;

    if (__memoryPressureSource)
    {
      dispatch_source_set_event_handler((dispatch_source_t)__memoryPressureSource, &__block_literal_global_187);
      uint64_t v4 = __memoryPressureSource;
      dispatch_resume(v4);
    }
  }
}

uintptr_t __47__XBApplicationSnapshotManifestImpl_initialize__block_invoke()
{
  int v0 = __memoryPressureStatus;
  uintptr_t result = dispatch_source_get_data((dispatch_source_t)__memoryPressureSource);
  __memoryPressureStatus = result;
  if (v0 != result && (result == 4 || result == 2))
  {
    uint64_t v3 = (void *)__ManifestsByIdentity;
    return [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_189];
  }
  return result;
}

uint64_t __47__XBApplicationSnapshotManifestImpl_initialize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _handleMemoryPressure];
}

+ (id)acquireManifestForContainerIdentity:(id)a3 store:(id)a4 creatingIfNecessary:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"XBApplicationSnapshotManifest.m", 473, @"Invalid parameter not satisfying: %@", @"containerIdentity" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"XBApplicationSnapshotManifest.m", 474, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

LABEL_3:
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__2;
  long long v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v12 = __ManifestSerialWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke;
  block[3] = &unk_2646A5F00;
  id v20 = v9;
  id v21 = v11;
  BOOL v23 = a5;
  v22 = &v24;
  id v13 = v11;
  id v14 = v9;
  dispatch_sync(v12, block);
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  dispatch_source_t v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = +[XBSnapshotManifestIdentity identityWithBundleIdentifier:v2 store:*(void *)(a1 + 40)];
  uint64_t v4 = [(id)__ManifestsByIdentity objectForKey:v3];
  uint64_t v5 = v4;
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_29;
  }
  if (!v4)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) beginAccessBlockForBundleIdentifier:v2];
    }
    id v9 = [*(id *)(a1 + 40) loadManifestDataForBundleIdentifier:v2];
    if ([v9 length])
    {
      id v34 = 0;
      id v13 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v34];
      id v14 = v34;
      id v15 = v14;
      if (v13)
      {

        id v12 = v13;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v16 = objc_msgSend(v12, "_allSnapshotGroups", 0);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_manifestQueueDecode_setStore:", *(void *)(a1 + 40));
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
          }
          while (v18);
        }

        id v21 = XBLogFileManifest();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [v12 succinctDescription];
          *(_DWORD *)buf = 138543618;
          v40 = v22;
          __int16 v41 = 2112;
          v42 = v3;
          _os_log_impl(&dword_2232AB000, v21, OS_LOG_TYPE_INFO, "acquireManifestForContainerIdentity:store:creatingIfNecessary: Unarchived manifest %{public}@ for %@.", buf, 0x16u);
        }
        uint64_t v5 = v12;
LABEL_27:

        uint64_t v25 = [v3 copy];
        uint64_t v26 = (void *)v5[4];
        v5[4] = v25;

        [(id)__ManifestsByIdentity setObject:v5 forKey:v3];
LABEL_28:

        long long v27 = (void *)MEMORY[0x223CB2D30]();
        [v5 _validateWithContainerIdentity:*(void *)(a1 + 32)];
        [v5 _noteDirtied];
        [v5 _scheduleArchivingIfNecessaryWithCompletion:0];
        goto LABEL_29;
      }
      BOOL v23 = XBLogFileManifest();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_cold_1();
      }
    }
    uint64_t v5 = [[XBApplicationSnapshotManifestImpl alloc] _initWithContainerIdentity:*(void *)(a1 + 32)];
    id v21 = XBLogFileManifest();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v5 succinctDescription];
      *(_DWORD *)buf = 138543362;
      v40 = v24;
      _os_log_impl(&dword_2232AB000, v21, OS_LOG_TYPE_INFO, "acquireManifestForContainerIdentity:store:creatingIfNecessary: Created manifest: %{public}@.", buf, 0xCu);
    }
    id v12 = 0;
    goto LABEL_27;
  }
  uint8_t v6 = [v4 containerIdentity];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v5 succinctDescriptionBuilder];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_2;
    v35[3] = &unk_2646A57C0;
    id v9 = v8;
    id v36 = v9;
    uint64_t v5 = v5;
    id v37 = v5;
    id v38 = *(id *)(a1 + 32);
    [v9 appendBodySectionWithName:0 multilinePrefix:0 block:v35];
    id v10 = XBLogFileManifest();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v9 build];
      *(_DWORD *)buf = 138543362;
      v40 = v11;
      _os_log_impl(&dword_2232AB000, v10, OS_LOG_TYPE_INFO, "acquireManifestForContainerIdentity:store:creatingIfNecessary: Manifest containerIdentity has changed: %{public}@", buf, 0xCu);
    }
    id v12 = v36;
    goto LABEL_28;
  }
LABEL_29:
  objc_msgSend(v5, "_workloop_incrementClientCount");
  uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
  id v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v5;
}

id __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_2(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) containerIdentity];
  id v4 = (id)[v2 appendObject:v3 withName:@"old"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(a1 + 48) withName:@"new"];
}

+ (void)relinquishManifest:(id)a3
{
  id v5 = a3;
  uint8_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 identity];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = __ManifestSerialWorkQueue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__XBApplicationSnapshotManifestImpl_relinquishManifest___block_invoke;
      v10[3] = &unk_2646A5F28;
      id v11 = v7;
      id v12 = v6;
      SEL v13 = a2;
      id v14 = a1;
      dispatch_async(v9, v10);
    }
  }
}

void __56__XBApplicationSnapshotManifestImpl_relinquishManifest___block_invoke(void *a1)
{
  dispatch_source_t v2 = [(id)__ManifestsByIdentity objectForKey:a1[4]];
  id v4 = v2;
  if (v2 != (void *)a1[5])
  {
    uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
    [v3 handleFailureInMethod:a1[6], a1[7], @"XBApplicationSnapshotManifest.m", 547, @"manifestToRelinquish does not match the manifest that we think we have : %@ != %@", a1[5], v4 object file lineNumber description];

    dispatch_source_t v2 = v4;
  }
  objc_msgSend(v2, "_workloop_decrementClientCount");
}

+ (void)_workloop_noteManifestInvalidated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  uint8_t v6 = [v5 identity];
  if (v6)
  {
    id v7 = [(id)__ManifestsByIdentity objectForKey:v6];
    if (v7 != v5)
    {
      id v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, a1, @"XBApplicationSnapshotManifest.m", 560, @"invalidatedManifest does not match the manifest that we think we have : %@ != %@", v5, v7 object file lineNumber description];
    }
    uint64_t v8 = XBLogFileManifest();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v5 succinctDescription];
      *(_DWORD *)buf = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_2232AB000, v8, OS_LOG_TYPE_INFO, "Removing manifest: %{public}@", buf, 0xCu);
    }
    [(id)__ManifestsByIdentity removeObjectForKey:v6];
  }
}

+ (BOOL)isUnderMemoryPressure
{
  return __memoryPressureStatus != 1;
}

- (void)_setContainerIdentity:(id)a3
{
  id v12 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (XBSnapshotContainerIdentity *)[v12 copy];
    containerIdentity = self->_containerIdentity;
    self->_containerIdentity = v4;

    uint8_t v6 = self->_containerIdentity;
    baseLogIdentifier = self->_baseLogIdentifier;
    if (v6)
    {
      uint64_t v8 = [(XBSnapshotContainerIdentity *)v6 bundleIdentifier];
      id v9 = [(NSString *)baseLogIdentifier stringByAppendingFormat:@" [%@]", v8];
      logIdentifier = self->_logIdentifier;
      self->_logIdentifier = v9;
    }
    else
    {
      id v11 = baseLogIdentifier;
      uint64_t v8 = self->_logIdentifier;
      self->_logIdentifier = v11;
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_commonInit
{
  if (!self)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, 0, @"XBApplicationSnapshotManifest.m", 583, @"Invalid parameter not satisfying: %@", @"self" object file lineNumber description];
  }
  self->_logContainerIdentifierDirty = 1;
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  snapshotGroupsByID = self->_snapshotGroupsByID;
  self->_snapshotGroupsByID = v3;

  id v5 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x263F3F638]);
  invalidatedSignal = self->_invalidatedSignal;
  self->_invalidatedSignal = v5;

  self->_accessLock._os_unfair_lock_opaque = 0;
  id v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = [v7 stringWithFormat:@"<%@: %p>", v9, self];
  baseLogIdentifier = self->_baseLogIdentifier;
  self->_baseLogIdentifier = v10;

  id v12 = self->_baseLogIdentifier;
  objc_storeStrong((id *)&self->_logIdentifier, v12);
}

- (XBApplicationSnapshotManifestImpl)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 593, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

  return self;
}

- (id)_initWithContainerIdentity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)XBApplicationSnapshotManifestImpl;
  id v5 = [(XBApplicationSnapshotManifestImpl *)&v8 init];
  uint8_t v6 = v5;
  if (v5)
  {
    [(XBApplicationSnapshotManifestImpl *)v5 _commonInit];
    [(XBApplicationSnapshotManifestImpl *)v6 _setContainerIdentity:v4];
  }

  return v6;
}

- (void)dealloc
{
  invalidatedSignal = self->_invalidatedSignal;
  if (invalidatedSignal)
  {
    if (([(BSAtomicSignal *)invalidatedSignal hasBeenSignalled] & 1) == 0)
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v8 = objc_opt_class();
      id v9 = [(XBSnapshotContainerIdentity *)self->_containerIdentity bundleIdentifier];
      [v7 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 609, @"<%@:%p bundleIdentifier=%@> was not properly invalidated before dealloc", v8, self, v9 object file lineNumber description];
    }
    if ([(NSMutableArray *)self->_archiveSchedulingQueue_synchronizeCompletions count])
    {
      id v10 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v11 = objc_opt_class();
      id v12 = [(XBSnapshotContainerIdentity *)self->_containerIdentity bundleIdentifier];
      [v10 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 610, @"<%@:%p bundleIdentifier=%@> failed to fire all synchronize completions before dealloc", v11, self, v12 object file lineNumber description];
    }
  }
  id v5 = [(XBSnapshotManifestIdentity *)self->_identity store];
  if (objc_opt_respondsToSelector())
  {
    uint8_t v6 = [(XBSnapshotContainerIdentity *)self->_containerIdentity bundleIdentifier];
    [v5 endAccessBlockForBundleIdentifier:v6];
  }
  v13.receiver = self;
  v13.super_class = (Class)XBApplicationSnapshotManifestImpl;
  [(XBApplicationSnapshotManifest *)&v13 dealloc];
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotManifestImpl *)self descriptionWithMultilinePrefix:0];
}

- (void)beginTrackingImageDeletions
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 112);
  id v4 = __error();
  id v5 = strerror(*v4);
  int v7 = 138412546;
  uint64_t v8 = v3;
  __int16 v9 = 2080;
  id v10 = v5;
  OUTLINED_FUNCTION_2_0(&dword_2232AB000, a2, v6, "[%@] beginTrackingImageDeletions: Unable to start FSEventStream: %s", (uint8_t *)&v7);
}

- (void)endTrackingImageDeletions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = XBLogFileManifest();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v13 = 138412290;
    id v14 = logIdentifier;
    _os_log_impl(&dword_2232AB000, v3, OS_LOG_TYPE_DEFAULT, "[%@] endTrackingImageDeletions", (uint8_t *)&v13, 0xCu);
  }

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  uint64_t v6 = (void *)__trackersByIdentity;
  int v7 = [(XBApplicationSnapshotManifestImpl *)self identity];
  uint64_t v8 = [v6 objectForKey:v7];

  __int16 v9 = (__FSEventStream *)[v8 stream];
  if (v9)
  {
    id v10 = v9;
    FSEventStreamStop(v9);
    FSEventStreamInvalidate(v10);
    FSEventStreamRelease(v10);
    uint64_t v11 = (void *)__trackersByIdentity;
    id v12 = [(XBApplicationSnapshotManifestImpl *)self identity];
    [v11 removeObjectForKey:v12];
  }
  os_unfair_lock_unlock(p_accessLock);
}

- (id)containerPath
{
  dispatch_source_t v2 = [(XBApplicationSnapshotManifestImpl *)self containerIdentity];
  uint64_t v3 = [v2 snapshotContainerPath];

  return v3;
}

- (id)snapshotsForGroupID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  int v7 = -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:](self, "snapshotsForGroupIDs:", v6, v9, v10);

  return v7;
}

- (id)snapshotsForGroupID:(id)a3 fetchRequest:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v12 = a3;
  uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  uint64_t v10 = -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:](self, "snapshotsForGroupIDs:fetchRequest:", v9, v7, v12, v13);

  return v10;
}

- (id)snapshotsForGroupIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v4];
  os_unfair_lock_unlock(&self->_accessLock);
  uint64_t v6 = XBLogFetchRequests();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    int v9 = 138412802;
    uint64_t v10 = logIdentifier;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_2232AB000, v6, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs given groupIDs: %@; returning snapshots:\n\t%@",
      (uint8_t *)&v9,
      0x20u);
  }

  return v5;
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logIdentifier];
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_235(uint64_t a1, void *a2)
{
  return [a2 logIdentifier];
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_240(uint64_t a1, void *a2)
{
  return [a2 logIdentifier];
}

- (id)createSnapshotWithGroupID:(id)a3
{
  id v4 = a3;
  id v5 = [XBApplicationSnapshot alloc];
  containerIdentity = self->_containerIdentity;
  id v7 = [(XBSnapshotManifestIdentity *)self->_identity store];
  id v8 = [(XBApplicationSnapshot *)v5 _initWithContainerIdentity:containerIdentity store:v7 groupID:v4 generationContext:0];

  return v8;
}

- (id)createVariantForSnapshot:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 888, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 889, @"Invalid parameter not satisfying: %@", @"variantID" object file lineNumber description];

LABEL_3:
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  __int16 v11 = [v7 _createVariantWithIdentifier:v9];
  os_unfair_lock_unlock(p_accessLock);

  return v11;
}

- (void)_didGenerateImage:(BOOL)a3 imageGenerationSignal:(id)a4 logIdentifier:(id)a5 imageGeneratedHandler:(id)a6 qos:(unsigned int)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = XBLogCapture();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[XBApplicationSnapshotManifestImpl _didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:]();
  }

  if ([v10 hasBeenSignalled])
  {
    id v14 = XBLogCapture();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[XBApplicationSnapshotManifestImpl _didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:]();
    }
  }
  else
  {
    [v10 signal];
    p_accessLock = &self->_accessLock;
    os_unfair_lock_assert_not_owner(p_accessLock);
    os_unfair_lock_lock(p_accessLock);
    uint64_t v16 = XBLogCapture();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[XBApplicationSnapshotManifestImpl _didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:]();
    }

    if (v12)
    {
      uint64_t v17 = __ManifestCallOutQueue;
      id v19 = v12;
      uint64_t v18 = (void *)BSDispatchBlockCreateWithQualityOfService();
      dispatch_async(v17, v18);
    }
    os_unfair_lock_unlock(p_accessLock);
  }
}

uint64_t __117__XBApplicationSnapshotManifestImpl__didGenerateImage_imageGenerationSignal_logIdentifier_imageGeneratedHandler_qos___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_didGenerateImageData:(id)a3 forSnapshot:(id)a4 imageWasGenerated:(BOOL)a5 imageDataGenerationSignal:(id)a6 logIdentifier:(id)a7 didSaveHandler:(id)a8 qos:(unsigned int)a9 writeToFileIfSupported:(BOOL)a10
{
  BOOL v27 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v28 = a8;
  id v19 = [v16 logIdentifier];
  id v20 = XBLogCapture();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[XBApplicationSnapshotManifestImpl _didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:]();
  }

  if (([v17 hasBeenSignalled] & 1) == 0)
  {
    [v17 signal];
    p_accessLock = &self->_accessLock;
    os_unfair_lock_assert_not_owner(&self->_accessLock);
    os_unfair_lock_lock(&self->_accessLock);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    if (v15 && ([v16 _isInvalidated] & 1) == 0)
    {
      uint64_t v24 = __ManifestImageAccessQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke;
      block[3] = &unk_2646A5FC0;
      id v37 = &v38;
      void block[4] = self;
      id v33 = v15;
      id v34 = v16;
      id v35 = v18;
      id v36 = v19;
      dispatch_sync(v24, block);
    }
    else
    {
      if ([v16 _isInvalidated])
      {
        BOOL v23 = XBLogFileManifest();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v43 = v18;
          __int16 v44 = 2114;
          v45 = v19;
          _os_log_impl(&dword_2232AB000, v23, OS_LOG_TYPE_INFO, "%{public}@ Snapshot was invalidated between imageGenerationHandler and imageDataGenerationHandler. Skipping saving. %{public}@", buf, 0x16u);
        }
      }
      if (!v15) {
        goto LABEL_18;
      }
    }
    if (*((unsigned char *)v39 + 24))
    {
      [(XBApplicationSnapshotManifestImpl *)self _noteDirtied];
LABEL_20:
      uint64_t v25 = __ManifestCallOutQueue;
      id v31 = v28;
      id v29 = v18;
      id v30 = v16;
      uint64_t v26 = (void *)BSDispatchBlockCreateWithQualityOfService();
      dispatch_async(v25, v26);

      os_unfair_lock_unlock(p_accessLock);
      _Block_object_dispose(&v38, 8);
      goto LABEL_21;
    }
LABEL_18:
    if (v27) {
      [(XBApplicationSnapshotManifestImpl *)self _reapExpiredAndInvalidSnapshots];
    }
    goto LABEL_20;
  }
  id v21 = XBLogCapture();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[XBApplicationSnapshotManifestImpl _didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:]();
  }

LABEL_21:
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_imageAccessQueue_saveData:forSnapshot:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v3 = XBLogFileManifest();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 64);
      id v7 = [*(id *)(a1 + 48) path];
      int v9 = 138543874;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Snapshot data for %{public}@ written to file: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_cold_1(a1, v4, v8);
  }
}

uint64_t __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_253(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    int v2 = XBLogCapture();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_253_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v3 = (id *)(a1 + 40);
  [*(id *)(a1 + 40) clearImageGenerator];
  [*(id *)(a1 + 40) endImageAccess];
  if (*(unsigned char *)(a1 + 72)
    && ([*v3 hasProtectedContent] & 1) == 0
    && ([*v3 _isInvalidated] & 1) == 0
    && ([*v3 fileExists] & 1) == 0)
  {
    id v4 = XBLogSnapshot();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_253_cold_1(a1, (id *)(a1 + 40), v4);
    }

    [*v3 _invalidate];
  }
  uint64_t result = [*v3 _isInvalidated];
  if (result) {
    return [*(id *)(a1 + 48) deleteSnapshot:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v17 = _os_activity_create(&dword_2232AB000, "XBCapture", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v17, &state);

  id v18 = [v13 groupID];

  if (v18)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1026, @"Invalid parameter not satisfying: %@", @"[snapshot groupID]" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  __int16 v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1027, @"Invalid parameter not satisfying: %@", @"dataProvider" object file lineNumber description];

LABEL_3:
  id v19 = [v14 context];

  if (!v19)
  {
    v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1028, @"Invalid parameter not satisfying: %@", @"[dataProvider context]" object file lineNumber description];
  }
  id v20 = [v14 context];
  [v20 scale];
  double v22 = v21;
  id v51 = [(XBApplicationSnapshotManifestImpl *)self bundleIdentifier];
  if ((a5 & 2) != 0) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  [v13 setImageScale:v22];
  objc_msgSend(v13, "setImageOpaque:", objc_msgSend(v20, "isOpaque"));
  [v13 beginImageAccess];
  id v24 = objc_alloc_init(MEMORY[0x263F3F638]);
  v49 = v20;
  uint64_t v50 = v23;
  id v25 = objc_alloc_init(MEMORY[0x263F3F638]);
  uint64_t v26 = self->_logIdentifier;
  int v27 = BSPthreadCurrentEffectiveQualityOfService();
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke;
  v61[3] = &unk_2646A6010;
  v61[4] = self;
  id v46 = v24;
  id v62 = v46;
  id v28 = v26;
  v63 = v28;
  id v47 = v15;
  id v64 = v47;
  int v65 = v27;
  uint64_t v29 = MEMORY[0x223CB2F50](v61);
  id v30 = self;
  id v31 = (void *)v29;
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_2;
  v54[3] = &unk_2646A6038;
  v48 = v30;
  v54[4] = v30;
  id v32 = v13;
  id v55 = v32;
  id v33 = v25;
  id v56 = v33;
  id v34 = v28;
  __int16 v57 = v34;
  id v35 = v16;
  id v58 = v35;
  int v59 = v27;
  char v60 = a5 & 1;
  id v36 = (void *)MEMORY[0x223CB2F50](v54);
  id v37 = [XBApplicationSnapshotImageGenerator alloc];
  uint64_t v38 = +[XBApplicationSnapshotGenerationScheduler sharedInstance];
  v39 = [(XBApplicationSnapshotImageGenerator *)v37 initWithScheduler:v38 snapshot:v32 dataProvider:v14 imageDataRequest:((uint64_t)(a5 << 63) >> 63) & v50 loggingPrefix:v51 imageGenerationHandler:v31 imageDataGenerationHandler:v36];

  if ((a5 & 4) == 0) {
    [(XBApplicationSnapshotImageGenerator *)v39 scheduleGeneration];
  }
  uint64_t v40 = (objc_class *)objc_opt_class();
  char v41 = NSStringFromClass(v40);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_3;
  v52[3] = &unk_2646A6060;
  v42 = v39;
  v53 = v42;
  [v32 setImageGeneratingByProvider:v41 withBlockingImageGenerator:v52];

  [(XBApplicationSnapshotManifestImpl *)v48 _addSnapshotToGroup:v32];
  os_activity_scope_leave(&state);
}

uint64_t __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didGenerateImage:a2 imageGenerationSignal:*(void *)(a1 + 40) logIdentifier:*(void *)(a1 + 48) imageGeneratedHandler:*(void *)(a1 + 56) qos:*(unsigned int *)(a1 + 64)];
}

uint64_t __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BYTE4(v4) = *(unsigned char *)(a1 + 76);
  LODWORD(v4) = *(_DWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "_didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:", a2, *(void *)(a1 + 40), a3, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), v4);
}

uint64_t __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) generate];
}

- (void)saveSnapshot:(id)a3 atPath:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1104, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _access_addSnapshotToGroup:v9];
  [v9 _configureWithPath:v10];
  [v11 scale];
  objc_msgSend(v9, "setImageScale:");
  objc_msgSend(v9, "setImageOpaque:", objc_msgSend(v11, "isOpaque"));
  [(XBApplicationSnapshotManifestImpl *)self _noteDirtied];
  id v13 = XBLogFileManifest();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    id v15 = [v9 succinctDescription];
    *(_DWORD *)buf = 138543618;
    id v18 = logIdentifier;
    __int16 v19 = 2114;
    id v20 = v15;
    _os_log_impl(&dword_2232AB000, v13, OS_LOG_TYPE_INFO, "%{public}@ Saved snapshot: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_unlock(p_accessLock);
}

- (void)deleteSnapshot:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = a3;
    uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[XBApplicationSnapshotManifestImpl deleteSnapshots:](self, "deleteSnapshots:", v6, v7, v8);
  }
}

- (void)deleteSnapshots:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  if ([v4 count])
  {
    id v5 = XBLogFileManifest();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      logIdentifier = self->_logIdentifier;
      id v7 = [v4 arrayByApplyingSelector:sel_succinctDescription];
      int v8 = 138543618;
      id v9 = logIdentifier;
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_impl(&dword_2232AB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting snapshots: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  [(XBApplicationSnapshotManifestImpl *)self _access_deleteSnapshots:v4];
  os_unfair_lock_unlock(&self->_accessLock);
}

- (void)deleteSnapshotsMatchingPredicate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsMatchingPredicate:v4];
  if ([v5 count])
  {
    uint64_t v6 = XBLogFileManifest();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      logIdentifier = self->_logIdentifier;
      int v8 = [v5 arrayByApplyingSelector:sel_succinctDescription];
      int v9 = 138543874;
      __int16 v10 = logIdentifier;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_2232AB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting snapshots: %{public}@ matching predicate: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  [(XBApplicationSnapshotManifestImpl *)self _access_deleteSnapshots:v5];
  os_unfair_lock_unlock(&self->_accessLock);
}

- (void)deleteSnapshotsUsingPredicateBuilder:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v4 = +[XBApplicationSnapshotPredicate predicate];
  if (v5) {
    v5[2](v5, v4);
  }
  [(XBApplicationSnapshotManifestImpl *)self deleteSnapshotsMatchingPredicate:v4];
}

- (void)deleteSnapshotsForGroupID:(id)a3 predicateBuilder:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = +[XBApplicationSnapshotPredicate predicate];
  if (v6) {
    v6[2](v6, v7);
  }
  [(XBApplicationSnapshotManifestImpl *)self deleteSnapshotsForGroupID:v8 matchingPredicate:v7];
}

- (void)deleteSnapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v19[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  int v9 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v8 matchingPredicate:v7];

  if ([v9 count])
  {
    __int16 v10 = XBLogFileManifest();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      logIdentifier = self->_logIdentifier;
      uint64_t v12 = [v9 arrayByApplyingSelector:sel_succinctDescription];
      int v13 = 138543874;
      id v14 = logIdentifier;
      __int16 v15 = 2114;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_2232AB000, v10, OS_LOG_TYPE_INFO, "%{public}@ Deleting snapshots: %{public}@ matching predicate: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  [(XBApplicationSnapshotManifestImpl *)self _access_deleteSnapshots:v9];
  os_unfair_lock_unlock(&self->_accessLock);
}

- (void)deleteSnapshotsForGroupID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotGroupForID:v4 creatingIfNeeded:0];
  if (v5)
  {
    id v6 = XBLogFileManifest();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = logIdentifier;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_2232AB000, v6, OS_LOG_TYPE_INFO, "%{public}@ Deleting all snapshots for group: %{public}@.", buf, 0x16u);
    }

    [v5 _invalidate];
    [(NSMutableDictionary *)self->_snapshotGroupsByID removeObjectForKey:v4];
    [(XBApplicationSnapshotManifestImpl *)self _noteDirtied];
    id v8 = [v5 containerPath];
    __int16 v10 = v8;
    int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    [(XBApplicationSnapshotManifestImpl *)self _access_deletePaths:v9];
  }
  os_unfair_lock_unlock(&self->_accessLock);
}

- (void)purgeSnapshotsWithProtectedContent
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _access_purgeSnapshotsWithProtectedContent];
  os_unfair_lock_unlock(p_accessLock);
}

- (void)updateSnapshotsAPFSPurgability:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _access_updateSnapshotsAPFSPurgability:v3];
  os_unfair_lock_unlock(p_accessLock);
}

- (BOOL)snapshotsConsideredUnpurgableByAPFS
{
  int v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(v2) = [(XBApplicationSnapshotManifestImpl *)v2 _access_snapshotsConsideredUnpurgableByAPFS];
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)deleteAllSnapshots
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  id v4 = XBLogFileManifest();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(XBApplicationSnapshotManifestImpl *)self bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    __int16 v10 = v5;
    _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_INFO, "%{public}@ Deleting all snapshots.", buf, 0xCu);
  }
  [(XBApplicationSnapshotManifestImpl *)self _noteDirtied];
  [(NSMutableDictionary *)self->_snapshotGroupsByID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_274];
  [(NSMutableDictionary *)self->_snapshotGroupsByID removeAllObjects];
  id v6 = [(XBApplicationSnapshotManifestImpl *)self containerPath];
  id v8 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [(XBApplicationSnapshotManifestImpl *)self _access_deletePaths:v7];

  os_unfair_lock_unlock(p_accessLock);
}

uint64_t __55__XBApplicationSnapshotManifestImpl_deleteAllSnapshots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _invalidate];
}

- (void)beginSnapshotAccessTransaction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  id v7 = +[XBApplicationSnapshotGenerationScheduler sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke;
  v9[3] = &unk_2646A60D0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performImageGenerationAsync:v9];
}

void __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = __ManifestSerialWorkQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_2;
  v3[3] = &unk_2646A60D0;
  int v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(v1, v3);
}

void __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 100));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_3;
  v3[3] = &unk_2646A60A8;
  int v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_access_accessSnapshotsWithBlock:completion:", 0, v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 100));
}

void __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = __ManifestCallOutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_4;
  block[3] = &unk_2646A60A8;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);
}

uint64_t __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)_configureSnapshot:(id)a3 withCompatibilityInfo:(id)a4 forLaunchRequest:(id)a5
{
  id v25 = a3;
  id v7 = a5;
  id v8 = a4;
  int v9 = [v7 launchInterfaceIdentifier];
  [v25 setLaunchInterfaceIdentifier:v9];
  id v10 = [v8 defaultLaunchInterface];

  uint64_t v11 = [v10 identifier];
  char v12 = [v11 isEqualToString:v9];

  if ((v12 & 1) == 0) {
    [v25 setName:v9];
  }
  __int16 v13 = [v7 urlSchemeName];
  [v25 setScheme:v13];

  [v25 setContentType:1];
  id v14 = [v7 displayConfiguration];
  [v7 referenceSize];
  double v16 = v15;
  double v18 = v17;
  [v14 bounds];
  BOOL v21 = v18 == v20 && v16 == v19;
  [v25 setFullScreen:v21];
  [v7 referenceSize];
  objc_msgSend(v25, "setReferenceSize:");
  [v14 scale];
  objc_msgSend(v25, "setImageScale:");
  objc_msgSend(v25, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  uint64_t v22 = [v7 statusBarState];
  uint64_t v23 = objc_alloc_init(XBMutableStatusBarSettings);
  [(XBMutableStatusBarSettings *)v23 setHidden:v22 == 0];
  [(XBMutableStatusBarSettings *)v23 setBackgroundActivityEnabled:v22 == 2];
  [v25 setStatusBarSettings:v23];
  objc_msgSend(v25, "setUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
  id v24 = [v7 customSafeAreaInsets];

  [v25 setCustomSafeAreaInsets:v24];
}

- (id)_snapshotGroupsByID
{
  return self->_snapshotGroupsByID;
}

- (BOOL)_invalidate
{
  return [(BSAtomicSignal *)self->_invalidatedSignal signal];
}

- (id)_generatableSnapshotForGroupID:(id)a3 generationContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    double v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1316, @"Invalid parameter not satisfying: %@", @"generationContext" object file lineNumber description];
  }
  int v9 = [(XBApplicationSnapshotManifestImpl *)self _createSnapshotWithGroupID:v7 generationContext:v8];
  [(XBApplicationSnapshotManifestImpl *)self _addSnapshotToGroup:v9];
  id v10 = XBLogFileManifest();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    char v12 = [v9 logIdentifier];
    *(_DWORD *)buf = 138543874;
    double v20 = logIdentifier;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_2232AB000, v10, OS_LOG_TYPE_INFO, "%{public}@ groupID: [%@] Creating temporary snapshot %@ with generation context.", buf, 0x20u);
  }
  __int16 v13 = [v8 launchRequest];
  id v14 = [v8 applicationCompatibilityInfo];
  double v15 = [v14 launchInterfaceIdentifierForRequest:v13];
  [v13 setLaunchInterfaceIdentifier:v15];

  +[XBApplicationSnapshotManifestImpl _configureSnapshot:v9 withCompatibilityInfo:v14 forLaunchRequest:v13];
  double v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2.0];
  [v9 setExpirationDate:v16];

  [(XBApplicationSnapshotManifestImpl *)self _reapExpiredAndInvalidSnapshots];
  return v9;
}

- (id)_createSnapshotWithGroupID:(id)a3 generationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [XBApplicationSnapshot alloc];
  containerIdentity = self->_containerIdentity;
  id v10 = [(XBSnapshotManifestIdentity *)self->_identity store];
  id v11 = [(XBApplicationSnapshot *)v8 _initWithContainerIdentity:containerIdentity store:v10 groupID:v7 generationContext:v6];

  return v11;
}

- (void)_addSnapshotToGroup:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _access_addSnapshotToGroup:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_access_addSnapshotToGroup:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1352, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [v5 groupID];

  if (!v6)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1353, @"Invalid parameter not satisfying: %@", @"[snapshot groupID]" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_accessLock);
  id v7 = [v11 groupID];
  id v8 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotGroupForID:v7 creatingIfNeeded:1];

  [v8 addSnapshot:v11];
}

- (id)_allSnapshotGroups
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  id v4 = [(XBApplicationSnapshotManifestImpl *)self _access_allSnapshotGroups];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (id)_access_allSnapshotGroups
{
  os_unfair_lock_assert_owner(&self->_accessLock);
  snapshotGroupsByID = self->_snapshotGroupsByID;
  return (id)[(NSMutableDictionary *)snapshotGroupsByID allValues];
}

- (void)_synchronizeDataStoreWithCompletion:(id)a3
{
  if (!a3) {
    a3 = &__block_literal_global_281;
  }
  [(XBApplicationSnapshotManifestImpl *)self _scheduleArchivingIfNecessaryWithCompletion:a3];
}

- (void)archive
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__XBApplicationSnapshotManifestImpl_archive__block_invoke;
  v5[3] = &unk_2646A5938;
  dispatch_semaphore_t v6 = v3;
  id v4 = v3;
  [(XBApplicationSnapshotManifestImpl *)self _scheduleArchivingIfNecessaryWithDelay:v5 completion:0.0];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __44__XBApplicationSnapshotManifestImpl_archive__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleMemoryPressure
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _access_purgeSnapshotsWithProtectedContent];
  os_unfair_lock_unlock(p_accessLock);
}

void __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke_2;
  v3[3] = &unk_2646A5938;
  id v4 = *(id *)(a1 + 48);
  [v1 synchronizeForBundleIdentifier:v2 withCompletion:v3];
}

void __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)_validateWithContainerIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1493, @"Invalid parameter not satisfying: %@", @"containerIdentity" object file lineNumber description];
  }
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  BOOL v7 = [(XBApplicationSnapshotManifestImpl *)self _access_validateWithContainerIdentity:v5];
  os_unfair_lock_unlock(p_accessLock);

  return v7;
}

- (BOOL)_access_validateWithContainerIdentity:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    __int16 v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1504, @"Invalid parameter not satisfying: %@", @"containerIdentity" object file lineNumber description];
  }
  os_unfair_lock_assert_owner(&self->_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _setContainerIdentity:v5];
  long long v6 = (void *)[(NSMutableDictionary *)self->_snapshotGroupsByID copy];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__XBApplicationSnapshotManifestImpl__access_validateWithContainerIdentity___block_invoke;
  v23[3] = &unk_2646A6148;
  id v7 = v5;
  id v24 = v7;
  uint64_t v25 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v23];
  long long v8 = [v7 snapshotContainerPath];
  if ([(NSMutableDictionary *)self->_snapshotGroupsByID count]) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9)
  {
    id v10 = XBLogFileManifest();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(XBApplicationSnapshotManifestImpl *)self bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      int v27 = v11;
      __int16 v28 = 2112;
      uint64_t v29 = v8;
      _os_log_impl(&dword_2232AB000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Manifest is empty; purging everything at %@",
        buf,
        0x16u);
    }
    char v12 = [MEMORY[0x263F08850] defaultManager];
    id v22 = 0;
    char v13 = [v12 removeItemAtPath:v8 error:&v22];
    id v14 = v22;

    if (v13) {
      goto LABEL_17;
    }
    double v15 = [v14 domain];
    if ([v15 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v16 = [v14 code];

      if (v16 == 4)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    double v17 = XBLogFileManifest();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543874;
      int v27 = logIdentifier;
      __int16 v28 = 2114;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_error_impl(&dword_2232AB000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Error removing snapshotContainer for purge at %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_17;
  }
LABEL_18:
  BOOL v18 = [(NSMutableDictionary *)self->_snapshotGroupsByID count] != 0;

  return v18;
}

void __75__XBApplicationSnapshotManifestImpl__access_validateWithContainerIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 _validateWithContainerIdentity:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v7 = XBLogFileManifest();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 112);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_2232AB000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ group isn't valid. removing from snapshotGroupsByID and will be culled later: %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:v5];
  }
}

- (void)_reapExpiredAndInvalidSnapshots
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__XBApplicationSnapshotManifestImpl__reapExpiredAndInvalidSnapshots__block_invoke;
  block[3] = &unk_2646A5938;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)__ManifestSerialWorkQueue, block);
}

void __68__XBApplicationSnapshotManifestImpl__reapExpiredAndInvalidSnapshots__block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 100));
  objc_msgSend(*(id *)(a1 + 32), "_access_workloop_reapExpiredAndInvalidSnapshots");
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 100);
  os_unfair_lock_unlock(v2);
}

void __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v12 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [v6 domain];
    if ([v8 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v9 = [v7 code];

      if (v9 == 4) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v10 = XBLogFileManifest();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 112);
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2114;
      BOOL v18 = v7;
      _os_log_error_impl(&dword_2232AB000, v10, OS_LOG_TYPE_ERROR, "%{public}@ error deleting path %@: %{public}@", buf, 0x20u);
    }
  }
LABEL_9:
}

- (void)_access_purgeSnapshotsWithProtectedContent
{
  os_unfair_lock_assert_owner(&self->_accessLock);
  [(XBApplicationSnapshotManifestImpl *)self _noteDirtied];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = [MEMORY[0x263EFF9C0] set];
  snapshotGroupsByID = self->_snapshotGroupsByID;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke;
  v5[3] = &unk_2646A6210;
  void v5[4] = &v6;
  [(NSMutableDictionary *)snapshotGroupsByID enumerateKeysAndObjectsUsingBlock:v5];
  if ([(id)v7[5] count])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke_2;
    block[3] = &unk_2646A60F8;
    void block[4] = self;
    void block[5] = &v6;
    dispatch_async((dispatch_queue_t)__ManifestCallOutQueue, block);
  }
  _Block_object_dispose(&v6, 8);
}

void __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 snapshots];
  uint64_t v8 = (void *)[v7 copy];

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
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasProtectedContent", (void)v15))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
          [v6 removeSnapshot:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

void __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allObjects];
  [v4 manifest:v2 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:v3];
}

- (void)_access_updateSnapshotsAPFSPurgability:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_accessLock);
  snapshotGroupsByID = self->_snapshotGroupsByID;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__XBApplicationSnapshotManifestImpl__access_updateSnapshotsAPFSPurgability___block_invoke;
  v6[3] = &unk_2646A6238;
  BOOL v7 = a3;
  v6[4] = self;
  [(NSMutableDictionary *)snapshotGroupsByID enumerateKeysAndObjectsUsingBlock:v6];
}

void __76__XBApplicationSnapshotManifestImpl__access_updateSnapshotsAPFSPurgability___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [a3 snapshots];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v29;
    *(void *)&long long v5 = 138544386;
    long long v24 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        if (objc_msgSend(v9, "fileLocation", v24) != 3)
        {
          char v10 = XBApplicationSnapshotContentTypeMaskForContentType([v9 contentType]);
          uint64_t v11 = [v9 path];
          id v12 = [v9 path];
          uint64_t v13 = (const char *)[v12 fileSystemRepresentation];

          if (v13)
          {
            uint64_t v14 = (v10 & 6) != 0 ? 0 : 67588;
            uint64_t v15 = (v10 & 6) != 0 ? 67588 : 66564;
            uint64_t v16 = *(unsigned char *)(a1 + 40) ? v14 : v15;
            uint64_t v26 = 0;
            uint64_t v27 = v16;
            if (!fsctl(v13, 0x40084A47uLL, &v26, 0) && (unsigned __int16)v27 != (unsigned __int16)v26)
            {
              int v17 = fsctl(v13, 0xC0084A44uLL, &v27, 0);
              if (v17)
              {
                int v18 = v17;
                uint64_t v19 = XBLogPurge();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 112);
                  __int16 v21 = __error();
                  id v22 = strerror(*v21);
                  *(_DWORD *)buf = v24;
                  uint64_t v33 = v20;
                  __int16 v34 = 2112;
                  id v35 = v11;
                  __int16 v36 = 1024;
                  int v37 = v18;
                  __int16 v38 = 2080;
                  v39 = v22;
                  __int16 v40 = 2048;
                  uint64_t v41 = v27;
                  _os_log_error_impl(&dword_2232AB000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to mark %@ as purgeable %d (%s) (flags 0x%llx)", buf, 0x30u);
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v23 = [v3 countByEnumeratingWithState:&v28 objects:v42 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }
}

- (BOOL)_access_snapshotsConsideredUnpurgableByAPFS
{
  v20[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_accessLock);
  id v3 = [(XBApplicationSnapshotManifestImpl *)self defaultGroupIdentifier];
  v20[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  long long v5 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 fileLocation] != 3)
        {
          id v11 = [v10 path];
          id v12 = (const char *)[v11 fileSystemRepresentation];

          if (v12)
          {
            uint64_t v14 = 0;
            if (!fsctl(v12, 0x40084A47uLL, &v14, 0) && (v14 & 0xC00) == 0)
            {
              LOBYTE(v7) = 1;
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

uint64_t __69__XBApplicationSnapshotManifestImpl__access_gatherPaths_forSnapshot___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 path];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x270F9A758]();
}

- (id)_access_snapshotsForGroupIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  long long v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NSMutableDictionary objectForKey:](self->_snapshotGroupsByID, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        id v12 = [v11 snapshots];
        uint64_t v13 = [v12 allObjects];
        [v5 addObjectsFromArray:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_access_snapshotsMatchingPredicate:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_accessLock);
  id v6 = [(NSMutableDictionary *)self->_snapshotGroupsByID allKeys];
  uint64_t v7 = [(XBApplicationSnapshotManifestImpl *)self _access_snapshotsForGroupIDs:v6 matchingPredicate:v5];

  return v7;
}

- (BOOL)_imageAccessQueue_saveData:(id)a3 forSnapshot:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BSDispatchQueueAssert();
  uint64_t v9 = [v7 length];
  BOOL v10 = 0;
  if (v8 && v9)
  {
    id v11 = objc_msgSend(v8, "_configureDefaultPathWithinGroupForFormat:", objc_msgSend((id)objc_opt_class(), "_outputFormatForSnapshot:", v8));
    if (!v11)
    {
      long long v30 = [MEMORY[0x263F08690] currentHandler];
      [v30 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 1856, @"generated nil path for snapshot %@", v8 object file lineNumber description];
    }
    id v12 = [v11 stringByDeletingLastPathComponent];
    if (!XBEnsureDirectoryExistsAtPath(v12))
    {
      uint64_t v13 = XBLogFileManifest();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[XBApplicationSnapshotManifestImpl _imageAccessQueue_saveData:forSnapshot:]();
      }
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke;
    v32[3] = &unk_2646A6288;
    id v33 = v7;
    __int16 v34 = self;
    id v14 = v11;
    id v35 = v14;
    long long v15 = (unsigned int (**)(void, void))MEMORY[0x223CB2F50](v32);
    if (!v11
      || (id v16 = v14,
          uint64_t v17 = open((const char *)[v16 fileSystemRepresentation], 1793, 438),
          (v17 & 0x80000000) != 0))
    {
      BOOL v10 = 0;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v18 = v17;
    uint64_t v19 = XBApplicationSnapshotContentTypeMaskForContentType([v8 contentType]) & 6;
    uint64_t v20 = 2;
    if (v19) {
      uint64_t v20 = 3;
    }
    if (fcntl(v18, 64, v20) == -1)
    {
      uint64_t v25 = XBLogFileManifest();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[XBApplicationSnapshotManifestImpl _imageAccessQueue_saveData:forSnapshot:]();
      }
    }
    else if (v15[2](v15, v18))
    {
      uint64_t v21 = 67588;
      if (v19) {
        uint64_t v21 = 0;
      }
      uint64_t v31 = v21;
      int v22 = ffsctl(v18, 0xC0084A44uLL, &v31, 0);
      if (v22)
      {
        int v23 = v22;
        long long v24 = XBLogFileManifest();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          logIdentifier = self->_logIdentifier;
          long long v28 = __error();
          long long v29 = strerror(*v28);
          *(_DWORD *)buf = 138544386;
          int v37 = logIdentifier;
          __int16 v38 = 2112;
          id v39 = v16;
          __int16 v40 = 1024;
          int v41 = v23;
          __int16 v42 = 2080;
          uint64_t v43 = v29;
          __int16 v44 = 2048;
          uint64_t v45 = v31;
          _os_log_error_impl(&dword_2232AB000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to mark %@ as purgeable %d (%s) (flags 0x%llx)", buf, 0x30u);
        }
      }
      BOOL v10 = 1;
      goto LABEL_27;
    }
    BOOL v10 = 0;
LABEL_27:
    close(v18);
    goto LABEL_28;
  }
LABEL_29:

  return v10;
}

BOOL __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke(uint64_t a1, int a2)
{
  ssize_t v2 = write(a2, (const void *)[*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"));
  if (v2 == -1)
  {
    uint64_t v3 = XBLogFileManifest();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke_cold_1();
    }
  }
  return v2 != -1;
}

- (void)_workloop_incrementClientCount
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  ++self->_clientCount;
  uint64_t v3 = XBLogFileManifest();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    unint64_t clientCount = self->_clientCount;
    int v6 = 138543618;
    id v7 = logIdentifier;
    __int16 v8 = 1024;
    int v9 = clientCount;
    _os_log_impl(&dword_2232AB000, v3, OS_LOG_TYPE_INFO, "%{public}@ Incrementing client count: %u", (uint8_t *)&v6, 0x12u);
  }
}

- (void)_workloop_decrementClientCount
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  --self->_clientCount;
  uint64_t v3 = XBLogFileManifest();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    unint64_t clientCount = self->_clientCount;
    int v6 = 138543618;
    id v7 = logIdentifier;
    __int16 v8 = 1024;
    int v9 = clientCount;
    _os_log_impl(&dword_2232AB000, v3, OS_LOG_TYPE_INFO, "%{public}@ Decrementing client count: %u", (uint8_t *)&v6, 0x12u);
  }

  [(XBApplicationSnapshotManifestImpl *)self _workloop_checkClientCount];
}

unsigned char *__69__XBApplicationSnapshotManifestImpl__workloop_reallyCheckClientCount__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[96])
  {
    uint64_t result = (unsigned char *)[result _invalidate];
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

+ (int64_t)_outputFormatForSnapshot:(id)a3
{
  id v3 = a3;
  if (_outputFormatForSnapshot__onceToken != -1) {
    dispatch_once(&_outputFormatForSnapshot__onceToken, &__block_literal_global_302);
  }
  if (_outputFormatForSnapshot__wideColorDisplay) {
    BOOL v4 = _outputFormatForSnapshot__supportsASTC == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int64_t v5 = !v4;
  if (v4 && _outputFormatForSnapshot__supportsASTC)
  {
    int v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 || [v3 contentType])
    {
      int64_t v5 = 1;
    }
    else if ([v3 isImageOpaque])
    {
      int64_t v5 = 3;
    }
    else
    {
      int64_t v5 = 1;
    }
  }

  return v5;
}

uint64_t __62__XBApplicationSnapshotManifestImpl__outputFormatForSnapshot___block_invoke()
{
  _outputFormatForSnapshot__supportsASTC = MGGetBoolAnswer();
  uint64_t result = MGGetBoolAnswer();
  _outputFormatForSnapshot__wideColorDisplay = result;
  return result;
}

- (XBApplicationSnapshotManifestImpl)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)XBApplicationSnapshotManifestImpl;
  int64_t v5 = [(XBApplicationSnapshotManifestImpl *)&v20 init];
  int v6 = v5;
  if (v5)
  {
    [(XBApplicationSnapshotManifestImpl *)v5 _commonInit];
    uint64_t v7 = [v4 decodeIntegerForKey:@"version"];
    if (v7 < 3)
    {
      int v16 = v7;
      uint64_t v17 = XBLogFileManifest();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        logIdentifier = v6->_logIdentifier;
        *(_DWORD *)buf = 138543874;
        int v22 = logIdentifier;
        __int16 v23 = 1024;
        int v24 = v16;
        __int16 v25 = 1024;
        int v26 = 3;
        _os_log_impl(&dword_2232AB000, v17, OS_LOG_TYPE_INFO, "%{public}@ Snapshot manifest out of date (currVers=%d, newVers=%d).", buf, 0x18u);
      }

      [(XBApplicationSnapshotManifestImpl *)v6 _invalidate];
      int v6 = 0;
    }
    else
    {
      __int16 v8 = (void *)MEMORY[0x223CB2D30]();
      int v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      id v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"snapshots"];
      id v14 = [v4 error];
      if (v14)
      {
        long long v15 = XBLogFileManifest();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[XBApplicationSnapshotManifestImpl initWithCoder:]();
        }

        [(XBApplicationSnapshotManifestImpl *)v6 _invalidate];
        int v6 = 0;
      }
      else
      {
        objc_storeStrong((id *)&v6->_snapshotGroupsByID, v13);
      }
    }
  }

  return v6;
}

- (id)_descriptionForStateCaptureWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int64_t v5 = [(XBApplicationSnapshotManifestImpl *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2646A5BE8;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  if (*((unsigned char *)v13 + 24))
  {
    uint64_t v7 = [v6 build];
  }
  else
  {
    uint64_t v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke(uint64_t a1)
{
  ssize_t v2 = [*(id *)(a1 + 32) _allSnapshotGroups];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke_2;
  v5[3] = &unk_2646A62B0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int64_t v5 = [v3 activeMultilinePrefix];
  id v8 = [v4 descriptionForStateCaptureWithMultilinePrefix:v5];

  id v6 = v8;
  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v7 = (id)[*(id *)(a1 + 32) appendObject:v8 withName:0];
    id v6 = v8;
  }
}

- (id)succinctDescription
{
  ssize_t v2 = [(XBApplicationSnapshotManifestImpl *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = [(XBApplicationSnapshotManifestImpl *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"bundleID" skipIfNil:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(XBApplicationSnapshotManifestImpl *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(XBApplicationSnapshotManifestImpl *)self succinctDescriptionBuilder];
  id v6 = (id)[v5 appendUnsignedInteger:self->_clientCount withName:@"clientCount"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__XBApplicationSnapshotManifestImpl_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_2646A5BC0;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v8 = v7;
  return v8;
}

void __75__XBApplicationSnapshotManifestImpl_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  ssize_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) containerIdentity];
  id v4 = (id)[v2 appendObject:v3 withName:@"containerIdentity"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _allSnapshotGroups];
  [v5 appendArraySection:v6 withName:@"snapshots" skipIfEmpty:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_baseLogIdentifier, 0);
  objc_storeStrong((id *)&self->_archiveSchedulingQueue_synchronizeCompletions, 0);
  objc_storeStrong((id *)&self->_invalidatedSignal, 0);
  objc_storeStrong((id *)&self->_reapingTimer, 0);
  objc_storeStrong((id *)&self->_imageAccessFileManger, 0);
  objc_storeStrong((id *)&self->_snapshotGroupsByID, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

void __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_2232AB000, v0, v1, "acquireManifestForContainerIdentity:store:creatingIfNecessary: [%{public}@] Unable to unarchive manifest from store: %@");
}

- (void)snapshotsForGroupIDs:(uint64_t)a1 fetchRequest:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  ssize_t v2 = objc_msgSend(a2, "bs_map:", &__block_literal_global_242);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10(&dword_2232AB000, v3, v4, "[%@] END snapshotsForGroupIDs:fetchRequest: returning matchingSnapshots:\n\t%@", v5, v6, v7, v8, v9);
}

- (void)snapshotsForGroupIDs:fetchRequest:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2232AB000, v0, v1, "[%@] snapshotsForGroupIDs:fetchRequest: scheme %@ requested but there's no launch interface representing it");
}

- (void)snapshotsForGroupIDs:(uint64_t)a1 fetchRequest:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  ssize_t v2 = objc_msgSend(a2, "bs_map:", &__block_literal_global_237);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10(&dword_2232AB000, v3, v4, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has no predicate; retrieved matchingSnapshots:\n\t%@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

- (void)_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_2232AB000, v0, v1, "%{public}@ ignoring redundant imageDataGenerationHandler callback as we've already processed one. didGenerateImage: %@");
}

- (void)_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_2232AB000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ processing imageGenerationHandler callback with didGenerateImage: %d", v2, 0x12u);
}

- (void)_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_2232AB000, v0, v1, "%{public}@ inside imageGenerationHandler", v2, v3, v4, v5, v6);
}

- (void)_didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2232AB000, v0, v1, "%{public}@ ignoring redundant imageDataGenerationHandler callback as we've already processed one. imageData: %p");
}

- (void)_didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_2232AB000, v0, v1, "%{public}@ inside imageDataGenerationHandler", v2, v3, v4, v5, v6);
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_2_0(&dword_2232AB000, a2, a3, "%{public}@ Error writing snapshot %{public}@ to file", (uint8_t *)&v5);
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_253_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = [*a2 logIdentifier];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v5;
  OUTLINED_FUNCTION_2_0(&dword_2232AB000, a3, v6, "%{public}@ we expected to receive and save image data for snapshot but failed. invalidating. snapshot: %{public}@", (uint8_t *)&v7);
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_253_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_2232AB000, v0, v1, "%{public}@ calling didSaveHandler", v2, v3, v4, v5, v6);
}

- (void)_access_doArchiveWithCompletions:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_2232AB000, v0, v1, "%{public}@ Unable to archive manifest: %{public}@");
}

void __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_2232AB000, v0, v1, "%{public}@ Reaping timer fired! Cancelling timer", v2, v3, v4, v5, v6);
}

- (void)_imageAccessQueue_saveData:forSnapshot:.cold.1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_2232AB000, v1, v2, "%{public}@ Failed to call fcntl on fd for %@: (%s)", v3, v4, v5, v6, v7);
}

- (void)_imageAccessQueue_saveData:forSnapshot:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_2232AB000, v0, v1, "%{public}@ XBEnsureDirectoryExistsAtPath() check failed for: %{public}@");
}

void __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_2232AB000, v1, v2, "%{public}@ Failed to write to %@: (%s)", v3, v4, v5, v6, v7);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_2232AB000, v0, v1, "%{public}@ Failed to decode from decoder with error: %{public}@");
}

@end