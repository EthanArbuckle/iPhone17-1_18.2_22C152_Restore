@interface FocalPlaneV2
- ($599F175E452E455E49EC8439362DB023)config;
- (FocalPlaneV2)initWithMetalContext:(id)a3;
- (MTLBuffer)minMaxAtomic_buf;
- (MTLBuffer)minMaxResult_buf;
- (MTLBuffer)zeroShiftResult_buf;
- (int)allocateResources;
- (int)compileShaders;
- (int)encodeDisparityRefinementPreprocessingOn:(id)a3 alphaTexture:(id)a4 inputDisparityTexture:(id)a5 outputDisparityTexture:(id)a6 configuration:(id *)a7;
- (int)encodeFocalPlaneCalcOn:(id)a3 disparityTexture:(id)a4;
- (int)encodeMinMaxOn:(id)a3 inputTexture:(id)a4;
- (void)dealloc;
- (void)releaseResources;
- (void)setConfig:(id *)a3;
@end

@implementation FocalPlaneV2

- (FocalPlaneV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FocalPlaneV2;
  v6 = [(FocalPlaneV2 *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    uint64_t v10 = objc_msgSend_device(v5, v8, v9);
    device = v7->_device;
    v7->_device = (MTLDevice *)v10;

    v12 = v7;
  }

  return v7;
}

- (int)allocateResources
{
  int v5 = objc_msgSend_compileShaders(self, a2, v2);
  if (v5)
  {
    uint64_t v19 = v3;
    int v18 = v5;
  }
  else
  {
    v7 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(self->_device, v6, 8, 32);
    minMaxAtomic_buf = self->_minMaxAtomic_buf;
    self->_minMaxAtomic_buf = v7;

    if (self->_minMaxAtomic_buf)
    {
      uint64_t v10 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(self->_device, v9, 16, 32);
      minMaxResult_buf = self->_minMaxResult_buf;
      self->_minMaxResult_buf = v10;

      if (self->_minMaxResult_buf)
      {
        v13 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(self->_device, v12, 4, 0);
        zeroShiftResult_buf = self->_zeroShiftResult_buf;
        self->_zeroShiftResult_buf = v13;

        if (self->_zeroShiftResult_buf) {
          return 0;
        }
        uint64_t v19 = v3;
        int v18 = 0;
      }
      else
      {
        uint64_t v19 = v3;
        int v18 = 0;
      }
    }
    else
    {
      uint64_t v19 = v3;
      int v18 = 0;
    }
  }
  FigDebugAssert3();
  objc_msgSend_releaseResources(self, v16, v17, v18, v19);
  return -12786;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)FocalPlaneV2;
  [(FocalPlaneV2 *)&v4 dealloc];
}

- (int)compileShaders
{
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, a2, @"disparityRefinementPreprocessing", 0);
  uint64_t v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  disparityRefinementPreprocessingKernel = self->_disparityRefinementPreprocessingKernel;
  self->_disparityRefinementPreprocessingKernel = v3;

  if (self->_disparityRefinementPreprocessingKernel)
  {
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v5, @"fpr_slm_shiftmap_calcminmax0", 0);
    v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    minMax0_kernel = self->_minMax0_kernel;
    self->_minMax0_kernel = v6;

    if (self->_minMax0_kernel)
    {
      objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v8, @"fpr_slm_shiftmap_calcminmax1", 0);
      uint64_t v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      minMax1_kernel = self->_minMax1_kernel;
      self->_minMax1_kernel = v9;

      if (self->_minMax1_kernel)
      {
        objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v11, @"fpr_slm_shiftmap_calcminmax2", 0);
        v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        minMax2_kernel = self->_minMax2_kernel;
        self->_minMax2_kernel = v12;

        if (self->_minMax2_kernel)
        {
          objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v14, @"fpr_slm_calc", 0);
          v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          calc_kernel = self->_calc_kernel;
          self->_calc_kernel = v15;

          if (self->_calc_kernel) {
            return 0;
          }
        }
      }
    }
  }
  FigDebugAssert3();
  return -12786;
}

- (void)releaseResources
{
  disparityRefinementPreprocessingKernel = self->_disparityRefinementPreprocessingKernel;
  self->_disparityRefinementPreprocessingKernel = 0;

  minMax0_kernel = self->_minMax0_kernel;
  self->_minMax0_kernel = 0;

  minMax1_kernel = self->_minMax1_kernel;
  self->_minMax1_kernel = 0;

  minMax2_kernel = self->_minMax2_kernel;
  self->_minMax2_kernel = 0;

  calc_kernel = self->_calc_kernel;
  self->_calc_kernel = 0;

  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = 0;

  minMaxResult_buf = self->_minMaxResult_buf;
  self->_minMaxResult_buf = 0;

  zeroShiftResult_buf = self->_zeroShiftResult_buf;
  self->_zeroShiftResult_buf = 0;
}

- (int)encodeDisparityRefinementPreprocessingOn:(id)a3 alphaTexture:(id)a4 inputDisparityTexture:(id)a5 outputDisparityTexture:(id)a6 configuration:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (objc_msgSend_pixelFormat(v14, v16, v17) != 25) {
    goto LABEL_12;
  }
  uint64_t v20 = objc_msgSend_width(v14, v18, v19);
  if (v20 != objc_msgSend_width(v15, v21, v22)) {
    goto LABEL_12;
  }
  uint64_t v25 = objc_msgSend_height(v14, v23, v24);
  if (v25 != objc_msgSend_height(v15, v26, v27)) {
    goto LABEL_12;
  }
  self->_config.zeroShiftPercentile = a7->var0;
  int v29 = objc_msgSend_encodeFocalPlaneCalcOn_disparityTexture_(self, v28, (uint64_t)v12, v14);
  if (v29)
  {
    int v54 = v29;
    FigDebugAssert3();
    goto LABEL_7;
  }
  v32 = objc_msgSend_computeCommandEncoder(v12, v30, v31);
  if (!v32)
  {
LABEL_12:
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
    goto LABEL_7;
  }
  v34 = v32;
  objc_msgSend_setComputePipelineState_(v32, v33, (uint64_t)self->_disparityRefinementPreprocessingKernel);
  objc_msgSend_setTexture_atIndex_(v34, v35, (uint64_t)v13, 0);
  objc_msgSend_setTexture_atIndex_(v34, v36, (uint64_t)v14, 1);
  objc_msgSend_setTexture_atIndex_(v34, v37, (uint64_t)v15, 2);
  objc_msgSend_setBytes_length_atIndex_(v34, v38, (uint64_t)a7, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v34, v39, (uint64_t)&self->_config, 20, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v34, v40, (uint64_t)self->_zeroShiftResult_buf, 0, 2);
  unint64_t v43 = objc_msgSend_threadExecutionWidth(self->_disparityRefinementPreprocessingKernel, v41, v42);
  unint64_t v46 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_disparityRefinementPreprocessingKernel, v44, v45) / v43;
  v57[0] = objc_msgSend_width(v15, v47, v48);
  v57[1] = objc_msgSend_height(v15, v49, v50);
  v57[2] = 1;
  v56[0] = v43;
  v56[1] = v46;
  v56[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v34, v51, (uint64_t)v57, v56);
  objc_msgSend_endEncoding(v34, v52, v53);

  int v54 = 0;
LABEL_7:

  return v54;
}

- (int)encodeMinMaxOn:(id)a3 inputTexture:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend_computeCommandEncoder(a3, v7, v8);
  v11 = v9;
  if (v9)
  {
    objc_msgSend_setComputePipelineState_(v9, v10, (uint64_t)self->_minMax0_kernel);
    objc_msgSend_setBuffer_offset_atIndex_(v11, v12, (uint64_t)self->_minMaxAtomic_buf, 0, 0);
    int64x2_t v36 = vdupq_n_s64(1uLL);
    int64x2_t v45 = v36;
    uint64_t v46 = 1;
    int64x2_t v43 = v36;
    uint64_t v44 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v11, v13, (uint64_t)&v45, &v43);
    objc_msgSend_setComputePipelineState_(v11, v14, (uint64_t)self->_minMax1_kernel);
    objc_msgSend_setTexture_atIndex_(v11, v15, (uint64_t)v6, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v11, v16, (uint64_t)self->_minMaxAtomic_buf, 0, 0);
    unint64_t v19 = objc_msgSend_threadExecutionWidth(self->_minMax1_kernel, v17, v18);
    unint64_t v22 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_minMax1_kernel, v20, v21) / v19;
    v42[0] = objc_msgSend_width(v6, v23, v24);
    v42[1] = objc_msgSend_height(v6, v25, v26);
    v42[2] = 1;
    v41[0] = v19;
    v41[1] = v22;
    v41[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v11, v27, (uint64_t)v42, v41);
    objc_msgSend_setComputePipelineState_(v11, v28, (uint64_t)self->_minMax2_kernel);
    objc_msgSend_setBuffer_offset_atIndex_(v11, v29, (uint64_t)self->_minMaxAtomic_buf, 0, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v11, v30, (uint64_t)self->_minMaxResult_buf, 0, 1);
    int64x2_t v39 = v36;
    uint64_t v40 = 1;
    int64x2_t v37 = v36;
    uint64_t v38 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v11, v31, (uint64_t)&v39, &v37);
    objc_msgSend_endEncoding(v11, v32, v33);
    int v34 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }

  return v34;
}

- (int)encodeFocalPlaneCalcOn:(id)a3 disparityTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v9 = objc_msgSend_encodeMinMaxOn_inputTexture_(self, v8, (uint64_t)v6, v7);
  if (v9)
  {
    int v23 = v9;
    FigDebugAssert3();
  }
  else
  {
    id v12 = objc_msgSend_computeCommandEncoder(v6, v10, v11);
    if (v12)
    {
      id v14 = v12;
      objc_msgSend_setComputePipelineState_(v12, v13, (uint64_t)self->_calc_kernel);
      objc_msgSend_setBytes_length_atIndex_(v14, v15, (uint64_t)&self->_config, 20, 0);
      objc_msgSend_setBuffer_offset_atIndex_(v14, v16, (uint64_t)self->_minMaxResult_buf, 0, 1);
      objc_msgSend_setBuffer_offset_atIndex_(v14, v17, (uint64_t)self->_zeroShiftResult_buf, 0, 2);
      objc_msgSend_setTexture_atIndex_(v14, v18, (uint64_t)v7, 0);
      objc_msgSend_setThreadgroupMemoryLength_atIndex_(v14, v19, 1024, 0);
      int64x2_t v27 = vdupq_n_s64(1uLL);
      uint64_t v28 = 1;
      long long v25 = xmmword_262F52EC0;
      uint64_t v26 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v14, v20, (uint64_t)&v27, &v25);
      objc_msgSend_endEncoding(v14, v21, v22);

      int v23 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
    }
  }

  return v23;
}

- ($599F175E452E455E49EC8439362DB023)config
{
  *($535467F3FA704D407BF639B2480A5E80 *)retstr = *($535467F3FA704D407BF639B2480A5E80 *)((char *)self + 88);
  return self;
}

- (void)setConfig:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_config.zeroShiftPercentile = a3->var4;
  *(_OWORD *)&self->_config.left = v3;
}

- (MTLBuffer)minMaxAtomic_buf
{
  return self->_minMaxAtomic_buf;
}

- (MTLBuffer)minMaxResult_buf
{
  return self->_minMaxResult_buf;
}

- (MTLBuffer)zeroShiftResult_buf
{
  return self->_zeroShiftResult_buf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroShiftResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxAtomic_buf, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_calc_kernel, 0);
  objc_storeStrong((id *)&self->_minMax2_kernel, 0);
  objc_storeStrong((id *)&self->_minMax1_kernel, 0);
  objc_storeStrong((id *)&self->_minMax0_kernel, 0);
  objc_storeStrong((id *)&self->_disparityRefinementPreprocessingKernel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end