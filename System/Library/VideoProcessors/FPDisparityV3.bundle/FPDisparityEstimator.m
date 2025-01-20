@interface FPDisparityEstimator
- ($5E5F304956FB491AF6F034FDF0808287)H0Metadata;
- ($5E5F304956FB491AF6F034FDF0808287)H1Metadata;
- ($5E5F304956FB491AF6F034FDF0808287)V0Metadata;
- ($5E5F304956FB491AF6F034FDF0808287)V1Metadata;
- (CGRect)sensorCropRect;
- (CGRect)sensorReadoutRect;
- (CGRect)totalSensorCropRect;
- (CGSize)outputDisparityResolution;
- (FPDisparityEstimator)initWithMetalContext:(id)a3;
- (FPDisparityEstimator_Parameters)fpDisparityEstimatorParams;
- (MTLTexture)H0ImTexture;
- (MTLTexture)H1ImTexture;
- (MTLTexture)V0ImTexture;
- (MTLTexture)V1ImTexture;
- (MTLTexture)binaryLambdaTexture;
- (MTLTexture)segmentationConfidenceTexture;
- (MTLTexture)segmentationTexture;
- (NSArray)GChannelPyramid;
- (PyrGPU)imagePyramid;
- (id)CreateKernelWithConst:(id)a3 constants:(id)a4;
- (int)_allocateFPCostWorkBuffer:(id *)a3;
- (int)_computeCost:(id)a3 texGreenPixels:(id)a4 texOutputResU:(id)a5 texOutputHesU:(id)a6 level:(unsigned int)a7 resolutionScale:(float)a8;
- (int)_computeFocusPixelDisparityFromResolution:(FPDisparityEstimator *)self box_cstr_range:(SEL)a2 disparity_scaling_factor:(float)a3;
- (int)_costNCC:(id)a3 dynCfg:(id *)a4 texDisparityIn:(id)a5 texGreenPixelsIn:(id)a6 texFocusPixelsIn:(id)a7 texTcLrcOut:(id)a8 resolutionScale:(float)a9 level:(unsigned int)a10;
- (int)_debugInterpolate:(id)a3 texTcLrcIn:(id)a4 dynCfg:(id *)a5 debugBuf:(id)a6;
- (int)_doLocalRegularizationWithCommandBuffer:(id)a3 in_tex:(id)a4 level:(int)a5 parameters:(id)a6;
- (int)_filterHorz:(id)a3 texTcLrcIn:(id)a4 texTcLrcOut:(id)a5 dynCfg:(id *)a6;
- (int)_filterVert:(id)a3 texTcLrcIn:(id)a4 texTcLrcOut:(id)a5 dynCfg:(id *)a6;
- (int)_generateCorrectionMap;
- (int)_interpolateAndAccumulate:(id)a3 texTcLrcIn:(id)a4 dynCfg:(id *)a5;
- (int)_proximityOperator:(id)a3 dynCfg:(id *)a4 texDisparityIn:(id)a5 texOutputResUOut:(id)a6 texOutputHesUOut:(id)a7 level:(unsigned int)a8;
- (int)_setCorrectionMapCoefficients:(float *)a3;
- (int)_setupBuffer;
- (int)_setupFPPipelines;
- (int)_setupTexture;
- (int)allocateResources:(id *)a3;
- (int)computeFilterCurve:(float)a3 p3:(float)a4 array:(float *)a5;
- (int)estimateFocusPixelDisparityWithBox_cstr_range:(float)a3 disparity_scaling_factor:;
- (int)setOutputDisparity:(__CVBuffer *)a3;
- (unint64_t)computeAlignedSize:(unint64_t)a3 pixelFormat:(unint64_t)a4;
- (unsigned)imageAGC;
- (unsigned)quadraBinningFactor;
- (void)dealloc;
- (void)releaseResources;
- (void)setBinaryLambdaTexture:(id)a3;
- (void)setFpDisparityEstimatorParams:(id)a3;
- (void)setGChannelPyramid:(id)a3;
- (void)setH0ImTexture:(id)a3;
- (void)setH0Metadata:(id)a3;
- (void)setH1ImTexture:(id)a3;
- (void)setH1Metadata:(id)a3;
- (void)setImageAGC:(unsigned int)a3;
- (void)setImagePyramid:(id)a3;
- (void)setQuadraBinningFactor:(unsigned __int16)a3;
- (void)setSegmentationConfidenceTexture:(id)a3;
- (void)setSegmentationTexture:(id)a3;
- (void)setSensorCropRect:(CGRect)a3;
- (void)setSensorReadoutRect:(CGRect)a3;
- (void)setTotalSensorCropRect:(CGRect)a3;
- (void)setV0ImTexture:(id)a3;
- (void)setV0Metadata:(id)a3;
- (void)setV1ImTexture:(id)a3;
- (void)setV1Metadata:(id)a3;
@end

@implementation FPDisparityEstimator

- (FPDisparityEstimator)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FPDisparityEstimator;
  v6 = [(FPDisparityEstimator *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    uint64_t v10 = objc_msgSend_commandQueue(v5, v8, v9);
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v10;

    if (objc_msgSend__setupFPPipelines(v7, v12, v13))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      v14 = [TVL1_v3 alloc];
      uint64_t v16 = objc_msgSend_initWithMetalContext_(v14, v15, (uint64_t)v7->_mtlContext);
      tvl1Instance = v7->_tvl1Instance;
      v7->_tvl1Instance = (TVL1_v3 *)v16;

      if (!v7->_tvl1Instance
        || (v18 = [HBFGPU alloc],
            uint64_t v20 = objc_msgSend_initWithMetalContext_(v18, v19, (uint64_t)v7->_mtlContext),
            hbfgpuInstance = v7->_hbfgpuInstance,
            v7->_hbfgpuInstance = (HBFGPU *)v20,
            hbfgpuInstance,
            !v7->_hbfgpuInstance))
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        v7 = 0;
      }
    }
  }

  return v7;
}

- (int)allocateResources:(id *)a3
{
  v6.i64[0] = *(void *)&a3->var0;
  v6.i64[1] = HIDWORD(*(void *)&a3->var0);
  self->_outputDisparityResolution = (CGSize)vcvtq_f64_u64(v6);
  int Resources = objc_msgSend__setupBuffer(self, a2, (uint64_t)a3);
  if (Resources
    || (int Resources = objc_msgSend__setupTexture(self, v8, v9)) != 0
    || (objc_msgSend_setPyramidReference_(self->_tvl1Instance, v10, (uint64_t)self->_imagePyramid),
        (int Resources = objc_msgSend_allocateResources(self->_tvl1Instance, v11, v12)) != 0)
    || (int Resources = objc_msgSend__allocateFPCostWorkBuffer_(self, v13, (uint64_t)a3)) != 0)
  {
    int v18 = Resources;
    fig_log_get_emitter();
    FigDebugAssert3();
    objc_msgSend_releaseResources(self, v20, v21, 0);
  }
  else
  {
    if (LOBYTE(a3[23].var0))
    {
      objc_msgSend__setCorrectionMapCoefficients_(self, v14, (uint64_t)&a3[12]);
    }
    else
    {
      *(_OWORD *)&a3[12].var0 = 0u;
      v17 = a3 + 12;
      *(_OWORD *)&v17[7].var0 = 0u;
      *(_OWORD *)&v17[4].var0 = 0u;
      objc_msgSend__setCorrectionMapCoefficients_(self, v14, (uint64_t)v17);
    }
    objc_msgSend__generateCorrectionMap(self, v15, v16);
    return 0;
  }
  return v18;
}

- (int)_setupBuffer
{
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_res_pxbuf = PixelBuffer;
  if (PixelBuffer && (v4 = (__CVBuffer *)CreatePixelBuffer(), (self->_Hes_pxbuf = v4) != 0)) {
    return 0;
  }
  else {
    return -12786;
  }
}

- (int)_setupTexture
{
  uint64_t v4 = objc_msgSend_pyramidDimensions(self->_imagePyramid, a2, v2);
  if ((int)objc_msgSend_countScales(self->_imagePyramid, v5, v6) < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  for (i = (double *)(v4 + 8); ; i += 2)
  {
    double v10 = *(i - 1);
    double v11 = *i;
    uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v7, (uint64_t)self->_res_pxbuf, 25, 23, 0, v10, *i);
    uint64_t v13 = &self->super.isa + v8;
    Class v14 = v13[14];
    v13[14] = (Class)v12;

    if (!v13[14]) {
      break;
    }
    uint64_t v16 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v15, (uint64_t)self->_Hes_pxbuf, 25, 23, 0, v10, v11);
    Class v17 = v13[47];
    v13[47] = (Class)v16;

    if (!v13[47]) {
      break;
    }
    if (++v8 >= (int)objc_msgSend_countScales(self->_imagePyramid, v18, v19)) {
      return 0;
    }
  }
  return -12786;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlContext, a2, v2);
  objc_msgSend_releaseResources(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)FPDisparityEstimator;
  [(FPDisparityEstimator *)&v6 dealloc];
}

- (void)releaseResources
{
  objc_msgSend_releaseResources(self->_tvl1Instance, a2, v2);
  if ((int)objc_msgSend_countScales(self->_imagePyramid, v4, v5) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      v7 = &self->super.isa + v6;
      Class v8 = v7[14];
      v7[14] = 0;

      Class v9 = v7[47];
      v7[47] = 0;

      ++v6;
    }
    while (v6 < (int)objc_msgSend_countScales(self->_imagePyramid, v10, v11));
  }
  res_pxbuf = self->_res_pxbuf;
  if (res_pxbuf)
  {
    CFRelease(res_pxbuf);
    self->_res_pxbuf = 0;
  }
  Hes_pxbuf = self->_Hes_pxbuf;
  if (Hes_pxbuf)
  {
    CFRelease(Hes_pxbuf);
    self->_Hes_pxbuf = 0;
  }
  costsBuffer = self->_costsBuffer;
  self->_costsBuffer = 0;

  bufTcLrc1 = self->_bufTcLrc1;
  self->_bufTcLrc1 = 0;

  bufTcLrc2 = self->_bufTcLrc2;
  self->_bufTcLrc2 = 0;
}

- (int)_allocateFPCostWorkBuffer:(id *)a3
{
  uint64_t v6 = HIDWORD(*(void *)&a3->var0);
  uint64_t v7 = objc_msgSend_computeAlignedSize_pixelFormat_(self, a2, 16 * *(void *)&a3->var0, 125) * v6;
  double v10 = objc_msgSend_device(self->_mtlContext, v8, v9);
  uint64_t v12 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v10, v11, v7, 0);
  costsBuffer = self->_costsBuffer;
  self->_costsBuffer = v12;

  if (self->_costsBuffer)
  {
    if (a3[2].var0)
    {
      unint64_t v16 = 0;
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = *(void *)&a3[2 * v16 + 4].var0;
        uint64_t v19 = HIDWORD(v18);
        uint64_t v20 = objc_msgSend_computeAlignedSize_pixelFormat_(self, v14, 16 * v18, 125);
        if (v20 * v19 > v17) {
          unint64_t v17 = v20 * v19;
        }
        ++v16;
      }
      while (v16 < a3[2].var0);
    }
    else
    {
      unint64_t v17 = 0;
    }
    uint64_t v21 = objc_msgSend_device(self->_mtlContext, v14, v15);
    objc_super v23 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v21, v22, v17, 0);
    bufTcLrc1 = self->_bufTcLrc1;
    self->_bufTcLrc1 = v23;

    if (self->_bufTcLrc1)
    {
      v27 = objc_msgSend_device(self->_mtlContext, v25, v26);
      v29 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v27, v28, v17, 0);
      bufTcLrc2 = self->_bufTcLrc2;
      self->_bufTcLrc2 = v29;

      if (self->_bufTcLrc2) {
        return 0;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_computeFocusPixelDisparityFromResolution:(FPDisparityEstimator *)self box_cstr_range:(SEL)a2 disparity_scaling_factor:(float)a3
{
  float v6 = v5;
  float32x2_t v7 = v4;
  Class v8 = self;
  *(void *)v181 = 0;
  int v9 = objc_msgSend_countScales(self->_imagePyramid, a2, v3);
  uint64_t v154 = objc_msgSend_realPyramidDimensions(v8->_imagePyramid, v10, v11);
  uint64_t v14 = (v9 - 1);
  if (v9 < 1) {
    return 0;
  }
  uint64_t v15 = 0;
  double v16 = (double)LODWORD(a3);
  res_tex = v8->_res_tex;
  Hes_tex = v8->_Hes_tex;
  uint64_t v153 = (v9 - 1);
  v160 = v8;
  while (2)
  {
    uint64_t v19 = v15;
    uint64_t v20 = objc_msgSend_levelsParameters(v8->_fpDisparityEstimatorParams, v12, v13, v150, v151);
    v22 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, v14);

    v25 = objc_msgSend_solverParameters(v22, v23, v24);
    int v28 = objc_msgSend_warpings(v25, v26, v27);

    v31 = objc_msgSend_solverParameters(v22, v29, v30);
    unsigned int v161 = objc_msgSend_iterations(v31, v32, v33);

    v163 = v22;
    v36 = objc_msgSend_hbfParameters(v22, v34, v35);
    int v159 = objc_msgSend_scales(v36, v37, v38);

    v158 = objc_msgSend_textureRGBAU8AtScale_(v8->_imagePyramid, v39, v14);
    v157 = objc_msgSend_textureU32AliasAtScale_(v8->_imagePyramid, v40, v14);
    v42 = objc_msgSend_objectAtIndexedSubscript_(v8->_GChannelPyramid, v41, v14);
    v44 = objc_msgSend_objectAtIndexedSubscript_(v8->_GChannelPyramid, v43, 0);
    uint64_t v167 = objc_msgSend_height(v42, v45, v46);
    uint64_t v164 = objc_msgSend_height(v44, v47, v48);
    v162 = v42;
    uint64_t v51 = objc_msgSend_width(v42, v49, v50);
    v156 = v44;
    uint64_t v54 = objc_msgSend_width(v44, v52, v53);
    double v55 = *(double *)(v154 + 16 * v14);
    uint64_t v15 = objc_msgSend_commandBuffer(v8->_commandQueue, v56, v57);

    if (!v15) {
      goto LABEL_47;
    }
    unint64_t v155 = v54;
    if (v14 == v153)
    {
      int inited = objc_msgSend_doInitPrimalDualWithCommandBuffer_disparity_value_idx_swap_uv_idx_swap_p_level_(v8->_tvl1Instance, v58, (uint64_t)v15, v181[1], v181[0], 0.0);
      int v62 = v28;
      if (inited)
      {
        int v63 = inited;
        fig_log_get_emitter();
        v151 = v152;
        LODWORD(v150) = v63;
LABEL_46:
        FigDebugAssert3();
        goto LABEL_49;
      }
    }
    else
    {
      v64 = objc_msgSend_objectAtIndexedSubscript_(v8->_GChannelPyramid, v58, v14 + 1);
      float v67 = (float)(unint64_t)(objc_msgSend_width(v42, v65, v66) - 1);
      float v70 = v67 / (float)(unint64_t)(objc_msgSend_width(v64, v68, v69) - 1);
      objc_msgSend_height(v42, v71, v72);
      objc_msgSend_height(v64, v73, v74);
      *(float *)&double v75 = v70;
      int v77 = objc_msgSend_doUpscalePrimalDualWithCommandBuffer_idx_swap_uv_in_out_idx_swap_p_in_out_level_coeff_(v8->_tvl1Instance, v76, (uint64_t)v15, &v181[1], v181, v14, v75);
      if (v77)
      {
        int v63 = v77;
        fig_log_get_emitter();
        v151 = v152;
        LODWORD(v150) = v63;
        FigDebugAssert3();

        goto LABEL_49;
      }
      int v62 = v28;
    }
    v78 = objc_msgSend_regularizationParameters(v163, v60, v61);
    int v63 = objc_msgSend__doLocalRegularizationWithCommandBuffer_in_tex_level_parameters_(v8, v79, (uint64_t)v15, v158, v14, v78);

    if (v63)
    {
      fig_log_get_emitter();
      v151 = v152;
      LODWORD(v150) = v63;
      goto LABEL_46;
    }
    if (*MEMORY[0x263F00E10])
    {
      v82 = objc_msgSend_commandQueue(v15, v80, v81);
      v85 = objc_msgSend_commandBuffer(v82, v83, v84);

      objc_msgSend_setLabel_(v85, v86, @"KTRACE_MTLCMDBUF");
      v179[0] = MEMORY[0x263EF8330];
      v179[1] = 3221225472;
      v179[2] = sub_262EFD788;
      v179[3] = &unk_2655C0AB8;
      int v180 = v14;
      objc_msgSend_addCompletedHandler_(v85, v87, (uint64_t)v179);
      objc_msgSend_commit(v85, v88, v89);
      v177[0] = MEMORY[0x263EF8330];
      v177[1] = 3221225472;
      v177[2] = sub_262EFD7BC;
      v177[3] = &unk_2655C0AB8;
      int v178 = v14;
      objc_msgSend_addCompletedHandler_(v15, v90, (uint64_t)v177);
    }
    objc_msgSend_commit(v15, v80, v81);
    if (v62 < 1)
    {
      v102 = v15;
LABEL_26:
      if (v159 < 1)
      {
        int v63 = 0;
        int v146 = 1;
        uint64_t v15 = v102;
LABEL_34:
        v147 = v156;
        goto LABEL_35;
      }
      uint64_t v15 = objc_msgSend_commandBuffer(v8->_commandQueue, v91, v92);

      if (v15)
      {
        v126 = objc_msgSend_hbfParameters(v163, v124, v125);
        objc_msgSend_setParams_(v8->_hbfgpuInstance, v127, (uint64_t)v126);

        v129 = objc_msgSend_textureUVAtLevel_idx_swap_uv_(v8->_tvl1Instance, v128, v14, v181[1]);
        objc_msgSend_textureUVAtLevel_idx_swap_uv_(v8->_tvl1Instance, v130, v14, v181[1] ^ 1);
        v132 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        LODWORD(v133) = 1.0;
        uv_tex_user_ref = v132;
        if (!v14)
        {
          uv_tex_user_ref = v8->_uv_tex_user_ref;
          *(float *)&double v133 = v6;
        }
        objc_msgSend_doFilterWithCommandBuffer_in_I_tex_in_J_u32_tex_in_W_tex_out_tex_disparity_scaling_factor_(v8->_hbfgpuInstance, v131, (uint64_t)v15, v129, v157, 0, uv_tex_user_ref, v133);
        v181[1] ^= 1u;
        if (*MEMORY[0x263F00E10])
        {
          v137 = objc_msgSend_commandQueue(v15, v135, v136);
          v140 = objc_msgSend_commandBuffer(v137, v138, v139);

          objc_msgSend_setLabel_(v140, v141, @"KTRACE_MTLCMDBUF");
          v171[0] = MEMORY[0x263EF8330];
          v171[1] = 3221225472;
          v171[2] = sub_262EFD970;
          v171[3] = &unk_2655C0AB8;
          int v172 = v14;
          objc_msgSend_addCompletedHandler_(v140, v142, (uint64_t)v171);
          objc_msgSend_commit(v140, v143, v144);
          v169[0] = MEMORY[0x263EF8330];
          v169[1] = 3221225472;
          v169[2] = sub_262EFD9A4;
          v169[3] = &unk_2655C0AB8;
          int v170 = v14;
          objc_msgSend_addCompletedHandler_(v15, v145, (uint64_t)v169);
        }
        objc_msgSend_commit(v15, v135, v136);

        int v63 = 0;
        int v146 = 1;
        goto LABEL_34;
      }
LABEL_47:
      fig_log_get_emitter();
      v151 = v152;
      LODWORD(v150) = 0;
      FigDebugAssert3();
      int v63 = FigSignalErrorAt();
LABEL_49:
      int v146 = 0;
      goto LABEL_34;
    }
    float v93 = (float)((float)((float)((float)(unint64_t)v167 + -1.0) / (float)((float)(unint64_t)v164 + -1.0))
                + (float)((float)((float)(unint64_t)v51 + -1.0) / (float)((float)v155 + -1.0)))
        * 0.5;
    float v94 = v55 / v16;
    double v95 = COERCE_DOUBLE(vmul_n_f32(v7, v94));
    while (1)
    {
      v96 = objc_msgSend_textureUVAtLevel_idx_swap_uv_(v8->_tvl1Instance, v91, v14, v181[1]);
      *(float *)&double v97 = v93;
      int v99 = objc_msgSend__computeCost_texGreenPixels_texOutputResU_texOutputHesU_level_resolutionScale_(v8, v98, (uint64_t)v96, v162, res_tex[v14], Hes_tex[v14], v14, v97);
      if (v99)
      {
        int v63 = v99;
        fig_log_get_emitter();
        v151 = v152;
        LODWORD(v150) = v63;
        FigDebugAssert3();
LABEL_41:
        v147 = v156;
        goto LABEL_43;
      }
      v102 = objc_msgSend_commandBuffer(v8->_commandQueue, v100, v101);

      if (!v102)
      {
        fig_log_get_emitter();
        v151 = v152;
        LODWORD(v150) = 0;
        FigDebugAssert3();
        int v63 = FigSignalErrorAt();
        uint64_t v15 = 0;
        goto LABEL_41;
      }
      v105 = 0;
      float v106 = 1.0;
      int v165 = v62;
      v168 = v96;
      if (!v14 && v62 == 1 && v159 <= 0)
      {
        v105 = v8->_uv_tex_user_ref;
        float v106 = v6;
      }
      tvl1Instance = v8->_tvl1Instance;
      v108 = res_tex;
      v109 = res_tex[v14];
      v110 = Hes_tex[v14];
      v151 = objc_msgSend_solverParameters(v163, v103, v104);
      unint64_t v150 = __PAIR64__(v161, v14);
      *(float *)&double v111 = v106;
      int v63 = objc_msgSend_doSolveChambollePrimalDualWithCommandBuffer_idx_swap_uv_in_out_idx_swap_p_in_out_in_res_tes_in_hes_tes_out_uv_tex_level_iterations_box_cstr_range_disparity_scaling_factor_parameters_(tvl1Instance, v112, (uint64_t)v102, &v181[1], v181, v109, v110, v105, v95, v111);

      if (v63) {
        break;
      }
      if (*MEMORY[0x263F00E10])
      {
        v115 = objc_msgSend_commandQueue(v102, v113, v114);
        v118 = objc_msgSend_commandBuffer(v115, v116, v117);

        objc_msgSend_setLabel_(v118, v119, @"KTRACE_MTLCMDBUF");
        v175[0] = MEMORY[0x263EF8330];
        v175[1] = 3221225472;
        v175[2] = sub_262EFD87C;
        v175[3] = &unk_2655C0AB8;
        int v176 = v14;
        objc_msgSend_addCompletedHandler_(v118, v120, (uint64_t)v175);
        objc_msgSend_commit(v118, v121, v122);
        v173[0] = MEMORY[0x263EF8330];
        v173[1] = 3221225472;
        v173[2] = sub_262EFD8B0;
        v173[3] = &unk_2655C0AB8;
        int v174 = v14;
        objc_msgSend_addCompletedHandler_(v102, v123, (uint64_t)v173);
      }
      objc_msgSend_commit(v102, v113, v114);

      uint64_t v15 = v102;
      --v62;
      res_tex = v108;
      Class v8 = v160;
      if (v165 == 1) {
        goto LABEL_26;
      }
    }
    fig_log_get_emitter();
    v151 = v152;
    LODWORD(v150) = v63;
    FigDebugAssert3();
    uint64_t v15 = v102;
    res_tex = v108;
    Class v8 = v160;
    v147 = v156;
    v96 = v168;
LABEL_43:

    int v146 = 0;
LABEL_35:

    if (v146)
    {
      if (v14-- > 0) {
        continue;
      }
    }
    break;
  }

  return v63;
}

- (int)setOutputDisparity:(__CVBuffer *)a3
{
  if (a3)
  {
    if (CVPixelBufferGetWidth(a3) == (int)self->_outputDisparityResolution.width
      && CVPixelBufferGetHeight(a3) == (int)self->_outputDisparityResolution.height)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v5, (uint64_t)a3, 25, 22, 0, self->_outputDisparityResolution.width);
      float v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      uv_tex_user_ref = self->_uv_tex_user_ref;
      self->_uv_tex_user_ref = v6;

      if (self->_uv_tex_user_ref) {
        return 0;
      }
      else {
        return -12786;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12780;
    }
  }
  else
  {
    int v9 = self->_uv_tex_user_ref;
    self->_uv_tex_user_ref = 0;

    return 0;
  }
}

- (int)estimateFocusPixelDisparityWithBox_cstr_range:(float)a3 disparity_scaling_factor:
{
  int v5 = v4;
  double v6 = *(double *)&a3;
  float64_t v17 = *(double *)objc_msgSend_pyramidDimensions(self->_imagePyramid, a2, v3);
  uint64_t v10 = objc_msgSend_pyramidDimensions(self->_imagePyramid, v8, v9);
  v11.f64[0] = v17;
  v11.f64[1] = *(float64_t *)(v10 + 8);
  LODWORD(v12) = v5;
  int v15 = objc_msgSend__computeFocusPixelDisparityFromResolution_box_cstr_range_disparity_scaling_factor_(self, v13, v14, COERCE_DOUBLE(vmovn_s64((int64x2_t)vcvtq_u64_f64(vrndmq_f64(v11)))), v6, v12);
  if (v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v15;
}

- (int)_setupFPPipelines
{
  objc_msgSend_CreateKernelWithConst_constants_(self, a2, @"costNCC", 0);
  uint64_t v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  costNCCPipelineState = self->_costNCCPipelineState;
  self->_costNCCPipelineState = v3;

  if (self->_costNCCPipelineState)
  {
    objc_msgSend_CreateKernelWithConst_constants_(self, v5, @"filterVert", 0);
    double v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    filterVertPipelineState = self->_filterVertPipelineState;
    self->_filterVertPipelineState = v6;

    if (self->_filterVertPipelineState)
    {
      objc_msgSend_CreateKernelWithConst_constants_(self, v8, @"filterHorz", 0);
      uint64_t v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      filterHorzPipelineState = self->_filterHorzPipelineState;
      self->_filterHorzPipelineState = v9;

      if (self->_filterHorzPipelineState)
      {
        objc_msgSend_CreateKernelWithConst_constants_(self, v11, @"interpolateAndSet", 0);
        double v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        interpolateAndSetPipelineState = self->_interpolateAndSetPipelineState;
        self->_interpolateAndSetPipelineState = v12;

        if (self->_interpolateAndSetPipelineState)
        {
          objc_msgSend_CreateKernelWithConst_constants_(self, v14, @"interpolateAndAccum", 0);
          int v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          interpolateAndAccumPipelineState = self->_interpolateAndAccumPipelineState;
          self->_interpolateAndAccumPipelineState = v15;

          if (self->_interpolateAndAccumPipelineState)
          {
            objc_msgSend_CreateKernelWithConst_constants_(self, v17, @"proximityOperator", 0);
            uint64_t v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
            proximityOperatorPipelineState = self->_proximityOperatorPipelineState;
            self->_proximityOperatorPipelineState = v18;

            if (self->_proximityOperatorPipelineState)
            {
              objc_msgSend_CreateKernelWithConst_constants_(self, v20, @"fdp_local_regularization_kernel", 0);
              uint64_t v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
              regularizationPipelineState = self->_regularizationPipelineState;
              self->_regularizationPipelineState = v21;

              if (self->_regularizationPipelineState)
              {
                objc_msgSend_CreateKernelWithConst_constants_(self, v23, @"correction_map_generation_kernel", 0);
                uint64_t v24 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
                correctionMapGenerationPipelineState = self->_correctionMapGenerationPipelineState;
                self->_correctionMapGenerationPipelineState = v24;

                if (self->_correctionMapGenerationPipelineState) {
                  return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_doLocalRegularizationWithCommandBuffer:(id)a3 in_tex:(id)a4 level:(int)a5 parameters:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v10 = a4;
  unint64_t v94 = 0;
  uint64_t v95 = 0;
  id v11 = a6;
  id v12 = a3;
  objc_msgSend_alpha(v11, v13, v14);
  v92[0] = v15;
  objc_msgSend_beta(v11, v16, v17);
  v92[1] = v18;
  objc_msgSend_gain(v11, v19, v20);
  v92[2] = v21;
  objc_msgSend_offset(v11, v22, v23);
  v92[3] = v24;
  objc_msgSend_segmentation_bias_foreground(v11, v25, v26);
  v92[4] = v27;
  objc_msgSend_segmentation_bias_background(v11, v28, v29);
  int v31 = v30;

  v92[5] = v31;
  CGFloat width = self->_outputDisparityResolution.width;
  uint64_t v34 = objc_msgSend_width(v10, v32, v33);
  v35.f64[0] = width;
  v35.f64[1] = self->_outputDisparityResolution.height;
  __asm { FMOV            V0.2D, #-1.0 }
  float32x2_t v41 = vcvt_f32_f64(vaddq_f64(v35, _Q0));
  uint64_t v44 = objc_msgSend_height(v10, v42, v43);
  v45.i64[0] = v34;
  v45.i64[1] = v44;
  v46.i64[0] = -1;
  v46.i64[1] = -1;
  float32x2_t v47 = vdiv_f32(v41, vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v45, v46))));
  uint64_t v50 = objc_msgSend_width(self->_segmentationTexture, v48, v49);
  float v51 = self->_outputDisparityResolution.width;
  *(float *)&CGFloat width = (float)(unint64_t)v50 / v51;
  uint64_t v54 = objc_msgSend_height(self->_segmentationTexture, v52, v53);
  float height = self->_outputDisparityResolution.height;
  float32x2_t v93 = v47;
  unint64_t v94 = __PAIR64__((float)(unint64_t)v54 / height, LODWORD(width));
  uint64_t v57 = objc_msgSend_textureRaAtLevel_(self->_tvl1Instance, v56, v7);
  v59 = objc_msgSend_textureRbAtLevel_(self->_tvl1Instance, v58, v7);
  uint64_t v61 = objc_msgSend_textureRdAtLevel_(self->_tvl1Instance, v60, v7);
  int v62 = self->_regularizationPipelineState;
  v65 = objc_msgSend_computeCommandEncoder(v12, v63, v64);

  if (v65)
  {
    objc_msgSend_setComputePipelineState_(v65, v66, (uint64_t)v62);
    objc_msgSend_setTexture_atIndex_(v65, v67, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v65, v68, (uint64_t)self->_segmentationTexture, 1);
    objc_msgSend_setTexture_atIndex_(v65, v69, (uint64_t)self->_segmentationConfidenceTexture, 2);
    objc_msgSend_setTexture_atIndex_(v65, v70, (uint64_t)v57, 3);
    objc_msgSend_setTexture_atIndex_(v65, v71, (uint64_t)v59, 4);
    objc_msgSend_setTexture_atIndex_(v65, v72, (uint64_t)v61, 5);
    objc_msgSend_setBytes_length_atIndex_(v65, v73, (uint64_t)v92, 48, 0);
    unint64_t v76 = objc_msgSend_threadExecutionWidth(v62, v74, v75);
    unint64_t v79 = objc_msgSend_maxTotalThreadsPerThreadgroup(v62, v77, v78) / v76;
    v91[0] = objc_msgSend_width(v10, v80, v81);
    v91[1] = objc_msgSend_height(v10, v82, v83);
    v91[2] = 1;
    v90[0] = v76;
    v90[1] = v79;
    v90[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v65, v84, (uint64_t)v91, v90);
    objc_msgSend_endEncoding(v65, v85, v86);
    int v87 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
  }

  return v87;
}

- (int)_computeCost:(id)a3 texGreenPixels:(id)a4 texOutputResU:(id)a5 texOutputHesU:(id)a6 level:(unsigned int)a7 resolutionScale:(float)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  unsigned int v19 = objc_msgSend_width(v13, v17, v18);
  int v174 = v13;
  unsigned int v22 = objc_msgSend_height(v13, v20, v21);
  LODWORD(a5) = v22;
  v190[0] = __PAIR64__(v22, v19);
  unsigned int v25 = objc_msgSend_width(v14, v23, v24);
  v190[1] = __PAIR64__(objc_msgSend_height(v14, v26, v27), v25);
  uint64_t v29 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v28, 25, v19, a5, 0);
  v32 = v29;
  if (!v29)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v166 = FigSignalErrorAt();
    goto LABEL_28;
  }
  id v170 = v16;
  id v171 = v15;
  uint64_t v33 = objc_msgSend_usage(v29, v30, v31);
  objc_msgSend_setUsage_(v32, v34, v33 | 3);
  DWORD1(v192) = (unint64_t)objc_msgSend_computeAlignedSize_pixelFormat_(self, v35, 16 * v19, 125) >> 2;
  v37 = objc_msgSend_objectAtIndexedSubscript_(self->_GChannelPyramid, v36, 0);
  uint64_t v40 = objc_msgSend_width(v14, v38, v39);
  uint64_t v43 = objc_msgSend_width(v37, v41, v42);
  uint64_t v46 = objc_msgSend_height(v14, v44, v45);
  uint64_t v49 = objc_msgSend_height(v37, v47, v48);
  unsigned int v52 = objc_msgSend_width(v37, v50, v51);
  *(void *)&long long v191 = __PAIR64__(objc_msgSend_height(v37, v53, v54), v52);
  uint64_t v57 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v55, v56);
  objc_msgSend_microlensSpatialOffset(v57, v58, v59);
  float v61 = v60;

  uint64_t v64 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v62, v63);
  int v67 = objc_msgSend_nView(v64, v65, v66);

  if (!v67)
  {
    v110 = 0;
    v177 = 0;
    unint64_t v150 = 0;
LABEL_23:
    uint64_t v151 = objc_msgSend_commandBuffer(self->_commandQueue, v68, v69);
    id v16 = v170;
    id v15 = v171;
    if (v151)
    {
      uint64_t v153 = (void *)v151;
      int v154 = objc_msgSend__proximityOperator_dynCfg_texDisparityIn_texOutputResUOut_texOutputHesUOut_level_(self, v152, v151, v190, v174, v171, v170, a7);
      if (!v154)
      {
        if (*MEMORY[0x263F00E10])
        {
          v157 = objc_msgSend_commandQueue(v153, v155, v156);
          objc_msgSend_commandBuffer(v157, v158, v159);
          v160 = v179 = v150;

          objc_msgSend_setLabel_(v160, v161, @"KTRACE_MTLCMDBUF");
          v182[0] = MEMORY[0x263EF8330];
          v182[1] = 3221225472;
          v182[2] = sub_262EFF2D0;
          v182[3] = &unk_2655C0AB8;
          unsigned int v183 = a7;
          objc_msgSend_addCompletedHandler_(v160, v162, (uint64_t)v182);
          objc_msgSend_commit(v160, v163, v164);
          v180[0] = MEMORY[0x263EF8330];
          v180[1] = 3221225472;
          v180[2] = sub_262EFF304;
          v180[3] = &unk_2655C0AB8;
          unsigned int v181 = a7;
          objc_msgSend_addCompletedHandler_(v153, v165, (uint64_t)v180);

          unint64_t v150 = v179;
        }
        objc_msgSend_commit(v153, v155, v156);

        int v166 = 0;
        goto LABEL_28;
      }
      int v166 = v154;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v166 = FigSignalErrorAt();
    }
    goto LABEL_28;
  }
  v169 = v37;
  id v173 = v14;
  unsigned int v70 = 0;
  v71 = 0;
  int v178 = 0;
  uint64_t v72 = 0;
  v73 = 0;
  float v74 = (float)(unint64_t)(v40 - 1) / (float)(unint64_t)(v43 - 1);
  float v75 = (float)(unint64_t)(v46 - 1) / (float)(unint64_t)(v49 - 1);
  int v172 = v32;
  while (1)
  {
    int v176 = v72;
    if (v70 == 3)
    {
      p_V1Metadata = &self->_V1Metadata;
      p_V1ImTexture = &self->_V1ImTexture;
      float v81 = 0.0;
      p_xRawBase = &self->_V1Metadata.xRawBase;
      p_yRawStep = &self->_V1Metadata.yRawStep;
      p_yRawBase = &self->_V1Metadata.yRawBase;
    }
    else if (v70 == 2)
    {
      p_V1Metadata = &self->_V0Metadata;
      p_V1ImTexture = &self->_V0ImTexture;
      float v81 = 0.0;
      p_xRawBase = &self->_V0Metadata.xRawBase;
      p_yRawStep = &self->_V0Metadata.yRawStep;
      p_yRawBase = &self->_V0Metadata.yRawBase;
    }
    else
    {
      p_V1Metadata = &self->_H0Metadata;
      p_V1ImTexture = &self->_H0ImTexture;
      p_xRawBase = &self->_H0Metadata.xRawBase;
      p_yRawStep = &self->_H0Metadata.yRawStep;
      p_yRawBase = &self->_H0Metadata.yRawBase;
      float v81 = v61;
      if (v70 == 1)
      {
        p_V1Metadata = &self->_H1Metadata;
        p_V1ImTexture = &self->_H1ImTexture;
        p_xRawBase = &self->_H1Metadata.xRawBase;
        p_yRawStep = &self->_H1Metadata.yRawStep;
        p_yRawBase = &self->_H1Metadata.yRawBase;
        float v81 = -v61;
      }
    }
    v82 = *p_V1ImTexture;
    unsigned int v83 = *p_yRawBase;
    unsigned int v84 = *p_yRawStep;
    unsigned int xRawStep = p_V1Metadata->xRawStep;
    LODWORD(v192) = v70;
    unsigned int v86 = *p_xRawBase;
    unsigned int v89 = objc_msgSend_width(v82, v87, v88);
    *((void *)&v191 + 1) = __PAIR64__(objc_msgSend_height(v82, v90, v91), v89);
    DWORD2(v192) = xRawStep;
    *((float *)&v192 + 3) = v81 + (float)v86;
    *(void *)&long long v193 = __PAIR64__(v84, LODWORD(v74));
    *((void *)&v193 + 1) = __PAIR64__(LODWORD(v75), v83);
    v32 = v172;
    objc_msgSend_setPixelFormat_(v172, v92, 125);
    uint64_t v95 = objc_msgSend_width(v82, v93, v94);
    objc_msgSend_setWidth_(v172, v96, v95);
    uint64_t v99 = objc_msgSend_height(v82, v97, v98);
    objc_msgSend_setHeight_(v172, v100, v99);
    uint64_t v103 = 16 * objc_msgSend_width(v82, v101, v102);
    uint64_t v106 = objc_msgSend_pixelFormat(v172, v104, v105);
    uint64_t v108 = objc_msgSend_computeAlignedSize_pixelFormat_(self, v107, v103, v106);
    v110 = objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_bufTcLrc1, v109, (uint64_t)v172, 0, v108);

    if (!v110)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v166 = FigSignalErrorAt();

      uint64_t v72 = v176;
      v71 = v178;
      id v14 = v173;
      goto LABEL_35;
    }
    uint64_t v72 = objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_bufTcLrc2, v111, (uint64_t)v172, 0, v108);

    id v14 = v173;
    if (!v72)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v166 = FigSignalErrorAt();
      uint64_t v72 = v178;
      goto LABEL_35;
    }
    objc_msgSend_setPixelFormat_(v172, v112, 115);
    uint64_t v115 = 8 * objc_msgSend_width(v82, v113, v114);
    uint64_t v118 = objc_msgSend_pixelFormat(v172, v116, v117);
    uint64_t v120 = objc_msgSend_computeAlignedSize_pixelFormat_(self, v119, v115, v118);
    uint64_t v122 = objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_bufTcLrc1, v121, (uint64_t)v172, 0, v120);

    if (!v122)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v166 = FigSignalErrorAt();
      goto LABEL_35;
    }
    uint64_t v125 = (void *)v122;
    v126 = objc_msgSend_commandBuffer(self->_commandQueue, v123, v124);

    if (!v126)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v166 = FigSignalErrorAt();
      goto LABEL_34;
    }
    v71 = v126;
    LODWORD(v168) = a7;
    *(float *)&double v128 = a8;
    int v129 = objc_msgSend__costNCC_dynCfg_texDisparityIn_texGreenPixelsIn_texFocusPixelsIn_texTcLrcOut_resolutionScale_level_(self, v127, (uint64_t)v126, v190, v174, v173, v82, v110, v128, v168);
    if (v129) {
      break;
    }
    int v129 = objc_msgSend__filterVert_texTcLrcIn_texTcLrcOut_dynCfg_(self, v130, (uint64_t)v126, v110, v72, v190);
    if (v129) {
      break;
    }
    int v129 = objc_msgSend__filterHorz_texTcLrcIn_texTcLrcOut_dynCfg_(self, v131, (uint64_t)v126, v72, v125, v190);
    if (v129) {
      break;
    }
    int v129 = objc_msgSend__interpolateAndAccumulate_texTcLrcIn_dynCfg_(self, v132, (uint64_t)v126, v125, v190);
    if (v129) {
      break;
    }
    int v178 = v125;
    if (*MEMORY[0x263F00E10])
    {
      v135 = objc_msgSend_commandQueue(v126, v133, v134);
      v138 = objc_msgSend_commandBuffer(v135, v136, v137);

      objc_msgSend_setLabel_(v138, v139, @"KTRACE_MTLCMDBUF");
      v187[0] = MEMORY[0x263EF8330];
      v187[1] = 3221225472;
      v187[2] = sub_262EFF1E4;
      v187[3] = &unk_2655C0AD8;
      unsigned int v188 = a7;
      unsigned int v189 = v70;
      objc_msgSend_addCompletedHandler_(v138, v140, (uint64_t)v187);
      objc_msgSend_commit(v138, v141, v142);
      v184[0] = MEMORY[0x263EF8330];
      v184[1] = 3221225472;
      v184[2] = sub_262EFF214;
      v184[3] = &unk_2655C0AD8;
      unsigned int v185 = a7;
      unsigned int v186 = v70;
      objc_msgSend_addCompletedHandler_(v71, v143, (uint64_t)v184);
    }
    objc_msgSend_commit(v71, v133, v134);

    ++v70;
    int v146 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v144, v145);
    unsigned int v149 = objc_msgSend_nView(v146, v147, v148);

    v73 = v110;
    if (v70 >= v149)
    {
      v177 = v72;

      id v14 = v173;
      v37 = v169;
      unint64_t v150 = v178;
      goto LABEL_23;
    }
  }
  int v166 = v129;
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_34:
  v71 = v125;
LABEL_35:

  id v16 = v170;
  id v15 = v171;
LABEL_28:

  return v166;
}

- (int)_costNCC:(id)a3 dynCfg:(id *)a4 texDisparityIn:(id)a5 texGreenPixelsIn:(id)a6 texFocusPixelsIn:(id)a7 texTcLrcOut:(id)a8 resolutionScale:(float)a9 level:(unsigned int)a10
{
  uint64_t v233 = *MEMORY[0x263EF8340];
  id v216 = a5;
  id v17 = a6;
  id v215 = a7;
  id v18 = a8;
  long long v231 = 0u;
  *(_OWORD *)v232[0].f32 = 0u;
  long long v230 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  long long v225 = 0u;
  id v19 = a3;
  uint64_t v22 = objc_msgSend_width(v17, v20, v21);
  uint64_t v25 = objc_msgSend_height(v17, v23, v24);
  v26.i64[0] = v22;
  v26.i64[1] = v25;
  v27.i64[0] = -1;
  v27.i64[1] = -1;
  *(float32x2_t *)&long long v229 = vmul_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v26, v27))), (float32x2_t)0x3F0000003F000000);
  int v30 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v28, v29);
  objc_msgSend_lensFieldCurvatureA0(v30, v31, v32);
  LODWORD(v230) = v33;

  v36 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v34, v35);
  objc_msgSend_lensFieldCurvatureA1(v36, v37, v38);
  DWORD1(v230) = v39;

  uint64_t v42 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v40, v41);
  objc_msgSend_lensFieldCurvatureA2(v42, v43, v44);
  DWORD2(v230) = v45;

  uint64_t v48 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v46, v47);
  objc_msgSend_lensFieldCurvatureA3(v48, v49, v50);
  HIDWORD(v230) = v51;

  uint64_t v54 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v52, v53);
  objc_msgSend_lensFieldCurvatureA4(v54, v55, v56);
  LODWORD(v231) = v57;

  float v60 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v58, v59);
  objc_msgSend_circleOfConfusionGain(v60, v61, v62);
  DWORD1(v231) = v63;

  uint64_t v66 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v64, v65);
  objc_msgSend_circleOfConfusionOffset(v66, v67, v68);
  *((void *)&v231 + 1) = __PAIR64__(LODWORD(a9), v69);

  if (objc_msgSend_quadraBinningFactor(self, v70, v71) == 2) {
    unsigned int v74 = 2;
  }
  else {
    unsigned int v74 = 1;
  }
  if (objc_msgSend_quadraBinningFactor(self, v72, v73)) {
    unsigned int v77 = 2;
  }
  else {
    unsigned int v77 = 1;
  }
  objc_msgSend_sensorCropRect(self, v75, v76);
  int v79 = (int)v78;
  objc_msgSend_sensorCropRect(self, v80, v81);
  v82.i32[0] = v79;
  v82.i32[1] = (int)v83;
  int32x2_t v220 = v82;
  objc_msgSend_sensorReadoutRect(self, v84, v85);
  int v87 = (int)v86;
  objc_msgSend_sensorReadoutRect(self, v88, v89);
  v90.i32[0] = v87;
  v90.i32[1] = (int)v91;
  int32x2_t v218 = v90;
  objc_msgSend_totalSensorCropRect(self, v92, v93);
  int v95 = (int)v94;
  objc_msgSend_totalSensorCropRect(self, v96, v97);
  v98.i32[0] = v95;
  v98.i32[1] = (int)v99;
  int32x2_t v217 = v98;
  objc_msgSend_totalSensorCropRect(self, v100, v101);
  int v103 = (int)v102;
  objc_msgSend_totalSensorCropRect(self, v104, v105);
  v106.i32[0] = v103;
  v106.i32[1] = (int)v107;
  int32x2_t v108 = vdup_n_s32(v74);
  int8x8_t v221 = (int8x8_t)vmla_s32(v220, vadd_s32(v217, v218), v108);
  int8x8_t v109 = (int8x8_t)vmul_s32(v106, v108);
  WORD5(v229) = (v221.i32[1] & 0xFFF0FFFF) / v77;
  WORD4(v229) = (v221.i32[0] & 0xFFF0FFFF) / v77;
  HIWORD(v229) = (v109.i32[1] & 0xFFFCFFFF) / v77;
  WORD6(v229) = (v109.i32[0] & 0xFFFCFFFF) / v77;
  v112 = objc_msgSend_levelsParameters(self->_fpDisparityEstimatorParams, v110, v111);
  uint64_t v114 = objc_msgSend_objectAtIndexedSubscript_(v112, v113, a10);
  uint64_t v117 = objc_msgSend_costParameters(v114, v115, v116);
  objc_msgSend_step(v117, v118, v119);
  float v219 = v120;

  if (self->_disparityCorrectionTex)
  {
    v123 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v121, v122);
    objc_msgSend_AGCHigh(v123, v124, v125);
    float v127 = v126;
    v130 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v128, v129);
    objc_msgSend_AGCLow(v130, v131, v132);
    float v134 = v127 - v133;

    if (v134 > 0.0)
    {
      float imageAGC = (float)self->_imageAGC;
      uint64_t v136 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v121, v122);
      objc_msgSend_AGCLow(v136, v137, v138);
      float v140 = fminf((float)(imageAGC - v139) / v134, 1.0);

      v143 = objc_msgSend_levelsParameters(self->_fpDisparityEstimatorParams, v141, v142);
      uint64_t v145 = objc_msgSend_objectAtIndexedSubscript_(v143, v144, a10);
      uint64_t v148 = objc_msgSend_costParameters(v145, v146, v147);
      objc_msgSend_stepLowlight(v148, v149, v150);
      float v219 = v219 + (float)(v140 * (float)(v151 - v219));
    }
  }
  LODWORD(v152) = a4[1].var2.var0.var0;
  *(float *)&uint64_t v153 = a4[1].var2.var0.var1;
  HIDWORD(v152) = a4[1].var2.var1.var0;
  *((float *)&v153 + 1) = (float)a4[1].var2.var1.var1;
  *(void *)&long long v225 = v152;
  *((void *)&v225 + 1) = v153;
  float32x2_t v154 = vcvt_f32_u32((uint32x2_t)vadd_s32(*(int32x2_t *)&a4->var0, (int32x2_t)0x100000001));
  int8x8_t v155 = (int8x8_t)vdup_n_s32(0x4B400000u);
  float32x2_t v156 = (float32x2_t)vdup_n_s32(0xCB400000);
  float32x2_t v157 = vadd_f32(vadd_f32((float32x2_t)vorr_s8(vand_s8(v221, (int8x8_t)0xFFFF0000FFFFLL), v155), v156), (float32x2_t)0xBF000000BF000000);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v163 = vadd_f32(vadd_f32((float32x2_t)vorr_s8(vand_s8(v109, (int8x8_t)0xFFFF0000FFFFLL), v155), v156), _D1);
  uint64_t v164 = objc_msgSend_width(v18, v121, v122);
  uint64_t v167 = objc_msgSend_height(v18, v165, v166);
  v168.i64[0] = v164;
  v168.i64[1] = v167;
  float32x2_t v169 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v168, vdupq_n_s64(1uLL))));
  if (objc_msgSend_quadraBinningFactor(self, v170, v171)) {
    unsigned int v174 = 2;
  }
  else {
    unsigned int v174 = 1;
  }
  v175.i32[0] = a4[1].var2.var0.var0;
  v176.i32[0] = LODWORD(a4[1].var2.var0.var1);
  v175.i32[1] = a4[1].var2.var1.var0;
  float32x2_t v177 = vmul_n_f32(vcvt_f32_s32(v175), (float)v174);
  v176.f32[1] = (float)a4[1].var2.var1.var1;
  float32x2_t v178 = vmla_n_f32(vmul_f32(v177, (float32x2_t)0xBF000000BF000000), v176, (float)v174);
  float32x2_t v179 = vdiv_f32(vmul_f32(v177, v169), v169);
  float32x2_t v180 = vdiv_f32(v154, v163);
  *(float32x2_t *)&long long v226 = vmul_f32(v180, v179);
  *((float32x2_t *)&v226 + 1) = vmla_f32((float32x2_t)0xBF000000BF000000, v180, vmla_f32(vsub_f32(v178, v157), (float32x2_t)0x3F0000003F000000, v179));
  v179.i32[0] = LODWORD(a4[1].var2.var0.var2);
  v179.i32[1] = LODWORD(a4[1].var2.var1.var2);
  v232[0] = v179;
  unsigned int var0 = a4[1].var0;
  switch(var0)
  {
    case 1u:
      unint64_t v182 = 3212836864;
      uint64_t v183 = LODWORD(v219);
      goto LABEL_18;
    case 2u:
      uint64_t v184 = 0x3F80000000000000;
      LODWORD(v185) = 0;
      *((float *)&v185 + 1) = -v219;
      break;
    case 3u:
      unint64_t v182 = 0xBF80000000000000;
      LODWORD(v183) = 0;
      *((float *)&v183 + 1) = v219;
LABEL_18:
      *(void *)&long long v227 = v182;
      *((void *)&v227 + 1) = v183;
      goto LABEL_22;
    default:
      uint64_t v184 = 1065353216;
      HIDWORD(v185) = 0;
      *(float *)&uint64_t v185 = -v219;
      break;
  }
  *(void *)&long long v227 = v184;
  *((void *)&v227 + 1) = v185;
LABEL_22:
  *(float32x2_t *)&long long v228 = vdiv_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(*(int32x2_t *)&a4->var0, (int32x2_t)-1)), vcvt_f32_u32((uint32x2_t)vadd_s32(*(int32x2_t *)&a4->var2.var0.var0, (int32x2_t)-1)));
  unsigned int v186 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v172, v173);
  WORD4(v228) = objc_msgSend_rigidWindowSupport(v186, v187, v188) >> 1;

  long long v191 = objc_msgSend_computeCommandEncoder(v19, v189, v190);

  if (v191)
  {
    objc_msgSend_setComputePipelineState_(v191, v192, (uint64_t)self->_costNCCPipelineState);
    long long v193 = v215;
    objc_msgSend_setTexture_atIndex_(v191, v194, (uint64_t)v215, 0);
    objc_msgSend_setTexture_atIndex_(v191, v195, (uint64_t)v17, 1);
    v196 = v216;
    objc_msgSend_setTexture_atIndex_(v191, v197, (uint64_t)v216, 2);
    objc_msgSend_setTexture_atIndex_(v191, v198, (uint64_t)self->_disparityCorrectionTex, 3);
    objc_msgSend_setTexture_atIndex_(v191, v199, (uint64_t)self->_binaryLambdaTexture, 4);
    objc_msgSend_setTexture_atIndex_(v191, v200, (uint64_t)v18, 5);
    objc_msgSend_setBytes_length_atIndex_(v191, v201, (uint64_t)&v225, 128, 0);
    unint64_t v204 = objc_msgSend_threadExecutionWidth(self->_costNCCPipelineState, v202, v203);
    unint64_t v207 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_costNCCPipelineState, v205, v206);
    uint64_t v208 = *(void *)&a4->var2.var1.var1;
    *(void *)&long long v209 = v208;
    *((void *)&v209 + 1) = HIDWORD(v208);
    long long v223 = v209;
    uint64_t v224 = 1;
    v222[0] = v204;
    v222[1] = v207 / v204;
    v222[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v191, v210, (uint64_t)&v223, v222);
    objc_msgSend_endEncoding(v191, v211, v212);
    int v213 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v213 = FigSignalErrorAt();
    long long v193 = v215;
    v196 = v216;
  }

  return v213;
}

- (int)_filterVert:(id)a3 texTcLrcIn:(id)a4 texTcLrcOut:(id)a5 dynCfg:(id *)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  long long v48 = 0u;
  memset(v47, 0, sizeof(v47));
  fpDisparityEstimatorParams = self->_fpDisparityEstimatorParams;
  id v13 = a3;
  id v16 = objc_msgSend_FPcostParameters(fpDisparityEstimatorParams, v14, v15);
  objc_msgSend_costMapAntialiasingStrength(v16, v17, v18);
  float v20 = (float)(v19 * (float)LODWORD(a6->var2.var1.var2)) / (float)a6->var1;

  *(float *)&double v21 = roundf(v20 * 6.0);
  *(float *)&double v22 = v20;
  LOWORD(v48) = objc_msgSend_computeFilterCurve_p3_array_(self, v23, (uint64_t)v47, v21, v22);
  int64x2_t v26 = objc_msgSend_computeCommandEncoder(v13, v24, v25);

  if (v26)
  {
    objc_msgSend_setComputePipelineState_(v26, v27, (uint64_t)self->_filterVertPipelineState);
    objc_msgSend_setTexture_atIndex_(v26, v28, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v26, v29, (uint64_t)v11, 1);
    objc_msgSend_setBytes_length_atIndex_(v26, v30, (uint64_t)v47, 272, 0);
    unint64_t v33 = objc_msgSend_threadExecutionWidth(self->_filterVertPipelineState, v31, v32);
    unint64_t v36 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_filterVertPipelineState, v34, v35);
    uint64_t v37 = *(void *)&a6->var2.var1.var1;
    *(void *)&long long v38 = v37;
    *((void *)&v38 + 1) = HIDWORD(v37);
    long long v45 = v38;
    uint64_t v46 = 1;
    v44[0] = v33;
    v44[1] = v36 / v33;
    v44[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v39, (uint64_t)&v45, v44);
    objc_msgSend_endEncoding(v26, v40, v41);
    int v42 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
  }

  return v42;
}

- (int)_filterHorz:(id)a3 texTcLrcIn:(id)a4 texTcLrcOut:(id)a5 dynCfg:(id *)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  long long v48 = 0u;
  memset(v47, 0, sizeof(v47));
  fpDisparityEstimatorParams = self->_fpDisparityEstimatorParams;
  id v13 = a3;
  id v16 = objc_msgSend_FPcostParameters(fpDisparityEstimatorParams, v14, v15);
  objc_msgSend_costMapAntialiasingStrength(v16, v17, v18);
  float v20 = (float)(v19 * (float)*(void *)&a6->var2.var1.var1) / (float)*(void *)&a6->var0;

  *(float *)&double v21 = roundf(v20 * 6.0);
  *(float *)&double v22 = v20;
  LOWORD(v48) = objc_msgSend_computeFilterCurve_p3_array_(self, v23, (uint64_t)v47, v21, v22);
  int64x2_t v26 = objc_msgSend_computeCommandEncoder(v13, v24, v25);

  if (v26)
  {
    objc_msgSend_setComputePipelineState_(v26, v27, (uint64_t)self->_filterHorzPipelineState);
    objc_msgSend_setTexture_atIndex_(v26, v28, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v26, v29, (uint64_t)v11, 1);
    objc_msgSend_setBytes_length_atIndex_(v26, v30, (uint64_t)v47, 272, 0);
    unint64_t v33 = objc_msgSend_threadExecutionWidth(self->_filterHorzPipelineState, v31, v32);
    unint64_t v36 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_filterHorzPipelineState, v34, v35);
    uint64_t v37 = *(void *)&a6->var2.var1.var1;
    *(void *)&long long v38 = v37;
    *((void *)&v38 + 1) = HIDWORD(v37);
    long long v45 = v38;
    uint64_t v46 = 1;
    v44[0] = v33;
    v44[1] = v36 / v33;
    v44[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v26, v39, (uint64_t)&v45, v44);
    objc_msgSend_endEncoding(v26, v40, v41);
    int v42 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
  }

  return v42;
}

- (int)_interpolateAndAccumulate:(id)a3 texTcLrcIn:(id)a4 dynCfg:(id *)a5
{
  id v8 = a4;
  uint64_t v105 = 0;
  int32x2_t v106 = 0;
  uint64_t v9 = 56;
  if (!a5[1].var0) {
    uint64_t v9 = 48;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  int32x2_t v11 = vadd_s32(*(int32x2_t *)&a5->var2.var0.var0, (int32x2_t)-1);
  int32x2_t v106 = vadd_s32(*(int32x2_t *)&a5->var0, (int32x2_t)-1);
  int32x2_t v107 = v11;
  int32x2_t v108 = vadd_s32(*(int32x2_t *)&a5->var2.var0.var2, (int32x2_t)-1);
  id v12 = a3;
  if (objc_msgSend_quadraBinningFactor(self, v13, v14) == 2) {
    unsigned int v17 = 2;
  }
  else {
    unsigned int v17 = 1;
  }
  float32x2_t v18 = vcvt_f32_u32(*(uint32x2_t *)&a5->var0);
  objc_msgSend_sensorCropRect(self, v15, v16);
  int v20 = (int)v19;
  objc_msgSend_sensorCropRect(self, v21, v22);
  v23.i32[0] = v20;
  v23.i32[1] = (int)v24;
  int32x2_t v101 = v23;
  objc_msgSend_sensorReadoutRect(self, v25, v26);
  int v28 = (int)v27;
  objc_msgSend_sensorReadoutRect(self, v29, v30);
  v31.i32[0] = v28;
  v31.i32[1] = (int)v32;
  int32x2_t v100 = v31;
  objc_msgSend_totalSensorCropRect(self, v33, v34);
  int v36 = (int)v35;
  objc_msgSend_totalSensorCropRect(self, v37, v38);
  v39.i32[0] = v36;
  v39.i32[1] = (int)v40;
  int32x2_t v99 = v39;
  objc_msgSend_totalSensorCropRect(self, v41, v42);
  int v44 = (int)v43;
  objc_msgSend_totalSensorCropRect(self, v45, v46);
  v47.i32[0] = v44;
  v47.i32[1] = (int)v48;
  int32x2_t v49 = vdup_n_s32(v17);
  int32x2_t v50 = vmla_s32(v101, vadd_s32(v99, v100), v49);
  int32x2_t v51 = vmul_s32(v47, v49);
  int8x8_t v52 = (int8x8_t)vdup_n_s32(0x4B400000u);
  float32x2_t v53 = (float32x2_t)vorr_s8((int8x8_t)(*(void *)&v50 & 0xFFF0FFFFFFF0FFFFLL), v52);
  float32x2_t v54 = (float32x2_t)vdup_n_s32(0xCB400000);
  float32x2_t v55 = vadd_f32(vadd_f32(v53, v54), (float32x2_t)0xBF000000BF000000);
  float32x2_t v56 = vadd_f32((float32x2_t)vorr_s8((int8x8_t)(*(void *)&v51 & 0xFFFCFFFFFFFCFFFFLL), v52), v54);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v62 = vadd_f32(v56, _D1);
  uint64_t v65 = objc_msgSend_width(v8, v63, v64);
  uint64_t v68 = objc_msgSend_height(v8, v66, v67);
  v69.i64[0] = v65;
  v69.i64[1] = v68;
  float32x2_t v70 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v69, vdupq_n_s64(1uLL))));
  if (objc_msgSend_quadraBinningFactor(self, v71, v72)) {
    unsigned int v75 = 2;
  }
  else {
    unsigned int v75 = 1;
  }
  v76.i32[0] = a5[1].var2.var0.var0;
  v77.i32[0] = LODWORD(a5[1].var2.var0.var1);
  v76.i32[1] = a5[1].var2.var1.var0;
  float32x2_t v78 = vmul_n_f32(vcvt_f32_s32(v76), (float)v75);
  v77.f32[1] = (float)a5[1].var2.var1.var1;
  float32x2_t v79 = vdiv_f32(v70, vmul_f32(v78, v70));
  float32x2_t v80 = vmla_f32((float32x2_t)0xBF000000BF000000, v79, vsub_f32(v55, vmla_n_f32(vmul_f32(v78, (float32x2_t)0xBF000000BF000000), v77, (float)v75)));
  float32x2_t v81 = vdiv_f32(v62, v18);
  float32x2_t v109 = vmul_f32(v81, v79);
  float32x2_t v110 = vmla_f32(v80, v79, vmul_f32(v81, (float32x2_t)0x3F0000003F000000));
  LOWORD(v105) = a5[1].var1;
  int32x2_t v82 = objc_msgSend_computeCommandEncoder(v12, v73, v74);

  if (v82)
  {
    objc_msgSend_setComputePipelineState_(v82, v83, (uint64_t)v10);
    objc_msgSend_setTexture_atIndex_(v82, v84, (uint64_t)v8, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v82, v85, (uint64_t)self->_costsBuffer, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v82, v86, (uint64_t)&v105, 48, 1);
    unint64_t v89 = objc_msgSend_threadExecutionWidth(v10, v87, v88);
    unint64_t v92 = objc_msgSend_maxTotalThreadsPerThreadgroup(v10, v90, v91);
    *(void *)&long long v93 = *(void *)&a5->var0;
    *((void *)&v93 + 1) = HIDWORD(*(void *)&a5->var0);
    long long v103 = v93;
    uint64_t v104 = 1;
    v102[0] = v89;
    v102[1] = v92 / v89;
    v102[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v82, v94, (uint64_t)&v103, v102);
    objc_msgSend_endEncoding(v82, v95, v96);
    int v97 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
  }

  return v97;
}

- (int)_debugInterpolate:(id)a3 texTcLrcIn:(id)a4 dynCfg:(id *)a5 debugBuf:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v106 = 0;
  int32x2_t v107 = 0;
  id v12 = self->_interpolateAndSetPipelineState;
  int32x2_t v13 = vadd_s32(*(int32x2_t *)&a5->var2.var0.var0, (int32x2_t)-1);
  int32x2_t v107 = vadd_s32(*(int32x2_t *)&a5->var0, (int32x2_t)-1);
  int32x2_t v108 = v13;
  int32x2_t v109 = vadd_s32(*(int32x2_t *)&a5->var2.var0.var2, (int32x2_t)-1);
  id v14 = a3;
  if (objc_msgSend_quadraBinningFactor(self, v15, v16) == 2) {
    unsigned int v19 = 2;
  }
  else {
    unsigned int v19 = 1;
  }
  float32x2_t v20 = vcvt_f32_u32(*(uint32x2_t *)&a5->var0);
  objc_msgSend_sensorCropRect(self, v17, v18);
  int v22 = (int)v21;
  objc_msgSend_sensorCropRect(self, v23, v24);
  v25.i32[0] = v22;
  v25.i32[1] = (int)v26;
  int32x2_t v101 = v25;
  objc_msgSend_sensorReadoutRect(self, v27, v28);
  int v30 = (int)v29;
  objc_msgSend_sensorReadoutRect(self, v31, v32);
  v33.i32[0] = v30;
  v33.i32[1] = (int)v34;
  int32x2_t v100 = v33;
  objc_msgSend_totalSensorCropRect(self, v35, v36);
  int v38 = (int)v37;
  objc_msgSend_totalSensorCropRect(self, v39, v40);
  v41.i32[0] = v38;
  v41.i32[1] = (int)v42;
  int32x2_t v99 = v41;
  objc_msgSend_totalSensorCropRect(self, v43, v44);
  int v46 = (int)v45;
  objc_msgSend_totalSensorCropRect(self, v47, v48);
  v49.i32[0] = v46;
  v49.i32[1] = (int)v50;
  int32x2_t v51 = vdup_n_s32(v19);
  int32x2_t v52 = vmla_s32(v101, vadd_s32(v99, v100), v51);
  int32x2_t v53 = vmul_s32(v49, v51);
  int8x8_t v54 = (int8x8_t)vdup_n_s32(0x4B400000u);
  float32x2_t v55 = (float32x2_t)vorr_s8((int8x8_t)(*(void *)&v52 & 0xFFF0FFFFFFF0FFFFLL), v54);
  float32x2_t v56 = (float32x2_t)vdup_n_s32(0xCB400000);
  float32x2_t v57 = vadd_f32(vadd_f32(v55, v56), (float32x2_t)0xBF000000BF000000);
  float32x2_t v58 = vadd_f32((float32x2_t)vorr_s8((int8x8_t)(*(void *)&v53 & 0xFFFCFFFFFFFCFFFFLL), v54), v56);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v64 = vadd_f32(v58, _D1);
  *(float *)v101.i32 = (float)(unint64_t)objc_msgSend_width(v10, v65, v66);
  uint64_t v69 = objc_msgSend_height(v10, v67, v68);
  v70.i32[0] = v101.i32[0];
  v70.f32[1] = (float)(unint64_t)v69;
  float32x2_t v102 = v70;
  if (objc_msgSend_quadraBinningFactor(self, v71, v72)) {
    unsigned int v75 = 2;
  }
  else {
    unsigned int v75 = 1;
  }
  v76.i32[0] = a5[1].var2.var0.var0;
  v77.i32[0] = LODWORD(a5[1].var2.var0.var1);
  v76.i32[1] = a5[1].var2.var1.var0;
  float32x2_t v78 = vmul_n_f32(vcvt_f32_s32(v76), (float)v75);
  v77.f32[1] = (float)a5[1].var2.var1.var1;
  float32x2_t v79 = vdiv_f32(v102, vmul_f32(v102, v78));
  float32x2_t v80 = vmla_f32((float32x2_t)0xBF000000BF000000, v79, vsub_f32(v57, vmla_n_f32(vmul_f32(v78, (float32x2_t)0xBF000000BF000000), v77, (float)v75)));
  float32x2_t v81 = vdiv_f32(v64, v20);
  float32x2_t v110 = vmul_f32(v81, v79);
  float32x2_t v111 = vmla_f32(v80, v79, vmul_f32(v81, (float32x2_t)0x3F0000003F000000));
  LOWORD(v106) = a5[1].var1;
  int32x2_t v82 = objc_msgSend_computeCommandEncoder(v14, v73, v74);

  if (v82)
  {
    objc_msgSend_setComputePipelineState_(v82, v83, (uint64_t)v12);
    objc_msgSend_setTexture_atIndex_(v82, v84, (uint64_t)v10, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v82, v85, (uint64_t)v11, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v82, v86, (uint64_t)&v106, 48, 1);
    unint64_t v89 = objc_msgSend_threadExecutionWidth(v12, v87, v88);
    unint64_t v92 = objc_msgSend_maxTotalThreadsPerThreadgroup(v12, v90, v91);
    *(void *)&long long v93 = *(void *)&a5->var0;
    *((void *)&v93 + 1) = HIDWORD(*(void *)&a5->var0);
    long long v104 = v93;
    uint64_t v105 = 1;
    v103[0] = v89;
    v103[1] = v92 / v89;
    v103[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v82, v94, (uint64_t)&v104, v103);
    objc_msgSend_endEncoding(v82, v95, v96);
    int v97 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
  }

  return v97;
}

- (int)_proximityOperator:(id)a3 dynCfg:(id *)a4 texDisparityIn:(id)a5 texOutputResUOut:(id)a6 texOutputHesUOut:(id)a7 level:(unsigned int)a8
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v170 = 0u;
  fpDisparityEstimatorParams = self->_fpDisparityEstimatorParams;
  id v18 = a3;
  double v21 = objc_msgSend_levelsParameters(fpDisparityEstimatorParams, v19, v20);
  int32x2_t v23 = objc_msgSend_objectAtIndexedSubscript_(v21, v22, a8);
  double v26 = objc_msgSend_costParameters(v23, v24, v25);
  objc_msgSend_lambda(v26, v27, v28);
  int v165 = v29;

  uint64_t v32 = objc_msgSend_levelsParameters(self->_fpDisparityEstimatorParams, v30, v31);
  double v34 = objc_msgSend_objectAtIndexedSubscript_(v32, v33, a8);
  double v37 = objc_msgSend_costParameters(v34, v35, v36);
  objc_msgSend_lambda_foreground(v37, v38, v39);
  int v166 = v40;

  double v43 = objc_msgSend_levelsParameters(self->_fpDisparityEstimatorParams, v41, v42);
  double v45 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, a8);
  uint64_t v48 = objc_msgSend_costParameters(v45, v46, v47);
  objc_msgSend_lambda_background(v48, v49, v50);
  int v167 = v51;

  int8x8_t v54 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v52, v53);
  objc_msgSend_costEpsilon(v54, v55, v56);
  v162[0] = v57;

  float v60 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v58, v59);
  objc_msgSend_foregroundPush(v60, v61, v62);
  DWORD1(v170) = v63;

  uint64_t v66 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v64, v65);
  objc_msgSend_backgroundPush(v66, v67, v68);
  DWORD2(v170) = v69;

  uint64_t v72 = objc_msgSend_levelsParameters(self->_fpDisparityEstimatorParams, v70, v71);
  uint64_t v74 = objc_msgSend_objectAtIndexedSubscript_(v72, v73, a8);
  float32x2_t v77 = objc_msgSend_costParameters(v74, v75, v76);
  objc_msgSend_step(v77, v78, v79);
  v162[1] = v80;

  __int16 var1 = a4[1].var1;
  double v83 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v81, v82);
  __int16 v164 = objc_msgSend_nView(v83, v84, v85);

  uint64_t v88 = objc_msgSend_width(v14, v86, v87);
  uint64_t v91 = objc_msgSend_height(v14, v89, v90);
  v92.i64[0] = v88;
  v92.i64[1] = v91;
  v93.i64[0] = -1;
  v93.i64[1] = -1;
  *(float32x2_t *)&long long v171 = vmul_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v92, v93))), (float32x2_t)0x3F0000003F000000);
  uint64_t v96 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v94, v95);
  objc_msgSend_radialExponent(v96, v97, v98);
  int v169 = v99;

  float32x2_t v102 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v100, v101);
  objc_msgSend_radialGain(v102, v103, v104);
  int v168 = v105;

  int32x2_t v108 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, v106, v107);
  objc_msgSend_radialMin(v108, v109, v110);
  LODWORD(v170) = v111;

  CGFloat width = self->_outputDisparityResolution.width;
  uint64_t v114 = objc_msgSend_width(v15, v112, v113);
  v115.f64[0] = width;
  v115.f64[1] = self->_outputDisparityResolution.height;
  __asm { FMOV            V0.2D, #-1.0 }
  float32x2_t v121 = vcvt_f32_f64(vaddq_f64(v115, _Q0));
  uint64_t v124 = objc_msgSend_height(v15, v122, v123);
  v125.i64[0] = v114;
  v125.i64[1] = v124;
  v126.i64[0] = -1;
  v126.i64[1] = -1;
  float32x2_t v127 = vdiv_f32(v121, vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v125, v126))));
  uint64_t v130 = objc_msgSend_width(self->_segmentationTexture, v128, v129);
  float v131 = self->_outputDisparityResolution.width;
  *(float *)&CGFloat width = (float)(unint64_t)v130 / v131;
  uint64_t v134 = objc_msgSend_height(self->_segmentationTexture, v132, v133);
  float height = self->_outputDisparityResolution.height;
  *((float32x2_t *)&v171 + 1) = v127;
  *(void *)&long long v172 = __PAIR64__((float)(unint64_t)v134 / height, LODWORD(width));
  uint64_t v138 = objc_msgSend_computeCommandEncoder(v18, v136, v137);

  if (v138)
  {
    objc_msgSend_setComputePipelineState_(v138, v139, (uint64_t)self->_proximityOperatorPipelineState);
    objc_msgSend_setTexture_atIndex_(v138, v140, (uint64_t)v14, 0);
    objc_msgSend_setTexture_atIndex_(v138, v141, (uint64_t)self->_segmentationTexture, 1);
    objc_msgSend_setTexture_atIndex_(v138, v142, (uint64_t)v15, 2);
    objc_msgSend_setTexture_atIndex_(v138, v143, (uint64_t)v16, 3);
    objc_msgSend_setBuffer_offset_atIndex_(v138, v144, (uint64_t)self->_costsBuffer, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v138, v145, (uint64_t)v162, 80, 1);
    unint64_t v148 = objc_msgSend_threadExecutionWidth(self->_proximityOperatorPipelineState, v146, v147);
    unint64_t v151 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_proximityOperatorPipelineState, v149, v150);
    *(void *)&long long v152 = *(void *)&a4->var0;
    *((void *)&v152 + 1) = HIDWORD(*(void *)&a4->var0);
    long long v160 = v152;
    uint64_t v161 = 1;
    v159[0] = v148;
    v159[1] = v151 / v148;
    v159[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v138, v153, (uint64_t)&v160, v159);
    objc_msgSend_endEncoding(v138, v154, v155);
    int v156 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v156 = FigSignalErrorAt();
  }

  return v156;
}

- (id)CreateKernelWithConst:(id)a3 constants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_library(self->_mtlContext, v8, v9);
  id v12 = v10;
  if (v7)
  {
    id v23 = 0;
    int32x2_t v13 = objc_msgSend_newFunctionWithName_constantValues_error_(v10, v11, (uint64_t)v6, v7, &v23);
    id v14 = v23;

    if (v13)
    {
LABEL_3:
      unsigned int v17 = objc_msgSend_device(self->_mtlContext, v15, v16);
      id v22 = v14;
      unsigned int v19 = objc_msgSend_newComputePipelineStateWithFunction_error_(v17, v18, (uint64_t)v13, &v22);
      id v20 = v22;

      id v14 = v20;
      goto LABEL_6;
    }
  }
  else
  {
    int32x2_t v13 = objc_msgSend_newFunctionWithName_(v10, v11, (uint64_t)v6);

    id v14 = 0;
    if (v13) {
      goto LABEL_3;
    }
  }
  unsigned int v19 = 0;
LABEL_6:

  return v19;
}

- (int)computeFilterCurve:(float)a3 p3:(float)a4 array:(float *)a5
{
  int v5 = a5;
  signed int v6 = vcvtms_s32_f32(a3) | 1;
  if (v6 >= 63) {
    signed int v6 = 63;
  }
  if (v6 <= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v6;
  }
  float v8 = -1.0 / (float)((float)(a4 + a4) * a4);
  signed int v9 = -((v7 - 1) >> 1);
  float v10 = 0.0;
  uint64_t v11 = v7;
  id v12 = a5;
  do
  {
    float v13 = expf(v8 * (float)((float)v9 * (float)v9));
    float v10 = v10 + v13;
    *v12++ = v13;
    ++v9;
    --v11;
  }
  while (v11);
  uint64_t v14 = v7;
  do
  {
    *int v5 = *v5 / v10;
    ++v5;
    --v14;
  }
  while (v14);
  return v7;
}

- (unint64_t)computeAlignedSize:(unint64_t)a3 pixelFormat:(unint64_t)a4
{
  signed int v6 = objc_msgSend_device(self->_mtlContext, a2, a3);
  unint64_t v8 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v6, v7, a4);

  if (a3 % v8) {
    return v8 + a3 - a3 % v8;
  }
  else {
    return a3;
  }
}

- (int)_setCorrectionMapCoefficients:(float *)a3
{
  uint64_t v5 = 0;
  correctionBasisCoefficients = self->_correctionBasisCoefficients;
  do
  {
    while (a3)
    {
      float v7 = a3[v5];
      unint64_t v8 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, a2, (uint64_t)a3);
      uint64_t v11 = objc_msgSend_correctionCoefficientsWeights(v8, v9, v10);
      float v13 = objc_msgSend_objectAtIndexedSubscript_(v11, v12, v5);
      objc_msgSend_floatValue(v13, v14, v15);
      correctionBasisCoefficients[v5] = v7 * v16;

      if (++v5 == 10)
      {
        unsigned int v17 = objc_msgSend_FPcostParameters(self->_fpDisparityEstimatorParams, a2, (uint64_t)a3);
        id v20 = objc_msgSend_correctionCoefficientsWeights(v17, v18, v19);
        id v22 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 10);
        objc_msgSend_floatValue(v22, v23, v24);
        self->_correctionBasisCoefficients[10] = v25;

        return 0;
      }
    }
    correctionBasisCoefficients[v5++] = 0.0;
  }
  while (v5 != 10);
  self->_correctionBasisCoefficients[10] = 0.0;
  return 0;
}

- (int)_generateCorrectionMap
{
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  signed int v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  signed int v9 = objc_msgSend_resourcePath(v6, v7, v8);

  if (!v9
    || (uint64_t v11 = (void *)MEMORY[0x263EFF8F8],
        objc_msgSend_stringWithFormat_(NSString, v10, @"%@/basis_all.f16", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_dataWithContentsOfFile_(v11, v13, (uint64_t)v12),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v14))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_13:
    int v71 = -12780;
    goto LABEL_10;
  }
  if (objc_msgSend_length(v14, v15, v16) != 713856)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_13;
  }
  id v18 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v17, 25, 208, 156, 0);
  if (v18)
  {
    id v20 = v18;
    objc_msgSend_setUsage_(v18, v19, 3);
    id v23 = objc_msgSend_device(self->_mtlContext, v21, v22);
    float v25 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v23, v24, (uint64_t)v20);
    disparityCorrectionTex = self->_disparityCorrectionTex;
    self->_disparityCorrectionTex = v25;

    if (self->_disparityCorrectionTex)
    {
      uint64_t v28 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v27, 25, 208, 1716, 0);

      uint64_t v31 = objc_msgSend_device(self->_mtlContext, v29, v30);
      int32x2_t v33 = objc_msgSend_newTextureWithDescriptor_(v31, v32, (uint64_t)v28);

      if (v33)
      {
        memset(v75, 0, sizeof(v75));
        long long v76 = xmmword_262F136E0;
        uint64_t v77 = 1;
        id v34 = v14;
        uint64_t v37 = objc_msgSend_bytes(v34, v35, v36);
        objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v33, v38, (uint64_t)v75, 0, 0, v37, 416, 713856);
        int32x2_t v41 = objc_msgSend_commandQueue(self->_mtlContext, v39, v40);
        uint64_t v44 = objc_msgSend_commandBuffer(v41, v42, v43);

        if (v44)
        {
          uint64_t v47 = objc_msgSend_computeCommandEncoder(v44, v45, v46);
          if (v47)
          {
            int32x2_t v49 = v47;
            objc_msgSend_setComputePipelineState_(v47, v48, (uint64_t)self->_correctionMapGenerationPipelineState);
            objc_msgSend_setTexture_atIndex_(v49, v50, (uint64_t)v33, 0);
            objc_msgSend_setTexture_atIndex_(v49, v51, (uint64_t)self->_disparityCorrectionTex, 1);
            objc_msgSend_setBytes_length_atIndex_(v49, v52, (uint64_t)self->_correctionBasisCoefficients, 44, 0);
            unint64_t v55 = objc_msgSend_threadExecutionWidth(self->_correctionMapGenerationPipelineState, v53, v54);
            float32x2_t v58 = v9;
            unint64_t v59 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_correctionMapGenerationPipelineState, v56, v57)
                / v55;
            uint64_t v62 = objc_msgSend_width(self->_disparityCorrectionTex, v60, v61);
            uint64_t v65 = objc_msgSend_height(self->_disparityCorrectionTex, v63, v64);
            v74[0] = v62;
            v74[1] = v65;
            v74[2] = 1;
            v73[0] = v55;
            v73[1] = v59;
            signed int v9 = v58;
            v73[2] = 1;
            objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v49, v66, (uint64_t)v74, v73);
            objc_msgSend_endEncoding(v49, v67, v68);
            objc_msgSend_commit(v44, v69, v70);

            int v71 = 0;
          }
          else
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            int v71 = FigSignalErrorAt();
          }
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();

          int v71 = -12786;
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v71 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v71 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();
  }
LABEL_10:

  return v71;
}

- (FPDisparityEstimator_Parameters)fpDisparityEstimatorParams
{
  return self->_fpDisparityEstimatorParams;
}

- (void)setFpDisparityEstimatorParams:(id)a3
{
  self->_fpDisparityEstimatorParams = (FPDisparityEstimator_Parameters *)a3;
}

- (CGSize)outputDisparityResolution
{
  double width = self->_outputDisparityResolution.width;
  double height = self->_outputDisparityResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PyrGPU)imagePyramid
{
  return self->_imagePyramid;
}

- (void)setImagePyramid:(id)a3
{
}

- (NSArray)GChannelPyramid
{
  return self->_GChannelPyramid;
}

- (void)setGChannelPyramid:(id)a3
{
}

- (MTLTexture)H0ImTexture
{
  return self->_H0ImTexture;
}

- (void)setH0ImTexture:(id)a3
{
}

- (MTLTexture)H1ImTexture
{
  return self->_H1ImTexture;
}

- (void)setH1ImTexture:(id)a3
{
}

- (MTLTexture)V0ImTexture
{
  return self->_V0ImTexture;
}

- (void)setV0ImTexture:(id)a3
{
}

- (MTLTexture)V1ImTexture
{
  return self->_V1ImTexture;
}

- (void)setV1ImTexture:(id)a3
{
}

- (MTLTexture)binaryLambdaTexture
{
  return self->_binaryLambdaTexture;
}

- (void)setBinaryLambdaTexture:(id)a3
{
}

- ($5E5F304956FB491AF6F034FDF0808287)H0Metadata
{
  uint64_t v2 = *(void *)&self->_H0Metadata.xRawBase;
  uint64_t v3 = *(void *)&self->_H0Metadata.xRawStep;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.unsigned int var0 = v3;
  result.__int16 var1 = HIDWORD(v3);
  return result;
}

- (void)setH0Metadata:(id)a3
{
  self->_H0Metadata = ($287F03AB692EEEB666AFD6C448F1F1AF)a3;
}

- ($5E5F304956FB491AF6F034FDF0808287)H1Metadata
{
  uint64_t v2 = *(void *)&self->_H1Metadata.xRawBase;
  uint64_t v3 = *(void *)&self->_H1Metadata.xRawStep;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.unsigned int var0 = v3;
  result.__int16 var1 = HIDWORD(v3);
  return result;
}

- (void)setH1Metadata:(id)a3
{
  self->_H1Metadata = ($287F03AB692EEEB666AFD6C448F1F1AF)a3;
}

- ($5E5F304956FB491AF6F034FDF0808287)V0Metadata
{
  uint64_t v2 = *(void *)&self->_V0Metadata.xRawBase;
  uint64_t v3 = *(void *)&self->_V0Metadata.xRawStep;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.unsigned int var0 = v3;
  result.__int16 var1 = HIDWORD(v3);
  return result;
}

- (void)setV0Metadata:(id)a3
{
  self->_V0Metadata = ($287F03AB692EEEB666AFD6C448F1F1AF)a3;
}

- ($5E5F304956FB491AF6F034FDF0808287)V1Metadata
{
  uint64_t v2 = *(void *)&self->_V1Metadata.xRawBase;
  uint64_t v3 = *(void *)&self->_V1Metadata.xRawStep;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.unsigned int var0 = v3;
  result.__int16 var1 = HIDWORD(v3);
  return result;
}

- (void)setV1Metadata:(id)a3
{
  self->_V1Metadata = ($287F03AB692EEEB666AFD6C448F1F1AF)a3;
}

- (MTLTexture)segmentationTexture
{
  return self->_segmentationTexture;
}

- (void)setSegmentationTexture:(id)a3
{
}

- (MTLTexture)segmentationConfidenceTexture
{
  return self->_segmentationConfidenceTexture;
}

- (void)setSegmentationConfidenceTexture:(id)a3
{
}

- (unsigned)quadraBinningFactor
{
  return self->_quadraBinningFactor;
}

- (void)setQuadraBinningFactor:(unsigned __int16)a3
{
  self->_quadraBinningFactor = a3;
}

- (CGRect)sensorCropRect
{
  double x = self->_sensorCropRect.origin.x;
  double y = self->_sensorCropRect.origin.y;
  double width = self->_sensorCropRect.size.width;
  double height = self->_sensorCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSensorCropRect:(CGRect)a3
{
  self->_sensorCropRect = a3;
}

- (CGRect)sensorReadoutRect
{
  double x = self->_sensorReadoutRect.origin.x;
  double y = self->_sensorReadoutRect.origin.y;
  double width = self->_sensorReadoutRect.size.width;
  double height = self->_sensorReadoutRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSensorReadoutRect:(CGRect)a3
{
  self->_sensorReadoutRect = a3;
}

- (CGRect)totalSensorCropRect
{
  double x = self->_totalSensorCropRect.origin.x;
  double y = self->_totalSensorCropRect.origin.y;
  double width = self->_totalSensorCropRect.size.width;
  double height = self->_totalSensorCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTotalSensorCropRect:(CGRect)a3
{
  self->_totalSensorCropRect = a3;
}

- (unsigned)imageAGC
{
  return self->_imageAGC;
}

- (void)setImageAGC:(unsigned int)a3
{
  self->_float imageAGC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationConfidenceTexture, 0);
  objc_storeStrong((id *)&self->_segmentationTexture, 0);
  objc_storeStrong((id *)&self->_binaryLambdaTexture, 0);
  objc_storeStrong((id *)&self->_V1ImTexture, 0);
  objc_storeStrong((id *)&self->_V0ImTexture, 0);
  objc_storeStrong((id *)&self->_H1ImTexture, 0);
  objc_storeStrong((id *)&self->_H0ImTexture, 0);
  objc_storeStrong((id *)&self->_GChannelPyramid, 0);
  objc_storeStrong((id *)&self->_imagePyramid, 0);
  objc_storeStrong((id *)&self->_correctionMapGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_disparityCorrectionTex, 0);
  objc_storeStrong((id *)&self->_hbfgpuInstance, 0);
  objc_storeStrong((id *)&self->_tvl1Instance, 0);
  objc_storeStrong((id *)&self->_uv_tex_user_ref, 0);
  for (uint64_t i = 624; i != 368; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  for (uint64_t j = 360; j != 104; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_bufTcLrc2, 0);
  objc_storeStrong((id *)&self->_bufTcLrc1, 0);
  objc_storeStrong((id *)&self->_costsBuffer, 0);
  objc_storeStrong((id *)&self->_regularizationPipelineState, 0);
  objc_storeStrong((id *)&self->_proximityOperatorPipelineState, 0);
  objc_storeStrong((id *)&self->_interpolateAndAccumPipelineState, 0);
  objc_storeStrong((id *)&self->_interpolateAndSetPipelineState, 0);
  objc_storeStrong((id *)&self->_filterHorzPipelineState, 0);
  objc_storeStrong((id *)&self->_filterVertPipelineState, 0);
  objc_storeStrong((id *)&self->_costNCCPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end