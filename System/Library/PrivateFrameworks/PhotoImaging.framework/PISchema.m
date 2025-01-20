@interface PISchema
+ (NUIdentifier)identifier;
+ (id)apertureRedEyeSchema;
+ (id)autoLoopSchema;
+ (id)cinematicAudioSchema;
+ (id)cropSchema;
+ (id)curvesSchema;
+ (id)debugSchema;
+ (id)definitionSchema;
+ (id)depthEffectSchema;
+ (id)effect3DSchema;
+ (id)effectSchema;
+ (id)grainSchema;
+ (id)highResFusionSchema;
+ (id)inpaintMasksSchema;
+ (id)inpaintSchema;
+ (id)levelsSchema;
+ (id)livePhotoKeyFrameSchema;
+ (id)muteSchema;
+ (id)noiseReductionSchema;
+ (id)orientationSchema;
+ (id)photosCompositionSchema;
+ (id)photosSchema;
+ (id)portraitEffectSchema;
+ (id)portraitVideoSchema;
+ (id)rawNoiseReductionSchema;
+ (id)rawSchema;
+ (id)redEyeSchema;
+ (id)registerPhotosSchema;
+ (id)registeredPhotosSchemaIdentifier;
+ (id)retouchSchema;
+ (id)selectiveColorSchema;
+ (id)semanticEnhance;
+ (id)semanticStyleSchema;
+ (id)sharpenSchema;
+ (id)slomoSchema;
+ (id)smartBlackAndWhiteSchema;
+ (id)smartColorSchema;
+ (id)smartToneSchema;
+ (id)trimSchema;
+ (id)videoCrossfadeLoopSchema;
+ (id)videoPosterFrameSchema;
+ (id)videoStabilizeSchema;
+ (id)vignetteSchema;
+ (id)whiteBalanceSchema;
@end

@implementation PISchema

+ (NUIdentifier)identifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A4C0]) initWithName:@"PhotosComposition"];
  return (NUIdentifier *)v2;
}

+ (id)registerPhotosSchema
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = +[PISchema photosSchema];
  v4 = [MEMORY[0x1E4F7A690] sharedRegistry];
  id v27 = 0;
  char v5 = [v4 registerSchemas:v3 error:&v27];
  id v6 = v27;

  if (v5)
  {
    v7 = [MEMORY[0x1E4F7A3E0] registry];
    [v7 registerClass:objc_opt_class() forCacheNodeType:@"AutoLoop"];

    v8 = [MEMORY[0x1E4F7A3E0] registry];
    [v8 registerClass:objc_opt_class() forCacheNodeType:@"Retouch"];

    v9 = [MEMORY[0x1E4F7A3E0] registry];
    [v9 registerClass:objc_opt_class() forCacheNodeType:@"Inpaint"];

    v10 = objc_alloc_init(PIModernPhotosPipeline);
    v11 = [a1 identifier];
    v12 = [MEMORY[0x1E4F7A630] sharedRegistry];
    [v12 registerRenderPipeline:v10 forIdentifier:v11];

    return v11;
  }
  else
  {
    v14 = NUAssertLogger_23148();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [NSString stringWithFormat:@"failed to register %@: %@", v3, v6];
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v18 = NUAssertLogger_23148();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v22;
        __int16 v30 = 2114;
        v31 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    return NUAssertLogger_23148();
  }
}

+ (id)registeredPhotosSchemaIdentifier
{
  v3 = [a1 identifier];
  v4 = [MEMORY[0x1E4F7A630] sharedRegistry];
  char v5 = [v4 renderPipelineForIdentifier:v3];

  if (!v5)
  {
    id v6 = a1;
    objc_sync_enter(v6);
    v7 = [MEMORY[0x1E4F7A630] sharedRegistry];
    v8 = [v7 renderPipelineForIdentifier:v3];

    if (!v8) {
      id v9 = (id)[v6 registerPhotosSchema];
    }
    objc_sync_exit(v6);
  }
  return v3;
}

+ (id)photosCompositionSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000EFE0 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)photosSchema
{
  v44[40] = *MEMORY[0x1E4F143B8];
  v43 = +[PISchema photosCompositionSchema];
  v44[0] = v43;
  v42 = +[PISchema rawSchema];
  v44[1] = v42;
  v41 = +[PISchema rawNoiseReductionSchema];
  v44[2] = v41;
  v40 = +[PISchema retouchSchema];
  v44[3] = v40;
  v39 = +[PISchema inpaintSchema];
  v44[4] = v39;
  v38 = +[PISchema inpaintMasksSchema];
  v44[5] = v38;
  v37 = +[PISchema smartToneSchema];
  v44[6] = v37;
  v36 = +[PISchema smartColorSchema];
  v44[7] = v36;
  v35 = +[PISchema whiteBalanceSchema];
  v44[8] = v35;
  v34 = +[PISchema cropSchema];
  v44[9] = v34;
  v33 = +[PISchema trimSchema];
  v44[10] = v33;
  uint64_t v32 = +[PISchema slomoSchema];
  v44[11] = v32;
  v31 = +[PISchema livePhotoKeyFrameSchema];
  v44[12] = v31;
  __int16 v30 = +[PISchema muteSchema];
  v44[13] = v30;
  v29 = +[PISchema videoPosterFrameSchema];
  v44[14] = v29;
  v28 = +[PISchema autoLoopSchema];
  v44[15] = v28;
  id v27 = +[PISchema orientationSchema];
  v44[16] = v27;
  v26 = +[PISchema effectSchema];
  v44[17] = v26;
  v25 = +[PISchema redEyeSchema];
  v44[18] = v25;
  uint64_t v24 = +[PISchema apertureRedEyeSchema];
  v44[19] = v24;
  v23 = +[PISchema smartBlackAndWhiteSchema];
  v44[20] = v23;
  __int16 v22 = +[PISchema grainSchema];
  v44[21] = v22;
  v21 = +[PISchema sharpenSchema];
  v44[22] = v21;
  v20 = +[PISchema definitionSchema];
  v44[23] = v20;
  id v19 = +[PISchema noiseReductionSchema];
  v44[24] = v19;
  v18 = +[PISchema vignetteSchema];
  v44[25] = v18;
  v17 = +[PISchema levelsSchema];
  v44[26] = v17;
  id v16 = +[PISchema curvesSchema];
  v44[27] = v16;
  v15 = +[PISchema selectiveColorSchema];
  v44[28] = v15;
  v14 = +[PISchema depthEffectSchema];
  v44[29] = v14;
  v2 = +[PISchema effect3DSchema];
  v44[30] = v2;
  id v3 = +[PISchema portraitEffectSchema];
  v44[31] = v3;
  id v4 = +[PISchema highResFusionSchema];
  v44[32] = v4;
  char v5 = +[PISchema videoStabilizeSchema];
  v44[33] = v5;
  id v6 = +[PISchema videoCrossfadeLoopSchema];
  v44[34] = v6;
  v7 = +[PISchema debugSchema];
  v44[35] = v7;
  v8 = +[PISchema semanticEnhance];
  v44[36] = v8;
  id v9 = +[PISchema semanticStyleSchema];
  v44[37] = v9;
  v10 = +[PISchema portraitVideoSchema];
  v44[38] = v10;
  BOOL v11 = +[PISchema cinematicAudioSchema];
  v44[39] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:40];

  return v13;
}

+ (id)cinematicAudioSchema
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v33[0] = @"isa";
  v33[1] = @"identifier";
  v34[0] = @"Adjustment";
  v34[1] = @"CinematicAudio~1.0";
  v33[2] = @"settings";
  v31[0] = @"enabled";
  v31[1] = @"dialogMixBias";
  v32[0] = &unk_1F000EF68;
  v32[1] = &unk_1F000EF90;
  v31[2] = @"renderingStyle";
  v30[0] = @"enum";
  v29[0] = @"isa";
  v29[1] = @"values";
  v28[0] = @"original";
  v28[1] = @"voice";
  v28[2] = @"studioVoice";
  v28[3] = @"onCameraVoice";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  v29[2] = @"default";
  v30[1] = v2;
  v30[2] = @"original";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v32[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v34[2] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

  id v23 = 0;
  id v6 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:v5 error:&v23];
  id v7 = v23;
  id v8 = v7;
  if (!v6)
  {
    v10 = NUAssertLogger_23148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v8];
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v14 = NUAssertLogger_23148();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        __int16 v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        __int16 v26 = 2114;
        id v27 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v6;
}

+ (id)portraitVideoSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000EF40 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)semanticStyleSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000EE00 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)semanticEnhance
{
  v42[3] = *MEMORY[0x1E4F143B8];
  v41[0] = @"isa";
  v41[1] = @"identifier";
  v42[0] = @"Adjustment";
  v42[1] = @"SemanticEnhance~1.0";
  v41[2] = @"settings";
  v39[0] = @"enabled";
  v39[1] = @"intensity";
  v40[0] = &unk_1F000EA90;
  v40[1] = &unk_1F000EAB8;
  v39[2] = @"sceneLabel";
  v39[3] = @"sceneConfidence";
  v40[2] = &unk_1F000EAE0;
  v40[3] = &unk_1F000EB08;
  v39[4] = @"boundingBoxes";
  v38[0] = @"array";
  v37[0] = @"isa";
  v37[1] = @"content";
  v35[0] = @"isa";
  v35[1] = @"properties";
  v36[0] = @"compound";
  v36[1] = &unk_1F000EA68;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v37[2] = @"required";
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  v38[1] = v2;
  v38[2] = MEMORY[0x1E4F1CC28];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v40[4] = v4;
  v39[5] = @"faceBoundingBoxes";
  v34[0] = @"array";
  v33[0] = @"isa";
  v33[1] = @"content";
  v31[0] = @"isa";
  v31[1] = @"properties";
  v32[0] = @"compound";
  v32[1] = &unk_1F000EA68;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v33[2] = @"required";
  v34[1] = v5;
  v34[2] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  v40[5] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:6];
  v42[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

  id v26 = 0;
  id v9 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:v8 error:&v26];
  id v10 = v26;
  id v11 = v10;
  if (!v9)
  {
    id v13 = NUAssertLogger_23148();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v11];
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_23148();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        __int16 v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        __int16 v29 = 2114;
        __int16 v30 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v9;
}

+ (id)debugSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000E9A0 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)videoCrossfadeLoopSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000E748 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)videoStabilizeSchema
{
  void v38[3] = *MEMORY[0x1E4F143B8];
  v37[0] = @"isa";
  v37[1] = @"identifier";
  v38[0] = @"Adjustment";
  v38[1] = @"VideoStabilize~1.0";
  v37[2] = @"settings";
  v36[0] = &unk_1F000E540;
  v35[0] = @"enabled";
  v35[1] = @"keyframes";
  v33[1] = @"content";
  v34[0] = @"array";
  v31[0] = @"isa";
  v31[1] = @"properties";
  v32[0] = @"compound";
  v32[1] = &unk_1F000E450;
  v33[0] = @"isa";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v34[1] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v36[1] = v3;
  void v35[2] = @"stabCropRect";
  v29[0] = @"isa";
  v29[1] = @"properties";
  v30[0] = @"compound";
  v30[1] = &unk_1F000E518;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  void v36[2] = v4;
  v36[3] = &unk_1F000E568;
  v35[3] = @"cropFraction";
  v35[4] = @"analysisType";
  v36[4] = &unk_1F000E590;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];
  v38[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

  id v24 = 0;
  id v7 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:v6 error:&v24];
  id v8 = v24;
  id v9 = v8;
  if (!v7)
  {
    BOOL v11 = NUAssertLogger_23148();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v9];
      *(_DWORD *)buf = 138543362;
      id v26 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v15 = NUAssertLogger_23148();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        id v19 = dispatch_get_specific(*v13);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        __int16 v22 = [v20 callStackSymbols];
        id v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v26 = v19;
        __int16 v27 = 2114;
        v28 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v26 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v7;
}

+ (id)selectiveColorSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000E388 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)curvesSchema
{
  v53[3] = *MEMORY[0x1E4F143B8];
  v52[0] = @"isa";
  v52[1] = @"identifier";
  v53[0] = @"Adjustment";
  v53[1] = @"Curves";
  v52[2] = @"settings";
  v51[0] = &unk_1F000E158;
  v50[0] = @"enabled";
  v50[1] = @"pointsR";
  v49[0] = @"array";
  v48[0] = @"isa";
  v48[1] = @"content";
  v46[0] = @"isa";
  v46[1] = @"properties";
  v47[0] = @"compound";
  v47[1] = &unk_1F000E130;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v49[1] = v28;
  __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  v51[1] = v27;
  v50[2] = @"pointsG";
  v44[1] = @"content";
  v45[0] = @"array";
  v43[1] = &unk_1F000E130;
  v44[0] = @"isa";
  v42[0] = @"isa";
  v42[1] = @"properties";
  v43[0] = @"compound";
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  v45[1] = v26;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
  v51[2] = v2;
  v50[3] = @"pointsB";
  v40[1] = @"content";
  v41[0] = @"array";
  v39[1] = &unk_1F000E130;
  v40[0] = @"isa";
  v38[0] = @"isa";
  v38[1] = @"properties";
  v39[0] = @"compound";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v41[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  v51[3] = v4;
  v50[4] = @"pointsL";
  v36[1] = @"content";
  v37[0] = @"array";
  v35[1] = &unk_1F000E130;
  v36[0] = @"isa";
  v34[0] = @"isa";
  v34[1] = @"properties";
  v35[0] = @"compound";
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  v37[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  v50[5] = @"auto";
  v51[4] = v6;
  v51[5] = &unk_1F000E180;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:6];
  v53[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];

  id v29 = 0;
  id v9 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:v8 error:&v29];
  id v10 = v29;
  id v11 = v10;
  if (!v9)
  {
    id v13 = NUAssertLogger_23148();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v11];
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_23148();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v21 = dispatch_get_specific(*v15);
        __int16 v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v9;
}

+ (id)levelsSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000E090 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)whiteBalanceSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D988 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)noiseReductionSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D690 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)definitionSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D5A0 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)orientationSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D4D8 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)vignetteSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D460 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)inpaintMasksSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D348 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)inpaintSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000D2F8 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)retouchSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000CE20 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)apertureRedEyeSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C948 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)redEyeSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C7B8 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)effectSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C6C8 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)portraitEffectSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C5D8 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)effect3DSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C498 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)depthEffectSchema
{
  void v32[3] = *MEMORY[0x1E4F143B8];
  v31[0] = @"isa";
  v31[1] = @"identifier";
  v32[0] = @"Adjustment";
  v32[1] = @"DepthEffect~1.0";
  void v31[2] = @"settings";
  v29[0] = @"enabled";
  v29[1] = @"glassesMatteAllowed";
  v30[0] = &unk_1F000C330;
  v30[1] = &unk_1F000C358;
  void v30[2] = &unk_1F000C380;
  void v29[2] = @"aperture";
  void v29[3] = @"focusRect";
  v27[0] = @"isa";
  v27[1] = @"properties";
  v28[0] = @"compound";
  v28[1] = &unk_1F000C308;
  v27[2] = @"required";
  v28[2] = MEMORY[0x1E4F1CC28];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v29[4] = @"depthInfo";
  void v30[3] = v2;
  v30[4] = &unk_1F000C3A8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
  void v32[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

  id v22 = 0;
  char v5 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:v4 error:&v22];
  id v6 = v22;
  id v7 = v6;
  if (!v5)
  {
    id v9 = NUAssertLogger_23148();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v7];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v10;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v13 = NUAssertLogger_23148();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific(*v11);
        BOOL v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        id v20 = [v18 callStackSymbols];
        id v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v17;
        __int16 v25 = 2114;
        id v26 = v21;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v16;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v5;
}

+ (id)highResFusionSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C240 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)autoLoopSchema
{
  void v34[3] = *MEMORY[0x1E4F143B8];
  v33[0] = @"isa";
  v33[1] = @"identifier";
  v34[0] = @"Adjustment";
  v34[1] = @"AutoLoop~1.0";
  void v33[2] = @"settings";
  v31[0] = @"enabled";
  v31[1] = @"recipe";
  v32[0] = &unk_1F000C178;
  v32[1] = &unk_1F000C1A0;
  void v31[2] = @"flavor";
  v30[0] = @"enum";
  v29[0] = @"isa";
  v29[1] = @"values";
  v28[0] = @"AutoLoop";
  v28[1] = @"Mirror";
  v28[2] = @"LongExposure";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  void v29[2] = @"default";
  v30[1] = v2;
  void v30[2] = @"AutoLoop";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  void v32[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  void v34[2] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

  id v23 = 0;
  id v6 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:v5 error:&v23];
  id v7 = v23;
  id v8 = v7;
  if (!v6)
  {
    id v10 = NUAssertLogger_23148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v8];
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v14 = NUAssertLogger_23148();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        BOOL v18 = dispatch_get_specific(*v12);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        id v21 = [v19 callStackSymbols];
        __int16 v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v25 = v18;
        __int16 v26 = 2114;
        __int16 v27 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v6;
}

+ (id)videoPosterFrameSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C150 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)muteSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C0B0 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)livePhotoKeyFrameSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000C038 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)slomoSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000BF98 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)trimSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000BE80 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)cropSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000BD68 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)sharpenSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000BB60 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)grainSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000BA48 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)smartBlackAndWhiteSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000B958 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)smartColorSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000B7F0 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)smartToneSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000B610 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)rawNoiseReductionSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000B2C8 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

+ (id)rawSchema
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v2 = [MEMORY[0x1E4F7A688] deserializeFromDictionary:&unk_1F000B160 error:&v19];
  id v3 = v19;
  id v4 = v3;
  if (!v2)
  {
    id v6 = NUAssertLogger_23148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to register schema %@: %@", 0, v4];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_23148();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        BOOL v14 = dispatch_get_specific(*v8);
        BOOL v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        BOOL v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2114;
        id v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }

  return v2;
}

@end