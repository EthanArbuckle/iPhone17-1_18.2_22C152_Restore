@interface H13FastLumaSharpeningStageMetal
- (FigMetalContext)metal;
- (H13FastLumaSharpeningShaders)shaders;
- (H13FastLumaSharpeningStageMetal)initWithMetalContext:(id)a3;
- (int)encodeWithConfig:(id *)a3 inputTex:outputTex:isRGB:allowUnclampedOutputs:sourceSize:destOrigin:;
- (void)setMetal:(id)a3;
@end

@implementation H13FastLumaSharpeningStageMetal

- (H13FastLumaSharpeningStageMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)H13FastLumaSharpeningStageMetal;
  v6 = [(H13FastLumaSharpeningStageMetal *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[H13FastLumaSharpeningShaders alloc] initWithMetalContext:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v7->_shaders))
  {
    v10 = v7;
  }
  else
  {
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (int)encodeWithConfig:(id *)a3 inputTex:outputTex:isRGB:allowUnclampedOutputs:sourceSize:destOrigin:
{
  v8 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  v11 = v4;
  v77[2] = *MEMORY[0x263EF8340];
  id v42 = v3;
  id v43 = v11;
  v14 = [(FigMetalContext *)self->_metal commandBuffer];
  v15 = v14;
  if (!v14)
  {
    FigDebugAssert3();
    int v41 = FigSignalErrorAt();
    goto LABEL_23;
  }
  __asm { FCMP            H8, #0 }
  if (!(_NF ^ _VF | _ZF))
  {
    v21 = [(H13FastLumaSharpeningShaders *)self->_shaders lumaSharpening];
    v76[0] = @"isRGB";
    v22 = [NSNumber numberWithBool:v10];
    v76[1] = @"allowUnclampedOutputs";
    v77[0] = v22;
    v23 = [NSNumber numberWithBool:v9];
    v77[1] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    v25 = [v21 getPipelineStateWithParams:v24];

    if (v25)
    {
      v26 = [v15 computeCommandEncoder];
      v27 = v26;
      if (!v26)
      {
        FigDebugAssert3();
        int v39 = FigSignalErrorAt();

        goto LABEL_20;
      }
      [v26 setComputePipelineState:v25];
      int v28 = [v43 width];
      if (v28 >= -15) {
        int v29 = v28 + 15;
      }
      else {
        int v29 = v28 + 30;
      }
      int v30 = [v43 height];
      uint64_t v65 = 0;
      if (v30 >= -15) {
        int v31 = v30 + 15;
      }
      else {
        int v31 = v30 + 30;
      }
      LOBYTE(v66) = 0;
      uint64_t v67 = 76;
      v68 = a3;
      uint64_t v69 = 0;
      long long v70 = xmmword_263481600;
      char v71 = 0;
      uint64_t v72 = -1;
      uint64_t v73 = 0;
      uint64_t v74 = 0;
      uint64_t v75 = -1;
      *(void *)&long long v59 = 0;
      *((void *)&v59 + 1) = v42;
      int64x2_t v60 = vdupq_n_s64(1uLL);
      long long v62 = xmmword_263480490;
      id v61 = v43;
      uint64_t v63 = 0;
      uint64_t v64 = -1;
      v57 = @"H13FastLumaSharpening::FunctionConstants::isRGB";
      v32 = [NSNumber numberWithBool:v10];
      v58 = v32;
      id v33 = (id)[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];

      +[SoftISPArgsTools setAllArgumentsOnEncoder:v27 textures:&v59 argIdentifiers:&v65];
      [v27 setImageblockWidth:16 height:16];
      v56[0] = v29 >> 4;
      v56[1] = v31 >> 4;
      v56[2] = 1;
      int64x2_t v54 = vdupq_n_s64(0x14uLL);
      uint64_t v55 = 1;
      [v27 dispatchThreadgroups:v56 threadsPerThreadgroup:&v54];
      [v27 endEncoding];
      for (uint64_t i = 56; i != -16; i -= 24)

      for (uint64_t j = 80; j != -16; j -= 48)
        objc_destroyWeak((id *)((char *)&v65 + j));

      goto LABEL_17;
    }
    int v41 = FigSignalErrorAt();
LABEL_23:
    int v39 = v41;
    goto LABEL_20;
  }
  v25 = [v14 blitCommandEncoder];
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  long long v59 = *v8;
  v60.i64[0] = *((void *)v8 + 2);
  long long v52 = *v78;
  uint64_t v53 = *((void *)v78 + 2);
  [v25 copyFromTexture:v42 sourceSlice:0 sourceLevel:0 sourceOrigin:&v65 sourceSize:&v59 toTexture:v43 destinationSlice:0 destinationLevel:0 destinationOrigin:&v52];
  [v25 endEncoding];
LABEL_17:

  if (*MEMORY[0x263F00E10])
  {
    v36 = [v15 commandQueue];
    v37 = [v36 commandBuffer];

    [v37 setLabel:@"KTRACE_MTLCMDBUF"];
    __asm { FCVT            S8, H8 }
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __121__H13FastLumaSharpeningStageMetal_encodeWithConfig_inputTex_outputTex_isRGB_allowUnclampedOutputs_sourceSize_destOrigin___block_invoke;
    v48[3] = &__block_descriptor_60_e28_v16__0___MTLCommandBuffer__8l;
    long long v49 = *v8;
    uint64_t v50 = *((void *)v8 + 2);
    int v51 = _S8;
    [v37 addCompletedHandler:v48];
    [v37 commit];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __121__H13FastLumaSharpeningStageMetal_encodeWithConfig_inputTex_outputTex_isRGB_allowUnclampedOutputs_sourceSize_destOrigin___block_invoke_2;
    v44[3] = &__block_descriptor_60_e28_v16__0___MTLCommandBuffer__8l;
    long long v45 = *v8;
    uint64_t v46 = *((void *)v8 + 2);
    int v47 = _S8;
    [v15 addCompletedHandler:v44];
  }
  [(FigMetalContext *)self->_metal commit];
  int v39 = 0;
LABEL_20:

  return v39;
}

uint64_t __121__H13FastLumaSharpeningStageMetal_encodeWithConfig_inputTex_outputTex_isRGB_allowUnclampedOutputs_sourceSize_destOrigin___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __121__H13FastLumaSharpeningStageMetal_encodeWithConfig_inputTex_outputTex_isRGB_allowUnclampedOutputs_sourceSize_destOrigin___block_invoke_2(uint64_t a1, void *a2)
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

- (void)setMetal:(id)a3
{
}

- (H13FastLumaSharpeningShaders)shaders
{
  return self->_shaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end