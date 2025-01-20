@interface PLCloudPhotoLibraryUploadTracker
- ($3CC19D079FD0B010EE84973AA846B91B)currentTransferProgress;
- (BOOL)_isMasterRecordUploaded:(id)a3;
- (BOOL)_trackingMasterForScopedIdentifier:(id)a3;
- (PLCloudPhotoLibraryUploadTracker)init;
- (id)_constructKeyForScopedIdentifier:(id)a3 type:(int)a4;
- (id)currentStateForDebug;
- (unint64_t)totalNumberOfDeferredAssets;
- (unint64_t)totalNumberOfUnpushedMasters;
- (unint64_t)totalNumberOfUploadedMasters;
- (unint64_t)totalSizeOfUnpushedOriginals;
- (unint64_t)totalUploadedOriginalSize;
- (void)_setBatchUploadStateForTrackedMasters:(id)a3 withState:(BOOL)a4;
- (void)_stopTrackingResourceWithScopedIdentifier:(id)a3 fileSize:(unint64_t)a4 type:(int)a5;
- (void)addSizeForUnpushedOriginals:(unint64_t)a3 forMasterScopedIdentifier:(id)a4 forAssetScopedIdentifier:(id)a5;
- (void)reset;
- (void)resetIfNeededWithLibrary:(id)a3 isInitialUpload:(BOOL)a4;
- (void)setupFromCPLManager:(id)a3;
- (void)setupFromLibrary:(id)a3 isInitialUpload:(BOOL)a4;
- (void)stopTrackingMaster:(id)a3;
- (void)trackDeferredAssetForScopedIdentifier:(id)a3;
- (void)updateForMasterResourceUploadWithScopedIdentifier:(id)a3 progress:(float)a4 fileSize:(unint64_t)a5 type:(int)a6;
- (void)uploadFinishedForMasterRecordWithScopedIdentifier:(id)a3 didUpdateStatus:(BOOL *)a4;
- (void)uploadFinishedForMasterResourceWithScopedIdentifier:(id)a3 fileSize:(unint64_t)a4 type:(int)a5 withError:(BOOL)a6;
@end

@implementation PLCloudPhotoLibraryUploadTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mastersToUploadTrackingSize, 0);
  objc_storeStrong((id *)&self->_masterRecordUploadState, 0);
  objc_storeStrong((id *)&self->_trackedResourceMasterUploaded, 0);
  objc_storeStrong((id *)&self->_trackedResourceProgressSize, 0);
  objc_storeStrong((id *)&self->_deferredAssetsToUpload, 0);
  objc_storeStrong((id *)&self->_mastersToUpload, 0);
  objc_storeStrong((id *)&self->_atomicProgress, 0);
}

- (void)reset
{
  [(PLAtomicObject *)self->_atomicProgress atomicallyPerformBlockAndWait:&__block_literal_global_65_72350];
  [(NSMutableSet *)self->_mastersToUpload removeAllObjects];
  [(NSMutableSet *)self->_deferredAssetsToUpload removeAllObjects];
  [(NSMutableDictionary *)self->_trackedResourceProgressSize removeAllObjects];
  [(NSMutableDictionary *)self->_trackedResourceMasterUploaded removeAllObjects];
  [(NSMutableSet *)self->_mastersToUploadTrackingSize removeAllObjects];
  masterRecordUploadState = self->_masterRecordUploadState;
  [(NSMutableDictionary *)masterRecordUploadState removeAllObjects];
}

double __41__PLCloudPhotoLibraryUploadTracker_reset__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(a2 + 56) = 0;
    double result = 0.0;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 24) = 0u;
    *(_OWORD *)(a2 + 8) = 0u;
  }
  return result;
}

- (id)currentStateForDebug
{
  v3 = [(NSMutableDictionary *)self->_masterRecordUploadState keysOfEntriesPassingTest:&__block_literal_global_60_72353];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"\nTracked Deferred assets count: %llu\nTracked masters still need to upload count: %lu", -[PLCloudPhotoLibraryUploadTracker totalNumberOfDeferredAssets](self, "totalNumberOfDeferredAssets"), objc_msgSend(v3, "count"));

  return v4;
}

uint64_t __56__PLCloudPhotoLibraryUploadTracker_currentStateForDebug__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue] ^ 1;
}

- (void)resetIfNeededWithLibrary:(id)a3 isInitialUpload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  atomicProgress = self->_atomicProgress;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PLCloudPhotoLibraryUploadTracker_resetIfNeededWithLibrary_isInitialUpload___block_invoke;
  v8[3] = &unk_1E586E958;
  v8[4] = &v9;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v8];
  if (*((unsigned char *)v10 + 24))
  {
    [(PLCloudPhotoLibraryUploadTracker *)self reset];
    [(PLCloudPhotoLibraryUploadTracker *)self setupFromLibrary:v6 isInitialUpload:v4];
  }
  _Block_object_dispose(&v9, 8);
}

void __77__PLCloudPhotoLibraryUploadTracker_resetIfNeededWithLibrary_isInitialUpload___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3) {
    BOOL v4 = (unint64_t)(v3[5] - 1) < v3[6];
  }
  else {
    BOOL v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (void)setupFromCPLManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sizeOfOriginalResourcesToUpload];
  uint64_t v6 = [v4 numberOfImagesToUpload];
  uint64_t v7 = [v4 numberOfVideosToUpload] + v6;
  uint64_t v8 = [v4 numberOfOtherItemsToUpload];

  atomicProgress = self->_atomicProgress;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PLCloudPhotoLibraryUploadTracker_setupFromCPLManager___block_invoke;
  v10[3] = &__block_descriptor_48_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
  v10[4] = v5;
  v10[5] = v7 + v8;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v10];
}

void __56__PLCloudPhotoLibraryUploadTracker_setupFromCPLManager___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    v3[5] += *(void *)(a1 + 32);
    v3[1] += *(void *)(a1 + 40);
  }
}

- (void)setupFromLibrary:(id)a3 isInitialUpload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!self->_mastersToUpload)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLCloudPhotoLibraryUploadTracker.m" lineNumber:244 description:@"_mastersToUpload must not be nil"];
  }
  if (!self->_deferredAssetsToUpload)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PLCloudPhotoLibraryUploadTracker.m" lineNumber:245 description:@"_deferredAssetsToUpload must not be nil"];
  }
  if (v4)
  {
    unint64_t v8 = +[PLManagedAsset totalSizeOfUnpushedOriginalsInPhotoLibrary:v7 outMasterList:self->_mastersToUpload isInitialUpload:1];
    uint64_t v9 = [(NSMutableSet *)self->_mastersToUpload count];
    [(PLCloudPhotoLibraryUploadTracker *)self _setBatchUploadStateForTrackedMasters:self->_mastersToUpload withState:0];
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v8 = 0;
  }
  unint64_t v10 = +[PLManagedAsset countOfDeferredAssetsToSyncInPhotoLibrary:v7 outAssetList:self->_deferredAssetsToUpload];
  atomicProgress = self->_atomicProgress;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PLCloudPhotoLibraryUploadTracker_setupFromLibrary_isInitialUpload___block_invoke;
  v14[3] = &__block_descriptor_56_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
  v14[4] = v8;
  v14[5] = v9;
  v14[6] = v10;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v14];
}

void __69__PLCloudPhotoLibraryUploadTracker_setupFromLibrary_isInitialUpload___block_invoke(void *a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3[4];
    v3[5] += a1[4];
    v3[1] += a1[5];
    v3[4] = a1[6] + v4;
  }
}

- (void)trackDeferredAssetForScopedIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_deferredAssetsToUpload)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLCloudPhotoLibraryUploadTracker.m" lineNumber:230 description:@"_deferredAssetsToUpload must not be nil"];
  }
  if ([(PLCloudPhotoLibraryUploadTracker *)self _trackingMasterForScopedIdentifier:v5])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v5;
        id v7 = "Deferred processing asset (%@) already tracked with a master change, ignoring in tracker";
        unint64_t v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v11, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    if (![(NSMutableSet *)self->_deferredAssetsToUpload containsObject:v5])
    {
      [(NSMutableSet *)self->_deferredAssetsToUpload addObject:v5];
      [(PLAtomicObject *)self->_atomicProgress atomicallyPerformBlockAndWait:&__block_literal_global_51_72375];
      goto LABEL_14;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        id v12 = v5;
        id v7 = "Deferred processing asset (%@) already tracked as pending, ignoring in tracker";
        unint64_t v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
        goto LABEL_11;
      }
LABEL_12:
    }
  }
LABEL_14:
}

void __74__PLCloudPhotoLibraryUploadTracker_trackDeferredAssetForScopedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  if (v2) {
    ++v2[4];
  }
}

- (void)addSizeForUnpushedOriginals:(unint64_t)a3 forMasterScopedIdentifier:(id)a4 forAssetScopedIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (![(PLCloudPhotoLibraryUploadTracker *)self _trackingMasterForScopedIdentifier:v8])
  {
    [(NSMutableSet *)self->_mastersToUpload addObject:v8];
    [(NSMutableDictionary *)self->_masterRecordUploadState setObject:MEMORY[0x1E4F1CC28] forKey:v8];
    [(NSMutableSet *)self->_mastersToUploadTrackingSize addObject:v8];
    int v10 = [(NSMutableSet *)self->_deferredAssetsToUpload containsObject:v9];
    char v11 = v10;
    if (v10) {
      [(NSMutableSet *)self->_deferredAssetsToUpload removeObject:v9];
    }
    atomicProgress = self->_atomicProgress;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __115__PLCloudPhotoLibraryUploadTracker_addSizeForUnpushedOriginals_forMasterScopedIdentifier_forAssetScopedIdentifier___block_invoke;
    v13[3] = &__block_descriptor_41_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
    v13[4] = a3;
    char v14 = v11;
    [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v13];
  }
}

void __115__PLCloudPhotoLibraryUploadTracker_addSizeForUnpushedOriginals_forMasterScopedIdentifier_forAssetScopedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    v3[5] += *(void *)(a1 + 32);
    ++v3[1];
    if (*(unsigned char *)(a1 + 40)) {
      --v3[4];
    }
  }
}

- (void)updateForMasterResourceUploadWithScopedIdentifier:(id)a3 progress:(float)a4 fileSize:(unint64_t)a5 type:(int)a6
{
  id v9 = [(PLCloudPhotoLibraryUploadTracker *)self _constructKeyForScopedIdentifier:a3 type:*(void *)&a6];
  unint64_t v10 = (unint64_t)(float)((float)a5 * a4);
  trackedResourceProgressSize = self->_trackedResourceProgressSize;
  id v12 = [NSNumber numberWithUnsignedLongLong:v10];
  [(NSMutableDictionary *)trackedResourceProgressSize setObject:v12 forKey:v9];

  double v13 = a4;
  if (a4 > 0.99)
  {
    char v14 = -[NSMutableDictionary objectForKey:](self->_trackedResourceMasterUploaded, "objectForKey:", v9, v13);
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) == 0) {
      [(NSMutableDictionary *)self->_trackedResourceMasterUploaded setObject:MEMORY[0x1E4F1CC38] forKey:v9];
    }
  }
  v16 = (void *)[(NSMutableDictionary *)self->_trackedResourceProgressSize copy];
  atomicProgress = self->_atomicProgress;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __109__PLCloudPhotoLibraryUploadTracker_updateForMasterResourceUploadWithScopedIdentifier_progress_fileSize_type___block_invoke;
  v19[3] = &unk_1E586EA08;
  id v20 = v16;
  id v18 = v16;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v19];
}

void __109__PLCloudPhotoLibraryUploadTracker_updateForMasterResourceUploadWithScopedIdentifier_progress_fileSize_type___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v4 = v3;
  if (v3) {
    v3[7] = v3[6];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        uint64_t v11 = [v10 integerValue];
        if (v4) {
          v4[7] += v11;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)uploadFinishedForMasterResourceWithScopedIdentifier:(id)a3 fileSize:(unint64_t)a4 type:(int)a5 withError:(BOOL)a6
{
  uint64_t v9 = [(PLCloudPhotoLibraryUploadTracker *)self _constructKeyForScopedIdentifier:a3 type:*(void *)&a5];
  atomicProgress = self->_atomicProgress;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__PLCloudPhotoLibraryUploadTracker_uploadFinishedForMasterResourceWithScopedIdentifier_fileSize_type_withError___block_invoke;
  v11[3] = &__block_descriptor_41_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
  BOOL v12 = a6;
  v11[4] = a4;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v11];
  [(NSMutableDictionary *)self->_trackedResourceProgressSize removeObjectForKey:v9];
  [(NSMutableDictionary *)self->_trackedResourceMasterUploaded removeObjectForKey:v9];
}

void __112__PLCloudPhotoLibraryUploadTracker_uploadFinishedForMasterResourceWithScopedIdentifier_fileSize_type_withError___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = a2;
  if (v3)
  {
    if (v4)
    {
      v4[7] = v4[6];
      v4[3] = v4[2];
    }
  }
  else if (v4)
  {
    v4[6] += *(void *)(a1 + 32);
    ++v4[2];
  }
}

- (void)uploadFinishedForMasterRecordWithScopedIdentifier:(id)a3 didUpdateStatus:(BOOL *)a4
{
  id v6 = a3;
  if (-[PLCloudPhotoLibraryUploadTracker _trackingMasterForScopedIdentifier:](self, "_trackingMasterForScopedIdentifier:"))
  {
    if (![(PLCloudPhotoLibraryUploadTracker *)self _isMasterRecordUploaded:v6])
    {
      [(PLAtomicObject *)self->_atomicProgress atomicallyPerformBlockAndWait:&__block_literal_global_45_72379];
      [(NSMutableDictionary *)self->_masterRecordUploadState setObject:MEMORY[0x1E4F1CC38] forKey:v6];
      if (a4) {
        *a4 = 1;
      }
    }
  }
}

void __102__PLCloudPhotoLibraryUploadTracker_uploadFinishedForMasterRecordWithScopedIdentifier_didUpdateStatus___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  if (v2) {
    ++v2[3];
  }
}

- (void)_stopTrackingResourceWithScopedIdentifier:(id)a3 fileSize:(unint64_t)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  if ([(PLCloudPhotoLibraryUploadTracker *)self _trackingMasterForScopedIdentifier:v8])
  {
    [(PLCloudPhotoLibraryUploadTracker *)self uploadFinishedForMasterResourceWithScopedIdentifier:v8 fileSize:a4 type:v5 withError:1];
    atomicProgress = self->_atomicProgress;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __92__PLCloudPhotoLibraryUploadTracker__stopTrackingResourceWithScopedIdentifier_fileSize_type___block_invoke;
    v10[3] = &__block_descriptor_40_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
    v10[4] = a4;
    [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v10];
  }
}

void __92__PLCloudPhotoLibraryUploadTracker__stopTrackingResourceWithScopedIdentifier_fileSize_type___block_invoke(uint64_t a1, void *a2)
{
  int v3 = a2;
  if (v3)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v3[5];
    BOOL v6 = v5 >= v4;
    unint64_t v7 = v5 - v4;
    if (!v6) {
      unint64_t v7 = 0;
    }
    v3[5] = v7;
  }
}

- (void)stopTrackingMaster:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 scopedIdentifier];
  if ([(NSMutableSet *)self->_mastersToUploadTrackingSize containsObject:v5])
  {
    long long v13 = v5;
    BOOL v6 = [v4 allMasterResources];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(MEMORY[0x1E4F59940], "resourceTypeTrackedForUpload:", objc_msgSend(v11, "cplType")))
          {
            BOOL v12 = [v4 scopedIdentifier];
            -[PLCloudPhotoLibraryUploadTracker _stopTrackingResourceWithScopedIdentifier:fileSize:type:](self, "_stopTrackingResourceWithScopedIdentifier:fileSize:type:", v12, [v11 dataLength], objc_msgSend(v11, "cplType"));
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    unint64_t v5 = v13;
    [(NSMutableSet *)self->_mastersToUploadTrackingSize removeObject:v13];
  }
  if ([(PLCloudPhotoLibraryUploadTracker *)self _trackingMasterForScopedIdentifier:v5])
  {
    [(NSMutableSet *)self->_mastersToUpload removeObject:v5];
    [(PLAtomicObject *)self->_atomicProgress atomicallyPerformBlockAndWait:&__block_literal_global_72383];
  }
}

void __55__PLCloudPhotoLibraryUploadTracker_stopTrackingMaster___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  if (v2) {
    --v2[1];
  }
}

- (void)_setBatchUploadStateForTrackedMasters:(id)a3 withState:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__PLCloudPhotoLibraryUploadTracker__setBatchUploadStateForTrackedMasters_withState___block_invoke;
  v4[3] = &unk_1E586E980;
  v4[4] = self;
  BOOL v5 = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

void __84__PLCloudPhotoLibraryUploadTracker__setBatchUploadStateForTrackedMasters_withState___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  int v3 = NSNumber;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 numberWithBool:v4];
  [v2 setObject:v6 forKey:v5];
}

- (BOOL)_isMasterRecordUploaded:(id)a3
{
  int v3 = [(NSMutableDictionary *)self->_masterRecordUploadState objectForKey:a3];
  char v4 = [v3 isEqualToNumber:MEMORY[0x1E4F1CC38]];

  return v4;
}

- (BOOL)_trackingMasterForScopedIdentifier:(id)a3
{
  return [(NSMutableSet *)self->_mastersToUpload containsObject:a3];
}

- (id)_constructKeyForScopedIdentifier:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v6 scopeIdentifier];

  uint64_t v9 = [v5 stringWithFormat:@"%@#%@-%d", v7, v8, v4];

  return v9;
}

- ($3CC19D079FD0B010EE84973AA846B91B)currentTransferProgress
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x4010000000;
  uint64_t v11 = &unk_19BBAE189;
  long long v12 = 0u;
  long long v13 = 0u;
  atomicProgress = self->_atomicProgress;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PLCloudPhotoLibraryUploadTracker_currentTransferProgress__block_invoke;
  v7[3] = &unk_1E586E958;
  v7[4] = &v8;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v7];
  long long v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var2 = v5;
  _Block_object_dispose(&v8, 8);
  return result;
}

uint64_t __59__PLCloudPhotoLibraryUploadTracker_currentTransferProgress__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2[7];
    uint64_t v3 = a2[5];
    uint64_t v4 = a2[3];
    uint64_t v5 = a2[4] + a2[1];
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  id v6 = *(void **)(*(void *)(result + 32) + 8);
  v6[4] = v2;
  v6[5] = v3;
  v6[6] = v4;
  v6[7] = v5;
  return result;
}

- (unint64_t)totalUploadedOriginalSize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PLCloudPhotoLibraryUploadTracker_totalUploadedOriginalSize__block_invoke;
  v5[3] = &unk_1E586E958;
  v5[4] = &v6;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__PLCloudPhotoLibraryUploadTracker_totalUploadedOriginalSize__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 56);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (unint64_t)totalSizeOfUnpushedOriginals
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PLCloudPhotoLibraryUploadTracker_totalSizeOfUnpushedOriginals__block_invoke;
  v5[3] = &unk_1E586E958;
  v5[4] = &v6;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__PLCloudPhotoLibraryUploadTracker_totalSizeOfUnpushedOriginals__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 40);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (unint64_t)totalNumberOfDeferredAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PLCloudPhotoLibraryUploadTracker_totalNumberOfDeferredAssets__block_invoke;
  v5[3] = &unk_1E586E958;
  v5[4] = &v6;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__PLCloudPhotoLibraryUploadTracker_totalNumberOfDeferredAssets__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (unint64_t)totalNumberOfUploadedMasters
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUploadedMasters__block_invoke;
  v5[3] = &unk_1E586E958;
  v5[4] = &v6;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUploadedMasters__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (unint64_t)totalNumberOfUnpushedMasters
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUnpushedMasters__block_invoke;
  v5[3] = &unk_1E586E958;
  v5[4] = &v6;
  [(PLAtomicObject *)atomicProgress atomicallyPerformBlockAndWait:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUnpushedMasters__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (PLCloudPhotoLibraryUploadTracker)init
{
  v21.receiver = self;
  v21.super_class = (Class)PLCloudPhotoLibraryUploadTracker;
  unint64_t v3 = [(PLCloudPhotoLibraryUploadTracker *)&v21 init];
  if (v3)
  {
    if ((PLIsAssetsd() & 1) == 0)
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:v3 file:@"PLCloudPhotoLibraryUploadTracker.m" lineNumber:40 description:@"only assetsd"];
    }
    uint64_t v4 = objc_alloc_init(PLCloudPhotoLibraryUploadProgress);
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8B880]) initWithObject:v4];
    atomicProgress = v3->_atomicProgress;
    v3->_atomicProgress = (PLAtomicObject *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    mastersToUpload = v3->_mastersToUpload;
    v3->_mastersToUpload = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    deferredAssetsToUpload = v3->_deferredAssetsToUpload;
    v3->_deferredAssetsToUpload = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    trackedResourceProgressSize = v3->_trackedResourceProgressSize;
    v3->_trackedResourceProgressSize = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    trackedResourceMasterUploaded = v3->_trackedResourceMasterUploaded;
    v3->_trackedResourceMasterUploaded = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    masterRecordUploadState = v3->_masterRecordUploadState;
    v3->_masterRecordUploadState = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    mastersToUploadTrackingSize = v3->_mastersToUploadTrackingSize;
    v3->_mastersToUploadTrackingSize = (NSMutableSet *)v17;
  }
  return v3;
}

@end