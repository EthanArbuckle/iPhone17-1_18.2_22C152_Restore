@interface RawNightModeTripodFusion
- (FigMetalContext)metalContext;
- (NSDictionary)tuningParameters;
- (RawNightModeTripodFusion)initWithMetalContext:(id)a3 isQuadra:(BOOL)a4 requiresDarkCurrentNoiseModel:(BOOL)a5;
- (id)configureFusionInputDescriptions;
- (id)configureFusionOutputDescriptions;
- (int)resetState;
- (int)runTIPWithBatch:(id)a3 noiseMapTexture:(id)a4 lscTexture:(id)a5 lscMetadata:(id)a6 cameraInfoByPortType:(id)a7;
- (int)updateParametersFromMetadata:(id)a3 tuningParameters:(id)a4 params:(id *)a5;
- (void)setTuningParameters:(id)a3;
- (void)waitForResetStateCompletion;
@end

@implementation RawNightModeTripodFusion

- (RawNightModeTripodFusion)initWithMetalContext:(id)a3 isQuadra:(BOOL)a4 requiresDarkCurrentNoiseModel:(BOOL)a5
{
  id v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)RawNightModeTripodFusion;
  v10 = [(RawNightModeTripodFusion *)&v41 init];
  v11 = v10;
  if (!v9) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v10->_metalContext, a3);
  v11->_isQuadra = a4;
  v11->_requiresDarkCurrentNoiseModel = a5;
  uint64_t v12 = objc_opt_new();
  tripodFusionTiledInferenceProvider = v11->_tripodFusionTiledInferenceProvider;
  v11->_tripodFusionTiledInferenceProvider = (RawNightModeTiledInferenceProvider *)v12;

  v14 = v11->_tripodFusionTiledInferenceProvider;
  if (!v14) {
    goto LABEL_13;
  }
  [(RawNightModeTiledInferenceProvider *)v14 setMetalContext:v11->_metalContext];
  [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider setExecutionTarget:3];
  v15 = [RawNightModeTripodFusionMetalStage alloc];
  v16 = [(FigMetalContext *)v11->_metalContext commandQueue];
  uint64_t v17 = [(RawNightModeTripodFusionMetalStage *)v15 initWithCommandQueue:v16];
  tripodFusionMetalStage = v11->_tripodFusionMetalStage;
  v11->_tripodFusionMetalStage = (RawNightModeTripodFusionMetalStage *)v17;

  if (!v11->_tripodFusionMetalStage) {
    goto LABEL_13;
  }
  v19 = [[RawNightModePreTripodFusion alloc] initWithNumFrames:4];
  preTripodFusionPlugin = v11->_preTripodFusionPlugin;
  v11->_preTripodFusionPlugin = v19;

  v21 = v11->_preTripodFusionPlugin;
  if (!v21) {
    goto LABEL_13;
  }
  [(RawNightModePreTripodFusion *)v21 setTripodFusionMetalStage:v11->_tripodFusionMetalStage];
  [(RawNightModePreTripodFusion *)v11->_preTripodFusionPlugin setContext:v11->_metalContext];
  uint64_t v22 = objc_opt_new();
  postTripodFusionPlugin = v11->_postTripodFusionPlugin;
  v11->_postTripodFusionPlugin = (RawNightModePostTripodFusion *)v22;

  v24 = v11->_postTripodFusionPlugin;
  if (!v24) {
    goto LABEL_13;
  }
  [(RawNightModePostTripodFusion *)v24 setFusionMetalStage:v11->_tripodFusionMetalStage];
  [(RawNightModePostTripodFusion *)v11->_postTripodFusionPlugin setContext:v11->_metalContext];
  [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider setPreInferenceMetalStage:v11->_preTripodFusionPlugin];
  [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider setPostInferenceMetalStage:v11->_postTripodFusionPlugin];
  v25 = objc_opt_new();
  [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider setConfig:v25];

  v26 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];

  if (!v26) {
    goto LABEL_13;
  }
  v27 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  [v27 setTileWidth:&unk_270E984A0];

  v28 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  [v28 setTileHeight:&unk_270E984A0];

  v29 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  [v29 setTilePadding:0];

  v30 = [(RawNightModeTripodFusion *)v11 configureFusionInputDescriptions];
  v31 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  [v31 setNetworkInputNames:v30];

  v32 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  v33 = [v32 networkInputNames];

  if (!v33) {
    goto LABEL_13;
  }
  v34 = [(RawNightModeTripodFusion *)v11 configureFusionOutputDescriptions];
  v35 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  [v35 setNetworkOutputNames:v34];

  v36 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  v37 = [v36 networkOutputNames];

  if (!v37) {
    goto LABEL_13;
  }
  v38 = [(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider config];
  [v38 setKtraceID:2];

  if (![(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider setup]
    && ![(RawNightModeTiledInferenceProvider *)v11->_tripodFusionTiledInferenceProvider preWarm])
  {
    v39 = v11;
  }
  else
  {
LABEL_13:
    FigDebugAssert3();
    v39 = 0;
  }

  return v39;
}

- (id)configureFusionInputDescriptions
{
  v8[5] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  for (uint64_t i = 0; i != 4; ++i)
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"tile%d", i);
    v7[0] = @"Name";
    v7[1] = @"Width";
    v8[0] = v4;
    v8[1] = &unk_270E984A0;
    v7[2] = @"Height";
    v7[3] = @"PixelBufferFormat";
    v8[2] = &unk_270E984B8;
    v8[3] = &unk_270E984D0;
    v7[4] = @"MetalPixelFormat";
    v8[4] = &unk_270E984E8;
    v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
    [v2 setObject:v5 atIndexedSubscript:i];
  }

  return v2;
}

- (id)configureFusionOutputDescriptions
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v5[0] = @"Name";
  v5[1] = @"Width";
  v6[0] = @"output";
  v6[1] = &unk_270E984A0;
  v5[2] = @"Height";
  v5[3] = @"PixelBufferFormat";
  v6[2] = &unk_270E984B8;
  v6[3] = &unk_270E984D0;
  v5[4] = @"MetalPixelFormat";
  v6[4] = &unk_270E984E8;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  [v2 addObject:v3];

  return v2;
}

- (int)runTIPWithBatch:(id)a3 noiseMapTexture:(id)a4 lscTexture:(id)a5 lscMetadata:(id)a6 cameraInfoByPortType:(id)a7
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12
    || ([v12 accumulator], uint64_t v17 = objc_claimAutoreleasedReturnValue(), v17, !v17)
    || !v13
    || !v14
    || !v15
    || !v16)
  {
    FigSignalErrorAt();
    goto LABEL_35;
  }
  id v82 = v15;
  if (dword_26B430EA8)
  {
    unsigned int v86 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v19 = objc_msgSend(v12, "accumulator", v76, v78);
  v20 = [v19 bandTextures];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    uint64_t v22 = 0;
    unsigned int v23 = 1;
    while (1)
    {
      v24 = [v12 accumulator];
      v25 = [v24 bandTextures];
      v26 = [v25 objectAtIndexedSubscript:v22];

      if (!v26) {
        break;
      }
      uint64_t v22 = v23;
      v27 = [v12 accumulator];
      v28 = [v27 bandTextures];
      unint64_t v29 = [v28 count];

      if (v29 <= v23++) {
        goto LABEL_13;
      }
    }
    FigSignalErrorAt();
    goto LABEL_41;
  }
LABEL_13:
  if ([(RawNightModeTiledInferenceProvider *)self->_tripodFusionTiledInferenceProvider allocateMemory])
  {
    uint64_t v78 = v80;
    LODWORD(v76) = 0;
    FigDebugAssert3();
LABEL_41:
    id v15 = v82;
    goto LABEL_35;
  }
  id v81 = v16;
  v31 = [v12 nonReferenceFrames];
  v32 = [v31 objectAtIndexedSubscript:0];
  v33 = -[RawNightModeInputFrame textures]((uint64_t)v32);
  v34 = [v33 objectAtIndexedSubscript:0];
  uint64_t v35 = 2 * [v34 width];
  v36 = [(RawNightModeTiledInferenceProvider *)self->_tripodFusionTiledInferenceProvider config];
  [v36 setOutputWidth:v35];

  v37 = [v12 nonReferenceFrames];
  v38 = [v37 objectAtIndexedSubscript:0];
  v39 = -[RawNightModeInputFrame textures]((uint64_t)v38);
  v40 = [v39 objectAtIndexedSubscript:0];
  uint64_t v41 = 2 * [v40 height];
  v42 = [(RawNightModeTiledInferenceProvider *)self->_tripodFusionTiledInferenceProvider config];
  [v42 setOutputHeight:v41];

  [(RawNightModePreTripodFusion *)self->_preTripodFusionPlugin setBatch:v12];
  [(RawNightModePreTripodFusion *)self->_preTripodFusionPlugin setLscGainsTexture:v14];
  if ((unint64_t)[v12 count] > 4)
  {
    uint64_t v78 = v80;
    LODWORD(v76) = 0;
LABEL_43:
    FigDebugAssert3();
    goto LABEL_44;
  }
  unint64_t v43 = 0;
  uint64_t v44 = 80;
  v45 = (_OWORD *)MEMORY[0x263EF89A0];
  do
  {
    if ([v12 count] - 1 >= v43)
    {
      v48 = [v12 nonReferenceFrames];
      v49 = [v48 objectAtIndexedSubscript:v43];

      if (!v49)
      {
        uint64_t v78 = v80;
        LODWORD(v76) = 0;
        goto LABEL_43;
      }
      v50 = (_OWORD *)((char *)self + v44);
      v51 = -[RawNightModeInputFrame properties]((uint64_t)v49);
      v52 = (_OWORD *)[v51 regHomography];
      long long v54 = v52[1];
      long long v53 = v52[2];
      _OWORD *v50 = *v52;
      v50[1] = v54;
      v50[2] = v53;
    }
    else
    {
      v46 = (_OWORD *)((char *)self + v44);
      long long v47 = v45[1];
      _OWORD *v46 = *v45;
      v46[1] = v47;
      v46[2] = v45[2];
    }
    ++v43;
    v44 += 48;
  }
  while (v43 != 4);
  v55 = [v12 nonReferenceFrames];
  v56 = [v55 objectAtIndexedSubscript:0];
  *(_DWORD *)&self->_anon_60[176] = -[RawNightModeInputFrame firstPix]((uint64_t)v56);

  v57 = [v12 nonReferenceFrames];
  v58 = [v57 objectAtIndexedSubscript:0];
  self->_anon_60[180] = -[RawNightModeInputFrame cfaLayout]((uint64_t)v58) == 3;

  self->_anon_60[181] = 0;
  if ([v12 isFirstBatch])
  {
    v59 = [v12 nonReferenceFrames];
    v60 = [v59 objectAtIndexedSubscript:0];

    v61 = -[RawNightModeInputFrame metadata]((uint64_t)v60);
    id v15 = v82;
    int v62 = +[RawNightModeProcessor populateLSCWBGParamsFromMetadata:v61 cameraInfoByPortType:v81 lscGainMapParameters:v82 params:&self->_anon_60[416]];

    if (v62)
    {
      uint64_t v78 = v80;
      LODWORD(v76) = v62;
      FigDebugAssert3();
    }
    else
    {
      v63 = -[RawNightModeInputFrame metadata]((uint64_t)v60);
      int v64 = [(RawNightModeTripodFusion *)self updateParametersFromMetadata:v63 tuningParameters:self->_tuningParameters params:&self->_params];

      if (!v64)
      {

        goto LABEL_25;
      }
      uint64_t v78 = v80;
      LODWORD(v76) = v64;
      FigDebugAssert3();
      id v15 = v82;
    }

    goto LABEL_45;
  }
LABEL_25:
  memcpy(__dst, &self->_params, 0x1F0uLL);
  [(RawNightModePreTripodFusion *)self->_preTripodFusionPlugin setFusionParams:__dst];
  memcpy(v83, &self->_params, sizeof(v83));
  [(RawNightModePostTripodFusion *)self->_postTripodFusionPlugin setFusionParams:v83];
  [(RawNightModePostTripodFusion *)self->_postTripodFusionPlugin setBatch:v12];
  [(RawNightModePostTripodFusion *)self->_postTripodFusionPlugin setNoiseMapTex:v13];
  v65 = [v12 nonReferenceFrames];
  unint64_t v66 = [v65 count];

  if (v66 >= 0x3E8)
  {
    uint64_t v78 = v80;
    LODWORD(v76) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_44:
    id v15 = v82;
LABEL_45:
    id v16 = v81;
    goto LABEL_35;
  }
  postTripodFusionPlugin = self->_postTripodFusionPlugin;
  v68 = [v12 nonReferenceFrames];
  -[RawNightModePostTripodFusion setTotalFusedFrameCount:](postTripodFusionPlugin, "setTotalFusedFrameCount:", -[RawNightModePostTripodFusion totalFusedFrameCount](postTripodFusionPlugin, "totalFusedFrameCount")+ [v68 count]);

  id v16 = v81;
  if (dword_26B430EA8)
  {
    unsigned int v86 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v69 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v70 = v86;
    if (os_log_type_enabled(v69, type)) {
      unsigned int v71 = v70;
    }
    else {
      unsigned int v71 = v70 & 0xFFFFFFFE;
    }
    if (v71)
    {
      uint64_t v72 = [v12 count];
      int v87 = 136315394;
      v88 = "-[RawNightModeTripodFusion runTIPWithBatch:noiseMapTexture:lscTexture:lscMetadata:cameraInfoByPortType:]";
      __int16 v89 = 2048;
      uint64_t v90 = v72;
      LODWORD(v78) = 22;
      v76 = &v87;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v15 = v82;
  if ([(RawNightModeTiledInferenceProvider *)self->_tripodFusionTiledInferenceProvider runInference])
  {
    uint64_t v78 = v80;
    LODWORD(v76) = 0;
    FigDebugAssert3();
  }
LABEL_35:
  int v73 = [(RawNightModeTiledInferenceProvider *)self->_tripodFusionTiledInferenceProvider deallocateMemory];
  if (v73)
  {
    uint64_t v79 = v80;
    LODWORD(v77) = 0;
    FigDebugAssert3();
  }
  -[RawNightModePreTripodFusion setBatch:](self->_preTripodFusionPlugin, "setBatch:", 0, v77, v79);
  [(RawNightModePostTripodFusion *)self->_postTripodFusionPlugin setBatch:0];
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v91 = [0 objectAtIndexedSubscript:i];
    FigMetalDecRef();
  }
  return v73;
}

- (int)updateParametersFromMetadata:(id)a3 tuningParameters:(id)a4 params:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    LOBYTE(a5[2].var2.var3.var3[3]) = 1;
    if (self->_requiresDarkCurrentNoiseModel)
    {
      v11 = [v9 objectForKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
      [MEMORY[0x263F2EDA0] calculateNoiseModel:v8 darkCurrentNoiseTuningParams:v11];
      *(_OWORD *)&a5->var0.invalid = v14;
      a5->var0.quantizationNoiseVariance = v15;
    }
    else
    {
      [MEMORY[0x263F2EDA0] calculateBasicNoiseModel:v8];
      *(_OWORD *)&a5->var0.invalid = v14;
      a5->var0.quantizationNoiseVariance = v15;
    }
    if (a5->var0.invalid)
    {
      FigDebugAssert3();
      int v12 = -28694;
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (int)resetState
{
  return [(RawNightModeTiledInferenceProvider *)self->_tripodFusionTiledInferenceProvider resetState];
}

- (void)waitForResetStateCompletion
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_postTripodFusionPlugin, 0);
  objc_storeStrong((id *)&self->_preTripodFusionPlugin, 0);
  objc_storeStrong((id *)&self->_tripodFusionTiledInferenceProvider, 0);

  objc_storeStrong((id *)&self->_tripodFusionMetalStage, 0);
}

@end