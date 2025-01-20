@interface H13FastLTMStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (BOOL)isAdaptiveFaceBiasScalerEnabled:(int)a3;
- (BOOL)isFinalTexture:(id)a3 args:(id)a4;
- (BOOL)isHazeCorrectionEnabled;
- (BOOL)isWYSIWYG:(int)a3;
- (FigMetalContext)metal;
- (H13FastLTMShaders)shaders;
- (H13FastLTMStage)initWithMetalContext:(id)a3 staticParameters:(id)a4 error:(int *)a5;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateRGBAMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13FastLTMStage

- (H13FastLTMStage)initWithMetalContext:(id)a3 staticParameters:(id)a4 error:(int *)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)H13FastLTMStage;
  v11 = [(H13FastLTMStage *)&v23 init];
  v12 = v11;
  if (v11 && v9 && (objc_storeStrong((id *)&v11->_metal, a3), v10))
  {
    objc_storeStrong((id *)&v12->_staticParameters, a4);
    if (FigGetCFPreferenceNumberWithDefault()) {
      goto LABEL_6;
    }
    id v13 = objc_alloc(MEMORY[0x263F30660]);
    v14 = [(FigMetalContext *)v12->_metal commandQueue];
    uint64_t v15 = [v13 initWithCommandQueue:v14];
    LTMProcessor = v12->_LTMProcessor;
    v12->_LTMProcessor = (LTMProcessor *)v15;

    if (v12->_LTMProcessor)
    {
LABEL_6:
      v17 = [[H13FastLTMShaders alloc] initWithMetalContext:v9];
      shaders = v12->_shaders;
      v12->_shaders = v17;

      if (v12->_shaders)
      {
        int v19 = 0;
        v12->_outputDownscaleFactor = 1;
        v12->_isHazeEnabledFromDefaults = 0;
        goto LABEL_8;
      }
      FigDebugAssert3();
    }
    int v19 = FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    int v19 = 0;
  }
LABEL_8:
  if (a5) {
    *a5 = v19;
  }
  if (v19) {
    v20 = 0;
  }
  else {
    v20 = v12;
  }
  v21 = v20;

  return v21;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 1751527984;
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  return 0;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  return ($F61E096109CF133FD2477F48C7D0CEE7)0;
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = -[H13FastLTMStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    v8 = [[H13FastLTMConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
  }
  else
  {
    FigDebugAssert3();
    v8 = 0;
  }

  return v8;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  int v5 = (unint64_t)[v3 maximumOutputDimensions] >> 32;

  return (2 * v4 * v5);
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6) {
    int v8 = 0;
  }
  else {
    int v8 = FigSignalErrorAt();
  }

  return v8;
}

- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[H13FastLTMStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateRGBAMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  int v8 = [(H13FastLTMStage *)self metal];
  id v9 = [v8 allocator];
  id v10 = (void *)[v9 newTextureDescriptor];

  if (!v10) {
    goto LABEL_6;
  }
  id v11 = [v10 desc];
  [v11 setTextureType:2];

  id v12 = [v10 desc];
  [v12 setWidth:a4];

  id v13 = [v10 desc];
  [v13 setHeight:a5];

  v14 = [v10 desc];
  [v14 setUsage:3];

  uint64_t v15 = [v10 desc];
  [v15 setPixelFormat:113];

  [v10 setLabel:0];
  v16 = [(H13FastLTMStage *)self metal];
  v17 = [v16 allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v10];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (int)runWithArgs:(id)a3
{
  v200[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v197 = 0;
  id v198 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v10 = FigSignalErrorAt();
    v182 = 0;
    v183 = 0;
    v50 = 0;
    id v5 = 0;
    goto LABEL_77;
  }
  id v5 = v4;
  id v6 = [v5 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v10 = FigSignalErrorAt();
    v182 = 0;
    v183 = 0;
LABEL_81:
    v50 = 0;
    goto LABEL_77;
  }
  v182 = [v5 config];
  int v8 = [v5 inputFrame];
  id v9 = -[SoftISPInputFrame processingOptions]((uint64_t)v8);
  int v10 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", @"LTMMode", 1, 0);

  if (!v10)
  {
LABEL_71:
    v183 = 0;
    goto LABEL_81;
  }
  id v11 = [v5 inputFrame];
  id v12 = -[SoftISPInputFrame processingOptions]((uint64_t)v11);
  unsigned int v13 = objc_msgSend(v12, "cmi_BOOLValueForKey:defaultValue:found:", @"LTMHDRCurves", 0, 0);

  uint64_t v14 = [v5 inputLumaTex];
  id v181 = v4;
  unsigned int v178 = v13;
  int v179 = v10;
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    v16 = [v5 inputChromaTex];

    if (v16)
    {
      int v180 = 1;
      goto LABEL_9;
    }
  }
  v17 = [v5 inputTex];

  if (!v17)
  {
    int v10 = FigSignalErrorAt();
    goto LABEL_71;
  }
  int v180 = 0;
LABEL_9:
  v199[0] = @"X";
  v18 = NSNumber;
  int v19 = [v5 bounds];
  uint64_t v20 = [v18 numberWithInt:-[SoftISPBounds hiqhQualityProcessingRegionWithinOutputBufferInPixels]((uint64_t)v19)];
  v200[0] = v20;
  v199[1] = @"Y";
  v21 = NSNumber;
  v22 = [v5 bounds];
  objc_super v23 = [v21 numberWithInt:(unint64_t)-[SoftISPBounds hiqhQualityProcessingRegionWithinOutputBufferInPixels]((uint64_t)v22) >> 32];
  v200[1] = v23;
  v199[2] = @"Width";
  v24 = NSNumber;
  v25 = [v5 bounds];
  -[SoftISPBounds hiqhQualityProcessingRegionWithinOutputBufferInPixels]((uint64_t)v25);
  v27 = [v24 numberWithUnsignedInt:v26];
  v200[2] = v27;
  v199[3] = @"Height";
  v28 = NSNumber;
  v29 = [v5 bounds];
  -[SoftISPBounds hiqhQualityProcessingRegionWithinOutputBufferInPixels]((uint64_t)v29);
  v31 = [v28 numberWithUnsignedInt:HIDWORD(v30)];
  v200[3] = v31;
  v183 = [NSDictionary dictionaryWithObjects:v200 forKeys:v199 count:4];

  v32 = [v5 outputFrame];
  LODWORD(v20) = -[SoftISPOutputFrame outputDownscaleFactor]((uint64_t)v32);
  v33 = [v5 inputFrame];
  LODWORD(v19) = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v33);
  v34 = [v5 inputFrame];
  LODWORD(v20) = v19 / -[SoftISPInputFrame softQuadraBinningFactor]((uint64_t)v34) * v20;

  v35 = [v5 outputFrame];
  -[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v35);
  uint64_t v37 = (v36 / v20) >> 1;

  v38 = [v5 outputFrame];
  -[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v38);
  uint64_t v40 = (v39 / v20) >> 1;

  v41 = [v5 inputLumaTex];
  BOOL v42 = [(H13FastLTMStage *)self isFinalTexture:v41 args:v5];

  v43 = [v5 inputChromaTex];
  BOOL v44 = [(H13FastLTMStage *)self isFinalTexture:v43 args:v5];

  v45 = [v5 inputTex];
  BOOL v46 = [(H13FastLTMStage *)self isFinalTexture:v45 args:v5];

  v47 = [(H13FastLTMStage *)self createIntermediateRGBAMetalTexture:@"ltmLinearRGB" width:v37 height:v40];
  id v48 = v198;
  id v198 = v47;

  if (!v47) {
    goto LABEL_82;
  }
  v49 = [v5 inputFrame];
  -[SoftISPInputFrame frameID]((uint64_t)v49);

  v50 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v50) {
    goto LABEL_23;
  }
  v51 = [v183 objectForKeyedSubscript:@"X"];
  LODWORD(v196) = [v51 unsignedIntValue] >> 1;
  v52 = [v183 objectForKeyedSubscript:@"Y"];
  HIDWORD(v196) = [v52 unsignedIntValue] >> 1;

  if (!v180)
  {
    v73 = [v5 inputFrame];
    int v74 = -[SoftISPInputFrame cfaLayout]((uint64_t)v73);

    unsigned int v75 = v74 - 1;
    if ((v74 - 1) < 3)
    {
      v76 = [v5 inputTex];
      uint64_t v77 = [v76 pixelFormat];
      uint64_t v78 = v77;
      if (v75 > 1)
      {
        if (v77 == 115)
        {
        }
        else
        {
          v79 = [v5 inputTex];
          uint64_t v80 = [v79 pixelFormat];

          if (v80 != 25) {
            goto LABEL_23;
          }
        }
      }
      else
      {

        if (v78 != 115) {
          goto LABEL_23;
        }
      }
      uint64_t v195 = 0;
      if (v46) {
        uint64_t v195 = v196;
      }
      uint64_t v81 = [v50 computeCommandEncoder];
      if (!v81) {
        goto LABEL_23;
      }
      v82 = (void *)v81;
      v177 = v50;
      if (v75 > 1)
      {
        v94 = [v5 inputTex];
        uint64_t v95 = [v94 pixelFormat];

        shaders = self->_shaders;
        if (v95 == 115)
        {
          v97 = [(H13FastLTMShaders *)shaders ltmDemosaicQuadra4Channel];
          [v82 setComputePipelineState:v97];

          v98 = [v5 inputTex];
          [v82 setTexture:v98 atIndex:0];

          [v82 setTexture:v47 atIndex:1];
          [v82 setBytes:&v195 length:8 atIndex:0];
          [v82 setBytes:&v196 length:8 atIndex:1];
          v99 = [(H13FastLTMShaders *)self->_shaders ltmDemosaicQuadra4Channel];
          unint64_t v100 = [v99 threadExecutionWidth];

          v101 = [(H13FastLTMShaders *)self->_shaders ltmDemosaicQuadra4Channel];
          unint64_t v102 = [v101 maxTotalThreadsPerThreadgroup] / v100;

          v89 = [v183 objectForKeyedSubscript:@"Width"];
          uint64_t v103 = [v89 unsignedIntValue] >> 1;
          v91 = [v183 objectForKeyedSubscript:@"Height"];
          v189[0] = v103;
          v189[1] = [v91 unsignedIntValue] >> 1;
          v189[2] = 1;
          v188[0] = v100;
          v188[1] = v102;
          v188[2] = 1;
          v92 = v189;
          v93 = v188;
        }
        else
        {
          v104 = [(H13FastLTMShaders *)shaders ltmDemosaicQuadra];
          [v82 setComputePipelineState:v104];

          v105 = [v5 inputTex];
          [v82 setTexture:v105 atIndex:0];

          [v82 setTexture:v47 atIndex:1];
          [v82 setBytes:&v195 length:8 atIndex:0];
          [v82 setBytes:&v196 length:8 atIndex:1];
          v106 = [(H13FastLTMShaders *)self->_shaders ltmDemosaicQuadra];
          unint64_t v107 = [v106 threadExecutionWidth];

          v108 = [(H13FastLTMShaders *)self->_shaders ltmDemosaicQuadra];
          unint64_t v109 = [v108 maxTotalThreadsPerThreadgroup] / v107;

          v89 = [v183 objectForKeyedSubscript:@"Width"];
          uint64_t v110 = [v89 unsignedIntValue] >> 1;
          v91 = [v183 objectForKeyedSubscript:@"Height"];
          v187[0] = v110;
          v187[1] = [v91 unsignedIntValue] >> 1;
          v187[2] = 1;
          v186[0] = v107;
          v186[1] = v109;
          v186[2] = 1;
          v92 = v187;
          v93 = v186;
        }
      }
      else
      {
        v83 = [(H13FastLTMShaders *)self->_shaders ltmDemosaic];
        [v82 setComputePipelineState:v83];

        v84 = [v5 inputTex];
        [v82 setTexture:v84 atIndex:0];

        [v82 setTexture:v47 atIndex:1];
        [v82 setBytes:&v195 length:8 atIndex:0];
        [v82 setBytes:&v196 length:8 atIndex:1];
        v85 = [(H13FastLTMShaders *)self->_shaders ltmDemosaic];
        unint64_t v86 = [v85 threadExecutionWidth];

        v87 = [(H13FastLTMShaders *)self->_shaders ltmDemosaic];
        unint64_t v88 = [v87 maxTotalThreadsPerThreadgroup] / v86;

        v89 = [v183 objectForKeyedSubscript:@"Width"];
        uint64_t v90 = [v89 unsignedIntValue] >> 1;
        v91 = [v183 objectForKeyedSubscript:@"Height"];
        v191[0] = v90;
        v191[1] = [v91 unsignedIntValue] >> 1;
        v191[2] = 1;
        v190[0] = v86;
        v190[1] = v88;
        v190[2] = 1;
        v92 = v191;
        v93 = v190;
      }
      [v82 dispatchThreads:v92 threadsPerThreadgroup:v93];

      [v82 endEncoding];
      v71 = [v5 outputFrame];
      v72 = v71;
      v50 = v177;
      goto LABEL_36;
    }
LABEL_23:
    int v10 = FigSignalErrorAt();
LABEL_76:
    id v4 = v181;
    goto LABEL_77;
  }
  uint64_t v194 = 0;
  uint64_t v195 = 0;
  if (v42) {
    uint64_t v195 = v196;
  }
  if (v44) {
    uint64_t v194 = v196;
  }
  v53 = [v5 inputLumaTex];
  uint64_t v54 = [v53 pixelFormat];

  if (v54 != 25) {
    goto LABEL_23;
  }
  v55 = [v5 inputChromaTex];
  uint64_t v56 = [v55 pixelFormat];

  if (v56 != 65) {
    goto LABEL_23;
  }
  uint64_t v57 = [v50 computeCommandEncoder];
  if (!v57) {
    goto LABEL_23;
  }
  v58 = (void *)v57;
  v59 = [(H13FastLTMShaders *)self->_shaders ltmDownsampleYCbCrToRGB];
  [v58 setComputePipelineState:v59];

  v60 = [v5 inputLumaTex];
  [v58 setTexture:v60 atIndex:0];

  v61 = [v5 inputChromaTex];
  [v58 setTexture:v61 atIndex:1];

  [v58 setBytes:&v195 length:8 atIndex:0];
  [v58 setBytes:&v194 length:8 atIndex:1];
  [v58 setBytes:&v196 length:8 atIndex:2];
  [v58 setTexture:v47 atIndex:2];
  v62 = [(H13FastLTMShaders *)self->_shaders ltmDownsampleYCbCrToRGB];
  unint64_t v63 = [v62 threadExecutionWidth];

  v64 = [(H13FastLTMShaders *)self->_shaders ltmDownsampleYCbCrToRGB];
  unint64_t v65 = [v64 maxTotalThreadsPerThreadgroup] / v63;

  v66 = [v183 objectForKeyedSubscript:@"Width"];
  v67 = v47;
  v68 = v50;
  uint64_t v69 = [v66 unsignedIntValue] >> 1;
  v70 = [v183 objectForKeyedSubscript:@"Height"];
  v193[0] = v69;
  v193[1] = [v70 unsignedIntValue] >> 1;
  v50 = v68;
  v47 = v67;
  v193[2] = 1;
  v192[0] = v63;
  v192[1] = v65;
  v192[2] = 1;
  [v58 dispatchThreads:v193 threadsPerThreadgroup:v192];

  [v58 endEncoding];
  v71 = [v5 outputFrame];
  v72 = v71;
LABEL_36:
  [v71 addCompletionHandlerToCommandBuffer:v50];

  [(FigMetalContext *)self->_metal forceCommit];
  if ((unint64_t)[v47 width] < 0x841) {
    goto LABEL_41;
  }
  v111 = [(FigMetalContext *)self->_metal commandBuffer];

  if (!v111)
  {
LABEL_82:
    int v10 = FigSignalErrorAt();
    v50 = 0;
    goto LABEL_76;
  }
  v112 = -[H13FastLTMStage createIntermediateRGBAMetalTexture:width:height:](self, "createIntermediateRGBAMetalTexture:width:height:", @"ltmLinearRGBDownsampled", (unint64_t)[v47 width] >> 1, (unint64_t)objc_msgSend(v47, "height") >> 1);
  id v113 = v197;
  id v197 = v112;

  if (!v112 || ([v111 computeCommandEncoder], (uint64_t v114 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v10 = FigSignalErrorAt();
    v50 = v111;
    goto LABEL_76;
  }
  v115 = (void *)v114;
  v116 = [(H13FastLTMShaders *)self->_shaders ltmDownsampleRGB_2x];
  [v115 setComputePipelineState:v116];

  [v115 setTexture:v47 atIndex:0];
  [v115 setTexture:v112 atIndex:1];
  v117 = [(H13FastLTMShaders *)self->_shaders ltmDownsampleRGB_2x];
  unint64_t v118 = [v117 threadExecutionWidth];

  v119 = [(H13FastLTMShaders *)self->_shaders ltmDownsampleRGB_2x];
  unint64_t v120 = [v119 maxTotalThreadsPerThreadgroup] / v118;

  v185[0] = [v112 width];
  v185[1] = [v112 height];
  v185[2] = 1;
  v184[0] = v118;
  v184[1] = v120;
  v184[2] = 1;
  [v115 dispatchThreads:v185 threadsPerThreadgroup:v184];
  [v115 endEncoding];

  v121 = [v5 outputFrame];
  [v121 addCompletionHandlerToCommandBuffer:v111];

  [(FigMetalContext *)self->_metal forceCommit];
  v50 = v111;
LABEL_41:
  if (!self->_LTMProcessor)
  {
LABEL_75:
    int v10 = 0;
    goto LABEL_76;
  }
  v122 = [v5 outputFrame];
  v123 = [v122 metadata];

  if (!v123) {
    goto LABEL_23;
  }
  v124 = [(FigMetalContext *)self->_metal allocator];
  v125 = [v124 backendAllocator];

  if (!v125)
  {
    FigSignalErrorAt();
    goto LABEL_75;
  }
  v126 = [self->_LTMProcessor externalMemoryResource];
  v127 = [v126 allocatorBackend];
  v128 = [(FigMetalContext *)self->_metal allocator];
  v129 = [v128 backendAllocator];

  if (v127 == v129) {
    goto LABEL_48;
  }
  if ([self->_LTMProcessor purgeResources])
  {
LABEL_84:
    FigDebugAssert3();
    id v4 = v181;
    goto LABEL_85;
  }
  id v130 = objc_alloc_init(MEMORY[0x263F2ED88]);
  if (!v130)
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  v131 = v130;
  v132 = [(FigMetalContext *)self->_metal allocator];
  v133 = [v132 backendAllocator];
  [v131 setAllocatorBackend:v133];

  [self->_LTMProcessor setExternalMemoryResource:v131];
LABEL_48:
  v134 = [self->_LTMProcessor ltmParams];
  [v134 reset];

  v135 = [v5 inputFrame];
  v136 = [v182 getLTMSettingsForInputFrame:v135];
  ltmTuningParams = self->_ltmTuningParams;
  self->_ltmTuningParams = v136;

  v138 = self->_ltmTuningParams;
  if (v138)
  {
    v139 = (void *)[(NSDictionary *)v138 copy];
    v140 = [self->_LTMProcessor ltmParams];
    [v140 setTuningParameters:v139];
  }
  if ([self->_LTMProcessor prepareToProcess:0]) {
    goto LABEL_84;
  }
  v141 = [self->_LTMProcessor ltmParams];
  [v141 setComputeHDRCurves:v178];

  v142 = [self->_LTMProcessor ltmParams];
  [v142 setOptimizationLevel:1];

  v143 = [self->_LTMProcessor ltmParams];
  [v143 setDigitalFlash:v179 == 2];

  v144 = [v5 outputFrame];
  v145 = [v144 metadata];
  v146 = [self->_LTMProcessor ltmParams];
  [v146 setInMetaData:v145];

  if ((unint64_t)[v47 width] <= 0x840) {
    id v147 = v47;
  }
  else {
    id v147 = v197;
  }
  v148 = [self->_LTMProcessor ltmParams];
  [v148 setInRGBImageUInt16Tex:v147];

  v149 = [self->_LTMProcessor ltmParams];
  [v149 setValidBufferRect:v183];

  if ([(H13FastLTMStage *)self isHazeCorrectionEnabled])
  {
    v150 = [v5 inputFrame];
    uint64_t v151 = -[H13FastLTMStage isWYSIWYG:](self, "isWYSIWYG:", -[SoftISPInputFrame tuningType]((uint64_t)v150));
    v152 = [self->_LTMProcessor ltmParams];
    [v152 setDoHazeEstimation:v151];

    v153 = [self->_LTMProcessor ltmParams];
    LODWORD(v151) = [v153 doHazeEstimation];

    if (v151)
    {
      v154 = [self->_LTMProcessor ltmParams];
      v155 = [v154 tuningParameters];
      v156 = (void *)[v155 mutableCopy];

      v157 = [self->_LTMProcessor ltmParams];
      v158 = [v157 tuningParameters];
      v159 = [v158 objectForKeyedSubscript:@"DehazeSFD"];
      [v156 setObject:v159 forKeyedSubscript:@"Dehaze"];

      v160 = [self->_LTMProcessor ltmParams];
      [v160 setTuningParameters:v156];
    }
  }
  v161 = [self->_LTMProcessor ltmParams];
  NSSelectorFromString(&cfstr_Doadaptiveface.isa);
  char v162 = objc_opt_respondsToSelector();

  if (v162)
  {
    v163 = [v5 inputFrame];
    BOOL v164 = -[H13FastLTMStage isAdaptiveFaceBiasScalerEnabled:](self, "isAdaptiveFaceBiasScalerEnabled:", -[SoftISPInputFrame tuningType]((uint64_t)v163));

    LTMProcessor = self->_LTMProcessor;
    v166 = [NSNumber numberWithBool:v164];
    [LTMProcessor setValue:v166 forKeyPath:@"ltmParams.doAdaptiveFaceBiasScaler"];
  }
  v167 = [v5 inputFrame];
  v168 = -[SoftISPInputFrame processingOptions]((uint64_t)v167);
  char v169 = objc_msgSend(v168, "cmi_BOOLValueForKey:defaultValue:found:", @"ApplyCCM", 0, 0);

  id v4 = v181;
  if ((v169 & 1) == 0)
  {
    v170 = [self->_LTMProcessor ltmParams];
    [v170 setDoGlobalCCM:1];
  }
  if ([self->_LTMProcessor process])
  {
    FigDebugAssert3();
    goto LABEL_85;
  }
  v171 = [self->_LTMProcessor ltmParams];
  v172 = [v171 outMetaData];

  if (!v172)
  {
LABEL_85:
    int v10 = FigSignalErrorAt();
    goto LABEL_77;
  }
  v173 = [v5 outputFrame];
  [v173 setMetadata:v172];

  uint64_t v174 = [(FigMetalContext *)self->_metal commandBuffer];

  if (!v174)
  {
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();

    goto LABEL_81;
  }
  v175 = [v5 outputFrame];
  [v175 addCompletionHandlerToCommandBuffer:v174];

  [(FigMetalContext *)self->_metal forceCommit];
  int v10 = 0;
  v50 = (void *)v174;
LABEL_77:
  FigMetalDecRef();
  FigMetalDecRef();
  [0 endEncoding];

  return v10;
}

- (BOOL)isWYSIWYG:(int)a3
{
  BOOL v3 = a3 == 190;
  if (a3 == 100) {
    BOOL v3 = 1;
  }
  return a3 == 1 || v3;
}

- (BOOL)isHazeCorrectionEnabled
{
  BOOL v3 = [(NSDictionary *)self->_ltmTuningParams objectForKeyedSubscript:@"Features"];
  id v4 = v3;
  BOOL v7 = v3
    && ([v3 objectForKeyedSubscript:@"EnableHazeEstimation"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 BOOLValue],
        v5,
        (v6 & 1) != 0)
    || self->_isHazeEnabledFromDefaults;

  return v7;
}

- (BOOL)isAdaptiveFaceBiasScalerEnabled:(int)a3
{
  BOOL v3 = [(NSDictionary *)self->_ltmTuningParams objectForKeyedSubscript:@"Features"];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"EnableAdaptiveFaceBiasScaler"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isFinalTexture:(id)a3 args:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = objc_msgSend(v6, "outputFrame", 0);
    id v9 = [v8 textures];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (*(id *)(*((void *)&v14 + 1) + 8 * i) == v5)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (H13FastLTMShaders)shaders
{
  return self->_shaders;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_ltmTuningParams, 0);

  objc_storeStrong((id *)&self->_LTMProcessor, 0);
}

@end