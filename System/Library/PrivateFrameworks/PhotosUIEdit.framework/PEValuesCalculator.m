@interface PEValuesCalculator
+ (BOOL)shouldRunGeometricAutoCalculatorForSource:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoFrameTime;
- (BOOL)_geometricCurrentValuesCacheIsValid;
- (BOOL)_imageCurrentValuesCacheIsValid;
- (BOOL)hasImageValues;
- (BOOL)skipGeometricCalculations;
- (PEValuesCalculator)init;
- (PEValuesCalculatorDelegate)delegate;
- (PEValuesCalculatorSettings)settingsDelegate;
- (PICompositionController)compositionController;
- (PLEditSource)editSource;
- (double)smartColorAutoSuggestion;
- (double)smartToneAutoSuggestion;
- (id)apertureValuesWithAccuracy:(int64_t)a3;
- (id)autoCropValuesWithAccuracy:(int64_t)a3;
- (id)autoPerspectiveValuesWithAccuracy:(int64_t)a3;
- (id)portraitValuesWithAccuracy:(int64_t)a3;
- (id)semanticStyleStatistics;
- (id)smartColorStatisticsWithAccuracy:(int64_t)a3;
- (id)smartToneStatisticsWithAccuracy:(int64_t)a3;
- (void)_ensureCurrentGeometricValuesAreComputed;
- (void)_ensureCurrentImageValuesAreComputed;
- (void)_ensureInitialGeometricValuesAreComputed;
- (void)_ensureInitialImageValuesAreComputed;
- (void)_updateSettings;
- (void)computeAutoEnhanceWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)precomputeGeometricValues;
- (void)precomputeImageValues;
- (void)precomputeImageValuesWithOptionalCompletion:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditSource:(id)a3;
- (void)setSettingsDelegate:(id)a3;
- (void)setSkipGeometricCalculations:(BOOL)a3;
- (void)setVideoFrameTime:(id *)a3;
- (void)updateAdjustmentSemanticStyleStatistics:(id)a3;
- (void)updateAdjustmentSmartToneStatistics:(id)a3 withAccuracy:(int64_t)a4;
@end

@implementation PEValuesCalculator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_destroyWeak((id *)&self->_settingsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_computingGeometricValuesGroup, 0);
  objc_storeStrong((id *)&self->_geometricValuesComputationQueue, 0);
  objc_storeStrong((id *)&self->_computingImageValuesGroup, 0);
  objc_storeStrong((id *)&self->_imageValuesComputationQueue, 0);
  objc_storeStrong((id *)&self->_compositionControllerForCurrentValues, 0);
  objc_storeStrong((id *)&self->_initialGeometricValues, 0);
  objc_storeStrong((id *)&self->_initialImageValues, 0);
  objc_storeStrong((id *)&self->_currentGeometricValues, 0);
  objc_storeStrong((id *)&self->_currentImageValues, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setSkipGeometricCalculations:(BOOL)a3
{
  self->_skipGeometricCalculations = a3;
}

- (BOOL)skipGeometricCalculations
{
  return self->_skipGeometricCalculations;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (PEValuesCalculatorSettings)settingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsDelegate);
  return (PEValuesCalculatorSettings *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PEValuesCalculatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PEValuesCalculatorDelegate *)WeakRetained;
}

- (void)_ensureInitialGeometricValuesAreComputed
{
  if (![(PUPhotoEditImageValues *)self->_initialGeometricValues isComplete])
  {
    [(PEValuesCalculator *)self _ensureCurrentGeometricValuesAreComputed];
  }
}

- (void)_ensureCurrentGeometricValuesAreComputed
{
  if (![(PEValuesCalculator *)self _geometricCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self precomputeGeometricValues];
    computingGeometricValuesGroup = self->_computingGeometricValuesGroup;
    dispatch_group_wait(computingGeometricValuesGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_ensureInitialImageValuesAreComputed
{
  if (![(PUPhotoEditImageValues *)self->_initialImageValues isComplete])
  {
    [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
  }
}

- (void)_ensureCurrentImageValuesAreComputed
{
  if (![(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self precomputeImageValues];
    computingImageValuesGroup = self->_computingImageValuesGroup;
    dispatch_group_wait(computingImageValuesGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)computeAutoEnhanceWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PEValuesCalculator.m", 847, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(PEValuesCalculator *)self precomputeImageValues];
  v6 = [(PEValuesCalculator *)self compositionController];
  v7 = (void *)[v6 copy];

  imageValuesComputationQueue = self->_imageValuesComputationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke;
  block[3] = &unk_2642BF0E8;
  id v13 = v7;
  v14 = self;
  id v15 = v5;
  SEL v16 = a2;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(imageValuesComputationQueue, block);
}

void __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke(uint64_t a1)
{
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__2117;
  v33[4] = __Block_byref_object_dispose__2118;
  id v34 = 0;
  v2 = [*(id *)(a1 + 32) composition];
  if (([*(id *)(a1 + 40) skipGeometricCalculations] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 40) currentEditSource];

    if (!v3)
    {
      SEL v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"PEValuesCalculator.m" lineNumber:861 description:@"Need an edit source to perform this operation"];
    }
    id v4 = objc_alloc(MEMORY[0x263F5D988]);
    id v5 = [*(id *)(a1 + 40) editSource];
    v6 = (void *)[v4 initWithEditSource:v5];

    [v6 setCompositionController:*(void *)(a1 + 32)];
    uint64_t v7 = [v6 composition];

    v2 = (void *)v7;
  }
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = (void *)[objc_alloc(MEMORY[0x263F5D628]) initWithComposition:v2];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_2;
  v30[3] = &unk_2642BF098;
  v32 = v33;
  id v10 = v8;
  v31 = v10;
  [v9 submit:v30];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__2117;
  v28[4] = __Block_byref_object_dispose__2118;
  id v29 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);

  v12 = (void *)[objc_alloc(MEMORY[0x263F5D5C8]) initWithComposition:v2];
  id v13 = *(void **)(a1 + 40);
  if (v13)
  {
    [v13 videoFrameTime];
  }
  else
  {
    long long v26 = 0uLL;
    uint64_t v27 = 0;
  }
  long long v24 = v26;
  uint64_t v25 = v27;
  [v12 setTime:&v24];
  [v12 setName:@"PU-PIFaceBalanceAutoCalculator"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_3;
  v21[3] = &unk_2642BF098;
  v23 = v28;
  v14 = v11;
  v22 = v14;
  [v12 submit:v21];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_4;
  v17[3] = &unk_2642BF0C0;
  id v15 = *(void **)(a1 + 48);
  v17[4] = *(void *)(a1 + 40);
  id v18 = v15;
  v19 = v28;
  v20 = v33;
  dispatch_async(MEMORY[0x263EF83A0], v17);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v33, 8);
}

void __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = 0;
  v3 = [a2 result:&v8];
  id v4 = v8;
  uint64_t v5 = [v3 valueForKey:@"inputCorrectionInfo"];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v16 = 0;
  v3 = [a2 result:&v16];
  id v4 = v16;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = [v3 valueForKey:@"OrigI"];
    [v5 setObject:v6 forKeyedSubscript:@"faceI"];

    uint64_t v7 = [v3 valueForKey:@"OrigQ"];
    [v5 setObject:v7 forKeyedSubscript:@"faceQ"];

    id v8 = [v3 valueForKey:@"Strength"];
    [v5 setObject:v8 forKeyedSubscript:@"faceStrength"];

    id v9 = [v3 valueForKey:@"Warmth"];
    [v5 setObject:v9 forKeyedSubscript:@"faceWarmth"];

    id v10 = [v3 valueForKey:@"WarmTemp"];
    [v5 setObject:v10 forKeyedSubscript:@"warmTemp"];

    dispatch_semaphore_t v11 = [v3 valueForKey:@"WarmTint"];
    [v5 setObject:v11 forKeyedSubscript:@"warmTint"];

    v12 = [v3 valueForKey:@"WarmFace"];
    [v5 setObject:v12 forKeyedSubscript:@"warmFace"];

    uint64_t v13 = [v5 copy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) smartToneAutoSuggestion];
  unint64_t v3 = v2;
  [*(id *)(a1 + 32) smartColorAutoSuggestion];
  v4.n128_u64[0] = v6.n128_u64[0];
  uint64_t v5 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 40) + 16);
  v6.n128_u64[0] = v3;
  return v5(v6, v4);
}

- (void)invalidate
{
  currentImageValues = self->_currentImageValues;
  self->_currentImageValues = 0;

  id v4 = [(PEValuesCalculator *)self delegate];
  [v4 editValuesCalculatorHasChangedImageValues:self];
}

- (void)setVideoFrameTime:(id *)a3
{
  CMTime time1 = (CMTime)self->_videoFrameTime;
  CMTime v6 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &v6))
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_videoFrameTime.epoch = a3->var3;
    *(_OWORD *)&self->_videoFrameTime.value = v5;
    [(PEValuesCalculator *)self invalidate];
  }
}

- (BOOL)hasImageValues
{
  currentImageValues = self->_currentImageValues;
  if (currentImageValues) {
    LOBYTE(currentImageValues) = [(PUPhotoEditImageValues *)currentImageValues isComplete];
  }
  return (char)currentImageValues;
}

- (void)precomputeGeometricValues
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke;
  aBlock[3] = &unk_2642BF020;
  aBlock[4] = self;
  id v4 = (void (**)(void))_Block_copy(aBlock);
  currentGeometricValues = self->_currentGeometricValues;
  if (currentGeometricValues && ![(PUPhotoEditImageValues *)currentGeometricValues isComplete])
  {
    int v6 = 1;
    goto LABEL_10;
  }
  if ([(PEValuesCalculator *)self _geometricCurrentValuesCacheIsValid])
  {
    int v6 = 0;
LABEL_10:
    id v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        id v9 = @"Y";
      }
      else {
        id v9 = @"N";
      }
      if ([(PEValuesCalculator *)self _geometricCurrentValuesCacheIsValid]) {
        id v10 = @"Y";
      }
      else {
        id v10 = @"N";
      }
      *(_DWORD *)buf = 138412546;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "skipping precomputeGeometricValues; request pending? %@, cache valid? %@",
        buf,
        0x16u);
    }

LABEL_19:
    v4[2](v4);
    goto LABEL_20;
  }
  if (self->_skipGeometricCalculations)
  {
    uint64_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_DEFAULT, "skipping precomputeGeometricValues - skipGeometricCalculations = YES", buf, 2u);
    }

    goto LABEL_19;
  }
  dispatch_semaphore_t v11 = [(PEValuesCalculator *)self currentEditSource];
  if (!v11)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PEValuesCalculator.m" lineNumber:682 description:@"Need an edit source to perform this operation"];
  }
  v12 = [(PEValuesCalculator *)self compositionController];
  uint64_t v13 = (void *)[v12 copy];

  if (!v13)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PEValuesCalculator.m" lineNumber:684 description:@"Need a composition controller to perform this operation"];
  }
  objc_storeStrong((id *)&self->_compositionControllerForCurrentValues, v13);
  uint64_t v14 = objc_alloc_init(PUPhotoEditImageValues);
  id v15 = self->_currentGeometricValues;
  self->_currentGeometricValues = v14;

  if ([(id)objc_opt_class() shouldRunGeometricAutoCalculatorForSource:v11])
  {
    if (self->_initialGeometricValues)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = objc_alloc_init(PUPhotoEditImageValues);
      initialGeometricValues = self->_initialGeometricValues;
      self->_initialGeometricValues = v16;
    }
    dispatch_group_enter((dispatch_group_t)self->_computingGeometricValuesGroup);
    geometricValuesComputationQueue = self->_geometricValuesComputationQueue;
    computingGeometricValuesGroup = self->_computingGeometricValuesGroup;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_178;
    v23[3] = &unk_2642BF070;
    id v24 = v13;
    uint64_t v25 = self;
    v28 = v4;
    id v26 = v11;
    uint64_t v27 = v16;
    v20 = v16;
    dispatch_group_async(computingGeometricValuesGroup, geometricValuesComputationQueue, v23);
  }
  else
  {
    v4[2](v4);
  }

LABEL_20:
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2;
  block[3] = &unk_2642BF020;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_178(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    goto LABEL_16;
  }
  id v2 = objc_alloc(MEMORY[0x263F5D988]);
  unint64_t v3 = [*(id *)(a1 + 40) editSource];
  id v4 = (void *)[v2 initWithEditSource:v3];

  [v4 setCompositionController:*(void *)(a1 + 32)];
  long long v5 = [v4 composition];

  if (v5)
  {
    int v6 = PLPhotoEditGetLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);
    id v8 = v6;
    id v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_217B65000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GeometricAutoCalculators", " enableTelemetry=YES ", buf, 2u);
    }

    id v10 = dispatch_group_create();
    dispatch_semaphore_t v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v11, OS_LOG_TYPE_DEFAULT, "beginning geometric calculators", buf, 2u);
    }

    if (PECanRenderPortrait_onceToken != -1) {
      dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_213);
    }
    if (PECanRenderPortrait_canRenderPortrait && *(unsigned char *)(*(void *)(a1 + 40) + 80)
      || (int v12 = [(id)objc_opt_class() shouldRunGeometricAutoCalculatorForSource:*(void *)(a1 + 48)],
          uint64_t v13 = *(void *)(a1 + 40),
          v12)
      && (*(unsigned char *)(v13 + 81) || *(unsigned char *)(v13 + 82)))
    {
      uint64_t v14 = objc_opt_new();
      uint64_t v13 = *(void *)(a1 + 40);
    }
    else
    {
      uint64_t v14 = 0;
    }
    *(void *)buf = 0;
    v61 = buf;
    uint64_t v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__2117;
    v64 = __Block_byref_object_dispose__2118;
    id v65 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__2117;
    v58[4] = __Block_byref_object_dispose__2118;
    id v59 = 0;
    if (*(unsigned char *)(v13 + 81))
    {
      dispatch_group_enter(v10);
      id v16 = (void *)[objc_alloc(MEMORY[0x263F5D5A8]) initWithComposition:v5];
      [v16 setFaceObservationCache:v14];
      [v16 setMaxAutoStraighten:*(double *)(*(void *)(a1 + 40) + 88)];
      v17 = *(void **)(a1 + 40);
      if (v17)
      {
        [v17 videoFrameTime];
      }
      else
      {
        long long v56 = 0uLL;
        uint64_t v57 = 0;
      }
      long long v54 = v56;
      uint64_t v55 = v57;
      [v16 setTime:&v54];
      [v16 setName:@"PU-PICropAutoCalculator"];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_183;
      v49[3] = &unk_2642BEFA8;
      v52 = v58;
      v50 = v10;
      v51 = v9;
      os_signpost_id_t v53 = v7;
      [v16 submit:v49];

      uint64_t v13 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v13 + 82))
    {
      dispatch_group_enter(v10);
      id v18 = (void *)[objc_alloc(MEMORY[0x263F5D610]) initWithComposition:v5];
      [v18 setFaceObservationCache:v14];
      v19 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 40) + 96)];
      [v18 setMaxAutoYaw:v19];

      v20 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 40) + 104)];
      [v18 setMaxAutoPitch:v20];

      v21 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 40) + 112)];
      [v18 setMaxAutoAngle:v21];

      [v18 setDisableOnPanos:*(unsigned __int8 *)(*(void *)(a1 + 40) + 128)];
      [v18 setDisableOnFrontFacingCameraImages:*(unsigned __int8 *)(*(void *)(a1 + 40) + 129)];
      [v18 setMaxFaceSize:*(double *)(*(void *)(a1 + 40) + 120)];
      [v18 setShouldRunBuildingCheck:1];
      [v18 setDebugFilesEnabled:1];
      [v18 setDebugFilesPrefix:@"Edit"];
      [v18 setName:@"PU-PIPerspectiveAutoCalculator"];
      v22 = *(void **)(a1 + 40);
      if (v22)
      {
        [v22 videoFrameTime];
      }
      else
      {
        long long v47 = 0uLL;
        uint64_t v48 = 0;
      }
      long long v45 = v47;
      uint64_t v46 = v48;
      [v18 setTime:&v45];
      v23 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_192;
      block[3] = &unk_2642BF2C8;
      id v40 = v18;
      v43 = buf;
      v41 = v10;
      v42 = v9;
      os_signpost_id_t v44 = v7;
      id v24 = v18;
      dispatch_async(v23, block);

      uint64_t v13 = *(void *)(a1 + 40);
    }
    id v25 = *(id *)(v13 + 16);
    id v26 = *(NSObject **)(*(void *)(a1 + 40) + 64);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_194;
    v30[3] = &unk_2642BF048;
    id v35 = *(id *)(a1 + 64);
    v36 = v58;
    v37 = buf;
    uint64_t v27 = *(void *)(a1 + 40);
    id v31 = v25;
    uint64_t v32 = v27;
    id v33 = *(id *)(a1 + 56);
    uint64_t v34 = v9;
    os_signpost_id_t v38 = v7;
    v28 = v9;
    id v29 = v25;
    dispatch_group_notify(v10, v26, v30);

    _Block_object_dispose(v58, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
LABEL_16:
    id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v15();
  }
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_183(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    os_signpost_id_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Error in crop autocalculator: %@", buf, 0xCu);
    }
  }
  id v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PICropAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v10, OS_SIGNPOST_EVENT, v11, "GeometricAutoCalculators", "PICropAutoCalculator Complete", buf, 2u);
  }
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_192(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_193;
  v5[3] = &unk_2642BEFA8;
  uint64_t v8 = *(void *)(a1 + 56);
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v7 = v3;
  uint64_t v9 = v4;
  [v2 submit:v5];
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_194(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 32) setAutoCropValues:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [*(id *)(a1 + 32) setAutoPerspectiveValues:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_195;
  block[3] = &unk_2642BF318;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = v2;
  uint64_t v11 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    [v4 setAutoCropValues:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [*(id *)(a1 + 48) setAutoPerspectiveValues:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    [*(id *)(a1 + 48) setComplete:1];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 72));
  uint64_t v5 = *(id *)(a1 + 56);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 88);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v6, OS_SIGNPOST_INTERVAL_END, v7, "GeometricAutoCalculators", " enableTelemetry=YES ", v8, 2u);
  }
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_195(uint64_t a1)
{
  [*(id *)(a1 + 32) setComplete:1];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 editValuesCalculatorHasChangedGeometricValues:*(void *)(a1 + 40)];
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_193(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    os_signpost_id_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Error in perspective autocalculator: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PIPerspectiveAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v10, OS_SIGNPOST_EVENT, v11, "GeometricAutoCalculators", "PIPerspectiveAutoCalculator Complete", buf, 2u);
  }
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 editValuesCalculatorDidFinishComputingGeometricValues:*(void *)(a1 + 32)];
  }
}

- (void)precomputeImageValuesWithOptionalCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  currentImageValues = self->_currentImageValues;
  if (currentImageValues && ![(PUPhotoEditImageValues *)currentImageValues isComplete])
  {
    int v7 = 1;
    goto LABEL_10;
  }
  if ([(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    int v7 = 0;
LABEL_10:
    id v14 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        uint64_t v15 = @"Y";
      }
      else {
        uint64_t v15 = @"N";
      }
      if ([(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid]) {
        id v16 = @"Y";
      }
      else {
        id v16 = @"N";
      }
      *(_DWORD *)buf = 138412546;
      id v31 = v15;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl(&dword_217B65000, v14, OS_LOG_TYPE_DEFAULT, "skipping precomputeImageValuesWithOptionalCompletion; request pending? %@, cache valid? %@",
        buf,
        0x16u);
    }

    if (v5) {
      dispatch_group_notify((dispatch_group_t)self->_computingImageValuesGroup, (dispatch_queue_t)self->_imageValuesComputationQueue, v5);
    }
    goto LABEL_22;
  }
  uint64_t v8 = [(PEValuesCalculator *)self compositionController];
  uint64_t v9 = (void *)[v8 copy];

  if (!v9)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PEValuesCalculator.m" lineNumber:410 description:@"Need a composition controller to perform this operation"];
  }
  objc_storeStrong((id *)&self->_compositionControllerForCurrentValues, v9);
  id v10 = objc_alloc_init(PUPhotoEditImageValues);
  os_signpost_id_t v11 = self->_currentImageValues;
  self->_currentImageValues = v10;

  id v12 = [(PEValuesCalculator *)self delegate];
  [v12 editValuesCalculatorHasChangedImageValues:self];

  if (self->_initialImageValues)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = objc_alloc_init(PUPhotoEditImageValues);
    initialImageValues = self->_initialImageValues;
    self->_initialImageValues = v13;
  }
  dispatch_group_enter((dispatch_group_t)self->_computingImageValuesGroup);
  imageValuesComputationQueue = self->_imageValuesComputationQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke;
  v23[3] = &unk_2642BEFF8;
  id v24 = v9;
  id v25 = self;
  SEL v29 = a2;
  id v26 = v10;
  uint64_t v27 = v13;
  id v28 = v5;
  v19 = v13;
  v20 = v10;
  id v21 = v9;
  dispatch_sync(imageValuesComputationQueue, v23);

LABEL_22:
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) composition];
  if (([*(id *)(a1 + 40) skipGeometricCalculations] & 1) == 0 && *(void *)(a1 + 32))
  {
    char v3 = [*(id *)(a1 + 40) currentEditSource];
    if (!v3)
    {
      uint64_t v34 = [MEMORY[0x263F08690] currentHandler];
      [v34 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 40) file:@"PEValuesCalculator.m" lineNumber:436 description:@"Need an edit source to perform this operation"];
    }
    id v4 = objc_alloc(MEMORY[0x263F5D988]);
    id v5 = [*(id *)(a1 + 40) editSource];
    id v6 = (void *)[v4 initWithEditSource:v5];

    [v6 setCompositionController:*(void *)(a1 + 32)];
    uint64_t v7 = [v6 composition];

    id v2 = (void *)v7;
  }
  if (v2)
  {
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = __Block_byref_object_copy__2117;
    v89[4] = __Block_byref_object_dispose__2118;
    id v90 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__2117;
    v87[4] = __Block_byref_object_dispose__2118;
    id v88 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__2117;
    v85[4] = __Block_byref_object_dispose__2118;
    id v86 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = __Block_byref_object_copy__2117;
    v83[4] = __Block_byref_object_dispose__2118;
    id v84 = 0;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x3032000000;
    v81[3] = __Block_byref_object_copy__2117;
    v81[4] = __Block_byref_object_dispose__2118;
    id v82 = 0;
    uint64_t v8 = PLPhotoEditGetLog();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);
    id v10 = v8;
    os_signpost_id_t v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_217B65000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnterEditAutoCalculators", " enableTelemetry=YES ", buf, 2u);
    }

    id v12 = dispatch_group_create();
    uint64_t v13 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v13, OS_LOG_TYPE_DEFAULT, "beginning calculators", buf, 2u);
    }

    if (PECanRenderPortrait_onceToken != -1) {
      dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_213);
    }
    int v14 = PECanRenderPortrait_canRenderPortrait;
    if (PECanRenderPortrait_canRenderPortrait && *(unsigned char *)(*(void *)(a1 + 40) + 80)
      || (uint64_t v15 = objc_opt_class(),
          [*(id *)(a1 + 40) editSource],
          id v16 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v15) = [v15 shouldRunGeometricAutoCalculatorForSource:v16],
          v16,
          v15)
      && ((uint64_t v17 = *(void *)(a1 + 40), *(unsigned char *)(v17 + 81)) || *(unsigned char *)(v17 + 82)))
    {
      id v35 = objc_opt_new();
    }
    else
    {
      id v35 = 0;
    }
    id v18 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:2];
    v19 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = @"YES";
      if (!v14) {
        v20 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v92 = v20;
      _os_log_impl(&dword_217B65000, v19, OS_LOG_TYPE_DEFAULT, "will we do the portrait calculator? %@", buf, 0xCu);
    }

    uint64_t v21 = *(void *)(a1 + 40);
    if (v14)
    {
      if (*(unsigned char *)(v21 + 80))
      {
        dispatch_group_enter(v12);
        v22 = (void *)[objc_alloc(MEMORY[0x263F5D620]) initWithComposition:v2];
        [v22 setFaceObservationCache:v35];
        [v22 setName:@"PU-PIPortraitAutoCalculator"];
        [v22 setPriority:v18];
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_143;
        v76[3] = &unk_2642BEFA8;
        v79 = v83;
        v77 = v12;
        v78 = v11;
        os_signpost_id_t v80 = v9;
        [v22 submit:v76];

        uint64_t v21 = *(void *)(a1 + 40);
      }
      if (*(unsigned char *)(v21 + 83))
      {
        dispatch_group_enter(v12);
        v23 = (void *)[objc_alloc(MEMORY[0x263F5D5C0]) initWithComposition:v2];
        [v23 setName:@"PU-PIDepthEffectApertureAutoCalculator"];
        [v23 setPriority:v18];
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_149;
        v71[3] = &unk_2642BEFA8;
        v74 = v81;
        v72 = v12;
        v73 = v11;
        os_signpost_id_t v75 = v9;
        [v23 submit:v71];

        uint64_t v21 = *(void *)(a1 + 40);
      }
    }
    if (*(unsigned char *)(v21 + 84))
    {
      dispatch_group_enter(v12);
      id v24 = (void *)[objc_alloc(MEMORY[0x263F5D680]) initWithComposition:v2];
      id v25 = *(void **)(a1 + 40);
      if (v25)
      {
        [v25 videoFrameTime];
      }
      else
      {
        long long v69 = 0uLL;
        uint64_t v70 = 0;
      }
      long long v67 = v69;
      uint64_t v68 = v70;
      objc_msgSend(v24, "setTime:", &v67, v35);
      [v24 setName:@"PU-PISmartToneAutoCalculator"];
      [v24 setPriority:v18];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_154;
      v62[3] = &unk_2642BEFA8;
      id v65 = v89;
      v63 = v12;
      v64 = v11;
      os_signpost_id_t v66 = v9;
      [v24 submit:v62];

      uint64_t v21 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v21 + 85))
    {
      dispatch_group_enter(v12);
      id v26 = (void *)[objc_alloc(MEMORY[0x263F5D668]) initWithComposition:v2];
      uint64_t v27 = *(void **)(a1 + 40);
      if (v27)
      {
        [v27 videoFrameTime];
      }
      else
      {
        long long v60 = 0uLL;
        uint64_t v61 = 0;
      }
      long long v58 = v60;
      uint64_t v59 = v61;
      objc_msgSend(v26, "setTime:", &v58, v35);
      [v26 setName:@"PU-PISmartColorAutoCalculator"];
      [v26 setPriority:v18];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_162;
      v53[3] = &unk_2642BEFA8;
      long long v56 = v87;
      long long v54 = v12;
      uint64_t v55 = v11;
      os_signpost_id_t v57 = v9;
      [v26 submit:v53];

      uint64_t v21 = *(void *)(a1 + 40);
    }
    if (*(unsigned char *)(v21 + 86))
    {
      dispatch_group_enter(v12);
      id v28 = (void *)[objc_alloc(MEMORY[0x263F5D648]) initWithComposition:v2];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_164;
      v48[3] = &unk_2642BEFA8;
      v51 = v85;
      v49 = v12;
      v50 = v11;
      os_signpost_id_t v52 = v9;
      [v28 submit:v48];

      uint64_t v21 = *(void *)(a1 + 40);
    }
    SEL v29 = *(NSObject **)(v21 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_165;
    block[3] = &unk_2642BEFD0;
    v42 = v89;
    v43 = v87;
    id v30 = *(id *)(a1 + 48);
    os_signpost_id_t v44 = v85;
    long long v45 = v83;
    uint64_t v46 = v81;
    uint64_t v31 = *(void *)(a1 + 40);
    id v37 = v30;
    uint64_t v38 = v31;
    id v39 = *(id *)(a1 + 56);
    id v32 = *(id *)(a1 + 64);
    id v40 = v11;
    id v41 = v32;
    os_signpost_id_t v47 = v9;
    id v33 = v11;
    dispatch_group_notify(v12, v29, block);

    _Block_object_dispose(v81, 8);
    _Block_object_dispose(v83, 8);

    _Block_object_dispose(v85, 8);
    _Block_object_dispose(v87, 8);

    _Block_object_dispose(v89, 8);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Error in portrait autocalculator: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PIPortraitAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_signpost_id_t v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PIPortraitAutoCalculator Complete", buf, 2u);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Error in depth autocalculator: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PIDepthEffectApertureAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_signpost_id_t v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PIDepthEffectApertureAutoCalculator Complete", buf, 2u);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_154(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v14 = 0;
  uint64_t v3 = [a2 result:&v14];
  id v4 = v14;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if ([MEMORY[0x263F5D988] currentDeviceShouldAllowLocalLight]) {
      goto LABEL_7;
    }
    uint64_t v7 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutableCopy];
    [v7 removeObjectForKey:@"inputLocalLight"];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    os_signpost_id_t v9 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    os_signpost_id_t v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_ERROR, "Error in smart tone autocalculator: %@", buf, 0xCu);
    }
  }

LABEL_7:
  id v10 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_signpost_id_t v11 = *(id *)(a1 + 40);
  id v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v12, OS_SIGNPOST_EVENT, v13, "EnterEditAutoCalculators", "PISmartToneAutoCalculator Complete", buf, 2u);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_162(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Error in smart color autocalculator: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PISmartColorAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_signpost_id_t v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PISmartColorAutoCalculator Complete", buf, 2u);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_164(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "Error in semantic style autocalculator: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "PISemanticStyleAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  os_signpost_id_t v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PISemanticStyleAutoCalculator Complete", buf, 2u);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_165(uint64_t a1)
{
  id v2 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v2, OS_LOG_TYPE_DEFAULT, "All calculators complete", buf, 2u);
  }

  uint64_t v3 = (void *)MEMORY[0x263F5D8D0];
  uint64_t v4 = *MEMORY[0x263F5D868];
  uint64_t v5 = [MEMORY[0x263F5D678] inputLightKey];
  id v6 = [v3 valueForType:1 adjustmentKey:v4 settingKey:v5];
  [v6 floatValue];
  double v8 = v7;

  os_signpost_id_t v9 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v9)
  {
    id v10 = [v9 objectForKey:@"autoValue"];
    os_signpost_id_t v11 = v10;
    if (v10)
    {
      [v10 floatValue];
      double v8 = v12;
    }
  }
  os_signpost_id_t v13 = (void *)MEMORY[0x263F5D8D0];
  uint64_t v14 = *MEMORY[0x263F5D860];
  uint64_t v15 = [MEMORY[0x263F5D660] inputColorKey];
  id v16 = [v13 valueForType:1 adjustmentKey:v14 settingKey:v15];
  [v16 floatValue];
  double v18 = v17;

  v19 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v19)
  {
    v20 = [v19 objectForKey:@"satAutoValue"];
    uint64_t v21 = v20;
    if (v20)
    {
      [v20 floatValue];
      double v18 = v22;
    }
  }
  [*(id *)(a1 + 32) setSmartToneStatistics:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [*(id *)(a1 + 32) setSmartColorStatistics:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  [*(id *)(a1 + 32) setSemanticStyleStatistics:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  [*(id *)(a1 + 32) setSmartToneAutoSuggestion:v8];
  [*(id *)(a1 + 32) setSmartColorAutoSuggestion:v18];
  [*(id *)(a1 + 32) setPortraitValues:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
  [*(id *)(a1 + 32) setApertureValues:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  id v32 = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_174;
  id v33 = &unk_2642BF318;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 40);
  id v34 = v23;
  uint64_t v35 = v24;
  dispatch_async(MEMORY[0x263EF83A0], &v30);
  id v25 = *(void **)(a1 + 48);
  if (v25)
  {
    objc_msgSend(v25, "setSmartToneStatistics:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v30, v31, v32, v33);
    [*(id *)(a1 + 48) setSmartColorStatistics:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    [*(id *)(a1 + 48) setSemanticStyleStatistics:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    [*(id *)(a1 + 48) setSmartToneAutoSuggestion:v8];
    [*(id *)(a1 + 48) setSmartColorAutoSuggestion:v18];
    [*(id *)(a1 + 48) setPortraitValues:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
    [*(id *)(a1 + 48) setApertureValues:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
    [*(id *)(a1 + 48) setComplete:1];
  }
  uint64_t v26 = *(void *)(a1 + 64);
  if (v26) {
    (*(void (**)(void))(v26 + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 56));
  uint64_t v27 = *(id *)(a1 + 56);
  id v28 = v27;
  os_signpost_id_t v29 = *(void *)(a1 + 112);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v28, OS_SIGNPOST_INTERVAL_END, v29, "EnterEditAutoCalculators", " enableTelemetry=YES ", buf, 2u);
  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_174(uint64_t a1)
{
  [*(id *)(a1 + 32) setComplete:1];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 editValuesCalculatorHasChangedImageValues:*(void *)(a1 + 40)];
}

- (void)precomputeImageValues
{
}

- (BOOL)_geometricCurrentValuesCacheIsValid
{
  if (![(PUPhotoEditImageValues *)self->_currentGeometricValues isComplete]
    || !self->_compositionControllerForCurrentValues)
  {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x263F5D8D0];
  uint64_t v4 = [(PEValuesCalculator *)self compositionController];
  char v5 = [v3 compositionController:v4 isGeometryEqualToCompositionController:self->_compositionControllerForCurrentValues];

  return v5;
}

- (BOOL)_imageCurrentValuesCacheIsValid
{
  if (![(PUPhotoEditImageValues *)self->_currentImageValues isComplete]
    || !self->_compositionControllerForCurrentValues)
  {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x263F5D8D0];
  uint64_t v4 = [(PEValuesCalculator *)self compositionController];
  char v5 = [v3 compositionController:v4 isGeometryEqualToCompositionController:self->_compositionControllerForCurrentValues];

  return v5;
}

- (id)autoPerspectiveValuesWithAccuracy:(int64_t)a3
{
  if (a3 && ![(PEValuesCalculator *)self _geometricCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureInitialGeometricValuesAreComputed];
    uint64_t v4 = 32;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureCurrentGeometricValuesAreComputed];
    uint64_t v4 = 16;
  }
  char v5 = [*(id *)((char *)&self->super.isa + v4) autoPerspectiveValues];
  return v5;
}

- (id)autoCropValuesWithAccuracy:(int64_t)a3
{
  if (a3 && ![(PEValuesCalculator *)self _geometricCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureInitialGeometricValuesAreComputed];
    uint64_t v4 = 32;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureCurrentGeometricValuesAreComputed];
    uint64_t v4 = 16;
  }
  char v5 = [*(id *)((char *)&self->super.isa + v4) autoCropValues];
  return v5;
}

- (void)updateAdjustmentSemanticStyleStatistics:(id)a3
{
  id v4 = a3;
  id v5 = [(PEValuesCalculator *)self semanticStyleStatistics];
  [v4 updateWithSemStyleInfo:v5];
}

- (id)semanticStyleStatistics
{
  if ([(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
    uint64_t v3 = 8;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureInitialImageValuesAreComputed];
    uint64_t v3 = 24;
  }
  id v4 = [*(id *)((char *)&self->super.isa + v3) semanticStyleStatistics];
  return v4;
}

- (double)smartColorAutoSuggestion
{
  [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
  currentImageValues = self->_currentImageValues;
  [(PUPhotoEditImageValues *)currentImageValues smartColorAutoSuggestion];
  return result;
}

- (double)smartToneAutoSuggestion
{
  [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
  currentImageValues = self->_currentImageValues;
  [(PUPhotoEditImageValues *)currentImageValues smartToneAutoSuggestion];
  return result;
}

- (id)smartColorStatisticsWithAccuracy:(int64_t)a3
{
  if (a3 && ![(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureInitialImageValuesAreComputed];
    uint64_t v4 = 24;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
    uint64_t v4 = 8;
  }
  id v5 = [*(id *)((char *)&self->super.isa + v4) smartColorStatistics];
  return v5;
}

- (void)updateAdjustmentSmartToneStatistics:(id)a3 withAccuracy:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PEValuesCalculator *)self smartToneStatisticsWithAccuracy:a4];
  [v6 setStatistics:v7];
}

- (id)smartToneStatisticsWithAccuracy:(int64_t)a3
{
  if (a3 && ![(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureInitialImageValuesAreComputed];
    uint64_t v4 = 24;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
    uint64_t v4 = 8;
  }
  id v5 = [*(id *)((char *)&self->super.isa + v4) smartToneStatistics];
  return v5;
}

- (id)apertureValuesWithAccuracy:(int64_t)a3
{
  if (a3 && ![(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureInitialImageValuesAreComputed];
    uint64_t v4 = 24;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
    uint64_t v4 = 8;
  }
  id v5 = [*(id *)((char *)&self->super.isa + v4) apertureValues];
  return v5;
}

- (id)portraitValuesWithAccuracy:(int64_t)a3
{
  if (a3 && ![(PEValuesCalculator *)self _imageCurrentValuesCacheIsValid])
  {
    [(PEValuesCalculator *)self _ensureInitialImageValuesAreComputed];
    uint64_t v4 = 24;
  }
  else
  {
    [(PEValuesCalculator *)self _ensureCurrentImageValuesAreComputed];
    uint64_t v4 = 8;
  }
  id v5 = [*(id *)((char *)&self->super.isa + v4) portraitValues];
  return v5;
}

- (void)setEditSource:(id)a3
{
  id v5 = (PLEditSource *)a3;
  p_editSource = &self->_editSource;
  if (self->_editSource != v5)
  {
    os_signpost_id_t v13 = v5;
    objc_storeStrong((id *)p_editSource, a3);
    currentImageValues = self->_currentImageValues;
    self->_currentImageValues = 0;

    currentGeometricValues = self->_currentGeometricValues;
    self->_currentGeometricValues = 0;

    initialImageValues = self->_initialImageValues;
    self->_initialImageValues = 0;

    initialGeometricValues = self->_initialGeometricValues;
    self->_initialGeometricValues = 0;

    compositionControllerForCurrentValues = self->_compositionControllerForCurrentValues;
    self->_compositionControllerForCurrentValues = 0;

    float v12 = [(PEValuesCalculator *)self delegate];
    [v12 editValuesCalculatorHasChangedImageValues:self];

    id v5 = v13;
  }
  MEMORY[0x270F9A758](p_editSource, v5);
}

- (void)setCompositionController:(id)a3
{
  id v5 = (PICompositionController *)a3;
  p_compositionController = &self->_compositionController;
  if (self->_compositionController != v5)
  {
    os_signpost_id_t v13 = v5;
    objc_storeStrong((id *)p_compositionController, a3);
    currentImageValues = self->_currentImageValues;
    self->_currentImageValues = 0;

    currentGeometricValues = self->_currentGeometricValues;
    self->_currentGeometricValues = 0;

    initialImageValues = self->_initialImageValues;
    self->_initialImageValues = 0;

    initialGeometricValues = self->_initialGeometricValues;
    self->_initialGeometricValues = 0;

    compositionControllerForCurrentValues = self->_compositionControllerForCurrentValues;
    self->_compositionControllerForCurrentValues = 0;

    float v12 = [(PEValuesCalculator *)self delegate];
    [v12 editValuesCalculatorHasChangedImageValues:self];

    id v5 = v13;
  }
  MEMORY[0x270F9A758](p_compositionController, v5);
}

- (void)setSettingsDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_settingsDelegate, obj);
    [(PEValuesCalculator *)self _updateSettings];
    id v5 = obj;
  }
}

- (void)_updateSettings
{
  uint64_t v3 = [(PEValuesCalculator *)self settingsDelegate];

  if (v3)
  {
    uint64_t v4 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditPortraitAutoCalc = [v4 enableEnterEditPortraitAutoCalc];

    id v5 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditCropAutoCalc = [v5 enableEnterEditCropAutoCalc];

    id v6 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditPerspectiveAutoCalc = [v6 enableEnterEditPerspectiveAutoCalc];

    id v7 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditDepthEffectAutoCalc = [v7 enableEnterEditDepthEffectAutoCalc];

    double v8 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditSmartToneAutoCalc = [v8 enableEnterEditSmartToneAutoCalc];

    os_signpost_id_t v9 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditSmartColorAutoCalc = [v9 enableEnterEditSmartColorAutoCalc];

    id v10 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.enableEnterEditSemanticStyleAutoCalc = [v10 enableEnterEditSemanticStyleAutoCalc];

    os_signpost_id_t v11 = [(PEValuesCalculator *)self settingsDelegate];
    [v11 autoStraightenMaxAngle];
    self->_settings.autoStraightenMaxAngle = v12;

    os_signpost_id_t v13 = [(PEValuesCalculator *)self settingsDelegate];
    [v13 autoPerspectiveMaxYaw];
    self->_settings.autoPerspectiveMaxYaw = v14;

    uint64_t v15 = [(PEValuesCalculator *)self settingsDelegate];
    [v15 autoPerspectiveMaxPitch];
    self->_settings.autoPerspectiveMaxPitch = v16;

    float v17 = [(PEValuesCalculator *)self settingsDelegate];
    [v17 autoPerspectiveMaxAngle];
    self->_settings.autoPerspectiveMaxAngle = v18;

    v19 = [(PEValuesCalculator *)self settingsDelegate];
    [v19 autoPerspectiveMaxFaceSize];
    self->_settings.autoPerspectiveMaxFaceSize = v20;

    uint64_t v21 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.autoPerspectiveDisableOnPanos = [v21 autoPerspectiveDisableOnPanos];

    id v22 = [(PEValuesCalculator *)self settingsDelegate];
    self->_settings.autoPerspectiveDisableOnFrontFacingCameraImages = [v22 autoPerspectiveDisableOnFrontFacingCameraImages];
  }
  else
  {
    *(_DWORD *)&self->_settings.enableEnterEditDepthEffectAutoCalc = 16843009;
    *(_DWORD *)&self->_settings.enableEnterEditPortraitAutoCalc = 16843009;
    *(_OWORD *)&self->_settings.autoStraightenMaxAngle = xmmword_217BDEC00;
    *(_OWORD *)&self->_settings.autoPerspectiveMaxPitch = xmmword_217BDEC10;
    self->_settings.autoPerspectiveMaxFaceSize = 0.0;
    *(_WORD *)&self->_settings.autoPerspectiveDisableOnPanos = 257;
  }
}

- (PEValuesCalculator)init
{
  v12.receiver = self;
  v12.super_class = (Class)PEValuesCalculator;
  id v2 = [(PEValuesCalculator *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photos.PUPhotoEditImageValuesCalculator", 0);
    imageValuesComputationQueue = v2->_imageValuesComputationQueue;
    v2->_imageValuesComputationQueue = (OS_dispatch_queue *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    computingImageValuesGroup = v2->_computingImageValuesGroup;
    v2->_computingImageValuesGroup = (OS_dispatch_group *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.PUPhotoEditGeometricValuesCalculator", 0);
    geometricValuesComputationQueue = v2->_geometricValuesComputationQueue;
    v2->_geometricValuesComputationQueue = (OS_dispatch_queue *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    computingGeometricValuesGroup = v2->_computingGeometricValuesGroup;
    v2->_computingGeometricValuesGroup = (OS_dispatch_group *)v9;

    [(PEValuesCalculator *)v2 _updateSettings];
  }
  return v2;
}

+ (BOOL)shouldRunGeometricAutoCalculatorForSource:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v5 = isKindOfClass ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

@end