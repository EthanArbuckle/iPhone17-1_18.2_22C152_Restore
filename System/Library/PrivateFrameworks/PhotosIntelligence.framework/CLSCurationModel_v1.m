@interface CLSCurationModel_v1
+ (id)baseSpecificationWithSpecification:(id)a3;
+ (signed)uninterestingAudioClassifications;
- (BOOL)asset:(id)a3 isAestheticallyAwesomeWithContext:(id)a4;
- (BOOL)assetIsJunkWithSceneClassifications:(id)a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:(id)a4 confidenceThresholdBySceneIdentifierForJunkingScenes:(id)a5 confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:(id)a6 forMemories:(BOOL)a7;
- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4;
- (BOOL)avoidIfPossibleForMemoryKeyAssetWithAsset:(id)a3;
- (BOOL)hasInterestingAudioClassificationWithAsset:(id)a3;
- (BOOL)hasInterestingScenesWithAsset:(id)a3;
- (BOOL)hasPoorResolutionWithAsset:(id)a3;
- (BOOL)imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:(id)a3 forKeyAsset:(BOOL)a4 forMemories:(BOOL)a5;
- (BOOL)imageAssetIsJunkFromSceneAndJunkClassifications:(id)a3;
- (BOOL)isAestheticallyAwesomeWithAsset:(id)a3;
- (BOOL)isAestheticallyPrettyGoodWithAsset:(id)a3;
- (BOOL)isBadQualityForImageKeyAssetWithAsset:(id)a3 statistics:(id *)a4;
- (BOOL)isBlurryWithAsset:(id)a3;
- (BOOL)isGoldWithAsset:(id)a3;
- (BOOL)isInhabitedWithAsset:(id)a3;
- (BOOL)isInterestingHDRWithAsset:(id)a3;
- (BOOL)isInterestingLivePhotoWithAsset:(id)a3;
- (BOOL)isInterestingPanoramaWithAsset:(id)a3;
- (BOOL)isInterestingSDOFWithAsset:(id)a3;
- (BOOL)isInterestingVideoWithAsset:(id)a3;
- (BOOL)isJunkWithJunkClassification:(id)a3;
- (BOOL)isJunkWithSignal:(id)a3 isReliable:(BOOL *)a4;
- (BOOL)isNonMemorableWithAsset:(id)a3;
- (BOOL)isRegularGemWithAsset:(id)a3;
- (BOOL)isShinyGemWithAsset:(id)a3;
- (BOOL)isTragicFailureWithImageAsset:(id)a3;
- (BOOL)isUtilityForImageAsset:(id)a3;
- (BOOL)isUtilityForMemoriesForImageAsset:(id)a3;
- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4;
- (BOOL)isUtilityForSyndicationWithAsset:(id)a3;
- (BOOL)isUtilityForVideoAsset:(id)a3;
- (BOOL)isUtilityWithAsset:(id)a3;
- (CLSAestheticsModel)aestheticsModel;
- (CLSCurationModel_v1)initWithCurationModelSpecification:(id)a3;
- (CLSFaceModel)faceModel;
- (CLSJunkClassificationModel)junkClassificationModel;
- (CLSMediaAnalysisModel)mediaAnalysisModel;
- (CLSMediaPreAnalysisModel)mediaPreAnalysisModel;
- (CLSSceneModel)sceneModel;
- (NSDictionary)confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
- (NSDictionary)confidenceThresholdBySceneIdentifierForBabyScenes;
- (NSDictionary)confidenceThresholdBySceneIdentifierForInterestingScenes;
- (NSDictionary)confidenceThresholdBySceneIdentifierForUtilityScenes;
- (NSDictionary)confidenceThresholdBySceneIdentifierForWhiteboardScenes;
- (double)faceSizeLowerLimit;
- (double)faceSizeUpperLimit;
- (double)minimumDurationForHighFramerateVideoToNotBeJunk;
- (double)minimumDurationForTimelapseVideoToNotBeJunk;
- (double)minimumDurationForVideoToNotBeJunk;
- (double)scoreWithAsset:(id)a3 inContext:(id)a4;
- (float)interactionScoreWithAsset:(id)a3;
- (id)faceInformationSummaryWithFaces:(id)a3 detectionTraitsByFaceLocalIdentifier:(id)a4 verifiedPersonUUIDs:(id)a5 hiddenPersonUUIDs:(id)a6 personUUIDByMergeCandidateUUID:(id)a7 userFeedbackCalculator:(id)a8 assetUUID:(id)a9;
- (id)initForTesting;
- (id)sceneIdentifiersOfInterestingScenes;
- (signed)interestingAudioClassificationsWithAsset:(id)a3;
- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3;
- (void)enumerateSignalModelsUsingBlock:(id)a3;
@end

@implementation CLSCurationModel_v1

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForWhiteboardScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForInterestingScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForUtilityScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForBabyScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes, 0);
  objc_storeStrong((id *)&self->_faceModel, 0);
  objc_storeStrong((id *)&self->_junkClassificationModel, 0);
  objc_storeStrong((id *)&self->_aestheticsModel, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisModel, 0);
  objc_storeStrong((id *)&self->_mediaPreAnalysisModel, 0);
  objc_storeStrong((id *)&self->_sceneModel, 0);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForWhiteboardScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForInterestingScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForUtilityScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForBabyScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (double)faceSizeLowerLimit
{
  return self->_faceSizeLowerLimit;
}

- (double)faceSizeUpperLimit
{
  return self->_faceSizeUpperLimit;
}

- (CLSFaceModel)faceModel
{
  return (CLSFaceModel *)objc_getProperty(self, a2, 48, 1);
}

- (CLSJunkClassificationModel)junkClassificationModel
{
  return (CLSJunkClassificationModel *)objc_getProperty(self, a2, 40, 1);
}

- (CLSAestheticsModel)aestheticsModel
{
  return (CLSAestheticsModel *)objc_getProperty(self, a2, 32, 1);
}

- (CLSMediaAnalysisModel)mediaAnalysisModel
{
  return (CLSMediaAnalysisModel *)objc_getProperty(self, a2, 24, 1);
}

- (CLSMediaPreAnalysisModel)mediaPreAnalysisModel
{
  return (CLSMediaPreAnalysisModel *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSceneModel)sceneModel
{
  return (CLSSceneModel *)objc_getProperty(self, a2, 8, 1);
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  char v4 = 0;
  junkClassificationModel = self->_junkClassificationModel;
  if (junkClassificationModel) {
    (*((void (**)(id, CLSJunkClassificationModel *, char *))a3 + 2))(a3, junkClassificationModel, &v4);
  }
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  char v11 = 0;
  mediaPreAnalysisModel = self->_mediaPreAnalysisModel;
  if (!mediaPreAnalysisModel
    || ((*((void (**)(id, CLSMediaPreAnalysisModel *, char *))v4 + 2))(v4, mediaPreAnalysisModel, &v11), !v11))
  {
    mediaAnalysisModel = self->_mediaAnalysisModel;
    if (!mediaAnalysisModel
      || (((void (**)(void, CLSMediaAnalysisModel *, char *))v5)[2](v5, mediaAnalysisModel, &v11), !v11))
    {
      junkClassificationModel = self->_junkClassificationModel;
      if (!junkClassificationModel
        || (((void (**)(void, CLSJunkClassificationModel *, char *))v5)[2](v5, junkClassificationModel, &v11), !v11))
      {
        aestheticsModel = self->_aestheticsModel;
        if (!aestheticsModel
          || (((void (**)(void, CLSAestheticsModel *, char *))v5)[2](v5, aestheticsModel, &v11), !v11))
        {
          faceModel = self->_faceModel;
          if (faceModel) {
            ((void (**)(void, CLSFaceModel *, char *))v5)[2](v5, faceModel, &v11);
          }
        }
      }
    }
  }
}

- (double)minimumDurationForHighFramerateVideoToNotBeJunk
{
  return 1.0;
}

- (double)minimumDurationForTimelapseVideoToNotBeJunk
{
  return 2.0;
}

- (double)minimumDurationForVideoToNotBeJunk
{
  return 3.0;
}

- (id)faceInformationSummaryWithFaces:(id)a3 detectionTraitsByFaceLocalIdentifier:(id)a4 verifiedPersonUUIDs:(id)a5 hiddenPersonUUIDs:(id)a6 personUUIDByMergeCandidateUUID:(id)a7 userFeedbackCalculator:(id)a8 assetUUID:(id)a9
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v50 = a5;
  id v54 = a6;
  unint64_t v13 = [v12 count];
  uint64_t v14 = MEMORY[0x263EFFA78];
  if (!v13)
  {
    uint64_t v40 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v17 = 0;
    double v41 = 0.0;
    double v39 = 0.0;
    id v15 = (id)MEMORY[0x263EFFA78];
    goto LABEL_34;
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v51 = [(CLSFaceModel *)self->_faceModel qualityNode];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (!v17)
  {

    uint64_t v43 = 0;
    uint64_t v42 = 0;
    uint64_t v40 = 0;
    double v41 = 0.0;
    double v39 = 0.0 / (double)v13;
    goto LABEL_33;
  }
  unint64_t v46 = v13;
  id v47 = v12;
  unint64_t v48 = 0;
  uint64_t v49 = 0;
  id v56 = v15;
  uint64_t v57 = 0;
  id obj = v16;
  uint64_t v53 = 0;
  uint64_t v55 = *(void *)v59;
  double v18 = 0.0;
  double v19 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v59 != v55) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      [v21 size];
      double v23 = v22;
      [v21 quality];
      double v25 = v24;
      int v26 = [v21 eyesState];
      BOOL v27 = v23 >= self->_faceSizeLowerLimit && v23 <= self->_faceSizeUpperLimit;
      if (v26 == 2)
      {
        char v28 = [v51 passesHighPrecisionWithConfidence:v25] & v27;
        v57 += v28 & 1;
        uint64_t v29 = [v51 passesWithConfidence:v25] & v27;
      }
      else
      {
        char v28 = 0;
        uint64_t v29 = 0;
      }
      v30 = [v21 personLocalIdentifier];
      v31 = [MEMORY[0x263F14E88] uuidFromLocalIdentifier:v30];
      if (!v30)
      {
        v35 = [MEMORY[0x263F08C38] UUID];
        v30 = [v35 UUIDString];

LABEL_20:
        v38 = [CLSFaceInformation alloc];
        [v21 size];
        uint64_t v37 = -[CLSFaceInformation initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v38, "initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v27, v28 & 1, v29, MEMORY[0x263EFFA68]);
        goto LABEL_21;
      }
      if ([v54 containsObject:v31])
      {
        ++v53;
        v32 = [CLSFaceInformation alloc];
        [v21 size];
        v33 = v32;
        id v15 = v56;
        id v34 = -[CLSFaceInformation initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v33, "initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v27, v28 & 1, v29, MEMORY[0x263EFFA68]);
        goto LABEL_22;
      }
      if (!v31 || ![v50 containsObject:v31]) {
        goto LABEL_20;
      }
      double v18 = v18 + v25;
      ++v48;
      v49 += v28 & 1;
      v36 = [CLSFaceInformation alloc];
      [v21 size];
      uint64_t v37 = -[CLSFaceInformation initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v36, "initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v27, v28 & 1, v29, MEMORY[0x263EFFA68]);
LABEL_21:
      id v34 = (id)v37;
      id v15 = v56;
LABEL_22:
      [v15 setObject:v34 forKeyedSubscript:v30];
      double v19 = v19 + v25;
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  }
  while (v17);

  unint64_t v13 = v46;
  id v12 = v47;
  double v39 = v19 / (double)v46;
  uint64_t v40 = v49;
  if (v48) {
    uint64_t v17 = v48;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v48) {
    double v41 = v18 / (double)v48;
  }
  else {
    double v41 = v18;
  }
  uint64_t v14 = MEMORY[0x263EFFA78];
  uint64_t v42 = v57;
  uint64_t v43 = v53;
LABEL_33:

LABEL_34:
  v44 = [[CLSAssetFaceInformationSummary alloc] initWithNumberOfFaces:v13 numberOfFacesIncludingPets:0 numberOfFacesOfVerifiedPersons:v17 numberOfFacesOfHiddenPersons:v43 numberOfGoodFaces:v42 numberOfGoodFacesIncludingPets:0 numberOfGoodFacesOfVerifiedPersons:v39 averageFaceQuality:0.0 averageFaceQualityIncludingPets:v41 averageFaceQualityOfVerifiedPersons:0.0 userFeedbackScore:v40 faceInformationByPersonLocalIdentifier:v15 faceInformationByConsolidatedPersonLocalIdentifier:v14];

  return v44;
}

- (BOOL)assetIsJunkWithSceneClassifications:(id)a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:(id)a4 confidenceThresholdBySceneIdentifierForJunkingScenes:(id)a5 confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:(id)a6 forMemories:(BOOL)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v37 = a5;
  id v40 = a6;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int v41 = 0;
    char v38 = 0;
    int v16 = 0;
    char v17 = 0;
    uint64_t v18 = *(void *)v45;
    id v39 = v12;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "extendedSceneIdentifier", v37);
        [v20 confidence];
        double v23 = v22;
        junkClassificationModel = self->_junkClassificationModel;
        if (!junkClassificationModel
          || ![(CLSJunkClassificationModel *)junkClassificationModel isResponsibleForSignalIdentifier:v21])
        {
          int v26 = [NSNumber numberWithUnsignedLongLong:v21];
          BOOL v27 = [v12 objectForKeyedSubscript:v26];
          char v28 = v27;
          if (v27)
          {
            [v27 doubleValue];
            if (v23 >= v29)
            {

              goto LABEL_35;
            }
            goto LABEL_31;
          }
          if (((v16 | v41) & 1) == 0)
          {
            id v30 = v13;
            v31 = [v40 objectForKeyedSubscript:v26];
            v32 = v31;
            if (v31)
            {
              [v31 doubleValue];
              if (v23 >= v33)
              {
                char v17 = 0;
                int v41 = 1;
                goto LABEL_30;
              }
LABEL_29:
              int v41 = 0;
            }
            else
            {
              if ((v38 & 1) == 0)
              {
                id v34 = [v37 objectForKeyedSubscript:v26];
                if (v34)
                {
                  id v42 = v34;
                  [v34 doubleValue];
                  if (v23 >= v35)
                  {
                    char v38 = 1;
                    char v17 = 1;
                  }
                  else
                  {
                    char v38 = 0;
                  }
                  id v34 = v42;
                }
                else
                {
                  char v38 = 0;
                }

                goto LABEL_29;
              }
              int v41 = 0;
              char v38 = 1;
            }
LABEL_30:

            id v13 = v30;
            id v12 = v39;
          }
LABEL_31:

          continue;
        }
        char v43 = 0;
        BOOL v25 = [(CLSCurationModel_v1 *)self isJunkWithSignal:v20 isReliable:&v43];
        if (v43 && !v25) {
          goto LABEL_35;
        }
        if (v43) {
          char v17 = v25;
        }
        v16 |= v43 != 0;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (!v15) {
        goto LABEL_36;
      }
    }
  }
LABEL_35:
  char v17 = 0;
LABEL_36:

  return v17 & 1;
}

- (BOOL)isJunkWithSignal:(id)a3 isReliable:(BOOL *)a4
{
  id v6 = a3;
  junkClassificationModel = self->_junkClassificationModel;
  if (!junkClassificationModel) {
    goto LABEL_7;
  }
  v8 = [(CLSJunkClassificationModel *)junkClassificationModel negativeNode];
  char v9 = [v8 passesHighPrecisionWithSignal:v6];

  if (v9) {
    goto LABEL_6;
  }
  v10 = [(CLSJunkClassificationModel *)self->_junkClassificationModel nonMemorableNode];
  char v11 = [v10 passesWithSignal:v6];

  if (v11) {
    goto LABEL_6;
  }
  id v12 = [(CLSJunkClassificationModel *)self->_junkClassificationModel poorQualityNode];
  char v13 = [v12 passesWithSignal:v6];

  if ((v13 & 1) != 0
    || ([(CLSJunkClassificationModel *)self->_junkClassificationModel legacyNode],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 passesWithSignal:v6],
        v14,
        v15))
  {
LABEL_6:
    char v16 = v9 ^ 1;
    *a4 = 1;
  }
  else
  {
LABEL_7:
    char v16 = 0;
  }

  return v16;
}

- (BOOL)isUtilityForSyndicationWithAsset:(id)a3
{
  return +[CLSCurationUtilities isRiskyFileFormatWithAsset:a3];
}

- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4
{
  id v5 = a3;
  if (([v5 isAudio] & 1) != 0
    || ([v5 isTrashed] & 1) != 0
    || ([v5 isHidden] & 1) != 0
    || ([v5 clsIsScreenshotOrScreenRecording] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    if ([v5 isVideo]) {
      BOOL v8 = [(CLSCurationModel_v1 *)self isUtilityForMemoriesWithVideoAsset:v5];
    }
    else {
      BOOL v8 = [(CLSCurationModel_v1 *)self isUtilityForMemoriesForImageAsset:v5];
    }
    BOOL v6 = v8;
  }

  return v6;
}

- (BOOL)isUtilityWithAsset:(id)a3
{
  id v4 = a3;
  if (([v4 isAudio] & 1) != 0
    || ([v4 isTrashed] & 1) != 0
    || ([v4 isHidden] & 1) != 0
    || ([v4 clsIsScreenshotOrScreenRecording] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    if ([v4 isVideo]) {
      BOOL v7 = [(CLSCurationModel_v1 *)self isUtilityForVideoAsset:v4];
    }
    else {
      BOOL v7 = [(CLSCurationModel_v1 *)self isUtilityForImageAsset:v4];
    }
    BOOL v5 = v7;
  }

  return v5;
}

- (BOOL)isUtilityForMemoriesForImageAsset:(id)a3
{
  id v4 = a3;
  if ([v4 clsHasCustomPlaybackVariation]) {
    goto LABEL_5;
  }
  if (([v4 clsIsTragicFailure] & 1) == 0)
  {
    if (![v4 clsPeopleCount])
    {
      BOOL v7 = [v4 clsSceneClassifications];
      BOOL v8 = [(CLSCurationModel_v1 *)self imageAssetIsJunkFromSceneAndJunkClassifications:v7];

      if (!v8)
      {
        char v9 = [v4 clsSceneClassifications];
        BOOL v5 = [(CLSCurationModel_v1 *)self imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:v9 forKeyAsset:0 forMemories:1];

        goto LABEL_6;
      }
      goto LABEL_3;
    }
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
LABEL_3:
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (BOOL)isUtilityForImageAsset:(id)a3
{
  id v4 = a3;
  if ([v4 clsHasCustomPlaybackVariation])
  {
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  if (([v4 clsIsTragicFailure] & 1) == 0)
  {
    if (![v4 clsPeopleCount])
    {
      BOOL v7 = [v4 clsSceneClassifications];
      BOOL v5 = [(CLSCurationModel_v1 *)self imageAssetIsJunkFromSceneAndJunkClassifications:v7];

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (BOOL)imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:(id)a3 forKeyAsset:(BOOL)a4 forMemories:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  else {
    confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes = self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  }
  confidenceThresholdBySceneIdentifierForUtilityScenes = self->_confidenceThresholdBySceneIdentifierForUtilityScenes;
  v10 = confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  BOOL v11 = [(CLSCurationModel_v1 *)self assetIsJunkWithSceneClassifications:a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:v10 confidenceThresholdBySceneIdentifierForJunkingScenes:confidenceThresholdBySceneIdentifierForUtilityScenes confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:v10 forMemories:v5];

  return v11;
}

- (BOOL)imageAssetIsJunkFromSceneAndJunkClassifications:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v30 = self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  double v29 = self->_confidenceThresholdBySceneIdentifierForWhiteboardScenes;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v28 = 0;
    int v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v32;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v5);
      }
      id v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
      junkClassificationModel = self->_junkClassificationModel;
      if (junkClassificationModel)
      {
        uint64_t v14 = [(CLSJunkClassificationModel *)junkClassificationModel negativeNode];
        char v15 = [v14 passesHighPrecisionWithSignal:v12];

        if (v15) {
          break;
        }
      }
      if (v9)
      {
        char v9 = 1;
      }
      else
      {
        uint64_t v16 = [v12 extendedSceneIdentifier];
        char v17 = self->_junkClassificationModel;
        if (!v17
          || ![(CLSJunkClassificationModel *)v17 isResponsibleForSignalIdentifier:v16])
        {
          [v12 confidence];
          double v19 = v18;
          v20 = [NSNumber numberWithUnsignedLongLong:v16];
          uint64_t v21 = [(NSDictionary *)v30 objectForKeyedSubscript:v20];

          if (v21)
          {
            [v21 doubleValue];
            if (v19 >= v22)
            {
              char v9 = 1;
LABEL_21:

              goto LABEL_22;
            }
          }
          else
          {
            double v23 = [NSNumber numberWithUnsignedLongLong:v16];
            double v24 = [(NSDictionary *)v29 objectForKeyedSubscript:v23];

            if (v24)
            {
              [v24 doubleValue];
              if (v19 >= v25) {
                char v28 = 1;
              }
            }
          }
          char v9 = 0;
          goto LABEL_21;
        }
        char v9 = 0;
        v8 |= [(CLSCurationModel_v1 *)self isJunkWithJunkClassification:v12];
      }
LABEL_22:
      if (v7 == ++v11)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v7) {
          goto LABEL_3;
        }

        char v26 = (v9 ^ 1) & (v8 | v28);
        goto LABEL_26;
      }
    }
  }

  char v26 = 0;
LABEL_26:

  return v26;
}

- (BOOL)isJunkWithJunkClassification:(id)a3
{
  id v4 = a3;
  junkClassificationModel = self->_junkClassificationModel;
  if (junkClassificationModel)
  {
    uint64_t v6 = [(CLSJunkClassificationModel *)junkClassificationModel receiptOrDocumentNode];
    char v7 = [v6 passesWithSignal:v4];

    if ((v7 & 1) != 0
      || ([(CLSJunkClassificationModel *)self->_junkClassificationModel screenshotNode],
          int v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 passesWithSignal:v4],
          v8,
          (v9 & 1) != 0))
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v11 = [(CLSJunkClassificationModel *)self->_junkClassificationModel tragicFailureNode];
      char v10 = [v11 passesWithSignal:v4];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isTragicFailureWithImageAsset:(id)a3
{
  id v4 = a3;
  if (([v4 clsIsBlurry] & 1) != 0
    || (id v5 = self->_aestheticsModel) != 0
    && ([(CLSAestheticsModel *)v5 overallAestheticScoreNode],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v4 clsAestheticScore],
        char v7 = objc_msgSend(v6, "failsHighRecallWithConfidence:"),
        v6,
        (v7 & 1) != 0))
  {
    char v8 = 1;
  }
  else
  {
    char v9 = [v4 aestheticProperties];
    aestheticsModel = self->_aestheticsModel;
    if (aestheticsModel)
    {
      uint64_t v11 = [(CLSAestheticsModel *)aestheticsModel failureScoreNode];
      [v9 failureScore];
      if ([v11 failsHighRecallWithConfidence:v12])
      {
        char v8 = 1;
      }
      else
      {
        char v13 = [(CLSAestheticsModel *)self->_aestheticsModel tastefullyBlurredScoreNode];
        [v9 tastefullyBlurredScore];
        char v8 = [v13 failsHighRecallWithConfidence:v14];
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (BOOL)isBadQualityForImageKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6 = a3;
  mediaPreAnalysisModel = self->_mediaPreAnalysisModel;
  if (!mediaPreAnalysisModel
    || ([(CLSMediaPreAnalysisModel *)mediaPreAnalysisModel sharpnessNode],
        char v8 = objc_claimAutoreleasedReturnValue(),
        [v6 clsSharpnessScore],
        int v9 = objc_msgSend(v8, "failsHighPrecisionWithConfidence:"),
        v8,
        !v9))
  {
    aestheticsModel = self->_aestheticsModel;
    if (!aestheticsModel)
    {
      BOOL v13 = 0;
      goto LABEL_17;
    }
    uint64_t v11 = [(CLSAestheticsModel *)aestheticsModel overallAestheticScoreNode];
    [v6 clsAestheticScore];
    int v12 = objc_msgSend(v11, "failsHighPrecisionWithConfidence:");

    if (v12)
    {
      ++a4->var1;
      goto LABEL_7;
    }
    float v14 = [v6 aestheticProperties];
    char v15 = [(CLSAestheticsModel *)self->_aestheticsModel failureScoreNode];
    [v14 failureScore];
    int v17 = [v15 failsHighPrecisionWithConfidence:v16];

    if (v17)
    {
      p_var2 = &a4->var2;
    }
    else
    {
      double v19 = [(CLSAestheticsModel *)self->_aestheticsModel tastefullyBlurredScoreNode];
      [v14 tastefullyBlurredScore];
      int v21 = [v19 failsHighPrecisionWithConfidence:v20];

      if (v21)
      {
        p_var2 = &a4->var3;
      }
      else
      {
        double v22 = [(CLSAestheticsModel *)self->_aestheticsModel pleasantLightingScoreNode];
        [v14 pleasantLightingScore];
        int v24 = [v22 failsHighPrecisionWithConfidence:v23];

        if (!v24)
        {
          BOOL v13 = 0;
          goto LABEL_16;
        }
        p_var2 = &a4->var4;
      }
    }
    ++*p_var2;
    BOOL v13 = 1;
LABEL_16:

    goto LABEL_17;
  }
  ++a4->var0;
LABEL_7:
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (BOOL)isUtilityForVideoAsset:(id)a3
{
  id v4 = a3;
  [(CLSCurationModel_v1 *)self minimumDurationForVideoToNotBeJunk];
  double v6 = v5;
  if ([v4 isSubtype:0x20000])
  {
    [(CLSCurationModel_v1 *)self minimumDurationForHighFramerateVideoToNotBeJunk];
  }
  else
  {
    if (![v4 isSubtype:0x40000]) {
      goto LABEL_6;
    }
    [(CLSCurationModel_v1 *)self minimumDurationForTimelapseVideoToNotBeJunk];
  }
  double v6 = v7;
LABEL_6:
  [v4 duration];
  if (v8 >= v6)
  {
    if (self->_mediaAnalysisModel)
    {
      [v4 clsVideoScore];
      double v11 = v10;
      [(CLSMediaAnalysisModel *)self->_mediaAnalysisModel videoScoreThresholdToNotBeJunk];
      BOOL v9 = v11 < v12;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isRegularGemWithAsset:(id)a3
{
  [a3 clsBehavioralScore];
  return v3 >= 0.7;
}

- (BOOL)isShinyGemWithAsset:(id)a3
{
  [a3 clsBehavioralScore];
  return v3 >= 0.9;
}

- (BOOL)isGoldWithAsset:(id)a3
{
  [a3 clsBehavioralScore];
  return v3 == 1.0;
}

- (double)scoreWithAsset:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 clsIsUtility] || (double v8 = 0.25, objc_msgSend(v6, "isFavorite")))
  {
    if (v7)
    {
      double v9 = (double)[v6 clsViewCount];
      [v7 viewCountThreshold];
      if (v10 >= v9)
      {
        double v16 = (double)[v6 clsPlayCount];
        [v7 playCountThreshold];
        BOOL v11 = v17 < v16;
      }
      else
      {
        BOOL v11 = 1;
      }
      char v18 = [v7 shouldEmphasizeShared];
      int v19 = [v7 shouldEmphasizeAdjusted];
      HIDWORD(v35) = [v7 shouldEmphasizePanorama];
      int v20 = [v7 shouldEmphasizeLive];
      HIDWORD(v33) = [v7 shouldEmphasizeBurst];
      LODWORD(v35) = [v7 shouldEmphasizeSDOF];
      LODWORD(v33) = [v7 audioClassificationsToEmphasize];
      char v14 = v18 ^ 1;
      int v13 = v19 ^ 1;
      int v12 = v20 ^ 1;
      uint64_t v15 = objc_msgSend(v6, "clsPeopleCount", v33);
    }
    else
    {
      uint64_t v35 = 0;
      BOOL v11 = 0;
      int v12 = 1;
      int v13 = 1;
      char v14 = 1;
      uint64_t v15 = objc_msgSend(v6, "clsPeopleCount", 0);
    }
    unint64_t v21 = v15;
    double v22 = [v6 clsFaceInformationSummary];
    [v22 averageFaceQuality];
    double v24 = v23;
    int v25 = [v6 isVideo];
    if (([v6 isFavorite] & 1) != 0
      || -[CLSCurationModel_v1 asset:isAestheticallyAwesomeWithContext:](self, "asset:isAestheticallyAwesomeWithContext:", v6, v7)|| ([v6 isIncludedInCloudFeeds] & 1) != 0)
    {
LABEL_12:
      if (!v21)
      {
        double v26 = 0.0;
        goto LABEL_15;
      }
LABEL_13:
      double v26 = fmin((double)v21 / 10.0, 1.0) * 0.4 + 0.5 + v24 * 0.1;
LABEL_15:
      double v8 = v26 * 0.25 + 0.75;
LABEL_16:

      goto LABEL_17;
    }
    if ([v6 clsShareCount]) {
      char v28 = v14;
    }
    else {
      char v28 = 1;
    }
    if (v28)
    {
      if (v21 > 3) {
        goto LABEL_13;
      }
    }
    else if ([v6 clsVideoFaceCount] || v21 > 3)
    {
      goto LABEL_12;
    }
    if (v25)
    {
      unint64_t v29 = [v6 clsVideoFaceCount];
      if (v21 <= v29) {
        unint64_t v21 = v29;
      }
    }
    if (v21) {
      double v30 = fmin((double)v21 * 0.25, 1.0) * 0.4 + 0.5 + v24 * 0.1;
    }
    else {
      double v30 = 0.0;
    }
    int v31 = [v6 clsIsInterestingLivePhoto];
    if ((v13 | v25))
    {
      if (v11) {
        goto LABEL_46;
      }
    }
    else if (([v6 hasAdjustments] | v11))
    {
LABEL_46:
      double v8 = v30 * 0.15 + 0.6;
      goto LABEL_16;
    }
    if (![v6 clsIsInterestingVideo]
      && v12 | v31 ^ 1
      && (!HIDWORD(v35) || ([v6 clsIsInterestingPanorama] & 1) == 0)
      && (!v35 || ([v6 clsIsInterestingSDOF] & 1) == 0)
      && (!v31 || ([v6 clsInterestingAudioClassifications] & v32) == 0)
      && (!v34 || ![v6 representsBurst]))
    {
      if ((v25 & (v30 * 0.25 + 0.5 < 0.6)) != 0) {
        double v8 = 0.6;
      }
      else {
        double v8 = v30 * 0.25 + 0.5;
      }
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_17:

  return v8;
}

- (float)interactionScoreWithAsset:(id)a3
{
  id v3 = a3;
  if ([v3 clsIsUtility])
  {
    float v4 = 0.01;
  }
  else
  {
    uint64_t v5 = [v3 clsViewCount];
    uint64_t v6 = [v3 clsPlayCount] + v5;
    unint64_t v7 = v6 + [v3 clsShareCount];
    if (v7 >= 0x32) {
      unint64_t v7 = 50;
    }
    if ((float)((float)v7 / 50.0) >= 0.01) {
      float v4 = (float)v7 / 50.0;
    }
    else {
      float v4 = 0.01;
    }
  }

  return v4;
}

- (BOOL)asset:(id)a3 isAestheticallyAwesomeWithContext:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (CLSAestheticsModel *)a4;
  if ([v6 isVideo])
  {
    BOOL v8 = 0;
  }
  else
  {
    aestheticsModel = v7;
    if (v7 || (aestheticsModel = self->_aestheticsModel) != 0)
    {
      [(CLSAestheticsModel *)aestheticsModel aestheticScoreThresholdToBeAwesome];
      double v11 = v10;
    }
    else
    {
      double v11 = 1.0;
    }
    [v6 clsAestheticScore];
    BOOL v8 = v12 >= v11;
  }

  return v8;
}

- (BOOL)isAestheticallyAwesomeWithAsset:(id)a3
{
  [a3 clsAestheticScore];
  aestheticsModel = self->_aestheticsModel;
  if (aestheticsModel)
  {
    double v6 = v4;
    [(CLSAestheticsModel *)aestheticsModel aestheticScoreThresholdToBeAwesome];
    LOBYTE(aestheticsModel) = v6 >= v7;
  }
  return (char)aestheticsModel;
}

- (BOOL)isAestheticallyPrettyGoodWithAsset:(id)a3
{
  [a3 clsAestheticScore];
  aestheticsModel = self->_aestheticsModel;
  if (aestheticsModel)
  {
    double v6 = v4;
    [(CLSAestheticsModel *)aestheticsModel aestheticScoreThresholdToBeAestheticallyPrettyGood];
    LOBYTE(aestheticsModel) = v6 >= v7;
  }
  return (char)aestheticsModel;
}

- (BOOL)isNonMemorableWithAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_junkClassificationModel) {
    return 0;
  }
  [a3 clsSceneClassifications];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [(CLSJunkClassificationModel *)self->_junkClassificationModel nonMemorableNode];
        LOBYTE(v9) = [v10 passesWithSignal:v9];

        if (v9)
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isInterestingVideoWithAsset:(id)a3
{
  id v4 = a3;
  if ([v4 isVideo])
  {
    uint64_t v5 = [v4 mediaAnalysisProperties];
    uint64_t v6 = [v5 mediaAnalysisTimeStamp];
    if (v6)
    {
      if (self->_mediaAnalysisModel)
      {
        [v5 videoScore];
        double v8 = v7;
        [(CLSMediaAnalysisModel *)self->_mediaAnalysisModel videoScoreThresholdToBeInteresting];
        BOOL v10 = v9 <= v8;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (signed)interestingAudioClassificationsWithAsset:(id)a3
{
  id v3 = [a3 mediaAnalysisProperties];
  __int16 v4 = [v3 audioClassification];

  return v4 & ~(unsigned __int16)[(id)objc_opt_class() uninterestingAudioClassifications];
}

- (BOOL)hasInterestingAudioClassificationWithAsset:(id)a3
{
  return [a3 clsInterestingAudioClassifications] != 0;
}

- (BOOL)isInterestingHDRWithAsset:(id)a3
{
  return [a3 isSubtype:2];
}

- (BOOL)isInterestingSDOFWithAsset:(id)a3
{
  return [a3 isSubtype:16];
}

- (BOOL)isInterestingPanoramaWithAsset:(id)a3
{
  return [a3 isSubtype:1];
}

- (BOOL)isInterestingLivePhotoWithAsset:(id)a3
{
  id v4 = a3;
  if ([v4 isSubtype:8])
  {
    uint64_t v5 = [v4 mediaAnalysisProperties];
    uint64_t v6 = [v5 mediaAnalysisTimeStamp];
    if (v6)
    {
      if (self->_mediaAnalysisModel)
      {
        [v5 autoplaySuggestionScore];
        double v8 = v7;
        [(CLSMediaAnalysisModel *)self->_mediaAnalysisModel autoplaySuggestionScoreThresholdToBeInteresting];
        BOOL v10 = v9 <= v8;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)hasInterestingScenesWithAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [a3 clsSceneClassifications];
  if ([v4 count])
  {
    uint64_t v5 = self->_confidenceThresholdBySceneIdentifierForInterestingScenes;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          BOOL v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          BOOL v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "extendedSceneIdentifier", (void)v17));
          double v12 = [(NSDictionary *)v5 objectForKeyedSubscript:v11];

          if (v12)
          {
            [v10 confidence];
            double v14 = v13;
            [v12 doubleValue];
            if (v14 >= v15)
            {

              LOBYTE(v7) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)sceneIdentifiersOfInterestingScenes
{
  return (id)[(CLSSceneModel *)self->_sceneModel sceneIdentifiersForSceneNames:&unk_27076A688 includingChildScenes:0];
}

- (BOOL)hasPoorResolutionWithAsset:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 pixelWidth];
  unint64_t v5 = [v3 pixelHeight];

  if (v4 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  return v6 < 0x259;
}

- (BOOL)avoidIfPossibleForMemoryKeyAssetWithAsset:(id)a3
{
  return [a3 isVideo];
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 clsFaceInformationSummary];
  int v8 = [v7 numberOfFacesOfHiddenPersons];

  if (v8) {
    goto LABEL_2;
  }
  if (![v6 isPhoto])
  {
    if (![v6 isVideo]) {
      goto LABEL_3;
    }
    if (([v6 clsIsInterestingVideo] & 1) == 0)
    {
      a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 32);
      goto LABEL_2;
    }
    if (self->_mediaAnalysisModel)
    {
      [v6 clsAutoplaySuggestionScore];
      double v12 = v11;
      [(CLSMediaAnalysisModel *)self->_mediaAnalysisModel autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset];
      if (v12 <= v13)
      {
        a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 36);
        goto LABEL_2;
      }
    }
    double v14 = [v6 clsLocation];

    int v15 = [v6 clsHasPoorResolution];
    if (!v14 && v15)
    {
      a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 40);
      goto LABEL_2;
    }
LABEL_19:
    if (+[CLSCurationUtilities isRiskyFileFormatWithAsset:v6])
    {
      a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 44);
    }
    else
    {
      long long v18 = [v6 curationProperties];
      long long v19 = [v18 importedByBundleIdentifier];
      BOOL v20 = +[CLSCurationUtilities isBlocklistedImportedByBundleIdentifier:v19];

      if (!v20)
      {
        BOOL v9 = 0;
        goto LABEL_4;
      }
      a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 48);
    }
    goto LABEL_2;
  }
  if (![v6 isSubtype:1])
  {
    if ([(CLSCurationModel_v1 *)self isBadQualityForImageKeyAssetWithAsset:v6 statistics:&a4->var2])
    {
      goto LABEL_3;
    }
    long long v16 = [v6 clsSceneClassifications];
    BOOL v17 = [(CLSCurationModel_v1 *)self imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:v16 forKeyAsset:1 forMemories:1];

    if (v17)
    {
      a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 28);
      goto LABEL_2;
    }
    goto LABEL_19;
  }
  a4 = ($D55A254B16A4056E255654C82751ECAB *)((char *)a4 + 4);
LABEL_2:
  ++a4->var0;
LABEL_3:
  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)isInhabitedWithAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = objc_getAssociatedObject(v4, "clsIsInhabited");
  id v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else if ([v4 clsIsUtility])
  {
    LOBYTE(v7) = 0;
  }
  else if ([v4 clsPeopleCount] || objc_msgSend(v4, "clsVideoFaceCount"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    BOOL v9 = [v4 clsSceneClassifications];
    if ([v9 count])
    {
      BOOL v10 = self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v9;
      uint64_t v7 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        unint64_t v21 = v9;
        uint64_t v12 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v11);
            }
            double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            int v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "extendedSceneIdentifier"));
            long long v16 = [(NSDictionary *)v10 objectForKeyedSubscript:v15];

            if (v16)
            {
              [v14 confidence];
              double v18 = v17;
              [v16 doubleValue];
              if (v18 >= v19)
              {

                uint64_t v7 = 1;
                goto LABEL_22;
              }
            }
          }
          uint64_t v7 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v7) {
            continue;
          }
          break;
        }
LABEL_22:
        BOOL v9 = v21;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    BOOL v20 = [NSNumber numberWithBool:v7];
    objc_setAssociatedObject(v4, "clsIsInhabited", v20, (void *)3);
  }
  return v7;
}

- (BOOL)isBlurryWithAsset:(id)a3
{
  mediaPreAnalysisModel = self->_mediaPreAnalysisModel;
  if (!mediaPreAnalysisModel) {
    return 0;
  }
  id v4 = a3;
  unint64_t v5 = [(CLSMediaPreAnalysisModel *)mediaPreAnalysisModel sharpnessNode];
  [v4 clsSharpnessScore];
  double v7 = v6;

  LOBYTE(v4) = [v5 failsHighRecallWithConfidence:v7];
  return (char)v4;
}

- (id)initForTesting
{
  id v3 = [[CLSCurationModelSpecification alloc] initWithSceneAnalysisVersion:-1 mediaAnalysisVersion:-1 faceAnalysisVersion:-1];
  id v4 = [(CLSCurationModel_v1 *)self initWithCurationModelSpecification:v3];

  return v4;
}

- (CLSCurationModel_v1)initWithCurationModelSpecification:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSCurationModel_v1;
  unint64_t v5 = [(CLSCurationModel_v1 *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 sceneAnalysisVersion];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F5E0F0]) initWithSceneAnalysisVersion:v6];
    int v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F5E0C8]) initWithSceneAnalysisVersion:v6];
    BOOL v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F5E0C0]), "initWithMediaAnalysisVersion:", objc_msgSend(v4, "mediaAnalysisVersion"));
    uint64_t v12 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F5E080]) initWithSceneAnalysisVersion:v6];
    double v14 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F5E0B8]) initWithSceneAnalysisVersion:v6];
    long long v16 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F5E0A0]), "initWithFaceAnalysisVersion:", objc_msgSend(v4, "faceAnalysisVersion"));
    double v18 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v17;

    *(_OWORD *)(v5 + 56) = xmmword_2598983C0;
    uint64_t v19 = [*((id *)v5 + 1) confidenceThresholdBySceneIdentifierForSceneNames:&unk_27076A610 withThresholdType:1];
    BOOL v20 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v19;

    uint64_t v21 = [*((id *)v5 + 1) confidenceThresholdBySceneIdentifierForSceneNames:&unk_27076A628 withThresholdType:1];
    long long v22 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v21;

    uint64_t v23 = [*((id *)v5 + 1) confidenceThresholdBySceneIdentifierForSceneNames:&unk_27076A640 withThresholdType:1];
    long long v24 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v23;

    uint64_t v25 = [*((id *)v5 + 1) confidenceThresholdBySceneIdentifierForSceneNames:&unk_27076A658 withThresholdType:1];
    double v26 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v25;

    uint64_t v27 = [*((id *)v5 + 1) confidenceThresholdBySceneIdentifierForSceneNames:&unk_27076A670 withThresholdType:1];
    char v28 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v27;
  }
  return (CLSCurationModel_v1 *)v5;
}

+ (signed)uninterestingAudioClassifications
{
  return 18;
}

+ (id)baseSpecificationWithSpecification:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 sceneAnalysisVersion];
  unint64_t v5 = [MEMORY[0x263F5E0F0] baseSceneAnalysisVersionWithSceneAnalysisVersion:v4];
  unint64_t v6 = [MEMORY[0x263F5E0C8] baseSceneAnalysisVersionWithSceneAnalysisVersion:v4];
  if (v5 <= v6) {
    unint64_t v5 = v6;
  }
  unint64_t v7 = [MEMORY[0x263F5E080] baseSceneAnalysisVersionWithSceneAnalysisVersion:v4];
  if (v5 <= v7) {
    unint64_t v5 = v7;
  }
  unint64_t v8 = [MEMORY[0x263F5E0B8] baseSceneAnalysisVersionWithSceneAnalysisVersion:v4];
  if (v5 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v10 = [v3 mediaAnalysisVersion];
  uint64_t v11 = [MEMORY[0x263F5E0C0] baseMediaAnalysisVersionWithMediaAnalysisVersion:v10];
  uint64_t v12 = [v3 faceAnalysisVersion];

  uint64_t v13 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v9, v11, [MEMORY[0x263F5E0A0] baseFaceAnalysisVersionWithFaceAnalysisVersion:v12]);
  return v13;
}

@end