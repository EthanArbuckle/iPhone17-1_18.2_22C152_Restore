@interface CLSCurationModel_v3
+ (id)baseSpecificationWithSpecification:(id)a3;
- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4;
- (BOOL)avoidIfPossibleForKeyAssetWithProcessedSignals:(id)a3 statistics:(id *)a4;
- (BOOL)avoidIfPossibleForKeyAssetWithSignals:(id)a3 statistics:(id *)a4;
- (BOOL)filterForFoodieWithClassification:(id)a3;
- (BOOL)hasPoorResolutionWithAsset:(id)a3;
- (BOOL)isJunkWithJunkClassification:(id)a3;
- (BOOL)isShowcasingFoodWithSceneClassification:(id)a3;
- (BOOL)isTragicFailureWithImageAsset:(id)a3;
- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4;
- (BOOL)isUtilityForMemoriesWithProcessedSignals:(id)a3;
- (CLSCurationModel_v3)initWithCurationModelSpecification:(id)a3;
- (CLSNSFWModel)nsfwModel;
- (CLSPotentialLandmarkModel)potentialLandmarkModel;
- (CLSSDModel)sdModel;
- (CLSTabooEventModel)tabooEventModel;
- (id)processedSignalsFromSignals:(id)a3;
- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3;
- (void)enumerateSignalModelsUsingBlock:(id)a3;
@end

@implementation CLSCurationModel_v3

+ (id)baseSpecificationWithSpecification:(id)a3
{
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CLSCurationModel_v3;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v13, sel_baseSpecificationWithSpecification_, v3);
  uint64_t v5 = objc_msgSend(v3, "sceneAnalysisVersion", v13.receiver, v13.super_class);

  unint64_t v6 = [v4 sceneAnalysisVersion];
  unint64_t v7 = [MEMORY[0x263F5E0D8] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v7) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = [MEMORY[0x263F5E0F8] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v8) {
    unint64_t v6 = v8;
  }
  unint64_t v9 = [MEMORY[0x263F5E0E0] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v9) {
    unint64_t v6 = v9;
  }
  unint64_t v10 = [MEMORY[0x263F5E0E8] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v10) {
    unint64_t v6 = v10;
  }
  v11 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, [v4 mediaAnalysisVersion], objc_msgSend(v4, "faceAnalysisVersion"));

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdModel, 0);
  objc_storeStrong((id *)&self->_potentialLandmarkModel, 0);
  objc_storeStrong((id *)&self->_tabooEventModel, 0);

  objc_storeStrong((id *)&self->_nsfwModel, 0);
}

- (CLSSDModel)sdModel
{
  return (CLSSDModel *)objc_getProperty(self, a2, 144, 1);
}

- (CLSPotentialLandmarkModel)potentialLandmarkModel
{
  return (CLSPotentialLandmarkModel *)objc_getProperty(self, a2, 136, 1);
}

- (CLSTabooEventModel)tabooEventModel
{
  return (CLSTabooEventModel *)objc_getProperty(self, a2, 128, 1);
}

- (CLSNSFWModel)nsfwModel
{
  return (CLSNSFWModel *)objc_getProperty(self, a2, 120, 1);
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__CLSCurationModel_v3_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke;
  v12[3] = &unk_26544F490;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  v11.receiver = self;
  v11.super_class = (Class)CLSCurationModel_v3;
  [(CLSCurationModel_v1 *)&v11 enumerateClassificationBasedSignalModelsUsingBlock:v12];
  unint64_t v6 = v16;
  if (!*((unsigned char *)v16 + 24))
  {
    nsfwModel = self->_nsfwModel;
    if (!nsfwModel
      || ((*((void (**)(id, CLSNSFWModel *, uint64_t *))v5 + 2))(v5, nsfwModel, v16 + 3),
          unint64_t v6 = v16,
          !*((unsigned char *)v16 + 24)))
    {
      tabooEventModel = self->_tabooEventModel;
      if (!tabooEventModel
        || ((*((void (**)(id, CLSTabooEventModel *, uint64_t *))v5 + 2))(v5, tabooEventModel, v6 + 3),
            unint64_t v6 = v16,
            !*((unsigned char *)v16 + 24)))
      {
        potentialLandmarkModel = self->_potentialLandmarkModel;
        if (!potentialLandmarkModel
          || ((*((void (**)(id, CLSPotentialLandmarkModel *, uint64_t *))v5 + 2))(v5, potentialLandmarkModel, v6 + 3), unint64_t v6 = v16, !*((unsigned char *)v16 + 24)))
        {
          sdModel = self->_sdModel;
          if (sdModel) {
            (*((void (**)(id, CLSSDModel *, uint64_t *))v5 + 2))(v5, sdModel, v6 + 3);
          }
        }
      }
    }
  }

  _Block_object_dispose(&v15, 8);
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__CLSCurationModel_v3_enumerateSignalModelsUsingBlock___block_invoke;
  v12[3] = &unk_26544F468;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  v11.receiver = self;
  v11.super_class = (Class)CLSCurationModel_v3;
  [(CLSCurationModel_v1 *)&v11 enumerateSignalModelsUsingBlock:v12];
  unint64_t v6 = v16;
  if (!*((unsigned char *)v16 + 24))
  {
    nsfwModel = self->_nsfwModel;
    if (!nsfwModel
      || ((*((void (**)(id, CLSNSFWModel *, uint64_t *))v5 + 2))(v5, nsfwModel, v16 + 3),
          unint64_t v6 = v16,
          !*((unsigned char *)v16 + 24)))
    {
      tabooEventModel = self->_tabooEventModel;
      if (!tabooEventModel
        || ((*((void (**)(id, CLSTabooEventModel *, uint64_t *))v5 + 2))(v5, tabooEventModel, v6 + 3),
            unint64_t v6 = v16,
            !*((unsigned char *)v16 + 24)))
      {
        potentialLandmarkModel = self->_potentialLandmarkModel;
        if (!potentialLandmarkModel
          || ((*((void (**)(id, CLSPotentialLandmarkModel *, uint64_t *))v5 + 2))(v5, potentialLandmarkModel, v6 + 3), unint64_t v6 = v16, !*((unsigned char *)v16 + 24)))
        {
          sdModel = self->_sdModel;
          if (sdModel) {
            (*((void (**)(id, CLSSDModel *, uint64_t *))v5 + 2))(v5, sdModel, v6 + 3);
          }
        }
      }
    }
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)isShowcasingFoodWithSceneClassification:(id)a3
{
  sdModel = self->_sdModel;
  id v4 = a3;
  id v5 = [(CLSSDModel *)sdModel foodDrinkNode];
  char v6 = [v5 passesWithSignal:v4];

  return v6;
}

- (id)processedSignalsFromSignals:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CLSAssetProcessedSignals);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__CLSCurationModel_v3_processedSignalsFromSignals___block_invoke;
  v11[3] = &unk_26544F328;
  id v12 = v4;
  char v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(CLSCurationModel_v3 *)self enumerateClassificationBasedSignalModelsUsingBlock:v11];
  unint64_t v8 = v13;
  unint64_t v9 = v6;

  return v9;
}

- (BOOL)filterForFoodieWithClassification:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSCurationModel_v1 *)self junkClassificationModel];
  char v6 = [v5 medicalReferenceNode];
  char v7 = [v6 passesWithSignal:v4];

  if ((v7 & 1) != 0
    || ([(CLSTabooEventModel *)self->_tabooEventModel bloodNode],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 passesHighRecallWithSignal:v4],
        v8,
        (v9 & 1) != 0))
  {
    char v10 = 1;
  }
  else
  {
    objc_super v11 = [(CLSTabooEventModel *)self->_tabooEventModel hospitalNode];
    char v10 = [v11 passesHighRecallWithSignal:v4];
  }
  return v10;
}

- (BOOL)isJunkWithJunkClassification:(id)a3
{
  id v4 = a3;
  if (self->_r14j9IsAvailable)
  {
    id v5 = [(CLSCurationModel_v1 *)self junkClassificationModel];
    char v6 = [v5 receiptOrDocumentNode];
    char v7 = [v6 passesWithSignal:v4];

    if ((v7 & 1) != 0
      || ([v5 screenshotNode],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 passesWithSignal:v4],
          v8,
          (v9 & 1) != 0))
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      objc_super v11 = [v5 textDocumentNode];
      unsigned __int8 v10 = [v11 passesWithSignal:v4];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CLSCurationModel_v3;
    unsigned __int8 v10 = [(CLSCurationModel_v1 *)&v13 isJunkWithJunkClassification:v4];
  }

  return v10;
}

- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v3;
  if ([(CLSCurationModel_v1 *)&v10 isUtilityForMemoriesWithAsset:v6 userFeedbackCalculator:a4])
  {
    BOOL v7 = 1;
  }
  else
  {
    unint64_t v8 = [v6 clsProcessedSignals];
    BOOL v7 = [(CLSCurationModel_v3 *)self isUtilityForMemoriesWithProcessedSignals:v8];
  }
  return v7;
}

- (BOOL)isUtilityForMemoriesWithProcessedSignals:(id)a3
{
  return [a3 isNSFWExplicit];
}

- (BOOL)hasPoorResolutionWithAsset:(id)a3
{
  id v3 = a3;
  if ([v3 isPhoto]) {
    unint64_t v4 = 480;
  }
  else {
    unint64_t v4 = 600;
  }
  unint64_t v5 = [v3 pixelWidth];
  unint64_t v6 = [v3 pixelHeight];

  if (v5 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  return v7 < v4;
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6 = a3;
  if ([v6 isPhoto] && objc_msgSend(v6, "clsHasPoorResolution"))
  {
    ++a4->var11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CLSCurationModel_v3;
    if (![(CLSCurationModel_v1 *)&v12 avoidIfPossibleForKeyAssetWithAsset:v6 statistics:a4])
    {
      unint64_t v7 = [v6 clsProcessedSignals];
      BOOL v8 = [(CLSCurationModel_v3 *)self avoidIfPossibleForKeyAssetWithProcessedSignals:v7 statistics:&a4->var13];

      if (!v8)
      {
        objc_super v10 = [v6 clsSceneClassifications];
        BOOL v9 = [(CLSCurationModel_v3 *)self avoidIfPossibleForKeyAssetWithSignals:v10 statistics:&a4->var14];

        goto LABEL_8;
      }
    }
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)avoidIfPossibleForKeyAssetWithProcessedSignals:(id)a3 statistics:(id *)a4
{
  int v5 = [a3 isRecallinglyNSFWExplicit];
  if (v5) {
    ++a4->var0;
  }
  return v5;
}

- (BOOL)avoidIfPossibleForKeyAssetWithSignals:(id)a3 statistics:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_r14j9IsAvailable)
  {
    unint64_t v7 = [(CLSCurationModel_v1 *)self junkClassificationModel];
    BOOL v8 = [v7 tragicFailureNode];
  }
  else
  {
    BOOL v8 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if ([v8 passesHighRecallWithSignal:v13])
        {
          ++a4->var0;
LABEL_36:
          BOOL v25 = 1;
          goto LABEL_37;
        }
        tabooEventModel = self->_tabooEventModel;
        if (tabooEventModel)
        {
          uint64_t v15 = [(CLSTabooEventModel *)tabooEventModel bloodNode];
          if ([v15 passesHighRecallWithSignal:v13])
          {
            unsigned int var1 = a4->var1;
            a4->unsigned int var1 = var1 + 1;

            if (var1 != -1) {
              goto LABEL_36;
            }
          }
          else
          {
          }
          uint64_t v17 = [(CLSTabooEventModel *)self->_tabooEventModel funeralNode];
          if ([v17 passesHighRecallWithSignal:v13])
          {
            unsigned int var2 = a4->var2;
            a4->unsigned int var2 = var2 + 1;

            if (var2 != -1) {
              goto LABEL_36;
            }
          }
          else
          {
          }
          v19 = [(CLSTabooEventModel *)self->_tabooEventModel hospitalNode];
          if ([v19 passesHighRecallWithSignal:v13])
          {
            unsigned int var3 = a4->var3;
            a4->unsigned int var3 = var3 + 1;

            if (var3 != -1) {
              goto LABEL_36;
            }
          }
          else
          {
          }
          v21 = [(CLSTabooEventModel *)self->_tabooEventModel vehicleCrashNode];
          if ([v21 passesHighRecallWithSignal:v13])
          {
            unsigned int var4 = a4->var4;
            a4->unsigned int var4 = var4 + 1;

            if (var4 != -1) {
              goto LABEL_36;
            }
          }
          else
          {
          }
          v23 = [(CLSTabooEventModel *)self->_tabooEventModel warNode];
          if ([v23 passesHighRecallWithSignal:v13])
          {
            unsigned int var5 = a4->var5;
            a4->unsigned int var5 = var5 + 1;

            if (var5 != -1) {
              goto LABEL_36;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      BOOL v25 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_37:

  return v25;
}

- (BOOL)isTragicFailureWithImageAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (self->_r14j9IsAvailable)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = objc_msgSend(v4, "clsSceneClassifications", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    double v8 = 0.0;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v12 extendedSceneIdentifier] == 2147483631)
          {
            [v12 confidence];
            double v8 = v13;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v14 = [(CLSCurationModel_v1 *)self junkClassificationModel];
    uint64_t v15 = [v14 tragicFailureNode];

    if ([v15 passesHighPrecisionWithConfidence:v8])
    {
      unsigned __int8 v16 = 1;
    }
    else if ([v15 passesHighRecallWithConfidence:v8])
    {
      unsigned __int8 v16 = [v5 clsIsBlurry];
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CLSCurationModel_v3;
    unsigned __int8 v16 = [(CLSCurationModel_v1 *)&v22 isTragicFailureWithImageAsset:v4];
  }

  return v16;
}

- (CLSCurationModel_v3)initWithCurationModelSpecification:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSCurationModel_v3;
  int v5 = [(CLSCurationModel_v1 *)&v17 initWithCurationModelSpecification:v4];
  if (v5)
  {
    uint64_t v6 = [v4 sceneAnalysisVersion];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F5E0D8]) initWithSceneAnalysisVersion:v6];
    nsfwModel = v5->_nsfwModel;
    v5->_nsfwModel = (CLSNSFWModel *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F5E0F8]) initWithSceneAnalysisVersion:v6];
    tabooEventModel = v5->_tabooEventModel;
    v5->_tabooEventModel = (CLSTabooEventModel *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F5E0E0]) initWithSceneAnalysisVersion:v6];
    potentialLandmarkModel = v5->_potentialLandmarkModel;
    v5->_potentialLandmarkModel = (CLSPotentialLandmarkModel *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F5E0E8]) initWithSceneAnalysisVersion:v6];
    sdModel = v5->_sdModel;
    v5->_sdModel = (CLSSDModel *)v13;

    uint64_t v15 = [(CLSCurationModel_v1 *)v5 junkClassificationModel];
    v5->_r14j9IsAvailable = (unint64_t)[v15 version] > 0x27;
  }
  return v5;
}

@end