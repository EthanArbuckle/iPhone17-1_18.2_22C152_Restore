@interface DefringeStage
+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4;
- (DefringeStage)initWithMetalContext:(id)a3;
- (id)_functionNameForProgram:(int)a3;
- (int)_compileShaders;
- (int)defringePyramid:(id)a3 outputPyramid:(id)a4 chromaScratch:(id)a5 quadraBinningFactor:(int)a6 tuningParameters:(id)a7;
- (void)_collapseFilteredChroma:(id)a3 usingInputDown:(id)a4 inputUp:(id)a5 into:(id)a6;
- (void)_copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)_defringeLuma:(id)a3 chroma:(id)a4 into:(id)a5 quadraBinningFactor:(int)a6;
@end

@implementation DefringeStage

- (DefringeStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DefringeStage;
  v6 = [(DefringeStage *)&v9 init];
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_metalContext, a3), [(DefringeStage *)v7 _compileShaders]))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }

  return v7;
}

- (int)_compileShaders
{
  metalContext = self->_metalContext;
  v4 = [(DefringeStage *)self _functionNameForProgram:0];
  id v5 = [(FigMetalContext *)metalContext computePipelineStateFor:v4 constants:0];
  v6 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v5;

  if (self->_pipelineStates[0])
  {
    v7 = self->_metalContext;
    v8 = [(DefringeStage *)self _functionNameForProgram:1];
    objc_super v9 = [(FigMetalContext *)v7 computePipelineStateFor:v8 constants:0];
    v10 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v9;

    if (self->_pipelineStates[1]) {
      return 0;
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (id)_functionNameForProgram:(int)a3
{
  if (!a3) {
    return @"defringe_still";
  }
  if (a3 == 1) {
    return @"collapse_cbcr";
  }
  FigDebugAssert3();
  return 0;
}

+ (int)prewarmShaders:(id)a3 tuningParameters:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"DefaultSensorIDs"];
  v8 = v7;
  if (v7)
  {
    v31 = v7;
    v32 = v5;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v7;
    uint64_t v35 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v35)
    {
      id v33 = v9;
      uint64_t v34 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(v9);
          }
          uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v12 = [v9 objectForKeyedSubscript:v11];
          v13 = [v6 objectForKeyedSubscript:v11];
          v14 = [v13 objectForKeyedSubscript:v12];
          v15 = [v14 objectForKeyedSubscript:@"ChromaticDefringing"];

          if (v15)
          {
            v16 = [v6 objectForKeyedSubscript:v11];
            v17 = [v16 objectForKeyedSubscript:v12];
            v18 = [v17 objectForKeyedSubscript:@"ChromaticDefringing"];
            [v18 objectForKeyedSubscript:@"Still"];
            v36 = v15;
            v20 = id v19 = v6;
            v21 = [v20 objectForKeyedSubscript:@"CorrectionEnabled"];
            int v22 = [v21 BOOLValue];

            id v9 = v33;
            id v6 = v19;
            v15 = v36;

            if (v22)
            {
              id v5 = v32;
              v24 = [[DefringeStage alloc] initWithMetalContext:v32];
              if (v24)
              {
                v25 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:65 width:4 height:4 mipmapped:0];
                [v25 setUsage:3];
                v26 = [v32 device];
                v27 = (void *)[v26 newTextureWithDescriptor:v25];

                v28 = [v32 device];
                v29 = (void *)[v28 newTextureWithDescriptor:v25];

                [(DefringeStage *)v24 _copyFromTexture:v27 toTexture:v29];
                [v32 commit];

                id v9 = v33;
                int v23 = 0;
              }
              else
              {
                int v23 = -12786;
              }

              goto LABEL_16;
            }
          }
        }
        uint64_t v35 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }

    int v23 = 0;
    id v5 = v32;
LABEL_16:
    v8 = v31;
  }
  else
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }

  return v23;
}

- (void)_defringeLuma:(id)a3 chroma:(id)a4 into:(id)a5 quadraBinningFactor:(int)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  -[VideoDefringingTuningParameters setRadialParamsForWidth:height:](self->_tuningParameters, "setRadialParamsForWidth:height:", [v10 width], objc_msgSend(v10, "height"));
  v13 = [(FigMetalContext *)self->_metalContext commandBuffer];
  v14 = [v13 computeCommandEncoder];
  uint64_t v34 = 0;
  long long v15 = 0uLL;
  memset(v33, 0, sizeof(v33));
  tuningParameters = self->_tuningParameters;
  if (tuningParameters
    && ([(VideoDefringingTuningParameters *)tuningParameters correctionParams],
        v17 = self->_tuningParameters,
        long long v15 = 0uLL,
        long long v31 = 0u,
        long long v32 = 0u,
        long long v29 = 0u,
        long long v30 = 0u,
        v17))
  {
    [(VideoDefringingTuningParameters *)v17 radialParams];
    v18 = self->_tuningParameters;
  }
  else
  {
    v18 = 0;
    long long v31 = v15;
    long long v32 = v15;
    long long v29 = v15;
    long long v30 = v15;
  }
  [(VideoDefringingTuningParameters *)v18 desaturationParams];
  v28[0] = v19;
  v28[1] = v20;
  v28[2] = v21;
  int v27 = a6;
  [v14 setComputePipelineState:self->_pipelineStates[0]];
  [v14 setImageblockWidth:16 height:16];
  [v14 setTexture:v12 atIndex:0];

  [v14 setTexture:v10 atIndex:1];
  [v14 setTexture:v11 atIndex:4];
  [v14 setBytes:v33 length:232 atIndex:0];
  [v14 setBytes:v28 length:12 atIndex:1];
  [v14 setBytes:&v29 length:64 atIndex:2];
  [v14 setBytes:&v27 length:4 atIndex:3];
  uint64_t v22 = [v11 width];
  uint64_t v23 = [v11 height];

  v26[0] = v22;
  v26[1] = v23;
  v26[2] = 1;
  int64x2_t v24 = vdupq_n_s64(0x10uLL);
  uint64_t v25 = 1;
  [v14 dispatchThreads:v26 threadsPerThreadgroup:&v24];
  [v14 endEncoding];
}

- (void)_collapseFilteredChroma:(id)a3 usingInputDown:(id)a4 inputUp:(id)a5 into:(id)a6
{
  metalContext = self->_metalContext;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  long long v15 = [(FigMetalContext *)metalContext commandBuffer];
  v16 = [v15 computeCommandEncoder];
  [v16 setComputePipelineState:self->_pipelineStates[1]];
  [v16 setTexture:v12 atIndex:1];

  [v16 setTexture:v13 atIndex:2];
  [v16 setTexture:v14 atIndex:3];

  [v16 setTexture:v11 atIndex:4];
  unint64_t v17 = [(MTLComputePipelineState *)self->_pipelineStates[1] threadExecutionWidth];
  unint64_t v18 = [(MTLComputePipelineState *)self->_pipelineStates[1] maxTotalThreadsPerThreadgroup]/ v17;
  uint64_t v19 = [v11 width];
  uint64_t v20 = [v11 height];

  v22[0] = v19;
  v22[1] = v20;
  v22[2] = 1;
  v21[0] = v17;
  v21[1] = v18;
  v21[2] = 1;
  [v16 dispatchThreads:v22 threadsPerThreadgroup:v21];
  [v16 endEncoding];
}

- (void)_copyFromTexture:(id)a3 toTexture:(id)a4
{
  metalContext = self->_metalContext;
  id v6 = a4;
  id v7 = a3;
  id v9 = [(FigMetalContext *)metalContext commandBuffer];
  v8 = [v9 blitCommandEncoder];
  [v8 copyFromTexture:v7 toTexture:v6];

  [v8 endEncoding];
}

- (int)defringePyramid:(id)a3 outputPyramid:(id)a4 chromaScratch:(id)a5 quadraBinningFactor:(int)a6 tuningParameters:(id)a7
{
  id v12 = a3;
  id v13 = (char *)a4;
  id v14 = a5;
  id v32 = a7;
  if (*MEMORY[0x263F00E10])
  {
    long long v15 = [(FigMetalContext *)self->_metalContext commandQueue];
    v16 = [v15 commandBuffer];

    [v16 setLabel:@"KTRACE_START_MTL"];
    [v16 addCompletedHandler:&__block_literal_global_8];
    [v16 commit];
  }
  int v17 = v12[2];
  int v18 = *((_DWORD *)v13 + 2);
  if (v17 >= v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v17;
  }
  if (v17 <= 1) {
    goto LABEL_26;
  }
  if (v18 <= 1) {
    goto LABEL_26;
  }
  uint64_t v20 = [v14 pixelFormat];
  if (v20 != [*((id *)v13 + 62) pixelFormat] || !v32) {
    goto LABEL_26;
  }
  unsigned int v31 = a6;
  id v21 = v14;
  if ((int)v19 < 1)
  {
LABEL_15:
    id v14 = v21;
    if (FigMetalIsValid() & 1) != 0 && (FigMetalIsValid() & 1) != 0 && (FigMetalIsValid())
    {
      objc_storeStrong((id *)&self->_tuningParameters, a7);
      [(FigMetalContext *)self->_metalContext commit];
      uint64_t v25 = [(FigMetalContext *)self->_metalContext commandBuffer];
      [v25 setLabel:@"defringe"];

      if ((int)v19 >= 3)
      {
        unint64_t v26 = v19 + 1;
        do
        {
          [(DefringeStage *)self _copyFromTexture:*(void *)&v12[2 * (v26 - 2) + 124] toTexture:*(void *)&v13[8 * (v26 - 2) + 496]];
          --v26;
        }
        while (v26 > 3);
      }
      [(DefringeStage *)self _defringeLuma:*((void *)v12 + 44) chroma:*((void *)v12 + 63) into:*((void *)v13 + 63) quadraBinningFactor:v31];
      [(DefringeStage *)self _collapseFilteredChroma:*((void *)v13 + 63) usingInputDown:*((void *)v12 + 63) inputUp:*((void *)v12 + 62) into:v21];
      [(DefringeStage *)self _defringeLuma:*((void *)v12 + 43) chroma:v21 into:*((void *)v13 + 62) quadraBinningFactor:v31];
      [(FigMetalContext *)self->_metalContext commit];
      if (*MEMORY[0x263F00E10])
      {
        int v27 = [(FigMetalContext *)self->_metalContext commandQueue];
        v28 = [v27 commandBuffer];

        [v28 setLabel:@"KTRACE_END_MTL"];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __98__DefringeStage_defringePyramid_outputPyramid_chromaScratch_quadraBinningFactor_tuningParameters___block_invoke_2;
        v33[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
        memset(&v33[4], 0, 24);
        [v28 addCompletedHandler:v33];
        [v28 commit];
      }
      int v29 = 0;
      goto LABEL_24;
    }
LABEL_26:
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
    goto LABEL_24;
  }
  uint64_t v22 = v19;
  uint64_t v23 = v12;
  int64x2_t v24 = v13;
  while ((FigMetalIsValid() & 1) != 0 && (FigMetalIsValid() & 1) != 0)
  {
    v24 += 8;
    v23 += 2;
    if (!--v22) {
      goto LABEL_15;
    }
  }
  FigDebugAssert3();
  int v29 = FigSignalErrorAt();
  id v14 = v21;
LABEL_24:

  return v29;
}

void __98__DefringeStage_defringePyramid_outputPyramid_chromaScratch_quadraBinningFactor_tuningParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __98__DefringeStage_defringePyramid_outputPyramid_chromaScratch_quadraBinningFactor_tuningParameters___block_invoke_2(uint64_t a1, void *a2)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  for (uint64_t i = 24; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end