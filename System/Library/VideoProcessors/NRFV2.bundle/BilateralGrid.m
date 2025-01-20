@interface BilateralGrid
+ (int)prewarmShaders:(id)a3;
- (BilateralGrid)initWithContext:(id)a3;
- (BilateralGrid)initWithContext:(id)a3 normalizeGridConfidence:(BOOL)a4;
- (id)allocGridTexture:(unint64_t)a3 label:(id)a4;
- (id)solverPcg:(int)a3;
- (int)allocateTextures;
- (int)blurAndNormalize:(id)a3 grid_tmp_tex:(id)a4;
- (int)buildWithGuideAndConfidence:(id)a3 target:(id)a4 confidence:(id)a5 grid_tex:(id)a6 ltc_tex:(id)a7 gtcRatio_tex:(id)a8 gtcFinal_tex:(id)a9 ltmROI:;
- (int)config:(unint64_t)a3 height:(unint64_t)a4 space_sigma:(int)a5 range_sigma:(float)a6 solver:(BilateralSolverConfiguration)a7;
- (int)filter:(id)a3 output:(id)a4;
- (int)jointfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 output:(__CVBuffer *)a5;
- (int)setupWithConfig:(BilateralGridConfiguration *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (int)solverBistochastize:(int)a3;
- (int)solverfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 confidence:(__CVBuffer *)a5 output:(__CVBuffer *)a6;
- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:;
- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 output:(id)a6;
- (int)upsample:(id)a3 grid_tex:(id)a4 conf_tex:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:;
- (void)dealloc;
- (void)releaseTextures;
@end

@implementation BilateralGrid

- (BilateralGrid)initWithContext:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  id v7 = a3;
  v70.receiver = self;
  v70.super_class = (Class)BilateralGrid;
  v8 = [(BilateralGrid *)&v70 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metal, a3);
    v9->_normalizeGridConfidence = a4;
    v9->_useMetalAllocator = 0;
    v13 = objc_msgSend_device(v9->_metal, v10, v11, v12);
    uint64_t v15 = objc_msgSend_newBufferWithLength_options_(v13, v14, 36, 0);
    uniforms = v9->_uniforms;
    v9->_uniforms = (MTLBuffer *)v15;

    if (v9->_uniforms)
    {
      v20 = objc_msgSend_device(v9->_metal, v17, v18, v19);
      uint64_t v22 = objc_msgSend_newBufferWithLength_options_(v20, v21, 4, 0);
      max_grid_confidence = v9->_max_grid_confidence;
      v9->_max_grid_confidence = (MTLBuffer *)v22;

      if (v9->_max_grid_confidence)
      {
        v27 = objc_msgSend_sharedInstance(BilateralGridShared, v24, v25, v26);
        uint64_t v29 = objc_msgSend_getShaders_normalizeGridConfidence_(v27, v28, (uint64_t)v9->_metal, v9->_normalizeGridConfidence);
        shaders = v9->_shaders;
        v9->_shaders = (BilateralGridShaders *)v29;

        if (v9->_shaders)
        {
          v34 = objc_msgSend_device(v9->_metal, v31, v32, v33);
          uint64_t v36 = objc_msgSend_newBufferWithLength_options_(v34, v35, 4, 0);
          l0_buf = v9->_l0_buf;
          v9->_l0_buf = (MTLBuffer *)v36;

          if (v9->_l0_buf)
          {
            v41 = objc_msgSend_device(v9->_metal, v38, v39, v40);
            uint64_t v43 = objc_msgSend_newBufferWithLength_options_(v41, v42, 4, 0);
            l1_buf = v9->_l1_buf;
            v9->_l1_buf = (MTLBuffer *)v43;

            if (v9->_l1_buf)
            {
              v48 = objc_msgSend_device(v9->_metal, v45, v46, v47);
              uint64_t v50 = objc_msgSend_newBufferWithLength_options_(v48, v49, 4, 0);
              alpha_buf = v9->_alpha_buf;
              v9->_alpha_buf = (MTLBuffer *)v50;

              if (v9->_alpha_buf)
              {
                v55 = objc_msgSend_device(v9->_metal, v52, v53, v54);
                uint64_t v57 = objc_msgSend_newBufferWithLength_options_(v55, v56, 4, 0);
                residual_buf = v9->_residual_buf;
                v9->_residual_buf = (MTLBuffer *)v57;

                if (v9->_residual_buf)
                {
                  v62 = objc_msgSend_device(v9->_metal, v59, v60, v61);
                  uint64_t v64 = objc_msgSend_newBufferWithLength_options_(v62, v63, 4, 0);
                  hasconverged_buf = v9->_hasconverged_buf;
                  v9->_hasconverged_buf = (MTLBuffer *)v64;

                  if (v9->_hasconverged_buf) {
                    goto LABEL_10;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();
  int v69 = FigSignalErrorAt();
  v66 = 0;
  if (!v69) {
LABEL_10:
  }
    v66 = v9;
  v67 = v66;

  return v67;
}

- (BilateralGrid)initWithContext:(id)a3
{
  return (BilateralGrid *)MEMORY[0x270F9A6D0](self, sel_initWithContext_normalizeGridConfidence_, a3, 1);
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [BilateralGridShaders alloc];
  uint64_t v6 = objc_msgSend_initWithMetal_normalizeGridConfidence_(v4, v5, (uint64_t)v3, 0);
  if (v6
    && (id v7 = (void *)v6,
        v8 = [BilateralGridShaders alloc],
        v10 = objc_msgSend_initWithMetal_normalizeGridConfidence_(v8, v9, (uint64_t)v3, 1),
        v7,
        v10))
  {
    int v11 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    v10 = 0;
  }

  return v11;
}

- (int)config:(unint64_t)a3 height:(unint64_t)a4 space_sigma:(int)a5 range_sigma:(float)a6 solver:(BilateralSolverConfiguration)a7
{
  if (a3
    && a4
    && (float v7 = a7.var2,
        float var1 = a7.var1,
        float var0 = a7.var0,
        a7.float var2 = a6,
        v11.i32[1] = 1028443341,
        (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(vdupq_n_s32(a5), (int32x4_t)xmmword_263017970), (int8x16_t)vceqq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7.var2, 0), (float32x4_t)xmmword_263017980)))) & 1) != 0))
  {
    float var3 = a7.var3;
    self->_space_sigma = a5;
    self->_range_sigma = a6;
    self->_input_width = a3;
    self->_input_height = a4;
    v14.i64[0] = a3;
    v14.i64[1] = a4;
    *(float *)v11.i32 = (float)a5;
    float var2 = a7.var2;
    float v24 = (float)a5;
    __asm { FMOV            V1.2S, #-1.0 }
    *(int32x2_t *)&self->_grid_width = vadd_s32(vcvt_s32_f32(vdiv_f32(vadd_f32(vcvt_f32_f64(vcvtq_f64_u64(v14)), _D1), (float32x2_t)vdup_lane_s32(v11, 0))), (int32x2_t)0x100000001);
    float v20 = 1.0 / a7.var2;
    self->_grid_depth = (unsigned __int16)((int)(float)(1.0 / a7.var2) + 1);
    uint64_t v21 = objc_msgSend_contents(self->_uniforms, a2, a3, a4);
    *(_DWORD *)uint64_t v21 = a5;
    *(float *)(v21 + 4) = var2;
    *(float *)(v21 + 8) = 1.0 / v24;
    *(float *)(v21 + 12) = v20;
    *(_DWORD *)(v21 + 16) = self->_grid_depth;
    *(float *)(v21 + 20) = var0;
    *(float *)(v21 + 24) = var1;
    *(float *)(v21 + 28) = v7;
    *(float *)(v21 + 32) = var3;
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (id)allocGridTexture:(unint64_t)a3 label:(id)a4
{
  uint64_t v6 = objc_msgSend_allocator(self->_metal, a2, a3, (uint64_t)a4);
  v10 = objc_msgSend_newTextureDescriptor(v6, v7, v8, v9);

  if (!v10) {
    goto LABEL_7;
  }
  uint64x2_t v14 = objc_msgSend_desc(v10, v11, v12, v13);
  objc_msgSend_setCompressionMode_(v14, v15, 2, v16);

  float v20 = objc_msgSend_desc(v10, v17, v18, v19);
  objc_msgSend_setCompressionFootprint_(v20, v21, 0, v22);

  uint64_t grid_width = self->_grid_width;
  v27 = objc_msgSend_desc(v10, v24, v25, v26);
  objc_msgSend_setWidth_(v27, v28, grid_width, v29);

  uint64_t grid_height = self->_grid_height;
  v34 = objc_msgSend_desc(v10, v31, v32, v33);
  objc_msgSend_setHeight_(v34, v35, grid_height, v36);

  uint64_t grid_depth = self->_grid_depth;
  v41 = objc_msgSend_desc(v10, v38, v39, v40);
  objc_msgSend_setDepth_(v41, v42, grid_depth, v43);

  uint64_t v47 = objc_msgSend_desc(v10, v44, v45, v46);
  objc_msgSend_setUsage_(v47, v48, 3, v49);

  uint64_t v53 = objc_msgSend_desc(v10, v50, v51, v52);
  objc_msgSend_setTextureType_(v53, v54, 7, v55);

  v59 = objc_msgSend_desc(v10, v56, v57, v58);
  objc_msgSend_setPixelFormat_(v59, v60, a3, v61);

  objc_msgSend_setLabel_(v10, v62, 0, v63);
  metal = self->_metal;
  if (self->_useMetalAllocator)
  {
    v68 = objc_msgSend_allocator(metal, v64, v65, v66);
    v71 = objc_msgSend_newTextureWithDescriptor_(v68, v69, (uint64_t)v10, v70);

    if (!v71) {
      goto LABEL_7;
    }
  }
  else
  {
    v72 = objc_msgSend_device(metal, v64, v65, v66);
    v76 = objc_msgSend_desc(v10, v73, v74, v75);
    v71 = objc_msgSend_newTextureWithDescriptor_(v72, v77, (uint64_t)v76, v78);

    if (!v71)
    {
LABEL_7:
      FigDebugAssert3();
      FigSignalErrorAt();
      v71 = 0;
    }
  }

  return v71;
}

- (int)allocateTextures
{
  id v3 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, a2, 115, @"grid_tex");
  grid_tex = self->_grid_tex;
  self->_grid_tex = v3;

  if (self->_grid_tex)
  {
    uint64_t v6 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v5, 115, @"tmp_grid_tex");
    tmp_grid_tex = self->_tmp_grid_tex;
    self->_tmp_grid_tex = v6;

    if (self->_tmp_grid_tex)
    {
      uint64_t v9 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v8, 25, @"confidence_solved_tex");
      confidence_solved_tex = self->_confidence_solved_tex;
      self->_confidence_solved_tex = v9;

      if (self->_confidence_solved_tex)
      {
        uint64_t v12 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v11, 55, @"bistochast_m_tex");
        bistochast_m_tex = self->_bistochast_m_tex;
        self->_bistochast_m_tex = v12;

        if (self->_bistochast_m_tex)
        {
          uint64_t v15 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v14, 55, @"bistochast_n_tex");
          bistochast_n_tex = self->_bistochast_n_tex;
          self->_bistochast_n_tex = v15;

          if (self->_bistochast_n_tex)
          {
            uint64_t v18 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v17, 55, @"A_tex");
            A_tex = self->_A_tex;
            self->_A_tex = v18;

            if (self->_A_tex)
            {
              uint64_t v21 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v20, 25, @"x0_tex");
              x0_tex = self->_x0_tex;
              self->_x0_tex = v21;

              if (self->_x0_tex)
              {
                float v24 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v23, 25, @"x1_tex");
                x1_tex = self->_x1_tex;
                self->_x1_tex = v24;

                if (self->_x1_tex)
                {
                  v27 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v26, 55, @"residual0_tex");
                  residual0_tex = self->_residual0_tex;
                  self->_residual0_tex = v27;

                  if (self->_residual0_tex)
                  {
                    v30 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v29, 55, @"residual1_tex");
                    residual1_tex = self->_residual1_tex;
                    self->_residual1_tex = v30;

                    if (self->_residual1_tex)
                    {
                      uint64_t v33 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v32, 55, @"d0_tex");
                      d0_tex = self->_d0_tex;
                      self->_d0_tex = v33;

                      if (self->_d0_tex)
                      {
                        uint64_t v36 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v35, 55, @"d1_tex");
                        d1_tex = self->_d1_tex;
                        self->_d1_tex = v36;

                        if (self->_d1_tex)
                        {
                          uint64_t v39 = (MTLTexture *)objc_msgSend_allocGridTexture_label_(self, v38, 55, @"q_tex");
                          q_tex = self->_q_tex;
                          self->_q_tex = v39;

                          if (self->_q_tex) {
                            return 0;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)releaseTextures
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  FigMetalDecRef();
}

- (void)dealloc
{
  objc_msgSend_releaseTextures(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)BilateralGrid;
  [(BilateralGrid *)&v5 dealloc];
}

- (int)setupWithConfig:(BilateralGridConfiguration *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v9 = objc_msgSend_allocator(self->_metal, a2, (uint64_t)a3, a4);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_allocator(self->_metal, v10, v11, v12);
    self->_useMetalAllocator = objc_msgSend_allocatorType(v13, v14, v15, v16) == 2;

    *(float *)&double v17 = a3->var1;
    *(float *)&double v18 = a3->var2.var0;
    *(float *)&double v19 = a3->var2.var1;
    *(float *)&double v20 = a3->var2.var2;
    *(float *)&double v21 = a3->var2.var3;
    int v23 = objc_msgSend_config_height_space_sigma_range_sigma_solver_(self, v22, a4, a5, a3->var0, v17, v18, v19, v20, v21);
    if (v23)
    {
      int v27 = v23;
      FigDebugAssert3();
    }
    else
    {
      if (!self->_useMetalAllocator) {
        objc_msgSend_allocateTextures(self, v24, v25, v26);
      }
      return 0;
    }
    return v27;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)buildWithGuideAndConfidence:(id)a3 target:(id)a4 confidence:(id)a5 grid_tex:(id)a6 ltc_tex:(id)a7 gtcRatio_tex:(id)a8 gtcFinal_tex:(id)a9 ltmROI:
{
  long long v58 = v9;
  id v60 = a3;
  id v59 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  long long v64 = v58;
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  uint64_t v26 = objc_msgSend_commandQueue(self->_metal, v23, v24, v25);
  v30 = objc_msgSend_commandBuffer(v26, v27, v28, v29);

  if (v30)
  {
    v34 = objc_msgSend_computeCommandEncoder(v30, v31, v32, v33);
    v37 = v34;
    if (v34)
    {
      unint64_t v38 = (unint64_t)(grid_width + 7) >> 3;
      unint64_t v39 = (unint64_t)(grid_height + 7) >> 3;
      uint64_t v40 = 8;
      if (v18) {
        uint64_t v40 = 16;
      }
      objc_msgSend_setComputePipelineState_(v34, v35, *(uint64_t *)((char *)&self->_shaders->super.isa + v40), v36);
      objc_msgSend_setTexture_atIndex_(v37, v41, (uint64_t)v60, 0);
      objc_msgSend_setTexture_atIndex_(v37, v42, (uint64_t)v59, 1);
      objc_msgSend_setTexture_atIndex_(v37, v43, (uint64_t)v16, 2);
      objc_msgSend_setTexture_atIndex_(v37, v44, (uint64_t)v17, 3);
      if (v18 && v19 && v20)
      {
        objc_msgSend_setTexture_atIndex_(v37, v45, (uint64_t)v18, 4);
        objc_msgSend_setTexture_atIndex_(v37, v46, (uint64_t)v19, 5);
        objc_msgSend_setTexture_atIndex_(v37, v47, (uint64_t)v20, 6);
        objc_msgSend_setBytes_length_atIndex_(v37, v48, (uint64_t)&v64, 16, 1);
      }
      objc_msgSend_setBuffer_offset_atIndex_(v37, v45, (uint64_t)self->_uniforms, 0, 0);
      v63[0] = v38;
      v63[1] = v39;
      v63[2] = 1;
      int64x2_t v61 = vdupq_n_s64(8uLL);
      uint64_t v62 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v37, v49, (uint64_t)v63, (uint64_t)&v61);
      objc_msgSend_endEncoding(v37, v50, v51, v52);
      objc_msgSend_commit(v30, v53, v54, v55);
      int v56 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v56 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v56 = FigSignalErrorAt();
  }

  return v56;
}

- (int)blurAndNormalize:(id)a3 grid_tmp_tex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  uint64_t v15 = objc_msgSend_commandQueue(self->_metal, v12, v13, v14);
  uint64_t v19 = objc_msgSend_commandBuffer(v15, v16, v17, v18);

  uint64_t v62 = (void *)v19;
  if (v19)
  {
    id v58 = v9;
    uint64_t v23 = 0;
    id v24 = 0;
    unint64_t v61 = (unint64_t)(grid_width + 7) >> 3;
    int64x2_t v60 = vdupq_n_s64(8uLL);
    id v59 = v8;
    id v25 = v8;
    while (2)
    {
      char v26 = 1;
      do
      {
        int v27 = v25;
        uint64_t v28 = v9;
        char v29 = v26;
        v30 = objc_msgSend_computeCommandEncoder(v62, v20, v21, v22);
        if (!v30)
        {
          FigDebugAssert3();
          int v56 = FigSignalErrorAt();
          goto LABEL_16;
        }
        uint64_t v33 = v30;
        objc_msgSend_setComputePipelineState_(v30, v31, (uint64_t)self->_shaders->_bgBlur[v23], v32);
        objc_msgSend_setTexture_atIndex_(v33, v34, (uint64_t)v25, 0);
        objc_msgSend_setTexture_atIndex_(v33, v35, (uint64_t)v9, 1);
        objc_msgSend_setBuffer_offset_atIndex_(v33, v36, (uint64_t)self->_uniforms, 0, 0);
        if (v23 == 2 && self->_normalizeGridConfidence) {
          objc_msgSend_setBuffer_offset_atIndex_(v33, v37, (uint64_t)self->_max_grid_confidence, 0, 1);
        }
        unint64_t v65 = v61;
        unint64_t v66 = (unint64_t)(grid_height + 7) >> 3;
        uint64_t v67 = 1;
        int64x2_t v63 = v60;
        uint64_t v64 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v33, v37, (uint64_t)&v65, (uint64_t)&v63);
        objc_msgSend_endEncoding(v33, v38, v39, v40);
        id v41 = v25;

        id v25 = v28;
        id v24 = v41;

        char v26 = 0;
        id v9 = v24;
      }
      while ((v29 & 1) != 0);
      ++v23;
      id v9 = v24;
      if (v23 != 3) {
        continue;
      }
      break;
    }
    v42 = objc_msgSend_computeCommandEncoder(v62, v20, v21, v22);
    uint64_t v45 = v42;
    if (v42)
    {
      objc_msgSend_setComputePipelineState_(v42, v43, (uint64_t)self->_shaders->_bgNormalize, v44);
      objc_msgSend_setTexture_atIndex_(v45, v46, (uint64_t)v25, 0);
      objc_msgSend_setTexture_atIndex_(v45, v47, (uint64_t)v24, 1);
      objc_msgSend_setBuffer_offset_atIndex_(v45, v48, (uint64_t)self->_uniforms, 0, 0);
      if (self->_normalizeGridConfidence) {
        objc_msgSend_setBuffer_offset_atIndex_(v45, v49, (uint64_t)self->_max_grid_confidence, 0, 1);
      }
      unint64_t v65 = v61;
      unint64_t v66 = (unint64_t)(grid_height + 7) >> 3;
      uint64_t v67 = 1;
      int64x2_t v63 = vdupq_n_s64(8uLL);
      uint64_t v64 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v45, v49, (uint64_t)&v65, (uint64_t)&v63);
      objc_msgSend_endEncoding(v45, v50, v51, v52);
      objc_msgSend_commit(v62, v53, v54, v55);
      objc_storeStrong((id *)&self->_grid_tex, v27);
      objc_storeStrong((id *)&self->_tmp_grid_tex, v28);
      int v56 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v56 = FigSignalErrorAt();
    }

    uint64_t v28 = v24;
LABEL_16:
    id v9 = v58;
    id v8 = v59;
  }
  else
  {
    FigDebugAssert3();
    int v56 = FigSignalErrorAt();
    id v24 = 0;
    id v25 = v8;
    uint64_t v28 = v9;
  }

  return v56;
}

- (int)upsample:(id)a3 grid_tex:(id)a4 conf_tex:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:
{
  long long v89 = v9;
  id v90 = a3;
  id v92 = a4;
  id v91 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = v18;
  long long v93 = v89;
  if (v16) {
    BOOL v20 = v17 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = !v20;
  BOOL v22 = v18 != 0;
  id v23 = a9;
  uint64_t v27 = objc_msgSend_pixelFormat(v23, v24, v25, v26);
  int v28 = v21 & v22;
  uint64_t v29 = 64;
  if (v28) {
    uint64_t v29 = 72;
  }
  if (v27 != 25) {
    uint64_t v29 = 56;
  }
  id v30 = *(id *)((char *)&self->_shaders->super.isa + v29);
  v34 = objc_msgSend_renderPassDescriptor(MEMORY[0x263F129A0], v31, v32, v33);
  unint64_t v38 = objc_msgSend_colorAttachments(v34, v35, v36, v37);
  id v41 = objc_msgSend_objectAtIndexedSubscript_(v38, v39, 0, v40);
  objc_msgSend_setTexture_(v41, v42, (uint64_t)v23, v43);

  uint64_t v47 = objc_msgSend_colorAttachments(v34, v44, v45, v46);
  uint64_t v50 = objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0, v49);
  objc_msgSend_setLoadAction_(v50, v51, 0, v52);

  int v56 = objc_msgSend_commandQueue(self->_metal, v53, v54, v55);
  int64x2_t v60 = objc_msgSend_commandBuffer(v56, v57, v58, v59);

  if (v60
    && (objc_msgSend_renderCommandEncoderWithDescriptor_(v60, v61, (uint64_t)v34, v62),
        (uint64_t v63 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v67 = (void *)v63;
    v68 = objc_msgSend_fullRangeVertexBuf(self->_metal, v64, v65, v66);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v67, v69, (uint64_t)v68, 0, 0);

    uint64_t v70 = v90;
    objc_msgSend_setFragmentTexture_atIndex_(v67, v71, (uint64_t)v90, 0);
    objc_msgSend_setFragmentTexture_atIndex_(v67, v72, (uint64_t)v92, 1);
    objc_msgSend_setFragmentTexture_atIndex_(v67, v73, (uint64_t)v91, 2);
    if (v28)
    {
      objc_msgSend_setFragmentTexture_atIndex_(v67, v74, (uint64_t)v16, 3);
      objc_msgSend_setFragmentTexture_atIndex_(v67, v75, (uint64_t)v17, 4);
      objc_msgSend_setFragmentTexture_atIndex_(v67, v76, (uint64_t)v19, 5);
      objc_msgSend_setFragmentBytes_length_atIndex_(v67, v77, (uint64_t)&v93, 16, 1);
    }
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v67, v74, (uint64_t)self->_uniforms, 0, 0);
    objc_msgSend_setRenderPipelineState_(v67, v78, (uint64_t)v30, v79);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v67, v80, 4, 0, 4);
    objc_msgSend_endEncoding(v67, v81, v82, v83);
    objc_msgSend_commit(v60, v84, v85, v86);

    int v87 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v87 = FigSignalErrorAt();
    uint64_t v70 = v90;
  }

  return v87;
}

- (int)filter:(id)a3 output:(id)a4
{
  return objc_msgSend_solverfilterWithGuide_target_confidence_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(self, a2, (uint64_t)a3, (uint64_t)a3, 0, 0, 0, 0, 0.0, a4);
}

- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 output:(id)a6
{
  int v6 = objc_msgSend_solverfilterWithGuide_target_confidence_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, 0.0, a6);
  if (v6) {
    FigDebugAssert3();
  }
  return v6;
}

- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:
{
  double v38 = v9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v25 = a9;
  if (self->_useMetalAllocator)
  {
    int Textures = objc_msgSend_allocateTextures(self, v22, v23, v24);
    if (Textures)
    {
      int v36 = Textures;
      goto LABEL_24;
    }
  }
  uint64_t v27 = objc_msgSend_pixelFormat(v16, v22, v23, v24);
  if (v27 > 575)
  {
    if (v27 != 576 && v27 != 588) {
      goto LABEL_18;
    }
  }
  else if (v27 != 10 && v27 != 25)
  {
LABEL_18:
    FigDebugAssert3();
    v34 = 0;
    int v36 = -1;
    goto LABEL_19;
  }
  int v29 = objc_msgSend_buildWithGuideAndConfidence_target_confidence_grid_tex_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_(self, v28, (uint64_t)v16, (uint64_t)v17, v18, self->_grid_tex, v19, v20, v38, v21);
  if (v29)
  {
    int v36 = v29;
    FigDebugAssert3();
LABEL_24:
    v34 = 0;
    goto LABEL_19;
  }
  if (v18)
  {
    objc_msgSend_solverBistochastize_(self, v30, 10, v31);
    objc_msgSend_solverPcg_(self, v32, 20, v33);
    v34 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      int v35 = objc_msgSend_upsample_grid_tex_conf_tex_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(self, v22, (uint64_t)v16, (uint64_t)v34, self->_confidence_solved_tex, v19, v20, v21, v38, v25);
      goto LABEL_15;
    }
LABEL_17:
    int v36 = 0;
    goto LABEL_19;
  }
  objc_msgSend_blurAndNormalize_grid_tmp_tex_(self, v30, (uint64_t)self->_grid_tex, (uint64_t)self->_tmp_grid_tex);
  v34 = self->_grid_tex;
  if (!v25) {
    goto LABEL_17;
  }
  int v35 = objc_msgSend_upsample_grid_tex_conf_tex_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(self, v22, (uint64_t)v16, (uint64_t)v34, 0, v19, v20, v21, v38, v25);
LABEL_15:
  int v36 = v35;
  if (v35) {
    FigDebugAssert3();
  }
LABEL_19:
  if (self->_useMetalAllocator) {
    objc_msgSend_releaseTextures(self, v22, v23, v24);
  }

  return v36;
}

- (int)jointfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 output:(__CVBuffer *)a5
{
  return MEMORY[0x270F9A6D0](self, sel_solverfilter_target_confidence_output_, a3, a4);
}

- (int)solverBistochastize:(int)a3
{
  int v4 = a3;
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  id v8 = objc_msgSend_commandQueue(self->_metal, a2, *(uint64_t *)&a3, v3);
  uint64_t v12 = objc_msgSend_commandBuffer(v8, v9, v10, v11);

  if (v12
    && (objc_msgSend_computeCommandEncoder(v12, v13, v14, v15),
        (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v19 = v16;
    unint64_t v20 = (unint64_t)(grid_width + 7) >> 3;
    unint64_t v21 = (unint64_t)(grid_height + 7) >> 3;
    objc_msgSend_setComputePipelineState_(v16, v17, (uint64_t)self->_shaders->_bgBistochastizeInit, v18);
    objc_msgSend_setTexture_atIndex_(v19, v22, (uint64_t)self->_grid_tex, 0);
    objc_msgSend_setTexture_atIndex_(v19, v23, (uint64_t)self->_bistochast_m_tex, 1);
    objc_msgSend_setTexture_atIndex_(v19, v24, (uint64_t)self->_bistochast_n_tex, 2);
    objc_msgSend_setBuffer_offset_atIndex_(v19, v25, (uint64_t)self->_uniforms, 0, 0);
    unint64_t v82 = v20;
    unint64_t v83 = v21;
    uint64_t v84 = 1;
    int64x2_t v80 = vdupq_n_s64(8uLL);
    uint64_t v81 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v19, v26, (uint64_t)&v82, (uint64_t)&v80);
    objc_msgSend_endEncoding(v19, v27, v28, v29);
    if (v4 < 1)
    {
      uint64_t v52 = 0;
LABEL_10:
      unint64_t v61 = objc_msgSend_computeCommandEncoder(v12, v30, v31, v32);

      if (v61)
      {
        objc_msgSend_setComputePipelineState_(v61, v62, (uint64_t)self->_shaders->_bgBistochastizeFinal, v63);
        objc_msgSend_setTexture_atIndex_(v61, v64, (uint64_t)self->_grid_tex, 0);
        objc_msgSend_setTexture_atIndex_(v61, v65, (uint64_t)self->_bistochast_n_tex, 1);
        objc_msgSend_setTexture_atIndex_(v61, v66, (uint64_t)self->_A_tex, 2);
        objc_msgSend_setBuffer_offset_atIndex_(v61, v67, (uint64_t)self->_uniforms, 0, 0);
        unint64_t v82 = v20;
        unint64_t v83 = v21;
        uint64_t v84 = 1;
        int64x2_t v80 = vdupq_n_s64(8uLL);
        uint64_t v81 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v61, v68, (uint64_t)&v82, (uint64_t)&v80);
        objc_msgSend_endEncoding(v61, v69, v70, v71);
        objc_msgSend_commit(v12, v72, v73, v74);

        int v75 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v75 = FigSignalErrorAt();
      }
    }
    else
    {
      uint64_t v33 = 0;
      int64x2_t v77 = vdupq_n_s64(8uLL);
      while (1)
      {
        v34 = v19;
        int v35 = self->_A_tex;
        id v19 = objc_msgSend_computeCommandEncoder(v12, v36, v37, v38);

        if (!v19)
        {
          FigDebugAssert3();
          int v75 = FigSignalErrorAt();

          goto LABEL_15;
        }
        objc_msgSend_setComputePipelineState_(v19, v39, (uint64_t)self->_shaders->_bgBistochastizeIter, v40);
        objc_msgSend_setTexture_atIndex_(v19, v41, (uint64_t)self->_bistochast_m_tex, 0);
        objc_msgSend_setTexture_atIndex_(v19, v42, (uint64_t)self->_bistochast_n_tex, 1);
        objc_msgSend_setTexture_atIndex_(v19, v43, (uint64_t)v35, 2);
        objc_msgSend_setBuffer_offset_atIndex_(v19, v44, (uint64_t)self->_uniforms, 0, 0);
        unint64_t v82 = v20;
        unint64_t v83 = v21;
        uint64_t v84 = 1;
        int64x2_t v80 = v77;
        uint64_t v81 = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v19, v45, (uint64_t)&v82, (uint64_t)&v80);
        objc_msgSend_endEncoding(v19, v46, v47, v48);
        uint64_t v52 = objc_msgSend_blitCommandEncoder(v12, v49, v50, v51);

        if (!v52) {
          break;
        }
        unint64_t v82 = 0;
        unint64_t v83 = 0;
        uint64_t v84 = 0;
        uint64_t grid_depth = self->_grid_depth;
        uint64_t v55 = *(void *)&self->_grid_width;
        *(void *)&long long v56 = (int)v55;
        *((void *)&v56 + 1) = SHIDWORD(v55);
        long long v78 = v56;
        uint64_t v79 = grid_depth;
        bistochast_n_tex = self->_bistochast_n_tex;
        int64x2_t v80 = 0uLL;
        uint64_t v81 = 0;
        objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v52, v53, (uint64_t)v35, 0, 0, &v82, &v78, bistochast_n_tex, 0, 0, &v80);
        objc_msgSend_endEncoding(v52, v58, v59, v60);

        uint64_t v33 = v52;
        if (!--v4) {
          goto LABEL_10;
        }
      }
      FigDebugAssert3();
      int v75 = FigSignalErrorAt();
LABEL_15:
    }
  }
  else
  {
    FigDebugAssert3();
    int v75 = FigSignalErrorAt();
  }

  return v75;
}

- (id)solverPcg:(int)a3
{
  uint64_t v238 = *MEMORY[0x263EF8340];
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  id v227 = 0;
  id v228 = 0;
  memset(v222, 0, sizeof(v222));
  v229[0] = self->_grid_tex;
  v229[1] = self->_bistochast_n_tex;
  v229[2] = self->_bistochast_m_tex;
  v229[3] = self->_A_tex;
  v230 = self->_x0_tex;
  v231 = self->_residual0_tex;
  v232 = self->_d0_tex;
  v233 = self->_x1_tex;
  v234 = self->_residual1_tex;
  v235 = self->_d1_tex;
  v236 = self->_q_tex;
  v237 = self->_confidence_solved_tex;
  v223 = self->_uniforms;
  id v224 = self->_l0_buf;
  obuint64_t j = self->_l1_buf;
  id v226 = self->_alpha_buf;
  objc_storeStrong(&v227, self->_residual_buf);
  objc_storeStrong(&v228, self->_hasconverged_buf);
  double v9 = objc_msgSend_commandQueue(self->_metal, v6, v7, v8);
  uint64_t v13 = objc_msgSend_commandBuffer(v9, v10, v11, v12);

  if (!v13)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v28 = 0;
    goto LABEL_37;
  }
  id v17 = objc_msgSend_commandQueue(self->_metal, v14, v15, v16);
  unint64_t v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

  if (!v21)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v28 = 0;
    goto LABEL_38;
  }
  id v25 = objc_msgSend_computeCommandEncoder(v21, v22, v23, v24);
  uint64_t v28 = v25;
  if (!v25)
  {
LABEL_35:
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_38:
    v211 = 0;
    goto LABEL_23;
  }
  unint64_t v29 = (unint64_t)(grid_width + 7) >> 3;
  objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_shaders->_bgSolverInit1, v27);
  objc_msgSend_setTextures_withRange_(v28, v30, (uint64_t)v229, 0, 12);
  objc_msgSend_setBuffers_offsets_withRange_(v28, v31, (uint64_t)&v223, (uint64_t)v222, 0, 6);
  unint64_t v219 = v29;
  unint64_t v220 = (unint64_t)(grid_height + 7) >> 3;
  uint64_t v221 = 1;
  int64x2_t v217 = vdupq_n_s64(8uLL);
  uint64_t v218 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v32, (uint64_t)&v219, (uint64_t)&v217);
  objc_msgSend_endEncoding(v28, v33, v34, v35);
  objc_msgSend_commit(v21, v36, v37, v38);
  v42 = objc_msgSend_commandQueue(self->_metal, v39, v40, v41);
  uint64_t v46 = objc_msgSend_commandBuffer(v42, v43, v44, v45);

  if (!v46)
  {
LABEL_36:
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_37:
    unint64_t v21 = 0;
    goto LABEL_38;
  }
  uint64_t v50 = objc_msgSend_computeCommandEncoder(v46, v47, v48, v49);

  if (!v50)
  {
LABEL_39:
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v28 = 0;
    v211 = 0;
    goto LABEL_22;
  }
  objc_msgSend_setComputePipelineState_(v50, v51, (uint64_t)self->_shaders->_bgSolverInit2, v52);
  objc_msgSend_setTextures_withRange_(v50, v53, (uint64_t)v229, 0, 12);
  objc_msgSend_setBuffers_offsets_withRange_(v50, v54, (uint64_t)&v223, (uint64_t)v222, 0, 6);
  unint64_t v219 = v29;
  unint64_t v220 = (unint64_t)(grid_height + 7) >> 3;
  uint64_t v221 = 1;
  int64x2_t v217 = vdupq_n_s64(8uLL);
  uint64_t v218 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v50, v55, (uint64_t)&v219, (uint64_t)&v217);
  objc_msgSend_endEncoding(v50, v56, v57, v58);
  objc_msgSend_commit(v46, v59, v60, v61);
  if (a3 < 1)
  {
LABEL_21:
    v211 = v230;
    uint64_t v28 = v50;
LABEL_22:
    unint64_t v21 = v46;
    goto LABEL_23;
  }
  uint64_t v65 = 0;
  int64x2_t v215 = vdupq_n_s64(8uLL);
  while (1)
  {
    uint64_t v66 = objc_msgSend_commandQueue(self->_metal, v62, v63, v64);
    unint64_t v21 = objc_msgSend_commandBuffer(v66, v67, v68, v69);

    if (!v21)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      v211 = 0;
      uint64_t v28 = v50;
      goto LABEL_23;
    }
    uint64_t v28 = objc_msgSend_computeCommandEncoder(v21, v70, v71, v72);

    if (!v28) {
      goto LABEL_35;
    }
    objc_msgSend_setComputePipelineState_(v28, v73, (uint64_t)self->_shaders->_bgSolverPcgIter0, v74);
    objc_msgSend_setTextures_withRange_(v28, v75, (uint64_t)v229, 0, 12);
    objc_msgSend_setBuffers_offsets_withRange_(v28, v76, (uint64_t)&v223, (uint64_t)v222, 0, 6);
    unint64_t v219 = v29;
    unint64_t v220 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v221 = 1;
    int64x2_t v217 = v215;
    uint64_t v218 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v77, (uint64_t)&v219, (uint64_t)&v217);
    objc_msgSend_endEncoding(v28, v78, v79, v80);
    objc_msgSend_commit(v21, v81, v82, v83);
    int v87 = objc_msgSend_commandQueue(self->_metal, v84, v85, v86);
    id v91 = objc_msgSend_commandBuffer(v87, v88, v89, v90);

    if (!v91) {
      goto LABEL_36;
    }
    v95 = objc_msgSend_computeCommandEncoder(v91, v92, v93, v94);

    if (!v95)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      uint64_t v28 = 0;
      v211 = 0;
      unint64_t v21 = v91;
      goto LABEL_23;
    }
    objc_msgSend_setComputePipelineState_(v95, v96, (uint64_t)self->_shaders->_bgSolverPcgIter1, v97);
    objc_msgSend_setTextures_withRange_(v95, v98, (uint64_t)v229, 0, 12);
    objc_msgSend_setBuffers_offsets_withRange_(v95, v99, (uint64_t)&v223, (uint64_t)v222, 0, 6);
    unint64_t v219 = v29;
    unint64_t v220 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v221 = 1;
    int64x2_t v217 = vdupq_n_s64(8uLL);
    uint64_t v218 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v95, v100, (uint64_t)&v219, (uint64_t)&v217);
    objc_msgSend_endEncoding(v95, v101, v102, v103);
    objc_msgSend_commit(v91, v104, v105, v106);
    v110 = objc_msgSend_commandQueue(self->_metal, v107, v108, v109);
    unint64_t v21 = objc_msgSend_commandBuffer(v110, v111, v112, v113);

    if (!v21) {
      break;
    }
    uint64_t v28 = objc_msgSend_computeCommandEncoder(v21, v114, v115, v116);

    if (!v28) {
      goto LABEL_35;
    }
    objc_msgSend_setComputePipelineState_(v28, v117, (uint64_t)self->_shaders->_bgSolverPcgIter2, v118);
    objc_msgSend_setTextures_withRange_(v28, v119, (uint64_t)v229, 0, 12);
    objc_msgSend_setBuffers_offsets_withRange_(v28, v120, (uint64_t)&v223, (uint64_t)v222, 0, 6);
    unint64_t v219 = v29;
    unint64_t v220 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v221 = 1;
    int64x2_t v217 = vdupq_n_s64(8uLL);
    uint64_t v218 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v28, v121, (uint64_t)&v219, (uint64_t)&v217);
    objc_msgSend_endEncoding(v28, v122, v123, v124);
    objc_msgSend_commit(v21, v125, v126, v127);
    v131 = objc_msgSend_commandQueue(self->_metal, v128, v129, v130);
    uint64_t v46 = objc_msgSend_commandBuffer(v131, v132, v133, v134);

    if (!v46) {
      goto LABEL_36;
    }
    uint64_t v50 = objc_msgSend_computeCommandEncoder(v46, v135, v136, v137);

    if (!v50) {
      goto LABEL_39;
    }
    objc_msgSend_setComputePipelineState_(v50, v138, (uint64_t)self->_shaders->_bgSolverPcgIter3, v139);
    objc_msgSend_setTextures_withRange_(v50, v140, (uint64_t)v229, 0, 12);
    objc_msgSend_setBuffers_offsets_withRange_(v50, v141, (uint64_t)&v223, (uint64_t)v222, 0, 6);
    unint64_t v219 = v29;
    unint64_t v220 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v221 = 1;
    int64x2_t v217 = vdupq_n_s64(8uLL);
    uint64_t v218 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v50, v142, (uint64_t)&v219, (uint64_t)&v217);
    objc_msgSend_endEncoding(v50, v143, v144, v145);
    objc_msgSend_commit(v46, v146, v147, v148);
    objc_msgSend_waitForIdle(self->_metal, v149, v150, v151);
    sub_262F64920(v231, (uint64_t)"res0");
    sub_262F64920(v234, (uint64_t)"res1");
    id v152 = v224;
    int v156 = *(_DWORD *)objc_msgSend_contents(v152, v153, v154, v155);
    id v157 = v226;
    float v161 = 0.0001;
    if ((float)((float)*(int *)objc_msgSend_contents(v157, v158, v159, v160) * 0.00024414) > 0.0001)
    {
      id v162 = v226;
      float v161 = (float)*(int *)objc_msgSend_contents(v162, v163, v164, v165) * 0.00024414;
    }
    id v166 = obj;
    int v170 = *(_DWORD *)objc_msgSend_contents(v166, v167, v168, v169);
    id v171 = v224;
    v175 = (int *)objc_msgSend_contents(v171, v172, v173, v174);
    float v176 = 0.0001;
    if ((float)((float)*v175 * 0.00024414) > 0.0001)
    {
      id v177 = v224;
      float v176 = (float)*(int *)objc_msgSend_contents(v177, v178, v179, v180) * 0.00024414;
    }
    float v181 = (float)((float)v156 * 0.00024414) / v161;
    float v182 = (float)((float)v170 * 0.00024414) / v176;
    id v183 = v224;
    double v187 = (float)((float)*(int *)objc_msgSend_contents(v183, v184, v185, v186) * 0.00024414);
    id v188 = obj;
    double v192 = (float)((float)*(int *)objc_msgSend_contents(v188, v189, v190, v191) * 0.00024414);
    v193 = self->_residual_buf;
    double v197 = (float)((float)*(int *)objc_msgSend_contents(v193, v194, v195, v196) * 0.00024414);
    v198 = self->_hasconverged_buf;
    v202 = (unsigned int *)objc_msgSend_contents(v198, v199, v200, v201);
    NSLog(&cfstr_DebugDL0FL1FRe.isa, v65, *(void *)&v187, *(void *)&v192, *(void *)&v197, v181, v182, *v202);
    v203 = v230;
    objc_storeStrong((id *)&v230, v233);
    v204 = v233;
    v233 = v203;

    v205 = v232;
    objc_storeStrong((id *)&v232, v235);
    v206 = v235;
    v235 = v205;

    v207 = v231;
    objc_storeStrong((id *)&v231, v234);
    v208 = v234;
    v234 = v207;

    id v209 = v224;
    objc_storeStrong(&v224, obj);
    id v210 = obj;
    obuint64_t j = v209;

    uint64_t v65 = (v65 + 1);
    if (a3 == v65) {
      goto LABEL_21;
    }
  }
  FigDebugAssert3();
  FigSignalErrorAt();
  v211 = 0;
  uint64_t v28 = v95;
LABEL_23:
  for (uint64_t i = 40; i != -8; i -= 8)

  for (uint64_t j = 11; j != -1; --j)

  return v211;
}

- (int)solverfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 confidence:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  if (!self->_useMetalAllocator || (int Textures = objc_msgSend_allocateTextures(self, a2, (uint64_t)a3, (uint64_t)a4)) == 0)
  {
    unint64_t input_width = self->_input_width;
    unint64_t input_height = self->_input_height;
    if (CVPixelBufferGetWidth(a3) == input_width && CVPixelBufferGetHeight(a3) == input_height)
    {
      unint64_t v18 = self->_input_width;
      unint64_t v17 = self->_input_height;
      if (CVPixelBufferGetWidth(a4) == v18 && CVPixelBufferGetHeight(a4) == v17)
      {
        if (CVPixelBufferGetPixelFormatType(a3) != 875704422)
        {
          FigDebugAssert3();
          int v46 = -1;
          goto LABEL_44;
        }
        uint64_t v20 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v19, (uint64_t)a3, 10, 23, 0);
        if (v20)
        {
          unint64_t v21 = (void *)v20;
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
          uint64_t v24 = 10;
          if (PixelFormatType == 1751411059) {
            uint64_t v24 = 25;
          }
          if (PixelFormatType == 1751410032) {
            uint64_t v25 = 25;
          }
          else {
            uint64_t v25 = v24;
          }
          if (PixelFormatType == 1278226536) {
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v23, (uint64_t)a4, 25, 23, 0);
          }
          else {
          uint64_t v26 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v23, (uint64_t)a4, v25, 23, 0);
          }
          if (!v26)
          {
            FigDebugAssert3();
            int v46 = FigSignalErrorAt();
            goto LABEL_43;
          }
          uint64_t v28 = (void *)v26;
          if (a5)
          {
            unint64_t v30 = self->_input_width;
            unint64_t v29 = self->_input_height;
            if (CVPixelBufferGetWidth(a5) != v30
              || CVPixelBufferGetHeight(a5) != v29
              || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v31, (uint64_t)a5, 25, 23, 0), (a5 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              FigDebugAssert3();
              int v46 = FigSignalErrorAt();
              goto LABEL_42;
            }
          }
          if (a6)
          {
            unint64_t v33 = self->_input_width;
            unint64_t v32 = self->_input_height;
            if (CVPixelBufferGetWidth(a6) != v33 || CVPixelBufferGetHeight(a6) != v32) {
              goto LABEL_55;
            }
            OSType v34 = CVPixelBufferGetPixelFormatType(a6);
            uint64_t v36 = 25;
            if (v34 != 1278226536 && v34 != 1751410032 && v34 != 1751411059) {
              uint64_t v36 = 10;
            }
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v35, (uint64_t)a6, v36, 22, 0);
            a6 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
            if (!a6)
            {
LABEL_55:
              FigDebugAssert3();
              int v46 = FigSignalErrorAt();
              goto LABEL_41;
            }
          }
          int v37 = objc_msgSend_buildWithGuideAndConfidence_target_confidence_grid_tex_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_(self, v27, (uint64_t)v21, (uint64_t)v28, a5, self->_grid_tex, 0, 0, 0.0, 0);
          if (v37)
          {
            int v46 = v37;
            FigDebugAssert3();
            goto LABEL_40;
          }
          if (a5)
          {
            objc_msgSend_solverBistochastize_(self, v38, 10, v39);
            objc_msgSend_solverPcg_(self, v40, 20, v41);
            uint64_t v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
            if (a6)
            {
              int v44 = objc_msgSend_upsample_grid_tex_conf_tex_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(self, v42, (uint64_t)v21, (uint64_t)v43, self->_confidence_solved_tex, 0, 0, 0, 0.0, a6);
              goto LABEL_36;
            }
          }
          else
          {
            objc_msgSend_blurAndNormalize_grid_tmp_tex_(self, v38, (uint64_t)self->_grid_tex, (uint64_t)self->_tmp_grid_tex);
            uint64_t v43 = self->_grid_tex;
            if (a6)
            {
              int v44 = objc_msgSend_upsample_grid_tex_conf_tex_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output_(self, v45, (uint64_t)v21, (uint64_t)v43, 0, 0, 0, 0, 0.0, a6);
LABEL_36:
              int v46 = v44;
              if (v44) {
                FigDebugAssert3();
              }
              goto LABEL_39;
            }
          }
          int v46 = 0;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
LABEL_43:

          goto LABEL_44;
        }
      }
    }
    FigDebugAssert3();
    int Textures = FigSignalErrorAt();
  }
  int v46 = Textures;
LABEL_44:
  if (self->_useMetalAllocator) {
    objc_msgSend_releaseTextures(self, v12, v13, v14);
  }
  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasconverged_buf, 0);
  objc_storeStrong((id *)&self->_residual_buf, 0);
  objc_storeStrong((id *)&self->_alpha_buf, 0);
  objc_storeStrong((id *)&self->_l1_buf, 0);
  objc_storeStrong((id *)&self->_l0_buf, 0);
  objc_storeStrong((id *)&self->_q_tex, 0);
  objc_storeStrong((id *)&self->_d1_tex, 0);
  objc_storeStrong((id *)&self->_d0_tex, 0);
  objc_storeStrong((id *)&self->_confidence_solved_tex, 0);
  objc_storeStrong((id *)&self->_residual1_tex, 0);
  objc_storeStrong((id *)&self->_residual0_tex, 0);
  objc_storeStrong((id *)&self->_x1_tex, 0);
  objc_storeStrong((id *)&self->_x0_tex, 0);
  objc_storeStrong((id *)&self->_A_tex, 0);
  objc_storeStrong((id *)&self->_bistochast_n_tex, 0);
  objc_storeStrong((id *)&self->_bistochast_m_tex, 0);
  objc_storeStrong((id *)&self->_max_grid_confidence, 0);
  objc_storeStrong((id *)&self->_tmp_grid_tex, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_uniforms, 0);

  objc_storeStrong((id *)&self->_grid_tex, 0);
}

@end