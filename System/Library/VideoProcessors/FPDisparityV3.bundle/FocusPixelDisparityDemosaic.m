@interface FocusPixelDisparityDemosaic
- (FocusPixelDisparityDemosaic)initWithMetalContext:(id)a3;
- (int)allocateResources;
- (int)demosaicGreenOnly:(id)a3 fromL00h:(id)a4 validRect:(CGRect)a5 waitForCompletion:(BOOL)a6;
- (void)dealloc;
@end

@implementation FocusPixelDisparityDemosaic

- (FocusPixelDisparityDemosaic)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FocusPixelDisparityDemosaic;
  v6 = [(FocusPixelDisparityDemosaic *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    uint64_t v10 = objc_msgSend_commandQueue(v5, v8, v9);
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v10;

    v13 = objc_opt_new();
    if (!v13
      || (objc_msgSend_computePipelineStateFor_constants_(v7->_mtlContext, v12, @"demosaicHamiltonAdam", v13), uint64_t v14 = objc_claimAutoreleasedReturnValue(), v15 = v7->_pipelineStates[0], v7->_pipelineStates[0] = (MTLComputePipelineState *)v14, v15, !v7->_pipelineStates[0]))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v16 = 0;
      goto LABEL_6;
    }
  }
  v16 = v7;
LABEL_6:

  return v16;
}

- (int)allocateResources
{
  return 0;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlContext, a2, v2);
  objc_msgSend_releaseResources(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)FocusPixelDisparityDemosaic;
  [(FocusPixelDisparityDemosaic *)&v6 dealloc];
}

- (int)demosaicGreenOnly:(id)a3 fromL00h:(id)a4 validRect:(CGRect)a5 waitForCompletion:(BOOL)a6
{
  int v6 = a6;
  CGFloat width = a5.size.width;
  CGFloat height = a5.size.height;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v9 = a3;
  id v10 = a4;
  if (objc_msgSend_width(v10, v11, v12) & 1) != 0 || (objc_msgSend_height(v10, v13, v14))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    v36 = 0;
    v33 = 0;
LABEL_15:
    int v6 = -12786;
    goto LABEL_10;
  }
  v17 = self->_pipelineStates[0];
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v36 = 0;
    v33 = 0;
    int v6 = -12782;
    goto LABEL_10;
  }
  __int16 v18 = objc_msgSend_width(v10, v15, v16);
  __int16 v21 = objc_msgSend_height(v10, v19, v20);
  v75[0] = (v18 - (__int16)objc_msgSend_width(v9, v22, v23)) / 2;
  v75[1] = (v21 - (__int16)objc_msgSend_height(v9, v24, v25)) / 2;
  v26.f64[0] = x;
  v27.f64[0] = width;
  v26.f64[1] = y;
  v27.f64[1] = height;
  int16x4_t v74 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(v26)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(v27)));
  v30 = objc_msgSend_commandBuffer(self->_commandQueue, v28, v29);
  v33 = v30;
  if (!v30)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v36 = 0;
    goto LABEL_15;
  }
  v34 = objc_msgSend_computeCommandEncoder(v30, v31, v32);
  v36 = v34;
  if (!v34)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  objc_msgSend_setComputePipelineState_(v34, v35, (uint64_t)v17);
  objc_msgSend_setTexture_atIndex_(v36, v37, (uint64_t)v10, 0);
  objc_msgSend_setTexture_atIndex_(v36, v38, (uint64_t)v9, 1);
  objc_msgSend_setBytes_length_atIndex_(v36, v39, (uint64_t)v75, 8, 0);
  objc_msgSend_setBytes_length_atIndex_(v36, v40, (uint64_t)&v74, 8, 1);
  unint64_t v43 = objc_msgSend_threadExecutionWidth(v17, v41, v42);
  unint64_t v46 = objc_msgSend_maxTotalThreadsPerThreadgroup(v17, v44, v45) / v43;
  v73[0] = (unint64_t)objc_msgSend_width(v9, v47, v48) >> 1;
  v73[1] = (unint64_t)objc_msgSend_height(v9, v49, v50) >> 1;
  v73[2] = 1;
  v72[0] = v43;
  v72[1] = v46;
  v72[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v36, v51, (uint64_t)v73, v72);
  objc_msgSend_endEncoding(v36, v52, v53);
  if (*MEMORY[0x263F00E10])
  {
    v56 = objc_msgSend_commandQueue(v33, v54, v55);
    v59 = objc_msgSend_commandBuffer(v56, v57, v58);

    objc_msgSend_setLabel_(v59, v60, @"KTRACE_MTLCMDBUF");
    objc_msgSend_addCompletedHandler_(v59, v61, (uint64_t)&unk_270E29FF0);
    objc_msgSend_commit(v59, v62, v63);
    objc_msgSend_addCompletedHandler_(v33, v64, (uint64_t)&unk_270E2A010);
  }
  objc_msgSend_commit(v33, v54, v55);
  if (v6)
  {
    objc_msgSend_waitUntilCompleted(v33, v65, v66);
    int v6 = 0;
  }
LABEL_10:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self->_pipelineStates, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end