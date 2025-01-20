@interface CLSCurationModel_v4
+ (id)baseSpecificationWithSpecification:(id)a3;
- (BOOL)assetIsJunkWithSceneClassifications:(id)a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:(id)a4 confidenceThresholdBySceneIdentifierForJunkingScenes:(id)a5 confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:(id)a6 forMemories:(BOOL)a7;
- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4;
- (BOOL)isMemeExclusiveWithAsset:(id)a3;
- (BOOL)isMemeWithAsset:(id)a3;
- (BOOL)isSemDevSceneDetectedForIdentifier:(unsigned int)a3 withSceneClassification:(id)a4;
- (BOOL)isUtilityForMemoriesForImageAsset:(id)a3;
- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4;
- (BOOL)isUtilityForMemoriesWithVideoAsset:(id)a3;
- (BOOL)isUtilityForSyndicationWithAsset:(id)a3;
- (BOOL)isUtilityForVideoAsset:(id)a3;
- (BOOL)isVeryPreciselyIVSNSFWExplicitWithAsset:(id)a3;
- (CLSCurationModel_v4)initWithCurationModelSpecification:(id)a3;
- (CLSIVSNSFWModel)ivsNSFWModel;
- (CLSMemeModel)memeModel;
- (CLSTrendsSceneModel)trendsSceneModel;
- (id)faceInformationSummaryWithFaces:(id)a3 detectionTraitsByFaceLocalIdentifier:(id)a4 verifiedPersonUUIDs:(id)a5 hiddenPersonUUIDs:(id)a6 personUUIDByMergeCandidateUUID:(id)a7 userFeedbackCalculator:(id)a8 assetUUID:(id)a9;
- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3;
- (void)enumerateSignalModelsUsingBlock:(id)a3;
@end

@implementation CLSCurationModel_v4

+ (id)baseSpecificationWithSpecification:(id)a3
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLSCurationModel_v4;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v12, sel_baseSpecificationWithSpecification_, v3);
  uint64_t v5 = objc_msgSend(v3, "sceneAnalysisVersion", v12.receiver, v12.super_class);

  unint64_t v6 = [v4 sceneAnalysisVersion];
  unint64_t v7 = [MEMORY[0x263F5E0D0] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v7) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = [MEMORY[0x263F5E100] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v8) {
    unint64_t v6 = v8;
  }
  unint64_t v9 = [MEMORY[0x263F5E0A8] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v9) {
    unint64_t v6 = v9;
  }
  v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, [v4 mediaAnalysisVersion], objc_msgSend(v4, "faceAnalysisVersion"));

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivsNSFWModel, 0);
  objc_storeStrong((id *)&self->_trendsSceneModel, 0);
  objc_storeStrong((id *)&self->_memeModel, 0);
}

- (CLSIVSNSFWModel)ivsNSFWModel
{
  return (CLSIVSNSFWModel *)objc_getProperty(self, a2, 168, 1);
}

- (CLSTrendsSceneModel)trendsSceneModel
{
  return (CLSTrendsSceneModel *)objc_getProperty(self, a2, 160, 1);
}

- (CLSMemeModel)memeModel
{
  return (CLSMemeModel *)objc_getProperty(self, a2, 152, 1);
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__CLSCurationModel_v4_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke;
  v11[3] = &unk_26544F490;
  id v5 = v4;
  id v12 = v5;
  v13 = &v14;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v4;
  [(CLSCurationModel_v3 *)&v10 enumerateClassificationBasedSignalModelsUsingBlock:v11];
  if (!*((unsigned char *)v15 + 24))
  {
    unint64_t v6 = [(CLSCurationModel_v4 *)self memeModel];

    if (!v6
      || ([(CLSCurationModel_v4 *)self memeModel],
          unint64_t v7 = objc_claimAutoreleasedReturnValue(),
          (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v7, v15 + 3),
          v7,
          !*((unsigned char *)v15 + 24)))
    {
      unint64_t v8 = [(CLSCurationModel_v4 *)self ivsNSFWModel];

      if (v8)
      {
        unint64_t v9 = [(CLSCurationModel_v4 *)self ivsNSFWModel];
        (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v9, v15 + 3);
      }
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CLSCurationModel_v4_enumerateSignalModelsUsingBlock___block_invoke;
  v11[3] = &unk_26544F468;
  id v5 = v4;
  id v12 = v5;
  v13 = &v14;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v4;
  [(CLSCurationModel_v3 *)&v10 enumerateSignalModelsUsingBlock:v11];
  if (!*((unsigned char *)v15 + 24))
  {
    unint64_t v6 = [(CLSCurationModel_v4 *)self memeModel];

    if (!v6
      || ([(CLSCurationModel_v4 *)self memeModel],
          unint64_t v7 = objc_claimAutoreleasedReturnValue(),
          (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v7, v15 + 3),
          v7,
          !*((unsigned char *)v15 + 24)))
    {
      unint64_t v8 = [(CLSCurationModel_v4 *)self ivsNSFWModel];

      if (v8)
      {
        unint64_t v9 = [(CLSCurationModel_v4 *)self ivsNSFWModel];
        (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v9, v15 + 3);
      }
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (BOOL)isSemDevSceneDetectedForIdentifier:(unsigned int)a3 withSceneClassification:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(CLSCurationModel_v3 *)self sdModel];
  unint64_t v8 = [v7 nodeForSignalIdentifier:a3];
  char v9 = [v8 passesWithSignal:v6];

  return v9;
}

- (BOOL)assetIsJunkWithSceneClassifications:(id)a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:(id)a4 confidenceThresholdBySceneIdentifierForJunkingScenes:(id)a5 confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:(id)a6 forMemories:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v52 = a4;
  id v44 = a5;
  id v47 = a6;
  v13 = [(CLSCurationModel_v1 *)self junkClassificationModel];
  v51 = [v13 negativeNode];
  v50 = [v13 nonMemorableNode];
  v49 = [v13 poorQualityNode];
  uint64_t v14 = [(CLSCurationModel_v3 *)self sdModel];
  v48 = [v14 foodDrinkNode];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v15 = v12;
  uint64_t v56 = [v15 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (!v56)
  {

    LOBYTE(v17) = 0;
    uint64_t v40 = 0;
LABEL_44:
    char v39 = v17 | (v40 != 0);
    goto LABEL_51;
  }
  char v43 = 0;
  char v46 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  char v53 = 0;
  int v18 = 0;
  uint64_t v42 = 0;
  uint64_t v55 = *(void *)v58;
  do
  {
    for (uint64_t i = 0; i != v56; ++i)
    {
      if (*(void *)v58 != v55) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      uint64_t v21 = objc_msgSend(v20, "extendedSceneIdentifier", v42);
      [v20 confidence];
      double v23 = v22;
      if ([v13 isResponsibleForSignalIdentifier:v21])
      {
        if (v7)
        {
          if (v18 & 1) == 0 && ([v51 passesHighPrecisionWithSignal:v20]) {
            goto LABEL_18;
          }
          if (v53 & 1) == 0 && ([v50 passesWithSignal:v20]) {
            goto LABEL_24;
          }
        }
        else
        {
          if (v18 & 1) == 0 && ([v51 passesWithSignal:v20])
          {
LABEL_18:
            int v18 = 1;
            continue;
          }
          if (v53 & 1) == 0 && ([v50 passesHighPrecisionWithSignal:v20])
          {
LABEL_24:
            char v53 = 1;
            continue;
          }
        }
        if (v17) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = [v49 passesWithSignal:v20];
        }
      }
      else if ([v14 isResponsibleForSignalIdentifier:v21])
      {
        if (v16) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = [v48 passesHighPrecisionWithSignal:v20];
        }
      }
      else
      {
        int v54 = v18;
        uint64_t v24 = v16;
        uint64_t v25 = v17;
        v26 = v13;
        BOOL v27 = v7;
        v28 = v14;
        id v29 = v15;
        v30 = [NSNumber numberWithUnsignedLongLong:v21];
        v31 = [v52 objectForKeyedSubscript:v30];
        v32 = v31;
        if (v31)
        {
          [v31 doubleValue];
          if (v23 >= v33) {
            char v46 = 1;
          }
        }
        else
        {
          v34 = [v47 objectForKeyedSubscript:v30];
          v35 = v34;
          if (v34)
          {
            [v34 doubleValue];
            if (v23 >= v36) {
              char v43 = 1;
            }
          }
          else
          {
            v37 = [v44 objectForKeyedSubscript:v30];
            if (v37)
            {
              id v45 = v37;
              [v37 doubleValue];
              if (v23 >= v38) {
                ++v42;
              }
              v37 = v45;
            }
          }
        }

        id v15 = v29;
        uint64_t v14 = v28;
        BOOL v7 = v27;
        v13 = v26;
        uint64_t v17 = v25;
        uint64_t v16 = v24;
        int v18 = v54;
      }
    }
    uint64_t v56 = [v15 countByEnumeratingWithState:&v57 objects:v61 count:16];
  }
  while (v56);

  if ((v46 & 1) == 0)
  {
    uint64_t v40 = v42;
    if (v43) {
      uint64_t v40 = 0;
    }
    if (v18)
    {
      char v39 = v53 & v16 & (v40 != 0);
      goto LABEL_51;
    }
    if (v53)
    {
      char v39 = 1;
      goto LABEL_51;
    }
    goto LABEL_44;
  }
  char v39 = 0;
LABEL_51:

  return v39 & 1;
}

- (BOOL)isUtilityForSyndicationWithAsset:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSCurationModel_v4;
  if (![(CLSCurationModel_v1 *)&v16 isUtilityForSyndicationWithAsset:v4]
    && ![(CLSCurationModel_v4 *)self isMemeWithAsset:v4]
    && !-[CLSCurationModel_v4 isVeryPreciselyIVSNSFWExplicitWithAsset:](self, "isVeryPreciselyIVSNSFWExplicitWithAsset:", v4)&& ([v4 clsIsTragicFailure] & 1) == 0)
  {
    id v5 = [(CLSCurationModel_v1 *)self mediaPreAnalysisModel];
    id v6 = [v5 sharpnessNode];
    [v4 clsSharpnessScore];
    char v7 = objc_msgSend(v6, "failsHighRecallWithConfidence:");

    if ((v7 & 1) == 0)
    {
      unint64_t v8 = [(CLSCurationModel_v1 *)self aestheticsModel];
      char v9 = [v8 overallAestheticScoreNode];
      [v4 clsAestheticScore];
      char v10 = objc_msgSend(v9, "failsHighRecallWithConfidence:");

      if ((v10 & 1) == 0)
      {
        if ([v4 clsPeopleCount])
        {
          BOOL v11 = 0;
          goto LABEL_8;
        }
        v13 = [v4 clsSceneClassifications];
        BOOL v14 = [(CLSCurationModel_v1 *)self imageAssetIsJunkFromSceneAndJunkClassifications:v13];

        if (!v14)
        {
          id v15 = [v4 clsSceneClassifications];
          BOOL v11 = [(CLSCurationModel_v1 *)self imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:v15 forKeyAsset:0 forMemories:0];

          goto LABEL_8;
        }
      }
    }
  }
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSCurationModel_v4;
  if ([(CLSCurationModel_v3 *)&v15 avoidIfPossibleForKeyAssetWithAsset:v6 statistics:a4])
  {
    goto LABEL_4;
  }
  if ([(CLSCurationModel_v4 *)self isMemeWithAsset:v6])
  {
    ++a4->var9;
LABEL_4:
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  unint64_t v8 = [v6 mediaAnalysisProperties];
  int v9 = [v8 probableRotationDirection];
  if ((v9 - 1) >= 4) {
    __int16 v10 = 0;
  }
  else {
    __int16 v10 = v9;
  }
  [v8 probableRotationDirectionConfidence];
  float v12 = v11;
  v13 = [(CLSCurationModel_v1 *)self mediaPreAnalysisModel];
  int v7 = [v13 isWronglyRotatedForDirection:v10 confidence:v12];

  if (v7) {
    ++a4->var10;
  }

LABEL_11:
  return v7;
}

- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)CLSCurationModel_v4;
  if (![(CLSCurationModel_v3 *)&v55 isUtilityForMemoriesWithAsset:v6 userFeedbackCalculator:v7]&& ![(CLSCurationModel_v4 *)self isMemeWithAsset:v6])
  {
    int v9 = [v6 mediaAnalysisProperties];
    int v10 = [v9 probableRotationDirection];
    if ((v10 - 1) >= 4) {
      __int16 v11 = 0;
    }
    else {
      __int16 v11 = v10;
    }
    [v9 probableRotationDirectionConfidence];
    float v13 = v12;
    BOOL v14 = [(CLSCurationModel_v1 *)self mediaPreAnalysisModel];
    int v15 = [v14 isWronglyRotatedForDirection:v11 confidence:v13];

    char v46 = v9;
    if (v15
      && ([v6 clsFaceInformationSummary],
          objc_super v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 numberOfFaces],
          v16,
          v17))
    {
      id v18 = [(CLSCurationModel_v1 *)self confidenceThresholdBySceneIdentifierForBabyScenes];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v19 = [v6 clsSceneClassifications];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        id v45 = v7;
        uint64_t v22 = *(void *)v52;
LABEL_11:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v51 + 1) + 8 * v23);
          uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v24, "extendedSceneIdentifier", v45));
          v26 = [v18 objectForKeyedSubscript:v25];

          if (v26) {
            break;
          }
          if (v21 == ++v23)
          {
            uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
            char v8 = 1;
            if (v21) {
              goto LABEL_11;
            }
            id v7 = v45;
            goto LABEL_28;
          }
        }
        [v24 confidence];
        double v28 = v27;
        [v26 doubleValue];
        double v30 = v29;

        id v7 = v45;
        if (v28 >= v30) {
          goto LABEL_20;
        }
        char v8 = 1;
        goto LABEL_30;
      }
      char v8 = 1;
    }
    else
    {
LABEL_20:
      v31 = [v6 clsFaceInformationSummary];
      v32 = [v31 faceInformationByPersonLocalIdentifier];

      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v18 = v32;
      uint64_t v33 = [v18 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v48 != v35) {
              objc_enumerationMutation(v18);
            }
            v37 = [MEMORY[0x263F14E78] uuidFromLocalIdentifier:*(void *)(*((void *)&v47 + 1) + 8 * i)];
            [v19 addObject:v37];
          }
          uint64_t v34 = [v18 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v34);
      }

      double v38 = [v6 clsIdentifier];
      long long v58 = v38;
      char v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
      uint64_t v40 = [v6 clsIdentifier];
      uint64_t v56 = v40;
      id v57 = v19;
      v41 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      [v7 scoreForAssetUUIDs:v39 personsUUIDsByAssetUUIDs:v41];
      double v43 = v42;

      char v8 = [MEMORY[0x263F14F60] score:v43 meetsScoreThreshold:*MEMORY[0x263F15148]];
LABEL_28:
      int v9 = v46;
    }

LABEL_30:
    goto LABEL_31;
  }
  char v8 = 1;
LABEL_31:

  return v8;
}

- (BOOL)isUtilityForMemoriesForImageAsset:(id)a3
{
  id v4 = a3;
  if ([v4 clsHasCustomPlaybackVariation]) {
    goto LABEL_2;
  }
  if ([v4 clsIsTragicFailure]) {
    goto LABEL_6;
  }
  id v6 = [(CLSCurationModel_v1 *)self mediaPreAnalysisModel];
  id v7 = [v6 sharpnessNode];
  [v4 clsSharpnessScore];
  char v8 = objc_msgSend(v7, "failsHighRecallWithConfidence:");

  if (v8) {
    goto LABEL_6;
  }
  int v9 = [(CLSCurationModel_v1 *)self aestheticsModel];
  int v10 = [v9 overallAestheticScoreNode];
  [v4 clsAestheticScore];
  char v11 = objc_msgSend(v10, "failsHighRecallWithConfidence:");

  if (v11)
  {
LABEL_6:
    BOOL v5 = 1;
    goto LABEL_7;
  }
  if (![v4 clsPeopleCount])
  {
    float v13 = [v4 clsSceneClassifications];
    BOOL v14 = [(CLSCurationModel_v1 *)self imageAssetIsJunkFromSceneAndJunkClassifications:v13];

    if (!v14)
    {
      int v15 = [v4 clsSceneClassifications];
      BOOL v5 = [(CLSCurationModel_v1 *)self imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:v15 forKeyAsset:0 forMemories:1];

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_2:
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)isUtilityForMemoriesWithVideoAsset:(id)a3
{
  id v4 = a3;
  [v4 duration];
  if (v5 <= 60.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLSCurationModel_v4;
    BOOL v6 = [(CLSCurationModel_v1 *)&v8 isUtilityForMemoriesWithVideoAsset:v4];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isUtilityForVideoAsset:(id)a3
{
  id v4 = a3;
  if ([v4 playbackStyle] == 5)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CLSCurationModel_v4;
    BOOL v5 = [(CLSCurationModel_v1 *)&v7 isUtilityForVideoAsset:v4];
  }

  return v5;
}

- (BOOL)isVeryPreciselyIVSNSFWExplicitWithAsset:(id)a3
{
  id v4 = [a3 clsProcessedSignals];
  BOOL v5 = [(CLSCurationModel_v4 *)self ivsNSFWModel];

  if (v5) {
    char v6 = [v4 isVeryPreciselyIVSNSFWExplicit];
  }
  else {
    char v6 = [v4 isPreciselyNSFWExplicit];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isMemeWithAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CLSCurationModel_v4 *)self memeModel];
  char v6 = [v4 clsSceneClassifications];

  LOBYTE(v4) = [v5 isMemeFromSceneClassifications:v6];
  return (char)v4;
}

- (BOOL)isMemeExclusiveWithAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CLSCurationModel_v4 *)self memeModel];
  char v6 = [v4 clsSceneClassifications];

  LOBYTE(v4) = [v5 isMemeExclusiveFromSceneClassifications:v6];
  return (char)v4;
}

- (id)faceInformationSummaryWithFaces:(id)a3 detectionTraitsByFaceLocalIdentifier:(id)a4 verifiedPersonUUIDs:(id)a5 hiddenPersonUUIDs:(id)a6 personUUIDByMergeCandidateUUID:(id)a7 userFeedbackCalculator:(id)a8 assetUUID:(id)a9
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v93 = a4;
  id v81 = a5;
  id v83 = a6;
  id v89 = a7;
  id v16 = a8;
  int v17 = self;
  id v18 = a9;
  v77 = [(CLSCurationModel_v1 *)self faceModel];
  if (!v77 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v115 = v18;
    _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "faceInformationSummaryWithFaces: Asset %@ has no face model", buf, 0xCu);
  }
  uint64_t v19 = [v15 count];
  v76 = v18;
  if (!v19)
  {
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v91 = 0;
    uint64_t v92 = 0;
    uint64_t v82 = 0;
    uint64_t v97 = 0;
    double v24 = 0.0;
    long long v60 = (void *)MEMORY[0x263EFFA78];
    v94 = (void *)MEMORY[0x263EFFA78];
    double v25 = 0.0;
    double v26 = 0.0;
    goto LABEL_54;
  }
  v88 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v19];
  v94 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v19];
  v84 = [v77 qualityNode];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v20 = v15;
  uint64_t v95 = [v20 countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (!v95)
  {

    uint64_t v23 = 0;
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v82 = 0;
    uint64_t v91 = 0;
    uint64_t v92 = 0;
    double v26 = 0.0;
    double v25 = 0.0;
    double v24 = 0.0;
    goto LABEL_53;
  }
  obuint64_t j = v20;
  v86 = self;
  id v74 = v16;
  id v75 = v15;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  unint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  uint64_t v82 = 0;
  uint64_t v80 = 0;
  uint64_t v23 = 0;
  uint64_t v90 = *(void *)v106;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  uint64_t v87 = v19;
  do
  {
    for (uint64_t i = 0; i != v95; ++i)
    {
      if (*(void *)v106 != v90) {
        objc_enumerationMutation(obj);
      }
      double v28 = *(void **)(*((void *)&v105 + 1) + 8 * i);
      double v29 = [v28 localIdentifier];
      uint64_t v98 = [v93 objectForKeyedSubscript:v29];

      int v30 = [v28 detectionType];
      if (v30 != 2) {
        ++v23;
      }
      [v28 size];
      double v32 = v31;
      [v28 quality];
      double v34 = v33;
      double v35 = -0.0;
      if (v30 != 2) {
        double v35 = v34;
      }
      double v36 = v26 + v35;
      if (v34 >= 0.0) {
        v21 += v30 != 2;
      }
      unint64_t v100 = v21;
      if (v34 >= 0.0)
      {
        ++v22;
        double v25 = v25 + v34;
        double v26 = v36;
      }
      int v37 = [v28 eyesState];
      [(CLSCurationModel_v1 *)v17 faceSizeLowerLimit];
      if (v32 >= v38)
      {
        [(CLSCurationModel_v1 *)v17 faceSizeUpperLimit];
        BOOL v39 = v32 <= v40;
      }
      else
      {
        BOOL v39 = 0;
      }
      unint64_t v99 = v22;
      if (v37 == 2)
      {
        int v41 = [v84 passesHighPrecisionWithConfidence:v34] & v39;
        v92 += v41 & 1;
        v91 += v41 & (v30 != 2);
        uint64_t v42 = [v84 passesWithConfidence:v34] & v39;
      }
      else
      {
        LOBYTE(v41) = 0;
        uint64_t v42 = 0;
      }
      double v43 = [v28 personLocalIdentifier];
      if (!v43)
      {
        unint64_t v21 = v100;
        long long v47 = (void *)v98;
        goto LABEL_43;
      }
      id v44 = [MEMORY[0x263F14E88] uuidFromLocalIdentifier:v43];
      id v45 = [v89 objectForKeyedSubscript:v44];
      if (v45)
      {
        char v46 = [MEMORY[0x263F14E88] localIdentifierWithUUID:v45];
      }
      else
      {
        char v46 = 0;
      }
      uint64_t v96 = v23;
      if (v44)
      {
        if ([v83 containsObject:v44])
        {
          ++v82;
          long long v48 = [CLSFaceInformation alloc];
          [v28 size];
          uint64_t v49 = v41 & 1;
          long long v47 = (void *)v98;
          uint64_t v50 = -[CLSFaceInformation initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v48, "initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v39, v49, v42, v98);
          goto LABEL_39;
        }
        if ([v81 containsObject:v44])
        {
          unint64_t v51 = v78;
          if (v34 >= 0.0) {
            unint64_t v51 = v78 + 1;
          }
          unint64_t v78 = v51;
          double v52 = -0.0;
          if (v34 >= 0.0) {
            double v52 = v34;
          }
          double v24 = v24 + v52;
          v79 += v41 & 1;
          ++v80;
          long long v53 = [CLSFaceInformation alloc];
          [v28 size];
          uint64_t v54 = v41 & 1;
          long long v47 = (void *)v98;
          uint64_t v50 = -[CLSFaceInformation initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v53, "initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v39, v54, v42, v98);
          goto LABEL_39;
        }
      }
      objc_super v55 = [CLSFaceInformation alloc];
      [v28 size];
      uint64_t v56 = v41 & 1;
      long long v47 = (void *)v98;
      uint64_t v50 = -[CLSFaceInformation initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v55, "initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v39, v56, v42, v98);
LABEL_39:
      id v57 = (void *)v50;
      [v88 setObject:v50 forKeyedSubscript:v43];
      uint64_t v23 = v96;
      unint64_t v21 = v100;
      if (!v46
        || ([v94 objectForKeyedSubscript:v46],
            long long v58 = objc_claimAutoreleasedReturnValue(),
            v58,
            long long v59 = v46,
            v58))
      {
        long long v59 = v43;
      }
      [v94 setObject:v57 forKeyedSubscript:v59];

      int v17 = v86;
      uint64_t v19 = v87;
LABEL_43:

      unint64_t v22 = v99;
    }
    uint64_t v95 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
  }
  while (v95);

  if (v99) {
    double v25 = v25 / (double)v99;
  }
  if (v21) {
    double v26 = v26 / (double)v21;
  }
  id v16 = v74;
  id v15 = v75;
  if (v78) {
    double v24 = v24 / (double)v78;
  }
LABEL_53:
  uint64_t v97 = v23;

  long long v60 = v88;
LABEL_54:
  id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v62 = v60;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v101 objects:v112 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v64; ++j)
      {
        if (*(void *)v102 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = [MEMORY[0x263F14E78] uuidFromLocalIdentifier:*(void *)(*((void *)&v101 + 1) + 8 * j)];
        [v61 addObject:v67];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v101 objects:v112 count:16];
    }
    while (v64);
  }

  v111 = v76;
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v111 count:1];
  v109 = v76;
  id v110 = v61;
  v69 = [NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
  [v16 scoreForAssetUUIDs:v68 personsUUIDsByAssetUUIDs:v69];
  double v71 = v70;

  v72 = [[CLSAssetFaceInformationSummary alloc] initWithNumberOfFaces:v97 numberOfFacesIncludingPets:v19 numberOfFacesOfVerifiedPersons:v80 numberOfFacesOfHiddenPersons:v82 numberOfGoodFaces:v91 numberOfGoodFacesIncludingPets:v92 numberOfGoodFacesOfVerifiedPersons:v26 averageFaceQuality:v25 averageFaceQualityIncludingPets:v24 averageFaceQualityOfVerifiedPersons:v71 userFeedbackScore:v79 faceInformationByPersonLocalIdentifier:v62 faceInformationByConsolidatedPersonLocalIdentifier:v94];
  return v72;
}

- (CLSCurationModel_v4)initWithCurationModelSpecification:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSCurationModel_v4;
  BOOL v5 = [(CLSCurationModel_v3 *)&v14 initWithCurationModelSpecification:v4];
  if (v5)
  {
    uint64_t v6 = [v4 sceneAnalysisVersion];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F5E0D0]) initWithSceneAnalysisVersion:v6];
    memeModel = v5->_memeModel;
    v5->_memeModel = (CLSMemeModel *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F5E100]) initWithSceneAnalysisVersion:v6];
    trendsSceneModel = v5->_trendsSceneModel;
    v5->_trendsSceneModel = (CLSTrendsSceneModel *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F5E0A8]) initWithSceneAnalysisVersion:v6];
    ivsNSFWModel = v5->_ivsNSFWModel;
    v5->_ivsNSFWModel = (CLSIVSNSFWModel *)v11;
  }
  return v5;
}

@end