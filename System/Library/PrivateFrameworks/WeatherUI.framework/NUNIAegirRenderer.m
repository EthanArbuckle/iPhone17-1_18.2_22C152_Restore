@interface NUNIAegirRenderer
+ (id)texturePreloadingQueue;
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
- (void)prepareForRenderingSpheroids:(id)a3 completionHandler:(id)a4;
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
    uint64_t v12 = +[CLKUIMetalResourceManager sharedDevice];
    device = v9->_device;
    v9->_device = (MTLDevice *)v12;

    uint64_t v14 = [(NUNIAegirResourceManager *)v9->_resourceManager textureGroupWithSuffix:v8 device:v9->_device];
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

+ (id)texturePreloadingQueue
{
  if (texturePreloadingQueue_onceToken != -1) {
    dispatch_once(&texturePreloadingQueue_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)texturePreloadingQueue_queue;
  return v2;
}

void __43__NUNIAegirRenderer_texturePreloadingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.weather.aegir.preloading", v2);
  v1 = (void *)texturePreloadingQueue_queue;
  texturePreloadingQueue_queue = (uint64_t)v0;
}

- (void)prepareForRenderingSpheroids:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(id)objc_opt_class() texturePreloadingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__NUNIAegirRenderer_prepareForRenderingSpheroids_completionHandler___block_invoke;
  v11[3] = &unk_1E609E440;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__NUNIAegirRenderer_prepareForRenderingSpheroids_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    [WeakRetained[5] prepareForRendering];
    [v3[6] preloadTexturesForSpheroids:*(void *)(a1 + 32)];
    dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
    WeakRetained = v3;
  }
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
  id v35 = +[CLKUIResourceManager sharedInstance];
  v5 = +[CLKUITexture nullTexture2D];
  for (uint64_t i = 0; i != 24; ++i)
  {
    if (v4 != i)
    {
      id v7 = [(NUNIAegirTextureGroup *)self->_textureGroup albedos];
      id v8 = [v7 objectAtIndexedSubscript:i];

      if (v8 != v5)
      {
        id v9 = [v8 atlas];
        id v10 = [v9 uuid];
        [v35 purge:v10];
      }
      v11 = [(NUNIAegirTextureGroup *)self->_textureGroup normals];
      id v12 = [v11 objectAtIndexedSubscript:i];

      if (v12 != v5)
      {
        id v13 = [v12 atlas];
        id v14 = [v13 uuid];
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
    _Q2 = vmlaq_f32(vmulq_f32(v24, (float32x4_t)xmmword_1B48556F0), (float32x4_t)xmmword_1B4855700, v22);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v24, (float32x4_t)xmmword_1B4855710), (float32x4_t)xmmword_1B4855720, v22);
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
  v58.f32[0] = UMFloat4x4MakePerspective((float)(v35 * 180.0) / 3.1416, (float)width / (float)height, 0.001, 4.0);
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
  *(_DWORD *)self->_anon_e4 = 0;
  *(void *)&self->_anon_e4[4] = v76;
  *(float32x4_t *)&self->_anon_e4[12] = v83;
  *(float32x4_t *)&self->_anon_e4[28] = v77;
  *(float32x4_t *)&self->_anon_e4[44] = v74;
  *(int32x4_t *)&self->_anon_e4[60] = v75;
  *(float32x4_t *)&self->_anon_e4[76] = v84;
  *(simd_float4 *)&self->_anon_e4[92] = v82;
  *(simd_float4 *)&self->_anon_e4[108] = v80;
  *(simd_float4 *)&self->_anon_e4[124] = v79;
  *(simd_float4 *)&self->_anon_e4[140] = v78;
  *(simd_float4 *)&self->_anon_e4[156] = v73;
  *(simd_float4 *)&self->_anon_e4[172] = v72;
  *(simd_float4 *)&self->_anon_e4[188] = v71;
  *(simd_float4 *)&self->_anon_e4[204] = v70;
  *(_OWORD *)&self->_anon_e4[220] = v62;
  *(_OWORD *)&self->_anon_e4[236] = v63;
  *(_OWORD *)&self->_anon_e4[252] = v64;
  *(_OWORD *)&self->_anon_e4[268] = v65;
}

- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3
{
  int width = a3.width;
  int height = a3.height;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * self->_frame, 2) <= 0x444444444444444uLL)
  {
    unsigned int v6 = [(NUNIRendererOptions *)self->_rendererOptions changeSequence];
    if (v6 != self->_rendererOptionsChangeSequence)
    {
      uint64_t v7 = 0;
      self->_rendererOptionsChangeSequence = v6;
      do
      {
        float32x4_t v8 = _updateBaseUniformsForViewport__optionKeys[v7];
        float32x4_t v9 = [(NUNIRendererOptions *)self->_rendererOptions fractionValueForOption:v8];
        float v10 = v9;
        if (v9)
        {
          [v9 doubleValue];
          *(float *)&double v11 = v11;
          _H1 = *(_WORD *)&self->_anon_3b4[2 * v7];
          __asm { FCVT            S1, H1 }
          if (*(float *)&v11 != _S1)
          {
            [v10 doubleValue];
            __asm { FCVT            H0, D0 }
            *(_WORD *)&self->_anon_3b4[2 * v7] = _D0;
          }
        }

        ++v7;
      }
      while (v7 != 35);
      resourceManager = self->_resourceManager;
      long long v20 = *(_OWORD *)&self->_anon_3b4[48];
      v34[2] = *(_OWORD *)&self->_anon_3b4[32];
      v35[0] = v20;
      *(void *)((char *)v35 + 14) = *(void *)&self->_anon_3b4[62];
      long long v21 = *(_OWORD *)&self->_anon_3b4[16];
      v34[0] = *(_OWORD *)self->_anon_3b4;
      v34[1] = v21;
      [(NUNIAegirResourceManager *)resourceManager setPipelineConstants:v34];
    }
  }
  uint64_t v22 = *(void *)&self->_anon_e4[4];
  float aspect = self->_state.aspect;
  if (height <= width)
  {
    float v24 = (float)height;
    __asm { FMOV            V2.2S, #1.0 }
    *(float *)&_D2 = (float)width / (float)height;
  }
  else
  {
    float v24 = (float)width;
    __asm { FMOV            V2.2S, #1.0 }
    *((float *)&_D2 + 1) = (float)height / (float)width;
  }
  uint64_t v33 = _D2;
  float v26 = tanf(self->_state.fovY * 0.5);
  _H4 = *(_WORD *)&self->_anon_3b4[10];
  __asm { FCVT            S4, H4 }
  float v29 = (float)(_S4 * 5.0) + 1.0;
  LOWORD(_S4) = *(_WORD *)&self->_anon_3b4[12];
  __asm { FCVT            S4, H4 }
  float v31 = _S4 * -10.0;
  unsigned int v32 = *(_DWORD *)&self->_anon_3b4[6];
  *(_OWORD *)&self->_baseUniforms.var5 = 0u;
  *(_OWORD *)&self->_baseUniforms.var9 = 0u;
  *(_OWORD *)&self->_baseUniforms.var13 = 0u;
  *(_OWORD *)&self->_baseUniforms.var17 = 0u;
  *(_OWORD *)&self->_baseUniforms.var21 = 0u;
  *(_OWORD *)self->_anon_250 = 0u;
  *(_OWORD *)&self->_anon_250[16] = 0u;
  *(_OWORD *)&self->_anon_250[32] = 0u;
  *(_OWORD *)&self->_anon_250[48] = 0u;
  *(_OWORD *)&self->_anon_250[64] = 0u;
  *(_OWORD *)&self->_anon_250[80] = 0u;
  *(_OWORD *)&self->_anon_250[96] = 0u;
  *(_OWORD *)&self->_anon_250[112] = 0u;
  *(_OWORD *)&self->_anon_250[128] = 0u;
  *(_OWORD *)&self->_anon_250[144] = 0u;
  *(_OWORD *)&self->_anon_250[160] = 0u;
  *(_OWORD *)&self->_anon_250[176] = 0u;
  *(_OWORD *)&self->_anon_250[192] = 0u;
  *(_OWORD *)&self->_anon_250[208] = 0u;
  *(_OWORD *)&self->_anon_250[224] = 0u;
  *(_OWORD *)&self->_anon_250[240] = 0u;
  *(void *)&self->_anon_250[256] = v22;
  *(void *)&self->_anon_250[264] = v33;
  *(float *)&self->_anon_250[272] = 1.0 / v24;
  *(float *)&self->_anon_250[276] = (float)(-1.0 / v26) / aspect;
  *(void *)&self->_anon_250[280] = 0x3E31D0D400000000;
  *(_DWORD *)&self->_anon_250[288] = 0;
  *(float *)&self->_anon_250[292] = v31;
  *(float *)&self->_anon_250[296] = (float)((float)(-1.0 / v29) * v31) - v31;
  *(void *)&self->_anon_250[300] = vcvtq_f32_f16(vmul_f16((float16x4_t)__PAIR64__(HIDWORD(v33), v32), (float16x4_t)__PAIR64__(HIDWORD(v33), v32))).u64[0];
  *(float *)&self->_anon_250[308] = v29;
  *(_OWORD *)&self->_anon_250[312] = 0u;
  *(_OWORD *)&self->_anon_250[328] = 0u;
  *(void *)&self->_anon_250[344] = 0;
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
  id v16 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:a4];
  uint64_t v7 = [v16 contents];
  memcpy((void *)v7, &self->_baseUniforms, 0x1B0uLL);
  self = (NUNIAegirRenderer *)((char *)self + 208);
  *(simd_float4x4 *)(v7 + 144) = __invert_f4(*(simd_float4x4 *)&self->_contentMaskSurfaces[2]);
  *(double *)v8.i64 = UMFloat4x4MakeTranslate();
  v18.columns[0] = v8;
  v18.columns[1] = v9;
  v18.columns[2] = v10;
  v18.columns[3] = v11;
  *(double *)&long long v12 = UMMul(*(simd_float4x4 *)&self->_anon_e4[12], v18);
  *(_OWORD *)(v7 + 272) = v12;
  *(_OWORD *)(v7 + 288) = v13;
  *(_OWORD *)(v7 + 304) = v14;
  *(_OWORD *)(v7 + 320) = v15;
  [v6 setVertexBuffer:v16 offset:0 atIndex:1];
}

- (void)_renderRaytraceSpheroid:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 renderEncoder:(id)a5
{
  id v108 = a3;
  id v8 = a5;
  uint64_t v9 = [v108 type];
  if (v9 == 3)
  {
    _H0 = *(_WORD *)&self->_anon_3b4[46];
    __asm { FCVT            S8, H0 }
    [v108 cloudOpacity];
    float v17 = v16 * _S8;
    a4[5].var10 = v17;
    BOOL v18 = v17 > 0.00001;
    BOOL v19 = v17 > 0.00001;
  }
  else
  {
    BOOL v18 = 0;
    BOOL v19 = 0;
  }
  long long v20 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForSpheroid:v9 config:v18];
  if (v20)
  {
    [v8 setLabel:@"Ægir RaytraceSpheroid"];
    [v8 setRenderPipelineState:v20];
    [v108 opacity];
    a4[4].var15 = v21;
    [v108 equatorRotation];
    float v23 = v22;
    [v108 radius];
    float v25 = v24;
    [v108 radiusScale];
    float v99 = v25 * v26;
    UMFloat4x4MakeScale(v25 * v26);
    simd_float4 v104 = v28;
    simd_float4 v106 = v27;
    simd_float4 v100 = v30;
    simd_float4 v102 = v29;
    if (v23 != 0.0)
    {
      *(double *)v31.i64 = UMFloat4x4MakeRotateZ(v23 + 1.5708);
      v115.columns[0] = v31;
      v115.columns[1] = v32;
      v115.columns[2] = v33;
      v115.columns[3] = v34;
      v110.columns[1] = v104;
      v110.columns[0] = v106;
      v110.columns[3] = v100;
      v110.columns[2] = v102;
      *(double *)v35.i64 = UMMul(v110, v115);
      simd_float4 v104 = v36;
      simd_float4 v106 = v35;
      simd_float4 v100 = v38;
      simd_float4 v102 = v37;
    }
    [v108 position];
    float32x4_t v90 = v39;
    *(double *)v40.i64 = UMFloat4x4MakeTranslate();
    simd_float4 v93 = v41;
    simd_float4 v94 = v40;
    simd_float4 v91 = v43;
    simd_float4 v92 = v42;
    v116.columns[1] = v104;
    v116.columns[0] = v106;
    v116.columns[3] = v100;
    v116.columns[2] = v102;
    *(double *)v111.columns[0].i64 = UMMul(*(simd_float4x4 *)&self->_anon_e4[92], v116);
    simd_float4x4 v112 = __invert_f4(v111);
    float32x4_t v95 = (float32x4_t)v112.columns[0];
    float32x4_t v97 = (float32x4_t)v112.columns[1];
    float32x4_t v98 = (float32x4_t)v112.columns[2];
    v112.columns[1] = v93;
    v112.columns[0] = v94;
    v112.columns[3] = v91;
    v112.columns[2] = v92;
    v117.columns[1] = v104;
    v117.columns[0] = v106;
    v117.columns[3] = v100;
    v117.columns[2] = v102;
    *(double *)v44.i64 = UMMul(v112, v117);
    v118.columns[0] = v44;
    v118.columns[1] = v45;
    v118.columns[2] = v46;
    v118.columns[3] = v47;
    *(double *)v113.columns[0].i64 = UMMul(*(simd_float4x4 *)&self->_anon_e4[156], v118);
    float32x4_t v105 = (float32x4_t)v113.columns[1];
    float32x4_t v107 = (float32x4_t)v113.columns[0];
    float32x4_t v101 = (float32x4_t)v113.columns[3];
    float32x4_t v103 = (float32x4_t)v113.columns[2];
    simd_float4x4 v114 = __invert_f4(v113);
    float16x4_t v48 = vcvt_f16_f32(v95);
    _S5 = v95.i32[2];
    __asm { FCVT            H5, S5 }
    v48.i16[2] = _S5;
    float16x4_t v50 = vcvt_f16_f32(v97);
    _S6 = v97.i32[2];
    __asm { FCVT            H6, S6 }
    v50.i16[2] = _S6;
    float16x4_t v52 = vcvt_f16_f32(v98);
    _S7 = v98.i32[2];
    __asm { FCVT            H7, S7 }
    v52.i16[2] = _S7;
    float16x4_t v54 = vcvt_f16_f32((float32x4_t)v114.columns[3]);
    _S16 = v114.columns[3].i32[2];
    __asm { FCVT            H16, S16 }
    v54.i16[2] = _S16;
    *(float16x4_t *)&a4[1].var13 = v48;
    *(float16x4_t *)&a4[1].var15 = v50;
    *(float16x4_t *)&a4[1].var17 = v52;
    *(float16x4_t *)&a4[1].var19 = v54;
    *(simd_float4x4 *)&a4[1].var21 = v114;
    *(float32x4_t *)&a4[2].var17 = v107;
    *(float32x4_t *)&a4[2].var21 = v105;
    *(float32x4_t *)&a4[3].var5 = v103;
    *(float32x4_t *)&a4[3].var9 = v101;
    if (v9 == 4)
    {
      _Q0 = vaddq_f32(v90, (float32x4_t)xmmword_1B4855730);
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      float32x4_t v59 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    }
    else
    {
      objc_msgSend(v108, "light", *(_OWORD *)&v90);
      float v96 = v60;
      __float2 v62 = __sincosf_stret(v61);
      __float2 v63 = __sincosf_stret(v96);
      *(float32x2_t *)v59.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v63.__sinval), LODWORD(v63.__cosval)), v62.__sinval);
      v59.i32[2] = LODWORD(v62.__cosval);
    }
    v59.i32[3] = 0;
    *(double *)&long long v64 = UMMul(*(float32x4_t *)&self->_anon_e4[156], *(float32x4_t *)&self->_anon_e4[172], *(float32x4_t *)&self->_anon_e4[188], *(float32x4_t *)&self->_anon_e4[204], v59);
    *(_OWORD *)&a4->var13 = v64;
    *(double *)&long long v65 = UMMul(v107, v105, v103, v101, (float32x4_t)xmmword_1B483DAE0);
    *((float *)&v65 + 3) = v99 * v99;
    *(_OWORD *)&a4->var9 = v65;
    if (v9 == 3)
    {
      if (a4->var15 < 0.0 && self->_supportsMTLGPUFamilyApple6) {
        *(float32x2_t *)&a4[4].var23 = vmul_f32(vmul_n_f32((float32x2_t)0x42DA000046B73E00, v99), *(float32x2_t *)&a4[4].var20);
      }
      float v66 = v99 * 0.98;
      if (v19)
      {
        a4[5].var6 = v99 * v99;
        float32x2_t v67 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)xmmword_1B4855740, v99));
        *(float32x2_t *)&a4[5].var7 = vmul_f32(v67, v67);
        a4[5].var9 = v99 * 0.02;
      }
      float v68 = v66 * 1.125;
      a4[5].var5 = v66 * v66;
      float v69 = v66 * 0.95;
      a4[5].var11 = v68;
      a4[5].var12 = v69;
    }
    simd_float4 v70 = [(NUNIAegirTextureGroup *)self->_textureGroup albedos];
    simd_float4 v71 = [v70 objectAtIndexedSubscript:v9];

    simd_float4 v72 = [v71 atlas];
    [v72 bind:v8 slot:1];

    simd_float4 v73 = [(NUNIAegirTextureGroup *)self->_textureGroup normals];
    float32x4_t v74 = [v73 objectAtIndexedSubscript:v9];

    int32x4_t v75 = [v74 atlas];
    [v75 bind:v8 slot:2];

    uint64_t v76 = [(NUNIAegirTextureGroup *)self->_textureGroup emissives];
    float32x4_t v77 = [v76 objectAtIndexedSubscript:v9];

    simd_float4 v78 = [v77 atlas];
    [v78 bind:v8 slot:3];

    if (v19)
    {
      simd_float4 v79 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsLo];
      simd_float4 v80 = [v79 objectAtIndexedSubscript:v9];

      int32x4_t v81 = [v80 atlas];
      [v81 bind:v8 slot:5];

      simd_float4 v82 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsMd];
      float32x4_t v83 = [v82 objectAtIndexedSubscript:v9];

      float32x4_t v84 = [v83 atlas];
      [v84 bind:v8 slot:6];

      simd_float4x4 v85 = [(NUNIAegirTextureGroup *)self->_textureGroup cloudsHi];
      float32x4_t v77 = [v85 objectAtIndexedSubscript:v9];

      simd_float4x4 v86 = [v77 atlas];
      [v86 bind:v8 slot:7];
    }
    simd_float4x4 v87 = [(NUNIAegirTextureGroup *)self->_textureGroup gradients];
    simd_float4x4 v88 = [v87 objectAtIndexedSubscript:v9];

    simd_float4x4 v89 = [v88 atlas];
    [v89 bind:v8 slot:4];

    [v8 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (void)_renderLocationDot:(id)a3 uniPtr:(NUNIAegirRenderUniforms *)a4 viewport:(NUNIViewport)a5 renderEncoder:(id)a6
{
  id v162 = a3;
  id v10 = a6;
  simd_float4 v11 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForLocationDot];
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
    *(double *)v66.i64 = UMMul(v62, v63, v64, v65, (float32x4_t)xmmword_1B4855400);
    int32x4_t v133 = v66;
    *(double *)v67.i64 = UMMul(v161, v156, v151, v146, (float32x4_t)xmmword_1B4855760);
    int32x4_t v132 = v67;
    *(double *)v68.i64 = UMMul(v161, v156, v151, v146, (float32x4_t)xmmword_1B483DAE0);
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
    *(_OWORD *)&a4->var5 = s_sprites[[v50 spriteType]];
    [v50 opacity];
    a4[4].var15 = v12;
    [v50 position];
    _Q3 = vsubq_f32(*(float32x4_t *)&self->_anon_e4[12], v13);
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
    *(double *)&long long v39 = UMMul(*(simd_float4x4 *)&self->_anon_e4[220], v54);
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
  v92[4] = *MEMORY[0x1E4F143B8];
  uint64_t height = a4.height;
  id v79 = a3;
  id v13 = a5;
  id v14 = a7;
  unint64_t v80 = a6;
  float32x4_t v15 = (id *)&self->_offscreenScenes[a6];
  simd_float4 v16 = (NUNAegirOffscreen *)*v15;
  simd_float4 v17 = v16;
  float32x2_t v74 = v14;
  float v75 = v13;
  NUNIViewport v76 = a4;
  uint64_t v73 = height;
  if (!v16
    || [(NUNAegirOffscreen *)v16 width] != a4.width
    || [(NUNAegirOffscreen *)v17 height] != height)
  {
    float v77 = +[CLKUIMetalResourceManager sharedNilTexture2D];
    simd_float4 v18 = objc_opt_new();
    [v18 setTextureType:2];
    [v18 setWidth:a4.width];
    [v18 setHeight:*(uint64_t *)&a4 >> 32];
    [v18 setDepth:1];
    [v18 setPixelFormat:10];
    [v18 setUsage:5];
    simd_float4 v19 = +[MetalDeviceInfo sharedInfo];
    objc_msgSend(v18, "setResourceOptions:", objc_msgSend(v19, "defaultResourceOptionForDevice:", self->_device));

    v91[0] = *MEMORY[0x1E4F2EF70];
    simd_float4 v20 = [NSNumber numberWithInt:a4];
    v92[0] = v20;
    v91[1] = *MEMORY[0x1E4F2EF28];
    double v21 = [NSNumber numberWithInt:height];
    uint64_t v22 = *MEMORY[0x1E4F2EF30];
    v92[1] = v21;
    v92[2] = &unk_1F0D310F0;
    uint64_t v23 = *MEMORY[0x1E4F2EF10];
    v91[2] = v22;
    v91[3] = v23;
    v92[3] = &unk_1F0D31108;
    float32x4_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:4];

    int32x4_t v25 = (IOSurface *)[objc_alloc(MEMORY[0x1E4F2EF78]) initWithProperties:v24];
    float32x4_t v26 = self->_contentMaskSurfaces[v80];
    self->_contentMaskSurfaces[v80] = v25;

    device = self->_device;
    float v28 = v25;
    float v29 = (MTLTexture *)[(MTLDevice *)device newTextureWithDescriptor:v18 iosurface:v28 plane:0];
    float v30 = self->_contentMaskTextures[v80];
    self->_contentMaskTextures[v80] = v29;

    simd_float4 v31 = v29;
    simd_float4 v32 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNAegirOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, a4, v73, v77, v31, 2, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong(v15, v32);
    id v13 = v75;

    id v14 = v74;
    simd_float4 v17 = v32;
  }
  [(NUNAegirOffscreen *)v17 setTexture0:v14];
  float32x2_t v72 = v17;
  simd_float4 v33 = [(NUNAegirOffscreen *)v17 renderPassDescriptor];
  simd_float4 v34 = [v13 renderCommandEncoderWithDescriptor:v33];

  memset(v90, 0, sizeof(v90));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  simd_float4 v35 = [v79 spheroids];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    int v38 = 0;
    uint64_t v39 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v84 != v39) {
          objc_enumerationMutation(v35);
        }
        long long v41 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        [v41 radiusScale];
        if (v42 > 0.00001)
        {
          [v41 opacity];
          if (v43 > 0.00001)
          {
            if ([v41 isVisible])
            {
              int v44 = [v41 type];
              if (v44 == 10)
              {
                _S0 = 1258291200;
              }
              else if (v44 == 13)
              {
                _S0 = 1258291194;
              }
              else
              {
                _S0 = 1258291196;
                if (((1 << v44) & 0xFFC000) == 0)
                {
                  _S0 = 1258291198;
                  if (v44 != 12)
                  {
                    float32x4_t v78 = *(float32x4_t *)&self->_anon_e4[12];
                    [v41 position];
                    _S2 = vsubq_f32(v78, v46).i32[2];
                    __asm { FMLA            S0, S2, V1.S[2] }
                  }
                }
              }
              simd_float4x4 v52 = (int *)&__base[8 * v38];
              *simd_float4x4 v52 = _S0;
              v52[1] = v38;
              objc_storeStrong((id *)v90 + v38++, v41);
            }
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v83 objects:v87 count:16];
    }
    while (v37);
  }
  else
  {
    int v38 = 0;
  }

  qsort(__base, v38, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIAegirRenderCompareObject);
  [v34 setLabel:@"Ægir Offscreen Scene"];
  v81[0] = 0;
  v81[1] = 0;
  *(double *)&v81[2] = (double)a4.width;
  *(double *)&v81[3] = (double)(int)v73;
  long long v82 = xmmword_1B4855770;
  [v34 setViewport:v81];
  [v34 setCullMode:0];
  [(NUNIAegirRenderer *)self _renderOffscreenBackgroundWithRenderEncoder:v34 frameBufferIndex:v80];
  simd_float4x4 v53 = [(NUNIAegirResourceManager *)self->_resourceManager rectVerticesBuffer];
  [v34 setVertexBuffer:v53 offset:0 atIndex:0];

  if (v38 >= 1)
  {
    simd_float4x4 v54 = &v89;
    uint64_t v55 = v38;
    do
    {
      uint64_t v56 = *v54;
      v54 += 2;
      id v57 = *((id *)v90 + v56);
      int v58 = 1 << [v57 type];
      simd_float4 v59 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:v80];
      [v34 setVertexBuffer:v59 offset:0 atIndex:1];
      [v34 setFragmentBuffer:v59 offset:0 atIndex:0];
      id v60 = v59;
      simd_float4 v61 = (void *)[v60 contents];
      memcpy(v61, &self->_baseUniforms, 0x1B0uLL);
      if ((*(void *)&v58 & 0xFBF400) != 0)
      {
        [(NUNIAegirRenderer *)self _renderSpriteSpheroid:v57 uniPtr:v61 renderEncoder:v34];
      }
      else if ((v58 & 0x3FE) != 0)
      {
        [(NUNIAegirRenderer *)self _renderRaytraceSpheroid:v57 uniPtr:v61 renderEncoder:v34];
      }

      if ((v58 & 8) != 0)
      {
        [v79 locationDotAlpha];
        if (v62 > 0.00001)
        {
          float v63 = v62;
          [v79 locationDotPulse];
          float v65 = v64;
          int32x4_t v66 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:v80];
          [v34 setVertexBuffer:v66 offset:0 atIndex:1];
          [v34 setFragmentBuffer:v66 offset:0 atIndex:0];
          id v67 = v66;
          uint64_t v68 = [v67 contents];
          memcpy((void *)v68, &self->_baseUniforms, 0x1B0uLL);
          [v57 opacity];
          *(float *)(v68 + 360) = v63 * v69;
          *(float *)(v68 + 364) = v65 - floorf(v65);
          [v79 locationDotPulseOverrideAlpha];
          *(_DWORD *)(v68 + 368) = v70;
          [(NUNIAegirRenderer *)self _renderLocationDot:v57 uniPtr:v68 viewport:v76 renderEncoder:v34];
        }
      }

      --v55;
    }
    while (v55);
  }
  [v34 endEncoding];
  for (uint64_t j = 184; j != -8; j -= 8)
}

- (void)_renderOffscreenBloomWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  id v10 = self->_offscreenScenes[a6];
  simd_float4 v11 = self->_offscreenBlooms;
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
    simd_float4 v11 = v16;
  }
  simd_float4 v17 = [(NUNAegirOffscreen *)v11 renderPassDescriptor];
  simd_float4 v18 = [v12 renderCommandEncoderWithDescriptor:v17];

  simd_float4 v19 = [(NUNIAegirResourceManager *)self->_resourceManager renderOffscreenPipelineForThreshold];
  [v18 setLabel:@"Ægir Threshold"];
  v24[0] = 0;
  v24[1] = 0;
  *(double *)&v24[2] = (double)v14;
  *(double *)&v24[3] = (double)(int)v15;
  long long v25 = xmmword_1B4855770;
  [v18 setViewport:v24];
  [v18 setCullMode:0];
  [v18 setRenderPipelineState:v19];
  simd_float4 v20 = [(NUNIAegirResourceManager *)self->_resourceManager rectVerticesBuffer];
  [v18 setVertexBuffer:v20 offset:0 atIndex:0];

  [v18 setVertexBuffer:v13 offset:0 atIndex:1];
  [v18 setFragmentBuffer:v13 offset:0 atIndex:0];
  double v21 = [(NUNAegirOffscreen *)v10 texture0];
  [v18 setFragmentTexture:v21 atIndex:1];

  [v18 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v18 endEncoding];
  uint64_t v22 = [v12 blitCommandEncoder];

  uint64_t v23 = [(NUNAegirOffscreen *)v11 texture0];
  [v22 generateMipmapsForTexture:v23];

  [v22 endEncoding];
}

- (void)_renderOffscreenPostWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  NUNIViewport v8 = a4;
  uint64_t height = a4.height;
  simd_float4 v11 = self->_offscreenScenes[a6];
  id v12 = self->_offscreenBlooms;
  id v13 = self->_offscreenPosts;
  id v14 = a5;
  id v15 = [(NUNIAegirRenderer *)self getOrCreateUniformBufferforFrameBufferIndex:a6];
  memcpy((void *)[v15 contents], &self->_baseUniforms, 0x1B0uLL);
  if (!v13
    || [(NUNAegirOffscreen *)v13 width] != v8.width
    || [(NUNAegirOffscreen *)v13 height] != height)
  {
    +[CLKUIMetalResourceManager sharedNilTexture2D];
    v16 = simd_float4 v31 = v13;
    NUNIViewport v17 = v8;
    NUNIViewport v8 = (NUNIViewport)v15;
    simd_float4 v18 = v12;
    simd_float4 v19 = [NUNAegirOffscreen alloc];
    device = self->_device;
    [(NUNAegirOffscreen *)v11 texture1];
    id v32 = v14;
    v22 = double v21 = v11;
    uint64_t v23 = v19;
    id v12 = v18;
    id v15 = (id)v8;
    v8.int width = v17.width;
    float32x4_t v24 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](v23, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", device, v17, height, v16, v22, 1, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong((id *)&self->_offscreenPosts, v24);
    simd_float4 v11 = v21;
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
  long long v34 = xmmword_1B4855770;
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