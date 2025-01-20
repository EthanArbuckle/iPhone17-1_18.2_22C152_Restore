@interface DisparityStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (DisparityShaders)shaders;
- (DisparityStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (FigMetalContext)metal;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (int)runWithArgs:(id)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation DisparityStage

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (DisparityStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DisparityStage;
  v9 = [(DisparityStage *)&v15 init];
  v10 = v9;
  if (v9
    && (objc_storeStrong((id *)&v9->_metal, a3), v10->_metal)
    && v8
    && (objc_storeStrong((id *)&v10->_staticParameters, a4),
        v11 = [[DisparityShaders alloc] initWithMetalContext:v7], shaders = v10->_shaders, v10->_shaders = v11, shaders, v10->_shaders))
  {
    v10->_outputDownscaleFactor = 2;
    v13 = v10;
  }
  else
  {
    FigDebugAssert3();
    v13 = 0;
  }

  return v13;
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 1815162994;
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
  uint64_t v7 = -[DisparityStage outputPixelFormatForInputPixelFormat:outputCompressionLevel:](self, "outputPixelFormatForInputPixelFormat:outputCompressionLevel:", [v6 inputPixelFormat], v4);
  if (v7)
  {
    id v8 = [[DisparityConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputPixelFormat:v7];
  }
  else
  {
    FigDebugAssert3();
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  return 0;
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
  v13 = [[DisparityStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  id v5 = a3;
  uint64_t v61 = 0;
  memset(v60, 0, sizeof(v60));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = FigSignalErrorAt();
    goto LABEL_12;
  }
  id v6 = v5;
  uint64_t v7 = [v6 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v12 = FigSignalErrorAt();
LABEL_18:

    goto LABEL_12;
  }
  id v9 = [v6 config];
  id v10 = [v6 inputFrame];
  id v11 = [v6 bounds];
  int v12 = [v9 determineDemosaicParameters:v60 inputFrame:v10 bounds:v11];

  if (v12)
  {
    uint64_t v44 = v3;
    LODWORD(v43) = v12;
    FigDebugAssert3();
LABEL_17:

    goto LABEL_18;
  }
  v13 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v13)
  {
    uint64_t v44 = v3;
    LODWORD(v43) = 0;
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v14 = v13;
  uint64_t v15 = [v13 computeCommandEncoder];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v6 inputFrame];
    int v18 = -[SoftISPInputFrame cfaLayout]((uint64_t)v17);

    shaders = self->_shaders;
    v48 = v9;
    id v49 = v5;
    v47 = self;
    if (v18 == 3)
    {
      v20 = [(DisparityShaders *)shaders demosaicQuadraBayerToARGB];
      unsigned int v21 = 2;
    }
    else
    {
      v20 = [(DisparityShaders *)shaders demosaicBayerToARGB];
      unsigned int v21 = 1;
    }
    [v16 setComputePipelineState:v20];
    v22 = [v6 inputTex];
    [v16 setTexture:v22 atIndex:0];

    v23 = [v6 outputTex];
    [v16 setTexture:v23 atIndex:1];

    [v16 setBytes:v60 length:40 atIndex:0];
    unint64_t v24 = [v20 threadExecutionWidth];
    v46 = v20;
    unint64_t v25 = [v20 maxTotalThreadsPerThreadgroup] / v24;
    v26 = [v6 outputTex];
    unsigned int v45 = v21;
    unint64_t v27 = v21;
    unint64_t v28 = [v26 width] / (unint64_t)v21;
    v29 = [v6 outputTex];
    v59[0] = v28;
    v59[1] = [v29 height] / v27;
    v59[2] = 1;
    v58[0] = v24;
    v58[1] = v25;
    v58[2] = 1;
    [v16 dispatchThreads:v59 threadsPerThreadgroup:v58];

    [v16 endEncoding];
    v30 = [v6 outputTex];
    unsigned int v31 = [v30 width];

    v32 = [v6 outputTex];
    unsigned int v33 = [v32 height];

    v34 = [v6 inputFrame];
    unsigned __int16 v35 = -[SoftISPInputFrame frameID]((uint64_t)v34) >> 16;

    if (*MEMORY[0x263F00E10])
    {
      int v36 = v35;
      int v37 = v33 / v45;
      int v38 = v31 / v45;
      v39 = [v14 commandQueue];
      v40 = [v39 commandBuffer];

      [v40 setLabel:@"KTRACE_MTLCMDBUF"];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __30__DisparityStage_runWithArgs___block_invoke;
      v54[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
      int v55 = v38;
      int v56 = v37;
      int v57 = v36;
      [v40 addCompletedHandler:v54];
      [v40 commit];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __30__DisparityStage_runWithArgs___block_invoke_2;
      v50[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
      int v51 = v38;
      int v52 = v37;
      int v53 = v36;
      [v14 addCompletedHandler:v50];
    }
    v41 = [v6 outputFrame];
    [v41 addCompletionHandlerToCommandBuffer:v14];

    [(FigMetalContext *)v47->_metal commit];
    int v12 = 0;
    id v5 = v49;
  }
  else
  {
    int v12 = FigSignalErrorAt();
  }
LABEL_12:
  objc_msgSend(0, "endEncoding", v43, v44);

  return v12;
}

uint64_t __30__DisparityStage_runWithArgs___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __30__DisparityStage_runWithArgs___block_invoke_2(uint64_t a1, void *a2)
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

- (FigMetalContext)metal
{
  return self->_metal;
}

- (DisparityShaders)shaders
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