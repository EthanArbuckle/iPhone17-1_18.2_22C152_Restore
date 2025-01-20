@interface SoftLTM
+ (void)copyLTMMetadata:(id)a3 to:(id)a4;
+ (void)copyLTM_HLG_Metadata:(id)a3 to:(id)a4;
+ (void)updateFrameProperties:(id)a3 withHazeCorrection:(id)a4;
- (BOOL)calcGlobalHistOnROI;
- (BOOL)isAdaptiveFaceBiasScalerEnabled:(id)a3;
- (BOOL)isDigitalFlash;
- (BOOL)isHazeCorrectionEnabled:(id)a3;
- (BOOL)isHazeCorrectionEnabledForPortType:(id)a3;
- (NSArray)hazeEstimation;
- (NSNumber)evmExpRatio;
- (SoftLTM)initWithCommandQueue:(id)a3;
- (id)calculateLTMOnEV0Frame:(id)a3 evmFrame:(id)a4;
- (id)computeLTM:(id)a3 metadata:(id)a4 applyCCM:(BOOL)a5;
- (id)computeLTMFromLuma:(id)a3 chroma:(id)a4 metadata:(id)a5 applyCCM:(BOOL)a6;
- (id)copyLTMMetadata:(id)a3;
- (id)copyLTM_HLG_Metadata:(id)a3;
- (id)mixLTMMetadata:(id)a3 ev0:(id)a4;
- (int)prepareToProcess:(id)a3;
- (int)processLTMMetadata:(id)a3 toDarkestFrame:(id)a4 toEV0Frame:(id)a5;
- (int)processLTM_HLG_Metadata:(id)a3 toDarkestFrame:(id)a4 toEV0Frame:(id)a5;
- (int)rawDFSoftLTMMode;
- (int)setupIBPTuningParameters:(id)a3 with:(int)a4;
- (void)reset;
- (void)resetProperty;
- (void)setCalcGlobalHistOnROI:(BOOL)a3;
- (void)setEvmExpRatio:(id)a3;
- (void)setHazeEstimation:(id)a3;
- (void)setIsDigitalFlash:(BOOL)a3;
@end

@implementation SoftLTM

- (int)rawDFSoftLTMMode
{
  return self->_softLtmRawDFMode;
}

- (SoftLTM)initWithCommandQueue:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SoftLTM;
  v5 = [(SoftLTM *)&v13 init];
  if (v5
    && (uint64_t v6 = [objc_alloc(MEMORY[0x263F30660]) initWithCommandQueue:v4],
        ltmProcessor = v5->_ltmProcessor,
        v5->_ltmProcessor = (LTMProcessor *)v6,
        ltmProcessor,
        v5->_ltmProcessor))
  {
    v5->_prepared = 0;
    uint64_t v8 = objc_opt_new();
    tuningParamsDictByPortType = v5->_tuningParamsDictByPortType;
    v5->_tuningParamsDictByPortType = (NSMutableDictionary *)v8;

    v5->_softLtmRawDFMode = 0;
    *(_WORD *)&v5->_hazeEnabledFromDefaults = 0;
    v10 = v5;
  }
  else
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }

  return v10;
}

- (BOOL)isHazeCorrectionEnabled:(id)a3
{
  tuningParamsDictByPortType = self->_tuningParamsDictByPortType;
  v5 = [a3 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  uint64_t v6 = [(NSMutableDictionary *)tuningParamsDictByPortType objectForKeyedSubscript:v5];

  v7 = [v6 objectForKeyedSubscript:@"Features"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"EnableHazeEstimation"];
  if (v8) {
    BOOL hazeEnabledFromDefaults = 1;
  }
  else {
    BOOL hazeEnabledFromDefaults = self->_hazeEnabledFromDefaults;
  }

  return hazeEnabledFromDefaults;
}

- (BOOL)isAdaptiveFaceBiasScalerEnabled:(id)a3
{
  tuningParamsDictByPortType = self->_tuningParamsDictByPortType;
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  v5 = [(NSMutableDictionary *)tuningParamsDictByPortType objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"Features"];
  v7 = [v6 objectForKeyedSubscript:@"EnableAdaptiveFaceBiasScaler"];
  BOOL v8 = v7 != 0;

  return v8;
}

- (BOOL)isHazeCorrectionEnabledForPortType:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_tuningParamsDictByPortType objectForKeyedSubscript:a3];
  v5 = [v4 objectForKeyedSubscript:@"Features"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"EnableHazeEstimation"];
  if (v6) {
    BOOL hazeEnabledFromDefaults = 1;
  }
  else {
    BOOL hazeEnabledFromDefaults = self->_hazeEnabledFromDefaults;
  }

  return hazeEnabledFromDefaults;
}

- (int)prepareToProcess:(id)a3
{
  id v4 = a3;
  v5 = [v4 backendAllocator];

  if (!v5)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int v12 = -73268;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_8;
  }
  if (self->_prepared)
  {
    uint64_t v6 = [(LTMProcessor *)self->_ltmProcessor externalMemoryResource];
    v7 = [v6 allocatorBackend];
    BOOL v8 = [v4 backendAllocator];

    if (v7 == v8)
    {
      int v12 = 0;
      goto LABEL_10;
    }
  }
  v9 = objc_opt_new();
  if (!v9)
  {
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    int v12 = -73268;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_8;
  }
  v10 = [v4 backendAllocator];
  [v9 setAllocatorBackend:v10];

  int v11 = [(LTMProcessor *)self->_ltmProcessor purgeResources];
  if (v11)
  {
    int v12 = v11;
    goto LABEL_14;
  }
  [(LTMProcessor *)self->_ltmProcessor setExternalMemoryResource:v9];
  int v12 = [(LTMProcessor *)self->_ltmProcessor prepareToProcess:0];
  if (v12)
  {
LABEL_14:
    FigDebugAssert3();
    goto LABEL_8;
  }
  self->_prepared = 1;
LABEL_8:

LABEL_10:
  return v12;
}

- (void)reset
{
  id v2 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
  [v2 reset];
}

- (void)resetProperty
{
  *(_WORD *)&self->_calcGlobalHistOnROI = 0;
  evmExpRatio = self->_evmExpRatio;
  self->_evmExpRatio = 0;

  hazeEstimation = self->_hazeEstimation;
  self->_hazeEstimation = 0;
}

- (int)setupIBPTuningParameters:(id)a3 with:(int)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [v5 objectForKeyedSubscript:@"DefaultSensorIDs"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v33;
    id v27 = v5;
    int v28 = a4;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v33 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * v6);
      uint64_t v8 = [obj objectForKeyedSubscript:v7];
      if (!v8)
      {
        FigDebugAssert3();
        int v24 = FigSignalErrorAt();
        goto LABEL_22;
      }
      v9 = (void *)v8;
      v10 = [v5 objectForKeyedSubscript:v7];
      int v11 = [v10 objectForKeyedSubscript:v9];
      int v12 = [v11 objectForKeyedSubscript:@"SoftISPTuning"];
      objc_super v13 = [v12 objectForKeyedSubscript:@"Common"];
      uint64_t v14 = [v13 objectForKeyedSubscript:@"LTM"];

      if (a4 == 2) {
        break;
      }
      if (a4 == 1)
      {
        v15 = [v5 objectForKeyedSubscript:v7];
        v16 = [v15 objectForKeyedSubscript:v9];
        v17 = [v16 objectForKeyedSubscript:@"SoftISPTuning"];
        v18 = v17;
        v19 = @"UB";
LABEL_13:
        v20 = [v17 objectForKeyedSubscript:v19];
        v22 = [v20 objectForKeyedSubscript:@"EVZero"];
        v21 = [v22 objectForKeyedSubscript:@"LTM"];

LABEL_14:
        v23 = objc_msgSend(v21, "cmi_dictionaryMergedWithDefaultDict:", v14);
        if (v23) {
          [(NSMutableDictionary *)self->_tuningParamsDictByPortType setObject:v23 forKeyedSubscript:v7];
        }
        id v5 = v27;
        goto LABEL_18;
      }
      if (!a4)
      {
        v15 = [v5 objectForKeyedSubscript:v7];
        v16 = [v15 objectForKeyedSubscript:v9];
        v17 = [v16 objectForKeyedSubscript:@"SoftISPTuning"];
        v18 = v17;
        v19 = @"DeepFusionCommon";
        goto LABEL_13;
      }
      v21 = 0;
      v23 = 0;
LABEL_18:

      ++v6;
      a4 = v28;
      if (v30 == v6)
      {
        uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v30) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
    v15 = [v5 objectForKeyedSubscript:v7];
    v16 = [v15 objectForKeyedSubscript:v9];
    v18 = [v16 objectForKeyedSubscript:@"SoftISPTuning"];
    v20 = [v18 objectForKeyedSubscript:@"RawNightMode"];
    v21 = [v20 objectForKeyedSubscript:@"LTM"];
    goto LABEL_14;
  }
LABEL_20:
  int v24 = 0;
LABEL_22:

  return v24;
}

- (id)computeLTM:(id)a3 metadata:(id)a4 applyCCM:(BOOL)a5
{
  BOOL v6 = a5;
  v51[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  tuningParamsDictByPortType = self->_tuningParamsDictByPortType;
  int v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  objc_super v13 = [(NSMutableDictionary *)tuningParamsDictByPortType objectForKeyedSubscript:v12];

  uint64_t v14 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
  [v14 reset];

  if (v13)
  {
    v15 = (void *)[v13 copy];
    v16 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v16 setTuningParameters:v15];
  }
  if (!self->_prepared && (int v17 = [(LTMProcessor *)self->_ltmProcessor prepareToProcess:0]) != 0)
  {
    uint64_t v49 = v5;
    LODWORD(v48) = v17;
  }
  else
  {
    v18 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v18 setOptimizationLevel:1];

    BOOL isDigitalFlash = self->_isDigitalFlash;
    v20 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v20 setDigitalFlash:isDigitalFlash];

    v21 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v21 setInMetaData:v10];

    v22 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v22 setInRGBAFloatTex:v9];

    v23 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v23 setInLumaTex:0];

    int v24 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v24 setInChromaTex:0];

    v25 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v25 setInRGBImageUInt16Tex:0];

    v26 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v26 setComputeHDRCurves:1];

    BOOL calcGlobalHistOnROI = self->_calcGlobalHistOnROI;
    int v28 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v28 setCalcGlobalHistOnROI:calcGlobalHistOnROI];

    v50[0] = @"X";
    v50[1] = @"Y";
    v51[0] = &unk_270E98698;
    v51[1] = &unk_270E98698;
    v50[2] = @"Width";
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "width"));
    v51[2] = v29;
    v50[3] = @"Height";
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "height"));
    v51[3] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
    long long v32 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v32 setValidBufferRect:v31];

    if (v6)
    {
      long long v33 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
      [v33 setDoGlobalCCM:1];
    }
    if (!self->_isDigitalFlash || self->_enableHazeForNM)
    {
      long long v34 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
      [v34 setDoHazeEstimation:1];

      evmExpRatio = self->_evmExpRatio;
      if (evmExpRatio)
      {
        [(NSNumber *)evmExpRatio floatValue];
        int v37 = v36;
        v38 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
        LODWORD(v39) = v37;
        [v38 setEvmExpRatio:v39];
      }
      hazeEstimation = self->_hazeEstimation;
      if (hazeEstimation)
      {
        v41 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
        [v41 setHazeEstimation:hazeEstimation];
      }
    }
    if (!self->_isDigitalFlash)
    {
      if ([(SoftLTM *)self isAdaptiveFaceBiasScalerEnabled:v10])
      {
        v42 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
        NSSelectorFromString(&cfstr_Doadaptiveface.isa);
        char v43 = objc_opt_respondsToSelector();

        if (v43) {
          [(LTMProcessor *)self->_ltmProcessor setValue:MEMORY[0x263EFFA88] forKeyPath:@"ltmParams.doAdaptiveFaceBiasScaler"];
        }
      }
    }
    int v44 = [(LTMProcessor *)self->_ltmProcessor process];
    if (!v44)
    {
      v45 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
      v46 = [v45 outMetaData];

      goto LABEL_19;
    }
    uint64_t v49 = v5;
    LODWORD(v48) = v44;
  }
  FigDebugAssert3();
  v46 = 0;
LABEL_19:
  [(SoftLTM *)self resetProperty];

  return v46;
}

- (id)computeLTMFromLuma:(id)a3 chroma:(id)a4 metadata:(id)a5 applyCCM:(BOOL)a6
{
  BOOL v7 = a6;
  v54[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  tuningParamsDictByPortType = self->_tuningParamsDictByPortType;
  v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  v16 = [(NSMutableDictionary *)tuningParamsDictByPortType objectForKeyedSubscript:v15];

  int v17 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
  [v17 reset];

  if (v16)
  {
    v18 = (void *)[v16 copy];
    v19 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v19 setTuningParameters:v18];
  }
  if (!self->_prepared && (int v20 = [(LTMProcessor *)self->_ltmProcessor prepareToProcess:0]) != 0)
  {
    uint64_t v52 = v6;
    LODWORD(v51) = v20;
  }
  else
  {
    v21 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v21 setOptimizationLevel:1];

    BOOL isDigitalFlash = self->_isDigitalFlash;
    v23 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v23 setDigitalFlash:isDigitalFlash];

    int v24 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v24 setInMetaData:v13];

    v25 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v25 setInLumaTex:v11];

    v26 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v26 setInChromaTex:v12];

    id v27 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v27 setInRGBAFloatTex:0];

    int v28 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v28 setInRGBImageUInt16Tex:0];

    uint64_t v29 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v29 setComputeHDRCurves:1];

    BOOL calcGlobalHistOnROI = self->_calcGlobalHistOnROI;
    v31 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v31 setCalcGlobalHistOnROI:calcGlobalHistOnROI];

    v53[0] = @"X";
    v53[1] = @"Y";
    v54[0] = &unk_270E98698;
    v54[1] = &unk_270E98698;
    v53[2] = @"Width";
    long long v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "width"));
    v54[2] = v32;
    v53[3] = @"Height";
    long long v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "height"));
    v54[3] = v33;
    long long v34 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
    long long v35 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
    [v35 setValidBufferRect:v34];

    if (v7)
    {
      int v36 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
      [v36 setDoGlobalCCM:1];
    }
    if (!self->_isDigitalFlash || self->_enableHazeForNM)
    {
      int v37 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
      [v37 setDoHazeEstimation:1];

      evmExpRatio = self->_evmExpRatio;
      if (evmExpRatio)
      {
        [(NSNumber *)evmExpRatio floatValue];
        int v40 = v39;
        v41 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
        LODWORD(v42) = v40;
        [v41 setEvmExpRatio:v42];
      }
      hazeEstimation = self->_hazeEstimation;
      if (hazeEstimation)
      {
        int v44 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
        [v44 setHazeEstimation:hazeEstimation];
      }
    }
    if (!self->_isDigitalFlash)
    {
      if ([(SoftLTM *)self isAdaptiveFaceBiasScalerEnabled:v13])
      {
        v45 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
        NSSelectorFromString(&cfstr_Doadaptiveface.isa);
        char v46 = objc_opt_respondsToSelector();

        if (v46) {
          [(LTMProcessor *)self->_ltmProcessor setValue:MEMORY[0x263EFFA88] forKeyPath:@"ltmParams.doAdaptiveFaceBiasScaler"];
        }
      }
    }
    int v47 = [(LTMProcessor *)self->_ltmProcessor process];
    if (!v47)
    {
      uint64_t v48 = [(LTMProcessor *)self->_ltmProcessor ltmParams];
      uint64_t v49 = [v48 outMetaData];

      goto LABEL_19;
    }
    uint64_t v52 = v6;
    LODWORD(v51) = v47;
  }
  FigDebugAssert3();
  uint64_t v49 = 0;
LABEL_19:
  [(SoftLTM *)self resetProperty];

  return v49;
}

- (int)processLTMMetadata:(id)a3 toDarkestFrame:(id)a4 toEV0Frame:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F6F8]];
    if (!v10)
    {
      id v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v10 = [NSNumber numberWithInt:256];
    }
    if (v8)
    {
      float v12 = (float)(int)[v10 intValue] * 0.0039062;
      *(float *)([v8 exposureParams] + 36) = v12;
      objc_msgSend(v8, "setMetadataHasLtmCurves:", getLTMCurvesFromMetadata(v7, objc_msgSend(v8, "exposureParams"), objc_msgSend(v8, "ltmCurves")) == 0, v17, v18);
      objc_msgSend(v8, "setMetadataHasHDRLtmCurves:", getHDRLTMCurvesFromMetadata(v7, objc_msgSend(v8, "exposureParams"), objc_msgSend(v8, "HDRltmCurves")) == 0);
      objc_msgSend(v8, "setMetadataHasLtmCurvesForBackground:", getLTMCurvesForBackgroundFromMetadata(v7, objc_msgSend(v8, "exposureParams"), objc_msgSend(v8, "ltmCurvesForBackground")) == 0);
      if (([v8 metadataHasLtmCurvesForBackground] & 1) == 0)
      {
        if ([v8 metadataHasLtmCurves]) {
          memcpy((void *)[v8 ltmCurvesForBackground], (const void *)objc_msgSend(v8, "ltmCurves"), 0x36770uLL);
        }
      }
    }
    if (v9)
    {
      float v13 = (float)(int)[v10 intValue] * 0.0039062;
      *(float *)([v9 exposureParams] + 36) = v13;
      objc_msgSend(v9, "setMetadataHasLtmCurves:", getLTMCurvesFromMetadata(v7, objc_msgSend(v9, "exposureParams"), objc_msgSend(v9, "ltmCurves")) == 0);
      objc_msgSend(v9, "setMetadataHasHDRLtmCurves:", getHDRLTMCurvesFromMetadata(v7, objc_msgSend(v9, "exposureParams"), objc_msgSend(v9, "HDRltmCurves")) == 0);
      objc_msgSend(v9, "setMetadataHasLtmCurvesForBackground:", getLTMCurvesForBackgroundFromMetadata(v7, objc_msgSend(v9, "exposureParams"), objc_msgSend(v9, "ltmCurvesForBackground")) == 0);
      if (([v9 metadataHasLtmCurvesForBackground] & 1) == 0)
      {
        if ([v9 metadataHasLtmCurves]) {
          memcpy((void *)[v9 ltmCurvesForBackground], (const void *)objc_msgSend(v9, "ltmCurves"), 0x36770uLL);
        }
      }
    }
    int v14 = 0;
  }
  else
  {
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v10 = 0;
    int v14 = -73268;
  }

  return v14;
}

- (int)processLTM_HLG_Metadata:(id)a3 toDarkestFrame:(id)a4 toEV0Frame:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F6F8]];
    if (!v10)
    {
      id v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v10 = [NSNumber numberWithInt:256];
    }
    if (v8)
    {
      float v12 = (float)(int)[v10 intValue] * 0.0039062;
      *(float *)([v8 exposureParams] + 36) = v12;
      objc_msgSend(v8, "setMetadataHasHDRLtmCurves:", getHDRLTMCurvesFromMetadata(v7, objc_msgSend(v8, "exposureParams"), objc_msgSend(v8, "HDRltmCurves")) == 0, v17, v18);
    }
    if (v9)
    {
      float v13 = (float)(int)[v10 intValue] * 0.0039062;
      *(float *)([v9 exposureParams] + 36) = v13;
      objc_msgSend(v9, "setMetadataHasHDRLtmCurves:", getHDRLTMCurvesFromMetadata(v7, objc_msgSend(v9, "exposureParams"), objc_msgSend(v9, "HDRltmCurves")) == 0);
    }
    int v14 = 0;
  }
  else
  {
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v10 = 0;
    int v14 = -73268;
  }

  return v14;
}

+ (void)copyLTMMetadata:(id)a3 to:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = *MEMORY[0x263F2F6F0];
  v29[0] = *MEMORY[0x263F2F6E8];
  v29[1] = v7;
  uint64_t v8 = *MEMORY[0x263F2F0E8];
  v29[2] = *MEMORY[0x263F2F6F8];
  v29[3] = v8;
  uint64_t v9 = *MEMORY[0x263F2F0A8];
  v29[4] = *MEMORY[0x263F2F098];
  v29[5] = v9;
  uint64_t v10 = *MEMORY[0x263F2F0E0];
  v29[6] = *MEMORY[0x263F2EFA0];
  v29[7] = v10;
  uint64_t v11 = *MEMORY[0x263F2F0A0];
  v29[8] = *MEMORY[0x263F2F090];
  v29[9] = v11;
  uint64_t v12 = *MEMORY[0x263F2F530];
  v29[10] = *MEMORY[0x263F2EF98];
  v29[11] = v12;
  uint64_t v13 = *MEMORY[0x263F2F4E8];
  v29[12] = *MEMORY[0x263F2F4D8];
  v29[13] = v13;
  uint64_t v14 = *MEMORY[0x263F2F518];
  v29[14] = *MEMORY[0x263F2F380];
  v29[15] = v14;
  uint64_t v15 = *MEMORY[0x263F2F550];
  v29[16] = *MEMORY[0x263F2F520];
  v29[17] = v15;
  uint64_t v16 = *MEMORY[0x263F2F540];
  v29[18] = *MEMORY[0x263F2F548];
  v29[19] = v16;
  uint64_t v17 = *MEMORY[0x263F2F080];
  v29[20] = *MEMORY[0x263F2F088];
  v29[21] = v17;
  v29[22] = *MEMORY[0x263F2F0C0];
  uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v29, 23, 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        int v24 = [v5 objectForKeyedSubscript:v23];
        [v6 setObject:v24 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
}

+ (void)copyLTM_HLG_Metadata:(id)a3 to:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = *MEMORY[0x263F2F098];
  v20[0] = *MEMORY[0x263F2F0E8];
  v20[1] = v7;
  uint64_t v8 = *MEMORY[0x263F2EFA0];
  v20[2] = *MEMORY[0x263F2F0A8];
  v20[3] = v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v20, 4, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v15 = [v5 objectForKeyedSubscript:v14];
        [v6 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)copyLTMMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  +[SoftLTM copyLTMMetadata:v3 to:v4];

  return v4;
}

- (id)copyLTM_HLG_Metadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  +[SoftLTM copyLTM_HLG_Metadata:v3 to:v4];

  return v4;
}

- (id)mixLTMMetadata:(id)a3 ev0:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = *MEMORY[0x263F2F0E8];
  uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F0E8]];
  [v7 setObject:v9 forKeyedSubscript:v8];

  uint64_t v10 = *MEMORY[0x263F2F098];
  uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F098]];
  [v7 setObject:v11 forKeyedSubscript:v10];

  uint64_t v12 = *MEMORY[0x263F2F0A8];
  uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F0A8]];
  [v7 setObject:v13 forKeyedSubscript:v12];

  uint64_t v14 = *MEMORY[0x263F2EFA0];
  uint64_t v15 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2EFA0]];
  [v7 setObject:v15 forKeyedSubscript:v14];

  uint64_t v16 = *MEMORY[0x263F2F0E0];
  long long v17 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F0E0]];
  [v7 setObject:v17 forKeyedSubscript:v16];

  uint64_t v18 = *MEMORY[0x263F2F090];
  long long v19 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F090]];
  [v7 setObject:v19 forKeyedSubscript:v18];

  uint64_t v20 = *MEMORY[0x263F2F0A0];
  uint64_t v21 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F0A0]];
  [v7 setObject:v21 forKeyedSubscript:v20];

  uint64_t v22 = *MEMORY[0x263F2EF98];
  uint64_t v23 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2EF98]];
  [v7 setObject:v23 forKeyedSubscript:v22];

  uint64_t v24 = *MEMORY[0x263F2F530];
  long long v25 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F530]];
  [v7 setObject:v25 forKeyedSubscript:v24];

  uint64_t v26 = *MEMORY[0x263F2F4D8];
  long long v27 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F4D8]];
  [v7 setObject:v27 forKeyedSubscript:v26];

  uint64_t v28 = *MEMORY[0x263F2F4E8];
  uint64_t v29 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F4E8]];
  [v7 setObject:v29 forKeyedSubscript:v28];

  uint64_t v30 = *MEMORY[0x263F2F380];
  uint64_t v31 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F380]];
  [v7 setObject:v31 forKeyedSubscript:v30];

  uint64_t v32 = *MEMORY[0x263F2F6F8];
  long long v33 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F6F8]];
  [v7 setObject:v33 forKeyedSubscript:v32];

  uint64_t v34 = *MEMORY[0x263F2F518];
  long long v35 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F518]];
  [v7 setObject:v35 forKeyedSubscript:v34];

  uint64_t v36 = *MEMORY[0x263F2F520];
  int v37 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F520]];
  [v7 setObject:v37 forKeyedSubscript:v36];

  uint64_t v38 = *MEMORY[0x263F2F550];
  int v39 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F550]];
  [v7 setObject:v39 forKeyedSubscript:v38];

  uint64_t v40 = *MEMORY[0x263F2F548];
  v41 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F548]];
  [v7 setObject:v41 forKeyedSubscript:v40];

  uint64_t v42 = *MEMORY[0x263F2F540];
  char v43 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F540]];
  [v7 setObject:v43 forKeyedSubscript:v42];

  uint64_t v44 = *MEMORY[0x263F2F088];
  v45 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F088]];
  [v7 setObject:v45 forKeyedSubscript:v44];

  uint64_t v46 = *MEMORY[0x263F2F080];
  int v47 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F080]];

  [v7 setObject:v47 forKeyedSubscript:v46];
  uint64_t v48 = *MEMORY[0x263F2F0C0];
  uint64_t v49 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F0C0]];

  [v7 setObject:v49 forKeyedSubscript:v48];

  return v7;
}

- (id)calculateLTMOnEV0Frame:(id)a3 evmFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v9 = [v6 properties];
    uint64_t v10 = [v9 meta];
    uint64_t v11 = [v10 exposureParams];
    uint64_t v12 = [v7 properties];
    uint64_t v13 = [v12 meta];
    float RelativeBrightness = getRelativeBrightness(v11, [v13 exposureParams], 2);
  }
  else
  {
    float RelativeBrightness = 1.0;
  }
  *(float *)&double v8 = RelativeBrightness;
  uint64_t v15 = [NSNumber numberWithFloat:v8];
  [(SoftLTM *)self setEvmExpRatio:v15];

  uint64_t v16 = [v6 rgbTex];
  long long v17 = [v6 metadata];
  uint64_t v18 = [(SoftLTM *)self computeLTM:v16 metadata:v17 applyCCM:1];

  if (!v18
    || ([v6 properties],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        [v19 meta],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [(SoftLTM *)self processLTMMetadata:v18 toDarkestFrame:0 toEV0Frame:v20], v20, v19, v21))
  {
    FigDebugAssert3();
  }
  else
  {
    if (!v7)
    {
      id v29 = [(SoftLTM *)self copyLTMMetadata:v18];
      goto LABEL_13;
    }
    uint64_t v22 = [v18 objectForKeyedSubscript:*MEMORY[0x263F2F0C0]];
    if (v22) {
      [(SoftLTM *)self setHazeEstimation:v22];
    }
    uint64_t v23 = [v7 rgbTex];
    uint64_t v24 = [v7 metadata];
    long long v25 = [(SoftLTM *)self computeLTM:v23 metadata:v24 applyCCM:1];

    if (v25)
    {
      uint64_t v26 = [v7 properties];
      long long v27 = [v26 meta];
      int v28 = [(SoftLTM *)self processLTMMetadata:v25 toDarkestFrame:v27 toEV0Frame:0];

      if (!v28)
      {

        id v29 = [(SoftLTM *)self mixLTMMetadata:v25 ev0:v18];

        goto LABEL_13;
      }
    }
    FigDebugAssert3();
  }
  id v29 = 0;
LABEL_13:

  return v29;
}

+ (void)updateFrameProperties:(id)a3 withHazeCorrection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  *(unsigned char *)([v6 ltmCurves] + 223072) = 1;
  id v7 = [v5 objectAtIndexedSubscript:0];
  [v7 floatValue];
  *(void *)&long long v24 = v8;
  uint64_t v9 = [v5 objectAtIndexedSubscript:1];
  [v9 floatValue];
  int v22 = v10;
  uint64_t v11 = [v5 objectAtIndexedSubscript:2];
  [v11 floatValue];
  long long v12 = v24;
  DWORD1(v12) = v22;
  DWORD2(v12) = v13;
  *((void *)&v25 + 1) = *((void *)&v12 + 1);
  *(_OWORD *)([v6 ltmCurves] + 223056) = v12;

  *(unsigned char *)([v6 ltmCurvesForBackground] + 223072) = 1;
  uint64_t v23 = [v5 objectAtIndexedSubscript:0];
  [v23 floatValue];
  *(void *)&long long v25 = v14;
  uint64_t v15 = [v5 objectAtIndexedSubscript:1];
  [v15 floatValue];
  int v21 = v16;
  long long v17 = [v5 objectAtIndexedSubscript:2];

  [v17 floatValue];
  long long v18 = v25;
  DWORD1(v18) = v21;
  DWORD2(v18) = v19;
  long long v26 = v18;
  uint64_t v20 = [v6 ltmCurvesForBackground];

  *(_OWORD *)(v20 + 223056) = v26;
}

- (BOOL)calcGlobalHistOnROI
{
  return self->_calcGlobalHistOnROI;
}

- (void)setCalcGlobalHistOnROI:(BOOL)a3
{
  self->_BOOL calcGlobalHistOnROI = a3;
}

- (BOOL)isDigitalFlash
{
  return self->_isDigitalFlash;
}

- (void)setIsDigitalFlash:(BOOL)a3
{
  self->_BOOL isDigitalFlash = a3;
}

- (NSNumber)evmExpRatio
{
  return self->_evmExpRatio;
}

- (void)setEvmExpRatio:(id)a3
{
}

- (NSArray)hazeEstimation
{
  return self->_hazeEstimation;
}

- (void)setHazeEstimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hazeEstimation, 0);
  objc_storeStrong((id *)&self->_evmExpRatio, 0);
  objc_storeStrong((id *)&self->_tuningParamsDictByPortType, 0);
  objc_storeStrong((id *)&self->_ltmProcessor, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end