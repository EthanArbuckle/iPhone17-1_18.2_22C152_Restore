@interface NUNIAegirRenderer
- (NUNIAegirRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
- (NUNIAegirResourceManager)resourceManager;
- (NUNIRendererOptions)rendererOptions;
- (id)contentMaskLayer;
- (id)getOrCreateUniformBufferforFrameBufferIndex:(unint64_t)a3;
- (void)_renderLocationDot:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 viewport:(NUNIViewport)a5 renderEncoder:(id)a6;
- (void)_renderOffscreenBackgroundWithRenderEncoder:(id)a3 frameBufferIndex:(unint64_t)a4;
- (void)_renderOffscreenBloomWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6;
- (void)_renderOffscreenPostWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6;
- (void)_renderOffscreenSceneWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6 drawableTexture:(id)a7;
- (void)_renderRaytraceSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5;
- (void)_renderSpriteSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5;
- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3;
- (void)_updateStateWithScene:(id)a3 viewport:(NUNIViewport)a4;
- (void)dealloc;
- (void)purgeUnusedWithScene:(id)a3;
- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5;
- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6;
- (void)setContentMaskLayer:(id)a3;
- (void)setRendererOptions:(id)a3;
@end

@implementation NUNIAegirRenderer

- (NUNIAegirRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NUNIAegirRenderer;
  v9 = [(NUNIRenderer *)&v20 initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:a5];
  if (v9)
  {
    uint64_t v10 = +[NUNIAegirResourceManager sharedInstanceWithDisplayPixelFormat:a3];
    resourceManager = v9->_resourceManager;
    v9->_resourceManager = (NUNIAegirResourceManager *)v10;

    [(NUNIAegirResourceManager *)v9->_resourceManager addClient];
    uint64_t v12 = [MEMORY[0x263F32148] sharedDevice];
    device = v9->_device;
    v9->_device = (MTLDevice *)v12;

    uint64_t v14 = [(NUNIAegirResourceManager *)v9->_resourceManager textureGroupWithSuffix:v8];
    textureGroup = v9->_textureGroup;
    v9->_textureGroup = (NUNIAegirTextureGroup *)v14;

    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v17 = objc_opt_new();
      v18 = v9->_renderUniformsBuffers[i];
      v9->_renderUniformsBuffers[i] = (NSMutableArray *)v17;
    }
    v9->_supportsMTLGPUFamilyApple6 = [(MTLDevice *)v9->_device supportsFamily:1006];
  }

  return v9;
}

- (void)dealloc
{
  [(NUNIAegirResourceManager *)self->_resourceManager removeClient];
  v3.receiver = self;
  v3.super_class = (Class)NUNIAegirRenderer;
  [(NUNIRenderer *)&v3 dealloc];
}

- (void)setRendererOptions:(id)a3
{
  p_rendererOptions = &self->_rendererOptions;
  objc_storeStrong((id *)&self->_rendererOptions, a3);
  id v6 = a3;
  LODWORD(p_rendererOptions) = [(NUNIRendererOptions *)*p_rendererOptions changeSequence];

  self->_rendererOptionsChangeSequence = p_rendererOptions - 1;
}

- (void)purgeUnusedWithScene:(id)a3
{
  uint64_t v4 = [a3 snap];
  id v35 = [MEMORY[0x263F32160] sharedInstance];
  v5 = [MEMORY[0x263F32178] nullTexture2D];
  for (uint64_t i = 0; i != 24; ++i)
  {
    if (v4 != i)
    {
      v7 = [(NUNIAegirTextureGroup *)self->_textureGroup albedos];
      id v8 = [v7 objectAtIndexedSubscript:i];

      if (v8 != v5)
      {
        v9 = [v8 atlas];
        uint64_t v10 = [v9 uuid];
        [v35 purge:v10];
      }
      v11 = [(NUNIAegirTextureGroup *)self->_textureGroup normals];
      uint64_t v12 = [v11 objectAtIndexedSubscript:i];

      if (v12 != v5)
      {
        v13 = [v12 atlas];
        uint64_t v14 = [v13 uuid];
        [v35 purge:v14];
      }
      v15 = [(NUNIAegirTextureGroup *)self->_textureGroup emissives];
      v16 = [v15 objectAtIndexedSubscript:i];

      if (v16 != v5)
      {
        uint64_t v17 = [v16 atlas];
        v18 = [v17 uuid];
        [v35 purge:v18];
      }
      v19 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsLo];
      objc_super v20 = [v19 objectAtIndexedSubscript:i];

      if (v20 != v5)
      {
        v21 = [v20 atlas];
        v22 = [v21 uuid];
        [v35 purge:v22];
      }
      v23 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsMd];
      v24 = [v23 objectAtIndexedSubscript:i];

      if (v24 != v5)
      {
        v25 = [v24 atlas];
        v26 = [v25 uuid];
        [v35 purge:v26];
      }
      v27 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsHi];
      v28 = [v27 objectAtIndexedSubscript:i];

      if (v28 != v5)
      {
        v29 = [v28 atlas];
        v30 = [v29 uuid];
        [v35 purge:v30];
      }
      v31 = [(NUNIAegirTextureGroup *)self->_textureGroup gradients];
      v32 = [v31 objectAtIndexedSubscript:i];

      if (v32 != v5)
      {
        v33 = [v32 atlas];
        v34 = [v33 uuid];
        [v35 purge:v34];
      }
    }
  }
}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (void)setContentMaskLayer:(id)a3
{
}

- (void)_updateStateWithScene:(id)a3 viewport:(NUNIViewport)a4
{
  int width = a4.width;
  int height = a4.height;
  id v7 = a3;
  [v7 cameraPosition];
  float32x4_t v83 = v8;
  [v7 cameraTarget];
  float32x4_t v77 = v9;
  [v7 cameraRoll];
  float v11 = v10;
  [v7 cameraOffset];
  uint64_t v76 = v12;
  _Q0 = vsubq_f32(v77, v83);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v84 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  [v7 cameraUp];
  int32x4_t v81 = v20;

  int32x4_t v21 = (int32x4_t)v84;
  float32x4_t v22 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v21, (int8x16_t)v21, 0xCuLL), (int8x16_t)v21, 8uLL);
  _Q4 = v81;
  _Q3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q4, _Q4), (int8x16_t)_Q4, 0xCuLL);
  float32x4_t v24 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v21, v21), (int8x16_t)v21, 0xCuLL);
  _Q2 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 0xCuLL), (int8x16_t)_Q4, 8uLL), vnegq_f32(v24)), _Q3, v22);
  _Q3.i32[0] = _Q2.i32[2];
  __asm { FMLA            S4, S3, V2.S[2] }
  _Q3.f32[0] = sqrtf(*(float *)_Q4.i32);
  if (_Q3.f32[0] < 0.00001)
  {
    _Q2 = vmlaq_f32(vmulq_f32(v24, (float32x4_t)xmmword_21E8F22D0), (float32x4_t)xmmword_21E8F1C00, v22);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v24, (float32x4_t)xmmword_21E8F22E0), (float32x4_t)xmmword_21E8F22F0, v22);
      _Q3.i64[0] = _Q2.u32[2];
      __asm { FMLA            S4, S3, V2.S[2] }
      _Q3.f32[0] = sqrtf(_S4);
    }
  }
  int32x4_t v29 = (int32x4_t)vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32(v22, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v29, v29), (int8x16_t)v29, 0xCuLL))), v24, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v29, (int8x16_t)v29, 0xCuLL), (int8x16_t)v29, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v74 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
  int32x4_t v75 = v29;
  float v33 = (float)width / (float)height;
  if (v33 >= 1.0)
  {
    float v35 = 0.34907;
  }
  else
  {
    float v34 = atanf(0.17633 / v33);
    float v35 = v34 + v34;
  }
  *(__n64 *)v36.f32 = UMFloat4x4MakeLookAt(*(double *)v75.i64, v74.f32[0]);
  simd_float4 v80 = v37;
  simd_float4 v82 = v36;
  simd_float4 v78 = v39;
  simd_float4 v79 = v38;
  if (fabsf(v11) > 0.00001)
  {
    __float2 v40 = __sincosf_stret(v11 * 0.5);
    float32x2_t v41 = vmul_n_f32(*(float32x2_t *)v84.f32, v40.__sinval);
    *(__n64 *)v42.f32 = UMFloat4x4Make(v41.f32[0], v41.f32[1], vmuls_lane_f32(v40.__sinval, v84, 2), v40.__cosval);
    v89.columns[0] = v42;
    v89.columns[1] = v43;
    v89.columns[2] = v44;
    v89.columns[3] = v45;
    v85.columns[1] = v80;
    v85.columns[0] = v82;
    v85.columns[3] = v78;
    v85.columns[2] = v79;
    *(double *)v46.i64 = UMMul(v85, v89);
    simd_float4 v80 = v47;
    simd_float4 v82 = v46;
    simd_float4 v78 = v49;
    simd_float4 v79 = v48;
  }
  *(double *)v50.i64 = UMFloat4x4MakeTranslate();
  v90.columns[0] = v50;
  v90.columns[1] = v51;
  v90.columns[2] = v52;
  v90.columns[3] = v53;
  v86.columns[1] = v80;
  v86.columns[0] = v82;
  v86.columns[3] = v78;
  v86.columns[2] = v79;
  *(double *)v54.i64 = UMMul(v86, v90);
  simd_float4 v72 = v55;
  simd_float4 v73 = v54;
  simd_float4 v70 = v57;
  simd_float4 v71 = v56;
  v58.f32[0] = UMFloat4x4MakePerspective((float)(v35 * 180.0) / 3.1416, (float)width / (float)height, 0.001, 5.0);
  simd_float4 v68 = v59;
  simd_float4 v69 = v58;
  simd_float4 v66 = v61;
  simd_float4 v67 = v60;
  *(double *)v87.columns[0].i64 = UMFloat4x4MakeTranslate();
  v91.columns[1] = v68;
  v91.columns[0] = v69;
  v91.columns[3] = v66;
  v91.columns[2] = v67;
  *(double *)v88.columns[0].i64 = UMMul(v87, v91);
  v92.columns[1] = v72;
  v92.columns[0] = v73;
  v92.columns[3] = v70;
  v92.columns[2] = v71;
  *(double *)&long long v62 = UMMul(v88, v92);
  self->_state.viewport.int width = width;
  self->_state.viewport.int height = height;
  self->_state.cameraRoll = v11;
  self->_state.aspect = v33;
  self->_state.fovY = v35;
  *(_DWORD *)self->_anon_f4 = 0;
  *(void *)&self->_anon_f4[4] = v76;
  *(float32x4_t *)&self->_anon_f4[12] = v83;
  *(float32x4_t *)&self->_anon_f4[28] = v77;
  *(float32x4_t *)&self->_anon_f4[44] = v74;
  *(int32x4_t *)&self->_anon_f4[60] = v75;
  *(float32x4_t *)&self->_anon_f4[76] = v84;
  *(simd_float4 *)&self->_anon_f4[92] = v82;
  *(simd_float4 *)&self->_anon_f4[108] = v80;
  *(simd_float4 *)&self->_anon_f4[124] = v79;
  *(simd_float4 *)&self->_anon_f4[140] = v78;
  *(simd_float4 *)&self->_anon_f4[156] = v73;
  *(simd_float4 *)&self->_anon_f4[172] = v72;
  *(simd_float4 *)&self->_anon_f4[188] = v71;
  *(simd_float4 *)&self->_anon_f4[204] = v70;
  *(_OWORD *)&self->_anon_f4[220] = v62;
  *(_OWORD *)&self->_anon_f4[236] = v63;
  *(_OWORD *)&self->_anon_f4[252] = v64;
  *(_OWORD *)&self->_anon_f4[268] = v65;
}

- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3
{
  int width = a3.width;
  uint64_t v40 = *MEMORY[0x263EF8340];
  int height = a3.height;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * self->_frame, 2) <= 0x444444444444444uLL)
  {
    unsigned int v6 = [(NUNIRendererOptions *)self->_rendererOptions changeSequence];
    if (v6 != self->_rendererOptionsChangeSequence)
    {
      int v35 = height;
      uint64_t v7 = 0;
      self->_rendererOptionsChangeSequence = v6;
      do
      {
        float32x4_t v8 = _updateBaseUniformsForViewport__optionKeys_0[v7];
        float32x4_t v9 = [(NUNIRendererOptions *)self->_rendererOptions fractionValueForOption:v8];
        float v10 = v9;
        if (v9)
        {
          [v9 doubleValue];
          *(float *)&double v11 = v11;
          _H1 = *(_WORD *)&self->_anon_3c4[2 * v7];
          __asm { FCVT            S1, H1 }
          if (*(float *)&v11 != _S1)
          {
            v18 = NUNILoggingObjectForDomain(0);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v10;
              _os_log_debug_impl(&dword_21E8AA000, v18, OS_LOG_TYPE_DEBUG, "Overriding option %{public}@ with value %{public}@", buf, 0x16u);
            }

            [v10 doubleValue];
            __asm { FCVT            H0, D0 }
            *(_WORD *)&self->_anon_3c4[2 * v7] = _D0;
          }
        }

        ++v7;
      }
      while (v7 != 35);
      resourceManager = self->_resourceManager;
      long long v21 = *(_OWORD *)&self->_anon_3c4[48];
      long long v38 = *(_OWORD *)&self->_anon_3c4[32];
      *(_OWORD *)simd_float4 v39 = v21;
      *(void *)&v39[14] = *(void *)&self->_anon_3c4[62];
      long long v22 = *(_OWORD *)&self->_anon_3c4[16];
      *(_OWORD *)buf = *(_OWORD *)self->_anon_3c4;
      *(_OWORD *)&buf[16] = v22;
      [(NUNIAegirResourceManager *)resourceManager setPipelineConstants:buf];
      int height = v35;
    }
  }
  uint64_t v23 = *(void *)&self->_anon_f4[4];
  float aspect = self->_state.aspect;
  if (height <= width)
  {
    float v25 = (float)height;
    __asm { FMOV            V2.2S, #1.0 }
    *(float *)&_D2 = (float)width / (float)height;
  }
  else
  {
    float v25 = (float)width;
    __asm { FMOV            V2.2S, #1.0 }
    *((float *)&_D2 + 1) = (float)height / (float)width;
  }
  uint64_t v36 = _D2;
  float v27 = tanf(self->_state.fovY * 0.5);
  _H4 = *(_WORD *)&self->_anon_3c4[10];
  __asm { FCVT            S4, H4 }
  float v30 = (float)(_S4 * 5.0) + 1.0;
  LOWORD(_S4) = *(_WORD *)&self->_anon_3c4[12];
  __asm { FCVT            S4, H4 }
  float v32 = _S4 * -10.0;
  __int32 v33 = *(_DWORD *)&self->_anon_3c4[6];
  *(_OWORD *)&self->_baseUniforms.var5 = 0u;
  *(_OWORD *)&self->_baseUniforms.var9 = 0u;
  *(_OWORD *)&self->_baseUniforms.var13 = 0u;
  *(_OWORD *)&self->_baseUniforms.var17 = 0u;
  *(_OWORD *)&self->_baseUniforms.var21 = 0u;
  *(_OWORD *)self->_anon_260 = 0u;
  *(_OWORD *)&self->_anon_260[16] = 0u;
  *(_OWORD *)&self->_anon_260[32] = 0u;
  *(_OWORD *)&self->_anon_260[48] = 0u;
  *(_OWORD *)&self->_anon_260[64] = 0u;
  *(_OWORD *)&self->_anon_260[80] = 0u;
  *(_OWORD *)&self->_anon_260[96] = 0u;
  *(_OWORD *)&self->_anon_260[112] = 0u;
  *(_OWORD *)&self->_anon_260[128] = 0u;
  v34.i32[0] = v33;
  *(_OWORD *)&self->_anon_260[144] = 0u;
  *(_OWORD *)&self->_anon_260[160] = 0u;
  *(_OWORD *)&self->_anon_260[176] = 0u;
  *(_OWORD *)&self->_anon_260[192] = 0u;
  *(_OWORD *)&self->_anon_260[208] = 0u;
  *(_OWORD *)&self->_anon_260[224] = 0u;
  *(_OWORD *)&self->_anon_260[240] = 0u;
  *(void *)&self->_anon_260[256] = v23;
  *(void *)&self->_anon_260[264] = v36;
  *(float *)&self->_anon_260[272] = 1.0 / v25;
  *(float *)&self->_anon_260[276] = (float)(-1.0 / v27) / aspect;
  *(void *)&self->_anon_260[280] = 0x3E31D0D400000000;
  *(_DWORD *)&self->_anon_260[288] = 0;
  *(float *)&self->_anon_260[292] = v32;
  *(float *)&self->_anon_260[296] = (float)((float)(-1.0 / v30) * v32) - v32;
  *(void *)&self->_anon_260[300] = vcvtq_f32_f16(vmul_f16(v34, v34)).u64[0];
  *(float *)&self->_anon_260[308] = v30;
  *(_OWORD *)&self->_anon_260[312] = 0u;
  *(_OWORD *)&self->_anon_260[328] = 0u;
  *(void *)&self->_anon_260[344] = 0;
}

- (id)getOrCreateUniformBufferforFrameBufferIndex:(unint64_t)a3
{
  v5 = self->_renderUniformsBuffers[a3];
  unint64_t v6 = self->_renderUniformBuffersCounts[a3];
  self->_renderUniformBuffersCounts[a3] = v6 + 1;
  if ([(NSMutableArray *)v5 count] <= v6)
  {
    uint64_t v7 = (void *)[(MTLDevice *)self->_device newBufferWithLength:432 options:1];
    [(NSMutableArray *)v5 addObject:v7];
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)v5 objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (void)_renderOffscreenBackgroundWithRenderEncoder:(id)a3 frameBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  id v22 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:a4];
  uint64_t v7 = [v22 contents];
  memcpy((void *)v7, &self->_baseUniforms, 0x1B0uLL);
  *(simd_float4x4 *)(v7 + 144) = __invert_f4(*(simd_float4x4 *)&self->_anon_f4[156]);
  *(double *)v8.i64 = UMFloat4x4MakeTranslate();
  v24.columns[0] = v8;
  v24.columns[1] = v9;
  v24.columns[2] = v10;
  v24.columns[3] = v11;
  *(double *)&long long v12 = UMMul(*(simd_float4x4 *)&self->_anon_f4[220], v24);
  *(_OWORD *)(v7 + 272) = v12;
  *(_OWORD *)(v7 + 288) = v13;
  *(_OWORD *)(v7 + 304) = v14;
  *(_OWORD *)(v7 + 320) = v15;
  [v6 setVertexBuffer:v22 offset:0 atIndex:1];
  v16 = [(NUNIAegirResourceManager *)self->_resourceManager rectVerticesBuffer];
  [v6 setVertexBuffer:v16 offset:0 atIndex:0];

  uint64_t v17 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForStarfield];
  [v6 setLabel:@"Ægir Starfield"];
  [v6 setRenderPipelineState:v17];
  [v6 setFragmentBuffer:v22 offset:0 atIndex:0];
  v18 = [(NUNIAegirTextureGroup *)self->_textureGroup starfield];
  v19 = [v18 atlas];
  [v19 bind:v6 slot:1];

  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];
  int32x4_t v20 = [(NUNIAegirResourceManager *)self->_resourceManager starVerticesBuffer];
  [v6 setVertexBuffer:v20 offset:0 atIndex:0];

  long long v21 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForStar];
  [v6 setLabel:@"Ægir Star"];
  [v6 setRenderPipelineState:v21];
  [v6 setFragmentBuffer:v22 offset:0 atIndex:0];
  [v6 drawPrimitives:3 vertexStart:0 vertexCount:4212];
}

- (void)_renderRaytraceSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5
{
  id v103 = a3;
  id v8 = a5;
  uint64_t v9 = [v103 type];
  [v103 opacity];
  a4[4].var15 = v10;
  [v103 equatorRotation];
  float v12 = v11;
  [v103 radius];
  float v14 = v13;
  [v103 radiusScale];
  float v94 = v14 * v15;
  UMFloat4x4MakeScale(v14 * v15);
  simd_float4 v99 = v17;
  simd_float4 v101 = v16;
  simd_float4 v95 = v19;
  simd_float4 v97 = v18;
  if (v12 != 0.0)
  {
    *(double *)v20.i64 = UMFloat4x4MakeRotateZ(v12 + 1.5708);
    v110.columns[0] = v20;
    v110.columns[1] = v21;
    v110.columns[2] = v22;
    v110.columns[3] = v23;
    v105.columns[1] = v99;
    v105.columns[0] = v101;
    v105.columns[3] = v95;
    v105.columns[2] = v97;
    *(double *)v24.i64 = UMMul(v105, v110);
    simd_float4 v99 = v25;
    simd_float4 v101 = v24;
    simd_float4 v95 = v27;
    simd_float4 v97 = v26;
  }
  [v103 position];
  *(double *)v28.i64 = UMFloat4x4MakeTranslate();
  simd_float4 v89 = v29;
  simd_float4 v90 = v28;
  simd_float4 v87 = v31;
  simd_float4 v88 = v30;
  v111.columns[1] = v99;
  v111.columns[0] = v101;
  v111.columns[3] = v95;
  v111.columns[2] = v97;
  *(double *)v106.columns[0].i64 = UMMul(*(simd_float4x4 *)&self->_anon_f4[92], v111);
  simd_float4x4 v107 = __invert_f4(v106);
  float32x4_t v91 = (float32x4_t)v107.columns[0];
  float32x4_t v92 = (float32x4_t)v107.columns[1];
  float32x4_t v93 = (float32x4_t)v107.columns[2];
  v107.columns[1] = v89;
  v107.columns[0] = v90;
  v107.columns[3] = v87;
  v107.columns[2] = v88;
  v112.columns[1] = v99;
  v112.columns[0] = v101;
  v112.columns[3] = v95;
  v112.columns[2] = v97;
  *(double *)v32.i64 = UMMul(v107, v112);
  v113.columns[0] = v32;
  v113.columns[1] = v33;
  v113.columns[2] = v34;
  v113.columns[3] = v35;
  *(double *)v108.columns[0].i64 = UMMul(*(simd_float4x4 *)&self->_anon_f4[156], v113);
  float32x4_t v100 = (float32x4_t)v108.columns[1];
  float32x4_t v102 = (float32x4_t)v108.columns[0];
  float32x4_t v96 = (float32x4_t)v108.columns[3];
  float32x4_t v98 = (float32x4_t)v108.columns[2];
  simd_float4x4 v109 = __invert_f4(v108);
  float16x4_t v36 = vcvt_f16_f32(v91);
  _S5 = v91.i32[2];
  __asm { FCVT            H5, S5 }
  v36.i16[2] = _S5;
  _D5 = vcvt_f16_f32(v92);
  _S6 = v92.i32[2];
  __asm { FCVT            H6, S6 }
  _D5.i16[2] = _S6;
  *(float16x4_t *)&a4[1].var13 = v36;
  *(float16x4_t *)&a4[1].var15 = _D5;
  float16x4_t v44 = vcvt_f16_f32(v93);
  _D5.i32[0] = v93.i32[2];
  __asm { FCVT            H5, S5 }
  v44.i16[2] = _D5.i16[0];
  float16x4_t v45 = vcvt_f16_f32((float32x4_t)v109.columns[3]);
  _S6 = v109.columns[3].i32[2];
  __asm { FCVT            H6, S6 }
  v45.i16[2] = _S6;
  *(float16x4_t *)&a4[1].var17 = v44;
  *(float16x4_t *)&a4[1].var19 = v45;
  *(simd_float4x4 *)&a4[1].var21 = v109;
  *(float32x4_t *)&a4[2].var17 = v102;
  *(float32x4_t *)&a4[2].var21 = v100;
  *(float32x4_t *)&a4[3].var5 = v98;
  *(float32x4_t *)&a4[3].var9 = v96;
  [v103 light];
  v92.i32[0] = v47;
  __float2 v49 = __sincosf_stret(v48);
  __float2 v50 = __sincosf_stret(v92.f32[0]);
  v51.f32[0] = v50.__cosval * v49.__sinval;
  v51.f32[1] = v50.__sinval * v49.__sinval;
  v51.i64[1] = LODWORD(v49.__cosval);
  *(double *)&long long v52 = UMMul(*(float32x4_t *)&self->_anon_f4[156], *(float32x4_t *)&self->_anon_f4[172], *(float32x4_t *)&self->_anon_f4[188], *(float32x4_t *)&self->_anon_f4[204], v51);
  *(_OWORD *)&a4->var13 = v52;
  *(double *)&long long v53 = UMMul(v102, v100, v98, v96, (float32x4_t)xmmword_21E8F1CC0);
  *((float *)&v53 + 3) = v94 * v94;
  *(_OWORD *)&a4->var9 = v53;
  if (v9 == 3)
  {
    if (a4->var15 < 0.0 && self->_supportsMTLGPUFamilyApple6)
    {
      *(float32x2_t *)&a4[4].var23 = vmul_f32(vmul_n_f32((float32x2_t)0x42DA000046B73E00, v94), *(float32x2_t *)&a4[4].var20);
      uint64_t v54 = 2;
    }
    else
    {
      uint64_t v54 = 0;
    }
    _H0 = *(_WORD *)&self->_anon_3c4[46];
    __asm { FCVT            S8, H0 }
    objc_msgSend(v103, "cloudOpacity", *(_OWORD *)&v87, *(_OWORD *)&v88, *(_OWORD *)&v89, *(_OWORD *)&v90);
    float v60 = v59 * _S8;
    a4[5].var10 = v60;
    BOOL v61 = v60 <= 0.00001;
    BOOL v56 = v60 > 0.00001;
    uint64_t v55 = v54 | v56;
    float v62 = v94 * 0.98;
    if (!v61)
    {
      a4[5].var6 = v94 * v94;
      float32x2_t v63 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)xmmword_21E90F9F0, v94));
      *(float32x2_t *)&a4[5].var7 = vmul_f32(v63, v63);
      a4[5].var9 = v94 * 0.02;
    }
    float v64 = v62 * 1.125;
    a4[5].var5 = v62 * v62;
    float v65 = v62 * 0.95;
    a4[5].var11 = v64;
    a4[5].var12 = v65;
  }
  else
  {
    uint64_t v55 = 0;
    LODWORD(v56) = 0;
  }
  simd_float4 v66 = -[NUNIAegirResourceManager renderOffscreenPipelineForSpheroid:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:config:", v9, v55, *(_OWORD *)&v87, *(_OWORD *)&v88, *(_OWORD *)&v89, *(_OWORD *)&v90);
  if (v66)
  {
    [v8 setLabel:@"Ægir RaytraceSpheroid"];
    [v8 setRenderPipelineState:v66];
    simd_float4 v67 = [(NUNIAegirTextureGroup *)self->_textureGroup albedos];
    simd_float4 v68 = [v67 objectAtIndexedSubscript:v9];

    simd_float4 v69 = [v68 atlas];
    [v69 bind:v8 slot:1];

    simd_float4 v70 = [(NUNIAegirTextureGroup *)self->_textureGroup normals];
    simd_float4 v71 = [v70 objectAtIndexedSubscript:v9];

    simd_float4 v72 = [v71 atlas];
    [v72 bind:v8 slot:2];

    simd_float4 v73 = [(NUNIAegirTextureGroup *)self->_textureGroup emissives];
    float32x4_t v74 = [v73 objectAtIndexedSubscript:v9];

    int32x4_t v75 = [v74 atlas];
    [v75 bind:v8 slot:3];

    if (v56)
    {
      uint64_t v76 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsLo];
      float32x4_t v77 = [v76 objectAtIndexedSubscript:v9];

      simd_float4 v78 = [v77 atlas];
      [v78 bind:v8 slot:5];

      simd_float4 v79 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsMd];
      simd_float4 v80 = [v79 objectAtIndexedSubscript:v9];

      int32x4_t v81 = [v80 atlas];
      [v81 bind:v8 slot:6];

      simd_float4 v82 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsHi];
      float32x4_t v74 = [v82 objectAtIndexedSubscript:v9];

      float32x4_t v83 = [v74 atlas];
      [v83 bind:v8 slot:7];
    }
    float32x4_t v84 = [(NUNIAegirTextureGroup *)self->_textureGroup gradients];
    simd_float4x4 v85 = [v84 objectAtIndexedSubscript:v9];

    simd_float4x4 v86 = [v85 atlas];
    [v86 bind:v8 slot:4];

    [v8 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (void)_renderLocationDot:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 viewport:(NUNIViewport)a5 renderEncoder:(id)a6
{
  id v162 = a3;
  id v10 = a6;
  float v11 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForLocationDot];
  if (v11)
  {
    p_state = &self->_state;
    [v10 setLabel:@"Ægir LocationDot"];
    [v10 setRenderPipelineState:v11];
    UMFloat4x4MakeScale(0.11);
    simd_float4 v152 = v14;
    simd_float4 v157 = v13;
    simd_float4 v142 = v16;
    simd_float4 v147 = v15;
    *(double *)v164.columns[0].i64 = UMFloat4x4MakeTranslate();
    simd_float4 v126 = v164.columns[1];
    simd_float4 v127 = v164.columns[0];
    simd_float4 v124 = v164.columns[3];
    simd_float4 v125 = v164.columns[2];
    v176.columns[1] = v152;
    v176.columns[0] = v157;
    v176.columns[3] = v142;
    v176.columns[2] = v147;
    *(double *)v17.i64 = UMMul(v164, v176);
    simd_float4 v153 = v18;
    simd_float4 v158 = v17;
    simd_float4 v143 = v20;
    simd_float4 v148 = v19;
    [v162 homeCoordinate];
    double v22 = v21;
    *(float *)&double v23 = v23;
    *(double *)v24.i64 = UMFloat4x4MakeRotateX(*(float *)&v23 * -0.017453);
    simd_float4 v136 = v25;
    simd_float4 v137 = v24;
    simd_float4 v134 = v27;
    simd_float4 v135 = v26;
    v24.f32[0] = v22;
    *(double *)v28.i64 = UMFloat4x4MakeRotateZ(v24.f32[0] * 0.017453);
    simd_float4 v140 = v29;
    simd_float4 v141 = v28;
    simd_float4 v138 = v31;
    simd_float4 v139 = v30;
    v165.columns[1] = v136;
    v165.columns[0] = v137;
    v165.columns[3] = v134;
    v165.columns[2] = v135;
    v177.columns[1] = v153;
    v177.columns[0] = v158;
    v177.columns[3] = v143;
    v177.columns[2] = v148;
    *(double *)v32.i64 = UMMul(v165, v177);
    v178.columns[0] = v32;
    v178.columns[1] = v33;
    v178.columns[2] = v34;
    v178.columns[3] = v35;
    v166.columns[1] = v140;
    v166.columns[0] = v141;
    v166.columns[3] = v138;
    v166.columns[2] = v139;
    *(double *)v36.i64 = UMMul(v166, v178);
    simd_float4 v154 = v37;
    simd_float4 v159 = v36;
    simd_float4 v144 = v39;
    simd_float4 v149 = v38;
    [v162 equatorRotation];
    float v41 = v40;
    [v162 radius];
    float v43 = v42;
    [v162 radiusScale];
    UMFloat4x4MakeScale(v43 * v44);
    simd_float4 v122 = v167.columns[1];
    simd_float4 v123 = v167.columns[0];
    simd_float4 v120 = v167.columns[3];
    simd_float4 v121 = v167.columns[2];
    v179.columns[1] = v154;
    v179.columns[0] = v159;
    v179.columns[3] = v144;
    v179.columns[2] = v149;
    *(double *)v45.i64 = UMMul(v167, v179);
    float v46 = fabsf(v41);
    simd_float4 v155 = v47;
    simd_float4 v160 = v45;
    simd_float4 v145 = v49;
    simd_float4 v150 = v48;
    if (v46 <= 0.00001)
    {
      UMFloat4x4MakeScale(1.0);
      simd_float4 v116 = v55;
      simd_float4 v118 = v54;
      simd_float4 v112 = v57;
      simd_float4 v114 = v56;
    }
    else
    {
      *(double *)v168.columns[0].i64 = UMFloat4x4MakeRotateZ(v41 + 1.5708);
      simd_float4 v116 = v168.columns[1];
      simd_float4 v118 = v168.columns[0];
      simd_float4 v112 = v168.columns[3];
      simd_float4 v114 = v168.columns[2];
      v180.columns[1] = v155;
      v180.columns[0] = v160;
      v180.columns[3] = v145;
      v180.columns[2] = v150;
      *(double *)v50.i64 = UMMul(v168, v180);
      simd_float4 v155 = v51;
      simd_float4 v160 = v50;
      simd_float4 v145 = v53;
      simd_float4 v150 = v52;
    }
    objc_msgSend(v162, "position", *(_OWORD *)&v112, *(_OWORD *)&v114, *(_OWORD *)&v116, *(_OWORD *)&v118);
    *(double *)v169.columns[0].i64 = UMFloat4x4MakeTranslate();
    simd_float4 v130 = v169.columns[1];
    simd_float4 v131 = v169.columns[0];
    simd_float4 v128 = v169.columns[3];
    simd_float4 v129 = v169.columns[2];
    v181.columns[1] = v155;
    v181.columns[0] = v160;
    v181.columns[3] = v145;
    v181.columns[2] = v150;
    *(double *)v58.i64 = UMMul(v169, v181);
    v182.columns[0] = v58;
    v182.columns[1] = v59;
    v182.columns[2] = v60;
    v182.columns[3] = v61;
    *(double *)v62.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v182);
    float32x4_t v156 = v63;
    float32x4_t v161 = v62;
    float32x4_t v146 = v65;
    float32x4_t v151 = v64;
    *(double *)v66.i64 = UMMul(v62, v63, v64, v65, (float32x4_t)xmmword_21E8F2330);
    int32x4_t v133 = v66;
    *(double *)v67.i64 = UMMul(v161, v156, v151, v146, (float32x4_t)xmmword_21E8F2340);
    int32x4_t v132 = v67;
    *(double *)v68.i64 = UMMul(v161, v156, v151, v146, (float32x4_t)xmmword_21E8F1CC0);
    v69.f32[0] = (float)a5.width;
    v69.f32[1] = (float)a5.height;
    float32x2_t v70 = vmul_f32(v69, (float32x2_t)0x3F0000003F000000);
    float32x2_t v71 = vdiv_f32(vmul_f32(v70, *(float32x2_t *)v132.i8), (float32x2_t)vdup_laneq_s32(v132, 3));
    *(float32x2_t *)v68.i8 = vdiv_f32(vmul_f32(v70, *(float32x2_t *)v68.i8), (float32x2_t)vdup_laneq_s32(v68, 3));
    float32x2_t v72 = vsub_f32(vdiv_f32(vmul_f32(v70, *(float32x2_t *)v133.i8), (float32x2_t)vdup_laneq_s32(v133, 3)), *(float32x2_t *)v68.i8);
    int32x2_t v73 = (int32x2_t)vmul_f32(v72, v72);
    *(float32x2_t *)v68.i8 = vsub_f32(v71, *(float32x2_t *)v68.i8);
    *(float32x2_t *)v68.i8 = vmul_f32(*(float32x2_t *)v68.i8, *(float32x2_t *)v68.i8);
    float32x2_t v74 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v73, *(int32x2_t *)v68.i8), (float32x2_t)vzip2_s32(v73, *(int32x2_t *)v68.i8)));
    if (v74.f32[0] >= v74.f32[1]) {
      v74.f32[0] = v74.f32[1];
    }
    float v75 = v74.f32[0] * 0.23077;
    uint64_t v76 = [v162 scene];
    [v76 locationDotMaximumRadius];
    float v78 = v77;

    if (v75 <= v78)
    {
      float32x4_t v109 = v156;
      float32x4_t v108 = v161;
      float32x4_t v111 = v146;
      float32x4_t v110 = v151;
    }
    else
    {
      UMFloat4x4MakeScale((float)(v78 * 0.11) / v75);
      v183.columns[0] = v79;
      v183.columns[1] = v80;
      v183.columns[2] = v81;
      v183.columns[3] = v82;
      v170.columns[1] = v126;
      v170.columns[0] = v127;
      v170.columns[3] = v124;
      v170.columns[2] = v125;
      *(double *)v83.i64 = UMMul(v170, v183);
      v184.columns[0] = v83;
      v184.columns[1] = v84;
      v184.columns[2] = v85;
      v184.columns[3] = v86;
      v171.columns[1] = v136;
      v171.columns[0] = v137;
      v171.columns[3] = v134;
      v171.columns[2] = v135;
      *(double *)v87.i64 = UMMul(v171, v184);
      v185.columns[0] = v87;
      v185.columns[1] = v88;
      v185.columns[2] = v89;
      v185.columns[3] = v90;
      v172.columns[1] = v140;
      v172.columns[0] = v141;
      v172.columns[3] = v138;
      v172.columns[2] = v139;
      *(double *)v91.i64 = UMMul(v172, v185);
      v186.columns[0] = v91;
      v186.columns[1] = v92;
      v186.columns[2] = v93;
      v186.columns[3] = v94;
      v173.columns[1] = v122;
      v173.columns[0] = v123;
      v173.columns[3] = v120;
      v173.columns[2] = v121;
      *(double *)v95.i64 = UMMul(v173, v186);
      v99.columns[0] = v95;
      v99.columns[1] = v96;
      v99.columns[2] = v97;
      v99.columns[3] = v98;
      if (v46 > 0.00001)
      {
        v174.columns[1] = v117;
        v174.columns[0] = v119;
        v174.columns[3] = v113;
        v174.columns[2] = v115;
        *(double *)v100.i64 = UMMul(v174, v99);
        v99.columns[0] = v100;
        v99.columns[1] = v101;
        v99.columns[2] = v102;
        v99.columns[3] = v103;
      }
      v175.columns[1] = v130;
      v175.columns[0] = v131;
      v175.columns[3] = v128;
      v175.columns[2] = v129;
      *(double *)v104.i64 = UMMul(v175, v99);
      v187.columns[0] = v104;
      v187.columns[1] = v105;
      v187.columns[2] = v106;
      v187.columns[3] = v107;
      *(double *)v108.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v187);
    }
    *(float32x4_t *)&a4[3].var13 = v108;
    *(float32x4_t *)&a4[3].var17 = v109;
    *(float32x4_t *)&a4[3].var21 = v110;
    *(float32x4_t *)&a4[4].var5 = v111;
    [v10 setCullMode:1];
    [v10 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v10 setCullMode:0];
  }
}

- (void)_renderSpriteSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5
{
  id v50 = a3;
  id v8 = a5;
  uint64_t v9 = [v50 type];
  id v10 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForSpheroid:v9 config:0];
  if (v10)
  {
    p_state = &self->_state;
    [v8 setLabel:@"Ægir SpriteSpheroid"];
    [v8 setRenderPipelineState:v10];
    *(_OWORD *)&a4->var5 = s_sprites_1[[v50 spriteType]];
    [v50 opacity];
    a4[4].var15 = v12;
    [v50 position];
    _Q3 = vsubq_f32(*(float32x4_t *)&self->_anon_f4[12], v13);
    float32x4_t v15 = v13;
    _Q1 = vmulq_f32(_Q3, _Q3);
    _S2 = _Q3.i32[2];
    __asm { FMLA            S1, S2, V3.S[2] }
    _Q1.f32[0] = sqrtf(_Q1.f32[0]);
    int32x4_t v22 = (int32x4_t)vdivq_f32(_Q3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    float32x4_t v23 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v22, v22), (int8x16_t)v22, 0xCuLL);
    float32x4_t v24 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v22, (int8x16_t)v22, 0xCuLL), (int8x16_t)v22, 8uLL);
    int32x4_t v25 = (int32x4_t)vmlaq_f32(vmulq_f32(v24, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&p_state[3].viewport.height, *(int32x4_t *)&p_state[3].viewport.height), *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL))), v23, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&p_state[3].viewport.height, *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL), *(int8x16_t *)&p_state[3].viewport.height, 8uLL));
    float32x4_t v26 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v25, (int8x16_t)v25, 0xCuLL), (int8x16_t)v25, 8uLL), vnegq_f32(v23)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v25, v25), (int8x16_t)v25, 0xCuLL), v24);
    v25.i32[3] = 0;
    v26.i32[3] = 0;
    simd_float4 v48 = (simd_float4)v26;
    simd_float4 v49 = (simd_float4)v25;
    v22.i32[3] = 0;
    v15.i32[3] = 1.0;
    simd_float4 v46 = (simd_float4)v15;
    simd_float4 v47 = (simd_float4)v22;
    [v50 radius];
    float v28 = v27;
    [v50 radiusScale];
    float v30 = v28 * v29;
    if (v9 == 14) {
      float v30 = v30 + v30;
    }
    UMFloat4x4MakeScale(v30);
    v53.columns[0] = v31;
    v53.columns[1] = v32;
    v53.columns[2] = v33;
    v53.columns[3] = v34;
    v52.columns[1] = v48;
    v52.columns[0] = v49;
    v52.columns[3] = v46;
    v52.columns[2] = v47;
    *(double *)v35.i64 = UMMul(v52, v53);
    v54.columns[0] = v35;
    v54.columns[1] = v36;
    v54.columns[2] = v37;
    v54.columns[3] = v38;
    *(double *)&long long v39 = UMMul(*(simd_float4x4 *)&self->_anon_f4[220], v54);
    *(_OWORD *)&a4[3].var13 = v39;
    *(_OWORD *)&a4[3].var17 = v40;
    *(_OWORD *)&a4[3].var21 = v41;
    *(_OWORD *)&a4[4].var5 = v42;
    float v43 = [(NUNIAegirTextureGroup *)self->_textureGroup gradients];
    float v44 = [v43 objectAtIndexedSubscript:v9];

    simd_float4 v45 = [v44 atlas];
    [v45 bind:v8 slot:4];

    [v8 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (void)_renderOffscreenSceneWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6 drawableTexture:(id)a7
{
  v91[4] = *MEMORY[0x263EF8340];
  uint64_t height = a4.height;
  id v78 = a3;
  id v13 = a5;
  id v14 = a7;
  unint64_t v79 = a6;
  float32x4_t v15 = (id *)&self->_offscreenScenes[a6];
  simd_float4 v16 = (NUNAegirOffscreen *)*v15;
  simd_float4 v17 = v16;
  int32x2_t v73 = v14;
  float32x2_t v74 = v13;
  NUNIViewport v75 = a4;
  uint64_t v72 = height;
  if (!v16
    || [(NUNAegirOffscreen *)v16 width] != a4.width
    || [(NUNAegirOffscreen *)v17 height] != height)
  {
    uint64_t v76 = [MEMORY[0x263F32148] sharedNilTexture2D];
    simd_float4 v18 = objc_opt_new();
    [v18 setTextureType:2];
    [v18 setWidth:a4.width];
    [v18 setHeight:*(uint64_t *)&a4 >> 32];
    [v18 setDepth:1];
    [v18 setPixelFormat:10];
    [v18 setUsage:5];
    [v18 setResourceOptions:0];
    v90[0] = *MEMORY[0x263F0ECF8];
    simd_float4 v19 = [NSNumber numberWithInt:a4];
    v91[0] = v19;
    v90[1] = *MEMORY[0x263F0ECC0];
    simd_float4 v20 = [NSNumber numberWithInt:height];
    uint64_t v21 = *MEMORY[0x263F0ECC8];
    v91[1] = v20;
    v91[2] = &unk_26CFE78F8;
    uint64_t v22 = *MEMORY[0x263F0ECA0];
    v90[2] = v21;
    v90[3] = v22;
    v91[3] = &unk_26CFE7910;
    float32x4_t v23 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:4];

    float32x4_t v24 = (IOSurface *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v23];
    int32x4_t v25 = self->_contentMaskSurfaces[v79];
    self->_contentMaskSurfaces[v79] = v24;

    device = self->_device;
    float v27 = v24;
    float v28 = (MTLTexture *)[(MTLDevice *)device newTextureWithDescriptor:v18 iosurface:v27 plane:0];
    float v29 = self->_contentMaskTextures[v79];
    self->_contentMaskTextures[v79] = v28;

    float v30 = v28;
    simd_float4 v31 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNAegirOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, a4, v72, v76, v30, 2, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong(v15, v31);
    id v13 = v74;

    id v14 = v73;
    simd_float4 v17 = v31;
  }
  [(NUNAegirOffscreen *)v17 setTexture0:v14];
  float32x2_t v71 = v17;
  simd_float4 v32 = [(NUNAegirOffscreen *)v17 renderPassDescriptor];
  simd_float4 v33 = [v13 renderCommandEncoderWithDescriptor:v32];

  memset(v89, 0, sizeof(v89));
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  simd_float4 v34 = [v78 spheroids];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v82 objects:v86 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    int v37 = 0;
    uint64_t v38 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v83 != v38) {
          objc_enumerationMutation(v34);
        }
        long long v40 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        [v40 radiusScale];
        if (v41 > 0.00001)
        {
          [v40 opacity];
          if (v42 > 0.00001)
          {
            if ([v40 isVisible])
            {
              int v43 = [v40 type];
              if (v43 == 10)
              {
                _S0 = 1258291200;
              }
              else if (v43 == 13)
              {
                _S0 = 1258291194;
              }
              else
              {
                _S0 = 1258291196;
                if (((1 << v43) & 0xFFC000) == 0)
                {
                  _S0 = 1258291198;
                  if (v43 != 12)
                  {
                    float32x4_t v77 = *(float32x4_t *)&self->_anon_f4[12];
                    [v40 position];
                    _S2 = vsubq_f32(v77, v45).i32[2];
                    __asm { FMLA            S0, S2, V1.S[2] }
                  }
                }
              }
              simd_float4 v51 = (int *)&__base[8 * v37];
              *simd_float4 v51 = _S0;
              v51[1] = v37;
              objc_storeStrong((id *)v89 + v37++, v40);
            }
          }
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v82 objects:v86 count:16];
    }
    while (v36);
  }
  else
  {
    int v37 = 0;
  }

  qsort(__base, v37, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIAegirRenderCompareObject);
  [v33 setLabel:@"Ægir Offscreen Scene"];
  v80[0] = 0;
  v80[1] = 0;
  *(double *)&v80[2] = (double)a4.width;
  *(double *)&v80[3] = (double)(int)v72;
  long long v81 = xmmword_21E8F2360;
  [v33 setViewport:v80];
  [v33 setCullMode:0];
  [(NUNIAegirRenderer *)self _renderOffscreenBackgroundWithRenderEncoder:v33 frameBufferIndex:v79];
  simd_float4x4 v52 = [(NUNIAegirResourceManager *)self->_resourceManager rectVerticesBuffer];
  [v33 setVertexBuffer:v52 offset:0 atIndex:0];

  if (v37 >= 1)
  {
    simd_float4x4 v53 = &v88;
    uint64_t v54 = v37;
    do
    {
      uint64_t v55 = *v53;
      v53 += 2;
      id v56 = *((id *)v89 + v55);
      int v57 = 1 << [v56 type];
      simd_float4 v58 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:v79];
      [v33 setVertexBuffer:v58 offset:0 atIndex:1];
      [v33 setFragmentBuffer:v58 offset:0 atIndex:0];
      id v59 = v58;
      simd_float4 v60 = (void *)[v59 contents];
      memcpy(v60, &self->_baseUniforms, 0x1B0uLL);
      if ((*(void *)&v57 & 0xFBF400) != 0)
      {
        [(NUNIAegirRenderer *)self _renderSpriteSpheroid:v56 uniPtr:v60 renderEncoder:v33];
      }
      else if ((v57 & 0x3FE) != 0)
      {
        [(NUNIAegirRenderer *)self _renderRaytraceSpheroid:v56 uniPtr:v60 renderEncoder:v33];
      }

      if ((v57 & 8) != 0)
      {
        [v78 locationDotAlpha];
        if (v61 > 0.00001)
        {
          float v62 = v61;
          [v78 locationDotPulse];
          float v64 = v63;
          float32x4_t v65 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:v79];
          [v33 setVertexBuffer:v65 offset:0 atIndex:1];
          [v33 setFragmentBuffer:v65 offset:0 atIndex:0];
          id v66 = v65;
          uint64_t v67 = [v66 contents];
          memcpy((void *)v67, &self->_baseUniforms, 0x1B0uLL);
          [v56 opacity];
          *(float *)(v67 + 360) = v62 * v68;
          *(float *)(v67 + 364) = v64 - floorf(v64);
          [v78 locationDotPulseOverrideAlpha];
          *(_DWORD *)(v67 + 368) = v69;
          [(NUNIAegirRenderer *)self _renderLocationDot:v56 uniPtr:v67 viewport:v75 renderEncoder:v33];
        }
      }

      --v54;
    }
    while (v54);
  }
  [v33 endEncoding];
  for (uint64_t j = 184; j != -8; j -= 8)
}

- (void)_renderOffscreenBloomWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  id v10 = self->_offscreenScenes[a6];
  float v11 = self->_offscreenBlooms;
  id v12 = a5;
  id v13 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:a6];
  memcpy((void *)[v13 contents], &self->_baseUniforms, 0x1B0uLL);
  int v14 = a4.width >> 1;
  uint64_t v15 = *(uint64_t *)&a4 >> 33;
  if (!v11
    || [(NUNAegirOffscreen *)v11 width] != v14
    || [(NUNAegirOffscreen *)v11 height] != v15)
  {
    simd_float4 v16 = -[NUNAegirOffscreen initWithDevice:width:height:pixelFormat0:pixelFormat1:mipmaps:loadAction:clearColor0:clearColor1:]([NUNAegirOffscreen alloc], "initWithDevice:width:height:pixelFormat0:pixelFormat1:mipmaps:loadAction:clearColor0:clearColor1:", self->_device, (a4.width >> 1), *(uint64_t *)&a4 >> 33, 10, 0, 3, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 2);

    objc_storeStrong((id *)&self->_offscreenBlooms, v16);
    float v11 = v16;
  }
  simd_float4 v17 = [(NUNAegirOffscreen *)v11 renderPassDescriptor];
  simd_float4 v18 = [v12 renderCommandEncoderWithDescriptor:v17];

  simd_float4 v19 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForThreshold];
  [v18 setLabel:@"Ægir Threshold"];
  v24[0] = 0;
  v24[1] = 0;
  *(double *)&v24[2] = (double)v14;
  *(double *)&v24[3] = (double)(int)v15;
  long long v25 = xmmword_21E8F2360;
  [v18 setViewport:v24];
  [v18 setCullMode:0];
  [v18 setRenderPipelineState:v19];
  simd_float4 v20 = [(NUNIAegirResourceManager *)self->_resourceManager rectVerticesBuffer];
  [v18 setVertexBuffer:v20 offset:0 atIndex:0];

  [v18 setVertexBuffer:v13 offset:0 atIndex:1];
  [v18 setFragmentBuffer:v13 offset:0 atIndex:0];
  uint64_t v21 = [(NUNAegirOffscreen *)v10 texture0];
  [v18 setFragmentTexture:v21 atIndex:1];

  [v18 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v18 endEncoding];
  uint64_t v22 = [v12 blitCommandEncoder];

  float32x4_t v23 = [(NUNAegirOffscreen *)v11 texture0];
  [v22 generateMipmapsForTexture:v23];

  [v22 endEncoding];
}

- (void)_renderOffscreenPostWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  NUNIViewport v8 = a4;
  uint64_t height = a4.height;
  float v11 = self->_offscreenScenes[a6];
  id v12 = self->_offscreenBlooms;
  id v13 = self->_offscreenPosts;
  id v14 = a5;
  id v15 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:a6];
  memcpy((void *)[v15 contents], &self->_baseUniforms, 0x1B0uLL);
  if (!v13
    || [(NUNAegirOffscreen *)v13 width] != v8.width
    || [(NUNAegirOffscreen *)v13 height] != height)
  {
    [MEMORY[0x263F32148] sharedNilTexture2D];
    simd_float4 v16 = v31 = v13;
    NUNIViewport v17 = v8;
    NUNIViewport v8 = (NUNIViewport)v15;
    simd_float4 v18 = v12;
    simd_float4 v19 = [NUNAegirOffscreen alloc];
    device = self->_device;
    [(NUNAegirOffscreen *)v11 texture1];
    id v32 = v14;
    v22 = uint64_t v21 = v11;
    float32x4_t v23 = v19;
    id v12 = v18;
    id v15 = (id)v8;
    v8.int width = v17.width;
    float32x4_t v24 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](v23, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", device, v17, height, v16, v22, 1, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong((id *)&self->_offscreenPosts, v24);
    float v11 = v21;
    id v14 = v32;

    id v13 = v24;
  }
  long long v25 = [(NUNAegirOffscreen *)v11 texture0];
  [(NUNAegirOffscreen *)v13 setTexture0:v25];

  float32x4_t v26 = [(NUNAegirOffscreen *)v13 renderPassDescriptor];
  float v27 = [v14 renderCommandEncoderWithDescriptor:v26];

  float v28 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForPost];
  [v27 setLabel:@"Ægir Post"];
  [v27 setRenderPipelineState:v28];
  v33[0] = 0;
  v33[1] = 0;
  *(double *)&v33[2] = (double)v8.width;
  *(double *)&v33[3] = (double)(int)height;
  long long v34 = xmmword_21E8F2360;
  [v27 setViewport:v33];
  [v27 setCullMode:0];
  float v29 = [(NUNIAegirResourceManager *)self->_resourceManager rectVerticesBuffer];
  [v27 setVertexBuffer:v29 offset:0 atIndex:0];

  [v27 setVertexBuffer:v15 offset:0 atIndex:1];
  [v27 setFragmentBuffer:v15 offset:0 atIndex:0];
  float v30 = [(NUNAegirOffscreen *)v12 texture0];
  [v27 setFragmentTexture:v30 atIndex:1];

  [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v27 endEncoding];
}

- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5
{
  -[NUNIAegirRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", a3, a4, a5);
  [(NUNIAegirRenderer *)self _updateBaseUniformsForViewport:a4];
}

- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [a6 colorAttachments];
  id v15 = [v12 objectAtIndexedSubscript:0];

  id v13 = [v15 texture];
  unint64_t v14 = self->_frame % 3;
  self->_renderUniformBuffersCounts[v14] = 0;
  [(NUNIAegirRenderer *)self _renderOffscreenSceneWithScene:v11 viewport:a4 commandBuffer:v10 frameBufferIndex:v14 drawableTexture:v13];
  [(NUNIAegirRenderer *)self _renderOffscreenBloomWithScene:v11 viewport:a4 commandBuffer:v10 frameBufferIndex:v14];
  [(NUNIAegirRenderer *)self _renderOffscreenPostWithScene:v11 viewport:a4 commandBuffer:v10 frameBufferIndex:v14];

  [(CALayer *)self->_contentMaskLayer setContents:self->_contentMaskSurfaces[v14]];
  ++self->_frame;
}

- (NUNIAegirResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (NUNIRendererOptions)rendererOptions
{
  return self->_rendererOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererOptions, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_contentMaskSurfaces[i], 0);
  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_contentMaskTextures[j], 0);
  objc_storeStrong((id *)&self->_offscreenPosts, 0);
  objc_storeStrong((id *)&self->_offscreenBlooms, 0);
  for (uint64_t k = 2; k != -1; --k)
    objc_storeStrong((id *)&self->_offscreenScenes[k], 0);
  for (uint64_t m = 2; m != -1; --m)
    objc_storeStrong((id *)&self->_renderUniformsBuffers[m], 0);
  objc_storeStrong((id *)&self->_textureGroup, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end