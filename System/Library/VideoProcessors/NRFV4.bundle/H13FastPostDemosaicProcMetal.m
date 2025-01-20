@interface H13FastPostDemosaicProcMetal
- (BOOL)supportsInPlaceOperation:(id *)a3;
- (FigMetalContext)metal;
- (H13FastPostDemosaicProcMetal)initWithMetalContext:(id)a3;
- (H13FastPostDemosaicProcShaders)shaders;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)runWithInputLumaTex:(id)a3 inputChromaTex:(id)a4 postDemosaicProcConfig:(id *)a5 chromaSuppressionConfig:(ChromaSupressionStruct *)a6 outputSize:(id)a7 outputLumaTex:(id)a8 outputChromaTex:(id)a9 commandBuffer:(id)a10 outputFrame:(BOOL)a11 isQuadra:;
- (int)runWithTextureArray:(id)a3 inputCropRect:(id)a4 inputMetadata:(id)a5 controls:(id *)a6 outputCropRect:(id)a7 blacklevel:(float)a8;
- (int)runWithTextureArray:(id)a3 postDemosaicProcConfig:(id *)a4 chromaSupressionConfig:(ChromaSupressionStruct *)a5 outputSize:;
- (void)setMetal:(id)a3;
@end

@implementation H13FastPostDemosaicProcMetal

- (H13FastPostDemosaicProcMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)H13FastPostDemosaicProcMetal;
  v6 = [(H13FastPostDemosaicProcMetal *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v8 = [[H13FastPostDemosaicProcShaders alloc] initWithMetalContext:v5];
  shaders = v7->_shaders;
  v7->_shaders = v8;

  if (!v7->_shaders) {
    goto LABEL_7;
  }
  uint64_t v10 = objc_opt_new();
  h13FastConfig = v7->_h13FastConfig;
  v7->_h13FastConfig = (H13FastPostDemosaicProcConfigMetal *)v10;

  if (v7->_h13FastConfig)
  {
    v12 = v7;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    v12 = 0;
  }

  return v12;
}

- (int)runWithTextureArray:(id)a3 inputCropRect:(id)a4 inputMetadata:(id)a5 controls:(id *)a6 outputCropRect:(id)a7 blacklevel:(float)a8
{
  $F61E096109CF133FD2477F48C7D0CEE7 var1 = a4.var1;
  $32F26D2EBD6DDE2624D50635572D9543 var0 = a4.var0;
  id v14 = a3;
  id v15 = a5;
  bzero(v21, 0x840uLL);
  if (!v14 || !v15) {
    goto LABEL_7;
  }
  int v16 = +[H13FastPostDemosaicProcConfigMetal getChromaSuppressionConfigInputFrameMetadata:v15 tuningControls:a6 chromaSuppressionConfig:v21];
  if (v16)
  {
    int v19 = v16;
    goto LABEL_9;
  }
  long long v31 = 0u;
  memcpy(__dst, a6, sizeof(__dst));
  *(float *)&long long v31 = a8;
  __int16 v24 = var0.var0.var1;
  __int16 v23 = var0.var0.var0;
  uint32x2_t v17 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)var0, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  __int16 v26 = v17.i16[2];
  __int16 v25 = v17.i16[0];
  __int16 v28 = a7.var0.var0.var1;
  __int16 v27 = a7.var0.var0.var0;
  uint32x2_t v18 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)a7.var0, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  __int16 v30 = v18.i16[2];
  __int16 v29 = v18.i16[0];
  if (*(void *)&a7.var1 != *(void *)&var1)
  {
LABEL_7:
    int v19 = FigSignalErrorAt();
    goto LABEL_6;
  }
  int v19 = -[H13FastPostDemosaicProcMetal runWithTextureArray:postDemosaicProcConfig:chromaSupressionConfig:outputSize:](self, "runWithTextureArray:postDemosaicProcConfig:chromaSupressionConfig:outputSize:", v14, __dst, v21);
  if (v19) {
LABEL_9:
  }
    FigDebugAssert3();
LABEL_6:

  return v19;
}

- (BOOL)supportsInPlaceOperation:(id *)a3
{
  return ((a3->var2 + a3->var1 + a3->var3) & 1) == 0;
}

- (int)runWithTextureArray:(id)a3 postDemosaicProcConfig:(id *)a4 chromaSupressionConfig:(ChromaSupressionStruct *)a5 outputSize:
{
  int32x2_t v75 = v5;
  id v8 = a3;
  v9 = [(H13FastPostDemosaicProcMetal *)self metal];
  id v103 = 0;
  id v104 = 0;
  id v102 = 0;
  if (!*(_WORD *)&a4->var0.var1 && !a4->var0.var3)
  {
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    v76 = 0;
    int v16 = 0;
    uint32x2_t v17 = 0;
    int v12 = 0;
    goto LABEL_49;
  }
  BOOL v10 = [(H13FastPostDemosaicProcMetal *)self supportsInPlaceOperation:a4];
  uint64_t v11 = [v8 count];
  if (v10)
  {
    if (!v11 || (unint64_t)[v8 count] >= 3) {
      goto LABEL_6;
    }
  }
  else if (v11 != 2)
  {
LABEL_6:
    int v12 = FigSignalErrorAt();
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    v76 = 0;
    int v16 = 0;
    uint32x2_t v17 = 0;
LABEL_49:
    id v18 = 0;
    goto LABEL_47;
  }
  id v18 = [v8 objectAtIndex:0];
  int v19 = [v9 commandBuffer];
  uint32x2_t v17 = v19;
  if (!v19)
  {
    int v12 = FigSignalErrorAt();
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    v76 = 0;
    goto LABEL_55;
  }
  int v16 = [v19 computeCommandEncoder];
  if (!v16 || !v18 || [v18 pixelFormat] != 115)
  {
    int v12 = FigSignalErrorAt();
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    v76 = 0;
    goto LABEL_47;
  }
  v77 = self;
  BOOL v67 = v10;
  uint64_t v20 = [v18 width];
  uint64_t v21 = [v18 height];
  id v18 = v18;
  v74 = v18;
  v69 = v9;
  v72 = v17;
  if ((unint64_t)[v8 count] > 1)
  {
    id v70 = [v8 objectAtIndexedSubscript:1];
    __int16 v23 = [v8 objectAtIndexedSubscript:1];
    __int16 v24 = v8;
    uint64_t v25 = [v23 pixelFormat];
    __int16 v26 = [v8 objectAtIndexedSubscript:0];
    uint64_t v27 = [v26 pixelFormat];

    if (v25 != v27) {
      goto LABEL_52;
    }
    __int16 v28 = [v24 objectAtIndexedSubscript:1];
    uint64_t v29 = [v28 width];
    __int16 v30 = [v24 objectAtIndexedSubscript:0];
    uint64_t v31 = [v30 width];

    if (v29 == v31)
    {
      v32 = [v24 objectAtIndexedSubscript:1];
      uint64_t v33 = [v32 height];
      v34 = v24;
      v35 = [v24 objectAtIndexedSubscript:0];
      uint64_t v36 = [v35 height];

      if (v33 == v36)
      {
        id v8 = v24;
        v9 = v69;
        id v18 = v74;
        uint32x2_t v17 = v72;
        goto LABEL_19;
      }
      int v12 = FigSignalErrorAt();
      id v14 = 0;
      v76 = 0;
      id v18 = v74;
      id v15 = v74;
      id v8 = v34;
      v9 = v69;
    }
    else
    {
LABEL_52:
      int v12 = FigSignalErrorAt();
      id v14 = 0;
      v76 = 0;
      id v18 = v74;
      id v8 = v24;
      id v15 = v74;
    }
    uint32x2_t v17 = v72;
    goto LABEL_71;
  }
  v22 = [(H13FastPostDemosaicProcMetal *)v77 createIntermediateMetalTexture:@"h13.postDemProc.newTex" pixelFormat:115 width:v20 height:v21];
  id v102 = v22;
  if (!v22)
  {
    int v12 = FigSignalErrorAt();
    id v13 = 0;
    id v14 = 0;
    v76 = 0;
    goto LABEL_68;
  }
  id v70 = v22;
LABEL_19:
  id v14 = [(H13FastPostDemosaicProcMetal *)v77 createIntermediateMetalTexture:@"h13f.postDemProc.tempDotDetectedTex" pixelFormat:14 width:v20 height:v21];
  id v104 = v14;
  if (!v14)
  {
    int v12 = FigSignalErrorAt();
    v76 = 0;
    id v15 = v18;
LABEL_71:
    id v13 = v70;
    goto LABEL_47;
  }
  id v68 = v8;
  if (a4->var0.var1)
  {
    id v37 = v70;
    v38 = [(H13FastPostDemosaicProcShaders *)v77->_shaders postDemosaicProcStage_dotFix];
    v39 = [v38 getPipelineStateWithParams:&unk_270E98FF8];

    if (v39)
    {
      v40 = v39;
      if ((unint64_t)[v39 maxTotalThreadsPerThreadgroup] > 0x3FF)
      {
        [v16 setComputePipelineState:v39];
        [v16 setTexture:v18 atIndex:0];
        [v16 setTexture:v37 atIndex:2];
        [v16 setTexture:v14 atIndex:3];
        [v16 setBytes:a4 length:1232 atIndex:0];
        [v16 setImageblockWidth:16 height:16];
        uint32x2_t v41 = vshr_n_u32((uint32x2_t)vadd_s32(v75, (int32x2_t)0xF0000000FLL), 4uLL);
        *(void *)&long long v42 = v41.u32[0];
        *((void *)&v42 + 1) = v41.u32[1];
        long long v100 = v42;
        uint64_t v101 = 1;
        int64x2_t v98 = vdupq_n_s64(0x12uLL);
        uint64_t v99 = 1;
        [v16 dispatchThreadgroups:&v100 threadsPerThreadgroup:&v98];

        id v43 = v37;
        double v44 = *(double *)&v75;
        id v14 = v43;
        id v13 = v18;
        id v15 = v43;
        goto LABEL_25;
      }
      v76 = v39;
      FigDebugAssert3();
      int v12 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v12 = FigSignalErrorAt();
      v76 = 0;
    }
    id v13 = v37;
    id v14 = v37;
LABEL_68:
    id v15 = v18;
    goto LABEL_47;
  }
  id v14 = 0;
  v40 = 0;
  id v15 = v18;
  id v13 = v70;
  double v44 = *(double *)&v75;
LABEL_25:
  *(void *)&long long v45 = LODWORD(v44);
  *((void *)&v45 + 1) = HIDWORD(v44);
  long long v71 = v45;
  if (a4->var0.var2)
  {
    id v13 = v13;

    v46 = [(H13FastPostDemosaicProcShaders *)v77->_shaders postDemosaicProcStage_directionalLowpass_RGB];

    if ((unint64_t)[v46 maxTotalThreadsPerThreadgroup] < 0x100)
    {
      FigDebugAssert3();
      int v12 = FigSignalErrorAt();
      id v14 = v13;
      v76 = v46;
LABEL_66:
      id v18 = v74;
      uint32x2_t v17 = v72;
      goto LABEL_47;
    }
    [v16 setComputePipelineState:v46];
    [v16 setImageblockWidth:16 height:16];
    [v16 setTexture:v15 atIndex:0];
    [v16 setTexture:v104 atIndex:1];
    [v16 setTexture:v13 atIndex:2];
    [v16 setBytes:a4 length:1232 atIndex:0];
    [v16 setBytes:a5 length:2112 atIndex:1];
    long long v96 = v71;
    uint64_t v97 = 1;
    int64x2_t v94 = vdupq_n_s64(0x10uLL);
    uint64_t v95 = 1;
    [v16 dispatchThreads:&v96 threadsPerThreadgroup:&v94];

    id v14 = v13;
    id v13 = v15;
    id v15 = v14;
    double v47 = *(double *)&v75;
  }
  else
  {
    double v47 = v44;
    v46 = v40;
  }
  if (!a4->var0.var3)
  {
    v76 = v46;
    goto LABEL_39;
  }
  unsigned int v48 = HIDWORD(v47);
  unsigned int v49 = LODWORD(v47);
  id v66 = v13;

  uint64_t v50 = v48 >> 1;
  v51 = [(H13FastPostDemosaicProcMetal *)v77 createIntermediateMetalTexture:@"h13f.postDemProc.filteredQCCTex" pixelFormat:65 width:v49 >> 1 height:v50];
  id v52 = v103;
  id v103 = v51;

  if (!v51)
  {
    int v12 = FigSignalErrorAt();
    id v14 = v66;
    id v13 = v66;
    v76 = v46;
LABEL_65:
    id v8 = v68;
    v9 = v69;
    goto LABEL_66;
  }
  v53 = [(H13FastPostDemosaicProcShaders *)v77->_shaders postDemosaicProcStage_RGB_to_YCC];

  v76 = v53;
  [v16 setComputePipelineState:v53];
  if ([v15 iosurface])
  {
    FigDebugAssert3();
    int v12 = -12782;
    id v14 = v66;
LABEL_64:
    id v13 = v14;
    goto LABEL_65;
  }
  [v16 setImageblockWidth:16 height:16];
  [v16 setTexture:v15 atIndex:0];
  [v16 setBytes:a5 length:2112 atIndex:0];
  v54 = (char *)&a4[1].var0.var9[11];
  [v16 setBytes:&a4[1].var0.var9[11] length:1 atIndex:1];
  v93[0] = [v15 width];
  v93[1] = [v15 height];
  v93[2] = 1;
  int64x2_t v91 = vdupq_n_s64(0x10uLL);
  uint64_t v92 = 1;
  [v16 dispatchThreads:v93 threadsPerThreadgroup:&v91];
  shaders = v77->_shaders;
  if (BYTE1(a4->var0.var24[2])) {
    [(H13FastPostDemosaicProcShaders *)shaders postDemosaicProcStage_chromaSuppression_filterQCC_Sparse];
  }
  else {
  v56 = [(H13FastPostDemosaicProcShaders *)shaders postDemosaicProcStage_chromaSuppression_filterQCC];
  }

  if ((unint64_t)[v56 maxTotalThreadsPerThreadgroup] <= 0xFF)
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
    id v14 = v66;
    id v13 = v66;
    v76 = v56;
    goto LABEL_65;
  }
  [v16 setComputePipelineState:v56];
  [v16 setImageblockWidth:16 height:16];
  [v16 setTexture:v15 atIndex:0];
  [v16 setTexture:v103 atIndex:1];
  id v14 = v66;
  [v16 setTexture:v66 atIndex:2];
  [v16 setBytes:a5 length:2112 atIndex:0];
  v90[0] = v49 >> 1;
  v90[1] = v50;
  v90[2] = 1;
  int64x2_t v88 = vdupq_n_s64(0x10uLL);
  uint64_t v89 = 1;
  [v16 dispatchThreads:v90 threadsPerThreadgroup:&v88];
  v57 = [(H13FastPostDemosaicProcShaders *)v77->_shaders postDemosaicProcStage_chromaSuppression_RGB];

  v76 = v57;
  if ((unint64_t)[v57 maxTotalThreadsPerThreadgroup] <= 0xFF)
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
    goto LABEL_64;
  }
  [v16 setComputePipelineState:v57];
  [v16 setBytes:v54 length:1 atIndex:1];
  long long v86 = v71;
  uint64_t v87 = 1;
  int64x2_t v84 = vdupq_n_s64(0x10uLL);
  uint64_t v85 = 1;
  [v16 dispatchThreads:&v86 threadsPerThreadgroup:&v84];
  id v13 = v15;

  id v8 = v68;
  v9 = v69;
LABEL_39:
  uint32x2_t v17 = v72;
  objc_msgSend(v16, "endEncoding", v47);

  id v18 = v74;
  if (!v67)
  {
    if (!v102)
    {
      id v58 = [v8 objectAtIndexedSubscript:1];

      if (v14 == v58)
      {
        if (v14 == v13)
        {
          int v12 = FigSignalErrorAt();
          int v16 = 0;
          id v14 = v13;
          goto LABEL_47;
        }
        [v8 setObject:v14 atIndexedSubscript:0];
        [v8 setObject:v13 atIndexedSubscript:1];
        goto LABEL_44;
      }
    }
    int v12 = FigSignalErrorAt();
LABEL_55:
    int v16 = 0;
    goto LABEL_47;
  }
LABEL_44:
  id v59 = v15;
  int v60 = [v74 width];
  int v61 = [v74 height];
  if (*MEMORY[0x263F00E10])
  {
    int v62 = v61;
    v63 = [v72 commandQueue];
    v64 = [v63 commandBuffer];

    [v64 setLabel:@"KTRACE_MTLCMDBUF"];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __109__H13FastPostDemosaicProcMetal_runWithTextureArray_postDemosaicProcConfig_chromaSupressionConfig_outputSize___block_invoke;
    v81[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v82 = v60;
    int v83 = v62;
    [v64 addCompletedHandler:v81];
    [v64 commit];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __109__H13FastPostDemosaicProcMetal_runWithTextureArray_postDemosaicProcConfig_chromaSupressionConfig_outputSize___block_invoke_2;
    v78[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v79 = v60;
    int v80 = v62;
    [v72 addCompletedHandler:v78];

    id v18 = v74;
  }
  [v9 commit];
  int v16 = 0;
  int v12 = 0;
  id v15 = v59;
LABEL_47:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  [v16 endEncoding];

  return v12;
}

uint64_t __109__H13FastPostDemosaicProcMetal_runWithTextureArray_postDemosaicProcConfig_chromaSupressionConfig_outputSize___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __109__H13FastPostDemosaicProcMetal_runWithTextureArray_postDemosaicProcConfig_chromaSupressionConfig_outputSize___block_invoke_2(uint64_t a1, void *a2)
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

- (int)runWithInputLumaTex:(id)a3 inputChromaTex:(id)a4 postDemosaicProcConfig:(id *)a5 chromaSuppressionConfig:(ChromaSupressionStruct *)a6 outputSize:(id)a7 outputLumaTex:(id)a8 outputChromaTex:(id)a9 commandBuffer:(id)a10 outputFrame:(BOOL)a11 isQuadra:
{
  int32x2_t v14 = v11;
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v84 = a7;
  id v19 = a8;
  id v20 = a9;
  id v78 = a10;
  id v105 = 0;
  id v106 = 0;
  id v104 = 0;
  v81 = v20;
  [v20 setLabel:@"PostDemosaicProc"];
  int v82 = v17;
  int v79 = v19;
  int v80 = v18;
  if (!v17) {
    goto LABEL_71;
  }
  if (!v18
    || !v84
    || !v19
    || [v17 pixelFormat] != 25
    || [v18 pixelFormat] != 65
    || [v84 pixelFormat] != 25
    || [v19 pixelFormat] != 65)
  {
    goto LABEL_69;
  }
  if (a5->var0.var1 || a5->var0.var2)
  {
    uint64_t v21 = -[H13FastPostDemosaicProcMetal createIntermediateMetalTexture:pixelFormat:width:height:](self, "createIntermediateMetalTexture:pixelFormat:width:height:", @"h13f.postDemProc.tempLumaTex", 25, [v17 width], objc_msgSend(v17, "height"));
    id v106 = v21;
    if (!v21)
    {
      int v74 = FigSignalErrorAt();
      id v77 = 0;
      id v25 = 0;
      id v27 = 0;
      id v24 = 0;
      goto LABEL_70;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (a5->var0.var3)
  {
    -[H13FastPostDemosaicProcMetal createIntermediateMetalTexture:pixelFormat:width:height:](self, "createIntermediateMetalTexture:pixelFormat:width:height:", @"h13f.postDemProc.tempChromaYCC", 65, [v18 width], objc_msgSend(v18, "height"));
    id v104 = (id)objc_claimAutoreleasedReturnValue();
    if (!v104)
    {
LABEL_69:
      int v74 = FigSignalErrorAt();
      id v77 = 0;
      id v25 = 0;
      id v27 = 0;
      id v24 = 0;
      uint64_t v21 = 0;
LABEL_70:
      id v17 = 0;
      goto LABEL_67;
    }
  }
  id v17 = [v81 computeCommandEncoder];
  if (!v17) {
    goto LABEL_71;
  }
  if (!a5->var0.var1 && !a5->var0.var2) {
    goto LABEL_28;
  }
  v22 = -[H13FastPostDemosaicProcMetal createIntermediateMetalTexture:pixelFormat:width:height:](self, "createIntermediateMetalTexture:pixelFormat:width:height:", @"h13f.postDemProc.dotDetectedTex", 14, [v82 width], objc_msgSend(v82, "height"));
  id v105 = v22;
  if (!v22)
  {
LABEL_71:
    int v74 = FigSignalErrorAt();
    id v77 = 0;
    id v25 = 0;
    id v27 = 0;
    id v24 = 0;
    uint64_t v21 = 0;
    goto LABEL_67;
  }
  if (a5->var0.var1)
  {
    BOOL var2 = a5->var0.var2;
    id v24 = v82;
    id v25 = v80;
    __int16 v26 = v84;
    if (!var2) {
      __int16 v26 = v21;
    }
    id v27 = v26;
    __int16 v28 = [(H13FastPostDemosaicProcShaders *)self->_shaders postDemosaicProcStage_dotFix];
    uint64_t v21 = [v28 getPipelineStateWithParams:&unk_270E99020];

    if (!v21 || (unint64_t)[v21 maxTotalThreadsPerThreadgroup] <= 0x143)
    {
      FigDebugAssert3();
      int v74 = FigSignalErrorAt();
      id v77 = 0;
      goto LABEL_67;
    }
    [v17 setComputePipelineState:v21];
    uint64_t v118 = 0;
    LOBYTE(v119) = 0;
    v120.i64[0] = 1232;
    v120.i64[1] = (uint64_t)a5;
    id v121 = 0;
    long long v122 = xmmword_263481600;
    LOBYTE(v123) = 0;
    long long v124 = 0xFFFFFFFFFFFFFFFFLL;
    uint64_t v125 = 0;
    uint64_t v126 = -1;
    uint64_t v107 = 0;
    id v24 = v24;
    id v108 = v24;
    int64x2_t v109 = vdupq_n_s64(1uLL);
    id v25 = v25;
    id v110 = v25;
    long long v111 = xmmword_2634804A0;
    id v27 = v27;
    id v112 = v27;
    int64x2_t v113 = vdupq_n_s64(3uLL);
    long long v115 = xmmword_263480490;
    id v114 = v22;
    uint64_t v116 = 0;
    uint64_t v117 = -1;
    +[SoftISPArgsTools setAllArgumentsOnEncoder:v17 textures:&v107 argIdentifiers:&v118];
    [v17 setImageblockWidth:16 height:16];
    uint32x2_t v29 = vshr_n_u32((uint32x2_t)vadd_s32(v14, (int32x2_t)0xF0000000FLL), 4uLL);
    *(void *)&long long v30 = v29.u32[0];
    *((void *)&v30 + 1) = v29.u32[1];
    long long v102 = v30;
    uint64_t v103 = 1;
    int64x2_t v100 = vdupq_n_s64(0x12uLL);
    uint64_t v101 = 1;
    [v17 dispatchThreadgroups:&v102 threadsPerThreadgroup:&v100];
    for (uint64_t i = 104; i != -16; i -= 24)

    for (uint64_t j = 80; j != -16; j -= 48)
      objc_destroyWeak((id *)((char *)&v118 + j));
    goto LABEL_29;
  }
LABEL_28:
  id v25 = 0;
  id v27 = 0;
  id v24 = 0;
  uint64_t v21 = 0;
LABEL_29:
  if (a5->var0.var2)
  {
    uint64_t v33 = v82;
    if (a5->var0.var1) {
      uint64_t v33 = v84;
    }
    id v34 = v33;

    id v35 = v106;
    uint64_t v36 = [(H13FastPostDemosaicProcShaders *)self->_shaders postDemosaicProcStage_directionalLowpass_YCbCr];

    [v17 setComputePipelineState:v36];
    uint64_t v107 = 0;
    LOBYTE(v108) = 0;
    v109.i64[0] = 1232;
    v109.i64[1] = (uint64_t)a5;
    id v110 = 0;
    long long v111 = xmmword_263481600;
    LOBYTE(v112) = 0;
    int64x2_t v113 = (int64x2_t)0xFFFFFFFFFFFFFFFFLL;
    id v114 = 0;
    *(void *)&long long v115 = -1;
    uint64_t v118 = 0;
    id v24 = v34;
    id v119 = v24;
    int64x2_t v120 = vdupq_n_s64(1uLL);
    id v121 = v105;
    long long v122 = xmmword_2634804A0;
    id v27 = v35;
    id v123 = v27;
    long long v124 = xmmword_263480490;
    uint64_t v125 = 0;
    uint64_t v126 = -1;
    +[SoftISPArgsTools setAllArgumentsOnEncoder:v17 textures:&v118 argIdentifiers:&v107];
    *(void *)&long long v37 = v14.u32[0];
    *((void *)&v37 + 1) = v14.u32[1];
    long long v98 = v37;
    uint64_t v99 = 1;
    v97[0] = [v36 threadExecutionWidth];
    v97[1] = (unint64_t)[v36 maxTotalThreadsPerThreadgroup] / v97[0];
    v97[2] = 1;
    [v17 dispatchThreads:&v98 threadsPerThreadgroup:v97];
    for (uint64_t k = 80; k != -16; k -= 24)

    for (uint64_t m = 80; m != -16; m -= 48)
      objc_destroyWeak((id *)((char *)&v107 + m));
  }
  else
  {
    uint64_t v36 = v21;
  }
  if (a5->var0.var3)
  {
    if (a5->var0.var1 || (id v40 = v82, a5->var0.var2)) {
      id v40 = v106;
    }
    id v41 = v40;

    id v42 = v80;
    id v43 = v79;
    if (!a5->var0.var4) {
      id v43 = v104;
    }
    id v44 = v43;
    uint64_t v107 = 0;
    LOBYTE(v108) = 0;
    v109.i64[0] = 2112;
    v109.i64[1] = (uint64_t)a6;
    id v110 = 0;
    long long v111 = xmmword_263481600;
    LOBYTE(v112) = 0;
    int64x2_t v113 = (int64x2_t)0xFFFFFFFFFFFFFFFFLL;
    id v114 = 0;
    *(void *)&long long v115 = -1;
    uint64_t v118 = 0;
    id v24 = v41;
    id v119 = v24;
    int64x2_t v120 = vdupq_n_s64(1uLL);
    id v45 = v42;
    id v121 = v45;
    long long v122 = xmmword_2634804B0;
    id v77 = v44;
    id v123 = v77;
    long long v124 = xmmword_263480490;
    uint64_t v125 = 0;
    uint64_t v126 = -1;
    shaders = self->_shaders;
    if (BYTE1(a5->var0.var24[2])) {
      [(H13FastPostDemosaicProcShaders *)shaders postDemosaicProcStage_chromaSuppression_CCUV_Sparse];
    }
    else {
    double v47 = [(H13FastPostDemosaicProcShaders *)shaders postDemosaicProcStage_chromaSuppression_CCUV];
    }
    id v25 = v45;

    [v17 setComputePipelineState:v47];
    +[SoftISPArgsTools setAllArgumentsOnEncoder:v17 textures:&v118 argIdentifiers:&v107];
    unint64_t v48 = [v47 threadExecutionWidth];
    unint64_t v49 = [v47 maxTotalThreadsPerThreadgroup];
    uint32x2_t v50 = vshr_n_u32((uint32x2_t)v14, 1uLL);
    *(void *)&long long v51 = v50.u32[0];
    *((void *)&v51 + 1) = v50.u32[1];
    long long v95 = v51;
    uint64_t v96 = 1;
    v94[0] = v48;
    v94[1] = v49 / v48;
    v94[2] = 1;
    [v17 dispatchThreads:&v95 threadsPerThreadgroup:v94];
    for (uint64_t n = 80; n != -16; n -= 24)

    for (iuint64_t i = 80; ii != -16; ii -= 48)
      objc_destroyWeak((id *)((char *)&v107 + ii));
    uint64_t v36 = v47;
  }
  else
  {
    id v77 = 0;
  }
  if (a5->var0.var4)
  {
    uint64_t v21 = v36;
  }
  else
  {
    if (a5->var0.var1 || (id v54 = v82, a5->var0.var2)) {
      id v54 = v106;
    }
    id v55 = v54;

    id v56 = v80;
    if (a5->var0.var3) {
      id v56 = v104;
    }
    id v57 = v56;

    id v58 = v84;
    id v59 = v79;

    uint64_t v107 = 0;
    id v24 = v55;
    id v108 = v24;
    int64x2_t v109 = vdupq_n_s64(1uLL);
    id v60 = v57;
    id v110 = v60;
    long long v111 = xmmword_2634804A0;
    id v61 = v58;
    id v25 = v60;
    id v27 = v61;
    id v112 = v61;
    int64x2_t v113 = vdupq_n_s64(3uLL);
    id v62 = v59;
    long long v115 = xmmword_263480490;
    id v77 = v62;
    id v114 = v62;
    uint64_t v116 = 0;
    uint64_t v117 = -1;
    uint64_t v118 = 0;
    LOBYTE(v119) = 0;
    v120.i64[0] = 2112;
    v120.i64[1] = (uint64_t)a6;
    id v121 = 0;
    long long v122 = xmmword_263481600;
    LOBYTE(v123) = 0;
    long long v124 = 0xFFFFFFFFFFFFFFFFLL;
    uint64_t v125 = 0;
    uint64_t v126 = -1;
    uint64_t v21 = [(H13FastPostDemosaicProcShaders *)self->_shaders postDemosaicProcStage_YCC4202YUV420];

    [v17 setComputePipelineState:v21];
    [v17 setBytes:&a5[1].var0.var9[11] length:1 atIndex:1];
    +[SoftISPArgsTools setAllArgumentsOnEncoder:v17 textures:&v107 argIdentifiers:&v118];
    unint64_t v63 = [v21 threadExecutionWidth];
    unint64_t v64 = [v21 maxTotalThreadsPerThreadgroup];
    uint32x2_t v65 = vshr_n_u32((uint32x2_t)v14, 1uLL);
    *(void *)&long long v66 = v65.u32[0];
    *((void *)&v66 + 1) = v65.u32[1];
    long long v92 = v66;
    uint64_t v93 = 1;
    v91[0] = v63;
    v91[1] = v64 / v63;
    v91[2] = 1;
    [v17 dispatchThreads:&v92 threadsPerThreadgroup:v91];
    for (juint64_t j = 80; jj != -16; jj -= 48)
      objc_destroyWeak((id *)((char *)&v118 + jj));
    for (kuint64_t k = 104; kk != -16; kk -= 24)
  }
  [v17 endEncoding];

  int v69 = [v84 width];
  int v70 = [v84 height];
  if (*MEMORY[0x263F00E10])
  {
    int v71 = v70;
    v72 = [v81 commandQueue];
    v73 = [v72 commandBuffer];

    [v73 setLabel:@"KTRACE_MTLCMDBUF"];
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __190__H13FastPostDemosaicProcMetal_runWithInputLumaTex_inputChromaTex_postDemosaicProcConfig_chromaSuppressionConfig_outputSize_outputLumaTex_outputChromaTex_commandBuffer_outputFrame_isQuadra___block_invoke;
    v88[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v89 = v69;
    int v90 = v71;
    [v73 addCompletedHandler:v88];
    [v73 commit];
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = __190__H13FastPostDemosaicProcMetal_runWithInputLumaTex_inputChromaTex_postDemosaicProcConfig_chromaSuppressionConfig_outputSize_outputLumaTex_outputChromaTex_commandBuffer_outputFrame_isQuadra___block_invoke_2;
    v85[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v86 = v69;
    int v87 = v71;
    [v81 addCompletedHandler:v85];
  }
  [v78 addCompletionHandlerToCommandBuffer:v81];
  [(FigMetalContext *)self->_metal commit];
  id v17 = 0;
  int v74 = 0;
LABEL_67:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  [v17 endEncoding];

  return v74;
}

uint64_t __190__H13FastPostDemosaicProcMetal_runWithInputLumaTex_inputChromaTex_postDemosaicProcConfig_chromaSuppressionConfig_outputSize_outputLumaTex_outputChromaTex_commandBuffer_outputFrame_isQuadra___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __190__H13FastPostDemosaicProcMetal_runWithInputLumaTex_inputChromaTex_postDemosaicProcConfig_chromaSuppressionConfig_outputSize_outputLumaTex_outputChromaTex_commandBuffer_outputFrame_isQuadra___block_invoke_2(uint64_t a1, void *a2)
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

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  BOOL v10 = [(FigMetalContext *)self->_metal allocator];
  int32x2_t v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_11;
  }
  int v12 = [v11 desc];
  [v12 setTextureType:2];

  if (a4 == 14)
  {
    uint64_t v13 = 0;
  }
  else
  {
    int v12 = [v11 desc];
    uint64_t v13 = [v12 compressionFootprint];
  }
  int32x2_t v14 = [v11 desc];
  [v14 setCompressionFootprint:v13];

  if (a4 != 14) {
  id v15 = [v11 desc];
  }
  [v15 setWidth:a5];

  int v16 = [v11 desc];
  [v16 setHeight:a6];

  id v17 = [v11 desc];
  [v17 setUsage:7];

  id v18 = [v11 desc];
  [v18 setPixelFormat:a4];

  [v11 setLabel:0];
  id v19 = [(FigMetalContext *)self->_metal allocator];
  id v20 = (void *)[v19 newTextureWithDescriptor:v11];

  if (!v20)
  {
LABEL_11:
    FigSignalErrorAt();
    id v20 = 0;
  }

  return v20;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setMetal:(id)a3
{
}

- (H13FastPostDemosaicProcShaders)shaders
{
  return self->_shaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_h13FastConfig, 0);
  objc_storeStrong((id *)&self->_staticParameters, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end