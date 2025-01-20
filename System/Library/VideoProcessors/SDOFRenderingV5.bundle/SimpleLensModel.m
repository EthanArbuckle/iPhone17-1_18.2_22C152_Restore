@interface SimpleLensModel
- (SimpleLensModel)initWithMetalContext:(id)a3;
- (int)allocateResourcesForShiftMapWidth:(unint64_t)a3 shiftMapHeight:(unint64_t)a4;
- (int)enqueueCalcWithSimpleLensParams:(const simple_lens_model_params *)a3 inputShiftMap:(id)a4 outputSlmParams:(id)a5;
- (int)enqueueMinMaxWithInputShiftMapTex:(id)a3;
- (int)enqueueSlmCalcWithInputShiftMap:(id)a3 slmParams:(id)a4 simpleLensParams:(const simple_lens_model_params *)a5;
- (void)dealloc;
- (void)deallocateResources;
@end

@implementation SimpleLensModel

- (SimpleLensModel)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SimpleLensModel;
  v6 = [(SimpleLensModel *)&v24 init];
  v7 = (_DWORD *)MEMORY[0x263F00E10];
  if (!v6) {
    goto LABEL_15;
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  objc_storeStrong((id *)&v6->_mtlCtx, a3);
  uint64_t v9 = objc_msgSend_computePipelineStateFor_constants_(v6->_mtlCtx, v8, @"xhlrb_slm_shiftmap_calcminmax0", 0);
  minMax0_kernel = v6->_minMax0_kernel;
  v6->_minMax0_kernel = (MTLComputePipelineState *)v9;

  if (!v6->_minMax0_kernel) {
    goto LABEL_15;
  }
  uint64_t v12 = objc_msgSend_computePipelineStateFor_constants_(v6->_mtlCtx, v11, @"xhlrb_slm_shiftmap_calcminmax1", 0);
  minMax1_kernel = v6->_minMax1_kernel;
  v6->_minMax1_kernel = (MTLComputePipelineState *)v12;

  if (!v6->_minMax1_kernel) {
    goto LABEL_15;
  }
  uint64_t v15 = objc_msgSend_computePipelineStateFor_constants_(v6->_mtlCtx, v14, @"xhlrb_slm_shiftmap_calcminmax2", 0);
  minMax2_kernel = v6->_minMax2_kernel;
  v6->_minMax2_kernel = (MTLComputePipelineState *)v15;

  if (!v6->_minMax2_kernel) {
    goto LABEL_15;
  }
  uint64_t v18 = objc_msgSend_computePipelineStateFor_constants_(v6->_mtlCtx, v17, @"xhlrb_slm_calc", 0);
  calc_kernel = v6->_calc_kernel;
  v6->_calc_kernel = (MTLComputePipelineState *)v18;

  if (v6->_calc_kernel)
  {
    int v20 = 0;
  }
  else
  {
LABEL_15:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  if (v20) {
    v21 = 0;
  }
  else {
    v21 = v6;
  }
  v22 = v21;

  return v22;
}

- (int)allocateResourcesForShiftMapWidth:(unint64_t)a3 shiftMapHeight:(unint64_t)a4
{
  id v5 = objc_msgSend_device(self->_mtlCtx, a2, a3, a4);
  v7 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v5, v6, 8, 32);
  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = v7;

  if (self->_minMaxAtomic_buf
    && (v10 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v5, v9, 16, 32),
        minMaxResult_buf = self->_minMaxResult_buf,
        self->_minMaxResult_buf = v10,
        minMaxResult_buf,
        self->_minMaxResult_buf))
  {
    int v12 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (void)deallocateResources
{
  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = 0;

  minMaxResult_buf = self->_minMaxResult_buf;
  self->_minMaxResult_buf = 0;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlCtx, a2, v2, v3);
  objc_msgSend_deallocateResources(self, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)SimpleLensModel;
  [(SimpleLensModel *)&v8 dealloc];
}

- (int)enqueueMinMaxWithInputShiftMapTex:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_width(v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_height(v4, v9, v10, v11);
  v16 = objc_msgSend_commandQueue(self->_mtlCtx, v13, v14, v15);
  int v20 = objc_msgSend_commandBuffer(v16, v17, v18, v19);

  if (v20
    && (objc_msgSend_computeCommandEncoder(v20, v21, v22, v23),
        (objc_super v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = v24;
    objc_msgSend_setComputePipelineState_(v24, v25, (uint64_t)self->_minMax0_kernel, v26);
    objc_msgSend_setBuffer_offset_atIndex_(v27, v28, (uint64_t)self->_minMaxAtomic_buf, 0, 0);
    int64x2_t v70 = vdupq_n_s64(1uLL);
    int64x2_t v79 = v70;
    uint64_t v80 = 1;
    int64x2_t v77 = v70;
    uint64_t v78 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v27, v29, (uint64_t)&v79, (uint64_t)&v77);
    objc_msgSend_setComputePipelineState_(v27, v30, (uint64_t)self->_minMax1_kernel, v31);
    objc_msgSend_setTexture_atIndex_(v27, v32, (uint64_t)v4, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v27, v33, (uint64_t)self->_minMaxAtomic_buf, 0, 0);
    unint64_t v37 = objc_msgSend_threadExecutionWidth(self->_minMax1_kernel, v34, v35, v36);
    unint64_t v41 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_minMax1_kernel, v38, v39, v40);
    v76[0] = v8 >> 2;
    v76[1] = v12 >> 2;
    v76[2] = 1;
    v75[0] = v37;
    v75[1] = v41 / v37;
    v75[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v42, (uint64_t)v76, (uint64_t)v75);
    objc_msgSend_setComputePipelineState_(v27, v43, (uint64_t)self->_minMax2_kernel, v44);
    objc_msgSend_setBuffer_offset_atIndex_(v27, v45, (uint64_t)self->_minMaxAtomic_buf, 0, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v27, v46, (uint64_t)self->_minMaxResult_buf, 0, 1);
    int64x2_t v73 = v70;
    uint64_t v74 = 1;
    int64x2_t v71 = v70;
    uint64_t v72 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v27, v47, (uint64_t)&v73, (uint64_t)&v71);
    objc_msgSend_endEncoding(v27, v48, v49, v50);
    if (*MEMORY[0x263F00E10])
    {
      v54 = objc_msgSend_commandQueue(v20, v51, v52, v53);
      v58 = objc_msgSend_commandBuffer(v54, v55, v56, v57);

      objc_msgSend_setLabel_(v58, v59, @"KTRACE_MTLCMDBUF", v60);
      objc_msgSend_addCompletedHandler_(v58, v61, (uint64_t)&unk_270E995D8, v62);
      objc_msgSend_commit(v58, v63, v64, v65);
      objc_msgSend_addCompletedHandler_(v20, v66, (uint64_t)&unk_270E995F8, v67);
    }
    objc_msgSend_commit(v20, v51, v52, v53);

    int v68 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v68 = FigSignalErrorAt();
  }

  return v68;
}

- (int)enqueueSlmCalcWithInputShiftMap:(id)a3 slmParams:(id)a4 simpleLensParams:(const simple_lens_model_params *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13 = objc_msgSend_commandQueue(self->_mtlCtx, v10, v11, v12);
  v17 = objc_msgSend_commandBuffer(v13, v14, v15, v16);

  if (v17
    && (objc_msgSend_computeCommandEncoder(v17, v18, v19, v20),
        (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v24 = v21;
    objc_msgSend_setComputePipelineState_(v21, v22, (uint64_t)self->_calc_kernel, v23);
    objc_msgSend_setBytes_length_atIndex_(v24, v25, (uint64_t)a5, 56, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v24, v26, (uint64_t)self->_minMaxResult_buf, 0, 1);
    objc_msgSend_setBuffer_offset_atIndex_(v24, v27, (uint64_t)v9, 0, 2);
    objc_msgSend_setTexture_atIndex_(v24, v28, (uint64_t)v8, 0);
    objc_msgSend_setThreadgroupMemoryLength_atIndex_(v24, v29, 1024, 0);
    int64x2_t v55 = vdupq_n_s64(1uLL);
    uint64_t v56 = 1;
    long long v53 = xmmword_263544A70;
    uint64_t v54 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v24, v30, (uint64_t)&v55, (uint64_t)&v53);
    objc_msgSend_endEncoding(v24, v31, v32, v33);
    if (*MEMORY[0x263F00E10])
    {
      unint64_t v37 = objc_msgSend_commandQueue(v17, v34, v35, v36);
      unint64_t v41 = objc_msgSend_commandBuffer(v37, v38, v39, v40);

      objc_msgSend_setLabel_(v41, v42, @"KTRACE_MTLCMDBUF", v43);
      objc_msgSend_addCompletedHandler_(v41, v44, (uint64_t)&unk_270E99618, v45);
      objc_msgSend_commit(v41, v46, v47, v48);
      objc_msgSend_addCompletedHandler_(v17, v49, (uint64_t)&unk_270E99638, v50);
    }
    objc_msgSend_commit(v17, v34, v35, v36);

    int v51 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
  }

  return v51;
}

- (int)enqueueCalcWithSimpleLensParams:(const simple_lens_model_params *)a3 inputShiftMap:(id)a4 outputSlmParams:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13 = v9;
  if (!self->_minMaxAtomic_buf
    || !self->_minMaxResult_buf
    || !v8
    || !v9
    || !a3
    || objc_msgSend_pixelFormat(v8, v10, v11, v12) != 25 && objc_msgSend_pixelFormat(v8, v14, v15, v16) != 55
    || (unint64_t)objc_msgSend_length(v13, v14, v15, v16) <= 0xF)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    goto LABEL_11;
  }
  int v19 = objc_msgSend_enqueueMinMaxWithInputShiftMapTex_(self, v17, (uint64_t)v8, v18);
  if (v19)
  {
    int v21 = v19;
    fig_log_get_emitter();
LABEL_20:
    FigDebugAssert3();
    goto LABEL_11;
  }
  int v21 = objc_msgSend_enqueueSlmCalcWithInputShiftMap_slmParams_simpleLensParams_(self, v20, (uint64_t)v8, (uint64_t)v13, a3);
  if (v21)
  {
    fig_log_get_emitter();
    goto LABEL_20;
  }
LABEL_11:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minMaxResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxAtomic_buf, 0);
  objc_storeStrong((id *)&self->_calc_kernel, 0);
  objc_storeStrong((id *)&self->_minMax2_kernel, 0);
  objc_storeStrong((id *)&self->_minMax1_kernel, 0);
  objc_storeStrong((id *)&self->_minMax0_kernel, 0);

  objc_storeStrong((id *)&self->_mtlCtx, 0);
}

@end