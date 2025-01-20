@interface CMIPost
- (BOOL)stfStillApplied;
- (CMIPost)initWithMetalContext:(id)a3;
- (id)getSTFLTM_asNSData;
- (int)getSTFStillCorrectionStrength:(BOOL)a3;
- (int)runPostWithConfig:(id)a3;
- (int)setupMIWB:(id)a3;
- (int)setupSTFProcessor:(id)a3;
- (unsigned)getSRLStatus;
- (unsigned)stfStillAnalyticsVersion;
- (void)reset;
@end

@implementation CMIPost

- (CMIPost)initWithMetalContext:(id)a3
{
  v32[22] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CMIPost;
  v6 = [(CMIPost *)&v30 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v8 = [[ToneMappingStage alloc] initWithContext:v7->_metal mtlSuballocatorID:255];
  toneMappingStage = v7->_toneMappingStage;
  v7->_toneMappingStage = v8;

  if (!v7->_toneMappingStage) {
    goto LABEL_10;
  }
  v10 = [[SemanticStylesStage alloc] initWithMetalContext:v7->_metal];
  semanticStylesStage = v7->_semanticStylesStage;
  v7->_semanticStylesStage = v10;

  if (!v7->_semanticStylesStage) {
    goto LABEL_10;
  }
  v12 = [PyramidStage alloc];
  v31[0] = @"PyrGen.CompensateGpuShift";
  v31[1] = @"PyrGen.UseHW";
  v32[0] = &unk_270E98578;
  v32[1] = &unk_270E98590;
  v31[2] = @"PyrGen.SupportFP16";
  v32[2] = &unk_270E98578;
  v13 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  uint64_t v14 = [(PyramidStage *)v12 initWithOptions:v13 context:v7->_metal];
  pyramidStage = v7->_pyramidStage;
  v7->_pyramidStage = (PyramidStage *)v14;

  if (!v7->_pyramidStage) {
    goto LABEL_10;
  }
  v16 = [[ColorCubeCorrectionStage alloc] init:v7->_metal];
  colorCubeCorrectionStage = v7->_colorCubeCorrectionStage;
  v7->_colorCubeCorrectionStage = v16;

  if (!v7->_colorCubeCorrectionStage) {
    goto LABEL_10;
  }
  v18 = [[OutliersRemovalStage alloc] initWithMetalContext:v7->_metal];
  outliersRemovalStage = v7->_outliersRemovalStage;
  v7->_outliersRemovalStage = v18;

  if (!v7->_outliersRemovalStage) {
    goto LABEL_10;
  }
  v20 = [[TextureUtils alloc] initWithMetalContext:v7->_metal];
  textureUtils = v7->_textureUtils;
  v7->_textureUtils = v20;

  if (!v7->_textureUtils) {
    goto LABEL_10;
  }
  v22 = [[AMBNRStage alloc] initWithContext:v7->_metal];
  ambnrStage = v7->_ambnrStage;
  v7->_ambnrStage = v22;

  if (!v7->_ambnrStage
    || (v24 = [[MIWB alloc] initWithMetalContext:v7->_metal],
        miwbStage = v7->_miwbStage,
        v7->_miwbStage = v24,
        miwbStage,
        v26 = v7,
        !v7->_miwbStage))
  {
LABEL_10:
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_11:
    v26 = 0;
  }
  v28 = v26;

  return v28;
}

- (void)reset
{
}

- (int)setupSTFProcessor:(id)a3
{
  return [(ToneMappingStage *)self->_toneMappingStage setupSTFProcessor:a3];
}

- (int)setupMIWB:(id)a3
{
  return [(MIWB *)self->_miwbStage setupWithOptions:a3];
}

- (int)runPostWithConfig:(id)a3
{
  uint64_t v317 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 inputLuma];
  id v312 = v5;
  v6 = [v4 inputChroma];
  id v311 = v6;
  id v294 = [v4 inputDenoiseLocalGainMap];
  v7 = [v4 outputLuma];
  v283 = [v4 outputChroma];
  v8 = [v4 skinMask];
  id v292 = [v4 skyMask];
  id v285 = [v4 personMask];
  id location = 0;
  id v309 = 0;
  id obj = 0;
  id v307 = 0;
  id v306 = 0;
  id v305 = 0;
  id v304 = 0;
  v9 = [v4 darkestFrameMetadata];
  v291 = [v4 ev0FrameMetadata];
  v295 = self;
  v10 = [(FigMetalContext *)self->_metal allocator];
  v11 = (void *)[v10 newTextureDescriptor];

  v288 = v9;
  if (!v11) {
    goto LABEL_132;
  }
  if ([v4 disableTextureCompression])
  {
    v12 = [v11 desc];
    [v12 setCompressionMode:2];

    v13 = [v11 desc];
    [v13 setCompressionFootprint:0];
  }
  int v14 = [v4 checkIfValid];
  if (v14) {
    goto LABEL_200;
  }
  v15 = [v4 sidecarWriter];
  [(ToneMappingStage *)v295->_toneMappingStage setSidecarWriter:v15];

  int v16 = [v4 allowTonemapping];
  v286 = v11;
  v287 = v7;
  if (![v4 enableMIWB]
    || (BOOL v17 = [(MIWB *)v295->_miwbStage canRunMIWB:v9], !v16)
    || !v5
    || !v6
    || !v292
    || !v8
    || !v17)
  {
    [v4 setHazeAppliedInMIWB:0];
    id obj = v5;
    id v282 = 0;
    id v284 = 0;
    id v307 = v6;
    goto LABEL_23;
  }
  int v14 = -[MIWB configWithFrameMetaData:miwbInputHasCCMApplied:](v295->_miwbStage, "configWithFrameMetaData:miwbInputHasCCMApplied:", v9, [v4 tmApplyColorCorrectionMatrix] ^ 1);
  if (v14)
  {
LABEL_200:
    int v89 = v14;
    LODWORD(v313) = 0;
    LOBYTE(type) = 0;
    v204 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT);
    goto LABEL_253;
  }
  if (![(MIWB *)v295->_miwbStage configured])
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();
    id v282 = 0;
    id v284 = 0;
    id v61 = 0;
    id v293 = 0;
    goto LABEL_202;
  }
  v18 = [(FigMetalContext *)v295->_metal allocator];
  v19 = (void *)[v18 newTextureDescriptor];

  if (!v19)
  {
LABEL_132:
    LODWORD(v313) = 0;
    LOBYTE(type) = 0;
    v204 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT);
    int v89 = -73430;
LABEL_253:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v282 = 0;
    id v284 = 0;
    goto LABEL_254;
  }
  v20 = [(FigMetalContext *)v295->_metal allocator];
  v21 = (void *)[v20 newTextureDescriptor];

  v22 = [v21 desc];
  [v22 setUsage:7];

  v23 = [v21 desc];
  [v23 setPixelFormat:25];

  v24 = [v21 desc];
  [v24 setCompressionMode:2];

  v25 = [v21 desc];
  [v25 setCompressionFootprint:0];

  uint64_t v26 = [v5 width];
  v27 = [v21 desc];
  [v27 setWidth:v26];

  uint64_t v28 = [v5 height];
  v29 = [v21 desc];
  [v29 setHeight:v28];

  [v21 setLabel:0];
  objc_super v30 = [(FigMetalContext *)v295->_metal allocator];
  uint64_t v31 = [v30 newTextureWithDescriptor:v21];

  if (!v31)
  {
    LODWORD(v313) = 0;
    LOBYTE(type) = 0;
    v241 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT);
    int v89 = -73430;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v282 = 0;
    id v284 = 0;
LABEL_255:
    id v61 = 0;
    id v293 = 0;
    goto LABEL_219;
  }
  id v284 = (id)v31;
  v32 = [v21 desc];
  [v32 setPixelFormat:65];

  v33 = [v21 desc];
  objc_msgSend(v33, "setWidth:", (unint64_t)objc_msgSend(v33, "width") >> 1);

  v34 = [v21 desc];
  objc_msgSend(v34, "setHeight:", (unint64_t)objc_msgSend(v34, "height") >> 1);

  [v21 setLabel:0];
  v35 = [(FigMetalContext *)v295->_metal allocator];
  v36 = (void *)[v35 newTextureWithDescriptor:v21];

  if (!v36)
  {
    LODWORD(v313) = 0;
    LOBYTE(type) = 0;
    v242 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT);
    int v89 = -73430;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v282 = 0;
    goto LABEL_255;
  }

  int v37 = [v4 hazeAppliedInMIWB];
  *(void *)&long long v38 = 0;
  v11 = v286;
  if (v37)
  {
    if (*(unsigned char *)(objc_msgSend(v291, "ltmCurves", 0.0) + 223072)) {
      long long v38 = *(_OWORD *)([v291 ltmCurves] + 223056);
    }
    else {
      *(void *)&long long v38 = 0;
    }
  }
  [(MIWB *)v295->_miwbStage runWithInLinearLumaTex:v5 inLinearChromaTex:v6 inSkyMaskTex:v292 inSkinMaskTex:v8 inHazeCorrection:v284 outLinearLumaTex:v36 outLinearChromaTex:*(double *)&v38];
  id v284 = v284;
  id obj = v284;
  id v282 = v36;
  id v307 = v282;
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_23:
  if ([v4 requestLinearMIWBAppliedOutput])
  {
    [v4 setMiwbOutputLumaTexture:obj];
    [v4 setMiwbOutputChromaTexture:v307];
    FigMetalIncRef();
    FigMetalIncRef();
  }
  v39 = v295;
  if (!v294)
  {
    if ([v4 autoAllocateLocalGainMap]
      && [v4 allowDenoiseAndSharpening]
      && [v4 allowTonemapping])
    {
      uint64_t v40 = [v307 width];
      v41 = [v11 desc];
      [v41 setWidth:v40];

      uint64_t v42 = [v307 height];
      v43 = [v11 desc];
      [v43 setHeight:v42];

      v44 = [v11 desc];
      [v44 setPixelFormat:25];

      [v11 setLabel:0];
      v45 = [(FigMetalContext *)v295->_metal allocator];
      v46 = (void *)[v45 newTextureWithDescriptor:v11];
      id v47 = location;
      id location = v46;

      if (!location)
      {
        LODWORD(v313) = 0;
        LOBYTE(type) = 0;
        v258 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT);
        int v89 = -73430;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        id v61 = 0;
        id v293 = 0;
        id v294 = 0;
        goto LABEL_219;
      }
      id v294 = location;
    }
    else
    {
      id v294 = 0;
    }
  }
  if ([v4 allowTonemapping] && objc_msgSend(v4, "allowDenoiseAndSharpening"))
  {
    v48 = [v11 desc];
    [v48 setUsage:7];

    v49 = [v11 desc];
    [v49 setPixelFormat:25];

    uint64_t v50 = [v7 width];
    v51 = [v11 desc];
    [v51 setWidth:v50];

    uint64_t v52 = [v7 height];
    v53 = [v11 desc];
    [v53 setHeight:v52];

    [v11 setLabel:0];
    v54 = [(FigMetalContext *)v295->_metal allocator];
    v55 = (void *)[v54 newTextureWithDescriptor:v11];
    id v306 = v55;

    if (v55)
    {
      v56 = [v11 desc];
      [v56 setPixelFormat:65];

      v57 = [v11 desc];
      objc_msgSend(v57, "setWidth:", (unint64_t)objc_msgSend(v57, "width") >> 1);

      v58 = [v11 desc];
      objc_msgSend(v58, "setHeight:", (unint64_t)objc_msgSend(v58, "height") >> 1);

      [v11 setLabel:0];
      v59 = [(FigMetalContext *)v295->_metal allocator];
      v60 = (void *)[v59 newTextureWithDescriptor:v11];
      id v305 = v60;

      if (v60)
      {
        id v293 = v55;
        id v61 = v60;
        v39 = v295;
        goto LABEL_38;
      }
    }
    LODWORD(v313) = 0;
    LOBYTE(type) = 0;
    v240 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT);
    int v89 = -73430;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_254:
    id v61 = 0;
    id v293 = 0;
    goto LABEL_131;
  }
  id v293 = [v4 outputLuma];
  id v61 = [v4 outputChroma];
LABEL_38:
  v281 = v8;
  if ([v4 allowTonemapping])
  {
    v289 = v61;
    uint64_t v62 = [v4 toneMappingPlist];
    v63 = [v4 toneMappingCurves];
    uint64_t v64 = [v9 ltmCurves];
    uint64_t v65 = [v291 ltmCurves];
    uint64_t v66 = [v9 ltmCurvesForBackground];
    [v291 colorCorrectionMatrix];
    v279 = (void *)v62;
    int v67 = objc_msgSend(v63, "setToneCurvesWithLTC:GTC:backgroundCurves:colorCorrectionMatrix:enableUTM:dump:", v64, v65, v66, *(unsigned __int8 *)(v62 + 96), 0);
    if (v67)
    {
      int v89 = v67;
      LODWORD(v313) = 0;
      LOBYTE(type) = 0;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v68 = (ToneMappingBuffers *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(&v68->super, OS_LOG_TYPE_DEFAULT);
      id v61 = v289;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_218:

LABEL_219:
      v9 = v288;
      v11 = v286;
      goto LABEL_203;
    }
    if ([v4 hazeAppliedInMIWB]) {
      v63[9] = 0u;
    }
    v68 = objc_alloc_init(ToneMappingBuffers);
    if (v68)
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        v70 = v68->instanceMasks[i];
        v68->instanceMasks[i] = 0;
      }
      objc_storeStrong((id *)&v68->inLumaTex, obj);
      objc_storeStrong((id *)&v68->inChromaTex, v307);
      objc_storeStrong((id *)&v68->localGainMapTex, location);
      objc_storeStrong((id *)&v68->outLumaTex, v293);
      objc_storeStrong((id *)&v68->outChromaTex, v289);
      objc_storeStrong((id *)&v68->curves, v63);
      objc_storeStrong((id *)&v68->skinMask, v8);
      objc_storeStrong((id *)&v68->personMask, v285);
      objc_storeStrong((id *)&v68->skyMask, v292);
      uint64_t v71 = [v4 faceLandmarks];
      faceLandmarks = v68->faceLandmarks;
      v68->faceLandmarks = (NSArray *)v71;

      uint64_t v73 = [v4 skinToneClassificationsForFaces];
      skinToneClassification = v68->skinToneClassification;
      v68->skinToneClassification = (NSArray *)v73;

      uint64_t v75 = [v4 lowResPersonInstanceConfidences];
      maskConfidences = v68->maskConfidences;
      v68->maskConfidences = (NSArray *)v75;

      long long v302 = 0u;
      long long v303 = 0u;
      long long v300 = 0u;
      long long v301 = 0u;
      v77 = [v4 instanceMasks];
      uint64_t v78 = [v77 countByEnumeratingWithState:&v300 objects:v316 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        int v80 = 0;
        uint64_t v81 = *(void *)v301;
        do
        {
          uint64_t v82 = 0;
          int v83 = v80;
          v84 = (id *)(&v68->super.isa + v80);
          do
          {
            if (*(void *)v301 != v81) {
              objc_enumerationMutation(v77);
            }
            objc_storeStrong(v84 + 9, *(id *)(*((void *)&v300 + 1) + 8 * v82++));
            ++v84;
          }
          while (v79 != v82);
          uint64_t v79 = [v77 countByEnumeratingWithState:&v300 objects:v316 count:16];
          int v80 = v83 + v82;
        }
        while (v79);
      }

      toneMappingStage = v295->_toneMappingStage;
      uint64_t v86 = [v293 width];
      uint64_t v87 = [v293 height];
      v88 = [v4 toneMappingPlist];
      int v89 = [(ToneMappingStage *)toneMappingStage allocateResourcesForWidth:v86 height:v87 srlVersion:v88[22]];

      if (v89)
      {
        LODWORD(v313) = 0;
        LOBYTE(type) = 0;
        v206 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v207 = v313;
        if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v208 = v207;
        }
        else {
          unsigned int v208 = v207 & 0xFFFFFFFE;
        }
        v7 = v287;
        if (v208)
        {
          *(_DWORD *)v314 = 136315394;
          *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
          *(_WORD *)&v314[12] = 1024;
          *(_DWORD *)&v314[14] = v89;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v8 = v281;
        goto LABEL_217;
      }
      v90 = v295->_toneMappingStage;
      [v4 tonemappingScaleInput];
      int v92 = v91;
      int v93 = [v4 tmApplyColorCorrectionMatrix];
      v94 = (long long *)MEMORY[0x263EF89A0];
      if (v93)
      {
        v95 = v288;
        [v288 colorCorrectionMatrix];
        double v275 = v97;
        *(void *)&long long v277 = v96;
        long long v271 = *v94;
        double v273 = v98;
        long long v267 = v94[2];
        long long v269 = v94[1];
      }
      else
      {
        long long v269 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
        long long v271 = *MEMORY[0x263EF89A0];
        double v275 = *(double *)&v269;
        long long v277 = *MEMORY[0x263EF89A0];
        long long v267 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
        double v273 = *(double *)&v267;
        v95 = v288;
      }
      int v99 = [v4 tmQuality];
      [v4 ltmGridScaling];
      double v101 = v100;
      char v102 = [v4 toneMappingInputIsLinear];
      char v103 = [v4 enableSTF];
      BYTE6(v259) = [v4 isLowLight];
      BYTE5(v259) = v103;
      BYTE4(v259) = v102;
      LODWORD(v259) = v99;
      LODWORD(v104) = v92;
      int v105 = -[ToneMappingStage runToneMapping:bilateralGrid:bilateralGridHomography:tmPlist:darkestFrameMetadata:ev0FrameMetadata:scaleInput:colorCorrection:hasChromaBias:quality:gridScaleFactor:inputIsLinear:stfAllowed:isLowLight:](v90, "runToneMapping:bilateralGrid:bilateralGridHomography:tmPlist:darkestFrameMetadata:ev0FrameMetadata:scaleInput:colorCorrection:hasChromaBias:quality:gridScaleFactor:inputIsLinear:stfAllowed:isLowLight:", v68, 0, v279, v95, v291, 0, *(double *)&v271, *(double *)&v269, *(double *)&v267, v104, *(double *)&v277, v275, v273, v101, v259);
      v8 = v281;
      if (!v105)
      {
        FigMetalDecRef();
        FigMetalDecRef();
        id v106 = obj;
        id obj = v293;
        id v107 = v293;

        id v108 = v307;
        id v307 = v289;

        id v293 = [v4 outputLuma];
        id v61 = [v4 outputChroma];

        v7 = v287;
        v9 = v288;
        v11 = v286;
        v39 = v295;
        goto LABEL_58;
      }
      int v89 = v105;
      LODWORD(v313) = 0;
      LOBYTE(type) = 0;
      v205 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v212 = v313;
      if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v213 = v212;
      }
      else {
        unsigned int v213 = v212 & 0xFFFFFFFE;
      }
      v7 = v287;
      if (v213)
      {
        *(_DWORD *)v314 = 136315138;
        *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      LODWORD(v313) = 0;
      LOBYTE(type) = 0;
      v205 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT);
      int v89 = -73430;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_217:
    id v61 = v289;
    goto LABEL_218;
  }
LABEL_58:
  id v290 = v61;
  if (![v4 allowSemanticStyles]) {
    goto LABEL_72;
  }
  uint64_t v109 = [v4 semanticStylesPlist];
  if (!v109) {
    goto LABEL_72;
  }
  v110 = (void *)v109;
  v111 = [v4 semanticStyleProperties];

  if (!v111) {
    goto LABEL_72;
  }
  v112 = v8;
  if ([v4 semStylesUseGainMap])
  {
    if (location)
    {
      if ([v4 allowDenoiseAndSharpening])
      {
        uint64_t v113 = [location width];
        v114 = [v11 desc];
        [v114 setWidth:v113];

        uint64_t v115 = [location height];
        v116 = [v11 desc];
        [v116 setHeight:v115];

        v117 = [v11 desc];
        [v117 setUsage:7];

        uint64_t v118 = [location pixelFormat];
        v119 = [v11 desc];
        [v119 setPixelFormat:v118];

        [v11 setLabel:0];
        v120 = [(FigMetalContext *)v39->_metal allocator];
        v121 = (void *)[v120 newTextureWithDescriptor:v11];
        id v122 = v309;
        id v309 = v121;

        if (!v121)
        {
          LODWORD(v313) = 0;
          LOBYTE(type) = 0;
          v243 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v256 = v313;
          if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v257 = v256;
          }
          else {
            unsigned int v257 = v256 & 0xFFFFFFFE;
          }
          if (v257)
          {
            *(_DWORD *)v314 = 136315138;
            *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
            _os_log_send_and_compose_impl();
          }
          int v89 = -73430;
          goto LABEL_267;
        }
      }
    }
  }
  semanticStylesStage = v39->_semanticStylesStage;
  v124 = [v4 semanticStyleProperties];
  v125 = [v4 semanticStylesPlist];
  int v126 = *(_DWORD *)([v288 exposureParams] + 100);
  v127 = [v4 smartCameraSceneType];
  id v128 = obj;
  id v129 = v307;
  id v130 = v309;
  if (v309) {
    id v131 = location;
  }
  else {
    id v131 = 0;
  }
  LOBYTE(v261) = [v4 isLowLight];
  LODWORD(v132) = v126;
  int v89 = [(SemanticStylesStage *)semanticStylesStage runWithStyle:v124 tuningParams:v125 refFrameLuxLevel:v127 sceneType:v128 lumaTex:v129 chromaTex:v131 gainMapTex:v132 outputGainMapTex:v130 personMaskTex:v285 skinMaskTex:v112 skyMaskTex:v292 isLowLight:v261];

  if (v89)
  {
    LODWORD(v313) = 0;
    LOBYTE(type) = 0;
    v243 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v244 = v313;
    if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v245 = v244;
    }
    else {
      unsigned int v245 = v244 & 0xFFFFFFFE;
    }
    if (v245)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
LABEL_267:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = v112;
    v7 = v287;
    v9 = v288;
    v11 = v286;
    id v61 = v290;
    goto LABEL_203;
  }
  v7 = v287;
  if (v130)
  {
    FigMetalDecRef();
    objc_storeStrong(&location, v130);

    id v309 = 0;
    id v294 = v130;
  }
  v8 = v112;
  v9 = v288;
  id v61 = v290;
  v11 = v286;
  v39 = v295;
LABEL_72:
  if ([v4 allowColorCube])
  {
    v133 = [v4 toneMappingPlist];

    if (v133)
    {
      v134 = [v4 toneMappingPlist];
      int v135 = v134[161];

      if (v135)
      {
        char v136 = 0;
        v137 = 0;
        int v138 = 1;
        int v139 = 3;
LABEL_78:
        unsigned int v266 = v139;
        goto LABEL_80;
      }
      v140 = [v4 toneMappingPlist];
      int v141 = v140[160];

      if (v141)
      {
        int v138 = 0;
        char v136 = 0;
        v137 = 0;
        int v139 = 2;
        goto LABEL_78;
      }
    }
  }
  int v138 = 0;
  char v136 = 1;
  unsigned int v266 = -1;
  v137 = v61;
LABEL_80:
  objc_storeStrong(&v304, v137);
  int v265 = v138;
  char v280 = v136;
  if (![v4 allowDenoiseAndSharpening])
  {
    int v89 = 0;
    goto LABEL_115;
  }
  uint64_t v142 = [v4 denoiseAndSharpeningPlist];
  uint64_t v264 = [v4 noiseModelPlist];
  v274 = [v4 darkestFrameMetadata];
  int v298 = 0;
  int v299 = 0;
  uint64_t type = v294 != 0;
  BOOL v143 = ([v4 forceEnableBandZeroDenoising] & 1) != 0 || *(unsigned char *)(v142 + 24) != 0;
  BYTE4(type) = v143;
  BYTE5(type) = *(unsigned char *)(v142 + 25);
  BYTE6(type) = *(unsigned char *)(v142 + 40);
  HIBYTE(type) = *(unsigned char *)(v142 + 26);
  v144 = [v4 inputNoiseLuma];
  v145 = v8;
  if (v144)
  {
    v146 = [v4 inputNoiseChroma];
    LOBYTE(v298) = v146 != 0;
  }
  else
  {
    LOBYTE(v298) = 0;
  }

  *(_WORD *)((char *)&v298 + 1) = *(_WORD *)(v142 + 27);
  HIBYTE(v298) = [v4 allowDefringing];
  LOBYTE(v299) = [v4 allowGreenGhostMitigation];
  BYTE1(v299) = [v4 disableChromaBand3GainMap];
  BYTE2(v299) = *(unsigned char *)(v142 + 41);
  v147 = [v4 sidecarWriter];
  [(AMBNRStage *)v39->_ambnrStage setSidecarWriter:v147];

  -[AMBNRStage setInputPyramidGenerationEnabled:](v39->_ambnrStage, "setInputPyramidGenerationEnabled:", [v4 ambnrInputPyramidGenerationEnabled]);
  -[AMBNRStage setUpsampleOffsetEnabled:](v39->_ambnrStage, "setUpsampleOffsetEnabled:", [v4 ambnrUpsampleOffsetEnabled]);
  uint64_t v148 = objc_opt_new();
  v278 = (void *)v148;
  v276 = (void *)v142;
  if (!v148)
  {
    LODWORD(v313) = 0;
    v209 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v210 = v313;
    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v211 = v210;
    }
    else {
      unsigned int v211 = v210 & 0xFFFFFFFE;
    }
    if (v211)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
    v246 = (void *)v264;
    int v89 = -73430;
    goto LABEL_221;
  }
  v149 = (void *)v148;
  unsigned __int16 v150 = [obj width];
  int v151 = +[PyramidStorage allocatePyramidWithWidth:height:allocLevel0:levels:texUsage:mtlSubAllocatorID:label:lumaFormat:chromaFormat:outPyramid:metal:](PyramidStorage, "allocatePyramidWithWidth:height:allocLevel0:levels:texUsage:mtlSubAllocatorID:label:lumaFormat:chromaFormat:outPyramid:metal:", v150, (unsigned __int16)[obj height], 0, 4, 7, 255, @"sharpeningInPyramid", 25, 65, v149, v39->_metal);
  if (v151)
  {
    int v89 = v151;
    LODWORD(v313) = 0;
    v209 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v214 = v313;
    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v215 = v214;
    }
    else {
      unsigned int v215 = v214 & 0xFFFFFFFE;
    }
    if (v215)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
    v246 = (void *)v264;
    v8 = v145;
LABEL_221:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v7 = v287;
    v9 = v288;
LABEL_249:
    v255 = v278;
    goto LABEL_250;
  }
  int v152 = [v149 setLumaTexture:obj chromaTexture:v307 level:0 metal:v39->_metal];
  if (v152)
  {
    int v89 = v152;
    LODWORD(v313) = 0;
    v216 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v217 = v313;
    if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v218 = v217;
    }
    else {
      unsigned int v218 = v217 & 0xFFFFFFFE;
    }
    v8 = v145;
    if (v218)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
    v246 = (void *)v264;
    v7 = v287;
    goto LABEL_224;
  }
  uint64_t v153 = objc_opt_new();
  v8 = v145;
  if (!v153)
  {
    LODWORD(v313) = 0;
    v216 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v219 = v313;
    if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v220 = v219;
    }
    else {
      unsigned int v220 = v219 & 0xFFFFFFFE;
    }
    v7 = v287;
    if (v220)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
    v246 = (void *)v264;
    int v89 = -73430;
LABEL_224:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_248:
    v9 = v288;
    goto LABEL_249;
  }
  v154 = (void *)v153;
  unsigned __int16 v155 = [obj width];
  v272 = v154;
  int v156 = +[PyramidStorage allocatePyramidWithWidth:height:allocLevel0:levels:texUsage:mtlSubAllocatorID:label:lumaFormat:chromaFormat:outPyramid:metal:](PyramidStorage, "allocatePyramidWithWidth:height:allocLevel0:levels:texUsage:mtlSubAllocatorID:label:lumaFormat:chromaFormat:outPyramid:metal:", v155, (unsigned __int16)[obj height], 1, 4, 7, 255, @"sharpeningLowVarPyramid", 25, 65, v154, v39->_metal);
  v7 = v287;
  if (v156)
  {
    int v89 = v156;
    LODWORD(v313) = 0;
    v221 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v222 = v313;
    if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v223 = v222;
    }
    else {
      unsigned int v223 = v222 & 0xFFFFFFFE;
    }
    if (v223)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
    v246 = (void *)v264;
LABEL_247:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_248;
  }
  if ((_BYTE)v298)
  {
    uint64_t v157 = objc_opt_new();
    if (v157)
    {
      v158 = (void *)v157;
      *(_DWORD *)(v157 + 8) = 4;
      v159 = [v4 inputNoiseLuma];
      v160 = [v4 inputNoiseChroma];
      int v89 = [v158 setLumaTexture:v159 chromaTexture:v160 level:0 metal:v39->_metal];

      if (!v89)
      {
        v11 = v286;
        id v61 = v290;
        goto LABEL_98;
      }
      LODWORD(v313) = 0;
      v236 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v237 = v313;
      if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v238 = v237;
      }
      else {
        unsigned int v238 = v237 & 0xFFFFFFFE;
      }
      v11 = v286;
      if (v238)
      {
        *(_DWORD *)v314 = 136315138;
        *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
        _os_log_send_and_compose_impl();
      }
      v246 = (void *)v264;
      v255 = v278;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v9 = v288;
      id v61 = v290;
LABEL_250:

      goto LABEL_203;
    }
    LODWORD(v313) = 0;
    v221 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v234 = v313;
    if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v235 = v234;
    }
    else {
      unsigned int v235 = v234 & 0xFFFFFFFE;
    }
    if (v235)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      _os_log_send_and_compose_impl();
    }
    v246 = (void *)v264;
    int v89 = -73430;
    goto LABEL_247;
  }
  v158 = 0;
LABEL_98:
  uint64_t v161 = objc_opt_new();
  v162 = v278;
  v270 = v158;
  v268 = (id *)v161;
  if (!v161)
  {
    LODWORD(v313) = 0;
    v224 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v225 = v313;
    v180 = v8;
    if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v226 = v225;
    }
    else {
      unsigned int v226 = v225 & 0xFFFFFFFE;
    }
    if (v226)
    {
      *(_DWORD *)v314 = 136315138;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      LODWORD(v260) = 12;
      v259 = v314;
      _os_log_send_and_compose_impl();
    }
    v9 = v288;
    v247 = v224;
    v179 = (void *)v264;
    int v89 = -73430;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v182 = 6;
    v162 = v278;
    goto LABEL_228;
  }
  uint64_t v163 = v161;
  objc_storeStrong((id *)(v161 + 16), v293);
  objc_storeStrong((id *)(v163 + 24), v304);
  *(_OWORD *)v314 = xmmword_263480350;
  *(_OWORD *)&v314[16] = unk_263480360;
  int v315 = 1084227584;
  int v164 = [(PyramidStage *)v39->_pyramidStage runWithFilters:v314 pyramid:v278];
  if (v164)
  {
    int v89 = v164;
    v227 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v180 = v8;
    os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT);
LABEL_179:
    v9 = v288;
    v229 = v227;
    v179 = (void *)v264;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_227;
  }
  int v165 = [(AMBNRStage *)v39->_ambnrStage setResourcesWithOutput:v163 inputPyramid:v278 noiseMapPyramid:v158 sharpeningPyramid:v272 localGainMapTex:v294 denoisingOptions:&type];
  if (v165)
  {
    int v89 = v165;
    v227 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v180 = v8;
    os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT);
    goto LABEL_179;
  }
  v166 = [v4 greenGhostBrightLightTuning];
  if (v166)
  {
    v167 = v166;
    [v166 tuningParams];

    if (v296) {
      char v263 = [v4 allowGreenGhostMitigation];
    }
    else {
      char v263 = 0;
    }
  }
  else
  {
    char v263 = 0;
  }
  v168 = [v4 defringingTuningParameters];
  if ([v168 defringingEnabled]) {
    char v169 = [v4 allowDefringing];
  }
  else {
    char v169 = 0;
  }

  ambnrStage = v39->_ambnrStage;
  uint64_t v171 = [v291 exposureParams];
  v172 = [v4 defringingTuningParameters];
  v173 = [v4 greenGhostBrightLightTuning];
  v174 = (double *)[v291 ROI];
  v175 = [v4 faceLandmarks];
  char v176 = [v4 isLowLight];
  v177 = [v4 gainMap];
  BYTE1(v262) = v176;
  LOBYTE(v262) = v169;
  LOBYTE(v259) = v263;
  uint64_t v178 = v171;
  v179 = (void *)v264;
  int v89 = -[AMBNRStage runWithExposure:staticScene:dasPlist:nmPlist:defringingTuning:greenGhostBrightLightTuning:greenGhostEnabled:skinMask:skyMask:maskExtent:faceLandMarks:ev0FrameMetadata:evmFrameMetadata:defringeEnabled:isLowLight:gainMap:](ambnrStage, "runWithExposure:staticScene:dasPlist:nmPlist:defringingTuning:greenGhostBrightLightTuning:greenGhostEnabled:skinMask:skyMask:maskExtent:faceLandMarks:ev0FrameMetadata:evmFrameMetadata:defringeEnabled:isLowLight:gainMap:", v178, 0, v276, v264, v172, v173, *v174, v174[1], v174[2], v174[3], v259, v281, v292, v175, v291, v274,
          v262,
          v177);

  if (v89)
  {
    v228 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT);
    v11 = v286;
    v162 = v278;
    v180 = v281;
    v9 = v288;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_227:
    int v182 = 6;
    id v61 = v290;
LABEL_228:
    v181 = v272;
    goto LABEL_113;
  }
  v180 = v281;
  objc_storeStrong(&v304, v268[3]);
  v11 = v286;
  v162 = v278;
  if (v270) {
    +[PyramidStorage makePyramidAliasable:v270 metal:v295->_metal];
  }
  v181 = v272;
  +[PyramidStorage makePyramidAliasable:v272 metal:v295->_metal releaseBand0:1];
  +[PyramidStorage makePyramidAliasable:v278 metal:v295->_metal];
  [(AMBNRStage *)v295->_ambnrStage releaseResources];
  FigMetalDecRef();
  FigMetalDecRef();
  int v182 = 0;
  int v89 = 0;
  v9 = v288;
  id v61 = v290;
LABEL_113:

  v8 = v180;
  if (v182 == 6)
  {
LABEL_202:
    v7 = v287;
    goto LABEL_203;
  }
  v7 = v287;
LABEL_115:
  if ((v280 & 1) == 0)
  {
    v183 = [v4 toneMappingPlist];
    uint64_t v184 = v183[41];

    int v185 = [(ColorCubeCorrectionStage *)v295->_colorCubeCorrectionStage setMaskedSkyCubeVersion:v184];
    if (v185)
    {
      int v89 = v185;
      LODWORD(v313) = 0;
      LOBYTE(type) = 0;
      v200 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v230 = v313;
      if (os_log_type_enabled(v200, (os_log_type_t)type)) {
        unsigned int v231 = v230;
      }
      else {
        unsigned int v231 = v230 & 0xFFFFFFFE;
      }
      if (v231)
      {
        *(_DWORD *)v314 = 136315650;
        *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
        *(_WORD *)&v314[12] = 1024;
        *(_DWORD *)&v314[14] = v184;
        *(_WORD *)&v314[18] = 1024;
        *(_DWORD *)&v314[20] = v89;
        _os_log_send_and_compose_impl();
      }
      id v61 = v290;
    }
    else
    {
      colorCubeCorrectionStage = v295->_colorCubeCorrectionStage;
      id v187 = v304;
      if (v265)
      {
        if ([v4 colorCubeUseSkyMask]) {
          id v188 = v292;
        }
        else {
          id v188 = 0;
        }
      }
      else
      {
        id v188 = 0;
      }
      int v89 = -[ColorCubeCorrectionStage runOnLuma:andChroma:withMask:outChroma:colorCubeFixType:](colorCubeCorrectionStage, "runOnLuma:andChroma:withMask:outChroma:colorCubeFixType:", v7, v187, v188, v283, v266, v259, v260);
      if (!v89)
      {
        FigMetalDecRef();
        goto LABEL_124;
      }
      LODWORD(v313) = 0;
      LOBYTE(type) = 0;
      v200 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v232 = v313;
      if (os_log_type_enabled(v200, (os_log_type_t)type)) {
        unsigned int v233 = v232;
      }
      else {
        unsigned int v233 = v232 & 0xFFFFFFFE;
      }
      if (v233)
      {
        *(_DWORD *)v314 = 136315650;
        *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
        *(_WORD *)&v314[12] = 1024;
        *(_DWORD *)&v314[14] = v266;
        *(_WORD *)&v314[18] = 1024;
        *(_DWORD *)&v314[20] = v89;
        _os_log_send_and_compose_impl();
      }
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_264:

    goto LABEL_131;
  }
LABEL_124:
  if (objc_msgSend(v4, "allowOutlierCorrection", v259))
  {
    uint64_t v189 = [v4 denoiseAndSharpeningPlist];
    if (v189)
    {
      v190 = (void *)v189;
      v191 = [v4 denoiseAndSharpeningPlist];
      int v192 = v191[42];

      if (!v192)
      {
LABEL_131:
        v9 = v288;
        goto LABEL_203;
      }
      v193 = [v11 desc];
      [v193 setUsage:7];

      v194 = [v11 desc];
      [v194 setPixelFormat:10];

      uint64_t v195 = [v7 width];
      v196 = [v11 desc];
      [v196 setWidth:v195];

      uint64_t v197 = [v7 height];
      v198 = [v11 desc];
      [v198 setHeight:v197];

      [v11 setLabel:0];
      v199 = [(FigMetalContext *)v295->_metal allocator];
      v200 = [v199 newTextureWithDescriptor:v11];
      v313 = v200;

      if (!v200)
      {
        LODWORD(type) = 0;
        v248 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v249 = type;
        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v250 = v249;
        }
        else {
          unsigned int v250 = v249 & 0xFFFFFFFE;
        }
        if (v250)
        {
          *(_DWORD *)v314 = 136315138;
          *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
          _os_log_send_and_compose_impl();
        }
        int v89 = -73430;
        goto LABEL_263;
      }
      outliersRemovalStage = v295->_outliersRemovalStage;
      v202 = [v4 denoiseAndSharpeningPlist];
      LODWORD(v203) = v202[11];
      int v89 = [(OutliersRemovalStage *)outliersRemovalStage runWithInput:v7 output:v200 gamma:v203];

      if (v89)
      {
        LODWORD(type) = 0;
        v248 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v251 = type;
        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v252 = v251;
        }
        else {
          unsigned int v252 = v251 & 0xFFFFFFFE;
        }
        if (!v252) {
          goto LABEL_263;
        }
      }
      else
      {
        int v89 = [(TextureUtils *)v295->_textureUtils copyTexture:v200 outTex:v7];
        if (!v89)
        {
          FigMetalDecRef();

          goto LABEL_131;
        }
        LODWORD(type) = 0;
        v248 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v253 = type;
        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v254 = v253;
        }
        else {
          unsigned int v254 = v253 & 0xFFFFFFFE;
        }
        if (!v254) {
          goto LABEL_263;
        }
      }
      *(_DWORD *)v314 = 136315394;
      *(void *)&v314[4] = "-[CMIPost runPostWithConfig:]";
      *(_WORD *)&v314[12] = 1024;
      *(_DWORD *)&v314[14] = v89;
      _os_log_send_and_compose_impl();
LABEL_263:
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v11 = v286;
      v7 = v287;
      id v61 = v290;
      goto LABEL_264;
    }
  }
LABEL_203:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v89;
}

- (unsigned)getSRLStatus
{
  return [(ToneMappingStage *)self->_toneMappingStage getSRLStatus];
}

- (id)getSTFLTM_asNSData
{
  return [(ToneMappingStage *)self->_toneMappingStage getSTFLTM_asNSData];
}

- (BOOL)stfStillApplied
{
  return [(ToneMappingStage *)self->_toneMappingStage stfStillApplied];
}

- (int)getSTFStillCorrectionStrength:(BOOL)a3
{
  return [(ToneMappingStage *)self->_toneMappingStage getSTFStillCorrectionStrength:a3];
}

- (unsigned)stfStillAnalyticsVersion
{
  return [(ToneMappingStage *)self->_toneMappingStage stfStillAnalyticsVersion];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miwbStage, 0);
  objc_storeStrong((id *)&self->_ambnrStage, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_outliersRemovalStage, 0);
  objc_storeStrong((id *)&self->_colorCubeCorrectionStage, 0);
  objc_storeStrong((id *)&self->_pyramidStage, 0);
  objc_storeStrong((id *)&self->_semanticStylesStage, 0);
  objc_storeStrong((id *)&self->_toneMappingStage, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end