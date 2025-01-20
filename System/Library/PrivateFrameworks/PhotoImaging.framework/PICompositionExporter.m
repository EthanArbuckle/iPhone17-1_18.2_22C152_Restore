@interface PICompositionExporter
+ (BOOL)_lowMemoryModeSupportedForComposition:(id)a3 pixelSize:(id)a4;
+ (id)metadataConverter;
+ (id)resetImageProperties:(id)a3 preserveRegions:(BOOL)a4;
+ (void)setMetadataConverter:(id)a3;
- (PICompositionExporter)init;
- (id)addImageProperties:(id)a3 composition:(id)a4 options:(id)a5 error:(id *)a6;
- (id)addVideoProperties:(id)a3 composition:(id)a4 options:(id)a5 error:(id *)a6;
- (id)archiveURLForSidecarData:(id)a3;
- (id)exportComposition:(id)a3 options:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (id)exportVideoToURL:(id)a3 composition:(id)a4 options:(id)a5 completion:(id)a6;
- (id)saveSidecarData:(id)a3 error:(id *)a4;
- (id)variationForFlavor:(id)a3;
- (void)_exportVideoToURL:(id)a3 composition:(id)a4 options:(id)a5 properties:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)exportImageToDataWithComposition:(id)a3 options:(id)a4 completion:(id)a5;
- (void)exportImageToURL:(id)a3 composition:(id)a4 options:(id)a5 completion:(id)a6;
- (void)prepareAuxiliaryImagesFetchProperties:(id)a3 options:(id)a4 completion:(id)a5;
- (void)prepareImageExportRequest:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation PICompositionExporter

- (void).cxx_destruct
{
}

- (void)_exportVideoToURL:(id)a3 composition:(id)a4 options:(id)a5 properties:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v17 = (objc_class *)MEMORY[0x1E4F7A6F0];
  id v18 = a6;
  id v19 = a3;
  v20 = (void *)[[v17 alloc] initWithComposition:v13 destinationURL:v19];

  [v20 setName:@"PICompositionExporter-video"];
  v21 = [v14 priority];
  [v20 setPriority:v21];

  v22 = [v14 scalePolicy];
  [v20 setScalePolicy:v22];

  objc_msgSend(v20, "setRequireHardwareEncoder:", objc_msgSend(v14, "requireHardwareEncoder"));
  v23 = [v18 metadata];

  [v20 setMetadata:v23];
  objc_msgSend(v20, "setIncludeCinematicVideoTracks:", objc_msgSend(v14, "includeCinematicVideoTracks"));
  objc_msgSend(v20, "setComputeDigest:", objc_msgSend(v14, "computeDigest"));
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![v14 applyVideoOrientationAsMetadata])
  {
    uint64_t v29 = 0;
    goto LABEL_25;
  }
  v25 = [[PICompositionController alloc] initWithComposition:v13];
  v26 = [(PICompositionController *)v25 autoLoopAdjustmentController];
  if ([v26 enabled])
  {
    v27 = [v26 flavor];
    int v28 = [v27 isEqualToString:@"Mirror"];
  }
  else
  {
    int v28 = 0;
  }
  id v42 = v15;
  if ([v26 enabled])
  {
    v30 = [v26 flavor];
    int v31 = [v30 isEqualToString:@"AutoLoop"];
  }
  else
  {
    int v31 = 0;
  }
  v32 = [(PICompositionController *)v25 orientationAdjustmentController];
  v33 = v32;
  if (v32) {
    [v32 orientation];
  }
  if ((v28 | v31) == 1)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    v34 = *MEMORY[0x1E4F7A758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v35 = "Skipping applyVideoOrientationAsMetadata. Bounces and Autoloops are not supported. Falling back to burned-in orientation.";
    goto LABEL_21;
  }
  if (!NUOrientationHasFlip())
  {
    uint64_t v29 = 1;
    goto LABEL_24;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  v34 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v35 = "Skipping applyVideoOrientationAsMetadata. Flipped orientations are not supported. Falling back to burned-in orientation.";
LABEL_21:
    _os_log_impl(&dword_1A9680000, v34, OS_LOG_TYPE_INFO, v35, buf, 2u);
  }
LABEL_22:
  uint64_t v29 = 0;
LABEL_24:

  id v15 = v43;
LABEL_25:
  [v20 setApplyOrientationAsMetadata:v29];
  [v20 setPipelineFilters:v24];
  objc_msgSend(v20, "setBypassOutputSettingsIfNoComposition:", objc_msgSend(v14, "bypassOutputSettingsIfNoComposition"));
  v36 = [v20 outputSettings];
  v37 = (void *)[v36 mutableCopy];

  v38 = [v14 videoCodecType];
  if (v38) {
    [v37 setObject:v38 forKey:*MEMORY[0x1E4F16220]];
  }
  [v20 setOutputSettings:v37];
  if ([v14 preserveSourceColorSpace])
  {
    [v20 setColorSpace:0];
  }
  else
  {
    v39 = [v14 colorSpace];

    if (v39)
    {
      v40 = [v14 colorSpace];
      [v20 setColorSpace:v40];
    }
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __94__PICompositionExporter__exportVideoToURL_composition_options_properties_progress_completion___block_invoke;
  v44[3] = &unk_1E5D81670;
  id v45 = v16;
  id v41 = v16;
  [v20 submitWithProgress:v15 completion:v44];
}

void __94__PICompositionExporter__exportVideoToURL_composition_options_properties_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v3 = [a2 result:&v13];
  id v4 = v13;
  if (v3)
  {
    v5 = objc_alloc_init(PICompositionExportResult);
    v6 = [v3 geometry];
    [(PICompositionExportResult *)v5 setGeometry:v6];

    v7 = [v3 digest];
    [(PICompositionExportResult *)v5 setDigest:v7];

    v8 = [v3 destinationURL];
    [(PICompositionExportResult *)v5 setExportedFileURL:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    v11 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Failed to export video: %@", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    v5 = (PICompositionExportResult *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, PICompositionExportResult *))(v12 + 16))(v12, v5);
  }
}

- (id)addVideoProperties:(id)a3 composition:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    int v28 = NUAssertLogger_7245();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v32 = NUAssertLogger_7245();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        __int16 v44 = 2114;
        id v45 = v40;
        _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v13 = v12;
  id v14 = [[PICompositionController alloc] initWithComposition:v11];
  id v15 = [(PICompositionController *)v14 autoLoopAdjustmentController];
  id v41 = v10;
  if ([v15 enabled])
  {
    uint64_t v16 = [v15 recipe];
    v17 = (void *)[v10 mutableCopy];
    if (v16)
    {
      +[PIMakerNoteUtilities removeAssetIdentifierFromMetadataArray:v17];

      char v18 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v17 = (void *)[v10 mutableCopy];
  }
  char v18 = 1;
LABEL_7:
  id v19 = [v13 pairingIdentifier];

  if (v19)
  {
    v20 = [v13 pairingIdentifier];
    +[PIMakerNoteUtilities addAssetIdentifier:v20 toMetadataArray:v17];
  }
  if (v18) {
    goto LABEL_13;
  }
  v21 = [v15 flavor];
  v22 = [(PICompositionExporter *)self variationForFlavor:v21];

  if (v22)
  {
    v23 = [(id)objc_opt_class() metadataConverter];
    id v24 = [v23 videoMetadataForVariation:v22 error:a6];

    if (v24)
    {
      [v17 addObjectsFromArray:v24];

LABEL_13:
      id v24 = (void *)[v17 copy];
      goto LABEL_16;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1E4F7A438];
    v26 = [v15 flavor];
    *a6 = [v25 invalidError:@"Unknown autoloop flavor" object:v26];

    id v24 = 0;
  }
LABEL_16:

  return v24;
}

- (id)addImageProperties:(id)a3 composition:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [[PICompositionController alloc] initWithComposition:v10];
  id v13 = (void *)[v9 mutableCopy];
  id v14 = [v11 pairingIdentifier];

  if (v14)
  {
    id v15 = [v11 pairingIdentifier];
    +[PIMakerNoteUtilities addAssetIdentifier:v15 toMetadataDictionary:v13];
  }
  uint64_t v16 = [(PICompositionController *)v12 autoLoopAdjustmentController];
  if ([v16 enabled])
  {
    v17 = [v16 flavor];
    int v18 = [v17 isEqualToString:@"LongExposure"];

    if (v18)
    {
      id v19 = [(id)objc_opt_class() metadataConverter];
      v20 = [(PICompositionExporter *)self variationForFlavor:@"LongExposure"];
      int v21 = [v19 setImageVariation:v20 properties:v13 error:a6];

      if (!v21)
      {
        v26 = 0;
        goto LABEL_54;
      }
    }
  }
  v22 = [(id)objc_opt_class() metadataConverter];
  v23 = [v22 photoProcessingFlagsFromProperties:v9 error:a6];

  if (v23)
  {
    id v24 = [(PICompositionController *)v12 depthAdjustmentController];
    if ([v23 integerValue]) {
      char v25 = 1;
    }
    else {
      char v25 = [v24 enabled];
    }
    v68 = [(PICompositionController *)v12 semanticEnhanceAdjustmentController];
    int v27 = [v68 enabled];
    v65 = v10;
    id v66 = v11;
    v67 = v24;
    if ((v25 & 1) == 0 && !v27) {
      goto LABEL_36;
    }
    uint64_t v28 = [v23 integerValue];
    if ([v24 enabled]) {
      uint64_t v29 = v28 | 0x40;
    }
    else {
      uint64_t v29 = v28 & 0xFFFFFFBF;
    }
    v30 = [(PICompositionController *)v12 livePhotoKeyFrameAdjustmentController];
    int v31 = v30;
    if (v30 && ([v30 keyFrameTime], (v70 & 1) != 0))
    {
      BOOL v33 = (v29 & 2) == 0;
    }
    else
    {
      int v32 = [v16 enabled];
      BOOL v33 = (v29 & 2) == 0;
      if (!v32)
      {
        int v63 = 0;
        uint64_t v34 = v29;
        goto LABEL_23;
      }
    }
    uint64_t v34 = v29 & 0xFFFFFFFD;
    int v63 = 1;
LABEL_23:
    if (!v33) {
      uint64_t v29 = v34;
    }
    int v35 = [v68 enabled];
    uint64_t v36 = 0x8000;
    if (!v35) {
      uint64_t v36 = 0;
    }
    unint64_t v37 = v29 & 0xFFFFFFFFFFFF7FFFLL | v36;
    id v38 = [(id)objc_opt_class() metadataConverter];
    v39 = [NSNumber numberWithInteger:v37];
    int v40 = [v38 setPhotoProcessingFlags:v39 properties:v13 error:a6];

    if (!v40)
    {
      v26 = 0;
      id v10 = v65;
      id v11 = v66;
      goto LABEL_52;
    }
    uint64_t v41 = *MEMORY[0x1E4F2F800];
    v61 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
    id v42 = (void *)[v61 mutableCopy];
    [v13 setObject:v42 forKeyedSubscript:v41];
    int v43 = [v67 enabled];
    uint64_t v44 = *MEMORY[0x1E4F2F7E0];
    if (v43)
    {
      [v42 setObject:&unk_1F00099E0 forKeyedSubscript:*MEMORY[0x1E4F2F7E0]];
      id v10 = v65;
      id v11 = v66;
LABEL_35:

LABEL_36:
      uint64_t v46 = [(id)objc_opt_class() metadataConverter];
      int v31 = [v46 photoFeatureFlags:v9 error:a6];

      if (v31)
      {
        v64 = [(PICompositionController *)v12 portraitAdjustmentController];
        if ([v31 intValue]
          && (([v64 enabled] & 1) != 0 || objc_msgSend(v67, "enabled")))
        {
          uint64_t v47 = [v31 unsignedIntegerValue] & 0xFFFFFFFELL;
          v48 = [(id)objc_opt_class() metadataConverter];
          v49 = [NSNumber numberWithUnsignedInteger:v47];
          int v50 = [v48 setPhotoFeatureFlags:v49 properties:v13 error:a6];

          id v11 = v66;
          if (!v50)
          {
            v26 = 0;
            id v10 = v65;
            goto LABEL_51;
          }
        }
        if ([v11 optimizeForSharing]) {
          [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F450]];
        }
        id v10 = v65;
        v51 = [v65 objectForKeyedSubscript:@"semanticStyle"];
        v62 = v51;
        if (v51)
        {
          v52 = [v51 settings];
          v53 = PISemanticStyleMakerNotePropertiesFromSettings(v52);

          v54 = [(id)objc_opt_class() metadataConverter];
          [v54 addSemanticStyleMakeNoteProperties:v53 toImageProperties:v13];
        }
        else
        {
          v53 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
          uint64_t v55 = *MEMORY[0x1E4F155D0];
          v56 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F155D0]];

          if (!v56)
          {
LABEL_49:

            v26 = (void *)[v13 copy];
            id v11 = v66;
LABEL_51:

            goto LABEL_52;
          }
          v57 = [v53 objectForKeyedSubscript:v55];
          v54 = (void *)[v57 mutableCopy];

          [v54 setObject:&unk_1F0009A10 forKey:*MEMORY[0x1E4F155F0]];
          v58 = [(id)objc_opt_class() metadataConverter];
          [v58 addSemanticStyleMakeNoteProperties:v54 toImageProperties:v13];
        }
        goto LABEL_49;
      }
      v26 = 0;
LABEL_52:

      goto LABEL_53;
    }
    v60 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F2F7E0]];
    int v45 = (__int16)[v60 intValue];
    if ((v45 - 2) >= 3)
    {
      id v11 = v66;
      if (v45 != 8) {
        goto LABEL_34;
      }
    }
    else
    {
      id v11 = v66;
      if (!v63)
      {
LABEL_34:

        id v10 = v65;
        goto LABEL_35;
      }
    }
    [v42 setObject:&unk_1F00099F8 forKeyedSubscript:v44];
    goto LABEL_34;
  }
  v26 = 0;
LABEL_53:

LABEL_54:
  return v26;
}

- (void)prepareAuxiliaryImagesFetchProperties:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F7A388];
  id v10 = a3;
  id v11 = (void *)[[v9 alloc] initWithComposition:v10];

  [v11 setName:@"PICompositionExporter-auxPropertiesRequest"];
  id v12 = [v7 priority];
  [v11 setPriority:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke;
  v16[3] = &unk_1E5D81180;
  id v18 = v11;
  id v19 = v8;
  id v17 = v7;
  id v13 = v11;
  id v14 = v7;
  id v15 = v8;
  [v13 submit:v16];
}

void __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v43 = 0;
  v3 = [a2 result:&v43];
  id v4 = v43;
  if (v3)
  {
    v5 = objc_alloc_init(PICompositionExportAuxiliaryResult);
    v6 = [v3 properties];
    [(PICompositionExportAuxiliaryResult *)v5 setProperties:v6];

    id v7 = [v3 properties];
    uint64_t v8 = [v7 size];
    -[PICompositionExportResult setInputSize:](v5, "setInputSize:", v8, v9);

    if ([v3 canPropagateOriginalAuxiliaryData])
    {
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
    else
    {
      id v28 = v4;
      [MEMORY[0x1E4F7A648] begin];
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v29 = v3;
      id v11 = [v3 properties];
      [*(id *)(a1 + 32) auxiliaryImageTypes];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v18 = NUAuxiliaryImageTypeFromString();
            id v19 = [v11 auxiliaryImagePropertiesForType:v18];

            if (v19)
            {
              v20 = (void *)[objc_alloc(MEMORY[0x1E4F7A380]) initWithRequest:*(void *)(a1 + 40)];
              [v20 setSkipRenderIfNotRequired:1];
              [v20 setAuxiliaryImageType:v18];
              int v21 = [NSString stringWithFormat:@"PICompositionExporter-%@", v17];
              [v20 setName:v21];

              if ([*(id *)(a1 + 32) optimizeForBackgroundProcessing])
              {
                [v20 setShouldUseLowMemoryMode:1];
                [v20 setIsOneShot:1];
              }
              if ([*(id *)(a1 + 32) applyImageOrientationAsMetadata])
              {
                v22 = +[PIPipelineFilters orientationAsMetaDataFilter];
                uint64_t v44 = v22;
                v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
                [v20 setPipelineFilters:v23];
              }
              v36[0] = MEMORY[0x1E4F143A8];
              v36[1] = 3221225472;
              v36[2] = __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_2;
              v36[3] = &unk_1E5D7F658;
              id v37 = v31;
              uint64_t v38 = v17;
              [v20 submit:v36];
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v14);
      }
      id v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v25 = dispatch_queue_create("PICompositionExporter.imageProperties.transaction", v24);

      v26 = (void *)MEMORY[0x1E4F7A648];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_467;
      v32[3] = &unk_1E5D80CC8;
      BOOL v33 = v5;
      id v34 = v31;
      id v35 = *(id *)(a1 + 48);
      id v27 = v31;
      [v26 commitAndNotifyOnQueue:v25 withBlock:v32];

      id v4 = v28;
      v3 = v29;
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    v5 = (PICompositionExportAuxiliaryResult *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, PICompositionExportAuxiliaryResult *))(v12 + 16))(v12, v5);
  }
}

void __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v3 = [a2 result:&v13];
  id v4 = v13;
  v5 = v4;
  if (v3)
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [v3 auxiliaryImage];
    [v6 setObject:v7 forKey:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = [v4 code];
    uint64_t v9 = *MEMORY[0x1E4F7A750];
    if (v8 == 13)
    {
      if (v9 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
      }
      uint64_t v10 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        id v11 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_INFO, "Aux image can be obtained from original data, skipped: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v9 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
      }
      uint64_t v12 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v5;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "failed to render auxiliary image data: %@", buf, 0xCu);
      }
    }
  }
}

void __82__PICompositionExporter_prepareAuxiliaryImagesFetchProperties_options_completion___block_invoke_467(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setAuxiliaryImages:v2];

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (void)prepareImageExportRequest:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PICompositionExporter_prepareImageExportRequest_options_completion___block_invoke;
  v14[3] = &unk_1E5D80F18;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(PICompositionExporter *)self prepareAuxiliaryImagesFetchProperties:v12 options:v11 completion:v14];
}

void __70__PICompositionExporter_prepareImageExportRequest_options_completion___block_invoke(void *a1, void *a2)
{
  id v36 = 0;
  uint64_t v3 = [a2 result:&v36];
  id v4 = v36;
  if (v3)
  {
    v5 = [v3 properties];
    v6 = [v5 metadata];

    id v7 = [(id)objc_opt_class() resetImageProperties:v6 preserveRegions:0];

    id v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    id v35 = 0;
    id v11 = [v8 addImageProperties:v7 composition:v9 options:v10 error:&v35];
    id v12 = v35;

    id v13 = [(id)a1[6] metadataProcessor];

    if (v13)
    {
      uint64_t v14 = [(id)a1[6] metadataProcessor];
      uint64_t v15 = ((void (**)(void, void *))v14)[2](v14, v11);

      id v11 = (void *)v15;
    }
    if (!v11)
    {
      if (!v12)
      {
        id v12 = [MEMORY[0x1E4F7A438] unknownError:@"unable to prepare image properties" object:0];
      }
      uint64_t v18 = a1[7];
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v12];
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
      goto LABEL_14;
    }
    id v16 = [(id)a1[5] objectForKeyedSubscript:@"depthEffect"];
    if (v16)
    {
    }
    else
    {
      v20 = [(id)a1[5] objectForKeyedSubscript:@"portraitEffect"];

      if (!v20)
      {
        uint64_t v21 = 0;
        goto LABEL_13;
      }
    }
    uint64_t v21 = [MEMORY[0x1E4F7A4A0] disableIOSurfacePortaitExport] ^ 1;
LABEL_13:
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A4F8]) initWithComposition:a1[5]];
    [v19 setName:@"PICompositionExporter-image"];
    v22 = [(id)a1[6] priority];
    [v19 setPriority:v22];

    v23 = [(id)a1[6] colorSpace];
    [v19 setColorSpace:v23];

    id v24 = [(id)a1[6] scalePolicy];
    [v19 setScalePolicy:v24];

    [v19 setImageProperties:v11];
    dispatch_queue_t v25 = [v3 auxiliaryImages];
    [v19 setAuxImages:v25];

    [v19 setRenderWithIOSurface:v21];
    v26 = [(id)a1[6] auxiliaryImageTypes];
    [v19 setAuxiliaryImageTypes:v26];

    id v27 = objc_alloc_init(PICompositionExportImagePrepareResult);
    [(PICompositionExportImagePrepareResult *)v27 setRequest:v19];
    uint64_t v28 = [v3 inputSize];
    -[PICompositionExportImagePrepareResult setInputSize:](v27, "setInputSize:", v28, v29);
    v30 = [v3 properties];
    -[PICompositionExportImagePrepareResult setInputIsHDR:](v27, "setInputIsHDR:", [v30 isHDR]);

    id v31 = [v3 properties];
    int v32 = [v31 colorSpace];
    [(PICompositionExportImagePrepareResult *)v27 setInputColorSpace:v32];

    uint64_t v33 = a1[7];
    id v34 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v27];
    (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v34);

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v17 = a1[7];
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  (*(void (**)(uint64_t, id))(v17 + 16))(v17, v12);
LABEL_15:
}

- (id)variationForFlavor:(id)a3
{
  uint64_t v3 = variationForFlavor__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&variationForFlavor__onceToken, &__block_literal_global_439);
  }
  v5 = [(id)variationForFlavor__map objectForKeyedSubscript:v4];

  return v5;
}

void __44__PICompositionExporter_variationForFlavor___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AutoLoop";
  v2[1] = @"Mirror";
  v3[0] = &unk_1F0009998;
  v3[1] = &unk_1F00099B0;
  v2[2] = @"LongExposure";
  v3[2] = &unk_1F00099C8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)variationForFlavor__map;
  variationForFlavor__map = v0;
}

- (id)saveSidecarData:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v15 = NUAssertLogger_7245();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sidecarData != nil");
      id v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_7245();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v28 = dispatch_get_specific(*v17);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v17 = [v29 callStackSymbols];
        id v31 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = (const void **)v28;
        __int16 v39 = 2114;
        long long v40 = v31;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_24;
  }
  if (!a4)
  {
    v22 = NUAssertLogger_7245();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v17 = (const void **)MEMORY[0x1E4F7A308];
    id v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_7245();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_26;
    }
LABEL_24:
    if (v25)
    {
      int v32 = dispatch_get_specific(*v17);
      uint64_t v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      id v35 = [v33 callStackSymbols];
      id v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = (const void **)v32;
      __int16 v39 = 2114;
      long long v40 = v36;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_26:

    _NUAssertFailHandler();
  }
  id v7 = v6;
  id v8 = [(PICompositionExporter *)self archiveURLForSidecarData:v6];
  uint64_t v9 = [v8 URLByDeletingLastPathComponent];
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a4];

  id v12 = 0;
  if (v11)
  {
    if ([v7 saveToURL:v8 error:a4]) {
      id v13 = v8;
    }
    else {
      id v13 = 0;
    }
    id v12 = v13;
  }

  return v12;
}

- (id)archiveURLForSidecarData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PICompositionExporter.m", 722, @"Invalid parameter not satisfying: %@", @"sidecarData != nil" object file lineNumber description];
  }
  id v6 = [v5 sourceIdentifier];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PICompositionExporter.m" lineNumber:723 description:@"Invalid sidecar data source identifier"];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v9 = NSTemporaryDirectory();
  uint64_t v10 = (void *)[v8 initFileURLWithPath:v9];

  int v11 = [v10 URLByAppendingPathComponent:@"com.apple.PhotoImaging.Sidecar"];

  id v12 = [v5 sourceIdentifier];
  id v13 = [v11 URLByAppendingPathComponent:v12];

  uint64_t v14 = [v13 URLByAppendingPathExtension:@"aar"];

  return v14;
}

- (id)exportComposition:(id)a3 options:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  queue = a5;
  v65 = (void (**)(id, PICompositionExporterVideoOptions *))a6;
  v68 = v9;
  unint64_t v11 = [v9 mediaType];
  if (v11 < 2)
  {
LABEL_6:
    uint64_t v63 = 0;
    uint64_t v15 = 0;
    v67 = 0;
    uint64_t v14 = 1;
    goto LABEL_12;
  }
  if (v11 == 2)
  {
    id v16 = [v10 videoPosterFrameURL];
    if (v16)
    {
      uint64_t v17 = [v9 objectForKeyedSubscript:@"videoPosterFrame"];
      LODWORD(v63) = v17 != 0;
    }
    else
    {
      LODWORD(v63) = 0;
    }

    uint64_t v14 = 0;
    uint64_t v15 = 0;
    v67 = 0;
    HIDWORD(v63) = 1;
  }
  else
  {
    if (v11 == 3)
    {
      id v12 = [v10 videoComplementURL];

      if (v12)
      {
        id v13 = [MEMORY[0x1E4F29128] UUID];
        v67 = [v13 UUIDString];

        uint64_t v63 = 0;
        uint64_t v14 = 1;
        uint64_t v15 = 1;
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    uint64_t v63 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    v67 = 0;
  }
LABEL_12:
  uint64_t v18 = [v10 imageExportFormat];
  uint64_t v19 = [v10 videoCodecType];
  id v20 = (id)v19;
  if (!v15)
  {
    if (HIDWORD(v63) && !v19 || v18 | v19) {
      goto LABEL_47;
    }
    uint64_t v18 = 0;
    id v20 = 0;
    goto LABEL_38;
  }
  if (v18 && v19)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    unsigned __int8 v22 = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0 && v20 == (id)*MEMORY[0x1E4F16230] || (v22 & (v20 == (id)*MEMORY[0x1E4F16228])) != 0) {
      goto LABEL_47;
    }
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    v23 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v116 = 138543618;
      *(void *)&v116[4] = v20;
      *(_WORD *)&v116[12] = 2114;
      *(void *)&v116[14] = v18;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Unexpected Live Photo export format pairing. Video codec (%{public}@) and image export format (%{public}@)", v116, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F7A438] mismatchError:@"Expecting HEIF/HEVC or JPEG/H264 when exporting Live Photo still and video complement" object:0];
    if (!v24) {
      goto LABEL_47;
    }
LABEL_91:
    uint64_t v33 = (PICompositionExporterVideoOptions *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v24];
    v65[2](v65, v33);
    v56 = 0;
    goto LABEL_87;
  }
  if (v18 || !v19)
  {
    if (v18 && !v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v25 = (id *)MEMORY[0x1E4F16230];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v24 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unexpected image export format when attempting to export Live Photo" object:v18];
          id v20 = 0;
          if (v24) {
            goto LABEL_91;
          }
          goto LABEL_47;
        }
        int v25 = (id *)MEMORY[0x1E4F16228];
      }
      id v20 = *v25;
      goto LABEL_47;
    }
LABEL_38:
    v26 = (void *)MEMORY[0x1E4F8CDF8];
    id v27 = [v10 primaryURL];
    uint64_t v28 = [v27 pathExtension];
    uint64_t v29 = [v26 typeWithFilenameExtension:v28];

    if ([v29 conformsToType:*MEMORY[0x1E4F44568]])
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F7A4E8]);
      id v31 = (id *)MEMORY[0x1E4F16230];
    }
    else
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F7A4F0]);
      [v30 setCompressionQuality:0.9];
      id v31 = (id *)MEMORY[0x1E4F16228];
    }

    id v32 = *v31;
    id v20 = v32;
    uint64_t v18 = (uint64_t)v30;
    goto LABEL_47;
  }
  if (v19 == *MEMORY[0x1E4F16230])
  {
    uint64_t v18 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F7A4E8]);
  }
  else if (v19 == *MEMORY[0x1E4F16228])
  {
    uint64_t v18 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F7A4F0]);
    [(id)v18 setCompressionQuality:0.9];
  }
  else
  {
    id v24 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unexpected video codec when attempting to export Live Photo" object:v19];
    uint64_t v18 = 0;
    if (v24) {
      goto LABEL_91;
    }
  }
LABEL_47:
  uint64_t v33 = objc_alloc_init(PICompositionExporterVideoOptions);
  [(PICompositionExporterOptions *)v33 setPairingIdentifier:v67];
  id v34 = [v10 priority];
  [(PICompositionExporterOptions *)v33 setPriority:v34];

  [(PICompositionExporterVideoOptions *)v33 setVideoCodecType:v20];
  -[PICompositionExporterVideoOptions setApplyVideoOrientationAsMetadata:](v33, "setApplyVideoOrientationAsMetadata:", [v10 applyVideoOrientationAsMetadata]);
  id v35 = objc_alloc_init(PICompositionExporterImageOptions);
  [(PICompositionExporterOptions *)v35 setPairingIdentifier:v67];
  id v36 = [v10 priority];
  [(PICompositionExporterOptions *)v35 setPriority:v36];

  [(PICompositionExporterImageOptions *)v35 setImageExportFormat:v18];
  -[PICompositionExporterImageOptions setApplyImageOrientationAsMetadata:](v35, "setApplyImageOrientationAsMetadata:", [v10 applyImageOrientationAsMetadata]);
  -[PICompositionExporterImageOptions setOptimizeForBackgroundProcessing:](v35, "setOptimizeForBackgroundProcessing:", [v10 optimizeForBackgroundProcessing]);
  id v37 = [v10 auxiliaryImageTypes];
  [(PICompositionExporterImageOptions *)v35 setAuxiliaryImageTypes:v37];

  if (v14) {
    [(PICompositionExporterImageOptions *)v35 setEnableHDR:1];
  }
  uint64_t v38 = dispatch_group_create();
  *(void *)v116 = 0;
  *(void *)&v116[8] = v116;
  *(void *)&v116[16] = 0x3032000000;
  v117 = __Block_byref_object_copy__7273;
  v118 = __Block_byref_object_dispose__7274;
  id v119 = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x3032000000;
  v111[3] = __Block_byref_object_copy__7273;
  v111[4] = __Block_byref_object_dispose__7274;
  id v112 = 0;
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x3032000000;
  v109[3] = __Block_byref_object_copy__7273;
  v109[4] = __Block_byref_object_dispose__7274;
  id v110 = 0;
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x3032000000;
  v107[3] = __Block_byref_object_copy__7273;
  v107[4] = __Block_byref_object_dispose__7274;
  id v108 = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x3032000000;
  v105[3] = __Block_byref_object_copy__7273;
  v105[4] = __Block_byref_object_dispose__7274;
  id v106 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x3032000000;
  v103[3] = __Block_byref_object_copy__7273;
  v103[4] = __Block_byref_object_dispose__7274;
  id v104 = 0;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3010000000;
  v101[3] = &unk_1A984BDE3;
  long long v102 = *MEMORY[0x1E4F7A330];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  __int16 v39 = (id)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v62 = [NSNumber numberWithBool:v14];
    v61 = [NSNumber numberWithBool:v15];
    v60 = [NSNumber numberWithBool:HIDWORD(v63)];
    uint64_t v58 = [NSNumber numberWithBool:v63];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v62;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v61;
    *(_WORD *)&buf[22] = 2114;
    v114 = v60;
    LOWORD(v115) = 2114;
    *(void *)((char *)&v115 + 2) = v58;
    v59 = (void *)v58;
    _os_log_debug_impl(&dword_1A9680000, v39, OS_LOG_TYPE_DEBUG, "Export Composition: exportImage: %{public}@ / exportVideoComplement: %{public}@ / exportVideo: %{public}@ / exportVideoPosterFrame: %{public}@", buf, 0x2Au);
  }
  if (v14)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    long long v40 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A9680000, v40, OS_LOG_TYPE_DEBUG, "Export Composition: exporting image", buf, 2u);
    }
    dispatch_group_enter(v38);
    uint64_t v41 = [v10 primaryURL];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke;
    v96[3] = &unk_1E5D7F5B8;
    v98 = v116;
    v99 = v103;
    v100 = v101;
    v97 = v38;
    [(PICompositionExporter *)self exportImageToURL:v41 composition:v68 options:v35 completion:v96];
  }
  if (v15)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    long long v42 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A9680000, v42, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video complement", buf, 2u);
    }
    dispatch_group_enter(v38);
    id v43 = [v10 videoCodecType];
    [(PICompositionExporterVideoOptions *)v33 setVideoCodecType:v43];

    uint64_t v44 = [v10 videoComplementURL];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_406;
    v93[3] = &unk_1E5D7F5E0;
    v95 = v111;
    v94 = v38;
    int v45 = [(PICompositionExporter *)self exportVideoToURL:v44 composition:v68 options:v33 completion:v93];
  }
  else
  {
    int v45 = 0;
  }
  if (HIDWORD(v63))
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    uint64_t v46 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A9680000, v46, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video", buf, 2u);
    }
    dispatch_group_enter(v38);
    [(PICompositionExporterVideoOptions *)v33 setBypassOutputSettingsIfNoComposition:1];
    uint64_t v47 = [v10 primaryURL];
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_407;
    v88[3] = &unk_1E5D7F5B8;
    v90 = v109;
    v91 = v103;
    v92 = v101;
    v89 = v38;
    uint64_t v48 = [(PICompositionExporter *)self exportVideoToURL:v47 composition:v68 options:v33 completion:v88];

    int v45 = (void *)v48;
  }
  if (v63)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    v49 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A9680000, v49, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video poster frame", buf, 2u);
    }
    int v50 = objc_alloc_init(PICompositionExporterImageOptions);
    dispatch_group_enter(v38);
    v51 = [v10 videoPosterFrameURL];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_408;
    v85[3] = &unk_1E5D7F5E0;
    v87 = v107;
    v86 = v38;
    [(PICompositionExporter *)self exportImageToURL:v51 composition:v68 options:v50 completion:v85];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v114 = __Block_byref_object_copy__7273;
  *(void *)&long long v115 = __Block_byref_object_dispose__7274;
  *((void *)&v115 + 1) = 0;
  if ([v10 exportSidecarData])
  {
    v52 = [[PICompositionSidecarData alloc] initWithComposition:v68];
    v53 = [v10 brushStrokeHistory];
    [(PICompositionSidecarData *)v52 setBrushStrokeHistory:v53];

    if (![(PICompositionSidecarData *)v52 isEmpty])
    {
      dispatch_group_enter(v38);
      sidecarDataExportQueue = self->_sidecarDataExportQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_409;
      block[3] = &unk_1E5D7F608;
      v83 = buf;
      block[4] = self;
      v81 = v52;
      v84 = v105;
      v82 = v38;
      dispatch_async(sidecarDataExportQueue, block);
    }
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  uint64_t v55 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v79 = 0;
    _os_log_debug_impl(&dword_1A9680000, v55, OS_LOG_TYPE_DEBUG, "Export Composition: waiting on notify", v79, 2u);
  }
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_410;
  v69[3] = &unk_1E5D7F630;
  v71 = v116;
  v72 = v111;
  v73 = v109;
  v74 = v107;
  v75 = v105;
  char v70 = v65;
  v76 = v103;
  v77 = v101;
  v78 = buf;
  dispatch_group_notify(v38, queue, v69);
  id v24 = v45;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);

  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v107, 8);

  _Block_object_dispose(v109, 8);
  _Block_object_dispose(v111, 8);

  _Block_object_dispose(v116, 8);
  v56 = v24;
LABEL_87:

  return v56;
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = [v4 geometry];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [v4 inputSize];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = v10;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  unint64_t v11 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v12 = 0;
    _os_log_debug_impl(&dword_1A9680000, v11, OS_LOG_TYPE_DEBUG, "Export Composition: exporting image complete", v12, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_406(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = (id)[a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  uint64_t v5 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1A9680000, v5, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video complement complete", v6, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_407(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = [v4 geometry];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [v4 inputSize];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = v10;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  unint64_t v11 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v12 = 0;
    _os_log_debug_impl(&dword_1A9680000, v11, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video complete", v12, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_408(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = (id)[a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  uint64_t v5 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1A9680000, v5, OS_LOG_TYPE_DEBUG, "Export Composition: exporting video poster frame complete", v6, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_409(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v2 saveSidecarData:v3 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __78__PICompositionExporter_exportComposition_options_completionQueue_completion___block_invoke_410(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v4 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    _os_log_debug_impl(&dword_1A9680000, v4, OS_LOG_TYPE_DEBUG, "Export Composition: notify triggered", (uint8_t *)&v20, 2u);
  }
  uint64_t v5 = *(PICompositionExportAuxiliaryResult **)(*(void *)(a1[5] + 8) + 40);
  if (v5) {
    uint64_t v6 = v5;
  }
  uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v7)
  {
    uint64_t v8 = v7;

    uint64_t v5 = v8;
  }
  uint64_t v9 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v9)
  {
    uint64_t v10 = v9;

    uint64_t v5 = v10;
  }
  unint64_t v11 = *(void **)(*(void *)(a1[8] + 8) + 40);
  if (v11)
  {
    id v12 = v11;

    uint64_t v5 = v12;
  }
  id v13 = *(void **)(*(void *)(a1[9] + 8) + 40);
  if (v13)
  {
    uint64_t v14 = v13;

    uint64_t v5 = v14;
LABEL_16:
    if (*v2 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    uint64_t v15 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543362;
      uint64_t v21 = v5;
      _os_log_debug_impl(&dword_1A9680000, v15, OS_LOG_TYPE_DEBUG, "Export Composition: calling completion with error: %{public}@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v16 = a1[4];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v5];
    goto LABEL_21;
  }
  if (v5) {
    goto LABEL_16;
  }
  uint64_t v5 = objc_alloc_init(PICompositionExportAuxiliaryResult);
  [(PICompositionExportResult *)v5 setGeometry:*(void *)(*(void *)(a1[10] + 8) + 40)];
  -[PICompositionExportResult setInputSize:](v5, "setInputSize:", *(void *)(*(void *)(a1[11] + 8) + 32), *(void *)(*(void *)(a1[11] + 8) + 40));
  [(PICompositionExportResult *)v5 setSidecarDataURL:*(void *)(*(void *)(a1[12] + 8) + 40)];
  if (*v2 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  uint64_t v19 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138543362;
    uint64_t v21 = v5;
    _os_log_debug_impl(&dword_1A9680000, v19, OS_LOG_TYPE_DEBUG, "Export Composition: calling completion with result: %{public}@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v16 = a1[4];
  uint64_t v17 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
LABEL_21:
  uint64_t v18 = (void *)v17;
  (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v17);
}

- (id)exportVideoToURL:(id)a3 composition:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  uint64_t v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A700]) initWithComposition:v11];
  [v15 setName:@"PICompositionExporter-videoProperties"];
  uint64_t v16 = [v12 priority];
  [v15 setPriority:v16];

  id v37 = 0;
  uint64_t v17 = [v15 submitSynchronous:&v37];
  id v18 = v37;
  uint64_t v19 = [v17 properties];

  if (v19)
  {
    id v35 = v10;
    int v20 = [v19 metadata];
    id v36 = v18;
    id v34 = self;
    uint64_t v21 = [(PICompositionExporter *)self addVideoProperties:v20 composition:v11 options:v12 error:&v36];
    id v22 = v36;

    v23 = [v12 metadataProcessor];

    if (v23)
    {
      id v24 = [v12 metadataProcessor];
      uint64_t v25 = ((void (**)(void, void *))v24)[2](v24, v21);

      uint64_t v21 = (void *)v25;
    }
    if (v21)
    {
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F7A740]) initWithProperties:v19];
      [v26 setMetadata:v21];
      [(PICompositionExporter *)v34 _exportVideoToURL:v35 composition:v11 options:v12 properties:v26 progress:v14 completion:v13];
      id v27 = v14;

      id v10 = v35;
      id v18 = v22;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to prepare video metadata" object:v19 underlyingError:v22];

      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
      }
      id v10 = v35;
      id v30 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v39 = v35;
        __int16 v40 = 2112;
        id v41 = v18;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Error exporting video to '%@': %@", buf, 0x16u);
      }
      id v31 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v18];
      v13[2](v13, v31);

      id v32 = v14;
    }
  }
  else
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v18];
    v13[2](v13, v28);

    id v29 = v14;
  }

  return v14;
}

- (void)exportImageToDataWithComposition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke;
  v12[3] = &unk_1E5D81798;
  id v13 = v8;
  id v14 = v9;
  id v10 = v8;
  id v11 = v9;
  [(PICompositionExporter *)self prepareImageExportRequest:a3 options:v10 completion:v12];
}

void __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  uint64_t v3 = [a2 result:&v18];
  id v4 = v18;
  if (v3)
  {
    uint64_t v5 = [v3 request];
    uint64_t v6 = [v3 inputSize];
    uint64_t v8 = v7;
    [v5 setRenderToData:1];
    id v9 = [*(id *)(a1 + 32) imageExportFormatForURL:0 isHDR:0];
    [v5 setFormat:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([*(id *)(a1 + 32) applyImageOrientationAsMetadata])
    {
      id v11 = +[PIPipelineFilters orientationAsMetaDataFilter];
      [v10 addObject:v11];
    }
    [v5 setPipelineFilters:v10];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke_377;
    v14[3] = &unk_1E5D7F590;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = v6;
    uint64_t v17 = v8;
    [v5 submit:v14];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
    }
    id v12 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Failed to export image to data: %@", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
  }
}

void __77__PICompositionExporter_exportImageToDataWithComposition_options_completion___block_invoke_377(void *a1, void *a2)
{
  id v11 = 0;
  uint64_t v3 = [a2 result:&v11];
  id v4 = v11;
  if (v3)
  {
    uint64_t v5 = objc_alloc_init(PICompositionExportDataResult);
    uint64_t v6 = [v3 geometry];
    [(PICompositionExportResult *)v5 setGeometry:v6];

    -[PICompositionExportResult setInputSize:](v5, "setInputSize:", a1[5], a1[6]);
    uint64_t v7 = [v3 destinationData];
    [(PICompositionExportDataResult *)v5 setData:v7];

    uint64_t v8 = a1[4];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);

    id v4 = (id)v9;
  }
  else
  {
    uint64_t v10 = a1[4];
    uint64_t v5 = (PICompositionExportDataResult *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, PICompositionExportDataResult *))(v10 + 16))(v10, v5);
  }
}

- (void)exportImageToURL:(id)a3 composition:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke;
  v18[3] = &unk_1E5D7F568;
  id v22 = self;
  id v23 = v13;
  id v19 = v10;
  id v20 = v12;
  id v21 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v10;
  [(PICompositionExporter *)self prepareImageExportRequest:v14 options:v15 completion:v18];
}

void __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v32 = 0;
  uint64_t v3 = [a2 result:&v32];
  id v4 = v32;
  if (v3)
  {
    if ([*(id *)(a1 + 40) exportSidecarData])
    {
      uint64_t v5 = [[PICompositionSidecarData alloc] initWithComposition:*(void *)(a1 + 48)];
      uint64_t v6 = [*(id *)(a1 + 40) brushStrokeHistory];
      [(PICompositionSidecarData *)v5 setBrushStrokeHistory:v6];

      if ([(PICompositionSidecarData *)v5 isEmpty])
      {
        uint64_t v7 = 0;
      }
      else
      {
        id v10 = *(void **)(a1 + 56);
        id v31 = 0;
        uint64_t v7 = [v10 saveSidecarData:v5 error:&v31];
        id v11 = v31;

        if (!v7)
        {
          uint64_t v22 = *(void *)(a1 + 64);
          id v12 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v11];
          (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v12);
          id v4 = v11;
LABEL_27:

          goto LABEL_28;
        }
        id v4 = v11;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v12 = [v3 request];
    uint64_t v13 = [v3 inputSize];
    uint64_t v15 = v14;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v17 = +[PIPipelineFilters oneShotPortraitV2ExportFilter];
    [v16 addObject:v17];

    objc_msgSend(v12, "setApplyOrientationAsMetadata:", objc_msgSend(*(id *)(a1 + 40), "applyImageOrientationAsMetadata"));
    if (objc_msgSend((id)objc_opt_class(), "_lowMemoryModeSupportedForComposition:pixelSize:", *(void *)(a1 + 48), v13, v15))uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "optimizeForBackgroundProcessing"); {
    else
    }
      uint64_t v18 = 0;
    [v12 setShouldUseLowMemoryMode:v18];
    [v12 setDestinationURL:*(void *)(a1 + 32)];
    uint64_t v19 = [v3 inputIsHDR];
    id v20 = [*(id *)(a1 + 40) imageExportFormatForURL:*(void *)(a1 + 32) isHDR:v19];
    if (v19
      && [*(id *)(a1 + 40) enableHDR]
      && [v20 supportsHDR]
      && [MEMORY[0x1E4F7A4A0] enableDash5])
    {
      id v21 = [v3 inputColorSpace];
      if ([v21 isHDR])
      {
        [v12 setColorSpace:v21];
      }
      else
      {
        uint64_t v25 = [MEMORY[0x1E4F7A400] itur2100PQColorSpace];
        [v12 setColorSpace:v25];
      }
      [v12 setRenderWithIOSurface:1];
    }
    [v12 setFormat:v20];
    [v12 setPipelineFilters:v16];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke_374;
    v26[3] = &unk_1E5D7F540;
    id v24 = *(id *)(a1 + 64);
    uint64_t v29 = v13;
    uint64_t v30 = v15;
    id v27 = v7;
    id v28 = v24;
    uint64_t v5 = v7;
    [v12 submit:v26];

    goto LABEL_27;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_526);
  }
  uint64_t v8 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v23;
    __int16 v35 = 2112;
    id v36 = v4;
    _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Failed to export image to %@: %@", buf, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v5 = (PICompositionSidecarData *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  (*(void (**)(uint64_t, PICompositionSidecarData *))(v9 + 16))(v9, v5);
LABEL_28:
}

void __73__PICompositionExporter_exportImageToURL_composition_options_completion___block_invoke_374(void *a1, void *a2)
{
  id v11 = 0;
  uint64_t v3 = [a2 result:&v11];
  id v4 = v11;
  if (v3)
  {
    uint64_t v5 = objc_alloc_init(PICompositionExportResult);
    uint64_t v6 = [v3 geometry];
    [(PICompositionExportResult *)v5 setGeometry:v6];

    -[PICompositionExportResult setInputSize:](v5, "setInputSize:", a1[6], a1[7]);
    uint64_t v7 = [v3 destinationURL];
    [(PICompositionExportResult *)v5 setExportedFileURL:v7];

    [(PICompositionExportResult *)v5 setSidecarDataURL:a1[4]];
    uint64_t v8 = a1[5];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);

    id v4 = (id)v9;
  }
  else
  {
    uint64_t v10 = a1[5];
    uint64_t v5 = (PICompositionExportResult *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, PICompositionExportResult *))(v10 + 16))(v10, v5);
  }
}

- (PICompositionExporter)init
{
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_7299);
  }
  v8.receiver = self;
  v8.super_class = (Class)PICompositionExporter;
  uint64_t v3 = [(PICompositionExporter *)&v8 init];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("PICompositionExporter.sidecarDataExport", v4);
  sidecarDataExportQueue = v3->_sidecarDataExportQueue;
  v3->_sidecarDataExportQueue = (OS_dispatch_queue *)v5;

  return v3;
}

void __29__PICompositionExporter_init__block_invoke()
{
  if (!sMetadataConverter)
  {
    sMetadataConverter = objc_alloc_init(_PICompositionExporterMetadataConverter);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)resetImageProperties:(id)a3 preserveRegions:(BOOL)a4
{
  dispatch_queue_t v5 = (void *)[a3 mutableCopy];
  [v5 removeObjectForKey:*MEMORY[0x1E4F2FCA0]];
  uint64_t v6 = *MEMORY[0x1E4F2FD40];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  objc_super v8 = (void *)[v7 mutableCopy];

  if (v8)
  {
    [v8 removeObjectForKey:*MEMORY[0x1E4F2FD70]];
    [v5 setObject:v8 forKeyedSubscript:v6];
  }
  if (!a4)
  {
    uint64_t v9 = *MEMORY[0x1E4F2F6D8];
    uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2F6D8]];
    id v11 = (void *)[v10 mutableCopy];

    if (v11)
    {
      [v11 removeObjectForKey:@"Regions"];
      [v5 setObject:v11 forKeyedSubscript:v9];
    }
  }
  id v12 = (void *)[v5 copy];

  return v12;
}

+ (BOOL)_lowMemoryModeSupportedForComposition:(id)a3 pixelSize:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"depthEffect"];
  objc_super v8 = v7;
  if (v7
    && ([v7 objectForKeyedSubscript:@"enabled"],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 BOOLValue],
        v9,
        v10))
  {
    int v11 = !+[PIPhotoEditHelper compositionHasAnyStageEffect:v6];
    if ((double)(var0 * var1) / 1000000.0 > 20.0) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

+ (id)metadataConverter
{
  return (id)sMetadataConverter;
}

+ (void)setMetadataConverter:(id)a3
{
  id v3 = a3;
  id v6 = v3;
  if (v3) {
    id v4 = (_PICompositionExporterMetadataConverter *)v3;
  }
  else {
    id v4 = objc_alloc_init(_PICompositionExporterMetadataConverter);
  }
  dispatch_queue_t v5 = (void *)sMetadataConverter;
  sMetadataConverter = (uint64_t)v4;
}

@end