@interface PLIngestJobCameraMetadata
+ (BOOL)faceObservationIngestDisabled;
+ (BOOL)facePrintIngestDisabled;
- (PFCameraMetadata)cameraMetadata;
- (PFCameraMetadata)overCaptureCameraMetadata;
- (PLIngestJobCameraMetadata)initWithCameraMetadataPath:(id)a3;
- (void)_ingestCameraMetadata;
- (void)applyCameraMetadataToAsset:(id)a3;
- (void)deserializeCameraMetadata;
- (void)setCameraMetadata:(id)a3;
- (void)setOverCaptureCameraMetadata:(id)a3;
@end

@implementation PLIngestJobCameraMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overCaptureCameraMetadata, 0);
  objc_storeStrong((id *)&self->_cameraMetadata, 0);
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
  objc_storeStrong((id *)&self->_smartCamInfo, 0);
  objc_storeStrong((id *)&self->_imageAestheticsObservation, 0);
  objc_storeStrong((id *)&self->_junkImageClassificationObservations, 0);
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_cameraMetadataPath, 0);
}

- (void)setOverCaptureCameraMetadata:(id)a3
{
}

- (PFCameraMetadata)overCaptureCameraMetadata
{
  return self->_overCaptureCameraMetadata;
}

- (PFCameraMetadata)cameraMetadata
{
  return self->_cameraMetadata;
}

- (void)applyCameraMetadataToAsset:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLIngestJobCameraMetadata *)self deserializeCameraMetadata];
  v5 = [(PFCameraMetadata *)self->_cameraMetadata saliencyObservation];

  if (v5)
  {
    if (!CGRectIsEmpty(self->_acceptableCropRect)) {
      [v4 setPackedAcceptableCropRect:PLCombineToInt64()];
    }
    if (!CGRectIsEmpty(self->_preferredCropRect)) {
      [v4 setPackedPreferredCropRect:PLCombineToInt64()];
    }
  }
  v62 = [v4 managedObjectContext];
  if (self->_imageAestheticsObservation)
  {
    v6 = [v4 computedAttributes];
    if (!v6)
    {
      v7 = +[PLComputedAssetAttributes entityName];
      v6 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v62, 0);

      [v4 setComputedAttributes:v6];
      [v6 setPropertiesFromImageAestheticsObservation:self->_imageAestheticsObservation];
    }
    [(VNImageAestheticsObservation *)self->_imageAestheticsObservation aestheticScore];
    objc_msgSend(v4, "setOverallAestheticScore:");
  }
  if (self->_sceneprintData)
  {
    v8 = [v4 additionalAttributes];
    [v8 setSceneprintWithData:self->_sceneprintData];
  }
  junkImageClassificationObservations = self->_junkImageClassificationObservations;
  if (junkImageClassificationObservations)
  {
    v61 = v4;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v10 = junkImageClassificationObservations;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v70 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          [v15 confidence];
          if (v16 >= 0.01)
          {
            v17 = [v15 identifier];
            v18 = +[PLSceneClassification PLJunkSceneClassificationIDForLabel:v17];

            if (v18)
            {
              v19 = [v62 photoLibrary];
              uint64_t v20 = (int)[v18 intValue];
              [v15 confidence];
              id v22 = +[PLSceneClassification insertIntoPhotoLibrary:v19 asset:v61 sceneIdentifier:v20 confidence:0 packedBoundingBoxRect:0 startTime:v21 duration:0.0 classificationType:0.0];
            }
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v12);
    }

    id v4 = v61;
    v23 = [v61 additionalAttributes];
    [v23 setSceneAnalysisVersion:(__int16)*MEMORY[0x1E4F8D120]];

    v24 = [v61 additionalAttributes];
    v25 = [v61 adjustmentTimestamp];
    if (v25)
    {
      [v24 setSceneAnalysisTimestamp:v25];
    }
    else
    {
      v26 = [v61 dateCreated];
      [v24 setSceneAnalysisTimestamp:v26];
    }
    char v68 = 1;
    v27 = [v61 additionalAttributes];
    v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v68 length:1];
    [v27 setDistanceIdentity:v28];
  }
  smartCamInfo = self->_smartCamInfo;
  if (smartCamInfo)
  {
    v30 = [(NSDictionary *)smartCamInfo objectForKeyedSubscript:*MEMORY[0x1E4F15890]];
    v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F52490]];
    if (v31)
    {
      v32 = [v62 photoLibrary];
      [v31 doubleValue];
      id v33 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v32, v4, 2147482063, 0, 0);
    }
    v34 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F524D8]];

    if (v34)
    {
      v35 = [v62 photoLibrary];
      [v34 doubleValue];
      id v36 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v35, v4, 2147482079, 0, 0);
    }
    v37 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F524C0]];

    if (v37)
    {
      v38 = [v62 photoLibrary];
      [v37 doubleValue];
      id v39 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v38, v4, 2147482095, 0, 0);
    }
    v40 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F52480]];

    if (v40)
    {
      v41 = [v62 photoLibrary];
      [v40 doubleValue];
      id v42 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v41, v4, 2147482111, 0, 0);
    }
    v43 = [(NSDictionary *)self->_smartCamInfo objectForKeyedSubscript:*MEMORY[0x1E4F15898]];
    int v44 = [v43 BOOLValue];

    if (v44)
    {
      v45 = [v4 additionalAttributes];
      [v45 setSceneAnalysisIsFromPreview:1];
    }
  }
  int64_t sharedLibraryMode = self->_sharedLibraryMode;
  v47 = self;
  v48 = 0;
  int v49 = 2;
  switch(sharedLibraryMode)
  {
    case 1:
    case 2:
      goto LABEL_43;
    case 3:
      PLLibraryScopeAssetSetUserManuallyRejectedState(1, v4);
      goto LABEL_50;
    case 4:
      int v49 = 3;
      LODWORD(v48) = 1;
LABEL_43:
      v50 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v62];
      v51 = v50;
      if (v50)
      {
        if (v48
          && !MEMORY[0x19F38BDA0](objc_msgSend(v50, "setCountOfAssetsAddedByCameraSmartSharing:", objc_msgSend(v50, "countOfAssetsAddedByCameraSmartSharing") + 1)))
        {
          int v49 = 2;
        }
        PLLibraryScopeAssetSetSuggestedByClientType(v49, v4);
        PLLibraryScopeAssetSetAddToSharedZoneState(1, v4);
        [v4 setLibraryScopeWithCurrentUserAsContributor:v51];
      }

      goto LABEL_50;
    case 5:
      PLLibraryScopeAssetSetCameraRejectedState(1, v4);
LABEL_50:
      v48 = v47;
      break;
    default:
      break;
  }
  v52 = [(PFCameraMetadata *)v48->_cameraMetadata faceObservations];
  if ([v52 count] && (objc_msgSend((id)objc_opt_class(), "faceObservationIngestDisabled") & 1) == 0)
  {
    v53 = [(PFCameraMetadata *)v48->_cameraMetadata torsoprints];
    unint64_t v54 = [v53 count];
    v55 = v4;
    if (v54 >= [v52 count])
    {
      char v58 = [(id)objc_opt_class() facePrintIngestDisabled];
      v56 = v48;
      char v57 = v58 ^ 1;
    }
    else
    {
      v56 = v48;
      char v57 = 0;
    }
    v59 = [(PFCameraMetadata *)v56->_cameraMetadata faceObservations];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __56__PLIngestJobCameraMetadata_applyCameraMetadataToAsset___block_invoke;
    v63[3] = &unk_1E5862510;
    id v64 = v62;
    char v67 = v57;
    id v65 = v55;
    id v66 = v53;
    id v60 = v53;
    [v59 enumerateObjectsUsingBlock:v63];

    id v4 = v55;
  }
}

void __56__PLIngestJobCameraMetadata_applyCameraMetadataToAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 32)];
  [v6 setAssetForFace:*(void *)(a1 + 40)];
  [v5 boundingBox];
  [v6 setCenterX:CGRectGetMidX(v28)];
  [v5 boundingBox];
  [v6 setCenterY:CGRectGetMidY(v29)];
  v7 = [v5 roll];
  [v7 doubleValue];
  objc_msgSend(v6, "setRoll:");

  v8 = [v5 yaw];
  [v8 doubleValue];
  objc_msgSend(v6, "setPoseYaw:");

  uint64_t v9 = [*(id *)(a1 + 40) width];
  uint64_t v10 = [*(id *)(a1 + 40) height];
  if (v9 && (uint64_t v11 = v10) != 0)
  {
    [v5 boundingBox];
    double v13 = v12 * (double)v9;
    [v5 boundingBox];
    double v15 = v14 * (double)v11;
    if (v13 >= v15) {
      double v15 = v13;
    }
    if (v9 <= v11) {
      uint64_t v16 = v11;
    }
    else {
      uint64_t v16 = v9;
    }
    [v6 setSize:v15 / (double)v16];
    [v6 setSourceWidth:v9];
    [v6 setSourceHeight:v11];
  }
  else
  {
    v17 = PLAssetImportGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)buf = 138412290;
      id v26 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Facerect ingest failure: cannot compute size due to missing width/height for asset: %@", buf, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v19 = [*(id *)(a1 + 48) objectAtIndex:a3];
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];

    if (v19 != v20)
    {
      id v24 = 0;
      float v21 = [v19 serializeStateAndReturnError:&v24];
      id v22 = v24;
      if (v21)
      {
        v23 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 32)];
        [v23 setFace:v6];
        [v23 setData:v21];
        -[NSObject setFaceprintVersion:](v23, "setFaceprintVersion:", [v19 requestRevision]);
        [v6 setFaceprint:v23];
        [v6 setAssetForFace:*(void *)(a1 + 40)];
        [v6 setFaceAlgorithmVersion:0];
      }
      else
      {
        v23 = PLAssetImportGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v22;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Faceprint ingest failure: failed to serialize faceprint with error %@", buf, 0xCu);
        }
      }
    }
  }
  [v6 fixAssetRelationshipsForFaceTorsoOrTemporal];
}

- (void)_ingestCameraMetadata
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(PFCameraMetadata *)self->_cameraMetadata saliencyObservation];

  if (v3)
  {
    id v4 = [(PFCameraMetadata *)self->_cameraMetadata saliencyObservation];
    [v4 narrowedBoundingBox];
    self->_acceptableCropRect.origin.x = v5;
    self->_acceptableCropRect.origin.y = v6;
    self->_acceptableCropRect.size.width = v7;
    self->_acceptableCropRect.size.height = v8;

    uint64_t v9 = [(PFCameraMetadata *)self->_cameraMetadata saliencyObservation];
    [v9 boundingBox];
    self->_preferredCropRect.origin.x = v10;
    self->_preferredCropRect.origin.y = v11;
    self->_preferredCropRect.size.width = v12;
    self->_preferredCropRect.size.height = v13;
  }
  double v14 = [(PFCameraMetadata *)self->_cameraMetadata imageAestheticsObservation];
  imageAestheticsObservation = self->_imageAestheticsObservation;
  self->_imageAestheticsObservation = v14;

  uint64_t v16 = [(PFCameraMetadata *)self->_cameraMetadata scenePrintObservation];
  v17 = [v16 sceneprints];
  v18 = [v17 firstObject];

  id v30 = 0;
  v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v30];
  id v20 = v30;
  sceneprintData = self->_sceneprintData;
  self->_sceneprintData = v19;

  if (!self->_sceneprintData)
  {
    id v22 = PLAssetImportGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v18 lengthInBytes];
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = v23;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Error serializing sceneprintData (length=%lu): %@", buf, 0x16u);
    }
  }
  id v24 = [(PFCameraMetadata *)self->_cameraMetadata junkImageClassificationObservations];
  junkImageClassificationObservations = self->_junkImageClassificationObservations;
  self->_junkImageClassificationObservations = v24;

  id v26 = [(PFCameraMetadata *)self->_cameraMetadata smartCamInfo];
  smartCamInfo = self->_smartCamInfo;
  self->_smartCamInfo = v26;

  CGRect v28 = [(PFCameraMetadata *)self->_cameraMetadata contactIDsInProximity];
  contactIDsInProximity = self->_contactIDsInProximity;
  self->_contactIDsInProximity = v28;

  self->_int64_t sharedLibraryMode = [(PFCameraMetadata *)self->_cameraMetadata sharedLibraryMode];
}

- (void)deserializeCameraMetadata
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_hasDeserializedMetadata)
  {
    cameraMetadataPath = self->_cameraMetadataPath;
    if (cameraMetadataPath)
    {
      id v13 = 0;
      id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:cameraMetadataPath options:2 error:&v13];
      CGFloat v5 = v13;
      if (v4)
      {
        id v12 = 0;
        CGFloat v6 = [MEMORY[0x1E4F8CBE0] deserializedMetadataFromData:v4 error:&v12];
        CGFloat v7 = v12;
        cameraMetadata = self->_cameraMetadata;
        self->_cameraMetadata = v6;

        if (self->_cameraMetadata)
        {
          [(PLIngestJobCameraMetadata *)self _ingestCameraMetadata];
        }
        else
        {
          CGFloat v10 = PLAssetImportGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = [v4 length];
            *(_DWORD *)buf = 134218242;
            uint64_t v15 = v11;
            __int16 v16 = 2112;
            v17 = v7;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Error deserializing camera metadata (length=%lu): %@", buf, 0x16u);
          }
        }
      }
      else
      {
        CGFloat v7 = PLAssetImportGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = self->_cameraMetadataPath;
          *(_DWORD *)buf = 138412546;
          uint64_t v15 = (uint64_t)v9;
          __int16 v16 = 2112;
          v17 = v5;
          _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Error reading camera metadata at path: %@ error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      CGFloat v5 = 0;
    }
    self->_hasDeserializedMetadata = 1;
  }
}

- (void)setCameraMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cameraMetadata, a3);
  [(PLIngestJobCameraMetadata *)self _ingestCameraMetadata];
}

- (PLIngestJobCameraMetadata)initWithCameraMetadataPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLIngestJobCameraMetadata;
  CGFloat v6 = [(PLIngestJobCameraMetadata *)&v11 init];
  CGFloat v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cameraMetadataPath, a3);
    CGPoint v8 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v7->_preferredCropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v7->_preferredCropRect.size = v9;
    v7->_acceptableCropRect.origin = v8;
    v7->_acceptableCropRect.size = v9;
  }

  return v7;
}

+ (BOOL)facePrintIngestDisabled
{
  if (facePrintIngestDisabled_onceToken != -1) {
    dispatch_once(&facePrintIngestDisabled_onceToken, &__block_literal_global_69);
  }
  if (!facePrintIngestDisabled_facePrintIngestDisabled) {
    return 0;
  }
  v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "PLIngestJobCameraMetadata initialized with face print ingest disabled", v4, 2u);
  }

  return facePrintIngestDisabled_facePrintIngestDisabled != 0;
}

void __52__PLIngestJobCameraMetadata_facePrintIngestDisabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  facePrintIngestDisabled_facePrintIngestDisabled = [v0 BOOLForKey:@"PLIngestJobCameraMetadataFacePrintIngestDisabled"];
}

+ (BOOL)faceObservationIngestDisabled
{
  if (faceObservationIngestDisabled_onceToken != -1) {
    dispatch_once(&faceObservationIngestDisabled_onceToken, &__block_literal_global_1676);
  }
  if (!faceObservationIngestDisabled_faceObservationIngestDisabled) {
    return 0;
  }
  v2 = PLAssetImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "PLIngestJobCameraMetadata initialized with face observation ingest disabled", v4, 2u);
  }

  return faceObservationIngestDisabled_faceObservationIngestDisabled != 0;
}

void __58__PLIngestJobCameraMetadata_faceObservationIngestDisabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  faceObservationIngestDisabled_faceObservationIngestDisabled = [v0 BOOLForKey:@"PLIngestJobCameraMetadataFaceObservationIngestDisabled"];
}

@end