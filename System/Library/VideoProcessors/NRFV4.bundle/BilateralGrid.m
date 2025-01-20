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
  v38.receiver = self;
  v38.super_class = (Class)BilateralGrid;
  v8 = [(BilateralGrid *)&v38 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metal, a3);
    v9->_normalizeGridConfidence = a4;
    v9->_useMetalAllocator = 0;
    v10 = [(FigMetalContext *)v9->_metal device];
    uint64_t v11 = [v10 newBufferWithLength:36 options:0];
    uniforms = v9->_uniforms;
    v9->_uniforms = (MTLBuffer *)v11;

    if (v9->_uniforms)
    {
      v13 = [(FigMetalContext *)v9->_metal device];
      uint64_t v14 = [v13 newBufferWithLength:4 options:0];
      max_grid_confidence = v9->_max_grid_confidence;
      v9->_max_grid_confidence = (MTLBuffer *)v14;

      if (v9->_max_grid_confidence)
      {
        v16 = +[BilateralGridShared sharedInstance];
        uint64_t v17 = [v16 getShaders:v9->_metal normalizeGridConfidence:v9->_normalizeGridConfidence];
        shaders = v9->_shaders;
        v9->_shaders = (BilateralGridShaders *)v17;

        if (v9->_shaders)
        {
          v19 = [(FigMetalContext *)v9->_metal device];
          uint64_t v20 = [v19 newBufferWithLength:4 options:0];
          l0_buf = v9->_l0_buf;
          v9->_l0_buf = (MTLBuffer *)v20;

          if (v9->_l0_buf)
          {
            v22 = [(FigMetalContext *)v9->_metal device];
            uint64_t v23 = [v22 newBufferWithLength:4 options:0];
            l1_buf = v9->_l1_buf;
            v9->_l1_buf = (MTLBuffer *)v23;

            if (v9->_l1_buf)
            {
              v25 = [(FigMetalContext *)v9->_metal device];
              uint64_t v26 = [v25 newBufferWithLength:4 options:0];
              alpha_buf = v9->_alpha_buf;
              v9->_alpha_buf = (MTLBuffer *)v26;

              if (v9->_alpha_buf)
              {
                v28 = [(FigMetalContext *)v9->_metal device];
                uint64_t v29 = [v28 newBufferWithLength:4 options:0];
                residual_buf = v9->_residual_buf;
                v9->_residual_buf = (MTLBuffer *)v29;

                if (v9->_residual_buf)
                {
                  v31 = [(FigMetalContext *)v9->_metal device];
                  uint64_t v32 = [v31 newBufferWithLength:4 options:0];
                  hasconverged_buf = v9->_hasconverged_buf;
                  v9->_hasconverged_buf = (MTLBuffer *)v32;

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
  int v37 = FigSignalErrorAt();
  v34 = 0;
  if (!v37) {
LABEL_10:
  }
    v34 = v9;
  v35 = v34;

  return v35;
}

- (BilateralGrid)initWithContext:(id)a3
{
  return [(BilateralGrid *)self initWithContext:a3 normalizeGridConfidence:1];
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[BilateralGridShaders alloc] initWithMetal:v3 normalizeGridConfidence:0];
  if (v4
    && (v5 = v4,
        v6 = [[BilateralGridShaders alloc] initWithMetal:v3 normalizeGridConfidence:1], v5, v6))
  {
    int v7 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v7 = FigSignalErrorAt();
    v6 = 0;
  }

  return v7;
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
        (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(vdupq_n_s32(a5), (int32x4_t)xmmword_2634805F0), (int8x16_t)vceqq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7.var2, 0), (float32x4_t)xmmword_263480600)))) & 1) != 0))
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
    uint64_t v21 = [(MTLBuffer *)self->_uniforms contents];
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
  v6 = [(FigMetalContext *)self->_metal allocator];
  float v7 = (void *)[v6 newTextureDescriptor];

  if (!v7) {
    goto LABEL_7;
  }
  v8 = [v7 desc];
  [v8 setCompressionMode:2];

  v9 = [v7 desc];
  [v9 setCompressionFootprint:0];

  uint64_t grid_width = self->_grid_width;
  int32x2_t v11 = [v7 desc];
  [v11 setWidth:grid_width];

  uint64_t grid_height = self->_grid_height;
  v13 = [v7 desc];
  [v13 setHeight:grid_height];

  uint64_t grid_depth = self->_grid_depth;
  v15 = [v7 desc];
  [v15 setDepth:grid_depth];

  v16 = [v7 desc];
  [v16 setUsage:3];

  uint64_t v17 = [v7 desc];
  [v17 setTextureType:7];

  v18 = [v7 desc];
  [v18 setPixelFormat:a3];

  [v7 setLabel:0];
  metal = self->_metal;
  if (self->_useMetalAllocator)
  {
    float v20 = [(FigMetalContext *)metal allocator];
    uint64_t v21 = (void *)[v20 newTextureWithDescriptor:v7];

    if (!v21) {
      goto LABEL_7;
    }
  }
  else
  {
    v22 = [(FigMetalContext *)metal device];
    uint64_t v23 = [v7 desc];
    uint64_t v21 = (void *)[v22 newTextureWithDescriptor:v23];

    if (!v21)
    {
LABEL_7:
      FigDebugAssert3();
      FigSignalErrorAt();
      uint64_t v21 = 0;
    }
  }

  return v21;
}

- (int)allocateTextures
{
  id v3 = [(BilateralGrid *)self allocGridTexture:115 label:@"grid_tex"];
  grid_tex = self->_grid_tex;
  self->_grid_tex = v3;

  if (self->_grid_tex)
  {
    v5 = [(BilateralGrid *)self allocGridTexture:115 label:@"tmp_grid_tex"];
    tmp_grid_tex = self->_tmp_grid_tex;
    self->_tmp_grid_tex = v5;

    if (self->_tmp_grid_tex)
    {
      float v7 = [(BilateralGrid *)self allocGridTexture:25 label:@"confidence_solved_tex"];
      confidence_solved_tex = self->_confidence_solved_tex;
      self->_confidence_solved_tex = v7;

      if (self->_confidence_solved_tex)
      {
        v9 = [(BilateralGrid *)self allocGridTexture:55 label:@"bistochast_m_tex"];
        bistochast_m_tex = self->_bistochast_m_tex;
        self->_bistochast_m_tex = v9;

        if (self->_bistochast_m_tex)
        {
          int32x2_t v11 = [(BilateralGrid *)self allocGridTexture:55 label:@"bistochast_n_tex"];
          bistochast_n_tex = self->_bistochast_n_tex;
          self->_bistochast_n_tex = v11;

          if (self->_bistochast_n_tex)
          {
            v13 = [(BilateralGrid *)self allocGridTexture:55 label:@"A_tex"];
            A_tex = self->_A_tex;
            self->_A_tex = v13;

            if (self->_A_tex)
            {
              v15 = [(BilateralGrid *)self allocGridTexture:25 label:@"x0_tex"];
              x0_tex = self->_x0_tex;
              self->_x0_tex = v15;

              if (self->_x0_tex)
              {
                uint64_t v17 = [(BilateralGrid *)self allocGridTexture:25 label:@"x1_tex"];
                x1_tex = self->_x1_tex;
                self->_x1_tex = v17;

                if (self->_x1_tex)
                {
                  v19 = [(BilateralGrid *)self allocGridTexture:55 label:@"residual0_tex"];
                  residual0_tex = self->_residual0_tex;
                  self->_residual0_tex = v19;

                  if (self->_residual0_tex)
                  {
                    uint64_t v21 = [(BilateralGrid *)self allocGridTexture:55 label:@"residual1_tex"];
                    residual1_tex = self->_residual1_tex;
                    self->_residual1_tex = v21;

                    if (self->_residual1_tex)
                    {
                      uint64_t v23 = [(BilateralGrid *)self allocGridTexture:55 label:@"d0_tex"];
                      d0_tex = self->_d0_tex;
                      self->_d0_tex = v23;

                      if (self->_d0_tex)
                      {
                        v25 = [(BilateralGrid *)self allocGridTexture:55 label:@"d1_tex"];
                        d1_tex = self->_d1_tex;
                        self->_d1_tex = v25;

                        if (self->_d1_tex)
                        {
                          v27 = [(BilateralGrid *)self allocGridTexture:55 label:@"q_tex"];
                          q_tex = self->_q_tex;
                          self->_q_tex = v27;

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
  [(BilateralGrid *)self releaseTextures];
  v3.receiver = self;
  v3.super_class = (Class)BilateralGrid;
  [(BilateralGrid *)&v3 dealloc];
}

- (int)setupWithConfig:(BilateralGridConfiguration *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  v9 = [(FigMetalContext *)self->_metal allocator];

  if (v9)
  {
    v10 = [(FigMetalContext *)self->_metal allocator];
    self->_useMetalAllocator = [v10 allocatorType] == 2;

    *(float *)&double v11 = a3->var1;
    *(float *)&double v12 = a3->var2.var0;
    *(float *)&double v13 = a3->var2.var1;
    *(float *)&double v14 = a3->var2.var2;
    *(float *)&double v15 = a3->var2.var3;
    int v16 = -[BilateralGrid config:height:space_sigma:range_sigma:solver:](self, "config:height:space_sigma:range_sigma:solver:", a4, a5, a3->var0, v11, v12, v13, v14, v15);
    if (v16)
    {
      int v17 = v16;
      FigDebugAssert3();
    }
    else
    {
      if (!self->_useMetalAllocator) {
        [(BilateralGrid *)self allocateTextures];
      }
      return 0;
    }
    return v17;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)buildWithGuideAndConfidence:(id)a3 target:(id)a4 confidence:(id)a5 grid_tex:(id)a6 ltc_tex:(id)a7 gtcRatio_tex:(id)a8 gtcFinal_tex:(id)a9 ltmROI:
{
  long long v32 = v9;
  id v34 = a3;
  id v33 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  long long v38 = v32;
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  uint64_t v23 = [(FigMetalContext *)self->_metal commandQueue];
  float v24 = [v23 commandBuffer];

  if (v24)
  {
    v25 = [v24 computeCommandEncoder];
    uint64_t v26 = v25;
    if (v25)
    {
      unint64_t v27 = (unint64_t)(grid_width + 7) >> 3;
      unint64_t v28 = (unint64_t)(grid_height + 7) >> 3;
      uint64_t v29 = 8;
      if (v18) {
        uint64_t v29 = 16;
      }
      [v25 setComputePipelineState:*(Class *)((char *)&self->_shaders->super.isa + v29)];
      [v26 setTexture:v34 atIndex:0];
      [v26 setTexture:v33 atIndex:1];
      [v26 setTexture:v16 atIndex:2];
      [v26 setTexture:v17 atIndex:3];
      if (v18 && v19 && v20)
      {
        [v26 setTexture:v18 atIndex:4];
        [v26 setTexture:v19 atIndex:5];
        [v26 setTexture:v20 atIndex:6];
        [v26 setBytes:&v38 length:16 atIndex:1];
      }
      [v26 setBuffer:self->_uniforms offset:0 atIndex:0];
      v37[0] = v27;
      v37[1] = v28;
      v37[2] = 1;
      int64x2_t v35 = vdupq_n_s64(8uLL);
      uint64_t v36 = 1;
      [v26 dispatchThreadgroups:v37 threadsPerThreadgroup:&v35];
      [v26 endEncoding];
      [v24 commit];
      int v30 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v30 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
  }

  return v30;
}

- (int)blurAndNormalize:(id)a3 grid_tmp_tex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  double v12 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v13 = [v12 commandBuffer];

  long long v32 = (void *)v13;
  if (v13)
  {
    id v28 = v9;
    uint64_t v14 = 0;
    id v15 = 0;
    unint64_t v31 = (unint64_t)(grid_width + 7) >> 3;
    int64x2_t v30 = vdupq_n_s64(8uLL);
    id v29 = v8;
    id v16 = v8;
    while (2)
    {
      char v17 = 1;
      do
      {
        id v18 = v16;
        id v19 = v9;
        char v20 = v17;
        uint64_t v21 = [v32 computeCommandEncoder];
        if (!v21)
        {
          FigDebugAssert3();
          int v26 = FigSignalErrorAt();
          goto LABEL_16;
        }
        v22 = v21;
        [v21 setComputePipelineState:self->_shaders->_bgBlur[v14]];
        [v22 setTexture:v16 atIndex:0];
        [v22 setTexture:v9 atIndex:1];
        [v22 setBuffer:self->_uniforms offset:0 atIndex:0];
        if (v14 == 2 && self->_normalizeGridConfidence) {
          [v22 setBuffer:self->_max_grid_confidence offset:0 atIndex:1];
        }
        unint64_t v35 = v31;
        unint64_t v36 = (unint64_t)(grid_height + 7) >> 3;
        uint64_t v37 = 1;
        int64x2_t v33 = v30;
        uint64_t v34 = 1;
        [v22 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v33];
        [v22 endEncoding];
        id v23 = v16;

        id v16 = v19;
        id v15 = v23;

        char v17 = 0;
        id v9 = v15;
      }
      while ((v20 & 1) != 0);
      ++v14;
      id v9 = v15;
      if (v14 != 3) {
        continue;
      }
      break;
    }
    float v24 = [v32 computeCommandEncoder];
    v25 = v24;
    if (v24)
    {
      [v24 setComputePipelineState:self->_shaders->_bgNormalize];
      [v25 setTexture:v16 atIndex:0];
      [v25 setTexture:v15 atIndex:1];
      [v25 setBuffer:self->_uniforms offset:0 atIndex:0];
      if (self->_normalizeGridConfidence) {
        [v25 setBuffer:self->_max_grid_confidence offset:0 atIndex:1];
      }
      unint64_t v35 = v31;
      unint64_t v36 = (unint64_t)(grid_height + 7) >> 3;
      uint64_t v37 = 1;
      int64x2_t v33 = vdupq_n_s64(8uLL);
      uint64_t v34 = 1;
      [v25 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v33];
      [v25 endEncoding];
      [v32 commit];
      objc_storeStrong((id *)&self->_grid_tex, v18);
      objc_storeStrong((id *)&self->_tmp_grid_tex, v19);
      int v26 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v26 = FigSignalErrorAt();
    }

    id v19 = v15;
LABEL_16:
    id v9 = v28;
    id v8 = v29;
  }
  else
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    id v15 = 0;
    id v16 = v8;
    id v19 = v9;
  }

  return v26;
}

- (int)upsample:(id)a3 grid_tex:(id)a4 conf_tex:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:
{
  long long v41 = v9;
  id v42 = a3;
  id v44 = a4;
  id v43 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = v18;
  long long v45 = v41;
  if (v16) {
    BOOL v20 = v17 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = !v20;
  BOOL v22 = v18 != 0;
  id v23 = a9;
  uint64_t v24 = [v23 pixelFormat];
  int v25 = v21 & v22;
  uint64_t v26 = 64;
  if (v25) {
    uint64_t v26 = 72;
  }
  if (v24 != 25) {
    uint64_t v26 = 56;
  }
  id v27 = *(id *)((char *)&self->_shaders->super.isa + v26);
  id v28 = [MEMORY[0x263F129A0] renderPassDescriptor];
  id v29 = [v28 colorAttachments];
  int64x2_t v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setTexture:v23];

  unint64_t v31 = [v28 colorAttachments];
  long long v32 = [v31 objectAtIndexedSubscript:0];
  [v32 setLoadAction:0];

  int64x2_t v33 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v34 = [v33 commandBuffer];

  if (v34
    && ([v34 renderCommandEncoderWithDescriptor:v28], (uint64_t v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v36 = (void *)v35;
    uint64_t v37 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
    [v36 setVertexBuffer:v37 offset:0 atIndex:0];

    long long v38 = v42;
    [v36 setFragmentTexture:v42 atIndex:0];
    [v36 setFragmentTexture:v44 atIndex:1];
    [v36 setFragmentTexture:v43 atIndex:2];
    if (v25)
    {
      [v36 setFragmentTexture:v16 atIndex:3];
      [v36 setFragmentTexture:v17 atIndex:4];
      [v36 setFragmentTexture:v19 atIndex:5];
      [v36 setFragmentBytes:&v45 length:16 atIndex:1];
    }
    [v36 setFragmentBuffer:self->_uniforms offset:0 atIndex:0];
    [v36 setRenderPipelineState:v27];
    [v36 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v36 endEncoding];
    [v34 commit];

    int v39 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    long long v38 = v42;
  }

  return v39;
}

- (int)filter:(id)a3 output:(id)a4
{
  return [(BilateralGrid *)self solverfilterWithGuide:a3 target:a3 confidence:0 ltc_tex:0 gtcRatio_tex:0 gtcFinal_tex:0 ltmROI:0.0 output:a4];
}

- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 output:(id)a6
{
  int v6 = [(BilateralGrid *)self solverfilterWithGuide:a3 target:a4 confidence:a5 ltc_tex:0 gtcRatio_tex:0 gtcFinal_tex:0 ltmROI:0.0 output:a6];
  if (v6) {
    FigDebugAssert3();
  }
  return v6;
}

- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:
{
  double v30 = v9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (self->_useMetalAllocator)
  {
    int v23 = [(BilateralGrid *)self allocateTextures];
    if (v23)
    {
      int v28 = v23;
      goto LABEL_24;
    }
  }
  uint64_t v24 = [v16 pixelFormat];
  if (v24 > 575)
  {
    if (v24 != 576 && v24 != 588) {
      goto LABEL_18;
    }
  }
  else if (v24 != 10 && v24 != 25)
  {
LABEL_18:
    FigDebugAssert3();
    uint64_t v26 = 0;
    int v28 = -73435;
    goto LABEL_19;
  }
  int v25 = [(BilateralGrid *)self buildWithGuideAndConfidence:v16 target:v17 confidence:v18 grid_tex:self->_grid_tex ltc_tex:v19 gtcRatio_tex:v20 gtcFinal_tex:v30 ltmROI:v21];
  if (v25)
  {
    int v28 = v25;
    FigDebugAssert3();
LABEL_24:
    uint64_t v26 = 0;
    goto LABEL_19;
  }
  if (v18)
  {
    [(BilateralGrid *)self solverBistochastize:10];
    uint64_t v26 = [(BilateralGrid *)self solverPcg:20];
    if (v22)
    {
      confidence_solved_tex = self->_confidence_solved_tex;
      goto LABEL_15;
    }
LABEL_17:
    int v28 = 0;
    goto LABEL_19;
  }
  [(BilateralGrid *)self blurAndNormalize:self->_grid_tex grid_tmp_tex:self->_tmp_grid_tex];
  uint64_t v26 = self->_grid_tex;
  if (!v22) {
    goto LABEL_17;
  }
  confidence_solved_tex = 0;
LABEL_15:
  int v28 = [(BilateralGrid *)self upsample:v16 grid_tex:v26 conf_tex:confidence_solved_tex ltc_tex:v19 gtcRatio_tex:v20 gtcFinal_tex:v21 ltmROI:v30 output:v22];
  if (v28) {
    FigDebugAssert3();
  }
LABEL_19:
  if (self->_useMetalAllocator) {
    [(BilateralGrid *)self releaseTextures];
  }

  return v28;
}

- (int)jointfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 output:(__CVBuffer *)a5
{
  return [(BilateralGrid *)self solverfilter:a3 target:a4 confidence:0 output:a5];
}

- (int)solverBistochastize:(int)a3
{
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  id v7 = [(FigMetalContext *)self->_metal commandQueue];
  id v8 = [v7 commandBuffer];

  if (v8 && ([v8 computeCommandEncoder], (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    unint64_t v11 = (unint64_t)(grid_width + 7) >> 3;
    unint64_t v12 = (unint64_t)(grid_height + 7) >> 3;
    [v9 setComputePipelineState:self->_shaders->_bgBistochastizeInit];
    [v10 setTexture:self->_grid_tex atIndex:0];
    [v10 setTexture:self->_bistochast_m_tex atIndex:1];
    [v10 setTexture:self->_bistochast_n_tex atIndex:2];
    [v10 setBuffer:self->_uniforms offset:0 atIndex:0];
    unint64_t v29 = v11;
    unint64_t v30 = v12;
    uint64_t v31 = 1;
    int64x2_t v27 = vdupq_n_s64(8uLL);
    uint64_t v28 = 1;
    [v10 dispatchThreadgroups:&v29 threadsPerThreadgroup:&v27];
    [v10 endEncoding];
    if (a3 < 1)
    {
      id v16 = 0;
LABEL_10:
      id v21 = [v8 computeCommandEncoder];

      if (v21)
      {
        [v21 setComputePipelineState:self->_shaders->_bgBistochastizeFinal];
        [v21 setTexture:self->_grid_tex atIndex:0];
        [v21 setTexture:self->_bistochast_n_tex atIndex:1];
        [v21 setTexture:self->_A_tex atIndex:2];
        [v21 setBuffer:self->_uniforms offset:0 atIndex:0];
        unint64_t v29 = v11;
        unint64_t v30 = v12;
        uint64_t v31 = 1;
        int64x2_t v27 = vdupq_n_s64(8uLL);
        uint64_t v28 = 1;
        [v21 dispatchThreadgroups:&v29 threadsPerThreadgroup:&v27];
        [v21 endEncoding];
        [v8 commit];

        int v22 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v22 = FigSignalErrorAt();
      }
    }
    else
    {
      uint64_t v13 = 0;
      int64x2_t v24 = vdupq_n_s64(8uLL);
      while (1)
      {
        uint64_t v14 = v10;
        id v15 = self->_A_tex;
        v10 = [v8 computeCommandEncoder];

        if (!v10)
        {
          FigDebugAssert3();
          int v22 = FigSignalErrorAt();

          goto LABEL_15;
        }
        [v10 setComputePipelineState:self->_shaders->_bgBistochastizeIter];
        [v10 setTexture:self->_bistochast_m_tex atIndex:0];
        [v10 setTexture:self->_bistochast_n_tex atIndex:1];
        [v10 setTexture:v15 atIndex:2];
        [v10 setBuffer:self->_uniforms offset:0 atIndex:0];
        unint64_t v29 = v11;
        unint64_t v30 = v12;
        uint64_t v31 = 1;
        int64x2_t v27 = v24;
        uint64_t v28 = 1;
        [v10 dispatchThreadgroups:&v29 threadsPerThreadgroup:&v27];
        [v10 endEncoding];
        id v16 = [v8 blitCommandEncoder];

        if (!v16) {
          break;
        }
        unint64_t v29 = 0;
        unint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t grid_depth = self->_grid_depth;
        uint64_t v18 = *(void *)&self->_grid_width;
        *(void *)&long long v19 = (int)v18;
        *((void *)&v19 + 1) = SHIDWORD(v18);
        long long v25 = v19;
        uint64_t v26 = grid_depth;
        bistochast_n_tex = self->_bistochast_n_tex;
        int64x2_t v27 = 0uLL;
        uint64_t v28 = 0;
        [v16 copyFromTexture:v15 sourceSlice:0 sourceLevel:0 sourceOrigin:&v29 sourceSize:&v25 toTexture:bistochast_n_tex destinationSlice:0 destinationLevel:0 destinationOrigin:&v27];
        [v16 endEncoding];

        uint64_t v13 = v16;
        if (!--a3) {
          goto LABEL_10;
        }
      }
      FigDebugAssert3();
      int v22 = FigSignalErrorAt();
LABEL_15:
    }
  }
  else
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
  }

  return v22;
}

- (id)solverPcg:(int)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t grid_width = self->_grid_width;
  uint64_t grid_height = self->_grid_height;
  id v54 = 0;
  id v55 = 0;
  memset(v49, 0, sizeof(v49));
  v56[0] = self->_grid_tex;
  v56[1] = self->_bistochast_n_tex;
  v56[2] = self->_bistochast_m_tex;
  v56[3] = self->_A_tex;
  v57 = self->_x0_tex;
  v58 = self->_residual0_tex;
  v59 = self->_d0_tex;
  v60 = self->_x1_tex;
  v61 = self->_residual1_tex;
  v62 = self->_d1_tex;
  v63 = self->_q_tex;
  v64 = self->_confidence_solved_tex;
  v50 = self->_uniforms;
  id v51 = self->_l0_buf;
  obuint64_t j = self->_l1_buf;
  id v53 = self->_alpha_buf;
  objc_storeStrong(&v54, self->_residual_buf);
  objc_storeStrong(&v55, self->_hasconverged_buf);
  int v6 = [(FigMetalContext *)self->_metal commandQueue];
  id v7 = [v6 commandBuffer];

  if (!v7)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    unint64_t v11 = 0;
    goto LABEL_37;
  }
  id v8 = [(FigMetalContext *)self->_metal commandQueue];
  double v9 = [v8 commandBuffer];

  if (!v9)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    unint64_t v11 = 0;
    goto LABEL_38;
  }
  v10 = [v9 computeCommandEncoder];
  unint64_t v11 = v10;
  if (!v10)
  {
LABEL_35:
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_38:
    long long v38 = 0;
    goto LABEL_23;
  }
  unint64_t v12 = (unint64_t)(grid_width + 7) >> 3;
  [v10 setComputePipelineState:self->_shaders->_bgSolverInit1];
  objc_msgSend(v11, "setTextures:withRange:", v56, 0, 12);
  objc_msgSend(v11, "setBuffers:offsets:withRange:", &v50, v49, 0, 6);
  unint64_t v46 = v12;
  unint64_t v47 = (unint64_t)(grid_height + 7) >> 3;
  uint64_t v48 = 1;
  int64x2_t v44 = vdupq_n_s64(8uLL);
  uint64_t v45 = 1;
  [v11 dispatchThreadgroups:&v46 threadsPerThreadgroup:&v44];
  [v11 endEncoding];
  [v9 commit];
  uint64_t v13 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v14 = [v13 commandBuffer];

  if (!v14)
  {
LABEL_36:
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_37:
    double v9 = 0;
    goto LABEL_38;
  }
  id v15 = [v14 computeCommandEncoder];

  if (!v15)
  {
LABEL_39:
    FigDebugAssert3();
    FigSignalErrorAt();
    unint64_t v11 = 0;
    long long v38 = 0;
    goto LABEL_22;
  }
  [v15 setComputePipelineState:self->_shaders->_bgSolverInit2];
  objc_msgSend(v15, "setTextures:withRange:", v56, 0, 12);
  objc_msgSend(v15, "setBuffers:offsets:withRange:", &v50, v49, 0, 6);
  unint64_t v46 = v12;
  unint64_t v47 = (unint64_t)(grid_height + 7) >> 3;
  uint64_t v48 = 1;
  int64x2_t v44 = vdupq_n_s64(8uLL);
  uint64_t v45 = 1;
  [v15 dispatchThreadgroups:&v46 threadsPerThreadgroup:&v44];
  [v15 endEncoding];
  [v14 commit];
  if (a3 < 1)
  {
LABEL_21:
    long long v38 = v57;
    unint64_t v11 = v15;
LABEL_22:
    double v9 = v14;
    goto LABEL_23;
  }
  uint64_t v16 = 0;
  int64x2_t v42 = vdupq_n_s64(8uLL);
  while (1)
  {
    id v17 = [(FigMetalContext *)self->_metal commandQueue];
    double v9 = [v17 commandBuffer];

    if (!v9)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      long long v38 = 0;
      unint64_t v11 = v15;
      goto LABEL_23;
    }
    unint64_t v11 = [v9 computeCommandEncoder];

    if (!v11) {
      goto LABEL_35;
    }
    [v11 setComputePipelineState:self->_shaders->_bgSolverPcgIter0];
    objc_msgSend(v11, "setTextures:withRange:", v56, 0, 12);
    objc_msgSend(v11, "setBuffers:offsets:withRange:", &v50, v49, 0, 6);
    unint64_t v46 = v12;
    unint64_t v47 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v48 = 1;
    int64x2_t v44 = v42;
    uint64_t v45 = 1;
    [v11 dispatchThreadgroups:&v46 threadsPerThreadgroup:&v44];
    [v11 endEncoding];
    [v9 commit];
    uint64_t v18 = [(FigMetalContext *)self->_metal commandQueue];
    long long v19 = [v18 commandBuffer];

    if (!v19) {
      goto LABEL_36;
    }
    id v20 = [v19 computeCommandEncoder];

    if (!v20)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      unint64_t v11 = 0;
      long long v38 = 0;
      double v9 = v19;
      goto LABEL_23;
    }
    [v20 setComputePipelineState:self->_shaders->_bgSolverPcgIter1];
    objc_msgSend(v20, "setTextures:withRange:", v56, 0, 12);
    objc_msgSend(v20, "setBuffers:offsets:withRange:", &v50, v49, 0, 6);
    unint64_t v46 = v12;
    unint64_t v47 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v48 = 1;
    int64x2_t v44 = vdupq_n_s64(8uLL);
    uint64_t v45 = 1;
    [v20 dispatchThreadgroups:&v46 threadsPerThreadgroup:&v44];
    [v20 endEncoding];
    [v19 commit];
    id v21 = [(FigMetalContext *)self->_metal commandQueue];
    double v9 = [v21 commandBuffer];

    if (!v9) {
      break;
    }
    unint64_t v11 = [v9 computeCommandEncoder];

    if (!v11) {
      goto LABEL_35;
    }
    [v11 setComputePipelineState:self->_shaders->_bgSolverPcgIter2];
    objc_msgSend(v11, "setTextures:withRange:", v56, 0, 12);
    objc_msgSend(v11, "setBuffers:offsets:withRange:", &v50, v49, 0, 6);
    unint64_t v46 = v12;
    unint64_t v47 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v48 = 1;
    int64x2_t v44 = vdupq_n_s64(8uLL);
    uint64_t v45 = 1;
    [v11 dispatchThreadgroups:&v46 threadsPerThreadgroup:&v44];
    [v11 endEncoding];
    [v9 commit];
    int v22 = [(FigMetalContext *)self->_metal commandQueue];
    uint64_t v14 = [v22 commandBuffer];

    if (!v14) {
      goto LABEL_36;
    }
    id v15 = [v14 computeCommandEncoder];

    if (!v15) {
      goto LABEL_39;
    }
    [v15 setComputePipelineState:self->_shaders->_bgSolverPcgIter3];
    objc_msgSend(v15, "setTextures:withRange:", v56, 0, 12);
    objc_msgSend(v15, "setBuffers:offsets:withRange:", &v50, v49, 0, 6);
    unint64_t v46 = v12;
    unint64_t v47 = (unint64_t)(grid_height + 7) >> 3;
    uint64_t v48 = 1;
    int64x2_t v44 = vdupq_n_s64(8uLL);
    uint64_t v45 = 1;
    [v15 dispatchThreadgroups:&v46 threadsPerThreadgroup:&v44];
    [v15 endEncoding];
    [v14 commit];
    [(FigMetalContext *)self->_metal waitForIdle];
    print_grid_stats(v58, (uint64_t)"res0");
    print_grid_stats(v61, (uint64_t)"res1");
    int v23 = *(_DWORD *)[v51 contents];
    float v24 = 0.0001;
    if ((float)((float)*(int *)[v53 contents] * 0.00024414) > 0.0001) {
      float v24 = (float)*(int *)[v53 contents] * 0.00024414;
    }
    int v25 = *(_DWORD *)[obj contents];
    uint64_t v26 = (int *)[v51 contents];
    float v27 = 0.0001;
    if ((float)((float)*v26 * 0.00024414) > 0.0001) {
      float v27 = (float)*(int *)[v51 contents] * 0.00024414;
    }
    float v28 = (float)((float)v25 * 0.00024414) / v27;
    double v29 = (float)((float)*(int *)[v51 contents] * 0.00024414);
    NSLog(&cfstr_DebugDL0FL1FRe.isa, v16, *(void *)&v29, (float)((float)*(int *)[obj contents] * 0.00024414), (float)((float)*(int *)-[MTLBuffer contents](objc_retainAutorelease(self->_residual_buf), "contents") * 0.00024414), (float)((float)((float)v23 * 0.00024414) / v24), v28, *(unsigned int *)-[MTLBuffer contents](objc_retainAutorelease(self->_hasconverged_buf), "contents"));
    unint64_t v30 = v57;
    objc_storeStrong((id *)&v57, v60);
    uint64_t v31 = v60;
    v60 = v30;

    long long v32 = v59;
    objc_storeStrong((id *)&v59, v62);
    int64x2_t v33 = v62;
    v62 = v32;

    uint64_t v34 = v58;
    objc_storeStrong((id *)&v58, v61);
    uint64_t v35 = v61;
    v61 = v34;

    id v36 = v51;
    objc_storeStrong(&v51, obj);
    id v37 = obj;
    obuint64_t j = v36;

    uint64_t v16 = (v16 + 1);
    if (a3 == v16) {
      goto LABEL_21;
    }
  }
  FigDebugAssert3();
  FigSignalErrorAt();
  long long v38 = 0;
  unint64_t v11 = v20;
LABEL_23:
  for (uint64_t i = 40; i != -8; i -= 8)

  for (uint64_t j = 11; j != -1; --j)

  return v38;
}

- (int)solverfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 confidence:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  if (!self->_useMetalAllocator || (int v11 = [(BilateralGrid *)self allocateTextures]) == 0)
  {
    unint64_t input_width = self->_input_width;
    unint64_t input_height = self->_input_height;
    if (CVPixelBufferGetWidth(a3) == input_width && CVPixelBufferGetHeight(a3) == input_height)
    {
      unint64_t v15 = self->_input_width;
      unint64_t v14 = self->_input_height;
      if (CVPixelBufferGetWidth(a4) == v15 && CVPixelBufferGetHeight(a4) == v14)
      {
        if (CVPixelBufferGetPixelFormatType(a3) != 875704422)
        {
          FigDebugAssert3();
          int v33 = -73435;
          goto LABEL_44;
        }
        uint64_t v16 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:10 usage:23 plane:0];
        if (v16)
        {
          id v17 = (void *)v16;
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
          uint64_t v19 = 10;
          if (PixelFormatType == 1751411059) {
            uint64_t v19 = 25;
          }
          if (PixelFormatType == 1751410032) {
            uint64_t v20 = 25;
          }
          else {
            uint64_t v20 = v19;
          }
          if (PixelFormatType == 1278226536) {
            uint64_t v21 = 25;
          }
          else {
            uint64_t v21 = v20;
          }
          uint64_t v22 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a4 pixelFormat:v21 usage:23 plane:0];
          if (!v22)
          {
            FigDebugAssert3();
            int v33 = FigSignalErrorAt();
            goto LABEL_43;
          }
          int v23 = (void *)v22;
          if (a5)
          {
            unint64_t v25 = self->_input_width;
            unint64_t v24 = self->_input_height;
            if (CVPixelBufferGetWidth(a5) != v25
              || CVPixelBufferGetHeight(a5) != v24
              || ([(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a5 pixelFormat:25 usage:23 plane:0], (a5 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              FigDebugAssert3();
              int v33 = FigSignalErrorAt();
              goto LABEL_42;
            }
          }
          if (a6)
          {
            unint64_t v27 = self->_input_width;
            unint64_t v26 = self->_input_height;
            if (CVPixelBufferGetWidth(a6) != v27 || CVPixelBufferGetHeight(a6) != v26) {
              goto LABEL_55;
            }
            OSType v28 = CVPixelBufferGetPixelFormatType(a6);
            uint64_t v29 = 25;
            if (v28 != 1278226536 && v28 != 1751410032 && v28 != 1751411059) {
              uint64_t v29 = 10;
            }
            a6 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a6 pixelFormat:v29 usage:22 plane:0];
            if (!a6)
            {
LABEL_55:
              FigDebugAssert3();
              int v33 = FigSignalErrorAt();
              goto LABEL_41;
            }
          }
          int v30 = [(BilateralGrid *)self buildWithGuideAndConfidence:v17 target:v23 confidence:a5 grid_tex:self->_grid_tex ltc_tex:0 gtcRatio_tex:0 gtcFinal_tex:0.0 ltmROI:0];
          if (v30)
          {
            int v33 = v30;
            FigDebugAssert3();
            goto LABEL_40;
          }
          if (a5)
          {
            [(BilateralGrid *)self solverBistochastize:10];
            uint64_t v31 = [(BilateralGrid *)self solverPcg:20];
            if (a6)
            {
              confidence_solved_tex = self->_confidence_solved_tex;
              goto LABEL_36;
            }
          }
          else
          {
            [(BilateralGrid *)self blurAndNormalize:self->_grid_tex grid_tmp_tex:self->_tmp_grid_tex];
            uint64_t v31 = self->_grid_tex;
            if (a6)
            {
              confidence_solved_tex = 0;
LABEL_36:
              int v33 = [(BilateralGrid *)self upsample:v17 grid_tex:v31 conf_tex:confidence_solved_tex ltc_tex:0 gtcRatio_tex:0 gtcFinal_tex:0 ltmROI:0.0 output:a6];
              if (v33) {
                FigDebugAssert3();
              }
              goto LABEL_39;
            }
          }
          int v33 = 0;
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
    int v11 = FigSignalErrorAt();
  }
  int v33 = v11;
LABEL_44:
  if (self->_useMetalAllocator) {
    [(BilateralGrid *)self releaseTextures];
  }
  return v33;
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