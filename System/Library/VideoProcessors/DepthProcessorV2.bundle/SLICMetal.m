@interface SLICMetal
- (SLICMetal)initWithParameters:(id)a3 andMetalContext:(id)a4;
- (id)_createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4;
- (int)_slicCompileShadersWithLibrary:(id)a3;
- (int)_slicEnsureConnectivity;
- (int)_slicFinalReductionResult;
- (int)_slicFindCenterAssociation:(id *)a3;
- (int)_slicInitClusterCenters;
- (int)_slicUpdateClusterCenter;
- (int)allocateResources;
- (int)processSLICToOutputSPixelCentersIdsAndCounts:(id)a3 outputSPixelColor:(id)a4 outputIndexes:(id)a5 inputImage:(id)a6 parameters:(id *)a7;
- (void)_swapTexturesAtIndex:(int)a3 and:(int)a4;
- (void)dealloc;
- (void)releaseResources;
@end

@implementation SLICMetal

- (SLICMetal)initWithParameters:(id)a3 andMetalContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v50.receiver = self;
    v50.super_class = (Class)SLICMetal;
    v10 = [(SLICMetal *)&v50 init];
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_mtlContext, a4);
      objc_msgSend_device(self->_mtlContext, v11, v12, v13, v14, v15);
      v16 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
      mtlDevice = self->_mtlDevice;
      self->_mtlDevice = v16;

      objc_msgSend_commandQueue(self->_mtlContext, v18, v19, v20, v21, v22);
      v23 = (MTLCommandQueue *)objc_claimAutoreleasedReturnValue();
      mtlCommandQueue = self->_mtlCommandQueue;
      self->_mtlCommandQueue = v23;

      objc_storeStrong((id *)&self->_parameters, a3);
      objc_msgSend_superPixelSize(v7, v25, v26, v27, v28, v29);
      float v31 = v30;
      objc_msgSend_superPixelSize(v7, v32, v33, v34, v35, v36);
      self->_no_grid_per_center = vcvtps_s32_f32((float)((float)(v31 * v37) * 9.0) * 0.0039062);
      v43 = objc_msgSend_library(self->_mtlContext, v38, v39, v40, v41, v42);
      int v48 = objc_msgSend__slicCompileShadersWithLibrary_(self, v44, (uint64_t)v43, v45, v46, v47);

      if (v48)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        FigSignalErrorAt();
        self = 0;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }

  return self;
}

- (int)_slicCompileShadersWithLibrary:(id)a3
{
  objc_msgSend_superPixelSize(self->_parameters, a2, (uint64_t)a3, v3, v4, v5);
  int v57 = v7;
  int no_grid_per_center = self->_no_grid_per_center;
  objc_msgSend_superPixelSize(self->_parameters, v8, v9, v10, v11, v12);
  int v54 = self->_no_grid_per_center;
  int v55 = (int)(float)((float)(v13 * 3.0) * 0.0625);
  int v53 = 1120403456;
  id v14 = objc_alloc_init(MEMORY[0x263F128B0]);
  v17 = v14;
  if (!v14) {
    goto LABEL_9;
  }
  objc_msgSend_setConstantValue_type_withName_(v14, v15, (uint64_t)&v57, 33, @"slicMetal::spixel_size_uint", v16);
  objc_msgSend_setConstantValue_type_withName_(v17, v18, (uint64_t)&no_grid_per_center, 29, @"slicMetal::no_blocks_per_spixel", v19);
  objc_msgSend_setConstantValue_type_withName_(v17, v20, (uint64_t)&v55, 29, @"slicMetal::no_blocks_per_line", v21);
  objc_msgSend_setConstantValue_type_withName_(v17, v22, (uint64_t)&v54, 29, @"slicMetal::no_grid_per_center", v23);
  objc_msgSend_setConstantValue_type_withName_(v17, v24, (uint64_t)&v53, 33, @"slicMetal::distanceInitValue_uint", v25);
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v26, @"initClustersCenters", (uint64_t)v17, v27, v28);
  uint64_t v29 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  float v30 = self->_slicComputePipelinesStates[0];
  self->_slicComputePipelinesStates[0] = v29;

  if (!self->_slicComputePipelinesStates[0]) {
    goto LABEL_9;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v31, @"findCenterAssociation", (uint64_t)v17, v32, v33);
  uint64_t v34 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = self->_slicComputePipelinesStates[1];
  self->_slicComputePipelinesStates[1] = v34;

  if (!self->_slicComputePipelinesStates[1]) {
    goto LABEL_9;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v36, @"updateClusterCenter", (uint64_t)v17, v37, v38);
  uint64_t v39 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = self->_slicComputePipelinesStates[2];
  self->_slicComputePipelinesStates[2] = v39;

  if (!self->_slicComputePipelinesStates[2]) {
    goto LABEL_9;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v41, @"finalizeReductionResult", (uint64_t)v17, v42, v43);
  v44 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = self->_slicComputePipelinesStates[3];
  self->_slicComputePipelinesStates[3] = v44;

  if (!self->_slicComputePipelinesStates[3]) {
    goto LABEL_9;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v46, @"ensureConnectivity", (uint64_t)v17, v47, v48);
  v49 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  objc_super v50 = self->_slicComputePipelinesStates[4];
  self->_slicComputePipelinesStates[4] = v49;

  if (self->_slicComputePipelinesStates[4]) {
    int v51 = 0;
  }
  else {
LABEL_9:
  }
    int v51 = -12786;

  return v51;
}

- (int)allocateResources
{
  objc_msgSend_inputImageSize(self->_parameters, a2, v2, v3, v4, v5);
  objc_msgSend__createTextureOfSize_withFormat_(self, v7, 53, v8, v9, v10);
  uint64_t v11 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  if (!v11) {
    return -12786;
  }
  uint64_t v12 = self->_slicTextures[7];
  self->_slicTextures[7] = v11;
  float v13 = v11;

  objc_msgSend_mapSize(self->_parameters, v14, v15, v16, v17, v18);
  double v20 = v19;
  double v22 = v21;

  objc_msgSend__createTextureOfSize_withFormat_(self, v23, 55, v24, v25, v26, v20, v22);
  uint64_t v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  if (!v27) {
    return -12786;
  }
  uint64_t v28 = self->_slicTextures[4];
  self->_slicTextures[4] = v27;
  uint64_t v29 = v27;

  objc_msgSend_mapSize(self->_parameters, v30, v31, v32, v33, v34);
  double v36 = v35;
  double v38 = v37;

  objc_msgSend__createTextureOfSize_withFormat_(self, v39, 55, v40, v41, v42, v36, v38);
  uint64_t v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  if (!v43) {
    return -12786;
  }
  v44 = self->_slicTextures[5];
  self->_slicTextures[5] = v43;
  uint64_t v45 = v43;

  objc_msgSend_mapSize(self->_parameters, v46, v47, v48, v49, v50);
  double v52 = v51 * (double)self->_no_grid_per_center;
  objc_msgSend_mapSize(self->_parameters, v53, v54, v55, v56, v57);
  double v59 = v58;

  objc_msgSend__createTextureOfSize_withFormat_(self, v60, 125, v61, v62, v63, v52, v59);
  v64 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  if (!v64) {
    return -12786;
  }
  v65 = self->_slicTextures[1];
  self->_slicTextures[1] = v64;
  v66 = v64;

  objc_msgSend_mapSize(self->_parameters, v67, v68, v69, v70, v71);
  double v73 = v72 * (double)self->_no_grid_per_center;
  objc_msgSend_mapSize(self->_parameters, v74, v75, v76, v77, v78);
  double v80 = v79;

  objc_msgSend__createTextureOfSize_withFormat_(self, v81, 125, v82, v83, v84, v73, v80);
  v85 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  if (!v85) {
    return -12786;
  }
  v86 = self->_slicTextures[0];
  self->_slicTextures[0] = v85;
  v87 = v85;

  return 0;
}

- (void)releaseResources
{
  uint64_t v3 = self->_slicTextures[7];
  self->_slicTextures[7] = 0;

  uint64_t v4 = self->_slicTextures[4];
  self->_slicTextures[4] = 0;

  uint64_t v5 = self->_slicTextures[5];
  self->_slicTextures[5] = 0;

  v6 = self->_slicTextures[1];
  self->_slicTextures[1] = 0;

  int v7 = self->_slicTextures[0];
  self->_slicTextures[0] = 0;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)SLICMetal;
  [(SLICMetal *)&v7 dealloc];
}

- (int)processSLICToOutputSPixelCentersIdsAndCounts:(id)a3 outputSPixelColor:(id)a4 outputIndexes:(id)a5 inputImage:(id)a6 parameters:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v95 = a6;
  uint64_t v16 = (void **)&self->_slicTextures[2];
  objc_storeStrong((id *)&self->_slicTextures[2], a3);
  uint64_t v17 = (void **)&self->_slicTextures[3];
  objc_storeStrong((id *)&self->_slicTextures[3], a4);
  uint64_t v18 = (void **)&self->_slicTextures[6];
  objc_storeStrong((id *)&self->_slicTextures[6], a5);
  objc_storeStrong((id *)&self->_slicTextures[8], a6);
  objc_msgSend_commandBuffer(self->_mtlContext, v19, v20, v21, v22, v23);
  uint64_t v24 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  mtlCommandBuffer = self->_mtlCommandBuffer;
  self->_mtlCommandBuffer = v24;

  if (!self->_mtlCommandBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v90 = FigSignalErrorAt();
    goto LABEL_14;
  }
  int inited = objc_msgSend__slicInitClusterCenters(self, v26, v27, v28, v29, v30);
  if (inited) {
    goto LABEL_15;
  }
  int inited = objc_msgSend__slicFindCenterAssociation_(self, v32, (uint64_t)a7, v33, v34, v35);
  if (inited) {
    goto LABEL_15;
  }
  if (objc_msgSend_no_iters(self->_parameters, v36, v37, v38, v39, v40))
  {
    int v46 = 0;
    do
    {
      int inited = objc_msgSend__slicUpdateClusterCenter(self, v41, v42, v43, v44, v45);
      if (inited) {
        goto LABEL_15;
      }
      int inited = objc_msgSend__slicFinalReductionResult(self, v47, v48, v49, v50, v51);
      if (inited) {
        goto LABEL_15;
      }
      int inited = objc_msgSend__slicFindCenterAssociation_(self, v52, (uint64_t)a7, v53, v54, v55);
      if (inited) {
        goto LABEL_15;
      }
    }
    while (++v46 < objc_msgSend_no_iters(self->_parameters, v56, v57, v58, v59, v60));
  }
  int inited = objc_msgSend__slicEnsureConnectivity(self, v41, v42, v43, v44, v45);
  if (inited)
  {
LABEL_15:
    int v90 = inited;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  if (*MEMORY[0x263F00E10])
  {
    v66 = objc_msgSend_commandQueue(self->_mtlCommandBuffer, v61, v62, v63, v64, v65);
    double v72 = objc_msgSend_commandBuffer(v66, v67, v68, v69, v70, v71);

    objc_msgSend_setLabel_(v72, v73, @"KTRACE_MTLCMDBUF", v74, v75, v76);
    objc_msgSend_addCompletedHandler_(v72, v77, (uint64_t)&unk_270E22300, v78, v79, v80);
    objc_msgSend_commit(v72, v81, v82, v83, v84, v85);
    objc_msgSend_addCompletedHandler_(self->_mtlCommandBuffer, v86, (uint64_t)&unk_270E22320, v87, v88, v89);
  }
  objc_msgSend_commit(self->_mtlContext, v61, v62, v63, v64, v65);
  int v90 = 0;
LABEL_14:
  v91 = *v16;
  MTLDevice *v16 = 0;

  v92 = *v17;
  void *v17 = 0;

  v93 = *v18;
  const char *v18 = 0;

  return v90;
}

- (int)_slicInitClusterCenters
{
  uint64_t v3 = self->_slicComputePipelinesStates[0];
  uint64_t v4 = self->_mtlCommandBuffer;
  uint64_t v10 = self->_slicTextures[2];
  if (v4
    && (objc_msgSend_computeCommandEncoder(v4, v5, v6, v7, v8, v9), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)v11;
    unsigned int v18 = objc_msgSend_threadExecutionWidth(v3, v12, v13, v14, v15, v16);
    uint64_t v24 = v18;
    unint64_t v25 = objc_msgSend_maxTotalThreadsPerThreadgroup(v3, v19, v20, v21, v22, v23) / v18;
    unint64_t v31 = (objc_msgSend_width(v10, v26, v27, v28, v29, v30) + (unint64_t)v18 - 1) / v18;
    unint64_t v37 = (v25 + objc_msgSend_height(v10, v32, v33, v34, v35, v36) - 1) / v25;
    objc_msgSend_setComputePipelineState_(v17, v38, (uint64_t)v3, v39, v40, v41);
    objc_msgSend_setTextures_withRange_(v17, v42, (uint64_t)self->_slicTextures, 0, 9, v43);
    v55[0] = v31;
    v55[1] = v37;
    v55[2] = 1;
    v54[0] = v24;
    v54[1] = v25;
    v54[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v17, v44, (uint64_t)v55, (uint64_t)v54, v45, v46);
    objc_msgSend_endEncoding(v17, v47, v48, v49, v50, v51);

    int v52 = 0;
  }
  else
  {
    int v52 = -12786;
  }

  return v52;
}

- (int)_slicFindCenterAssociation:(id *)a3
{
  uint64_t v5 = self->_slicComputePipelinesStates[1];
  uint64_t v6 = self->_mtlCommandBuffer;
  uint64_t v7 = self->_slicTextures[8];
  objc_msgSend_defaultsSlicoSpatialBias(self->_parameters, v8, v9, v10, v11, v12);
  if (a3) {
    float var0 = a3->var0;
  }
  else {
    float var0 = v18;
  }
  objc_msgSend_slicoInverseWeight(self->_parameters, v13, v14, v15, v16, v17);
  float v61 = var0 * v25;
  if (v6
    && (objc_msgSend_computeCommandEncoder(v6, v20, v21, v22, v23, v24), (uint64_t v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v32 = (void *)v26;
    unint64_t v33 = (unint64_t)(objc_msgSend_width(v7, v27, v28, v29, v30, v31) + 15) >> 4;
    unint64_t v39 = (unint64_t)(objc_msgSend_height(v7, v34, v35, v36, v37, v38) + 15) >> 4;
    objc_msgSend_setComputePipelineState_(v32, v40, (uint64_t)v5, v41, v42, v43);
    objc_msgSend_setTextures_withRange_(v32, v44, (uint64_t)self->_slicTextures, 0, 9, v45);
    objc_msgSend_setBytes_length_atIndex_(v32, v46, (uint64_t)&v61, 4, 0, v47);
    v60[0] = v33;
    v60[1] = v39;
    v60[2] = 1;
    int64x2_t v58 = vdupq_n_s64(0x10uLL);
    uint64_t v59 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v32, v48, (uint64_t)v60, (uint64_t)&v58, v49, v50);
    objc_msgSend_endEncoding(v32, v51, v52, v53, v54, v55);

    int v56 = 0;
  }
  else
  {
    int v56 = -12786;
  }

  return v56;
}

- (int)_slicUpdateClusterCenter
{
  uint64_t v3 = self->_slicComputePipelinesStates[2];
  uint64_t v4 = self->_mtlCommandBuffer;
  uint64_t v10 = self->_slicTextures[2];
  if (v4
    && (objc_msgSend_computeCommandEncoder(v4, v5, v6, v7, v8, v9), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)v11;
    slicTextures = self->_slicTextures;
    unsigned int v19 = objc_msgSend_width(v10, v12, v13, v14, v15, v16);
    unsigned int v25 = objc_msgSend_height(v10, v20, v21, v22, v23, v24);
    uint64_t no_grid_per_center = self->_no_grid_per_center;
    uint64_t v27 = v25;
    objc_msgSend_setComputePipelineState_(v17, v28, (uint64_t)v3, v29, v30, v31);
    objc_msgSend_setTextures_withRange_(v17, v32, (uint64_t)slicTextures, 0, 9, v33);
    v46[0] = v19;
    v46[1] = v27;
    v46[2] = no_grid_per_center;
    int64x2_t v44 = vdupq_n_s64(0x10uLL);
    uint64_t v45 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v17, v34, (uint64_t)v46, (uint64_t)&v44, v35, v36);
    objc_msgSend_endEncoding(v17, v37, v38, v39, v40, v41);

    int v42 = 0;
  }
  else
  {
    int v42 = -12786;
  }

  return v42;
}

- (int)_slicFinalReductionResult
{
  uint64_t v3 = self->_slicComputePipelinesStates[3];
  uint64_t v4 = self->_mtlCommandBuffer;
  uint64_t v10 = self->_slicTextures[2];
  if (v4
    && (objc_msgSend_computeCommandEncoder(v4, v5, v6, v7, v8, v9), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)v11;
    unsigned int v18 = objc_msgSend_threadExecutionWidth(v3, v12, v13, v14, v15, v16);
    uint64_t v24 = v18;
    unint64_t v25 = objc_msgSend_maxTotalThreadsPerThreadgroup(v3, v19, v20, v21, v22, v23) / v18;
    unint64_t v31 = (objc_msgSend_width(v10, v26, v27, v28, v29, v30) + (unint64_t)v18 - 1) / v18;
    unint64_t v37 = (v25 + objc_msgSend_height(v10, v32, v33, v34, v35, v36) - 1) / v25;
    objc_msgSend_setComputePipelineState_(v17, v38, (uint64_t)v3, v39, v40, v41);
    objc_msgSend_setTextures_withRange_(v17, v42, (uint64_t)self->_slicTextures, 0, 9, v43);
    v58[0] = v31;
    v58[1] = v37;
    v58[2] = 1;
    v57[0] = v24;
    v57[1] = v25;
    v57[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v17, v44, (uint64_t)v58, (uint64_t)v57, v45, v46);
    objc_msgSend_endEncoding(v17, v47, v48, v49, v50, v51);
    objc_msgSend__swapTexturesAtIndex_and_(self, v52, 4, 5, v53, v54);

    int v55 = 0;
  }
  else
  {
    int v55 = -12786;
  }

  return v55;
}

- (int)_slicEnsureConnectivity
{
  uint64_t v3 = self->_slicComputePipelinesStates[4];
  uint64_t v4 = self->_mtlCommandBuffer;
  uint64_t v10 = self->_slicTextures[6];
  if (v4
    && (objc_msgSend_computeCommandEncoder(v4, v5, v6, v7, v8, v9), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)v11;
    unsigned int v18 = objc_msgSend_threadExecutionWidth(v3, v12, v13, v14, v15, v16);
    uint64_t v24 = v18;
    unint64_t v25 = objc_msgSend_maxTotalThreadsPerThreadgroup(v3, v19, v20, v21, v22, v23) / v18;
    unint64_t v31 = (objc_msgSend_width(v10, v26, v27, v28, v29, v30) + (unint64_t)v18 - 1) / v18;
    uint64_t v80 = v10;
    unint64_t v37 = (v25 + objc_msgSend_height(v10, v32, v33, v34, v35, v36) - 1) / v25;
    objc_msgSend_setComputePipelineState_(v17, v38, (uint64_t)v3, v39, v40, v41);
    objc_msgSend_setTextures_withRange_(v17, v42, (uint64_t)self->_slicTextures, 0, 9, v43);
    unint64_t v84 = v31;
    unint64_t v85 = v37;
    uint64_t v86 = 1;
    uint64_t v81 = v18;
    unint64_t v82 = v25;
    uint64_t v83 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v17, v44, (uint64_t)&v84, (uint64_t)&v81, v45, v46);
    objc_msgSend_endEncoding(v17, v47, v48, v49, v50, v51);
    objc_msgSend__swapTexturesAtIndex_and_(self, v52, 6, 7, v53, v54);
    uint64_t v60 = objc_msgSend_computeCommandEncoder(v4, v55, v56, v57, v58, v59);

    objc_msgSend_setComputePipelineState_(v60, v61, (uint64_t)v3, v62, v63, v64);
    objc_msgSend_setTextures_withRange_(v60, v65, (uint64_t)self->_slicTextures, 0, 9, v66);
    unint64_t v84 = v31;
    unint64_t v85 = v37;
    uint64_t v10 = v80;
    uint64_t v86 = 1;
    uint64_t v81 = v24;
    unint64_t v82 = v25;
    uint64_t v83 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v60, v67, (uint64_t)&v84, (uint64_t)&v81, v68, v69);
    objc_msgSend_endEncoding(v60, v70, v71, v72, v73, v74);
    objc_msgSend__swapTexturesAtIndex_and_(self, v75, 6, 7, v76, v77);

    int v78 = 0;
  }
  else
  {
    int v78 = -12786;
  }

  return v78;
}

- (void)_swapTexturesAtIndex:(int)a3 and:(int)a4
{
  slicTextures = self->_slicTextures;
  uint64_t v6 = (id *)&self->_slicTextures[a3];
  uint64_t v7 = (MTLTexture *)*v6;
  objc_storeStrong(v6, slicTextures[a4]);
  uint64_t v8 = slicTextures[a4];
  slicTextures[a4] = v7;
}

- (id)_createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4
{
  uint64_t v5 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a4, (unint64_t)a3.width, (unint64_t)a3.height, 0);
  objc_msgSend_setUsage_(v5, v6, 3, v7, v8, v9);
  uint64_t v14 = objc_msgSend_newTextureWithDescriptor_(self->_mtlDevice, v10, (uint64_t)v5, v11, v12, v13);

  return v14;
}

- (void).cxx_destruct
{
  for (uint64_t i = 152; i != 80; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
  objc_storeStrong((id *)&self->_mtlCommandBuffer, 0);
  objc_storeStrong((id *)&self->_mtlCommandQueue, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  uint64_t v4 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v4), 0);
    v4 -= 8;
  }
  while (v4);
}

@end