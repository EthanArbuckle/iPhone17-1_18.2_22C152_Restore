@interface PISmartCopyPasteAutoCalculator
+ (double)_clampedValueForValue:(double)a3 adjustmentKey:(id)a4 settingKey:(id)a5 fallbackMinValue:(double)a6 fallbackMaxValue:(double)a7;
+ (id)adjustmentsToModifyBasedOnSourceCompositionController:(id)a3;
+ (id)descriptionForAdjustmentDictionary:(id)a3;
+ (id)imageHarmonizationKitVersion;
+ (void)applyAdjustmentDictionary:(id)a3 toCompositionController:(id)a4;
- (NSData)sourceAssetScenePrint;
- (NSData)targetAssetScenePrint;
- (PISliderNetAdjustmentsRequest)adjustmentsRequest;
- (PISliderNetLiftRequest)liftRequest;
- (PISmartCopyPasteAutoCalculator)initWithComposition:(id)a3;
- (PISmartCopyPasteAutoCalculator)initWithSourceComposition:(id)a3 targetComposition:(id)a4;
- (double)similarityGatingThreshold;
- (id)adjustedCompositionForNetwork:(id)a3 withSourceComposition:(id)a4;
- (id)adjustmentsDictionaryWithNetworkOutput:(id)a3 similarity:(float)a4;
- (void)setAdjustmentsRequest:(id)a3;
- (void)setLiftRequest:(id)a3;
- (void)setSimilarityGatingThreshold:(double)a3;
- (void)setSourceAssetScenePrint:(id)a3;
- (void)setTargetAssetScenePrint:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PISmartCopyPasteAutoCalculator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentsRequest, 0);
  objc_storeStrong((id *)&self->_liftRequest, 0);
  objc_storeStrong((id *)&self->_targetAssetScenePrint, 0);
  objc_storeStrong((id *)&self->_sourceAssetScenePrint, 0);
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sliderNetModel, 0);
}

- (void)setAdjustmentsRequest:(id)a3
{
}

- (PISliderNetAdjustmentsRequest)adjustmentsRequest
{
  return self->_adjustmentsRequest;
}

- (void)setLiftRequest:(id)a3
{
}

- (PISliderNetLiftRequest)liftRequest
{
  return self->_liftRequest;
}

- (void)setTargetAssetScenePrint:(id)a3
{
}

- (NSData)targetAssetScenePrint
{
  return self->_targetAssetScenePrint;
}

- (void)setSourceAssetScenePrint:(id)a3
{
}

- (NSData)sourceAssetScenePrint
{
  return self->_sourceAssetScenePrint;
}

- (void)setSimilarityGatingThreshold:(double)a3
{
  self->_similarityGatingThreshold = a3;
}

- (double)similarityGatingThreshold
{
  return self->_similarityGatingThreshold;
}

- (id)adjustedCompositionForNetwork:(id)a3 withSourceComposition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PICompositionController alloc] initWithComposition:v6];

  uint64_t v8 = [(PICompositionController *)v7 mediaType];
  v9 = [(PICompositionController *)v7 source];
  v10 = [[PICompositionController alloc] initWithComposition:v5];

  [(PICompositionController *)v10 setSource:v9 mediaType:v8];
  [(PICompositionController *)v10 removeAdjustmentWithKey:@"depthEffect"];
  [(PICompositionController *)v10 removeAdjustmentWithKey:@"portraitEffect"];
  [(PICompositionController *)v10 removeAdjustmentWithKey:@"cropStraighten"];
  [(PICompositionController *)v7 applyChangesFromCompositionController:v10];
  [(PICompositionController *)v7 modifyAdjustmentWithKey:@"whiteBalance" modificationBlock:&__block_literal_global_11639];
  [(PICompositionController *)v7 modifyAdjustmentWithKey:@"smartTone" modificationBlock:&__block_literal_global_41];
  v11 = [(PICompositionController *)v7 composition];

  return v11;
}

uint64_t __86__PISmartCopyPasteAutoCalculator_adjustedCompositionForNetwork_withSourceComposition___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setOffsetExposure:0.0];
}

void __86__PISmartCopyPasteAutoCalculator_adjustedCompositionForNetwork_withSourceComposition___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setEnabled:0];
  [v2 setWarmTemp:0.0];
  [v2 setWarmTint:0.0];
}

- (id)adjustmentsDictionaryWithNetworkOutput:(id)a3 similarity:(float)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [v5 objectForKey:@"Exposure"];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"Exposure"];
    v9 = +[PISmartToneAdjustmentController offsetExposureKey];
    [v6 setObject:v8 forKeyedSubscript:v9];
  }
  v10 = [v5 objectForKey:@"Warm Temp"];

  if (v10)
  {
    v11 = [v5 objectForKeyedSubscript:@"Warm Temp"];
    v12 = +[PIWhiteBalanceAdjustmentController warmTempKey];
    [v6 setObject:v11 forKeyedSubscript:v12];
  }
  v13 = [v5 objectForKey:@"Warm Tint"];

  if (v13)
  {
    v15 = [v5 objectForKeyedSubscript:@"Warm Tint"];
    v16 = +[PIWhiteBalanceAdjustmentController warmTintKey];
    [v6 setObject:v15 forKeyedSubscript:v16];
  }
  *(float *)&double v14 = a4;
  v17 = [NSNumber numberWithFloat:v14];
  [v6 setObject:v17 forKeyedSubscript:@"sourceSimilarity"];

  v18 = (void *)[v6 copy];
  return v18;
}

- (void)submit:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__11656;
  v37 = __Block_byref_object_dispose__11657;
  id v38 = 0;
  if (!self->_sliderNetModel)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    id v5 = (id *)getkSliderNetGatingMethodSymbolLoc_ptr;
    uint64_t v47 = getkSliderNetGatingMethodSymbolLoc_ptr;
    if (!getkSliderNetGatingMethodSymbolLoc_ptr)
    {
      id location = (id)MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __getkSliderNetGatingMethodSymbolLoc_block_invoke;
      v42 = &unk_1E5D81578;
      v43 = &v44;
      id v6 = ImageHarmonizationKitLibrary();
      v7 = dlsym(v6, "kSliderNetGatingMethod");
      *(void *)(v43[1] + 24) = v7;
      getkSliderNetGatingMethodSymbolLoc_ptr = *(void *)(v43[1] + 24);
      id v5 = (id *)v45[3];
    }
    _Block_object_dispose(&v44, 8);
    if (!v5)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = [NSString stringWithUTF8String:"NSString *getkSliderNetGatingMethod(void)"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"PISmartCopyPasteAutoCalculator.m", 27, @"%s", dlerror());

      __break(1u);
    }
    id v8 = *v5;
    id v48 = v8;
    v49[0] = &unk_1F0009B78;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];

    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    v10 = (void *)getIHKSliderNetCPModelClass_softClass;
    uint64_t v47 = getIHKSliderNetCPModelClass_softClass;
    if (!getIHKSliderNetCPModelClass_softClass)
    {
      id location = (id)MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __getIHKSliderNetCPModelClass_block_invoke;
      v42 = &unk_1E5D81578;
      v43 = &v44;
      __getIHKSliderNetCPModelClass_block_invoke((uint64_t)&location);
      v10 = (void *)v45[3];
    }
    v11 = v10;
    _Block_object_dispose(&v44, 8);
    id v32 = 0;
    v12 = (IHKSliderNetCPModel *)[[v11 alloc] initWithModelType:1 options:v9 error:&v32];
    id v13 = v32;
    sliderNetModel = self->_sliderNetModel;
    self->_sliderNetModel = v12;

    if (!self->_sliderNetModel)
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v13];
      v25 = (void *)v34[5];
      v34[5] = v24;

      v4[2](v4, v34[5]);
      goto LABEL_13;
    }
  }
  objc_initWeak(&location, self);
  v15 = [(PISmartCopyPasteAutoCalculator *)self liftRequest];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    v17 = [PISliderNetLiftRequest alloc];
    uint64_t v18 = [(NURenderRequest *)self composition];
    v19 = [(PISliderNetBaseRequest *)v17 initWithComposition:v18 sliderNetModel:self->_sliderNetModel];
    [(PISmartCopyPasteAutoCalculator *)self setLiftRequest:v19];

    v20 = [(PISmartCopyPasteAutoCalculator *)self sourceAssetScenePrint];
    LOBYTE(v18) = v20 == 0;

    if ((v18 & 1) == 0)
    {
      v21 = [(PISmartCopyPasteAutoCalculator *)self sourceAssetScenePrint];
      v22 = [(PISmartCopyPasteAutoCalculator *)self liftRequest];
      [v22 setAssetScenePrint:v21];
    }
  }
  v23 = [(PISmartCopyPasteAutoCalculator *)self liftRequest];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __41__PISmartCopyPasteAutoCalculator_submit___block_invoke;
  v28[3] = &unk_1E5D7FCD8;
  objc_copyWeak(&v31, &location);
  v30 = &v33;
  v28[4] = self;
  v29 = v4;
  [v23 submit:v28];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
LABEL_13:
  _Block_object_dispose(&v33, 8);
}

void __41__PISmartCopyPasteAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 56);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  id v31 = 0;
  id v6 = [v4 result:&v31];

  id v7 = v31;
  if (v6)
  {
    id v8 = (void *)[WeakRetained[20] copy];
    v9 = [WeakRetained composition];
    v10 = [WeakRetained adjustedCompositionForNetwork:v8 withSourceComposition:v9];

    v11 = [WeakRetained adjustmentsRequest];

    if (!v11)
    {
      v12 = [(PISliderNetBaseRequest *)[PISliderNetAdjustmentsRequest alloc] initWithComposition:v10 sliderNetModel:WeakRetained[19]];
      [WeakRetained setAdjustmentsRequest:v12];

      [WeakRetained similarityGatingThreshold];
      double v14 = v13;
      v15 = [WeakRetained adjustmentsRequest];
      [v15 setSimilarityGatingThreshold:v14];

      BOOL v16 = [*(id *)(a1 + 32) targetAssetScenePrint];

      if (v16)
      {
        v17 = [*(id *)(a1 + 32) targetAssetScenePrint];
        uint64_t v18 = [WeakRetained adjustmentsRequest];
        [v18 setAssetScenePrint:v17];
      }
    }
    v19 = [v6 styleFeatureVectorData];
    v20 = [WeakRetained adjustmentsRequest];
    [v20 setStyleFeatureVectorData:v19];

    v21 = [v6 contentFeatureVectorData];
    v22 = [WeakRetained adjustmentsRequest];
    [v22 setContentFeatureVectorData:v21];

    v23 = [WeakRetained adjustmentsRequest];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __41__PISmartCopyPasteAutoCalculator_submit___block_invoke_2;
    v29[3] = &unk_1E5D7FCB0;
    v29[4] = *(void *)(a1 + 32);
    long long v28 = *(_OWORD *)(a1 + 40);
    id v24 = (id)v28;
    long long v30 = v28;
    [v23 submit:v29];
  }
  else
  {
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __41__PISmartCopyPasteAutoCalculator_submit___block_invoke_2(void *a1, void *a2)
{
  id v13 = 0;
  v3 = [a2 result:&v13];
  id v4 = v13;
  if (v3)
  {
    id v5 = (void *)a1[4];
    id v6 = [v3 adjustments];
    [v3 similarityScore];
    id v7 = objc_msgSend(v5, "adjustmentsDictionaryWithNetworkOutput:similarity:", v6);

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v7];
    uint64_t v9 = *(void *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (PISmartCopyPasteAutoCalculator)initWithSourceComposition:(id)a3 targetComposition:(id)a4
{
  id v6 = (NUComposition *)a4;
  v10.receiver = self;
  v10.super_class = (Class)PISmartCopyPasteAutoCalculator;
  id v7 = [(NURenderRequest *)&v10 initWithComposition:a3];
  targetComposition = v7->_targetComposition;
  v7->_targetComposition = v6;

  v7->_similarityGatingThreshold = -1.0;
  return v7;
}

- (PISmartCopyPasteAutoCalculator)initWithComposition:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSString;
      uint64_t v9 = v7;
      objc_super v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(a2);
      id v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      long long v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_104_11682);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          BOOL v16 = (void *)MEMORY[0x1E4F29060];
          v17 = v15;
          uint64_t v18 = [v16 callStackSymbols];
          v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          long long v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_104_11682);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      v17 = v20;
      id v24 = [v22 callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      long long v28 = specific;
      __int16 v29 = 2114;
      long long v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_104_11682);
  }
}

+ (id)imageHarmonizationKitVersion
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", 20230629);
}

+ (id)descriptionForAdjustmentDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[PISmartToneAdjustmentController offsetExposureKey];
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v5 doubleValue];
  uint64_t v7 = v6;

  uint64_t v8 = +[PIWhiteBalanceAdjustmentController warmTempKey];
  uint64_t v9 = [v3 objectForKeyedSubscript:v8];
  [v9 doubleValue];
  uint64_t v11 = v10;

  uint64_t v12 = +[PIWhiteBalanceAdjustmentController warmTintKey];
  id v13 = [v3 objectForKeyedSubscript:v12];

  [v13 doubleValue];
  uint64_t v15 = v14;

  return (id)[NSString stringWithFormat:@"Exp(%.2f), Warmth(%.2f), Tint(%.2f)", v7, v11, v15];
}

+ (id)adjustmentsToModifyBasedOnSourceCompositionController:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 smartToneAdjustmentController];

  if (v5)
  {
    uint64_t v6 = [v3 smartToneAdjustmentController];
    [v6 offsetExposure];
    double v8 = v7;

    if (v8 != 0.0)
    {
      uint64_t v9 = +[PISmartToneAdjustmentController offsetExposureKey];
      [v4 addObject:v9];
    }
  }
  uint64_t v10 = [v3 whiteBalanceAdjustmentController];

  if (v10)
  {
    uint64_t v11 = [v3 whiteBalanceAdjustmentController];
    [v11 warmTemp];
    if (v12 == 0.0)
    {
      id v13 = [v3 whiteBalanceAdjustmentController];
      [v13 warmTint];
      double v15 = v14;

      if (v15 == 0.0) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    BOOL v16 = +[PIWhiteBalanceAdjustmentController warmTempKey];
    [v4 addObject:v16];

    v17 = +[PIWhiteBalanceAdjustmentController warmTintKey];
    [v4 addObject:v17];
  }
LABEL_10:

  return v4;
}

+ (double)_clampedValueForValue:(double)a3 adjustmentKey:(id)a4 settingKey:(id)a5 fallbackMinValue:(double)a6 fallbackMaxValue:(double)a7
{
  uint64_t v10 = +[PICompositionController settingForAdjustmentKey:a4 settingKey:a5];
  uint64_t v11 = objc_msgSend(v10, "ui_minimumValue");
  if (v11)
  {
    double v12 = objc_msgSend(v10, "ui_minimumValue");
    [v12 floatValue];
    a6 = v13;
  }
  double v14 = objc_msgSend(v10, "ui_maximumValue");
  if (v14)
  {
    double v15 = objc_msgSend(v10, "ui_maximumValue");
    [v15 floatValue];
    a7 = v16;
  }
  if (a7 <= a3) {
    double v17 = a7;
  }
  else {
    double v17 = a3;
  }
  if (a6 >= v17) {
    double v18 = a6;
  }
  else {
    double v18 = v17;
  }

  return v18;
}

+ (void)applyAdjustmentDictionary:(id)a3 toCompositionController:(id)a4
{
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke;
  v13[3] = &unk_1E5D7FD40;
  id v7 = v6;
  id v14 = v7;
  id v15 = a1;
  id v8 = a4;
  [v8 modifyAdjustmentWithKey:@"whiteBalance" modificationBlock:v13];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke_2;
  v10[3] = &unk_1E5D7FD68;
  id v11 = v7;
  id v12 = a1;
  id v9 = v7;
  [v8 modifyAdjustmentWithKey:@"smartTone" modificationBlock:v10];
}

void __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = +[PIWhiteBalanceAdjustmentController warmTempKey];
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = *(void **)(a1 + 32);
  id v9 = +[PIWhiteBalanceAdjustmentController warmTintKey];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  [v10 doubleValue];
  double v12 = v11;

  if (v7 != 0.0 || v12 != 0.0)
  {
    [v21 setEnabled:1];
    [v21 setColorType:3];
    float v13 = *(void **)(a1 + 40);
    id v14 = +[PIWhiteBalanceAdjustmentController warmTempKey];
    [v13 _clampedValueForValue:@"whiteBalance" adjustmentKey:v14 settingKey:v7 fallbackMinValue:-0.5 fallbackMaxValue:0.5];
    double v16 = v15;

    [v21 setWarmTemp:v16];
    double v17 = *(void **)(a1 + 40);
    double v18 = +[PIWhiteBalanceAdjustmentController warmTintKey];
    [v17 _clampedValueForValue:@"whiteBalance" adjustmentKey:v18 settingKey:v12 fallbackMinValue:-1.0 fallbackMaxValue:1.0];
    double v20 = v19;

    [v21 setWarmTint:v20];
  }
}

void __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = +[PISmartToneAdjustmentController offsetExposureKey];
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  if (v7 != 0.0)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = +[PISmartToneAdjustmentController offsetExposureKey];
    [v8 _clampedValueForValue:@"smartTone" adjustmentKey:v9 settingKey:v7 fallbackMinValue:-1.0 fallbackMaxValue:1.0];
    double v11 = v10;

    [v12 setEnabled:1];
    [v12 setOffsetExposure:v11];
  }
}

@end