@interface H13FastRawMBNRStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13FastRawMBNRShaders)shaders;
- (H13FastRawMBNRStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalDeviceTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (id)createIntermediateMetalTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)bypassRawMBNRWithArgs:(id)a3;
- (int)generatePyramidFromTexture:(id)a3 outputPyramid:(id *)a4 startLevel:(int)a5 numLevels:(int)a6 pyramidName:(id)a7;
- (int)getNoiseMapForInputTexture:(id)a3 bayerNoise:(id *)a4 inputFrame:(id)a5 outputFrame:(id)a6 bounds:(id)a7 h13FastConfig:(id)a8 lscGainsTex:(id)a9;
- (int)runRawMBNROnInputTexture:(id)a3 outputTexture:(id *)a4 bayerNoise:(id)a5 inputFrame:(id)a6 outputFrame:(id)a7 bounds:(id)a8 h13FastConfig:(id)a9 lscGainsTex:(id)a10;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13FastRawMBNRStage

- (H13FastRawMBNRStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)H13FastRawMBNRStage;
  v9 = [(H13FastRawMBNRStage *)&v15 init];
  v10 = v9;
  if (v9
    && v7
    && (objc_storeStrong((id *)&v9->_metal, a3), v8)
    && (objc_storeStrong((id *)&v10->_staticParameters, a4),
        v11 = [[H13FastRawMBNRShaders alloc] initWithMetalContext:v7], shaders = v10->_shaders, v10->_shaders = v11, shaders, v10->_shaders))
  {
    v10->_outputDownscaleFactor = 1;
    v13 = v10;
  }
  else
  {
    FigDebugAssert3();
    v13 = 0;
  }

  return v13;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 1647719528;
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
  id v5 = a3;
  v6 = [[H13FastRawMBNRConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v5];

  return v6;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  id v3 = a3;
  int v4 = [v3 maximumOutputDimensions];
  int v5 = (unint64_t)[v3 maximumOutputDimensions] >> 32;

  return 60 * ((v5 * v4) >> 2);
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
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
  v13 = [[H13FastRawMBNRStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateMetalTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  v13 = [v11 desc];
  [v13 setWidth:a5];

  v14 = [v11 desc];
  [v14 setHeight:a6];

  objc_super v15 = [v11 desc];
  [v15 setUsage:3];

  v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  v17 = [(FigMetalContext *)self->_metal allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (id)createIntermediateMetalDeviceTexture:(id)a3 withPixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v7 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a4 width:a5 height:a6 mipmapped:0];
  int v8 = v7;
  if (v7)
  {
    [v7 setUsage:3];
    id v9 = [(FigMetalContext *)self->_metal device];
    id v10 = (void *)[v9 newTextureWithDescriptor:v8];

    if (v10)
    {
      [v10 setLabel:0];
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    id v10 = 0;
  }

  return v10;
}

- (int)generatePyramidFromTexture:(id)a3 outputPyramid:(id *)a4 startLevel:(int)a5 numLevels:(int)a6 pyramidName:(id)a7
{
  id v12 = a3;
  id v48 = a7;
  v13 = [(H13FastRawMBNRStage *)self metal];
  if (a5 < 2 || (id v14 = *a4) == 0)
  {
    id v14 = [MEMORY[0x263EFF980] arrayWithCapacity:a6];
    [v14 addObject:v12];
  }
  v45 = a4;
  id v46 = v12;
  if (a5 >= a6)
  {
    v41 = 0;
    v17 = 0;
    v16 = 0;
    objc_super v15 = 0;
LABEL_12:
    v18 = v41;
    int v42 = 0;
    id *v45 = v14;
LABEL_13:
    v43 = v46;
  }
  else
  {
    objc_super v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    uint64_t v19 = a5;
    uint64_t v47 = a6;
    while (1)
    {
      v20 = v17;
      v21 = v16;
      v22 = v15;
      v16 = [v14 objectAtIndexedSubscript:v19 - 1];

      objc_super v15 = [NSString stringWithFormat:@"nextPyramidLevel%d%@", v19, v48];

      v23 = [NSString stringWithFormat:@"%@", v15];
      v17 = -[H13FastRawMBNRStage createIntermediateMetalTexture:withPixelFormat:width:height:](self, "createIntermediateMetalTexture:withPixelFormat:width:height:", v23, 115, (int)(float)((float)(unint64_t)[v16 width] * 0.5), (int)(float)((float)(unint64_t)objc_msgSend(v16, "height") * 0.5));

      if (!v17)
      {
        int v42 = FigSignalErrorAt();
        goto LABEL_13;
      }
      v24 = [v13 commandBuffer];

      if (!v24)
      {
        int v42 = FigSignalErrorAt();
        v18 = 0;
        goto LABEL_13;
      }
      v25 = v17;
      v26 = self;
      uint64_t v27 = [v24 computeCommandEncoder];
      if (!v27) {
        break;
      }
      v28 = (void *)v27;
      uint64_t v50 = v19;
      v29 = v26;
      [(H13FastRawMBNRShaders *)v26->_shaders downscale2x];
      v30 = v49 = v24;
      [v28 setComputePipelineState:v30];

      [v28 setTexture:v16 atIndex:0];
      v17 = v25;
      [v28 setTexture:v25 atIndex:1];
      v31 = [(H13FastRawMBNRShaders *)v29->_shaders downscale2x];
      unint64_t v32 = [v31 threadExecutionWidth];

      v33 = [(H13FastRawMBNRShaders *)v29->_shaders downscale2x];
      v34 = v16;
      v35 = v15;
      id v36 = v14;
      v37 = v13;
      unint64_t v38 = [v33 maxTotalThreadsPerThreadgroup] / v32;

      uint64_t v39 = [v17 width];
      uint64_t v40 = [v17 height];
      v52[0] = v39;
      v52[1] = v40;
      v41 = v49;
      v52[2] = 1;
      v51[0] = v32;
      v51[1] = v38;
      v13 = v37;
      id v14 = v36;
      objc_super v15 = v35;
      v16 = v34;
      v51[2] = 1;
      [v28 dispatchThreads:v52 threadsPerThreadgroup:v51];
      [v28 endEncoding];

      self = v29;
      [v13 commit];
      [v14 addObject:v17];
      uint64_t v19 = v50 + 1;
      v18 = v49;
      if (v47 == v50 + 1) {
        goto LABEL_12;
      }
    }
    v18 = v24;
    int v42 = FigSignalErrorAt();
    v43 = v46;
    v17 = v25;
  }
  [0 endEncoding];

  return v42;
}

- (int)getNoiseMapForInputTexture:(id)a3 bayerNoise:(id *)a4 inputFrame:(id)a5 outputFrame:(id)a6 bounds:(id)a7 h13FastConfig:(id)a8 lscGainsTex:(id)a9
{
  id v46 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a7;
  v45 = [(H13FastRawMBNRStage *)self metal];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  memset(v52, 0, sizeof(v52));
  uint64_t v51 = 0;
  memset(v50, 0, sizeof(v50));
  v21 = [v17 lscParameters];
  int v22 = [v18 getRawMBNRConfigForInputFrame:v16 bounds:v20 lscGainMapParameters:v21 rawMBNRConfig:v52];

  v44 = v18;
  if (v22)
  {
    uint64_t v41 = v9;
    LODWORD(v40) = v22;
    FigDebugAssert3();
    v43 = 0;
    v28 = 0;
    id v38 = 0;
    v26 = v45;
    v25 = v46;
    goto LABEL_7;
  }
  long long v23 = v53;
  int v24 = [v18 getNoiseModelForInputFrame:v16 outputFrame:v17 noiseConfig:v50];
  v25 = v46;
  if (v24)
  {
    int v22 = v24;
    uint64_t v41 = v9;
    LODWORD(v40) = v24;
    FigDebugAssert3();
    v43 = 0;
    v28 = 0;
    id v38 = 0;
    v26 = v45;
    goto LABEL_7;
  }
  v26 = v45;
  uint64_t v27 = [v45 commandBuffer];
  if (!v27)
  {
    int v22 = FigSignalErrorAt();
    v43 = 0;
    v28 = 0;
LABEL_12:
    id v38 = 0;
    goto LABEL_7;
  }
  int v42 = a4;
  v43 = v27;
  v28 = [v27 computeCommandEncoder];
  if (!v28
    || (-[H13FastRawMBNRStage createIntermediateMetalTexture:withPixelFormat:width:height:](self, "createIntermediateMetalTexture:withPixelFormat:width:height:", @"bayerNoise", 115, v23), (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v22 = FigSignalErrorAt();
    goto LABEL_12;
  }
  v30 = (void *)v29;
  [(H13FastRawMBNRShaders *)self->_shaders noiseLookup];
  id v31 = v17;
  v33 = id v32 = v16;
  [v28 setComputePipelineState:v33];

  [v28 setTexture:v46 atIndex:0];
  [v28 setTexture:v30 atIndex:1];
  [v28 setTexture:v19 atIndex:2];
  [v28 setBytes:v52 length:144 atIndex:0];
  [v28 setBytes:v50 length:56 atIndex:1];
  v34 = [(H13FastRawMBNRShaders *)self->_shaders noiseLookup];
  unint64_t v35 = [v34 threadExecutionWidth];

  id v36 = [(H13FastRawMBNRShaders *)self->_shaders noiseLookup];
  unint64_t v37 = [v36 maxTotalThreadsPerThreadgroup] / v35;

  id v16 = v32;
  id v17 = v31;
  long long v48 = v23;
  uint64_t v49 = 1;
  v47[0] = v35;
  v47[1] = v37;
  v26 = v45;
  v25 = v46;
  v47[2] = 1;
  [v28 dispatchThreads:&v48 threadsPerThreadgroup:v47];
  [v28 endEncoding];

  [v45 commit];
  id v38 = v30;
  v28 = 0;
  int v22 = 0;
  *int v42 = v38;
LABEL_7:
  objc_msgSend(v28, "endEncoding", v40, v41);

  return v22;
}

- (int)bypassRawMBNRWithArgs:(id)a3
{
  id v4 = a3;
  id v5 = [(H13FastRawMBNRStage *)self metal];
  id v6 = [v4 inputTex];
  id v7 = [v4 outputTex];
  id v31 = v7;
  int v8 = [v4 bounds];
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
  unsigned int v10 = v9;
  -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v8);
  if (!v4 || !v6 || !v8) {
    goto LABEL_20;
  }
  unint64_t v12 = v11;
  if (v7)
  {
    int v13 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    if (v13 >= 0) {
      int v14 = v13;
    }
    else {
      int v14 = v13 + 1;
    }
    uint64_t v15 = (uint64_t)v14 >> 1;
    uint64_t v16 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v8);
    unint64_t v17 = HIDWORD(v16);
    if (v16 < 0) {
      LODWORD(v17) = HIDWORD(v16) + 1;
    }
    uint64_t v18 = (uint64_t)(int)v17 >> 1;
  }
  else
  {
    id v19 = -[H13FastRawMBNRStage createIntermediateMetalTexture:withPixelFormat:width:height:](self, "createIntermediateMetalTexture:withPixelFormat:width:height:", @"rawMBNR.bypass", [v6 pixelFormat], objc_msgSend(v6, "width"), objc_msgSend(v6, "height"));
    id v31 = v19;
    if (!v19)
    {
LABEL_20:
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
      goto LABEL_16;
    }
    [v4 setOutputTex:v19];
    FigMetalDecRef();
    id v20 = [v4 outputTex];
    id v21 = v31;
    id v31 = v20;

    uint64_t v15 = 0;
    uint64_t v18 = 0;
  }
  int v22 = [v5 commandBuffer];
  if (!v22) {
    goto LABEL_20;
  }
  long long v23 = v22;
  int v24 = [v22 blitCommandEncoder];
  if (v24)
  {
    v25 = v24;
    memset(v30, 0, sizeof(v30));
    v29[0] = v10 >> 1;
    v29[1] = v12 >> 33;
    v29[2] = 1;
    v28[0] = v15;
    v28[1] = v18;
    v28[2] = 0;
    [v24 copyFromTexture:v6 sourceSlice:0 sourceLevel:0 sourceOrigin:v30 sourceSize:v29 toTexture:v31 destinationSlice:0 destinationLevel:0 destinationOrigin:v28];
    [v25 endEncoding];
    [v5 commit];

    int v26 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }
LABEL_16:

  return v26;
}

- (int)runRawMBNROnInputTexture:(id)a3 outputTexture:(id *)a4 bayerNoise:(id)a5 inputFrame:(id)a6 outputFrame:(id)a7 bounds:(id)a8 h13FastConfig:(id)a9 lscGainsTex:(id)a10
{
  v197[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v142 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v134 = a10;
  v137 = self;
  uint64_t v20 = [(H13FastRawMBNRStage *)self metal];
  id v186 = 0;
  id v185 = 0;
  id v184 = 0;
  id v183 = 0;
  id v182 = 0;
  id v181 = 0;
  obuint64_t j = 0;
  id location = 0;
  id v178 = 0;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v173 = 0u;
  memset(v172, 0, sizeof(v172));
  uint64_t v171 = 0;
  memset(v170, 0, sizeof(v170));
  v131 = v16;
  v132 = v19;
  v133 = v18;
  v135 = (void *)v20;
  v127 = v15;
  v124 = v17;
  if (!v15) {
    goto LABEL_87;
  }
  id v21 = (void *)v20;
  int v22 = [v17 lscParameters];
  int v23 = [v19 getRawMBNRConfigForInputFrame:v16 bounds:v18 lscGainMapParameters:v22 rawMBNRConfig:v172];

  if (v23)
  {
LABEL_112:
    FigDebugAssert3();
    goto LABEL_113;
  }
  long long v25 = v173;
  if (!v142)
  {
    int v26 = [v19 getNoiseModelForInputFrame:v16 outputFrame:v17 noiseConfig:v170];
    if (v26)
    {
      int v23 = v26;
      goto LABEL_112;
    }
  }
  LODWORD(v24) = DWORD1(v172[0]);
  int v27 = [v19 getMBNRSettingsForInputFrame:v16 rawMBNRConfig:v172 totalGain:v24];
  if (v27)
  {
    int v23 = v27;
    goto LABEL_112;
  }
  -[H13FastRawMBNRStage createIntermediateMetalTexture:withPixelFormat:width:height:](self, "createIntermediateMetalTexture:withPixelFormat:width:height:", @"lowPassYUV", 115, v25);
  id v186 = (id)objc_claimAutoreleasedReturnValue();
  id v139 = v186;
  if (!v186
    || ([(H13FastRawMBNRStage *)self createIntermediateMetalTexture:@"lowPassYUV2" withPixelFormat:115 width:(unint64_t)v25 >> 1 height:*((void *)&v25 + 1) >> 1], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_87:
    int v23 = FigSignalErrorAt();
LABEL_113:
    v122 = 0;
    v123 = 0;
    id v138 = 0;
    v140 = 0;
    uint64_t v51 = 0;
    id v38 = 0;
    id v54 = 0;
    v128 = 0;
    v126 = 0;
    goto LABEL_114;
  }
  uint64_t v29 = (void *)v28;
  v30 = -[H13FastRawMBNRStage createIntermediateMetalTexture:withPixelFormat:width:height:](self, "createIntermediateMetalTexture:withPixelFormat:width:height:", @"highPassGrGb", 65, v25);
  id v31 = v184;
  id v184 = v30;

  v126 = v29;
  if (!v184) {
    goto LABEL_86;
  }
  if (v142)
  {
    -[H13FastRawMBNRStage createIntermediateMetalTexture:withPixelFormat:width:height:](self, "createIntermediateMetalTexture:withPixelFormat:width:height:", @"lowPassYUVNoise", 115, v25);
    id v185 = (id)objc_claimAutoreleasedReturnValue();
    id v129 = v185;
    if (v185)
    {
      v128 = [(H13FastRawMBNRStage *)self createIntermediateMetalTexture:@"lowPassYUVNoise2" withPixelFormat:115 width:(unint64_t)v25 >> 1 height:*((void *)&v25 + 1) >> 1];
      goto LABEL_13;
    }
LABEL_86:
    int v23 = FigSignalErrorAt();
    v122 = 0;
    v123 = 0;
    id v138 = 0;
    v140 = 0;
    uint64_t v51 = 0;
    id v38 = 0;
    id v54 = 0;
    v128 = 0;
LABEL_114:
    v33 = 0;
    v141 = 0;
    goto LABEL_60;
  }
  v128 = 0;
  id v129 = 0;
LABEL_13:
  id v32 = [v21 commandBuffer];
  if (!v32)
  {
    int v23 = FigSignalErrorAt();
    v122 = 0;
    v123 = 0;
    v140 = 0;
    uint64_t v51 = 0;
    id v38 = 0;
    id v54 = 0;
LABEL_103:
    id v138 = 0;
    goto LABEL_114;
  }
  v141 = v32;
  v33 = [v32 computeCommandEncoder];
  if (!v33)
  {
    int v23 = FigSignalErrorAt();
    v122 = 0;
    v123 = 0;
    v140 = 0;
    uint64_t v51 = 0;
    id v38 = 0;
LABEL_93:
    id v54 = 0;
    id v138 = 0;
    goto LABEL_60;
  }
  v34 = [(H13FastRawMBNRShaders *)self->_shaders lowPassBayerAndDownscale2x];
  v196[0] = @"hasNoiseMap";
  unint64_t v35 = [NSNumber numberWithBool:v142 != 0];
  v196[1] = @"isQuadra";
  v197[0] = v35;
  id v36 = [NSNumber numberWithBool:BYTE12(v172[0])];
  v197[1] = v36;
  unint64_t v37 = [NSDictionary dictionaryWithObjects:v197 forKeys:v196 count:2];
  id v38 = [v34 getPipelineStateWithParams:v37];

  if (!v38)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    v122 = 0;
    v123 = 0;
    v140 = 0;
    uint64_t v51 = 0;
    goto LABEL_93;
  }
  [v33 setComputePipelineState:v38];
  [v33 setTexture:v127 atIndex:0];
  [v33 setTexture:v139 atIndex:1];
  [v33 setTexture:v29 atIndex:2];
  [v33 setTexture:v142 atIndex:3];
  [v33 setTexture:v129 atIndex:4];
  [v33 setTexture:v128 atIndex:5];
  [v33 setTexture:v184 atIndex:6];
  [v33 setTexture:v134 atIndex:7];
  [v33 setBytes:v172 length:144 atIndex:0];
  [v33 setBytes:v170 length:56 atIndex:1];
  v169[0] = ((uint64_t)v25 + 25) / 0x1AuLL;
  v169[1] = (*((void *)&v25 + 1) + 25) / 0x1AuLL;
  v169[2] = 1;
  int64x2_t v167 = vdupq_n_s64(0x20uLL);
  uint64_t v168 = 1;
  [v33 dispatchThreadgroups:v169 threadsPerThreadgroup:&v167];
  [v33 endEncoding];

  [v135 commit];
  id v166 = 0;
  int v39 = [(H13FastRawMBNRStage *)v137 generatePyramidFromTexture:v184 outputPyramid:&v166 startLevel:1 numLevels:1 pyramidName:@"highPassGrGbPyramid"];
  id v136 = v166;
  v123 = v38;
  if (v39)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    v140 = 0;
    v122 = 0;
    uint64_t v51 = 0;
    id v38 = 0;
LABEL_100:
    id v138 = 0;
    v33 = 0;
    goto LABEL_84;
  }
  if (v142)
  {
    id v165 = 0;
    int v40 = [(H13FastRawMBNRStage *)v137 generatePyramidFromTexture:v142 outputPyramid:&v165 startLevel:1 numLevels:1 pyramidName:@"bayerNoisePyramid"];
    id v38 = v165;
    uint64_t v41 = v132;
    if (v40)
    {
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
LABEL_99:
      v140 = 0;
      v122 = 0;
      uint64_t v51 = 0;
      goto LABEL_100;
    }
  }
  else
  {
    id v38 = 0;
    uint64_t v41 = v132;
  }
  int v42 = [v136 objectAtIndexedSubscript:0];
  id v43 = v182;
  id v182 = v42;

  if (v142)
  {
    v44 = [v38 objectAtIndexedSubscript:0];
    id v45 = v178;
    id v178 = v44;
  }
  int v46 = [v41 updateRawMBNRConfigForInputFrame:v16 bounds:v133 band:0 rawMBNRConfig:v172];
  if (v46)
  {
    int v23 = v46;
LABEL_98:
    FigDebugAssert3();
    goto LABEL_99;
  }
  LODWORD(v47) = DWORD1(v172[0]);
  int v48 = [v41 updateNoiseModelForInputFrame:v16 noiseConfig:v170 totalGain:0 band:v47];
  if (v48)
  {
    int v23 = v48;
    goto LABEL_98;
  }
  LODWORD(v49) = DWORD1(v172[0]);
  int v50 = [v41 getBayerMBNRSettingsForInputFrame:v16 rawMBNRConfig:v172 totalGain:0 band:v49];
  if (v50)
  {
    int v23 = v50;
    goto LABEL_98;
  }
  uint64_t v51 = objc_msgSend(NSString, "stringWithFormat:", @"reconstructedBayerTex%d", 0);
  v52 = [NSString stringWithFormat:@"%@", v51];
  long long v53 = [(H13FastRawMBNRStage *)v137 createIntermediateMetalTexture:v52 withPixelFormat:65 width:(unint64_t)(float)(unint64_t)v25 height:(unint64_t)(float)*((unint64_t *)&v25 + 1)];
  id v183 = v53;

  id v54 = v136;
  if (!v53)
  {
    int v23 = FigSignalErrorAt();
    id v138 = 0;
    v140 = 0;
    v122 = 0;
    v33 = 0;
    goto LABEL_60;
  }
  long long v55 = [v135 commandBuffer];

  if (!v55)
  {
    int v23 = FigSignalErrorAt();
    v140 = 0;
    v122 = 0;
    goto LABEL_103;
  }
  v33 = [v55 computeCommandEncoder];
  if (!v33) {
    goto LABEL_106;
  }
  long long v56 = [(H13FastRawMBNRShaders *)v137->_shaders denoiseBayerAndStepDown];
  v194 = @"equalBayerWeights";
  long long v57 = [NSNumber numberWithBool:v175];
  v195 = v57;
  v58 = [NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];
  v59 = [v56 getPipelineStateWithParams:v58];

  v60 = v59;
  if (!v59)
  {
    FigDebugAssert3();
LABEL_106:
    int v23 = FigSignalErrorAt();
    id v138 = 0;
    v140 = 0;
    v122 = 0;
LABEL_110:
    v141 = v55;
    goto LABEL_60;
  }
  [v33 setComputePipelineState:v59];
  [v33 setTexture:v181 atIndex:0];
  [v33 setTexture:v182 atIndex:1];
  [v33 setTexture:location atIndex:2];
  [v33 setTexture:v139 atIndex:6];
  [v33 setTexture:v53 atIndex:3];
  [v33 setTexture:v178 atIndex:4];
  [v33 setTexture:v134 atIndex:5];
  [v33 setBytes:v172 length:144 atIndex:0];
  [v33 setBytes:v170 length:56 atIndex:1];
  v164[0] = (unint64_t)(float)((float)(unint64_t)v25 + 1.0);
  v164[1] = (unint64_t)(float)((float)*((unint64_t *)&v25 + 1) + 1.0);
  v164[2] = 1;
  v163[0] = [v59 threadExecutionWidth];
  v163[1] = (unint64_t)[v59 maxTotalThreadsPerThreadgroup] / v163[0];
  v163[2] = 1;
  [v33 dispatchThreads:v164 threadsPerThreadgroup:v163];
  [v33 endEncoding];

  v61 = v135;
  [v135 commit];
  FigMetalDecRef();
  FigMetalDecRef();
  objc_storeStrong(&location, obj);
  objc_storeStrong(&v181, v182);
  [v136 removeObjectAtIndex:0];
  FigMetalDecRef();
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v38 = v38;
  uint64_t v62 = [v38 countByEnumeratingWithState:&v159 objects:v193 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v160 != v64) {
          objc_enumerationMutation(v38);
        }
        id v158 = *(id *)(*((void *)&v159 + 1) + 8 * i);
        FigMetalDecRef();
      }
      uint64_t v63 = [v38 countByEnumeratingWithState:&v159 objects:v193 count:16];
    }
    while (v63);
  }
  v122 = v60;

  [v38 removeAllObjects];
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  v66 = [MEMORY[0x263EFF980] arrayWithCapacity:6];

  [v66 addObject:v139];
  [v66 addObject:v126];
  id v157 = v66;
  int v23 = [(H13FastRawMBNRStage *)v137 generatePyramidFromTexture:v139 outputPyramid:&v157 startLevel:2 numLevels:6 pyramidName:@"lowPassYUVPyramid"];
  id v54 = v157;

  if (v23) {
    goto LABEL_109;
  }
  if (!v129)
  {
    v130 = v38;
    v68 = v131;
    goto LABEL_42;
  }
  v67 = [MEMORY[0x263EFF980] arrayWithCapacity:6];

  [v67 addObject:v129];
  [v67 addObject:v128];
  id v156 = v67;
  int v23 = [(H13FastRawMBNRStage *)v137 generatePyramidFromTexture:v129 outputPyramid:&v156 startLevel:2 numLevels:6 pyramidName:@"lowPassYUVNoisePyramid"];
  id v38 = v156;

  v68 = v131;
  if (v23)
  {
LABEL_109:
    FigDebugAssert3();
    id v138 = 0;
    v140 = 0;
    v33 = 0;
    goto LABEL_110;
  }
  v130 = v38;
LABEL_42:
  v140 = 0;
  uint64_t v69 = 5;
  v70 = v132;
  id v71 = v142;
  id v136 = v54;
  while (1)
  {
    id v158 = 0;
    v72 = [v54 objectAtIndexedSubscript:v69];
    id v73 = v182;
    id v182 = v72;

    if (v71)
    {
      v74 = [v130 objectAtIndexedSubscript:v69];
      id v75 = v178;
      id v178 = v74;
    }
    int v76 = [v70 updateRawMBNRConfigForInputFrame:v68 bounds:v133 band:(unsigned __int16)v69 rawMBNRConfig:v172];
    if (v76)
    {
      int v23 = v76;
LABEL_78:
      FigDebugAssert3();
      id v138 = 0;
      v33 = 0;
      v141 = v55;
      goto LABEL_59;
    }
    LODWORD(v77) = DWORD1(v172[0]);
    int v78 = [v70 updateNoiseModelForInputFrame:v68 noiseConfig:v170 totalGain:v69 band:v77];
    if (v78)
    {
      int v23 = v78;
      goto LABEL_78;
    }
    LODWORD(v79) = DWORD1(v172[0]);
    int v80 = [v70 getChromaMBNRSettingsForInputFrame:v68 rawMBNRConfig:v172 totalGain:v69 band:v79];
    if (v80)
    {
      int v23 = v80;
      goto LABEL_78;
    }
    v81 = [v61 commandBuffer];

    if (!v81)
    {
      int v23 = FigSignalErrorAt();
      id v138 = 0;
      v33 = 0;
      v141 = 0;
      goto LABEL_59;
    }
    v33 = [v81 computeCommandEncoder];
    v141 = v81;
    if (!v33)
    {
      int v23 = FigSignalErrorAt();
      id v138 = 0;
      goto LABEL_59;
    }
    unint64_t v82 = 1 << v69;
    float v83 = (float)(((uint64_t)v25 - 1) / v82 + 1);
    float v84 = (float)((*((void *)&v25 + 1) - 1) / v82 + 1);
    uint64_t v85 = objc_msgSend(NSString, "stringWithFormat:", @"reconstructedTex%d", v69);

    if (!v69) {
      break;
    }
    v86 = [NSString stringWithFormat:@"%@", v85];
    v87 = [(H13FastRawMBNRStage *)v137 createIntermediateMetalTexture:v86 withPixelFormat:115 width:(unint64_t)v83 height:(unint64_t)v84];
    id v88 = obj;
    obuint64_t j = v87;

    if (!obj)
    {
      int v23 = FigSignalErrorAt();
      id v138 = 0;
      uint64_t v51 = (void *)v85;
      goto LABEL_59;
    }
    v89 = (void *)v85;
    v90 = [(H13FastRawMBNRShaders *)v137->_shaders denoiseChromaAndStepDown];
    v189[0] = @"hasNoiseMap";
    v91 = [NSNumber numberWithBool:v142 != 0];
    v190[0] = v91;
    v189[1] = @"isTopBand";
    v92 = [NSNumber numberWithBool:v69 == 5];
    v190[1] = v92;
    v189[2] = @"isBottomBand";
    v93 = [NSNumber numberWithBool:0];
    v190[2] = v93;
    v189[3] = @"lscFromCameraInfoByPortType";
    v94 = [NSNumber numberWithBool:BYTE1(v175)];
    v190[3] = v94;
    v95 = [NSDictionary dictionaryWithObjects:v190 forKeys:v189 count:4];
    v96 = [v90 getPipelineStateWithParams:v95];

    if (!v96)
    {
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
      id v138 = 0;
      v140 = 0;
      uint64_t v51 = v89;
      goto LABEL_83;
    }
    [v33 setComputePipelineState:v96];
    [v33 setTexture:v181 atIndex:0];
    [v33 setTexture:v182 atIndex:1];
    [v33 setTexture:location atIndex:2];
    [v33 setTexture:obj atIndex:3];
    [v33 setTexture:v178 atIndex:4];
    [v33 setTexture:v134 atIndex:5];
    [v33 setBytes:v172 length:144 atIndex:0];
    [v33 setBytes:v170 length:56 atIndex:1];
    unint64_t v97 = [v96 threadExecutionWidth];
    unint64_t v98 = [v96 maxTotalThreadsPerThreadgroup];
    v152[0] = (unint64_t)(float)(v83 + 1.0);
    v152[1] = (unint64_t)(float)(v84 + 1.0);
    v152[2] = 1;
    v151[0] = v97;
    v151[1] = v98 / v97;
    v151[2] = 1;
    [v33 dispatchThreads:v152 threadsPerThreadgroup:v151];
    [v33 endEncoding];

    v61 = v135;
    [v135 commit];
    FigMetalDecRef();
    FigMetalDecRef();
    objc_storeStrong(&location, obj);
    objc_storeStrong(&v181, v182);
    id v54 = v136;
    [v136 removeObjectAtIndex:v69--];
    uint64_t v51 = v89;
    v140 = v96;
    long long v55 = v141;
    id v71 = v142;
    v68 = v131;
    v70 = v132;
  }
  id v99 = *a4;
  v121 = (void *)v85;
  if (v99)
  {
    v100 = v99;
    uint64_t v101 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v133);
    id v158 = (id)vshr_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v101, (uint32x2_t)v101, 0x1FuLL), 1uLL);
  }
  else
  {
    v102 = [NSString stringWithFormat:@"%@", v85];
    v100 = [(H13FastRawMBNRStage *)v137 createIntermediateMetalTexture:v102 withPixelFormat:115 width:(unint64_t)v83 height:(unint64_t)v84];
  }
  v103 = [(H13FastRawMBNRShaders *)v137->_shaders denoiseChromaAndStepDownAndRegenBayer];
  v191[0] = @"hasNoiseMap";
  v104 = [NSNumber numberWithBool:v142 != 0];
  v192[0] = v104;
  v191[1] = @"isQuadra";
  v105 = [NSNumber numberWithBool:BYTE12(v172[0])];
  v192[1] = v105;
  v106 = [NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:2];
  uint64_t v107 = [v103 getPipelineStateWithParams:v106];

  if (v107)
  {
    [v33 setComputePipelineState:v107];
    [v33 setTexture:v100 atIndex:0];
    [v33 setTexture:v183 atIndex:1];
    [v33 setTexture:v181 atIndex:2];
    [v33 setTexture:v182 atIndex:3];
    [v33 setTexture:location atIndex:4];
    [v33 setTexture:v178 atIndex:5];
    [v33 setTexture:v134 atIndex:6];
    [v33 setBytes:v172 length:144 atIndex:0];
    [v33 setBytes:v170 length:56 atIndex:1];
    [v33 setBytes:&v158 length:8 atIndex:2];
    unint64_t v108 = ([v100 width] + 29) / 0x1EuLL;
    uint64_t v109 = [v100 height];
    v155[0] = v108;
    v155[1] = (v109 + 13) / 0xEuLL;
    v155[2] = 1;
    long long v153 = xmmword_263380250;
    uint64_t v154 = 1;
    [v33 dispatchThreadgroups:v155 threadsPerThreadgroup:&v153];
    [v33 endEncoding];

    [v135 commit];
    id v54 = v136;
    [v136 removeObjectAtIndex:0];
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    v33 = 0;
    int v23 = 0;
    id v138 = v100;
    v140 = (void *)v107;
    *a4 = v138;
    uint64_t v51 = v121;
LABEL_59:
    id v38 = v130;
    goto LABEL_60;
  }
  id v138 = v100;
  FigDebugAssert3();
  int v23 = FigSignalErrorAt();
  v140 = 0;
  uint64_t v51 = v121;
LABEL_83:
  id v38 = v130;
LABEL_84:
  id v54 = v136;
LABEL_60:
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v110 = v54;
  uint64_t v111 = [v110 countByEnumeratingWithState:&v147 objects:v188 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v148;
    do
    {
      for (uint64_t j = 0; j != v112; ++j)
      {
        if (*(void *)v148 != v113) {
          objc_enumerationMutation(v110);
        }
        id v158 = *(id *)(*((void *)&v147 + 1) + 8 * j);
        FigMetalDecRef();
      }
      uint64_t v112 = [v110 countByEnumeratingWithState:&v147 objects:v188 count:16];
    }
    while (v112);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v115 = v38;
  uint64_t v116 = [v115 countByEnumeratingWithState:&v143 objects:v187 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v144;
    do
    {
      for (uint64_t k = 0; k != v117; ++k)
      {
        if (*(void *)v144 != v118) {
          objc_enumerationMutation(v115);
        }
        id v158 = *(id *)(*((void *)&v143 + 1) + 8 * k);
        FigMetalDecRef();
      }
      uint64_t v117 = [v115 countByEnumeratingWithState:&v143 objects:v187 count:16];
    }
    while (v117);
  }

  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  [v33 endEncoding];

  return v23;
}

- (int)runWithArgs:(id)a3
{
  id v5 = a3;
  id v47 = 0;
  id v48 = 0;
  id v46 = 0;
  char v45 = 0;
  int v44 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = FigSignalErrorAt();
    unsigned int v10 = 0;
    int v22 = 0;
    id v6 = 0;
LABEL_26:
    unsigned int v9 = 0;
    goto LABEL_23;
  }
  id v6 = v5;
  id v7 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v12 = FigSignalErrorAt();
    unsigned int v10 = 0;
    int v22 = 0;
    goto LABEL_26;
  }
  unsigned int v9 = [v6 config];
  unsigned int v10 = [v6 inputTex];

  if (!v10) {
    goto LABEL_27;
  }
  unsigned int v10 = [v6 inputFrame];

  if (!v10) {
    goto LABEL_27;
  }
  unint64_t v11 = [v6 inputFrame];
  int v12 = [v9 getEnabledForInputFrame:v11 isEnabled:&v45];

  if (v12)
  {
    uint64_t v40 = v3;
    LODWORD(v39) = v12;
    goto LABEL_31;
  }
  int v13 = [v6 inputTex];
  [v13 width];

  int v14 = [v6 inputTex];
  [v14 height];

  id v15 = [v6 inputFrame];
  -[SoftISPInputFrame frameID]((uint64_t)v15);

  if (!v45)
  {
    id v48 = [v6 outputTex];
    int v28 = [(H13FastRawMBNRStage *)self bypassRawMBNRWithArgs:v6];
    int v12 = v28;
    if (!v28)
    {
LABEL_16:
      unsigned int v10 = 0;
LABEL_17:
      int v22 = 0;
      goto LABEL_23;
    }
    uint64_t v40 = v3;
    LODWORD(v39) = v28;
LABEL_31:
    FigDebugAssert3();
    goto LABEL_16;
  }
  id v16 = [(H13FastRawMBNRStage *)self staticParameters];
  BOOL v17 = -[SoftISPStaticParameters lscFromCameraInfoByPortType]((BOOL)v16);

  id v42 = v5;
  if (!v17)
  {
    metal = self->_metal;
    v30 = [v6 outputFrame];
    long long v25 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v30 lscPixelBuffer], 115, 23, 0);
    id v47 = v25;

    if (v25)
    {
      int v27 = v9;
      uint64_t v41 = 0;
      int v22 = 0;
      goto LABEL_20;
    }
    int v12 = FigSignalErrorAt();
    goto LABEL_16;
  }
  id v18 = [v6 inputFrame];
  unsigned int v10 = -[SoftISPInputFrame metadata]((uint64_t)v18);

  if (!v10)
  {
LABEL_27:
    int v12 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v19 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  uint64_t v20 = (void *)v19;
  id v21 = @"Invalid PortType";
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  int v22 = v21;

  int v23 = [v9 getLSCGridDimensions:&v44 portType:v22];
  if (v23)
  {
    int v12 = v23;
    uint64_t v40 = v3;
    LODWORD(v39) = v23;
LABEL_36:
    FigDebugAssert3();
    goto LABEL_23;
  }
  double v24 = [(H13FastRawMBNRStage *)self createIntermediateMetalDeviceTexture:@"lscGainsTex" withPixelFormat:115 width:(unsigned __int16)v44 height:HIWORD(v44)];
  id v47 = v24;
  if (!v24)
  {
    int v12 = FigSignalErrorAt();
    goto LABEL_23;
  }
  long long v25 = v24;
  int v26 = [v6 inputFrame];
  int v12 = [v9 getLSCGainsForInputFrame:v26 lscGridSize:&v44 lscGainsTex:v25];

  if (v12)
  {
    uint64_t v40 = v3;
    LODWORD(v39) = v12;
    goto LABEL_36;
  }
  uint64_t v41 = v10;
  int v27 = v9;
LABEL_20:
  id v31 = [v6 outputTex];
  id v32 = [v6 inputTex];
  id v43 = v31;
  v33 = [v6 inputFrame];
  v34 = [v6 outputFrame];
  unint64_t v35 = [v6 bounds];
  int v36 = [(H13FastRawMBNRStage *)self runRawMBNROnInputTexture:v32 outputTexture:&v43 bayerNoise:0 inputFrame:v33 outputFrame:v34 bounds:v35 h13FastConfig:v27 lscGainsTex:v25];
  id v37 = v43;
  id v48 = v37;

  if (v36)
  {
    uint64_t v40 = v3;
    LODWORD(v39) = v36;
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }
  else
  {
    [v6 setOutputTex:v37];
    int v12 = 0;
  }
  unsigned int v9 = v27;
  unsigned int v10 = v41;
  id v5 = v42;
LABEL_23:
  objc_msgSend(v6, "setInputTex:", 0, v39, v40);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v12;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (H13FastRawMBNRShaders)shaders
{
  return self->_shaders;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end