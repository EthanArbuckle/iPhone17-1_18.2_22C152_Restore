@interface PLSearchIndexingEngine
- (BOOL)_inq_acquireSpotlightSandboxExtensionIfNeeded;
- (BOOL)hasRebuildWorkToDoForLibrary:(id)a3;
- (BOOL)supportsPSI;
- (BOOL)supportsSpotlightClientState;
- (BOOL)supportsSpotlightDelete;
- (BOOL)supportsSpotlightDonate;
- (PLSearchIndexConfiguration)configuration;
- (PLSearchIndexingEngine)initWithLibraryServicesManager:(id)a3;
- (PLSearchIndexingEngine)initWithLibraryServicesProvider:(id)a3;
- (id)_clientStateResultAndLogWithCode:(unint64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5;
- (id)_spotlightIndexName;
- (id)processBatchOfJobsWithType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5 completion:(id)a6;
- (id)sceneTaxonomyDigestsForSearchIndexingRebuildEngine:(id)a3;
- (int64_t)wellKnownLibraryIdentifierForIncrementalUpdateEngine:(id)a3;
- (int64_t)wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:(id)a3;
- (void)_dropSearchIndexWithSourceName:(id)a3 reasons:(unint64_t)a4 completion:(id)a5;
- (void)_inLibraryPerform_donateAssets:(id)a3 library:(id)a4 completion:(id)a5;
- (void)_inLibraryPerform_donateManagedObjects:(id)a3 partialUpdateMasks:(id)a4 entity:(unint64_t)a5 deleteIdentifiers:(id)a6 identifiersRequiringAdditionalWorkByEntity:(id)a7 library:(id)a8 progress:(id)a9 completion:(id)a10;
- (void)_inq_close;
- (void)_inq_donatePSIObjectsByType:(id)a3 spotlightItemsByBundleID:(id)a4 deleteIdentifiers:(id)a5 spotlightClientState:(id)a6 completion:(id)a7;
- (void)_inq_dropSearchIndexWithSourceName:(id)a3 reasons:(unint64_t)a4 completion:(id)a5;
- (void)_inq_handleClientStateValidationError:(id)a3 library:(id)a4;
- (void)_inq_open;
- (void)_inq_releaseSpotlightSandboxExtension;
- (void)_inq_validateSpotlightClientStateAgainstExpectedClientState:(id)a3 completion:(id)a4;
- (void)_safePerformBlock:(id)a3;
- (void)close;
- (void)disableUISearch;
- (void)dropSearchIndexForSearchIndexingRebuildEngine:(id)a3 completion:(id)a4;
- (void)dropSearchIndexWithSourceName:(id)a3 completion:(id)a4;
- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4;
- (void)inLibraryPerform_donateForIncrementalUpdateEngine:(id)a3 managedObjects:(id)a4 partialUpdateMasks:(id)a5 entity:(unint64_t)a6 deleteIdentifiers:(id)a7 identifiersRequiringAdditionalWorkByEntity:(id)a8 library:(id)a9 progress:(id)a10 completion:(id)a11;
- (void)inLibraryPerform_donateForSearchIndexingRebuildEngine:(id)a3 managedObjects:(id)a4 entity:(unint64_t)a5 entityName:(id)a6 library:(id)a7 progress:(id)a8 queue:(id)a9 completion:(id)a10;
- (void)indexAssetsIfNeededWithObjectIDs:(id)a3 library:(id)a4 completion:(id)a5;
- (void)indexAssetsWithUUIDs:(id)a3 partialUpdateMask:(unint64_t)a4 completion:(id)a5;
- (void)openWithCompletion:(id)a3;
- (void)pauseProcessingIncrementalUpdates;
- (void)pauseSearchIndexRebuildWithSourceName:(id)a3;
- (void)removeUnusedGroupsFromPSI;
- (void)resetSearchIndexWithReason:(int64_t)a3 library:(id)a4 dropCompletion:(id)a5 completion:(id)a6;
- (void)resumeProcessingIncrementalUpdatesInLibrary:(id)a3 completion:(id)a4;
- (void)resumeSearchIndexRebuildIfNeededForLibrary:(id)a3 calledBy:(id)a4 completion:(id)a5;
@end

@implementation PLSearchIndexingEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dropLock_dropResult, 0);
  objc_storeStrong((id *)&self->_dropLock_dropGroup, 0);
  objc_storeStrong((id *)&self->_queue_eventHistory, 0);
  objc_storeStrong((id *)&self->_queue_updateEngine, 0);
  objc_storeStrong((id *)&self->_queue_rebuildEngine, 0);
  objc_storeStrong((id *)&self->_queue_psiDatabase, 0);
  objc_storeStrong((id *)&self->_queue_managedSpotlightIndex, 0);
  objc_storeStrong((id *)&self->_queue_spotlightIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessManager, 0);
  objc_storeStrong((id *)&self->_libraryServicesProvider, 0);
}

- (PLSearchIndexConfiguration)configuration
{
  return self->_configuration;
}

- (void)removeUnusedGroupsFromPSI
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLSearchIndexingEngine_removeUnusedGroupsFromPSI__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __51__PLSearchIndexingEngine_removeUnusedGroupsFromPSI__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __51__PLSearchIndexingEngine_removeUnusedGroupsFromPSI__block_invoke_2;
  v9 = &unk_1E58708B0;
  uint64_t v10 = v2;
  if (PLBoolResultWithUnfairLock())
  {
    v3 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Skipped removeUnusedGroupsFromPSI due to index drop in progress", v5, 2u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 48) removeUnusedGroups];
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) removeUser];
}

uint64_t __51__PLSearchIndexingEngine_removeUnusedGroupsFromPSI__block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 100);
}

- (void)inLibraryPerform_donateForIncrementalUpdateEngine:(id)a3 managedObjects:(id)a4 partialUpdateMasks:(id)a5 entity:(unint64_t)a6 deleteIdentifiers:(id)a7 identifiersRequiringAdditionalWorkByEntity:(id)a8 library:(id)a9 progress:(id)a10 completion:(id)a11
{
}

- (int64_t)wellKnownLibraryIdentifierForIncrementalUpdateEngine:(id)a3
{
  return [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
}

- (id)sceneTaxonomyDigestsForSearchIndexingRebuildEngine:(id)a3
{
  v3 = [(PLSearchIndexConfiguration *)self->_configuration sceneTaxonomyProvider];
  v4 = [v3 digests];

  return v4;
}

- (void)dropSearchIndexForSearchIndexingRebuildEngine:(id)a3 completion:(id)a4
{
}

- (void)inLibraryPerform_donateForSearchIndexingRebuildEngine:(id)a3 managedObjects:(id)a4 entity:(unint64_t)a5 entityName:(id)a6 library:(id)a7 progress:(id)a8 queue:(id)a9 completion:(id)a10
{
}

- (int64_t)wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:(id)a3
{
  return [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
}

- (id)_spotlightIndexName
{
  int64_t v2 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
  return +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:v2];
}

- (void)_inLibraryPerform_donateManagedObjects:(id)a3 partialUpdateMasks:(id)a4 entity:(unint64_t)a5 deleteIdentifiers:(id)a6 identifiersRequiringAdditionalWorkByEntity:(id)a7 library:(id)a8 progress:(id)a9 completion:(id)a10
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v56 = a7;
  id v19 = a8;
  id v20 = a9;
  v64 = (void (**)(id, void *))a10;
  v65 = v16;
  uint64_t v58 = [v16 count];
  v61 = v18;
  uint64_t v57 = [v18 count];
  v21 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v58;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v57;
    *(_WORD *)&buf[22] = 2112;
    v98 = (uint64_t (*)(uint64_t, uint64_t))libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Donating %tu managed objects, deleting %tu identifiers for library: %@", buf, 0x20u);
  }

  PLPhotosSearchGetLog();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_generate(v23);

  v24 = v23;
  v25 = v24;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchIndexItems", "", buf, 2u);
  }
  v62 = v25;

  PLPhotosSearchGetLog();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v27 = os_signpost_id_generate(v26);

  v28 = v26;
  v29 = v28;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PLSearchIndexIndexItemsTranslation", "", buf, 2u);
  }
  v55 = v29;

  v60 = [MEMORY[0x1E4F1C9C8] now];
  v30 = [(PLSearchIndexingEngine *)self configuration];
  v31 = [v19 managedObjectContext];
  objc_msgSend(v30, "inLibraryPerform_refreshSharedLibraryEnabledWithManagedObjectContext:", v31);

  char v32 = [v20 isCancelled];
  if (a5 == 1) {
    char v33 = v32;
  }
  else {
    char v33 = 1;
  }
  if (v33)
  {
    v34 = 0;
  }
  else
  {
    v34 = objc_alloc_init(PLSearchIndexingEmbeddingsFetcher);
    v35 = [(PLSearchIndexConfiguration *)self->_configuration indexingContext];
    [(PLSearchIndexingEmbeddingsFetcher *)v34 prefetchEmbeddingsForAssets:v16 indexingContext:v35];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v98 = __Block_byref_object_copy__54756;
  v99 = __Block_byref_object_dispose__54757;
  id v100 = 0;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke;
  v84[3] = &unk_1E586B7A8;
  id v38 = v20;
  id v85 = v38;
  v86 = self;
  id v53 = v17;
  id v87 = v53;
  id v59 = v19;
  id v88 = v59;
  id v39 = v36;
  id v89 = v39;
  v54 = v34;
  v90 = v54;
  id v40 = v37;
  id v91 = v40;
  v92 = buf;
  [v65 enumerateObjectsUsingBlock:v84];
  if (([v38 isCancelled] & 1) == 0 && -[PLSearchIndexingEngine supportsPSI](self, "supportsPSI"))
  {
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_300;
    v82[3] = &unk_1E586B7D0;
    id v83 = v39;
    [v56 enumerateKeysAndObjectsUsingBlock:v82];
  }
  v41 = v55;
  v42 = v41;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_DWORD *)v93 = 134218240;
    uint64_t v94 = v58;
    __int16 v95 = 2048;
    uint64_t v96 = v57;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v42, OS_SIGNPOST_INTERVAL_END, v27, "PLSearchIndexIndexItemsTranslation", "Objects: %tu, DeleteIdentifiers: %tu", v93, 0x16u);
  }

  v43 = [MEMORY[0x1E4F1C9C8] now];
  if (([v38 isCancelled] & 1) != 0 || (uint64_t v44 = *(void *)(*(void *)&buf[8] + 40)) == 0)
  {
    v47 = 0;
    v45 = 0;
  }
  else
  {
    v45 = +[PLGlobalValues searchIndexSpotlightClientStateDictionaryWithIdentifier:v44 timestamp:v43];
    v46 = +[PLGlobalValues searchIndexSpotlightClientStateDataWithDictionary:v45];
    if ([v46 isSuccess])
    {
      v47 = [v46 result];
    }
    else
    {
      v48 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = [v46 error];
        *(_DWORD *)v93 = 138412290;
        uint64_t v94 = (uint64_t)v49;
        _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Error serializing Spotlight client state: %@", v93, 0xCu);
      }
      v47 = 0;
      v45 = 0;
    }
  }
  if ([v38 isCancelled])
  {
    v50 = (void *)MEMORY[0x1E4F8B9B8];
    v51 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    v52 = [v50 failureWithError:v51];
    v64[2](v64, v52);
  }
  else
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3254779904;
    v66[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_302;
    v66[3] = &unk_1EEB2C990;
    id v67 = v60;
    v68 = self;
    id v69 = v39;
    id v70 = v40;
    id v71 = v61;
    id v72 = v47;
    v78 = v62;
    os_signpost_id_t v79 = spid;
    uint64_t v80 = v58;
    uint64_t v81 = v57;
    id v73 = v45;
    id v74 = v59;
    id v75 = v43;
    v77 = buf;
    v76 = v64;
    [(PLSearchIndexingEngine *)self _safePerformBlock:v66];

    v51 = v67;
  }

  _Block_object_dispose(buf, 8);
}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v7 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(*(void *)(a1 + 40) + 8);
      int v31 = 138412290;
      char v32 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Donation canceled for library: %@", (uint8_t *)&v31, 0xCu);
    }

    *a4 = 1;
  }
  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    uint64_t v10 = [v6 objectID];
    v11 = [v9 objectForKeyedSubscript:v10];
    uint64_t v12 = [v11 integerValue];
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = [PLSearchIndexingLazyFetchHelper alloc];
  uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 8) libraryIdentifier];
  v15 = [*(id *)(a1 + 56) managedObjectContext];
  id v16 = [(PLSearchIndexingLazyFetchHelper *)v13 initWithObject:v6 libraryIdentifier:v14 managedObjectContext:v15];

  if ([*(id *)(a1 + 40) supportsPSI])
  {
    id v17 = [*(id *)(*(void *)(a1 + 40) + 120) indexingContext];
    id v18 = +[PLSearchManagedObjectUtilities psiObjectForObject:v6 fetchHelper:v16 partialUpdateMask:v12 indexingContext:v17];

    id v19 = *(void **)(a1 + 64);
    id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "objectType"));
    objc_msgSend(v19, "_pl_safeAddObject:toMutableArrayForKey:", v18, v20);
  }
  if ([*(id *)(a1 + 40) supportsSpotlightDonate])
  {
    uint64_t v21 = [*(id *)(*(void *)(a1 + 40) + 8) libraryIdentifier];
    v22 = [*(id *)(*(void *)(a1 + 40) + 120) indexingContext];
    v23 = +[PLSearchManagedObjectUtilities searchableItemForObject:v6 fetchHelper:v16 partialUpdateMask:v12 libraryIdentifier:v21 indexingContext:v22 embeddingsFetcher:*(void *)(a1 + 72)];

    v24 = +[PLSearchManagedObjectUtilities bundleIdentifierForManagedObject:wellKnownLibraryIdentifier:](PLSearchManagedObjectUtilities, "bundleIdentifierForManagedObject:wellKnownLibraryIdentifier:", v6, [*(id *)(*(void *)(a1 + 40) + 8) libraryIdentifier]);
    if (v24)
    {
      objc_msgSend(*(id *)(a1 + 80), "_pl_safeAddObject:toMutableArrayForKey:", v23, v24);
      v25 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
      if ([v24 isEqualToString:v25])
      {
        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);

        if (v26)
        {
LABEL_18:

          goto LABEL_19;
        }
        uint64_t v27 = [v23 uniqueIdentifier];
        uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
        v25 = *(NSObject **)(v28 + 40);
        *(void *)(v28 + 40) = v27;
      }
    }
    else
    {
      v25 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = [v6 objectID];
        uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
        int v31 = 138543874;
        char v32 = v29;
        __int16 v33 = 2112;
        id v34 = v6;
        __int16 v35 = 2112;
        uint64_t v36 = v30;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "nil bundle identifier, skipping indexing for objectID: %{public}@, object: %@, library: %@", (uint8_t *)&v31, 0x20u);
      }
    }

    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_300(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = +[PLSearchManagedObjectUtilities psiObjectForIdentifierRequiringAdditonalWork:*(void *)(*((void *)&v15 + 1) + 8 * v10) entity:v6];
        uint64_t v12 = *(void **)(a1 + 32);
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "objectType"));
        objc_msgSend(v12, "_pl_safeAddObject:toMutableArrayForKey:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_302(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Finish converting managed objects, elapsed: %f", buf, 0xCu);
  }
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  v14[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_303;
  v14[3] = &unk_1EEB2C958;
  id v20 = *(id *)(a1 + 120);
  long long v21 = *(_OWORD *)(a1 + 128);
  uint64_t v22 = *(void *)(a1 + 144);
  id v15 = *(id *)(a1 + 80);
  id v16 = *(id *)(a1 + 88);
  id v10 = *(id *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 40);
  id v17 = v10;
  uint64_t v18 = v11;
  long long v13 = *(_OWORD *)(a1 + 104);
  id v12 = (id)v13;
  long long v19 = v13;
  objc_msgSend(v5, "_inq_donatePSIObjectsByType:spotlightItemsByBundleID:deleteIdentifiers:spotlightClientState:completion:", v6, v7, v8, v9, v14);
}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_303(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(id *)(a1 + 80);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 88);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1 + 96);
    uint64_t v8 = *(void *)(a1 + 104);
    int v16 = 134218240;
    uint64_t v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLSearchIndexItems", "DonateObjects: %tu, DeleteIdentifiers: %tu", (uint8_t *)&v16, 0x16u);
  }

  if ([v3 isSuccess])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) globalValues];
      [v10 setSearchIndexSpotlightClientState:v9];

      uint64_t v11 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v16 = 138412290;
        uint64_t v17 = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Saving client state to global values: %@", (uint8_t *)&v16, 0xCu);
      }
    }
    long long v13 = [[PLSearchIndexingEvent alloc] initWithDonationCount:*(void *)(a1 + 96) deletionCount:*(void *)(a1 + 104) timestamp:*(void *)(a1 + 48) sampleIdentifier:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  }
  else
  {
    uint64_t v14 = [PLSearchIndexingEvent alloc];
    id v15 = [v3 error];
    long long v13 = [(PLSearchIndexingEvent *)v14 initWithError:v15];
  }
  [*(id *)(*(void *)(a1 + 56) + 88) insertObject:v13 atIndex:0];
  if ((unint64_t)[*(id *)(*(void *)(a1 + 56) + 88) count] >= 6) {
    [*(id *)(*(void *)(a1 + 56) + 88) removeLastObject];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_inq_dropSearchIndexWithSourceName:(id)a3 reasons:(unint64_t)a4 completion:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v55 = MEMORY[0x1E4F143A8];
  uint64_t v56 = 3221225472;
  uint64_t v57 = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke;
  uint64_t v58 = &unk_1E5875CE0;
  id v59 = self;
  PLSafeRunWithUnfairLock();
  id v10 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(a4, 0);
    libraryServicesProvider = self->_libraryServicesProvider;
    [(PLSearchIndexingEngineLibraryServicesProvider *)libraryServicesProvider libraryIdentifier];
    long long v13 = PLStringFromWellKnownPhotoLibraryIdentifier();
    *(_DWORD *)buf = 138544130;
    id v63 = v8;
    __int16 v64 = 2114;
    v65 = v11;
    __int16 v66 = 2112;
    id v67 = libraryServicesProvider;
    __int16 v68 = 2112;
    id v69 = v13;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Dropping search index, source: %{public}@, reasons: %{public}@, for library %@, library identifier: %@", buf, 0x2Au);
  }
  uint64_t v14 = [[PLTimedDispatchGroup alloc] initWithQueue:self->_queue name:@"drop index"];
  id v15 = -[PLSearchIndexingEngineLibraryServicesProvider libraryWithName:](self->_libraryServicesProvider, "libraryWithName:", "-[PLSearchIndexingEngine _inq_dropSearchIndexWithSourceName:reasons:completion:]");
  if ([(PLSearchIndexingEngine *)self supportsSpotlightDelete])
  {
    id v41 = v8;
    int v16 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
    uint64_t v17 = [(PLTimedDispatchGroup *)v14 enterWithTimeout:@"drop spotlight" name:60.0];
    queue_spotlightIndex = self->_queue_spotlightIndex;
    v61 = @"com.apple.mobileslideshow.search";
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_285;
    v53[3] = &unk_1E5873440;
    id v20 = v17;
    id v54 = v20;
    [(CSSearchableIndex *)queue_spotlightIndex deleteSearchableItemsWithDomainIdentifiers:v19 protectionClass:0 forBundleID:v16 options:32 completionHandler:v53];

    long long v21 = [v15 globalValues];
    LODWORD(v19) = objc_msgSend(v21, "shouldDropGlobalSpotlightIndexForLibraryIdentifier:", -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier"));

    if (v19)
    {
      uint64_t v22 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Dropping global Spotlight index", buf, 2u);
      }

      id v23 = objc_alloc(MEMORY[0x1E4F23838]);
      uint64_t v24 = [(PLSearchIndexingEngine *)self _spotlightIndexName];
      uint64_t v25 = (void *)[v23 initWithName:v24 options:32];

      uint64_t v26 = [(PLTimedDispatchGroup *)v14 enterWithTimeout:@"drop spotlight global" name:60.0];
      v60 = @"com.apple.mobileslideshow.search";
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_289;
      v51[3] = &unk_1E5873440;
      id v52 = v26;
      id v28 = v26;
      [v25 deleteSearchableItemsWithDomainIdentifiers:v27 protectionClass:0 forBundleID:v16 options:32 completionHandler:v51];
    }
    id v8 = v41;
  }
  if ([(PLSearchIndexingEngine *)self supportsPSI])
  {
    v29 = [(PLTimedDispatchGroup *)v14 enterWithName:@"drop psi"];
    uint64_t v30 = v29;
    queue_psiDatabase = self->_queue_psiDatabase;
    if (queue_psiDatabase)
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_2;
      v49[3] = &unk_1E5873440;
      char v32 = &v50;
      id v50 = v29;
      [(PSIDatabase *)queue_psiDatabase dropDatabaseWithCompletion:v49];
    }
    else
    {
      __int16 v33 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider pathManager];
      [v33 searchIndexDatabaseFilePath];
      id v34 = v9;
      unint64_t v35 = a4;
      v37 = id v36 = v8;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_3;
      v47[3] = &unk_1E5873440;
      char v32 = &v48;
      id v48 = v30;
      +[PSIDatabase dropDatabaseAtPath:v37 withCompletion:v47];

      id v8 = v36;
      a4 = v35;
      id v9 = v34;
    }
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_4;
  v42[3] = &unk_1E5873600;
  v42[4] = self;
  v43 = v14;
  id v45 = v9;
  unint64_t v46 = a4;
  id v44 = v15;
  id v38 = v9;
  id v39 = v15;
  id v40 = v14;
  [(PLTimedDispatchGroup *)v40 notify:v42];
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 100) = 1;
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 104));
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_285(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F8B9B8] failureWithError:a2];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = [v3 successWithResult:v5];

    uint64_t v4 = (uint64_t)v6;
  }
  id v7 = (id)v4;
  [v2 leaveWithResult:v4];
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_289(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F8B9B8] failureWithError:a2];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = [v3 successWithResult:v5];

    uint64_t v4 = (uint64_t)v6;
  }
  id v7 = (id)v4;
  [v2 leaveWithResult:v4];
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F8B9B8] failureWithError:a2];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = [v3 successWithResult:v5];

    uint64_t v4 = (uint64_t)v6;
  }
  id v7 = (id)v4;
  [v2 leaveWithResult:v4];
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F8B9B8] failureWithError:a2];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = [v3 successWithResult:v5];

    uint64_t v4 = (uint64_t)v6;
  }
  id v7 = (id)v4;
  [v2 leaveWithResult:v4];
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 80))
  {
    int64_t v2 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Search indexing engine: in group notify after _inq_dropSearchIndexForReason, but already closed.", buf, 2u);
    }
  }
  else
  {
    id v3 = [PSIDatabase alloc];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) pathManager];
    uint64_t v5 = [(PSIDatabase *)v3 initWithPathManager:v4 options:2];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;
  }
  id v8 = [*(id *)(a1 + 40) defaultPreferredResult];
  int v9 = [v8 isSuccess];

  id v10 = PLSearchBackendIndexingEngineGetLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Drop search index completed for library %@", buf, 0xCu);
    }

    long long v13 = *(void **)(a1 + 48);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_293;
    v24[3] = &unk_1E5875E40;
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v25 = v14;
    uint64_t v26 = v15;
    uint64_t v27 = *(void *)(a1 + 64);
    [v14 performTransactionAndWait:v24];
    int v16 = [*(id *)(a1 + 48) libraryServicesManager];
    uint64_t v17 = [v16 availabilityComputer];
    [v17 didDropSearchIndexForPhotoLibrary:*(void *)(a1 + 48) error:0];

    uint64_t v11 = v25;
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v19 = [*(id *)(a1 + 40) defaultPreferredResult];
    id v20 = [v19 error];
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    int v31 = v20;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Drop search index failed for library %@, error: %@", buf, 0x16u);
  }
  id v23 = *(id *)(a1 + 40);
  PLSafeRunWithUnfairLock();
  uint64_t v21 = *(void *)(a1 + 56);
  if (v21)
  {
    uint64_t v22 = [*(id *)(a1 + 40) defaultPreferredResult];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
  }
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_293(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) globalValues];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 120) sceneTaxonomyProvider];
  uint64_t v4 = [v3 digests];
  [v2 resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:v4];

  id v5 = [*(id *)(a1 + 32) globalValues];
  [v5 addSearchIndexRebuildCoalescedReasons:*(void *)(a1 + 48)];
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_294(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 100) = 0;
  uint64_t v2 = [*(id *)(a1 + 40) defaultPreferredResult];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  dispatch_group_leave(v5);
}

- (void)_inq_donatePSIObjectsByType:(id)a3 spotlightItemsByBundleID:(id)a4 deleteIdentifiers:(id)a5 spotlightClientState:(id)a6 completion:(id)a7
{
  v129[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v77 = a6;
  uint64_t v15 = (void (**)(id, void *))a7;
  if ([(PLSearchIndexingEngine *)self supportsPSI]) {
    BOOL v16 = self->_queue_psiDatabase == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if ([(PLSearchIndexingEngine *)self supportsSpotlightDonate]) {
    BOOL v17 = self->_queue_spotlightIndex == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v16 || v17)
  {
    uint64_t v18 = @", PSI index missing";
    if (!v16) {
      uint64_t v18 = &stru_1EEB2EB80;
    }
    if (v17) {
      uint64_t v19 = @", Spotlight index missing";
    }
    else {
      uint64_t v19 = &stru_1EEB2EB80;
    }
    id v20 = [NSString stringWithFormat:@"Search index unavailable, may have been closed%@%@", v18, v19];
    uint64_t v21 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v22 = (void *)MEMORY[0x1E4F8B9B8];
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v128 = *MEMORY[0x1E4F28228];
    v129[0] = v20;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:&v128 count:1];
    uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v24];
    uint64_t v26 = [v22 failureWithError:v25];
    v15[2](v15, v26);
  }
  else
  {
    uint64_t v114 = MEMORY[0x1E4F143A8];
    uint64_t v115 = 3221225472;
    v116 = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke;
    v117 = &unk_1E58708B0;
    v118 = self;
    if (PLBoolResultWithUnfairLock())
    {
      uint64_t v27 = [NSString stringWithFormat:@"Search index unavailable, drop in progress"];
      id v28 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v29 = (void *)MEMORY[0x1E4F8B9B8];
      __int16 v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v126 = *MEMORY[0x1E4F28228];
      v127 = v27;
      int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      uint64_t v32 = [v30 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v31];
      __int16 v33 = [v29 failureWithError:v32];
      v15[2](v15, v33);
    }
    else
    {
      uint64_t v72 = [v14 count];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v124 = 0x2020000000;
      uint64_t v125 = 0;
      PLPhotosSearchGetLog();
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t spid = os_signpost_id_generate(v34);

      unint64_t v35 = v34;
      id v36 = v35;
      log = v35;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        BOOL v37 = os_signpost_enabled(v35);
        id v36 = log;
        if (v37)
        {
          *(_WORD *)v119 = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchIndexIndexItemsDonation", "", v119, 2u);
          id v36 = log;
        }
      }

      id v75 = [MEMORY[0x1E4F1C9C8] now];
      v76 = [[PLTimedDispatchGroup alloc] initWithQueue:self->_queue name:@"donate"];
      if ([(PLSearchIndexingEngine *)self supportsPSI])
      {
        id v38 = [v12 objectForKeyedSubscript:&unk_1EEBEEC40];
        if ([v38 count])
        {
          id v39 = [(PLTimedDispatchGroup *)v76 enterWithName:@"psi assets"];
          queue_psiDatabase = self->_queue_psiDatabase;
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_246;
          v111[3] = &unk_1E5875E18;
          id v112 = v75;
          id v41 = v39;
          id v113 = v41;
          [(PSIDatabase *)queue_psiDatabase addAssets:v38 deferRemovingUnusedGroups:1 withCompletion:v111];
        }
        uint64_t v71 = [v38 count];
        v42 = [v12 objectForKeyedSubscript:&unk_1EEBEEC58];
        if ([v42 count])
        {
          v43 = [(PLTimedDispatchGroup *)v76 enterWithName:@"psi collections"];
          id v44 = self->_queue_psiDatabase;
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_252;
          v108[3] = &unk_1E5875E18;
          id v109 = v75;
          id v45 = v43;
          id v110 = v45;
          [(PSIDatabase *)v44 addCollections:v42 deferRemovingUnusedGroups:1 withCompletion:v108];
        }
        uint64_t v70 = [v42 count];
        unint64_t v46 = [v12 objectForKeyedSubscript:&unk_1EEBEEC70];
        if ([v46 count])
        {
          v47 = [(PLTimedDispatchGroup *)v76 enterWithName:@"psi groups"];
          id v48 = self->_queue_psiDatabase;
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_258;
          v105[3] = &unk_1E5875E18;
          id v106 = v75;
          id v49 = v47;
          id v107 = v49;
          [(PSIDatabase *)v48 updateRankingScoreForGroups:v46 withCompletion:v105];
        }
        uint64_t v69 = [v46 count];
        if ([v14 count])
        {
          __int16 v68 = v38;
          id v50 = [(PLTimedDispatchGroup *)v76 enterWithName:@"psi delete assets"];
          v51 = self->_queue_psiDatabase;
          v102[0] = MEMORY[0x1E4F143A8];
          v102[1] = 3221225472;
          v102[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_262;
          v102[3] = &unk_1E5875E18;
          id v52 = v75;
          id v103 = v52;
          id v53 = v50;
          id v104 = v53;
          [(PSIDatabase *)v51 removeAssetsWithUUIDs:v14 deferRemovingUnusedGroups:1 completion:v102];

          id v54 = [(PLTimedDispatchGroup *)v76 enterWithName:@"psi delete collections"];
          uint64_t v55 = self->_queue_psiDatabase;
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_266;
          v99[3] = &unk_1E5875E18;
          id v100 = v52;
          id v56 = v54;
          id v101 = v56;
          [(PSIDatabase *)v55 removeCollectionsWithUUIDs:v14 deferRemovingUnusedGroups:1 completion:v99];

          id v38 = v68;
        }
      }
      else
      {
        uint64_t v69 = 0;
        uint64_t v70 = 0;
        uint64_t v71 = 0;
      }
      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([(PLSearchIndexingEngine *)self supportsSpotlightDonate]
        && [v13 count])
      {
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_267;
        v92[3] = &unk_1E586B778;
        v93 = v76;
        id v94 = v57;
        id v95 = v77;
        uint64_t v96 = self;
        id v97 = v75;
        p_long long buf = &buf;
        [v13 enumerateKeysAndObjectsUsingBlock:v92];
      }
      if ([(PLSearchIndexingEngine *)self supportsSpotlightDelete]
        && [v14 count])
      {
        uint64_t v58 = PLSearchBackendIndexingEngineGetLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v59 = [v14 count];
          v60 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
          *(_DWORD *)v119 = 134218242;
          uint64_t v120 = v59;
          __int16 v121 = 2114;
          v122 = v60;
          _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEFAULT, "Deleting %tu items from Spotlight for bundleID: %{public}@", v119, 0x16u);
        }
        v61 = [(PLTimedDispatchGroup *)v76 enterWithTimeout:@"spotlight delete" name:60.0];
        [v57 addObject:v61];
        queue_spotlightIndex = self->_queue_spotlightIndex;
        id v63 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_276;
        v89[3] = &unk_1E586B750;
        id v90 = v75;
        id v64 = v61;
        id v91 = v64;
        [(CSSearchableIndex *)queue_spotlightIndex indexSearchableItems:0 deleteSearchableItemsWithIdentifiers:v14 clientState:0 clientStateName:0 protectionClass:0 forBundleID:v63 options:32 completionHandler:v89];
      }
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3254779904;
      v78[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_277;
      v78[3] = &unk_1EEB2C920;
      v65 = log;
      v82 = &buf;
      id v83 = v65;
      os_signpost_id_t v84 = spid;
      uint64_t v85 = v71;
      uint64_t v86 = v70;
      uint64_t v87 = v69;
      uint64_t v88 = v72;
      id v66 = v57;
      id v79 = v66;
      uint64_t v81 = v15;
      id v67 = v76;
      uint64_t v80 = v67;
      [(PLTimedDispatchGroup *)v67 notify:v78];

      _Block_object_dispose(&buf, 8);
    }
  }
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 100);
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_246(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PSI asset donation completed, elapsed: %f", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) leave];
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_252(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PSI collection donation completed, elapsed: %f", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) leave];
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_258(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PSI update rankings completed, elapsed: %f", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) leave];
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_262(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PSI delete assets completed, elapsed: %f", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) leave];
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_266(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PSI delete collections completed, elapsed: %f", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) leave];
}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_267(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v20 = [v6 count];
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Donating %tu items to Spotlight for bundleID: %{public}@", buf, 0x16u);
  }

  uint64_t v8 = *(void **)(a1 + 32);
  int v9 = [NSString stringWithFormat:@"spotlight donate for %@", v5];
  id v10 = [v8 enterWithTimeout:v9 name:60.0];

  [*(id *)(a1 + 40) addObject:v10];
  uint64_t v11 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
  if (![v5 isEqualToString:v11])
  {
    id v12 = 0;
LABEL_8:

    goto LABEL_9;
  }
  id v12 = *(id *)(a1 + 48);

  if (v12)
  {
    uint64_t v11 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v12 length];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v20 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Donating client state of length %tu", buf, 0xCu);
    }
    goto LABEL_8;
  }
LABEL_9:
  id v14 = *(void **)(*(void *)(a1 + 56) + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_271;
  v16[3] = &unk_1E586B750;
  id v17 = *(id *)(a1 + 64);
  id v18 = v10;
  id v15 = v10;
  [v14 indexSearchableItems:v6 deleteSearchableItemsWithIdentifiers:0 clientState:v12 protectionClass:0 forBundleID:v5 options:32 completionHandler:v16];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v6 count];
}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_276(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLSearchBackendIndexingEngineGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Spotlight delete failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

    id v6 = [MEMORY[0x1E4F8B9B8] failureWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
      [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
      int v11 = 134217984;
      id v12 = v8;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Spotlight delete completed, elapsed: %f", (uint8_t *)&v11, 0xCu);
    }
    int v9 = (void *)MEMORY[0x1E4F8B9B8];
    id v10 = [MEMORY[0x1E4F1CA98] null];
    id v6 = [v9 successWithResult:v10];
  }
  [*(id *)(a1 + 40) leaveWithResult:v6];
}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_277(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 64);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v6 = *(void *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 96);
    uint64_t v9 = *(void *)(a1 + 104);
    *(_DWORD *)long long buf = 134219008;
    uint64_t v24 = v5;
    __int16 v25 = 2048;
    uint64_t v26 = v6;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v8;
    __int16 v31 = 2048;
    uint64_t v32 = v9;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PLSearchIndexIndexItemsDonation", "CSSearchableItems: %tu, PSI Assets: %tu, PSI Collections: %tu, PSI Groups: %tu, DeleteIdentifiers: %tu", buf, 0x34u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "didTimeout", (void)v18))
        {
          id v15 = PLSearchBackendIndexingEngineGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Spotlight request timed out, donation failure", buf, 2u);
          }

          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    id v17 = [*(id *)(a1 + 40) defaultPreferredResult];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_271(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = PLSearchBackendIndexingEngineGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Spotlight donation failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x1E4F8B9B8] failureWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
      [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
      int v11 = 134217984;
      id v12 = v8;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Spotlight donation completed, elapsed: %f", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F8B9B8];
    id v10 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v6 = [v9 successWithResult:v10];
  }
  [*(id *)(a1 + 40) leaveWithResult:v6];
}

- (void)_inq_validateSpotlightClientStateAgainstExpectedClientState:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLSearchIndexingEngine.m", 745, @"Invalid parameter not satisfying: %@", @"expectedClientState != nil" object file lineNumber description];
  }
  queue_spotlightIndex = self->_queue_spotlightIndex;
  id v10 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
  int v11 = [(PLSearchIndexingEngine *)self _spotlightIndexName];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__PLSearchIndexingEngine__inq_validateSpotlightClientStateAgainstExpectedClientState_completion___block_invoke;
  v15[3] = &unk_1E586B728;
  id v16 = v7;
  id v17 = self;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  [(CSSearchableIndex *)queue_spotlightIndex fetchLastClientStateWithProtectionClass:0 forBundleID:v10 clientStateName:v11 options:32 completionHandler:v15];
}

void __97__PLSearchIndexingEngine__inq_validateSpotlightClientStateAgainstExpectedClientState_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F8B9B8];
  id v8 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v9 = [v7 successWithResult:v8];

  if ([v5 length])
  {
    id v10 = +[PLGlobalValues searchIndexSpotlightClientStateDataWithDictionary:a1[4]];
    if ([v10 isSuccess])
    {
      int v11 = [v10 result];
      int v12 = [v11 isEqualToData:v5];

      if (v12)
      {
        id v13 = PLSearchBackendIndexingEngineGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = a1[4];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v36 = v14;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Fetched client state matches expected client state: %@", buf, 0xCu);
        }
      }
      else
      {
        id v22 = +[PLGlobalValues searchIndexSpotlightClientStateWithData:v5];
        if ([v22 isSuccess])
        {
          uint64_t v23 = NSString;
          uint64_t v24 = a1[4];
          __int16 v25 = [v22 result];
          uint64_t v26 = [v23 stringWithFormat:@"Expected client state does not match fetched client state, expected: %@, fetched: %@", v24, v25];

          __int16 v27 = (void *)a1[5];
          uint64_t v28 = 2;
          __int16 v29 = v26;
          uint64_t v30 = 0;
        }
        else
        {
          uint64_t v32 = (void *)a1[5];
          uint64_t v26 = [v22 error];
          __int16 v29 = @"Error deserializing client state";
          __int16 v27 = v32;
          uint64_t v28 = 3;
          uint64_t v30 = v26;
        }
        uint64_t v33 = [v27 _clientStateResultAndLogWithCode:v28 debugDescription:v29 underlyingError:v30];

        uint64_t v9 = (void *)v33;
      }
    }
    else
    {
      long long v19 = (void *)a1[5];
      long long v20 = [v10 error];
      uint64_t v21 = [v19 _clientStateResultAndLogWithCode:3 debugDescription:@"Error serializing expected client state" underlyingError:v20];

      uint64_t v9 = (void *)v21;
    }
  }
  else
  {
    if (v6)
    {
      id v15 = (void *)a1[5];
      id v16 = @"Error fetching client state";
      uint64_t v17 = 4;
      id v18 = v6;
    }
    else
    {
      uint64_t v31 = [v5 length];
      id v15 = (void *)a1[5];
      if (v31) {
        id v16 = @"Spotlight client state is missing, possible Spotlight donation loss, search index rebuild required";
      }
      else {
        id v16 = @"Spotlight client state has zero length, possible Spotlight donation loss, search index rebuild required";
      }
      uint64_t v17 = 1;
      id v18 = 0;
    }
    uint64_t v34 = [v15 _clientStateResultAndLogWithCode:v17 debugDescription:v16 underlyingError:v18];

    uint64_t v9 = (void *)v34;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)_clientStateResultAndLogWithCode:(unint64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    int v17 = 138543874;
    id v18 = v8;
    __int16 v19 = 2112;
    long long v20 = libraryServicesProvider;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%{public}@ for library: %@, error: %@", (uint8_t *)&v17, 0x20u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  id v13 = (void *)MEMORY[0x1E4F8B9B8];
  uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PLSearchIndexSpotlightClientStateErrorDomain" code:a3 userInfo:v12];
  id v15 = [v13 failureWithError:v14];

  return v15;
}

- (void)_inq_close
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    int v13 = 138412290;
    uint64_t v14 = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Closing search index for library: %@", (uint8_t *)&v13, 0xCu);
  }

  id v5 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = self->_libraryServicesProvider;
    queue_eventHistory = self->_queue_eventHistory;
    int v13 = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = queue_eventHistory;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Most recent search indexing events for library (%@) %@", (uint8_t *)&v13, 0x16u);
  }

  self->_queue_closed = 1;
  queue_spotlightIndex = self->_queue_spotlightIndex;
  self->_queue_spotlightIndex = 0;

  queue_managedSpotlightIndex = self->_queue_managedSpotlightIndex;
  self->_queue_managedSpotlightIndex = 0;

  queue_psiDatabase = self->_queue_psiDatabase;
  self->_queue_psiDatabase = 0;

  queue_rebuildEngine = self->_queue_rebuildEngine;
  self->_queue_rebuildEngine = 0;

  queue_updateEngine = self->_queue_updateEngine;
  self->_queue_updateEngine = 0;

  [(PLSearchIndexingEngine *)self _inq_releaseSpotlightSandboxExtension];
}

- (void)_inq_open
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Opening search index for library: %@", buf, 0xCu);
  }

  if ([(PLSearchIndexingEngine *)self supportsSpotlightDonate])
  {
    if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:[(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier]])
    {
      id v5 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider pathManager];
      queue_spotlightIndex = [v5 spotlightSearchIndexPath];

      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v39 = 0;
      int v8 = [v7 createDirectoryAtPath:queue_spotlightIndex withIntermediateDirectories:1 attributes:0 error:&v39];
      id v9 = v39;

      if (v8)
      {
        [(PLSearchIndexingEngine *)self _inq_acquireSpotlightSandboxExtensionIfNeeded];
        id v10 = PLSearchBackendIndexingEngineGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = queue_spotlightIndex;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Creating managed spotlight index at path: %@", buf, 0xCu);
        }

        id v11 = objc_alloc(MEMORY[0x1E4F237F8]);
        id v12 = [(PLSearchIndexingEngine *)self _spotlightIndexName];
        int v13 = (void *)[v11 initWithName:v12 protectionClass:0 path:queue_spotlightIndex];

        BOOL v14 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier] == 1;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke;
        v36[3] = &unk_1E586B6D8;
        BOOL v38 = v14;
        id v37 = queue_spotlightIndex;
        [v13 setUISearchEnabled:v14 completionHandler:v36];
        objc_storeStrong((id *)&self->_queue_spotlightIndex, v13);
        queue_managedSpotlightIndex = self->_queue_managedSpotlightIndex;
        self->_queue_managedSpotlightIndex = (CSManagedSearchableIndex *)v13;
        id v16 = v13;
      }
      else
      {
        id v16 = PLSearchBackendIndexingEngineGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = self->_libraryServicesProvider;
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v19;
          __int16 v41 = 2112;
          id v42 = v9;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to create Spotlight index directory for %@, error: %@", buf, 0x16u);
        }
      }

      if (!self->_queue_spotlightIndex)
      {
        long long v20 = PLSearchBackendIndexingEngineGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_FAULT, "Unable to create managed spotlight index", buf, 2u);
        }
      }
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F23838]);
      id v9 = [(PLSearchIndexingEngine *)self _spotlightIndexName];
      id v18 = (CSSearchableIndex *)[v17 initWithName:v9];
      queue_spotlightIndex = self->_queue_spotlightIndex;
      self->_queue_spotlightIndex = v18;
    }
  }
  if ([(PLSearchIndexingEngine *)self supportsPSI])
  {
    __int16 v21 = [PSIDatabase alloc];
    id v22 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider pathManager];
    uint64_t v23 = [(PSIDatabase *)v21 initWithPathManager:v22 options:2];
    queue_psiDatabase = self->_queue_psiDatabase;
    self->_queue_psiDatabase = v23;
  }
  __int16 v25 = [[PLSearchIndexingRebuildEngine alloc] initWithDelegate:self provider:self->_libraryServicesProvider];
  queue_rebuildEngine = self->_queue_rebuildEngine;
  self->_queue_rebuildEngine = v25;

  __int16 v27 = [[PLSearchIndexingIncrementalUpdateEngine alloc] initWithDelegate:self];
  queue_updateEngine = self->_queue_updateEngine;
  self->_queue_updateEngine = v27;

  self->_queue_closed = 0;
  __int16 v29 = -[PLSearchIndexingEngineLibraryServicesProvider libraryWithName:](self->_libraryServicesProvider, "libraryWithName:", "-[PLSearchIndexingEngine _inq_open]");
  if ([(PLSearchIndexingEngine *)self supportsSpotlightClientState])
  {
    uint64_t v30 = [v29 globalValues];
    uint64_t v31 = [v30 searchIndexSpotlightClientState];

    if (v31)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke_189;
      v34[3] = &unk_1E586B700;
      v34[4] = self;
      id v35 = v29;
      [(PLSearchIndexingEngine *)self _inq_validateSpotlightClientStateAgainstExpectedClientState:v31 completion:v34];
    }
  }
  *(void *)long long buf = 0;
  if (+[PLSearchIndexingRebuildEngine requiresImmediateDropIndexForLibrary:v29 reasons:buf])
  {
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLSearchIndexingEngine _inq_open]");
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke_3;
    v33[3] = &unk_1E586B6B0;
    v33[4] = self;
    [(PLSearchIndexingEngine *)self _inq_dropSearchIndexWithSourceName:v32 reasons:*(void *)buf completion:v33];
  }
}

void __35__PLSearchIndexingEngine__inq_open__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_signpost_id_t v4 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 40)) {
        id v6 = @"enabled";
      }
      else {
        id v6 = @"disabled";
      }
      int v7 = 138543874;
      int v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to set UI search %{public}@ for managed spotlight index at path: %@, error: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void __35__PLSearchIndexingEngine__inq_open__block_invoke_189(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFailure])
  {
    os_signpost_id_t v4 = [v3 error];
    uint64_t v5 = [v4 domain];
    int v6 = [v5 isEqualToString:@"PLSearchIndexSpotlightClientStateErrorDomain"];

    if (v6)
    {
      int v7 = +[PLConcurrencyLimiter sharedLimiter];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 24);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke_2;
      v10[3] = &unk_1E5873A50;
      v10[4] = v8;
      id v11 = v3;
      id v12 = *(id *)(a1 + 40);
      [v7 dispatchAsync:v9 block:v10];
    }
  }
}

void __35__PLSearchIndexingEngine__inq_open__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Drop search index completed following index open for library %@", (uint8_t *)&v4, 0xCu);
  }
}

void __35__PLSearchIndexingEngine__inq_open__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) error];
  objc_msgSend(v2, "_inq_handleClientStateValidationError:library:", v3, *(void *)(a1 + 48));
}

- (void)_inq_releaseSpotlightSandboxExtension
{
  if (self->_queue_spotlightSandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_queue_spotlightSandboxExtensionHandle = -1;
    id v3 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Released sandbox extension", v4, 2u);
    }
  }
}

- (BOOL)_inq_acquireSpotlightSandboxExtensionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_queue_spotlightSandboxExtensionHandle == -1)
  {
    id v3 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider pathManager];
    id v4 = [v3 libraryURL];
    uint64_t v5 = [v4 fileSystemRepresentation];

    uint64_t v6 = sandbox_extension_issue_file_to_self();
    if (v6)
    {
      int v7 = (void *)v6;
      int64_t v8 = sandbox_extension_consume();
      self->_queue_spotlightSandboxExtensionHandle = v8;
      uint64_t v9 = PLSearchBackendIndexingEngineGetLog();
      uint64_t v10 = v9;
      if (v8 == -1)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v17 = *__error();
          int v19 = 67109378;
          int v20 = v17;
          __int16 v21 = 2080;
          uint64_t v22 = v5;
          id v11 = "Failed to consume sandbox extension token, errno: %{darwin.errno}d, path: %s";
          id v12 = v10;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          uint32_t v14 = 18;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        id v11 = "Acquired sandbox extension";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v12, v13, v11, (uint8_t *)&v19, v14);
      }

      free(v7);
      return self->_queue_spotlightSandboxExtensionHandle != -1;
    }
    __int16 v15 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *__error();
      int v19 = 67109378;
      int v20 = v16;
      __int16 v21 = 2080;
      uint64_t v22 = v5;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token, errno: %{darwin.errno}d, path: %s", (uint8_t *)&v19, 0x12u);
    }
  }
  return self->_queue_spotlightSandboxExtensionHandle != -1;
}

- (void)_inq_handleClientStateValidationError:(id)a3 library:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 code];
  if (v7 == 2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_2;
    v15[3] = &unk_1E5875CE0;
    int v16 = (PLTimedDispatchGroup *)v6;
    [(PLTimedDispatchGroup *)v16 performTransactionAndWait:v15];
    uint64_t v10 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if (v7 == 1)
  {
    int64_t v8 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      libraryServicesProvider = self->_libraryServicesProvider;
      *(_DWORD *)long long buf = 138412290;
      __int16 v21 = libraryServicesProvider;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "Spotlight client state missing for library: %@, starting auto bug capture", buf, 0xCu);
    }

    uint64_t v10 = [[PLTimedDispatchGroup alloc] initWithQueue:self->_queue name:@"countSpotlightAssetsQuery"];
    id v11 = +[PLSpotlightQueryUtilities countAssetsQueryStringForLibraryIdentifier:[(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier]];
    int64_t v12 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
    os_log_type_t v13 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider pathManager];
    uint32_t v14 = +[PLSpotlightQueryUtilities searchQueryForLibraryIdentifier:v12 pathManager:v13 queryString:v11];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke;
    v19[3] = &unk_1E586B6B0;
    v19[4] = self;
    +[PLSpotlightQueryUtilities countForSearchQuery:v14 timedDispatchGroup:v10 completion:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_177;
    v17[3] = &unk_1E5875CE0;
    id v18 = v6;
    [v18 performTransactionAndWait:v17];

    goto LABEL_7;
  }
LABEL_8:
}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 isSuccess];
  uint64_t v5 = PLSearchBackendIndexingEngineGetLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 result];
      uint64_t v8 = [v7 unsignedIntegerValue];
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      int v20 = v9;
      uint64_t v10 = "Found %lu Spotlight assets for library %@";
      id v11 = v6;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = [v3 error];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    int v20 = v7;
    uint64_t v10 = "Spotlight query for assets failed for library %@, error: %@";
    id v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 88);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_176;
  v16[3] = &unk_1E586B6B0;
  void v16[4] = v14;
  +[PLAutoBugCapture captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult:v3 searchIndexingEvents:v15 completion:v16];
}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_177(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) globalValues];
  [v2 addRebuildRequiredExternalReasons:256];

  id v3 = [*(id *)(a1 + 32) globalValues];
  [v3 incrementSpotlightClientStateMissingCount];

  id v4 = [*(id *)(a1 + 32) globalValues];
  [v4 setSearchIndexSpotlightClientState:0];
}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) globalValues];
  [v2 incrementSpotlightClientStateMismatchedCount];

  id v3 = [*(id *)(a1 + 32) globalValues];
  [v3 setSearchIndexSpotlightClientState:0];
}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_176(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Auto bug capture completed with result: %@ for library; %@",
      (uint8_t *)&v6,
      0x16u);
  }
}

- (void)_inLibraryPerform_donateAssets:(id)a3 library:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v18 isEligibleForSearchIndexing])
        {
          [v11 addObject:v18];
        }
        else
        {
          __int16 v19 = [v18 uuid];
          [v12 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  [(PLSearchIndexingAccessManager *)self->_accessManager addUser];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__PLSearchIndexingEngine__inLibraryPerform_donateAssets_library_completion___block_invoke;
  v21[3] = &unk_1E586B688;
  v21[4] = self;
  id v22 = v10;
  id v20 = v10;
  [(PLSearchIndexingEngine *)self _inLibraryPerform_donateManagedObjects:v11 partialUpdateMasks:0 entity:1 deleteIdentifiers:v12 identifiersRequiringAdditionalWorkByEntity:0 library:v9 progress:0 completion:v21];
}

void __76__PLSearchIndexingEngine__inLibraryPerform_donateAssets_library_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v3 removeUser];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_safePerformBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLSafeRunWithUnfairLock();
}

void __44__PLSearchIndexingEngine__safePerformBlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 100))
  {
    uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)long long buf = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Drop index in progress, delaying work until drop complete: %{public}@", buf, 0xCu);
    }
    id v4 = +[PLConcurrencyLimiter sharedLimiter];
    [v4 groupNotify:*(void *)(*(void *)(a1 + 32) + 104) queue:*(void *)(*(void *)(a1 + 32) + 24) block:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = +[PLConcurrencyLimiter sharedLimiter];
    [v5 dispatchAsync:*(void *)(*(void *)(a1 + 32) + 24) block:*(void *)(a1 + 40)];
  }
}

- (void)pauseProcessingIncrementalUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)long long buf = 138412290;
    id v7 = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Pausing incremental updates for library: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PLSearchIndexingEngine_pauseProcessingIncrementalUpdates__block_invoke;
  v5[3] = &unk_1E5875CE0;
  v5[4] = self;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v5];
}

uint64_t __59__PLSearchIndexingEngine_pauseProcessingIncrementalUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) pause];
}

- (void)resumeProcessingIncrementalUpdatesInLibrary:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Resuming incremental updates for library: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke;
  v12[3] = &unk_1E5874868;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v12];
}

void __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke_2;
  v5[3] = &unk_1E586B688;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 resumeWithLibrary:v2 completion:v5];
}

uint64_t __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeUser];
}

- (id)processBatchOfJobsWithType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5 completion:(id)a6
{
  unsigned int v8 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 5) {
      id v13 = @"unknown";
    }
    else {
      id v13 = off_1E586CC90[(unsigned __int16)v8];
    }
    id v14 = v13;
    uint64_t v15 = PLBackgroundJobWorkerSearchJobFlagsDescription(a4);
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v31 = v14;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    __int16 v34 = 2112;
    id v35 = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Processing batch of jobs of type: %{public}@, flags: %{public}@, for library: %@", buf, 0x20u);
  }
  uint64_t v17 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke;
  v24[3] = &unk_1E586B660;
  __int16 v29 = v8;
  int64_t v28 = a4;
  void v24[4] = self;
  id v25 = v10;
  id v18 = v17;
  id v26 = v18;
  id v27 = v11;
  id v19 = v11;
  id v20 = v10;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v24];
  uint64_t v21 = v27;
  id v22 = v18;

  return v22;
}

void __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v4 = *(__int16 *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke_2;
  v8[3] = &unk_1E586B688;
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v3 processBatchOfJobsWithType:v4 flags:v6 library:v2 progress:v5 completion:v8];
}

uint64_t __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeUser];
}

- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Fetching remaining search indexing work", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke;
  v11[3] = &unk_1E5874868;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v11];
}

void __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2;
  v25[3] = &unk_1E586B610;
  id v27 = v30;
  int64_t v28 = v29;
  uint64_t v5 = v2;
  id v26 = v5;
  [v4 fetchRemainingWorkWithLibrary:v3 completion:v25];
  dispatch_group_enter(v5);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 64);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_3;
  v18[3] = &unk_1E586B610;
  id v20 = v23;
  uint64_t v21 = v22;
  unsigned int v8 = v5;
  id v19 = v8;
  [v7 fetchRemainingWorkWithLibrary:v6 completion:v18];
  id v9 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_4;
  v12[3] = &unk_1E586B638;
  id v14 = v29;
  uint64_t v15 = v30;
  uint64_t v16 = v23;
  uint64_t v17 = v22;
  id v11 = *(id *)(a1 + 48);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v9 groupNotify:v8 queue:v10 block:v12];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
}

void __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_4(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[6] + 8) + 24);
  if (v2)
  {
    BOOL v3 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24) != 0;
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      uint64_t v4 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch remaining search indexing work", (uint8_t *)&v9, 2u);
      }
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v3 = *(unsigned char *)(*(void *)(a1[8] + 8) + 24) != 0;
  }
  if (*(void *)(*(void *)(a1[9] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  uint64_t v4 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v6 = *(void *)(*(void *)(a1[9] + 8) + 24);
    id v7 = @"N";
    if (v3) {
      id v7 = @"Y";
    }
    int v9 = 134218498;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Remaining search indexing work, rebuild: %tu, incremental: %tu isPaused: %{public}@", (uint8_t *)&v9, 0x20u);
  }
LABEL_13:

  (*(void (**)(double))(a1[5] + 16))(0.0);
  return [*(id *)(a1[4] + 16) removeUser];
}

- (void)resetSearchIndexWithReason:(int64_t)a3 library:(id)a4 dropCompletion:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = PLSearchBackendIndexRebuildGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 0xA) {
      id v14 = @"PLSearchIndexRebuildReasonNone";
    }
    else {
      id v14 = off_1E586B7F0[a3 - 1];
    }
    *(_DWORD *)long long buf = 138543618;
    char v24 = v14;
    __int16 v25 = 2050;
    int64_t v26 = a3;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Received request to drop and rebuild search index with reason: %{public}@ (%{public}ld)", buf, 0x16u);
  }

  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLSearchIndexingEngine resetSearchIndexWithReason:library:dropCompletion:completion:]");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke;
  v19[3] = &unk_1E586B5E8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  [(PLSearchIndexingEngine *)self dropSearchIndexWithSourceName:v15 completion:v19];
}

void __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if ([v3 isSuccess])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke_2;
    v8[3] = &unk_1E586B5C0;
    id v9 = *(id *)(a1 + 56);
    [v5 resumeSearchIndexRebuildIfNeededForLibrary:v6 calledBy:@"Reset" completion:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    }
  }
}

uint64_t __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pauseSearchIndexRebuildWithSourceName:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)long long buf = 138412290;
    id v11 = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Pausing search indexing for library: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PLSearchIndexingEngine_pauseSearchIndexRebuildWithSourceName___block_invoke;
  v8[3] = &unk_1E5875E18;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v8];
}

uint64_t __64__PLSearchIndexingEngine_pauseSearchIndexRebuildWithSourceName___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) pauseSearchIndexRebuildWithSourceName:*(void *)(a1 + 40)];
}

- (void)resumeSearchIndexRebuildIfNeededForLibrary:(id)a3 calledBy:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)long long buf = 138412290;
    id v21 = libraryServicesProvider;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Search indexing resuming if needed for library: %@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke;
  v16[3] = &unk_1E58710F0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v16];
}

void __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_2;
  v6[3] = &unk_1E586B598;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 resumeSearchIndexRebuildIfNeededForLibrary:v2 calledBy:v4 completion:v6];
}

uint64_t __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeUser];
}

- (BOOL)hasRebuildWorkToDoForLibrary:(id)a3
{
  libraryServicesProvider = self->_libraryServicesProvider;
  id v5 = a3;
  uint64_t v6 = [(PLSearchIndexingEngineLibraryServicesProvider *)libraryServicesProvider libraryIdentifier];
  id v7 = [(PLSearchIndexConfiguration *)self->_configuration sceneTaxonomyProvider];
  id v8 = [v7 digests];
  BOOL v9 = +[PLSearchIndexingRebuildEngine hasRebuildWorkToDoForLibrary:v5 identifier:v6 sceneTaxonomyDigests:v8];

  return v9;
}

- (void)_dropSearchIndexWithSourceName:(id)a3 reasons:(unint64_t)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke;
  id v21 = &unk_1E586B570;
  uint64_t v22 = self;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  if ((PLBoolResultWithUnfairLock() & 1) == 0)
  {
    uint64_t v12 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      libraryServicesProvider = self->_libraryServicesProvider;
      *(_DWORD *)long long buf = 138543618;
      id v26 = v10;
      __int16 v27 = 2112;
      int64_t v28 = libraryServicesProvider;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Request to drop search index for source %{public}@, library: %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_153;
    v14[3] = &unk_1E5873510;
    void v14[4] = self;
    id v15 = v10;
    unint64_t v17 = a4;
    id v16 = v11;
    [(PLSearchIndexingEngine *)self _safePerformBlock:v14];
  }
}

BOOL __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 100)) {
    return 0;
  }
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Drop index currently in progress during request to drop for source %{public}@, library: %@", buf, 0x16u);
  }

  id v5 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 104);
  uint64_t v8 = *(void *)(v6 + 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_151;
  v11[3] = &unk_1E58742F0;
  id v9 = *(id *)(a1 + 48);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  [v5 groupNotify:v7 queue:v8 block:v11];

  return *(unsigned char *)(*(void *)(a1 + 32) + 100) != 0;
}

void __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_153(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_2;
  v6[3] = &unk_1E586B688;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  objc_msgSend(v2, "_inq_dropSearchIndexWithSourceName:reasons:completion:", v3, v4, v6);
}

uint64_t __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v3 removeUser];
}

uint64_t __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_151(uint64_t a1)
{
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Notifying drop index completed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dropSearchIndexWithSourceName:(id)a3 completion:(id)a4
{
}

- (void)disableUISearch
{
  uint64_t v3 = +[PLConcurrencyLimiter sharedLimiter];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PLSearchIndexingEngine_disableUISearch__block_invoke;
  v4[3] = &unk_1E5875CE0;
  v4[4] = self;
  [v3 sync:v4 identifyingBlock:0 library:0];
}

void __41__PLSearchIndexingEngine_disableUISearch__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Disabling UI search for %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) description];
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PLSearchIndexingEngine_disableUISearch__block_invoke_149;
  v7[3] = &unk_1E5873440;
  id v8 = v4;
  id v6 = v4;
  [v5 setUISearchEnabled:0 completionHandler:v7];
  [*(id *)(*(void *)(a1 + 32) + 16) removeUser];
}

void __41__PLSearchIndexingEngine_disableUISearch__block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLSearchBackendIndexingEngineGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      id v7 = "Failed to disable UI search for library: %@, error: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = 0;
    id v7 = "Disabled UI search for library: %@, error: %@";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

- (void)indexAssetsIfNeededWithObjectIDs:(id)a3 library:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke;
  v14[3] = &unk_1E58710F0;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v14];
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Indexing assets if needed (%tu) for %@", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  [*(id *)(*(void *)(a1 + 40) + 16) addUser];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 32)];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (([v11 isTemporaryID] & 1) != 0
          || PLSearchIndexObjectIDRequiresRebuildPass(v11, *(void **)(a1 + 48)))
        {
          [v5 addObject:v11];
          [v6 removeObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v8);
  }

  id v12 = [[PLTimedDispatchGroup alloc] initWithQueue:*(void *)(*(void *)(a1 + 40) + 24) name:@"indexAssetsIfNeeded"];
  if ([v5 count])
  {
    id v13 = [(PLTimedDispatchGroup *)v12 enterWithName:@"assetsNeverIndexed"];
    id v14 = *(void **)(a1 + 48);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_132;
    v34[3] = &unk_1E5875BD0;
    id v35 = v5;
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 40);
    id v36 = v15;
    uint64_t v37 = v16;
    id v39 = buf;
    id v17 = v13;
    id v38 = v17;
    [v14 performBlockAndWait:v34];
  }
  if ([v6 count])
  {
    id v18 = [(PLTimedDispatchGroup *)v12 enterWithName:@"assetsIncrementalUpdates"];
    uint64_t v19 = *(void **)(a1 + 48);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_3;
    v28[3] = &unk_1E5875BD0;
    id v29 = v6;
    id v30 = *(id *)(a1 + 48);
    id v20 = v18;
    uint64_t v21 = *(void *)(a1 + 40);
    id v31 = v20;
    uint64_t v32 = v21;
    uint64_t v33 = v44;
    [v19 performBlockAndWait:v28];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_7;
  void v23[3] = &unk_1E586EEA0;
  v23[4] = *(void *)(a1 + 40);
  id v25 = *(id *)(a1 + 56);
  uint64_t v22 = v12;
  id v24 = v22;
  id v26 = buf;
  __int16 v27 = v44;
  [(PLTimedDispatchGroup *)v22 notify:v23];

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(buf, 8);
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_132(uint64_t a1)
{
  uint64_t v2 = +[PLManagedAsset assetsWithObjectIDs:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 count];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_2;
  v8[3] = &unk_1E586B520;
  uint64_t v10 = v3;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v7;
  long long v9 = v7;
  objc_msgSend(v4, "_inLibraryPerform_donateAssets:library:completion:", v2, v5, v8);
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_3(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset fetchRequest];
  [v2 setResultType:2];
  v27[0] = @"uuid";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v2 setPropertiesToFetch:v3];

  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_4;
  v25[3] = &unk_1E5871D18;
  id v7 = v5;
  id v26 = v7;
  uint64_t v8 = [v6 enumerateObjectsFromFetchRequest:v2 count:0 usingDefaultBatchSizeWithBlock:v25];

  if (v8)
  {
    long long v9 = *(void **)(a1 + 48);
    id v10 = [MEMORY[0x1E4F8B9B8] failureWithError:v8];
    id v11 = v9;
LABEL_7:
    [v11 leaveWithResult:v10];
    goto LABEL_8;
  }
  id v12 = [*(id *)(a1 + 40) managedObjectContext];
  id v10 = +[PLBackgroundJobWorkItem searchIndexWorkItemManagedObjectIDsForIdentifiers:v7 managedObjectContext:v12];

  if (![v10 isSuccess]
    || ([v10 result],
        id v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        !v14))
  {
    id v11 = *(void **)(a1 + 48);
    goto LABEL_7;
  }
  id v15 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(v16 + 24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_5;
  v20[3] = &unk_1E5875BD0;
  v20[4] = v16;
  id v10 = v10;
  id v21 = v10;
  id v18 = *(id *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 64);
  id v22 = v18;
  uint64_t v24 = v19;
  id v23 = *(id *)(a1 + 48);
  [v15 dispatchAsync:v17 block:v20];

LABEL_8:
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_7(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeUser];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) defaultPreferredResult];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)+ *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"uuid"];
  [*(id *)(a1 + 32) addObject:v3];
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  id v3 = [*(id *)(a1 + 40) result];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_6;
  v5[3] = &unk_1E586B548;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  [v2 processJobObjectIDs:v3 entity:1 library:v4 completion:v5];
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isSuccess])
  {
    id v3 = [*(id *)(a1 + 32) result];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
  }
  [*(id *)(a1 + 40) leaveWithResult:v4];
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuccess]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a1 + 48);
  }
  [*(id *)(a1 + 32) leaveWithResult:v3];
}

- (void)indexAssetsWithUUIDs:(id)a3 partialUpdateMask:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke;
  v11[3] = &unk_1E5874868;
  id v12 = v7;
  id v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v11];
}

void __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_DWORD *)long long buf = 134218242;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Force indexing assets with uuids (%tu) for %@", buf, 0x16u);
  }

  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) libraryWithName:"-[PLSearchIndexingEngine indexAssetsWithUUIDs:partialUpdateMask:completion:]_block_invoke"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke_2;
  v8[3] = &unk_1E58710F0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v6;
  id v7 = v5;
  [v7 performBlockAndWait:v8];
}

void __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v7 = 0;
  uint64_t v4 = +[PLSearchIndexManager fetchAssetsWithUUIDs:v2 managedObjectContext:v3 error:&v7];
  id v5 = v7;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "_inLibraryPerform_donateAssets:library:completion:", v4, *(void *)(a1 + 40), *(void *)(a1 + 56));
  }
  else
  {
    id v6 = [MEMORY[0x1E4F8B9B8] failureWithError:v5];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLSearchIndexingEngine_close__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__PLSearchIndexingEngine_close__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) reset];
}

- (void)openWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PLSearchIndexingEngine_openWithCompletion___block_invoke;
  v6[3] = &unk_1E58742F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PLSearchIndexingEngine *)self _safePerformBlock:v6];
}

uint64_t __45__PLSearchIndexingEngine_openWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Requesting open search index for %@", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) addUser];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (void *)MEMORY[0x1E4F8B9B8];
  id v6 = [MEMORY[0x1E4F1CA98] null];
  id v7 = [v5 successWithResult:v6];

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  return [*(id *)(*(void *)(a1 + 32) + 16) removeUser];
}

- (BOOL)supportsSpotlightClientState
{
  int64_t v2 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
  if (v2) {
    return v2 == 1;
  }
  return +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:0];
}

- (BOOL)supportsSpotlightDelete
{
  int64_t v2 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
  if (v2) {
    return v2 == 1;
  }
  return +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:0];
}

- (BOOL)supportsSpotlightDonate
{
  int64_t v2 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
  if (v2) {
    return v2 == 3 || v2 == 1;
  }
  return +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:0];
}

- (BOOL)supportsPSI
{
  int64_t v2 = [(PLSearchIndexingEngineLibraryServicesProvider *)self->_libraryServicesProvider libraryIdentifier];
  if (v2) {
    return v2 == 1;
  }
  +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:0];
  return 1;
}

- (PLSearchIndexingEngine)initWithLibraryServicesProvider:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PLSearchIndexingEngine;
  id v6 = [(PLSearchIndexingEngine *)&v37 init];
  if (v6)
  {
    id v7 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v39 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Initializing search indexing engine for %@", buf, 0xCu);
    }

    id v8 = [v5 pathManager];
    int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = [v8 searchIndexDirectory];
    id v36 = 0;
    char v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v12 = v36;

    if (v11)
    {
      id v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = objc_claimAutoreleasedReturnValue();
      __int16 v15 = (const char *)[v14 UTF8String];
      qos_class_t v16 = qos_class_self();
      uint64_t v17 = dispatch_queue_attr_make_with_qos_class(0, v16, 0);
      dispatch_queue_t v18 = dispatch_queue_create(v15, v17);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v18;

      objc_storeStrong((id *)&v6->_libraryServicesProvider, a3);
      id v20 = [[PLSearchIndexConfiguration alloc] initWithPathManager:v8];
      configuration = v6->_configuration;
      v6->_configuration = v20;

      objc_initWeak((id *)buf, v6);
      id v22 = [PLSearchIndexingAccessManager alloc];
      id v23 = v6->_queue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke;
      v34[3] = &unk_1E5875F08;
      objc_copyWeak(&v35, (id *)buf);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke_2;
      v32[3] = &unk_1E5875F08;
      objc_copyWeak(&v33, (id *)buf);
      uint64_t v24 = [(PLSearchIndexingAccessManager *)v22 initWithQueue:v23 openBlock:v34 closeBlock:v32 deferCloseSeconds:5];
      accessManager = v6->_accessManager;
      v6->_accessManager = (PLSearchIndexingAccessManager *)v24;

      v6->_queue_spotlightSandboxExtensionHandle = -1;
      id v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      queue_eventHistory = v6->_queue_eventHistory;
      v6->_queue_eventHistory = v26;

      v6->_dropLock._os_unfair_lock_opaque = 0;
      dispatch_group_t v28 = dispatch_group_create();
      dropLock_dropGroup = v6->_dropLock_dropGroup;
      v6->_dropLock_dropGroup = (OS_dispatch_group *)v28;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v30 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v39 = v12;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_FAULT, "Failed to create Photos search index directory. Error: %@", buf, 0xCu);
      }

      id v6 = 0;
    }
  }
  return v6;
}

void __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_open");
}

void __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_close");
}

- (PLSearchIndexingEngine)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  id v5 = [[PLSearchIndexingEngineLibraryServicesProvider alloc] initWithLSM:v4];

  id v6 = [(PLSearchIndexingEngine *)self initWithLibraryServicesProvider:v5];
  return v6;
}

@end