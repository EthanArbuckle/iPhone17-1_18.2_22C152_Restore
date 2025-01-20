@interface PLFeatureAvailability
+ (id)_computeAvailabilityStatusFromSnapshot:(id)a3;
+ (id)availabilityFromFeatureAvailability:(id)a3 withGraphIsAvailable:(BOOL)a4;
- (NSDictionary)availabilityByFeature;
- (NSDictionary)dictionary;
- (PLFeatureAvailability)initWithDictionary:(id)a3;
- (PLFeatureAvailability)initWithProcessingSnapshot:(id)a3;
- (PLFeatureProcessingSnapshot)processingSnapshot;
- (id)fractionForFeature:(id)a3;
@end

@implementation PLFeatureAvailability

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityByFeature, 0);
  objc_storeStrong((id *)&self->_processingSnapshot, 0);
}

- (NSDictionary)availabilityByFeature
{
  return self->_availabilityByFeature;
}

- (PLFeatureProcessingSnapshot)processingSnapshot
{
  return self->_processingSnapshot;
}

- (id)fractionForFeature:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v5 = NSNumber;
    [(PLFeatureProcessingSnapshot *)self->_processingSnapshot fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
    v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = [v4 intValue];
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Requesting fractionForFeature:%d not implemented", (uint8_t *)v9, 8u);
    }

    v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionary
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"snapshotDictionary";
  v3 = [(PLFeatureProcessingSnapshot *)self->_processingSnapshot dictionary];
  v6[1] = @"availabilityByFeature";
  v7[0] = v3;
  v7[1] = self->_availabilityByFeature;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return (NSDictionary *)v4;
}

- (PLFeatureAvailability)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PLFeatureAvailability *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"availabilityByFeature"];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    availabilityByFeature = v5->_availabilityByFeature;
    v5->_availabilityByFeature = v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"snapshotDictionary"];
    if (v10) {
      v11 = [[PLFeatureProcessingSnapshot alloc] initWithDictionary:v10];
    }
    else {
      v11 = objc_alloc_init(PLFeatureProcessingSnapshot);
    }
    processingSnapshot = v5->_processingSnapshot;
    v5->_processingSnapshot = v11;

    v13 = v5;
  }

  return v5;
}

- (PLFeatureAvailability)initWithProcessingSnapshot:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLFeatureAvailability;
  v6 = [(PLFeatureAvailability *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processingSnapshot, a3);
    uint64_t v8 = +[PLFeatureAvailability _computeAvailabilityStatusFromSnapshot:v5];
    availabilityByFeature = v7->_availabilityByFeature;
    v7->_availabilityByFeature = (NSDictionary *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

+ (id)_computeAvailabilityStatusFromSnapshot:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v60 = [&unk_1EEBF2258 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v60)
  {
    uint64_t v5 = *(void *)v62;
    v6 = off_1E585E000;
    id v58 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v62 != v5) {
          objc_enumerationMutation(&unk_1EEBF2258);
        }
        uint64_t v8 = [*(id *)(*((void *)&v61 + 1) + 8 * v7) unsignedIntegerValue];
        id v9 = v3;
        uint64_t v10 = (void *)[objc_alloc(v6[263]) initWithFeature:v8];
        switch(v8)
        {
          case 0:
          case 4:
          case 5:
            goto LABEL_9;
          case 1:
            int v59 = [v9 hasConsistentMediaAnalysisImageVersion];
            [v9 fractionOfCuratedAssetsWithCaptions];
            double v18 = v17;
            [v10 fractionOfCuratedAssetsWithCaptionsThreshold];
            double v20 = v19;
            [v9 fractionOfCuratedAssetsWithEmbeddingsInVectorIndex];
            double v22 = v21;
            [v10 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
            double v24 = v23;
            [v9 fractionOfCuratedAssetsIndexedInVUClustering];
            double v26 = v25;
            [v10 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
            double v28 = v27;
            [v9 fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex];
            double v30 = v29;
            [v10 fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold];
            double v32 = v31;
            unint64_t v33 = [v9 totalCuratedAssetCount];
            v34 = v6;
            uint64_t v35 = v5;
            id v36 = v3;
            unint64_t v37 = [v10 minimumNumberOfCuratedAssets];
            int v38 = [v9 photosKnowledgeGraphIsReady];
            unsigned int v39 = [v9 vuIndexIsFullClustered];
            int v40 = v59;
            if (v18 < v20) {
              int v40 = 0;
            }
            if (v22 < v24) {
              int v40 = 0;
            }
            if (v26 < v28) {
              int v40 = 0;
            }
            if (v30 < v32) {
              int v40 = 0;
            }
            BOOL v41 = v33 >= v37;
            id v3 = v36;
            uint64_t v5 = v35;
            v6 = v34;
            id v4 = v58;
            if (!v41) {
              int v40 = 0;
            }
            uint64_t v14 = v40 & v38 & v39;
            break;
          case 2:
          case 3:
            [v9 fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
            double v12 = v11;
            [v10 fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold];
            uint64_t v14 = v12 >= v13;
            break;
          case 6:
            [v9 fractionOfCuratedAssetsWithCaptions];
            double v43 = v42;
            [v10 fractionOfCuratedAssetsWithCaptionsThreshold];
            BOOL v45 = v43 >= v44;
            [v9 fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
            double v47 = v46;
            [v10 fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold];
            double v49 = v48;
            [v9 fractionOfHighlightsEnriched];
            double v51 = v50;
            [v10 fractionOfHighlightsEnrichedThreshold];
            double v53 = v52;
            unsigned int v54 = [v9 photosKnowledgeGraphIsReady];
            BOOL v55 = v47 >= v49 && v45;
            if (v51 < v53) {
              BOOL v55 = 0;
            }
            uint64_t v14 = v55 & v54;
            break;
          default:
            if (v8 == 100) {
LABEL_9:
            }
              uint64_t v14 = 1;
            else {
              uint64_t v14 = 0;
            }
            break;
        }

        v15 = [NSNumber numberWithBool:v14];
        v16 = [NSNumber numberWithUnsignedInteger:v8];
        [v4 setObject:v15 forKeyedSubscript:v16];

        ++v7;
      }
      while (v60 != v7);
      uint64_t v56 = [&unk_1EEBF2258 countByEnumeratingWithState:&v61 objects:v65 count:16];
      uint64_t v60 = v56;
    }
    while (v56);
  }

  return v4;
}

+ (id)availabilityFromFeatureAvailability:(id)a3 withGraphIsAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = [a3 processingSnapshot];
  v6 = (void *)[v5 copy];

  [v6 setPhotosKnowledgeGraphIsReady:v4];
  uint64_t v7 = [[PLFeatureAvailability alloc] initWithProcessingSnapshot:v6];

  return v7;
}

@end