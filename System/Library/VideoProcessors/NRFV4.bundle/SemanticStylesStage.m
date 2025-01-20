@interface SemanticStylesStage
+ (int)prewarmShaders:(id)a3;
- (SemanticStylesStage)initWithMetalContext:(id)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5;
- (id)newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 disableCompression:(BOOL)a7 label:(id)a8;
- (id)newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7;
- (int)calculateHistogramStatsWithLumaTex:(id)a3 chromaTex:(id)a4;
- (int)createGuideImage:(id)a3;
- (int)processPersonMaskTex:(id)a3 skinMaskTex:(id)a4 skyMaskTex:(id)a5;
- (int)renderWithLumaTex:(id)a3 chromaTex:(id)a4 outLumaTex:(id)a5 outChromaTex:(id)a6 gainMapTex:(id)a7 outputGainMapTex:(id)a8;
- (int)runWithStyle:(SemanticStylesStage *)self tuningParams:(SEL)a2 refFrameLuxLevel:(id)a3 sceneType:(id)a4 lumaTex:(float)a5 chromaTex:(id)a6 outLumaTex:(id)a7 outChromaTex:(id)a8 gainMapTex:(id)a9 outputGainMapTex:(id)a10 maskScale:(id)a11 maskTranslation:(id)a12 personMaskTex:(id)a13 skinMaskTex:(id)a14 skyMaskTex:(id)a15 isLowLight:(BOOL)a16;
- (int)runWithStyle:(id)a3 tuningParams:(id)a4 refFrameLuxLevel:(float)a5 sceneType:(id)a6 lumaTex:(id)a7 chromaTex:(id)a8 gainMapTex:(id)a9 outputGainMapTex:(id)a10 personMaskTex:(id)a11 skinMaskTex:(id)a12 skyMaskTex:(id)a13 isLowLight:(BOOL)a14;
- (int)upsampleLightMap;
- (void)calculateAdjustmentParametersWithParamsBuffer:(id)a3 statsBuffer:(id)a4;
- (void)releaseResources;
- (void)remapSliderValueForRendering;
@end

@implementation SemanticStylesStage

- (SemanticStylesStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)SemanticStylesStage;
  v6 = [(SemanticStylesStage *)&v15 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v7 = +[SemanticStylesShared sharedInstance];
  v8 = [v7 getShaders:self->_metalContext];
  shaders = self->_shaders;
  self->_shaders = v8;

  if (!self->_shaders) {
    goto LABEL_9;
  }
  v10 = [[GuidedFilter alloc] initWithMetalContext:v5];
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = v10;

  if (!self->_guidedFilter
    || (v12 = (MTLSharedEventListener *)objc_alloc_init(MEMORY[0x263F12A00]),
        sharedEventListener = self->_sharedEventListener,
        self->_sharedEventListener = v12,
        sharedEventListener,
        !self->_sharedEventListener))
  {
LABEL_9:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_6:

  return self;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [[SemanticStylesShaders alloc] initWithMetalContext:v3];
    if (v4)
    {
      id v5 = v4;
      +[GuidedFilter prewarmShaders:v3];

      int v6 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v6 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v6 = FigSignalErrorAt();
  }

  return v6;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  v7 = [(FigMetalContext *)self->_metalContext device];
  v8 = (void *)[v7 newBufferWithLength:a3 options:a4];

  [v8 setLabel:0];
  return v8;
}

- (id)newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7
{
  return [(SemanticStylesStage *)self newTexture2DWithFormat:a3 width:a4 height:a5 usage:a6 disableCompression:0 label:a7];
}

- (id)newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 disableCompression:(BOOL)a7 label:(id)a8
{
  BOOL v8 = a7;
  v14 = [(FigMetalContext *)self->_metalContext allocator];
  objc_super v15 = (void *)[v14 newTextureDescriptor];

  if (!v15) {
    goto LABEL_6;
  }
  [v15 setLabel:0];
  v16 = [v15 desc];
  [v16 setTextureType:2];

  v17 = [v15 desc];
  [v17 setPixelFormat:a3];

  v18 = [v15 desc];
  [v18 setWidth:a4];

  v19 = [v15 desc];
  [v19 setHeight:a5];

  v20 = [v15 desc];
  [v20 setDepth:1];

  v21 = [v15 desc];
  [v21 setUsage:a6];

  if (v8)
  {
    v22 = [v15 desc];
    [v22 setCompressionMode:2];

    v23 = [v15 desc];
    [v23 setCompressionFootprint:0];
  }
  v24 = [(FigMetalContext *)self->_metalContext allocator];
  v25 = (void *)[v24 newTextureWithDescriptor:v15];

  if (!v25)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v25 = 0;
  }

  return v25;
}

- (void)releaseResources
{
  paramsBuf = self->_paramsBuf;
  self->_paramsBuf = 0;

  statsBuf = self->_statsBuf;
  self->_statsBuf = 0;

  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  FigMetalDecRef();
}

- (int)calculateHistogramStatsWithLumaTex:(id)a3 chromaTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  shaders = self->_shaders;
  if (!shaders
    || !shaders->_ssCalculateLocalHistogramStats
    || !shaders->_ssCalculateGlobalHistogram
    || !shaders->_ssCalculateGlobalStats
    || ([(FigMetalContext *)self->_metalContext commandQueue],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 commandBuffer],
        v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v11 = [v10 computeCommandEncoder];
  if (!v11)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
LABEL_21:

    goto LABEL_17;
  }
  v12 = (void *)v11;
  v13 = [(SemanticStylesStage *)self newBufferWithLength:1057824 options:0 label:@"ss_buf_stats"];
  statsBuf = self->_statsBuf;
  self->_statsBuf = v13;

  if (!self->_statsBuf
    || (objc_super v15 = [(SemanticStylesStage *)self newTexture2DWithFormat:25 width:32 height:32 usage:7 disableCompression:1 label:@"ss_tex_lightMap_small"], lightMapSmallTex = self->_lightMapSmallTex, self->_lightMapSmallTex = v15, lightMapSmallTex, !self->_lightMapSmallTex))
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();

    goto LABEL_21;
  }
  v17 = self->_shaders->_ssCalculateLocalHistogramStats;
  [v12 setComputePipelineState:v17];
  [v12 setTexture:v6 atIndex:0];
  [v12 setTexture:v7 atIndex:1];
  [v12 setTexture:self->_lightMapSmallTex atIndex:8];
  [v12 setBuffer:self->_paramsBuf offset:0 atIndex:0];
  [v12 setBuffer:self->_statsBuf offset:0 atIndex:1];
  unint64_t v18 = [(MTLComputePipelineState *)v17 maxTotalThreadsPerThreadgroup];
  unint64_t v19 = [(MTLComputePipelineState *)v17 threadExecutionWidth];

  uint64_t v20 = 16;
  if (v19 >= 0x10) {
    unint64_t v21 = 16;
  }
  else {
    unint64_t v21 = v19;
  }
  int64x2_t v30 = vdupq_n_s64(0x20uLL);
  int64x2_t v37 = v30;
  uint64_t v38 = 1;
  if (v18 / v21 < 0x10) {
    uint64_t v20 = v18 / v21;
  }
  *(void *)&long long v32 = v21;
  *((void *)&v32 + 1) = v20;
  uint64_t v33 = 1;
  [v12 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v32];
  v22 = self->_shaders->_ssCalculateGlobalHistogram;
  [v12 setComputePipelineState:v22];
  [v12 setBuffer:self->_paramsBuf offset:0 atIndex:0];
  [v12 setBuffer:self->_statsBuf offset:0 atIndex:1];

  int64x2_t v37 = (int64x2_t)xmmword_263480AB0;
  uint64_t v38 = 1;
  long long v32 = (__int128)v30;
  uint64_t v33 = 1;
  [v12 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v32];
  v23 = self->_shaders->_ssCalculateGlobalStats;
  [v12 setComputePipelineState:v23];
  [v12 setBuffer:self->_paramsBuf offset:0 atIndex:0];
  [v12 setBuffer:self->_statsBuf offset:0 atIndex:1];

  int64x2_t v37 = vdupq_n_s64(1uLL);
  uint64_t v38 = 1;
  long long v32 = xmmword_263480AB0;
  uint64_t v33 = 1;
  [v12 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v32];
  [v12 endEncoding];
  v37.i64[0] = 0;
  v37.i64[1] = (uint64_t)&v37;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = self->_paramsBuf;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = &v32;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = self->_statsBuf;
  sharedEvent = self->_sharedEvent;
  sharedEventListener = self->_sharedEventListener;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __68__SemanticStylesStage_calculateHistogramStatsWithLumaTex_chromaTex___block_invoke;
  v31[3] = &unk_2655C81F0;
  v31[4] = self;
  v31[5] = &v37;
  v31[6] = &v32;
  [(MTLSharedEvent *)sharedEvent notifyListener:sharedEventListener atValue:1 block:v31];
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v37, 8);
  [v10 encodeSignalEvent:self->_sharedEvent value:1];
  if (*MEMORY[0x263F00E10])
  {
    v26 = [v10 commandQueue];
    v27 = [v26 commandBuffer];

    [v27 setLabel:@"KTRACE_MTLCMDBUF"];
    [v27 addCompletedHandler:&__block_literal_global_15];
    [v27 commit];
    [v10 addCompletedHandler:&__block_literal_global_81];
  }
  [v10 commit];

  int v28 = 0;
LABEL_17:

  return v28;
}

void __68__SemanticStylesStage_calculateHistogramStatsWithLumaTex_chromaTex___block_invoke(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v5 = a2;
  [v2 calculateAdjustmentParametersWithParamsBuffer:v3 statsBuffer:v4];
  [v5 setSignaledValue:2];
}

uint64_t __68__SemanticStylesStage_calculateHistogramStatsWithLumaTex_chromaTex___block_invoke_2()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __68__SemanticStylesStage_calculateHistogramStatsWithLumaTex_chromaTex___block_invoke_3(uint64_t a1, void *a2)
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

- (void)calculateAdjustmentParametersWithParamsBuffer:(id)a3 statsBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 contents];
  id v9 = v7;
  v10 = (float *)([v9 contents] + 1057792);

  int v11 = *(unsigned __int8 *)(v8 + 20);
  uint64_t v12 = *(unsigned int *)(v8 + 32);
  if (*(unsigned char *)(v8 + 20) && v12 != 3)
  {
    uint64_t v12 = 0;
    *(_DWORD *)(v8 + 32) = 0;
  }
  float v13 = *(float *)(v8 + 16);
  float v14 = *(float *)(v8 + 24);
  float v15 = v10[3];
  float v16 = v10[4];
  float v17 = v10[5];
  float v18 = 0.8;
  if (v16 < 0.18 && v17 < 0.85)
  {
    float v19 = 0.18 - v16;
    float v18 = powf(v19, 0.75) + 1.0;
  }
  float v20 = v17 - v15;
  float v21 = 1.0;
  float v22 = 1.5;
  if ((float)(v17 - v15) <= 0.5) {
    float v22 = 1.0;
  }
  float v23 = 1.25;
  if (*v10 >= 0.5)
  {
    float v23 = 0.75;
    if (v20 >= 0.4)
    {
      float v21 = 1.0;
      if ((float)(v16 - v15) <= 0.2)
      {
        float v23 = 1.0;
      }
      else
      {
        float v21 = 1.6;
        float v18 = v18 * 1.1;
      }
    }
    else
    {
      float v21 = 1.5;
    }
  }
  float v24 = v13 / 3.14159265;
  double v25 = v24;
  if (v11 && v24 < 25.0)
  {
    float v26 = v25 * 0.013 + 0.675;
    float v27 = v25 * -0.01 + 1.25;
    float v22 = v22 * v23;
    float v23 = v23 * v27;
    float v18 = v18 * v26;
    float v28 = v25 * 0.006 + 0.85;
    float v29 = v28 * 1.1;
    double v30 = v29;
  }
  else
  {
    double v30 = 1.10000002;
    BOOL v31 = v14 > 0.0 && v12 == 1;
    if (v31 && v24 < 75.0)
    {
      float v32 = v25 * -0.007 + 1.525;
      float v21 = v21 * v32;
    }
  }
  double v33 = v18;
  float v34 = v18 * 0.6;
  float v35 = v21 * 0.3;
  float v36 = v22 * -0.1;
  float v86 = v36;
  int64x2_t v37 = self->_tuningParams;
  uint64_t v38 = v37;
  if (v12 == 1)
  {
    if (v14 > 0.0 && v24 < 75.0)
    {
      float v48 = v14 * 1.7579 + v14 * -0.6316 * v14;
      float v49 = v25 * -0.02 + 1.5;
      float v14 = (float)(v48 * v49) + (1.0 - v49) * v14;
    }
  }
  else if (v12 == 3)
  {
    v39 = [(SemanticStylesPlist *)v37 bgTuningForSceneType:3];
    double v40 = v14;
    if (v14 >= 0.0)
    {
      float v87 = v14 * v34;
      double v42 = (v30 + -0.85) * v40 + 1.0;
      float v43 = v39[3] * v35;
      float v47 = v86 * 0.1 * v40;
      float v46 = 0.0;
      float v45 = 0.0;
      float v44 = 0.0;
    }
    else
    {
      float v41 = v34 * -0.25 * v40;
      float v87 = v41;
      double v42 = 1.0 - (v30 + -0.85) * v40;
      float v43 = v39[13];
      float v44 = v39[10] * v35;
      float v45 = v40 * 0.05;
      float v46 = v40 * 0.1;
      float v47 = 0.0;
    }
    float v53 = v14 * v44;
    float v56 = v42;
    float v54 = v14 * v43;
    float v57 = 0.0;
    goto LABEL_44;
  }
  float v50 = v23 * -0.405;
  v51 = [(SemanticStylesPlist *)v37 bgTuningForSceneType:v12];
  double v52 = v14;
  if (v14 >= 0.0)
  {
    float v59 = 1.2;
    BOOL v60 = v52 > 1.2;
    if (v52 < 1.2) {
      float v59 = v14;
    }
    float v53 = v14 * (float)(*v51 * v35);
    float v61 = fminf(v14, 0.5);
    float v87 = v14 * (float)(v51[2] * v34);
    float v54 = v14 * (float)(v51[3] * v35);
    float v62 = (v30 + -1.0) * v52 + 1.0;
    float v63 = v51[4] * v62;
    float v58 = v33 * 0.4;
    float v46 = v61 * (float)(v51[1] * v58);
    float v64 = v52 * 1.1 * v63;
    if (!v60) {
      float v64 = v63;
    }
    if (v64 >= 1.1) {
      float v56 = 1.1;
    }
    else {
      float v56 = v64;
    }
    float v65 = v51[6] * v50;
    float v45 = v61 * (float)(v51[5] * 0.1);
    float v57 = v61 * v65;
    float v47 = v59 * (float)(v51[7] * v86);
  }
  else
  {
    float v53 = v14 * v51[10];
    float v87 = v14 * (float)(v51[12] * v34);
    float v54 = v14 * (float)(v51[13] * v35);
    float v55 = (v30 + -1.0) * (v52 * 0.1) + 1.0;
    float v56 = v51[14] * v55;
    float v57 = v14 * (float)(v51[16] * v50);
    float v47 = v14 * (float)(v51[17] * v86);
    float v46 = 0.0;
    float v45 = 0.0;
  }
LABEL_44:

  float v66 = *(float *)(v8 + 28);
  v67 = [(SemanticStylesPlist *)self->_tuningParams fgTuning];
  uint64_t v68 = *(void *)&v67->var0;
  double v69 = v66;
  if (v66 <= 0.5)
  {
    float32x2_t v71 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&v67->var3.var0), 1.0 - (float)(v66 + v66)));
    double var2 = v67->var3.var2;
    double v73 = v69 + -0.5;
  }
  else
  {
    float v70 = v69 + -0.5 + v69 + -0.5;
    float32x2_t v71 = vmul_n_f32(*(float32x2_t *)&v67->var2.var0, v70);
    double var2 = v67->var2.var2;
    double v73 = 0.5 - v69;
  }
  float v74 = v73 * var2;
  *(float *)(v8 + 40) = v46;
  *(float *)(v8 + 44) = v87;
  *(float *)(v8 + 48) = v54;
  *(float *)(v8 + 52) = v56;
  *(float *)(v8 + 60) = v57;
  *(float *)(v8 + 64) = v47;
  *(_DWORD *)(v8 + 68) = 0;
  *(_DWORD *)(v8 + 72) = 0;
  *(void *)(v8 + 120) = v68;
  *(float32x2_t *)(v8 + 128) = v71;
  *(float *)(v8 + 136) = v74;
  if (v53 >= -1.0)
  {
    float32x2_t v77 = (float32x2_t)0x3FB333333F99999ALL;
    float v76 = 1.0;
  }
  else
  {
    double v75 = v53 + 1.0;
    float v76 = v75 * -0.15 + 1.0;
    float32x2_t v77 = vcvt_f32_f64(vmlaq_n_f64((float64x2_t)xmmword_263480AD0, (float64x2_t)xmmword_263480AC0, v75));
  }
  long long v78 = xmmword_263480AE0;
  switch(*(_DWORD *)(v8 + 32))
  {
    case 0:
      break;
    case 1:
      long long v78 = xmmword_263480B10;
      break;
    case 2:
      float v76 = v76 * 0.955;
      long long v78 = xmmword_263480B00;
      break;
    case 3:
      long long v78 = xmmword_263480AF0;
      break;
    default:
      long long v78 = 0uLL;
      break;
  }
  *(float *)(v8 + 76) = v76;
  *(float32x2_t *)(v8 + 80) = v77;
  *(float *)(v8 + 36) = fminf(fabsf(v53), 1.0);
  *(_OWORD *)(v8 + 88) = v78;
  float v79 = fmin(v45 * 10.0, 1.0);
  *(float *)(v8 + 56) = v79;
  float v80 = *(float *)(v8 + 28);
  double v81 = v80;
  double v82 = (float)(1.0 - v80);
  BOOL v60 = v80 <= 0.5;
  float v83 = 0.33;
  if (v60) {
    float v83 = 0.5;
  }
  float64x2_t v84 = vmulq_n_f64((float64x2_t)xmmword_263480B20, v82);
  float v85 = v84.f64[1] + v81 * -0.015;
  *(float32x2_t *)&v84.f64[0] = vcvt_f32_f64(vmlaq_n_f64(v84, (float64x2_t)xmmword_263480B30, v81));
  *(_DWORD *)(v8 + 104) = LODWORD(v84.f64[0]);
  *(float *)(v8 + 108) = v85;
  *(float32x2_t *)(v8 + 112) = vmul_n_f32(*(float32x2_t *)&v84.f64[0], v83);
}

- (int)createGuideImage:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  if (shaders
    && shaders->_ssCreateGuide
    && ([(FigMetalContext *)self->_metalContext commandQueue],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 commandBuffer],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    uint64_t v8 = -[SemanticStylesStage newTexture2DWithFormat:width:height:usage:label:](self, "newTexture2DWithFormat:width:height:usage:label:", 25, (unint64_t)[v4 width] >> 1, (unint64_t)objc_msgSend(v4, "height") >> 1, 7, @"ss_tex_guide");
    guideTex = self->_guideTex;
    self->_guideTex = v8;

    if (self->_guideTex
      && ([v7 computeCommandEncoder], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v11 = (void *)v10;
      uint64_t v12 = self->_shaders->_ssCreateGuide;
      [v11 setComputePipelineState:v12];
      [v11 setTexture:v4 atIndex:0];
      [v11 setTexture:self->_guideTex atIndex:7];
      [v11 setImageblockWidth:32 height:32];
      uint64_t v13 = [(MTLTexture *)self->_guideTex width];
      uint64_t v14 = [(MTLTexture *)self->_guideTex height];

      v21[0] = v13;
      v21[1] = v14;
      v21[2] = 1;
      int64x2_t v19 = vdupq_n_s64(0x20uLL);
      uint64_t v20 = 1;
      [v11 dispatchThreads:v21 threadsPerThreadgroup:&v19];
      [v11 endEncoding];

      if (*MEMORY[0x263F00E10])
      {
        float v15 = [v7 commandQueue];
        float v16 = [v15 commandBuffer];

        [v16 setLabel:@"KTRACE_MTLCMDBUF"];
        [v16 addCompletedHandler:&__block_literal_global_88];
        [v16 commit];
        [v7 addCompletedHandler:&__block_literal_global_90_0];
      }
      [v7 commit];

      int v17 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v17 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
  }

  return v17;
}

uint64_t __40__SemanticStylesStage_createGuideImage___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __40__SemanticStylesStage_createGuideImage___block_invoke_2(uint64_t a1, void *a2)
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

- (int)upsampleLightMap
{
  if (self->_shaders
    && self->_guidedFilter
    && ([(FigMetalContext *)self->_metalContext commandQueue],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 commandBuffer],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    id v5 = [(SemanticStylesStage *)self newTexture2DWithFormat:25 width:[(MTLTexture *)self->_guideTex width] height:[(MTLTexture *)self->_guideTex height] usage:7 label:@"ss_tex_lightMap"];
    lightMapTex = self->_lightMapTex;
    self->_lightMapTex = v5;

    uint64_t v8 = self->_lightMapTex;
    if (v8)
    {
      LODWORD(v7) = 1028443341;
      int v9 = [(GuidedFilter *)self->_guidedFilter encodeToCommandBuffer:v4 inputTexture:self->_lightMapSmallTex guideTexture:self->_guideTex outputTexture:v8 kernelRadius:1 epsilon:v7];
      if (v9)
      {
        int v12 = v9;
        FigDebugAssert3();
      }
      else
      {
        FigMetalDecRef();
        if (*MEMORY[0x263F00E10])
        {
          uint64_t v10 = [v4 commandQueue];
          int v11 = [v10 commandBuffer];

          [v11 setLabel:@"KTRACE_MTLCMDBUF"];
          [v11 addCompletedHandler:&__block_literal_global_97];
          [v11 commit];
          [v4 addCompletedHandler:&__block_literal_global_99];
        }
        [v4 commit];

        return 0;
      }
      return v12;
    }
    else
    {
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();

      return v14;
    }
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t __39__SemanticStylesStage_upsampleLightMap__block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __39__SemanticStylesStage_upsampleLightMap__block_invoke_2(uint64_t a1, void *a2)
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

- (int)processPersonMaskTex:(id)a3 skinMaskTex:(id)a4 skyMaskTex:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_shaders
    || !self->_guidedFilter
    || ([(FigMetalContext *)self->_metalContext commandQueue],
        int v11 = objc_claimAutoreleasedReturnValue(),
        [v11 commandBuffer],
        int v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v13 = -[SemanticStylesStage newTexture2DWithFormat:width:height:usage:label:](self, "newTexture2DWithFormat:width:height:usage:label:", 25, [v8 width], objc_msgSend(v8, "height"), 7, @"ss_tex_matte_fgbg");
  fgbgMatteTex = self->_fgbgMatteTex;
  self->_fgbgMatteTex = v13;

  float v16 = self->_fgbgMatteTex;
  if (!v16)
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_9;
  }
  LODWORD(v15) = 1028443341;
  int v17 = [(GuidedFilter *)self->_guidedFilter encodeToCommandBuffer:v12 inputTexture:v8 guideTexture:self->_guideTex outputTexture:v16 kernelRadius:5 epsilon:v15];
  if (v17)
  {
    int v20 = v17;
    FigDebugAssert3();
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_skinMatteTex, a4);
  FigMetalIncRef();
  objc_storeStrong((id *)&self->_skyMatteTex, a5);
  FigMetalIncRef();
  if (*MEMORY[0x263F00E10])
  {
    float v18 = [v12 commandQueue];
    int64x2_t v19 = [v18 commandBuffer];

    [v19 setLabel:@"KTRACE_MTLCMDBUF"];
    [v19 addCompletedHandler:&__block_literal_global_105];
    [v19 commit];
    [v12 addCompletedHandler:&__block_literal_global_107];
  }
  [v12 commit];

  int v20 = 0;
LABEL_9:

  return v20;
}

uint64_t __67__SemanticStylesStage_processPersonMaskTex_skinMaskTex_skyMaskTex___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __67__SemanticStylesStage_processPersonMaskTex_skinMaskTex_skyMaskTex___block_invoke_2(uint64_t a1, void *a2)
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

- (int)renderWithLumaTex:(id)a3 chromaTex:(id)a4 outLumaTex:(id)a5 outChromaTex:(id)a6 gainMapTex:(id)a7 outputGainMapTex:(id)a8
{
  id v14 = a3;
  id v29 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  shaders = self->_shaders;
  if (shaders
    && shaders->_ssRenderAdjustments
    && ([(FigMetalContext *)self->_metalContext commandQueue],
        int v20 = objc_claimAutoreleasedReturnValue(),
        [v20 commandBuffer],
        float v21 = objc_claimAutoreleasedReturnValue(),
        v20,
        v21))
  {
    [v21 encodeWaitForEvent:self->_sharedEvent value:2];
    uint64_t v22 = [v21 computeCommandEncoder];
    if (v22)
    {
      float v23 = (void *)v22;
      float v24 = self->_shaders->_ssRenderAdjustments;
      [v23 setComputePipelineState:v24];
      [v23 setTexture:v14 atIndex:0];
      [v23 setTexture:v29 atIndex:1];
      [v23 setTexture:v15 atIndex:13];
      [v23 setTexture:v16 atIndex:14];
      [v23 setTexture:v17 atIndex:2];
      [v23 setTexture:v18 atIndex:3];
      [v23 setTexture:self->_lightMapTex atIndex:9];
      [v23 setTexture:self->_fgbgMatteTex atIndex:10];
      [v23 setTexture:self->_skinMatteTex atIndex:11];
      [v23 setTexture:self->_skyMatteTex atIndex:12];
      [v23 setBuffer:self->_paramsBuf offset:0 atIndex:0];

      [v23 setImageblockWidth:32 height:32];
      v32[0] = [v14 width];
      v32[1] = [v14 height];
      v32[2] = 1;
      int64x2_t v30 = vdupq_n_s64(0x20uLL);
      uint64_t v31 = 1;
      [v23 dispatchThreads:v32 threadsPerThreadgroup:&v30];
      [v23 endEncoding];
      if (*MEMORY[0x263F00E10])
      {
        double v25 = [v21 commandQueue];
        float v26 = [v25 commandBuffer];

        [v26 setLabel:@"KTRACE_MTLCMDBUF"];
        [v26 addCompletedHandler:&__block_literal_global_110];
        [v26 commit];
        [v21 addCompletedHandler:&__block_literal_global_112_0];
      }
      [v21 commit];

      int v27 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v27 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
  }

  return v27;
}

uint64_t __103__SemanticStylesStage_renderWithLumaTex_chromaTex_outLumaTex_outChromaTex_gainMapTex_outputGainMapTex___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __103__SemanticStylesStage_renderWithLumaTex_chromaTex_outLumaTex_outChromaTex_gainMapTex_outputGainMapTex___block_invoke_2(uint64_t a1, void *a2)
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

- (void)remapSliderValueForRendering
{
  uint64_t v3 = [(MTLBuffer *)self->_paramsBuf contents];
  *(float *)(v3 + 24) = *(float *)(v3 + 24) * 1.2;
  id v4 = [(SemanticStylesPlist *)self->_tuningParams toneBiasRemap];
  if (v4)
  {
    float v5 = *(float *)(v3 + 24);
    float var1 = v4->var1;
    if (v5 >= 0.0 || v5 <= var1)
    {
      if (v5 >= 0.0)
      {
        float var2 = v4->var2;
        if (v5 < var2) {
          float v5 = v4->var0 + (float)((float)(v5 / var2) * (float)(v5 - v4->var0));
        }
      }
    }
    else
    {
      float v5 = v5 + (float)((float)((float)(var1 - v5) / var1) * (float)(v4->var0 - v5));
    }
    *(float *)(v3 + 24) = v5;
  }
}

- (int)runWithStyle:(SemanticStylesStage *)self tuningParams:(SEL)a2 refFrameLuxLevel:(id)a3 sceneType:(id)a4 lumaTex:(float)a5 chromaTex:(id)a6 outLumaTex:(id)a7 outChromaTex:(id)a8 gainMapTex:(id)a9 outputGainMapTex:(id)a10 maskScale:(id)a11 maskTranslation:(id)a12 personMaskTex:(id)a13 skinMaskTex:(id)a14 skyMaskTex:(id)a15 isLowLight:(BOOL)a16
{
  uint64_t v23 = v17;
  uint64_t v24 = v16;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v69 = a3;
  id obj = a4;
  id v65 = a4;
  id v68 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a9;
  id v62 = a10;
  id v67 = a11;
  id v66 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a15;
  if (!v26)
  {
    uint64_t v58 = v59;
    LODWORD(v56) = 0;
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
    float v32 = v28;
LABEL_28:
    float v47 = v62;
    double v33 = self;
    goto LABEL_25;
  }
  float v32 = v28;
  if (!v27)
  {
    uint64_t v58 = v59;
    LODWORD(v56) = 0;
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
    goto LABEL_28;
  }
  double v33 = self;
  float v34 = [(SemanticStylesStage *)self newBufferWithLength:144 options:0 label:@"ss_buf_params"];
  paramsBuf = self->_paramsBuf;
  self->_paramsBuf = v34;

  float v36 = self->_paramsBuf;
  if (!v36)
  {
    uint64_t v58 = v59;
    LODWORD(v56) = 0;
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
LABEL_32:
    float v47 = v62;
    goto LABEL_25;
  }
  id v60 = v31;
  id v64 = v30;
  uint64_t v37 = [(MTLBuffer *)v36 contents];
  *(void *)uint64_t v37 = v23;
  *(void *)(v37 + 8) = v24;
  *(float *)(v37 + 16) = a5;
  *(unsigned char *)(v37 + 20) = a16;
  [v69 toneBias];
  *(_DWORD *)(v37 + 24) = v38;
  [v69 warmthBias];
  *(_DWORD *)(v37 + 28) = v39;
  id v40 = v68;
  id v41 = v29;
  if ([v40 isEqualToString:*MEMORY[0x263F2F768]])
  {
    int v42 = 0;
  }
  else if ([v40 isEqualToString:*MEMORY[0x263F2F770]])
  {
    int v42 = 1;
  }
  else if ([v40 isEqualToString:*MEMORY[0x263F2F778]])
  {
    int v42 = 2;
  }
  else if ([v40 isEqualToString:*MEMORY[0x263F2F760]])
  {
    int v42 = 3;
  }
  else
  {
    int v42 = 0;
  }

  *(_DWORD *)(v37 + 32) = v42;
  float v43 = *(float *)(v37 + 28) * 0.25 + 0.5;
  *(float *)(v37 + 28) = v43;
  float v44 = [(FigMetalContext *)self->_metalContext device];
  float v45 = (MTLSharedEvent *)[v44 newSharedEvent];
  sharedEvent = self->_sharedEvent;
  self->_sharedEvent = v45;

  if (!self->_sharedEvent)
  {
    uint64_t v58 = v59;
    LODWORD(v56) = 0;
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
    id v29 = v41;
    id v30 = v64;
    id v31 = v60;
    float v32 = v28;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&self->_tuningParams, obj);
  id v29 = v41;
  float v32 = v28;
  if (!self->_tuningParams)
  {
    uint64_t v58 = v59;
    LODWORD(v56) = 0;
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
    id v30 = v64;
    id v31 = v60;
    goto LABEL_32;
  }
  [(SemanticStylesStage *)self remapSliderValueForRendering];
  float v47 = v62;
  if (dword_26B430EE8)
  {
    float v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v29 = v41;
  }
  int v49 = -[SemanticStylesStage calculateHistogramStatsWithLumaTex:chromaTex:](self, "calculateHistogramStatsWithLumaTex:chromaTex:", v26, v27, v56, v57);
  id v30 = v64;
  id v31 = v60;
  if (v49)
  {
    int v54 = v49;
    uint64_t v58 = v59;
    LODWORD(v56) = v49;
LABEL_38:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_25;
  }
  int v50 = [(SemanticStylesStage *)self createGuideImage:v26];
  if (v50)
  {
    int v54 = v50;
    uint64_t v58 = v59;
    LODWORD(v56) = v50;
    goto LABEL_38;
  }
  int v51 = [(SemanticStylesStage *)self upsampleLightMap];
  if (v51)
  {
    int v54 = v51;
    uint64_t v58 = v59;
    LODWORD(v56) = v51;
    goto LABEL_38;
  }
  if (v29)
  {
    if (v64)
    {
      if (v60)
      {
        int v52 = [(SemanticStylesStage *)self processPersonMaskTex:v29 skinMaskTex:v64 skyMaskTex:v60];
        if (v52)
        {
          int v54 = v52;
          uint64_t v58 = v59;
          LODWORD(v56) = v52;
          goto LABEL_38;
        }
      }
    }
  }
  FigMetalDecRef();
  int v53 = [(SemanticStylesStage *)self renderWithLumaTex:v26 chromaTex:v27 outLumaTex:v32 outChromaTex:v62 gainMapTex:v67 outputGainMapTex:v66];
  int v54 = v53;
  if (v53)
  {
    uint64_t v58 = v59;
    LODWORD(v56) = v53;
    goto LABEL_38;
  }
LABEL_25:
  [(SemanticStylesStage *)v33 releaseResources];

  return v54;
}

- (int)runWithStyle:(id)a3 tuningParams:(id)a4 refFrameLuxLevel:(float)a5 sceneType:(id)a6 lumaTex:(id)a7 chromaTex:(id)a8 gainMapTex:(id)a9 outputGainMapTex:(id)a10 personMaskTex:(id)a11 skinMaskTex:(id)a12 skyMaskTex:(id)a13 isLowLight:(BOOL)a14
{
  LOBYTE(v20) = a14;
  __asm { FMOV            V1.2S, #1.0 }
  return -[SemanticStylesStage runWithStyle:tuningParams:refFrameLuxLevel:sceneType:lumaTex:chromaTex:outLumaTex:outChromaTex:gainMapTex:outputGainMapTex:maskScale:maskTranslation:personMaskTex:skinMaskTex:skyMaskTex:isLowLight:](self, "runWithStyle:tuningParams:refFrameLuxLevel:sceneType:lumaTex:chromaTex:outLumaTex:outChromaTex:gainMapTex:outputGainMapTex:maskScale:maskTranslation:personMaskTex:skinMaskTex:skyMaskTex:isLowLight:", a3, a4, a6, a7, a8, 0, 0, a9, a10, a11, a12, a13, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_skyMatteTex, 0);
  objc_storeStrong((id *)&self->_skinMatteTex, 0);
  objc_storeStrong((id *)&self->_fgbgMatteTex, 0);
  objc_storeStrong((id *)&self->_lightMapTex, 0);
  objc_storeStrong((id *)&self->_lightMapSmallTex, 0);
  objc_storeStrong((id *)&self->_guideTex, 0);
  objc_storeStrong((id *)&self->_statsBuf, 0);
  objc_storeStrong((id *)&self->_paramsBuf, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end