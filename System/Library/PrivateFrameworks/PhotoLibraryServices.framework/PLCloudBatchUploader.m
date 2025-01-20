@interface PLCloudBatchUploader
- (BOOL)_hasUnuploadedResourceForAsset:(id)a3 resourceType:(unint64_t)a4 cloudMaster:(id)a5;
- (BOOL)_processRepushAlbumError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 orderKeyManager:(id)a6 inLibrary:(id)a7;
- (BOOL)_updateDeletionRecordListForKey:(id)a3 removingRecordID:(id)a4;
- (BOOL)_validateAdditionalAssetAttributes:(id)a3 onRelatedObject:(id)a4;
- (BOOL)_validateAsset:(id)a3 onRelatedObject:(id)a4;
- (BOOL)hasBatchesToUpload;
- (BOOL)initialUpload;
- (BOOL)shouldGenerateDerivatives;
- (PLCloudBatchUploader)initWithLibraryServicesManager:(id)a3;
- (PLLibraryServicesManager)libraryServicesManager;
- (id)_fetchChangesFromLocalEvent:(id)a3 shouldTriggerPrefetch:(BOOL *)a4 inLibrary:(id)a5;
- (id)_getLocalRecordFromCPLRecord:(id)a3 inLibrary:(id)a4;
- (id)_personsToUploadIncludingReverseOrderedMergeTargetsForPersons:(id)a3;
- (id)_syncDescriptionForObject:(id)a3;
- (id)_validateAssets:(id)a3 fromCloudUuidDeleteList:(id)a4;
- (id)createBatchesForChanges:(id)a3 outInsertedPhotoCount:(unint64_t *)a4 outInsertedVideoCount:(unint64_t *)a5 withUploadTracker:(id)a6 inLibrary:(id)a7;
- (id)pop;
- (id)processCommitError:(id)a3 andFinalizeError:(id)a4 forUploadBatchContainer:(id)a5 withUploadTracker:(id)a6 inLibrary:(id)a7;
- (unint64_t)numberOfBatchesToUpload;
- (void)_addAsset:(id)a3 toAssetChanges:(id)a4 isInsert:(BOOL)a5 seenAssetUuid:(id)a6;
- (void)_addLocalResourcesToRecord:(id)a3 inLibrary:(id)a4;
- (void)_cleanUploadedResources:(id)a3 inLibrary:(id)a4;
- (void)_clearSuccessfullyPushedDeletedRecords:(id)a3;
- (void)_handleInvalidAsset:(id)a3;
- (void)_handleSharingChanges:(id)a3 forUploadEvent:(id)a4 inManagedObjectContext:(id)a5;
- (void)_incrementUploadAttemptsAndPushStateForAssets:(id)a3;
- (void)_processAlbumInserts:(id)a3 albumChanges:(id)a4 withBatchManager:(id)a5 inLibrary:(id)a6;
- (void)_processChangeToFullRecordCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6;
- (void)_processGenerateDerivativesCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6;
- (void)_processIncludeMasterCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6;
- (void)_processInvalidExpungeableResourceTypesCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6;
- (void)_processInvalidResourceCopySourceCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 orderKeyManager:(id)a6 inLibrary:(id)a7;
- (void)_processInvalidScopeCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6;
- (void)_processPendingObjects:(id)a3 withBatchManager:(id)a4 inLibrary:(id)a5;
- (void)_processQuarantineRecordsCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 uploadTracker:(id)a6 inLibrary:(id)a7;
- (void)_promptForNilAssetUUID:(id)a3 isInsert:(BOOL)a4;
- (void)_promptToFileRadarWithTitle:(id)a3 description:(id)a4;
- (void)_push:(id)a3;
- (void)_pushBatches:(id)a3;
- (void)_quarantineObject:(id)a3 uploadTracker:(id)a4;
- (void)_sendAlbums:(id)a3 toBatchManager:(id)a4 orderKeyManager:(id)a5 inLibrary:(id)a6;
- (void)_sendAssets:(id)a3 toBatchManager:(id)a4 orderKeyManager:(id)a5 inLibrary:(id)a6;
- (void)_sendOneBatch:(id)a3 toBatchManager:(id)a4 inLibrary:(id)a5;
- (void)_sortData:(id)a3 isInsert:(BOOL)a4 forUploadChanges:(id)a5 shouldTriggerPrefetch:(BOOL *)a6 inManagedObjectContext:(id)a7;
- (void)_sortRelationshipData:(id)a3 forUploadChanges:(id)a4 inManagedObjectContext:(id)a5;
- (void)addBatches:(id)a3;
- (void)clearUploadArray;
- (void)handleUploadBatchesFromLocalEvent:(id)a3 outInsertedPhotoCount:(unint64_t *)a4 outInsertedVideoCount:(unint64_t *)a5 shouldTriggerPrefetch:(BOOL *)a6 withUploadTracker:(id)a7 inLibrary:(id)a8;
- (void)processMomentSharesNeedingForceSyncInLibrary:(id)a3;
- (void)quarantineRecord:(id)a3 uploadTracker:(id)a4 inLibrary:(id)a5;
- (void)recordDeletions:(id)a3;
- (void)recordMomentSharesNeedingForceSync:(id)a3 inLibrary:(id)a4;
- (void)setInitialUpload:(BOOL)a3;
- (void)setShouldGenerateDerivatives:(BOOL)a3;
- (void)tryToFixCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 uploadTracker:(id)a6 orderKeyManager:(id)a7 inLibrary:(id)a8;
- (void)uploadDeletedRecordsFromPlist:(id)a3;
- (void)uploadFullPhotoLibraryToCloud:(id)a3;
@end

@implementation PLCloudBatchUploader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong((id *)&self->_momentSharesNeedingForceSync, 0);
  objc_storeStrong((id *)&self->_recordsToDeletePlistPath, 0);
  objc_storeStrong((id *)&self->_recordsToDelete, 0);
  objc_storeStrong((id *)&self->_cameraAsset, 0);
  objc_storeStrong((id *)&self->_downloadedDeleteRecords, 0);
  objc_storeStrong((id *)&self->_uploadBatchArray, 0);
}

- (void)setShouldGenerateDerivatives:(BOOL)a3
{
  self->_shouldGenerateDerivatives = a3;
}

- (BOOL)shouldGenerateDerivatives
{
  return self->_shouldGenerateDerivatives;
}

- (void)setInitialUpload:(BOOL)a3
{
  self->_initialUpload = a3;
}

- (BOOL)initialUpload
{
  return self->_initialUpload;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (void)processMomentSharesNeedingForceSyncInLibrary:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_momentSharesNeedingForceSync count])
  {
    v5 = [(NSMutableSet *)self->_momentSharesNeedingForceSync allObjects];
    +[PLMomentShare forceSyncMomentShares:v5 photoLibrary:v4];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__PLCloudBatchUploader_processMomentSharesNeedingForceSyncInLibrary___block_invoke;
    v6[3] = &unk_1E5875CE0;
    v6[4] = self;
    [v4 performBlockAndWait:v6];
    [(NSMutableSet *)self->_momentSharesNeedingForceSync removeAllObjects];
  }
}

void __69__PLCloudBatchUploader_processMomentSharesNeedingForceSyncInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 56);
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
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "setForceSyncAttempted:", 1, (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)recordMomentSharesNeedingForceSync:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PLCloudBatchUploader_recordMomentSharesNeedingForceSync_inLibrary___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [a4 performBlockAndWait:v8];
}

void __69__PLCloudBatchUploader_recordMomentSharesNeedingForceSync_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "forceSyncAttempted", (void)v7) & 1) == 0) {
          [*(id *)(*(void *)(a1 + 40) + 56) addObjectsFromArray:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)processCommitError:(id)a3 andFinalizeError:(id)a4 forUploadBatchContainer:(id)a5 withUploadTracker:(id)a6 inLibrary:(id)a7
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  unint64_t v38 = (unint64_t)a3;
  unint64_t v40 = (unint64_t)a4;
  id v42 = a5;
  id v35 = a6;
  id v54 = a7;
  id v48 = [MEMORY[0x1E4F1CA60] dictionary];
  v39 = [v42 batch];
  if (v38 | v40)
  {
    if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:")|| +[PLCloudPhotoLibraryManager needResetSyncErrorType:v40])
    {
      unsigned int v37 = 1;
LABEL_5:
      unsigned int v43 = 1;
      goto LABEL_23;
    }
    if ([v39 count])
    {
      if ([v42 wasFixed] & 1) != 0 || (objc_msgSend(v42, "wasSplit"))
      {
        uint64_t v12 = (unsigned char *)MEMORY[0x1E4F59AC0];
        if (!*MEMORY[0x1E4F59AC0])
        {
          v13 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = [v42 retryCount];
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Batch retry count: %d", buf, 8u);
          }
        }
        if ([v42 wasSplit] && objc_msgSend(v42, "retryCount"))
        {
          if (!*v12)
          {
            v14 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              int v15 = [v42 retryCount];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v15;
              _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Batch exceeded max retry count: %d for permanent failure, marking as failed", buf, 8u);
            }
          }
          unsigned int v37 = 0;
          goto LABEL_5;
        }
        v16 = [v42 batchesSplitForError];
        [(PLCloudBatchUploader *)self _pushBatches:v16];
      }
      else
      {
        [(PLCloudBatchUploader *)self _push:v42];
        [v42 setWasFixed:1];
        [v42 incrementRetryCount];
      }
    }
  }
  unsigned int v37 = 0;
  unsigned int v43 = 0;
LABEL_23:
  v52 = [MEMORY[0x1E4F1CA48] array];
  v50 = [MEMORY[0x1E4F1CA48] array];
  v51 = [MEMORY[0x1E4F1CA48] array];
  v49 = [MEMORY[0x1E4F1CA48] array];
  v47 = [MEMORY[0x1E4F1CA48] array];
  v46 = [MEMORY[0x1E4F1CA48] array];
  v45 = [MEMORY[0x1E4F1CA48] array];
  v44 = [MEMORY[0x1E4F1CA48] array];
  v41 = [MEMORY[0x1E4F1CA48] array];
  v36 = [MEMORY[0x1E4F1CA48] array];
  v53 = [MEMORY[0x1E4F1CA48] array];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v17 = [v39 records];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v77 objects:v85 count:16];
  int v19 = v43 | ((v38 | v40) == 0);
  if (v18)
  {
    uint64_t v20 = *(void *)v78;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v78 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v77 + 1) + 8 * v21);
        if ((v19 & [v22 supportsResources]) == 1) {
          [(PLCloudBatchUploader *)self _cleanUploadedResources:v22 inLibrary:v54];
        }
        v23 = [v22 scopedIdentifier];
        v24 = [v23 identifier];
        if (v24)
        {
          if ([v22 changeType] == 1024)
          {
            [v53 addObject:v22];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v52 addObject:v23];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v51 addObject:v24];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v50 addObject:v23];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v49 addObject:v24];
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (+[PLUserFeedback shouldHandleCPLSuggestionChange:v22])
                      {
                        [v46 addObject:v24];
                      }
                      else
                      {
                        [v47 addObject:v24];
                      }
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v45 addObject:v24];
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v44 addObject:v24];
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [v41 addObject:v24];
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              [v36 addObject:v24];
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          v25 = [NSString stringWithFormat:@"Missing identifier for change %@, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32789330", objc_opt_class(), v35];
          PLSimulateCrash();
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v26 = [v17 countByEnumeratingWithState:&v77 objects:v85 count:16];
      uint64_t v18 = v26;
    }
    while (v26);
  }

  uint64_t v27 = 0;
  *(void *)buf = 0;
  v82 = buf;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  if (((v37 | v19 ^ 1) & 1) == 0)
  {
    if (v43) {
      __int16 v28 = 2;
    }
    else {
      __int16 v28 = 1;
    }
    if ((v43 & 1) == 0
      && objc_msgSend(v53, "count", 0)
      && [(NSMutableDictionary *)self->_recordsToDelete count])
    {
      [(PLCloudBatchUploader *)self _clearSuccessfullyPushedDeletedRecords:v53];
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __112__PLCloudBatchUploader_processCommitError_andFinalizeError_forUploadBatchContainer_withUploadTracker_inLibrary___block_invoke;
    v55[3] = &unk_1E5862048;
    id v56 = v51;
    id v57 = v54;
    __int16 v71 = v28;
    id v58 = v49;
    id v59 = v47;
    id v60 = v46;
    id v61 = v45;
    id v62 = v41;
    id v63 = v36;
    id v64 = v52;
    v69 = buf;
    v70 = &v73;
    id v65 = v50;
    char v72 = v43;
    id v66 = v35;
    id v67 = v48;
    id v68 = v44;
    [v57 performTransactionAndWait:v55];

    uint64_t v27 = *((void *)v82 + 3);
  }
  v29 = [NSNumber numberWithUnsignedInteger:v27];
  [v48 setValue:v29 forKey:@"pushedPhotoCount"];

  v30 = [NSNumber numberWithUnsignedInteger:v74[3]];
  [v48 setValue:v30 forKey:@"pushedVideoCount"];

  v31 = [NSNumber numberWithBool:v37];
  [v48 setValue:v31 forKey:@"resetSyncNeeded"];

  v32 = [NSNumber numberWithBool:(v38 | v40) != 0];
  [v48 setValue:v32 forKey:@"hadError"];

  v33 = [NSNumber numberWithBool:v43];
  [v48 setObject:v33 forKey:@"hadPermanentError"];

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(buf, 8);

  return v48;
}

void __112__PLCloudBatchUploader_processCommitError_andFinalizeError_forUploadBatchContainer_withUploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  +[PLGenericAlbum albumsWithCloudGUIDs:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v182 objects:v200 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v183;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v183 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v182 + 1) + 8 * i);
        unsigned __int16 v7 = [v6 cloudLocalState];
        int v8 = *(unsigned __int16 *)(a1 + 152);
        if (v8 != v7)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v9 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              id v10 = [v6 cloudGUID];
              int v11 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v10;
              __int16 v190 = 1024;
              LODWORD(v191) = v11;
              _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Album %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v8) = *(_WORD *)(a1 + 152);
          }
          [v6 setCloudLocalState:(__int16)v8];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v182 objects:v200 count:16];
    }
    while (v3);
  }

  +[PLMemory memoriesWithUUIDs:*(void *)(a1 + 48) inPhotoLibrary:*(void *)(a1 + 40)];
  long long v178 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  id v140 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v140 countByEnumeratingWithState:&v178 objects:v199 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v179;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v179 != v14) {
          objc_enumerationMutation(v140);
        }
        v16 = *(void **)(*((void *)&v178 + 1) + 8 * j);
        unsigned __int16 v17 = [v16 cloudLocalState];
        int v18 = *(unsigned __int16 *)(a1 + 152);
        if (v18 != v17)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            int v19 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              id v20 = [v16 uuid];
              int v21 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v20;
              __int16 v190 = 1024;
              LODWORD(v191) = v21;
              _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Memory %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v18) = *(_WORD *)(a1 + 152);
          }
          [v16 setCloudLocalState:(__int16)v18];
        }
      }
      uint64_t v13 = [v140 countByEnumeratingWithState:&v178 objects:v199 count:16];
    }
    while (v13);
  }

  +[PLSuggestion suggestionsWithUUIDs:*(void *)(a1 + 56) inPhotoLibrary:*(void *)(a1 + 40)];
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id v139 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v139 countByEnumeratingWithState:&v174 objects:v198 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v175;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v175 != v24) {
          objc_enumerationMutation(v139);
        }
        uint64_t v26 = *(void **)(*((void *)&v174 + 1) + 8 * k);
        unsigned __int16 v27 = [v26 cloudLocalState];
        int v28 = *(unsigned __int16 *)(a1 + 152);
        if (v28 != v27)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v29 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              id v30 = [v26 uuid];
              int v31 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v30;
              __int16 v190 = 1024;
              LODWORD(v191) = v31;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "Suggestion %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v28) = *(_WORD *)(a1 + 152);
          }
          [v26 setCloudLocalState:(__int16)v28];
        }
      }
      uint64_t v23 = [v139 countByEnumeratingWithState:&v174 objects:v198 count:16];
    }
    while (v23);
  }

  uint64_t v32 = *(void *)(a1 + 64);
  v33 = [*(id *)(a1 + 40) managedObjectContext];
  v34 = +[PLUserFeedback userFeedbacksWithUUIDs:v32 inManagedObjectContext:v33];

  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v138 = v34;
  uint64_t v35 = [v138 countByEnumeratingWithState:&v170 objects:v197 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v171;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v171 != v37) {
          objc_enumerationMutation(v138);
        }
        v39 = *(void **)(*((void *)&v170 + 1) + 8 * m);
        unsigned __int16 v40 = [v39 cloudLocalState];
        int v41 = *(unsigned __int16 *)(a1 + 152);
        if (v41 != v40)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v42 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              id v43 = [v39 uuid];
              int v44 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v43;
              __int16 v190 = 1024;
              LODWORD(v191) = v44;
              _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEBUG, "User Feedback %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v41) = *(_WORD *)(a1 + 152);
          }
          [v39 setCloudLocalState:(__int16)v41];
        }
      }
      uint64_t v36 = [v138 countByEnumeratingWithState:&v170 objects:v197 count:16];
    }
    while (v36);
  }

  uint64_t v45 = *(void *)(a1 + 72);
  v46 = [*(id *)(a1 + 40) managedObjectContext];
  v47 = +[PLPerson personsWithUUIDs:v45 inManagedObjectContext:v46];

  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v137 = v47;
  uint64_t v48 = [v137 countByEnumeratingWithState:&v166 objects:v196 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v167;
    do
    {
      for (uint64_t n = 0; n != v49; ++n)
      {
        if (*(void *)v167 != v50) {
          objc_enumerationMutation(v137);
        }
        v52 = *(void **)(*((void *)&v166 + 1) + 8 * n);
        unsigned __int16 v53 = [v52 cloudLocalState];
        int v54 = *(unsigned __int16 *)(a1 + 152);
        if (v54 != v53)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v55 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              id v56 = [v52 personUUID];
              int v57 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v56;
              __int16 v190 = 1024;
              LODWORD(v191) = v57;
              _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEBUG, "Person %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v54) = *(_WORD *)(a1 + 152);
          }
          [v52 setCloudLocalState:(__int16)v54];
        }
      }
      uint64_t v49 = [v137 countByEnumeratingWithState:&v166 objects:v196 count:16];
    }
    while (v49);
  }

  uint64_t v58 = *(void *)(a1 + 80);
  id v59 = [*(id *)(a1 + 40) managedObjectContext];
  id v60 = +[PLShare shareWithScopeIdentifiers:v58 includeTrashed:1 inManagedObjectContext:v59];

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v136 = v60;
  uint64_t v61 = [v136 countByEnumeratingWithState:&v162 objects:v195 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v163;
    do
    {
      for (iuint64_t i = 0; ii != v62; ++ii)
      {
        if (*(void *)v163 != v63) {
          objc_enumerationMutation(v136);
        }
        id v65 = *(void **)(*((void *)&v162 + 1) + 8 * ii);
        unsigned __int16 v66 = [v65 cloudLocalState];
        int v67 = *(unsigned __int16 *)(a1 + 152);
        if (v67 != v66)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v68 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              id v69 = [v65 uuid];
              int v70 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v69;
              __int16 v190 = 1024;
              LODWORD(v191) = v70;
              _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEBUG, "Library Scope %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v67) = *(_WORD *)(a1 + 152);
          }
          [v65 setCloudLocalState:(__int16)v67];
        }
      }
      uint64_t v62 = [v136 countByEnumeratingWithState:&v162 objects:v195 count:16];
    }
    while (v62);
  }

  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v71 = *(id *)(a1 + 88);
  uint64_t v72 = [v71 countByEnumeratingWithState:&v158 objects:v194 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v159;
    do
    {
      for (juint64_t j = 0; jj != v73; ++jj)
      {
        if (*(void *)v159 != v74) {
          objc_enumerationMutation(v71);
        }
        uint64_t v76 = *(void **)(*((void *)&v158 + 1) + 8 * jj);
        long long v77 = [*(id *)(a1 + 40) managedObjectContext];
        long long v78 = +[PLGraphNode graphNodeWithUUID:v76 inManagedObjectContext:v77];

        if (v78)
        {
          long long v79 = +[PLGraphNodeContainer newNodeContainerWithNode:v78];
          unsigned __int16 v80 = [v79 cloudLocalState];
          int v81 = *(unsigned __int16 *)(a1 + 152);
          if (v81 != v80)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v82 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                id v83 = [v79 uuid];
                int v84 = *(__int16 *)(a1 + 152);
                *(_DWORD *)buf = 138412546;
                id v189 = v83;
                __int16 v190 = 1024;
                LODWORD(v191) = v84;
                _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_DEBUG, "Social Group %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
              }
              LOWORD(v81) = *(_WORD *)(a1 + 152);
            }
            [v79 setCloudLocalState:(__int16)v81];
          }
        }
        else
        {
          if (*MEMORY[0x1E4F59AC0]) {
            goto LABEL_95;
          }
          long long v79 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v189 = v76;
            _os_log_impl(&dword_19B3C7000, v79, OS_LOG_TYPE_DEBUG, "PLCloudBatchUploader nil social group node with UUID: %@", buf, 0xCu);
          }
        }

LABEL_95:
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v158 objects:v194 count:16];
    }
    while (v73);
  }

  v85 = [MEMORY[0x1E4F1CA80] set];
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id v86 = *(id *)(a1 + 96);
  uint64_t v87 = [v86 countByEnumeratingWithState:&v154 objects:v193 count:16];
  if (!v87)
  {

    goto LABEL_123;
  }
  uint64_t v89 = v87;
  char v90 = 0;
  uint64_t v91 = *(void *)v155;
  *(void *)&long long v88 = 138412546;
  long long v135 = v88;
  do
  {
    for (kuint64_t k = 0; kk != v89; ++kk)
    {
      if (*(void *)v155 != v91) {
        objc_enumerationMutation(v86);
      }
      v93 = *(void **)(*((void *)&v154 + 1) + 8 * kk);
      v94 = +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v93, *(void *)(a1 + 40), 1, v135);
      v95 = v94;
      if (v94)
      {
        [v94 setUploadAttempts:0];
        [v95 setLastUploadAttemptDate:0];
        unsigned __int16 v96 = [v95 cloudLocalState];
        int v97 = *(unsigned __int16 *)(a1 + 152);
        if (v97 != v96)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v98 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
            {
              id v99 = [v95 cloudAssetGUID];
              int v100 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = v135;
              id v189 = v99;
              __int16 v190 = 1024;
              LODWORD(v191) = v100;
              _os_log_impl(&dword_19B3C7000, v98, OS_LOG_TYPE_DEBUG, "Asset %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v97) = *(_WORD *)(a1 + 152);
          }
          [v95 setCloudLocalState:(__int16)v97];
          v90 |= *(_WORD *)(a1 + 152) == 2;
        }
        if ([v95 shouldIncludeInCPLCounts])
        {
          char v101 = [v95 isPhoto];
          uint64_t v102 = a1 + 136;
          if ((v101 & 1) != 0 || (v103 = [v95 isVideo], uint64_t v102 = a1 + 144, v103)) {
            ++*(void *)(*(void *)(*(void *)v102 + 8) + 24);
          }
        }
        +[PLCPLFacePushSupport markSyncableFacesAsPushedInAsset:v95];
        v104 = [v95 allAssetCPLResources];
        [v85 unionSet:v104];
      }
      else
      {
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_118;
        }
        v104 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v189 = v93;
          _os_log_impl(&dword_19B3C7000, v104, OS_LOG_TYPE_ERROR, "Failed to find asset %@ in pushed assets", buf, 0xCu);
        }
      }

LABEL_118:
    }
    uint64_t v89 = [v86 countByEnumeratingWithState:&v154 objects:v193 count:16];
  }
  while (v89);

  if (v90)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.failedtopush", 0, 0, 0);
  }
LABEL_123:
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v106 = *(id *)(a1 + 104);
  uint64_t v107 = [v106 countByEnumeratingWithState:&v150 objects:v192 count:16];
  if (!v107) {
    goto LABEL_150;
  }
  uint64_t v108 = v107;
  uint64_t v109 = *(void *)v151;
  while (2)
  {
    uint64_t v110 = 0;
    while (2)
    {
      if (*(void *)v151 != v109) {
        objc_enumerationMutation(v106);
      }
      v111 = *(void **)(*((void *)&v150 + 1) + 8 * v110);
      v112 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v111 prefetchResources:0 inLibrary:*(void *)(a1 + 40)];
      v113 = v112;
      if (v112)
      {
        if (*(unsigned __int16 *)(a1 + 152) != (unsigned __int16)[v112 cloudLocalState])
        {
          if ([v113 cloudLocalState] == 3)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v114 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v189 = v113;
                _os_log_impl(&dword_19B3C7000, v114, OS_LOG_TYPE_DEBUG, "Master %@ was uploaded before, leaving the state as Uploaded", buf, 0xCu);
              }
            }
          }
          else
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v116 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
              {
                v117 = @"Failed";
                if (*(_WORD *)(a1 + 152) == 1) {
                  v117 = @"Pushed";
                }
                *(_DWORD *)buf = 138412546;
                id v189 = v113;
                __int16 v190 = 2112;
                v191 = v117;
                _os_log_impl(&dword_19B3C7000, v116, OS_LOG_TYPE_DEBUG, "Master %@ was pushed, marking cloudLocalState to %@", buf, 0x16u);
              }
            }
            [v113 setCloudLocalState:*(__int16 *)(a1 + 152)];
          }
        }
        v115 = [v113 allMasterResources];
        [v85 unionSet:v115];
        if (*(unsigned char *)(a1 + 154))
        {
          [*(id *)(a1 + 112) stopTrackingMaster:v113];
          [*(id *)(a1 + 120) setObject:MEMORY[0x1E4F1CC38] forKey:@"changedTotalSizeOfUnpushedOriginal"];
        }
        goto LABEL_147;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        v115 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v189 = v111;
          _os_log_impl(&dword_19B3C7000, v115, OS_LOG_TYPE_ERROR, "Failed to find master %@ in pushed masters", buf, 0xCu);
        }
LABEL_147:
      }
      if (v108 != ++v110) {
        continue;
      }
      break;
    }
    uint64_t v108 = [v106 countByEnumeratingWithState:&v150 objects:v192 count:16];
    if (v108) {
      continue;
    }
    break;
  }
LABEL_150:

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v118 = v85;
  uint64_t v119 = [v118 countByEnumeratingWithState:&v146 objects:v187 count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    uint64_t v121 = *(void *)v147;
    do
    {
      for (muint64_t m = 0; mm != v120; ++mm)
      {
        if (*(void *)v147 != v121) {
          objc_enumerationMutation(v118);
        }
        v123 = *(void **)(*((void *)&v146 + 1) + 8 * mm);
        if (*(unsigned __int16 *)(a1 + 152) != (unsigned __int16)[v123 cloudLocalState]
          && [v123 cloudLocalState] != 3)
        {
          [v123 setCloudLocalState:*(__int16 *)(a1 + 152)];
        }
      }
      uint64_t v120 = [v118 countByEnumeratingWithState:&v146 objects:v187 count:16];
    }
    while (v120);
  }

  +[PLFaceCrop faceCropsWithUUIDs:*(void *)(a1 + 128) inPhotoLibrary:*(void *)(a1 + 40)];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v124 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v125 = [v124 countByEnumeratingWithState:&v142 objects:v186 count:16];
  if (v125)
  {
    uint64_t v126 = v125;
    uint64_t v127 = *(void *)v143;
    do
    {
      for (nuint64_t n = 0; nn != v126; ++nn)
      {
        if (*(void *)v143 != v127) {
          objc_enumerationMutation(v124);
        }
        v129 = *(void **)(*((void *)&v142 + 1) + 8 * nn);
        unsigned __int16 v130 = [v129 cloudLocalState];
        int v131 = *(unsigned __int16 *)(a1 + 152);
        if (v131 != v130)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v132 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
            {
              id v133 = [v129 uuid];
              int v134 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              id v189 = v133;
              __int16 v190 = 1024;
              LODWORD(v191) = v134;
              _os_log_impl(&dword_19B3C7000, v132, OS_LOG_TYPE_DEBUG, "faceCrop %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);
            }
            LOWORD(v131) = *(_WORD *)(a1 + 152);
          }
          [v129 setCloudLocalState:(__int16)v131];
        }
      }
      uint64_t v126 = [v124 countByEnumeratingWithState:&v142 objects:v186 count:16];
    }
    while (v126);
  }
}

- (void)_clearSuccessfullyPushedDeletedRecords:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) scopedIdentifier];
        id v10 = [v9 identifier];

        objc_opt_class();
        int v11 = @"RKVersion";
        if (objc_opt_isKindOfClass()) {
          goto LABEL_12;
        }
        objc_opt_class();
        int v11 = @"RKMaster";
        if (objc_opt_isKindOfClass()) {
          goto LABEL_12;
        }
        objc_opt_class();
        int v11 = @"RKMemory";
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), int v11 = @"RKPerson", (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), int v11 = @"RKFaceCrop", (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), int v11 = @"RKAlbum", (objc_opt_isKindOfClass() & 1) != 0))
        {
LABEL_12:
          if ([(PLCloudBatchUploader *)self _updateDeletionRecordListForKey:v11 removingRecordID:v10])
          {
            BOOL v6 = 1;
          }
          else if ([(__CFString *)v11 isEqualToString:@"RKAlbum"])
          {
            BOOL v6 = [(PLCloudBatchUploader *)self _updateDeletionRecordListForKey:@"RKFolder" removingRecordID:v10];
          }
          else
          {
            BOOL v6 = 0;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v5);
    if (v6)
    {
      uint64_t v12 = [(NSMutableDictionary *)self->_recordsToDelete count];
      uint64_t v13 = (unsigned char *)MEMORY[0x1E4F59AC0];
      if (v12)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v14 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            recordsToDeletePlistPath = self->_recordsToDeletePlistPath;
            int v16 = [(NSMutableDictionary *)self->_recordsToDelete count];
            *(_DWORD *)buf = 138543618;
            int v31 = recordsToDeletePlistPath;
            __int16 v32 = 1026;
            LODWORD(v33) = v16;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Updating %{public}@: still has %{public}d records", buf, 0x12u);
          }
        }
        [(NSMutableDictionary *)self->_recordsToDelete writeToFile:self->_recordsToDeletePlistPath atomically:1];
        goto LABEL_37;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        unsigned __int16 v17 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = self->_recordsToDeletePlistPath;
          *(_DWORD *)buf = 138543362;
          int v31 = v18;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Deleting %{public}@", buf, 0xCu);
        }
      }
      int v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v20 = self->_recordsToDeletePlistPath;
      id v25 = 0;
      [v19 removeItemAtPath:v20 error:&v25];
      id v21 = v25;

      if (v21)
      {
        if (*v13)
        {
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v22 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = self->_recordsToDeletePlistPath;
          *(_DWORD *)buf = 138543618;
          int v31 = v23;
          __int16 v32 = 2114;
          id v33 = v21;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v22 = self->_recordsToDeletePlistPath;
        self->_recordsToDeletePlistPath = 0;
      }

      goto LABEL_36;
    }
  }
LABEL_37:
}

- (BOOL)_updateDeletionRecordListForKey:(id)a3 removingRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSMutableDictionary *)self->_recordsToDelete objectForKey:v6];
  if ([v8 count] && objc_msgSend(v8, "containsObject:", v7))
  {
    [v8 removeObject:v7];
    if (![v8 count]) {
      [(NSMutableDictionary *)self->_recordsToDelete removeObjectForKey:v6];
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_processRepushAlbumError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 orderKeyManager:(id)a6 inLibrary:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v18 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v14;
      __int16 v39 = 2112;
      id v40 = v15;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to repush these albums", buf, 0x20u);
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __100__PLCloudBatchUploader__processRepushAlbumError_inUploadBatch_forRecords_orderKeyManager_inLibrary___block_invoke;
  v25[3] = &unk_1E5862020;
  id v19 = v15;
  id v26 = v19;
  id v20 = v17;
  SEL v32 = a2;
  id v27 = v20;
  long long v28 = self;
  id v21 = v16;
  id v29 = v21;
  int v31 = &v33;
  id v22 = v14;
  id v30 = v22;
  [v20 performBlockAndWait:v25];
  BOOL v23 = *((unsigned char *)v34 + 24) != 0;

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __100__PLCloudBatchUploader__processRepushAlbumError_inUploadBatch_forRecords_orderKeyManager_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "scopeIdentifier", (void)v16);
        BOOL v9 = [*(id *)(a1 + 40) mainScopeIdentifier];
        char v10 = [v8 isEqualToString:v9];

        if ((v10 & 1) == 0)
        {
          id v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 48) file:@"PLCloudBatchUploader.m" lineNumber:2082 description:@"albums are only supported in main scope"];
        }
        int v11 = [v7 identifier];
        uint64_t v12 = +[PLGenericAlbum albumWithCloudGUID:v11 inLibrary:*(void *)(a1 + 40)];

        if (!v12)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v15 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v21 = v7;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Can't generate CPLRecordChange for album %@, forcing a reset sync", buf, 0xCu);
            }
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          goto LABEL_20;
        }
        id v13 = [v12 cplAlbumChangeInPhotoLibrary:*(void *)(a1 + 40) orderKeyManager:*(void *)(a1 + 56)];
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          [*(id *)(a1 + 64) removeRecordWithScopedIdentifier:v7];
          if (v13) {
            [*(id *)(a1 + 64) addRecord:v13];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_20:
}

- (void)_processGenerateDerivativesCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v12;
      __int16 v35 = 2112;
      id v36 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to re-generate derivatives", buf, 0x20u);
    }
  }
  id v25 = v10;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = objc_msgSend(v11, "records", v11);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v21 = [v20 scopedIdentifier];
        int v22 = [v12 containsObject:v21];

        if (v22)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v23 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v20;
              _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Re-generating derivatives for record %@", buf, 0xCu);
            }
          }
          [(PLCloudBatchUploader *)self _addLocalResourcesToRecord:v20 inLibrary:v13];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }
}

- (void)tryToFixCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 uploadTracker:(id)a6 orderKeyManager:(id)a7 inLibrary:(id)a8
{
  id v43 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  long long v19 = [v15 objectForKey:@"regenerateDerivativeError"];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    id v21 = [v15 objectForKey:@"regenerateDerivativeError"];
    [(PLCloudBatchUploader *)self _processGenerateDerivativesCommitError:v43 inUploadBatch:v14 forRecords:v21 inLibrary:v18];
  }
  int v22 = [v15 objectForKey:@"needMasterError"];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    uint64_t v24 = [v15 objectForKey:@"needMasterError"];
    [(PLCloudBatchUploader *)self _processIncludeMasterCommitError:v43 inUploadBatch:v14 forRecords:v24 inLibrary:v18];
  }
  id v25 = [v15 objectForKey:@"needFullChangeError"];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    long long v27 = [v15 objectForKey:@"needFullChangeError"];
    [(PLCloudBatchUploader *)self _processChangeToFullRecordCommitError:v43 inUploadBatch:v14 forRecords:v27 inLibrary:v18];
  }
  long long v28 = [v15 objectForKey:@"repushAlbumError"];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    id v30 = [v15 objectForKey:@"repushAlbumError"];
    [(PLCloudBatchUploader *)self _processRepushAlbumError:v43 inUploadBatch:v14 forRecords:v30 orderKeyManager:v17 inLibrary:v18];
  }
  int v31 = [v15 objectForKey:@"quarantinedRecordError"];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    __int16 v33 = [v15 objectForKey:@"quarantinedRecordError"];
    [(PLCloudBatchUploader *)self _processQuarantineRecordsCommitError:v43 inUploadBatch:v14 forRecords:v33 uploadTracker:v16 inLibrary:v18];
  }
  id v34 = [v15 objectForKey:@"invalidScopeError"];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    id v36 = [v15 objectForKey:@"invalidScopeError"];
    [(PLCloudBatchUploader *)self _processInvalidScopeCommitError:v43 inUploadBatch:v14 forRecords:v36 inLibrary:v18];
  }
  uint64_t v37 = [v15 objectForKey:@"invalidResourceCopySourceError"];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    __int16 v39 = [v15 objectForKey:@"invalidResourceCopySourceError"];
    [(PLCloudBatchUploader *)self _processInvalidResourceCopySourceCommitError:v43 inUploadBatch:v14 forRecords:v39 orderKeyManager:v17 inLibrary:v18];
  }
  id v40 = [v15 objectForKey:@"invalidExpungeableResourceTypes"];
  uint64_t v41 = [v40 count];

  if (v41)
  {
    id v42 = [v15 objectForKey:@"invalidExpungeableResourceTypes"];
    [(PLCloudBatchUploader *)self _processInvalidExpungeableResourceTypesCommitError:v43 inUploadBatch:v14 forRecords:v42 inLibrary:v18];
  }
}

- (void)_addLocalResourcesToRecord:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke;
  v12[3] = &unk_1E5873A50;
  id v13 = v6;
  id v14 = v7;
  id v15 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke_198;
  v10[3] = &unk_1E5875CE0;
  id v11 = v13;
  id v8 = v13;
  id v9 = v7;
  [v9 performTransactionAndWait:v12 completionHandler:v10];
}

void __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) scopedIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v2 prefetchResources:0 inLibrary:*(void *)(a1 + 40)];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 assets];
      id v6 = [v5 anyObject];

      if (v6)
      {
        uint64_t v7 = [v6 createResourcesForMaster:v4 shouldGenerateDerivatives:*(unsigned __int8 *)(*(void *)(a1 + 48) + 33) inPhotoLibrary:*(void *)(a1 + 40)];
        if (v7)
        {
          id v8 = v7;
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v9 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v10 = *(void *)(a1 + 32);
              int v17 = 138412546;
              id v18 = v8;
              __int16 v19 = 2112;
              uint64_t v20 = v10;
              _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Setting master resources %@ to record %@", (uint8_t *)&v17, 0x16u);
            }
          }
          [*(id *)(a1 + 32) setResources:v8];
        }
        else
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v16 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              int v17 = 138412290;
              id v18 = v4;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unable to create master resources for %@", (uint8_t *)&v17, 0xCu);
            }
          }
          id v8 = 0;
        }
      }
      else
      {
        if (*MEMORY[0x1E4F59AC0])
        {
          id v6 = 0;
          goto LABEL_36;
        }
        id v8 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138412290;
          id v18 = v4;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unable to find any asset for cloudMaster %@", (uint8_t *)&v17, 0xCu);
        }
      }

LABEL_36:
LABEL_37:

      goto LABEL_38;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v6 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      int v17 = 138412290;
      id v18 = v2;
      id v15 = "Unable to find cloudMaster with scopedIdentifier %@";
LABEL_29:
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
      goto LABEL_36;
    }
    goto LABEL_39;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = +[PLManagedAsset assetWithScopedIdentifier:v2 inLibrary:*(void *)(a1 + 40) prefetchResources:1];
    uint64_t v4 = v11;
    if (v11)
    {
      id v6 = [v11 createResourcesForAssetInPhotoLibrary:*(void *)(a1 + 40) shouldGenerateDerivatives:*(unsigned __int8 *)(*(void *)(a1 + 48) + 33)];
      if (!*MEMORY[0x1E4F59AC0])
      {
        id v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          int v17 = 138412546;
          id v18 = v6;
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Setting asset resources %@ to record %@", (uint8_t *)&v17, 0x16u);
        }
      }
      [*(id *)(a1 + 32) setResources:v6];
      goto LABEL_36;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v6 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      int v17 = 138412290;
      id v18 = v2;
      id v15 = "Unable to find asset with scopedIdentifier %@";
      goto LABEL_29;
    }
LABEL_39:
    uint64_t v4 = 0;
    goto LABEL_37;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v14 = *(NSObject **)(a1 + 32);
      int v17 = 138412290;
      id v18 = v14;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Incorrect record type to re-generate derivatives for record: %@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_38:
}

void __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke_198(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = objc_msgSend(*(id *)(a1 + 32), "resources", 0);
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
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setCanGenerateDerivative:0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_processInvalidExpungeableResourceTypesCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Received error while uploading batch: %@ forRecords: %@ : Error: %@. We need to repush the full master record.", buf, 0x20u);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __110__PLCloudBatchUploader__processInvalidExpungeableResourceTypesCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E5875BF8;
  id v19 = v11;
  id v20 = v12;
  uint64_t v21 = self;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v15 performTransactionAndWait:v18];
}

void __110__PLCloudBatchUploader__processInvalidExpungeableResourceTypesCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  v47 = [MEMORY[0x1E4F1CA80] set];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) records];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v77;
    long long v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
    uint64_t v48 = v3;
    uint64_t v49 = a1;
    uint64_t v50 = *(void *)v77;
    do
    {
      uint64_t v8 = 0;
      uint64_t v51 = v5;
      do
      {
        if (*(void *)v77 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v76 + 1) + 8 * v8);
        v55 = [v9 scopedIdentifier];
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:"))
        {
          id v10 = [*(id *)(a1 + 48) _getLocalRecordFromCPLRecord:v9 inLibrary:*(void *)(a1 + 56)];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v52 = v10;
            uint64_t v53 = v8;
            id v11 = v10;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v54 = v11;
            id v12 = [v11 assets];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v86 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v73;
LABEL_10:
              uint64_t v16 = 0;
              while (1)
              {
                if (*(void *)v73 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(void **)(*((void *)&v72 + 1) + 8 * v16);
                if ((int)[v17 uploadAttempts] >= 3) {
                  break;
                }
                [v17 incrementUploadAttempts];
                if (v14 == ++v16)
                {
                  uint64_t v14 = [v12 countByEnumeratingWithState:&v72 objects:v86 count:16];
                  if (v14) {
                    goto LABEL_10;
                  }
                  goto LABEL_16;
                }
              }
              if (!*v7)
              {
                id v20 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v21 = [v54 scopedIdentifier];
                  *(_DWORD *)buf = 138412290;
                  v85 = v21;
                  _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Exceeded max invalid expungeable resource master repush attempts for cloud master: %@", buf, 0xCu);
                }
              }

              [v2 addObject:v55];
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v22 = [v54 assets];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v83 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v69;
                do
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v69 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    __int16 v27 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                    id v28 = [v27 scopedIdentifier];
                    if (v28)
                    {
                      if (!*v7)
                      {
                        uint64_t v29 = __CPLAssetsdOSLogDomain();
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v85 = v28;
                          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Removing CPLAssetChange %@ from batch", buf, 0xCu);
                        }
                      }
                      [v2 addObject:v28];
                    }
                    else if (!*v7)
                    {
                      id v30 = __CPLAssetsdOSLogDomain();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v85 = v27;
                        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Asset with nil scopedIdentifier %@", buf, 0xCu);
                      }
                    }
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v83 count:16];
                }
                while (v24);
              }

              [v54 setCloudLocalState:2];
              long long v66 = 0u;
              long long v67 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              int v31 = [v54 allMasterResources];
              uint64_t v32 = [v31 countByEnumeratingWithState:&v64 objects:v82 count:16];
              uint64_t v3 = v48;
              a1 = v49;
              uint64_t v5 = v51;
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v34 = *(void *)v65;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v65 != v34) {
                      objc_enumerationMutation(v31);
                    }
                    [*(id *)(*((void *)&v64 + 1) + 8 * j) setCloudLocalState:2];
                  }
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v64 objects:v82 count:16];
                }
                while (v33);
              }

              uint64_t v6 = v50;
              id v10 = v52;
              if (!*v7)
              {
                id v18 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v55;
                  _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Removing CPLMasterChange %@ from batch and marking cloud master as CPLPushFailed", buf, 0xCu);
                }
                goto LABEL_51;
              }
            }
            else
            {
LABEL_16:

              id v18 = [v54 cplFullRecord];
              [v2 addObject:v55];
              [v47 addObject:v18];
              if (*v7)
              {
                uint64_t v6 = v50;
                uint64_t v5 = v51;
                id v10 = v52;
              }
              else
              {
                id v19 = __CPLAssetsdOSLogDomain();
                id v10 = v52;
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v55;
                  _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Repushing full master record for cloud master %@", buf, 0xCu);
                }

                uint64_t v6 = v50;
                uint64_t v5 = v51;
              }
LABEL_51:
            }
            uint64_t v8 = v53;
          }
        }
        ++v8;
      }
      while (v8 != v5);
      uint64_t v36 = [v3 countByEnumeratingWithState:&v76 objects:v87 count:16];
      uint64_t v5 = v36;
    }
    while (v36);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = v2;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(a1 + 32) removeRecordWithScopedIdentifier:*(void *)(*((void *)&v60 + 1) + 8 * k)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v60 objects:v81 count:16];
    }
    while (v39);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v42 = v47;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v80 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v57;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(v42);
        }
        [*(id *)(a1 + 32) addRecord:*(void *)(*((void *)&v56 + 1) + 8 * m)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v80 count:16];
    }
    while (v44);
  }
}

- (void)_processInvalidResourceCopySourceCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 orderKeyManager:(id)a6 inLibrary:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v17 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Received error while uploading batch: %@ forRecords: %@ : Error: %@. We need to check if the source resources exists.", buf, 0x20u);
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __120__PLCloudBatchUploader__processInvalidResourceCopySourceCommitError_inUploadBatch_forRecords_orderKeyManager_inLibrary___block_invoke;
  v22[3] = &unk_1E5870618;
  id v23 = v16;
  id v24 = v13;
  id v25 = v14;
  id v26 = self;
  id v27 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  [v21 performTransactionAndWait:v22];
}

void __120__PLCloudBatchUploader__processInvalidResourceCopySourceCommitError_inUploadBatch_forRecords_orderKeyManager_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v103 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v99 = +[PLManagedAsset isComputeSyncEnabledForDirection:0 library:*(void *)(a1 + 32)];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v100 = a1;
  uint64_t v3 = [*(id *)(a1 + 40) records];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v122 objects:v134 count:16];
  uint64_t v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  uint64_t v91 = (void *)v2;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v123;
    char v90 = v3;
    uint64_t v92 = *(void *)v123;
    do
    {
      uint64_t v8 = 0;
      uint64_t v93 = v6;
      do
      {
        if (*(void *)v123 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v122 + 1) + 8 * v8);
        id v10 = [v9 scopedIdentifier];
        if ([*(id *)(v100 + 48) containsObject:v10])
        {
          id v11 = [*(id *)(v100 + 56) _getLocalRecordFromCPLRecord:v9 inLibrary:*(void *)(v100 + 32)];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v97 = v10;
            v94 = v11;
            uint64_t v96 = v8;
            id v12 = v11;
            if ([v12 isPlaceholderAsset])
            {
              if ((int)[v12 uploadAttempts] < 2)
              {
                if (!*v5)
                {
                  uint64_t v36 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    id v37 = [v12 scopedIdentifier];
                    *(_DWORD *)buf = 138412290;
                    unsigned __int16 v130 = v37;
                    _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Will attempt to repush source asset for placeholder asset: %@", buf, 0xCu);
                  }
                }
                id v15 = v103;
                id v16 = v12;
              }
              else
              {
                if (!*v5)
                {
                  id v13 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    id v14 = [v12 scopedIdentifier];
                    *(_DWORD *)buf = 138412290;
                    unsigned __int16 v130 = v14;
                    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Exceeded max invalid resource repush attempts for placeholder asset: %@", buf, 0xCu);
                  }
                }
                [v102 addObject:v12];
                id v15 = (void *)v2;
                id v16 = v97;
              }
              goto LABEL_53;
            }
            goto LABEL_54;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v97 = v10;
            v94 = v11;
            uint64_t v96 = v8;
            id v17 = v11;
            if ([v17 placeholderState] != 1) {
              goto LABEL_54;
            }
            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id v18 = [v17 assets];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v118 objects:v133 count:16];
            if (!v19)
            {

              uint64_t v7 = v92;
              uint64_t v6 = v93;
              goto LABEL_54;
            }
            uint64_t v20 = v19;
            char v21 = 0;
            uint64_t v22 = *(void *)v119;
            while (1)
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v119 != v22) {
                  objc_enumerationMutation(v18);
                }
                id v24 = *(void **)(*((void *)&v118 + 1) + 8 * v23);
                if ([v24 isPlaceholderAsset])
                {
                  if ((int)[v24 uploadAttempts] < 2)
                  {
                    if (*v5)
                    {
                      __int16 v30 = v103;
                    }
                    else
                    {
                      id v27 = __CPLAssetsdOSLogDomain();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                      {
                        id v31 = [v24 scopedIdentifier];
                        *(_DWORD *)buf = 138412290;
                        unsigned __int16 v130 = v31;
                        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Will attempt to repush source asset for placeholder asset: %@", buf, 0xCu);

                        uint64_t v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
                      }
                      __int16 v30 = v103;
LABEL_35:
                    }
                  }
                  else
                  {
                    if (!*v5)
                    {
                      id v25 = __CPLAssetsdOSLogDomain();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                      {
                        id v26 = [v24 scopedIdentifier];
                        *(_DWORD *)buf = 138412290;
                        unsigned __int16 v130 = v26;
                        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Exceeded max invalid resource repush attempts for placeholder asset: %@", buf, 0xCu);
                      }
                      if (!*v5)
                      {
                        id v27 = __CPLAssetsdOSLogDomain();
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                        {
                          id v28 = [v24 scopedIdentifier];
                          id v29 = [v17 scopedIdentifier];
                          *(_DWORD *)buf = 138412546;
                          unsigned __int16 v130 = v28;
                          __int16 v131 = 2112;
                          v132 = v29;
                          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Removing placeholder asset %@ that is associated with removed placeholder master %@", buf, 0x16u);

                          uint64_t v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
                        }
                        char v21 = 1;
                        __int16 v30 = v102;
                        goto LABEL_35;
                      }
                    }
                    char v21 = 1;
                    __int16 v30 = v102;
                  }
                  [v30 addObject:v24];
                }
                ++v23;
              }
              while (v20 != v23);
              uint64_t v32 = [v18 countByEnumeratingWithState:&v118 objects:v133 count:16];
              uint64_t v20 = v32;
              if (!v32)
              {

                uint64_t v3 = v90;
                uint64_t v2 = (uint64_t)v91;
                uint64_t v7 = v92;
                uint64_t v6 = v93;
                if (v21)
                {
                  if (!*v5)
                  {
                    id v33 = __CPLAssetsdOSLogDomain();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v34 = [v17 scopedIdentifier];
                      *(_DWORD *)buf = 138412290;
                      unsigned __int16 v130 = v34;
                      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Removing placeholder master %@, since its source resource can't be found", buf, 0xCu);
                    }
                  }
                  uint64_t v35 = [*(id *)(v100 + 32) managedObjectContext];
                  [v35 deleteObject:v17];

                  uint64_t v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
                  id v15 = v91;
                  id v16 = v97;
LABEL_53:
                  [v15 addObject:v16];
                }
LABEL_54:
                id v11 = v94;

                uint64_t v8 = v96;
                id v10 = v97;
                break;
              }
            }
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v38 = [v3 countByEnumeratingWithState:&v122 objects:v134 count:16];
      uint64_t v6 = v38;
    }
    while (v38);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  obuint64_t j = v102;
  uint64_t v39 = [obj countByEnumeratingWithState:&v114 objects:v128 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v115 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        if (!*v5)
        {
          uint64_t v44 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            uint64_t v45 = [v43 scopedIdentifier];
            *(_DWORD *)buf = 138412290;
            unsigned __int16 v130 = v45;
            _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Removing placeholder asset %@, since its source resource can't be found", buf, 0xCu);
          }
        }
        [v43 setDestinationAssetCopyStateOnSourceAsset:0xFFFFFFFFLL];
        v46 = +[PLAssetTransactionReason transactionReason:@"Deleting placeholder asset since its source resource can't be found"];
        [v43 deleteWithReason:v46];

        uint64_t v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v114 objects:v128 count:16];
    }
    while (v40);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v47 = v91;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v110 objects:v127 count:16];
  uint64_t v49 = v100;
  if (v48)
  {
    uint64_t v50 = v48;
    uint64_t v51 = *(void *)v111;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v111 != v51) {
          objc_enumerationMutation(v47);
        }
        [*(id *)(v100 + 40) removeRecordWithScopedIdentifier:*(void *)(*((void *)&v110 + 1) + 8 * j)];
      }
      uint64_t v50 = [v47 countByEnumeratingWithState:&v110 objects:v127 count:16];
    }
    while (v50);
  }
  v95 = v47;

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v98 = v103;
  uint64_t v53 = [v98 countByEnumeratingWithState:&v106 objects:v126 count:16];
  id v54 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v53)
  {
    uint64_t v55 = v53;
    uint64_t v56 = *(void *)v107;
    do
    {
      for (uint64_t k = 0; k != v55; ++k)
      {
        if (*(void *)v107 != v56) {
          objc_enumerationMutation(v98);
        }
        long long v58 = *(void **)(*((void *)&v106 + 1) + 8 * k);
        long long v59 = [v58 fetchSourceAssetForDuplicationIfExists];
        if (v59)
        {
          if (!*v54)
          {
            long long v60 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              long long v61 = [v59 scopedIdentifier];
              *(_DWORD *)buf = 138412290;
              unsigned __int16 v130 = v61;
              _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_DEFAULT, "Regenerating asset resources for source asset %@ and adding to currentUploadBatch", buf, 0xCu);
            }
          }
          long long v62 = [v59 master];
          uint64_t v63 = [v62 scopedIdentifier];

          v105 = (void *)v63;
          long long v64 = [v59 cplAssetChangeWithMasterScopedIdentifier:v63 withChangeType:8 shouldGenerateDerivatives:0 orderKeyManager:*(void *)(v49 + 64) computeSyncUploadEnabled:v99 inLibrary:*(void *)(v49 + 32)];
          long long v65 = *(void **)(v49 + 40);
          long long v66 = [v64 scopedIdentifier];
          [v65 removeRecordWithScopedIdentifier:v66];

          if (v64) {
            [*(id *)(v49 + 40) addRecord:v64];
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v67 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              long long v68 = [v58 scopedIdentifier];
              *(_DWORD *)buf = 138412290;
              unsigned __int16 v130 = v68;
              _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "Removing placeholder records from currentUploadBatch and deleting master %@", buf, 0xCu);
            }
          }
          v104 = v64;
          long long v69 = [v58 master];
          long long v70 = *(void **)(v49 + 40);
          long long v71 = [v58 scopedIdentifier];
          [v70 removeRecordWithScopedIdentifier:v71];

          long long v72 = *(void **)(v49 + 40);
          long long v73 = [v69 scopedIdentifier];
          [v72 removeRecordWithScopedIdentifier:v73];

          if (v69)
          {
            [v58 setMaster:0];
            long long v74 = [*(id *)(v49 + 32) managedObjectContext];
            [v74 deleteObject:v69];
          }
          BOOL v75 = +[PLManagedAsset attemptToRecreateMasterAndAssetResourcesForPlaceholderAssetRepush:v58 sourceAsset:v59 library:*(void *)(v49 + 32)];
          id v54 = (unsigned char *)MEMORY[0x1E4F59AC0];
          if (v75)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              long long v76 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                long long v77 = [v58 scopedIdentifier];
                *(_DWORD *)buf = 138412290;
                unsigned __int16 v130 = v77;
                _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_DEFAULT, "Recreating master for placeholder asset %@ and adding master record to currentUploadBatch", buf, 0xCu);

                id v54 = (unsigned char *)MEMORY[0x1E4F59AC0];
              }
            }
            uint64_t v78 = [v58 cplMasterChangeInLibrary:*(void *)(v49 + 32) shouldGenerateDerivatives:0];
            uint64_t v79 = v49;
            unsigned __int16 v80 = v78;
            if (v78) {
              [*(id *)(v79 + 40) addRecord:v78];
            }
            if (!*v54)
            {
              int v81 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
              {
                v82 = [v58 scopedIdentifier];
                *(_DWORD *)buf = 138412290;
                unsigned __int16 v130 = v82;
                _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_DEFAULT, "Recreating asset record for placeholder asset %@ and adding to currentUploadBatch", buf, 0xCu);
              }
            }
            uint64_t v83 = v55;
            uint64_t v84 = v56;
            v85 = [v58 master];
            id v86 = [v85 scopedIdentifier];

            uint64_t v87 = [v58 cplAssetChangeWithMasterScopedIdentifier:v86 withChangeType:0 shouldGenerateDerivatives:0 orderKeyManager:*(void *)(v100 + 64) computeSyncUploadEnabled:v99 inLibrary:*(void *)(v100 + 32)];
            if (v87) {
              [*(id *)(v100 + 40) addRecord:v87];
            }

            id v54 = (unsigned char *)MEMORY[0x1E4F59AC0];
            uint64_t v56 = v84;
            uint64_t v55 = v83;
            goto LABEL_113;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            unsigned __int16 v80 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              uint64_t v88 = [v58 scopedIdentifier];
              uint64_t v89 = [v59 scopedIdentifier];
              *(_DWORD *)buf = 138412546;
              unsigned __int16 v130 = v88;
              __int16 v131 = 2112;
              v132 = v89;
              _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_ERROR, "Failed to recreate resources on placeholder asset %@, source asset %@ can't be found", buf, 0x16u);

              id v54 = (unsigned char *)MEMORY[0x1E4F59AC0];
            }
LABEL_113:

            uint64_t v49 = v100;
          }
          [v58 incrementUploadAttempts];
        }
      }
      uint64_t v55 = [v98 countByEnumeratingWithState:&v106 objects:v126 count:16];
    }
    while (v55);
  }
}

- (void)_processInvalidScopeCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to push the scope.", buf, 0x20u);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__PLCloudBatchUploader__processInvalidScopeCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E5875BF8;
  id v19 = v11;
  id v20 = v12;
  char v21 = self;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v15 performTransactionAndWait:v18];
}

void __91__PLCloudBatchUploader__processInvalidScopeCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  __int16 v25 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) records];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v9 = [v8 scopedIdentifier];
        if ([*(id *)(a1 + 40) containsObject:v9])
        {
          id v10 = [*(id *)(a1 + 48) _getLocalRecordFromCPLRecord:v8 inLibrary:*(void *)(a1 + 56)];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v11 = [v10 momentShare];
            id v12 = v11;
            if (v11 && [v11 status] == 1)
            {
              id v13 = [v12 cplScopeChange];
              [v25 addObject:v13];

LABEL_18:
              goto LABEL_19;
            }
          }
          else
          {
            id v12 = 0;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v14 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v10;
              _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Can't find moment share for %@, marking it as CPLPushFailed", buf, 0xCu);
            }
          }
          [v10 setCloudLocalState:2];
          [v2 addObject:v9];
          goto LABEL_18;
        }
LABEL_19:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v5);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v2;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(a1 + 32) removeRecordWithScopedIdentifier:*(void *)(*((void *)&v30 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v17);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = v25;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(a1 + 32) addRecord:*(void *)(*((void *)&v26 + 1) + 8 * k)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v22);
  }
}

- (void)_processQuarantineRecordsCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 uploadTracker:(id)a6 inLibrary:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v32 = a6;
  id v31 = a7;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v44 = v13;
      __int16 v45 = 2112;
      id v46 = v14;
      __int16 v47 = 2112;
      id v48 = v12;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to quarantine records", buf, 0x20u);
    }
  }
  long long v30 = v12;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = [v13 records];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    char v19 = 0;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v23 = [v22 scopedIdentifier];
        if ([v14 containsObject:v23])
        {
          [(PLCloudBatchUploader *)self quarantineRecord:v22 uploadTracker:v32 inLibrary:v31];
          char v19 = 1;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v18);
  }
  else
  {
    char v19 = 0;
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v14;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        [v13 removeRecordWithScopedIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * j)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v26);
  }

  if (v19)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.quarantined", 0, 0, 0);
  }
}

- (void)_quarantineObject:(id)a3 uploadTracker:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v8 setCloudLocalState:4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v8;
    uint64_t v7 = v6;
    if (v6 && [v6 isPlaceholderAsset]) {
      [v7 setDestinationAssetCopyStateOnSourceAsset:0xFFFFFFFFLL];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 stopTrackingMaster:v8];
    }
  }
}

- (void)quarantineRecord:(id)a3 uploadTracker:(id)a4 inLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PLCloudBatchUploader_quarantineRecord_uploadTracker_inLibrary___block_invoke;
  v14[3] = &unk_1E5875BF8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [v12 performTransaction:v14];
}

void __65__PLCloudBatchUploader_quarantineRecord_uploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _getLocalRecordFromCPLRecord:*(void *)(a1 + 40) inLibrary:*(void *)(a1 + 48)];
  if (v2)
  {
    [*(id *)(a1 + 32) _quarantineObject:v2 uploadTracker:*(void *)(a1 + 56)];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        uint64_t v7 = v2;
        uint64_t v4 = "Local object is quarantined: %@";
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v5;
      uint64_t v4 = "Can't find local object to quarantine for record: %@";
      goto LABEL_8;
    }
LABEL_9:
  }
}

- (void)_processIncludeMasterCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      id v47 = v10;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to include the missing master.", buf, 0x20u);
    }
  }
  id v16 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  id v17 = [MEMORY[0x1E4F1CA80] setWithSet:v12];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v47) = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __92__PLCloudBatchUploader__processIncludeMasterCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v35[3] = &unk_1E58741B0;
  id v18 = v11;
  id v36 = v18;
  id v19 = v12;
  id v37 = v19;
  id v20 = v13;
  id v38 = v20;
  long long v39 = self;
  id v42 = buf;
  uint64_t v21 = v16;
  long long v40 = v21;
  id v22 = v17;
  id v41 = v22;
  [v20 performTransactionAndWait:v35];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.quarantined", 0, 0, 0);
  }
  if ([v22 count] && !*v14)
  {
    id v24 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v44 = 138412290;
      id v45 = v22;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Can't find some records to include master for: %@", v44, 0xCu);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v25 = v19;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(v18, "removeRecordWithScopedIdentifier:", *(void *)(*((void *)&v31 + 1) + 8 * i), (void)v31);
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v26);
  }

  uploadBatchArray = self->_uploadBatchArray;
  long long v30 = [(PLCloudPhotoLibraryBatchManager *)v21 drainBatches];
  [(NSMutableArray *)uploadBatchArray addObjectsFromArray:v30];

  _Block_object_dispose(buf, 8);
}

void __92__PLCloudBatchUploader__processIncludeMasterCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) records];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v33;
    uint64_t v7 = off_1E585E000;
    *(void *)&long long v4 = 138412290;
    long long v28 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        id v10 = objc_msgSend(v9, "scopedIdentifier", v28);
        if ([*(id *)(v1 + 40) containsObject:v10])
        {
          id v11 = [(__objc2_class *)v7[401] assetWithScopedIdentifier:v10 inLibrary:*(void *)(v1 + 48) prefetchResources:0];
          id v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 master];
            if (!v13) {
              goto LABEL_16;
            }
            id v14 = (void *)v13;
            [v12 master];
            uint64_t v15 = v1;
            id v16 = v7;
            uint64_t v17 = v6;
            v19 = id v18 = v2;
            long long v30 = v12;
            int v20 = [v19 cloudLocalState];

            uint64_t v2 = v18;
            uint64_t v6 = v17;
            uint64_t v7 = v16;
            uint64_t v1 = v15;
            uint64_t v5 = v29;

            BOOL v21 = v20 == 4;
            id v12 = v30;
            if (!v21)
            {
LABEL_16:
              id v24 = [v12 cplMasterChangeInLibrary:*(void *)(v1 + 48) shouldGenerateDerivatives:1];
              if (v24)
              {
                [*(id *)(v1 + 64) addRecord:v24];
                [*(id *)(v1 + 64) addRecord:v9];
              }
              else
              {
                if (!*MEMORY[0x1E4F59AC0])
                {
                  uint64_t v26 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    [v12 cloudAssetGUID];
                    uint64_t v27 = v31 = v12;
                    *(_DWORD *)buf = v28;
                    id v37 = v27;
                    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Can't find/create master for record %@, marking as failed", buf, 0xCu);

                    id v12 = v31;
                  }
                }
                [v12 setCloudLocalState:2];
              }
              goto LABEL_26;
            }
            if (!*MEMORY[0x1E4F59AC0])
            {
              id v22 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                uint64_t v23 = [v30 cloudAssetGUID];
                *(_DWORD *)buf = v28;
                id v37 = v23;
                _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Master was quarantined, also quarantine the asset %@", buf, 0xCu);

                id v12 = v30;
              }
            }
            [*(id *)(v1 + 56) _quarantineObject:v12 uploadTracker:0];
            *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            id v24 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = [0 cloudAssetGUID];
              *(_DWORD *)buf = v28;
              id v37 = v25;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Can't find asset for record %@", buf, 0xCu);

              id v12 = 0;
            }
LABEL_26:
          }
          [*(id *)(v1 + 72) removeObject:v10];
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }
}

- (void)_processChangeToFullRecordCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need change the upload type to a full record.", buf, 0x20u);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__PLCloudBatchUploader__processChangeToFullRecordCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E5875BF8;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = self;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v15 performTransactionAndWait:v18];
}

void __97__PLCloudBatchUploader__processChangeToFullRecordCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) records];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v38;
    uint64_t v8 = (unsigned char *)MEMORY[0x1E4F59AC0];
    *(void *)&long long v5 = 138412290;
    long long v27 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "scopedIdentifier", v27);
        if ([*(id *)(a1 + 40) containsObject:v11])
        {
          id v12 = [*(id *)(a1 + 48) _getLocalRecordFromCPLRecord:v10 inLibrary:*(void *)(a1 + 56)];
          id v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 cplFullRecord];
            if (v14)
            {
              id v15 = v14;
              [v28 addObject:v14];
              goto LABEL_13;
            }
            if (!*v8)
            {
              id v16 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v27;
                id v44 = v13;
                _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Can't create full record type for %@, marking it as CPLPushFailed", buf, 0xCu);
              }
            }
            [v13 setCloudLocalState:2];
          }
          else if (!*v8)
          {
            id v15 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              id v44 = v11;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Can't find local object to create full record type: %@", buf, 0xCu);
            }
LABEL_13:
          }
          [v2 addObject:v11];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v6);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v2;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(a1 + 32) removeRecordWithScopedIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v28;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(a1 + 32) addRecord:*(void *)(*((void *)&v29 + 1) + 8 * k)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v24);
  }
}

- (id)_getLocalRecordFromCPLRecord:(id)a3 inLibrary:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 scopedIdentifier];
  uint64_t v8 = [v7 identifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = +[PLManagedAsset assetWithScopedIdentifier:v7 inLibrary:v6 prefetchResources:0];
LABEL_17:
    id v12 = (void *)v9;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v7 prefetchResources:0 inLibrary:v6];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = +[PLGenericAlbum albumWithCloudGUID:v8 inLibrary:v6];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v11 = +[PLFaceCrop faceCropsWithUUIDs:v10 inPhotoLibrary:v6];
    id v12 = [v11 firstObject];

LABEL_27:
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = +[PLMemory memoryWithUUID:v8 inPhotoLibrary:v6];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!+[PLUserFeedback shouldHandleCPLSuggestionChange:v5])
    {
      uint64_t v9 = +[PLSuggestion suggestionWithUUID:v8 inPhotoLibrary:v6];
      goto LABEL_17;
    }
    id v10 = [v6 managedObjectContext];
    id v13 = +[PLUserFeedback userFeedbackWithUUID:v8 inManagedObjectContext:v10];
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v6 managedObjectContext];
    id v13 = +[PLPerson personWithUUID:v8 inManagedObjectContext:v10];
LABEL_26:
    id v12 = v13;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [v6 managedObjectContext];
    id v10 = +[PLGraphNode graphNodeWithUUID:v8 inManagedObjectContext:v15];

    if (!v10)
    {
      id v12 = 0;
      goto LABEL_27;
    }
    id v13 = +[PLGraphNodeContainer newNodeContainerWithNode:v10];
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v6 managedObjectContext];
    id v13 = +[PLShare shareWithScopeIdentifier:v8 includeTrashed:1 inManagedObjectContext:v10];
    goto LABEL_26;
  }
  id v12 = 0;
LABEL_18:

  return v12;
}

- (void)_cleanUploadedResources:(id)a3 inLibrary:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v30 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v31 = v5;
  obuint64_t j = [v5 resources];
  uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (unsigned char *)MEMORY[0x1E4F59AC0];
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (!*v8)
        {
          id v12 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [v11 identity];
            uint64_t v14 = [v13 fileURL];
            id v15 = [v14 path];
            id v16 = objc_msgSend(MEMORY[0x1E4F59940], "descriptionForResourceType:", objc_msgSend(v11, "resourceType"));
            int v17 = [v11 deleteAfterUpload];
            *(_DWORD *)buf = 138412802;
            uint64_t v50 = v15;
            __int16 v51 = 2112;
            v52 = v16;
            __int16 v53 = 1024;
            int v54 = v17;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Checking: %@, type: %@ will delete after upload: %d", buf, 0x1Cu);

            uint64_t v8 = (unsigned char *)MEMORY[0x1E4F59AC0];
          }
        }
        if ([v11 deleteAfterUpload] && objc_msgSend(v11, "resourceType") != 1)
        {
          uint64_t v18 = [v11 identity];
          uint64_t v19 = [v18 fileURL];
          uint64_t v20 = [v19 path];

          BOOL v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          if ([v21 fileExistsAtPath:v20])
          {
            if (!*v8)
            {
              id v22 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v50 = v20;
                _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "removing %@ that was uploaded.", buf, 0xCu);
              }
            }
            id v44 = 0;
            char v23 = [v21 removeItemAtPath:v20 error:&v44];
            id v24 = v44;
            id v32 = v24;
            if (v23)
            {
              if (!*v8)
              {
                uint64_t v25 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v50 = v11;
                  __int16 v51 = 2112;
                  v52 = v20;
                  _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "removed uploaded resource for %@ at %@", buf, 0x16u);
                }
              }
              id v26 = [v11 itemScopedIdentifier];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v40[0] = MEMORY[0x1E4F143A8];
                v40[1] = 3221225472;
                v40[2] = __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke;
                v40[3] = &unk_1E5873A50;
                id v41 = v26;
                id v42 = v30;
                uint64_t v43 = v11;
                [v42 performTransactionAndWait:v40];

                long long v27 = v41;
                goto LABEL_32;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v34[0] = MEMORY[0x1E4F143A8];
                v34[1] = 3221225472;
                v34[2] = __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke_192;
                v34[3] = &unk_1E5870618;
                long long v35 = v26;
                id v28 = v30;
                id v36 = v28;
                long long v37 = v11;
                id v38 = v20;
                id v39 = v21;
                long long v29 = v28;
                uint64_t v8 = (unsigned char *)MEMORY[0x1E4F59AC0];
                [v29 performTransactionAndWait:v34];

                long long v27 = v35;
                goto LABEL_32;
              }
              if (!*v8)
              {
                long long v27 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v50 = v31;
                  _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "invalid item change to remove uploaded resources for %@", buf, 0xCu);
                }
LABEL_32:
              }
LABEL_33:

              id v24 = v32;
            }
            else if (!*v8)
            {
              id v26 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v50 = v20;
                _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "failed to remove derivative file %@", buf, 0xCu);
              }
              goto LABEL_33;
            }
          }
          continue;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v7);
  }
}

void __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithScopedIdentifier:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40) prefetchResources:1];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(v2, "assetResourceForCPLType:", objc_msgSend(*(id *)(a1 + 48), "resourceType"));
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 markAsNotLocallyAvailable];
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v6 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = *(void *)(a1 + 48);
          int v8 = 138412290;
          uint64_t v9 = v7;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "unable to find uploaded cloud resource %@", (uint8_t *)&v8, 0xCu);
        }
      }
      uint64_t v4 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "unable to find asset for uploaded resource %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke_192(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLCloudMaster cloudMasterWithScopedIdentifier:*(void *)(a1 + 32) prefetchResources:1 inLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(v2, "rm_cloudResourcesForResourceType:", objc_msgSend(*(id *)(a1 + 48), "resourceType"));
    if ([v3 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v19 = v3;
        uint64_t v20 = v2;
        uint64_t v7 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v23 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
            id v11 = [v9 fileURL];
            id v12 = [v11 path];

            if (([v12 isEqualToString:*(void *)(a1 + 56)] & 1) == 0)
            {
              id v13 = *(void **)(a1 + 64);
              id v21 = 0;
              char v14 = [v13 removeItemAtPath:v12 error:&v21];
              id v15 = v21;
              if ((v14 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
              {
                id v16 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v28 = v12;
                  _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "failed to remove derivative file %@ for duplicated asset", buf, 0xCu);
                }
              }
            }
            objc_msgSend(v9, "markAsNotLocallyAvailable", v19, v20);
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v6);
        uint64_t v3 = v19;
        uint64_t v2 = v20;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F59AC0])
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v4 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        id v28 = v18;
        __int16 v29 = 2112;
        id v30 = v2;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "unable to find uploaded cloud resource %@ in cloudMaster %@", buf, 0x16u);
      }
    }

    goto LABEL_25;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      id v28 = v17;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "unable to find cloud master for uploaded resource %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (void)uploadFullPhotoLibraryToCloud:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
  uint64_t v7 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  if ([MEMORY[0x1E4F59840] serverSupportsVision])
  {
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke;
    v70[3] = &unk_1E5873A50;
    id v71 = v4;
    long long v72 = self;
    long long v73 = v7;
    [v71 performBlockAndWait:v70];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount]
    && [MEMORY[0x1E4F59840] serverSupportsVision])
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2;
    v67[3] = &unk_1E5875E18;
    id v68 = v4;
    long long v69 = v7;
    [v68 performBlockAndWait:v67];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_176;
    v63[3] = &unk_1E5873A50;
    id v64 = v5;
    id v65 = v4;
    id v66 = v6;
    [v65 performBlockAndWait:v63];
  }
  uint64_t v8 = [v5 count];
  uint64_t v9 = v5;
  if (v8
    || ![(PLCloudPhotoLibraryBatchManager *)v7 isAboveMaximumResourceBudget]
    && [(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount] <= 49
    && (v10 = [v6 count], uint64_t v9 = v6, v10))
  {
    [(PLCloudBatchUploader *)self _processPendingObjects:v9 withBatchManager:v7 inLibrary:v4];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_177;
    v60[3] = &unk_1E5875E18;
    id v11 = v4;
    id v61 = v11;
    id v12 = v6;
    id v62 = v12;
    [v11 performTransactionAndWait:v60];
    if ([v12 count]) {
      [(PLCloudBatchUploader *)self _processPendingObjects:v12 withBatchManager:v7 inLibrary:v11];
    }
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount]
    && [MEMORY[0x1E4F59840] serverSupportsVision])
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_178;
    v56[3] = &unk_1E5873A50;
    id v57 = v4;
    long long v58 = self;
    long long v59 = v7;
    [v57 performBlockAndWait:v56];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_179;
    v53[3] = &unk_1E5875E18;
    id v54 = v4;
    uint64_t v55 = v7;
    [v54 performBlockAndWait:v53];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_182;
    v50[3] = &unk_1E5875E18;
    id v51 = v4;
    v52 = v7;
    [v51 performBlockAndWait:v50];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_185;
    v47[3] = &unk_1E5875E18;
    id v48 = v4;
    uint64_t v49 = v7;
    [v48 performBlockAndWait:v47];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_188;
    v44[3] = &unk_1E5875E18;
    id v45 = v4;
    long long v46 = v7;
    [v45 performBlockAndWait:v44];
  }
  if (![(PLCloudPhotoLibraryBatchManager *)v7 currentBatchCount])
  {
    id v13 = [v4 pathManager];
    char v14 = [v13 deletedMemoryUUIDsFilePath];

    id v15 = [v4 mainScopeIdentifier];
    id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v17 = v16;
    if (v14 && [v16 fileExistsAtPath:v14])
    {
      id v38 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v14];
      if ([v38 count])
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v18 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v75 = v38;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Syncing %@ memories deleted during migration", buf, 0xCu);
          }
        }
        id v32 = v17;
        long long v33 = v14;
        long long v34 = v6;
        long long v35 = self;
        id v36 = v5;
        id v37 = v4;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v19 = v38;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v78 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v41 != v22) {
                objc_enumerationMutation(v19);
              }
              long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v15 identifier:*(void *)(*((void *)&v40 + 1) + 8 * i)];
              long long v25 = (void *)[MEMORY[0x1E4F598D0] newDeleteChangeWithScopedIdentifier:v24];
              [(PLCloudPhotoLibraryBatchManager *)v7 addRecord:v25];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v78 count:16];
          }
          while (v21);
        }

        uint64_t v5 = v36;
        uint64_t v6 = v34;
        self = v35;
        int v17 = v32;
      }
      id v39 = 0;
      char v26 = objc_msgSend(v17, "removeItemAtPath:error:", v14, &v39, v32, v33, v34, v35, v36, v37);
      id v27 = v39;
      if ((v26 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
      {
        id v28 = v17;
        __int16 v29 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          BOOL v75 = v14;
          __int16 v76 = 2112;
          id v77 = v27;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
        }

        int v17 = v28;
      }
    }
  }
  uploadBatchArray = self->_uploadBatchArray;
  uint64_t v31 = [(PLCloudPhotoLibraryBatchManager *)v7 drainBatches];
  [(NSMutableArray *)uploadBatchArray addObjectsFromArray:v31];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] managedObjectContext];
  uint64_t v3 = +[PLPerson personsToUploadInManagedObjectContext:v2 limit:100];

  if (!*MEMORY[0x1E4F59AC0])
  {
    id v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = [v3 count];
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu pending people", buf, 0xCu);
    }
  }
  uint64_t v5 = [a1[5] _personsToUploadIncludingReverseOrderedMergeTargetsForPersons:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_173;
  v6[3] = &unk_1E586F978;
  id v7 = a1[6];
  [v5 enumerateObjectsUsingBlock:v6];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLFaceCrop faceCropsToUploadInPhotoLibrary:*(void *)(a1 + 32) limit:50];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = [v2 count];
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending faceCrops", buf, 0xCu);
    }
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_174;
  v4[3] = &unk_1E5861F80;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v4];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_176(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![a1[4] count])
  {
    uint64_t v2 = +[PLGenericAlbum albumsToUploadInitiallyInLibrary:a1[5] limit:100];
    [a1[4] addObjectsFromArray:v2];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [a1[4] count];
        int v9 = 134217984;
        uint64_t v10 = v4;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending albums", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  if (![a1[6] count])
  {
    id v5 = [a1[5] managedObjectContext];
    uint64_t v6 = +[PLManagedAsset assetsToUploadInitiallyInManagedObjectContext:v5 limit:100];

    [a1[6] addObjectsFromArray:v6];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [a1[6] count];
        int v9 = 134217984;
        uint64_t v10 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu pending assets", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_177(uint64_t a1)
{
  id v2 = +[PLManagedAsset assetsToRetryInLibrary:*(void *)(a1 + 32) limit:1];
  [*(id *)(a1 + 40) addObjectsFromArray:v2];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_178(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLDetectedFace syncableFacesToUploadInitiallyInLibrary:*(void *)(a1 + 32) limit:50];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = [v2 count];
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending syncable faces", buf, 0xCu);
    }
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v2;
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
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "associatedAssetForFaceOrTorso:orTemporal:", 1, 0, (void)v11);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    [*(id *)(a1 + 40) _processPendingObjects:v4 withBatchManager:*(void *)(a1 + 48) inLibrary:*(void *)(a1 + 32)];
  }
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_179(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLMemory memoriesToUploadInPhotoLibrary:*(void *)(a1 + 32) limit:100];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = [v2 count];
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending memories", buf, 0xCu);
    }
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_180;
  v4[3] = &unk_1E58666F0;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v4];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_182(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLSuggestion suggestionsToUploadInPhotoLibrary:*(void *)(a1 + 32) limit:100];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = [v2 count];
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending suggestions", buf, 0xCu);
    }
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_183;
  v4[3] = &unk_1E5861FA8;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v4];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_185(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[PLUserFeedback userFeedbacksToUploadInManagedObjectContext:v2 limit:100];

  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = [v3 count];
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu pending user feedbacks", buf, 0xCu);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_186;
  v5[3] = &unk_1E5861FD0;
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_188(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[PLSocialGroup socialGroupsToUploadInManagedObjectContext:v2 limit:50];

  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = [v3 count];
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu pending social groups", buf, 0xCu);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_190;
  v5[3] = &unk_1E5861FF8;
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_190(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 cplSocialGroupChange];
  [v2 addRecord:v3];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_186(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 cplSuggestionChange];
  [v2 addRecord:v3];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_183(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 cplSuggestionChange];
  [v2 addRecord:v3];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_180(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 cplMemoryChange];
  [v2 addRecord:v3];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_174(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 cplFaceCropChange];
  [v2 addRecord:v3];
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_173(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 cplPersonChange];
  [v2 addRecord:v3];
}

- (void)uploadDeletedRecordsFromPlist:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  if ([(NSMutableDictionary *)self->_recordsToDelete count]) {
    BOOL v7 = *MEMORY[0x1E4F59AC0] == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      recordsToDelete = self->_recordsToDelete;
      *(_DWORD *)buf = 138412290;
      long long v42 = recordsToDelete;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "recordsToDelete is not empty %@, overwriting it from file", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_recordsToDeletePlistPath, a3);
  char v26 = v5;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v5];
  long long v11 = self->_recordsToDelete;
  self->_recordsToDelete = v10;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = self->_recordsToDelete;
  uint64_t v29 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (([v13 isEqualToString:@"RKVersion"] & 1) != 0
          || ([v13 isEqualToString:@"RKAlbum"] & 1) != 0
          || ([v13 isEqualToString:@"RKFolder"] & 1) != 0
          || ([v13 isEqualToString:@"RKMaster"] & 1) != 0
          || ([v13 isEqualToString:@"RKMemory"] & 1) != 0
          || ([v13 isEqualToString:@"RKPerson"] & 1) != 0
          || [v13 isEqualToString:@"RKFaceCrop"])
        {
          uint64_t v30 = i;
          long long v14 = (objc_class *)objc_opt_class();
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v15 = [(NSMutableDictionary *)self->_recordsToDelete objectForKeyedSubscript:v13];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v32 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                id v21 = objc_alloc_init(v14);
                [v21 setChangeType:1024];
                uint64_t v22 = [(PLLibraryServicesManager *)self->_libraryServicesManager mainScopeIdentifier];
                long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v22 identifier:v20];
                [v21 setScopedIdentifier:v23];
                [(PLCloudPhotoLibraryBatchManager *)v6 addRecord:v21];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v17);
          }

          uint64_t i = v30;
        }
      }
      uint64_t v29 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v29);
  }

  uploadBatchArray = self->_uploadBatchArray;
  long long v25 = [(PLCloudPhotoLibraryBatchManager *)v6 drainBatches];
  [(NSMutableArray *)uploadBatchArray addObjectsFromArray:v25];
}

- (id)_personsToUploadIncludingReverseOrderedMergeTargetsForPersons:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
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
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x19F38D3B0]();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v8 reverseOrderedMergeTargetPersons];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if (![v15 cloudLocalState]) {
                [v4 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
          }
          while (v12);
        }

        [v4 addObject:v8];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v6);
  }

  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v16 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [obj valueForKey:@"personUUID"];
      uint64_t v18 = [v4 valueForKey:@"personUUID"];
      *(_DWORD *)buf = 138412546;
      long long v31 = v17;
      __int16 v32 = 2112;
      long long v33 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "All unpushed merge targets for %@: %@", buf, 0x16u);
    }
  }

  return v4;
}

- (void)_processPendingObjects:(id)a3 withBatchManager:(id)a4 inLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
  if ([v8 count])
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v8 objectAtIndex:v12];
      [v11 addObject:v13];

      if ((unint64_t)[v11 count] >= 0x32)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke;
        v21[3] = &unk_1E5875BF8;
        v21[4] = self;
        id v14 = v11;
        id v22 = v14;
        id v23 = v9;
        id v24 = v10;
        [v24 performTransactionAndWait:v21];
        [v14 removeAllObjects];
      }
      ++v12;
    }
    while ([v8 count] > v12);
  }
  if ([v11 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke_2;
    v17[3] = &unk_1E5875BF8;
    v17[4] = self;
    id v15 = v11;
    id v18 = v15;
    id v19 = v9;
    id v20 = v10;
    [v20 performTransactionAndWait:v17];
    [v15 removeAllObjects];
  }
}

uint64_t __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendOneBatch:*(void *)(a1 + 40) toBatchManager:*(void *)(a1 + 48) inLibrary:*(void *)(a1 + 56)];
}

uint64_t __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendOneBatch:*(void *)(a1 + 40) toBatchManager:*(void *)(a1 + 48) inLibrary:*(void *)(a1 + 56)];
}

- (void)_sendAssets:(id)a3 toBatchManager:(id)a4 orderKeyManager:(id)a5 inLibrary:(id)a6
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v90 = a5;
  uint64_t v91 = self;
  id v92 = a6;
  [(PLCloudBatchUploader *)self _incrementUploadAttemptsAndPushStateForAssets:v10];
  if (!*MEMORY[0x1E4F59AC0])
  {
    unint64_t v12 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v119 = v10;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "sending assets %@ to batch manager", buf, 0xCu);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v89 = +[PLManagedAsset isComputeSyncEnabledForDirection:0 library:v92];
  long long v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSObject count](v10, "count"));
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v111 objects:v122 count:16];
  if (!v14)
  {
    uint64_t v17 = 0;
    goto LABEL_92;
  }
  uint64_t v16 = v14;
  uint64_t v17 = 0;
  uint64_t v18 = *(void *)v112;
  *(void *)&long long v15 = 138543362;
  long long v68 = v15;
  uint64_t v69 = *(void *)v112;
  long long v70 = v13;
  while (2)
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v112 != v18) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(NSObject **)(*((void *)&v111 + 1) + 8 * v19);
      context = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v78 = v19;
      uint64_t v87 = (__CFString *)v20;
      if ([v20 isDeleted] & 1) == 0 && ([v20 complete])
      {
        char v110 = 0;
        uint64_t v21 = [v20 existingCloudMasterNeedsRepush:&v110];
        id v22 = v21;
        id v23 = v20;
        if (v110)
        {
          id v24 = [v21 cplPropertyRecord];
          [v11 addRecord:v24];

          id v23 = v20;
        }
        long long v25 = [v22 scopedIdentifier];
        if (v17)
        {
          long long v26 = [v17 scopedIdentifier];
          if ([v26 isEqual:v25]
            && ![v22 cloudLocalState])
          {
            uint64_t v51 = [v11 currentBatchCount];

            id v23 = v87;
            if (v51 < 200) {
              goto LABEL_20;
            }
          }
          else
          {

            id v23 = v87;
          }
        }
        if (([v11 isAboveMaximumResourceBudget] & 1) != 0 || objc_msgSend(v11, "currentBatchCount") > 49)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            __int16 v53 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEBUG, "Hit current upload batch limit, retry in the next loop.", buf, 2u);
            }
          }
          goto LABEL_92;
        }
LABEL_20:
        if (v22
          && ([v22 cloudLocalState]
           || ([v13 containsObject:v25] & 1) != 0))
        {
          long long v27 = v25;
        }
        else
        {
          uint64_t v31 = [v23 cplMasterChangeInLibrary:v92 shouldGenerateDerivatives:v91->_shouldGenerateDerivatives];
          if (!v31)
          {
            if (*MEMORY[0x1E4F59AC0])
            {
              long long v27 = v25;
            }
            else
            {
              long long v27 = v25;
              id v48 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                uint64_t v49 = [(__CFString *)v87 uuid];
                *(_DWORD *)buf = v68;
                long long v119 = v49;
                _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Failed to create master for asset %{public}@. Skipping upload.", buf, 0xCu);
              }
            }
            long long v35 = 0;
            goto LABEL_68;
          }
          __int16 v32 = v23;
          long long v33 = (void *)v31;
          long long v34 = [v32 master];

          long long v27 = [v34 scopedIdentifier];

          [v81 setObject:v33 forKey:v27];
          if (!v34)
          {
            long long v35 = 0;
            goto LABEL_69;
          }
          id v22 = v34;
        }
        long long v35 = v22;

        uint64_t v36 = v74;
        if ([v35 cloudLocalState] == 2)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v22 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              long long v119 = v35;
              __int16 v120 = 2112;
              long long v121 = v87;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "CloudMaster %@ failed to be uploaded, skip uploading asset %@.", buf, 0x16u);
            }
LABEL_67:
            uint64_t v17 = v35;
LABEL_68:

LABEL_69:
            if (*MEMORY[0x1E4F59AC0])
            {
LABEL_78:
              uint64_t v19 = v78;

              goto LABEL_79;
            }
            uint64_t v50 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v119 = v87;
              _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "Failed to add asset %@ to batch, will retry in the next round", buf, 0xCu);
            }
LABEL_77:

            goto LABEL_78;
          }
        }
        else
        {
          if (v27)
          {
            BOOL v75 = v35;
            v105[0] = MEMORY[0x1E4F143A8];
            v105[1] = 3221225472;
            v105[2] = __77__PLCloudBatchUploader__sendAssets_toBatchManager_orderKeyManager_inLibrary___block_invoke;
            v105[3] = &unk_1E5861F58;
            long long v106 = v92;
            long long v107 = v91;
            id v108 = v81;
            long long v27 = v27;
            long long v109 = v27;
            long long v37 = (void (**)(void, void))MEMORY[0x19F38D650](v105);
            id v38 = [v80 objectForKey:v27];
            if (!v38)
            {
              id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v80 setObject:v38 forKey:v27];
            }
            [v38 addObject:v87];
            id v39 = [(__CFString *)v87 cloudAssetGUID];
            if ([v39 length]) {
              [v74 addObject:v39];
            }
            long long v72 = v39;
            long long v35 = v75;
            if ([v13 indexOfObject:v27] == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v84 = v27;
              uint64_t v71 = v16;
              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              long long v40 = [v75 assets];
              uint64_t v41 = [v40 countByEnumeratingWithState:&v101 objects:v117 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v102;
                do
                {
                  for (uint64_t i = 0; i != v42; ++i)
                  {
                    if (*(void *)v102 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    id v45 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                    long long v46 = [v45 cloudAssetGUID];
                    if (([v36 containsObject:v46] & 1) == 0
                      && [obj indexOfObject:v45] == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if (!*MEMORY[0x1E4F59AC0])
                      {
                        long long v47 = __CPLAssetsdOSLogDomain();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          long long v119 = v87;
                          __int16 v120 = 2112;
                          long long v121 = v84;
                          _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_DEFAULT, "Found duplicate asset %@ for masterScopedIdentifier %@, adding to unsortedAsset", buf, 0x16u);
                        }

                        uint64_t v36 = v74;
                      }
                      [v38 addObject:v45];
                      ((void (**)(void, void *))v37)[2](v37, v45);
                    }
                  }
                  uint64_t v42 = [v40 countByEnumeratingWithState:&v101 objects:v117 count:16];
                }
                while (v42);
              }

              id v13 = v70;
              long long v27 = v84;
              [v70 addObject:v84];
              uint64_t v18 = v69;
              uint64_t v16 = v71;
              long long v35 = v75;
            }
            else
            {
              ((void (**)(void, __CFString *))v37)[2](v37, v87);
            }

            uint64_t v50 = v106;
            uint64_t v17 = v35;
            goto LABEL_77;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v22 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v119 = v87;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "No valid masterScopedIdentifier for asset %@. Skipping upload", buf, 0xCu);
            }
            long long v27 = 0;
            goto LABEL_67;
          }
          long long v27 = 0;
        }
        uint64_t v17 = v35;
        goto LABEL_78;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        long long v28 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = [v20 isDeleted];
          *(_DWORD *)buf = 138412546;
          uint64_t v30 = @"deleted";
          if (!v29) {
            uint64_t v30 = @"incomplete";
          }
          long long v119 = v20;
          __int16 v120 = 2112;
          long long v121 = v30;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Ignoring asset %@, since it's %@", buf, 0x16u);
        }

        uint64_t v19 = v78;
      }
LABEL_79:
      ++v19;
    }
    while (v19 != v16);
    uint64_t v52 = [obj countByEnumeratingWithState:&v111 objects:v122 count:16];
    uint64_t v16 = v52;
    if (v52) {
      continue;
    }
    break;
  }
LABEL_92:
  long long v73 = v17;

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v76 = v13;
  contexta = (void *)[v76 countByEnumeratingWithState:&v97 objects:v116 count:16];
  if (contexta)
  {
    uint64_t v79 = *(void *)v98;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v98 != v79) {
          objc_enumerationMutation(v76);
        }
        uint64_t v88 = v54;
        uint64_t v55 = *(void *)(*((void *)&v97 + 1) + 8 * v54);
        uint64_t v56 = objc_msgSend(v81, "objectForKey:", v55, v68);
        if (v56)
        {
          [v11 addRecord:v56];
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v57 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v119 = v56;
              _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_DEBUG, "Adding master %@ to initial batch", buf, 0xCu);
            }
          }
        }
        id v86 = (void *)v56;
        v85 = [v80 objectForKey:v55];
        long long v58 = [v85 sortedArrayUsingComparator:&__block_literal_global_518];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        uint64_t v59 = [v58 countByEnumeratingWithState:&v93 objects:v115 count:16];
        if (v59)
        {
          uint64_t v60 = v59;
          uint64_t v61 = *(void *)v94;
          do
          {
            for (uint64_t j = 0; j != v60; ++j)
            {
              if (*(void *)v94 != v61) {
                objc_enumerationMutation(v58);
              }
              uint64_t v63 = *(void **)(*((void *)&v93 + 1) + 8 * j);
              id v64 = [v63 cplAssetChangeWithMasterScopedIdentifier:v55 withChangeType:0 shouldGenerateDerivatives:v91->_shouldGenerateDerivatives orderKeyManager:v90 computeSyncUploadEnabled:v89 inLibrary:v92];
              [v11 addRecord:v64 ignoreBatchSize:1];
              if (!*MEMORY[0x1E4F59AC0])
              {
                id v65 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v119 = v64;
                  _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEBUG, "Adding asset %@ to initial batch", buf, 0xCu);
                }
              }
              id v66 = [v63 computeSyncAttributes];

              if (v66)
              {
                long long v67 = [v63 scopedIdentifier];
                [v11 addComputeSyncRelevantAsset:v67];
              }
            }
            uint64_t v60 = [v58 countByEnumeratingWithState:&v93 objects:v115 count:16];
          }
          while (v60);
        }

        uint64_t v54 = v88 + 1;
      }
      while ((void *)(v88 + 1) != contexta);
      contexta = (void *)[v76 countByEnumeratingWithState:&v97 objects:v116 count:16];
    }
    while (contexta);
  }
}

void __77__PLCloudBatchUploader__sendAssets_toBatchManager_orderKeyManager_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 cplMasterChangeInLibrary:*(void *)(a1 + 32) shouldGenerateDerivatives:*(unsigned __int8 *)(*(void *)(a1 + 40) + 33)];
  uint64_t v5 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 56)];
  if ([v3 isPhotoIris])
  {
    uint64_t v6 = 18;
  }
  else if ([v3 isRAWPlusJPEG])
  {
    uint64_t v6 = 17;
  }
  else
  {
    if (![v3 isRAWOnly]) {
      goto LABEL_13;
    }
    uint64_t v6 = 2;
  }
  if ([v4 hasResourceOfType:v6 notInMasterChange:v5])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      BOOL v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:v6];
        int v9 = 138412802;
        id v10 = v4;
        __int16 v11 = 2112;
        unint64_t v12 = v5;
        __int16 v13 = 2114;
        uint64_t v14 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Using duplicate master change %@ instead of %@ because it has an additional resource of type: %{public}@", (uint8_t *)&v9, 0x20u);
      }
    }
    [*(id *)(a1 + 48) setObject:v4 forKeyedSubscript:*(void *)(a1 + 56)];
  }
LABEL_13:
}

uint64_t __77__PLCloudBatchUploader__sendAssets_toBatchManager_orderKeyManager_inLibrary___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  if ([v6 isCloudPhotoLibraryAsset]
    && ![v7 isCloudPhotoLibraryAsset])
  {
    goto LABEL_7;
  }
  if (([v6 isCloudPhotoLibraryAsset] & 1) == 0
    && ([v7 isCloudPhotoLibraryAsset] & 1) != 0)
  {
LABEL_11:
    uint64_t v11 = 1;
    goto LABEL_19;
  }
  id v8 = [v6 cloudAssetGUID];
  if ([v8 length])
  {
    int v9 = [v7 cloudAssetGUID];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
LABEL_7:
      uint64_t v11 = -1;
      goto LABEL_19;
    }
  }
  else
  {
  }
  unint64_t v12 = [v6 cloudAssetGUID];
  if ([v12 length])
  {
    __int16 v13 = [v7 cloudAssetGUID];
    uint64_t v14 = [v13 length];

    if (!v14) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v15 = [v6 dateCreated];
  if (!v15) {
    goto LABEL_15;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = [v6 dateCreated];
  uint64_t v18 = [v7 dateCreated];
  uint64_t v11 = [v17 compare:v18];

  if (!v11)
  {
LABEL_15:
    uint64_t v19 = [v6 addedDate];
    if (v19)
    {
      id v20 = [v6 addedDate];
      uint64_t v21 = [v7 addedDate];
      uint64_t v11 = [v20 compare:v21];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
LABEL_19:

  return v11;
}

- (void)_sendAlbums:(id)a3 toBatchManager:(id)a4 orderKeyManager:(id)a5 inLibrary:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "album to upload = %@", buf, 0xCu);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    *(void *)&long long v17 = 138412290;
    long long v23 = v17;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v20), "cplAlbumChangeInPhotoLibrary:orderKeyManager:", v12, v11, v23, (void)v24);
        [v10 addRecord:v21];
        if (!*v13)
        {
          id v22 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            id v30 = v21;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Adding album %@ to initial batch", buf, 0xCu);
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)_sendOneBatch:(id)a3 toBatchManager:(id)a4 inLibrary:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  id v12 = objc_msgSend([v10 alloc], "initWithCapacity:", objc_msgSend(v11, "count"));
  __int16 v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  uint64_t v14 = [v9 libraryServicesManager];
  id v15 = [v14 databaseContext];

  uint64_t v16 = [PLRelationshipOrderKeyManager alloc];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__PLCloudBatchUploader__sendOneBatch_toBatchManager_inLibrary___block_invoke;
  v24[3] = &unk_1E5872390;
  id v25 = v15;
  id v17 = v15;
  uint64_t v18 = [(PLRelationshipOrderKeyManager *)v16 initWithGenerateContextBlock:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__PLCloudBatchUploader__sendOneBatch_toBatchManager_inLibrary___block_invoke_2;
  v21[3] = &unk_1E5861F30;
  id v19 = v13;
  id v22 = v19;
  id v20 = v12;
  id v23 = v20;
  [v11 enumerateObjectsUsingBlock:v21];

  if ([v20 count]) {
    [(PLCloudBatchUploader *)self _sendAlbums:v20 toBatchManager:v8 orderKeyManager:v18 inLibrary:v9];
  }
  if ([v19 count]) {
    [(PLCloudBatchUploader *)self _sendAssets:v19 toBatchManager:v8 orderKeyManager:v18 inLibrary:v9];
  }
}

uint64_t __63__PLCloudBatchUploader__sendOneBatch_toBatchManager_inLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (id)[*(id *)(a1 + 32) newShortLivedLibraryForOrderKeyManagerWithName:a2];
  return [v2 managedObjectContext];
}

void __63__PLCloudBatchUploader__sendOneBatch_toBatchManager_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
LABEL_5:
    [v4 addObject:v3];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Unsupported object %@ to be uploaded", (uint8_t *)&v6, 0xCu);
    }
  }
LABEL_10:
}

- (void)_incrementUploadAttemptsAndPushStateForAssets:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 photoLibrary];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PLCloudBatchUploader__incrementUploadAttemptsAndPushStateForAssets___block_invoke;
  v7[3] = &unk_1E5875CE0;
  id v8 = v3;
  id v6 = v3;
  [v5 performTransactionAndWait:v7];
}

void __70__PLCloudBatchUploader__incrementUploadAttemptsAndPushStateForAssets___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    char v5 = 0;
    uint64_t v6 = *(void *)v16;
    id v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
    *(void *)&long long v3 = 67109378;
    long long v14 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v1);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "incrementUploadAttempts", v14, (void)v15);
        id v10 = [MEMORY[0x1E4F1C9C8] date];
        [v9 setLastUploadAttemptDate:v10];

        if ((int)[v9 uploadAttempts] >= 10)
        {
          if (!*v7)
          {
            id v11 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              int v12 = [v9 uploadAttempts];
              *(_DWORD *)buf = v14;
              int v20 = v12;
              __int16 v21 = 2112;
              id v22 = v9;
              _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Retried %d time for asset %@, giving up", buf, 0x12u);
            }
          }
          if ([v9 cloudLocalState] != 2)
          {
            [v9 setCloudLocalState:2];
            char v5 = 1;
          }
        }
      }
      uint64_t v4 = [v1 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);

    if (v5)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.failedtopush", 0, 0, 0);
    }
  }
  else
  {
  }
}

- (BOOL)_hasUnuploadedResourceForAsset:(id)a3 resourceType:(unint64_t)a4 cloudMaster:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [a3 masterResourceForCPLType:a4];
  id v9 = v8;
  if (v8 && ![v8 cloudLocalState])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = objc_msgSend(v7, "assets", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) masterResourceForCPLType:a4];
          long long v17 = v16;
          if (v16 && [v16 cloudLocalState] == 3)
          {

            BOOL v10 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_15:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)createBatchesForChanges:(id)a3 outInsertedPhotoCount:(unint64_t *)a4 outInsertedVideoCount:(unint64_t *)a5 withUploadTracker:(id)a6 inLibrary:(id)a7
{
  uint64_t v356 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v252 = a6;
  id v11 = a7;
  uint64_t v12 = [v10 insertedAssets];
  uint64_t v13 = [v10 updatedAssets];
  v264 = [v10 deferredAssets];
  v226 = [v10 updatedMasters];
  v255 = [v10 propertyChangedAssetUuids];
  v247 = [v10 sharingPropertyChangedAssetUuids];
  v246 = [v10 adjustedAssetUuids];
  v245 = [v10 faceChangedAssetUuids];
  v244 = [v10 computeSyncChangedAssets];
  uint64_t v14 = [v10 insertedResources];
  v227 = [v10 updatedResources];
  uint64_t v15 = [v10 albumInserts];
  uint64_t v16 = [v10 albumChanges];
  v241 = [v10 memoryChanges];
  v235 = [v10 personChanges];
  v234 = [v10 faceCropChanges];
  v240 = [v10 suggestionChanges];
  v239 = [v10 userFeedbackChanges];
  v238 = [v10 libraryScopeChanges];
  v237 = [v10 socialGroupChanges];
  v236 = [v10 deletedRecords];
  v232 = v10;
  v243 = [v10 updatedRelationship];
  long long v17 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  long long v18 = [v11 libraryServicesManager];
  long long v19 = [v18 databaseContext];

  long long v20 = [PLRelationshipOrderKeyManager alloc];
  v335[0] = MEMORY[0x1E4F143A8];
  v335[1] = 3221225472;
  v335[2] = __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke;
  v335[3] = &unk_1E5872390;
  id v229 = v19;
  id v336 = v229;
  v257 = [(PLRelationshipOrderKeyManager *)v20 initWithGenerateContextBlock:v335];
  BOOL v256 = +[PLManagedAsset isComputeSyncEnabledForDirection:0 library:v11];
  v258 = self;
  v230 = (void *)v16;
  v231 = (void *)v15;
  v267 = v17;
  [(PLCloudBatchUploader *)self _processAlbumInserts:v15 albumChanges:v16 withBatchManager:v17 inLibrary:v11];
  if ([MEMORY[0x1E4F59840] serverSupportsVision])
  {
    long long v21 = (void *)MEMORY[0x19F38D3B0]();
    long long v22 = [(PLCloudBatchUploader *)self _personsToUploadIncludingReverseOrderedMergeTargetsForPersons:v235];
    id v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v22, "count"));
    v332[0] = MEMORY[0x1E4F143A8];
    v332[1] = 3221225472;
    v332[2] = __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke_2;
    v332[3] = &unk_1E586B368;
    id v24 = v23;
    id v333 = v24;
    v334 = v17;
    [v22 enumerateObjectsUsingBlock:v332];
  }
  v263 = v11;
  if ([MEMORY[0x1E4F59840] serverSupportsVision])
  {
    long long v331 = 0u;
    long long v330 = 0u;
    long long v329 = 0u;
    long long v328 = 0u;
    id v25 = v234;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v328 objects:v355 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v329;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v329 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v328 + 1) + 8 * i);
          uint64_t v31 = (void *)MEMORY[0x19F38D3B0]();
          __int16 v32 = [v30 cplFaceCropChange];
          [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v32];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v328 objects:v355 count:16];
      }
      while (v27);
    }

    id v11 = v263;
  }
  long long v33 = (void *)MEMORY[0x1E4F1CAD0];
  long long v34 = [v236 valueForKey:@"scopedIdentifier"];
  uint64_t v35 = [v33 setWithArray:v34];

  uint64_t v36 = [(PLCloudBatchUploader *)self _validateAssets:v12 fromCloudUuidDeleteList:v35];

  v228 = (void *)v35;
  v242 = [(PLCloudBatchUploader *)self _validateAssets:v13 fromCloudUuidDeleteList:v35];

  long long v327 = 0u;
  long long v326 = 0u;
  long long v325 = 0u;
  long long v324 = 0u;
  obuint64_t j = v14;
  uint64_t v37 = [obj countByEnumeratingWithState:&v324 objects:v354 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v325;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v325 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void **)(*((void *)&v324 + 1) + 8 * j);
        if ([v41 cplType] == 23 || objc_msgSend(v41, "cplType") == 24)
        {
          uint64_t v42 = [v41 asset];
          uint64_t v43 = [v42 master];

          if (v43)
          {
            id v44 = [v43 cplFullRecord];
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v44];
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v324 objects:v354 count:16];
    }
    while (v38);
  }

  long long v323 = 0u;
  long long v322 = 0u;
  long long v321 = 0u;
  long long v320 = 0u;
  id v45 = v264;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v320 objects:v353 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v321;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v321 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = [*(id *)(*((void *)&v320 + 1) + 8 * k) scopedIdentifier];
        [v252 trackDeferredAssetForScopedIdentifier:v50];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v320 objects:v353 count:16];
    }
    while (v47);
  }
  v233 = v45;

  long long v319 = 0u;
  long long v318 = 0u;
  long long v317 = 0u;
  long long v316 = 0u;
  id v254 = v36;
  id v261 = (id)[v254 countByEnumeratingWithState:&v316 objects:v352 count:16];
  if (v261)
  {
    uint64_t v259 = *(void *)v317;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v317 != v259) {
          objc_enumerationMutation(v254);
        }
        uint64_t v52 = *(NSObject **)(*((void *)&v316 + 1) + 8 * (void)v51);
        __int16 v53 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v54 = [v52 momentShare];
        uint64_t v55 = v54;
        if (!v54
          || ([v54 shareURL], uint64_t v56 = objc_claimAutoreleasedReturnValue(), v56, v56))
        {
          id v57 = [v52 cloudAssetGUID];
          if (v57 && [v52 cloudLocalState]) {
            uint64_t v58 = 2;
          }
          else {
            uint64_t v58 = 0;
          }
          char v315 = 0;
          uint64_t v59 = [v52 existingCloudMasterNeedsRepush:&v315];
          uint64_t v60 = v59;
          if (v315)
          {
            uint64_t v61 = [v59 cplPropertyRecord];
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v61];
          }
          if (!v60
            || ![v60 cloudLocalState]
            || [v60 cloudLocalState] == 4)
          {
            uint64_t v62 = [v52 cplMasterChangeInLibrary:v11 shouldGenerateDerivatives:v258->_shouldGenerateDerivatives];
            if (v62)
            {
              uint64_t v63 = (void *)v62;
              v265 = v53;
              [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v62];
              id v64 = [v52 master];

              if ([v64 placeholderState] != 1)
              {
                uint64_t v65 = [v64 sizeOfOriginal];
                id v66 = [v64 scopedIdentifier];
                long long v67 = [v52 scopedIdentifier];
                [v252 addSizeForUnpushedOriginals:v65 forMasterScopedIdentifier:v66 forAssetScopedIdentifier:v67];

                id v11 = v263;
              }
              if (v64)
              {
                uint64_t v60 = v64;
                goto LABEL_76;
              }
              uint64_t v60 = 0;
              __int16 v53 = v265;
LABEL_104:

              goto LABEL_105;
            }
            if (!*MEMORY[0x1E4F59AC0])
            {
              uint64_t v69 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                long long v70 = [v52 uuid];
                *(_DWORD *)buf = 138543362;
                v349 = v70;
                _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "Failed to create master for %{public}@. Skipping upload", buf, 0xCu);
              }
            }
            uint64_t v63 = 0;
            uint64_t v71 = v60;
            uint64_t v60 = 0;
LABEL_102:

            goto LABEL_104;
          }
          v265 = v53;
          if ([v60 cloudLocalState] != 3) {
            goto LABEL_75;
          }
          if ([(PLCloudBatchUploader *)v258 _hasUnuploadedResourceForAsset:v52 resourceType:17 cloudMaster:v60])
          {
            uint64_t v63 = [v52 cplMasterChangeInLibrary:v11 shouldGenerateDerivatives:v258->_shouldGenerateDerivatives];
            if (v63)
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                long long v72 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v349 = v60;
                  __int16 v350 = 2112;
                  v351 = v52;
                  long long v73 = v72;
                  long long v74 = "Pushing uploaded CloudMaster %@ again since new asset %@ has an original alternate resource this"
                        " master does not have";
                  goto LABEL_72;
                }
                goto LABEL_73;
              }
              goto LABEL_74;
            }
            goto LABEL_76;
          }
          if (![(PLCloudBatchUploader *)v258 _hasUnuploadedResourceForAsset:v52 resourceType:18 cloudMaster:v60])
          {
LABEL_75:
            uint64_t v63 = 0;
            goto LABEL_76;
          }
          uint64_t v63 = [v52 cplMasterChangeInLibrary:v11 shouldGenerateDerivatives:v258->_shouldGenerateDerivatives];
          if (v63)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              long long v72 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v349 = v60;
                __int16 v350 = 2112;
                v351 = v52;
                long long v73 = v72;
                long long v74 = "Pushing uploaded CloudMaster %@ again since new asset %@ has an original video complement resource"
                      " this master does not have";
LABEL_72:
                _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_DEFAULT, v74, buf, 0x16u);
              }
LABEL_73:
            }
LABEL_74:
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v63];
          }
LABEL_76:
          if ([v60 cloudLocalState] == 2)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              BOOL v75 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v349 = v60;
                __int16 v350 = 2112;
                v351 = v52;
                _os_log_impl(&dword_19B3C7000, v75, OS_LOG_TYPE_ERROR, "CloudMaster %@ failed to be uploaded, skip uploading asset %@.", buf, 0x16u);
              }
LABEL_96:
            }
            uint64_t v80 = [v60 originalFilename];
            if (v80)
            {
              id v81 = (void *)v80;
              v82 = [v52 originalFilename];
              uint64_t v83 = [v60 originalFilename];
              char v84 = [v82 isEqualToString:v83];

              if ((v84 & 1) == 0)
              {
                v85 = [v60 originalFilename];
                [v52 setOriginalFilename:v85];
              }
            }
            id v86 = [v52 computeSyncAttributes];

            if (!v86)
            {
              id v11 = v263;
              __int16 v53 = v265;
              goto LABEL_104;
            }
            uint64_t v71 = [v52 scopedIdentifier];
            [(PLCloudPhotoLibraryBatchManager *)v267 addComputeSyncRelevantAsset:v71];
            id v11 = v263;
            __int16 v53 = v265;
            goto LABEL_102;
          }
          BOOL v75 = [v60 scopedIdentifier];
          if (v75)
          {
            id v76 = [v52 cplAssetChangeWithMasterScopedIdentifier:v75 withChangeType:v58 shouldGenerateDerivatives:v258->_shouldGenerateDerivatives orderKeyManager:v257 computeSyncUploadEnabled:v256 inLibrary:v11];
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v76];
            if ([v52 shouldIncludeInCPLCounts])
            {
              if ([v52 isPhoto])
              {
                id v77 = a4;
                if (!a4) {
                  goto LABEL_91;
                }
              }
              else
              {
                int v78 = [v52 isVideo];
                if (!a5) {
                  goto LABEL_91;
                }
                id v77 = a5;
                if (!v78) {
                  goto LABEL_91;
                }
              }
              ++*v77;
            }
LABEL_91:
            if (!*MEMORY[0x1E4F59AC0])
            {
              uint64_t v79 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v349 = v76;
                _os_log_impl(&dword_19B3C7000, v79, OS_LOG_TYPE_DEBUG, "Adding asset %@ to initial batch", buf, 0xCu);
              }
            }
          }
          else
          {
            if (*MEMORY[0x1E4F59AC0])
            {
              BOOL v75 = 0;
              goto LABEL_96;
            }
            id v76 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v349 = v52;
              _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_ERROR, "No valid masterGUID for asset %@. Skipping upload", buf, 0xCu);
            }
          }

          goto LABEL_96;
        }
        if (*MEMORY[0x1E4F59AC0]) {
          goto LABEL_106;
        }
        id v57 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          long long v68 = [v52 _compactDebugDescription];
          *(_DWORD *)buf = 138543362;
          v349 = v68;
          _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_DEFAULT, "Skipping asset %{public}@ on an unpublished moment share", buf, 0xCu);
        }
LABEL_105:

LABEL_106:
        uint64_t v51 = (char *)v51 + 1;
      }
      while (v261 != v51);
      uint64_t v87 = [v254 countByEnumeratingWithState:&v316 objects:v352 count:16];
      id v261 = (id)v87;
    }
    while (v87);
  }

  v248 = [MEMORY[0x1E4F1CA48] array];
  v249 = [MEMORY[0x1E4F1CA80] set];
  v260 = [MEMORY[0x1E4F1CA80] set];
  long long v311 = 0u;
  long long v312 = 0u;
  long long v313 = 0u;
  long long v314 = 0u;
  uint64_t v88 = v242;
  uint64_t v89 = [v88 countByEnumeratingWithState:&v311 objects:v347 count:16];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = *(void *)v312;
    do
    {
      for (uint64_t m = 0; m != v90; ++m)
      {
        if (*(void *)v312 != v91) {
          objc_enumerationMutation(v88);
        }
        long long v93 = *(void **)(*((void *)&v311 + 1) + 8 * m);
        if ([v93 isPartOfBurst])
        {
          long long v94 = [v93 uuid];
          int v95 = [v255 containsObject:v94];

          if (v95)
          {
            long long v96 = [v93 avalancheUUID];
            char v97 = [v260 containsObject:v96];

            if ((v97 & 1) == 0)
            {
              long long v98 = [v93 avalancheUUID];
              [v260 addObject:v98];

              long long v99 = [v93 avalancheUUID];
              long long v100 = [v263 managedObjectContext];
              long long v101 = +[PLAvalanche assetsWithAvalancheUUID:v99 inManagedObjectContext:v100];

              v308[0] = MEMORY[0x1E4F143A8];
              v308[1] = 3221225472;
              v308[2] = __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke_133;
              v308[3] = &unk_1E5875CB8;
              id v309 = v249;
              id v310 = v255;
              [v101 enumerateObjectsUsingBlock:v308];
            }
          }
        }
      }
      uint64_t v90 = [v88 countByEnumeratingWithState:&v311 objects:v347 count:16];
    }
    while (v90);
  }

  if ([v249 count])
  {
    long long v102 = [MEMORY[0x1E4F1CA80] setWithArray:v88];
    long long v103 = [v249 allObjects];
    [v102 addObjectsFromArray:v103];

    long long v104 = (void *)MEMORY[0x1E4F1C978];
    v105 = [v102 allObjects];
    long long v106 = [v104 arrayWithArray:v105];

    long long v107 = v263;
    id v108 = v258;
    if (!*MEMORY[0x1E4F59AC0])
    {
      long long v109 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v349 = v106;
        _os_log_impl(&dword_19B3C7000, v109, OS_LOG_TYPE_DEBUG, "new update list: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v106 = v88;
    long long v107 = v263;
    id v108 = v258;
  }
  long long v306 = 0u;
  long long v307 = 0u;
  long long v304 = 0u;
  long long v305 = 0u;
  v262 = v106;
  uint64_t v110 = [v262 countByEnumeratingWithState:&v304 objects:v346 count:16];
  if (v110)
  {
    uint64_t v111 = v110;
    uint64_t v266 = *(void *)v305;
    do
    {
      uint64_t v112 = 0;
      do
      {
        if (*(void *)v305 != v266) {
          objc_enumerationMutation(v262);
        }
        long long v113 = *(NSObject **)(*((void *)&v304 + 1) + 8 * v112);
        long long v114 = (void *)MEMORY[0x19F38D3B0]();
        long long v115 = [v113 existingCloudMasterNeedsRepush:0];
        long long v116 = v115;
        if (!v115
          || ![v115 cloudLocalState]
          || [v116 cloudLocalState] == 4
          || [v113 cloudLocalState] == 4)
        {
          long long v117 = [v113 cplMasterChangeInLibrary:v107 shouldGenerateDerivatives:v108->_shouldGenerateDerivatives];
          long long v118 = [v117 scopedIdentifier];

          if (v118)
          {
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v117];
            long long v119 = [v113 master];

            if ([v119 placeholderState] != 1)
            {
              uint64_t v120 = [v119 sizeOfOriginal];
              long long v121 = [v119 scopedIdentifier];
              long long v122 = [v113 scopedIdentifier];
              uint64_t v123 = v120;
              long long v107 = v263;
              [v252 addSizeForUnpushedOriginals:v123 forMasterScopedIdentifier:v121 forAssetScopedIdentifier:v122];

              goto LABEL_144;
            }
            goto LABEL_145;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v121 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v349 = v113;
              _os_log_impl(&dword_19B3C7000, v121, OS_LOG_TYPE_ERROR, "Skip attemping to add master change with nil scopedIdentifier, asset %@", buf, 0xCu);
            }
            long long v119 = v116;
LABEL_144:

LABEL_145:
            long long v116 = v119;
          }
          long long v124 = [v116 scopedIdentifier];

          if (v124)
          {
            long long v125 = [v116 scopedIdentifier];
            uint64_t v126 = [v113 cplAssetChangeWithMasterScopedIdentifier:v125 withChangeType:0 shouldGenerateDerivatives:v108->_shouldGenerateDerivatives orderKeyManager:v257 computeSyncUploadEnabled:v256 inLibrary:v107];
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v126];
            if (![v113 shouldIncludeInCPLCounts]) {
              goto LABEL_157;
            }
            if ([v113 isPhoto])
            {
              uint64_t v127 = a4;
              if (!a4) {
                goto LABEL_157;
              }
LABEL_156:
              ++*v127;
              goto LABEL_157;
            }
            int v128 = [v113 isVideo];
            if (a5)
            {
              uint64_t v127 = a5;
              if (v128) {
                goto LABEL_156;
              }
            }
LABEL_157:

LABEL_158:
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            long long v125 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v349 = v113;
              _os_log_impl(&dword_19B3C7000, v125, OS_LOG_TYPE_ERROR, "No valid masterGUID for asset %@. Will retry in the next round", buf, 0xCu);
            }
            goto LABEL_158;
          }

          goto LABEL_160;
        }
        if ([v116 cloudLocalState] == 2)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            v129 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v349 = v116;
              __int16 v350 = 2112;
              v351 = v113;
              _os_log_impl(&dword_19B3C7000, v129, OS_LOG_TYPE_ERROR, "CloudMaster %@ failed to be uploaded, skip uploading asset %@.", buf, 0x16u);
            }
          }
          [v248 addObject:v113];
          goto LABEL_160;
        }
        unsigned __int16 v130 = [v113 uuid];
        if ([v245 containsObject:v130]) {
          uint64_t v131 = 32;
        }
        else {
          uint64_t v131 = 0;
        }
        if ([v255 containsObject:v130]) {
          v131 |= 2uLL;
        }
        if ([v247 containsObject:v130]) {
          v131 |= 0x40uLL;
        }
        if ([v243 containsObject:v113]) {
          uint64_t v132 = v131 | 0x10;
        }
        else {
          uint64_t v132 = v131;
        }
        if ([v246 containsObject:v130])
        {
          id v133 = [MEMORY[0x1E4F28CB8] defaultManager];
          if (![v113 hasAdjustments])
          {
            id v138 = [v113 pathForOriginalFile];
            int v139 = [v133 fileExistsAtPath:v138];

            if (v139) {
              v132 |= 8uLL;
            }
            goto LABEL_187;
          }
          if (![v113 isPhoto]
            || ([v113 pathForFullsizeRenderImageFile],
                int v134 = objc_claimAutoreleasedReturnValue(),
                int v135 = [v133 fileExistsAtPath:v134],
                v134,
                !v135))
          {
            if (![v113 isVideo]) {
              goto LABEL_187;
            }
            id v136 = [v113 pathForFullsizeRenderVideoFile];
            int v137 = [v133 fileExistsAtPath:v136];

            if (!v137)
            {
              if (![v113 isDefaultAdjustedSlomo]
                || ([v113 pathForOriginalFile],
                    long long v146 = objc_claimAutoreleasedReturnValue(),
                    int v147 = [v133 fileExistsAtPath:v146],
                    v146,
                    !v147))
              {
                if (!*MEMORY[0x1E4F59AC0])
                {
                  long long v148 = __CPLAssetsdOSLogDomain();
                  long long v107 = v263;
                  if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v349 = v113;
                    _os_log_impl(&dword_19B3C7000, v148, OS_LOG_TYPE_ERROR, "Video %@ has resource change without full size resource", buf, 0xCu);
                  }

                  goto LABEL_188;
                }
LABEL_187:
                long long v107 = v263;
LABEL_188:

                goto LABEL_189;
              }
            }
          }
          v132 |= 8uLL;
          goto LABEL_187;
        }
LABEL_189:
        if ([v113 cloudLocalState]) {
          uint64_t v140 = v132;
        }
        else {
          uint64_t v140 = 0;
        }
        v141 = [v116 scopedIdentifier];
        long long v142 = [v113 cplAssetChangeWithMasterScopedIdentifier:v141 withChangeType:v140 shouldGenerateDerivatives:v258->_shouldGenerateDerivatives orderKeyManager:v257 computeSyncUploadEnabled:v256 inLibrary:v107];
        [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v142];
        long long v143 = [v113 scopedIdentifier];
        int v144 = [v244 containsObject:v143];

        if (v144)
        {
          long long v145 = [v113 scopedIdentifier];
          [(PLCloudPhotoLibraryBatchManager *)v267 addComputeSyncRelevantAsset:v145];
        }
        long long v107 = v263;
        id v108 = v258;
LABEL_160:

        ++v112;
      }
      while (v111 != v112);
      uint64_t v149 = [v262 countByEnumeratingWithState:&v304 objects:v346 count:16];
      uint64_t v111 = v149;
    }
    while (v149);
  }

  long long v302 = 0u;
  long long v303 = 0u;
  long long v300 = 0u;
  long long v301 = 0u;
  id v150 = v226;
  uint64_t v151 = [v150 countByEnumeratingWithState:&v300 objects:v345 count:16];
  if (!v151) {
    goto LABEL_215;
  }
  uint64_t v152 = v151;
  uint64_t v153 = *(void *)v301;
  do
  {
    for (uint64_t n = 0; n != v152; ++n)
    {
      if (*(void *)v301 != v153) {
        objc_enumerationMutation(v150);
      }
      long long v155 = *(void **)(*((void *)&v300 + 1) + 8 * n);
      long long v156 = [v155 assets];
      uint64_t v157 = [v156 count];

      if (v157)
      {
        long long v158 = [v155 cplPropertyRecord];
        [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v158];
      }
      else
      {
        if (*MEMORY[0x1E4F59AC0]) {
          continue;
        }
        long long v158 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
        {
          long long v159 = [v155 scopedIdentifier];
          long long v160 = [v159 identifier];
          *(_DWORD *)buf = 138543362;
          v349 = v160;
          _os_log_impl(&dword_19B3C7000, v158, OS_LOG_TYPE_ERROR, "Could not find any asset for master %{public}@. Ignoring update", buf, 0xCu);
        }
      }
    }
    uint64_t v152 = [v150 countByEnumeratingWithState:&v300 objects:v345 count:16];
  }
  while (v152);
LABEL_215:

  long long v298 = 0u;
  long long v299 = 0u;
  long long v296 = 0u;
  long long v297 = 0u;
  id v161 = v227;
  uint64_t v162 = [v161 countByEnumeratingWithState:&v296 objects:v344 count:16];
  if (v162)
  {
    uint64_t v163 = v162;
    uint64_t v164 = *(void *)v297;
    do
    {
      for (iuint64_t i = 0; ii != v163; ++ii)
      {
        if (*(void *)v297 != v164) {
          objc_enumerationMutation(v161);
        }
        long long v166 = [*(id *)(*((void *)&v296 + 1) + 8 * ii) asset];
        long long v167 = [v166 master];

        if (v167)
        {
          long long v168 = [v167 cplPropertyRecord];
          [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v168];
        }
      }
      uint64_t v163 = [v161 countByEnumeratingWithState:&v296 objects:v344 count:16];
    }
    while (v163);
  }

  long long v294 = 0u;
  long long v295 = 0u;
  long long v292 = 0u;
  long long v293 = 0u;
  id v169 = v248;
  uint64_t v170 = [v169 countByEnumeratingWithState:&v292 objects:v343 count:16];
  if (v170)
  {
    uint64_t v171 = v170;
    uint64_t v172 = *(void *)v293;
    do
    {
      for (juint64_t j = 0; jj != v171; ++jj)
      {
        if (*(void *)v293 != v172) {
          objc_enumerationMutation(v169);
        }
        long long v174 = *(NSObject **)(*((void *)&v292 + 1) + 8 * jj);
        if ([v174 cloudLocalState] != 2)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v175 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v349 = v174;
              _os_log_impl(&dword_19B3C7000, v175, OS_LOG_TYPE_ERROR, "Unable to upload asset %@", buf, 0xCu);
            }
          }
          [v174 setCloudLocalState:2];
        }
      }
      uint64_t v171 = [v169 countByEnumeratingWithState:&v292 objects:v343 count:16];
    }
    while (v171);
  }

  if ([v241 count])
  {
    long long v290 = 0u;
    long long v291 = 0u;
    long long v288 = 0u;
    long long v289 = 0u;
    id v176 = v241;
    uint64_t v177 = [v176 countByEnumeratingWithState:&v288 objects:v342 count:16];
    if (v177)
    {
      uint64_t v178 = v177;
      uint64_t v179 = *(void *)v289;
      do
      {
        for (kuint64_t k = 0; kk != v178; ++kk)
        {
          if (*(void *)v289 != v179) {
            objc_enumerationMutation(v176);
          }
          long long v181 = *(void **)(*((void *)&v288 + 1) + 8 * kk);
          long long v182 = (void *)MEMORY[0x19F38D3B0]();
          long long v183 = [v181 cplMemoryChange];
          if (v183) {
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v183];
          }
        }
        uint64_t v178 = [v176 countByEnumeratingWithState:&v288 objects:v342 count:16];
      }
      while (v178);
    }
  }
  if ([v240 count])
  {
    long long v286 = 0u;
    long long v287 = 0u;
    long long v284 = 0u;
    long long v285 = 0u;
    id v184 = v240;
    uint64_t v185 = [v184 countByEnumeratingWithState:&v284 objects:v341 count:16];
    if (v185)
    {
      uint64_t v186 = v185;
      uint64_t v187 = *(void *)v285;
      do
      {
        for (muint64_t m = 0; mm != v186; ++mm)
        {
          if (*(void *)v285 != v187) {
            objc_enumerationMutation(v184);
          }
          id v189 = *(void **)(*((void *)&v284 + 1) + 8 * mm);
          __int16 v190 = (void *)MEMORY[0x19F38D3B0]();
          v191 = [v189 cplSuggestionChange];
          if (v191) {
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v191];
          }
        }
        uint64_t v186 = [v184 countByEnumeratingWithState:&v284 objects:v341 count:16];
      }
      while (v186);
    }
  }
  if ([v239 count])
  {
    long long v282 = 0u;
    long long v283 = 0u;
    long long v280 = 0u;
    long long v281 = 0u;
    id v192 = v239;
    uint64_t v193 = [v192 countByEnumeratingWithState:&v280 objects:v340 count:16];
    if (v193)
    {
      uint64_t v194 = v193;
      uint64_t v195 = *(void *)v281;
      do
      {
        for (nuint64_t n = 0; nn != v194; ++nn)
        {
          if (*(void *)v281 != v195) {
            objc_enumerationMutation(v192);
          }
          v197 = *(void **)(*((void *)&v280 + 1) + 8 * nn);
          v198 = (void *)MEMORY[0x19F38D3B0]();
          v199 = [v197 cplSuggestionChange];
          if (v199) {
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v199];
          }
        }
        uint64_t v194 = [v192 countByEnumeratingWithState:&v280 objects:v340 count:16];
      }
      while (v194);
    }
  }
  if ([v238 count])
  {
    long long v278 = 0u;
    long long v279 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    id v200 = v238;
    uint64_t v201 = [v200 countByEnumeratingWithState:&v276 objects:v339 count:16];
    if (v201)
    {
      uint64_t v202 = v201;
      uint64_t v203 = *(void *)v277;
      do
      {
        for (uint64_t i1 = 0; i1 != v202; ++i1)
        {
          if (*(void *)v277 != v203) {
            objc_enumerationMutation(v200);
          }
          v205 = *(void **)(*((void *)&v276 + 1) + 8 * i1);
          v206 = (void *)MEMORY[0x19F38D3B0]();
          v207 = [v205 cplScopeChange];
          if (v207) {
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v207];
          }
        }
        uint64_t v202 = [v200 countByEnumeratingWithState:&v276 objects:v339 count:16];
      }
      while (v202);
    }
  }
  if ([v237 count])
  {
    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    id v208 = v237;
    uint64_t v209 = [v208 countByEnumeratingWithState:&v272 objects:v338 count:16];
    if (v209)
    {
      uint64_t v210 = v209;
      uint64_t v211 = *(void *)v273;
      do
      {
        for (uint64_t i2 = 0; i2 != v210; ++i2)
        {
          if (*(void *)v273 != v211) {
            objc_enumerationMutation(v208);
          }
          v213 = *(void **)(*((void *)&v272 + 1) + 8 * i2);
          v214 = (void *)MEMORY[0x19F38D3B0]();
          v215 = [v213 cplSocialGroupChange];
          if (v215) {
            [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:v215];
          }
        }
        uint64_t v210 = [v208 countByEnumeratingWithState:&v272 objects:v338 count:16];
      }
      while (v210);
    }
  }
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  id v216 = v236;
  uint64_t v217 = [v216 countByEnumeratingWithState:&v268 objects:v337 count:16];
  if (v217)
  {
    uint64_t v218 = v217;
    char isKindOfClass = 0;
    uint64_t v220 = *(void *)v269;
    do
    {
      for (uint64_t i3 = 0; i3 != v218; ++i3)
      {
        if (*(void *)v269 != v220) {
          objc_enumerationMutation(v216);
        }
        [(PLCloudPhotoLibraryBatchManager *)v267 addRecord:*(void *)(*((void *)&v268 + 1) + 8 * i3)];
        if (isKindOfClass)
        {
          char isKindOfClass = 1;
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }
      }
      uint64_t v218 = [v216 countByEnumeratingWithState:&v268 objects:v337 count:16];
    }
    while (v218);
  }
  else
  {
    char isKindOfClass = 0;
  }

  if ([v254 count] || (isKindOfClass & 1) != 0 || objc_msgSend(v233, "count"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
  }
  if ([v169 count])
  {
    v223 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v223, @"com.apple.mobileslideshow.cpl.failedtopush", 0, 0, 0);
  }
  v224 = [(PLCloudPhotoLibraryBatchManager *)v267 drainBatches];

  return v224;
}

uint64_t __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) newShortLivedLibraryForOrderKeyManagerWithName:"-[PLCloudBatchUploader createBatchesForChanges:outInsertedPhotoCount:outInsertedVideoCount:withUploadTracker:inLibrary:]_block_invoke"];
  return [v1 managedObjectContext];
}

void __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 personUUID];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v10 personUUID];
    LOBYTE(v5) = [v5 containsObject:v6];

    if ((v5 & 1) == 0)
    {
      id v7 = [v10 cplPersonChange];
      [*(id *)(a1 + 40) addRecord:v7];
      id v8 = *(void **)(a1 + 32);
      id v9 = [v10 personUUID];
      [v8 addObject:v9];
    }
  }
}

void __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke_133(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 supportsCloudUpload])
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [v5 uuid];
    [v3 addObject:v4];
  }
}

- (id)_validateAssets:(id)a3 fromCloudUuidDeleteList:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    id v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v9 = 138543362;
    long long v23 = v9;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "scopedIdentifier", v23);
        if (v15 && [v25 containsObject:v15])
        {
          if (!*v11)
          {
            uint64_t v16 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              uint64_t v31 = v15;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Skipping insert/update for asset %{public}@ since we see it in a delete", buf, 0xCu);
            }
          }
        }
        else
        {
          int v17 = [v14 cloudLocalState];
          BOOL v18 = v17 == 4 || (unsigned __int16)v17 == 2;
          if (v18 && !*v11)
          {
            int v19 = v17;
            long long v20 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v21 = [v14 uuid];
              *(_DWORD *)buf = 138543618;
              uint64_t v31 = v21;
              __int16 v32 = 1024;
              int v33 = v19;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Going to retry asset %{public}@ with localState %d", buf, 0x12u);

              id v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
              uint64_t v12 = v24;
            }
          }
          [v6 addObject:v14];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)_processAlbumInserts:(id)a3 albumChanges:(id)a4 withBatchManager:(id)a5 inLibrary:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v12 libraryServicesManager];
  uint64_t v14 = [v13 databaseContext];

  uint64_t v15 = [PLRelationshipOrderKeyManager alloc];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __85__PLCloudBatchUploader__processAlbumInserts_albumChanges_withBatchManager_inLibrary___block_invoke;
  v35[3] = &unk_1E5872390;
  id v16 = v14;
  id v36 = v16;
  int v17 = [(PLRelationshipOrderKeyManager *)v15 initWithGenerateContextBlock:v35];
  BOOL v18 = (void *)MEMORY[0x1E4F1CAD0];
  long long v29 = v10;
  id v30 = v9;
  int v19 = [v9 arrayByAddingObjectsFromArray:v10];
  long long v20 = [v18 setWithArray:v19];

  long long v21 = [v20 allObjects];
  long long v22 = +[PLGenericAlbum includeUnpushedParentsForAlbums:v21 limit:0x7FFFFFFFFFFFFFFFLL];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = [*(id *)(*((void *)&v31 + 1) + 8 * v27) cplAlbumChangeInPhotoLibrary:v12 orderKeyManager:v17];
        [v11 addRecord:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v25);
  }
}

uint64_t __85__PLCloudBatchUploader__processAlbumInserts_albumChanges_withBatchManager_inLibrary___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) newShortLivedLibraryForOrderKeyManagerWithName:"-[PLCloudBatchUploader _processAlbumInserts:albumChanges:withBatchManager:inLibrary:]_block_invoke"];
  return [v1 managedObjectContext];
}

- (void)handleUploadBatchesFromLocalEvent:(id)a3 outInsertedPhotoCount:(unint64_t *)a4 outInsertedVideoCount:(unint64_t *)a5 shouldTriggerPrefetch:(BOOL *)a6 withUploadTracker:(id)a7 inLibrary:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __152__PLCloudBatchUploader_handleUploadBatchesFromLocalEvent_outInsertedPhotoCount_outInsertedVideoCount_shouldTriggerPrefetch_withUploadTracker_inLibrary___block_invoke;
  v20[3] = &unk_1E5861F08;
  v20[4] = self;
  id v21 = v14;
  uint64_t v24 = a6;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  id v22 = v16;
  id v23 = v15;
  id v17 = v15;
  id v18 = v16;
  id v19 = v14;
  [v18 performTransactionAndWait:v20];
}

void __152__PLCloudBatchUploader_handleUploadBatchesFromLocalEvent_outInsertedPhotoCount_outInsertedVideoCount_shouldTriggerPrefetch_withUploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _fetchChangesFromLocalEvent:*(void *)(a1 + 40) shouldTriggerPrefetch:*(void *)(a1 + 64) inLibrary:*(void *)(a1 + 48)];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v2 insertedAssets];
  [v3 _incrementUploadAttemptsAndPushStateForAssets:v4];

  id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v2 summaryCounts];
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Upload changes: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (![v2 isEmpty])
  {
    uint64_t v8 = [*(id *)(a1 + 32) createBatchesForChanges:v2 outInsertedPhotoCount:*(void *)(a1 + 72) outInsertedVideoCount:*(void *)(a1 + 80) withUploadTracker:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 48)];
    if (!*v5)
    {
      id v9 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "batches = %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [*(id *)(a1 + 32) addBatches:v8];
    goto LABEL_14;
  }
  if (!*v5)
  {
    uint64_t v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "ignoring this event for now, no change", (uint8_t *)&v10, 2u);
    }
LABEL_14:
  }
}

- (id)_fetchChangesFromLocalEvent:(id)a3 shouldTriggerPrefetch:(BOOL *)a4 inLibrary:(id)a5
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v104 = a3;
  id v87 = a5;
  uint64_t v8 = [v87 managedObjectContext];
  v105 = objc_alloc_init(PLCloudUploadChanges);
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v129 = v104;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "localEvent = %@", buf, 0xCu);
    }
  }
  int v10 = [v104 objectForKey:*MEMORY[0x1E4F1BDF0]];
  [(PLCloudBatchUploader *)self _sortData:v10 isInsert:1 forUploadChanges:v105 shouldTriggerPrefetch:a4 inManagedObjectContext:v8];

  id v11 = [v104 objectForKey:*MEMORY[0x1E4F1BFA0]];
  [(PLCloudBatchUploader *)self _sortData:v11 isInsert:0 forUploadChanges:v105 shouldTriggerPrefetch:a4 inManagedObjectContext:v8];

  uint64_t v12 = [v104 objectForKey:@"PLUpdatedRelationshipsByObjectIDKey"];
  [(PLCloudBatchUploader *)self _sortRelationshipData:v12 forUploadChanges:v105 inManagedObjectContext:v8];

  uint64_t v13 = v105;
  v85 = (void *)v8;
  [(PLCloudBatchUploader *)self _handleSharingChanges:v104 forUploadEvent:v105 inManagedObjectContext:v8];
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = [v87 mainScopeIdentifier];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  PLAllCloudDeletionKeys();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v100 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
  if (v100)
  {
    id v98 = *(id *)v119;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(id *)v119 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v102 = v15;
        id v16 = *(void **)(*((void *)&v118 + 1) + 8 * v15);
        id v17 = [v104 objectForKey:v16];
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v114 objects:v126 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v115;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v115 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v114 + 1) + 8 * v21);
              id v23 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v14 identifier:v22];
              if (([(NSMutableSet *)self->_downloadedDeleteRecords containsObject:v23] & 1) == 0)
              {
                if ([v16 isEqualToString:@"cloudAssetDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F59840];
                  goto LABEL_26;
                }
                if ([v16 isEqualToString:@"cloudAlbumDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F59838];
                  goto LABEL_26;
                }
                if ([v16 isEqualToString:@"cloudMemoryDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F598D0];
                  goto LABEL_26;
                }
                if ([v16 isEqualToString:@"cloudPersonDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F598F0];
                  goto LABEL_26;
                }
                if ([v16 isEqualToString:@"cloudFaceCropDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F59880];
                  goto LABEL_26;
                }
                if ([v16 isEqualToString:@"cloudOwnedCMMDeleteGUIDs"])
                {
                  long long v28 = (void *)MEMORY[0x1E4F598E8];
                  long long v29 = v22;
                  uint64_t v30 = 2;
                  goto LABEL_40;
                }
                if ([v16 isEqualToString:@"cloudSubscribedCMMDeleteGUIDs"])
                {
                  long long v28 = (void *)MEMORY[0x1E4F598E8];
                  long long v29 = v22;
                  uint64_t v30 = 3;
                  goto LABEL_40;
                }
                if ([v16 isEqualToString:@"cloudOwnedLibraryScopeDeleteGUIDs"])
                {
                  long long v28 = (void *)MEMORY[0x1E4F59960];
                  long long v29 = v22;
                  uint64_t v30 = 4;
                  goto LABEL_40;
                }
                if ([v16 isEqualToString:@"cloudSubscribedLibraryScopeDeleteGUIDs"])
                {
                  long long v28 = (void *)MEMORY[0x1E4F59960];
                  long long v29 = v22;
                  uint64_t v30 = 5;
LABEL_40:
                  uint64_t v25 = [v28 newDeleteScopeChangeWithScopeIdentifier:v29 type:v30];
LABEL_27:
                  uint64_t v26 = v25;
                  if (!v25) {
                    goto LABEL_30;
                  }
LABEL_28:
                  uint64_t v27 = [(PLCloudUploadChanges *)v13 deletedRecords];
                  [v27 addObject:v26];

                  uint64_t v13 = v105;
LABEL_29:

                  goto LABEL_30;
                }
                if ([v16 isEqualToString:@"cloudSuggestionDeleteGUIDs"]
                  || [v16 isEqualToString:@"cloudUserFeedbackDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F599B0];
LABEL_26:
                  uint64_t v25 = [v24 newDeleteChangeWithScopedIdentifier:v23];
                  goto LABEL_27;
                }
                if ([v16 isEqualToString:@"cloudSocialGroupDeleteGUIDs"])
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F59980];
                  goto LABEL_26;
                }
                if ([v16 isEqualToString:@"cloudInternalResourceUUIDToResourceTypeMappings"])
                {
                  long long v94 = [NSString stringWithUTF8String:"-@-"];
                  long long v31 = [v22 componentsSeparatedByString:v94];

                  long long v96 = v31;
                  if ([v31 count] == 2)
                  {
                    int v95 = [v31 objectAtIndexedSubscript:0];
                    uint64_t v32 = [v31 objectAtIndexedSubscript:1];
                    id v92 = +[PLManagedAsset assetWithUUID:v95 inLibrary:v87];
                    long long v33 = [v92 master];
                    long long v93 = (void *)v32;
                    if (v33)
                    {
                      uint64_t v90 = v33;
                      id v34 = objc_alloc_init(MEMORY[0x1E4F59870]);
                      uint64_t v35 = (void *)v32;
                      id v36 = v34;
                      objc_msgSend(v34, "setResourceType:", objc_msgSend(v35, "integerValue"));
                      [v36 setExpungedState:2];
                      uint64_t v37 = [MEMORY[0x1E4F1C9C8] date];
                      uint64_t v91 = v36;
                      uint64_t v38 = v36;
                      uint64_t v39 = (void *)v37;
                      objc_msgSend(v38, "setExpungedDate:");

                      uint64_t v26 = [v86 objectForKeyedSubscript:v95];
                      if (!v26)
                      {
                        uint64_t v26 = [v90 cplPropertyRecord];
                        [v86 setObject:v26 forKeyedSubscript:v95];
                      }
                      long long v40 = [v26 expungeableResourceStates];
                      if (!v40) {
                        long long v40 = (void *)MEMORY[0x1E4F1CBF0];
                      }
                      uint64_t v89 = v40;
                      uint64_t v88 = [v40 arrayByAddingObject:v91];
                      [v26 setExpungeableResourceStates:v88];

                      long long v33 = v90;
                    }
                    else
                    {
                      uint64_t v26 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v26 = 0;
                  }

                  if (v26) {
                    goto LABEL_28;
                  }
                }
                else if (!*MEMORY[0x1E4F59AC0])
                {
                  uint64_t v26 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v129 = v16;
                    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Unsupported cloudDeleteKey %@", buf, 0xCu);
                  }
                  goto LABEL_29;
                }
              }
LABEL_30:

              ++v21;
            }
            while (v19 != v21);
            uint64_t v41 = [v17 countByEnumeratingWithState:&v114 objects:v126 count:16];
            uint64_t v19 = v41;
          }
          while (v41);
        }

        uint64_t v15 = v102 + 1;
      }
      while (v102 + 1 != v100);
      uint64_t v100 = [obj countByEnumeratingWithState:&v118 objects:v127 count:16];
    }
    while (v100);
  }

  long long v103 = [MEMORY[0x1E4F1CA80] set];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  uint64_t v42 = [(PLCloudUploadChanges *)v13 insertedAssets];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v110 objects:v125 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v111 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void **)(*((void *)&v110 + 1) + 8 * i);
        uint64_t v48 = [v47 uuid];

        if (v48)
        {
          uint64_t v49 = [v47 uuid];
          [v103 addObject:v49];
        }
        else
        {
          [(PLCloudBatchUploader *)self _promptForNilAssetUUID:v47 isInsert:1];
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v110 objects:v125 count:16];
    }
    while (v44);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v99 = [(PLCloudUploadChanges *)v105 updatedAssets];
  uint64_t v50 = [v99 countByEnumeratingWithState:&v106 objects:v124 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v101 = *(void *)v107;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v107 != v101) {
          objc_enumerationMutation(v99);
        }
        __int16 v53 = *(void **)(*((void *)&v106 + 1) + 8 * j);
        uint64_t v54 = [v53 uuid];

        if (!v54)
        {
          [(PLCloudBatchUploader *)self _promptForNilAssetUUID:v53 isInsert:0];
          continue;
        }
        cameraAsset = self->_cameraAsset;
        uint64_t v56 = [v53 uuid];
        if ([(NSMutableSet *)cameraAsset containsObject:v56])
        {

LABEL_85:
          uint64_t v58 = [v53 uuid];
          char v59 = [v103 containsObject:v58];

          if ((v59 & 1) == 0)
          {
            uint64_t v60 = [(PLCloudUploadChanges *)v105 insertedAssets];
            [v60 addObject:v53];
          }
          uint64_t v61 = self->_cameraAsset;
          uint64_t v62 = [v53 uuid];
          [(NSMutableSet *)v61 removeObject:v62];

          goto LABEL_88;
        }
        int v57 = [v53 cloudLocalState];

        if (!v57) {
          goto LABEL_85;
        }
LABEL_88:
        uint64_t v63 = [v104 objectForKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];
        id v64 = [v53 objectID];
        uint64_t v65 = [v63 objectForKeyedSubscript:v64];
        uint64_t v66 = [v65 unsignedLongValue];

        uint64_t v123 = @"deferredProcessingNeeded";
        long long v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
        long long v68 = +[PLManagedAsset entityName];
        unint64_t v69 = +[PLPropertyIndexMapping indexValueForAttributeNames:v67 entity:v68];

        if ((v69 & v66) != 0)
        {
          long long v70 = [(PLCloudUploadChanges *)v105 adjustedAssetUuids];
          uint64_t v71 = [v53 uuid];
          [v70 addObject:v71];
        }
        long long v72 = [v104 objectForKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];
        long long v73 = [v53 additionalAttributes];
        long long v74 = [v73 objectID];
        BOOL v75 = [v72 objectForKeyedSubscript:v74];
        uint64_t v76 = [v75 unsignedLongValue];

        long long v122 = @"originalResourceChoice";
        id v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
        int v78 = +[PLAdditionalAssetAttributes entityName];
        unint64_t v79 = +[PLPropertyIndexMapping indexValueForAttributeNames:v77 entity:v78];

        if ((v79 & v76) != 0)
        {
          uint64_t v80 = [(PLCloudUploadChanges *)v105 adjustedAssetUuids];
          id v81 = [v53 uuid];
          [v80 addObject:v81];
        }
      }
      uint64_t v51 = [v99 countByEnumeratingWithState:&v106 objects:v124 count:16];
    }
    while (v51);
  }

  v82 = [(PLCloudUploadChanges *)v105 updatedAssets];
  uint64_t v83 = [(PLCloudUploadChanges *)v105 insertedAssets];
  [v82 removeObjectsInArray:v83];

  return v105;
}

- (void)_promptForNilAssetUUID:(id)a3 isInsert:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSString;
  if (a4) {
    id v5 = @"inserting";
  }
  else {
    id v5 = @"updating";
  }
  id v6 = a3;
  id v7 = [v6 objectID];
  int v8 = [v6 isDeleted];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  int v10 = [v4 stringWithFormat:@"Found %@ asset with nil uuid %@ (isDeleted=%@) %@.\n\nSee rdar://problem/52539172", v5, v7, v9, v6];

  if (!*MEMORY[0x1E4F59AC0])
  {
    id v11 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }
  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: asset with nil uuid" radarDescription:v10];
}

- (void)_handleInvalidAsset:(id)a3
{
  id v3 = a3;
  id v7 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 uuid];

    id v5 = v7;
    if (v4) {
      goto LABEL_6;
    }
    id v6 = [NSString stringWithFormat:@"Ignoring asset with nil uuid: %@, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32604898", v7];
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Ignoring nil asset, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32604898"];
  }
  PLSimulateCrash();

  id v5 = v7;
LABEL_6:
}

- (void)_addAsset:(id)a3 toAssetChanges:(id)a4 isInsert:(BOOL)a5 seenAssetUuid:(id)a6
{
  BOOL v7 = a5;
  id v16 = a3;
  id v10 = a4;
  id v11 = (NSMutableSet *)a6;
  uint64_t v12 = [v16 uuid];
  uint64_t v13 = (void *)v12;
  if (!v16 || !v12)
  {
    [(PLCloudBatchUploader *)self _handleInvalidAsset:v16];
    goto LABEL_10;
  }
  if ([(NSMutableSet *)v11 containsObject:v12]) {
    goto LABEL_10;
  }
  uint64_t v14 = [v16 filename];

  if (v14)
  {
    [v10 addObject:v16];
    cameraAsset = v11;
  }
  else
  {
    if (!v7) {
      goto LABEL_10;
    }
    cameraAsset = self->_cameraAsset;
  }
  [(NSMutableSet *)cameraAsset addObject:v13];
LABEL_10:
}

- (id)_syncDescriptionForObject:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 syncDescription];
  }
  else {
  uint64_t v4 = [v3 description];
  }

  return v4;
}

- (void)_promptToFileRadarWithTitle:(id)a3 description:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  int v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v13];

  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_FAULT, "%{public}@", buf, 0xCu);
    }
  }
  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Cloud Photo Library sync state" message:@"Please file a Radar against Photos" radarTitle:v5 radarDescription:v8];
}

- (BOOL)_validateAsset:(id)a3 onRelatedObject:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v8 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v13 = [(PLCloudBatchUploader *)self _syncDescriptionForObject:v7];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v13;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Found related object without an asset: %@", buf, 0xCu);
LABEL_19:

      goto LABEL_20;
    }
LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if ([v6 isDeleted])
  {
    int v8 = [v6 objectID];
    int v9 = [v6 isDeleted];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    id v11 = v10;
    uint64_t v12 = [(PLCloudBatchUploader *)self _syncDescriptionForObject:v7];
    [(PLCloudBatchUploader *)self _promptToFileRadarWithTitle:@"TTR: Found deleted asset on related object", @"Found deleted asset %@ (isDeleted=%@) on related object %@.\n\nSee rdar://problem/41032234", v8, v11, v12 description];
LABEL_15:

    goto LABEL_20;
  }
  uint64_t v14 = [v6 uuid];

  if (!v14)
  {
    int v8 = [v6 objectID];
    int v16 = [v6 isDeleted];
    id v17 = @"NO";
    if (v16) {
      id v17 = @"YES";
    }
    id v11 = v17;
    uint64_t v12 = [(PLCloudBatchUploader *)self _syncDescriptionForObject:v7];
    [(PLCloudBatchUploader *)self _promptToFileRadarWithTitle:@"TTR: Found asset with no UUID on related object", @"Found asset with no UUID %@ (isDeleted=%@) on related object %@.\n\nSee rdar://problem/41032234", v8, v11, v12 description];
    goto LABEL_15;
  }
  if (([v6 supportsCloudUpload] & 1) == 0)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v8 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      uint64_t v13 = [(PLCloudBatchUploader *)self _syncDescriptionForObject:v7];
      uint64_t v18 = [v6 objectID];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Related Object %@ attempted to push unsyncable asset: %@", buf, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_21;
  }
  BOOL v15 = 1;
LABEL_22:

  return v15;
}

- (BOOL)_validateAdditionalAssetAttributes:(id)a3 onRelatedObject:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (![v6 isDeleted])
    {
      BOOL v14 = 1;
      goto LABEL_12;
    }
    int v8 = [v6 objectID];
    int v9 = [v6 isDeleted];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    id v11 = v10;
    uint64_t v12 = [(PLCloudBatchUploader *)self _syncDescriptionForObject:v7];
    [(PLCloudBatchUploader *)self _promptToFileRadarWithTitle:@"TTR: Found deleted asset attributes on related object", @"Found deleted asset attributes %@ (isDeleted=%@) on related object %@.\n\nSee rdar://problem/41032234", v8, v11, v12 description];

    goto LABEL_9;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [(PLCloudBatchUploader *)self _syncDescriptionForObject:v7];
      *(_DWORD *)buf = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Found related object without an asset attributes: %@", buf, 0xCu);
    }
LABEL_9:
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)_handleSharingChanges:(id)a3 forUploadEvent:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = a4;
  obuint64_t j = [v32 updatedAssets];
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v12 = [v11 uuid];

        if (v12)
        {
          uint64_t v13 = [v6 objectForKeyedSubscript:@"PLUpdatedAttributesByObjectIDKey"];
          BOOL v14 = [v11 objectID];
          BOOL v15 = [v13 objectForKeyedSubscript:v14];
          uint64_t v16 = [v15 unsignedLongValue];

          id v17 = +[PLManagedAsset listOfSharingAttributesRelevantForUpload];
          uint64_t v18 = +[PLManagedAsset entityName];
          unint64_t v19 = +[PLPropertyIndexMapping indexValueForAttributeNames:v17 entity:v18];

          if ((v19 & v16) != 0)
          {
            uint64_t v20 = [v32 sharingPropertyChangedAssetUuids];
            uint64_t v21 = [v11 uuid];
            [v20 addObject:v21];
          }
          __int16 v22 = [v6 objectForKeyedSubscript:@"PLUpdatedRelationshipsByObjectIDKey"];
          id v23 = [v11 objectID];
          uint64_t v24 = [v22 objectForKeyedSubscript:v23];
          uint64_t v25 = [v24 unsignedLongValue];

          uint64_t v26 = +[PLManagedAsset listOfSharingRelationshipsRelevantForUpload];
          uint64_t v27 = +[PLManagedAsset entityName];
          unint64_t v28 = +[PLPropertyIndexMapping indexValueForRelationshipNames:v26 entity:v27];

          if ((v28 & v25) != 0)
          {
            long long v29 = [v32 sharingPropertyChangedAssetUuids];
            uint64_t v30 = [v11 uuid];
            [v29 addObject:v30];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }
}

- (void)_sortData:(id)a3 isInsert:(BOOL)a4 forUploadChanges:(id)a5 shouldTriggerPrefetch:(BOOL *)a6 inManagedObjectContext:(id)a7
{
  BOOL v10 = a4;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v92 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
  BOOL v14 = [v12 updatedAssets];
  BOOL v90 = v10;
  id v81 = v14;
  if (v10)
  {
    id v91 = [v12 insertedAssets];
    id v87 = [v12 albumInserts];
    uint64_t v80 = [v12 insertedResources];
    uint64_t v89 = 0;
  }
  else
  {
    id v91 = v14;
    id v87 = [v12 albumChanges];
    uint64_t v89 = [v12 updatedMasters];
    uint64_t v80 = [v12 updatedResources];
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = v11;
  uint64_t v15 = [obj countByEnumeratingWithState:&v101 objects:v110 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v102;
    *(void *)&long long v16 = 138543362;
    long long v78 = v16;
    id v88 = v12;
    long long v94 = a6;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v102 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(NSObject **)(*((void *)&v101 + 1) + 8 * v19);
        id v100 = 0;
        uint64_t v21 = objc_msgSend(v13, "existingObjectWithID:error:", v20, &v100, v78);
        id v22 = v100;
        if (!v21)
        {
          if (*MEMORY[0x1E4F59AC0]) {
            goto LABEL_36;
          }
          id v23 = __CPLAssetsdOSLogDomain();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = 138412546;
          long long v106 = v20;
          __int16 v107 = 2112;
          id v108 = v22;
          uint64_t v24 = v23;
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          uint64_t v26 = "Failed to fault object for ID %@, skipping %@";
          uint32_t v27 = 22;
          goto LABEL_18;
        }
        if ([v21 isDeleted])
        {
          if (*MEMORY[0x1E4F59AC0]) {
            goto LABEL_36;
          }
          id v23 = __CPLAssetsdOSLogDomain();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = 138412290;
          long long v106 = v20;
          uint64_t v24 = v23;
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          uint64_t v26 = "Skipping deleted object %@";
          goto LABEL_14;
        }
        if (a6)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v28 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_26;
            }
            BOOL v28 = [v21 featuredState] == 1;
          }
          *a6 = v28;
        }
LABEL_26:
        int v29 = [v21 supportsCloudUpload];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (v29)
        {
          if (isKindOfClass)
          {
            long long v31 = v21;
            [(PLCloudBatchUploader *)self _addAsset:v31 toAssetChanges:v91 isInsert:v90 seenAssetUuid:v92];
            id v32 = [v12 propertyChangedAssetUuids];
            long long v33 = [v31 uuid];

            [v32 addObject:v33];
            goto LABEL_29;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = v89;
LABEL_40:
            [v38 addObject:v21];
            goto LABEL_36;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = v21;
            long long v33 = [v32 asset];
            if ([(PLCloudBatchUploader *)self _validateAsset:v33 onRelatedObject:v32])
            {
              [(PLCloudBatchUploader *)self _addAsset:v33 toAssetChanges:v91 isInsert:v90 seenAssetUuid:v92];
              uint64_t v41 = [v12 propertyChangedAssetUuids];
              goto LABEL_49;
            }
            goto LABEL_29;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v44 = v21;
            uint64_t v45 = [v44 assetAttributes];
            if ([(PLCloudBatchUploader *)self _validateAdditionalAssetAttributes:v45 onRelatedObject:v44])
            {
              uint64_t v46 = [v45 asset];
              if ([(PLCloudBatchUploader *)self _validateAsset:v46 onRelatedObject:v45])
              {
                [(PLCloudBatchUploader *)self _addAsset:v46 toAssetChanges:v91 isInsert:v90 seenAssetUuid:v92];
                char v84 = [v12 propertyChangedAssetUuids];
                uint64_t v47 = [v46 uuid];
                [v84 addObject:v47];

                id v12 = v88;
              }
            }
            goto LABEL_59;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = v87;
            goto LABEL_40;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v21;
            uint64_t v48 = [v23 assetAttributes];
            uint64_t v49 = v48;
            v85 = v48;
            if (v48)
            {
              v82 = [v48 asset];
              if (-[PLCloudBatchUploader _validateAsset:onRelatedObject:](self, "_validateAsset:onRelatedObject:"))
              {
                unint64_t v79 = v23;
                if (!*MEMORY[0x1E4F59AC0])
                {
                  uint64_t v50 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v51 = [v82 uuid];
                    *(_DWORD *)buf = v78;
                    long long v106 = v51;
                    _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ adjusted", buf, 0xCu);
                  }
                }
                uint64_t v52 = [v12 adjustedAssetUuids];
                __int16 v53 = v82;
                uint64_t v54 = [v82 uuid];
                [v52 addObject:v54];

                a6 = v94;
                id v23 = v79;
              }
              else
              {
                __int16 v53 = v82;
              }
              goto LABEL_78;
            }
            if (!*MEMORY[0x1E4F59AC0])
            {
              __int16 v53 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                long long v106 = v23;
                _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "Missing attributes for %@", buf, 0xCu);
              }
LABEL_78:

              uint64_t v49 = v85;
            }

LABEL_19:
            goto LABEL_36;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = v21;
            uint64_t v55 = [v12 memoryChanges];
            goto LABEL_86;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = v21;
            uint64_t v55 = [v12 suggestionChanges];
            goto LABEL_86;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = v21;
            uint64_t v55 = [v12 userFeedbackChanges];
            goto LABEL_86;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = v21;
            uint64_t v55 = [v12 personChanges];
            goto LABEL_86;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = v21;
            uint64_t v55 = [v12 faceCropChanges];
            goto LABEL_86;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = v21;
            long long v33 = [v32 associatedAssetForFaceOrTorso:1 orTemporal:0];
            if ([(PLCloudBatchUploader *)self _validateAsset:v33 onRelatedObject:v32])
            {
              [(PLCloudBatchUploader *)self _addAsset:v33 toAssetChanges:v81 isInsert:0 seenAssetUuid:v92];
              uint64_t v41 = [v12 faceChangedAssetUuids];
LABEL_49:
              uint64_t v42 = (void *)v41;
              uint64_t v43 = [v33 uuid];
              [v42 addObject:v43];

              id v12 = v88;
            }
LABEL_29:

LABEL_30:
LABEL_35:
            a6 = v94;
            goto LABEL_36;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v44 = v21;
            uint64_t v56 = [v44 shareURL];

            if (v56)
            {
              id v86 = v44;
              int v57 = [v44 momentShareAssets];
              long long v96 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              uint64_t v58 = [v57 countByEnumeratingWithState:&v96 objects:v109 count:16];
              if (v58)
              {
                uint64_t v59 = v58;
                uint64_t v60 = *(void *)v97;
                do
                {
                  for (uint64_t i = 0; i != v59; ++i)
                  {
                    if (*(void *)v97 != v60) {
                      objc_enumerationMutation(v57);
                    }
                    [(PLCloudBatchUploader *)self _addAsset:*(void *)(*((void *)&v96 + 1) + 8 * i) toAssetChanges:v91 isInsert:1 seenAssetUuid:v92];
                  }
                  uint64_t v59 = [v57 countByEnumeratingWithState:&v96 objects:v109 count:16];
                }
                while (v59);
              }

              id v12 = v88;
              uint64_t v44 = v86;
            }
            if ([v44 trashedState] == 1)
            {
              uint64_t v62 = [v44 cloudDeletionType];
              if (v62 == 7)
              {
                long long v74 = (void *)MEMORY[0x1E4F598E8];
                id v64 = [v44 scopeIdentifier];
                uint64_t v65 = v74;
                uint64_t v66 = v64;
                uint64_t v67 = 3;
              }
              else
              {
                if (v62 != 6) {
                  goto LABEL_59;
                }
                uint64_t v63 = (void *)MEMORY[0x1E4F598E8];
                id v64 = [v44 scopeIdentifier];
                uint64_t v65 = v63;
                uint64_t v66 = v64;
                uint64_t v67 = 2;
              }
              BOOL v75 = (void *)[v65 newDeleteScopeChangeWithScopeIdentifier:v66 type:v67];

              if (v75)
              {
                uint64_t v76 = [v12 deletedRecords];
                [v76 addObject:v75];
              }
            }
LABEL_59:

            goto LABEL_35;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = v21;
            uint64_t v55 = [v12 libraryScopeChanges];
LABEL_86:
            id v32 = v55;
            [v55 addObject:v39];
LABEL_45:

            goto LABEL_30;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v21;
            if (![v23 version]) {
              [v80 addObject:v23];
            }
            goto LABEL_19;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v68 = v21;
            uint64_t v83 = [v68 asset];
            unint64_t v69 = [v12 computeSyncChangedAssets];
            long long v70 = [v83 scopedIdentifier];
            [v69 addObject:v70];

            uint64_t v71 = v83;
            if ([(PLCloudBatchUploader *)self _validateAsset:v83 onRelatedObject:v68])
            {
              [(PLCloudBatchUploader *)self _addAsset:v83 toAssetChanges:v91 isInsert:v90 seenAssetUuid:v92];
              long long v72 = [v12 propertyChangedAssetUuids];
              long long v73 = [v83 uuid];
              [v72 addObject:v73];

              uint64_t v71 = v83;
            }

            goto LABEL_35;
          }
        }
        else
        {
          if (isKindOfClass)
          {
            long long v34 = v21;
            long long v35 = [(id)objc_opt_class() predicateForUnpushedDeferredAssets];
            int v36 = [v35 evaluateWithObject:v34];

            if (v36)
            {
              uint64_t v37 = [v12 deferredAssets];
              [v37 addObject:v34];
            }
            goto LABEL_35;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = v21;
            if ([v32 primaryLabelCode] != 1000) {
              goto LABEL_30;
            }
            uint64_t v39 = +[PLGraphNodeContainer newNodeContainerWithNode:v32];
            if ([v39 supportsCloudUpload])
            {
              long long v40 = [v12 socialGroupChanges];
              [v40 addObject:v39];
            }
            goto LABEL_45;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            id v23 = __CPLAssetsdOSLogDomain();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_19;
            }
            *(_DWORD *)buf = 138412290;
            long long v106 = v21;
            uint64_t v24 = v23;
            os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
            uint64_t v26 = "Object is not supported for CPL, skipping %@";
LABEL_14:
            uint32_t v27 = 12;
LABEL_18:
            _os_log_impl(&dword_19B3C7000, v24, v25, v26, buf, v27);
            goto LABEL_19;
          }
        }
LABEL_36:

        ++v19;
      }
      while (v19 != v17);
      uint64_t v77 = [obj countByEnumeratingWithState:&v101 objects:v110 count:16];
      uint64_t v17 = v77;
    }
    while (v77);
  }
}

- (void)_sortRelationshipData:(id)a3 forUploadChanges:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v21 = a4;
  id v8 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        BOOL v14 = [v8 existingObjectWithID:v13 error:0];
        if ([v14 supportsCloudUpload])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if ([v15 isDeleted])
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                long long v16 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v27 = v13;
                  uint64_t v17 = v16;
                  uint64_t v18 = "Skipping deleted asset %@";
                  goto LABEL_17;
                }
                goto LABEL_25;
              }
              goto LABEL_26;
            }
            if (!v15) {
              goto LABEL_26;
            }
            uint64_t v19 = [v15 filename];

            if (!v19) {
              goto LABEL_26;
            }
            uint64_t v20 = [v21 updatedRelationship];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_27;
            }
            id v15 = v14;
            if ([v15 isDeleted])
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                long long v16 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v27 = v13;
                  uint64_t v17 = v16;
                  uint64_t v18 = "Skipping deleted album %@";
LABEL_17:
                  _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
                }
LABEL_25:
              }
LABEL_26:

              goto LABEL_27;
            }
            if ([v15 kindValue] == 3999
              || [v15 kindValue] == 3998)
            {
              goto LABEL_26;
            }
            uint64_t v20 = [v21 albumChanges];
          }
          long long v16 = v20;
          [v20 addObject:v15];
          goto LABEL_25;
        }
LABEL_27:
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }
}

- (void)recordDeletions:(id)a3
{
  downloadedDeleteRecords = self->_downloadedDeleteRecords;
  id v5 = a3;
  [(NSMutableSet *)downloadedDeleteRecords removeAllObjects];
  [(NSMutableSet *)self->_downloadedDeleteRecords addObjectsFromArray:v5];
}

- (void)_pushBatches:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28D60];
  id v5 = a3;
  objc_msgSend(v4, "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_uploadBatchArray insertObjects:v5 atIndexes:v6];
}

- (void)_push:(id)a3
{
}

- (id)pop
{
  id v3 = [(NSMutableArray *)self->_uploadBatchArray firstObject];
  [(NSMutableArray *)self->_uploadBatchArray removeObjectAtIndex:0];
  return v3;
}

- (unint64_t)numberOfBatchesToUpload
{
  return [(NSMutableArray *)self->_uploadBatchArray count];
}

- (BOOL)hasBatchesToUpload
{
  return [(NSMutableArray *)self->_uploadBatchArray count] != 0;
}

- (void)addBatches:(id)a3
{
}

- (void)clearUploadArray
{
  [(NSMutableArray *)self->_uploadBatchArray removeAllObjects];
  momentSharesNeedingForceSync = self->_momentSharesNeedingForceSync;
  [(NSMutableSet *)momentSharesNeedingForceSync removeAllObjects];
}

- (PLCloudBatchUploader)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLCloudBatchUploader;
  id v6 = [(PLCloudBatchUploader *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uploadBatchArray = v7->_uploadBatchArray;
    v7->_uploadBatchArray = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    downloadedDeleteRecords = v7->_downloadedDeleteRecords;
    v7->_downloadedDeleteRecords = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    cameraAsset = v7->_cameraAsset;
    v7->_cameraAsset = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    momentSharesNeedingForceSync = v7->_momentSharesNeedingForceSync;
    v7->_momentSharesNeedingForceSync = (NSMutableSet *)v14;

    *(_WORD *)&v7->_initialUpload = 256;
  }

  return v7;
}

@end