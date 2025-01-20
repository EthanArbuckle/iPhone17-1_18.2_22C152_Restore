@interface PEPasteablePreset
+ (BOOL)hasValidAdjustmentsInCompositionController:(id)a3;
+ (void)sanitizeCompositionController:(id)a3;
- (BOOL)_isSmart;
- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3;
- (BOOL)isEligibleForSmartPasteWithPhotoLibrary:(id)a3;
- (BOOL)isEligibleForSmartPasteWithPhotoLibrary:(id)a3 fallbackPayload:(id *)a4;
- (PEAdjustmentPresetAutoDelegate)autoDelegate;
- (PEPasteablePreset)initWithCompositionController:(id)a3 asset:(id)a4 isSmart:(BOOL)a5;
- (id)expAndWBAdjustmentsDebugDescription;
- (id)resourceManager;
- (id)sourceAssetUUID;
- (int64_t)actionType;
- (void)_runAutoCalculatorForCompositionController:(id)a3;
- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 invalidAdjustmentKeys:(id)a6 completion:(id)a7;
- (void)setAutoDelegate:(id)a3;
@end

@implementation PEPasteablePreset

+ (void)sanitizeCompositionController:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v61.receiver = a1;
  v61.super_class = (Class)&OBJC_METACLASS___PEPasteablePreset;
  objc_msgSendSuper2(&v61, sel_sanitizeCompositionController_, v4);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v5 = [v4 adjustmentKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v11 = [v4 adjustmentControllerForKey:v10];
        if ([v11 canBeEnabled] && (objc_msgSend(v11, "enabled") & 1) == 0) {
          [v4 removeAdjustmentWithKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v7);
  }

  v12 = [v4 cinematicAudioAdjustmentController];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 renderingStyle];
    v15 = (void *)*MEMORY[0x263F5D6C8];

    if (v14 == v15) {
      [v4 removeAdjustmentWithKey:*MEMORY[0x263F5D6B8]];
    }
  }
  v50 = v13;
  v16 = [v4 cropAdjustmentController];
  v17 = (uint64_t *)MEMORY[0x263F5D6E0];
  if (v16)
  {
    v18 = [v4 orientationAdjustmentController];
    [v18 orientation];

    [v16 cropRect];
    NUOrientationTransformSize();
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v23 = [v16 constraintWidth];
    if (([v16 constraintHeight] | v23) < 0)
    {
      v48 = [MEMORY[0x263F08690] currentHandler];
      v49 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      [v48 handleFailureInFunction:v49, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
    }
    uint64_t v24 = NUOrientationTransformImageSize();
    uint64_t v25 = *v17;
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __51__PEPasteablePreset_sanitizeCompositionController___block_invoke;
    v56[3] = &__block_descriptor_80_e36_v16__0__PICropAdjustmentController_8l;
    v56[4] = 0;
    v56[5] = 0;
    v56[6] = v20;
    v56[7] = v22;
    v56[8] = v24;
    v56[9] = v26;
    [v4 modifyAdjustmentWithKey:v25 modificationBlock:v56];
  }
  uint64_t v27 = [v4 userOrientation];
  if (v27 == 1 || (uint64_t v28 = v27, !NUOrientationIsValid()))
  {
    uint64_t v29 = *MEMORY[0x263F5D760];
    [v4 removeAdjustmentWithKey:*MEMORY[0x263F5D760]];
  }
  else
  {
    uint64_t v29 = *MEMORY[0x263F5D760];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __51__PEPasteablePreset_sanitizeCompositionController___block_invoke_2;
    v55[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
    v55[4] = v28;
    [v4 modifyAdjustmentWithKey:v29 modificationBlock:v55];
  }
  v30 = [MEMORY[0x263F5D618] adjustmentConstants];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v31 = [MEMORY[0x263F5D618] geometryBasedAdjustmentIdentifiers];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v52;
    uint64_t v35 = *v17;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        if (([v37 isEqualToString:v35] & 1) == 0
          && ([v37 isEqualToString:v29] & 1) == 0)
        {
          [v4 removeAdjustmentWithKey:v37];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v33);
  }

  v38 = [v30 PILivePhotoKeyFrameAdjustmentKey];
  [v4 removeAdjustmentWithKey:v38];

  v39 = [v30 PIAutoLoopAdjustmentKey];
  [v4 removeAdjustmentWithKey:v39];

  v40 = [v30 PIVideoCrossfadeLoopAdjustmentKey];
  [v4 removeAdjustmentWithKey:v40];

  v41 = [v30 PIVideoPosterFrameAdjustmentKey];
  [v4 removeAdjustmentWithKey:v41];

  v42 = [v30 PIMuteAdjustmentKey];
  [v4 removeAdjustmentWithKey:v42];

  v43 = [v30 PITrimAdjustmentKey];
  [v4 removeAdjustmentWithKey:v43];

  v44 = [v30 PIVideoStabilizeAdjustmentKey];
  [v4 removeAdjustmentWithKey:v44];

  v45 = [v30 PINoiseReductionAdjustmentKey];
  [v4 removeAdjustmentWithKey:v45];

  v46 = [v30 PIRawAdjustmentKey];
  [v4 removeAdjustmentWithKey:v46];

  v47 = [v30 PIRawNoiseReductionAdjustmentKey];
  [v4 removeAdjustmentWithKey:v47];
}

void __51__PEPasteablePreset_sanitizeCompositionController___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  id v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  [v7 setConstraintWidth:*((void *)a1 + 8)];
  [v7 setConstraintHeight:*((void *)a1 + 9)];
}

uint64_t __51__PEPasteablePreset_sanitizeCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(void *)(a1 + 32)];
}

+ (BOOL)hasValidAdjustmentsInCompositionController:(id)a3
{
  double v3 = (void *)[a3 copy];
  [(id)objc_opt_class() sanitizeCompositionController:v3];
  if (_os_feature_enabled_impl())
  {
    double v4 = [v3 slomoAdjustmentController];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  double v6 = [v3 semanticStyleAdjustmentController];

  int v7 = [MEMORY[0x263F5D8D0] isIdentityCompositionController:v3];
  if (v6) {
    char v8 = 1;
  }
  else {
    char v8 = v5;
  }
  if (v7) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_autoDelegate);
  objc_storeStrong((id *)&self->_resourceManager, 0);
}

- (void)setAutoDelegate:(id)a3
{
}

- (PEAdjustmentPresetAutoDelegate)autoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoDelegate);
  return (PEAdjustmentPresetAutoDelegate *)WeakRetained;
}

- (id)expAndWBAdjustmentsDebugDescription
{
  v2 = [(PEAdjustmentPreset *)self composition];
  double v3 = (void *)[objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v2];
  double v4 = [v3 smartToneAdjustmentController];
  [v4 offsetExposure];
  uint64_t v6 = v5;

  int v7 = [v3 whiteBalanceAdjustmentController];
  [v7 warmTemp];
  uint64_t v9 = v8;

  uint64_t v10 = [v3 whiteBalanceAdjustmentController];
  [v10 warmTint];
  uint64_t v12 = v11;

  v13 = [NSString stringWithFormat:@"Exp(%.2f), Warmth(%.2f), Tint(%.2f)", v6, v9, v12];

  return v13;
}

- (BOOL)_isSmart
{
  v2 = [(PEAdjustmentPreset *)self serializedDictionary];
  double v3 = [v2 objectForKey:@"PEAdjustmentPresetSmartKey"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_runAutoCalculatorForCompositionController:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v52 = [v3 adjustmentConstants];
  char v4 = [v3 smartToneAdjustmentController];
  if (v4)
  {
    uint64_t v5 = [v3 smartToneAdjustmentController];
    uint64_t v6 = [v5 statistics];

    if (!v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F5D680]);
      uint64_t v8 = [v3 composition];
      uint64_t v9 = (void *)[v7 initWithComposition:v8];

      [v9 setName:@"PEAdjustmentPresetManager-PISmartToneAutoCalculator"];
      id v77 = 0;
      uint64_t v10 = [v9 submitSynchronous:&v77];
      id v11 = v77;
      if (v10)
      {
        uint64_t v12 = [v52 PISmartToneAdjustmentKey];
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        v75[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke;
        v75[3] = &unk_2642BE630;
        v76 = v10;
        [v3 modifyAdjustmentWithKey:v12 modificationBlock:v75];

        v13 = v76;
      }
      else
      {
        v13 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_217B65000, v13, OS_LOG_TYPE_DEFAULT, "PEAdjustmentPresetManager smart tone calculator failed: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  v14 = [v3 smartColorAdjustmentController];
  if (v14)
  {
    v15 = [v3 smartColorAdjustmentController];
    v16 = [v15 statistics];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F5D668]);
      uint64_t v19 = [v3 composition];
      uint64_t v20 = (void *)[v18 initWithComposition:v19];

      [v20 setName:@"PEAdjustmentPresetManager-PISmartColorAutoCalculator"];
      id v74 = 0;
      uint64_t v21 = [v20 submitSynchronous:&v74];
      id v22 = v74;
      if (v21)
      {
        uint64_t v23 = [v52 PISmartColorAdjustmentKey];
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_216;
        v72[3] = &unk_2642BEED0;
        v73 = v21;
        [v3 modifyAdjustmentWithKey:v23 modificationBlock:v72];

        uint64_t v24 = v73;
      }
      else
      {
        uint64_t v24 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_217B65000, v24, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset smart color calculator failed: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  uint64_t v25 = [v3 portraitAdjustmentController];
  if (v25)
  {
  }
  else
  {
    uint64_t v26 = [v3 depthAdjustmentController];
    BOOL v27 = v26 == 0;

    if (v27) {
      goto LABEL_36;
    }
  }
  long long v51 = [v3 portraitAdjustmentController];
  uint64_t v28 = [v52 PIPortraitAdjustmentKey];
  [v3 removeAdjustmentWithKey:v28];

  v50 = [v3 depthAdjustmentController];
  uint64_t v29 = [v52 PIDepthAdjustmentKey];
  [v3 removeAdjustmentWithKey:v29];

  id v30 = objc_alloc(MEMORY[0x263F5D620]);
  v31 = [v3 composition];
  uint64_t v32 = (void *)[v30 initWithComposition:v31];

  [v32 setName:@"PEPasteablePreset-PIPortraitAutoCalculator"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy_;
  v83 = __Block_byref_object_dispose_;
  id v84 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  id v71 = 0;
  uint64_t v33 = dispatch_group_create();
  dispatch_group_enter(v33);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_221;
  v62[3] = &unk_2642BE678;
  p_long long buf = &buf;
  v65 = &v66;
  uint64_t v34 = v33;
  v63 = v34;
  [v32 submit:v62];
  dispatch_group_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v35 = [v51 kind];
    v36 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D778]];
    int v37 = [v36 count] != 0;
    v38 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D770]];
    v39 = v38;
    if (v38 && [v38 BOOLValue]) {
      int v37 = [MEMORY[0x263F5D618] isPortraitStageEffect:v35] ^ 1;
    }
    v40 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D6B0]];
    int v41 = [v40 intValue];
    BOOL v42 = v41 > 1;
    if (v35)
    {
      id v43 = [MEMORY[0x263F5D998] equivalentEffectForIdentifier:v35 version:v41];
      if (v43) {
        int v44 = v37;
      }
      else {
        int v44 = 0;
      }
      if (v44 == 1 && v51)
      {
        v45 = [v52 PIPortraitAdjustmentKey];
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_2;
        v56[3] = &unk_2642BE6A0;
        id v57 = v51;
        id v43 = v43;
        id v58 = v43;
        id v59 = v36;
        long long v60 = &buf;
        BOOL v61 = v42;
        [v3 modifyAdjustmentWithKey:v45 modificationBlock:v56];
      }
    }
    else
    {
      id v43 = 0;
    }
    v47 = [v3 depthAdjustmentController];
    BOOL v48 = v47 == 0;

    if (v48)
    {
      uint64_t v49 = *MEMORY[0x263F5D6F8];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_3;
      v53[3] = &unk_2642BE6C8;
      v55 = &buf;
      id v54 = v50;
      [v3 modifyAdjustmentWithKey:v49 modificationBlock:v53];
    }
  }
  else
  {
    uint64_t v35 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = v67[5];
      *(_DWORD *)v78 = 138412290;
      uint64_t v79 = v46;
      _os_log_impl(&dword_217B65000, v35, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset portrait calculator failed: %@", v78, 0xCu);
    }
  }

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&buf, 8);

LABEL_36:
}

uint64_t __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatistics:*(void *)(a1 + 32)];
}

uint64_t __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_216(uint64_t a1, void *a2)
{
  return [a2 setStatistics:*(void *)(a1 + 32)];
}

void __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 40) filterIdentifier];
  [*(id *)(a1 + 32) setKind:v3];

  [*(id *)(a1 + 32) setPortraitInfo:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D780]];
  [*(id *)(a1 + 32) setSpillMatteAllowed:v4];

  if (!*(unsigned char *)(a1 + 64))
  {
    [v6 defaultStrength];
    objc_msgSend(*(id *)(a1 + 32), "setStrength:");
  }
  uint64_t v5 = [*(id *)(a1 + 32) adjustment];
  [v6 setFromAdjustment:v5];
}

void __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D718]];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D700]];
  [v4 floatValue];
  float v6 = v5;

  [v12 setDepthInfo:v3];
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    [v7 aperture];
  }
  else {
    double v8 = v6;
  }
  [v12 setAperture:v8];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9) {
    uint64_t v10 = [v9 enabled];
  }
  else {
    uint64_t v10 = 1;
  }
  [v12 setEnabled:v10];
  id v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F5D710]];
  [v12 setGlassesMatteAllowed:v11];
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 invalidAdjustmentKeys:(id)a6 completion:(id)a7
{
  uint64_t v214 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v155 = a5;
  id v14 = a6;
  id v151 = a7;
  v15 = [(PEAdjustmentPreset *)self composition];
  v161 = (void *)[objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v15];
  v153 = v15;
  v16 = [v15 contents];
  BOOL v17 = [v16 allKeys];
  id v18 = (void *)[v17 mutableCopy];

  v160 = v12;
  uint64_t v19 = (void *)[v12 copy];
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  id v20 = v14;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v200 objects:v207 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v201;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v201 != v23) {
          objc_enumerationMutation(v20);
        }
        [v18 removeObject:*(void *)(*((void *)&v200 + 1) + 8 * i)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v200 objects:v207 count:16];
    }
    while (v22);
  }

  uint64_t v149 = *MEMORY[0x263F5D6E0];
  objc_msgSend(v18, "removeObject:");
  uint64_t v148 = *MEMORY[0x263F5D850];
  objc_msgSend(v18, "removeObject:");
  uint64_t v156 = *MEMORY[0x263F5D760];
  objc_msgSend(v18, "removeObject:");
  uint64_t v25 = *MEMORY[0x263F5D7C0];
  uint64_t v26 = [v19 adjustmentControllerForKey:*MEMORY[0x263F5D7C0]];
  uint64_t v27 = *MEMORY[0x263F5D728];
  uint64_t v28 = (uint64_t *)MEMORY[0x263F5D720];
  v152 = v20;
  if (!v26)
  {
    uint64_t v30 = *MEMORY[0x263F5D720];
    goto LABEL_14;
  }
  uint64_t v29 = (void *)v26;
  if ([v18 containsObject:v27])
  {

    uint64_t v30 = *v28;
  }
  else
  {
    uint64_t v30 = *v28;
    char v31 = [v18 containsObject:*v28];

    if ((v31 & 1) == 0) {
      goto LABEL_14;
    }
  }
  [v18 removeObject:v30];
  [v18 removeObject:v27];
LABEL_14:
  v206[0] = v27;
  v206[1] = v30;
  v206[2] = *MEMORY[0x263F5D768];
  v206[3] = v25;
  uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v206 count:4];
  uint64_t v195 = MEMORY[0x263EF8330];
  uint64_t v196 = 3221225472;
  v197 = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke;
  v198 = &unk_2642BE5B8;
  id v33 = v18;
  id v199 = v33;
  v158 = PFFind();
  v154 = v13;
  v150 = (void *)v32;
  if (v158)
  {
    uint64_t v190 = MEMORY[0x263EF8330];
    uint64_t v191 = 3221225472;
    v192 = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2;
    v193 = &unk_2642BE5B8;
    id v194 = v19;
    v159 = PFFind();
    objc_msgSend(v194, "removeAdjustmentWithKey:");
  }
  else
  {
    v159 = 0;
  }
  uint64_t v34 = [v160 composition];
  uint64_t v35 = [v34 mediaType];

  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  id v36 = v33;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v186 objects:v205 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v187;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v187 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v186 + 1) + 8 * j);
        v185[5] = MEMORY[0x263EF8330];
        v185[6] = 3221225472;
        v185[7] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3;
        v185[8] = &unk_2642BE5E0;
        v185[9] = self;
        v185[10] = v41;
        v185[11] = v35;
        objc_msgSend(v19, "modifyAdjustmentWithKey:modificationBlock:");
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v186 objects:v205 count:16];
    }
    while (v38);
  }

  BOOL v42 = [v161 orientationAdjustmentController];
  uint64_t v43 = [v42 orientation];

  if (v43 != 1 && NUOrientationIsValid())
  {
    [v19 imageOrientation];
    uint64_t v44 = NUOrientationConcat();
    v185[0] = MEMORY[0x263EF8330];
    v185[1] = 3221225472;
    v185[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4;
    v185[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
    v185[4] = v44;
    [v19 modifyAdjustmentWithKey:v156 modificationBlock:v185];
  }
  v157 = [v161 cropAdjustmentController];
  if (v157)
  {
    id v45 = objc_alloc(MEMORY[0x263F58618]);
    uint64_t v46 = [v19 composition];
    v47 = (void *)[v45 initWithComposition:v46];

    id v184 = 0;
    BOOL v48 = [v47 submitSynchronous:&v184];
    id v49 = v184;
    v50 = [v48 geometry];

    if (v50)
    {
      [v50 extent];
      NUPixelRectToCGRect();
      double v146 = v53;
      double v55 = v54;
      double v56 = v51;
      double v57 = v52;
      if (v51 == 0.0 || v52 == 0.0 || v51 == *MEMORY[0x263F5D550] && v52 == *(double *)(MEMORY[0x263F5D550] + 8))
      {
        double v58 = 1.0;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 134218496;
          double v209 = v56;
          __int16 v210 = 2048;
          double v211 = v57;
          __int16 v212 = 2048;
          uint64_t v213 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_217B65000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      else
      {
        double v58 = fabs(v51 / v52);
      }
      [v157 cropRect];
      double v62 = v60;
      double v63 = v61;
      if (v60 == 0.0 || v61 == 0.0 || v60 == *MEMORY[0x263F5D550] && v61 == *(double *)(MEMORY[0x263F5D550] + 8))
      {
        double v64 = 1.0;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 134218496;
          double v209 = v62;
          __int16 v210 = 2048;
          double v211 = v63;
          __int16 v212 = 2048;
          uint64_t v213 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_217B65000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      else
      {
        double v64 = fabs(v60 / v61);
      }
      if (vabdd_f64(v64, v58) > 0.00000999999975)
      {
        double v65 = v55 + v57 * 0.5;
        PFSizeWithAspectRatioFittingSize();
        CGFloat v67 = v66;
        CGFloat v69 = v68;
        double v70 = v146 + v56 * 0.5 + v66 * -0.5;
        double v71 = v65 + v68 * -0.5;
        [v50 orientation];
        NUOrientationInverse();
        if (NUOrientationIsValid())
        {
          NUPixelSizeFromCGSize();
          NUOrientationTransformRect();
          double v70 = v72;
          double v71 = v73;
          CGFloat v67 = v74;
          CGFloat v69 = v75;
        }
        v76 = [v19 cropAdjustmentController];
        [v76 cropRect];
        CGFloat v78 = v77;
        CGFloat v80 = v79;

        v215.origin.CGFloat x = v70;
        v215.origin.CGFloat y = v71;
        v215.size.CGFloat width = v67;
        v215.size.CGFloat height = v69;
        CGRect v216 = CGRectOffset(v215, v78, v80);
        CGFloat x = v216.origin.x;
        CGFloat y = v216.origin.y;
        CGFloat width = v216.size.width;
        CGFloat height = v216.size.height;
        uint64_t v85 = [v157 constraintWidth];
        if (([v157 constraintHeight] | v85) < 0)
        {
          v147 = [MEMORY[0x263F08690] currentHandler];
          v145 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
          objc_msgSend(v147, "handleFailureInFunction:file:lineNumber:description:", @"(width >= 0) && (height >= 0)");
        }
        uint64_t v86 = NUOrientationTransformImageSize();
        v183[0] = MEMORY[0x263EF8330];
        v183[1] = 3221225472;
        v183[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5;
        v183[3] = &__block_descriptor_80_e36_v16__0__PICropAdjustmentController_8l;
        *(CGFloat *)&v183[4] = x;
        *(CGFloat *)&v183[5] = y;
        *(CGFloat *)&v183[6] = width;
        *(CGFloat *)&v183[7] = height;
        v183[8] = v86;
        v183[9] = v87;
        [v19 modifyAdjustmentWithKey:v149 modificationBlock:v183];
      }
    }
    else
    {
      id v59 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        double v209 = *(double *)&v49;
        _os_log_impl(&dword_217B65000, v59, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset: Failed to paste crop: %@", buf, 0xCu);
      }
    }
  }
  if (_os_feature_enabled_impl())
  {
    v88 = [v161 slomoAdjustmentController];
    [v88 rate];
    float v90 = v89;

    if (v90 > 0.0)
    {
      v91 = +[PEPlaybackRateOption playbackRateOptionsForEditSource:v155];
      v92 = [v91 firstObject];
      [v92 playbackRate];
      float v94 = v93;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      id v95 = v91;
      uint64_t v96 = [v95 countByEnumeratingWithState:&v179 objects:v204 count:16];
      if (v96)
      {
        uint64_t v97 = v96;
        float v98 = vabds_f32(v90, v94);
        uint64_t v99 = *(void *)v180;
        do
        {
          for (uint64_t k = 0; k != v97; ++k)
          {
            if (*(void *)v180 != v99) {
              objc_enumerationMutation(v95);
            }
            v101 = *(void **)(*((void *)&v179 + 1) + 8 * k);
            [v101 playbackRate];
            float v103 = vabds_f32(v102, v90);
            if (v103 < v98)
            {
              id v104 = v101;

              v92 = v104;
              float v98 = v103;
            }
          }
          uint64_t v97 = [v95 countByEnumeratingWithState:&v179 objects:v204 count:16];
        }
        while (v97);
      }

      if (v92)
      {
        int v105 = [v154 mediaSubtypes];
        [v92 playbackRate];
        if (v106 != 1.0 || (v105 & 0x20000) != 0)
        {
          v176[0] = MEMORY[0x263EF8330];
          v176[1] = 3221225472;
          v176[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_194;
          v176[3] = &unk_2642BE608;
          id v177 = v92;
          id v178 = v155;
          [v19 modifyAdjustmentWithKey:v148 modificationBlock:v176];
        }
        else
        {
          [v19 removeAdjustmentWithKey:v148];
        }
      }
    }
  }
  v107 = [v19 smartToneAdjustmentController];
  if (v107)
  {
    id v108 = objc_alloc(MEMORY[0x263F5D560]);
    v109 = (void *)[MEMORY[0x263F5D618] newComposition];
    v110 = (void *)[v108 initWithComposition:v109];

    uint64_t v111 = *MEMORY[0x263F5D868];
    v174[0] = MEMORY[0x263EF8330];
    v174[1] = 3221225472;
    v174[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_197;
    v174[3] = &unk_2642BE630;
    id v112 = v107;
    id v175 = v112;
    [v110 modifyAdjustmentWithKey:v111 modificationBlock:v174];
    v113 = [v110 smartToneAdjustmentController];
    LODWORD(v112) = [v113 isEqualToAdjustmentController:v112];

    if (v112) {
      [v19 removeAdjustmentWithKey:v111];
    }
  }
  v114 = [v19 smartColorAdjustmentController];
  if (v114)
  {
    id v115 = objc_alloc(MEMORY[0x263F5D560]);
    v116 = (void *)[MEMORY[0x263F5D618] newComposition];
    v117 = (void *)[v115 initWithComposition:v116];

    uint64_t v118 = *MEMORY[0x263F5D860];
    v172[0] = MEMORY[0x263EF8330];
    v172[1] = 3221225472;
    v172[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3_199;
    v172[3] = &unk_2642BEED0;
    id v119 = v114;
    id v173 = v119;
    [v117 modifyAdjustmentWithKey:v118 modificationBlock:v172];
    v120 = [v117 smartColorAdjustmentController];
    LODWORD(v119) = [v120 isEqualToAdjustmentController:v119];

    if (v119) {
      [v19 removeAdjustmentWithKey:v118];
    }
  }
  [(PEPasteablePreset *)self _runAutoCalculatorForCompositionController:v19];
  if (v159)
  {
    v121 = [v19 adjustmentControllerForKey:v158];

    if (!v121)
    {
      v122 = [v160 composition];
      v123 = [v122 objectForKeyedSubscript:v159];
      [v19 replaceAdjustment:v123 withKey:v159];
    }
  }
  v124 = [v19 depthAdjustmentController];
  if (v124)
  {
    v125 = [v160 depthAdjustmentController];
    [v125 aperture];
    double v127 = v126;

    [v124 aperture];
    double v129 = v128;
    if (![v124 canAdjustApertureValue])
    {
      if (v129 == v127) {
        goto LABEL_92;
      }
      uint64_t v135 = *MEMORY[0x263F5D6F8];
      v170[0] = MEMORY[0x263EF8330];
      v170[1] = 3221225472;
      v170[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5_203;
      v170[3] = &__block_descriptor_40_e37_v16__0__PIDepthAdjustmentController_8l;
      *(double *)&v170[4] = v127;
      v136 = v170;
      goto LABEL_91;
    }
    [v124 minimumAperture];
    double v131 = v130;
    [v124 maximumAperture];
    double v133 = v132;
    [v124 aperture];
    if (v131 >= v134) {
      double v134 = v131;
    }
    if (v134 >= v133) {
      double v134 = v133;
    }
    if (v129 != v134)
    {
      uint64_t v135 = *MEMORY[0x263F5D6F8];
      v171[0] = MEMORY[0x263EF8330];
      v171[1] = 3221225472;
      v171[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4_201;
      v171[3] = &__block_descriptor_40_e37_v16__0__PIDepthAdjustmentController_8l;
      *(double *)&v171[4] = v134;
      v136 = v171;
LABEL_91:
      [v19 modifyAdjustmentWithKey:v135 modificationBlock:v136];
    }
  }
LABEL_92:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_6;
  aBlock[3] = &unk_2642BF6B0;
  id v137 = v160;
  id v167 = v137;
  id v138 = v19;
  id v168 = v138;
  id v139 = v151;
  id v169 = v139;
  v140 = (void (**)(void))_Block_copy(aBlock);
  if ([(PEAdjustmentPreset *)self isAutoEnhanceEnabled])
  {
    v141 = [(PEPasteablePreset *)self autoDelegate];

    if (v141)
    {
      v142 = [(PEPasteablePreset *)self autoDelegate];
      v164[0] = MEMORY[0x263EF8330];
      v164[1] = 3221225472;
      v164[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_205;
      v164[3] = &unk_2642BF340;
      v165 = v140;
      [v142 applyAutoEnhance:v138 completion:v164];

      v143 = v165;
    }
    else
    {
      BOOL v144 = [(PEAdjustmentPreset *)self autoType] == 1;
      v162[0] = MEMORY[0x263EF8330];
      v162[1] = 3221225472;
      v162[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_207;
      v162[3] = &unk_2642BF340;
      v163 = v140;
      +[PEAutoEnhanceActionHelper applyAutoEnhance:v138 replacesAffectedAdjustments:0 useCompositionIntensity:v144 completion:v162];
      v143 = v163;
    }
  }
  else
  {
    v140[2](v140);
  }
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

BOOL __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) adjustmentControllerForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [*(id *)(a1 + 32) composition];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v4) {
    [v5 pasteAdjustment:v4 forMediaType:*(void *)(a1 + 48)];
  }
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(void *)(a1 + 32)];
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  id v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  [v7 setConstraintWidth:*((void *)a1 + 8)];
  [v7 setConstraintHeight:*((void *)a1 + 9)];
  [v7 setIsAuto:0];
  [v7 setEnabled:1];
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_194(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) playbackRate];
  [v3 setRate:v4];
  if (v3)
  {
    [v3 startTime];
    if ((v18 & 0x100000000) != 0)
    {
      [v3 endTime];
      if (v16) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  double v5 = (void *)MEMORY[0x263EFA470];
  double v6 = [*(id *)(a1 + 40) videoURL];
  id v7 = [v5 assetWithURL:v6];

  double v8 = [MEMORY[0x263F5DFA8] defaultSlowMotionAdjustmentsForAsset:v7];
  uint64_t v9 = v8;
  memset(&v15, 0, sizeof(v15));
  if (v8) {
    [v8 slowMotionTimeRange];
  }
  long long v13 = *(_OWORD *)&v15.start.value;
  CMTimeEpoch epoch = v15.start.epoch;
  [v3 setStartTime:&v13];
  CMTimeRange range = v15;
  CMTimeRangeGetEnd(&v12, &range);
  CMTime v10 = v12;
  [v3 setEndTime:&v10];

LABEL_9:
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_197(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  float v4 = [v3 statistics];
  [v5 setStatistics:v4];

  objc_msgSend(v5, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3_199(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  float v4 = [v3 statistics];
  [v5 setStatistics:v4];

  objc_msgSend(v5, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4_201(uint64_t a1, void *a2)
{
  return [a2 setAperture:*(double *)(a1 + 32)];
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5_203(uint64_t a1, void *a2)
{
  return [a2 setAperture:*(double *)(a1 + 32)];
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) applyChangesFromCompositionController:*(void *)(a1 + 40)];
  if ([MEMORY[0x263F5D8D0] isIdentityCompositionController:*(void *)(a1 + 32)]
    && ([*(id *)(a1 + 32) slomoAdjustmentController],
        v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    id v3 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_217B65000, v3, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset: No edits applied to compositionController", buf, 2u);
    }
  }
  else
  {
    id v3 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_217B65000, v3, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset: Applied edits to compositionController", v5, 2u);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_205(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isEligibleForSmartPasteWithPhotoLibrary:(id)a3 fallbackPayload:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(PEPasteablePreset *)self _isSmart])
  {
    uint64_t v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset isEligibleForSmartPaste=NO: Not a smart preset.", v23, 2u);
    }

    goto LABEL_11;
  }
  if (_os_feature_enabled_impl())
  {
    if ([(PEAdjustmentPreset *)self isAutoEnhanceEnabled])
    {
      id v7 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset isEligibleForSmartPaste=NO: AutoEnhance is applied to the source asset.", v23, 2u);
      }

      if (a4)
      {
        uint64_t v8 = 2;
LABEL_16:
        +[PESCAPReviewPayload legacyPayloadWithReason:v8];
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      goto LABEL_11;
    }
    CMTime v12 = [(PEPasteablePreset *)self sourceAssetUUID];
    long long v13 = [v6 librarySpecificFetchOptions];
    [v13 setFetchLimit:1];
    if (!v12 || [v12 isEqualToString:&stru_26C820838])
    {
      id v14 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_217B65000, v14, OS_LOG_TYPE_ERROR, "PEPasteablePreset isEligibleForSmartPaste=NO: sourceAssetUUID is invalid.", v23, 2u);
      }

      if (a4)
      {
        +[PESCAPReviewPayload legacyPayloadWithReason:3];
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v10 = 0;
      }
      goto LABEL_38;
    }
    CMTimeRange v15 = (void *)MEMORY[0x263F14D18];
    v24[0] = v12;
    char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    uint64_t v17 = [v15 fetchAssetsWithLocalIdentifiers:v16 options:v13];

    uint64_t v18 = [v17 firstObject];
    if (v18)
    {
      if (+[PESmartPasteablePreset isAssetTypeEligibleForSmartPaste:v18])
      {
        BOOL v10 = 1;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      uint64_t v21 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_217B65000, v21, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset isEligibleForSmartPaste=NO: Source asset is a video.", v23, 2u);
      }

      if (a4)
      {
        uint64_t v20 = 4;
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v19 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_217B65000, v19, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset isEligibleForSmartPaste=NO: Couldn't fetch the source asset.", v23, 2u);
      }

      if (a4)
      {
        uint64_t v20 = 3;
LABEL_35:
        +[PESCAPReviewPayload legacyPayloadWithReason:v20];
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
    }
    BOOL v10 = 0;
    goto LABEL_37;
  }
  id v11 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_217B65000, v11, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset isEligibleForSmartPaste=NO: SmartCopyPaste FF is off.", v23, 2u);
  }

  if (a4)
  {
    uint64_t v8 = 1;
    goto LABEL_16;
  }
LABEL_11:
  BOOL v10 = 0;
LABEL_39:

  return v10;
}

- (BOOL)isEligibleForSmartPasteWithPhotoLibrary:(id)a3
{
  return [(PEPasteablePreset *)self isEligibleForSmartPasteWithPhotoLibrary:a3 fallbackPayload:0];
}

- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PEPasteablePreset *)self resourceManager];
  id v6 = [v5 compositionControllerWithoutSource:v4 originalComposition:0 editorBundleID:0];

  id v7 = [(PEAdjustmentPreset *)self composition];
  uint64_t v8 = [v6 composition];
  uint64_t v9 = [v4 pixelWidth];
  if ((double)(unint64_t)([v4 pixelHeight] * v9) / 1000000.0 <= 20.0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_6:
    if (v6)
    {
      id v11 = [v6 inpaintAdjustmentController];

      if (v11)
      {
        BOOL v10 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "PEPasteablePreset isEligibleForAsyncProcessingOnAsset=NO: Destination composition has inpainting.", buf, 2u);
        }
        goto LABEL_29;
      }
    }
    BOOL v10 = [objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v7];
    CMTime v12 = [v10 semanticStyleAdjustmentController];
    if (v12)
    {
    }
    else
    {
      long long v13 = [v6 semanticStyleAdjustmentController];

      if (!v13) {
        goto LABEL_31;
      }
    }
    if (+[PESupport assetCanRenderStyles:v4])
    {
      id v14 = +[PEGlobalSettings globalSettings];
      int v15 = [v14 synchronousStylesCopyPaste];

      if (v15)
      {
        char v16 = PLPhotoEditGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        __int16 v24 = 0;
        uint64_t v17 = "PEPasteablePreset isEligibleForAsyncProcessingOnAsset=NO: Destination composition has a Style.";
        uint64_t v18 = (uint8_t *)&v24;
LABEL_27:
        _os_log_impl(&dword_217B65000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
        goto LABEL_28;
      }
      uint64_t v19 = +[PEGlobalSettings globalSettings];
      if ([v19 synchronousLivePhotoStylesCopyPaste])
      {
        int v20 = [v4 isLivePhoto];

        if (v20)
        {
          char v16 = PLPhotoEditGetLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          __int16 v23 = 0;
          uint64_t v17 = "PEPasteablePreset isEligibleForAsyncProcessingOnAsset=NO: Async Live Photo Styles paste is disabled.";
          uint64_t v18 = (uint8_t *)&v23;
          goto LABEL_27;
        }
      }
      else
      {
      }
    }
LABEL_31:
    BOOL v21 = 1;
    goto LABEL_32;
  }
  BOOL v10 = v4;
  if (![v10 isPhoto]
    || ([v10 mediaSubtypes] & 0x10) == 0
    || (!v7 || ([MEMORY[0x263F5D618] compositionHasAnyStageEffect:v7] & 1) == 0)
    && (!v8 || ![MEMORY[0x263F5D618] compositionHasAnyStageEffect:v8]))
  {

    goto LABEL_6;
  }
  char v16 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v26 = 0;
    uint64_t v17 = "PEPasteablePreset isEligibleForAsyncProcessingOnAsset=NO: Composition has a stage effect that will be rendered"
          " on the 24MP portrait target asset.";
    uint64_t v18 = v26;
    goto LABEL_27;
  }
LABEL_28:

LABEL_29:
  BOOL v21 = 0;
LABEL_32:

  return v21;
}

- (id)sourceAssetUUID
{
  v2 = [(PEAdjustmentPreset *)self serializedDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"PEAdjustmentPresetSourceAssetUUIDKey"];

  return v3;
}

- (int64_t)actionType
{
  return 2;
}

- (id)resourceManager
{
  resourceManager = self->_resourceManager;
  if (!resourceManager)
  {
    id v4 = objc_alloc_init(PEResourceManager);
    id v5 = self->_resourceManager;
    self->_resourceManager = v4;

    resourceManager = self->_resourceManager;
  }
  return resourceManager;
}

- (PEPasteablePreset)initWithCompositionController:(id)a3 asset:(id)a4 isSmart:(BOOL)a5
{
  BOOL v5 = a5;
  v16[1] = *MEMORY[0x263EF8340];
  int v15 = @"PEAdjustmentPresetSmartKey";
  uint64_t v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 numberWithBool:v5];
  v16[0] = v11;
  CMTime v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  long long v13 = [(PEAdjustmentPreset *)self initWithCompositionController:v10 asset:v9 additionalSerializationEntries:v12 includeSidecar:0];

  return v13;
}

@end