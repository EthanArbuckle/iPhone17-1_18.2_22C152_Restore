@interface FFCFiltersMetal
- (FFCFiltersMetal)initWithMetalContext:(id)a3;
- (int)_compileShadersWithLibrary:(id)a3;
- (int)boxFilter11x11From:(id)a3 To:(id)a4;
- (int)boxFilterFrom:(id)a3 To:(id)a4;
- (int)erosionFilterFrom:(id)a3 To:(id)a4;
@end

@implementation FFCFiltersMetal

- (FFCFiltersMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FFCFiltersMetal;
  v6 = [(FFCFiltersMetal *)&v34 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    uint64_t v13 = objc_msgSend_device(v7->_mtlContext, v8, v9, v10, v11, v12);
    mtlDevice = v7->_mtlDevice;
    v7->_mtlDevice = (MTLDevice *)v13;

    uint64_t v20 = objc_msgSend_commandQueue(v7->_mtlContext, v15, v16, v17, v18, v19);
    mtlCommandQueue = v7->_mtlCommandQueue;
    v7->_mtlCommandQueue = (MTLCommandQueue *)v20;

    v27 = objc_msgSend_library(v7->_mtlContext, v22, v23, v24, v25, v26);
    int v32 = objc_msgSend__compileShadersWithLibrary_(v7, v28, (uint64_t)v27, v29, v30, v31);

    if (v32)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      FigSignalErrorAt();
      v7 = 0;
    }
  }

  return v7;
}

- (int)_compileShadersWithLibrary:(id)a3
{
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, a2, @"boxFilter3x3", 0, v3, v4);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v7 = self->_FFCFiltersComputePipelinesStates[0];
  self->_FFCFiltersComputePipelinesStates[0] = v6;

  if (!self->_FFCFiltersComputePipelinesStates[0]) {
    return -12786;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v8, @"erosionFilter", 0, v9, v10);
  uint64_t v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = self->_FFCFiltersComputePipelinesStates[1];
  self->_FFCFiltersComputePipelinesStates[1] = v11;

  if (!self->_FFCFiltersComputePipelinesStates[1]) {
    return -12786;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v13, @"boxFilter11x11", 0, v14, v15);
  uint64_t v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = self->_FFCFiltersComputePipelinesStates[2];
  self->_FFCFiltersComputePipelinesStates[2] = v16;

  if (self->_FFCFiltersComputePipelinesStates[2]) {
    return 0;
  }
  else {
    return -12786;
  }
}

- (int)boxFilter11x11From:(id)a3 To:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = self->_FFCFiltersComputePipelinesStates[2];
  if (v6 && v7)
  {
    objc_msgSend_commandBuffer(self->_mtlContext, v8, v9, v10, v11, v12);
    uint64_t v14 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
    mtlCommandBuffer = self->_mtlCommandBuffer;
    self->_mtlCommandBuffer = v14;

    v21 = self->_mtlCommandBuffer;
    if (v21
      && (objc_msgSend_computeCommandEncoder(v21, v16, v17, v18, v19, v20),
          (v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = v22;
      objc_msgSend_setComputePipelineState_(v22, v23, (uint64_t)v13, v24, v25, v26);
      objc_msgSend_setTexture_atIndex_(v27, v28, (uint64_t)v6, 0, v29, v30);
      objc_msgSend_setTexture_atIndex_(v27, v31, (uint64_t)v7, 1, v32, v33);
      unint64_t v39 = objc_msgSend_threadExecutionWidth(v13, v34, v35, v36, v37, v38);
      unint64_t v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(v13, v40, v41, v42, v43, v44) / v39;
      v96[0] = objc_msgSend_width(v7, v46, v47, v48, v49, v50);
      v96[1] = objc_msgSend_height(v7, v51, v52, v53, v54, v55);
      v96[2] = 1;
      v95[0] = v39;
      v95[1] = v45;
      v95[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v56, (uint64_t)v96, (uint64_t)v95, v57, v58);
      objc_msgSend_endEncoding(v27, v59, v60, v61, v62, v63);
      if (*MEMORY[0x263F00E10])
      {
        v69 = objc_msgSend_commandQueue(self->_mtlCommandBuffer, v64, v65, v66, v67, v68);
        v75 = objc_msgSend_commandBuffer(v69, v70, v71, v72, v73, v74);

        objc_msgSend_setLabel_(v75, v76, @"KTRACE_MTLCMDBUF", v77, v78, v79);
        objc_msgSend_addCompletedHandler_(v75, v80, (uint64_t)&unk_270E22070, v81, v82, v83);
        objc_msgSend_commit(v75, v84, v85, v86, v87, v88);
        objc_msgSend_addCompletedHandler_(self->_mtlCommandBuffer, v89, (uint64_t)&unk_270E22090, v90, v91, v92);
      }
      objc_msgSend_commit(self->_mtlContext, v64, v65, v66, v67, v68);

      int v93 = 0;
    }
    else
    {
      int v93 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
  }

  return v93;
}

- (int)boxFilterFrom:(id)a3 To:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = self->_FFCFiltersComputePipelinesStates[0];
  if (v6
    && v7
    && (objc_msgSend_commandBuffer(self->_mtlContext, v8, v9, v10, v11, v12),
        uint64_t v14 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue(),
        mtlCommandBuffer = self->_mtlCommandBuffer,
        self->_mtlCommandBuffer = v14,
        mtlCommandBuffer,
        (v21 = self->_mtlCommandBuffer) != 0))
  {
    v22 = objc_msgSend_computeCommandEncoder(v21, v16, v17, v18, v19, v20);
    if (v22)
    {
      v27 = v22;
      objc_msgSend_setComputePipelineState_(v22, v23, (uint64_t)v13, v24, v25, v26);
      objc_msgSend_setTexture_atIndex_(v27, v28, (uint64_t)v6, 0, v29, v30);
      objc_msgSend_setTexture_atIndex_(v27, v31, (uint64_t)v7, 1, v32, v33);
      unint64_t v39 = objc_msgSend_threadExecutionWidth(v13, v34, v35, v36, v37, v38);
      unint64_t v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(v13, v40, v41, v42, v43, v44) / v39;
      v96[0] = objc_msgSend_width(v7, v46, v47, v48, v49, v50);
      v96[1] = objc_msgSend_height(v7, v51, v52, v53, v54, v55);
      v96[2] = 1;
      v95[0] = v39;
      v95[1] = v45;
      v95[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v56, (uint64_t)v96, (uint64_t)v95, v57, v58);
      objc_msgSend_endEncoding(v27, v59, v60, v61, v62, v63);
      if (*MEMORY[0x263F00E10])
      {
        v69 = objc_msgSend_commandQueue(self->_mtlCommandBuffer, v64, v65, v66, v67, v68);
        v75 = objc_msgSend_commandBuffer(v69, v70, v71, v72, v73, v74);

        objc_msgSend_setLabel_(v75, v76, @"KTRACE_MTLCMDBUF", v77, v78, v79);
        objc_msgSend_addCompletedHandler_(v75, v80, (uint64_t)&unk_270E220B0, v81, v82, v83);
        objc_msgSend_commit(v75, v84, v85, v86, v87, v88);
        objc_msgSend_addCompletedHandler_(self->_mtlCommandBuffer, v89, (uint64_t)&unk_270E220D0, v90, v91, v92);
      }
      objc_msgSend_commit(self->_mtlContext, v64, v65, v66, v67, v68);

      int v93 = 0;
    }
    else
    {
      int v93 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
  }

  return v93;
}

- (int)erosionFilterFrom:(id)a3 To:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = self->_FFCFiltersComputePipelinesStates[1];
  if (!v6) {
    goto LABEL_9;
  }
  if (!v7) {
    goto LABEL_9;
  }
  objc_msgSend_commandBuffer(self->_mtlContext, v8, v9, v10, v11, v12);
  uint64_t v14 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  mtlCommandBuffer = self->_mtlCommandBuffer;
  self->_mtlCommandBuffer = v14;

  v21 = self->_mtlCommandBuffer;
  if (!v21) {
    goto LABEL_9;
  }
  v22 = objc_msgSend_computeCommandEncoder(v21, v16, v17, v18, v19, v20);
  if (v22)
  {
    v27 = v22;
    objc_msgSend_setComputePipelineState_(v22, v23, (uint64_t)v13, v24, v25, v26);
    objc_msgSend_setTexture_atIndex_(v27, v28, (uint64_t)v6, 0, v29, v30);
    objc_msgSend_setTexture_atIndex_(v27, v31, (uint64_t)v7, 1, v32, v33);
    unint64_t v39 = objc_msgSend_threadExecutionWidth(v13, v34, v35, v36, v37, v38);
    unint64_t v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(v13, v40, v41, v42, v43, v44) / v39;
    v96[0] = objc_msgSend_width(v7, v46, v47, v48, v49, v50);
    v96[1] = objc_msgSend_height(v7, v51, v52, v53, v54, v55);
    v96[2] = 1;
    v95[0] = v39;
    v95[1] = v45;
    v95[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v56, (uint64_t)v96, (uint64_t)v95, v57, v58);
    objc_msgSend_endEncoding(v27, v59, v60, v61, v62, v63);
    if (*MEMORY[0x263F00E10])
    {
      v69 = objc_msgSend_commandQueue(self->_mtlCommandBuffer, v64, v65, v66, v67, v68);
      v75 = objc_msgSend_commandBuffer(v69, v70, v71, v72, v73, v74);

      objc_msgSend_setLabel_(v75, v76, @"KTRACE_MTLCMDBUF", v77, v78, v79);
      objc_msgSend_addCompletedHandler_(v75, v80, (uint64_t)&unk_270E220F0, v81, v82, v83);
      objc_msgSend_commit(v75, v84, v85, v86, v87, v88);
      objc_msgSend_addCompletedHandler_(self->_mtlCommandBuffer, v89, (uint64_t)&unk_270E22110, v90, v91, v92);
    }
    objc_msgSend_commit(self->_mtlContext, v64, v65, v66, v67, v68);

    int v93 = 0;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
  }

  return v93;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlContext, 0);
  objc_storeStrong((id *)&self->_mtlCommandBuffer, 0);
  objc_storeStrong((id *)&self->_mtlCommandQueue, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  uint64_t v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end