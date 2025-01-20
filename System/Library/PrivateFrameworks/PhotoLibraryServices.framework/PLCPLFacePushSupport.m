@interface PLCPLFacePushSupport
+ (BOOL)_shouldPushBeingKeyFace:(id)a3;
+ (BOOL)isFaceSyncable:(id)a3;
+ (void)applyFaceChangesFromAsset:(id)a3 toAssetChange:(id)a4 inPhotoLibrary:(id)a5;
+ (void)markSyncableFacesAsPushedInAsset:(id)a3;
- (BOOL)_faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:(id)a3;
- (PLCPLFacePushSupport)initWithSyncContext:(id)a3;
- (id)_facesAdjustmentsFingerprintFromAsset:(id)a3 assetChange:(id)a4;
- (id)cplFaceAnalysisRefFromAsset:(id)a3 algorithmVersion:(int64_t *)a4;
- (id)cplFaceRefFromFace:(id)a3;
- (id)cplFaceRefsFromFaces:(id)a3 algorithmVersion:(int64_t *)a4;
- (id)rejectedPersonIdentifiersForFace:(id)a3;
- (void)applyFaceChangesFromAsset:(id)a3 toAssetChange:(id)a4;
@end

@implementation PLCPLFacePushSupport

+ (void)applyFaceChangesFromAsset:(id)a3 toAssetChange:(id)a4 inPhotoLibrary:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x19F38D3B0]();
  v10 = [[PLLibrarySyncContext alloc] initWithPhotoLibrary:v8];
  v11 = [[PLCPLFacePushSupport alloc] initWithSyncContext:v10];
  [(PLCPLFacePushSupport *)v11 applyFaceChangesFromAsset:v12 toAssetChange:v7];
}

- (void).cxx_destruct
{
}

- (id)rejectedPersonIdentifiersForFace:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v18 = v3;
  v5 = [v3 rejectedPersons];
  v6 = [v5 allObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v13 personUUID];
        if (v14)
        {
          [v4 addObject:v14];
        }
        else if (!*v11)
        {
          v15 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = objc_msgSend(v13, "pl_shortDescription");
            *(_DWORD *)buf = 138412290;
            v24 = v16;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unexpected person with nil personUUID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  [v4 sortUsingComparator:&__block_literal_global_78417];
  return v4;
}

uint64_t __57__PLCPLFacePushSupport_rejectedPersonIdentifiersForFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)cplFaceRefFromFace:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F59888]);
  [v4 centerX];
  objc_msgSend(v5, "setCenterX:");
  [v4 centerY];
  objc_msgSend(v5, "setCenterY:");
  [v4 size];
  objc_msgSend(v5, "setSize:");
  [v4 bodyCenterX];
  objc_msgSend(v5, "setBodyCenterX:");
  [v4 bodyCenterY];
  objc_msgSend(v5, "setBodyCenterY:");
  [v4 bodyWidth];
  objc_msgSend(v5, "setBodyWidth:");
  [v4 bodyHeight];
  objc_msgSend(v5, "setBodyHeight:");
  objc_msgSend(v5, "setManual:", objc_msgSend(v4, "manual"));
  objc_msgSend(v5, "setKeyFace:", objc_msgSend((id)objc_opt_class(), "_shouldPushBeingKeyFace:", v4));
  objc_msgSend(v5, "setNameSource:", objc_msgSend(v4, "cloudNameSource"));
  if ([MEMORY[0x1E4F598F0] serverSupportsDetectionType]) {
    objc_msgSend(v5, "setDetectionType:", objc_msgSend(v4, "detectionType"));
  }
  v6 = [v4 personForFace];
  if ([v6 graphVerified] & 1) != 0 || (objc_msgSend(v6, "userVerified"))
  {
    id v7 = [v6 personUUID];
    [v5 setPersonIdentifier:v7];
  }
  else
  {
    [v5 setPersonIdentifier:0];
  }
  uint64_t v8 = [(PLCPLFacePushSupport *)self rejectedPersonIdentifiersForFace:v4];
  [v5 setRejectedPersonIdentifiers:v8];

  return v5;
}

- (id)cplFaceRefsFromFaces:(id)a3 algorithmVersion:(int64_t *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!v11) {
          int64_t v11 = (int)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "faceAlgorithmVersion", (void)v17);
        }
        if ([(id)objc_opt_class() isFaceSyncable:v14])
        {
          v15 = [(PLCPLFacePushSupport *)self cplFaceRefFromFace:v14];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    int64_t v11 = 0;
  }

  if (a4) {
    *a4 = v11;
  }

  return v7;
}

- (id)_facesAdjustmentsFingerprintFromAsset:(id)a3 assetChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PLCPLFacePushSupport _faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:](self, "_faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:", v6)&& [v6 faceDetectionComplete])
  {
    if ([v6 hasAdjustments])
    {
      id v8 = [v7 adjustments];
      uint64_t v9 = [v8 otherAdjustmentsFingerprint];

      if (v9) {
        goto LABEL_7;
      }
      id v10 = [v6 syncedAdjustmentFingerprint];
    }
    else
    {
      id v10 = (id)*MEMORY[0x1E4F59730];
    }
    uint64_t v9 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_7:

  return v9;
}

- (BOOL)_faceAnalysisWasPerformedOnLatestAdjustmentOfAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dateForComparingAdjustmentVersions];
  id v5 = [v3 faceAdjustmentVersion];

  LOBYTE(v3) = [v4 isEqualToDate:v5];
  return (char)v3;
}

- (id)cplFaceAnalysisRefFromAsset:(id)a3 algorithmVersion:(int64_t *)a4
{
  id v6 = [a3 detectedFaces];
  id v7 = [v6 allObjects];

  id v8 = [(PLCPLFacePushSupport *)self cplFaceRefsFromFaces:v7 algorithmVersion:a4];
  id v9 = objc_alloc_init(MEMORY[0x1E4F59878]);
  if ([v8 count]) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  [v9 setFaces:v10];

  return v9;
}

- (void)applyFaceChangesFromAsset:(id)a3 toAssetChange:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PLSyncContext *)self->_syncContext serverSupportsVision])
  {
    uint64_t v14 = 0;
    id v8 = [(PLCPLFacePushSupport *)self cplFaceAnalysisRefFromAsset:v6 algorithmVersion:&v14];
    [v7 setFaces:v8];
    id v9 = [v8 faces];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      [v7 setFacesVersion:v14];
      int64_t v11 = [(PLCPLFacePushSupport *)self _facesAdjustmentsFingerprintFromAsset:v6 assetChange:v7];
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v6 syncDescription];
          *(_DWORD *)buf = 138412546;
          v16 = v11;
          __int16 v17 = 2112;
          long long v18 = v13;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Pushing faces adjustment fingerprint (%@) for asset: %@", buf, 0x16u);
        }
      }
      [v7 setFacesAdjustmentsFingerprint:v11];
    }
  }
}

- (PLCPLFacePushSupport)initWithSyncContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCPLFacePushSupport;
  id v6 = [(PLCPLFacePushSupport *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_syncContext, a3);
    id v8 = v7;
  }

  return v7;
}

+ (void)markSyncableFacesAsPushedInAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a3, "detectedFaces", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (+[PLCPLFacePushSupport isFaceSyncable:v8]
          && [v8 cloudLocalState] != 1)
        {
          [v8 setCloudLocalState:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (BOOL)_shouldPushBeingKeyFace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 personForFace];
  uint64_t v5 = [v4 personUUID];

  uint64_t v6 = [v3 personBeingKeyFace];
  id v7 = [v6 personUUID];

  if (v5 && [v5 isEqualToString:v7])
  {
    id v8 = [v3 personBeingKeyFace];
    char v9 = [v8 keyFaceIsPicked];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isFaceSyncable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PLDetectedFace syncableFacesPredicate];
  char v5 = [v4 evaluateWithObject:v3];

  return v5;
}

@end