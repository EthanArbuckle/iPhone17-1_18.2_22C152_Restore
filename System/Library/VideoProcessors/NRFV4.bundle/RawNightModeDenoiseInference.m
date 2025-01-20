@interface RawNightModeDenoiseInference
- (FigMetalContext)metalContext;
- (RawNightModeDenoiseInference)initWithMetalContext:(id)a3 isQuadra:(BOOL)a4 isBarrington:(BOOL)a5 isArgyleTripodMax:(BOOL)a6;
- (id)configureDenoiseInputDescriptions;
- (id)configureDenoiseOutputDescriptions;
- (int)resetState;
- (int)runInferenceWithInferenceData:(id)a3;
- (void)waitForResetStateCompletion;
@end

@implementation RawNightModeDenoiseInference

- (RawNightModeDenoiseInference)initWithMetalContext:(id)a3 isQuadra:(BOOL)a4 isBarrington:(BOOL)a5 isArgyleTripodMax:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  v46.receiver = self;
  v46.super_class = (Class)RawNightModeDenoiseInference;
  v12 = [(RawNightModeDenoiseInference *)&v46 init];
  v13 = +[RawNightModeInferenceCommon getRawNightModeNetworkBasePath];
  if (!v13)
  {
    FigDebugAssert3();
LABEL_26:
    v44 = 0;
    goto LABEL_22;
  }
  v14 = @"nightmode_dnr_bayer_v";
  if (v6) {
    v14 = @"nightmode_dnr_bayer_argyle_tripod_max_v";
  }
  if (v7) {
    v14 = @"nightmode_dnr_bayer_barrington_v";
  }
  if (v8) {
    v15 = @"nightmode_dnr_quadra_v";
  }
  else {
    v15 = v14;
  }
  uint64_t v16 = +[RawNightModeInferenceCommon getRawNightModeNetworkPathFromBasePath:v13 fromNetworkName:v15];
  if (!v16)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_26;
  }
  v17 = (void *)v16;
  if (!v11) {
    goto LABEL_25;
  }
  objc_storeStrong((id *)&v12->_metalContext, a3);
  uint64_t v18 = objc_opt_new();
  denoiseTiledInferenceProvider = v12->_denoiseTiledInferenceProvider;
  v12->_denoiseTiledInferenceProvider = (RawNightModeTiledInferenceProvider *)v18;

  if (!v12->_denoiseTiledInferenceProvider) {
    goto LABEL_25;
  }
  v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v17, 0);
  [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setNetworkURLs:v20];

  v21 = [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider networkURLs];

  if (!v21) {
    goto LABEL_25;
  }
  [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setMetalContext:v12->_metalContext];
  [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setExecutionTarget:2];
  v22 = [RawNightModeDenoiseMetalStage alloc];
  v23 = [(FigMetalContext *)v12->_metalContext commandQueue];
  uint64_t v24 = [(RawNightModeDenoiseMetalStage *)v22 initWithCommandQueue:v23];
  denoiseMetalStage = v12->_denoiseMetalStage;
  v12->_denoiseMetalStage = (RawNightModeDenoiseMetalStage *)v24;

  if (!v12->_denoiseMetalStage) {
    goto LABEL_25;
  }
  uint64_t v26 = objc_opt_new();
  preDenoiseInferencePlugin = v12->_preDenoiseInferencePlugin;
  v12->_preDenoiseInferencePlugin = (RawNightModePreDenoiseInference *)v26;

  v28 = v12->_preDenoiseInferencePlugin;
  if (!v28) {
    goto LABEL_25;
  }
  [(RawNightModePreDenoiseInference *)v28 setDenoiseMetalStage:v12->_denoiseMetalStage];
  uint64_t v29 = objc_opt_new();
  postDenoiseInferencePlugin = v12->_postDenoiseInferencePlugin;
  v12->_postDenoiseInferencePlugin = (RawNightModePostDenoiseInference *)v29;

  v31 = v12->_postDenoiseInferencePlugin;
  if (!v31) {
    goto LABEL_25;
  }
  [(RawNightModePostDenoiseInference *)v31 setDenoiseMetalStage:v12->_denoiseMetalStage];
  [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setPreInferenceMetalStage:v12->_preDenoiseInferencePlugin];
  [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setPostInferenceMetalStage:v12->_postDenoiseInferencePlugin];
  v32 = objc_opt_new();
  [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setConfig:v32];

  v33 = v12->_denoiseTiledInferenceProvider;
  if (!v33) {
    goto LABEL_25;
  }
  v34 = [(RawNightModeTiledInferenceProvider *)v33 config];
  [v34 setEspressoStorageType:65552];

  v35 = [(RawNightModeDenoiseInference *)v12 configureDenoiseInputDescriptions];
  v36 = [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider config];
  [v36 setNetworkInputNames:v35];

  v37 = [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider config];
  v38 = [v37 networkInputNames];

  if (!v38) {
    goto LABEL_25;
  }
  v39 = [(RawNightModeDenoiseInference *)v12 configureDenoiseOutputDescriptions];
  v40 = [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider config];
  [v40 setNetworkOutputNames:v39];

  v41 = [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider config];
  v42 = [v41 networkOutputNames];

  if (!v42
    || ([(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider config],
        v43 = objc_claimAutoreleasedReturnValue(),
        [v43 setKtraceID:3],
        v43,
        [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider setup])
    || [(RawNightModeTiledInferenceProvider *)v12->_denoiseTiledInferenceProvider preWarm])
  {
LABEL_25:
    FigDebugAssert3();

    goto LABEL_26;
  }
  v44 = v12;

LABEL_22:
  return v44;
}

- (id)configureDenoiseInputDescriptions
{
  return &unk_270E97D20;
}

- (id)configureDenoiseOutputDescriptions
{
  return &unk_270E97D38;
}

- (int)runInferenceWithInferenceData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  v235 = 0;
  v207 = v4;
  if (!v4)
  {
    int v46 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v219 = 0;
    BOOL v8 = 0;
    goto LABEL_133;
  }
  BOOL v6 = [v4 inputs];

  if (!v6)
  {
    int v46 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v219 = 0;
    BOOL v8 = 0;
    goto LABEL_132;
  }
  BOOL v7 = [v5 inputs];
  BOOL v8 = [v7 inputRGBTexture];

  if (!v8) {
    goto LABEL_131;
  }
  v9 = [v5 inputs];
  BOOL v8 = [v9 noiseMapTexture];

  if (!v8) {
    goto LABEL_131;
  }
  v10 = [v5 inputs];
  BOOL v8 = [v10 semanticMasks];

  if (!v8) {
    goto LABEL_131;
  }
  id v11 = [v5 inputs];
  BOOL v8 = [v11 postNetworkTuningParams];

  if (!v8) {
    goto LABEL_131;
  }
  v12 = [v5 outputs];
  BOOL v8 = [v12 outputLumaTexture];

  if (!v8
    || ([v5 outputs],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 outputChromaTexture],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v13,
        !v8))
  {
LABEL_131:
    int v46 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v219 = 0;
LABEL_132:
    v5 = 0;
LABEL_133:
    id v206 = 0;
    v44 = 0;
    v208 = 0;
    v45 = 0;
    v41 = 0;
    goto LABEL_97;
  }
  v14 = [v5 inputs];
  v15 = [v14 semanticMasks];
  uint64_t v16 = [v15 personMaskTexture];
  if (v16)
  {
    v17 = [v5 inputs];
    uint64_t v18 = [v17 semanticMasks];
    v19 = [v18 skinMaskTexture];
    if (v19)
    {
      v20 = [v5 inputs];
      v21 = [v20 semanticMasks];
      v22 = [v21 hairMaskTexture];
      BOOL v220 = v22 != 0;

      v5 = v207;
    }
    else
    {
      BOOL v220 = 0;
    }
  }
  else
  {
    BOOL v220 = 0;
  }

  v23 = [v5 inputs];
  uint64_t v24 = [v23 semanticMasks];
  v25 = [v24 skinMaskTexture];

  uint64_t v26 = [v5 inputs];
  v27 = [v26 semanticMasks];
  v28 = [v27 skyMaskTexture];
  if (v28)
  {
    uint64_t v29 = [v5 inputs];
    [v29 aeTargetGain];
    float v31 = v30;
    v32 = [v5 inputs];
    v33 = [v32 postNetworkTuningParams];
    [v33 skyMaskThresholdTargetGain];
    BOOL v35 = v31 < v34;
  }
  else
  {
    BOOL v35 = 0;
  }

  v36 = [v5 inputs];
  v37 = [v36 postNetworkTuningParams];
  int v38 = [v37 enableClippingAddbackModulation];

  v39 = [v5 inputs];
  v40 = v39;
  if (v39)
  {
    [v39 biasCorrectionParams];
    int v211 = v234;
  }
  else
  {
    int v211 = 0;
  }

  if (v220)
  {
    if (v25) {
      goto LABEL_23;
    }
LABEL_140:
    uint64_t v196 = v198;
    LODWORD(v194) = 0;
    FigDebugAssert3();
    if (v35) {
      goto LABEL_24;
    }
LABEL_141:
    uint64_t v196 = v198;
    LODWORD(v194) = 0;
    FigDebugAssert3();
    goto LABEL_24;
  }
  uint64_t v196 = v198;
  LODWORD(v194) = 0;
  FigDebugAssert3();
  if (!v25) {
    goto LABEL_140;
  }
LABEL_23:
  if (!v35) {
    goto LABEL_141;
  }
LABEL_24:
  v41 = objc_opt_new();
  if (!v41 || (v217 = objc_opt_new()) == 0)
  {
    int v46 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v219 = 0;
    BOOL v8 = 0;
    v5 = 0;
    id v206 = 0;
    v44 = 0;
    v208 = 0;
    v45 = 0;
    goto LABEL_97;
  }
  v208 = objc_opt_new();
  if (!v208)
  {
    int v46 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v219 = 0;
    BOOL v8 = 0;
    v5 = 0;
    id v206 = 0;
    v44 = 0;
    v208 = 0;
LABEL_145:
    v45 = v217;
    goto LABEL_97;
  }
  v42 = objc_opt_new();
  if (!v42)
  {
    int v46 = FigSignalErrorAt();
    v43 = 0;
    goto LABEL_144;
  }
  if (v220)
  {
    v43 = objc_opt_new();
    if (!v43)
    {
LABEL_136:
      int v46 = FigSignalErrorAt();
LABEL_144:
      v47 = 0;
      v219 = 0;
      BOOL v8 = 0;
      v5 = 0;
      id v206 = 0;
      v44 = 0;
      goto LABEL_145;
    }
    if (v25)
    {
LABEL_31:
      v221 = objc_opt_new();
      if (v221)
      {
        if (v35) {
          goto LABEL_33;
        }
LABEL_37:
        v44 = 0;
        v45 = v217;
        goto LABEL_38;
      }
      goto LABEL_136;
    }
  }
  else
  {
    v43 = 0;
    if (v25) {
      goto LABEL_31;
    }
  }
  v221 = 0;
  if (!v35) {
    goto LABEL_37;
  }
LABEL_33:
  v44 = objc_opt_new();
  v45 = v217;
  if (!v44)
  {
    int v46 = FigSignalErrorAt();
    v219 = 0;
    BOOL v8 = 0;
    v5 = 0;
    id v206 = 0;
LABEL_152:
    v47 = v221;
    goto LABEL_97;
  }
LABEL_38:
  v219 = v44;
  if (v38)
  {
    BOOL v8 = objc_opt_new();
    if (!v8)
    {
      int v46 = FigSignalErrorAt();
      v5 = 0;
      id v206 = 0;
      v44 = 0;
      goto LABEL_152;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  if (v211)
  {
    v5 = objc_opt_new();
    v47 = v221;
    if (!v5) {
      goto LABEL_135;
    }
  }
  else
  {
    v5 = 0;
    v47 = v221;
  }
  if ([(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider allocateMemory])
  {
LABEL_135:
    int v46 = FigSignalErrorAt();
    id v206 = 0;
    v44 = 0;
    goto LABEL_97;
  }
  v48 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
  v49 = [v48 tileWidth];

  if (!v49)
  {
    uint64_t v196 = v198;
    LODWORD(v194) = 0;
LABEL_148:
    FigDebugAssert3();
    id v206 = 0;
    v44 = 0;
    int v46 = -28623;
    goto LABEL_152;
  }
  v50 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
  v51 = [v50 tileHeight];

  if (!v51)
  {
    uint64_t v196 = v198;
    LODWORD(v194) = 0;
    goto LABEL_148;
  }
  v218 = v43;
  v210 = v41;
  v52 = [(FigMetalContext *)self->_metalContext allocator];
  v44 = (void *)[v52 newTextureDescriptor];

  v53 = [v44 desc];
  [v53 setTextureType:2];

  v54 = [v44 desc];
  [v54 setPixelFormat:25];

  v55 = [v44 desc];
  [v55 setUsage:7];

  v56 = [v207 inputs];
  v57 = [v56 postNetworkTuningParams];
  int v58 = [v57 enableOutlierPixelCorrection];

  if (v58)
  {
    [v44 setLabel:@"opcCorrectionTexture"];
    v59 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    v60 = [v59 tileWidth];
    uint64_t v61 = (int)[v60 intValue];
    v62 = [v44 desc];
    [v62 setWidth:v61];

    v63 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    v64 = [v63 tileHeight];
    uint64_t v65 = (int)[v64 intValue];
    v66 = [v44 desc];
    [v66 setHeight:v65];

    v67 = [(FigMetalContext *)self->_metalContext allocator];
    uint64_t v68 = [v67 newTextureWithDescriptor:v44];
    v235 = (void *)v68;

    if (!v68)
    {
      uint64_t v196 = v198;
      LODWORD(v194) = 0;
      FigDebugAssert3();
      int v46 = FigSignalErrorAt();
      id v206 = 0;
      v41 = v210;
      v43 = v218;
      goto LABEL_152;
    }
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setOpcTexture:v68];
  }
  v209 = v5;
  v216 = v42;
  uint64_t v69 = 0;
  do
  {
    v70 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    v71 = [v70 tileWidth];
    uint64_t v72 = (int)[v71 intValue] / (1 << v69);
    v73 = [v44 desc];
    [v73 setWidth:v72];

    v74 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    v75 = [v74 tileHeight];
    uint64_t v76 = (int)[v75 intValue] / (1 << v69);
    v77 = [v44 desc];
    [v77 setHeight:v76];

    v78 = [v44 desc];
    [v78 setPixelFormat:25];

    v79 = objc_msgSend(NSString, "stringWithFormat:", @"denoisedLumaPyramidTexture%i", v69);
    [v44 setLabel:v79];

    v80 = [(FigMetalContext *)self->_metalContext allocator];
    v81 = (void *)[v80 newTextureWithDescriptor:v44];

    if (!v81)
    {
      v41 = v210;
      v45 = v217;
      v43 = v218;
      v47 = v221;
LABEL_129:
      uint64_t v196 = v198;
      LODWORD(v194) = 0;
      FigDebugAssert3();
      int v46 = FigSignalErrorAt();
      id v206 = 0;
      v42 = v216;
LABEL_130:
      v5 = v209;
      goto LABEL_97;
    }
    v41 = v210;
    [v210 addObject:v81];
    v82 = objc_msgSend(NSString, "stringWithFormat:", @"noisyLumaPyramidTexture%i", v69);
    [v44 setLabel:v82];

    v83 = [(FigMetalContext *)self->_metalContext allocator];
    v84 = (void *)[v83 newTextureWithDescriptor:v44];

    v45 = v217;
    if (!v84) {
      goto LABEL_128;
    }
    [v217 addObject:v84];
    v85 = objc_msgSend(NSString, "stringWithFormat:", @"snrMapPyramidTexture%i", v69);
    [v44 setLabel:v85];

    v86 = [(FigMetalContext *)self->_metalContext allocator];
    v87 = (void *)[v86 newTextureWithDescriptor:v44];

    if (!v87)
    {
LABEL_128:
      v43 = v218;
      v47 = v221;
      goto LABEL_129;
    }
    [v216 addObject:v87];
    if (v218)
    {
      v88 = objc_msgSend(NSString, "stringWithFormat:", @"bodyMaskPyramidTexture%i", v69);
      [v44 setLabel:v88];

      v89 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v90 = [v89 newTextureWithDescriptor:v44];

      if (!v90) {
        goto LABEL_128;
      }
      [v218 addObject:v90];
      v87 = (void *)v90;
    }
    if (v221)
    {
      v91 = objc_msgSend(NSString, "stringWithFormat:", @"skinMaskPyramidTexture%i", v69);
      [v44 setLabel:v91];

      v92 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v93 = [v92 newTextureWithDescriptor:v44];

      if (!v93) {
        goto LABEL_128;
      }
      [v221 addObject:v93];
      v87 = (void *)v93;
    }
    if (v219)
    {
      v94 = objc_msgSend(NSString, "stringWithFormat:", @"skyMaskPyramidTexture%i", v69);
      [v44 setLabel:v94];

      v95 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v96 = [v95 newTextureWithDescriptor:v44];

      if (!v96) {
        goto LABEL_128;
      }
      [v219 addObject:v96];
      v87 = (void *)v96;
    }
    if (v8)
    {
      v97 = objc_msgSend(NSString, "stringWithFormat:", @"addbackClippingPyrTextures%i", v69);
      [v44 setLabel:v97];

      v98 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v99 = [v98 newTextureWithDescriptor:v44];

      if (!v99) {
        goto LABEL_128;
      }
      [v8 addObject:v99];
      v87 = (void *)v99;
    }
    if (v69)
    {
      v100 = objc_msgSend(NSString, "stringWithFormat:", @"lumaWithAddbackPyramidTexture%i", (v69 - 1));
      [v44 setLabel:v100];

      v101 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v102 = [v101 newTextureWithDescriptor:v44];

      if (!v102) {
        goto LABEL_128;
      }
      [v208 addObject:v102];
      v87 = (void *)v102;
    }
    if (v211)
    {
      v103 = objc_msgSend(NSString, "stringWithFormat:", @"localDNRBiasPyramidTexture%i", v69);
      [v44 setLabel:v103];

      v104 = [v44 desc];
      [v104 setPixelFormat:115];

      v105 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v106 = [v105 newTextureWithDescriptor:v44];

      if (!v106) {
        goto LABEL_128;
      }
      [v5 addObject:v106];
      v87 = (void *)v106;
    }

    uint64_t v69 = (v69 + 1);
  }
  while (v69 != 4);
  v200 = v8;
  v107 = [v207 inputs];
  v108 = [v107 inputRGBTexture];
  int v212 = [v108 width];

  v109 = [v207 inputs];
  v110 = [v109 inputRGBTexture];
  int v111 = [v110 height];

  v112 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
  v113 = [v112 tileWidth];
  int v114 = [v113 intValue];
  v115 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
  unsigned int v116 = v114 - 2 * [v115 tilePadding];

  v117 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
  v118 = [v117 tileHeight];
  LODWORD(v112) = [v118 intValue];
  v119 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
  LODWORD(v112) = v112 - 2 * [v119 tilePadding];

  uint64_t v199 = (v116 - 1 + v111) / v112 * ((v116 - 1 + v212) / v116);
  v120 = [(FigMetalContext *)self->_metalContext device];
  v121 = (void *)[v120 newBufferWithLength:16 * (int)v199 options:0];

  id v206 = v121;
  bzero((void *)[v206 contents], 16 * (int)v199);
  v122 = [v207 inputs];
  v123 = [v122 postNetworkTuningParams];
  [(RawNightModeDenoiseMetalStage *)self->_denoiseMetalStage setPostNetworkTuningParams:v123];

  denoiseMetalStage = self->_denoiseMetalStage;
  v205 = [v207 inputs];
  v202 = [v205 metadata];
  v204 = [v207 inputs];
  v125 = [v204 cameraInfoByPortType];
  v126 = [v207 rawNightModeTuningParameters];
  v203 = [v207 inputs];
  v127 = [v203 lscGainMapParameters];
  v201 = [v207 inputs];
  unsigned int v213 = [v201 firstPix];
  v128 = [v207 inputs];
  [v128 aeTargetGain];
  int v130 = v129;
  v131 = [v207 inputs];
  uint64_t v132 = [v131 isQuadra];
  v133 = denoiseMetalStage;
  v134 = v202;
  LODWORD(v135) = v130;
  int v214 = [(RawNightModeDenoiseMetalStage *)v133 updateParametersFromMetadata:v202 cameraInfoByPortType:v125 tuningParameters:v126 lscGainMapParameters:v127 firstPix:v213 aeTargetGain:v132 isQuadra:v135];

  int v46 = v214;
  if (!v214)
  {
    v136 = [v207 tilePadding];
    if (v136)
    {
      v134 = [v207 tilePadding];
      int v137 = [v134 intValue];
    }
    else
    {
      int v137 = 24;
    }
    v42 = v216;
    BOOL v8 = v200;
    uint64_t v138 = v137;
    v139 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    [v139 setTilePadding:v138];

    if (v136) {
    v140 = [v207 outputs];
    }
    v141 = [v140 outputLumaTexture];
    uint64_t v142 = [v141 width];
    v143 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    [v143 setOutputWidth:v142];

    v144 = [v207 outputs];
    v145 = [v144 outputLumaTexture];
    uint64_t v146 = [v145 height];
    v147 = [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider config];
    [v147 setOutputHeight:v146];

    v148 = [v207 inputs];
    v149 = [v148 inputRGBTexture];
    [(RawNightModePreDenoiseInference *)self->_preDenoiseInferencePlugin setInputRGBTexture:v149];

    v150 = [v207 inputs];
    v151 = [v150 noiseMapTexture];
    [(RawNightModePreDenoiseInference *)self->_preDenoiseInferencePlugin setNoiseMapTexture:v151];

    v152 = [v207 inputs];
    v153 = [v152 lscGainsTexture];
    [(RawNightModePreDenoiseInference *)self->_preDenoiseInferencePlugin setLscGainsTexture:v153];

    v154 = [v207 inputs];
    v155 = [v154 inputRGBTexture];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setInputRGBTexture:v155];

    v156 = [v207 inputs];
    v157 = [v156 noiseMapTexture];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setNoiseMapTexture:v157];

    v158 = [v207 inputs];
    v159 = [v158 lscGainsTexture];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setLscGainsTexture:v159];

    v41 = v210;
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setDenoisedLumaPyrTextures:v210];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setNoisyLumaPyrTextures:v217];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setLumaWithAddbackPyrTextures:v208];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setSnrMapTextures:v216];
    v43 = v218;
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setBodyMaskPyrTextures:v218];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setSkinMaskPyrTextures:v221];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setSkyMaskPyrTextures:v219];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setAddbackClippingPyrTextures:v200];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setLocalDNRBiasPyrTextures:v209];
    v160 = [v207 inputs];
    v161 = [v160 semanticMasks];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setSemanticMasks:v161];

    v162 = [v207 outputs];
    v163 = [v162 outputLumaTexture];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setOutputLumaTex:v163];

    v164 = [v207 outputs];
    v165 = [v164 outputChromaTexture];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setOutputChromaTex:v165];

    v166 = [v207 outputs];
    v167 = [v166 outputClippingMapTex];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setOutputClippingMapTex:v167];

    v168 = [v207 outputs];
    v169 = [v168 outputDenoisedBand3LumaTex];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setOutputDenoisedBand3LumaTexture:v169];

    v170 = [v207 outputs];
    v171 = [v170 outputLocalDNRBiasTex];
    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setOutputLocalDNRBiasTexture:v171];

    [(RawNightModePostDenoiseInference *)self->_postDenoiseInferencePlugin setDnrBiasBuffer:v206];
    if (![(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider runInference])
    {
      v172 = [v207 outputs];

      if (v172)
      {
        v173 = [v207 inputs];
        v174 = v173;
        v47 = v221;
        if (v173 && ([v173 biasCorrectionParams], v233))
        {
          v175 = [v207 inputs];
          v176 = v175;
          v5 = v209;
          if (!v175)
          {

            v47 = v221;
            goto LABEL_90;
          }
          [v175 biasCorrectionParams];

          double v177 = 0.0;
          v47 = v221;
          if (!v232)
          {
LABEL_90:
            [(FigMetalContext *)self->_metalContext waitForIdle];
            v178 = (float32x4_t *)[v206 contents];
            if (v199)
            {
              float32x4_t v180 = 0uLL;
              uint64_t v181 = v199;
              do
              {
                float32x4_t v182 = *v178++;
                v179.i32[1] = v182.i32[1];
                float32x4_t v180 = vaddq_f32(v180, v182);
                --v181;
              }
              while (v181);
            }
            else
            {
              float32x4_t v180 = 0uLL;
            }
            *(float *)v179.i32 = (float)v199;
            *(void *)&double v177 = vdivq_f32(v180, (float32x4_t)vdupq_lane_s32(v179, 0)).u64[0];
          }
        }
        else
        {

          double v177 = 0.0;
          v5 = v209;
        }
        double v222 = v177;
        v183 = [v207 outputs];
        [v183 setOutputGlobalDnrBias:v222];

        int v46 = 0;
        v43 = v218;
        goto LABEL_97;
      }
    }
    int v46 = FigSignalErrorAt();
    v47 = v221;
    goto LABEL_130;
  }
  uint64_t v196 = v198;
  LODWORD(v194) = v214;
  FigDebugAssert3();
  v5 = v209;
  v41 = v210;
  v42 = v216;
  v43 = v218;
  v47 = v221;
  BOOL v8 = v200;
LABEL_97:
  int v215 = v46;
  if ([(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider deallocateMemory])
  {
    uint64_t v197 = v198;
    LODWORD(v195) = 0;
    FigDebugAssert3();
  }
  if (objc_msgSend(v41, "count", v195, v197))
  {
    unint64_t v184 = 0;
    do
    {
      v223 = [v41 objectAtIndexedSubscript:v184];
      FigMetalDecRef();

      ++v184;
    }
    while ([v41 count] > v184);
  }
  if ([v45 count])
  {
    unint64_t v185 = 0;
    do
    {
      v224 = [v45 objectAtIndexedSubscript:v185];
      FigMetalDecRef();

      ++v185;
    }
    while ([v45 count] > v185);
  }
  if ([v208 count])
  {
    unint64_t v186 = 0;
    do
    {
      v225 = [v208 objectAtIndexedSubscript:v186];
      FigMetalDecRef();

      ++v186;
    }
    while ([v208 count] > v186);
  }
  if ([v219 count])
  {
    unint64_t v187 = 0;
    do
    {
      v226 = [v219 objectAtIndexedSubscript:v187];
      FigMetalDecRef();

      ++v187;
    }
    while ([v219 count] > v187);
  }
  if ([v47 count])
  {
    unint64_t v188 = 0;
    do
    {
      v227 = [v47 objectAtIndexedSubscript:v188];
      FigMetalDecRef();

      ++v188;
    }
    while ([v47 count] > v188);
  }
  if ([v43 count])
  {
    unint64_t v189 = 0;
    do
    {
      v228 = [v43 objectAtIndexedSubscript:v189];
      FigMetalDecRef();

      ++v189;
    }
    while ([v43 count] > v189);
  }
  if ([v42 count])
  {
    unint64_t v190 = 0;
    do
    {
      v229 = [v42 objectAtIndexedSubscript:v190];
      FigMetalDecRef();

      ++v190;
    }
    while ([v42 count] > v190);
  }
  if ([v8 count])
  {
    unint64_t v191 = 0;
    do
    {
      v230 = [v8 objectAtIndexedSubscript:v191];
      FigMetalDecRef();

      ++v191;
    }
    while ([v8 count] > v191);
  }
  if ([v5 count])
  {
    unint64_t v192 = 0;
    do
    {
      v231 = [v5 objectAtIndexedSubscript:v192];
      FigMetalDecRef();

      ++v192;
    }
    while ([v5 count] > v192);
  }
  FigMetalDecRef();

  return v215;
}

- (int)resetState
{
  return [(RawNightModeTiledInferenceProvider *)self->_denoiseTiledInferenceProvider resetState];
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
  objc_storeStrong((id *)&self->_postDenoiseInferencePlugin, 0);
  objc_storeStrong((id *)&self->_preDenoiseInferencePlugin, 0);
  objc_storeStrong((id *)&self->_denoiseTiledInferenceProvider, 0);

  objc_storeStrong((id *)&self->_denoiseMetalStage, 0);
}

@end