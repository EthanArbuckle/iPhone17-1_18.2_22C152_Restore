@interface H13UtilityConvertStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (H13UtilityConvertShaders)shaders;
- (H13UtilityConvertStage)initWithMetalContext:(id)a3 staticParameters:(id)a4 inputPixelFormat:(int)a5 outputPixelFormat:(int)a6;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createIntermediateMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unint64_t)a6;
- (int)runConvertFromTex:(id)a3 outputTexture:(id)a4 args:(id)a5 config:(id)a6 outputOffset:;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation H13UtilityConvertStage

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  unsigned int result = 0;
  int outputPixelFormat = self->_outputPixelFormat;
  if (outputPixelFormat > 20)
  {
    if (outputPixelFormat > 29)
    {
      if (outputPixelFormat == 30)
      {
LABEL_12:
        uint64_t v7 = 1651926376;
      }
      else
      {
        if (outputPixelFormat != 31) {
          return result;
        }
LABEL_9:
        uint64_t v7 = 1647719528;
      }
      return determineCompressedOutputPixelFormat(v7, a4);
    }
    if (outputPixelFormat == 21)
    {
      return 1651519798;
    }
    else if (outputPixelFormat == 22)
    {
      return determineNonCompandedPixelFormat(a3, 1, 0, 0, 1);
    }
  }
  else
  {
    switch(outputPixelFormat)
    {
      case 2:
        return 1651519798;
      case 3:
        return determineNonCompandedPixelFormat(a3, 1, 0, 0, 1);
      case 10:
        goto LABEL_12;
      case 11:
        goto LABEL_9;
      default:
        return result;
    }
  }
  return result;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (H13UtilityConvertStage)initWithMetalContext:(id)a3 staticParameters:(id)a4 inputPixelFormat:(int)a5 outputPixelFormat:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)H13UtilityConvertStage;
  v13 = [(H13UtilityConvertStage *)&v19 init];
  v14 = v13;
  if (v13
    && v11
    && (objc_storeStrong((id *)&v13->_metal, a3), v12)
    && (objc_storeStrong((id *)&v14->_staticParameters, a4),
        v15 = [[H13UtilityConvertShaders alloc] initWithMetalContext:v11 inputPixelFormat:v7 outputPixelFormat:v6], shaders = v14->_shaders, v14->_shaders = v15, shaders, v14->_shaders))
  {
    v14->_inputPixelFormat = v7;
    v14->_int outputPixelFormat = v6;
    v14->_outputDownscaleFactor = 1;
    v17 = v14;
  }
  else
  {
    FigDebugAssert3();
    v17 = 0;
  }

  return v17;
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
  uint64_t v7 = [[H13UtilityConvertConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 inputPixelFormat:self->_inputPixelFormat outputPixelFormat:self->_outputPixelFormat outputCompressionLevel:v4];

  return v7;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  int outputPixelFormat = self->_outputPixelFormat;
  id v4 = a3;
  int v5 = [v4 maximumOutputDimensions];
  if (outputPixelFormat == 1) {
    char v6 = 2;
  }
  else {
    char v6 = 1;
  }
  int v7 = v5 << v6;
  int v8 = (unint64_t)[v4 maximumOutputDimensions] >> 32;

  return (v7 * v8);
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
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
  v13 = [[H13UtilityConvertStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (id)createIntermediateMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  v13 = [v11 desc];
  [v13 setWidth:a4];

  v14 = [v11 desc];
  [v14 setHeight:a5];

  v15 = [v11 desc];
  [v15 setUsage:3];

  v16 = [v11 desc];
  [v16 setPixelFormat:a6];

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

- (int)runConvertFromTex:(id)a3 outputTexture:(id)a4 args:(id)a5 config:(id)a6 outputOffset:
{
  int v8 = v6;
  id v41 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v54 = 0;
  uint64_t v53 = 0;
  v16 = [v14 inputFrame];
  v17 = [v14 outputFrame];
  int v18 = [v15 getConfigForInputFrame:v16 outputFrame:v17 config:&v53];

  if (v18)
  {
    uint64_t v40 = v7;
    LODWORD(v39) = v18;
    FigDebugAssert3();
  }
  else
  {
    int v54 = v8;
    int outputPixelFormat = self->_outputPixelFormat;
    char v21 = outputPixelFormat != 11 && outputPixelFormat != 31;
    v22 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v22)
    {
      v23 = v22;
      uint64_t v24 = [v22 computeCommandEncoder];
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = [v15 maximumOutputDimensions] >> v21;
        uint64_t v27 = ((unint64_t)[v15 maximumOutputDimensions] >> 32) >> v21;
        v28 = [(H13UtilityConvertShaders *)self->_shaders convert];
        [v25 setComputePipelineState:v28];

        [v25 setImageblockWidth:32 height:32];
        [v25 setBytes:&v53 length:12 atIndex:0];
        objc_msgSend(v25, "setTexture:atIndex:", v41, -[H13UtilityConvertShaders inputTexIndex](self->_shaders, "inputTexIndex"));
        objc_msgSend(v25, "setTexture:atIndex:", v13, -[H13UtilityConvertShaders outputTexIndex](self->_shaders, "outputTexIndex"));
        v52[0] = v26;
        v52[1] = v27;
        v52[2] = 1;
        int64x2_t v50 = vdupq_n_s64(0x10uLL);
        uint64_t v51 = 1;
        [v25 dispatchThreads:v52 threadsPerThreadgroup:&v50];
        [v25 endEncoding];

        int v29 = [v15 maximumOutputDimensions];
        unint64_t v30 = [v15 maximumOutputDimensions];
        v31 = [v14 inputFrame];
        unsigned __int16 v32 = -[SoftISPInputFrame frameID]((uint64_t)v31) >> 16;

        if (*MEMORY[0x263F00E10])
        {
          int v33 = v32;
          unint64_t v34 = HIDWORD(v30);
          v35 = [v23 commandQueue];
          v36 = [v35 commandBuffer];

          [v36 setLabel:@"KTRACE_MTLCMDBUF"];
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __83__H13UtilityConvertStage_runConvertFromTex_outputTexture_args_config_outputOffset___block_invoke;
          v46[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
          int v47 = v29;
          int v48 = v34;
          int v49 = v33;
          [v36 addCompletedHandler:v46];
          [v36 commit];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __83__H13UtilityConvertStage_runConvertFromTex_outputTexture_args_config_outputOffset___block_invoke_2;
          v42[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
          int v43 = v29;
          int v44 = v34;
          int v45 = v33;
          [v23 addCompletedHandler:v42];
        }
        v37 = [v14 outputFrame];
        [v37 addCompletionHandlerToCommandBuffer:v23];

        [(FigMetalContext *)self->_metal commit];
        int v18 = 0;
      }
      else
      {
        int v18 = FigSignalErrorAt();
      }
    }
    else
    {
      uint64_t v40 = v7;
      LODWORD(v39) = 0;
      FigDebugAssert3();
      int v18 = FigSignalErrorAt();
    }
  }
  objc_msgSend(0, "endEncoding", v39, v40);

  return v18;
}

uint64_t __83__H13UtilityConvertStage_runConvertFromTex_outputTexture_args_config_outputOffset___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __83__H13UtilityConvertStage_runConvertFromTex_outputTexture_args_config_outputOffset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)runWithArgs:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v33 = FigSignalErrorAt();
    int v8 = 0;
    id v12 = 0;
    id v5 = 0;
LABEL_29:
    id v10 = 0;
    id v9 = 0;
    goto LABEL_26;
  }
  id v5 = v4;
  int v6 = [v5 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v33 = FigSignalErrorAt();
    int v8 = 0;
    id v12 = 0;
    goto LABEL_29;
  }
  int v8 = [v5 config];
  id v9 = [v5 inputFrame];
  if (!v9)
  {
    int v33 = FigSignalErrorAt();
    id v12 = 0;
    id v10 = 0;
    goto LABEL_26;
  }
  id v10 = [v5 bounds];
  if (!v10
    || ([v5 inputTex], id v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    int v33 = FigSignalErrorAt();
    id v12 = 0;
    goto LABEL_26;
  }
  v37 = v9;
  id v12 = [v5 inputTex];
  unint64_t v13 = [v12 width];
  unint64_t v14 = [v12 height];
  id v15 = [v8 outputMTLPixelFormatForPlane];
  uint64_t v16 = (int)objc_msgSend(v15, "cmi_intValueForIndex:", 0);

  v17 = [v5 outputTex];

  if (v17)
  {
    int v18 = [v5 outputTex];
    uint64_t v19 = [v18 pixelFormat];

    if (v19 != v16)
    {
      int v33 = FigSignalErrorAt();
      goto LABEL_25;
    }
    uint64_t v20 = -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v10);
    HIWORD(v38) = WORD2(v20);
    LOWORD(v38) = v20;
    uint64_t v21 = v38;
  }
  else
  {
    v35 = v8;
    id v36 = v4;
    int inputPixelFormat = self->_inputPixelFormat;
    int outputPixelFormat = self->_outputPixelFormat;
    uint64_t v24 = runWithArgs__counter++;
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"ConvertOutput%d", v24);
    if (!v16
      || (outputPixelFormat != 11 ? (BOOL v26 = outputPixelFormat == 31) : (BOOL v26 = 1),
          v26 ? (char v27 = 0) : (char v27 = 1),
          inputPixelFormat != 11 ? (BOOL v28 = inputPixelFormat == 31) : (BOOL v28 = 1),
          v28 ? (char v29 = 0) : (char v29 = 1),
          [(H13UtilityConvertStage *)self createIntermediateMetalTexture:v25 width:v13 >> v29 << v27 height:v14 >> v29 << v27 pixelFormat:v16], uint64_t v30 = objc_claimAutoreleasedReturnValue(), (v39 = (void *)v30) == 0))
    {
      int v8 = v35;
      id v4 = v36;
      int v33 = FigSignalErrorAt();

      goto LABEL_25;
    }
    [v5 setOutputTex:v30];
    FigMetalDecRef();

    uint64_t v21 = 0;
    int v8 = v35;
    id v4 = v36;
  }
  v31 = [v5 inputTex];
  unsigned __int16 v32 = [v5 outputTex];
  int v33 = [(H13UtilityConvertStage *)self runConvertFromTex:v31 outputTexture:v32 args:v5 config:v8 outputOffset:v21];

LABEL_25:
  id v9 = v37;
LABEL_26:
  [v5 setInputTex:0];

  return v33;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (H13UtilityConvertShaders)shaders
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