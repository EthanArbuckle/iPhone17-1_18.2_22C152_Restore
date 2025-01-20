@interface RawDFNetworkStage
+ (int)prewarmShaders:(id)a3;
- (NSArray)tuningParams;
- (RawDFNetworkStage)initWithMetal:(id)a3 isV2:(BOOL)a4;
- (id)availableImagingNetworksWithExtension:(id)a3;
- (id)getFilePathForNetworkIdentifier:(id)a3 withExtension:(id)a4;
- (int)getFinalProcessingStatus;
- (int)networkTypeForPipeline:(int)a3 frameMeta:(DeepFusionFrameMeta *)a4;
- (int)resetFinalProcessingStatus;
- (int)runWithSyntheticLong:(id)a3 syntheticReference:(id)a4 syntheticEV0FusionMap:(id)a5 syntheticLongFusionMap:(id)a6 syntheticReferenceFusionMap:(id)a7 lscGains:(id)a8 skyMask:(id)a9 skinMask:(id)a10 frameMeta:(DeepFusionFrameMeta *)a11 outputLumaTexture:(id)a12 outputChromaTexture:(id)a13;
- (int)setupNetworkStagesForNetworkType:(int)a3 isV2:(BOOL)a4;
- (void)setTuningParams:(id)a3;
@end

@implementation RawDFNetworkStage

- (RawDFNetworkStage)initWithMetal:(id)a3 isV2:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RawDFNetworkStage;
  v7 = [(RawDFNetworkStage *)&v16 init];
  if (!v7
    || (uint64_t v8 = objc_opt_new(),
        shared = v7->_shared,
        v7->_shared = (RawDFNetworkStageShared *)v8,
        shared,
        (v10 = v7->_shared) == 0))
  {
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_8:
    v12 = 0;
    goto LABEL_4;
  }
  [(RawDFNetworkStageShared *)v10 setMetal:v6];
  v7->_loadedNetworkType = 3;
  int v11 = [(RawDFNetworkStage *)v7 setupNetworkStagesForNetworkType:1 isV2:v4];
  v12 = v7;
  if (v11)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
LABEL_4:
  v13 = v12;

  return v13;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[FusionNetworkPreANEStage alloc] initWithMetal:v3 isV2:0];

  if (v4
    && (v5 = [[FusionNetworkPreANEStage alloc] initWithMetal:v3 isV2:1], v5, v5)&& (id v6 = [[FusionNetworkPostANEStage alloc] initWithMetal:v3], v6, v6)&& (v7 = [[ACNetworkPostANEStage alloc] initWithMetal:v3], v7, v7))
  {
    int v8 = 0;
  }
  else
  {
    FigDebugAssert3();
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v8 = -12786;
  }

  return v8;
}

- (int)networkTypeForPipeline:(int)a3 frameMeta:(DeepFusionFrameMeta *)a4
{
  v5 = [(NSArray *)self->_tuningParams objectAtIndexedSubscript:a4->zoom > 1.0];
  id v6 = &OBJC_IVAR___RawDFNetworkStageTuningParams__networkTypeInLowLight;
  if ((float)(a4->syntheticLongExposure.gain * a4->syntheticLongExposure.exposure_time) < v5[5]) {
    id v6 = &OBJC_IVAR___RawDFNetworkStageTuningParams__networkTypeInBrightLight;
  }
  int v7 = *(_DWORD *)((char *)v5 + *v6);

  return v7;
}

- (int)runWithSyntheticLong:(id)a3 syntheticReference:(id)a4 syntheticEV0FusionMap:(id)a5 syntheticLongFusionMap:(id)a6 syntheticReferenceFusionMap:(id)a7 lscGains:(id)a8 skyMask:(id)a9 skinMask:(id)a10 frameMeta:(DeepFusionFrameMeta *)a11 outputLumaTexture:(id)a12 outputChromaTexture:(id)a13
{
  v60[19] = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v19 = a4;
  id v20 = a5;
  id v54 = a6;
  id v53 = a7;
  id v52 = a8;
  id v21 = a9;
  id v51 = a10;
  id v22 = a12;
  id v23 = a13;
  v24 = v23;
  if (!v22) {
    goto LABEL_24;
  }
  if (!v23) {
    goto LABEL_24;
  }
  if (![v22 width]) {
    goto LABEL_24;
  }
  if (![v22 height]) {
    goto LABEL_24;
  }
  uint64_t v25 = [v24 width];
  if (v25 != (unint64_t)[v22 width] >> 1) {
    goto LABEL_24;
  }
  uint64_t v26 = [v24 height];
  if (v26 != (unint64_t)[v22 height] >> 1 || !self->_tuningParams) {
    goto LABEL_24;
  }
  id v27 = v21;
  id v50 = v20;
  id v28 = v19;
  uint64_t v29 = [(RawDFNetworkStage *)self networkTypeForPipeline:0 frameMeta:a11];
  tuningParams = self->_tuningParams;
  unsigned int v31 = [v22 width];
  double v32 = COERCE_DOUBLE(__PAIR64__([v22 height], v31));
  int v33 = +[RawDFNetworkStageTuningParams calculateShaderUniformsForNetworkPipeline:0 tuningParams:tuningParams networkType:v29 frameMeta:a11 textureDimensions:[(RawDFNetworkStageShared *)self->_shared shaderUniforms] outNetworkUniforms:v32];
  if (v33)
  {
    int v46 = v33;
    FigDebugAssert3();
    id v19 = v28;
    id v20 = v50;
    id v21 = v27;
    goto LABEL_19;
  }
  [(RawDFNetworkStageShared *)self->_shared setInputSyntheticLong:v55];
  id v19 = v28;
  [(RawDFNetworkStageShared *)self->_shared setInputSyntheticReference:v28];
  id v20 = v50;
  [(RawDFNetworkStageShared *)self->_shared setInputSyntheticEV0FusionMap:v50];
  [(RawDFNetworkStageShared *)self->_shared setInputSyntheticLongFusionMap:v54];
  [(RawDFNetworkStageShared *)self->_shared setInputSyntheticReferenceFusionMap:v53];
  [(RawDFNetworkStageShared *)self->_shared setInputLSCGainsTexture:v52];
  [(RawDFNetworkStageShared *)self->_shared setInputSkinMask:v51];
  id v21 = v27;
  [(RawDFNetworkStageShared *)self->_shared setInputSkyMask:v27];
  [(RawDFNetworkStageShared *)self->_shared setOutputLumaTexture:v22];
  [(RawDFNetworkStageShared *)self->_shared setOutputChromaTexture:v24];
  int v34 = [(RawDFNetworkStage *)self setupNetworkStagesForNetworkType:v29 isV2:a11->deviceGeneration > 199];
  if (v34)
  {
    int v46 = v34;
    FigDebugAssert3();
    goto LABEL_19;
  }
  id v35 = objc_alloc(MEMORY[0x263F2EDE0]);
  v36 = [(RawDFNetworkStageShared *)self->_shared metal];
  v37 = (void *)[v35 initWithMetalContext:v36];

  if (!v37)
  {
LABEL_24:
    int v58 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    int v46 = -73316;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_19;
  }
  v38 = objc_opt_new();
  if (!v38)
  {
    int v58 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
    id v20 = v50;
    int v46 = -73316;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_18;
  }
  v39 = v38;
  [v38 setBufferCount:2];
  if (*(unsigned char *)[(RawDFNetworkStageShared *)self->_shared shaderUniforms])
  {
    acStage = self->_acStage;
    v59[0] = self->_fusionStage;
    v59[1] = acStage;
    v41 = (void *)MEMORY[0x263EFF8C0];
    v42 = v59;
    uint64_t v43 = 2;
  }
  else
  {
    v60[0] = self->_fusionStage;
    v41 = (void *)MEMORY[0x263EFF8C0];
    v42 = v60;
    uint64_t v43 = 1;
  }
  v44 = [v41 arrayWithObjects:v42 count:v43];
  [v39 setPipeline:v44];

  int v45 = [v37 loadWithConfig:v39];
  if (v45)
  {
    int v46 = v45;
    goto LABEL_27;
  }
  ++self->_runs;
  [(RawDFNetworkStageShared *)self->_shared getTileCount];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __208__RawDFNetworkStage_runWithSyntheticLong_syntheticReference_syntheticEV0FusionMap_syntheticLongFusionMap_syntheticReferenceFusionMap_lscGains_skyMask_skinMask_frameMeta_outputLumaTexture_outputChromaTexture___block_invoke;
  v56[3] = &unk_2655C72A8;
  v56[4] = self;
  int v46 = objc_msgSend(v37, "runWithTileCount:withCompletionHandler:", v56);
  if (v46) {
LABEL_27:
  }
    FigDebugAssert3();

LABEL_18:
LABEL_19:

  return v46;
}

uint64_t __208__RawDFNetworkStage_runWithSyntheticLong_syntheticReference_syntheticEV0FusionMap_syntheticLongFusionMap_syntheticReferenceFusionMap_lscGains_skyMask_skinMask_frameMeta_outputLumaTexture_outputChromaTexture___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    ++*(void *)(*(void *)(result + 32) + 56);
  }
  ++*(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (int)resetFinalProcessingStatus
{
  self->_runs = 0;
  self->_completions = 0;
  self->_errorCount = 0;
  return 0;
}

- (int)getFinalProcessingStatus
{
  if (!self->_errorCount && self->_completions == self->_runs) {
    return 0;
  }
  BOOL v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  int v2 = -73316;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return v2;
}

- (int)setupNetworkStagesForNetworkType:(int)a3 isV2:(BOOL)a4
{
  if (a3 == 3) {
    goto LABEL_24;
  }
  if (self->_loadedNetworkType != a3)
  {
    BOOL v6 = a4;
    int v7 = [FusionNetworkPreANEStage alloc];
    int v8 = [(RawDFNetworkStageShared *)self->_shared metal];
    v9 = [(FusionNetworkPreANEStage *)v7 initWithMetal:v8 isV2:v6];

    if (v9)
    {
      v10 = [FusionNetworkPostANEStage alloc];
      int v11 = [(RawDFNetworkStageShared *)self->_shared metal];
      v12 = [(FusionNetworkPostANEStage *)v10 initWithMetal:v11];

      if (v12)
      {
        v13 = [ACNetworkPostANEStage alloc];
        v14 = [(RawDFNetworkStageShared *)self->_shared metal];
        v15 = [(ACNetworkPostANEStage *)v13 initWithMetal:v14];

        if (v15)
        {
          [(FusionNetworkPreANEStage *)v9 setShared:self->_shared];
          [(FusionNetworkPostANEStage *)v12 setShared:self->_shared];
          [(ACNetworkPostANEStage *)v15 setShared:self->_shared];
          uint64_t v16 = objc_opt_new();
          if (v16)
          {
            uint64_t v17 = v16;
            v18 = objc_opt_new();
            [v17 setNetworkConfig:v18];

            id v19 = [v17 networkConfig];

            if (v19)
            {
              if (a3 < 3)
              {
                uint64_t v20 = [(RawDFNetworkStage *)self getFilePathForNetworkIdentifier:*(&off_2655C7B50 + a3) withExtension:@".bundle"];
                if (v20)
                {
                  id v21 = (void *)v20;
                  int v58 = v15;
                  v60 = v12;
                  id v22 = [v17 networkConfig];
                  [v22 setNetworkPath:v21];

                  id v23 = [v17 networkConfig];
                  v24 = [v23 networkPath];

                  if (!v24)
                  {
                    id v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
                    int v46 = -73316;
                    fig_log_call_emit_and_clean_up_after_send_and_compose();

                    return v46;
                  }
                  v57 = v21;
                  if (a3 == 2) {
                    uint64_t v25 = &kDFOpt2NetworkInputs;
                  }
                  else {
                    uint64_t v25 = &kFusionNetworkInputs;
                  }
                  if (a3 == 2) {
                    uint64_t v26 = &kDFOpt2NetworkOutputs;
                  }
                  else {
                    uint64_t v26 = &kFusionNetworkOutputs;
                  }
                  id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
                  [v17 networkConfig];
                  id v28 = v59 = v9;
                  [v28 setNetworkInputNames:v27];

                  uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
                  v30 = [v17 networkConfig];
                  [v30 setNetworkOutputNames:v29];

                  [v17 setPreInferenceStage:v59];
                  [v17 setPostInferenceStage:v60];
                  objc_storeStrong((id *)&self->_fusionStage, v17);
                  uint64_t v31 = objc_opt_new();
                  if (v31)
                  {
                    double v32 = (void *)v31;
                    int v33 = objc_opt_new();
                    [v32 setNetworkConfig:v33];

                    int v34 = [v32 networkConfig];

                    if (v34)
                    {
                      uint64_t v35 = [(RawDFNetworkStage *)self getFilePathForNetworkIdentifier:@"raw_deep_fusion_ac-v1" withExtension:@".bundle"];
                      if (v35)
                      {
                        v36 = (void *)v35;
                        v37 = [v32 networkConfig];
                        [v37 setNetworkPath:v36];

                        v38 = [v32 networkConfig];
                        v39 = [v38 networkPath];

                        if (!v39)
                        {
                          v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                          os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
                          int v46 = -73316;
                          fig_log_call_emit_and_clean_up_after_send_and_compose();

                          return v46;
                        }
                        v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&kACNetworkInputs count:2];
                        v41 = [v32 networkConfig];
                        [v41 setNetworkInputNames:v40];

                        v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&kACNetworkOutputs count:1];
                        uint64_t v43 = [v32 networkConfig];
                        [v43 setNetworkOutputNames:v42];

                        [v32 setPreInferenceStage:v60];
                        [v32 setPostInferenceStage:v58];
                        acStage = self->_acStage;
                        self->_acStage = (CMITiledInferenceProcessorTilePipelineStage *)v32;
                        id v45 = v32;

                        self->_loadedNetworkType = a3;
                        return 0;
                      }
                    }
                    id v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
                    int v46 = -73316;
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  else
                  {
                    id v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
                    int v46 = -73316;
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  return v46;
                }
              }
              id v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              int v46 = -73316;
            }
            else
            {
              id v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
              int v46 = -73316;
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else
          {
            uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
            int v46 = -73316;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        else
        {
          v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
          int v46 = -73316;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
        int v46 = -73316;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return v46;
    }
LABEL_24:
    v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    int v46 = -73316;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return v46;
  }
  return 0;
}

- (id)getFilePathForNetworkIdentifier:(id)a3 withExtension:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (FigCapturePlatformGetVariant() == 3
    && [v7 isEqualToString:@".bundle"])
  {
    int v8 = NSString;
    v9 = (void *)FigCapturePlatformIdentifierString();
    v10 = [v8 stringWithFormat:@"%@G", v9];
  }
  else
  {
    v10 = (void *)FigCapturePlatformIdentifierString();
  }
  if (v10 && (uint64_t ModelSpecificName = FigCaptureGetModelSpecificName()) != 0)
  {
    v12 = (void *)ModelSpecificName;
    double v32 = v10;
    v13 = [NSString stringWithFormat:@"^.+(\\.|_)(%@|%@)(\\.|_).+$", v10, ModelSpecificName];
    id v37 = 0;
    v14 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v13 options:1 error:&v37];
    id v31 = v37;
    id v15 = v7;
    [(RawDFNetworkStage *)self availableImagingNetworksWithExtension:v7];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
LABEL_9:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v33 + 1) + 8 * v20);
        if ([v21 hasPrefix:v6])
        {
          if (objc_msgSend(v14, "numberOfMatchesInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length"))) {
            break;
          }
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v44 count:16];
          if (v18) {
            goto LABEL_9;
          }
          goto LABEL_16;
        }
      }
      id v25 = v21;

      if (!v25) {
        goto LABEL_17;
      }
      uint64_t v26 = NSString;
      id v27 = v25;
      id v28 = objc_msgSend(v26, "stringWithFormat:", @"%s/%s", "/System/Library/ImagingNetworks", objc_msgSend(v27, "UTF8String"));

      id v7 = v15;
    }
    else
    {
LABEL_16:

LABEL_17:
      int v39 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      id v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      int v23 = v39;
      if (!os_log_type_enabled(v22, type)) {
        v23 &= ~1u;
      }
      if (v23)
      {
        uint64_t v24 = [v6 UTF8String];
        int v40 = 136315394;
        v41 = "-[RawDFNetworkStage getFilePathForNetworkIdentifier:withExtension:]";
        __int16 v42 = 2080;
        uint64_t v43 = v24;
        _os_log_send_and_compose_impl();
      }
      id v7 = v15;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v28 = 0;
    }
    v10 = v32;
  }
  else
  {
    int v39 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v28 = 0;
  }

  return v28;
}

- (id)availableImagingNetworksWithExtension:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  v5 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  id v6 = [v5 contentsOfDirectoryAtPath:@"/System/Library/ImagingNetworks" error:&v19];
  id v7 = v19;

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasSuffix:", v3, (void)v15)) {
            [v4 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  if (!objc_msgSend(v4, "count", (void)v15))
  {

    BOOL v4 = 0;
  }

  return v4;
}

- (NSArray)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_acStage, 0);
  objc_storeStrong((id *)&self->_fusionStage, 0);

  objc_storeStrong((id *)&self->_shared, 0);
}

@end