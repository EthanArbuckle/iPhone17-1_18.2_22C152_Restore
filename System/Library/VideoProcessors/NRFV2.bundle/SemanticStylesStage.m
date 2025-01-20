@interface SemanticStylesStage
+ (int)prewarmShaders:(id)a3;
- (SemanticStylesStage)initWithMetalContext:(id)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5;
- (id)newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7;
- (int)calculateHistogramStatsWithLumaTex:(id)a3 chromaTex:(id)a4;
- (int)createGuideImage:(id)a3;
- (int)processPersonMaskTex:(id)a3 skinMaskTex:(id)a4 skyMaskTex:(id)a5;
- (int)renderWithLumaTex:(id)a3 chromaTex:(id)a4 gainMapTex:(id)a5 outputGainMapTex:(id)a6;
- (int)runWithStyle:(id)a3 tuningParams:(id)a4 refFrameMetadata:(const frameMetadata *)a5 sceneType:(id)a6 lumaTex:(id)a7 chromaTex:(id)a8 gainMapTex:(id)a9 outputGainMapTex:(id)a10 personMaskTex:(id)a11 skinMaskTex:(id)a12 skyMaskTex:(id)a13 isLowLight:(BOOL)a14;
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
  v23.receiver = self;
  v23.super_class = (Class)SemanticStylesStage;
  v6 = [(SemanticStylesStage *)&v23 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v10 = objc_msgSend_sharedInstance(SemanticStylesShared, v7, v8, v9);
  objc_msgSend_getShaders_(v10, v11, (uint64_t)self->_metalContext, v12);
  v13 = (SemanticStylesShaders *)objc_claimAutoreleasedReturnValue();
  shaders = self->_shaders;
  self->_shaders = v13;

  if (!self->_shaders) {
    goto LABEL_9;
  }
  v15 = [GuidedFilter alloc];
  v18 = (GuidedFilter *)objc_msgSend_initWithMetalContext_(v15, v16, (uint64_t)v5, v17);
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = v18;

  if (!self->_guidedFilter
    || (v20 = (MTLSharedEventListener *)objc_alloc_init(MEMORY[0x263F12A00]),
        sharedEventListener = self->_sharedEventListener,
        self->_sharedEventListener = v20,
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
    v4 = [SemanticStylesShaders alloc];
    uint64_t v7 = objc_msgSend_initWithMetalContext_(v4, v5, (uint64_t)v3, v6);
    if (v7)
    {
      v10 = (void *)v7;
      objc_msgSend_prewarmShaders_(GuidedFilter, v8, (uint64_t)v3, v9);

      int v11 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v11 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }

  return v11;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  uint64_t v7 = objc_msgSend_device(self->_metalContext, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_newBufferWithLength_options_(v7, v8, a3, a4);

  objc_msgSend_setLabel_(v9, v10, 0, v11);
  return v9;
}

- (id)newTexture2DWithFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 usage:(unint64_t)a6 label:(id)a7
{
  uint64_t v12 = objc_msgSend_allocator(self->_metalContext, a2, a3, a4, a5, a6, a7);
  v16 = objc_msgSend_newTextureDescriptor(v12, v13, v14, v15);

  if (!v16) {
    goto LABEL_4;
  }
  objc_msgSend_setLabel_(v16, v17, 0, v18);
  v22 = objc_msgSend_desc(v16, v19, v20, v21);
  objc_msgSend_setTextureType_(v22, v23, 2, v24);

  v28 = objc_msgSend_desc(v16, v25, v26, v27);
  objc_msgSend_setPixelFormat_(v28, v29, a3, v30);

  v34 = objc_msgSend_desc(v16, v31, v32, v33);
  objc_msgSend_setWidth_(v34, v35, a4, v36);

  v40 = objc_msgSend_desc(v16, v37, v38, v39);
  objc_msgSend_setHeight_(v40, v41, a5, v42);

  v46 = objc_msgSend_desc(v16, v43, v44, v45);
  objc_msgSend_setDepth_(v46, v47, 1, v48);

  v52 = objc_msgSend_desc(v16, v49, v50, v51);
  objc_msgSend_setUsage_(v52, v53, a6, v54);

  v58 = objc_msgSend_allocator(self->_metalContext, v55, v56, v57);
  v61 = objc_msgSend_newTextureWithDescriptor_(v58, v59, (uint64_t)v16, v60);

  if (!v61)
  {
LABEL_4:
    FigDebugAssert3();
    FigSignalErrorAt();
    v61 = 0;
  }

  return v61;
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
  id v10 = a4;
  shaders = self->_shaders;
  if (!shaders
    || !shaders->_ssCalculateLocalHistogramStats
    || !shaders->_ssCalculateGlobalHistogram
    || !shaders->_ssCalculateGlobalStats
    || (objc_msgSend_commandQueue(self->_metalContext, v7, v8, v9),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v12, v13, v14, v15),
        v16 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v16))
  {
    FigDebugAssert3();
    int v83 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v20 = objc_msgSend_computeCommandEncoder(v16, v17, v18, v19);
  if (!v20)
  {
    FigDebugAssert3();
    int v83 = FigSignalErrorAt();
LABEL_21:

    goto LABEL_17;
  }
  v22 = (void *)v20;
  objc_super v23 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_label_(self, v21, 1057824, 0, @"ss_buf_stats");
  statsBuf = self->_statsBuf;
  self->_statsBuf = v23;

  if (!self->_statsBuf
    || (uint64_t v26 = (MTLTexture *)objc_msgSend_newTexture2DWithFormat_width_height_usage_label_(self, v25, 25, 32, 32, 7, @"ss_tex_lightMap_small"), lightMapSmallTex = self->_lightMapSmallTex, self->_lightMapSmallTex = v26, lightMapSmallTex, !self->_lightMapSmallTex))
  {
    FigDebugAssert3();
    int v83 = FigSignalErrorAt();

    goto LABEL_21;
  }
  v28 = self->_shaders->_ssCalculateLocalHistogramStats;
  objc_msgSend_setComputePipelineState_(v22, v29, (uint64_t)v28, v30);
  objc_msgSend_setTexture_atIndex_(v22, v31, (uint64_t)v6, 0);
  objc_msgSend_setTexture_atIndex_(v22, v32, (uint64_t)v10, 1);
  objc_msgSend_setTexture_atIndex_(v22, v33, (uint64_t)self->_lightMapSmallTex, 8);
  objc_msgSend_setBuffer_offset_atIndex_(v22, v34, (uint64_t)self->_paramsBuf, 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v22, v35, (uint64_t)self->_statsBuf, 0, 1);
  unint64_t v39 = objc_msgSend_maxTotalThreadsPerThreadgroup(v28, v36, v37, v38);
  unint64_t v43 = objc_msgSend_threadExecutionWidth(v28, v40, v41, v42);

  uint64_t v45 = 16;
  if (v43 >= 0x10) {
    unint64_t v46 = 16;
  }
  else {
    unint64_t v46 = v43;
  }
  int64x2_t v85 = vdupq_n_s64(0x20uLL);
  int64x2_t v92 = v85;
  uint64_t v93 = 1;
  if (v39 / v46 < 0x10) {
    uint64_t v45 = v39 / v46;
  }
  *(void *)&long long v87 = v46;
  *((void *)&v87 + 1) = v45;
  uint64_t v88 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v22, v44, (uint64_t)&v92, (uint64_t)&v87);
  v47 = self->_shaders->_ssCalculateGlobalHistogram;
  objc_msgSend_setComputePipelineState_(v22, v48, (uint64_t)v47, v49);
  objc_msgSend_setBuffer_offset_atIndex_(v22, v50, (uint64_t)self->_paramsBuf, 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v22, v51, (uint64_t)self->_statsBuf, 0, 1);

  int64x2_t v92 = (int64x2_t)xmmword_263117AB0;
  uint64_t v93 = 1;
  long long v87 = (__int128)v85;
  uint64_t v88 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v22, v52, (uint64_t)&v92, (uint64_t)&v87);
  v53 = self->_shaders->_ssCalculateGlobalStats;
  objc_msgSend_setComputePipelineState_(v22, v54, (uint64_t)v53, v55);
  objc_msgSend_setBuffer_offset_atIndex_(v22, v56, (uint64_t)self->_paramsBuf, 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v22, v57, (uint64_t)self->_statsBuf, 0, 1);

  int64x2_t v92 = vdupq_n_s64(1uLL);
  uint64_t v93 = 1;
  long long v87 = xmmword_263117AB0;
  uint64_t v88 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v22, v58, (uint64_t)&v92, (uint64_t)&v87);
  objc_msgSend_endEncoding(v22, v59, v60, v61);
  v92.i64[0] = 0;
  v92.i64[1] = (uint64_t)&v92;
  uint64_t v93 = 0x3032000000;
  v94 = sub_262F883EC;
  v95 = sub_262F883FC;
  v96 = self->_paramsBuf;
  *(void *)&long long v87 = 0;
  *((void *)&v87 + 1) = &v87;
  uint64_t v88 = 0x3032000000;
  v89 = sub_262F883EC;
  v90 = sub_262F883FC;
  v91 = self->_statsBuf;
  sharedEvent = self->_sharedEvent;
  sharedEventListener = self->_sharedEventListener;
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = sub_262F88404;
  v86[3] = &unk_2655C3330;
  v86[4] = self;
  v86[5] = &v92;
  v86[6] = &v87;
  objc_msgSend_notifyListener_atValue_block_(sharedEvent, v64, (uint64_t)sharedEventListener, 1, v86);
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(&v92, 8);
  objc_msgSend_encodeSignalEvent_value_(v16, v65, (uint64_t)self->_sharedEvent, 1);
  if (*MEMORY[0x263F00E10])
  {
    v69 = objc_msgSend_commandQueue(v16, v66, v67, v68);
    v73 = objc_msgSend_commandBuffer(v69, v70, v71, v72);

    objc_msgSend_setLabel_(v73, v74, @"KTRACE_MTLCMDBUF", v75);
    objc_msgSend_addCompletedHandler_(v73, v76, (uint64_t)&unk_270E33EA8, v77);
    objc_msgSend_commit(v73, v78, v79, v80);
    objc_msgSend_addCompletedHandler_(v16, v81, (uint64_t)&unk_270E33EC8, v82);
  }
  objc_msgSend_commit(v16, v66, v67, v68);

  int v83 = 0;
LABEL_17:

  return v83;
}

- (void)calculateAdjustmentParametersWithParamsBuffer:(id)a3 statsBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_contents(v6, v8, v9, v10);
  id v12 = v7;
  v16 = (float *)(objc_msgSend_contents(v12, v13, v14, v15) + 1057792);

  float v17 = *(float *)(v11 + 16);
  int v18 = *(unsigned __int8 *)(v11 + 20);
  uint64_t v19 = *(unsigned int *)(v11 + 32);
  float v20 = *(float *)(v11 + 24);
  float v21 = v16[3];
  float v22 = v16[4];
  float v23 = v16[5];
  float v24 = 0.8;
  if (v22 < 0.18 && v23 < 0.85)
  {
    float v25 = 0.18 - v22;
    float v24 = powf(v25, 0.75) + 1.0;
  }
  float v26 = v23 - v21;
  float v27 = 1.0;
  float v28 = 1.5;
  if ((float)(v23 - v21) <= 0.5) {
    float v28 = 1.0;
  }
  float v29 = 1.25;
  if (*v16 >= 0.5)
  {
    float v29 = 0.75;
    if (v26 >= 0.4)
    {
      float v27 = 1.0;
      if ((float)(v22 - v21) <= 0.2)
      {
        float v29 = 1.0;
      }
      else
      {
        float v27 = 1.6;
        float v24 = v24 * 1.1;
      }
    }
    else
    {
      float v27 = 1.5;
    }
  }
  float v30 = v17 / 3.14159265;
  double v31 = v30;
  if (v18 && v30 < 25.0)
  {
    float v32 = v31 * 0.013 + 0.675;
    float v33 = v31 * -0.01 + 1.25;
    float v28 = v28 * v29;
    float v29 = v29 * v33;
    float v24 = v24 * v32;
    float v34 = v31 * 0.006 + 0.85;
    float v35 = v34 * 1.1;
    double v36 = v35;
  }
  else
  {
    double v36 = 1.10000002;
    BOOL v37 = v20 > 0.0 && v19 == 1;
    if (v37 && v30 < 75.0)
    {
      float v38 = v31 * -0.007 + 1.525;
      float v27 = v27 * v38;
    }
  }
  double v39 = v24;
  float v40 = v24 * 0.6;
  float v41 = v27 * 0.3;
  float v42 = v28 * -0.1;
  float v97 = v42;
  unint64_t v43 = self->_tuningParams;
  unint64_t v46 = v43;
  if (v19 == 1)
  {
    if (v20 > 0.0 && v30 < 75.0)
    {
      float v56 = v20 * 1.7579 + v20 * -0.6316 * v20;
      float v57 = v31 * -0.02 + 1.5;
      float v20 = (float)(v57 * v56) + (1.0 - v57) * v20;
    }
  }
  else if (v19 == 3)
  {
    v47 = (float *)objc_msgSend_bgTuningForSceneType_(v43, v44, 3, v45);
    double v48 = v20;
    if (v20 >= 0.0)
    {
      float v98 = v20 * v40;
      double v50 = (v36 + -0.85) * v48 + 1.0;
      float v51 = v47[3] * v41;
      float v55 = v97 * 0.1 * v48;
      float v54 = 0.0;
      float v53 = 0.0;
      float v52 = 0.0;
    }
    else
    {
      float v49 = v40 * -0.25 * v48;
      float v98 = v49;
      double v50 = 1.0 - (v36 + -0.85) * v48;
      float v51 = v47[11];
      float v52 = v47[8] * v41;
      float v53 = v48 * 0.05;
      float v54 = v48 * 0.1;
      float v55 = 0.0;
    }
    float v61 = v20 * v52;
    float v64 = v50;
    float v62 = v20 * v51;
    float v65 = 0.0;
    goto LABEL_41;
  }
  float v58 = v29 * -0.405;
  v59 = (float *)objc_msgSend_bgTuningForSceneType_(v43, v44, v19, v45);
  double v60 = v20;
  if (v20 >= 0.0)
  {
    float v67 = 1.2;
    BOOL v68 = v60 > 1.2;
    if (v60 < 1.2) {
      float v67 = v20;
    }
    float v61 = v20 * (float)(*v59 * v41);
    float v69 = fminf(v20, 0.5);
    float v98 = v20 * (float)(v59[2] * v40);
    float v62 = v20 * (float)(v59[3] * v41);
    float v70 = (v36 + -1.0) * v60 + 1.0;
    float v71 = v59[4] * v70;
    float v66 = v39 * 0.4;
    float v54 = v69 * (float)(v59[1] * v66);
    float v72 = v60 * 1.1 * v71;
    if (!v68) {
      float v72 = v71;
    }
    if (v72 >= 1.1) {
      float v64 = 1.1;
    }
    else {
      float v64 = v72;
    }
    float v73 = v59[6] * v58;
    float v53 = v69 * (float)(v59[5] * 0.1);
    float v65 = v69 * v73;
    float v55 = v67 * (float)(v59[7] * v97);
  }
  else
  {
    float v61 = v20 * v59[8];
    float v98 = v20 * (float)(v59[10] * v40);
    float v62 = v20 * (float)(v59[11] * v41);
    float v63 = (v36 + -1.0) * (v60 * 0.1) + 1.0;
    float v64 = v59[12] * v63;
    float v65 = v20 * (float)(v59[14] * v58);
    float v55 = v20 * (float)(v59[15] * v97);
    float v54 = 0.0;
    float v53 = 0.0;
  }
LABEL_41:

  float v74 = *(float *)(v11 + 28);
  uint64_t v78 = objc_msgSend_fgTuning(self->_tuningParams, v75, v76, v77);
  uint64_t v79 = *(void *)v78;
  double v80 = v74;
  if (v74 <= 0.5)
  {
    float32x2_t v82 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)(v78 + 20)), 1.0 - (float)(v74 + v74)));
    double v83 = *(float *)(v78 + 28);
    double v84 = v80 + -0.5;
  }
  else
  {
    float v81 = v80 + -0.5 + v80 + -0.5;
    float32x2_t v82 = vmul_n_f32(*(float32x2_t *)(v78 + 8), v81);
    double v83 = *(float *)(v78 + 16);
    double v84 = 0.5 - v80;
  }
  float v85 = v84 * v83;
  *(float *)(v11 + 40) = v54;
  *(float *)(v11 + 44) = v98;
  *(float *)(v11 + 48) = v62;
  *(float *)(v11 + 52) = v64;
  *(float *)(v11 + 60) = v65;
  *(float *)(v11 + 64) = v55;
  *(void *)(v11 + 112) = v79;
  *(float32x2_t *)(v11 + 120) = v82;
  *(float *)(v11 + 128) = v85;
  if (v61 >= -1.0)
  {
    float32x2_t v88 = (float32x2_t)0x3FB333333F99999ALL;
    float v87 = 1.0;
  }
  else
  {
    double v86 = v61 + 1.0;
    float v87 = v86 * -0.15 + 1.0;
    float32x2_t v88 = vcvt_f32_f64(vmlaq_n_f64((float64x2_t)xmmword_263117AD0, (float64x2_t)xmmword_263117AC0, v86));
  }
  long long v89 = xmmword_263117AE0;
  switch(*(_DWORD *)(v11 + 32))
  {
    case 0:
      break;
    case 1:
      long long v89 = xmmword_263117B10;
      break;
    case 2:
      float v87 = v87 * 0.955;
      long long v89 = xmmword_263117B00;
      break;
    case 3:
      long long v89 = xmmword_263117AF0;
      break;
    default:
      long long v89 = 0uLL;
      break;
  }
  *(float *)(v11 + 68) = v87;
  *(float32x2_t *)(v11 + 72) = v88;
  *(float *)(v11 + 36) = fminf(fabsf(v61), 1.0);
  *(_OWORD *)(v11 + 80) = v89;
  float v90 = fmin(v53 * 10.0, 1.0);
  *(float *)(v11 + 56) = v90;
  float v91 = *(float *)(v11 + 28);
  double v92 = v91;
  double v93 = (float)(1.0 - v91);
  BOOL v68 = v91 <= 0.5;
  float v94 = 0.33;
  if (v68) {
    float v94 = 0.5;
  }
  float64x2_t v95 = vmulq_n_f64((float64x2_t)xmmword_263117B20, v93);
  float v96 = v95.f64[1] + v92 * -0.015;
  *(float32x2_t *)&v95.f64[0] = vcvt_f32_f64(vmlaq_n_f64(v95, (float64x2_t)xmmword_263117B30, v92));
  *(_DWORD *)(v11 + 96) = LODWORD(v95.f64[0]);
  *(float *)(v11 + 100) = v96;
  *(float32x2_t *)(v11 + 104) = vmul_n_f32(*(float32x2_t *)&v95.f64[0], v94);
}

- (int)createGuideImage:(id)a3
{
  id v7 = a3;
  shaders = self->_shaders;
  if (shaders
    && shaders->_ssCreateGuide
    && (objc_msgSend_commandQueue(self->_metalContext, v4, v5, v6),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v9, v10, v11, v12),
        v13 = objc_claimAutoreleasedReturnValue(),
        v9,
        v13))
  {
    unint64_t v17 = (unint64_t)objc_msgSend_width(v7, v14, v15, v16) >> 1;
    unint64_t v21 = objc_msgSend_height(v7, v18, v19, v20);
    float v23 = (MTLTexture *)objc_msgSend_newTexture2DWithFormat_width_height_usage_label_(self, v22, 25, v17, v21 >> 1, 7, @"ss_tex_guide");
    guideTex = self->_guideTex;
    self->_guideTex = v23;

    if (self->_guideTex
      && (objc_msgSend_computeCommandEncoder(v13, v25, v26, v27), (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      float v29 = (void *)v28;
      float v30 = self->_shaders->_ssCreateGuide;
      objc_msgSend_setComputePipelineState_(v29, v31, (uint64_t)v30, v32);
      objc_msgSend_setTexture_atIndex_(v29, v33, (uint64_t)v7, 0);
      objc_msgSend_setTexture_atIndex_(v29, v34, (uint64_t)self->_guideTex, 7);
      objc_msgSend_setImageblockWidth_height_(v29, v35, 32, 32);
      uint64_t v39 = objc_msgSend_width(self->_guideTex, v36, v37, v38);
      uint64_t v43 = objc_msgSend_height(self->_guideTex, v40, v41, v42);

      v69[0] = v39;
      v69[1] = v43;
      v69[2] = 1;
      int64x2_t v67 = vdupq_n_s64(0x20uLL);
      uint64_t v68 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v29, v44, (uint64_t)v69, (uint64_t)&v67);
      objc_msgSend_endEncoding(v29, v45, v46, v47);

      if (*MEMORY[0x263F00E10])
      {
        float v51 = objc_msgSend_commandQueue(v13, v48, v49, v50);
        float v55 = objc_msgSend_commandBuffer(v51, v52, v53, v54);

        objc_msgSend_setLabel_(v55, v56, @"KTRACE_MTLCMDBUF", v57);
        objc_msgSend_addCompletedHandler_(v55, v58, (uint64_t)&unk_270E33EE8, v59);
        objc_msgSend_commit(v55, v60, v61, v62);
        objc_msgSend_addCompletedHandler_(v13, v63, (uint64_t)&unk_270E33F08, v64);
      }
      objc_msgSend_commit(v13, v48, v49, v50);

      int v65 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v65 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v65 = FigSignalErrorAt();
  }

  return v65;
}

- (int)upsampleLightMap
{
  if (self->_shaders
    && self->_guidedFilter
    && (objc_msgSend_commandQueue(self->_metalContext, a2, v2, v3),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v5, v6, v7, v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v5,
        v9))
  {
    uint64_t v13 = objc_msgSend_width(self->_guideTex, v10, v11, v12);
    uint64_t v17 = objc_msgSend_height(self->_guideTex, v14, v15, v16);
    uint64_t v19 = (MTLTexture *)objc_msgSend_newTexture2DWithFormat_width_height_usage_label_(self, v18, 25, v13, v17, 7, @"ss_tex_lightMap");
    lightMapTex = self->_lightMapTex;
    self->_lightMapTex = v19;

    float v23 = self->_lightMapTex;
    if (v23)
    {
      LODWORD(v22) = 1028443341;
      int v24 = objc_msgSend_encodeToCommandBuffer_inputTexture_guideTexture_outputTexture_kernelRadius_epsilon_(self->_guidedFilter, v21, (uint64_t)v9, (uint64_t)self->_lightMapSmallTex, self->_guideTex, v23, 1, v22);
      if (v24)
      {
        int v42 = v24;
        FigDebugAssert3();
      }
      else
      {
        FigMetalDecRef();
        if (*MEMORY[0x263F00E10])
        {
          uint64_t v28 = objc_msgSend_commandQueue(v9, v25, v26, v27);
          uint64_t v32 = objc_msgSend_commandBuffer(v28, v29, v30, v31);

          objc_msgSend_setLabel_(v32, v33, @"KTRACE_MTLCMDBUF", v34);
          objc_msgSend_addCompletedHandler_(v32, v35, (uint64_t)&unk_270E33F28, v36);
          objc_msgSend_commit(v32, v37, v38, v39);
          objc_msgSend_addCompletedHandler_(v9, v40, (uint64_t)&unk_270E33F48, v41);
        }
        objc_msgSend_commit(v9, v25, v26, v27);

        return 0;
      }
      return v42;
    }
    else
    {
      FigDebugAssert3();
      int v44 = FigSignalErrorAt();

      return v44;
    }
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)processPersonMaskTex:(id)a3 skinMaskTex:(id)a4 skyMaskTex:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (!self->_shaders
    || !self->_guidedFilter
    || (objc_msgSend_commandQueue(self->_metalContext, v10, v11, v12),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v14, v15, v16, v17),
        int v18 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v18))
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v22 = objc_msgSend_width(self->_guideTex, v19, v20, v21);
  uint64_t v26 = objc_msgSend_height(self->_guideTex, v23, v24, v25);
  uint64_t v28 = (MTLTexture *)objc_msgSend_newTexture2DWithFormat_width_height_usage_label_(self, v27, 25, v22, v26, 7, @"ss_tex_matte_fgbg");
  fgbgMatteTex = self->_fgbgMatteTex;
  self->_fgbgMatteTex = v28;

  uint64_t v32 = self->_fgbgMatteTex;
  if (!v32)
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_9;
  }
  LODWORD(v31) = 1028443341;
  int v33 = objc_msgSend_encodeToCommandBuffer_inputTexture_guideTexture_outputTexture_kernelRadius_epsilon_(self->_guidedFilter, v30, (uint64_t)v18, (uint64_t)v8, self->_guideTex, v32, 5, v31);
  if (v33)
  {
    int v51 = v33;
    FigDebugAssert3();
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_skinMatteTex, a4);
  FigMetalIncRef();
  objc_storeStrong((id *)&self->_skyMatteTex, a5);
  FigMetalIncRef();
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v37 = objc_msgSend_commandQueue(v18, v34, v35, v36);
    uint64_t v41 = objc_msgSend_commandBuffer(v37, v38, v39, v40);

    objc_msgSend_setLabel_(v41, v42, @"KTRACE_MTLCMDBUF", v43);
    objc_msgSend_addCompletedHandler_(v41, v44, (uint64_t)&unk_270E33F68, v45);
    objc_msgSend_commit(v41, v46, v47, v48);
    objc_msgSend_addCompletedHandler_(v18, v49, (uint64_t)&unk_270E33F88, v50);
  }
  objc_msgSend_commit(v18, v34, v35, v36);

  int v51 = 0;
LABEL_9:

  return v51;
}

- (int)renderWithLumaTex:(id)a3 chromaTex:(id)a4 gainMapTex:(id)a5 outputGainMapTex:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v16 = a6;
  shaders = self->_shaders;
  if (shaders
    && shaders->_ssRenderAdjustments
    && (objc_msgSend_commandQueue(self->_metalContext, v13, v14, v15),
        int v18 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v18, v19, v20, v21),
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        v18,
        v22))
  {
    objc_msgSend_encodeWaitForEvent_value_(v22, v23, (uint64_t)self->_sharedEvent, 2);
    uint64_t v27 = objc_msgSend_computeCommandEncoder(v22, v24, v25, v26);
    if (v27)
    {
      uint64_t v28 = (void *)v27;
      float v29 = self->_shaders->_ssRenderAdjustments;
      objc_msgSend_setComputePipelineState_(v28, v30, (uint64_t)v29, v31);
      objc_msgSend_setTexture_atIndex_(v28, v32, (uint64_t)v10, 0);
      objc_msgSend_setTexture_atIndex_(v28, v33, (uint64_t)v11, 1);
      objc_msgSend_setTexture_atIndex_(v28, v34, (uint64_t)v12, 2);
      objc_msgSend_setTexture_atIndex_(v28, v35, (uint64_t)v16, 3);
      objc_msgSend_setTexture_atIndex_(v28, v36, (uint64_t)self->_lightMapTex, 9);
      objc_msgSend_setTexture_atIndex_(v28, v37, (uint64_t)self->_fgbgMatteTex, 10);
      objc_msgSend_setTexture_atIndex_(v28, v38, (uint64_t)self->_skinMatteTex, 11);
      objc_msgSend_setTexture_atIndex_(v28, v39, (uint64_t)self->_skyMatteTex, 12);
      objc_msgSend_setBuffer_offset_atIndex_(v28, v40, (uint64_t)self->_paramsBuf, 0, 0);

      objc_msgSend_setImageblockWidth_height_(v28, v41, 32, 32);
      v73[0] = objc_msgSend_width(v10, v42, v43, v44);
      v73[1] = objc_msgSend_height(v10, v45, v46, v47);
      v73[2] = 1;
      int64x2_t v71 = vdupq_n_s64(0x20uLL);
      uint64_t v72 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v28, v48, (uint64_t)v73, (uint64_t)&v71);
      objc_msgSend_endEncoding(v28, v49, v50, v51);
      if (*MEMORY[0x263F00E10])
      {
        float v55 = objc_msgSend_commandQueue(v22, v52, v53, v54);
        uint64_t v59 = objc_msgSend_commandBuffer(v55, v56, v57, v58);

        objc_msgSend_setLabel_(v59, v60, @"KTRACE_MTLCMDBUF", v61);
        objc_msgSend_addCompletedHandler_(v59, v62, (uint64_t)&unk_270E33FA8, v63);
        objc_msgSend_commit(v59, v64, v65, v66);
        objc_msgSend_addCompletedHandler_(v22, v67, (uint64_t)&unk_270E33FC8, v68);
      }
      objc_msgSend_commit(v22, v52, v53, v54);

      int v69 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v69 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
  }

  return v69;
}

- (void)remapSliderValueForRendering
{
  uint64_t v5 = objc_msgSend_contents(self->_paramsBuf, a2, v2, v3);
  *(float *)(v5 + 24) = *(float *)(v5 + 24) * 1.2;
  id v9 = (float *)objc_msgSend_toneBiasRemap(self->_tuningParams, v6, v7, v8);
  if (v9)
  {
    float v10 = *(float *)(v5 + 24);
    float v11 = v9[1];
    if (v10 >= 0.0 || v10 <= v11)
    {
      if (v10 >= 0.0)
      {
        float v13 = v9[2];
        if (v10 < v13) {
          float v10 = *v9 + (float)((float)(v10 / v13) * (float)(v10 - *v9));
        }
      }
    }
    else
    {
      float v10 = v10 + (float)((float)((float)(v11 - v10) / v11) * (float)(*v9 - v10));
    }
    *(float *)(v5 + 24) = v10;
  }
}

- (int)runWithStyle:(id)a3 tuningParams:(id)a4 refFrameMetadata:(const frameMetadata *)a5 sceneType:(id)a6 lumaTex:(id)a7 chromaTex:(id)a8 gainMapTex:(id)a9 outputGainMapTex:(id)a10 personMaskTex:(id)a11 skinMaskTex:(id)a12 skyMaskTex:(id)a13 isLowLight:(BOOL)a14
{
  id v114 = a3;
  id v110 = a4;
  id v113 = a6;
  id v19 = a7;
  id v20 = a8;
  id v112 = a9;
  id v111 = a10;
  id v21 = a11;
  id v22 = a12;
  id v24 = a13;
  if (!v19)
  {
    uint64_t v107 = v108;
LABEL_29:
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
    objc_msgSend_releaseResources(self, v99, v100, v101, 0, v107);
    goto LABEL_26;
  }
  if (!v20)
  {
    uint64_t v107 = v108;
    goto LABEL_29;
  }
  uint64_t v25 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_label_(self, v23, 136, 0, @"ss_buf_params");
  paramsBuf = self->_paramsBuf;
  self->_paramsBuf = v25;

  if (!self->_paramsBuf)
  {
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
    objc_msgSend_releaseResources(self, v102, v103, v104, 0);
    goto LABEL_26;
  }
  float v115 = (float)(unint64_t)objc_msgSend_width(v19, v27, v28, v29);
  uint64_t v33 = objc_msgSend_height(v19, v30, v31, v32);
  v34.f32[0] = v115;
  v34.f32[1] = (float)(unint64_t)v33;
  float32x2_t v116 = v34;
  v35.f64[0] = a5->ROI.origin.x;
  float64_t v36 = sub_262FF6240(v35, a5->ROI.origin.y);
  v37.f64[0] = a5->ROI.size.width;
  *(double *)&float32x2_t v38 = sub_262FF6240(v37, a5->ROI.size.height);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v44 = vdiv_f32(_D1, vdiv_f32(v38, v116));
  uint64_t v48 = (float32x2_t *)objc_msgSend_contents(self->_paramsBuf, v45, v46, v47);
  *uint64_t v48 = vmul_f32(vdiv_f32(vneg_f32(*(float32x2_t *)&v36), v116), v44);
  v48[1] = v44;
  v48[2].i32[0] = LODWORD(a5->exposureParams.luxLevel);
  v48[2].i8[4] = a14;
  objc_msgSend_toneBias(v114, v49, v50, v51);
  v48[3].i32[0] = v52;
  objc_msgSend_warmthBias(v114, v53, v54, v55);
  v48[3].i32[1] = v56;
  id v57 = v113;
  if (objc_msgSend_isEqualToString_(v57, v58, *MEMORY[0x263F2F768], v59))
  {
    int v62 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v57, v60, *MEMORY[0x263F2F770], v61))
  {
    int v62 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v57, v63, *MEMORY[0x263F2F778], v64))
  {
    int v62 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v57, v65, *MEMORY[0x263F2F760], v66))
  {
    int v62 = 3;
  }
  else
  {
    int v62 = 0;
  }

  v48[4].i32[0] = v62;
  float32_t v67 = v48[3].f32[1] * 0.25 + 0.5;
  v48[3].f32[1] = v67;
  int64x2_t v71 = objc_msgSend_device(self->_metalContext, v68, v69, v70);
  uint64_t v75 = (MTLSharedEvent *)objc_msgSend_newSharedEvent(v71, v72, v73, v74);
  sharedEvent = self->_sharedEvent;
  self->_sharedEvent = v75;

  if (!self->_sharedEvent)
  {
    uint64_t v106 = v108;
    LODWORD(v105) = 0;
LABEL_33:
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
    goto LABEL_25;
  }
  objc_storeStrong((id *)&self->_tuningParams, a4);
  if (!self->_tuningParams)
  {
    uint64_t v106 = v108;
    LODWORD(v105) = 0;
    goto LABEL_33;
  }
  objc_msgSend_remapSliderValueForRendering(self, v77, v78, v79);
  if (dword_26B429788)
  {
    float v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v82 = objc_msgSend_calculateHistogramStatsWithLumaTex_chromaTex_(self, v80, (uint64_t)v19, (uint64_t)v20);
  if (v82)
  {
    int v97 = v82;
    uint64_t v106 = v108;
    LODWORD(v105) = v82;
LABEL_39:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_25;
  }
  int GuideImage = objc_msgSend_createGuideImage_(self, v83, (uint64_t)v19, v84);
  if (GuideImage)
  {
    int v97 = GuideImage;
    uint64_t v106 = v108;
    LODWORD(v105) = GuideImage;
    goto LABEL_39;
  }
  int v89 = objc_msgSend_upsampleLightMap(self, v86, v87, v88);
  if (v89)
  {
    int v97 = v89;
    uint64_t v106 = v108;
    LODWORD(v105) = v89;
    goto LABEL_39;
  }
  if (v21)
  {
    if (v22)
    {
      if (v24)
      {
        int v91 = objc_msgSend_processPersonMaskTex_skinMaskTex_skyMaskTex_(self, v90, (uint64_t)v21, (uint64_t)v22, v24);
        if (v91)
        {
          int v97 = v91;
          uint64_t v106 = v108;
          LODWORD(v105) = v91;
          goto LABEL_39;
        }
      }
    }
  }
  FigMetalDecRef();
  int v93 = objc_msgSend_renderWithLumaTex_chromaTex_gainMapTex_outputGainMapTex_(self, v92, (uint64_t)v19, (uint64_t)v20, v112, v111);
  int v97 = v93;
  if (v93)
  {
    uint64_t v106 = v108;
    LODWORD(v105) = v93;
    goto LABEL_39;
  }
LABEL_25:
  objc_msgSend_releaseResources(self, v94, v95, v96, v105, v106);
LABEL_26:

  return v97;
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