@interface PESmartPasteablePreset
+ (BOOL)isAssetTypeEligibleForSmartPaste:(id)a3;
+ (BOOL)isCompositionControllerEligibleForSmartPaste:(id)a3;
- (BOOL)_shouldPerformSmartPasteOnAsset:(id)a3;
- (BOOL)shouldBypassGating;
- (NUComposition)sourceAssetComposition;
- (PESmartPasteablePreset)initWithPasteablePreset:(id)a3;
- (PHAsset)sourceAsset;
- (id)expAndWBAdjustmentsDebugDescription;
- (id)sceneCharacteristicDescription:(unint64_t)a3;
- (int64_t)actionType;
- (unint64_t)_imageClassificationsForAsset:(id)a3;
- (unint64_t)sourceAssetSceneCharacteristics;
- (void)_loadResourcesForSourceAssetWithPhotoLibrary:(id)a3 completion:(id)a4;
- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 completion:(id)a6;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
- (void)setShouldBypassGating:(BOOL)a3;
- (void)setSourceAsset:(id)a3;
- (void)setSourceAssetComposition:(id)a3;
- (void)setSourceAssetSceneCharacteristics:(unint64_t)a3;
- (void)triggerLegacyPasteFallbackOnCompositionController:(id)a3 editSource:(id)a4 asset:(id)a5 reviewPayload:(id)a6 completion:(id)a7;
@end

@implementation PESmartPasteablePreset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAsset, 0);
  objc_storeStrong((id *)&self->_sourceAssetComposition, 0);
  objc_storeStrong((id *)&self->_expAndWBDebugDescription, 0);
}

- (BOOL)shouldBypassGating
{
  return self->_shouldBypassGating;
}

- (void)setSourceAssetSceneCharacteristics:(unint64_t)a3
{
  self->_sourceAssetSceneCharacteristics = a3;
}

- (unint64_t)sourceAssetSceneCharacteristics
{
  return self->_sourceAssetSceneCharacteristics;
}

- (void)setSourceAsset:(id)a3
{
}

- (PHAsset)sourceAsset
{
  return self->_sourceAsset;
}

- (void)setSourceAssetComposition:(id)a3
{
}

- (NUComposition)sourceAssetComposition
{
  return self->_sourceAssetComposition;
}

- (void)setShouldBypassGating:(BOOL)a3
{
  v5 = +[PEGlobalSettings globalSettings];
  int v6 = [v5 smartCopyPasteReviewUIEnabled];

  if (v6) {
    self->_shouldBypassGating = a3;
  }
}

- (id)expAndWBAdjustmentsDebugDescription
{
  return self->_expAndWBDebugDescription;
}

- (BOOL)_shouldPerformSmartPasteOnAsset:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  int v6 = [(PESmartPasteablePreset *)self sourceAsset];
  v7 = [v6 uuid];
  char v8 = [v5 isEqual:v7];

  if (v8) {
    goto LABEL_2;
  }
  if ([(PESmartPasteablePreset *)self shouldBypassGating])
  {
    BOOL v9 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_2:
    BOOL v9 = 0;
  }
  else
  {
    id v10 = v4;
    v11 = +[PEGlobalSettings globalSettings];
    int v12 = [v11 smartCopyPasteGateOnCaptureTime];

    if (v12)
    {
      v13 = [(PESmartPasteablePreset *)self sourceAsset];
      v14 = [v13 creationDate];

      v15 = [v10 creationDate];
      [v14 timeIntervalSinceDate:v15];
      double v17 = fabs(v16);
      BOOL v9 = v17 <= 14400.0;
      if (v17 > 14400.0)
      {
        v18 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_217B65000, v18, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset_shouldPerformSmartPasteOnAsset: capture times are too far apart; not using smart paste",
            v20,
            2u);
        }
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
LABEL_14:

  return v9;
}

- (id)sceneCharacteristicDescription:(unint64_t)a3
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  int v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PESmartPasteablePreset_sceneCharacteristicDescription___block_invoke;
  v7[3] = &unk_2642BE790;
  v7[4] = &v8;
  v7[5] = a3;
  v3 = (void (**)(void *, uint64_t, __CFString *))_Block_copy(v7);
  v3[2](v3, 1, @"Outdoor");
  v3[2](v3, 2, @"Indoor");
  v3[2](v3, 4, @"Daytime");
  v3[2](v3, 8, @"Nighttime");
  id v4 = (__CFString *)v9[5];
  if (!v4) {
    id v4 = @"(none)";
  }
  v5 = v4;

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __57__PESmartPasteablePreset_sceneCharacteristicDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if ((*(void *)(a1 + 40) & a2) != 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    v14 = v6;
    if (v8)
    {
      uint64_t v9 = [v8 stringByAppendingFormat:@" | %@", v6];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      id v12 = v6;
      v11 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v12;
    }

    int v6 = v14;
  }
  return MEMORY[0x270F9A758](v5, v6);
}

- (unint64_t)_imageClassificationsForAsset:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F14D90]);
  id v5 = [v3 photoLibrary];
  int v6 = (void *)[v4 initWithPhotoLibrary:v5];

  [v3 fetchPropertySetsIfNeeded];
  uint64_t v7 = [v3 sceneAnalysisProperties];
  v27 = v3;
  uint64_t v8 = [v3 sceneClassifications];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v28 = 0;
    uint64_t v11 = *(void *)v31;
    uint64_t v12 = *MEMORY[0x263F15048];
    uint64_t v29 = *MEMORY[0x263F15040];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v14 extendedSceneIdentifier] == v12 || objc_msgSend(v14, "extendedSceneIdentifier") == v29)
        {
          v15 = objc_msgSend(v6, "_sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:", objc_msgSend(v14, "extendedSceneIdentifier"), objc_msgSend(v7, "sceneAnalysisVersion"));
          double v16 = v15;
          if (v15)
          {
            [v15 doubleValue];
            double v18 = v17;
            [v14 confidence];
            if (v18 < v19)
            {
              v20 = v7;
              v21 = v6;
              v22 = v8;
              unint64_t v23 = v28 | ([v14 extendedSceneIdentifier] == v12);
              uint64_t v24 = [v14 extendedSceneIdentifier];
              uint64_t v25 = v23 | 2;
              if (v24 != v29) {
                uint64_t v25 = v23;
              }
              unint64_t v28 = v25;
              uint64_t v8 = v22;
              int v6 = v21;
              uint64_t v7 = v20;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v28 = 0;
  }

  return v28;
}

- (void)triggerLegacyPasteFallbackOnCompositionController:(id)a3 editSource:(id)a4 asset:(id)a5 reviewPayload:(id)a6 completion:(id)a7
{
  v31[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  double v17 = [PEPasteablePreset alloc];
  double v18 = [(PEAdjustmentPreset *)self serializedDictionary];
  double v19 = [(PEAdjustmentPreset *)v17 initWithPropertyListDictionary:v18];

  v20 = [(PEEditAction *)self analyticsEventBuilderDelegate];
  [(PEEditAction *)v19 setAnalyticsEventBuilderDelegate:v20];

  [(PEAdjustmentPreset *)v19 applyToCompositionController:v16 asset:v12 editSource:v15 completion:v14];
  v21 = [(PEEditAction *)self analyticsEventBuilderDelegate];

  if (v21)
  {
    v22 = [(PEEditAction *)self analyticsEventBuilderDelegate];
    uint64_t v23 = [(PEPasteablePreset *)v19 actionType];
    if ((unint64_t)(v23 - 1) > 7) {
      uint64_t v24 = @"Unknown";
    }
    else {
      uint64_t v24 = off_2642BEB88[v23 - 1];
    }
    uint64_t v25 = v24;
    v31[0] = v12;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    [v22 updateAnalyticsEventBuilderActionType:v25 forAssets:v26];
  }
  v27 = +[PEGlobalSettings globalSettings];
  int v28 = [v27 smartCopyPasteReviewUIEnabled];

  if (v13 && v28)
  {
    uint64_t v29 = +[PESCAPReviewManager sharedReviewManager];
    long long v30 = [(PEPasteablePreset *)v19 expAndWBAdjustmentsDebugDescription];
    [v13 setAdjustmentsDescription:v30];

    [v29 registerPayload:v13 forAsset:v12];
  }
}

- (void)_loadResourcesForSourceAssetWithPhotoLibrary:(id)a3 completion:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [(PESmartPasteablePreset *)self sourceAsset];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(PESmartPasteablePreset *)self sourceAssetComposition],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    uint64_t v11 = [v6 librarySpecificFetchOptions];
    [v11 setFetchLimit:1];
    uint64_t v12 = *MEMORY[0x263F15030];
    v30[0] = *MEMORY[0x263F15028];
    v30[1] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    [v11 setFetchPropertySets:v13];

    id v14 = [(PEPasteablePreset *)self sourceAssetUUID];
    id v15 = v14;
    if (v14 && ![v14 isEqualToString:&stru_26C820838])
    {
      double v19 = (void *)MEMORY[0x263F14D18];
      v27 = v15;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
      double v18 = [v19 fetchAssetsWithLocalIdentifiers:v20 options:v11];

      v21 = [v18 firstObject];
      if (v21)
      {
        [(PESmartPasteablePreset *)self setSourceAsset:v21];
        [(PESmartPasteablePreset *)self setSourceAssetSceneCharacteristics:[(PESmartPasteablePreset *)self _imageClassificationsForAsset:v21]];
        v22 = [(PEPasteablePreset *)self resourceManager];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_2;
        v23[3] = &unk_2642BE768;
        id v24 = v21;
        uint64_t v25 = self;
        v26 = v7;
        [v22 loadResourceForAsset:v24 requireLocalResources:1 forceRunAsUnadjustedAsset:0 progressHandler:&__block_literal_global_589 resultHandler:v23];
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      uint64_t v29 = @"PEEditAction _loadResourcesForSourceAssetWithPhotoLibrary: no valid source asset UUID";
      double v17 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      double v18 = [v16 errorWithDomain:@"PEEditActionErrorDomain" code:0 userInfo:v17];

      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v18);
    }
  }
}

void __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 compositionController];
  if (v7)
  {
    uint64_t v8 = [PEPasteablePreset alloc];
    uint64_t v9 = [a1[5] serializedDictionary];
    uint64_t v10 = [(PEAdjustmentPreset *)v8 initWithPropertyListDictionary:v9];

    id v11 = a1[4];
    uint64_t v12 = [v5 editSource];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_268;
    v15[3] = &unk_2642BE740;
    v15[4] = a1[5];
    id v16 = v7;
    id v17 = a1[6];
    [(PEAdjustmentPreset *)v10 applyToCompositionController:v16 asset:v11 editSource:v12 completion:v15];
  }
  else
  {
    id v13 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [a1[4] uuid];
      *(_DWORD *)buf = 138543618;
      double v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_217B65000, v13, OS_LOG_TYPE_ERROR, "PEEditActionBatch failed to fetch resources for asset: %{public}@ error:%@", buf, 0x16u);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_268(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) composition];
  [*(id *)(a1 + 32) setSourceAssetComposition:v2];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (int64_t)actionType
{
  return 3;
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 completion:(id)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(id)objc_opt_class() isAssetTypeEligibleForSmartPaste:v11])
  {
    id v14 = v11;
    id v15 = [(PESmartPasteablePreset *)self sourceAssetComposition];

    if (!v15)
    {
      id v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v74 = 0x3032000000;
      v75 = __Block_byref_object_copy_;
      v76 = __Block_byref_object_dispose_;
      id v77 = 0;
      id v17 = [v14 photoLibrary];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke;
      v66[3] = &unk_2642BE6F0;
      p_long long buf = &buf;
      double v18 = v16;
      v67 = v18;
      [(PESmartPasteablePreset *)self _loadResourcesForSourceAssetWithPhotoLibrary:v17 completion:v66];

      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      double v19 = [(PESmartPasteablePreset *)self sourceAssetComposition];
      LODWORD(v17) = v19 == 0;

      if (v17)
      {
        v37 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = [*(id *)(*((void *)&buf + 1) + 40) localizedDescription];
          *(_DWORD *)v69 = 138412546;
          id v70 = v14;
          __int16 v71 = 2112;
          v72 = v38;
          _os_log_impl(&dword_217B65000, v37, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: couldn't load source asset (%@) resources for smart paste (error: %@). Falling back on legacy paste", v69, 0x16u);
        }
        v39 = +[PESCAPReviewPayload legacyPayloadWithReason:3];
        [(PESmartPasteablePreset *)self triggerLegacyPasteFallbackOnCompositionController:v10 editSource:v12 asset:v14 reviewPayload:v39 completion:v13];

        _Block_object_dispose(&buf, 8);
        goto LABEL_35;
      }

      _Block_object_dispose(&buf, 8);
    }
    if ([(id)objc_opt_class() isAssetTypeEligibleForSmartPaste:v14]
      && [(PESmartPasteablePreset *)self _shouldPerformSmartPasteOnAsset:v14])
    {
      id v20 = objc_alloc(MEMORY[0x263F5D670]);
      id v21 = [(PESmartPasteablePreset *)self sourceAssetComposition];
      uint64_t v22 = [v10 composition];
      double v18 = [v20 initWithSourceComposition:v21 targetComposition:v22];

      uint64_t v23 = +[PEGlobalSettings globalSettings];
      [v23 smartCopyPasteSimilarityGatingThreshold];
      double v25 = v24;

      if (![(PESmartPasteablePreset *)self shouldBypassGating]) {
        [v18 setSimilarityGatingThreshold:v25];
      }
      v26 = +[PEGlobalSettings globalSettings];
      int v27 = [v26 fetchAndSendScenePrintsForSliderNet];

      if (v27)
      {
        uint64_t v28 = [(PESmartPasteablePreset *)self sourceAsset];
        BOOL v29 = v28 == 0;

        if (!v29)
        {
          v53 = (void *)MEMORY[0x263F08928];
          id VNSceneprintClass = getVNSceneprintClass();
          long long v30 = [(PESmartPasteablePreset *)self sourceAsset];
          long long v31 = [v30 sceneprintProperties];
          long long v32 = [v31 sceneprint];
          id v65 = 0;
          v52 = [v53 unarchivedObjectOfClass:VNSceneprintClass fromData:v32 error:&v65];
          id v54 = v65;

          if (v54)
          {
            long long v33 = PLPhotoEditGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = [v54 localizedDescription];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v34;
              _os_log_impl(&dword_217B65000, v33, OS_LOG_TYPE_ERROR, "PESmartPasteablePreset-applyToLoadResult: Failed to get scene print data from the source asset: (%@)", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            long long v33 = [v52 descriptorData];
            [v18 setSourceAssetScenePrint:v33];
          }
        }
        [v14 fetchPropertySetsIfNeeded];
        v55 = (void *)MEMORY[0x263F08928];
        id v40 = getVNSceneprintClass();
        v41 = [v14 sceneprintProperties];
        v42 = [v41 sceneprint];
        id v64 = 0;
        v56 = [v55 unarchivedObjectOfClass:v40 fromData:v42 error:&v64];
        id v43 = v64;

        if (v43)
        {
          v44 = PLPhotoEditGetLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = [v43 localizedDescription];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v45;
            _os_log_impl(&dword_217B65000, v44, OS_LOG_TYPE_ERROR, "PESmartPasteablePreset-applyToLoadResult: Failed to get scene print data from the target asset: (%@)", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v44 = [v56 descriptorData];
          [v18 setTargetAssetScenePrint:v44];
        }
      }
      v46 = dispatch_group_create();
      dispatch_group_enter(v46);
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke_259;
      v57[3] = &unk_2642BE718;
      double v63 = v25;
      v57[4] = self;
      v47 = v46;
      v58 = v47;
      id v59 = v10;
      id v60 = v12;
      id v61 = v14;
      id v62 = v13;
      [v18 submit:v57];
      dispatch_time_t v48 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(v47, v48))
      {
        v49 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_217B65000, v49, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToCompositionController: PISmartCopyPasteAutoCalculator timed out (>1sec)", (uint8_t *)&buf, 2u);
        }

        v50 = [v18 renderContext];
        [v50 cancelAllRequests];
      }
    }
    else
    {
      v36 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_217B65000, v36, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: asset (%@) isn't eligible for smart paste. Falling back on legacy paste", (uint8_t *)&buf, 0xCu);
      }

      double v18 = +[PESCAPReviewPayload legacyPayloadWithReason:5];
      [(PESmartPasteablePreset *)self triggerLegacyPasteFallbackOnCompositionController:v10 editSource:v12 asset:v14 reviewPayload:v18 completion:v13];
    }
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v35 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_217B65000, v35, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: asset (%@) isn't eligible for smart paste. Falling back on legacy paste", (uint8_t *)&buf, 0xCu);
  }

  id v14 = +[PESCAPReviewPayload legacyPayloadWithReason:4];
  [(PESmartPasteablePreset *)self triggerLegacyPasteFallbackOnCompositionController:v10 editSource:v12 asset:v11 reviewPayload:v14 completion:v13];
LABEL_36:
}

void __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v50 = 0;
  id v3 = [a2 result:&v50];
  id v4 = v50;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F5D898]];
  }
  else
  {
    id v5 = 0;
  }
  objc_opt_class();
  double v6 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v5 floatValue];
    double v6 = v7;
  }
  if (v6 <= *(double *)(a1 + 80)) {
    int v8 = [*(id *)(a1 + 32) shouldBypassGating] ^ 1;
  }
  else {
    int v8 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  if (v3 && !v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F5D560]);
    id v10 = [*(id *)(a1 + 32) composition];
    id v11 = (PESCAPReviewPayload *)[v9 initWithComposition:v10];

    unint64_t v12 = 0x2642BD000uLL;
    id v13 = +[PEGlobalSettings globalSettings];
    int v14 = [v13 affectManuallyEditedSlidersOnly];

    if (v14)
    {
      id v43 = v5;
      id v44 = v4;
      id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v16 = objc_alloc(MEMORY[0x263F5D560]);
      id v17 = [*(id *)(a1 + 32) sourceAssetComposition];
      uint64_t v18 = [v16 initWithComposition:v17];

      v42 = (void *)v18;
      double v19 = [MEMORY[0x263F5D670] adjustmentsToModifyBasedOnSourceCompositionController:v18];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v47 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            double v25 = [v3 objectForKeyedSubscript:v24];
            [v15 setObject:v25 forKeyedSubscript:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v21);
      }

      id v5 = v43;
      id v4 = v44;
      unint64_t v12 = 0x2642BD000;
    }
    else
    {
      id v15 = v3;
    }
    [MEMORY[0x263F5D670] applyAdjustmentDictionary:v15 toCompositionController:v11];
    BOOL v29 = [(PESCAPReviewPayload *)v11 composition];
    [*(id *)(a1 + 32) setComposition:v29];

    long long v30 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      long long v31 = [v15 debugDescription];
      *(_DWORD *)long long buf = 134218242;
      double v53 = v6;
      __int16 v54 = 2114;
      v55 = v31;
      _os_log_impl(&dword_217B65000, v30, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToCompositionController: similarity %f; applying smart paste to composition, with sl"
        "ider net values: %{public}@",
        buf,
        0x16u);
    }
    long long v32 = [MEMORY[0x263F5D670] descriptionForAdjustmentDictionary:v15];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v32);
    long long v33 = [*(id *)(v12 + 2264) globalSettings];
    if ([(PESCAPReviewPayload *)v33 smartCopyPasteReviewUIEnabled])
    {
      char v34 = [*(id *)(a1 + 32) shouldBypassGating];

      if (v34)
      {
LABEL_30:
        uint64_t v36 = *(void *)(a1 + 48);
        uint64_t v37 = *(void *)(a1 + 56);
        uint64_t v38 = *(void *)(a1 + 64);
        uint64_t v39 = *(void *)(a1 + 72);
        v45.receiver = *(id *)(a1 + 32);
        v45.super_class = (Class)PESmartPasteablePreset;
        objc_msgSendSuper2(&v45, sel_applyToCompositionController_asset_editSource_completion_, v36, v38, v37, v39);

        id v3 = v15;
        goto LABEL_37;
      }
      long long v33 = [[PESCAPReviewPayload alloc] initWithActionType:1 reason:0 score:v32 adjustmentsDescription:v6];
      uint64_t v35 = +[PESCAPReviewManager sharedReviewManager];
      [v35 registerPayload:v33 forAsset:*(void *)(a1 + 64)];
    }
    goto LABEL_30;
  }
  v26 = PLPhotoEditGetLog();
  int v27 = v26;
  if (v3)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = *(void **)(a1 + 80);
      *(_DWORD *)long long buf = 134218240;
      double v53 = v6;
      __int16 v54 = 2048;
      v55 = v28;
      _os_log_impl(&dword_217B65000, v27, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: Source was not similar enough to destination. Similarity: %f / Threshold: %f. Falling back on legacy paste", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v40 = [v4 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    double v53 = *(double *)&v40;
    _os_log_impl(&dword_217B65000, v27, OS_LOG_TYPE_ERROR, "PESmartPasteablePreset-applyToLoadResult: Failed to get slider net adjustment dict with error: %@. Falling back on legacy paste", buf, 0xCu);
  }
  if ([v4 code] == 10)
  {
    v41 = +[PESCAPReviewPayload legacyPayloadWithReason:7];
  }
  else
  {
    v41 = [[PESCAPReviewPayload alloc] initWithActionType:0 reason:6 score:0 adjustmentsDescription:v6];
  }
  id v11 = v41;
  [*(id *)(a1 + 32) triggerLegacyPasteFallbackOnCompositionController:*(void *)(a1 + 48) editSource:*(void *)(a1 + 56) asset:*(void *)(a1 + 64) reviewPayload:v41 completion:*(void *)(a1 + 72)];
LABEL_37:
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 compositionController];
  int v8 = [v7 asset];
  id v9 = [v7 editSource];

  [(PESmartPasteablePreset *)self applyToCompositionController:v10 asset:v8 editSource:v9 completion:v6];
}

- (PESmartPasteablePreset)initWithPasteablePreset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serializedDictionary];
  v9.receiver = self;
  v9.super_class = (Class)PESmartPasteablePreset;
  id v6 = [(PEAdjustmentPreset *)&v9 initWithPropertyListDictionary:v5];

  if (v6)
  {
    id v7 = [v4 analyticsEventBuilderDelegate];
    [(PEEditAction *)v6 setAnalyticsEventBuilderDelegate:v7];

    [(PESmartPasteablePreset *)v6 setShouldBypassGating:0];
  }

  return v6;
}

+ (BOOL)isCompositionControllerEligibleForSmartPaste:(id)a3
{
  id v3 = a3;
  if (+[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:v3])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [v3 smartToneAdjustmentController];
    if ([v5 enabled])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [v3 smartColorAdjustmentController];
      if ([v6 enabled])
      {
        char v4 = 1;
      }
      else
      {
        id v7 = [v3 whiteBalanceAdjustmentController];
        char v4 = [v7 enabled];
      }
    }
  }
  return v4;
}

+ (BOOL)isAssetTypeEligibleForSmartPaste:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 isVideo] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

@end