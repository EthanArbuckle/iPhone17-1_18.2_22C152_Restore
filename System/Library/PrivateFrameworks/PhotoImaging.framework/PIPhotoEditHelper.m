@interface PIPhotoEditHelper
+ (BOOL)areCPVAssetsEditable;
+ (BOOL)canInterpretDataWithFormatIdentifier:(id)a3 formatVersion:(id)a4;
+ (BOOL)compositionHasAnyStageEffect:(id)a3;
+ (BOOL)is3DEffect:(id)a3;
+ (BOOL)isAVAssetEditable:(id)a3 reason:(int64_t *)a4;
+ (BOOL)isPortraitEffect:(id)a3;
+ (BOOL)isPortraitStageEffect:(id)a3;
+ (BOOL)updateCropAdjustmentControllerFor:(id)a3 beforeCompositionController:(id)a4 error:(id *)a5;
+ (CGImage)newCGImageFromImageBuffer:(id)a3;
+ (id)_imageRenderRequestWithComposition:(id)a3 wideGamut:(BOOL)a4;
+ (id)adjustmentConstants;
+ (id)assetIdentifierForURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5;
+ (id)compositionByRemovingVideoAndLivePhotoAdjustments:(id)a3;
+ (id)effectNameForFilterName:(id)a3;
+ (id)filterNameForEffectName:(id)a3;
+ (id)geometryBasedAdjustmentIdentifiers;
+ (id)geometryRequestWithComposition:(id)a3;
+ (id)imagePropertiesRequestWithComposition:(id)a3;
+ (id)imageRenderRequestWithComposition:(id)a3 fillInSize:(CGSize)a4 wideGamut:(BOOL)a5;
+ (id)imageRenderRequestWithComposition:(id)a3 fitInSize:(CGSize)a4 wideGamut:(BOOL)a5;
+ (id)imageSourceWithCIImage:(id)a3 orientation:(int64_t)a4;
+ (id)imageSourceWithURL:(id)a3 type:(id)a4 proxyImage:(id)a5 orientation:(int64_t)a6 useEmbeddedPreview:(BOOL)a7;
+ (id)imageSourceWithURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5;
+ (id)knownFormatsVersionsMap;
+ (id)livePhotoSourceWithPhotoSource:(id)a3 videoSource:(id)a4;
+ (id)newAdjustmentWithIdentifier:(id)a3;
+ (id)newAdjustmentWithName:(id)a3;
+ (id)newComposition;
+ (id)newCompositionControllerWithComposition:(id)a3;
+ (id)photosSchema;
+ (id)pipelineFiltersForCropping;
+ (id)pipelineFiltersForOriginalGeometry;
+ (id)pipelineFiltersForPostInpaintSegmentation;
+ (id)pipelineFiltersForPreInpaintSegmentation;
+ (id)pipelineFiltersForRAWShowingOriginalWithGeometry;
+ (id)pipelineFiltersForShowingOriginal;
+ (id)pipelineFiltersForShowingOriginalWithGeometry;
+ (id)priorityWithLevel:(int64_t)a3;
+ (id)rawAdjustmentWithRawImageProperties:(id)a3;
+ (id)stringForAutoLoopFlavor:(int64_t)a3;
+ (id)validatedCompositionCopyForComposition:(id)a3 mediaType:(int64_t)a4;
+ (id)videoPropertiesRequestWithComposition:(id)a3;
+ (id)videoRenderRequestWithComposition:(id)a3 fitInSize:(CGSize)a4;
+ (id)videoSourceWithURL:(id)a3;
+ (id)videoSourceWithVideoData:(id)a3 orientation:(int64_t)a4;
+ (void)handlePIGlobalSettings:(id)a3;
+ (void)initialize;
+ (void)preheatEditDependencies;
@end

@implementation PIPhotoEditHelper

+ (id)stringForAutoLoopFlavor:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"AutoLoop";
  }
  else {
    return off_1E5D81738[a3];
  }
}

+ (id)rawAdjustmentWithRawImageProperties:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F7A4C0]) initWithName:@"RAW"];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A488]) initWithIdentifier:v4];
  v6 = [v3 availableDecoderVersions];
  v7 = [v6 lastObject];
  [v5 setObject:v7 forKeyedSubscript:@"inputDecoderVersion"];

  v8 = +[PIFakeBoost boostParametersFromRawProperties:v3];
  if (v8)
  {
    v9 = +[PIFakeBoost currentVersion];
    [v5 setObject:v9 forKeyedSubscript:@"boostVersion"];

    [v5 setObject:v8 forKeyedSubscript:@"boostParams"];
  }
  v10 = +[PIGainMap gainMapParametersFromRawProperties:v3];
  if (v10)
  {
    v11 = +[PIGainMap currentVersion];
    [v5 setObject:v11 forKeyedSubscript:@"gainMapVersion"];

    [v5 setObject:v10 forKeyedSubscript:@"gainMapParameters"];
  }

  return v5;
}

+ (void)preheatEditDependencies
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"SkipShaderPrewarm"];

  if ((v3 & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F7A448] sharedFactory];
    v5 = [v4 visionSession];
    id v6 = objc_alloc_init(MEMORY[0x1E4F457A8]);
    v8[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v5 prepareForPerformingRequests:v7 error:0];
  }
}

+ (BOOL)updateCropAdjustmentControllerFor:(id)a3 beforeCompositionController:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [a4 composition];
  v9 = [v7 composition];
  v10 = +[PICropAutoCalculator updateCropAdjustment:v8 after:v9 error:a5];

  if (v10)
  {
    v11 = [[PICompositionController alloc] initWithComposition:v10];
    -[PICompositionController setImageOrientation:](v11, "setImageOrientation:", [v7 imageOrientation]);
    [v7 applyChangesFromCompositionController:v11];
  }
  return v10 != 0;
}

+ (BOOL)canInterpretDataWithFormatIdentifier:(id)a3 formatVersion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 knownFormatsVersionsMap];
  v9 = [v8 objectForKeyedSubscript:v6];

  int v10 = 0;
  if (v7 && v9)
  {
    v11 = +[PIPhotoEditAdjustmentsVersion versionFromString:v7];
    int v10 = [v9 containsObject:v11];
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
  }
  v12 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    v13 = @"No";
    int v16 = 138544130;
    id v17 = v6;
    if (v9) {
      v14 = @"Yes";
    }
    else {
      v14 = @"No";
    }
    v19 = v14;
    __int16 v18 = 2112;
    if (v10) {
      v13 = @"Yes";
    }
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_INFO, "Can PLPhotoEditPFDataConverter interpret identifier %{public}@? %@. Version %{public}@? %@", (uint8_t *)&v16, 0x2Au);
  }
  if (!v9) {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (id)knownFormatsVersionsMap
{
  v29[4] = *MEMORY[0x1E4F143B8];
  __int16 v20 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:0 minor:1 subMinor:0 platform:@"iOS"];
  v27 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:0 minor:2 subMinor:0 platform:@"iOS"];
  v26 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:0 minor:1 subMinor:0 platform:@"OSX"];
  v25 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:0 minor:2 subMinor:0 platform:@"OSX"];
  uint64_t v24 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:0 subMinor:0 platform:0];
  __int16 v18 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:2 subMinor:0 platform:0];
  v23 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:3 subMinor:0 platform:0];
  __int16 v22 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:4 subMinor:0 platform:0];
  int v16 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:5 subMinor:0 platform:0];
  id v17 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:5 subMinor:1 platform:0];
  v15 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:6 subMinor:0 platform:0];
  v14 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:7 subMinor:0 platform:0];
  v2 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:8 subMinor:0 platform:0];
  char v3 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:9 subMinor:0 platform:0];
  v4 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:9 subMinor:1 platform:0];
  v5 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:10 subMinor:0 platform:0];
  id v6 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:11 subMinor:0 platform:0];
  id v7 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:12 subMinor:0 platform:0];
  objc_msgSend(v20, "setWithObjects:", v19, v27, v26, v25, v24, v18, v23, v22, v16, v17, v15, v14, v2, v3, v4, v5, v6,
    v7,
  id v21 = 0);

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:0 subMinor:0 platform:0];
  int v10 = +[PIPhotoEditAdjustmentsVersion versionWithMajor:1 minor:1 subMinor:0 platform:0];
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, 0);

  v28[0] = @"com.apple.photo";
  v28[1] = @"com.apple.livephoto";
  v29[0] = v21;
  v29[1] = v21;
  v28[2] = @"com.apple.video";
  v28[3] = @"com.apple.video.slomo";
  v29[2] = v11;
  v29[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  return v12;
}

+ (id)geometryBasedAdjustmentIdentifiers
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v2 = +[PIPhotoEditHelper adjustmentConstants];
  char v3 = [v2 PICropAdjustmentKey];
  v11[0] = v3;
  v4 = [v2 PIOrientationAdjustmentKey];
  v11[1] = v4;
  v5 = [v2 PIRetouchAdjustmentKey];
  v11[2] = v5;
  id v6 = [v2 PIRedEyeAdjustmentKey];
  v11[3] = v6;
  id v7 = [v2 PIHighResFusionAdjustmentKey];
  v11[4] = v7;
  v8 = [v2 PIInpaintAdjustmentKey];
  v11[5] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

+ (id)validatedCompositionCopyForComposition:(id)a3 mediaType:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2, a1, @"PIPhotoEditHelper.m", 719, @"Invalid parameter not satisfying: %@", @"composition" object file lineNumber description];
  }
  v8 = (void *)[v7 copy];
  v9 = [a1 adjustmentConstants];
  int v10 = [v9 PIAutoLoopAdjustmentKey];
  v11 = [v8 objectForKeyedSubscript:v10];

  if (v11)
  {
    v12 = [v11 objectForKeyedSubscript:@"recipe"];

    if (!v12)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
      }
      v13 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A9680000, v13, OS_LOG_TYPE_INFO, "validation issue: recipe is blank on the autoloop adjustment", (uint8_t *)&buf, 2u);
      }
      v14 = [v9 PIAutoLoopAdjustmentKey];
      [v8 setObject:0 forKeyedSubscript:v14];

      v11 = 0;
    }
  }
  uint64_t v15 = [v11 objectForKeyedSubscript:@"flavor"];
  int v16 = (void *)v15;
  if (v11 && !v15)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
    }
    id v17 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1A9680000, v17, OS_LOG_TYPE_INFO, "validation issue: no flavor specified on the autoloop adjustment", (uint8_t *)&buf, 2u);
    }
    __int16 v18 = [v9 PIAutoLoopAdjustmentKey];
    [v8 setObject:0 forKeyedSubscript:v18];

    v11 = 0;
LABEL_17:
    char v66 = 1;
    if (!a4) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a4 != 3 || !v11) {
    goto LABEL_17;
  }
  v19 = [v11 objectForKeyedSubscript:@"enabled"];
  int v20 = [v19 BOOLValue];

  id v21 = @"AutoLoop";
  if (([v16 isEqualToString:@"AutoLoop"] & 1) == 0)
  {
    __int16 v22 = @"Mirror";
    int v23 = [v16 isEqualToString:@"Mirror"];

    if ((v23 & v20 & 1) == 0) {
      goto LABEL_23;
    }
LABEL_26:
    char v66 = 0;
    a4 = 2;
    goto LABEL_27;
  }

  if (v20) {
    goto LABEL_26;
  }
LABEL_23:
  if ([v8 mediaType] != 2)
  {
    char v66 = 1;
    goto LABEL_28;
  }
  char v66 = 1;
  a4 = 3;
LABEL_27:
  [v8 setMediaType:a4];
LABEL_28:
  uint64_t v24 = [v9 PIRedEyeAdjustmentKey];
  v25 = [v8 objectForKeyedSubscript:v24];

  if (v25)
  {
    v26 = [v25 objectForKeyedSubscript:@"inputCorrectionInfo"];

    if (!v26)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
      }
      v27 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A9680000, v27, OS_LOG_TYPE_INFO, "validation issue: Missing inputCorrectionInfo on a redeye adjustment", (uint8_t *)&buf, 2u);
      }
      v28 = [v9 PIRedEyeAdjustmentKey];
      [v8 setObject:0 forKeyedSubscript:v28];
    }
  }
  v29 = [v9 PIDepthAdjustmentKey];
  v30 = [v8 objectForKeyedSubscript:v29];

  v70 = v30;
  if (v30)
  {
    v31 = [v30 objectForKeyedSubscript:@"depthInfo"];

    if (!v31)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
      }
      v37 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A9680000, v37, OS_LOG_TYPE_INFO, "validation issue: Missing depthInfo on a depth adjustment", (uint8_t *)&buf, 2u);
      }
      v33 = [v9 PIDepthAdjustmentKey];
      [v8 setObject:0 forKeyedSubscript:v33];
      goto LABEL_47;
    }
    v32 = [v30 objectForKeyedSubscript:@"aperture"];

    if (!v32)
    {
      v33 = [v30 objectForKeyedSubscript:@"depthInfo"];
      uint64_t v34 = [v33 objectForKeyedSubscript:@"aperture"];
      v35 = (void *)v34;
      if (v34) {
        v36 = (void *)v34;
      }
      else {
        v36 = &unk_1F000A4E8;
      }
      [v30 setObject:v36 forKeyedSubscript:@"aperture"];

LABEL_47:
    }
  }
  v67 = v25;
  v69 = v11;
  v38 = [v9 PIPortraitAdjustmentKey];
  v39 = [v8 objectForKeyedSubscript:v38];

  if (v39)
  {
    v40 = [v39 objectForKeyedSubscript:@"portraitInfo"];

    if (!v40)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
      }
      v41 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_INFO, "validation issue: Missing portraitInfo on a portrait adjustment", (uint8_t *)&buf, 2u);
      }
      v42 = [v9 PIPortraitAdjustmentKey];
      [v8 setObject:0 forKeyedSubscript:v42];
    }
  }
  v68 = v16;
  v43 = [v9 PITrimAdjustmentKey];
  v44 = [v8 objectForKeyedSubscript:v43];

  if (v44)
  {
    id v64 = a1;
    id v65 = v7;
    v45 = [v44 objectForKeyedSubscript:@"start"];
    v46 = [v44 objectForKeyedSubscript:@"end"];
    v47 = [v44 objectForKeyedSubscript:@"startScale"];
    v48 = [v44 objectForKeyedSubscript:@"endScale"];
    uint64_t v49 = [v44 objectForKeyedSubscript:@"enabled"];
    v50 = (void *)v49;
    if (!v45
      || !v46
      || !v47
      || !v48
      || !v49
      || (memset(&buf, 0, sizeof(buf)),
          CMTimeMake(&buf, [v45 longLongValue], objc_msgSend(v47, "intValue")),
          memset(&v71, 0, sizeof(v71)),
          CMTimeMake(&v71, [v46 longLongValue], objc_msgSend(v48, "intValue")),
          (buf.flags & 1) == 0)
      || (v71.flags & 1) == 0)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
      }
      v51 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A9680000, v51, OS_LOG_TYPE_INFO, "validation issue: invalid trim startTime or endTime", (uint8_t *)&buf, 2u);
      }
      v52 = [v9 PITrimAdjustmentKey];
      [v8 setObject:0 forKeyedSubscript:v52];
    }
    a1 = v64;
    id v7 = v65;
  }
  v53 = [v9 PIMuteAdjustmentKey];
  id v54 = [v8 objectForKeyedSubscript:v53];

  if (v54) {
    char v55 = 1;
  }
  else {
    char v55 = v66;
  }
  if ((v55 & 1) == 0)
  {
    v56 = [a1 photosSchema];
    v57 = [v56 contents];
    v58 = [v9 PIMuteAdjustmentKey];
    [v57 objectForKeyedSubscript:v58];
    v60 = id v59 = a1;

    id v54 = +[PIPhotoEditHelper newAdjustmentWithIdentifier:v60];
    [v54 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
    v61 = [v9 PIMuteAdjustmentKey];
    [v8 setObject:v54 forKeyedSubscript:v61];

    a1 = v59;
  }
  [a1 handlePIGlobalSettings:v8];

  return v8;
}

+ (void)handlePIGlobalSettings:(id)a3
{
  id v19 = a3;
  char v3 = +[PIGlobalSettings globalSettings];
  if ([(PIDepthAdjustmentController *)v3 forceGlassesMatteOff])
  {
    v4 = [v19 objectForKeyedSubscript:@"depthEffect"];

    v5 = v19;
    if (!v4) {
      goto LABEL_5;
    }
    id v6 = [PIDepthAdjustmentController alloc];
    id v7 = [v19 objectForKeyedSubscript:@"depthEffect"];
    char v3 = [(PIDepthAdjustmentController *)v6 initWithAdjustment:v7];

    [(PIDepthAdjustmentController *)v3 setGlassesMatteAllowed:MEMORY[0x1E4F1CC28]];
  }

  v5 = v19;
LABEL_5:
  v8 = [v5 objectForKeyedSubscript:@"portraitEffect"];

  if (!v8) {
    goto LABEL_11;
  }
  v9 = +[PIGlobalSettings globalSettings];
  int v10 = [v9 forceSpillMatteOff];

  if (v10)
  {
    v11 = [PIPortraitAdjustmentController alloc];
    v12 = [v19 objectForKeyedSubscript:@"portraitEffect"];
    v13 = [(PIPortraitAdjustmentController *)v11 initWithAdjustment:v12];

    uint64_t v14 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    uint64_t v15 = +[PIGlobalSettings globalSettings];
    int v16 = [v15 allowSpillMatteOnOlderPortraitV2Captures];

    if (!v16) {
      goto LABEL_11;
    }
    id v17 = [PIPortraitAdjustmentController alloc];
    __int16 v18 = [v19 objectForKeyedSubscript:@"portraitEffect"];
    v13 = [(PIPortraitAdjustmentController *)v17 initWithAdjustment:v18];

    uint64_t v14 = MEMORY[0x1E4F1CC38];
  }
  [(PIPortraitAdjustmentController *)v13 setSpillMatteAllowed:v14];

LABEL_11:
}

+ (id)adjustmentConstants
{
  if (adjustmentConstants_once != -1) {
    dispatch_once(&adjustmentConstants_once, &__block_literal_global_328);
  }
  v2 = (void *)adjustmentConstants_adjustmentConstants;
  return v2;
}

uint64_t __40__PIPhotoEditHelper_adjustmentConstants__block_invoke()
{
  adjustmentConstants_adjustmentConstants = objc_alloc_init(PIAdjustmentConstants);
  return MEMORY[0x1F41817F8]();
}

+ (id)newCompositionControllerWithComposition:(id)a3
{
  id v3 = a3;
  v4 = [[PICompositionController alloc] initWithComposition:v3];

  return v4;
}

+ (id)pipelineFiltersForRAWShowingOriginalWithGeometry
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_326_12493];
  id v3 = +[PIPipelineFilters sourceFilterNoOrientation];
  v6[0] = v3;
  v6[1] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __69__PIPhotoEditHelper_pipelineFiltersForRAWShowingOriginalWithGeometry__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  [v7 resetTag:@"/pre-Geometry" input:a4];
  v8 = [v7 getTagWithPath:@"/post-Geometry" error:a5];

  return v8;
}

+ (id)pipelineFiltersForShowingOriginalWithGeometry
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_307];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_315];
  v4 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/ShowOriginalSource"];
  v7[0] = v4;
  v7[1] = v3;
  v7[2] = v2;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __66__PIPhotoEditHelper_pipelineFiltersForShowingOriginalWithGeometry__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  [v8 resetTag:@"/pre-Trim" input:v7];
  v9 = [v8 getTagWithPath:@"/Trim" error:a5];

  return v9;
}

id __66__PIPhotoEditHelper_pipelineFiltersForShowingOriginalWithGeometry__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  [v8 resetTag:@"/pre-Geometry" input:v7];
  v9 = [v8 getTagWithPath:@"/post-Geometry" error:a5];

  return v9;
}

+ (id)pipelineFiltersForPostInpaintSegmentation
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/Inpaint"];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)pipelineFiltersForPreInpaintSegmentation
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/Pre-Inpaint"];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)pipelineFiltersForShowingOriginal
{
  v2 = [(id)objc_opt_class() pipelineFiltersForShowingOriginalWithGeometry];
  id v3 = (void *)[v2 mutableCopy];

  v4 = +[PIPipelineFilters noCropFilter];
  [v3 addObject:v4];

  return v3;
}

+ (id)pipelineFiltersForOriginalGeometry
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PIPipelineFilters noGeometryFilter];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)pipelineFiltersForCropping
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PIPipelineFilters iosCropToolFilter];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)filterNameForEffectName:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__12510;
  v30 = __Block_byref_object_dispose__12511;
  id v31 = 0;
  v5 = [(id)s_3DEffectNames allKeys];
  if ([v5 containsObject:v4]) {
    goto LABEL_4;
  }
  id v6 = [(id)s_PortraitEffectNames allKeys];
  if ([v6 containsObject:v4])
  {

LABEL_4:
LABEL_5:
    id v7 = v27;
    id v8 = v4;
    v9 = (void *)v7[5];
    v7[5] = (uint64_t)v8;
    goto LABEL_6;
  }
  v12 = [(id)s_effectNames allKeys];
  char v13 = [v12 containsObject:v4];

  if (v13) {
    goto LABEL_5;
  }
  if ([a1 is3DEffect:v4])
  {
    uint64_t v14 = (void *)s_3DEffectNames;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke;
    v23[3] = &unk_1E5D7FF60;
    id v24 = v4;
    v25 = &v26;
    [v14 enumerateKeysAndObjectsUsingBlock:v23];
    v9 = v24;
  }
  else if ([a1 isPortraitEffect:v4])
  {
    uint64_t v15 = (void *)s_PortraitEffectNames;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_2;
    v20[3] = &unk_1E5D7FF60;
    id v21 = v4;
    __int16 v22 = &v26;
    [v15 enumerateKeysAndObjectsUsingBlock:v20];
    v9 = v21;
  }
  else
  {
    int v16 = (void *)s_effectNames;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_3;
    v17[3] = &unk_1E5D7FF60;
    id v18 = v4;
    id v19 = &v26;
    [v16 enumerateKeysAndObjectsUsingBlock:v17];
    v9 = v18;
  }
LABEL_6:

  id v10 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)effectNameForFilterName:(id)a3
{
  id v4 = a3;
  v5 = [(id)s_3DEffectNames allValues];
  if ([v5 containsObject:v4]) {
    goto LABEL_4;
  }
  id v6 = [(id)s_PortraitEffectNames allValues];
  if ([v6 containsObject:v4])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v10 = [(id)s_effectNames allValues];
  char v11 = [v10 containsObject:v4];

  if ((v11 & 1) == 0)
  {
    if ([a1 is3DEffect:v4])
    {
      v12 = (void *)s_3DEffectNames;
    }
    else if ([a1 isPortraitEffect:v4])
    {
      v12 = (void *)s_PortraitEffectNames;
    }
    else
    {
      v12 = (void *)s_effectNames;
    }
    id v7 = [v12 objectForKeyedSubscript:v4];
    goto LABEL_6;
  }
LABEL_5:
  id v7 = v4;
LABEL_6:
  id v8 = v7;

  return v8;
}

+ (BOOL)isAVAssetEditable:(id)a3 reason:(int64_t *)a4
{
  id v6 = a3;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__PIPhotoEditHelper_isAVAssetEditable_reason___block_invoke;
  v29[3] = &__block_descriptor_40_e8_v16__0q8l;
  v29[4] = a4;
  id v7 = (void (**)(void, void))MEMORY[0x1AD0F8FE0](v29);
  if ([v6 isReadable])
  {
    if ([v6 isPlayable])
    {
      if ([v6 isExportable])
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v6 timeZoneLookup:0];
        if (![v8 isHDR]) {
          goto LABEL_7;
        }
        if ([MEMORY[0x1E4F7A718] deviceSupportsHardware10BitHEVCEncoding])
        {
          if ([MEMORY[0x1E4F7A718] deviceSupportsHighDynamicRangeVideo])
          {
LABEL_7:
            id v27 = 0;
            int v9 = [MEMORY[0x1E4F7A718] isAVAssetDolbyProfile5:v6 error:&v27];
            id v10 = v27;
            if (v9)
            {
              if (*MEMORY[0x1E4F7A750] != -1) {
                dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
              }
              char v11 = *MEMORY[0x1E4F7A758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)CMTime buf = 0;
                _os_log_impl(&dword_1A9680000, v11, OS_LOG_TYPE_DEFAULT, "HDR asset not editable because editing not supported on DolbyVision 5", buf, 2u);
              }
              v7[2](v7, 6);
              goto LABEL_35;
            }
            if (+[PICinematicVideoUtilities assetIsCinematicVideo:v6])
            {
              if (*MEMORY[0x1E4F7A750] != -1) {
                dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
              }
              uint64_t v14 = *MEMORY[0x1E4F7A758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)CMTime buf = 0;
                _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_DEFAULT, "CPV asset checking for editability", buf, 2u);
              }
              if ([MEMORY[0x1E4F7A718] isAssetUnsupportedLegacyPortraitVideo:v6])
              {
                uint64_t v15 = NULogger_12515();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)CMTime buf = 0;
                  _os_log_impl(&dword_1A9680000, v15, OS_LOG_TYPE_DEFAULT, "CPV asset not editable because it's in a legacy, unsupported format", buf, 2u);
                }

                v7[2](v7, 7);
                goto LABEL_35;
              }
              id v18 = +[PIGlobalSettings editSettings];
              id v19 = [v18 objectForKey:@"overrideVideoEditability"];
              int v12 = [v19 BOOLValue];

              if (v12)
              {
                int v20 = NULogger_12515();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
LABEL_41:

LABEL_56:
                  goto LABEL_36;
                }
                *(_WORD *)CMTime buf = 0;
                id v21 = "CPV asset editable due to override";
LABEL_40:
                _os_log_impl(&dword_1A9680000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
                goto LABEL_41;
              }
              if (([a1 areCPVAssetsEditable] & 1) == 0)
              {
                v25 = NULogger_12515();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)CMTime buf = 0;
                  _os_log_impl(&dword_1A9680000, v25, OS_LOG_TYPE_DEFAULT, "CPV asset not editable because CPV assets are not editable on this device", buf, 2u);
                }

                v7[2](v7, 8);
                goto LABEL_56;
              }
              __int16 v22 = [MEMORY[0x1E4F8CC30] capabilitiesForCurrentDevice];
              uint64_t v23 = [v22 decodingSupportForAVAsset:v6];

              if (v23 != 2)
              {
                uint64_t v26 = NULogger_12515();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)CMTime buf = 0;
                  _os_log_impl(&dword_1A9680000, v26, OS_LOG_TYPE_DEFAULT, "CPV asset not editable because this asset is not playable on this device", buf, 2u);
                }

                v7[2](v7, 9);
                goto LABEL_56;
              }
              if (![MEMORY[0x1E4F7A718] deviceSupportsHardware10BitHEVCEncoding]
                || ([MEMORY[0x1E4F7A718] deviceSupportsHighDynamicRangeVideo] & 1) == 0)
              {
                int v20 = NULogger_12515();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_41;
                }
                *(_WORD *)CMTime buf = 0;
                id v21 = "CPV asset not editable because this device doesn't support HDR";
                goto LABEL_40;
              }
              id v24 = NULogger_12515();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)CMTime buf = 0;
                _os_log_impl(&dword_1A9680000, v24, OS_LOG_TYPE_DEFAULT, "CPV asset is editable", buf, 2u);
              }
            }
            LOBYTE(v12) = 1;
            goto LABEL_36;
          }
          id v17 = NULogger_12515();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CMTime buf = 0;
            _os_log_impl(&dword_1A9680000, v17, OS_LOG_TYPE_DEFAULT, "HDR asset not editable because this device doesn't support HDR", buf, 2u);
          }
        }
        else
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
          }
          int v16 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CMTime buf = 0;
            _os_log_impl(&dword_1A9680000, v16, OS_LOG_TYPE_DEFAULT, "HDR asset not editable because this device doesn't support 10-bit HEVC encoding", buf, 2u);
          }
        }
        v7[2](v7, 5);
        id v10 = 0;
LABEL_35:
        LOBYTE(v12) = 0;
LABEL_36:

        goto LABEL_17;
      }
      v7[2](v7, 4);
    }
    else
    {
      v7[2](v7, 3);
    }
  }
  else
  {
    v7[2](v7, 2);
  }
  LOBYTE(v12) = 0;
LABEL_17:

  return v12;
}

uint64_t __46__PIPhotoEditHelper_isAVAssetEditable_reason___block_invoke(uint64_t result, uint64_t a2)
{
  v2 = *(void **)(result + 32);
  if (v2) {
    void *v2 = a2;
  }
  return result;
}

+ (BOOL)areCPVAssetsEditable
{
  if (areCPVAssetsEditable_onceToken != -1) {
    dispatch_once(&areCPVAssetsEditable_onceToken, &__block_literal_global_12521);
  }
  if (areCPVAssetsEditable_hasMetalDeviceForPortrait)
  {
    v2 = [MEMORY[0x1E4F7A5E0] currentPlatform];
    char v3 = [v2 supportsANE];

    if (v3)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
      }
      id v4 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v11 = 0;
        _os_log_impl(&dword_1A9680000, v4, OS_LOG_TYPE_DEFAULT, "CPV assets are editable", v11, 2u);
      }
      return 1;
    }
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
    }
    id v6 = *MEMORY[0x1E4F7A758];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v10)
    {
      *(_WORD *)CMTime buf = 0;
      id v8 = "CPV assets aren't editable because the device has no ANE";
      int v9 = buf;
      goto LABEL_18;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
    }
    id v6 = *MEMORY[0x1E4F7A758];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v7)
    {
      __int16 v13 = 0;
      id v8 = "CPV assets aren't editable because there is no metal device with support for portrait rendering";
      int v9 = (uint8_t *)&v13;
LABEL_18:
      _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      return 0;
    }
  }
  return result;
}

void __41__PIPhotoEditHelper_areCPVAssetsEditable__block_invoke()
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v0 = MTLCreateSystemDefaultDevice();
  v1 = v0;
  if (v0)
  {
    v21[0] = v0;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(MEMORY[0x1E4F92230], "isMetalDeviceSupported:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          areCPVAssetsEditable_hasMetalDeviceForPortrait = 1;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_650);
  }
  id v8 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136315650;
    if (areCPVAssetsEditable_hasMetalDeviceForPortrait) {
      int v9 = "Yes";
    }
    else {
      int v9 = "No";
    }
    uint64_t v15 = "No";
    __int16 v16 = 2080;
    id v17 = v9;
    __int16 v18 = 2080;
    id v19 = "Yes";
    _os_log_impl(&dword_1A9680000, v8, OS_LOG_TYPE_DEFAULT, "CPV asset editability: onAppleSilicon: %s, hasMetalDeviceForPortrait: %s, oniOS: %s", buf, 0x20u);
  }
}

+ (BOOL)compositionHasAnyStageEffect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"depthEffect"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"portraitEffect"];

  if (!v5) {
    goto LABEL_7;
  }
  BOOL v7 = [v5 objectForKeyedSubscript:@"enabled"];
  char v8 = 0;
  if (![v7 BOOLValue] || !v6) {
    goto LABEL_6;
  }
  int v9 = [v6 objectForKeyedSubscript:@"enabled"];
  int v10 = [v9 BOOLValue];

  if (!v10)
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_8;
  }
  BOOL v7 = [v6 objectForKeyedSubscript:@"kind"];
  char v8 = [a1 isPortraitStageEffect:v7];
LABEL_6:

LABEL_8:
  return v8;
}

+ (BOOL)isPortraitStageEffect:(id)a3
{
  id v3 = a3;
  id v4 = [(id)s_PortraitStageEffectNames allKeys];
  if ([v4 containsObject:v3])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(id)s_PortraitStageEffectNames allValues];
    char v5 = [v6 containsObject:v3];
  }
  return v5;
}

+ (BOOL)isPortraitEffect:(id)a3
{
  id v3 = a3;
  id v4 = [(id)s_PortraitEffectNames allKeys];
  if ([v4 containsObject:v3])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(id)s_PortraitEffectNames allValues];
    char v5 = [v6 containsObject:v3];
  }
  return v5;
}

+ (BOOL)is3DEffect:(id)a3
{
  id v3 = a3;
  id v4 = [(id)s_3DEffectNames allKeys];
  if ([v4 containsObject:v3])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(id)s_3DEffectNames allValues];
    char v5 = [v6 containsObject:v3];
  }
  return v5;
}

+ (id)videoRenderRequestWithComposition:(id)a3 fitInSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    long long v11 = NUAssertLogger_12535();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)CMTime buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v15 = NUAssertLogger_12535();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific(*v13);
        int v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        __int16 v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v25 = v19;
        __int16 v26 = 2114;
        id v27 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v7 = v6;
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A708]) initWithComposition:v6];
  [v8 setColorSpace:0];
  [v8 setSampleMode:2];
  int v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A468]), "initWithTargetSize:", width, height);
  [v8 setScalePolicy:v9];

  return v8;
}

+ (id)priorityWithLevel:(int64_t)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:a3];
  return v3;
}

+ (CGImage)newCGImageFromImageBuffer:(id)a3
{
  return (CGImage *)[MEMORY[0x1E4F7A500] newCGImageFromImageBuffer:a3];
}

+ (id)_imageRenderRequestWithComposition:(id)a3 wideGamut:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v11 = NUAssertLogger_12535();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)CMTime buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v15 = NUAssertLogger_12535();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific(*v13);
        int v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        __int16 v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v25 = v19;
        __int16 v26 = 2114;
        id v27 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v6 = v5;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A4C8]) initWithComposition:v5];
  id v8 = objc_alloc_init(MEMORY[0x1E4F7A480]);
  [v7 setRegionPolicy:v8];

  if (a4) {
    [MEMORY[0x1E4F7A400] displayP3ColorSpace];
  }
  else {
  int v9 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  }
  [v7 setColorSpace:v9];
  [v7 setSampleMode:2];
  [v7 setName:@"PIPhotoEditHelper-basic-image"];

  return v7;
}

+ (id)imageRenderRequestWithComposition:(id)a3 fillInSize:(CGSize)a4 wideGamut:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (width <= 0.0 || height <= 0.0)
  {
    uint64_t v15 = NUAssertLogger_12535();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "targetSize.width > 0 && targetSize.height > 0");
      *(_DWORD *)CMTime buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_12535();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific(*v17);
        id v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        __int16 v26 = [v24 callStackSymbols];
        id v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v29 = v23;
        __int16 v30 = 2114;
        id v31 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v29 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  int v10 = v9;
  long long v11 = [a1 _imageRenderRequestWithComposition:v9 wideGamut:v5];
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A458]), "initWithTargetSize:", width, height);
  [v11 setScalePolicy:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4F7A6A8]);
  [v11 setExtentPolicy:v13];

  [v11 setName:@"PIPhotoEditHelper-fillSquare-image"];
  return v11;
}

+ (id)imageRenderRequestWithComposition:(id)a3 fitInSize:(CGSize)a4 wideGamut:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (width <= 0.0 || height <= 0.0)
  {
    uint64_t v14 = NUAssertLogger_12535();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "targetSize.width > 0 && targetSize.height > 0");
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v28 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    __int16 v18 = NUAssertLogger_12535();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        __int16 v22 = dispatch_get_specific(*v16);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        id v25 = [v23 callStackSymbols];
        __int16 v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        __int16 v30 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v28 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  int v10 = v9;
  long long v11 = [a1 _imageRenderRequestWithComposition:v9 wideGamut:v5];
  long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A468]), "initWithTargetSize:", width, height);
  [v11 setScalePolicy:v12];

  [v11 setName:@"PIPhotoEditHelper-targetSize-image"];
  return v11;
}

+ (id)videoPropertiesRequestWithComposition:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    BOOL v7 = NUAssertLogger_12535();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v11 = NUAssertLogger_12535();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v15 = dispatch_get_specific(*v9);
        BOOL v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        __int16 v18 = [v16 callStackSymbols];
        BOOL v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        id v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A700]) initWithComposition:v3];

  return v5;
}

+ (id)imagePropertiesRequestWithComposition:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    BOOL v7 = NUAssertLogger_12535();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v11 = NUAssertLogger_12535();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v15 = dispatch_get_specific(*v9);
        BOOL v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        __int16 v18 = [v16 callStackSymbols];
        BOOL v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        id v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithComposition:v3];

  return v5;
}

+ (id)geometryRequestWithComposition:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    BOOL v7 = NUAssertLogger_12535();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v11 = NUAssertLogger_12535();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v15 = dispatch_get_specific(*v9);
        BOOL v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        __int16 v18 = [v16 callStackSymbols];
        BOOL v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        id v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A498]) initWithComposition:v3];

  return v5;
}

+ (id)newAdjustmentWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    BOOL v7 = NUAssertLogger_12535();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v11 = NUAssertLogger_12535();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v15 = dispatch_get_specific(*v9);
        BOOL v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        __int16 v18 = [v16 callStackSymbols];
        BOOL v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        id v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      id v21 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A488]) initWithIdentifier:v3];

  return v5;
}

+ (id)newAdjustmentWithName:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v8 = NUAssertLogger_12535();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)CMTime buf = 138543362;
      __int16 v22 = v9;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v10 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v12 = NUAssertLogger_12535();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific(*v10);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        BOOL v19 = [v17 callStackSymbols];
        BOOL v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        __int16 v22 = v16;
        __int16 v23 = 2114;
        uint64_t v24 = v20;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      __int16 v22 = v15;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A4C0]) initWithName:v3];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A488]) initWithIdentifier:v5];

  return v6;
}

+ (id)compositionByRemovingVideoAndLivePhotoAdjustments:(id)a3
{
  id v3 = (void *)[a3 copy];
  [v3 setObject:0 forKeyedSubscript:@"slomo"];
  [v3 setObject:0 forKeyedSubscript:@"trim"];
  [v3 setObject:0 forKeyedSubscript:@"livePhotoKeyFrame"];
  [v3 setObject:0 forKeyedSubscript:@"videoPosterFrame"];
  [v3 setObject:0 forKeyedSubscript:@"highResFusion"];
  [v3 setObject:0 forKeyedSubscript:@"mute"];
  [v3 setObject:0 forKeyedSubscript:@"autoLoop"];
  [v3 setObject:0 forKeyedSubscript:@"videoStabilize"];
  [v3 setObject:0 forKeyedSubscript:@"videoCrossfadeLoop"];
  return v3;
}

+ (id)newComposition
{
  v2 = +[PISchema registeredPhotosSchemaIdentifier];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F7A490]) initWithIdentifier:v2];

  return v3;
}

+ (id)photosSchema
{
  return +[PICompositionController photosSchema];
}

+ (id)livePhotoSourceWithPhotoSource:(id)a3 videoSource:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v17 = NUAssertLogger_12535();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "photoSource != nil");
      id v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v21 = NUAssertLogger_12535();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        __int16 v30 = dispatch_get_specific(*v19);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        BOOL v19 = [v31 callStackSymbols];
        v33 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v40 = (const void **)v30;
        __int16 v41 = 2114;
        v42 = v33;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      __int16 v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v19 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v40 = v19;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v27 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  BOOL v7 = v6;
  if (!v6)
  {
    uint64_t v24 = NUAssertLogger_12535();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoSource != nil");
      uint64_t v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v40 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v19 = (const void **)MEMORY[0x1E4F7A308];
    __int16 v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v21 = NUAssertLogger_12535();
    int v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543362;
        v40 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v27)
    {
      uint64_t v34 = dispatch_get_specific(*v19);
      v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      v37 = [v35 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543618;
      v40 = (const void **)v34;
      __int16 v41 = 2114;
      v42 = v38;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    _NUAssertFailHandler();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  id v9 = NSString;
  int v10 = [v5 assetIdentifier];
  long long v11 = [v7 assetIdentifier];
  BOOL v12 = [v9 stringWithFormat:@"%@+%@", v10, v11];
  [v8 setAssetIdentifier:v12];

  BOOL v13 = [v5 definition];
  uint64_t v14 = [v7 definition];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A548]) initWithImageSourceDefinition:v13 videoSourceDefinition:v14];
  [v8 setDefinition:v15];

  return v8;
}

+ (id)videoSourceWithVideoData:(id)a3 orientation:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v11 = NUAssertLogger_12535();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoData != nil");
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v15 = NUAssertLogger_12535();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v19 = dispatch_get_specific(*v13);
        BOOL v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        BOOL v22 = [v20 callStackSymbols];
        __int16 v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        uint64_t v25 = v19;
        __int16 v26 = 2114;
        int v27 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v25 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  id v8 = objc_msgSend(v6, "nu_digest");
  [v7 setAssetIdentifier:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A6E8]) initWithVideoData:v6 orientation:a4];
  [v7 setDefinition:v9];

  return v7;
}

+ (id)videoSourceWithURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v13 = NUAssertLogger_12535();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      *(_DWORD *)CMTime buf = 138543362;
      int v27 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v17 = NUAssertLogger_12535();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v21 = dispatch_get_specific(*v15);
        BOOL v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        int v27 = v21;
        __int16 v28 = 2114;
        __int16 v29 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      BOOL v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      int v27 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = v4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  id v7 = [(id)*MEMORY[0x1E4F44520] identifier];
  id v8 = [a1 assetIdentifierForURL:v5 type:v7 useEmbeddedPreview:0];
  [v6 setAssetIdentifier:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F7A450]);
  int v10 = [(id)*MEMORY[0x1E4F44448] identifier];
  long long v11 = (void *)[v9 initWithURL:v5 UTI:v10];

  [v6 setDefinition:v11];
  return v6;
}

+ (id)imageSourceWithCIImage:(id)a3 orientation:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = NUAssertLogger_12535();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      BOOL v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v39 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v19 = NUAssertLogger_12535();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        __int16 v28 = dispatch_get_specific(*v17);
        __int16 v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        id v17 = [v29 callStackSymbols];
        uint64_t v31 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v39 = (const void **)v28;
        __int16 v40 = 2114;
        __int16 v41 = v31;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v39 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  id v6 = v5;
  if ((NUOrientationIsValid() & 1) == 0)
  {
    BOOL v22 = NUAssertLogger_12535();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      id v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v17 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v19 = NUAssertLogger_12535();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        __int16 v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543362;
        v39 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v25)
    {
      id v32 = dispatch_get_specific(*v17);
      v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      v35 = [v33 callStackSymbols];
      id v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543618;
      v39 = (const void **)v32;
      __int16 v40 = 2114;
      __int16 v41 = v36;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    _NUAssertFailHandler();
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  id v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  [v7 setAssetIdentifier:v9];

  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A3C8]) initWithCIImage:v6 orientation:a4];
  id v11 = objc_alloc(MEMORY[0x1E4F7A578]);
  v37 = v10;
  BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  BOOL v13 = (void *)[v11 initWithSourceDefinitions:v12];
  [v7 setDefinition:v13];

  return v7;
}

+ (id)imageSourceWithURL:(id)a3 type:(id)a4 proxyImage:(id)a5 orientation:(int64_t)a6 useEmbeddedPreview:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    uint64_t v24 = NUAssertLogger_12535();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      int v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v57 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    __int16 v28 = NUAssertLogger_12535();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        uint64_t v42 = dispatch_get_specific(*v26);
        uint64_t v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        __int16 v26 = [v43 callStackSymbols];
        v45 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v57 = (const void **)v42;
        __int16 v58 = 2114;
        id v59 = v45;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      id v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v26 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v57 = v26;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v34 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  uint64_t v15 = v14;
  if (!v14)
  {
    uint64_t v31 = NUAssertLogger_12535();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      id v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v57 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v26 = (const void **)MEMORY[0x1E4F7A308];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    __int16 v28 = NUAssertLogger_12535();
    int v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v26 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543362;
        v57 = v26;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_27:

      int v39 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v34)
    {
      v46 = dispatch_get_specific(*v26);
      v47 = (void *)MEMORY[0x1E4F29060];
      id v48 = v46;
      __int16 v26 = [v47 callStackSymbols];
      uint64_t v49 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543618;
      v57 = (const void **)v46;
      __int16 v58 = 2114;
      id v59 = v49;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if ((NUOrientationIsValid() & 1) == 0)
  {
    id v36 = NUAssertLogger_12535();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTime buf = 138543362;
      v57 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v26 = (const void **)MEMORY[0x1E4F7A308];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    __int16 v28 = NUAssertLogger_12535();
    int v39 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        __int16 v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543362;
        v57 = v41;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v39)
    {
      v50 = dispatch_get_specific(*v26);
      v51 = (void *)MEMORY[0x1E4F29060];
      id v52 = v50;
      v53 = [v51 callStackSymbols];
      id v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543618;
      v57 = (const void **)v50;
      __int16 v58 = 2114;
      id v59 = v54;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  id v17 = [a1 assetIdentifierForURL:v12 type:v13 useEmbeddedPreview:v7];
  [v16 setAssetIdentifier:v17];

  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F7A450]) initWithURL:v12 UTI:v13];
  [v18 setUseEmbeddedPreview:v7];
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A3C8]) initWithCIImage:v15 orientation:a6];
  id v20 = objc_alloc(MEMORY[0x1E4F7A578]);
  v55[0] = v18;
  v55[1] = v19;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  BOOL v22 = (void *)[v20 initWithSourceDefinitions:v21];
  [v16 setDefinition:v22];

  return v16;
}

+ (id)imageSourceWithURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    BOOL v18 = NUAssertLogger_12535();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      *(_DWORD *)CMTime buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v22 = NUAssertLogger_12535();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        __int16 v26 = dispatch_get_specific(*v20);
        int v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        BOOL v29 = [v27 callStackSymbols];
        id v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  int v10 = v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
  id v12 = [a1 assetIdentifierForURL:v8 type:v10 useEmbeddedPreview:v5];
  [v11 setAssetIdentifier:v12];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F7A450]) initWithURL:v8 UTI:v10];
  [v13 setUseEmbeddedPreview:v5];
  id v14 = objc_alloc(MEMORY[0x1E4F7A578]);
  uint64_t v31 = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  id v16 = (void *)[v14 initWithSourceDefinitions:v15];
  [v11 setDefinition:v16];

  return v11;
}

+ (id)assetIdentifierForURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v19 = 0;
  [v7 getResourceValue:&v19 forKey:*MEMORY[0x1E4F1C530] error:0];
  [v19 timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;
  if (!v8
    || (([MEMORY[0x1E4F442D8] typeWithIdentifier:v8],
         id v11 = objc_claimAutoreleasedReturnValue(),
         int v12 = [v11 conformsToType:*MEMORY[0x1E4F44498]],
         v11,
         v12)
      ? (BOOL v13 = !v5)
      : (BOOL v13 = 1),
        v13))
  {
    id v14 = NSString;
    id v16 = [v7 absoluteString];
    [v14 stringWithFormat:@"%@ %a", v16, v10];
  }
  else
  {
    uint64_t v15 = NSString;
    id v16 = [v7 absoluteString];
    [v15 stringWithFormat:@"%@ (preview) %a", v16, v10];
  id v17 = };

  return v17;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)s_effectNames;
    s_effectNames = (uint64_t)&unk_1F000ADA0;

    id v3 = (void *)s_3DEffectNames;
    s_3DEffectNames = (uint64_t)&unk_1F000ADC8;

    id v4 = (void *)s_PortraitStageEffectNames;
    s_PortraitStageEffectNames = (uint64_t)&unk_1F000ADF0;

    id v7 = (id)[&unk_1F000AE18 mutableCopy];
    [v7 addEntriesFromDictionary:&unk_1F000ADF0];
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
    id v6 = (void *)s_PortraitEffectNames;
    s_PortraitEffectNames = v5;
  }
}

@end