@interface BilateralSolverGPU
- (BOOL)useTrilinearInterpolation;
- (BilateralSolverGPU)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 maxVertices:(unint64_t)a5 metalContext:(id)a6;
- (int)_doBistochastizeWithCommandBuffer:(id)a3 t_tex:(id)a4 c_tex:(id)a5 nIterations:(int)a6;
- (int)_doPCGWithCommandBuffer:(id)a3 nIterations:(int)a4;
- (int)_doSliceTrilinearWithCommandBuffer:(id)a3 ref_tex:(id)a4 o_tex:(id)a5;
- (int)_doSliceWithCommandBuffer:(id)a3 o_tex:(id)a4;
- (int)doSolveWithBilateralGridhash:(id)a3 reference:(id)a4 input:(id)a5 confidence:(id)a6 output:(id)a7 lambda:(float)a8 maxIterations:(int)a9;
- (void)_prepareResources:(id)a3;
- (void)_setupBuffer;
- (void)_setupPipelines;
- (void)setUseTrilinearInterpolation:(BOOL)a3;
@end

@implementation BilateralSolverGPU

- (BilateralSolverGPU)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 maxVertices:(unint64_t)a5 metalContext:(id)a6
{
  id v11 = a6;
  if (v11 && a3 && a4)
  {
    v26.receiver = self;
    v26.super_class = (Class)BilateralSolverGPU;
    v12 = [(BilateralSolverGPU *)&v26 init];
    v13 = v12;
    if (v12)
    {
      v12->_useTrilinearInterpolation = 1;
      v12->_width = a3;
      v12->_height = a4;
      v12->_maxVertices = a5;
      objc_storeStrong((id *)&v12->_metalContext, a6);
      objc_msgSend__setupPipelines(v13, v14, v15, v16, v17, v18);
      objc_msgSend__setupBuffer(v13, v19, v20, v21, v22, v23);
    }
    self = v13;
    v24 = self;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
  }

  return v24;
}

- (int)doSolveWithBilateralGridhash:(id)a3 reference:(id)a4 input:(id)a5 confidence:(id)a6 output:(id)a7 lambda:(float)a8 maxIterations:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  objc_super v26 = v20;
  if (!v16) {
    goto LABEL_15;
  }
  if (!v17) {
    goto LABEL_15;
  }
  if (!v18) {
    goto LABEL_15;
  }
  if (!v19) {
    goto LABEL_15;
  }
  if (!v20) {
    goto LABEL_15;
  }
  if (!objc_msgSend_hashTableSize(v16, v21, v22, v23, v24, v25)) {
    goto LABEL_15;
  }
  self->_params.lambda = a8;
  self->_params.N = objc_msgSend_hashTableSize(v16, v27, v28, v29, v30, v31);
  self->_params.dims = objc_msgSend_countDims(v16, v32, v33, v34, v35, v36);
  self->_params.sigma_s = (float)(int)objc_msgSend_sigma_s(v16, v37, v38, v39, v40, v41);
  self->_params.sigma_r_luma = (float)(int)objc_msgSend_sigma_r_luma(v16, v42, v43, v44, v45, v46);
  v52 = objc_msgSend_commandQueue(self->_metalContext, v47, v48, v49, v50, v51);
  v58 = objc_msgSend_commandBuffer(v52, v53, v54, v55, v56, v57);

  if (v58)
  {
    objc_msgSend__prepareResources_(self, v59, (uint64_t)v16, v60, v61, v62);
    objc_msgSend__doBistochastizeWithCommandBuffer_t_tex_c_tex_nIterations_(self, v63, (uint64_t)v58, (uint64_t)v18, (uint64_t)v19, 10);
    objc_msgSend__doPCGWithCommandBuffer_nIterations_(self, v64, (uint64_t)v58, v9, v65, v66);
    if (self->_useTrilinearInterpolation) {
      objc_msgSend__doSliceTrilinearWithCommandBuffer_ref_tex_o_tex_(self, v67, (uint64_t)v58, (uint64_t)v17, (uint64_t)v26, v69);
    }
    else {
      objc_msgSend__doSliceWithCommandBuffer_o_tex_(self, v67, (uint64_t)v58, (uint64_t)v26, v68, v69);
    }
    if (*MEMORY[0x263F00E10])
    {
      v75 = objc_msgSend_commandQueue(v58, v70, v71, v72, v73, v74);
      v81 = objc_msgSend_commandBuffer(v75, v76, v77, v78, v79, v80);

      objc_msgSend_setLabel_(v81, v82, @"KTRACE_MTLCMDBUF", v83, v84, v85);
      objc_msgSend_addCompletedHandler_(v81, v86, (uint64_t)&unk_270E224C0, v87, v88, v89);
      objc_msgSend_commit(v81, v90, v91, v92, v93, v94);
      objc_msgSend_addCompletedHandler_(v58, v95, (uint64_t)&unk_270E224E0, v96, v97, v98);
    }
    objc_msgSend_commit(v58, v70, v71, v72, v73, v74);

    int v99 = 0;
  }
  else
  {
LABEL_15:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v99 = FigSignalErrorAt();
  }

  return v99;
}

- (void)_setupPipelines
{
  uint64_t v3 = 0;
  computePipelines = self->_computePipelines;
  do
  {
    id v5 = [NSString alloc];
    v10 = objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)off_2655BF308[v3], v7, v8, v9);
    uint64_t v14 = objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v11, (uint64_t)v10, 0, v12, v13);
    uint64_t v15 = computePipelines[v3];
    computePipelines[v3] = (MTLComputePipelineState *)v14;

    ++v3;
  }
  while (v3 != 9);
}

- (void)_setupBuffer
{
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 53, self->_width, self->_height, 0);
  id v114 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = 1;
  objc_msgSend_setUsage_(v114, v4, 1, v5, v6, v7);
  uint64_t v13 = objc_msgSend_device(self->_metalContext, v8, v9, v10, v11, v12);
  id v18 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v13, v14, (uint64_t)v114, v15, v16, v17);
  gridHashMatrix = self->_gridHashMatrix;
  self->_gridHashMatrix = v18;

  uint64_t v25 = objc_msgSend_device(self->_metalContext, v20, v21, v22, v23, v24);
  uint64_t v29 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v25, v26, 4 * self->_maxVertices, 0, v27, v28);
  A_buf = self->_A_buf;
  self->_A_buf = v29;

  uint64_t v36 = objc_msgSend_device(self->_metalContext, v31, v32, v33, v34, v35);
  uint64_t v40 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v36, v37, 4 * self->_maxVertices, 0, v38, v39);
  b_buf = self->_b_buf;
  self->_b_buf = v40;

  v47 = objc_msgSend_device(self->_metalContext, v42, v43, v44, v45, v46);
  uint64_t v51 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v47, v48, 4 * self->_maxVertices, 0, v49, v50);
  s_buf = self->_s_buf;
  self->_s_buf = v51;

  v58 = objc_msgSend_device(self->_metalContext, v53, v54, v55, v56, v57);
  uint64_t v62 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v58, v59, 4 * self->_maxVertices, 0, v60, v61);
  q_buf = self->_q_buf;
  self->_q_buf = v62;

  uint64_t v69 = 0;
  Dn_buf = self->_Dn_buf;
  x_buf = self->_x_buf;
  r_buf = self->_r_buf;
  d_buf = self->_d_buf;
  do
  {
    char v74 = v3;
    v75 = objc_msgSend_device(self->_metalContext, v64, v65, v66, v67, v68);
    uint64_t v79 = objc_msgSend_newBufferWithLength_options_(v75, v76, 4 * self->_maxVertices, 0, v77, v78);
    uint64_t v80 = Dn_buf[v69];
    Dn_buf[v69] = (MTLBuffer *)v79;

    v86 = objc_msgSend_device(self->_metalContext, v81, v82, v83, v84, v85);
    uint64_t v90 = objc_msgSend_newBufferWithLength_options_(v86, v87, 4 * self->_maxVertices, 0, v88, v89);
    uint64_t v91 = x_buf[v69];
    x_buf[v69] = (MTLBuffer *)v90;

    uint64_t v97 = objc_msgSend_device(self->_metalContext, v92, v93, v94, v95, v96);
    uint64_t v101 = objc_msgSend_newBufferWithLength_options_(v97, v98, 4 * self->_maxVertices, 0, v99, v100);
    v102 = r_buf[v69];
    r_buf[v69] = (MTLBuffer *)v101;

    v108 = objc_msgSend_device(self->_metalContext, v103, v104, v105, v106, v107);
    uint64_t v112 = objc_msgSend_newBufferWithLength_options_(v108, v109, 4 * self->_maxVertices, 0, v110, v111);
    v113 = d_buf[v69];
    d_buf[v69] = (MTLBuffer *)v112;

    char v3 = 0;
    uint64_t v69 = 1;
  }
  while ((v74 & 1) != 0);
}

- (void)_prepareResources:(id)a3
{
  id v4 = a3;
  unsigned int v10 = objc_msgSend_hashTableSize(v4, v5, v6, v7, v8, v9);
  uint64_t width = self->_width;
  uint64_t height = self->_height;
  self->_threadGroupInfo.dispatchThreadgroups.uint64_t width = ((unint64_t)v10 + 127) >> 7;
  *(int64x2_t *)&self->_threadGroupInfo.dispatchThreadgroups.uint64_t height = vdupq_n_s64(1uLL);
  *(_OWORD *)&self->_threadGroupInfo.threadsPerThreadgroup.uint64_t width = xmmword_262EB9C20;
  self->_threadGroupInfo.threadsPerThreadgroup.depth = 1;
  uint64_t v17 = objc_msgSend_hash_table(v4, v12, v13, v14, v15, v16);
  uint64_t v18 = *(unsigned int *)(v17 + 24 * (v10 - 1) + 20);
  uint64_t v24 = objc_msgSend_blur_table(v4, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_coord_indices(v4, v25, v26, v27, v28, v29);
  uint64_t v131 = objc_msgSend_coord_table(v4, v31, v32, v33, v34, v35);
  uint64_t v132 = objc_msgSend_hash_matrix(v4, v36, v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_interp_indices(v4, v41, v42, v43, v44, v45);
  uint64_t v134 = objc_msgSend_interp_table(v4, v47, v48, v49, v50, v51);
  uint64_t v135 = objc_msgSend_interp_pad(v4, v52, v53, v54, v55, v56);

  uint64_t v57 = *(unsigned int *)(v46 + 4 * v10);
  v63 = objc_msgSend_device(self->_metalContext, v58, v59, v60, v61, v62);
  uint64_t v66 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v63, v64, v17, 24 * v10, 0, v65);
  gridHashBuffer = self->_gridHashBuffer;
  self->_gridHashBuffer = v66;

  uint64_t v73 = objc_msgSend_device(self->_metalContext, v68, v69, v70, v71, v72);
  v76 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v73, v74, v24, 4 * v18, 0, v75);
  gridBlurBuffer = self->_gridBlurBuffer;
  self->_gridBlurBuffer = v76;

  uint64_t v83 = objc_msgSend_device(self->_metalContext, v78, v79, v80, v81, v82);
  uint64_t v84 = 4 * (v10 + 1);
  uint64_t v87 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v83, v85, v30, v84, 0, v86);
  gridCoordIndicesBuffer = self->_gridCoordIndicesBuffer;
  self->_gridCoordIndicesBuffer = v87;

  uint64_t v94 = objc_msgSend_device(self->_metalContext, v89, v90, v91, v92, v93);
  uint64_t v97 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v94, v95, v131, 4 * (height * width), 0, v96);
  gridCoordTableBuffer = self->_gridCoordTableBuffer;
  self->_gridCoordTableBuffer = v97;

  memset(v136, 0, 24);
  gridHashMatrix = self->_gridHashMatrix;
  v136[3] = width;
  v136[4] = height;
  v136[5] = 1;
  objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(gridHashMatrix, v100, (uint64_t)v136, 0, v132, 4 * width);
  uint64_t v106 = objc_msgSend_device(self->_metalContext, v101, v102, v103, v104, v105);
  v109 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v106, v107, v46, v84, 0, v108);
  gridInterpIndicesBuffer = self->_gridInterpIndicesBuffer;
  self->_gridInterpIndicesBuffer = v109;

  v116 = objc_msgSend_device(self->_metalContext, v111, v112, v113, v114, v115);
  v119 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v116, v117, v134, 4 * v57, 0, v118);
  gridInterpTableBuffer = self->_gridInterpTableBuffer;
  self->_gridInterpTableBuffer = v119;

  v126 = objc_msgSend_device(self->_metalContext, v121, v122, v123, v124, v125);
  v129 = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v126, v127, v135, v57, 0, v128);
  gridInterpPadBuffer = self->_gridInterpPadBuffer;
  self->_gridInterpPadBuffer = v129;
}

- (int)_doBistochastizeWithCommandBuffer:(id)a3 t_tex:(id)a4 c_tex:(id)a5 nIterations:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  *(void *)&self->_idxDnBufIn = 0;
  uint64_t v18 = objc_msgSend_computeCommandEncoder(v10, v13, v14, v15, v16, v17);
  objc_msgSend_setComputePipelineState_(v18, v19, (uint64_t)self->_computePipelines[0], v20, v21, v22);
  objc_msgSend_setBuffer_offset_atIndex_(v18, v23, (uint64_t)self->_gridHashBuffer, 0, 0, v24);
  objc_msgSend_setBuffer_offset_atIndex_(v18, v25, (uint64_t)self->_gridBlurBuffer, 0, 1, v26);
  Dn_buf = self->_Dn_buf;
  objc_msgSend_setBuffer_offset_atIndex_(v18, v28, (uint64_t)self->_Dn_buf[self->_idxDnBufIn], 0, 2, v29);
  objc_msgSend_setBytes_length_atIndex_(v18, v30, (uint64_t)&self->_params, 20, 3, v31);
  p_threadGroupInfo = &self->_threadGroupInfo;
  p_$E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = &self->_threadGroupInfo.threadsPerThreadgroup;
  long long v110 = *(_OWORD *)&self->_threadGroupInfo.dispatchThreadgroups.width;
  unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  $E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = self->_threadGroupInfo.threadsPerThreadgroup;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v18, v34, (uint64_t)&v110, (uint64_t)&threadsPerThreadgroup, v35, v36);
  objc_msgSend_endEncoding(v18, v37, v38, v39, v40, v41);

  if (a6 >= 2)
  {
    int v47 = a6 - 1;
    do
    {
      uint64_t v48 = objc_msgSend_computeCommandEncoder(v10, v42, v43, v44, v45, v46);
      objc_msgSend_setComputePipelineState_(v48, v49, (uint64_t)self->_computePipelines[1], v50, v51, v52);
      objc_msgSend_setBuffer_offset_atIndex_(v48, v53, (uint64_t)self->_gridHashBuffer, 0, 0, v54);
      objc_msgSend_setBuffer_offset_atIndex_(v48, v55, (uint64_t)self->_gridBlurBuffer, 0, 1, v56);
      objc_msgSend_setBuffer_offset_atIndex_(v48, v57, (uint64_t)Dn_buf[self->_idxDnBufIn], 0, 2, v58);
      objc_msgSend_setBuffer_offset_atIndex_(v48, v59, (uint64_t)Dn_buf[self->_idxDnBufIn ^ 1], 0, 3, v60);
      objc_msgSend_setBytes_length_atIndex_(v48, v61, (uint64_t)&self->_params, 20, 4, v62);
      long long v110 = *(_OWORD *)&p_threadGroupInfo->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&p_threadsPerThreadgroup->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v48, v63, (uint64_t)&v110, (uint64_t)&threadsPerThreadgroup, v64, v65);
      objc_msgSend_endEncoding(v48, v66, v67, v68, v69, v70);
      self->_idxDnBufIn ^= 1u;

      --v47;
    }
    while (v47);
  }
  uint64_t v71 = objc_msgSend_computeCommandEncoder(v10, v42, v43, v44, v45, v46);
  objc_msgSend_setComputePipelineState_(v71, v72, (uint64_t)self->_computePipelines[2], v73, v74, v75);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v76, (uint64_t)self->_gridHashBuffer, 0, 0, v77);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v78, (uint64_t)self->_gridBlurBuffer, 0, 1, v79);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v80, (uint64_t)self->_gridCoordIndicesBuffer, 0, 2, v81);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v82, (uint64_t)self->_gridCoordTableBuffer, 0, 3, v83);
  objc_msgSend_setTexture_atIndex_(v71, v84, (uint64_t)v11, 0, v85, v86);
  objc_msgSend_setTexture_atIndex_(v71, v87, (uint64_t)v12, 1, v88, v89);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v90, (uint64_t)Dn_buf[self->_idxDnBufIn], 0, 4, v91);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v92, (uint64_t)self->_A_buf, 0, 5, v93);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v94, (uint64_t)self->_b_buf, 0, 6, v95);
  objc_msgSend_setBuffer_offset_atIndex_(v71, v96, (uint64_t)self->_x_buf[self->_idxSwapBufIn], 0, 7, v97);
  objc_msgSend_setBytes_length_atIndex_(v71, v98, (uint64_t)&self->_params, 20, 8, v99);
  long long v110 = *(_OWORD *)&p_threadGroupInfo->dispatchThreadgroups.width;
  unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&p_threadsPerThreadgroup->width;
  threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v71, v100, (uint64_t)&v110, (uint64_t)&threadsPerThreadgroup, v101, v102);
  objc_msgSend_endEncoding(v71, v103, v104, v105, v106, v107);

  return 0;
}

- (int)_doPCGWithCommandBuffer:(id)a3 nIterations:(int)a4
{
  id v6 = a3;
  id v12 = objc_msgSend_device(self->_metalContext, v7, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_newBufferWithLength_options_(v12, v13, 4, 0, v14, v15);

  uint64_t v22 = objc_msgSend_device(self->_metalContext, v17, v18, v19, v20, v21);
  v207 = objc_msgSend_newBufferWithLength_options_(v22, v23, 4, 0, v24, v25);

  uint64_t v31 = objc_msgSend_device(self->_metalContext, v26, v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_newBufferWithLength_options_(v31, v32, 1, 0, v33, v34);

  uint64_t v41 = objc_msgSend_computeCommandEncoder(v6, v36, v37, v38, v39, v40);
  objc_msgSend_setComputePipelineState_(v41, v42, (uint64_t)self->_computePipelines[3], v43, v44, v45);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v46, (uint64_t)self->_gridHashBuffer, 0, 0, v47);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v48, (uint64_t)self->_gridBlurBuffer, 0, 1, v49);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v50, (uint64_t)self->_Dn_buf[self->_idxDnBufIn], 0, 2, v51);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v52, (uint64_t)self->_A_buf, 0, 3, v53);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v54, (uint64_t)self->_b_buf, 0, 4, v55);
  x_buf = self->_x_buf;
  objc_msgSend_setBuffer_offset_atIndex_(v41, v56, (uint64_t)self->_x_buf[self->_idxSwapBufIn], 0, 5, v57);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v58, (uint64_t)self->_r_buf[self->_idxSwapBufIn], 0, 6, v59);
  d_buf = self->_d_buf;
  objc_msgSend_setBuffer_offset_atIndex_(v41, v61, (uint64_t)self->_d_buf[self->_idxSwapBufIn], 0, 7, v62);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v63, (uint64_t)v16, 0, 8, v64);
  objc_msgSend_setBuffer_offset_atIndex_(v41, v65, v35, 0, 9, v66);
  objc_msgSend_setBytes_length_atIndex_(v41, v67, (uint64_t)&self->_params, 20, 10, v68);
  long long v212 = *(_OWORD *)&self->_threadGroupInfo.dispatchThreadgroups.width;
  unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  $E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = self->_threadGroupInfo.threadsPerThreadgroup;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v41, v69, (uint64_t)&v212, (uint64_t)&threadsPerThreadgroup, v70, v71);
  objc_msgSend_endEncoding(v41, v72, v73, v74, v75, v76);

  v210 = v6;
  v206 = (void *)v35;
  if (a4 < 1)
  {
    v150 = v16;
  }
  else
  {
    p_$E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = &self->_threadGroupInfo.threadsPerThreadgroup;
    p_threadGroupInfo = &self->_threadGroupInfo;
    r_buf = self->_r_buf;
    uint64_t v82 = &self->_threadGroupInfo;
    uint64_t v83 = &self->_threadGroupInfo.threadsPerThreadgroup;
    do
    {
      int v209 = a4;
      uint64_t v84 = objc_msgSend_device(self->_metalContext, v77, v78, v79, v80, v81, p_threadsPerThreadgroup, p_threadGroupInfo);
      uint64_t v208 = objc_msgSend_newBufferWithLength_options_(v84, v85, 4, 0, v86, v87);

      uint64_t v93 = objc_msgSend_computeCommandEncoder(v210, v88, v89, v90, v91, v92);
      objc_msgSend_setComputePipelineState_(v93, v94, (uint64_t)self->_computePipelines[4], v95, v96, v97);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v98, (uint64_t)self->_gridHashBuffer, 0, 0, v99);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v100, (uint64_t)self->_gridBlurBuffer, 0, 1, v101);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v102, (uint64_t)self->_Dn_buf[self->_idxDnBufIn], 0, 2, v103);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v104, (uint64_t)self->_A_buf, 0, 3, v105);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v106, (uint64_t)d_buf[self->_idxSwapBufIn], 0, 4, v107);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v108, (uint64_t)self->_q_buf, 0, 5, v109);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v110, (uint64_t)v207, 0, 6, v111);
      objc_msgSend_setBuffer_offset_atIndex_(v93, v112, (uint64_t)v206, 0, 7, v113);
      objc_msgSend_setBytes_length_atIndex_(v93, v114, (uint64_t)&self->_params, 20, 8, v115);
      long long v212 = *(_OWORD *)&v82->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&v83->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v93, v116, (uint64_t)&v212, (uint64_t)&threadsPerThreadgroup, v117, v118);
      objc_msgSend_endEncoding(v93, v119, v120, v121, v122, v123);

      v129 = objc_msgSend_computeCommandEncoder(v210, v124, v125, v126, v127, v128);
      objc_msgSend_setComputePipelineState_(v129, v130, (uint64_t)self->_computePipelines[5], v131, v132, v133);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v134, (uint64_t)self->_A_buf, 0, 0, v135);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v136, (uint64_t)x_buf[self->_idxSwapBufIn], 0, 1, v137);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v138, (uint64_t)r_buf[self->_idxSwapBufIn], 0, 2, v139);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v140, (uint64_t)d_buf[self->_idxSwapBufIn], 0, 3, v141);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v142, (uint64_t)self->_q_buf, 0, 4, v143);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v144, (uint64_t)x_buf[self->_idxSwapBufIn ^ 1], 0, 5, v145);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v146, (uint64_t)r_buf[self->_idxSwapBufIn ^ 1], 0, 6, v147);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v148, (uint64_t)self->_s_buf, 0, 7, v149);
      v150 = (void *)v208;
      objc_msgSend_setBuffer_offset_atIndex_(v129, v151, v208, 0, 8, v152);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v153, (uint64_t)v16, 0, 9, v154);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v155, (uint64_t)v207, 0, 10, v156);
      objc_msgSend_setBuffer_offset_atIndex_(v129, v157, (uint64_t)v206, 0, 11, v158);
      objc_msgSend_setBytes_length_atIndex_(v129, v159, (uint64_t)&self->_params, 20, 12, v160);
      long long v212 = *(_OWORD *)&v82->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&v83->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v129, v161, (uint64_t)&v212, (uint64_t)&threadsPerThreadgroup, v162, v163);
      objc_msgSend_endEncoding(v129, v164, v165, v166, v167, v168);

      v174 = objc_msgSend_computeCommandEncoder(v210, v169, v170, v171, v172, v173);
      objc_msgSend_setComputePipelineState_(v174, v175, (uint64_t)self->_computePipelines[6], v176, v177, v178);
      objc_msgSend_setBuffer_offset_atIndex_(v174, v179, (uint64_t)self->_s_buf, 0, 0, v180);
      objc_msgSend_setBuffer_offset_atIndex_(v174, v181, (uint64_t)d_buf[self->_idxSwapBufIn], 0, 1, v182);
      objc_msgSend_setBuffer_offset_atIndex_(v174, v183, (uint64_t)d_buf[self->_idxSwapBufIn ^ 1], 0, 2, v184);
      objc_msgSend_setBuffer_offset_atIndex_(v174, v185, (uint64_t)v16, 0, 3, v186);
      objc_msgSend_setBuffer_offset_atIndex_(v174, v187, v208, 0, 4, v188);
      objc_msgSend_setBuffer_offset_atIndex_(v174, v189, (uint64_t)v206, 0, 5, v190);
      objc_msgSend_setBytes_length_atIndex_(v174, v191, (uint64_t)&self->_params, 20, 6, v192);
      long long v212 = *(_OWORD *)&v82->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&v83->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v174, v193, (uint64_t)&v212, (uint64_t)&threadsPerThreadgroup, v194, v195);
      objc_msgSend_endEncoding(v174, v196, v197, v198, v199, v200);

      self->_idxSwapBufIn ^= 1u;
      uint64_t v16 = (void *)v208;
      --a4;
    }
    while (v209 != 1);
  }

  return 0;
}

- (int)_doSliceWithCommandBuffer:(id)a3 o_tex:(id)a4
{
  unsigned int width = self->_width;
  unsigned int height = self->_height;
  uint64_t v8 = self->_computePipelines[7];
  id v9 = a4;
  id v10 = a3;
  LODWORD(a3) = objc_msgSend_threadExecutionWidth(v8, v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[7], v16, v17, v18, v19, v20)
      / a3;
  uint64_t v27 = objc_msgSend_computeCommandEncoder(v10, v22, v23, v24, v25, v26);

  objc_msgSend_setComputePipelineState_(v27, v28, (uint64_t)self->_computePipelines[7], v29, v30, v31);
  objc_msgSend_setTexture_atIndex_(v27, v32, (uint64_t)self->_gridHashMatrix, 0, v33, v34);
  objc_msgSend_setBuffer_offset_atIndex_(v27, v35, (uint64_t)self->_x_buf[self->_idxSwapBufIn], 0, 0, v36);
  objc_msgSend_setTexture_atIndex_(v27, v37, (uint64_t)v9, 1, v38, v39);

  v50[0] = (width + a3 - 1) / a3;
  v50[1] = (height + v21 - 1) / v21;
  v50[2] = 1;
  v49[0] = a3;
  v49[1] = v21;
  v49[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v27, v40, (uint64_t)v50, (uint64_t)v49, v41, v42);
  objc_msgSend_endEncoding(v27, v43, v44, v45, v46, v47);

  return 0;
}

- (int)_doSliceTrilinearWithCommandBuffer:(id)a3 ref_tex:(id)a4 o_tex:(id)a5
{
  unsigned int width = self->_width;
  unsigned int height = self->_height;
  id v10 = self->_computePipelines[8];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  LODWORD(a4) = objc_msgSend_threadExecutionWidth(v10, v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[8], v19, v20, v21, v22, v23)
      / a4;
  uint64_t v30 = objc_msgSend_computeCommandEncoder(v13, v25, v26, v27, v28, v29);

  objc_msgSend_setComputePipelineState_(v30, v31, (uint64_t)self->_computePipelines[8], v32, v33, v34);
  objc_msgSend_setTexture_atIndex_(v30, v35, (uint64_t)self->_gridHashMatrix, 0, v36, v37);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v38, (uint64_t)self->_gridInterpIndicesBuffer, 0, 0, v39);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v40, (uint64_t)self->_gridInterpTableBuffer, 0, 1, v41);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v42, (uint64_t)self->_gridInterpPadBuffer, 0, 2, v43);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v44, (uint64_t)self->_x_buf[self->_idxSwapBufIn], 0, 3, v45);
  objc_msgSend_setTexture_atIndex_(v30, v46, (uint64_t)v12, 1, v47, v48);

  objc_msgSend_setTexture_atIndex_(v30, v49, (uint64_t)v11, 2, v50, v51);
  objc_msgSend_setBytes_length_atIndex_(v30, v52, (uint64_t)&self->_params, 20, 4, v53);
  v64[0] = (a4 + (width >> 1) - 1) / a4;
  v64[1] = (v24 + (height >> 1) - 1) / v24;
  v64[2] = 1;
  v63[0] = a4;
  v63[1] = v24;
  v63[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v30, v54, (uint64_t)v64, (uint64_t)v63, v55, v56);
  objc_msgSend_endEncoding(v30, v57, v58, v59, v60, v61);

  return 0;
}

- (BOOL)useTrilinearInterpolation
{
  return self->_useTrilinearInterpolation;
}

- (void)setUseTrilinearInterpolation:(BOOL)a3
{
  self->_useTrilinearInterpolation = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  id v4 = &self->_d_buf[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_r_buf[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_x_buf[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_Dn_buf[k + 1], 0);
  objc_storeStrong((id *)&self->_q_buf, 0);
  objc_storeStrong((id *)&self->_s_buf, 0);
  objc_storeStrong((id *)&self->_b_buf, 0);
  objc_storeStrong((id *)&self->_A_buf, 0);
  objc_storeStrong((id *)&self->_gridInterpPadBuffer, 0);
  objc_storeStrong((id *)&self->_gridInterpTableBuffer, 0);
  objc_storeStrong((id *)&self->_gridInterpIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_gridHashMatrix, 0);
  objc_storeStrong((id *)&self->_gridCoordTableBuffer, 0);
  objc_storeStrong((id *)&self->_gridCoordIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_gridBlurBuffer, 0);
  objc_storeStrong((id *)&self->_gridHashBuffer, 0);
  for (uint64_t m = 80; m != 8; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end