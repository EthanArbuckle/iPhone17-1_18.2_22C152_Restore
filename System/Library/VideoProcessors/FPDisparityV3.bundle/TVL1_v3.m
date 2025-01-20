@interface TVL1_v3
- (BOOL)isValid;
- (CGSize)outputDisparityResolution;
- (PyrGPU)pyramidReference;
- (TVL1_v3)initWithMetalContext:(id)a3;
- (id)texturePAtLevel:(int)a3 idx_swap_p:(int)a4;
- (id)textureRaAtLevel:(int)a3;
- (id)textureRbAtLevel:(int)a3;
- (id)textureRdAtLevel:(int)a3;
- (id)textureUVAtLevel:(int)a3 idx_swap_uv:(int)a4;
- (id)textureUVRelaxAtLevel:(int)a3 idx_swap_uv:(int)a4;
- (int)_doUpscaleDualWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_doUpscaleSingleWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 coeff:(float)a6;
- (int)_setupBuffer;
- (int)_setupPipelines;
- (int)_setupTexture;
- (int)allocateResources;
- (int)countScales;
- (int)doInitPrimalDualWithCommandBuffer:(id)a3 disparity_value:(float)a4 idx_swap_uv:(int)a5 idx_swap_p:(int)a6 level:(int)a7;
- (int)doLocalRegularizationWithCommandBuffer:(id)a3 in_tex:(id)a4 level:(int)a5 parameters:(id)a6;
- (int)doSolveChambollePrimalDualWithCommandBuffer:(id)a3 idx_swap_uv_in_out:(int *)a4 idx_swap_p_in_out:(int *)a5 in_res_tes:(id)a6 in_hes_tes:(id)a7 out_uv_tex:(id)a8 level:(int)a9 iterations:(int)a10 box_cstr_range:(float)a11 disparity_scaling_factor:(id)a12 parameters:;
- (int)doUpscalePrimalDualWithCommandBuffer:(id)a3 idx_swap_uv_in_out:(int *)a4 idx_swap_p_in_out:(int *)a5 level:(int)a6 coeff:(float)a7;
- (void)dealloc;
- (void)releaseResources;
- (void)setPyramidReference:(id)a3;
@end

@implementation TVL1_v3

- (TVL1_v3)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TVL1_v3;
  v6 = [(TVL1_v3 *)&v18 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_mtlContext, a3);
  uint64_t v10 = objc_msgSend_commandQueue(v5, v8, v9);
  commandQueue = v7->_commandQueue;
  v7->_commandQueue = (MTLCommandQueue *)v10;

  v7->_isValid = 0;
  int v14 = objc_msgSend__setupPipelines(v7, v12, v13);
  v15 = v7;
  if (v14)
  {
    FigDebugAssert3();
LABEL_4:
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

- (int)allocateResources
{
  pyramidReference = self->_pyramidReference;
  if (pyramidReference)
  {
    self->_countScales = objc_msgSend_countScales(pyramidReference, a2, v2);
    self->_outputDisparityResolution = *(CGSize *)objc_msgSend_pyramidDimensions(self->_pyramidReference, v6, v7);
    if (objc_msgSend__setupBuffer(self, v8, v9))
    {
      uint64_t v16 = v3;
    }
    else
    {
      if (!objc_msgSend__setupTexture(self, v10, v11))
      {
        int v12 = 0;
        self->_isValid = 1;
        return v12;
      }
      uint64_t v16 = v3;
    }
    FigDebugAssert3();
  }
  else
  {
    uint64_t v16 = v3;
    FigDebugAssert3();
  }
  int v12 = FigSignalErrorAt();
  if (v12) {
    objc_msgSend_releaseResources(self, v14, v15, 0, v16);
  }
  return v12;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlContext, a2, v2);
  objc_msgSend_releaseResources(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)TVL1_v3;
  [(TVL1_v3 *)&v6 dealloc];
}

- (void)releaseResources
{
  self->_isValid = 0;
  R_a_pxbuf = self->_R_a_pxbuf;
  if (R_a_pxbuf)
  {
    CFRelease(R_a_pxbuf);
    self->_R_a_pxbuf = 0;
  }
  R_b_pxbuf = self->_R_b_pxbuf;
  if (R_b_pxbuf)
  {
    CFRelease(R_b_pxbuf);
    self->_R_b_pxbuf = 0;
  }
  R_d_pxbuf = self->_R_d_pxbuf;
  if (R_d_pxbuf)
  {
    CFRelease(R_d_pxbuf);
    self->_R_d_pxbuf = 0;
  }
  uint64_t v6 = 0;
  p_pxbuf = self->_p_pxbuf;
  uv_relax_pxbuf = self->_uv_relax_pxbuf;
  uv_pxbuf = self->_uv_pxbuf;
  char v10 = 1;
  do
  {
    char v11 = v10;
    int v12 = p_pxbuf[v6];
    if (v12)
    {
      CFRelease(v12);
      p_pxbuf[v6] = 0;
    }
    uint64_t v13 = uv_relax_pxbuf[v6];
    if (v13)
    {
      CFRelease(v13);
      uv_relax_pxbuf[v6] = 0;
    }
    int v14 = uv_pxbuf[v6];
    if (v14)
    {
      CFRelease(v14);
      uv_pxbuf[v6] = 0;
    }
    char v10 = 0;
    uint64_t v6 = 1;
  }
  while ((v11 & 1) != 0);
}

- (id)textureUVAtLevel:(int)a3 idx_swap_uv:(int)a4
{
  if (!self->_isValid || a3 < 0 || self->_countScales <= a3 || a4 >= 2)
  {
    FigDebugAssert3();
    v4 = 0;
  }
  else
  {
    v4 = self->_uv_tex[a3][a4];
  }

  return v4;
}

- (id)textureUVRelaxAtLevel:(int)a3 idx_swap_uv:(int)a4
{
  if (!self->_isValid || a3 < 0 || self->_countScales <= a3 || a4 >= 2)
  {
    FigDebugAssert3();
    v4 = 0;
  }
  else
  {
    v4 = self->_uv_relax_tex[a3][a4];
  }

  return v4;
}

- (id)texturePAtLevel:(int)a3 idx_swap_p:(int)a4
{
  if (!self->_isValid || a3 < 0 || self->_countScales <= a3 || a4 >= 2)
  {
    FigDebugAssert3();
    v4 = 0;
  }
  else
  {
    v4 = self->_p_tex[a3][a4];
  }

  return v4;
}

- (id)textureRaAtLevel:(int)a3
{
  if (!self->_isValid || a3 < 0 || self->_countScales <= a3)
  {
    FigDebugAssert3();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = self->_R_a_tex[a3];
  }

  return v3;
}

- (id)textureRbAtLevel:(int)a3
{
  if (!self->_isValid || a3 < 0 || self->_countScales <= a3)
  {
    FigDebugAssert3();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = self->_R_b_tex[a3];
  }

  return v3;
}

- (id)textureRdAtLevel:(int)a3
{
  if (!self->_isValid || a3 < 0 || self->_countScales <= a3)
  {
    FigDebugAssert3();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = self->_R_d_tex[a3];
  }

  return v3;
}

- (int)_setupPipelines
{
  uint64_t v3 = 0;
  computePipelines = self->_computePipelines;
  while (1)
  {
    id v5 = [NSString alloc];
    uint64_t v7 = objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)off_2655C0B18[v3]);
    uint64_t v9 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v8, (uint64_t)v7, 0);
    char v10 = computePipelines[v3];
    computePipelines[v3] = (MTLComputePipelineState *)v9;

    if (!computePipelines[v3]) {
      break;
    }

    if (++v3 == 5) {
      return 0;
    }
  }
  FigDebugAssert3();

  return -12786;
}

- (int)_setupBuffer
{
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_R_a_pxbuf = PixelBuffer;
  if (PixelBuffer)
  {
    v4 = (__CVBuffer *)CreatePixelBuffer();
    self->_R_b_pxbuf = v4;
    if (v4)
    {
      id v5 = (__CVBuffer *)CreatePixelBuffer();
      self->_R_d_pxbuf = v5;
      if (v5)
      {
        char v6 = 0;
        uint64_t v7 = 0;
        p_pxbuf = self->_p_pxbuf;
        uv_relax_pxbuf = self->_uv_relax_pxbuf;
        uv_pxbuf = self->_uv_pxbuf;
        while (1)
        {
          uint64_t v11 = CreatePixelBuffer();
          p_pxbuf[v7] = (__CVBuffer *)v11;
          if (!v11) {
            break;
          }
          uint64_t v12 = CreatePixelBuffer();
          uv_relax_pxbuf[v7] = (__CVBuffer *)v12;
          if (!v12) {
            break;
          }
          uint64_t v13 = CreatePixelBuffer();
          uv_pxbuf[v7] = (__CVBuffer *)v13;
          unsigned __int8 v14 = v6 ^ 1;
          char v6 = 1;
          uint64_t v7 = 1;
          if (((v13 != 0) & v14) == 0)
          {
            if (v13) {
              return 0;
            }
            else {
              return -12786;
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_setupTexture
{
  pyramidReference = self->_pyramidReference;
  if (pyramidReference)
  {
    uint64_t v40 = objc_msgSend_pyramidDimensions(pyramidReference, a2, v2);
    if ((int)objc_msgSend_countScales(self->_pyramidReference, v5, v6) < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v8 = 0;
      R_d_tex = self->_R_d_tex;
      R_a_tex = self->_R_a_tex;
      R_b_tex = self->_R_b_tex;
LABEL_4:
      uint64_t v9 = (double *)(v40 + 16 * v8);
      double v10 = *v9;
      double v11 = v9[1];
      uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v7, (uint64_t)self->_R_a_pxbuf, 25, 23, 0, *v9, v11);
      uint64_t v13 = R_a_tex[v8];
      R_a_tex[v8] = (MTLTexture *)v12;

      if (R_a_tex[v8])
      {
        uint64_t v15 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v14, (uint64_t)self->_R_d_pxbuf, 25, 23, 0, v10, v11);
        uint64_t v16 = R_d_tex[v8];
        R_d_tex[v8] = (MTLTexture *)v15;

        if (R_d_tex[v8])
        {
          uint64_t v18 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v17, (uint64_t)self->_R_b_pxbuf, 25, 23, 0, v10, v11);
          v19 = R_b_tex[v8];
          R_b_tex[v8] = (MTLTexture *)v18;

          if (R_b_tex[v8])
          {
            uint64_t v21 = 0;
            char v22 = 1;
            while (1)
            {
              char v23 = v22;
              uint64_t v24 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v20, (uint64_t)self->_p_pxbuf[v21], 65, 23, 0, v10, v11);
              v25 = self->_p_tex[v8];
              v26 = v25[v21];
              v25[v21] = (MTLTexture *)v24;

              if (!v25[v21]) {
                break;
              }
              uint64_t v28 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v27, (uint64_t)self->_uv_relax_pxbuf[v21], 25, 23, 0, v10, v11);
              v29 = self->_uv_relax_tex[v8];
              v30 = v29[v21];
              v29[v21] = (MTLTexture *)v28;

              if (!v29[v21]) {
                break;
              }
              uint64_t v32 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v31, (uint64_t)self->_uv_pxbuf[v21], 25, 23, 0, v10, v11);
              v33 = self->_uv_tex[v8];
              v34 = v33[v21];
              v33[v21] = (MTLTexture *)v32;

              if (!v33[v21]) {
                break;
              }
              char v22 = 0;
              uint64_t v21 = 1;
              if ((v23 & 1) == 0)
              {
                if (++v8 < (int)objc_msgSend_countScales(self->_pyramidReference, v20, v35)) {
                  goto LABEL_4;
                }
                return 0;
              }
            }
          }
        }
      }
      return -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    return -12780;
  }
}

- (int)doSolveChambollePrimalDualWithCommandBuffer:(id)a3 idx_swap_uv_in_out:(int *)a4 idx_swap_p_in_out:(int *)a5 in_res_tes:(id)a6 in_hes_tes:(id)a7 out_uv_tex:(id)a8 level:(int)a9 iterations:(int)a10 box_cstr_range:(float)a11 disparity_scaling_factor:(id)a12 parameters:
{
  float v13 = v12;
  uint64_t v14 = *(void *)&a11;
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v108 = a3;
  id v107 = a6;
  id v106 = a7;
  v111 = (MTLTexture *)a8;
  id v21 = a12;
  uint64_t v24 = v21;
  v105 = self;
  if (!self->_isValid) {
    goto LABEL_25;
  }
  objc_msgSend_tau(v21, v22, v23);
  int v26 = v25;
  objc_msgSend_sigma(v24, v27, v28);
  float v30 = v29;
  objc_msgSend_theta(v24, v31, v32);
  int v34 = v33;
  objc_msgSend_a_checkerboard(v24, v35, v36);
  float v38 = v37;
  objc_msgSend_b_checkerboard(v24, v39, v40);
  float v42 = v41;
  objc_msgSend_huber_eps(v24, v43, v44);
  if (v38 < 0.0) {
    goto LABEL_25;
  }
  if (v42 >= 0.0 && (float)(v38 + v42) <= 1.0)
  {
    v99 = v24;
    long long v119 = 0u;
    long long v120 = 0u;
    uint64_t v116 = v14;
    int v117 = v26;
    float v118 = v30;
    LODWORD(v119) = v34;
    *((float *)&v119 + 1) = 1.0 / (float)((float)(v30 * v45) + 1.0);
    *((float *)&v119 + 3) = v38;
    *(float *)&long long v120 = v42;
    v97 = a4;
    v98 = a5;
    int v46 = *a4;
    int v47 = *a5;
    if (a10 < 1)
    {
      int v100 = 0;
LABEL_22:
      int *v97 = v46;
      int *v98 = v47;
    }
    else
    {
      int v100 = 0;
      int v48 = 0;
      uint64_t v49 = a9;
      uv_tex = self->_uv_tex;
      uv_relax_tex = self->_uv_relax_tex;
      R_a_tex = self->_R_a_tex;
      R_d_tex = self->_R_d_tex;
      R_b_tex = self->_R_b_tex;
      int v50 = -a10;
      v101 = self->_p_tex[a9];
      uint64_t v51 = 1;
      while (1)
      {
        int v52 = v50 + v48;
        if (!v111 || (v53 = v111, v52 != -1)) {
          v53 = uv_tex[v49][v46 ^ 1];
        }
        v54 = v53;
        v55 = uv_tex[v49][v46];
        v56 = v55;
        if (v48) {
          v56 = uv_relax_tex[v49][v51];
        }
        v57 = v56;
        DWORD2(v119) = v48 & 1;
        float v58 = v52 == -1 ? v13 : 1.0;
        *((float *)&v120 + 1) = v58;
        v59 = v105->_computePipelines[1];
        v62 = objc_msgSend_computeCommandEncoder(v108, v60, v61);
        v64 = v62;
        if (v62)
        {
          objc_msgSend_setComputePipelineState_(v62, v63, (uint64_t)v59);
          objc_msgSend_setTexture_atIndex_(v64, v65, (uint64_t)v55, 0);
          objc_msgSend_setTexture_atIndex_(v64, v66, (uint64_t)v57, 1);
          v113 = v57;
          v67 = v54;
          objc_msgSend_setTexture_atIndex_(v64, v68, (uint64_t)v101[v47], 2);
          objc_msgSend_setTexture_atIndex_(v64, v69, (uint64_t)v107, 3);
          objc_msgSend_setTexture_atIndex_(v64, v70, (uint64_t)v106, 4);
          objc_msgSend_setTexture_atIndex_(v64, v71, (uint64_t)R_a_tex[a9], 5);
          objc_msgSend_setTexture_atIndex_(v64, v72, (uint64_t)R_b_tex[a9], 6);
          objc_msgSend_setTexture_atIndex_(v64, v73, (uint64_t)R_d_tex[a9], 7);
          objc_msgSend_setTexture_atIndex_(v64, v74, (uint64_t)v54, 8);
          uint64_t v112 = v51 ^ 1;
          objc_msgSend_setTexture_atIndex_(v64, v75, (uint64_t)uv_relax_tex[a9][v51 ^ 1], 9);
          uint64_t v76 = v47 ^ 1;
          objc_msgSend_setTexture_atIndex_(v64, v77, (uint64_t)v101[v76], 10);
          objc_msgSend_setBytes_length_atIndex_(v64, v78, (uint64_t)&v116, 48, 0);
          unint64_t v81 = objc_msgSend_threadExecutionWidth(v59, v79, v80);
          int v84 = v46;
          unint64_t v85 = objc_msgSend_maxTotalThreadsPerThreadgroup(v59, v82, v83) / v81;
          unint64_t v88 = (v81 + (int)objc_msgSend_width(v55, v86, v87) - 1) / v81;
          int v91 = objc_msgSend_height(v55, v89, v90);
          v115[0] = v88;
          v115[1] = (v85 + v91 - 1) / v85;
          v115[2] = 1;
          v114[0] = v81;
          v114[1] = v85;
          LODWORD(v85) = v84;
          v54 = v67;
          v57 = v113;
          v114[2] = 1;
          objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v64, v92, (uint64_t)v115, v114);
          objc_msgSend_endEncoding(v64, v93, v94);
          int v46 = v85 ^ 1;
          int v47 = v76;
        }
        else
        {
          uint64_t v112 = v51;
          FigDebugAssert3();
          int v100 = FigSignalErrorAt();
        }

        if (!v64) {
          break;
        }
        ++v48;
        int v50 = -a10;
        uint64_t v51 = v112;
        uint64_t v49 = a9;
        if (v48 == a10) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v24 = v99;
    int v95 = v100;
  }
  else
  {
LABEL_25:
    FigDebugAssert3();
    int v95 = -12780;
  }

  return v95;
}

- (int)doInitPrimalDualWithCommandBuffer:(id)a3 disparity_value:(float)a4 idx_swap_uv:(int)a5 idx_swap_p:(int)a6 level:(int)a7
{
  float v39 = a4;
  double v10 = (char *)self + 16 * a7;
  id v11 = *(id *)&v10[8 * a5 + 1928];
  id v12 = *(id *)&v10[8 * a6 + 872];
  float v13 = self->_computePipelines[0];
  uint64_t v16 = objc_msgSend_computeCommandEncoder(a3, v14, v15);
  uint64_t v18 = v16;
  if (v16)
  {
    objc_msgSend_setComputePipelineState_(v16, v17, (uint64_t)v13);
    objc_msgSend_setTexture_atIndex_(v18, v19, (uint64_t)v11, 0);
    objc_msgSend_setTexture_atIndex_(v18, v20, (uint64_t)v12, 1);
    objc_msgSend_setBytes_length_atIndex_(v18, v21, (uint64_t)&v39, 4, 0);
    unint64_t v24 = objc_msgSend_threadExecutionWidth(v13, v22, v23);
    unint64_t v27 = objc_msgSend_maxTotalThreadsPerThreadgroup(v13, v25, v26) / v24;
    v38[0] = (v24 + (int)objc_msgSend_width(v11, v28, v29) - 1) / v24;
    v38[1] = (v27 + (int)objc_msgSend_height(v11, v30, v31) - 1) / v27;
    v38[2] = 1;
    v37[0] = v24;
    v37[1] = v27;
    v37[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v18, v32, (uint64_t)v38, v37);
    objc_msgSend_endEncoding(v18, v33, v34);
    int v35 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
  }

  return v35;
}

- (int)doUpscalePrimalDualWithCommandBuffer:(id)a3 idx_swap_uv_in_out:(int *)a4 idx_swap_p_in_out:(int *)a5 level:(int)a6 coeff:(float)a7
{
  id v13 = a3;
  if (a6 < 0 || self->_countScales - 1 <= a6)
  {
    FigDebugAssert3();
    int v21 = -12780;
    goto LABEL_6;
  }
  uint64_t v15 = *a4;
  uint64_t v16 = *a5;
  uint64_t v17 = (a6 + 1);
  int v18 = v15 ^ 1;
  *(float *)&double v14 = a7;
  int v19 = objc_msgSend__doUpscaleSingleWithCommandBuffer_in_tex_out_tex_coeff_(self, v12, (uint64_t)v13, self->_uv_tex[v17][v15], self->_uv_tex[a6][v15 ^ 1], v14);
  if (v19)
  {
    int v21 = v19;
    goto LABEL_9;
  }
  int v21 = objc_msgSend__doUpscaleDualWithCommandBuffer_in_tex_out_tex_(self, v20, (uint64_t)v13, self->_p_tex[v17][v16], self->_p_tex[a6][v16 ^ 1]);
  if (v21)
  {
LABEL_9:
    FigDebugAssert3();
    goto LABEL_6;
  }
  *a4 = v18;
  *a5 = v16 ^ 1;
LABEL_6:

  return v21;
}

- (int)doLocalRegularizationWithCommandBuffer:(id)a3 in_tex:(id)a4 level:(int)a5 parameters:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v59 = 0;
  id v11 = a6;
  id v12 = a3;
  objc_msgSend_alpha(v11, v13, v14);
  v57[0] = v15;
  objc_msgSend_beta(v11, v16, v17);
  v57[1] = v18;
  objc_msgSend_gain(v11, v19, v20);
  v57[2] = v21;
  objc_msgSend_offset(v11, v22, v23);
  v57[3] = v24;
  objc_msgSend_diffusion_eps(v11, v25, v26);
  unsigned int v28 = v27;

  uint64_t v58 = v28;
  uint64_t v29 = self->_computePipelines[2];
  uint64_t v32 = objc_msgSend_computeCommandEncoder(v12, v30, v31);

  if (v32)
  {
    objc_msgSend_setComputePipelineState_(v32, v33, (uint64_t)v29);
    objc_msgSend_setTexture_atIndex_(v32, v34, (uint64_t)v10, 0);
    int v35 = (uint64_t *)(&self->super.isa + a5);
    objc_msgSend_setTexture_atIndex_(v32, v36, v35[9], 1);
    objc_msgSend_setTexture_atIndex_(v32, v37, v35[75], 2);
    objc_msgSend_setTexture_atIndex_(v32, v38, v35[42], 3);
    objc_msgSend_setBytes_length_atIndex_(v32, v39, (uint64_t)v57, 32, 0);
    unint64_t v42 = objc_msgSend_threadExecutionWidth(v29, v40, v41);
    unint64_t v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(v29, v43, v44) / v42;
    v56[0] = (v42 + (int)objc_msgSend_width(v10, v46, v47) - 1) / v42;
    v56[1] = (v45 + (int)objc_msgSend_height(v10, v48, v49) - 1) / v45;
    v56[2] = 1;
    v55[0] = v42;
    v55[1] = v45;
    v55[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v32, v50, (uint64_t)v56, v55);
    objc_msgSend_endEncoding(v32, v51, v52);
    int v53 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
  }

  return v53;
}

- (int)_doUpscaleSingleWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 coeff:(float)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  uint64_t v15 = objc_msgSend_width(v11, v13, v14);
  uint64_t v18 = objc_msgSend_width(v10, v16, v17);
  uint64_t v21 = objc_msgSend_height(v11, v19, v20);
  uint64_t v24 = objc_msgSend_height(v10, v22, v23);
  v25.i64[0] = v15;
  v25.i64[1] = v21;
  _Q1.i64[0] = -1;
  _Q1.i64[1] = -1;
  v27.i64[0] = v18;
  v27.i64[1] = v24;
  *(float32x2_t *)v25.i8 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v25, _Q1))), vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v27, _Q1))));
  __asm { FMOV            V1.2S, #1.0 }
  v57[0] = vdiv_f32(*(float32x2_t *)_Q1.i8, *(float32x2_t *)v25.i8);
  v57[1] = LODWORD(a6);
  uint64_t v32 = self->_computePipelines[3];
  int v35 = objc_msgSend_computeCommandEncoder(v12, v33, v34);

  if (v35)
  {
    objc_msgSend_setComputePipelineState_(v35, v36, (uint64_t)v32);
    objc_msgSend_setTexture_atIndex_(v35, v37, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v35, v38, (uint64_t)v11, 1);
    objc_msgSend_setBytes_length_atIndex_(v35, v39, (uint64_t)v57, 16, 0);
    unint64_t v42 = objc_msgSend_threadExecutionWidth(v32, v40, v41);
    unint64_t v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(v32, v43, v44) / v42;
    v56[0] = (v42 + (int)objc_msgSend_width(v11, v46, v47) - 1) / v42;
    v56[1] = (v45 + (int)objc_msgSend_height(v11, v48, v49) - 1) / v45;
    v56[2] = 1;
    v55[0] = v42;
    v55[1] = v45;
    v55[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v35, v50, (uint64_t)v56, v55);
    objc_msgSend_endEncoding(v35, v51, v52);
    int v53 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
  }

  return v53;
}

- (int)_doUpscaleDualWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  void v55[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v13 = objc_msgSend_width(v9, v11, v12);
  uint64_t v16 = objc_msgSend_width(v8, v14, v15);
  uint64_t v19 = objc_msgSend_height(v9, v17, v18);
  uint64_t v22 = objc_msgSend_height(v8, v20, v21);
  v23.i64[0] = v13;
  v23.i64[1] = v19;
  _Q1.i64[0] = -1;
  _Q1.i64[1] = -1;
  v25.i64[0] = v16;
  v25.i64[1] = v22;
  *(float32x2_t *)v23.i8 = vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v23, _Q1))), vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v25, _Q1))));
  v55[1] = 0;
  __asm { FMOV            V1.2S, #1.0 }
  v55[0] = vdiv_f32(*(float32x2_t *)_Q1.i8, *(float32x2_t *)v23.i8);
  float v30 = self->_computePipelines[4];
  int v33 = objc_msgSend_computeCommandEncoder(v10, v31, v32);

  if (v33)
  {
    objc_msgSend_setComputePipelineState_(v33, v34, (uint64_t)v30);
    objc_msgSend_setTexture_atIndex_(v33, v35, (uint64_t)v8, 0);
    objc_msgSend_setTexture_atIndex_(v33, v36, (uint64_t)v9, 1);
    objc_msgSend_setBytes_length_atIndex_(v33, v37, (uint64_t)v55, 16, 0);
    unint64_t v40 = objc_msgSend_threadExecutionWidth(v30, v38, v39);
    unint64_t v43 = objc_msgSend_maxTotalThreadsPerThreadgroup(v30, v41, v42) / v40;
    v54[0] = (v40 + (int)objc_msgSend_width(v9, v44, v45) - 1) / v40;
    v54[1] = (v43 + (int)objc_msgSend_height(v9, v46, v47) - 1) / v43;
    v54[2] = 1;
    v53[0] = v40;
    v53[1] = v43;
    v53[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v33, v48, (uint64_t)v54, v53);
    objc_msgSend_endEncoding(v33, v49, v50);
    int v51 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
  }

  return v51;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (int)countScales
{
  return self->_countScales;
}

- (CGSize)outputDisparityResolution
{
  double width = self->_outputDisparityResolution.width;
  double height = self->_outputDisparityResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PyrGPU)pyramidReference
{
  return self->_pyramidReference;
}

- (void)setPyramidReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pyramidReference, 0);
  objc_storeStrong((id *)&self->_uv_tex_user_ref, 0);
  for (uint64_t i = 0; i != -64; --i)
    objc_storeStrong((id *)&self->_uv_tex[31][i + 1], 0);
  for (uint64_t j = 0; j != -64; --j)
    objc_storeStrong((id *)&self->_uv_relax_tex[31][j + 1], 0);
  for (uint64_t k = 1376; k != 864; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  for (uint64_t m = 0; m != -32; --m)
    objc_storeStrong((id *)&self->_R_b_tex[m + 31], 0);
  for (uint64_t n = 584; n != 328; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  for (iuint64_t i = 320; ii != 64; ii -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + ii), 0);
  for (juint64_t j = 56; jj != 16; jj -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end