@interface PyrGPU
+ ($7FB6425C18F41DAB009C0E09F35EA633)_determineFilterFromResolution:(SEL)a3 toResolution:(CGSize)a4;
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
- (int)_downscale2XEqualWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:;
- (int)_downscaleAntialiasingWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 in_ref_res:(CGSize)a6 out_ref_res:(CGSize)a7;
- (int)allocateResourcesWithMaxInputResolution:(CGSize)a3;
- (int)countScales;
- (int)doImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4;
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
  v21.receiver = self;
  v21.super_class = (Class)PyrGPU;
  v6 = [(PyrGPU *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mtlContext, a3);
    uint64_t v13 = objc_msgSend_commandQueue(v5, v8, v9, v10, v11, v12);
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (MTLCommandQueue *)v13;

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
    objc_msgSend__setupPipelines(v7, v15, v16, v17, v18, v19);
  }

  return v7;
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_mtlContext, a2, v2, v3, v4, v5);
  objc_msgSend_releaseResources(self, v7, v8, v9, v10, v11);
  v12.receiver = self;
  v12.super_class = (Class)PyrGPU;
  [(PyrGPU *)&v12 dealloc];
}

- (int)allocateResourcesWithMaxInputResolution:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  objc_msgSend_releaseResources(self, a2, v3, v4, v5, v6);
  if (self->_countScales >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    do
    {
      self->_pyr_pxbuf[v11++] = (__CVBuffer *)CreatePixelBuffer();
      v10 += 48;
    }
    while (v11 < self->_countScales);
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
    uint64_t v4 = (Class *)((char *)&self->super.isa + i * 8);
    uint64_t v5 = self->_pyr_pxbuf[i];
    if (v5)
    {
      CFRelease(v5);
      v4[338] = 0;
    }
    uint64_t v6 = (void *)v4[370];
    v4[370] = 0;

    v7 = (void *)v4[402];
    v4[402] = 0;
  }
  uint64_t v8 = 0;
  antialiasing_pxbuf = self->_antialiasing_pxbuf;
  char v10 = 1;
  do
  {
    char v11 = v10;
    objc_super v12 = antialiasing_pxbuf[v8];
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
    BOOL v9 = a7;
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    CGFloat v45 = a4.height;
    CGFloat v43 = a4.width;
    objc_msgSend__determineFilterFromResolution_toResolution_(PyrGPU, a2, *(uint64_t *)&a6, a7, v7, v8, a3.width, a3.height, a4.width, a4.height);
    v20.f64[0] = v43;
    self->_pyrInfoArray[0].real_res = v49;
    *(_OWORD *)&self->_pyrInfoArray[0].kernel_filter = v50;
    *(_OWORD *)&self->_pyrInfoArray[1].real_res.CGFloat height = v51;
    *((unsigned char *)&self->_pyrInfoArray[1].kernel_filter + 4) = self->_useAntialiasingForDownsamplingToFinestResolution;
    self->_pyr_real_dims[0].CGFloat width = v43;
    self->_pyr_real_dims[0].CGFloat height = v45;
    self->_pyr_int_dims[0].CGFloat width = v43;
    self->_pyr_int_dims[0].CGFloat height = v45;
    if (a6 >= 2)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      char v23 = 0;
      int v24 = 0;
      v20.f64[1] = v45;
      uint64_t v25 = 1696;
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v44 = _Q1;
      float v31 = 1.0 / a5;
      do
      {
        char v48 = 0;
        __int16 v47 = 0;
        if (v9 && (v23 & 1) != 0)
        {
          uint64_t v32 = v24;
          float64x2_t v33 = vmulq_f64((float64x2_t)self->_pyrInfoArray[2 * v24].real_res, v44);
          int v34 = v24;
          uint64_t v35 = 0x100000001;
          uint64_t v36 = 0x3F0000003F000000;
          ++v24;
          float64x2_t v20 = v33;
        }
        else
        {
          float64x2_t v46 = vmulq_n_f64(v20, a5);
          objc_msgSend__determineFilterFromResolution_toResolution_(PyrGPU, v15, v16, v17, v18, v19, *(_OWORD *)&v20, *(_OWORD *)&v46);
          float64x2_t v33 = (float64x2_t)v49;
          uint64_t v36 = *((void *)&v50 + 1);
          uint64_t v35 = v50;
          __int16 v47 = *(_WORD *)((char *)&v51 + 13);
          char v48 = HIBYTE(v51);
          uint64_t v32 = v22;
          int v34 = v22;
          float64x2_t v20 = v46;
        }
        int32x2_t v37 = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(v20)));
        int32x2_t v38 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v37, (int8x8_t)0x100000001), v37);
        v39 = (float64x2_t *)((char *)self + v25);
        v39->f64[0] = (double)v38.i32[0];
        v39->f64[1] = (double)v38.i32[1];
        float32x2_t v40 = vcvt_f32_s32(vadd_s32(vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_pyr_int_dims[v32])), (int32x2_t)-1));
        v41 = (char *)self + v21;
        *((float64x2_t *)v41 + 12) = v33;
        *((void *)v41 + 26) = v35;
        *((void *)v41 + 27) = v36;
        *((float32x2_t *)v41 + 28) = vdiv_f32(vcvt_f32_s32(vadd_s32(v38, (int32x2_t)-1)), v40);
        *((_DWORD *)v41 + 58) = v34;
        v41[236] = 0;
        *(_WORD *)(v41 + 237) = v47;
        v41[239] = v48;
        v39[32] = v20;
        float v31 = (float)(1.0 / a5) * v31;
        v23 |= fabsf(v31 + -2.0) < 0.05;
        ++v22;
        v25 += 16;
        v21 += 48;
      }
      while (a6 - 1 != v22);
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
  id v6 = a3;
  uint64_t v7 = (MTLTexture *)a4;
  if (objc_msgSend_pixelFormat(v7, v8, v9, v10, v11, v12) != 70
    && objc_msgSend_pixelFormat(v7, v13, v14, v15, v16, v17) != 80
    || !self->_isValid)
  {
LABEL_29:
    FigDebugAssert3();
    int v50 = -12780;
    goto LABEL_25;
  }
  double v18 = (double)(unint64_t)objc_msgSend_width(v7, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_height(v7, v19, v20, v21, v22, v23);
  int TextureViewsFromResolution = objc_msgSend__createTextureViewsFromResolution_(self, v25, v26, v27, v28, v29, v18, (double)(unint64_t)v24);
  if (TextureViewsFromResolution)
  {
    int v50 = TextureViewsFromResolution;
LABEL_28:
    FigDebugAssert3();
    goto LABEL_25;
  }
  if (self->_countScales < 1)
  {
LABEL_24:
    int v50 = 0;
    goto LABEL_25;
  }
  uint64_t v33 = 0;
  pyr_tex = self->_pyr_tex;
  uint64_t v35 = &self->_pyrInfoArray[1].kernel_filter + 1;
  uint64_t v36 = &self->_pyrInfoArray[1].kernel_filter + 1;
  while (1)
  {
    int v38 = *(unsigned __int8 *)v36;
    v36 += 12;
    int v37 = v38;
    if (v33 || !v37) {
      break;
    }
    int v39 = objc_msgSend__downscaleAntialiasingWithCommandBuffer_in_tex_out_tex_in_ref_res_out_ref_res_(self, v31, (uint64_t)v6, (uint64_t)v7, (uint64_t)self->_pyr_tex[0], v32, self->_input_res.width, self->_input_res.height, self->_pyr_int_dims[0].width, self->_pyr_int_dims[0].height);
    if (v39)
    {
      int v50 = v39;
      goto LABEL_28;
    }
LABEL_23:
    ++v33;
    uint64_t v35 = v36;
    if (v33 >= self->_countScales) {
      goto LABEL_24;
    }
  }
  if (v33)
  {
    uint64_t v40 = *(v35 - 1);
    if (v40 == -1) {
      goto LABEL_29;
    }
    v41 = pyr_tex[v40];

    uint64_t v7 = v41;
  }
  float64x2_t v44 = pyr_tex[v33];
  int v45 = *(v35 - 7);
  if (!v45)
  {
    int v47 = objc_msgSend__doRPDDownscale1WithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v42, (uint64_t)v6, (uint64_t)v7, (uint64_t)v44, v43, *(double *)(v35 - 3));
    if (v47)
    {
      int v50 = v47;
      goto LABEL_31;
    }
    goto LABEL_22;
  }
  if (v45 != 2)
  {
    if (v45 != 1)
    {
      FigDebugAssert3();
      int v50 = -12780;
      goto LABEL_27;
    }
    int v46 = objc_msgSend__downscale2XEqualWithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v42, (uint64_t)v6, (uint64_t)v7, (uint64_t)v44, v43, *(double *)(v35 - 3));
    if (v46)
    {
      int v50 = v46;
      goto LABEL_31;
    }
    goto LABEL_22;
  }
  int v48 = objc_msgSend__downscale2XBelowWithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v42, (uint64_t)v6, (uint64_t)v7, (uint64_t)v44, v43, *(double *)(v35 - 3));
  if (!v48)
  {
LABEL_22:

    goto LABEL_23;
  }
  int v50 = v48;
LABEL_31:
  FigDebugAssert3();
LABEL_27:

LABEL_25:
  return v50;
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
  uint64_t v5 = objc_opt_new();
  for (unsigned int i = 0; i < 3; ++i)
  {
    for (unsigned int j = 0; j < 3; ++j)
    {
      objc_msgSend_setConstantValue_type_atIndex_(v5, v3, (uint64_t)&j, 33, 0, v4);
      objc_msgSend_setConstantValue_type_atIndex_(v5, v6, (uint64_t)&i, 33, 1, v7);
      uint64_t v11 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v8, @"rpdDownscaleImage1", (uint64_t)v5, v9, v10);
      uint64_t v12 = self->_KernelDownscaleImage1[j];
      uint64_t v13 = v12[i];
      v12[i] = (MTLComputePipelineState *)v11;
    }
  }

  uint64_t v14 = 0;
  computePipelines = self->_computePipelines;
  char v16 = 1;
  do
  {
    char v17 = v16;
    id v18 = [NSString alloc];
    uint64_t v23 = objc_msgSend_initWithUTF8String_(v18, v19, (uint64_t)off_2655BE930[v14], v20, v21, v22);
    uint64_t v27 = objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v24, (uint64_t)v23, 0, v25, v26);
    uint64_t v28 = computePipelines[v14];
    computePipelines[v14] = (MTLComputePipelineState *)v27;

    char v16 = 0;
    uint64_t v14 = 1;
  }
  while ((v17 & 1) != 0);
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
        uint64_t v11 = &self->super.isa + v4;
        uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, a2, (uint64_t)v11[338], 70, 23, 0, vcvtq_f64_s64(v10));
        Class v13 = v11[370];
        v11[370] = (Class)v12;

        uint64_t v18 = objc_msgSend_newTextureViewWithPixelFormat_(v11[370], v14, 53, v15, v16, v17);
        Class v19 = v11[402];
        v11[402] = (Class)v18;

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
  int v18 = objc_msgSend_width(v11, v13, v14, v15, v16, v17);
  int v24 = objc_msgSend_height(v11, v19, v20, v21, v22, v23);
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v30 = vdiv_f32(_D0, v6);
  float32x2_t v77 = v30;
  uint64_t v31 = 2;
  if (v30.f32[0] <= 3.0) {
    unsigned int v32 = 1;
  }
  else {
    unsigned int v32 = 2;
  }
  if (v30.f32[1] <= 3.0) {
    uint64_t v31 = 1;
  }
  if (v30.f32[0] <= 1.0) {
    unsigned int v32 = 0;
  }
  uint64_t v33 = (char *)self + 24 * v32;
  if (v30.f32[1] <= 1.0) {
    uint64_t v31 = 0;
  }
  id v34 = *(id *)&v33[8 * v31 + 40];
  uint64_t v40 = objc_msgSend_computeCommandEncoder(v12, v35, v36, v37, v38, v39);

  if (v40)
  {
    objc_msgSend_setComputePipelineState_(v40, v41, (uint64_t)v34, v42, v43, v44);
    objc_msgSend_setTexture_atIndex_(v40, v45, (uint64_t)v10, 0, v46, v47);
    objc_msgSend_setTexture_atIndex_(v40, v48, (uint64_t)v11, 1, v49, v50);
    objc_msgSend_setBytes_length_atIndex_(v40, v51, (uint64_t)&v77, 8, 0, v52);
    unint64_t v58 = objc_msgSend_threadExecutionWidth(v34, v53, v54, v55, v56, v57);
    unint64_t v64 = objc_msgSend_maxTotalThreadsPerThreadgroup(v34, v59, v60, v61, v62, v63);
    v76[0] = (v58 + v18 - 1) / v58;
    v76[1] = (v64 / v58 + v24 - 1) / (v64 / v58);
    v76[2] = 1;
    v75[0] = v58;
    v75[1] = v64 / v58;
    v75[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v40, v65, (uint64_t)v76, (uint64_t)v75, v66, v67);
    objc_msgSend_endEncoding(v40, v68, v69, v70, v71, v72);
    int v73 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();
  }

  return v73;
}

- (int)_downscale2XBelowWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:
{
  float32x2_t v6 = v5;
  id v10 = a4;
  id v11 = a5;
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v71 = vdiv_f32(_D0, v6);
  uint64_t v17 = self->_computePipelines[0];
  uint64_t v23 = objc_msgSend_computeCommandEncoder(a3, v18, v19, v20, v21, v22);
  uint64_t v28 = v23;
  if (v23)
  {
    objc_msgSend_setComputePipelineState_(v23, v24, (uint64_t)v17, v25, v26, v27);
    objc_msgSend_setTexture_atIndex_(v28, v29, (uint64_t)v10, 0, v30, v31);
    objc_msgSend_setTexture_atIndex_(v28, v32, (uint64_t)v11, 1, v33, v34);
    objc_msgSend_setBytes_length_atIndex_(v28, v35, (uint64_t)&v71, 8, 0, v36);
    unint64_t v42 = objc_msgSend_threadExecutionWidth(v17, v37, v38, v39, v40, v41);
    unint64_t v48 = objc_msgSend_maxTotalThreadsPerThreadgroup(v17, v43, v44, v45, v46, v47) / v42;
    v70[0] = (v42 + (int)objc_msgSend_width(v11, v49, v50, v51, v52, v53) - 1) / v42;
    v70[1] = (v48 + (int)objc_msgSend_height(v11, v54, v55, v56, v57, v58) - 1) / v48;
    v70[2] = 1;
    v69[0] = v42;
    v69[1] = v48;
    v69[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v59, (uint64_t)v70, (uint64_t)v69, v60, v61);
    objc_msgSend_endEncoding(v28, v62, v63, v64, v65, v66);
    int v67 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v67 = FigSignalErrorAt();
  }

  return v67;
}

- (int)_downscale2XEqualWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:
{
  float32x2_t v6 = v5;
  id v10 = a4;
  id v11 = a5;
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v71 = vdiv_f32(_D0, v6);
  uint64_t v17 = self->_computePipelines[1];
  uint64_t v23 = objc_msgSend_computeCommandEncoder(a3, v18, v19, v20, v21, v22);
  uint64_t v28 = v23;
  if (v23)
  {
    objc_msgSend_setComputePipelineState_(v23, v24, (uint64_t)v17, v25, v26, v27);
    objc_msgSend_setTexture_atIndex_(v28, v29, (uint64_t)v10, 0, v30, v31);
    objc_msgSend_setTexture_atIndex_(v28, v32, (uint64_t)v11, 1, v33, v34);
    objc_msgSend_setBytes_length_atIndex_(v28, v35, (uint64_t)&v71, 8, 0, v36);
    unint64_t v42 = objc_msgSend_threadExecutionWidth(v17, v37, v38, v39, v40, v41);
    unint64_t v48 = objc_msgSend_maxTotalThreadsPerThreadgroup(v17, v43, v44, v45, v46, v47) / v42;
    v70[0] = (v42 + (int)objc_msgSend_width(v11, v49, v50, v51, v52, v53) - 1) / v42;
    v70[1] = (v48 + (int)objc_msgSend_height(v11, v54, v55, v56, v57, v58) - 1) / v48;
    v70[2] = 1;
    v69[0] = v42;
    v69[1] = v48;
    v69[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v59, (uint64_t)v70, (uint64_t)v69, v60, v61);
    objc_msgSend_endEncoding(v28, v62, v63, v64, v65, v66);
    int v67 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v67 = FigSignalErrorAt();
  }

  return v67;
}

- (int)_downscaleAntialiasingWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 in_ref_res:(CGSize)a6 out_ref_res:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  CGFloat v67 = a6.width;
  CGFloat v69 = a6.height;
  id v66 = a3;
  id v12 = a4;
  id v13 = a5;
  if ((objc_msgSend_pixelFormat(v12, v14, v15, v16, v17, v18) == 70
     || objc_msgSend_pixelFormat(v12, v19, v20, v21, v22, v23) == 80)
    && self->_isValid)
  {
    uint64_t v24 = objc_msgSend_pixelFormat(v12, v19, v20, v21, v22, v23);
    int v30 = (int)width;
    int v31 = (int)height;
    int v32 = 2 * (int)width;
    int v33 = 2 * (int)height;
    v34.f64[0] = v67;
    v34.f64[1] = v69;
    int64x2_t v35 = vcvtq_s64_f64(v34);
    *(int32x2_t *)v35.i8 = vmovn_s64(v35);
    if (v32 < v35.i32[0] && v33 < v35.i32[1])
    {
      uint64_t v39 = v24;
      int64x2_t v70 = v35;
      id v64 = v13;
      antialiasing_pxbuf = self->_antialiasing_pxbuf;
      uint64_t v41 = 0xFFFFFFFFLL;
      while (1)
      {
        int v42 = objc_msgSend_width(v12, v25, v26, v27, v28, v29);
        int v49 = objc_msgSend_height(v12, v43, v44, v45, v46, v47);
        mtlContext = self->_mtlContext;
        if (v41 == 0xFFFFFFFFLL)
        {
          uint64_t v51 = (uint64_t *)self->_antialiasing_pxbuf;
          uint64_t v52 = v12;
        }
        else
        {
          uint64_t v52 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(mtlContext, v48, (uint64_t)antialiasing_pxbuf[v41], v39, 17, 0, (double)v42, (double)v49);

          mtlContext = self->_mtlContext;
          uint64_t v51 = (uint64_t *)&antialiasing_pxbuf[v41 ^ 1];
        }
        v53.i64[1] = v70.i64[1];
        int32x2_t v54 = vcvt_s32_f32(vrndp_f32(vmul_f32(vcvt_f32_s32(*(int32x2_t *)v70.i8), (float32x2_t)0x3F0000003F000000)));
        *(int32x2_t *)v53.i8 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v54, (int8x8_t)0x100000001), v54);
        int64x2_t v68 = v53;
        unsigned int v55 = vcvtps_s32_f32((float)v42 * 0.5);
        unsigned int v56 = vcvtps_s32_f32((float)v49 * 0.5);
        objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(mtlContext, v48, *v51, v39, 23, 0, (double)(int)((v55 & 1) + v55), (double)(int)((v56 & 1) + v56));
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        float32x2_t v65 = vcvt_f32_s32(vadd_s32(*(int32x2_t *)v68.i8, (int32x2_t)-1));
        int v59 = objc_msgSend__downscale2XEqualWithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v57, (uint64_t)v66, (uint64_t)v52, (uint64_t)v12, v58, COERCE_DOUBLE(vdiv_f32(v65, vcvt_f32_s32(vadd_s32(*(int32x2_t *)v70.i8, (int32x2_t)-1)))));
        if (v59) {
          break;
        }

        if (v41 == 0xFFFFFFFFLL) {
          uint64_t v41 = 0;
        }
        else {
          v41 ^= 1uLL;
        }
        BOOL v60 = v68.i32[0] <= v32 || v68.i32[1] <= v33;
        int64x2_t v70 = v68;
        if (v60)
        {
          float v38 = v65.f32[1];
          float v37 = v65.f32[0];
          id v13 = v64;
          int v30 = (int)width;
          int v31 = (int)height;
          goto LABEL_23;
        }
      }
      int v62 = v59;
      FigDebugAssert3();

      id v12 = v52;
      id v13 = v64;
    }
    else
    {
      float v37 = (float)(v35.i32[0] - 1);
      float v38 = (float)(v35.i32[1] - 1);
LABEL_23:
      *(float *)&double v61 = (float)(v30 - 1) / v37;
      *((float *)&v61 + 1) = (float)(v31 - 1) / v38;
      int v62 = objc_msgSend__downscale2XBelowWithCommandBuffer_in_tex_out_tex_scaling_factor_(self, v25, (uint64_t)v66, (uint64_t)v12, (uint64_t)v13, v29, v61);
      if (v62) {
        FigDebugAssert3();
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v62 = -12780;
  }

  return v62;
}

+ ($7FB6425C18F41DAB009C0E09F35EA633)_determineFilterFromResolution:(SEL)a3 toResolution:(CGSize)a4
{
  float width = a4.width;
  float v6 = a5.width;
  v7.f32[0] = width / v6;
  float height = a4.height;
  float v9 = a5.height;
  float v10 = height / v9;
  if (v7.f32[0] <= v10) {
    float v11 = v10;
  }
  else {
    float v11 = v7.f32[0];
  }
  if (v11 > 1.9) {
    int v12 = 1;
  }
  else {
    int v12 = 2;
  }
  if (v11 >= 2.1) {
    int v12 = 0;
  }
  retstr->var0 = a5;
  retstr->var1 = v12;
  v7.f32[1] = v10;
  __asm { FMOV            V5.2S, #1.0 }
  CGFloat v18 = a5.height;
  __asm { FMOV            V3.2D, #-1.0 }
  CGFloat v20 = a4.height;
  *(float32x2_t *)&retstr->var3 = vdiv_f32(_D5, v7);
  *(float32x2_t *)&retstr[1].var0.float width = vcvt_f32_f64(vdivq_f64(vaddq_f64((float64x2_t)a5, _Q3), vaddq_f64((float64x2_t)a4, _Q3)));
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