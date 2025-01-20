@interface PLFaceRebuildHelper
- (PLFaceRebuildHelper)initWithContext:(id)a3;
- (id)findExistingDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4;
- (id)findOrInsertDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4;
- (id)insertDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4;
- (void)rebuildDetectedFace:(id)a3 onAsset:(id)a4 person:(id)a5;
- (void)rebuildHiddenFace:(id)a3 onAsset:(id)a4;
- (void)rebuildRejectedFace:(id)a3 onAsset:(id)a4 person:(id)a5;
@end

@implementation PLFaceRebuildHelper

- (void).cxx_destruct
{
}

- (id)findExistingDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 additionalDescription];
  v8 = [PLFaceDimension alloc];
  uint64_t v9 = [v5 width];
  uint64_t v10 = [v5 height];
  [v6 centerX];
  double v12 = v11;
  [v6 centerY];
  double v14 = v13;
  [v6 size];
  double v16 = v15;

  [v7 bodyCenterX];
  double v18 = v17;
  [v7 bodyCenterY];
  double v20 = v19;
  [v7 bodyWidth];
  double v22 = v21;
  [v7 bodyCenterY];
  v24 = [(PLFaceDimension *)v8 initWithSourceWidth:v9 sourceHeight:v10 centerX:v12 centerY:v14 size:v16 bodyCenterX:v18 bodyCenterY:v20 bodyWidth:v22 bodyHeight:v23];
  v25 = [v5 mutableDetectedFaces];

  v26 = +[PLDetectedFace findExistingFaceMatchingDimension:v24 inFaces:v25 ignoreSourceAssetDimensions:1];

  return v26;
}

- (id)insertDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLMigrationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v17 = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Inserting new face", v17, 2u);
  }

  uint64_t v9 = +[PLManagedObject insertInManagedObjectContext:self->_context];
  [v6 centerX];
  objc_msgSend(v9, "setCenterX:");
  [v6 centerY];
  objc_msgSend(v9, "setCenterY:");
  [v6 size];
  objc_msgSend(v9, "setSize:");
  uint64_t v10 = [v6 additionalDescription];
  double v11 = v10;
  if (v10)
  {
    [v10 bodyCenterX];
    objc_msgSend(v9, "setBodyCenterX:");
    [v11 bodyCenterY];
    objc_msgSend(v9, "setBodyCenterY:");
    [v11 bodyWidth];
    objc_msgSend(v9, "setBodyWidth:");
    [v11 bodyHeight];
    objc_msgSend(v9, "setBodyHeight:");
    double v12 = [v11 detectionType];

    if (v12)
    {
      double v13 = [v11 detectionType];
      objc_msgSend(v9, "setDetectionType:", (__int16)objc_msgSend(v13, "intValue"));
    }
    if ([v11 faceAlgorithmVersion]) {
      uint64_t v14 = [v11 faceAlgorithmVersion];
    }
    else {
      uint64_t v14 = 1;
    }
    [v9 setFaceAlgorithmVersion:v14];
  }
  objc_msgSend(v9, "setManual:", objc_msgSend(v6, "isManual"));
  objc_msgSend(v9, "setHidden:", objc_msgSend(v6, "isHidden"));
  objc_msgSend(v9, "setNameSource:", objc_msgSend(v6, "nameSource"));
  objc_msgSend(v9, "setCloudNameSource:", objc_msgSend(v6, "cloudNameSource"));
  objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "width"));
  objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "height"));
  double v15 = [v7 mutableDetectedFaces];

  [v15 addObject:v9];
  return v9;
}

- (id)findOrInsertDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PLFaceRebuildHelper *)self findExistingDetectedFaceForRebuildFace:v6 onAsset:v7];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      double v13 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Found existing face: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = [(PLFaceRebuildHelper *)self insertDetectedFaceForRebuildFace:v6 onAsset:v7];
  }

  return v9;
}

- (void)rebuildHiddenFace:(id)a3 onAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLMigrationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Rebuilding hidden face", v10, 2u);
  }

  id v9 = [(PLFaceRebuildHelper *)self findOrInsertDetectedFaceForRebuildFace:v6 onAsset:v7];
}

- (void)rebuildRejectedFace:(id)a3 onAsset:(id)a4 person:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = PLMigrationGetLog();
  int v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Rebuilding rejected face", (uint8_t *)&v17, 2u);
    }

    double v13 = [(PLFaceRebuildHelper *)self findOrInsertDetectedFaceForRebuildFace:v8 onAsset:v9];
    int v12 = v13;
    if (v13)
    {
      [v13 addRejectedPerson:v10];
      if ([v8 isClusterRejected])
      {
        [v12 addClusterRejectedPerson:v10];
        [v12 addRejectedPersonNeedingFaceCrops:v10];
        uint64_t v14 = PLMigrationGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          double v15 = [v9 uuid];
          double v16 = objc_msgSend(v10, "pl_shortDescription");
          int v17 = 138412546;
          id v18 = v15;
          __int16 v19 = 2112;
          double v20 = v16;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Face rebuild scheduling rejected face crop generation for asset %@ person %@", (uint8_t *)&v17, 0x16u);
        }
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Skipping rebuild of rejected face because person is nil: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)rebuildDetectedFace:(id)a3 onAsset:(id)a4 person:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = PLMigrationGetLog();
  int v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Rebuilding detected face", (uint8_t *)&v17, 2u);
    }

    double v13 = [(PLFaceRebuildHelper *)self findOrInsertDetectedFaceForRebuildFace:v8 onAsset:v9];
    int v12 = v13;
    if (v13)
    {
      [v13 setAssociatedPerson:v10];
      if ([v8 isRepresentative]) {
        objc_msgSend(v10, "setKeyFace:pickSource:", v12, objc_msgSend(v10, "keyFacePickSource"));
      }
      if ((_PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass((void *)*MEMORY[0x1E4F17570]) & 1) == 0
        && ([v8 nameSource] == 1 || objc_msgSend(v8, "nameSource") == 5))
      {
        [v12 setConfirmedFaceCropGenerationState:1];
        uint64_t v14 = PLMigrationGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          double v15 = [v9 uuid];
          double v16 = objc_msgSend(v10, "pl_shortDescription");
          int v17 = 138412546;
          id v18 = v15;
          __int16 v19 = 2112;
          double v20 = v16;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Face rebuild scheduling confirmed face crop generation for asset %@ person %@", (uint8_t *)&v17, 0x16u);
        }
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Skipping rebuild of detected face because person is nil: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (PLFaceRebuildHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFaceRebuildHelper;
  id v6 = [(PLFaceRebuildHelper *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    id v8 = v7;
  }

  return v7;
}

@end