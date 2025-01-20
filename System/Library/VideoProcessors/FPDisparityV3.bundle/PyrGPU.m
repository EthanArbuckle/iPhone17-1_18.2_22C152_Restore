@interface PyrGPU
+ ($72E01A59C62D6C88118DCEC5141B350A)_determineFilterFromResolution:(SEL)a3 toResolution:(CGSize)a4;
- (BOOL)isValid;
- (BOOL)useAntialiasingForDownsamplingToFinestResolution;
- (CGSize)pyramidDimensions;
- (CGSize)realPyramidDimensions;
- (PyrGPU)initWithMetalContext:(id)a3;
- (id)textureRGBAU8AtScale:(int)a3;
- (id)textureU32AliasAtScale:(int)a3;
- (int)_createTextureViewsFromResolution:(CGSize)a3;
- (int)_doRPDDownscale1WithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:;
- (int)_downscale2XBelowWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:;
- (int)_downscaleAntialiasingWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 in_ref_res:(CGSize)a6 out_ref_res:(CGSize)a7;
- (int)allocateResourcesWithMaxInputResolution:(CGSize)a3;
- (int)countScales;
- (int)doImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4;
- (int)downscale2XEqualWithCommandBuffer:(id)a3 in_u32_alias_tex:(id)a4 out_u32_alias_tex:(id)a5;
- (int)populatePyramidSchemeFromReference:(id)a3 inputResolution:(CGSize)a4;
- (int)populatePyramidSchemeFromResolution:(CGSize)a3 toResolution:(CGSize)a4 scalingFactor:(float)a5 scales:(int)a6 allowSuccessiveDownscale2x:(BOOL)a7;
- (void)_setupPipelines;
- (void)dealloc;
- (void)releaseResources;
- (void)setUseAntialiasingForDownsamplingToFinestResolution:(BOOL)a3;
@end

@implementation PyrGPU

- (CGSize)realPyramidDimensions
{
  return self->_pyr_real_dims;
}

- (CGSize)pyramidDimensions
{
  return self->_pyr_int_dims;
}

- (PyrGPU)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PyrGPU;
  v6 = [(PyrGPU *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    uint64_t v10 = objc_msgSend_commandQueue(v5, v8, v9);
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v10;

    *(_WORD *)&v7->_isValid = 0;
    v7->_countScales = 0;
    bzero(v7->_pyrInfoArray, 0x600uLL);
    *(_OWORD *)&v7->_pyr_pxbuf[30] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[28] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[26] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[24] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[22] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[20] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[18] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[16] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[14] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[12] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[10] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[8] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[6] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[4] = 0u;
    *(_OWORD *)&v7->_pyr_pxbuf[2] = 0u;
    *(_OWORD *)v7->_pyr_pxbuf = 0u;
    *(_OWORD *)v7->_antialiasing_pxbuf = 0u;
    objc_msgSend__setupPipelines(v7, v12, v13);
  }

  return v7;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlContext, a2, v2);
  objc_msgSend_releaseResources(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)PyrGPU;
  [(PyrGPU *)&v6 dealloc];
}

- (int)allocateResourcesWithMaxInputResolution:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  objc_msgSend_releaseResources(self, a2, v3);
  if (self->_countScales >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      self->_pyr_pxbuf[v8++] = (__CVBuffer *)CreatePixelBuffer();
      v7 += 48;
    }
    while (v8 < self->_countScales);
  }
  if (*((unsigned char *)&self->_pyrInfoArray[1].kernel_filter + 4))
  {
    self->_antialiasing_pxbuf[0] = (__CVBuffer *)CreatePixelBuffer();
    self->_antialiasing_pxbuf[1] = (__CVBuffer *)CreatePixelBuffer();
  }
  self->_isValid = 1;
  self->_max_input_res.CGFloat width = width;
  self->_max_input_res.CGFloat height = height;
  return 0;
}

- (void)releaseResources
{
  for (uint64_t i = 0; i != 32; ++i)
  {
    v4 = (Class *)((char *)&self->super.isa + i * 8);
    uint64_t v5 = self->_pyr_pxbuf[i];
    if (v5)
    {
      CFRelease(v5);
      v4[338] = 0;
    }
    objc_super v6 = (void *)v4[370];
    v4[370] = 0;

    uint64_t v7 = (void *)v4[402];
    v4[402] = 0;
  }
  uint64_t v8 = 0;
  antialiasing_pxbuf = self->_antialiasing_pxbuf;
  char v10 = 1;
  do
  {
    char v11 = v10;
    v12 = antialiasing_pxbuf[v8];
    if (v12)
    {
      CFRelease(v12);
      antialiasing_pxbuf[v8] = 0;
    }
    char v10 = 0;
    uint64_t v8 = 1;
  }
  while ((v11 & 1) != 0);
  self->_isValid = 0;
}

- (int)populatePyramidSchemeFromReference:(id)a3 inputResolution:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  pyrInfoArray = self->_pyrInfoArray;
  uint64_t v8 = (char *)a3 + 144;
  uint64_t v9 = a3;
  memcpy(pyrInfoArray, v8, 0x600uLL);
  memcpy(self->_pyr_real_dims, v9 + 548, sizeof(self->_pyr_real_dims));
  memcpy(self->_pyr_int_dims, v9 + 420, sizeof(self->_pyr_int_dims));
  self->_countScales = v9[873];
  LOBYTE(pyrInfoArray) = *((unsigned char *)v9 + 3489);

  self->_useAntialiasingForDownsamplingToFinestResolution = (char)pyrInfoArray;
  self->_max_input_res.CGFloat width = width;
  self->_max_input_res.CGFloat height = height;
  self->_input_res.CGFloat width = width;
  self->_input_res.CGFloat height = height;
  self->_isValid = 1;
  return 0;
}

- (int)populatePyramidSchemeFromResolution:(CGSize)a3 toResolution:(CGSize)a4 scalingFactor:(float)a5 scales:(int)a6 allowSuccessiveDownscale2x:(BOOL)a7
{
  if ((a6 - 33) <= 0xFFFFFFDF)
  {
    FigDebugAssert3();
    return -12780;
  }
  else
  {
    BOOL v7 = a7;
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    CGFloat v40 = a4.height;
    CGFloat v38 = a4.width;
    objc_msgSend__determineFilterFromResolution_toResolution_(PyrGPU, a2, *(uint64_t *)&a6, a3.width, a3.height, a4.width, a4.height);
    v15.f64[0] = v38;
    self->_pyrInfoArray[0].real_res = v44;
    *(_OWORD *)&self->_pyrInfoArray[0].kernel_filter = v45;
    *(_OWORD *)&self->_pyrInfoArray[1].real_res.CGFloat height = v46;
    *((unsigned char *)&self->_pyrInfoArray[1].kernel_filter + 4) = self->_useAntialiasingForDownsamplingToFinestResolution;
    self->_pyr_real_dims[0].CGFloat width = v38;
    self->_pyr_real_dims[0].CGFloat height = v40;
    self->_pyr_int_dims[0].CGFloat width = v38;
    self->_pyr_int_dims[0].CGFloat height = v40;
    if (a6 >= 2)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      char v18 = 0;
      int v19 = 0;
      v15.f64[1] = v40;
      uint64_t v20 = 1696;
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v39 = _Q1;
      float v26 = 1.0 / a5;
      do
      {
        char v43 = 0;
        __int16 v42 = 0;
        if (v7 && (v18 & 1) != 0)
        {
          uint64_t v27 = v19;
          float64x2_t v28 = vmulq_f64((float64x2_t)self->_pyrInfoArray[2 * v19].real_res, v39);
          int v29 = v19;
          uint64_t v30 = 0x100000001;
          uint64_t v31 = 0x3F0000003F000000;
          ++v19;
          float64x2_t v15 = v28;
        }
        else
        {
          float64x2_t v41 = vmulq_n_f64(v15, a5);
          objc_msgSend__determineFilterFromResolution_toResolution_(PyrGPU, v13, v14, *(_OWORD *)&v15, *(_OWORD *)&v41);
          float64x2_t v28 = (float64x2_t)v44;
          uint64_t v31 = *((void *)&v45 + 1);
          uint64_t v30 = v45;
          __int16 v42 = *(_WORD *)((char *)&v46 + 13);
          char v43 = HIBYTE(v46);
          uint64_t v27 = v17;
          int v29 = v17;
          float64x2_t v15 = v41;
        }
        int32x2_t v32 = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(v15)));
        int32x2_t v33 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v32, (int8x8_t)0x100000001), v32);
        v34 = (float64x2_t *)((char *)self + v20);
        v34->f64[0] = (double)v33.i32[0];
        v34->f64[1] = (double)v33.i32[1];
        float32x2_t v35 = vcvt_f32_s32(vadd_s32(vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_pyr_int_dims[v27])), (int32x2_t)-1));
        v36 = (char *)self + v16;
        *((float64x2_t *)v36 + 12) = v28;
        *((void *)v36 + 26) = v30;
        *((void *)v36 + 27) = v31;
        *((float32x2_t *)v36 + 28) = vdiv_f32(vcvt_f32_s32(vadd_s32(v33, (int32x2_t)-1)), v35);
        *((_DWORD *)v36 + 58) = v29;
        v36[236] = 0;
        *(_WORD *)(v36 + 237) = v42;
        v36[239] = v43;
        v34[32] = v15;
        float v26 = (float)(1.0 / a5) * v26;
        v18 |= fabsf(v26 + -2.0) < 0.05;
        ++v17;
        v20 += 16;
        v16 += 48;
      }
      while (a6 - 1 != v17);
    }
    int result = 0;
    self->_max_input_res.CGFloat width = width;
    self->_max_input_res.CGFloat height = height;
    self->_input_res.CGFloat width = width;
    self->_input_res.CGFloat height = height;
    self->_countScales = a6;
  }
  return result;
}

- (int)doImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4
{
  id v40 = a3;
  objc_super v6 = (MTLTexture *)a4;
  if ((objc_msgSend_pixelFormat(v6, v7, v8) == 70 || objc_msgSend_pixelFormat(v6, v9, v10) == 80) && self->_isValid)
  {
    double v11 = (double)(unint64_t)objc_msgSend_width(v6, v9, v10);
    uint64_t v14 = objc_msgSend_height(v6, v12, v13);
    int TextureViewsFromResolution = objc_msgSend__createTextureViewsFromResolution_(self, v15, v16, v11, (double)(unint64_t)v14);
    if (TextureViewsFromResolution)
    {
      int v39 = TextureViewsFromResolution;
      FigDebugAssert3();
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = objc_msgSend_newTextureViewWithPixelFormat_(v6, v18, 53);
      if (self->_countScales >= 1)
      {
        uint64_t v21 = 0;
        pyr_u32_alias_tex = self->_pyr_u32_alias_tex;
        v23 = &self->_pyrInfoArray[1].kernel_filter + 1;
        v24 = &self->_pyrInfoArray[1].kernel_filter + 1;
        do
        {
          int v26 = *(unsigned __int8 *)v24;
          v24 += 12;
          int v25 = v26;
          if (v21 || !v25)
          {
            if (v21)
            {
              uint64_t v28 = *(v23 - 1);
              if (v28 == -1)
              {
                FigDebugAssert3();
                goto LABEL_34;
              }
              int v29 = self->_pyr_tex[v28];

              uint64_t v30 = self->_pyr_u32_alias_tex[*(v23 - 1)];
              uint64_t v20 = v30;
              objc_super v6 = v29;
            }
            uint64_t v31 = *(pyr_u32_alias_tex - 32);
            int32x2_t v33 = *pyr_u32_alias_tex;
            int v34 = *(v23 - 7);
            if (v34)
            {
              if (v34 == 2)
              {
                int v37 = objc_msgSend__downscale2XBelowWithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v32, (uint64_t)v40, v6, v31, *(double *)(v23 - 3));
                if (v37)
                {
                  int v39 = v37;
LABEL_30:
                  FigDebugAssert3();
LABEL_27:

                  goto LABEL_25;
                }
              }
              else
              {
                if (v34 != 1)
                {
                  FigDebugAssert3();
                  int v39 = -12780;
                  goto LABEL_27;
                }
                int v35 = objc_msgSend_downscale2XEqualWithCommandBuffer_in_u32_alias_tex_out_u32_alias_tex_(self, v32, (uint64_t)v40, v20, v33);
                if (v35)
                {
                  int v39 = v35;
                  goto LABEL_30;
                }
              }
            }
            else
            {
              int v36 = objc_msgSend__doRPDDownscale1WithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v32, (uint64_t)v40, v6, v31, *(double *)(v23 - 3));
              if (v36)
              {
                int v39 = v36;
                goto LABEL_30;
              }
            }
          }
          else
          {
            int v27 = objc_msgSend__downscaleAntialiasingWithCommandBuffer_in_tex_out_tex_in_ref_res_out_ref_res_(self, v19, (uint64_t)v40, v6, self->_pyr_tex[0], self->_input_res.width, self->_input_res.height, self->_pyr_int_dims[0].width, self->_pyr_int_dims[0].height);
            if (v27)
            {
              int v39 = v27;
              FigDebugAssert3();
              goto LABEL_25;
            }
          }
          ++v21;
          ++pyr_u32_alias_tex;
          v23 = v24;
        }
        while (v21 < self->_countScales);
      }
      int v39 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v20 = 0;
LABEL_34:
    int v39 = -12780;
  }
LABEL_25:

  return v39;
}

- (id)textureRGBAU8AtScale:(int)a3
{
  if (a3 < 0 || self->_countScales <= a3)
  {
    FigDebugAssert3();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = self->_pyr_tex[a3];
  }

  return v3;
}

- (id)textureU32AliasAtScale:(int)a3
{
  if (a3 < 0 || self->_countScales <= a3)
  {
    FigDebugAssert3();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = self->_pyr_u32_alias_tex[a3];
  }

  return v3;
}

- (void)_setupPipelines
{
  v4 = objc_opt_new();
  for (unsigned int i = 0; i < 3; ++i)
  {
    for (unsigned int j = 0; j < 3; ++j)
    {
      objc_msgSend_setConstantValue_type_atIndex_(v4, v3, (uint64_t)&j, 33, 0);
      objc_msgSend_setConstantValue_type_atIndex_(v4, v5, (uint64_t)&i, 33, 1);
      uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v6, @"rpdDownscaleImage1", v4);
      uint64_t v8 = self->_KernelDownscaleImage1[j];
      uint64_t v9 = v8[i];
      v8[i] = (MTLComputePipelineState *)v7;
    }
  }
  uint64_t v10 = 0;
  computePipelines = self->_computePipelines;
  char v12 = 1;
  do
  {
    char v13 = v12;
    id v14 = [NSString alloc];
    uint64_t v16 = objc_msgSend_initWithUTF8String_(v14, v15, (uint64_t)off_2655C0A88[v10]);
    uint64_t v18 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v17, (uint64_t)v16, 0);
    int v19 = computePipelines[v10];
    computePipelines[v10] = (MTLComputePipelineState *)v18;

    char v12 = 0;
    uint64_t v10 = 1;
  }
  while ((v13 & 1) != 0);
}

- (int)_createTextureViewsFromResolution:(CGSize)a3
{
  if (self->_max_input_res.width < (double)(int)a3.width || self->_max_input_res.height < (double)(int)a3.height)
  {
    FigDebugAssert3();
    return -12780;
  }
  else
  {
    if (self->_countScales >= 1)
    {
      uint64_t v4 = 0;
      CGFloat height = a3.height;
      float32x2_t v6 = vdiv_f32(vcvt_f32_f64((float64x2_t)a3), vcvt_f32_f64((float64x2_t)self->_input_res));
      uint64_t v7 = 144;
      do
      {
        int32x2_t v8 = vcvt_s32_f32(vrndp_f32(vmul_f32(v6, vcvt_f32_f64(*(float64x2_t *)((char *)&self->super.isa + v7)))));
        int32x2_t v9 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v8, (int8x8_t)0x100000001), v8);
        v10.i64[0] = v9.i32[0];
        v10.i64[1] = v9.i32[1];
        double v11 = &self->super.isa + v4;
        uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, a2, (uint64_t)v11[338], 70, 23, 0, vcvtq_f64_s64(v10));
        Class v13 = v11[370];
        v11[370] = (Class)v12;

        uint64_t v15 = objc_msgSend_newTextureViewWithPixelFormat_(v11[370], v14, 53);
        Class v16 = v11[402];
        v11[402] = (Class)v15;

        ++v4;
        v7 += 48;
      }
      while (v4 < self->_countScales);
    }
    return 0;
  }
}

- (int)_doRPDDownscale1WithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:
{
  float32x2_t v6 = v5;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  int v15 = objc_msgSend_width(v11, v13, v14);
  int v18 = objc_msgSend_height(v11, v16, v17);
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v24 = vdiv_f32(_D0, v6);
  float32x2_t v49 = v24;
  uint64_t v25 = 2;
  if (v24.f32[0] <= 3.0) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = 2;
  }
  if (v24.f32[1] <= 3.0) {
    uint64_t v25 = 1;
  }
  if (v24.f32[0] <= 1.0) {
    unsigned int v26 = 0;
  }
  int v27 = (char *)self + 24 * v26;
  if (v24.f32[1] <= 1.0) {
    uint64_t v25 = 0;
  }
  id v28 = *(id *)&v27[8 * v25 + 40];
  uint64_t v31 = objc_msgSend_computeCommandEncoder(v12, v29, v30);

  if (v31)
  {
    objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)v28);
    objc_msgSend_setTexture_atIndex_(v31, v33, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)v11, 1);
    objc_msgSend_setBytes_length_atIndex_(v31, v35, (uint64_t)&v49, 8, 0);
    unint64_t v38 = objc_msgSend_threadExecutionWidth(v28, v36, v37);
    unint64_t v41 = objc_msgSend_maxTotalThreadsPerThreadgroup(v28, v39, v40);
    v48[0] = (v38 + v15 - 1) / v38;
    v48[1] = (v41 / v38 + v18 - 1) / (v41 / v38);
    v48[2] = 1;
    v47[0] = v38;
    v47[1] = v41 / v38;
    v47[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v31, v42, (uint64_t)v48, v47);
    objc_msgSend_endEncoding(v31, v43, v44);
    int v45 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
  }

  return v45;
}

- (int)_downscale2XBelowWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:
{
  float32x2_t v6 = v5;
  id v10 = a4;
  id v11 = a5;
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v43 = vdiv_f32(_D0, v6);
  uint64_t v17 = self->_computePipelines[0];
  uint64_t v20 = objc_msgSend_computeCommandEncoder(a3, v18, v19);
  v22 = v20;
  if (v20)
  {
    objc_msgSend_setComputePipelineState_(v20, v21, (uint64_t)v17);
    objc_msgSend_setTexture_atIndex_(v22, v23, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v22, v24, (uint64_t)v11, 1);
    objc_msgSend_setBytes_length_atIndex_(v22, v25, (uint64_t)&v43, 8, 0);
    unint64_t v28 = objc_msgSend_threadExecutionWidth(v17, v26, v27);
    unint64_t v31 = objc_msgSend_maxTotalThreadsPerThreadgroup(v17, v29, v30) / v28;
    v42[0] = (v28 + (int)objc_msgSend_width(v11, v32, v33) - 1) / v28;
    v42[1] = (v31 + (int)objc_msgSend_height(v11, v34, v35) - 1) / v31;
    v42[2] = 1;
    v41[0] = v28;
    v41[1] = v31;
    v41[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v22, v36, (uint64_t)v42, v41);
    objc_msgSend_endEncoding(v22, v37, v38);
    int v39 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
  }

  return v39;
}

- (int)downscale2XEqualWithCommandBuffer:(id)a3 in_u32_alias_tex:(id)a4 out_u32_alias_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = self->_computePipelines[1];
  Class v13 = objc_msgSend_computeCommandEncoder(a3, v11, v12);
  int v15 = v13;
  if (v13)
  {
    objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)v10);
    objc_msgSend_setTexture_atIndex_(v15, v16, (uint64_t)v8, 0);
    objc_msgSend_setTexture_atIndex_(v15, v17, (uint64_t)v9, 1);
    unint64_t v20 = objc_msgSend_threadExecutionWidth(v10, v18, v19);
    unint64_t v23 = objc_msgSend_maxTotalThreadsPerThreadgroup(v10, v21, v22) / v20;
    v34[0] = (v20 + (int)objc_msgSend_width(v9, v24, v25) - 1) / v20;
    v34[1] = (v23 + (int)objc_msgSend_height(v9, v26, v27) - 1) / v23;
    v34[2] = 1;
    v33[0] = v20;
    v33[1] = v23;
    v33[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v15, v28, (uint64_t)v34, v33);
    objc_msgSend_endEncoding(v15, v29, v30);
    int v31 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
  }

  return v31;
}

- (int)_downscaleAntialiasingWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 in_ref_res:(CGSize)a6 out_ref_res:(CGSize)a7
{
  CGFloat width = a7.width;
  CGFloat height = a7.height;
  CGFloat v50 = a6.width;
  CGFloat v51 = a6.height;
  id v52 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((objc_msgSend_pixelFormat(v10, v12, v13) == 70 || objc_msgSend_pixelFormat(v10, v14, v15) == 80)
    && self->_isValid)
  {
    id v47 = v11;
    uint64_t v16 = objc_msgSend_pixelFormat(v10, v14, v15);
    v19.f64[0] = width;
    v19.f64[1] = height;
    int32x2_t v20 = vmovn_s64(vcvtq_s64_f64(v19));
    int32x2_t v21 = vadd_s32(v20, v20);
    v19.f64[0] = v50;
    v19.f64[1] = v51;
    int32x2_t v22 = vmovn_s64(vcvtq_s64_f64(v19));
    int32x2_t v23 = vcgt_s32(v22, v21);
    if (v23.i32[0] & v23.i32[1])
    {
      uint64_t v24 = v16;
      antialiasing_pxbuf = self->_antialiasing_pxbuf;
      uint64_t v26 = 0xFFFFFFFFLL;
      while (1)
      {
        int v27 = objc_msgSend_width(v10, v17, v18);
        int v31 = objc_msgSend_height(v10, v28, v29);
        mtlContext = self->_mtlContext;
        if (v26 == 0xFFFFFFFFLL)
        {
          uint64_t v33 = (uint64_t *)self->_antialiasing_pxbuf;
          int v34 = v10;
        }
        else
        {
          int v34 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(mtlContext, v30, (uint64_t)antialiasing_pxbuf[v26], v24, 17, 0, (double)v27, (double)v31);

          mtlContext = self->_mtlContext;
          uint64_t v33 = (uint64_t *)&antialiasing_pxbuf[v26 ^ 1];
        }
        unsigned int v35 = vcvtps_s32_f32((float)v27 * 0.5);
        unsigned int v36 = vcvtps_s32_f32((float)v31 * 0.5);
        objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(mtlContext, v30, *v33, v24, 23, 0, (double)(int)((v35 & 1) + v35), (double)(int)((v36 & 1) + v36));
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = objc_msgSend_newTextureViewWithPixelFormat_(v34, v37, 53);
        uint64_t v40 = objc_msgSend_newTextureViewWithPixelFormat_(v10, v39, 53);
        int v42 = objc_msgSend_downscale2XEqualWithCommandBuffer_in_u32_alias_tex_out_u32_alias_tex_(self, v41, (uint64_t)v52, v38, v40);
        if (v42) {
          break;
        }
        int32x2_t v43 = vcvt_s32_f32(vrndp_f32(vmul_f32(vcvt_f32_s32(v22), (float32x2_t)0x3F0000003F000000)));
        int32x2_t v22 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v43, (int8x8_t)0x100000001), v43);

        if (v26 == 0xFFFFFFFFLL) {
          uint64_t v26 = 0;
        }
        else {
          v26 ^= 1uLL;
        }

        int32x2_t v44 = vcgt_s32(v22, v21);
        if ((v44.i32[0] & v44.i32[1] & 1) == 0) {
          goto LABEL_14;
        }
      }
      int v45 = v42;
      FigDebugAssert3();

      id v10 = v34;
      id v11 = v47;
    }
    else
    {
LABEL_14:
      id v11 = v47;
      int v45 = objc_msgSend__downscale2XBelowWithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v17, (uint64_t)v52, v10, v47, COERCE_DOUBLE(vdiv_f32(vcvt_f32_s32(vadd_s32(v20, (int32x2_t)-1)), vcvt_f32_s32(vadd_s32(v22, (int32x2_t)-1)))));
      if (v45) {
        FigDebugAssert3();
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v45 = -12780;
  }

  return v45;
}

+ ($72E01A59C62D6C88118DCEC5141B350A)_determineFilterFromResolution:(SEL)a3 toResolution:(CGSize)a4
{
  v5.f32[0] = a4.width / a5.width;
  float32_t v6 = a4.height / a5.height;
  if (v5.f32[0] <= v6) {
    float v7 = a4.height / a5.height;
  }
  else {
    float v7 = a4.width / a5.width;
  }
  if (v7 > 1.9) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }
  if (v7 >= 2.1) {
    int v8 = 0;
  }
  retstr->var0 = a5;
  retstr->var1 = v8;
  v5.f32[1] = a4.height / a5.height;
  __asm { FMOV            V5.2S, #1.0 }
  CGFloat height = a5.height;
  __asm { FMOV            V3.2D, #-1.0 }
  CGFloat v16 = a4.height;
  *(float32x2_t *)&retstr->var3 = vdiv_f32(_D5, v5);
  *(float32x2_t *)&retstr[1].var0.CGFloat width = vcvt_f32_f64(vdivq_f64(vaddq_f64((float64x2_t)a5, _Q3), vaddq_f64((float64x2_t)a4, _Q3)));
  LODWORD(retstr[1].var0.height) = -1;
  BYTE4(retstr[1].var0.height) = 0;
  return result;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (int)countScales
{
  return self->_countScales;
}

- (BOOL)useAntialiasingForDownsamplingToFinestResolution
{
  return self->_useAntialiasingForDownsamplingToFinestResolution;
}

- (void)setUseAntialiasingForDownsamplingToFinestResolution:(BOOL)a3
{
  self->_useAntialiasingForDownsamplingToFinestResolution = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  uint64_t v4 = &self->_pyr_u32_alias_tex[31];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -32);
  for (uint64_t i = 0; i != -32; --i)
    objc_storeStrong((id *)&self->_pyr_tex[i + 31], 0);
  for (uint64_t j = 104; j != 32; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
    j -= 8;
  }
  while (j != 16);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end