@interface ControlLogicForXHLRB
- (ControlLogicForXHLRB)initWithMetalContext:(id)a3;
- (int)calculateXHLRBParamsWithInputMetadata:(const xhlrb_input_image_metadata *)a3 controlLogicParams:(const xhlrb_control_logic_params *)a4 inputSlmParams:(id)a5 inputShiftMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 outputParams:(xhlrb_control_params *)a9;
- (int)enqueueControlLogicWithInputMetadata:(const xhlrb_input_image_metadata *)a3 controlLogicParams:(const xhlrb_control_logic_params *)a4 inputSlmParams:(id)a5 inputShiftMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 outputParams:(xhlrb_control_params *)a9;
- (int)loadShaders;
- (int)validateInputsWithInputMetadata:(const xhlrb_input_image_metadata *)a3 inputSlmParams:(id)a4 inputShiftMap:(id)a5 inputLuma:(id)a6 inputChroma:(id)a7 outputParams:(xhlrb_control_params *)a8;
- (void)constAddFp16:(id)a3 name:(id)a4 value:(float)_S0;
@end

@implementation ControlLogicForXHLRB

- (ControlLogicForXHLRB)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ControlLogicForXHLRB;
  v6 = [(ControlLogicForXHLRB *)&v22 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  v6->_shadersLoaded = 0;
  objc_storeStrong((id *)&v6->_mtlCtx, a3);
  if (objc_msgSend_loadShaders(v7, v8, v9, v10))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
    goto LABEL_5;
  }
  v14 = objc_msgSend_device(v7->_mtlCtx, v11, v12, v13);
  uint64_t v16 = objc_msgSend_newBufferWithLength_options_(v14, v15, 4, 0);
  nClippedPixelsBuf = v7->_nClippedPixelsBuf;
  v7->_nClippedPixelsBuf = (MTLBuffer *)v16;

  if (!v7->_nClippedPixelsBuf)
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v18 = 0;
    if (v21) {
      goto LABEL_5;
    }
  }
  v18 = v7;
LABEL_5:
  v19 = v18;

  return v19;
}

- (void)constAddFp16:(id)a3 name:(id)a4 value:(float)_S0
{
  __asm { FCVT            H0, S0 }
  __int16 v10 = _H0;
  objc_msgSend_setConstantValue_type_withName_(a3, a2, (uint64_t)&v10, 16, a4);
}

- (int)loadShaders
{
  self->_shadersLoaded = 0;
  v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlCtx, a2, @"xhlrb_count_clipped", 0);
  v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  count_clipped_kernel = self->_count_clipped_kernel;
  self->_count_clipped_kernel = v4;

  if (self->_count_clipped_kernel)
  {
    int v6 = 0;
    self->_shadersLoaded = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v6 = FigSignalErrorAt();
  }
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v6;
}

- (int)calculateXHLRBParamsWithInputMetadata:(const xhlrb_input_image_metadata *)a3 controlLogicParams:(const xhlrb_control_logic_params *)a4 inputSlmParams:(id)a5 inputShiftMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 outputParams:(xhlrb_control_params *)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v21 = a8;
  *(void *)&a9->var0 = 0;
  *(void *)&a9->float var2 = 0;
  a9->var6 = 0.0;
  *(void *)&a9->var4 = 0;
  float maxBGBlur = a4->maxBGBlur;
  float v23 = a4->blurRadiusT0 / maxBGBlur;
  float maxIntensityT0 = a4->maxIntensityT0;
  v112[0] = 1.0 / (float)((float)(a4->blurRadiusT1 / maxBGBlur) - v23);
  v112[1] = -(float)(v112[0] * v23);
  float minIntensityT0 = a4->minIntensityT0;
  float v113 = 1.0 / (float)(a4->maxIntensityT1 - maxIntensityT0);
  float v114 = -(float)(v113 * maxIntensityT0);
  float v115 = 1.0 / (float)(a4->minIntensityT1 - minIntensityT0);
  float v116 = -(float)(v115 * minIntensityT0);
  float v26 = fminf(fmaxf((float)((float)(a3->var0 * a3->var1) - a4->exposureScoreT0)/ (float)(a4->exposureScoreT1 - a4->exposureScoreT0), 0.0), 1.0);
  float v27 = (float)(v26 * v26) * (float)((float)(v26 * -2.0) + 3.0);
  if (v27 <= 0.0)
  {
    int v105 = 0;
  }
  else
  {
    v109 = a3;
    v28 = objc_msgSend_commandQueue(self->_mtlCtx, v18, v19, v20);
    v32 = objc_msgSend_commandBuffer(v28, v29, v30, v31);

    if (v32)
    {
      *(_DWORD *)objc_msgSend_contents(self->_nClippedPixelsBuf, v33, v34, v35) = 0;
      v39 = objc_msgSend_computeCommandEncoder(v32, v36, v37, v38);
      if (v39)
      {
        v42 = v39;
        objc_msgSend_setComputePipelineState_(v39, v40, (uint64_t)self->_count_clipped_kernel, v41);
        id v108 = v15;
        objc_msgSend_setBuffer_offset_atIndex_(v42, v43, (uint64_t)v15, 0, 0);
        objc_msgSend_setBuffer_offset_atIndex_(v42, v44, (uint64_t)self->_nClippedPixelsBuf, 0, 1);
        objc_msgSend_setBytes_length_atIndex_(v42, v45, (uint64_t)v112, 24, 2);
        id v107 = v16;
        objc_msgSend_setTexture_atIndex_(v42, v46, (uint64_t)v16, 0);
        objc_msgSend_setTexture_atIndex_(v42, v47, (uint64_t)v17, 1);
        objc_msgSend_setTexture_atIndex_(v42, v48, (uint64_t)v21, 2);
        unint64_t v52 = objc_msgSend_threadExecutionWidth(self->_count_clipped_kernel, v49, v50, v51);
        unint64_t v56 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_count_clipped_kernel, v53, v54, v55) / v52;
        v111[0] = (unint64_t)objc_msgSend_width(v21, v57, v58, v59) >> 1;
        v111[1] = (unint64_t)objc_msgSend_height(v21, v60, v61, v62) >> 1;
        v111[2] = 1;
        v110[0] = v52;
        v110[1] = v56;
        v110[2] = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v42, v63, (uint64_t)v111, (uint64_t)v110);
        objc_msgSend_endEncoding(v42, v64, v65, v66);
        if (*MEMORY[0x263F00E10])
        {
          v70 = objc_msgSend_commandQueue(v32, v67, v68, v69);
          v74 = objc_msgSend_commandBuffer(v70, v71, v72, v73);

          objc_msgSend_setLabel_(v74, v75, @"KTRACE_MTLCMDBUF", v76);
          objc_msgSend_addCompletedHandler_(v74, v77, (uint64_t)&unk_270E99598, v78);
          objc_msgSend_commit(v74, v79, v80, v81);
          objc_msgSend_addCompletedHandler_(v32, v82, (uint64_t)&unk_270E995B8, v83);
        }
        objc_msgSend_commit(v32, v67, v68, v69);
        objc_msgSend_waitUntilCompleted(v32, v84, v85, v86);
        uint64_t v90 = objc_msgSend_width(v21, v87, v88, v89);
        float v94 = (float)(unint64_t)(objc_msgSend_height(v21, v91, v92, v93) * v90);
        float v98 = fminf(fmaxf((float)(a4->clippedPixelsT1+ (float)((float)((float)*(unsigned int *)objc_msgSend_contents(self->_nClippedPixelsBuf, v95, v96, v97)* -100.0)/ v94))/ (float)(a4->clippedPixelsT1 - a4->clippedPixelsT0), 0.0), 1.0);
        float maxColourDiffusionIterations = (float)a4->maxColourDiffusionIterations;
        float var2 = v109->var2;
        a9->var7 = var2;
        *(float *)v101.i32 = v27 * (float)((float)(v98 * v98) * (float)((float)(v98 * -2.0) + 3.0));
        a9->var0 = llroundf(*(float *)v101.i32 * maxColourDiffusionIterations);
        float v102 = *(float *)v101.i32 * (float)(fminf(var2, 4.0) * 0.25);
        int32x4_t v103 = v101;
        *(float *)&v103.i32[1] = v102;
        float32x4_t v104 = (float32x4_t)vzip1q_s32(v103, v103);
        v104.i32[2] = v101.i32[0];
        *(float32x4_t *)&a9->var1 = vmulq_f32(*(float32x4_t *)&a4->maxPreFilterGain, v104);
        *(float32x2_t *)&a9->var5 = vmul_n_f32(*(float32x2_t *)&a4->maxObsceneWeightGain, v102);

        int v105 = 0;
        id v16 = v107;
        id v15 = v108;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v105 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v105 = FigSignalErrorAt();
    }
  }

  return v105;
}

- (int)validateInputsWithInputMetadata:(const xhlrb_input_image_metadata *)a3 inputSlmParams:(id)a4 inputShiftMap:(id)a5 inputLuma:(id)a6 inputChroma:(id)a7 outputParams:(xhlrb_control_params *)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v20 = v16;
  if (a3
    && v13
    && v14
    && v15
    && v16
    && a8
    && (objc_msgSend_pixelFormat(v14, v17, v18, v19) == 25 || objc_msgSend_pixelFormat(v14, v21, v22, v23) == 55)
    && objc_msgSend_pixelFormat(v15, v21, v22, v23) == 10
    && objc_msgSend_pixelFormat(v20, v24, v25, v26) == 30
    && (unint64_t v30 = objc_msgSend_width(v15, v27, v28, v29),
        unint64_t v34 = objc_msgSend_height(v15, v31, v32, v33),
        objc_msgSend_width(v20, v35, v36, v37) == v30 >> 1)
    && objc_msgSend_height(v20, v38, v39, v40) == v34 >> 1)
  {
    int v41 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v41 = FigSignalErrorAt();
  }

  return v41;
}

- (int)enqueueControlLogicWithInputMetadata:(const xhlrb_input_image_metadata *)a3 controlLogicParams:(const xhlrb_control_logic_params *)a4 inputSlmParams:(id)a5 inputShiftMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 outputParams:(xhlrb_control_params *)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v19 = a8;
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    goto LABEL_11;
  }
  int v20 = objc_msgSend_validateInputsWithInputMetadata_inputSlmParams_inputShiftMap_inputLuma_inputChroma_outputParams_(self, v18, (uint64_t)a3, (uint64_t)v15, v16, v17, v19, a9);
  if (v20)
  {
    int v22 = v20;
    fig_log_get_emitter();
    goto LABEL_14;
  }
  if (!self->_shadersLoaded)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = -12784;
    goto LABEL_11;
  }
  if (a4->mode == 1)
  {
    int v22 = 0;
    a9->var0 = a4->maxColourDiffusionIterations;
    *(_OWORD *)&a9->var1 = *(_OWORD *)&a4->maxPreFilterGain;
    *(void *)&a9->var5 = *(void *)&a4->maxObsceneWeightGain;
LABEL_10:
    a9->var7 = a3->var2;
    goto LABEL_11;
  }
  if (a4->mode)
  {
    int v22 = 0;
    *(void *)&a9->var0 = 0;
    *(void *)&a9->float var2 = 0;
    a9->var6 = 0.0;
    *(void *)&a9->var4 = 0;
    goto LABEL_10;
  }
  int v22 = objc_msgSend_calculateXHLRBParamsWithInputMetadata_controlLogicParams_inputSlmParams_inputShiftMap_inputLuma_inputChroma_outputParams_(self, v21, (uint64_t)a3, (uint64_t)a4, v15, v16, v17, v19, a9);
  if (v22)
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
  }
LABEL_11:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count_clipped_kernel, 0);
  objc_storeStrong((id *)&self->_nClippedPixelsBuf, 0);

  objc_storeStrong((id *)&self->_mtlCtx, 0);
}

@end