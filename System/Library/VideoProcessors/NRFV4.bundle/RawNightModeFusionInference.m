@interface RawNightModeFusionInference
- (FigMetalContext)metalContext;
- (RawNightModeFusionInference)initWithMetalContext:(id)a3 isQuadra:(BOOL)a4 isBarrington:(BOOL)a5 requiresDarkCurrentNoiseModel:(BOOL)a6;
- (id)configureFusionInputDescriptions;
- (id)configureFusionOutputDescriptions;
- (int)getFusionParams:(RawNightModeFusionParams *)a3 withTuningParameters:(id)a4 gain:(float)a5;
- (int)resetState;
- (int)runInferenceWithInferenceData:(id)a3;
- (void)waitForResetStateCompletion;
@end

@implementation RawNightModeFusionInference

- (RawNightModeFusionInference)initWithMetalContext:(id)a3 isQuadra:(BOOL)a4 isBarrington:(BOOL)a5 requiresDarkCurrentNoiseModel:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  v46.receiver = self;
  v46.super_class = (Class)RawNightModeFusionInference;
  v12 = [(RawNightModeFusionInference *)&v46 init];
  v13 = +[RawNightModeInferenceCommon getRawNightModeNetworkBasePath];
  if (!v13)
  {
    FigDebugAssert3();
LABEL_24:
    v44 = 0;
    goto LABEL_20;
  }
  v12->_requiresDarkCurrentNoiseModel = a6;
  v14 = @"nightmode_fusion_bayer_v";
  if (v7) {
    v14 = @"nightmode_fusion_bayer_barrington_v";
  }
  if (v8) {
    v15 = @"nightmode_fusion_quadra_v";
  }
  else {
    v15 = v14;
  }
  uint64_t v16 = +[RawNightModeInferenceCommon getRawNightModeNetworkPathFromBasePath:v13 fromNetworkName:v15];
  if (!v16)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_24;
  }
  v17 = (void *)v16;
  if (!v11) {
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v12->_metalContext, a3);
  uint64_t v18 = objc_opt_new();
  fusionTiledInferenceProvider = v12->_fusionTiledInferenceProvider;
  v12->_fusionTiledInferenceProvider = (RawNightModeTiledInferenceProvider *)v18;

  if (!v12->_fusionTiledInferenceProvider) {
    goto LABEL_23;
  }
  v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v17, 0);
  [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setNetworkURLs:v20];

  v21 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider networkURLs];

  if (!v21) {
    goto LABEL_23;
  }
  [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setMetalContext:v12->_metalContext];
  [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setExecutionTarget:2];
  v22 = [RawNightModeFusionMetalStage alloc];
  v23 = [(FigMetalContext *)v12->_metalContext commandQueue];
  uint64_t v24 = [(RawNightModeFusionMetalStage *)v22 initWithCommandQueue:v23];
  fusionMetalStage = v12->_fusionMetalStage;
  v12->_fusionMetalStage = (RawNightModeFusionMetalStage *)v24;

  if (!v12->_fusionMetalStage) {
    goto LABEL_23;
  }
  uint64_t v26 = objc_opt_new();
  preFusionInferencePlugin = v12->_preFusionInferencePlugin;
  v12->_preFusionInferencePlugin = (RawNightModePreFusionInference *)v26;

  v28 = v12->_preFusionInferencePlugin;
  if (!v28) {
    goto LABEL_23;
  }
  [(RawNightModePreFusionInference *)v28 setFusionMetalStage:v12->_fusionMetalStage];
  uint64_t v29 = objc_opt_new();
  postFusionInferencePlugin = v12->_postFusionInferencePlugin;
  v12->_postFusionInferencePlugin = (RawNightModePostFusionInference *)v29;

  v31 = v12->_postFusionInferencePlugin;
  if (!v31) {
    goto LABEL_23;
  }
  [(RawNightModePostFusionInference *)v31 setFusionMetalStage:v12->_fusionMetalStage];
  [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setPreInferenceMetalStage:v12->_preFusionInferencePlugin];
  [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setPostInferenceMetalStage:v12->_postFusionInferencePlugin];
  v32 = objc_opt_new();
  [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setConfig:v32];

  v33 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config];

  if (!v33) {
    goto LABEL_23;
  }
  v34 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config];
  [v34 setEspressoStorageType:65552];

  v35 = [(RawNightModeFusionInference *)v12 configureFusionInputDescriptions];
  v36 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config];
  [v36 setNetworkInputNames:v35];

  v37 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config];
  v38 = [v37 networkInputNames];

  if (!v38) {
    goto LABEL_23;
  }
  v39 = [(RawNightModeFusionInference *)v12 configureFusionOutputDescriptions];
  v40 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config];
  [v40 setNetworkOutputNames:v39];

  v41 = [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config];
  v42 = [v41 networkOutputNames];

  if (!v42
    || ([(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider config],
        v43 = objc_claimAutoreleasedReturnValue(),
        [v43 setKtraceID:1],
        v43,
        [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider setup])
    || [(RawNightModeTiledInferenceProvider *)v12->_fusionTiledInferenceProvider preWarm])
  {
LABEL_23:
    FigDebugAssert3();

    goto LABEL_24;
  }
  v44 = v12;

LABEL_20:
  return v44;
}

- (id)configureFusionInputDescriptions
{
  return &unk_270E97BD0;
}

- (id)configureFusionOutputDescriptions
{
  v8[3] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  uint64_t v3 = 0;
  do
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"output_band_%i", v3);
    v7[0] = @"Name";
    v7[1] = @"PixelBufferFormat";
    v8[0] = v4;
    v8[1] = &unk_270E985A8;
    v7[2] = @"MetalPixelFormat";
    v8[2] = &unk_270E985C0;
    v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    [v2 addObject:v5];

    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 4);

  return v2;
}

- (int)getFusionParams:(RawNightModeFusionParams *)a3 withTuningParameters:(id)a4 gain:(float)a5
{
  id v7 = a4;
  BOOL v8 = v7;
  char v32 = 0;
  if (!v7 || !a3)
  {
    int v30 = FigSignalErrorAt();
    v10 = 0;
LABEL_23:
    id v16 = 0;
    id v23 = 0;
    id v11 = 0;
    goto LABEL_20;
  }
  v9 = [v7 objectForKeyedSubscript:@"NetworkParameters"];
  v10 = [v9 objectForKeyedSubscript:@"Fusion"];

  if (!v10)
  {
    int v30 = FigSignalErrorAt();
    goto LABEL_23;
  }
  id v11 = [v10 objectForKeyedSubscript:@"Band0FusionWeightsModulationStrength"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v30 = FigSignalErrorAt();
    id v16 = 0;
LABEL_26:
    id v23 = 0;
    goto LABEL_20;
  }
  *(float *)&double v12 = a5;
  objc_msgSend(v11, "cmi_interpolateValueForGain:", v12);
  a3->band0FusionWeightsModulationStrength = v13;
  v14 = [v10 objectForKeyedSubscript:@"StrongEdgeFusionWeightsModulation"];
  v15 = v14;
  if (!v14)
  {
    FigSignalErrorAt();
    v15 = (void *)MEMORY[0x263EFFA78];
  }
  id v16 = v15;

  int v17 = objc_msgSend(v16, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableStrongEdgeFusionWeightsModulation", 0, 0);
  a3->strongEdgeFusionWeightsModulationEnabled = v17;
  if (v17)
  {
    LODWORD(v18) = 1028443341;
    objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", @"StrongEdgeDetectionThreshold", &v32, v18);
    a3->strongEdgeDetectionThreshold = *(float *)&v19;
    if (!v32
      || (LODWORD(v19) = 1.0,
          objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", @"StrongEdgeFusionWeightsModulationStrength", &v32, v19), a3->strongEdgeFusionWeightsModulationStrength = v20, !v32))
    {
      int v30 = FigSignalErrorAt();
      goto LABEL_26;
    }
  }
  v21 = [v10 objectForKeyedSubscript:@"TopBandWeightModulation"];
  v22 = v21;
  if (!v21)
  {
    FigSignalErrorAt();
    v22 = (void *)MEMORY[0x263EFFA78];
  }
  id v23 = v22;

  int v24 = objc_msgSend(v23, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableTopBandWeightModulation", 0, 0);
  a3->topBandWeightModulationEnabled = v24;
  if (v24)
  {
    LODWORD(v25) = 1.0;
    objc_msgSend(v23, "cmi_floatValueForKey:defaultValue:found:", @"DeghostingThreshold", &v32, v25);
    float v27 = *(float *)&v26;
    if (!v32) {
      FigSignalErrorAt();
    }
    LODWORD(v26) = 1045220557;
    objc_msgSend(v23, "cmi_floatValueForKey:defaultValue:found:", @"DeghostingThresholdRadius", &v32, v26);
    float v29 = v28;
    if (!v32) {
      FigSignalErrorAt();
    }
    if (v29 <= 0.0)
    {
      int v30 = FigSignalErrorAt();
    }
    else
    {
      int v30 = 0;
      a3->deghostingThresholdUpperBound = v27 + v29;
      a3->deghostingThresholdLowerBound = v27 - v29;
    }
  }
  else
  {
    int v30 = 0;
  }
LABEL_20:

  return v30;
}

- (int)runInferenceWithInferenceData:(id)a3
{
  uint64_t v211 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  v207 = self;
  if (!v5) {
    goto LABEL_90;
  }
  id v7 = [v5 pyramid];

  if (!v7) {
    goto LABEL_90;
  }
  BOOL v8 = [v6 referenceInputFrame];

  if (!v8) {
    goto LABEL_90;
  }
  v9 = [v6 referenceInputFrame];
  v10 = [v9 metadata];

  if (!v10)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
LABEL_103:
    FigDebugAssert3();
    v99 = 0;
    v145 = 0;
    v160 = 0;
    v45 = 0;
    int v96 = -28601;
    goto LABEL_77;
  }
  id v11 = [v6 referenceInputFrame];
  v10 = [v11 inputFrameTexture];

  if (!v10)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    goto LABEL_103;
  }
  double v12 = [v6 nonReferenceInputFrames];

  if (!v12) {
    goto LABEL_90;
  }
  float v13 = [v6 nonReferenceInputFrames];
  unint64_t v14 = [v13 count];

  if (v14 >= 4) {
    goto LABEL_90;
  }
  v15 = [v6 noiseMapTexture];

  if (!v15) {
    goto LABEL_90;
  }
  id v16 = [v6 pyramid];
  int v17 = [v16 bandTextures];
  uint64_t v18 = [v17 count];

  if (v18 != 4) {
    goto LABEL_90;
  }
  double v19 = [v6 batchMetadata];

  if (!v19) {
    goto LABEL_90;
  }
  float v20 = [v6 batchMetadata];
  v10 = [v20 objectForKeyedSubscript:@"NonReferenceFrameCount"];

  if (!v10
    || ([v6 batchMetadata],
        v21 = objc_claimAutoreleasedReturnValue(),
        [v21 objectForKeyedSubscript:@"FirstLastFlags"],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v21,
        !v10))
  {
    int v96 = FigSignalErrorAt();
    v99 = 0;
    v145 = 0;
    v160 = 0;
    v45 = 0;
    goto LABEL_77;
  }
  v22 = [v6 lscGainsTexture];

  if (!v22) {
    goto LABEL_90;
  }
  id v23 = [v6 lscGainMapParameters];

  if (!v23) {
    goto LABEL_90;
  }
  int v24 = [v6 nonReferenceInputFrames];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    uint64_t v26 = 0;
    unsigned int v27 = 1;
    do
    {
      float v28 = [v6 nonReferenceInputFrames];
      float v29 = [v28 objectAtIndexedSubscript:v26];

      if (!v29) {
        goto LABEL_90;
      }
      uint64_t v26 = v27;
      int v30 = [v6 nonReferenceInputFrames];
      unint64_t v31 = [v30 count];

      BOOL v32 = v31 > v27++;
    }
    while (v32);
  }
  v33 = [v6 pyramid];
  v34 = [v33 bandTextures];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    uint64_t v36 = 0;
    unsigned int v37 = 1;
    do
    {
      v38 = [v6 pyramid];
      v39 = [v38 bandTextures];
      v40 = [v39 objectAtIndexedSubscript:v36];

      if (!v40) {
        goto LABEL_90;
      }
      uint64_t v36 = v37;
      v41 = [v6 pyramid];
      v42 = [v41 bandTextures];
      uint64_t v3 = (void *)[v42 count];

      BOOL v32 = (unint64_t)v3 > v37++;
    }
    while (v32);
  }
  if ([(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider allocateMemory])
  {
LABEL_90:
    int v96 = FigSignalErrorAt();
    v99 = 0;
    v145 = 0;
    v160 = 0;
    v45 = 0;
    v10 = 0;
    goto LABEL_77;
  }
  v43 = [(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider config];
  v10 = [v43 tileWidth];

  if (!v10)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
LABEL_107:
    FigDebugAssert3();
    v99 = 0;
    v145 = 0;
    v160 = 0;
    v45 = 0;
    int v96 = -28623;
    goto LABEL_77;
  }
  v44 = [(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider config];
  v10 = [v44 tileHeight];

  if (!v10)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    goto LABEL_107;
  }
  v10 = objc_opt_new();
  if (!v10)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    FigDebugAssert3();
    v99 = 0;
    v145 = 0;
    v160 = 0;
    v45 = 0;
LABEL_112:
    int v96 = 0;
    goto LABEL_77;
  }
  v45 = objc_opt_new();
  if (!v45)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
LABEL_111:
    FigDebugAssert3();
    v99 = 0;
    v145 = 0;
    v160 = 0;
    goto LABEL_112;
  }
  uint64_t v46 = objc_opt_new();
  if (!v46)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    goto LABEL_111;
  }
  v202 = (void *)v46;
  v47 = [v6 tilePadding];
  if (v47)
  {
    uint64_t v3 = [v6 tilePadding];
    int v48 = [v3 intValue];
  }
  else
  {
    int v48 = 24;
  }
  uint64_t v49 = v48;
  v50 = [(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider config];
  [v50 setTilePadding:v49];

  if (v47) {
  v51 = [v6 referenceInputFrame];
  }
  v52 = [v51 inputFrameTexture];
  uint64_t v53 = 2 * [v52 width];
  v54 = [(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider config];
  [v54 setOutputWidth:v53];

  v55 = [v6 referenceInputFrame];
  v56 = [v55 inputFrameTexture];
  uint64_t v57 = 2 * [v56 height];
  v58 = [(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider config];
  [v58 setOutputHeight:v57];

  v59 = [(RawNightModePreFusionInference *)self->_preFusionInferencePlugin preInferenceFrames];

  if (!v59)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    FigDebugAssert3();
LABEL_96:
    v99 = 0;
    v145 = 0;
    int v96 = -28601;
LABEL_67:
    v160 = v202;
    goto LABEL_77;
  }
  v60 = [(RawNightModePreFusionInference *)self->_preFusionInferencePlugin preInferenceFrames];
  [v60 removeAllObjects];

  v61 = [(RawNightModePreFusionInference *)self->_preFusionInferencePlugin preInferenceFrames];
  v62 = [v6 referenceInputFrame];
  [v61 addObject:v62];

  fusionMetalStage = self->_fusionMetalStage;
  v204 = [v6 referenceInputFrame];
  [v204 metadata];
  v63 = v203 = v45;
  [v6 cameraInfoByPortType];
  v64 = v206 = v10;
  v65 = [v6 lscGainMapParameters];
  v66 = [v6 rawNightModeTuningParameters];
  v67 = [v6 referenceInputFrame];
  unsigned int v199 = [v67 firstPix];
  v68 = [v6 referenceInputFrame];
  BOOL v69 = [v68 cfaLayout] == 3;
  BOOL requiresDarkCurrentNoiseModel = self->_requiresDarkCurrentNoiseModel;
  v71 = [v6 referenceInputFrame];
  [v71 aeTargetGain];
  LOBYTE(v193) = requiresDarkCurrentNoiseModel;
  -[RawNightModeFusionMetalStage updateParametersFromMetadata:cameraInfoByPortType:lscGainMapParameters:tuningParameters:firstPix:isQuadra:requiresDarkCurrentNoiseModel:aeTargetGain:](fusionMetalStage, "updateParametersFromMetadata:cameraInfoByPortType:lscGainMapParameters:tuningParameters:firstPix:isQuadra:requiresDarkCurrentNoiseModel:aeTargetGain:", v63, v64, v65, v66, v199, v69, v193);

  v10 = v206;
  v45 = v203;

  v72 = [v6 rawNightModeTuningParameters];
  [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin setRawNightModeTuningParameters:v72];

  v73 = [v6 noiseMapTexture];
  [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin setNoiseMapTexture:v73];

  v74 = [v6 pyramid];
  [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin setPyramid:v74];

  v75 = [v6 lscGainsTexture];
  [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin setLscGainsTexture:v75];

  v76 = [v6 lscGainMapParameters];
  [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin setLscGainMapParameters:v76];

  v77 = [v6 nonReferenceInputFrames];
  uint64_t v78 = [v77 count];

  if (v78)
  {
    unint64_t v79 = 0;
    while (1)
    {
      v80 = [v6 nonReferenceInputFrames];
      v81 = [v80 objectAtIndexedSubscript:v79];

      if (!v81)
      {
        uint64_t v195 = v198;
        LODWORD(v193) = 0;
        goto LABEL_95;
      }
      v82 = [v81 inputFrameTexture];

      if (!v82)
      {
        uint64_t v195 = v198;
        LODWORD(v193) = 0;
        goto LABEL_95;
      }
      v83 = [v81 shiftMapTexture];

      if (!v83)
      {
        uint64_t v195 = v198;
        LODWORD(v193) = 0;
        goto LABEL_95;
      }
      v84 = [v81 blendWeightTexture];

      if (!v84) {
        break;
      }
      v85 = [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin preInferenceFrames];
      [v85 addObject:v81];

      ++v79;
      v86 = [v6 nonReferenceInputFrames];
      unint64_t v87 = [v86 count];

      if (v87 <= v79) {
        goto LABEL_42;
      }
    }
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
LABEL_95:
    FigDebugAssert3();

    goto LABEL_96;
  }
LABEL_42:
  v88 = [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin preInferenceFrames];
  unint64_t v89 = [v88 count];

  if (v89 <= 3)
  {
    do
    {
      v90 = [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin preInferenceFrames];
      v91 = [v6 referenceInputFrame];
      [v90 addObject:v91];

      v92 = [(RawNightModePreFusionInference *)v207->_preFusionInferencePlugin preInferenceFrames];
      unint64_t v93 = [v92 count];
    }
    while (v93 < 4);
  }
  memset(v209, 0, 28);
  v94 = [v6 rawNightModeTuningParameters];
  v95 = [v6 referenceInputFrame];
  [v95 aeTargetGain];
  int v96 = -[RawNightModeFusionInference getFusionParams:withTuningParameters:gain:](v207, "getFusionParams:withTuningParameters:gain:", v209, v94);

  if (v96)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = v96;
    FigDebugAssert3();
    v99 = 0;
LABEL_116:
    v145 = 0;
    goto LABEL_67;
  }
  v97 = [v6 rawNightModeTuningParameters];
  v98 = [v97 objectForKeyedSubscript:@"LowLightGreenGhost"];
  v99 = [v98 objectForKeyedSubscript:@"greenGhostThreshold"];

  if (!v99)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    FigDebugAssert3();
    int v96 = FigSignalErrorAt();
    goto LABEL_116;
  }
  [v99 floatValue];
  int v101 = v100;
  v102 = v207;
  v103 = [(FigMetalContext *)v207->_metalContext allocator];
  v104 = (void *)[v103 newTextureDescriptor];

  if (!v104)
  {
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    FigDebugAssert3();
    v145 = 0;
    int v96 = -28603;
LABEL_66:

    goto LABEL_67;
  }
  v201 = v99;
  v205 = v6;
  uint64_t v105 = 0;
  while (2)
  {
    uint64_t v106 = 0;
    char v107 = 1;
    do
    {
      char v108 = v107;
      v109 = [(FigMetalContext *)v102->_metalContext allocator];
      v110 = (void *)[v109 newTextureDescriptor];

      v111 = objc_msgSend(NSString, "stringWithFormat:", @"scratchAccumulationTex_Band%d_%d", v105, v106);
      [v110 setLabel:v111];

      v112 = [(RawNightModeTiledInferenceProvider *)v102->_fusionTiledInferenceProvider config];
      v113 = [v112 tileWidth];
      uint64_t v114 = (int)[v113 intValue];
      v115 = [(RawNightModeTiledInferenceProvider *)v102->_fusionTiledInferenceProvider config];
      unint64_t v116 = ((unint64_t)(v114 - 2 * [v115 tilePadding]) >> v105) + 2;
      v117 = [v110 desc];
      [v117 setWidth:v116];

      v118 = [v205 pyramid];
      v119 = [v118 bandTextures];
      v120 = [v119 objectAtIndexedSubscript:v105];
      uint64_t v121 = [v120 height];
      v122 = [v110 desc];
      [v122 setHeight:v121];

      v102 = v207;
      v123 = [v110 desc];
      [v123 setPixelFormat:115];

      v124 = [v110 desc];
      [v124 setUsage:7];

      v125 = [v110 desc];
      [v125 setCompressionMode:2];

      v126 = [v110 desc];
      [v126 setCompressionFootprint:0];

      v127 = [v110 desc];
      [v127 setCompressionType:0];

      v128 = [(FigMetalContext *)v207->_metalContext allocator];
      v129 = (void *)[v128 newTextureWithDescriptor:v110];

      if (!v129)
      {
        uint64_t v195 = v198;
        LODWORD(v193) = 0;
        FigDebugAssert3();

LABEL_63:
        v145 = 0;
LABEL_64:
        int v96 = -28603;
        goto LABEL_65;
      }
      [v206 addObject:v129];

      char v107 = 0;
      uint64_t v106 = 1;
    }
    while ((v108 & 1) != 0);
    uint64_t v130 = 0;
    int v131 = 1 << v105;
    do
    {
      v132 = objc_msgSend(NSString, "stringWithFormat:", @"frame%iPyrTileTex%i", v130, v105);
      [v104 setLabel:v132];

      v133 = [(RawNightModeTiledInferenceProvider *)v207->_fusionTiledInferenceProvider config];
      v134 = [v133 tileWidth];
      uint64_t v135 = (int)[v134 intValue] / v131;
      v136 = [v104 desc];
      [v136 setWidth:v135];

      v137 = [(RawNightModeTiledInferenceProvider *)v207->_fusionTiledInferenceProvider config];
      v138 = [v137 tileHeight];
      uint64_t v139 = (int)[v138 intValue] / v131;
      v140 = [v104 desc];
      [v140 setHeight:v139];

      v141 = [v104 desc];
      [v141 setPixelFormat:115];

      v142 = [v104 desc];
      [v142 setUsage:7];

      v143 = [(FigMetalContext *)v207->_metalContext allocator];
      v144 = (void *)[v143 newTextureWithDescriptor:v104];

      if (!v144)
      {
        uint64_t v195 = v198;
        LODWORD(v193) = 0;
        FigDebugAssert3();
        goto LABEL_63;
      }
      [v203 addObject:v144];

      uint64_t v130 = (v130 + 1);
    }
    while (v130 != 4);
    if (++v105 != 4) {
      continue;
    }
    break;
  }
  if (BYTE4(v209[0]))
  {
    v145 = objc_opt_new();
    if (v145)
    {
      uint64_t v146 = 0;
      while (1)
      {
        v147 = objc_msgSend(NSString, "stringWithFormat:", @"clippingMaskPyrTileTex%i", v146);
        [v104 setLabel:v147];

        v148 = [(RawNightModeTiledInferenceProvider *)v102->_fusionTiledInferenceProvider config];
        v149 = [v148 tileWidth];
        uint64_t v150 = (int)[v149 intValue] / (1 << v146);
        v151 = [v104 desc];
        [v151 setWidth:v150];

        v152 = [(RawNightModeTiledInferenceProvider *)v207->_fusionTiledInferenceProvider config];
        v153 = [v152 tileHeight];
        v102 = v207;
        uint64_t v154 = (int)[v153 intValue] / (1 << v146);
        v155 = [v104 desc];
        [v155 setHeight:v154];

        v156 = [v104 desc];
        [v156 setPixelFormat:25];

        v157 = [v104 desc];
        [v157 setUsage:7];

        v158 = [(FigMetalContext *)v207->_metalContext allocator];
        v159 = (void *)[v158 newTextureWithDescriptor:v104];

        if (!v159) {
          break;
        }
        [v145 addObject:v159];

        uint64_t v146 = (v146 + 1);
        if (v146 == 4) {
          goto LABEL_69;
        }
      }
      uint64_t v195 = v198;
      LODWORD(v193) = 0;
LABEL_99:
      FigDebugAssert3();
      goto LABEL_64;
    }
    uint64_t v195 = v198;
    LODWORD(v193) = 0;
    FigDebugAssert3();
    int v96 = 0;
LABEL_65:
    v6 = v205;
    v10 = v206;
    v45 = v203;
    v99 = v201;
    goto LABEL_66;
  }
  v145 = 0;
LABEL_69:
  v161 = [v104 desc];
  [v161 setCompressionMode:2];

  v162 = [v104 desc];
  [v162 setCompressionFootprint:0];

  v163 = [v104 desc];
  [v163 setCompressionType:0];

  uint64_t v164 = 1;
  do
  {
    v165 = objc_msgSend(NSString, "stringWithFormat:", @"intermediatePyrTile%i", v164);
    [v104 setLabel:v165];

    v166 = [(RawNightModeTiledInferenceProvider *)v102->_fusionTiledInferenceProvider config];
    v167 = [v166 tileWidth];
    uint64_t v168 = (int)[v167 intValue] / (1 << v164);
    v169 = [v104 desc];
    [v169 setWidth:v168];

    v170 = [(RawNightModeTiledInferenceProvider *)v207->_fusionTiledInferenceProvider config];
    v171 = [v170 tileHeight];
    v102 = v207;
    uint64_t v172 = (int)[v171 intValue] / (1 << v164);
    v173 = [v104 desc];
    [v173 setHeight:v172];

    v174 = [v104 desc];
    [v174 setPixelFormat:115];

    v175 = [v104 desc];
    [v175 setUsage:7];

    v176 = [(FigMetalContext *)v207->_metalContext allocator];
    v177 = (void *)[v176 newTextureWithDescriptor:v104];

    if (!v177)
    {
      uint64_t v195 = v198;
      LODWORD(v193) = 0;
      goto LABEL_99;
    }
    [v202 addObject:v177];

    uint64_t v164 = (v164 + 1);
  }
  while (v164 != 4);
  v160 = v202;
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setAccumPyrTexArray:v202];

  v6 = v205;
  v178 = [v205 rawNightModeTuningParameters];
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setRawNightModeTuningParameters:v178];

  v179 = [v205 ggMaxFusionWeights];
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setGgMaxFusionWeights:v179];

  v180 = [v205 noiseMapTexture];
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setNoiseMapTexture:v180];

  v181 = [v205 pyramid];
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setPyramid:v181];

  v10 = v206;
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setScratchPyramidTexArray:v206];
  v45 = v203;
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setFramesPyrTileTexArray:v203];
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setAccumPyrTexArray:v202];
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setClippingMaskPyrTexArray:v145];
  v182 = [v205 batchMetadata];
  v183 = [v182 objectForKeyedSubscript:@"FirstLastFlags"];
  -[RawNightModePostFusionInference setIsFirstBatch:](v207->_postFusionInferencePlugin, "setIsFirstBatch:", [v183 intValue] & 1);

  v184 = [v205 batchMetadata];
  v185 = [v184 objectForKeyedSubscript:@"NonReferenceFrameCount"];
  -[RawNightModePostFusionInference setNonReferenceFramesCount:](v207->_postFusionInferencePlugin, "setNonReferenceFramesCount:", [v185 unsignedLongValue]);

  v208[0] = v209[0];
  *(_OWORD *)((char *)v208 + 12) = *(_OWORD *)((char *)v209 + 12);
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setFusionParams:v208];
  LODWORD(v186) = v101;
  [(RawNightModePostFusionInference *)v207->_postFusionInferencePlugin setGreenGhostThreshold:v186];
  if (dword_26B430EA8)
  {
    v187 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = v205;
    v160 = v202;
  }
  if ([(RawNightModeTiledInferenceProvider *)v207->_fusionTiledInferenceProvider runInference])
  {
    int v96 = FigSignalErrorAt();
  }
  else
  {
    int v96 = 0;
  }
  v99 = v201;
LABEL_77:
  if ([(RawNightModeTiledInferenceProvider *)v207->_fusionTiledInferenceProvider deallocateMemory])
  {
    uint64_t v197 = v198;
    LODWORD(v194) = 0;
    FigDebugAssert3();
  }
  for (uint64_t i = 0; i != 16; ++i)
  {
    objc_msgSend(v45, "objectAtIndexedSubscript:", i, v194, v197);
    id v210 = (id)objc_claimAutoreleasedReturnValue();
    FigMetalDecRef();
  }
  for (uint64_t j = 0; j != 3; ++j)
  {
    id v210 = [v160 objectAtIndexedSubscript:j];
    FigMetalDecRef();
  }
  if ([v10 count])
  {
    unint64_t v190 = 0;
    do
    {
      id v210 = [v10 objectAtIndexedSubscript:v190];
      FigMetalDecRef();

      ++v190;
    }
    while ([v10 count] > v190);
  }
  if (BYTE4(v209[0]))
  {
    for (uint64_t k = 0; k != 4; ++k)
    {
      id v210 = [v145 objectAtIndexedSubscript:k];
      FigMetalDecRef();
    }
  }

  return v96;
}

- (int)resetState
{
  return [(RawNightModeTiledInferenceProvider *)self->_fusionTiledInferenceProvider resetState];
}

- (void)waitForResetStateCompletion
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_postFusionInferencePlugin, 0);
  objc_storeStrong((id *)&self->_preFusionInferencePlugin, 0);
  objc_storeStrong((id *)&self->_fusionTiledInferenceProvider, 0);

  objc_storeStrong((id *)&self->_fusionMetalStage, 0);
}

@end