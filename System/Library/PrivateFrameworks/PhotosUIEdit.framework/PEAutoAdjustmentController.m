@interface PEAutoAdjustmentController
+ (BOOL)isAutoEnhanceEnabledForAsset:(id)a3;
+ (BOOL)isAutoEnhanceEnabledForCompositionController:(id)a3;
- (BOOL)isBusy;
- (NUImageProperties)imageProperties;
- (double)defaultAutoEnhanceIntensityForCompositionController:(id)a3;
- (void)_applyAutoValuesOnCompositionController:(id)a3 whiteBalanceSettings:(id)a4 redEyeCorrections:(id)a5 smartToneLevel:(double)a6 smartColorLevel:(double)a7 valuesCalculator:(id)a8;
- (void)_enableAutoEnhanceOnCompositionController:(id)a3 valuesCalculator:(id)a4 useCompositionIntensity:(BOOL)a5 completionHandler:(id)a6;
- (void)_revertAutoValuesOnCompositionController:(id)a3;
- (void)_setBusy:(BOOL)a3;
- (void)calculateStatisticsForCompositionController:(id)a3 valuesCalculator:(id)a4 completionHandler:(id)a5;
- (void)disableAutoEnhanceOnCompositionController:(id)a3;
- (void)enableAutoEnhanceOnCompositionController:(id)a3 useCompositionIntensity:(BOOL)a4 valuesCalculator:(id)a5 completionHandler:(id)a6;
- (void)enableAutoEnhanceOnCompositionController:(id)a3 valuesCalculator:(id)a4 completionHandler:(id)a5;
- (void)ensureCacheUpToDateForValuesCalculator:(id)a3 completionHandler:(id)a4;
- (void)invalidateCachedAdjustments;
- (void)setImageProperties:(id)a3;
@end

@implementation PEAutoAdjustmentController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_stashedPreviousManualComposition, 0);
  objc_storeStrong((id *)&self->_cachedWhiteBalanceSettings, 0);
  objc_storeStrong((id *)&self->_cachedRedEyeCorrections, 0);
}

- (void)setImageProperties:(id)a3
{
}

- (NUImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (void)_setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)isBusy
{
  return self->_busy;
}

- (void)_revertAutoValuesOnCompositionController:(id)a3
{
  stashedPreviousManualComposition = self->_stashedPreviousManualComposition;
  id v5 = a3;
  v6 = PLPhotoEditGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (stashedPreviousManualComposition)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v6, OS_LOG_TYPE_DEFAULT, "Removing auto enhance. Reverting to previously saved manual adjustments.", buf, 2u);
    }

    v8 = self->_stashedPreviousManualComposition;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v6, OS_LOG_TYPE_DEFAULT, "Removing auto enhance. Reverting to identity adjustments.", buf, 2u);
    }

    v8 = (PICompositionController *)[MEMORY[0x263F5D8D0] newIdentityCompositionController];
  }
  v9 = v8;
  v10 = self->_stashedPreviousManualComposition;
  self->_stashedPreviousManualComposition = 0;

  v11 = (void *)[v5 copy];
  uint64_t v12 = *MEMORY[0x263F5D868];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke;
  v22[3] = &unk_2642BE630;
  v13 = v9;
  v23 = v13;
  [v11 modifyAdjustmentWithKey:v12 modificationBlock:v22];
  uint64_t v14 = *MEMORY[0x263F5D860];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_2;
  v20[3] = &unk_2642BEED0;
  v15 = v13;
  v21 = v15;
  [v11 modifyAdjustmentWithKey:v14 modificationBlock:v20];
  uint64_t v16 = *MEMORY[0x263F5D890];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_3;
  v18[3] = &unk_2642BEF18;
  v19 = v15;
  v17 = v15;
  [v11 modifyAdjustmentWithKey:v16 modificationBlock:v18];
  [v11 removeAdjustmentWithKey:*MEMORY[0x263F5D790]];
  [v5 applyChangesFromCompositionController:v11];
}

void __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 smartToneAdjustmentController];
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "enabled"));
  [v4 inputLight];
  objc_msgSend(v3, "setInputLight:");
  [v3 setIsAuto:0];
}

void __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 smartColorAdjustmentController];
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "enabled"));
  [v4 inputColor];
  objc_msgSend(v3, "setInputColor:");
  [v3 setIsAuto:0];
}

void __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) whiteBalanceAdjustmentController];
  objc_msgSend(v5, "setColorType:", objc_msgSend(v3, "colorType"));
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v3, "enabled"));
  [v3 faceStrength];
  objc_msgSend(v5, "setFaceStrength:");
  [v3 faceWarmth];
  objc_msgSend(v5, "setFaceWarmth:");
  [v3 faceI];
  objc_msgSend(v5, "setFaceI:");
  [v3 faceQ];
  objc_msgSend(v5, "setFaceQ:");
  [v3 grayStrength];
  objc_msgSend(v5, "setGrayStrength:");
  [v3 grayWarmth];
  objc_msgSend(v5, "setGrayWarmth:");
  [v3 grayY];
  objc_msgSend(v5, "setGrayY:");
  [v3 grayI];
  objc_msgSend(v5, "setGrayI:");
  [v3 grayQ];
  objc_msgSend(v5, "setGrayQ:");
  [v3 temperature];
  if (v4 > 0.0)
  {
    [v3 temperature];
    objc_msgSend(v5, "setTemperature:");
  }
  [v3 tint];
  objc_msgSend(v5, "setTint:");
  [v3 warmTemp];
  objc_msgSend(v5, "setWarmTemp:");
  [v3 warmTint];
  objc_msgSend(v5, "setWarmTint:");
  objc_msgSend(v5, "setWarmFace:", objc_msgSend(v3, "warmFace"));
  [v5 setIsAuto:0];
}

- (void)_applyAutoValuesOnCompositionController:(id)a3 whiteBalanceSettings:(id)a4 redEyeCorrections:(id)a5 smartToneLevel:(double)a6 smartColorLevel:(double)a7 valuesCalculator:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v43 = v15;
    __int16 v44 = 2112;
    id v45 = v16;
    __int16 v46 = 2048;
    double v47 = a6;
    __int16 v48 = 2048;
    double v49 = a7;
    _os_log_impl(&dword_217B65000, v18, OS_LOG_TYPE_DEFAULT, "Applying auto enhance. White Balance: %@\nRed Eye: %@\nSmartTone: %f\nSmartColor: %f", buf, 0x2Au);
  }

  v19 = [v14 adjustmentConstants];
  v20 = (PICompositionController *)[v14 copy];
  stashedPreviousManualComposition = self->_stashedPreviousManualComposition;
  self->_stashedPreviousManualComposition = v20;

  v22 = (void *)[v14 copy];
  v23 = [v19 PISmartToneAdjustmentKey];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke;
  v39[3] = &unk_2642BE2B8;
  id v24 = v17;
  id v40 = v24;
  double v41 = a6;
  [v22 modifyAdjustmentWithKey:v23 modificationBlock:v39];

  v25 = [v19 PISmartColorAdjustmentKey];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_2;
  v36[3] = &unk_2642BE2E0;
  id v26 = v24;
  id v37 = v26;
  double v38 = a7;
  [v22 modifyAdjustmentWithKey:v25 modificationBlock:v36];

  if (v15)
  {
    v27 = [v19 PIWhiteBalanceAdjustmentKey];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_3;
    v34[3] = &unk_2642BEF18;
    id v35 = v15;
    [v22 modifyAdjustmentWithKey:v27 modificationBlock:v34];
  }
  if (v16)
  {
    v28 = [v19 PIRedEyeAdjustmentKey];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_4;
    v32 = &unk_2642BE308;
    id v33 = v16;
    [v22 modifyAdjustmentWithKey:v28 modificationBlock:&v29];
  }
  objc_msgSend(v14, "applyChangesFromCompositionController:", v22, v29, v30, v31, v32);
}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 updateAdjustmentSmartToneStatistics:v4 withAccuracy:0];
  [v4 setEnabled:1];
  [v4 setInputLight:*(double *)(a1 + 40)];
  [v4 setIsAuto:1];
}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 statistics];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) smartColorStatisticsWithAccuracy:0];
    [v5 setStatistics:v4];
  }
  [v5 setEnabled:1];
  [v5 setInputColor:*(double *)(a1 + 40)];
  [v5 setIsAuto:1];
}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 setEnabled:1];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"faceI"];
  [v3 doubleValue];
  objc_msgSend(v10, "setFaceI:");

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"faceQ"];
  [v4 doubleValue];
  objc_msgSend(v10, "setFaceQ:");

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"faceStrength"];
  [v5 doubleValue];
  objc_msgSend(v10, "setFaceStrength:");

  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"faceWarmth"];
  [v6 doubleValue];
  objc_msgSend(v10, "setFaceWarmth:");

  [v10 setColorType:3];
  BOOL v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"warmTemp"];
  [v7 doubleValue];
  objc_msgSend(v10, "setWarmTemp:");

  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"warmTint"];
  [v8 doubleValue];
  objc_msgSend(v10, "setWarmTint:");

  v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"warmFace"];
  objc_msgSend(v10, "setWarmFace:", objc_msgSend(v9, "BOOLValue"));

  [v10 setIsAuto:1];
}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setInputCorrectionInfo:v2];
  [v3 setIsAuto:1];
  [v3 setEnabled:1];
}

- (double)defaultAutoEnhanceIntensityForCompositionController:(id)a3
{
  id v3 = [a3 smartToneAdjustmentController];
  [v3 inputLightDefault];
  double v5 = v4;

  return v5;
}

- (void)invalidateCachedAdjustments
{
  self->_cachedValuesAreValid = 0;
  cachedRedEyeCorrections = self->_cachedRedEyeCorrections;
  self->_cachedRedEyeCorrections = 0;

  cachedWhiteBalanceSettings = self->_cachedWhiteBalanceSettings;
  self->_cachedWhiteBalanceSettings = 0;

  self->_cachedSmartToneLevel = 0.0;
  self->_cachedSmartColorLevel = 0.0;
  stashedPreviousManualComposition = self->_stashedPreviousManualComposition;
  self->_stashedPreviousManualComposition = 0;
}

- (void)disableAutoEnhanceOnCompositionController:(id)a3
{
  id v4 = a3;
  double v5 = PLPhotoEditGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  BOOL v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AutoEnhanceDisableOnComposition", "", buf, 2u);
  }

  if ([(PEAutoAdjustmentController *)self isBusy])
  {
    uint64_t v12 = (PEAutoAdjustmentController *)_PFAssertFailHandler();
    [(PEAutoAdjustmentController *)v12 ensureCacheUpToDateForValuesCalculator:v14 completionHandler:v15];
  }
  else
  {
    v9 = (void *)[v4 copy];
    [(PEAutoAdjustmentController *)self _revertAutoValuesOnCompositionController:v9];
    [v4 applyChangesFromCompositionController:v9];
    id v10 = v8;
    v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)id v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_217B65000, v11, OS_SIGNPOST_INTERVAL_END, v6, "AutoEnhanceDisableOnComposition", "", v16, 2u);
    }
  }
}

- (void)ensureCacheUpToDateForValuesCalculator:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_cachedValuesAreValid)
  {
    if (v7) {
      (*((void (**)(id))v7 + 2))(v7);
    }
  }
  else
  {
    v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_DEFAULT, "Computing auto enhance. No cache, computing it now...", buf, 2u);
    }

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    uint64_t v11 = v10;
    [(PEAutoAdjustmentController *)self _setBusy:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__PEAutoAdjustmentController_ensureCacheUpToDateForValuesCalculator_completionHandler___block_invoke;
    v12[3] = &unk_2642BE290;
    uint64_t v14 = v11;
    v12[4] = self;
    id v13 = v8;
    [v6 computeAutoEnhanceWithCompletionHandler:v12];
  }
}

void __87__PEAutoAdjustmentController_ensureCacheUpToDateForValuesCalculator_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v13 = v12;
  double v14 = *(double *)(a1 + 48);
  id v15 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    double v18 = v13 - v14;
    _os_log_impl(&dword_217B65000, v15, OS_LOG_TYPE_DEFAULT, "Finished computing auto enhance. Took %f s", (uint8_t *)&v17, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a3);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  *(double *)(*(void *)(a1 + 32) + 24) = a4;
  *(double *)(*(void *)(a1 + 32) + 32) = a5;
  [*(id *)(a1 + 32) _setBusy:0];
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
}

- (void)calculateStatisticsForCompositionController:(id)a3 valuesCalculator:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PLPhotoEditGetLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  double v13 = v11;
  double v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AutoEnhanceCalculateStatisticsForComposition", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke;
  aBlock[3] = &unk_2642BE268;
  id v21 = v8;
  id v22 = v9;
  v23 = v14;
  id v24 = v10;
  os_signpost_id_t v25 = v12;
  id v15 = v14;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  uint64_t v19 = _Block_copy(aBlock);
  [(PEAutoAdjustmentController *)self ensureCacheUpToDateForValuesCalculator:v17 completionHandler:v19];
}

void __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copy];
  id v3 = [*(id *)(a1 + 32) adjustmentConstants];
  id v4 = [v3 PISmartToneAdjustmentKey];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_2;
  v13[3] = &unk_2642BE630;
  id v14 = *(id *)(a1 + 40);
  [v2 modifyAdjustmentWithKey:v4 modificationBlock:v13];

  double v5 = [v3 PISmartColorAdjustmentKey];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_3;
  v11[3] = &unk_2642BEED0;
  id v12 = *(id *)(a1 + 40);
  [v2 modifyAdjustmentWithKey:v5 modificationBlock:v11];

  [*(id *)(a1 + 32) applyChangesFromCompositionController:v2];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  id v7 = *(id *)(a1 + 48);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AutoEnhanceCalculateStatisticsForComposition", "", v10, 2u);
  }
}

uint64_t __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAdjustmentSmartToneStatistics:a2 withAccuracy:0];
}

void __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 statistics];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) smartColorStatisticsWithAccuracy:0];
    [v5 setStatistics:v4];
  }
}

- (void)_enableAutoEnhanceOnCompositionController:(id)a3 valuesCalculator:(id)a4 useCompositionIntensity:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = PLPhotoEditGetLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  id v15 = v13;
  id v16 = v15;
  unint64_t v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AutoEnhanceEnableOnComposition", "", buf, 2u);
  }

  if ([(PEAutoAdjustmentController *)self isBusy])
  {
    uint64_t v37 = _PFAssertFailHandler();
    __131__PEAutoAdjustmentController__enableAutoEnhanceOnCompositionController_valuesCalculator_useCompositionIntensity_completionHandler___block_invoke(v37);
  }
  else
  {
    double cachedSmartToneLevel = self->_cachedSmartToneLevel;
    if (v7)
    {
      uint64_t v19 = [v10 smartToneAdjustmentController];
      v20 = v19;
      if (v19)
      {
        [v19 inputLight];
        double cachedSmartToneLevel = v21;
      }
    }
    id v22 = (void *)[v10 copy];
    uint64_t v23 = [(PEAutoAdjustmentController *)self imageProperties];
    if (v23)
    {
      id v24 = (void *)v23;
      double v38 = v22;
      os_signpost_id_t v25 = v16;
      id v26 = v12;
      unint64_t v27 = v14 - 1;
      os_signpost_id_t v28 = v14;
      id v29 = v11;
      uint64_t v30 = [(PEAutoAdjustmentController *)self imageProperties];
      BOOL v31 = +[PESupport photoWasTakenWithoutFlashWithImageProperties:v30];

      if (v31) {
        cachedRedEyeCorrections = 0;
      }
      else {
        cachedRedEyeCorrections = self->_cachedRedEyeCorrections;
      }
      id v11 = v29;
      os_signpost_id_t v14 = v28;
      unint64_t v17 = v27;
      id v12 = v26;
      id v16 = v25;
      id v22 = v38;
    }
    else
    {
      cachedRedEyeCorrections = 0;
    }
    id v33 = cachedRedEyeCorrections;
    v34 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v34, OS_LOG_TYPE_DEFAULT, "Computing auto enhance. Using previously cached values.", buf, 2u);
    }

    [(PEAutoAdjustmentController *)self _applyAutoValuesOnCompositionController:v22 whiteBalanceSettings:self->_cachedWhiteBalanceSettings redEyeCorrections:v33 smartToneLevel:v11 smartColorLevel:cachedSmartToneLevel valuesCalculator:self->_cachedSmartColorLevel];
    [v10 applyChangesFromCompositionController:v22];
    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __131__PEAutoAdjustmentController__enableAutoEnhanceOnCompositionController_valuesCalculator_useCompositionIntensity_completionHandler___block_invoke;
      block[3] = &unk_2642BE240;
      double v41 = v12;
      id v40 = v16;
      os_signpost_id_t v42 = v14;
      dispatch_async(MEMORY[0x263EF83A0], block);

      id v35 = v41;
    }
    else
    {
      v36 = v16;
      id v35 = v36;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_217B65000, v35, OS_SIGNPOST_INTERVAL_END, v14, "AutoEnhanceEnableOnComposition", "", buf, 2u);
      }
    }
  }
}

void __131__PEAutoAdjustmentController__enableAutoEnhanceOnCompositionController_valuesCalculator_useCompositionIntensity_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v3, OS_SIGNPOST_INTERVAL_END, v4, "AutoEnhanceEnableOnComposition", "", v5, 2u);
  }
}

- (void)enableAutoEnhanceOnCompositionController:(id)a3 useCompositionIntensity:(BOOL)a4 valuesCalculator:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_cachedValuesAreValid)
  {
    [(PEAutoAdjustmentController *)self _enableAutoEnhanceOnCompositionController:v10 valuesCalculator:v11 useCompositionIntensity:v8 completionHandler:v12];
  }
  else
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __130__PEAutoAdjustmentController_enableAutoEnhanceOnCompositionController_useCompositionIntensity_valuesCalculator_completionHandler___block_invoke;
    v13[3] = &unk_2642BE218;
    objc_copyWeak(&v17, &location);
    id v14 = v10;
    id v15 = v11;
    BOOL v18 = v8;
    id v16 = v12;
    [(PEAutoAdjustmentController *)self ensureCacheUpToDateForValuesCalculator:v15 completionHandler:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __130__PEAutoAdjustmentController_enableAutoEnhanceOnCompositionController_useCompositionIntensity_valuesCalculator_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _enableAutoEnhanceOnCompositionController:*(void *)(a1 + 32) valuesCalculator:*(void *)(a1 + 40) useCompositionIntensity:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
}

- (void)enableAutoEnhanceOnCompositionController:(id)a3 valuesCalculator:(id)a4 completionHandler:(id)a5
{
}

+ (BOOL)isAutoEnhanceEnabledForCompositionController:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 smartToneAdjustmentController];
    int v6 = [v5 isAuto];

    if (v6)
    {
      BOOL v7 = [v4 smartColorAdjustmentController];
      int v8 = [v7 isAuto];
    }
    else
    {
      int v8 = 0;
    }
    id v10 = [v4 whiteBalanceAdjustmentController];
    int v11 = [v10 canHaveAuto] ^ 1;
    LOBYTE(v9) = v11 & v8;
    if ((v11 & 1) == 0 && v8)
    {
      if (v10 && ([v10 isAuto] & 1) == 0) {
        int v9 = [v10 enabled] ^ 1;
      }
      else {
        LOBYTE(v9) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)isAutoEnhanceEnabledForAsset:(id)a3
{
  uint64_t v6 = 0;
  id v3 = +[PEAdjustmentDataCache synchronousCompositionControllerForAsset:a3 networkAccessAllowed:0 disposition:&v6 originalComposition:0];
  BOOL v4 = +[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:v3];

  return v4;
}

@end