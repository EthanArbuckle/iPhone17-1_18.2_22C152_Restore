@interface HBFGPU
- (HBFGPU)initWithMetalContext:(id)a3;
- (HBFGPUParameters)params;
- (int)_doBuildErrorMapWithCommandBuffer:(id)a3 in_res_tex:(id)a4 out_tex:(id)a5;
- (int)_doComputeResidualErrorOffsetWithCommandBuffer:(id)a3 in_res_tex:(id)a4;
- (int)_doComputeResidualErrorWithCommandBuffer:(id)a3 in_I0_u32_tex:(id)a4 in_I1_tex:(id)a5 in_uv_tex:(id)a6 out_tex:(id)a7 disparity_axis:;
- (int)_doOcclusionHandlingWithCommandBuffer:(id)a3 in_uv_old_tex:(id)a4 in_uv_new_tex:(id)a5 in_I0_u32_tex:(id)a6 in_I1_tex:(id)a7 out_tex:(id)a8 disparity_axis:(float)a9 disparity_scaling_factor:;
- (int)doFilterWithCommandBuffer:(id)a3 in_I0_u32_tex:(id)a4 in_I1_tex:(id)a5 in_uv_tex:(id)a6 out_uv_tex:(id)a7 tmp_res_tex:(id)a8 tmp_err_tex:(id)a9 tmp_uv0_tex:(id)a10 tmp_uv1_tex:(id)a11 needToComputeResidualOffset:(BOOL)a12 disparity_axis:(float)a13 disparity_scaling_factor:;
- (int)doFilterWithCommandBuffer:(id)a3 in_I_tex:(id)a4 in_J_u32_tex:(id)a5 in_W_tex:(id)a6 out_tex:(id)a7 disparity_scaling_factor:(float)a8;
- (void)_setupPipelines;
- (void)dealloc;
- (void)releaseResouces;
- (void)setParams:(id)a3;
- (void)waitUntilCompleted;
@end

@implementation HBFGPU

- (HBFGPU)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HBFGPU;
  v6 = [(HBFGPU *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    uint64_t v10 = objc_msgSend_commandQueue(v5, v8, v9);
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v10;

    v14 = objc_msgSend_device(v7->_mtlContext, v12, v13);
    uint64_t v16 = objc_msgSend_newBufferWithLength_options_(v14, v15, 4, 0);
    res_off_buf = v7->_res_off_buf;
    v7->_res_off_buf = (MTLBuffer *)v16;

    objc_msgSend__setupPipelines(v7, v18, v19);
  }

  return v7;
}

- (void)releaseResouces
{
  self->_res_off_buf = 0;
  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlContext, a2, v2);
  objc_msgSend_releaseResouces(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)HBFGPU;
  [(HBFGPU *)&v6 dealloc];
}

- (void)waitUntilCompleted
{
  objc_msgSend_commandBuffer(self->_commandQueue, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v8, v3, @"HBF:waitUntilCompleted");
  objc_msgSend_commit(v8, v4, v5);
  objc_msgSend_waitUntilCompleted(v8, v6, v7);
}

- (int)doFilterWithCommandBuffer:(id)a3 in_I0_u32_tex:(id)a4 in_I1_tex:(id)a5 in_uv_tex:(id)a6 out_uv_tex:(id)a7 tmp_res_tex:(id)a8 tmp_err_tex:(id)a9 tmp_uv0_tex:(id)a10 tmp_uv1_tex:(id)a11 needToComputeResidualOffset:(BOOL)a12 disparity_axis:(float)a13 disparity_scaling_factor:
{
  float v19 = v13;
  double v20 = *(double *)&a13;
  v71[2] = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v68 = a7;
  id v67 = a8;
  id v70 = a9;
  id v26 = a10;
  id v27 = a11;
  int v30 = objc_msgSend_iterations(self->_params, v28, v29);
  objc_msgSend_occ_thres(self->_params, v31, v32);
  float v34 = v33;
  id v35 = v26;
  v71[0] = v35;
  id v36 = v27;
  v71[1] = v36;
  v37 = v22;
  v69 = v23;
  v38 = v25;
  id v39 = v25;
  v40 = v67;
  int v42 = objc_msgSend__doComputeResidualErrorWithCommandBuffer_in_I0_u32_tex_in_I1_tex_in_uv_tex_out_tex_disparity_axis_(self, v41, (uint64_t)v22, v23, v24, v39, v67, v20);
  if (v42)
  {
    int v60 = v42;
LABEL_35:
    FigDebugAssert3();
    v61 = v24;
    goto LABEL_28;
  }
  if (a12)
  {
    int v44 = objc_msgSend__doComputeResidualErrorOffsetWithCommandBuffer_in_res_tex_(self, v43, (uint64_t)v22, v67);
    if (v44)
    {
      int v60 = v44;
      goto LABEL_35;
    }
  }
  int v45 = objc_msgSend__doBuildErrorMapWithCommandBuffer_in_res_tex_out_tex_(self, v43, (uint64_t)v22, v67, v70);
  if (v45)
  {
    int v60 = v45;
    goto LABEL_35;
  }
  id v65 = v36;
  id v66 = v35;
  if (v30 >= 1)
  {
    int v48 = 0;
    uint64_t v49 = 0;
    while (1)
    {
      BOOL v51 = v34 <= 0.0 && v30 + v48 == 1;
      v52 = v38;
      if (v48) {
        v52 = (void *)v71[v49];
      }
      id v53 = v52;
      if (v51)
      {
        v54 = v68;
        float v55 = v19;
      }
      else
      {
        v49 ^= 1uLL;
        v54 = (void *)v71[v49];
        float v55 = 1.0;
      }
      id v56 = v54;
      *(float *)&double v57 = v55;
      int v59 = objc_msgSend_doFilterWithCommandBuffer_in_I_tex_in_J_u32_tex_in_W_tex_out_tex_disparity_scaling_factor_(self, v58, (uint64_t)v22, v53, v69, v70, v56, v57);
      if (v59) {
        break;
      }

      --v48;
      if (!(v30 + v48)) {
        goto LABEL_22;
      }
    }
    int v60 = v59;
    FigDebugAssert3();

    goto LABEL_24;
  }
  uint64_t v49 = 0;
LABEL_22:
  if (v34 <= 0.0)
  {
    int v60 = 0;
LABEL_24:
    v61 = v24;
    v40 = v67;
    id v36 = v65;
    id v35 = v66;
    goto LABEL_28;
  }
  v62 = self;
  v61 = v24;
  *(float *)&double v47 = v19;
  int v60 = objc_msgSend__doOcclusionHandlingWithCommandBuffer_in_uv_old_tex_in_uv_new_tex_in_I0_u32_tex_in_I1_tex_out_tex_disparity_axis_disparity_scaling_factor_(v62, v46, (uint64_t)v22, v38, v71[v49], v69, v24, v68, v20, v47);
  id v36 = v65;
  id v35 = v66;
  if (v60) {
    FigDebugAssert3();
  }
  v40 = v67;
LABEL_28:
  for (uint64_t i = 1; i != -1; --i)

  return v60;
}

- (int)doFilterWithCommandBuffer:(id)a3 in_I_tex:(id)a4 in_J_u32_tex:(id)a5 in_W_tex:(id)a6 out_tex:(id)a7 disparity_scaling_factor:(float)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  params = self->_params;
  id v19 = a3;
  objc_msgSend_sigma_0(params, v20, v21);
  unsigned int v83 = v22;
  objc_msgSend_sigma_0(self->_params, v23, v24);
  unsigned int v85 = v25;
  objc_msgSend_sigma_1(self->_params, v26, v27);
  float32x2_t v29 = vadd_f32((float32x2_t)__PAIR64__(v28, v83), (float32x2_t)__PAIR64__(v28, v83));
  objc_msgSend_sigma_1(self->_params, v30, v31);
  float32x2_t v86 = vmul_f32(v29, (float32x2_t)__PAIR64__(v32, v85));
  objc_msgSend_sigma_2(self->_params, v33, v34);
  v29.f32[0] = v35 + v35;
  objc_msgSend_sigma_2(self->_params, v36, v37);
  float v84 = v29.f32[0] * v40;
  if (v16)
  {
    objc_msgSend_sigma_w(self->_params, v38, v39);
    float v42 = v41 + v41;
    objc_msgSend_sigma_w(self->_params, v43, v44);
    float v46 = v42 * v45;
  }
  else
  {
    float v46 = 1.0;
  }
  float v82 = v46;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  *((float *)&v89 + 2) = a8;
  LODWORD(v90) = 0;
  DWORD2(v90) = objc_msgSend_radius(self->_params, v38, v39);
  HIDWORD(v90) = objc_msgSend_scales(self->_params, v47, v48);
  LODWORD(v91) = objc_msgSend_padding(self->_params, v49, v50);
  *(float32x2_t *)v51.f32 = v86;
  v51.i64[1] = __PAIR64__(LODWORD(v82), LODWORD(v84));
  float32x4_t v92 = vdivq_f32((float32x4_t)xmmword_262F13760, v51);
  v54 = objc_msgSend_computeCommandEncoder(v19, v52, v53);

  id v56 = self->_computePipelines[4];
  if (v54)
  {
    objc_msgSend_setComputePipelineState_(v54, v55, (uint64_t)v56);
    objc_msgSend_setTexture_atIndex_(v54, v57, (uint64_t)v14, 0);
    objc_msgSend_setTexture_atIndex_(v54, v58, (uint64_t)v15, 1);
    objc_msgSend_setTexture_atIndex_(v54, v59, (uint64_t)v16, 2);
    objc_msgSend_setTexture_atIndex_(v54, v60, (uint64_t)v17, 3);
    objc_msgSend_setBytes_length_atIndex_(v54, v61, (uint64_t)&v89, 64, 0);
    unint64_t v64 = objc_msgSend_threadExecutionWidth(v56, v62, v63);
    unint64_t v67 = objc_msgSend_maxTotalThreadsPerThreadgroup(v56, v65, v66) / v64;
    int v70 = objc_msgSend_width(v17, v68, v69);
    if (v70 >= 0) {
      int v73 = v70;
    }
    else {
      int v73 = v70 + 1;
    }
    unint64_t v74 = (v64 + (v73 >> 1) - 1) / v64;
    int v75 = objc_msgSend_height(v17, v71, v72);
    if (v75 >= 0) {
      int v77 = v75;
    }
    else {
      int v77 = v75 + 1;
    }
    v88[0] = v74;
    v88[1] = (v67 + (v77 >> 1) - 1) / v67;
    v88[2] = 1;
    v87[0] = v64;
    v87[1] = v67;
    v87[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v54, v76, (uint64_t)v88, v87);
    objc_msgSend_endEncoding(v54, v78, v79);
    int v80 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v80 = FigSignalErrorAt();
  }

  return v80;
}

- (void)_setupPipelines
{
  uint64_t v3 = 0;
  computePipelines = self->_computePipelines;
  do
  {
    id v5 = [NSString alloc];
    uint64_t v7 = objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)off_2655C0B40[v3]);
    uint64_t v9 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v8, (uint64_t)v7, 0);
    uint64_t v10 = computePipelines[v3];
    computePipelines[v3] = (MTLComputePipelineState *)v9;

    unint64_t v15 = objc_msgSend_threadExecutionWidth(computePipelines[v3], v11, v12);
    unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v15 > maxThreadExecutionWidth) {
      unint64_t maxThreadExecutionWidth = objc_msgSend_threadExecutionWidth(computePipelines[v3], v13, v14);
    }
    self->_unint64_t maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v3;
  }
  while (v3 != 5);
}

- (int)_doComputeResidualErrorWithCommandBuffer:(id)a3 in_I0_u32_tex:(id)a4 in_I1_tex:(id)a5 in_uv_tex:(id)a6 out_tex:(id)a7 disparity_axis:
{
  unint64_t v8 = v7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  memset(&v51[1], 0, 48);
  v51[0] = v8;
  v18 = self->_computePipelines[0];
  uint64_t v21 = objc_msgSend_computeCommandEncoder(a3, v19, v20);
  id v23 = v21;
  if (v21)
  {
    objc_msgSend_setComputePipelineState_(v21, v22, (uint64_t)v18);
    objc_msgSend_setTexture_atIndex_(v23, v24, (uint64_t)v14, 0);
    objc_msgSend_setTexture_atIndex_(v23, v25, (uint64_t)v15, 1);
    objc_msgSend_setTexture_atIndex_(v23, v26, (uint64_t)v16, 2);
    objc_msgSend_setTexture_atIndex_(v23, v27, (uint64_t)v17, 3);
    objc_msgSend_setBytes_length_atIndex_(v23, v28, (uint64_t)v51, 64, 0);
    unint64_t v31 = objc_msgSend_threadExecutionWidth(v18, v29, v30);
    unint64_t v34 = objc_msgSend_maxTotalThreadsPerThreadgroup(v18, v32, v33) / v31;
    int v37 = objc_msgSend_width(v17, v35, v36);
    if (v37 >= 0) {
      int v40 = v37;
    }
    else {
      int v40 = v37 + 1;
    }
    unint64_t v41 = (v31 + (v40 >> 1) - 1) / v31;
    int v42 = objc_msgSend_height(v17, v38, v39);
    if (v42 >= 0) {
      int v44 = v42;
    }
    else {
      int v44 = v42 + 1;
    }
    v50[0] = v41;
    v50[1] = (v34 + (v44 >> 1) - 1) / v34;
    v50[2] = 1;
    v49[0] = v31;
    v49[1] = v34;
    v49[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v23, v43, (uint64_t)v50, v49);
    objc_msgSend_endEncoding(v23, v45, v46);
    int v47 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v47 = FigSignalErrorAt();
  }

  return v47;
}

- (int)_doComputeResidualErrorOffsetWithCommandBuffer:(id)a3 in_res_tex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v10 = objc_msgSend_width(v7, v8, v9);
  int v13 = objc_msgSend_height(v7, v11, v12);
  if (v10 > 32 || v13 >= 33)
  {
    FigDebugAssert3();
    int v25 = -12780;
  }
  else
  {
    id v14 = self->_computePipelines[1];
    id v17 = objc_msgSend_computeCommandEncoder(v6, v15, v16);
    if (v17)
    {
      id v19 = v17;
      objc_msgSend_setComputePipelineState_(v17, v18, (uint64_t)v14);
      objc_msgSend_setTexture_atIndex_(v19, v20, (uint64_t)v7, 0);
      objc_msgSend_setBuffer_offset_atIndex_(v19, v21, (uint64_t)self->_res_off_buf, 0, 0);
      int64x2_t v29 = vdupq_n_s64(1uLL);
      uint64_t v30 = 1;
      long long v27 = xmmword_262F13770;
      uint64_t v28 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v19, v22, (uint64_t)&v29, &v27);
      objc_msgSend_endEncoding(v19, v23, v24);

      int v25 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
    }
  }

  return v25;
}

- (int)_doBuildErrorMapWithCommandBuffer:(id)a3 in_res_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  params = self->_params;
  id v11 = a3;
  objc_msgSend_conf_min(params, v12, v13);
  HIDWORD(v53) = v14;
  objc_msgSend_conf_max(self->_params, v15, v16);
  float v18 = v17;
  objc_msgSend_conf_min(self->_params, v19, v20);
  *(float *)&long long v54 = 1.0 / (float)(v18 - v21);
  unsigned int v22 = self->_computePipelines[2];
  int v25 = objc_msgSend_computeCommandEncoder(v11, v23, v24);

  if (v25)
  {
    objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)v22);
    objc_msgSend_setTexture_atIndex_(v25, v27, (uint64_t)v8, 0);
    objc_msgSend_setTexture_atIndex_(v25, v28, (uint64_t)v9, 1);
    objc_msgSend_setBuffer_offset_atIndex_(v25, v29, (uint64_t)self->_res_off_buf, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v25, v30, (uint64_t)&v53, 64, 1);
    unint64_t v33 = objc_msgSend_threadExecutionWidth(v22, v31, v32);
    unint64_t v36 = objc_msgSend_maxTotalThreadsPerThreadgroup(v22, v34, v35) / v33;
    int v39 = objc_msgSend_width(v9, v37, v38);
    if (v39 >= 0) {
      int v42 = v39;
    }
    else {
      int v42 = v39 + 1;
    }
    unint64_t v43 = (v33 + (v42 >> 1) - 1) / v33;
    int v44 = objc_msgSend_height(v9, v40, v41);
    if (v44 >= 0) {
      int v46 = v44;
    }
    else {
      int v46 = v44 + 1;
    }
    v52[0] = v43;
    v52[1] = (v36 + (v46 >> 1) - 1) / v36;
    v52[2] = 1;
    v51[0] = v33;
    v51[1] = v36;
    v51[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v45, (uint64_t)v52, v51);
    objc_msgSend_endEncoding(v25, v47, v48);
    int v49 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v49 = FigSignalErrorAt();
  }

  return v49;
}

- (int)_doOcclusionHandlingWithCommandBuffer:(id)a3 in_uv_old_tex:(id)a4 in_uv_new_tex:(id)a5 in_I0_u32_tex:(id)a6 in_I1_tex:(id)a7 out_tex:(id)a8 disparity_axis:(float)a9 disparity_scaling_factor:
{
  int v10 = v9;
  unint64_t v11 = *(void *)&a9;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v66 = v11;
  params = self->_params;
  id v24 = a3;
  objc_msgSend_occ_thres(params, v25, v26);
  DWORD1(v67) = v27;
  DWORD2(v66) = v10;
  uint64_t v28 = self->_computePipelines[3];
  unint64_t v31 = objc_msgSend_computeCommandEncoder(v24, v29, v30);

  if (v31)
  {
    objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)v28);
    objc_msgSend_setTexture_atIndex_(v31, v33, (uint64_t)v18, 0);
    objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)v19, 1);
    objc_msgSend_setTexture_atIndex_(v31, v35, (uint64_t)v20, 2);
    objc_msgSend_setTexture_atIndex_(v31, v36, (uint64_t)v21, 3);
    objc_msgSend_setTexture_atIndex_(v31, v37, (uint64_t)v22, 4);
    objc_msgSend_setBuffer_offset_atIndex_(v31, v38, (uint64_t)self->_res_off_buf, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v31, v39, (uint64_t)&v66, 64, 1);
    unint64_t v42 = objc_msgSend_threadExecutionWidth(v28, v40, v41);
    unint64_t v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(v28, v43, v44) / v42;
    int v48 = objc_msgSend_width(v22, v46, v47);
    if (v48 >= 0) {
      int v51 = v48;
    }
    else {
      int v51 = v48 + 1;
    }
    id v52 = v21;
    id v53 = v20;
    id v54 = v19;
    id v55 = v18;
    unint64_t v56 = (v42 + (v51 >> 1) - 1) / v42;
    int v57 = objc_msgSend_height(v22, v49, v50);
    if (v57 >= 0) {
      int v59 = v57;
    }
    else {
      int v59 = v57 + 1;
    }
    v65[0] = v56;
    v65[1] = (v45 + (v59 >> 1) - 1) / v45;
    id v18 = v55;
    id v19 = v54;
    id v20 = v53;
    id v21 = v52;
    v65[2] = 1;
    v64[0] = v42;
    v64[1] = v45;
    v64[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v31, v58, (uint64_t)v65, v64);
    objc_msgSend_endEncoding(v31, v60, v61);
    int v62 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v62 = FigSignalErrorAt();
  }

  return v62;
}

- (HBFGPUParameters)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  self->_params = (HBFGPUParameters *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_res_off_buf, 0);
  for (uint64_t i = 56; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end