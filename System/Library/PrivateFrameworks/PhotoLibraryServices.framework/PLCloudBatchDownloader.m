@interface PLCloudBatchDownloader
+ (id)_adjustmentStateDictionaryForComparingIncomingFaceRecordForAsset:(id)a3;
- (BOOL)_shouldHandleNotificationChangeForMemory:(id)a3 memoryRecord:(id)a4 wasPersisted:(BOOL)a5;
- (BOOL)_shouldIgnoreIncomingManualOrderChange:(id)a3 localPerson:(id)a4;
- (BOOL)_shouldIgnoreIncomingPersonTypeChange:(id)a3 localPerson:(id)a4;
- (PLCloudBatchDownloader)initWithLibraryServicesManager:(id)a3 manager:(id)a4;
- (id)_debugPrintAlbumOrderForAssets:(id)a3;
- (id)_findMaster:(id)a3 fromAdditionalRecordInBatch:(id)a4 inLibrary:(id)a5;
- (id)_handleAssetRecords:(id)a3 inSyncContext:(id)a4 withChangeBatch:(id)a5 insertedAssetUUIDs:(id *)a6;
- (id)_handleMasterRecords:(id)a3 inLibrary:(id)a4;
- (id)_handleMemoryRecords:(id)a3 inLibrary:(id)a4;
- (id)_handlePersonRecords:(id)a3 inLibrary:(id)a4 includesTiboSchema:(BOOL *)a5;
- (id)_handleSuggestionRecords:(id)a3 inLibrary:(id)a4;
- (id)_mergeTargetFromPersons:(id)a3;
- (id)deletedRecordsFromBatch:(id)a3;
- (id)handleIncomingBatch:(id)a3;
- (void)_assetsAndCloudMastersFromAssetRecords:(id)a3 assetsByScopedIdentifier:(id *)a4 mastersByScopedIdentifier:(id *)a5 inLibrary:(id)a6;
- (void)_dropDeferredRebuildFacesInPhotoLibrary:(id)a3;
- (void)_handleAlbumRecords:(id)a3 inLibrary:(id)a4;
- (void)_handleDeleteRecords:(id)a3 inLibrary:(id)a4;
- (void)_handleExpungedRecords:(id)a3 inLibrary:(id)a4;
- (void)_handleFaceCropRecords:(id)a3 inLibrary:(id)a4;
- (void)_handleRelationsForAlbumRecords:(id)a3 orderKeyManager:(id)a4 inLibrary:(id)a5;
- (void)_handleRelationsForAssetRecords:(id)a3 orderKeyManager:(id)a4 inLibrary:(id)a5;
- (void)_handleScopeChanges:(id)a3 inLibrary:(id)a4;
- (void)_handleSocialGroupRecords:(id)a3 inLibrary:(id)a4;
- (void)_mergeExistingPersonsWithPerson:(id)a3 inPhotoLibrary:(id)a4;
- (void)_mergeUpdatedPersons:(id)a3 inLibrary:(id)a4;
- (void)_processNotificationUpdatesForMemories:(id)a3;
- (void)_saveIfNeeded:(id)a3;
- (void)_triggerBackgroundDownloadFailureForResources:(id)a3;
@end

@implementation PLCloudBatchDownloader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)_triggerBackgroundDownloadFailureForResources:(id)a3
{
  p_manager = &self->_manager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manager);
  +[PLInternalResource triggerBackgroundDownloadFailureForResources:v4 cloudPhotoLibraryManager:WeakRetained];
}

- (id)handleIncomingBatch:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PLCloudDownloadBatchDetails);
  v6 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  v7 = (void *)[v6 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudBatchDownloader handleIncomingBatch:]"];

  v8 = [v7 managedObjectContext];
  [v8 setLocalOnlyDelete:1];

  v9 = [[PLLibrarySyncContext alloc] initWithPhotoLibrary:v7];
  v10 = [(PLLibrarySyncContext *)v9 recordOrganizer];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__41855;
  v30[4] = __Block_byref_object_dispose__41856;
  id v31 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke;
  v22[3] = &unk_1E58741B0;
  id v11 = v4;
  id v23 = v11;
  id v24 = v10;
  v25 = self;
  id v26 = v7;
  v12 = v5;
  v27 = v12;
  v13 = v9;
  v28 = v13;
  v29 = v30;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke_2;
  v19[3] = &unk_1E5873A50;
  v19[4] = self;
  id v14 = v24;
  id v20 = v14;
  id v15 = v26;
  id v21 = v15;
  [v15 performTransactionAndWait:v22 completionHandler:v19];
  v16 = v21;
  v17 = v12;

  _Block_object_dispose(v30, 8);
  return v17;
}

void __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) records];
  [*(id *)(a1 + 40) organizeRecords:v2];
  v3 = *(void **)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) scopeRecords];
  [v3 _handleScopeChanges:v4 inLibrary:*(void *)(a1 + 56)];

  char v34 = 0;
  v5 = *(void **)(a1 + 48);
  v6 = [*(id *)(a1 + 40) personRecords];
  v7 = [v5 _handlePersonRecords:v6 inLibrary:*(void *)(a1 + 56) includesTiboSchema:&v34];

  if (v34) {
    [*(id *)(a1 + 48) _dropDeferredRebuildFacesInPhotoLibrary:*(void *)(a1 + 56)];
  }
  v8 = *(void **)(a1 + 48);
  v9 = [*(id *)(a1 + 40) albumRecords];
  [v8 _handleAlbumRecords:v9 inLibrary:*(void *)(a1 + 56)];

  v10 = *(void **)(a1 + 48);
  id v11 = [*(id *)(a1 + 40) masterRecords];
  v12 = [v10 _handleMasterRecords:v11 inLibrary:*(void *)(a1 + 56)];

  [*(id *)(a1 + 64) unionBatchDetails:v12];
  v13 = *(void **)(a1 + 48);
  id v14 = [*(id *)(a1 + 40) assetRecords];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v17 + 40);
  v18 = [v13 _handleAssetRecords:v14 inSyncContext:v16 withChangeBatch:v15 insertedAssetUUIDs:&obj];
  objc_storeStrong((id *)(v17 + 40), obj);

  [*(id *)(a1 + 64) unionBatchDetails:v18];
  v19 = *(void **)(a1 + 48);
  id v20 = [*(id *)(a1 + 40) memoryRecords];
  id v21 = [v19 _handleMemoryRecords:v20 inLibrary:*(void *)(a1 + 56)];

  [*(id *)(a1 + 64) unionBatchDetails:v21];
  v22 = *(void **)(a1 + 48);
  id v23 = [*(id *)(a1 + 40) faceCropRecords];
  [v22 _handleFaceCropRecords:v23 inLibrary:*(void *)(a1 + 56)];

  id v24 = *(void **)(a1 + 48);
  v25 = [*(id *)(a1 + 40) suggestionRecords];
  id v26 = [v24 _handleSuggestionRecords:v25 inLibrary:*(void *)(a1 + 56)];

  [*(id *)(a1 + 64) unionBatchDetails:v26];
  [*(id *)(a1 + 48) _mergeUpdatedPersons:v7 inLibrary:*(void *)(a1 + 56)];
  v27 = *(void **)(a1 + 48);
  v28 = [*(id *)(a1 + 40) socialGroupRecords];
  [v27 _handleSocialGroupRecords:v28 inLibrary:*(void *)(a1 + 56)];

  v29 = *(void **)(a1 + 48);
  v30 = [*(id *)(a1 + 40) deleteRecords];
  [v29 _handleDeleteRecords:v30 inLibrary:*(void *)(a1 + 56)];

  id v31 = *(void **)(a1 + 48);
  v32 = [*(id *)(a1 + 40) expungedRecords];
  [v31 _handleExpungedRecords:v32 inLibrary:*(void *)(a1 + 56)];
}

void __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [PLRelationshipOrderKeyManager alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke_3;
  v19[3] = &unk_1E5872390;
  v19[4] = *(void *)(a1 + 32);
  v3 = [(PLRelationshipOrderKeyManager *)v2 initWithGenerateContextBlock:v19];
  id v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) assetRecordsWithContainerChange];
  [v4 _handleRelationsForAssetRecords:v5 orderKeyManager:v3 inLibrary:*(void *)(a1 + 48)];

  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) albumRecordsWithContainerChange];
  [v6 _handleRelationsForAlbumRecords:v7 orderKeyManager:v3 inLibrary:*(void *)(a1 + 48)];

  v8 = [*(id *)(a1 + 48) managedObjectContext];
  id v18 = 0;
  int v9 = [v8 save:&v18];
  id v10 = v18;

  if (v9)
  {
    id v11 = [*(id *)(a1 + 48) managedObjectContext];
    id v17 = v10;
    BOOL v12 = [(PLRelationshipOrderKeyManager *)v3 writeStashedLocationValuesInContext:v11 error:&v17];
    id v13 = v17;

    if (v12 || *MEMORY[0x1E4F59AC0]) {
      goto LABEL_11;
    }
    id v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to save order keys: %@", buf, 0xCu);
    }
LABEL_10:

LABEL_11:
    id v10 = v13;
    goto LABEL_12;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to save relation records: %@", buf, 0xCu);
    }
    id v13 = v10;
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v15 = [*(id *)(a1 + 48) managedObjectContext];
  +[PLManagedAsset clearImportSessionObjectIDCacheOnManagedObjectContext:v15];

  uint64_t v16 = [*(id *)(a1 + 48) libraryBundle];
  [v16 touch];
}

uint64_t __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 16) databaseContext];
  id v2 = (id)[v1 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudBatchDownloader handleIncomingBatch:]_block_invoke_3"];

  return [v2 managedObjectContext];
}

- (id)deletedRecordsFromBatch:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "changeType", (void)v13) & 0x400) != 0)
        {
          id v11 = [v10 scopedIdentifier];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_handleRelationsForAlbumRecords:(id)a3 orderKeyManager:(id)a4 inLibrary:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  id v8 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    id v23 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v15 = (void *)MEMORY[0x19F38D3B0]();
        long long v16 = [v14 scopedIdentifier];
        id v17 = [v16 identifier];

        if (([@"----Root-Folder----" isEqualToString:v17] & 1) == 0
          && ([@"----Project-Root-Folder----" isEqualToString:v17] & 1) == 0)
        {
          uint64_t v18 = +[PLGenericAlbum albumWithCloudGUID:v17 inLibrary:v8];
          id v19 = v8;
          id v20 = v18;
          if (v18)
          {
            [v18 updateAlbumFolderRelation:v14 orderKeyManager:v22 inLibrary:v19];
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            id v21 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v17;
              __int16 v30 = 2112;
              id v31 = v14;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Can't find album with id %@, ignoring record %@", buf, 0x16u);
            }
          }
          id v8 = v23;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v11);
  }
}

- (void)_handleRelationsForAssetRecords:(id)a3 orderKeyManager:(id)a4 inLibrary:(id)a5
{
  v138[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v92 = a5;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v130 = (uint64_t)v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Setting relations for asset records %@", buf, 0xCu);
    }
  }
  v85 = v8;
  v86 = [MEMORY[0x1E4F1CA60] dictionary];
  v97 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [v7 valueForKey:@"scopedIdentifier"];
  v138[0] = @"albums";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:1];
  v84 = (void *)v10;
  uint64_t v12 = +[PLManagedAsset assetsWithScopedIdentifiers:v10 prefetchResources:0 relationshipKeyPathsForPrefetching:v11 inLibrary:v92];

  v91 = [MEMORY[0x1E4F1CA80] set];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v123 objects:v137 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v124 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v123 + 1) + 8 * i) containerRelations];
        id v19 = (void *)MEMORY[0x1E4F1CAD0];
        id v20 = objc_msgSend(v18, "_pl_map:", &__block_literal_global_171);
        id v21 = [v19 setWithArray:v20];

        [v91 unionSet:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v123 objects:v137 count:16];
    }
    while (v15);
  }

  id v22 = [v91 allObjects];
  id v23 = +[PLGenericAlbum albumsWithCloudGUIDs:v22 inLibrary:v92];

  v83 = v23;
  v98 = objc_msgSend(v23, "_pl_indexBy:", &__block_literal_global_175);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v12;
  v87 = v13;
  uint64_t v93 = [obj countByEnumeratingWithState:&v119 objects:v136 count:16];
  if (v93)
  {
    uint64_t v90 = *(void *)v120;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v120 != v90) {
          objc_enumerationMutation(obj);
        }
        uint64_t v95 = v24;
        long long v25 = *(void **)(*((void *)&v119 + 1) + 8 * v24);
        context = (void *)MEMORY[0x19F38D3B0]();
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v26 = v13;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v115 objects:v135 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v116;
LABEL_19:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v116 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = *(void **)(*((void *)&v115 + 1) + 8 * v30);
            v32 = [v31 scopedIdentifier];
            uint64_t v33 = [v25 scopedIdentifier];
            char v34 = [v32 isEqual:v33];

            if (v34) {
              break;
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v115 objects:v135 count:16];
              if (!v28) {
                goto LABEL_25;
              }
              goto LABEL_19;
            }
          }
          v35 = v31;

          if (v35)
          {
            v36 = [MEMORY[0x1E4F1CA80] set];
            long long v111 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            v37 = [v25 albums];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v111 objects:v134 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v112;
              do
              {
                for (uint64_t j = 0; j != v39; ++j)
                {
                  if (*(void *)v112 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  v42 = [*(id *)(*((void *)&v111 + 1) + 8 * j) cloudGUID];
                  if (v42) {
                    [v36 addObject:v42];
                  }
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v111 objects:v134 count:16];
              }
              while (v39);
            }

            v89 = v35;
            v43 = [v35 containerRelations];
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            v96 = v43;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v107 objects:v133 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v46 = *(void *)v108;
              do
              {
                for (uint64_t k = 0; k != v45; ++k)
                {
                  if (*(void *)v108 != v46) {
                    objc_enumerationMutation(v96);
                  }
                  v48 = *(void **)(*((void *)&v107 + 1) + 8 * k);
                  v49 = [v48 containerIdentifier];
                  if (v49)
                  {
                    uint64_t v50 = [v48 position];
                    v51 = [v98 objectForKeyedSubscript:v49];
                    if (v51)
                    {
                      if ([v48 isKeyAsset])
                      {
                        v52 = [v51 customKeyAsset];

                        if (v52 != v25)
                        {
                          if (!*MEMORY[0x1E4F59AC0])
                          {
                            v53 = __CPLAssetsdOSLogDomain();
                            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                            {
                              v54 = [v25 cloudAssetGUID];
                              *(_DWORD *)buf = 138412546;
                              uint64_t v130 = (uint64_t)v54;
                              __int16 v131 = 2112;
                              *(void *)v132 = v49;
                              _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "setting custom key asset %@ for album %@", buf, 0x16u);
                            }
                          }
                          [v51 setCustomKeyAsset:v25];
                        }
                      }
                      if (!*MEMORY[0x1E4F59AC0])
                      {
                        v55 = __CPLAssetsdOSLogDomain();
                        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                        {
                          v56 = [v25 cloudAssetGUID];
                          *(_DWORD *)buf = 138412802;
                          uint64_t v130 = (uint64_t)v56;
                          __int16 v131 = 1024;
                          *(_DWORD *)v132 = v50;
                          *(_WORD *)&v132[4] = 2112;
                          *(void *)&v132[6] = v49;
                          _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEBUG, "Received asset %@ with position: %d for album: %@", buf, 0x1Cu);
                        }
                      }
                      v57 = objc_alloc_init(PLTransientOrderKey);
                      [(PLTransientOrderKey *)v57 setOrderValue:v50];
                      v58 = [v25 objectID];
                      [(PLTransientOrderKey *)v57 setObjectID:v58];

                      v59 = [v51 objectID];
                      v60 = [v97 objectForKey:v59];
                      if (!v60)
                      {
                        v60 = [MEMORY[0x1E4F1CA48] array];
                        [v97 setObject:v60 forKey:v59];
                      }
                      [v60 addObject:v57];

                      goto LABEL_63;
                    }
                    if (!*MEMORY[0x1E4F59AC0])
                    {
                      __CPLAssetsdOSLogDomain();
                      v57 = (PLTransientOrderKey *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(&v57->super, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v130 = (uint64_t)v48;
                        _os_log_impl(&dword_19B3C7000, &v57->super, OS_LOG_TYPE_DEFAULT, "Unable to find an album for the container relation %@", buf, 0xCu);
                      }
LABEL_63:
                    }
                    [v36 removeObject:v49];
                    goto LABEL_65;
                  }
                  if (*MEMORY[0x1E4F59AC0]) {
                    goto LABEL_66;
                  }
                  v51 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v130 = (uint64_t)v48;
                    _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_ERROR, "Found container relation %@ without container identifier, skipping", buf, 0xCu);
                  }
LABEL_65:

LABEL_66:
                }
                uint64_t v45 = [v96 countByEnumeratingWithState:&v107 objects:v133 count:16];
              }
              while (v45);
            }
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            id v61 = v36;
            uint64_t v62 = [v61 countByEnumeratingWithState:&v103 objects:v128 count:16];
            if (v62)
            {
              uint64_t v63 = v62;
              uint64_t v64 = *(void *)v104;
              do
              {
                for (uint64_t m = 0; m != v63; ++m)
                {
                  if (*(void *)v104 != v64) {
                    objc_enumerationMutation(v61);
                  }
                  uint64_t v66 = *(void *)(*((void *)&v103 + 1) + 8 * m);
                  v67 = [v86 objectForKey:v66];
                  if (!v67)
                  {
                    v67 = [MEMORY[0x1E4F1CA48] array];
                    [v86 setObject:v67 forKey:v66];
                  }
                  [v67 addObject:v25];
                }
                uint64_t v63 = [v61 countByEnumeratingWithState:&v103 objects:v128 count:16];
              }
              while (v63);
            }

            id v13 = v87;
            v68 = v89;
            goto LABEL_81;
          }
        }
        else
        {
LABEL_25:
        }
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_82;
        }
        v68 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v69 = [v25 scopedIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v130 = (uint64_t)v69;
          _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEBUG, "Can't find CPLAssetChange matching asset scopedIdentifier %@, ignoring asset", buf, 0xCu);
        }
LABEL_81:

LABEL_82:
        uint64_t v24 = v95 + 1;
      }
      while (v95 + 1 != v93);
      uint64_t v93 = [obj countByEnumeratingWithState:&v119 objects:v136 count:16];
    }
    while (v93);
  }

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v70 = v86;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v99 objects:v127 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v100;
    do
    {
      for (uint64_t n = 0; n != v72; ++n)
      {
        if (*(void *)v100 != v73) {
          objc_enumerationMutation(v70);
        }
        uint64_t v75 = *(void *)(*((void *)&v99 + 1) + 8 * n);
        v76 = +[PLGenericAlbum albumWithCloudGUID:v75 inLibrary:v92];
        v77 = v76;
        if (v76 && ([v76 isCameraAlbum] & 1) == 0)
        {
          v78 = [v70 objectForKey:v75];
          if (v78)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v79 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v80 = [v78 count];
                *(_DWORD *)buf = 134218242;
                uint64_t v130 = v80;
                __int16 v131 = 2112;
                *(void *)v132 = v75;
                _os_log_impl(&dword_19B3C7000, v79, OS_LOG_TYPE_DEFAULT, "Removing %lu assets from album %@", buf, 0x16u);
              }
            }
            v81 = [v77 mutableAssets];
            [v81 removeObjectsInArray:v78];
          }
        }
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v99 objects:v127 count:16];
    }
    while (v72);
  }

  if ([v97 count])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v82 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v130 = (uint64_t)v97;
        _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_DEBUG, "Update album assets order with %@", buf, 0xCu);
      }
    }
    [v85 updateAlbumAssetsUsingTransientOrdersByAlbumOID:v97 inLibrary:v92];
  }
}

uint64_t __84__PLCloudBatchDownloader__handleRelationsForAssetRecords_orderKeyManager_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cloudGUID];
}

uint64_t __84__PLCloudBatchDownloader__handleRelationsForAssetRecords_orderKeyManager_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containerIdentifier];
}

- (id)_debugPrintAlbumOrderForAssets:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v11 = [v10 albums];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v35 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              if (([v16 isCameraAlbum] & 1) == 0 && !objc_msgSend(v16, "trashedState")) {
                [v4 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v7);
  }
  uint64_t v28 = v5;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    id v20 = &stru_1EEB2EB80;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v30 + 1) + 8 * k);
        id v23 = [v22 title];
        uint64_t v24 = [v22 cloudGUID];
        long long v25 = [(__CFString *)v20 stringByAppendingFormat:@"Album Title: %@ cloudGUID: %@\n", v23, v24, v28];

        id v26 = [v22 descriptionOfAssetOrderValues];
        id v20 = [v25 stringByAppendingFormat:@"%@\n", v26];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v18);
  }
  else
  {
    id v20 = &stru_1EEB2EB80;
  }

  return v20;
}

- (void)_handleExpungedRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0x1E4F59000uLL;
    uint64_t v11 = off_1E585E000;
    uint64_t v23 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v15 = [v13 scopedIdentifier];
        uint64_t v16 = [v15 identifier];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = [(__objc2_class *)v11[401] assetWithScopedIdentifier:v15 inLibrary:v6 prefetchResources:0];
          uint64_t v18 = v17;
          if (v17 && [v17 trashedState] != 2) {
            [v18 expunge];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = +[PLGenericAlbum albumWithCloudGUID:v16 inLibrary:v6];
            uint64_t v18 = v19;
            if (v19 && [v19 trashedState] != 2) {
              [v18 applyTrashedState:2 cascade:0];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_19;
            }
            unint64_t v20 = v10;
            id v21 = v7;
            id v22 = [v6 managedObjectContext];
            uint64_t v18 = +[PLPerson personWithUUID:v16 inManagedObjectContext:v22];

            if (v18) {
              [v18 deletePersonWithReason:4];
            }
            id v7 = v21;
            unint64_t v10 = v20;
            uint64_t v11 = off_1E585E000;
          }
        }

LABEL_19:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)_handleDeleteRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count]) {
    goto LABEL_148;
  }
  SEL v69 = a2;
  uint64_t v72 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [NSString stringWithFormat:@"[CPL]Syncing batch downloaded from cloud: deleting local asset to match iCloud Library"];
  uint64_t v73 = +[PLAssetTransactionReason transactionReason:v8];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v71 = v6;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (!v10) {
    goto LABEL_134;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v84;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v84 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(NSObject **)(*((void *)&v83 + 1) + 8 * v13);
      uint64_t v15 = [v14 scopedIdentifier];
      uint64_t v16 = [v15 identifier];
      if (!v15)
      {
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_41;
        }
        uint64_t v23 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v90 = v14;
          long long v24 = v23;
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          long long v26 = "Skipping deleting a CPLRecordChange %@ without identifier";
          goto LABEL_23;
        }
LABEL_24:

        goto LABEL_41;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v17 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v90 = v15;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Trying to delete %@", buf, 0xCu);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = +[PLGenericAlbum albumWithCloudGUID:v16 inLibrary:v7];
        if (([v16 isEqualToString:@"----Project-Root-Folder----"] & 1) != 0
          || [v16 isEqualToString:@"----Root-Folder----"])
        {
          if (*MEMORY[0x1E4F59AC0]) {
            goto LABEL_40;
          }
          uint64_t v19 = __CPLAssetsdOSLogDomain();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v90 = v16;
          unint64_t v20 = v19;
          os_log_type_t v21 = OS_LOG_TYPE_ERROR;
          id v22 = "Root folder deletion record should not exist, cloudGUID = %{public}@";
          goto LABEL_18;
        }
        if (v18)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v30 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v18;
              _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Found album %@ to delete", buf, 0xCu);
            }
          }
          [v18 delete];
          goto LABEL_40;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v19 = __CPLAssetsdOSLogDomain();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v90 = v16;
          unint64_t v20 = v19;
          os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
          id v22 = "Could not find album with UUID %{public}@ to delete. Skipping";
          goto LABEL_18;
        }
LABEL_40:

        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = +[PLManagedAsset assetWithScopedIdentifier:v15 inLibrary:v7 prefetchResources:1];
        uint64_t v18 = v27;
        if (v27)
        {
          uint64_t v28 = [v27 allAssetCPLResources];
          [(PLCloudBatchDownloader *)self _triggerBackgroundDownloadFailureForResources:v28];

          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v29 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v18;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Found asset %@ to delete", buf, 0xCu);
            }
          }
          [v18 deleteWithReason:v73];
          goto LABEL_40;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v19 = __CPLAssetsdOSLogDomain();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v90 = v16;
          unint64_t v20 = v19;
          os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
          id v22 = "Could not find asset with UUID %@ to delete. Skipping";
          goto LABEL_18;
        }
        goto LABEL_40;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v72 addObject:v15];
        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = [v7 managedObjectContext];
        long long v32 = +[PLPerson personWithUUID:v16 inManagedObjectContext:v31];

        if (v32)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v33 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v32;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Found person %@ to delete", buf, 0xCu);
            }
          }
          [(PLCloudBatchDownloader *)self _saveIfNeeded:v7];
          long long v34 = [v7 libraryServicesManager];
          long long v35 = [v34 databaseContext];

          if (!v35)
          {
            v59 = [MEMORY[0x1E4F28B00] currentHandler];
            [v59 handleFailureInMethod:v69, self, @"PLCloudBatchDownloader.m", 1237, @"Invalid parameter not satisfying: %@", @"databaseContext" object file lineNumber description];
          }
          long long v36 = (void *)-[NSObject newShortLivedLibraryWithName:](v35, "newShortLivedLibraryWithName:", "-[PLCloudBatchDownloader _handleDeleteRecords:inLibrary:]");
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __57__PLCloudBatchDownloader__handleDeleteRecords_inLibrary___block_invoke;
          v80[3] = &unk_1E5875E18;
          id v81 = v36;
          v82 = v32;
          long long v37 = v36;
          [v37 performTransactionAndWait:v80];

          goto LABEL_96;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v35 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v90 = v16;
            _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Could not find person with UUID %@ to delete. Skipping", buf, 0xCu);
          }
          goto LABEL_97;
        }
        goto LABEL_98;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = +[PLMemory memoryWithUUID:v16 inPhotoLibrary:v7];
        if (v18)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v38 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_59;
            }
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_40;
        }
        uint64_t v19 = __CPLAssetsdOSLogDomain();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v16;
        unint64_t v20 = v19;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        id v22 = "Could not find Memory with UUID %@ to delete. Skipping";
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = [v7 managedObjectContext];
        long long v32 = +[PLUserFeedback userFeedbackWithUUID:v16 inManagedObjectContext:v41];

        long long v35 = +[PLSuggestion suggestionWithUUID:v16 inPhotoLibrary:v7];
        if (v35)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v42 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v35;
              _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
            }
          }
          v43 = [v7 managedObjectContext];
          long long v37 = v43;
          uint64_t v44 = v35;
          goto LABEL_95;
        }
        if (v32)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v48 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v32;
              _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
            }
          }
          v43 = [v7 managedObjectContext];
          long long v37 = v43;
          uint64_t v44 = v32;
LABEL_95:
          [v43 deleteObject:v44];
LABEL_96:
        }
        else if (!*MEMORY[0x1E4F59AC0])
        {
          long long v37 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v90 = v16;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Could not find Suggetion or UserFeedback with UUID %@ to delete. Skipping", buf, 0xCu);
          }
          goto LABEL_96;
        }
LABEL_97:

LABEL_98:
        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = [v7 managedObjectContext];
        uint64_t v18 = +[PLGraphNode graphNodeWithUUID:v16 inManagedObjectContext:v45];

        if (v18)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v38 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v18;
              long long v39 = v38;
              long long v40 = "Deleting social group node: %@";
LABEL_60:
              _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
            }
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_40;
        }
        uint64_t v19 = __CPLAssetsdOSLogDomain();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v16;
        unint64_t v20 = v19;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        id v22 = "Could not find SocialGroup with UUID %@ to delete. Skipping";
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v88 = v16;
        uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
        v47 = +[PLFaceCrop faceCropsWithUUIDs:v46 inPhotoLibrary:v7];
        uint64_t v18 = [v47 firstObject];

        if (v18)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v38 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
LABEL_59:
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v18;
              long long v39 = v38;
              long long v40 = "Deleting %@";
              goto LABEL_60;
            }
LABEL_61:
          }
LABEL_62:
          uint64_t v19 = [v7 managedObjectContext];
          [v19 deleteObject:v18];
LABEL_19:

          goto LABEL_40;
        }
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_40;
        }
        uint64_t v19 = __CPLAssetsdOSLogDomain();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v90 = v16;
        unint64_t v20 = v19;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        id v22 = "Could not find FaceCrop with UUID %@ to delete. Skipping";
LABEL_18:
        _os_log_impl(&dword_19B3C7000, v20, v21, v22, buf, 0xCu);
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v49 = [v14 scopeIdentifier];
        uint64_t v50 = [v7 managedObjectContext];
        id v70 = (void *)v49;
        v51 = +[PLShare shareWithScopeIdentifier:v49 includeTrashed:1 inManagedObjectContext:v50];

        if (v51)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v52 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = [v51 compactDescription];
                *(_DWORD *)buf = 138412290;
                uint64_t v90 = v53;
                _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "Trashing %@", buf, 0xCu);
              }
            }
            [v51 trash];
            goto LABEL_132;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            v55 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v56 = [v51 compactDescription];
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v56;
              _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
            }
          }
          id v79 = 0;
          char v57 = [v51 incrementallyDeleteAndSaveWithError:&v79];
          v54 = v79;
          if ((v57 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
          {
            v58 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v54;
              _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Failed to prepare assets for scope deletion: %@", buf, 0xCu);
            }
          }
LABEL_131:
        }
        else if (!*MEMORY[0x1E4F59AC0])
        {
          v54 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v90 = v15;
            _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Cound not find share with scopeIdentifier %@", buf, 0xCu);
          }
          goto LABEL_131;
        }
LABEL_132:

        goto LABEL_41;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v23 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v90 = v14;
          long long v24 = v23;
          os_log_type_t v25 = OS_LOG_TYPE_ERROR;
          long long v26 = "Ignoring unsupported record type for deletion: %@";
LABEL_23:
          _os_log_impl(&dword_19B3C7000, v24, v25, v26, buf, 0xCu);
        }
        goto LABEL_24;
      }
LABEL_41:

      ++v13;
    }
    while (v11 != v13);
    uint64_t v60 = [v9 countByEnumeratingWithState:&v83 objects:v91 count:16];
    uint64_t v11 = v60;
  }
  while (v60);
LABEL_134:

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v61 = v72;
  uint64_t v62 = [v61 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v76 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = *(NSObject **)(*((void *)&v75 + 1) + 8 * i);
        v67 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v66 prefetchResources:0 inLibrary:v7];
        if (v67)
        {
          +[PLCloudMaster deleteMasterIfNecessary:v67 inLibrary:v7];
        }
        else if (!*MEMORY[0x1E4F59AC0])
        {
          v68 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v90 = v66;
            _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEBUG, "Unable to find master %@ to delete", buf, 0xCu);
          }
        }
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v63);
  }

  id v6 = v71;
LABEL_148:
}

void __57__PLCloudBatchDownloader__handleDeleteRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) objectID];
  id v9 = 0;
  id v4 = [v2 existingObjectWithID:v3 error:&v9];
  id v5 = v9;

  if (v4)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v6 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v4;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Deleting %@ in transient moc", buf, 0xCu);
      }
    }
    [v4 deletePersonWithReason:4];
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    id v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch transient person %@ to delete in transient moc: %@", buf, 0x16u);
    }
  }
}

- (void)_handleFaceCropRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v15 = [v13 resourceData];

        if (v15)
        {
          uint64_t v16 = +[PLFaceCrop insertOrUpdateWithCPLFaceCrop:v13 inPhotoLibrary:v6];
        }
        else
        {
          if (*v11)
          {
            uint64_t v16 = 0;
            goto LABEL_16;
          }
          uint64_t v17 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            os_log_type_t v25 = v13;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Skipping faceCrop without resource data %@", buf, 0xCu);
          }

          uint64_t v16 = 0;
        }
        if (!*v11)
        {
          uint64_t v18 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            os_log_type_t v25 = v16;
            __int16 v26 = 2112;
            long long v27 = v13;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "insert/update local faceCrop %@ with cloud faceCrop %@", buf, 0x16u);
          }
        }
LABEL_16:

        ++v12;
      }
      while (v9 != v12);
      uint64_t v19 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      uint64_t v9 = v19;
    }
    while (v19);
  }
}

- (void)_mergeUpdatedPersons:(id)a3 inLibrary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x19F38D3B0](v9);
        -[PLCloudBatchDownloader _mergeExistingPersonsWithPerson:inPhotoLibrary:](self, "_mergeExistingPersonsWithPerson:inPhotoLibrary:", v13, v7, (void)v15);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }
}

- (void)_processNotificationUpdatesForMemories:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 photoLibrary];
        uint64_t v10 = [v8 uuid];
        if ([v8 notificationState] == 1)
        {
          uint64_t v11 = +[PLNotificationManager _notificationDeliveryDate];
          uint64_t v12 = +[PLNotificationManager sharedManager];
          [v12 postNotificationForInterestingMemoryWithMemoryUUID:v10 library:v9 notificationDeliveryDate:v11];
        }
        else
        {
          if ([v8 notificationState] != 2) {
            goto LABEL_11;
          }
          uint64_t v11 = +[PLNotificationManager sharedManager];
          [v11 removeNotificationForInterestingMemoryWithUUID:v10];
        }

LABEL_11:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_handleSocialGroupRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v25 = *(void *)v27;
    *(void *)&long long v8 = 138412290;
    long long v23 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x19F38D3B0]();
        long long v13 = [v11 scopedIdentifier];
        long long v14 = [v13 identifier];
        long long v15 = [v6 managedObjectContext];
        long long v16 = +[PLGraphNode graphNodeWithUUID:v14 inManagedObjectContext:v15];

        if (v16)
        {
          id v17 = +[PLGraphNodeContainer newNodeContainerWithNode:v16];
        }
        else
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v18 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              id v31 = v11;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Inserting new local socialGroup since we did not find one with the same identifier %@", buf, 0xCu);
            }
          }
          uint64_t v19 = objc_msgSend(v6, "managedObjectContext", v23);
          id v17 = +[PLSocialGroup newNodeContainerWithManagedObjectContext:v19];

          uint64_t v20 = [v11 scopedIdentifier];
          long long v21 = [v20 identifier];
          [v17 setUuid:v21];
        }
        objc_msgSend(v17, "updateSocialGroupwithCPLSocialGroupChange:inPhotoLibrary:", v11, v6, v23);
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v22 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v17;
            __int16 v32 = 2112;
            long long v33 = v11;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Insert/update local socialGroup %@ with cloud socialGroup %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }
}

- (id)_handleSuggestionRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v60 = objc_opt_new();
  v59 = objc_opt_new();
  uint64_t v62 = objc_alloc_init(PLCloudDownloadBatchDetails);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v8 = v6;
  uint64_t v67 = [v8 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (!v67)
  {
    v51 = 0;
    v52 = v8;
    goto LABEL_62;
  }
  uint64_t v63 = 0;
  uint64_t v9 = off_1E585F000;
  locatiouint64_t n = (id *)&self->_manager;
  uint64_t v66 = *(void *)v69;
  id v61 = v7;
  id v64 = v8;
  do
  {
    for (uint64_t i = 0; i != v67; ++i)
    {
      if (*(void *)v69 != v66) {
        objc_enumerationMutation(v8);
      }
      uint64_t v11 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      uint64_t v12 = (void *)MEMORY[0x19F38D3B0]();
      if (![(__objc2_class *)v9[387] shouldHandleCPLSuggestionChange:v11])
      {
        long long v30 = [v11 scopedIdentifier];
        long long v26 = [v30 identifier];

        long long v27 = +[PLSuggestion suggestionWithUUID:v26 inPhotoLibrary:v7];
        if (!v27)
        {
          long long v27 = +[PLSuggestion insertIntoPhotoLibrary:v7 withUUID:v26];
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v31 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v73 = (unint64_t)v27;
              __int16 v74 = 2112;
              long long v75 = v11;
              _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Created new local suggestion %@ with cloud suggestion %@", buf, 0x16u);
            }
          }
        }
        char v32 = [v27 updateWithCPLSuggestionChange:v11 inPhotoLibrary:v7];
        id WeakRetained = objc_loadWeakRetained(location);
        unint64_t v34 = [WeakRetained deviceLibraryConfiguration] - 3;

        if (v34 >= 0xFFFFFFFFFFFFFFFELL && (v32 & 1) == 0)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v35 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              long long v36 = [v27 uuid];
              id v37 = objc_loadWeakRetained(location);
              unint64_t v38 = [v37 deviceLibraryConfiguration];
              long long v39 = @"unknown";
              if (v38 <= 2) {
                long long v39 = off_1E586C1D0[v38];
              }
              long long v40 = v39;
              *(_DWORD *)buf = 138412802;
              unint64_t v73 = (unint64_t)v36;
              __int16 v74 = 2112;
              long long v75 = v11;
              __int16 v76 = 2112;
              long long v77 = v40;
              _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Deleting local suggestion %@ for cloud suggestion %@ in limited device-library configuration: %@", buf, 0x20u);

              id v7 = v61;
            }
          }
          long long v41 = [v7 managedObjectContext];
          [v41 deleteObject:v27];
          goto LABEL_50;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          v42 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v73 = (unint64_t)v27;
            __int16 v74 = 2112;
            long long v75 = v11;
            _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "Updating local suggestion %@ with cloud suggestion %@", buf, 0x16u);
          }
        }
        v43 = [v27 creationDate];
        long long v41 = v43;
        if (!v63 || [v43 compare:v63] == 1)
        {
          id v44 = v41;

          uint64_t v63 = v44;
        }
        [(PLCloudDownloadBatchDetails *)v62 setNeedsWidgetTimelineReload:1];
        uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v11, "type"));
        if ([v11 type] == 6 && objc_msgSend(v11, "state") == 4)
        {
          id v46 = [v59 objectForKeyedSubscript:v45];
          if (!v46)
          {
            id v46 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            [v59 setObject:v46 forKeyedSubscript:v45];
          }
          v47 = [v27 keyAssets];
          v48 = [v47 anyObject];
          uint64_t v49 = [v48 objectID];

          if (v49)
          {
            [v46 addObject:v49];
            goto LABEL_47;
          }
          id v7 = v61;
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v50 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v73 = (unint64_t)v26;
              _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "Unexpectedly found no key asset for suggestion %@", buf, 0xCu);
            }

LABEL_47:
            id v7 = v61;
          }
        }
        else
        {
          [v60 addObject:v45];
        }

LABEL_50:
        id v8 = v64;
LABEL_51:

        goto LABEL_52;
      }
      long long v13 = v9[387];
      long long v14 = [v11 scopedIdentifier];
      long long v15 = [v14 identifier];
      long long v16 = [v7 managedObjectContext];
      id v17 = [(__objc2_class *)v13 userFeedbackWithUUID:v15 inManagedObjectContext:v16];

      if (!v17)
      {
        uint64_t v18 = v9[387];
        uint64_t v19 = [v7 managedObjectContext];
        uint64_t v20 = [v11 scopedIdentifier];
        long long v21 = [v20 identifier];
        id v17 = [(__objc2_class *)v18 insertIntoManagedObjectContext:v19 withUUID:v21];

        [v17 setCreationType:2];
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v22 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            long long v23 = [v17 detailedDescription];
            *(_DWORD *)buf = 138412290;
            unint64_t v73 = (unint64_t)v23;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Created new local user feedback %@", buf, 0xCu);
          }
        }
      }
      long long v24 = v9[387];
      uint64_t v25 = [v7 managedObjectContext];
      long long v26 = [(__objc2_class *)v24 updateUserFeedback:v17 withCPLSuggestionChange:v11 inManagedObjectContext:v25];

      if (!*MEMORY[0x1E4F59AC0])
      {
        long long v27 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          long long v28 = [v26 detailedDescription];
          long long v29 = [v11 cplFullDescription];
          *(_DWORD *)buf = 138412546;
          unint64_t v73 = (unint64_t)v28;
          __int16 v74 = 2112;
          long long v75 = v29;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Updated new local user feedback %@ with cloud suggestion %@", buf, 0x16u);
        }
        goto LABEL_51;
      }
LABEL_52:

      uint64_t v9 = off_1E585F000;
    }
    uint64_t v67 = [v8 countByEnumeratingWithState:&v68 objects:v78 count:16];
  }
  while (v67);

  v51 = v63;
  if (v63)
  {
    v52 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v53 = [v52 startOfDayForDate:v63];
    v54 = [v52 dateByAddingUnit:16 value:1 toDate:v53 options:0];
    if (v54)
    {
      v55 = [v7 managedObjectContext];
      unint64_t v56 = +[PLSuggestion deletePendingSuggestionsCreatedBefore:v54 withTypes:v60 andRejectedAssetsBySuggestionType:v59 inManagedObjectContext:v55];

      if (!*MEMORY[0x1E4F59AC0])
      {
        char v57 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v73 = v56;
          _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_DEFAULT, "Deleted %lu pending suggestions", buf, 0xCu);
        }
      }
    }

LABEL_62:
  }

  return v62;
}

- (BOOL)_shouldHandleNotificationChangeForMemory:(id)a3 memoryRecord:(id)a4 wasPersisted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 notificationState];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v7 creationDate];
    if (!v11)
    {
      if (*MEMORY[0x1E4F59AC0])
      {
        LOBYTE(v20) = 0;
        goto LABEL_33;
      }
      long long v21 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        long long v22 = [v7 uuid];
        *(_DWORD *)buf = 138412290;
        *(void *)char v32 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Error: No creation data for memory with UUID: %@", buf, 0xCu);
      }
      LOBYTE(v20) = 0;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v13 = [v12 isDateInToday:v11];

    int v14 = 0;
    long long v15 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (v10 != 1 || !v13)
    {
LABEL_23:
      if (v10 == (int)[v7 notificationState] && v5)
      {
        BOOL v20 = 0;
      }
      else if (v10 == 2)
      {
        BOOL v20 = 1;
      }
      else
      {
        BOOL v20 = v14;
      }
      if (*v15) {
        goto LABEL_33;
      }
      long long v21 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [v8 scopedIdentifier];
        [v8 score];
        uint64_t v27 = v26;
        long long v28 = [v8 creationDate];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)char v32 = v20;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v25;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        __int16 v35 = 1024;
        BOOL v36 = v5;
        __int16 v37 = 1024;
        int v38 = v13;
        __int16 v39 = 2112;
        long long v40 = v28;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Handling change %d, for memory %@, state %.2f, was persisted %d, created today %d, creationDate %@", buf, 0x32u);
      }
      goto LABEL_32;
    }
    long long v16 = [v7 photoLibrary];
    id v30 = 0;
    unint64_t v17 = +[PLMemory countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeenInPhotoLibrary:v16 excludingMemory:v7 error:&v30];
    id v18 = v30;

    if (v17)
    {
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!*v15)
        {
          long long v23 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            long long v24 = [v7 uuid];
            *(_DWORD *)buf = 138412290;
            *(void *)char v32 = v24;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Clearing notification state of memory %@, already have notification today", buf, 0xCu);
          }
        }
        [v7 setNotificationState:0];
        int v14 = 0;
        goto LABEL_22;
      }
      if (!*v15)
      {
        uint64_t v19 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v32 = v18;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error fetching countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeen, error: %@", buf, 0xCu);
        }
      }
    }
    int v14 = 1;
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v20) = 0;
LABEL_34:

  return v20;
}

- (id)_handleMemoryRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v45 = objc_opt_new();
  id v44 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v50 = objc_alloc_init(PLCloudDownloadBatchDetails);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v8 = v6;
  uint64_t v54 = [v8 countByEnumeratingWithState:&v55 objects:v65 count:16];
  v47 = self;
  if (!v54)
  {
    id v46 = 0;
    goto LABEL_52;
  }
  id v46 = 0;
  locatiouint64_t n = (id *)&self->_manager;
  uint64_t v53 = *(void *)v56;
  id v48 = v8;
  id v49 = v7;
  do
  {
    for (uint64_t i = 0; i != v54; ++i)
    {
      if (*(void *)v56 != v53) {
        objc_enumerationMutation(v8);
      }
      uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      uint64_t v11 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v12 = [v10 scopedIdentifier];
      int v13 = [v12 identifier];

      uint64_t v14 = +[PLMemory memoryWithUUID:v13 inPhotoLibrary:v7];
      long long v15 = [v10 creationDate];

      if (!v15)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          __int16 v33 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = v10;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_FAULT, "Skipping CPLMemory record with nil creationDate: %@", buf, 0xCu);
          }
        }
        uint64_t v34 = NSString;
        __int16 v35 = [v10 scopedIdentifier];
        id v32 = [v34 stringWithFormat:@"Attempted to pull a CPLMemory %@ with nil creationDate. \n\nSee rdar://problem/81107309", v35];

        BOOL v36 = @"TTR: CPLMemory with nil creationDate";
        goto LABEL_33;
      }
      long long v16 = [v10 title];

      if (!v16)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          __int16 v37 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = v10;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_FAULT, "Skipping CPLMemory record with nil title: %@", buf, 0xCu);
          }
        }
        int v38 = NSString;
        __int16 v39 = [v10 scopedIdentifier];
        id v32 = [v38 stringWithFormat:@"Attempted to pull a CPLMemory %@ with nil title. \n\nSee rdar://problem/81107309", v39];

        BOOL v36 = @"TTR: CPLMemory with nil title";
LABEL_33:
        +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Cloud Photo Library state detected" message:@"Please file a Radar against Photos" radarTitle:v36 radarDescription:v32];
        unint64_t v17 = (void *)v14;
        goto LABEL_48;
      }
      v52 = v11;
      unint64_t v17 = (void *)v14;
      if (!v14)
      {
        id v18 = [v7 managedObjectContext];
        uint64_t v19 = [v10 title];
        BOOL v20 = [v10 subtitle];
        long long v21 = [v10 creationDate];
        unint64_t v17 = +[PLMemory insertIntoContext:v18 withUUID:v13 title:v19 subtitle:v20 creationDate:v21];

        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v22 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v60 = v17;
            __int16 v61 = 2112;
            uint64_t v62 = v10;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Created new local memory %@ with cloud memory %@", buf, 0x16u);
          }
        }
        id v8 = v48;
        id v7 = v49;
      }
      char v23 = [v17 updateWithCPLMemoryChange:v10 inPhotoLibrary:v7];
      id WeakRetained = objc_loadWeakRetained(location);
      unint64_t v25 = [WeakRetained deviceLibraryConfiguration] - 3;

      if (v25 < 0xFFFFFFFFFFFFFFFELL || (v23 & 1) != 0)
      {
        uint64_t v11 = v52;
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v40 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v60 = v17;
            __int16 v61 = 2112;
            uint64_t v62 = v10;
            _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Updating local memory %@ with cloud memory %@", buf, 0x16u);
          }
        }
        if ((unsigned __int16)[v10 graphVersion] < 0x301u)
        {
          id v32 = [v17 creationDate];
        }
        else
        {
          if ([(PLCloudBatchDownloader *)v47 _shouldHandleNotificationChangeForMemory:v17 memoryRecord:v10 wasPersisted:v14 != 0])
          {
            [v45 addObject:v17];
          }
          id v32 = [v17 creationDate];
          if (([v17 isUserCreatedMemory] & 1) == 0)
          {
            if (!v46 || [v32 compare:v46] == 1)
            {
              id v32 = v32;

              id v46 = v32;
            }
            uint64_t v11 = v52;
          }
        }
        [(PLCloudDownloadBatchDetails *)v50 setNeedsWidgetTimelineReload:1];
      }
      else
      {
        uint64_t v11 = v52;
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v26 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = [v17 uuid];
            id v28 = objc_loadWeakRetained(location);
            unint64_t v29 = [v28 deviceLibraryConfiguration];
            id v30 = @"unknown";
            if (v29 <= 2) {
              id v30 = off_1E586C1D0[v29];
            }
            id v31 = v30;
            *(_DWORD *)buf = 138412802;
            uint64_t v60 = v27;
            __int16 v61 = 2112;
            uint64_t v62 = v10;
            __int16 v63 = 2112;
            id v64 = v31;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Deleting local memory %@ for cloud memory %@ in limited device-library configuration: %@", buf, 0x20u);

            uint64_t v11 = v52;
          }
        }
        id v32 = [v7 managedObjectContext];
        [v32 deleteObject:v17];
      }
LABEL_48:
    }
    uint64_t v54 = [v8 countByEnumeratingWithState:&v55 objects:v65 count:16];
  }
  while (v54);
LABEL_52:

  if ([v45 count]) {
    [(PLCloudBatchDownloader *)v47 _processNotificationUpdatesForMemories:v45];
  }
  if (v46)
  {
    uint64_t v41 = [v44 startOfDayForDate:v46];
    v42 = [v44 dateByAddingUnit:16 value:1 toDate:v41 options:0];
    if (v42) {
      +[PLMemory deletePendingMemoriesCreatedBefore:v42 inPhotoLibrary:v7];
    }
  }
  return v50;
}

- (id)_handleAssetRecords:(id)a3 inSyncContext:(id)a4 withChangeBatch:(id)a5 insertedAssetUUIDs:(id *)a6
{
  uint64_t v254 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v174 = a5;
  v171 = v9;
  v190 = [v9 photoLibrary];
  v168 = [v190 mainScopeIdentifier];
  v178 = [v190 managedObjectContext];
  v165 = objc_alloc_init(PLCloudDownloadBatchDetails);
  v166 = [MEMORY[0x1E4F1CA80] set];
  id v155 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v158 = [MEMORY[0x1E4F1CA48] array];
  id v160 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v159 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v162 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v161 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v169 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v178];
  id v235 = 0;
  id v234 = 0;
  [(PLCloudBatchDownloader *)self _assetsAndCloudMastersFromAssetRecords:v8 assetsByScopedIdentifier:&v235 mastersByScopedIdentifier:&v234 inLibrary:v190];
  id v175 = v235;
  id v173 = v234;
  BOOL v163 = +[PLManagedAsset isComputeSyncEnabledForDirection:1 library:v190];
  id v164 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  id obj = v8;
  uint64_t v176 = [obj countByEnumeratingWithState:&v230 objects:v253 count:16];
  if (!v176)
  {
    uint64_t v156 = 0;
    uint64_t v157 = 0;
    goto LABEL_168;
  }
  uint64_t v156 = 0;
  uint64_t v157 = 0;
  uint64_t v172 = *(void *)v231;
  locatiouint64_t n = (id *)&self->_manager;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v231 != v172)
      {
        uint64_t v12 = v11;
        objc_enumerationMutation(obj);
        uint64_t v11 = v12;
      }
      uint64_t v179 = v11;
      int v13 = *(void **)(*((void *)&v230 + 1) + 8 * v11);
      context = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v14 = v13;
      long long v15 = [(__CFString *)v14 scopedIdentifier];
      *(void *)v249 = 0;
      *(void *)&v249[8] = v249;
      *(void *)&v249[16] = 0x3032000000;
      v250 = __Block_byref_object_copy__41855;
      v251 = __Block_byref_object_dispose__41856;
      id v252 = [(__CFString *)v14 masterScopedIdentifier];
      long long v16 = [v175 objectForKey:v15];
      v223[0] = MEMORY[0x1E4F143A8];
      v223[1] = 3221225472;
      v223[2] = __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke;
      v223[3] = &unk_1E5869D18;
      id v17 = v173;
      id v224 = v17;
      v229 = v249;
      id v183 = v15;
      id v225 = v183;
      v226 = self;
      id v18 = v174;
      id v227 = v18;
      id v191 = v190;
      id v228 = v191;
      v185 = (void (**)(void))MEMORY[0x19F38D650](v223);
      if (v16)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v19 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v244 = v16;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Found asset %@", buf, 0xCu);
          }
        }
        if (![(__CFString *)v14 hasChangeType:64]
          || (id WeakRetained = objc_loadWeakRetained(location),
              uint64_t v21 = [WeakRetained deviceLibraryConfiguration],
              [v169 scopeIdentifier],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              LOBYTE(v21) = [(__CFString *)v14 qualifiesForDeviceLibraryConfiguration:v21 sharingScopeIdentifier:v22 mainScopeIdentifier:v168], v22, WeakRetained, (v21 & 1) != 0))
        {
          if ([(__CFString *)v14 isFullRecord])
          {
            char v23 = [(__CFString *)v16 master];
            if (v23
              || (+[PLCloudMaster cloudMasterWithScopedIdentifier:*(void *)(*(void *)&v249[8] + 40) prefetchResources:0 inLibrary:v191], (char v23 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              int v24 = 0;
            }
            else
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                id v48 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v244 = v14;
                  __int16 v245 = 2112;
                  v246 = v23;
                  _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "%@ is known to the library with no master. Trying to fix-up library with cloudMaster %@", buf, 0x16u);
                }
              }
              +[PLManagedAsset fixupCloudPhotoLibraryAsset:v16 withCloudMaster:v23 inLibrary:v191];
              int v24 = 1;
            }
          }
          else
          {
            int v24 = 0;
          }
          id v49 = [(__CFString *)v16 master];
          uint64_t v50 = v49;
          if (v49 && *(void *)(*(void *)&v249[8] + 40))
          {
            v51 = [(__CFString *)v16 master];
            v52 = [v51 scopedIdentifier];
            char v53 = [v52 isEqual:*(void *)(*(void *)&v249[8] + 40)];

            BOOL v54 = v24 != 0;
            if ((v53 & 1) == 0)
            {
              long long v55 = [(__CFString *)v16 master];
              if (!*MEMORY[0x1E4F59AC0])
              {
                long long v56 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  long long v57 = [v55 scopedIdentifier];
                  long long v58 = *(void **)(*(void *)&v249[8] + 40);
                  *(_DWORD *)buf = 138412802;
                  v244 = v14;
                  __int16 v245 = 2112;
                  v246 = v57;
                  __int16 v247 = 2112;
                  v248 = v58;
                  _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "Going to remap asset record %@ master from %@ to %@", buf, 0x20u);
                }
              }
              v59 = v185[2]();
              if (v59)
              {
                uint64_t v60 = [(__CFString *)v16 allMasterCPLResources];
                long long v221 = 0u;
                long long v222 = 0u;
                long long v219 = 0u;
                long long v220 = 0u;
                __int16 v61 = v60;
                uint64_t v62 = [v61 countByEnumeratingWithState:&v219 objects:v242 count:16];
                if (v62)
                {
                  uint64_t v63 = *(void *)v220;
                  do
                  {
                    for (uint64_t i = 0; i != v62; ++i)
                    {
                      if (*(void *)v220 != v63) {
                        objc_enumerationMutation(v61);
                      }
                      v65 = *(void **)(*((void *)&v219 + 1) + 8 * i);
                      [(__CFString *)v16 removeLocalFileForResource:v65 allowDCIMPath:1];
                      [v65 deleteResource];
                    }
                    uint64_t v62 = [v61 countByEnumeratingWithState:&v219 objects:v242 count:16];
                  }
                  while (v62);
                }

                +[PLManagedAsset fixupCloudPhotoLibraryAsset:v16 withCloudMaster:v59 inLibrary:v191];
                [(__CFString *)v16 invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:v191];
                if (!*MEMORY[0x1E4F59AC0])
                {
                  uint64_t v66 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v67 = [v55 scopedIdentifier];
                    long long v68 = [v59 scopedIdentifier];
                    *(_DWORD *)buf = 138412802;
                    v244 = v14;
                    __int16 v245 = 2112;
                    v246 = v67;
                    __int16 v247 = 2112;
                    v248 = v68;
                    _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_DEFAULT, "Existing asset record's %@ master has been remapped from %@ to %@", buf, 0x20u);
                  }
                }
                +[PLCloudMaster deleteMasterIfNecessary:v55 inLibrary:v191];
                int v24 = 1;
                goto LABEL_144;
              }
              if (!*MEMORY[0x1E4F59AC0])
              {
                __int16 v61 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v93 = *(__CFString **)(*(void *)&v249[8] + 40);
                  *(_DWORD *)buf = 138412546;
                  v244 = v93;
                  __int16 v245 = 2112;
                  v246 = v14;
                  _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "Unable to find new master %@ to remap asset %@", buf, 0x16u);
                }
LABEL_144:
              }
              BOOL v54 = v24 != 0;
            }
          }
          else
          {

            BOOL v54 = v24 != 0;
          }
LABEL_74:
          if ([(__CFString *)v14 hasChangeType:32])
          {
            id v187 = [(id)objc_opt_class() _adjustmentStateDictionaryForComparingIncomingFaceRecordForAsset:v16];
            long long v69 = [(__CFString *)v16 cloudIdentifier];
            [v171 setAssetAdjustmentState:v187 forCloudIdentifier:v69];
          }
          else
          {
            id v187 = 0;
          }
          if ([(__CFString *)v16 cloudLocalState] != 1) {
            [(__CFString *)v16 setCloudLocalState:1];
          }
          if ([(__CFString *)v16 isPartOfBurst])
          {
            long long v70 = [(__CFString *)v16 avalancheUUID];
            [v166 addObject:v70];
          }
          long long v71 = [(__CFString *)v14 burstIdentifier];
          BOOL v72 = v71 == 0;

          if (!v72)
          {
            unint64_t v73 = [(__CFString *)v14 burstIdentifier];
            [v166 addObject:v73];
          }
          if ((_os_feature_enabled_impl() & 1) == 0
            && [(__CFString *)v14 hasChangeType:64])
          {
            [(__CFString *)v16 applySharingPropertiesFromAssetChange:v14 inLibrary:v191];
          }
          if ([(__CFString *)v14 hasChangeType:2]) {
            [(__CFString *)v16 applyPropertiesFromAssetChange:v14 inLibrary:v191];
          }
          if ([(__CFString *)v14 hasChangeType:8])
          {
            [(PLCloudDownloadBatchDetails *)v165 setHasResourceChanges:1];
            if (([(__CFString *)v14 isFullRecord] & 1) == 0
              && ([(__CFString *)v16 isPlaceholderAsset] & 1) == 0)
            {
              __int16 v74 = [(__CFString *)v16 allAssetCPLResources];
              [(PLCloudBatchDownloader *)self _triggerBackgroundDownloadFailureForResources:v74];
            }
            long long v75 = [(__CFString *)v16 rm_applyResourcesFromAssetChange:v14 inLibrary:v191];
            if ([v75 count]) {
              [v10 unionSet:v75];
            }
          }
          if ([(__CFString *)v14 hasChangeType:2])
          {
            buf[0] = 0;
            [(__CFString *)v16 applyComputeSyncPropertiesFromAssetChange:v14 inLibrary:v191 didInstallComputeSyncResource:buf computeSyncDownloadEnabled:v163];
            if (buf[0]) {
              [(PLCloudDownloadBatchDetails *)v165 setHasResourceChanges:1];
            }
          }
          if ([(__CFString *)v14 isFullRecord])
          {
            long long v217 = 0u;
            long long v218 = 0u;
            long long v215 = 0u;
            long long v216 = 0u;
            __int16 v76 = [(__CFString *)v16 allMasterCPLResources];
            uint64_t v77 = [v76 countByEnumeratingWithState:&v215 objects:v241 count:16];
            if (v77)
            {
              uint64_t v78 = *(void *)v216;
              do
              {
                for (uint64_t j = 0; j != v77; ++j)
                {
                  if (*(void *)v216 != v78) {
                    objc_enumerationMutation(v76);
                  }
                  uint64_t v80 = *(void **)(*((void *)&v215 + 1) + 8 * j);
                  if ([v80 isLocallyAvailable]) {
                    [v10 addObject:v80];
                  }
                }
                uint64_t v77 = [v76 countByEnumeratingWithState:&v215 objects:v241 count:16];
              }
              while (v77);
            }
          }
          if ([(__CFString *)v14 hasChangeType:32]) {
            [(__CFString *)v16 applyFacesFromAssetChange:v14 inSyncContext:v171];
          }
          if (([(__CFString *)v14 hasChangeType:2] & 1) != 0
            || [(__CFString *)v14 hasChangeType:8])
          {
            [(__CFString *)v16 postProcessResourceDependentPropertyChangesFromAssetChange:v14 inLibrary:v191];
          }
          id v81 = [(__CFString *)v16 cloudIdentifier];
          [v171 setAssetAdjustmentState:0 forCloudIdentifier:v81];

          if (v54) {
            id v82 = +[PLResourceDataStoreManager updateDerivativeResourcesForAsset:v16 forLifecycleEvent:2];
          }
          long long v83 = [(__CFString *)v16 momentShare];
          if (v83) {
            BOOL v84 = v54;
          }
          else {
            BOOL v84 = 0;
          }

          if (v84)
          {
            long long v85 = [(__CFString *)v16 momentShare];
            [v164 addObject:v85];
          }
          if ([(__CFString *)v16 isPlaceholderAsset])
          {
            long long v86 = [(__CFString *)v16 momentShare];

            if (v86)
            {
              -[__CFString fixupPlaceholderAssetWithSavedAssetType:](v16, "fixupPlaceholderAssetWithSavedAssetType:", [MEMORY[0x1E4F8BA10] savedAssetTypeForMomentSharedAsset]);
              v87 = [(__CFString *)v16 momentShare];
              [v164 addObject:v87];
              goto LABEL_126;
            }
            -[__CFString fixupPlaceholderAssetWithSavedAssetType:](v16, "fixupPlaceholderAssetWithSavedAssetType:", [MEMORY[0x1E4F8BA10] savedAssetTypeForCloudPhotoLibraryAsset]);
            v87 = [(__CFString *)v16 additionalAttributes];
            uint64_t v90 = [v87 syndicationIdentifier];
            if (v90)
            {
              BOOL v91 = ([(__CFString *)v16 syndicationState] & 2) == 0;

              if (v91) {
                [(__CFString *)v16 syndicatedAssetDidSaveToUserLibrary];
              }
              goto LABEL_137;
            }
          }
          else
          {
            v88 = [(__CFString *)v16 additionalAttributes];
            v89 = [v88 sourceAssetForDuplicationCPLScopedIdentifier];

            if (!v89) {
              goto LABEL_137;
            }
            v87 = [(__CFString *)v16 additionalAttributes];
            [v87 setSourceAssetForDuplicationCPLScopedIdentifier:0];
          }
LABEL_126:

          goto LABEL_137;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          __int16 v37 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = objc_loadWeakRetained(location);
            unint64_t v39 = [v38 deviceLibraryConfiguration];
            long long v40 = @"unknown";
            if (v39 <= 2) {
              long long v40 = off_1E586C1D0[v39];
            }
            uint64_t v41 = v40;
            *(_DWORD *)buf = 138412546;
            v244 = v14;
            __int16 v245 = 2112;
            v246 = v41;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Deleting asset for record %@, asset does not qualify for device-library configuration: %@", buf, 0x16u);
          }
        }
        [v160 addObject:v16];
        v42 = +[PLMemory memoryObjectIDsContainingAsset:v16];
        [v162 unionSet:v42];

        id v188 = +[PLSuggestion suggestionObjectIDsContainingAsset:v16];
        [v161 unionSet:v188];

LABEL_138:
        id v28 = v14;
        goto LABEL_139;
      }
      id v25 = objc_loadWeakRetained(location);
      uint64_t v26 = [v25 deviceLibraryConfiguration];
      uint64_t v27 = [v169 scopeIdentifier];
      LOBYTE(v26) = [(__CFString *)v14 qualifiesForDeviceLibraryConfiguration:v26 sharingScopeIdentifier:v27 mainScopeIdentifier:v168];

      if ((v26 & 1) == 0)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          id v31 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = objc_loadWeakRetained(location);
            unint64_t v33 = [v32 deviceLibraryConfiguration];
            uint64_t v34 = @"unknown";
            if (v33 <= 2) {
              uint64_t v34 = off_1E586C1D0[v33];
            }
            __int16 v35 = v34;
            *(_DWORD *)buf = 138412546;
            v244 = v14;
            __int16 v245 = 2112;
            v246 = v35;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Skipping asset record %@, no existing asset and new asset does not qualify for device-library configuration: %@", buf, 0x16u);
          }
        }
        uint64_t v36 = [v17 objectForKeyedSubscript:*(void *)(*(void *)&v249[8] + 40)];
        if (v36)
        {
          [v159 addObject:v36];
          id v187 = (id)v36;
        }
        else
        {
          id v187 = 0;
        }
        long long v16 = 0;
LABEL_137:

        goto LABEL_138;
      }
      if (([(__CFString *)v14 isFullRecord] & 1) != 0
        || ![(__CFString *)v14 hasChangeType:64])
      {
        id v28 = v14;
      }
      else
      {
        id v28 = [v18 additionalRecordWithScopedIdentifier:v183];

        uint64_t v29 = [(__CFString *)v28 masterScopedIdentifier];
        id v30 = *(void **)(*(void *)&v249[8] + 40);
        *(void *)(*(void *)&v249[8] + 40) = v29;
      }
      if ([(__CFString *)v28 isFullRecord])
      {
        if (*(void *)(*(void *)&v249[8] + 40))
        {
          v43 = v185[2]();
          if (v43)
          {
            id v44 = +[PLManagedAsset createCloudPhotoLibraryAssetWithAssetRecord:v28 withCloudMaster:v43 inLibrary:v191];
            long long v16 = v44;
            if (v44)
            {
              if ([(__CFString *)v44 isPhoto]) {
                ++v157;
              }
              else {
                v156 += [(__CFString *)v16 isVideo];
              }
              v97 = [(__CFString *)v16 momentShare];
              v94 = v97;
              if (v97)
              {
                if ([v97 shouldNotifyOnUploadCompletion])
                {
                  v98 = [v94 momentShareAssets];
                  uint64_t v99 = [v98 count];
                  LODWORD(v99) = v99 == [v94 assetCount];

                  if (v99)
                  {
                    long long v100 = [v94 uuid];
                    [v155 addObject:v100];
                  }
                }
              }
              [v158 addObject:v16];
              BOOL v54 = 1;
              goto LABEL_160;
            }
            if (!*MEMORY[0x1E4F59AC0])
            {
              v94 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v244 = v28;
                uint64_t v95 = v94;
                v96 = "Failed to create asset from assetRecord %@ ";
                goto LABEL_152;
              }
              goto LABEL_153;
            }
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            v94 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v244 = v28;
              uint64_t v95 = v94;
              v96 = "Failed to create asset from assetRecord %@, can't find master";
LABEL_152:
              _os_log_impl(&dword_19B3C7000, v95, OS_LOG_TYPE_ERROR, v96, buf, 0xCu);
            }
LABEL_153:
            BOOL v54 = 0;
            long long v16 = 0;
LABEL_160:

            goto LABEL_161;
          }
          BOOL v54 = 0;
          long long v16 = 0;
LABEL_161:

          uint64_t v14 = v28;
          if (v16) {
            goto LABEL_74;
          }
          goto LABEL_138;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v92 = __CPLAssetsdOSLogDomain();
          id v187 = v92;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v244 = v28;
            id v46 = v92;
            v47 = "Skipping asset record %@, can't create asset, no master identifier";
LABEL_135:
            _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);
          }
          goto LABEL_136;
        }
      }
      else if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v45 = __CPLAssetsdOSLogDomain();
        id v187 = v45;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v244 = v28;
          id v46 = v45;
          v47 = "Skipping asset record %@, received a non-full record from CPL and we can't find the asset to apply this change to";
          goto LABEL_135;
        }
LABEL_136:
        long long v16 = 0;
        uint64_t v14 = v28;
        goto LABEL_137;
      }
      long long v16 = 0;
LABEL_139:

      _Block_object_dispose(v249, 8);
      uint64_t v11 = v179 + 1;
    }
    while (v179 + 1 != v176);
    uint64_t v101 = [obj countByEnumeratingWithState:&v230 objects:v253 count:16];
    uint64_t v176 = v101;
  }
  while (v101);
LABEL_168:

  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v189 = v164;
  uint64_t v102 = [v189 countByEnumeratingWithState:&v211 objects:v240 count:16];
  if (v102)
  {
    uint64_t v103 = *(void *)v212;
    do
    {
      for (uint64_t k = 0; k != v102; ++k)
      {
        if (*(void *)v212 != v103) {
          objc_enumerationMutation(v189);
        }
        long long v105 = *(void **)(*((void *)&v211 + 1) + 8 * k);
        [v105 computeUploadedAssetCountsUsingAssetRelationship];
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v106 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            long long v107 = [v105 scopeIdentifier];
            long long v108 = [v105 uuid];
            *(_DWORD *)v249 = 138543618;
            *(void *)&v249[4] = v107;
            *(_WORD *)&v249[12] = 2114;
            *(void *)&v249[14] = v108;
            _os_log_impl(&dword_19B3C7000, v106, OS_LOG_TYPE_DEFAULT, "Recomputed uploaded asset counts on MomentShare %{public}@ %{public}@ after handling asset records", v249, 0x16u);
          }
        }
      }
      uint64_t v102 = [v189 countByEnumeratingWithState:&v211 objects:v240 count:16];
    }
    while (v102);
  }

  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  id v186 = v166;
  uint64_t v109 = [v186 countByEnumeratingWithState:&v207 objects:v239 count:16];
  if (v109)
  {
    uint64_t v110 = *(void *)v208;
    do
    {
      for (uint64_t m = 0; m != v109; ++m)
      {
        if (*(void *)v208 != v110) {
          objc_enumerationMutation(v186);
        }
        uint64_t v112 = *(void *)(*((void *)&v207 + 1) + 8 * m);
        long long v113 = +[PLAvalanche assetsWithAvalancheUUID:v112 inManagedObjectContext:v178];
        if ([v113 count]
          && !+[PLAvalanche isValidBurstWithAssets:v113])
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v114 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v249 = 138412290;
              *(void *)&v249[4] = v112;
              _os_log_impl(&dword_19B3C7000, v114, OS_LOG_TYPE_DEFAULT, "Found burst on a download, revalidating %@", v249, 0xCu);
            }
          }
          id v115 = +[PLAvalanche revalidateAvalancheAssets:v113 inLibrary:v190 deleteNonPicks:0 allowDissolve:0];
        }
      }
      uint64_t v109 = [v186 countByEnumeratingWithState:&v207 objects:v239 count:16];
    }
    while (v109);
  }

  [(PLCloudDownloadBatchDetails *)v165 setNumberOfPhotos:v157];
  [(PLCloudDownloadBatchDetails *)v165 setNumberOfVideos:v156];
  [(PLCloudDownloadBatchDetails *)v165 setCmmUUIDsToNotify:v155];
  if ([v10 count])
  {
    long long v116 = [v190 managedObjectContext];
    long long v117 = [v10 allObjects];
    id v206 = 0;
    char v118 = [v116 obtainPermanentIDsForObjects:v117 error:&v206];
    id v119 = v206;

    if (*MEMORY[0x1E4F59AC0]) {
      char v120 = 1;
    }
    else {
      char v120 = v118;
    }
    if ((v120 & 1) == 0)
    {
      long long v121 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v249 = 138412546;
        *(void *)&v249[4] = v10;
        *(_WORD *)&v249[12] = 2112;
        *(void *)&v249[14] = v119;
        _os_log_impl(&dword_19B3C7000, v121, OS_LOG_TYPE_ERROR, "Unable to obtain permanent ID for %@: %@", v249, 0x16u);
      }
    }
    long long v122 = [v10 valueForKey:@"objectID"];
    [(PLCloudDownloadBatchDetails *)v165 setConfirmedResourceIDs:v122];
  }
  +[PLManagedAsset deDupCMMAssets:v158];
  *(void *)v249 = 0;
  *(void *)&v249[8] = v249;
  *(void *)&v249[16] = 0x3032000000;
  v250 = __Block_byref_object_copy__41855;
  v251 = __Block_byref_object_dispose__41856;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v158, "count"));
  id v252 = (id)objc_claimAutoreleasedReturnValue();
  v205[0] = MEMORY[0x1E4F143A8];
  v205[1] = 3221225472;
  v205[2] = __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke_113;
  v205[3] = &unk_1E5869D40;
  v205[4] = v249;
  long long v123 = objc_msgSend(v158, "_pl_filter:", v205);
  long long v124 = [*(id *)(*(void *)&v249[8] + 40) allObjects];
  v180 = +[PLImportSession albumsWithImportSessionIDs:v124 inManagedObjectContext:v178];

  long long v125 = objc_msgSend(v180, "_pl_indexBy:", &__block_literal_global_118);
  v192 = (void *)[v125 mutableCopy];

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id v184 = v123;
  uint64_t v126 = [v184 countByEnumeratingWithState:&v201 objects:v238 count:16];
  if (v126)
  {
    uint64_t v127 = *(void *)v202;
    do
    {
      for (uint64_t n = 0; n != v126; ++n)
      {
        if (*(void *)v202 != v127) {
          objc_enumerationMutation(v184);
        }
        v129 = *(void **)(*((void *)&v201 + 1) + 8 * n);
        uint64_t v130 = [v129 master];
        __int16 v131 = [v130 importSessionID];

        v132 = [v192 objectForKeyedSubscript:v131];
        if (!v132)
        {
          v132 = +[PLImportSession insertNewImportSessionAlbumWithImportSessionID:v131 inManagedObjectContext:v178];
          [v192 setObject:v132 forKeyedSubscript:v131];
        }
        [v129 setImportSession:v132];
        [v132 updateImportDatesFromAddedAsset:v129];
      }
      uint64_t v126 = [v184 countByEnumeratingWithState:&v201 objects:v238 count:16];
    }
    while (v126);
  }

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id contexta = v160;
  uint64_t v133 = [contexta countByEnumeratingWithState:&v197 objects:v237 count:16];
  if (v133)
  {
    uint64_t v134 = *(void *)v198;
    do
    {
      for (iuint64_t i = 0; ii != v133; ++ii)
      {
        if (*(void *)v198 != v134) {
          objc_enumerationMutation(contexta);
        }
        v136 = *(void **)(*((void *)&v197 + 1) + 8 * ii);
        [v136 setLocalOnlyDelete:1];
        v137 = NSString;
        id v138 = objc_loadWeakRetained((id *)&self->_manager);
        unint64_t v139 = [v138 deviceLibraryConfiguration];
        v140 = @"unknown";
        if (v139 <= 2) {
          v140 = off_1E586C1D0[v139];
        }
        v141 = v140;
        v142 = [v137 stringWithFormat:@"Asset does not qualify for device-library configuration: %@", v141];
        v143 = +[PLAssetTransactionReason transactionReason:v142];
        [v136 deleteWithReason:v143];
      }
      uint64_t v133 = [contexta countByEnumeratingWithState:&v197 objects:v237 count:16];
    }
    while (v133);
  }

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v144 = v159;
  uint64_t v145 = [v144 countByEnumeratingWithState:&v193 objects:v236 count:16];
  if (v145)
  {
    uint64_t v146 = *(void *)v194;
    do
    {
      for (juint64_t j = 0; jj != v145; ++jj)
      {
        if (*(void *)v194 != v146) {
          objc_enumerationMutation(v144);
        }
        +[PLCloudMaster deleteMasterIfNecessary:*(void *)(*((void *)&v193 + 1) + 8 * jj) inLibrary:v190];
      }
      uint64_t v145 = [v144 countByEnumeratingWithState:&v193 objects:v236 count:16];
    }
    while (v145);
  }

  v148 = [v190 managedObjectContext];
  +[PLMemory deleteMemoriesWithObjectIDs:v162 inManagedObjectContext:v148];

  v149 = [v190 managedObjectContext];
  +[PLSuggestion deleteSuggestionsWithObjectIDs:v161 inManagedObjectContext:v149];

  if (a6)
  {
    v150 = (void *)MEMORY[0x1E4F1CAD0];
    v151 = [v158 valueForKey:@"uuid"];
    *a6 = [v150 setWithArray:v151];
  }
  v152 = v165;

  _Block_object_dispose(v249, 8);
  return v152;
}

id __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  if (!v2)
  {
    id v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        uint64_t v6 = *(void *)(a1 + 40);
        int v10 = 138412546;
        uint64_t v11 = v5;
        __int16 v12 = 2112;
        uint64_t v13 = v6;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Can't find the master %@ for asset %@ in Photos db or in the batch. Checking batch additionalRecords", (uint8_t *)&v10, 0x16u);
      }
    }
    id v2 = [*(id *)(a1 + 48) _findMaster:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) fromAdditionalRecordInBatch:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 64)];
    if (!v2)
    {
      if (!*v3)
      {
        id v7 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          int v10 = 138412290;
          uint64_t v11 = v8;
          _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Can't find the master %@ on the additionalRecord", (uint8_t *)&v10, 0xCu);
        }
      }
      id v2 = 0;
    }
  }
  return v2;
}

BOOL __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = [a2 master];
  uint64_t v4 = [v3 importSessionID];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }

  return v4 != 0;
}

uint64_t __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 importSessionID];
}

- (void)_assetsAndCloudMastersFromAssetRecords:(id)a3 assetsByScopedIdentifier:(id *)a4 mastersByScopedIdentifier:(id *)a5 inLibrary:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v25 = a6;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithObject:@"master"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = v9;
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v13);
        }
        long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v16 = (void *)MEMORY[0x19F38D3B0]();
        if ([v15 hasChangeType:2]) {
          [v8 addObject:@"additionalAttributes"];
        }
        if ([v15 hasChangeType:8]) {
          [v8 addObject:@"modernResources"];
        }
        id v17 = [v15 keywords];

        if (v17)
        {
          id v18 = [NSString stringWithFormat:@"%@.%@", @"additionalAttributes", @"keywords"];
          [v8 addObject:v18];
        }
      }
      id v9 = v13;
      uint64_t v11 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  if (a4)
  {
    uint64_t v19 = NSStringFromSelector(sel_scopedIdentifier);
    BOOL v20 = [v9 valueForKey:v19];
    uint64_t v21 = [v8 allObjects];
    *a4 = +[PLManagedAsset assetsByScopedIdentifiers:v20 relationshipKeyPathsForPrefetching:v21 inLibrary:v25];
  }
  long long v22 = objc_msgSend(v9, "_pl_map:", &__block_literal_global_42088);
  if (v22)
  {
    *a5 = +[PLCloudMaster cloudMastersByScopedIdentifiers:v22 relationshipKeyPathsForPrefetching:0 inLibrary:v25];
  }
}

uint64_t __126__PLCloudBatchDownloader__assetsAndCloudMastersFromAssetRecords_assetsByScopedIdentifier_mastersByScopedIdentifier_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 masterScopedIdentifier];
}

- (id)_findMaster:(id)a3 fromAdditionalRecordInBatch:(id)a4 inLibrary:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [a4 additionalRecordWithScopedIdentifier:a3];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    v16[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v12 = [(PLCloudBatchDownloader *)self _handleMasterRecords:v11 inLibrary:v8];

    uint64_t v13 = [v10 scopedIdentifier];
    uint64_t v14 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v13 prefetchResources:0 inLibrary:v8];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_handleMasterRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(PLCloudDownloadBatchDetails);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = NSStringFromSelector(sel_scopedIdentifier);
  uint64_t v10 = [v5 valueForKey:v9];

  v43 = (void *)v10;
  uint64_t v11 = +[PLCloudMaster cloudMastersByScopedIdentifiers:v10 relationshipKeyPathsForPrefetching:0 inLibrary:v6];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v59 count:16];
  uint64_t v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
  uint64_t v47 = v13;
  if (v13)
  {
    uint64_t v46 = *(void *)v52;
    uint64_t v45 = v11;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
        context = (void *)MEMORY[0x19F38D3B0]();
        id v17 = [v16 scopedIdentifier];
        id v18 = [v11 objectForKeyedSubscript:v17];

        if (v18)
        {
LABEL_7:
          if ([v18 cloudLocalState] != 3) {
            [v18 setCloudLocalState:3];
          }
          if ([v16 hasChangeType:2])
          {
            if (!*v14)
            {
              uint64_t v19 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v56 = v16;
                _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Applying properties change from masterChange %@", buf, 0xCu);
              }
            }
            [v18 applyPropertiesFromCPLMasterChange:v16];
          }
          if ([v16 hasChangeType:8])
          {
            [(PLCloudDownloadBatchDetails *)v7 setHasResourceChanges:1];
            if (([v16 isFullRecord] & 1) == 0
              && [v18 placeholderState] != 1)
            {
              BOOL v20 = [v18 allMasterResources];
              [(PLCloudBatchDownloader *)self _triggerBackgroundDownloadFailureForResources:v20];
            }
            if (!*v14)
            {
              uint64_t v21 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v56 = v16;
                _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Applying resource change from masterChange %@", buf, 0xCu);
              }
            }
            long long v22 = objc_msgSend(v18, "rm_applyResourcesFromCPLMasterChange:inPhotoLibrary:", v16, v6);
            if ([v22 count]) {
              [v8 unionSet:v22];
            }
          }
          if ([v16 hasChangeType:2])
          {
            char v23 = [v16 expungeableResourceStates];
            uint64_t v24 = [v23 count];

            if (v24)
            {
              uint64_t v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
              if (!*MEMORY[0x1E4F59AC0])
              {
                id v25 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v56 = v16;
                  _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Applying expungeable resource states change from masterChange %@", buf, 0xCu);
                }
              }
              objc_msgSend(v18, "rm_applyExpungeableResourceStatesFromCPLMasterChange:inPhotoLibrary:", v16, v6);
            }
            else
            {
              uint64_t v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
            }
          }
          goto LABEL_47;
        }
        if (!*v14)
        {
          long long v26 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v16;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "Creating cloudMaster from masterChange %@", buf, 0xCu);
          }
        }
        long long v27 = [v16 scopedIdentifier];
        id v50 = 0;
        BOOL v28 = +[PLShare getShareIfNecessary:&v50 forCPLRecordWithClass:objc_opt_class() scopedIdentifier:v27 inLibrary:v6];
        id v29 = v50;
        id v30 = v29;
        if (v28)
        {
          [v27 identifier];
          id v31 = v12;
          id v32 = v8;
          uint64_t v34 = v33 = v7;
          id v18 = +[PLCloudMaster insertIntoPhotoLibrary:v6 withCloudMasterGUID:v34 inMomentShare:v30];
          [v18 setCloudLocalState:3];

          id v7 = v33;
          id v8 = v32;
          id v12 = v31;
          uint64_t v11 = v45;

          uint64_t v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
          if (v18) {
            goto LABEL_7;
          }
        }
        else
        {

          uint64_t v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
        }
        if (!*v14)
        {
          __int16 v35 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v16;
            _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Unable to create cloudMaster for %@", buf, 0xCu);
          }
        }
        id v18 = 0;
LABEL_47:

        ++v15;
      }
      while (v47 != v15);
      uint64_t v47 = [v12 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v47);
  }

  if ([v8 count])
  {
    uint64_t v36 = [v6 managedObjectContext];
    __int16 v37 = [v8 allObjects];
    id v49 = 0;
    char v38 = [v36 obtainPermanentIDsForObjects:v37 error:&v49];
    id v39 = v49;

    if ((v38 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
    {
      long long v40 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v56 = v8;
        __int16 v57 = 2112;
        id v58 = v39;
        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Unable to obtain permanent ID for %@: %@", buf, 0x16u);
      }
    }
    uint64_t v41 = [v8 valueForKey:@"objectID"];
    [(PLCloudDownloadBatchDetails *)v7 setConfirmedResourceIDs:v41];
  }
  return v7;
}

- (void)_handleAlbumRecords:(id)a3 inLibrary:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        id v12 = [v11 name];
        uint64_t v13 = [v11 scopedIdentifier];
        uint64_t v14 = [v13 identifier];

        uint64_t v15 = [v11 parentIdentifier];

        if (v15)
        {
          long long v16 = [v11 parentIdentifier];
          id v17 = +[PLGenericAlbum albumWithCloudGUID:v16 inLibrary:v6];

          if (!v17)
          {
            id v17 = +[PLManagedFolder insertNewFolderWithTitle:@"Folder" kind:4000 intoLibrary:v6];
            id v18 = [v11 parentIdentifier];
            [v17 setCloudGUID:v18];
          }
        }
        uint64_t v19 = +[PLGenericAlbum albumWithCloudGUID:v14 inLibrary:v6];
        if (v19) {
          goto LABEL_33;
        }
        if (![v11 albumType])
        {
          uint64_t v21 = +[PLGenericAlbum insertNewAlbumWithTitle:v12 intoLibrary:v6];
          goto LABEL_20;
        }
        if ([v11 albumType] == 3)
        {
          if (([v14 isEqualToString:@"----Root-Folder----"] & 1) != 0
            || [v14 isEqualToString:@"----Project-Root-Folder----"])
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              BOOL v20 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v36 = v14;
                _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Dropping root album from albumChange with cloudGUID: %@. Cannot find it locally", buf, 0xCu);
              }

LABEL_27:
              if (!*MEMORY[0x1E4F59AC0])
              {
                long long v22 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v25 = [v11 albumType];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v36 = v14;
                  __int16 v37 = 2048;
                  uint64_t v38 = v25;
                  _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Dropping album from albumChange %@, unsupported type: %lu", buf, 0x16u);
                }
                uint64_t v19 = 0;
                goto LABEL_31;
              }
            }
            uint64_t v19 = 0;
            goto LABEL_32;
          }
          uint64_t v21 = +[PLManagedFolder insertNewFolderWithTitle:v12 kind:4000 intoLibrary:v6];
LABEL_20:
          uint64_t v19 = (void *)v21;
          if (!v21) {
            goto LABEL_27;
          }
          goto LABEL_21;
        }
        if ([v11 albumType] != 7) {
          goto LABEL_27;
        }
        uint64_t v23 = [v11 projectDocumentType];
        if (v23)
        {
          uint64_t v24 = (void *)v23;
          uint64_t v19 = +[PLGenericAlbum insertNewProjectAlbumWithTitle:v12 documentType:v23 intoLibrary:v6];

          if (!v19) {
            goto LABEL_27;
          }
LABEL_21:
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v22 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v36 = v14;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Created album from albumChange %@", buf, 0xCu);
            }
LABEL_31:
          }
LABEL_32:
          [v19 setCloudLocalState:1];
LABEL_33:
          [v19 applyPropertiesFromAlbumChange:v11];
          goto LABEL_34;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v26 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = v11;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_FAULT, "Skipping CPLAlbum record of project type with nil projectDocumentType: %@", buf, 0xCu);
          }
        }
        long long v27 = NSString;
        BOOL v28 = [v11 scopedIdentifier];
        uint64_t v19 = [v27 stringWithFormat:@"Attempted to pull a CPLAlbum project record %@ with nil projectDocumentType. \n\nSee rdar://problem/77014185", v28];

        +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Cloud Photo Library state detected" message:@"Please file a Radar against Photos" radarTitle:@"TTR: CPLAlbum project record with nil projectDocumentType" radarDescription:v19];
LABEL_34:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      uint64_t v8 = v29;
    }
    while (v29);
  }
}

- (void)_handleScopeChanges:(id)a3 inLibrary:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v21 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    p_manager = &self->_manager;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v13 = [v12 scopeType];
        if (v13 <= 6)
        {
          if (((1 << v13) & 0x43) != 0)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              id v17 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v29 = v12;
                _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Ignoring unsupported scope type for scopeChange %@", buf, 0xCu);
              }
            }
          }
          else if (((1 << v13) & 0xC) != 0)
          {
            uint64_t v14 = +[PLMomentShare insertOrUpdateShareWithCPLScopeChange:v12 inPhotoLibrary:v21];
            if (!*MEMORY[0x1E4F59AC0])
            {
              uint64_t v15 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                long long v16 = [v14 compactDescription];
                *(_DWORD *)buf = 138412290;
                uint64_t v29 = v16;
                _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Created or updated moment share %@", buf, 0xCu);
              }
            }
          }
          else
          {
            id WeakRetained = objc_loadWeakRetained((id *)p_manager);
            unint64_t v19 = [WeakRetained deviceLibraryConfiguration];

            if (v19 <= 2 && ((3u >> (v19 & 7)) & 1) != 0)
            {
              id v20 = objc_loadWeakRetained((id *)p_manager);
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __56__PLCloudBatchDownloader__handleScopeChanges_inLibrary___block_invoke;
              v22[3] = &unk_1E5875E18;
              void v22[4] = v12;
              id v23 = v21;
              [v20 performTransactionOnLibraryScopeSynchronizationQueue:v22];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }
}

void __56__PLCloudBatchDownloader__handleScopeChanges_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = +[PLLibraryScope insertOrUpdateShareWithCPLScopeChange:*(void *)(a1 + 32) inPhotoLibrary:*(void *)(a1 + 40)];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v2 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Created or updated library scope %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (id)_mergeTargetFromPersons:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v6
          || +[PLPerson person:*(void *)(*((void *)&v13 + 1) + 8 * i) isBetterMergeTargetThanPerson:v6])
        {
          id v10 = v9;

          id v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v11 = [v6 finalMergeTargetPerson];

  return v11;
}

- (void)_mergeExistingPersonsWithPerson:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 personUri];
  if ([v9 length] && objc_msgSend(MEMORY[0x1E4F59840], "serverSupportsVision"))
  {
    id v10 = [v8 managedObjectContext];
    uint64_t v11 = +[PLPerson personsWithPersonUri:v9 inManagedObjectContext:v10];

    if ((unint64_t)[v11 count] < 2)
    {
LABEL_28:

      goto LABEL_29;
    }
    SEL v29 = a2;
    id v30 = self;
    long long v33 = v8;
    id v34 = v7;
    id v12 = [(PLCloudBatchDownloader *)self _mergeTargetFromPersons:v11];
    long long v13 = [v12 finalMergeTargetPerson];

    uint64_t v31 = v13;
    long long v14 = [v13 personUUID];
    long long v15 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v32 = v11;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v22 = [v21 personUUID];
          if ([v22 isEqualToString:v14])
          {
          }
          else
          {
            char v23 = [v21 isTombstone];

            if ((v23 & 1) == 0) {
              [v15 addObject:v21];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v18);
    }

    if ([v15 count])
    {
      id v8 = v33;
      id v7 = v34;
      long long v24 = v31;
      uint64_t v11 = v32;
      if (!*MEMORY[0x1E4F59AC0])
      {
        long long v25 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v43 = v15;
          __int16 v44 = 2112;
          uint64_t v45 = v31;
          __int16 v46 = 2112;
          uint64_t v47 = v9;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Merging persons %@ to person %@ with same personUri %@", buf, 0x20u);
        }
      }
      [(PLCloudBatchDownloader *)v30 _saveIfNeeded:v33];
      long long v26 = [v33 libraryServicesManager];
      long long v27 = [v26 databaseContext];

      if (!v27)
      {
        BOOL v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:v29, v30, @"PLCloudBatchDownloader.m", 379, @"Invalid parameter not satisfying: %@", @"databaseContext" object file lineNumber description];
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __73__PLCloudBatchDownloader__mergeExistingPersonsWithPerson_inPhotoLibrary___block_invoke;
      v35[3] = &unk_1E5869CD0;
      id v36 = v31;
      id v37 = v15;
      -[NSObject performTransactionSync:withName:](v27, "performTransactionSync:withName:", v35, "-[PLCloudBatchDownloader _mergeExistingPersonsWithPerson:inPhotoLibrary:]");
    }
    else
    {
      id v8 = v33;
      id v7 = v34;
      long long v24 = v31;
      uint64_t v11 = v32;
      if (*MEMORY[0x1E4F59AC0])
      {
LABEL_27:

        goto LABEL_28;
      }
      long long v27 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v34;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Unexpected personToMerge for person %@", buf, 0xCu);
      }
    }

    goto LABEL_27;
  }
LABEL_29:
}

void __73__PLCloudBatchDownloader__mergeExistingPersonsWithPerson_inPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 managedObjectContext];
  uint64_t v4 = [*(id *)(a1 + 32) objectID];
  id v26 = 0;
  uint64_t v5 = [v3 existingObjectWithID:v4 error:&v26];
  id v6 = v26;

  if (v5)
  {
    uint64_t v19 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          id v12 = v6;
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v14 = [v13 objectID];
          id v21 = v6;
          long long v15 = [v3 existingObjectWithID:v14 error:&v21];
          id v6 = v21;

          if (v15)
          {
            [v7 addObject:v15];
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            id v16 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              BOOL v28 = v13;
              __int16 v29 = 2112;
              id v30 = v6;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch personToMerge %@ in transient moc: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v9);
    }

    uint64_t v5 = v19;
    uint64_t v17 = [v19 pickKeyFaceOptimalStateForContactDedupeWithPersons:v7];
    [v19 mergePersons:v7 withOptimalState:v17];

LABEL_19:
    goto LABEL_20;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      BOOL v28 = v18;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch merge target person %@ in transient moc: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_dropDeferredRebuildFacesInPhotoLibrary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[PLDeferredRebuildFace fetchRequest];
  uint64_t v5 = [v3 managedObjectContext];
  id v24 = 0;
  id v6 = [v5 executeFetchRequest:v4 error:&v24];
  id v7 = v24;

  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          long long v14 = objc_msgSend(v3, "managedObjectContext", (void)v20);
          [v14 deleteObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    if (!*MEMORY[0x1E4F59AC0])
    {
      long long v15 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v8 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = v16;
        uint64_t v17 = "Dropped all deferred rebuild faces (count: %lu)";
        uint64_t v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_19B3C7000, v18, v19, v17, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    long long v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = (uint64_t)v7;
      uint64_t v17 = "Unable to fetch deferred rebuild faces with error %@";
      uint64_t v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
LABEL_16:
  }
}

- (BOOL)_shouldIgnoreIncomingManualOrderChange:(id)a3 localPerson:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6
    && ((uint64_t v7 = [v5 verifiedType], v7 == 4) || v7 == 2)
    && [v5 manualSortOrder] >= 1024)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v8 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v5 manualSortOrder];
        uint64_t v10 = [v6 personUUID];
        int v13 = 134218242;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring incoming person manualOrder (%td) change from cloud graph person %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldIgnoreIncomingPersonTypeChange:(id)a3 localPerson:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isHiddenGraphPerson]
    && ((uint64_t v7 = [v5 verifiedType], v7 == 4) || v7 == 2))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v8 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v6 personUUID];
        int v12 = 138543362;
        int v13 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring incoming person change to hidden graph person %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_handlePersonRecords:(id)a3 inLibrary:(id)a4 includesTiboSchema:(BOOL *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v49 = a4;
  id v48 = [v49 managedObjectContext];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v7;
  uint64_t v51 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v51)
  {
    char v44 = 0;
    unint64_t v8 = 0x1E4F59000uLL;
    goto LABEL_81;
  }
  SEL v41 = a2;
  char v44 = 0;
  uint64_t v50 = *(void *)v55;
  unint64_t v8 = 0x1E4F59000;
  do
  {
    for (uint64_t i = 0; i != v51; ++i)
    {
      if (*(void *)v55 != v50) {
        objc_enumerationMutation(obj);
      }
      BOOL v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      BOOL v11 = (void *)MEMORY[0x19F38D3B0]();
      if ([v10 personType] != -1
        || [v10 verifiedType] != 2 && objc_msgSend(v10, "verifiedType") != 4)
      {
        int v12 = objc_msgSend(v10, "scopedIdentifier", v41);
        int v13 = [v12 scopeIdentifier];
        uint64_t v14 = [v49 mainScopeIdentifier];
        char v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          long long v39 = [MEMORY[0x1E4F28B00] currentHandler];
          [v39 handleFailureInMethod:v41 object:self file:@"PLCloudBatchDownloader.m" lineNumber:133 description:@"person record is only supported in main library"];
        }
        uint64_t v16 = [v12 identifier];
        uint64_t v17 = [v10 fullName];
        uint64_t v18 = +[PLPerson personWithUUID:v16 inManagedObjectContext:v48];
        if (v18)
        {
          os_log_type_t v19 = (void *)v18;
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v20 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v21 = [v19 syncDescription];
              *(_DWORD *)buf = 138412546;
              v59 = v21;
              __int16 v60 = 2112;
              __int16 v61 = v10;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Updating local person %@ with person record %@", buf, 0x16u);
            }
          }
          if ([v10 isFullRecord] && !*MEMORY[0x1E4F59AC0])
          {
            long long v22 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              long long v23 = [v19 syncDescription];
              *(_DWORD *)buf = 138412546;
              v59 = v23;
              __int16 v60 = 2112;
              __int16 v61 = v10;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Found existing person %@ for a full person record %@", buf, 0x16u);
            }
          }
          BOOL v24 = [(PLCloudBatchDownloader *)self _shouldIgnoreIncomingPersonTypeChange:v10 localPerson:v19];
          BOOL v25 = [(PLCloudBatchDownloader *)self _shouldIgnoreIncomingManualOrderChange:v10 localPerson:v19];
LABEL_36:
          [v19 setFullName:v17];
          id v30 = [v10 displayName];
          [v19 setDisplayName:v30];

          if (!v24) {
            objc_msgSend(v19, "setType:", objc_msgSend(v10, "personType"));
          }
          unint64_t v8 = 0x1E4F59000uLL;
          if (!v25) {
            objc_msgSend(v19, "setManualOrder:", objc_msgSend(v10, "manualSortOrder"));
          }
          if ([MEMORY[0x1E4F598F0] serverSupportsAssetSortOrder]) {
            objc_msgSend(v19, "setAssetSortOrder:", (__int16)objc_msgSend(v10, "assetSortOrder"));
          }
          if ([MEMORY[0x1E4F598F0] serverSupportsGraphPeopleHome])
          {
            if ([v10 verifiedType])
            {
              uint64_t v31 = [v10 verifiedType];
              uint64_t v32 = 0;
              uint64_t v33 = 4294967294;
              switch(v31)
              {
                case -2:
                  goto LABEL_51;
                case 1:
                case 3:
                  uint64_t v33 = 1;
                  goto LABEL_51;
                case 2:
                case 4:
                  if (objc_msgSend(v19, "cloudVerifiedType", 0) == 1)
                  {
                    uint64_t v32 = 1;
                  }
                  else
                  {
                    uint64_t v33 = 2;
LABEL_51:
                    [v19 setCloudVerifiedType:v33];
                    uint64_t v32 = v33;
                  }
LABEL_52:
                  [v19 setVerifiedType:v32];
                  char v44 = 1;
                  break;
                default:
                  goto LABEL_52;
              }
            }
          }
          else
          {
            [v19 setEffectiveVerifiedType:1];
          }
          if ([MEMORY[0x1E4F598F0] serverSupportsMergeTargetRef])
          {
            id v34 = [v10 mergeTargetPersonIdentifier];
            __int16 v35 = v34;
            if (v34)
            {
              if ([v34 isEqualToString:v16])
              {
                if (!*MEMORY[0x1E4F59AC0])
                {
                  id v36 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v10;
                    _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Person record %@ points to itself as the merge target, setting the local merge target to nil", buf, 0xCu);
                  }
                }
                [v19 setMergeTargetPerson:0];
              }
              else
              {
                [v43 setObject:v35 forKey:v16];
              }
            }
          }
          if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType])
          {
            uint64_t v37 = [v10 detectionType];
            [v19 setCloudDetectionType:v37];
            if (v37 || [v19 detectionType])
            {
              if (v37 == [v19 detectionType]
                || v37 > 4
                || ((1 << v37) & 0x1A) == 0)
              {
                goto LABEL_72;
              }
            }
            else
            {
              uint64_t v37 = 1;
            }
            [v19 setDetectionType:v37];
            [v19 assignDetectionTypeFromFaces];
          }
LABEL_72:
          long long v38 = [v10 contactMatchingDictionary];
          if ([v19 verifiedType] == -2)
          {

            long long v38 = 0;
          }
          [v19 applyCPLChangeForContactMatchingDictionary:v38];
          [v19 setCloudLocalState:1];
          [v47 addObject:v19];
        }
        else
        {
          if (([v10 isFullRecord] & 1) == 0 && !*MEMORY[0x1E4F59AC0])
          {
            id v26 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v10;
              _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Existing person not found for an updated person record %@", buf, 0xCu);
            }
          }
          uint64_t v27 = [v49 managedObjectContext];
          os_log_type_t v19 = +[PLPerson insertIntoManagedObjectContext:v27 withPersonUUID:v16 fullName:v17 verifiedType:0];

          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v28 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v29 = [v19 syncDescription];
              *(_DWORD *)buf = 138412546;
              v59 = v29;
              __int16 v60 = 2112;
              __int16 v61 = v10;
              _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Inserted new person %@ for personRecord %@", buf, 0x16u);
            }
          }
          if (v19)
          {
            BOOL v24 = 0;
            BOOL v25 = 0;
            goto LABEL_36;
          }
          unint64_t v8 = 0x1E4F59000;
        }

        goto LABEL_76;
      }
      if (*MEMORY[0x1E4F59AC0]) {
        goto LABEL_77;
      }
      int v12 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v10;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Dropping hidden graph person record %@", buf, 0xCu);
      }
LABEL_76:

LABEL_77:
    }
    uint64_t v51 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  }
  while (v51);
LABEL_81:

  if ([*(id *)(v8 + 2288) serverSupportsMergeTargetRef])
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __76__PLCloudBatchDownloader__handlePersonRecords_inLibrary_includesTiboSchema___block_invoke;
    v52[3] = &unk_1E58756D0;
    id v53 = v48;
    [v43 enumerateKeysAndObjectsUsingBlock:v52];
  }
  if (a5) {
    *a5 = v44 & 1;
  }

  return v47;
}

void __76__PLCloudBatchDownloader__handlePersonRecords_inLibrary_includesTiboSchema___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[PLPerson personWithUUID:v5 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v8 = +[PLPerson personWithUUID:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      BOOL v11 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to find merge target person with identifier %@ for person %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v12 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Setting %@ merge target person to %@ after processing all persons", (uint8_t *)&v13, 0x16u);
      }
    }
    [v7 setCPLSyncedMergeTarget:v9];
  }
}

- (void)_saveIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 managedObjectContext];
  int v5 = [v4 hasChanges];

  if (v5)
  {
    id v6 = [v3 managedObjectContext];
    id v10 = 0;
    char v7 = [v6 save:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
    {
      uint64_t v9 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to save CPL changes: %@", buf, 0xCu);
      }
    }
  }
}

- (PLCloudBatchDownloader)initWithLibraryServicesManager:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLCloudBatchDownloader;
  uint64_t v9 = [(PLCloudBatchDownloader *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lsm, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
  }

  return v10;
}

+ (id)_adjustmentStateDictionaryForComparingIncomingFaceRecordForAsset:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"PLCPLAssetHasAdjustmentsKey";
  id v3 = NSNumber;
  id v4 = a3;
  int v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "hasAdjustments"));
  v10[1] = @"PLCPLAssetAdjustmentFingerprintKey";
  v11[0] = v5;
  id v6 = [v4 syncedAdjustmentFingerprint];

  id v7 = &stru_1EEB2EB80;
  if (v6) {
    id v7 = v6;
  }
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

@end