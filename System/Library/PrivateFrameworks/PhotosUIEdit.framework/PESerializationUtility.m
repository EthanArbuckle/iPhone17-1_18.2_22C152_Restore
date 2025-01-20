@interface PESerializationUtility
+ (BOOL)adjustmentDataIsSupported:(id)a3;
+ (id)compositionControllerForContentEditingInput:(id)a3 asShot:(BOOL)a4 error:(id *)a5;
+ (id)compositionControllerForContentEditingInput:(id)a3 asShot:(BOOL)a4 source:(id)a5 error:(id *)a6;
+ (id)contentEditingOutputForContentEditingInput:(id)a3 compositionController:(id)a4 asset:(id)a5 async:(BOOL)a6 onlyChangingOriginalChoice:(BOOL)a7;
+ (id)editSourceForContentEditingInput:(id)a3 error:(id *)a4;
+ (id)editSourceForContentEditingInput:(id)a3 useEmbeddedPreview:(BOOL)a4 error:(id *)a5;
+ (id)editSourceForContentEditingInput:(id)a3 useRawDisplaySizeImage:(BOOL)a4 useEmbeddedPreview:(BOOL)a5 error:(id *)a6;
+ (id)exportCompositionController:(id)a3 forContentEditingOutput:(id)a4 settings:(id)a5 completionQueue:(id)a6 completion:(id)a7;
+ (int64_t)_playbackStyleForAutoLoopController:(id)a3;
+ (unsigned)_playbackVariationForAutoLoopController:(id)a3;
@end

@implementation PESerializationUtility

+ (unsigned)_playbackVariationForAutoLoopController:(id)a3
{
  id v3 = a3;
  if ([v3 enabled])
  {
    v4 = [v3 flavor];
    unsigned __int16 v5 = PIAutoLoopFlavorFromString();
  }
  else
  {
    unsigned __int16 v5 = 0;
  }

  return v5;
}

+ (int64_t)_playbackStyleForAutoLoopController:(id)a3
{
  id v3 = a3;
  if ([v3 enabled])
  {
    v4 = [v3 flavor];
    PIAutoLoopFlavorFromString();

    if (PIAutoLoopFlavorProducesOnlyVideo()) {
      int64_t v5 = 5;
    }
    else {
      int64_t v5 = 3;
    }
  }
  else
  {
    int64_t v5 = 3;
  }

  return v5;
}

+ (id)exportCompositionController:(id)a3 forContentEditingOutput:(id)a4 settings:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v54 = [MEMORY[0x263F08690] currentHandler];
    [v54 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 483, @"Invalid parameter not satisfying: %@", @"contentEditingOutput != nil" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  v55 = [MEMORY[0x263F08690] currentHandler];
  [v55 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 484, @"Invalid parameter not satisfying: %@", @"compositionController != nil" object file lineNumber description];

  if (v15)
  {
LABEL_4:
    if (v16) {
      goto LABEL_5;
    }
LABEL_41:
    v57 = [MEMORY[0x263F08690] currentHandler];
    [v57 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 486, @"Invalid parameter not satisfying: %@", @"completionQueue != nil" object file lineNumber description];

    if (v17) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_40:
  v56 = [MEMORY[0x263F08690] currentHandler];
  [v56 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 485, @"Invalid parameter not satisfying: %@", @"settings != nil" object file lineNumber description];

  if (!v16) {
    goto LABEL_41;
  }
LABEL_5:
  if (v17) {
    goto LABEL_6;
  }
LABEL_42:
  v58 = [MEMORY[0x263F08690] currentHandler];
  [v58 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 487, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

LABEL_6:
  v18 = PLPhotoEditGetLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);
  v20 = [v14 renderedContentURL];
  if (v20)
  {
  }
  else if (([v14 isAsyncAdjustment] & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke;
    block[3] = &unk_2642BF340;
    id v76 = v17;
    dispatch_async(v16, block);
    v50 = 0;

    goto LABEL_35;
  }
  v21 = (void *)MEMORY[0x263F5D618];
  v22 = [v13 composition];
  v62 = objc_msgSend(v21, "validatedCompositionCopyForComposition:mediaType:", v22, objc_msgSend(v13, "mediaType"));

  LODWORD(v22) = [v14 isAsyncAdjustment];
  v23 = PLPhotoEditGetLog();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  v59 = v15;
  v60 = v17;
  v61 = v16;
  if (!v22)
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_DEFAULT, "Exporting image for sync adjustment", buf, 2u);
    }

    v26 = objc_opt_new();
    v27 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:0];
    [v26 setPriority:v27];

    v28 = [v14 renderedContentURL];
    [v26 setPrimaryURL:v28];

    v29 = [v14 renderedVideoComplementContentURL];
    [v26 setVideoComplementURL:v29];

    v30 = [v14 renderedVideoPosterURL];
    [v26 setVideoPosterFrameURL:v30];

    objc_msgSend(v26, "setApplyVideoOrientationAsMetadata:", objc_msgSend(v15, "applyVideoOrientationAsMetadata"));
    [v26 setExportSidecarData:1];
    v31 = [v13 brushStrokeHistory];
    [v26 setBrushStrokeHistory:v31];

    id v32 = [v13 autoLoopAdjustmentController];
    if (![v32 enabled]) {
      goto LABEL_30;
    }
    v33 = [v32 flavor];
    PIAutoLoopFlavorFromString();
    int v34 = PIAutoLoopFlavorProducesOnlyVideo();

    if (!v34) {
      goto LABEL_30;
    }
    v35 = (void *)MEMORY[0x263F5DF98];
    v36 = [v14 renderedVideoPosterURL];
    v37 = [v36 pathExtension];
    v38 = [v35 typeWithFilenameExtension:v37];

    if ([v38 conformsToType:*MEMORY[0x263F1DB40]])
    {
      v39 = (void *)MEMORY[0x263EFA368];
    }
    else
    {
      if (![v38 conformsToType:*MEMORY[0x263F1DAE8]])
      {
LABEL_29:

LABEL_30:
        v51 = v18;
        v52 = v51;
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_217B65000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v19, "LeavingEditRender-Sync", " enableTelemetry=YES ", buf, 2u);
        }

        id v49 = objc_alloc_init(MEMORY[0x263F5D568]);
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_138;
        v63[3] = &unk_2642BEDC0;
        v46 = (id *)&v64;
        v64 = v52;
        v66[1] = v19;
        v47 = &v65;
        id v65 = v14;
        v48 = (id *)v66;
        v66[0] = v60;
        v50 = [v49 exportComposition:v62 options:v26 completionQueue:v61 completion:v63];
        goto LABEL_34;
      }
      v39 = (void *)MEMORY[0x263EFA370];
    }
    [v26 setVideoCodecType:*v39];
    goto LABEL_29;
  }
  if (v24)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_DEFAULT, "Exporting image for async adjustment", buf, 2u);
  }

  uint64_t v25 = [v14 mediaType];
  if (v25 == 2) {
    [v14 renderedVideoPosterURL];
  }
  else {
  v40 = [v14 renderedPreviewContentURL];
  }
  v26 = objc_opt_new();
  v41 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:1];
  [v26 setPriority:v41];

  v42 = [v59 scalePolicy];
  [v26 setScalePolicy:v42];

  [v26 setEnableHDR:v25 != 2];
  [v26 setExportSidecarData:1];
  v43 = [v13 brushStrokeHistory];
  [v26 setBrushStrokeHistory:v43];

  v44 = v18;
  v45 = v44;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v19, "LeavingEditRender-Async", " enableTelemetry=YES ", buf, 2u);
  }

  id v32 = objc_alloc_init(MEMORY[0x263F5D568]);
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_134;
  v67[3] = &unk_2642BED98;
  v46 = (id *)&v68;
  v68 = v45;
  os_signpost_id_t v73 = v19;
  v47 = &v69;
  v48 = &v70;
  id v69 = v14;
  v70 = v40;
  v71 = v61;
  id v72 = v60;
  id v49 = v40;
  [v32 exportImageToURL:v49 composition:v62 options:v26 completion:v67];

  v50 = 0;
LABEL_34:

  id v15 = v59;
  id v17 = v60;
  v16 = v61;

LABEL_35:
  return v50;
}

uint64_t __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(id *)(a1 + 32);
  int64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LeavingEditRender-Async", " enableTelemetry=YES ", buf, 2u);
  }

  id v19 = 0;
  v7 = [v3 result:&v19];
  id v8 = v19;
  if (v7)
  {
    v9 = [v7 sidecarDataURL];
    [*(id *)(a1 + 40) setAdjustmentSecondaryDataURL:v9];

    v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "Exported image to: %@", buf, 0xCu);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_135;
  v15[3] = &unk_2642BED70;
  v12 = *(NSObject **)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  BOOL v18 = v7 != 0;
  id v16 = v8;
  id v17 = v13;
  id v14 = v8;
  dispatch_async(v12, v15);
}

void __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(id *)(a1 + 32);
  int64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_217B65000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LeavingEditRender-Sync", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = 0;
  v7 = [v3 result:&v12];
  id v8 = v12;
  if (v7)
  {
    v9 = [v7 sidecarDataURL];
    [*(id *)(a1 + 40) setAdjustmentSecondaryDataURL:v9];
  }
  v10 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"NO";
    if (v7) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v14 = v11;
    _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "Synchronous image export complete with success: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __114__PESerializationUtility_exportCompositionController_forContentEditingOutput_settings_completionQueue_completion___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (id)contentEditingOutputForContentEditingInput:(id)a3 compositionController:(id)a4 asset:(id)a5 async:(BOOL)a6 onlyChangingOriginalChoice:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_45:
    v67 = [MEMORY[0x263F08690] currentHandler];
    [v67 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 391, @"Invalid parameter not satisfying: %@", @"compositionController != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_46;
  }
  v66 = [MEMORY[0x263F08690] currentHandler];
  [v66 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 390, @"Invalid parameter not satisfying: %@", @"contentEditingInput != nil" object file lineNumber description];

  if (!v14) {
    goto LABEL_45;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_46:
  v68 = [MEMORY[0x263F08690] currentHandler];
  [v68 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 392, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];

LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  int v18 = [v15 isLivePhoto];
  id v19 = objc_alloc_init(MEMORY[0x263F14DE0]);
  id v20 = v19;
  v74 = v19;
  if (v7)
  {
    [v19 setOnlyChangingOriginalChoice:1];
  }
  else
  {
    [v19 setAsyncAdjustment:v8];
    uint64_t v21 = [v15 uniformTypeIdentifier];
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x263F1D920] typeWithIdentifier:v21];
      int v23 = [v22 conformsToType:*MEMORY[0x263F1DE10]];
    }
    else
    {
      int v23 = 0;
    }
    id v20 = v74;
    objc_msgSend(v74, "setPreferHEICForRenderedImages:", v23 | ((unint64_t)objc_msgSend(v17, "mediaSubtypes") >> 23) & 1);
    if (v18)
    {
      BOOL v24 = [v14 autoLoopAdjustmentController];
      id v20 = v74;
      objc_msgSend(v74, "setPlaybackStyle:", +[PESerializationUtility _playbackStyleForAutoLoopController:](PESerializationUtility, "_playbackStyleForAutoLoopController:", v24));
    }
  }
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F14DD8]) initWithContentEditingInput:v13 withOptions:v20];
  id v75 = v14;
  if (!v7)
  {
    id v72 = v17;
    v26 = v13;
    if (v17) {
      uint64_t v27 = (int)[v17 exifOrientation];
    }
    else {
      uint64_t v27 = 1;
    }
    v28 = (void *)MEMORY[0x263F5D978];
    uint64_t v29 = [v15 pixelWidth];
    uint64_t v30 = [v15 pixelHeight];
    [v15 duration];
    v31 = objc_msgSend(v28, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", v29, v30, v27);
    id v32 = objc_opt_new();
    id v79 = 0;
    id v80 = 0;
    v33 = [v32 dataFromCompositionController:v75 outFormatIdentifier:&v80 outFormatVersion:&v79 exportProperties:v31];
    id v34 = v80;
    id v35 = v79;

    v36 = (void *)[objc_alloc(MEMORY[0x263F14D10]) initWithFormatIdentifier:v34 formatVersion:v35 data:v33];
    [v25 setAdjustmentData:v36];

    id v13 = v26;
    uint64_t v37 = [v26 originalAdjustmentData];
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [v26 adjustmentData];

      if (!v39)
      {
        v40 = [v26 originalAdjustmentData];
        uint64_t v41 = [v40 adjustmentRenderTypes];
        v42 = [v25 adjustmentData];
        [v42 setAdjustmentRenderTypes:v41];
      }
    }

    id v14 = v75;
    id v17 = v72;
  }
  if (v18)
  {
    v43 = [v14 autoLoopAdjustmentController];
    uint64_t v44 = +[PESerializationUtility _playbackVariationForAutoLoopController:v43];

    id v14 = v75;
    if (v44 != [v15 playbackVariation])
    {
      v45 = [NSNumber numberWithUnsignedShort:v44];
      [v25 setPlaybackVariation:v45];
    }
  }
  if ([v25 isAsyncAdjustment])
  {
    id v46 = objc_alloc(MEMORY[0x263F58618]);
    v47 = [v14 composition];
    v48 = (void *)[v46 initWithComposition:v47];

    [v48 setName:@"+[PESerializationUtility contentEditingOutputForContentEditingInput:]-Geometry"];
    id v78 = 0;
    id v49 = [v48 submitSynchronous:&v78];
    id v50 = v78;
    v51 = [v49 geometry];

    v71 = v50;
    if (v51)
    {
      uint64_t v52 = [v51 size];
      uint64_t v54 = v53;
      id v14 = v75;
    }
    else
    {
      v55 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v82 = v50;
        _os_log_impl(&dword_217B65000, v55, OS_LOG_TYPE_DEFAULT, "Failed to request geometry with error: %@", buf, 0xCu);
      }

      uint64_t v52 = [v15 pixelWidth];
      uint64_t v54 = [v15 pixelHeight];
      id v14 = v75;
      if ((v54 | v52) < 0)
      {
        id v69 = [MEMORY[0x263F08690] currentHandler];
        v70 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        [v69 handleFailureInFunction:v70, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)", v71 file lineNumber description];

        id v14 = v75;
      }
    }
    [v25 setFullSizeRenderWidth:v52];
    [v25 setFullSizeRenderHeight:v54];
    if ([v14 mediaType] == 2)
    {
      id v73 = v17;
      id v56 = v13;
      id v57 = objc_alloc(MEMORY[0x263F586A8]);
      v58 = [v14 composition];
      v59 = (void *)[v57 initWithComposition:v58];

      [v59 setName:@"+[PESerializationUtility contentEditingOutputForContentEditingInput:]-VideoAttributes"];
      id v77 = 0;
      v60 = [v59 submitSynchronous:&v77];
      id v61 = v77;
      v62 = [v60 videoAttributes];

      if (v62)
      {
        [v62 duration];
        [v25 setFullSizeRenderDuration:CMTimeGetSeconds(&time)];
        id v14 = v75;
      }
      else
      {
        id v63 = v61;
        v64 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v82 = v63;
          _os_log_impl(&dword_217B65000, v64, OS_LOG_TYPE_DEFAULT, "Failed to request video attributes with error: %@", buf, 0xCu);
        }

        id v14 = v75;
        id v61 = v63;
      }

      id v13 = v56;
      id v17 = v73;
    }
  }
  return v25;
}

+ (BOOL)adjustmentDataIsSupported:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  int64_t v5 = [v3 data];
  os_signpost_id_t v6 = [v3 formatIdentifier];
  BOOL v7 = [v3 formatVersion];

  id v13 = 0;
  BOOL v8 = [v4 loadCompositionFrom:v5 formatIdentifier:v6 formatVersion:v7 sidecarData:0 error:&v13];
  id v9 = v13;

  if (v9)
  {
    v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "PESerializationUtility adjustment data is not supported: %@", buf, 0xCu);
    }

    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = v8 != 0;
  }

  return v11;
}

+ (id)compositionControllerForContentEditingInput:(id)a3 asShot:(BOOL)a4 source:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v90 = [MEMORY[0x263F08690] currentHandler];
    [v90 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 174, @"Invalid parameter not satisfying: %@", @"contentEditingInput != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v91 = [MEMORY[0x263F08690] currentHandler];
  [v91 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 175, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];

LABEL_3:
  if (!a6)
  {
    v92 = [MEMORY[0x263F08690] currentHandler];
    [v92 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 176, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  id v14 = [v11 originalAdjustmentData];
  uint64_t v15 = [v11 adjustmentData];
  v96 = (void *)v15;
  v97 = v13;
  v95 = v14;
  if (v8)
  {
    if (v14)
    {
      uint64_t v16 = objc_opt_new();
      id v17 = [v14 data];
      int v18 = [v14 formatIdentifier];
      id v19 = [v14 formatVersion];
      id v112 = 0;
      uint64_t v20 = [v16 loadCompositionFrom:v17 formatIdentifier:v18 formatVersion:v19 sidecarData:0 error:&v112];
      uint64_t v21 = v112;

      if (!v21)
      {
        v98 = 0;
        id v13 = v97;
        goto LABEL_38;
      }
      uint64_t v22 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v21;
        _os_log_impl(&dword_217B65000, v22, OS_LOG_TYPE_ERROR, "PESerializationUtility persistence manager deserialized with error: %@", buf, 0xCu);
      }
      v98 = 0;
LABEL_19:
      id v13 = v97;
LABEL_37:

LABEL_38:
      uint64_t v53 = v20;
      if (v20)
      {
LABEL_40:
        uint64_t v54 = (void *)[MEMORY[0x263F5D618] newCompositionControllerWithComposition:v53];
        v55 = [v54 adjustmentConstants];
        id v56 = [v13 source];
        objc_msgSend(v54, "setSource:mediaType:", v56, objc_msgSend(v13, "mediaType"));

        if ([v11 mediaType] == 2 && (objc_msgSend(v11, "mediaSubtypes") & 0x20000) != 0)
        {
          id v57 = [v54 slomoAdjustmentController];

          if (!v57)
          {
            v58 = [v55 PISlomoAdjustmentKey];
            v107[0] = MEMORY[0x263EF8330];
            v107[1] = 3221225472;
            v107[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke;
            v107[3] = &unk_2642BECA8;
            id v108 = v11;
            [v54 modifyAdjustmentWithKey:v58 modificationBlock:v107];
          }
        }
        id v94 = v11;
        v59 = [v54 depthAdjustmentController];
        v60 = v59;
        if (v59)
        {
          id v61 = [v59 capturedFocusRect];
          v62 = [v60 focusRect];

          if (v61 && !v62)
          {
            uint64_t v63 = *MEMORY[0x263F5D6F8];
            v105[0] = MEMORY[0x263EF8330];
            v105[1] = 3221225472;
            v105[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_2;
            v105[3] = &unk_2642BECD0;
            id v106 = v61;
            [v54 modifyAdjustmentWithKey:v63 modificationBlock:v105];
          }
        }
        v93 = v53;
        v64 = [v54 semanticStyleAdjustmentController];

        if (!v64)
        {
          id v65 = dispatch_group_create();
          dispatch_group_enter(v65);
          id v66 = objc_alloc(MEMORY[0x263F5D648]);
          v67 = [v54 composition];
          v68 = (void *)[v66 initWithComposition:v67];

          v102[0] = MEMORY[0x263EF8330];
          v102[1] = 3221225472;
          v102[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_3;
          v102[3] = &unk_2642BED20;
          id v103 = v54;
          v104 = v65;
          id v69 = v65;
          [v68 submit:v102];
          dispatch_group_wait(v69, 0xFFFFFFFFFFFFFFFFLL);
        }
        v70 = (void *)MEMORY[0x263F5D618];
        v71 = [v54 composition];
        id v72 = [v70 imagePropertiesRequestWithComposition:v71];

        [v72 setName:@"PAEditSupport-compositionControllerDeserialization"];
        id v101 = 0;
        id v73 = [v72 submitSynchronous:&v101];
        id v74 = v101;
        id v75 = [v73 properties];

        id v76 = v55;
        if (!v75)
        {
          id v52 = 0;
          *a6 = v74;
LABEL_66:

          id v11 = v94;
          id v14 = v95;
          v51 = v98;
          uint64_t v21 = v93;
          goto LABEL_67;
        }
        id v77 = [v75 rawProperties];
        if (v77)
        {
          id v78 = [v54 rawAdjustmentController];

          if (v78)
          {
            id v79 = [v54 rawAdjustmentController];
            id v80 = [v79 inputDecoderVersion];

            v81 = [v77 availableDecoderVersions];
            char v82 = [v81 containsObject:v80];

            v55 = v76;
            if (v82) {
              goto LABEL_59;
            }
          }
          uint64_t v83 = [v55 PIRawAdjustmentKey];
          v99[0] = MEMORY[0x263EF8330];
          v99[1] = 3221225472;
          v99[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_95;
          v99[3] = &unk_2642BED48;
          id v100 = v77;
          [v54 modifyAdjustmentWithKey:v83 modificationBlock:v99];

          v84 = v100;
        }
        else
        {
          v84 = [v55 PIRawAdjustmentKey];
          [v54 removeAdjustmentWithKey:v84];
        }

LABEL_59:
        uint64_t v85 = [v75 orientation];
        if ((NUOrientationIsValid() & 1) == 0)
        {
          v86 = PLPhotoEditGetLog();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v114) = v85;
            _os_log_impl(&dword_217B65000, v86, OS_LOG_TYPE_ERROR, "PESerializationUtility image orientation from the image properties is invalid: %d", buf, 8u);
          }

          uint64_t v85 = 1;
        }
        [MEMORY[0x263F5D8D0] compositionController:v54 setInputOrientation:v85];
        v87 = [v98 brushStrokeHistory];

        id v13 = v97;
        if (v87)
        {
          v88 = [v98 brushStrokeHistory];
          [v54 setBrushStrokeHistory:v88];
        }
        id v52 = v54;

        goto LABEL_66;
      }
LABEL_39:
      uint64_t v53 = [MEMORY[0x263F5D618] newComposition];
      goto LABEL_40;
    }
    if (v15)
    {
      id v34 = (void *)v15;
      id v35 = objc_alloc(MEMORY[0x263F5D560]);
      v36 = (void *)[MEMORY[0x263F5D618] newComposition];
      uint64_t v21 = [v35 initWithComposition:v36];

      uint64_t v37 = objc_opt_new();
      v38 = [v34 data];
      v39 = [v34 formatIdentifier];
      v40 = [v34 formatVersion];
      id v111 = 0;
      uint64_t v41 = [v37 loadCompositionFrom:v38 formatIdentifier:v39 formatVersion:v40 sidecarData:0 error:&v111];
      uint64_t v22 = v111;

      if (v22)
      {
        v42 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v114 = v22;
          _os_log_impl(&dword_217B65000, v42, OS_LOG_TYPE_ERROR, "PESerializationUtility persistence manager deserialized with error: %@", buf, 0xCu);
        }
      }
      if (v41)
      {
        v43 = (void *)[objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v41];
        id v44 = objc_alloc(MEMORY[0x263F5DF20]);
        v45 = [v11 fullSizeImageURL];
        id v46 = (void *)[v44 initWithMediaURL:v45 timeZoneLookup:0];

        v47 = [v11 livePhoto];
        v48 = +[PESupport repairedAsShotCompositionController:v21 forCurrentCompositionController:v43 isLivePhoto:v47 != 0 metadata:v46];

        uint64_t v20 = [v48 composition];

        uint64_t v21 = v48;
      }
      else
      {
        uint64_t v20 = 0;
      }
      id v13 = v97;

      v98 = 0;
      goto LABEL_37;
    }
LABEL_27:
    v98 = 0;
    goto LABEL_39;
  }
  if (v15) {
    int v23 = (void *)v15;
  }
  else {
    int v23 = v14;
  }
  BOOL v24 = v23;
  if (!v24) {
    goto LABEL_27;
  }
  uint64_t v21 = v24;
  uint64_t v25 = [v11 adjustmentSecondaryDataURL];

  if (!v25)
  {
LABEL_18:
    uint64_t v30 = objc_opt_new();
    v31 = [v21 data];
    id v32 = [v21 formatIdentifier];
    v33 = [v21 formatVersion];
    id v109 = 0;
    v98 = v25;
    uint64_t v20 = [v30 loadCompositionFrom:v31 formatIdentifier:v32 formatVersion:v33 sidecarData:v25 error:&v109];
    uint64_t v22 = v109;

    if (!v20)
    {
      id v49 = PLPhotoEditGetLog();
      id v13 = v97;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v22;
        _os_log_impl(&dword_217B65000, v49, OS_LOG_TYPE_ERROR, "PESerializationUtility persistence manager deserialized with error: %@", buf, 0xCu);
      }

      uint64_t v20 = 0;
      goto LABEL_37;
    }
    goto LABEL_19;
  }
  v26 = (void *)MEMORY[0x263F5D598];
  uint64_t v27 = [v11 adjustmentSecondaryDataURL];
  id v110 = 0;
  uint64_t v28 = [v26 loadFromURL:v27 error:&v110];
  uint64_t v29 = v110;

  if (v28)
  {

    uint64_t v25 = v28;
    goto LABEL_18;
  }
  id v50 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v114 = v29;
    _os_log_impl(&dword_217B65000, v50, OS_LOG_TYPE_ERROR, "PESerializationUtility sidecar data could not be loaded: %@", buf, 0xCu);
  }

  v51 = v29;
  id v52 = 0;
  *a6 = v51;
LABEL_67:

  return v52;
}

void __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F5DFA8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int64_t v5 = [v3 audiovisualAsset];
  os_signpost_id_t v6 = [v2 defaultSlowMotionAdjustmentsForAsset:v5];

  memset(&v13, 0, sizeof(v13));
  if (v6) {
    [v6 slowMotionTimeRange];
  }
  long long v11 = *(_OWORD *)&v13.start.value;
  CMTimeEpoch epoch = v13.start.epoch;
  [v4 setStartTime:&v11];
  CMTimeRange range = v13;
  CMTimeRangeGetEnd(&v10, &range);
  CMTime v8 = v10;
  [v4 setEndTime:&v8];
  [v6 slowMotionRate];
  [v4 setRate:v7];
}

uint64_t __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFocusRect:*(void *)(a1 + 32)];
}

void __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v13 = 0;
  id v3 = [a2 result:&v13];
  id v4 = v13;
  if (v4)
  {
    int64_t v5 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_217B65000, v5, OS_LOG_TYPE_ERROR, "PESerializationUtility error while running semantic style autocalc: %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (v3)
  {
    float v7 = [v3 allKeys];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *MEMORY[0x263F5D7C0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_4;
      v11[3] = &unk_2642BECF8;
      id v12 = v3;
      [v9 modifyAdjustmentWithKey:v10 modificationBlock:v11];
      int64_t v5 = v12;
LABEL_7:
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_95(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F5D618];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 rawAdjustmentWithRawImageProperties:v3];
  [v4 setFromAdjustment:v5];
}

uint64_t __90__PESerializationUtility_compositionControllerForContentEditingInput_asShot_source_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 updateWithSemStyleInfo:*(void *)(a1 + 32)];
}

+ (id)compositionControllerForContentEditingInput:(id)a3 asShot:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[PESerializationUtility editSourceForContentEditingInput:v7 useRawDisplaySizeImage:0 useEmbeddedPreview:0 error:a5];
  if (v8)
  {
    id v9 = +[PESerializationUtility compositionControllerForContentEditingInput:v7 asShot:v6 source:v8 error:a5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)editSourceForContentEditingInput:(id)a3 useRawDisplaySizeImage:(BOOL)a4 useEmbeddedPreview:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v44[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (v11)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 86, @"Invalid parameter not satisfying: %@", @"contentEditingInput != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_3;
    }
  }
  v38 = [MEMORY[0x263F08690] currentHandler];
  [v38 handleFailureInMethod:a2, a1, @"PESerializationUtility.m", 87, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [v11 mediaType];
  if ((unint64_t)(v12 - 2) < 2)
  {
    uint64_t v20 = [v11 videoURL];
    if (!v20)
    {
      int v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F07F80];
      v42 = @"Missing video URL";
      BOOL v24 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v25 = v23;
      uint64_t v26 = 2;
LABEL_20:
      *a6 = [v25 errorWithDomain:@"PESerializationUtilityErrorDomain" code:v26 userInfo:v24];

      id v14 = 0;
      id v21 = 0;
      goto LABEL_23;
    }
    id v14 = (void *)v20;
    id v21 = (id)[objc_alloc(MEMORY[0x263F5D9C8]) initWithVideoURL:v20];
  }
  else
  {
    if (v12)
    {
      if (v12 != 1)
      {
        id v21 = 0;
        goto LABEL_24;
      }
      uint64_t v13 = [v11 fullSizeImageURL];
      if (v13)
      {
        id v14 = (void *)v13;
        uint64_t v15 = [v11 uniformTypeIdentifier];
        if (v15
          && ([MEMORY[0x263F1D920] typeWithIdentifier:v15],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = [v16 conformsToType:*MEMORY[0x263F1DC60]],
              v16,
              v17)
          && !v8)
        {
          id v18 = (id)[v11 displaySizeImage];
          id v19 = 0;
        }
        else
        {
          id v19 = [v11 displaySizeImage];
        }
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F5D990]) initWithURL:v14 type:v15 image:v19 useEmbeddedPreview:v7];
        uint64_t v28 = [v11 livePhoto];
        uint64_t v29 = v28;
        if (v28)
        {
          uint64_t v30 = NSURL;
          v31 = [v28 videoComplement];
          id v32 = [v31 videoPath];
          v33 = [v30 fileURLWithPath:v32];

          id v34 = (void *)[objc_alloc(MEMORY[0x263F5D9C8]) initWithVideoURL:v33];
          id v21 = (id)[objc_alloc(MEMORY[0x263F5D930]) initWithPhotoSource:v27 videoComplement:v34];
        }
        else
        {
          id v21 = v27;
        }

        goto LABEL_23;
      }
      id v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263F07F80];
      v44[0] = @"Missing image URL";
      BOOL v24 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
      uint64_t v25 = v35;
      uint64_t v26 = 1;
      goto LABEL_20;
    }
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F07F80];
    v40 = @"Unknown media type";
    id v14 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v22 errorWithDomain:@"PESerializationUtilityErrorDomain" code:0 userInfo:v14];
    id v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_23:

LABEL_24:
  return v21;
}

+ (id)editSourceForContentEditingInput:(id)a3 useEmbeddedPreview:(BOOL)a4 error:(id *)a5
{
  return +[PESerializationUtility editSourceForContentEditingInput:a3 useRawDisplaySizeImage:1 useEmbeddedPreview:a4 error:a5];
}

+ (id)editSourceForContentEditingInput:(id)a3 error:(id *)a4
{
  return +[PESerializationUtility editSourceForContentEditingInput:a3 useRawDisplaySizeImage:0 useEmbeddedPreview:0 error:a4];
}

@end