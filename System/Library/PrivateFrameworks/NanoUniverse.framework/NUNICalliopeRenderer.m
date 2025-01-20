@interface NUNICalliopeRenderer
- (BOOL)isObjectBoundingBoxInsideOrIntersectingFrustum:(NUNICalliopeRenderer *)self max:(SEL)a2 withState:;
- (NUNICalliopeRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
- (NUNICalliopeResourceManager)resourceManager;
- (NUNIRendererOptions)rendererOptions;
- (double)buildFrustumPlane:(float32x4_t)a1 p2:(float32x4_t)a2 p3:(float32x4_t)a3;
- (id)_getOrCreateOffscreenBloomWithViewport:(NUNIViewport)a3;
- (id)contentMaskLayer;
- (id)getUniformsBufferForFrameBufferIndex:(unint64_t)a3 pContents:(NUNICalliopeRenderUniforms *)a4 pOffset:(unint64_t *)a5;
- (id)spheroidAtPoint:(id)a3 scene:(NUNIViewport)a4 viewport:;
- (int)classifyObjectBoundingBoxVersusFrustum:(NUNICalliopeRenderer *)self max:(SEL)a2 withState:;
- (unint64_t)_computePatchSpheroidLodWithPositionInViewSpace:(NUNICalliopeRenderer *)self radius:(SEL)a2 drawableSize:;
- (void)_computeBloomChainTextures:(id)a3;
- (void)_renderLocationDot:(const NUNISpheroidStructure *)a3 scene:(const NUNISceneStructure *)a4 uniPtr:(NUNICalliopeRenderUniforms *)a5 viewport:(NUNIViewport)a6 renderEncoder:(id)a7;
- (void)_renderOffscreenBackgroundWithRenderEncoder:(id)a3 frameBufferIndex:(unint64_t)a4;
- (void)_renderOffscreenBloomTextureUsingTileShaderWithViewport:(NUNIViewport)a3 renderEncoder:(id)a4;
- (void)_renderOffscreenBloomTextureWithViewport:(NUNIViewport)a3 sceneTexture:(id)a4 commandBuffer:(id)a5;
- (void)_renderOffscreenPostWithScene:(const NUNISceneStructure *)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6;
- (void)_renderOffscreenSceneWithScene:(const NUNISceneStructure *)a3 spheroids:(id)a4 viewport:(NUNIViewport)a5 commandBuffer:(id)a6 frameBufferIndex:(unint64_t)a7 drawableTexture:(id)a8;
- (void)_renderPatchSpheroid:(const NUNISpheroidStructure *)a3 frustumCullingState:(id *)a4 drawableSize:frameBufferIndex:renderEncoder:;
- (void)_renderSaturnRings:(double)a3 frameBufferIndex:(__n128)a4 renderEncoder:(__n128)a5 forwardAngle:(__n128)a6 position:(__n128)a7 isRotated:(float)a8 rotationMatrix:(float)a9 scale:(uint64_t)a10 equatorRotation:(_OWORD *)a11;
- (void)_renderSpriteSpheroid:(const NUNISpheroidStructure *)a3 frameBufferIndex:(unint64_t)a4 renderEncoder:(id)a5;
- (void)_renderSunSprite:(NUNICalliopeRenderUniforms *)a3 frameBufferIndex:(unint64_t)a4 renderEncoder:(id)a5 position:(float)a6 scale:(float)a7 opacity:;
- (void)_setupBloomChainWithViewport:(NUNIViewport)a3 bloomTexture:(id)a4;
- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3;
- (void)_updateStateWithScene:(const NUNISceneStructure *)a3 viewport:(NUNIViewport)a4;
- (void)_updateTextureLODsForPatchSpheroid:(NUNICalliopeRenderer *)self uvRate:(SEL)a2 drawableSize:(unint64_t)a3;
- (void)dealloc;
- (void)prepareObjectSpaceFrustumWithTransform:(id *)a3 withState:(id *)a4;
- (void)prepareWorldSpaceFrustumWithTransform:(id *)a3 withState:(id *)a4;
- (void)purgeUnusedWithScene:(id)a3;
- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5;
- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6;
- (void)setContentMaskLayer:(id)a3;
- (void)setRendererOptions:(id)a3;
@end

@implementation NUNICalliopeRenderer

- (NUNICalliopeRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NUNICalliopeRenderer;
  v9 = [(NUNIRenderer *)&v19 initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:a5];
  if (v9)
  {
    uint64_t v10 = +[NUNICalliopeResourceManager sharedInstanceWithDisplayPixelFormat:a3];
    resourceManager = v9->_resourceManager;
    v9->_resourceManager = (NUNICalliopeResourceManager *)v10;

    [(NUNICalliopeResourceManager *)v9->_resourceManager addClient];
    uint64_t v12 = [MEMORY[0x263F32148] sharedDevice];
    device = v9->_device;
    v9->_device = (MTLDevice *)v12;

    uint64_t v14 = [(NUNICalliopeResourceManager *)v9->_resourceManager textureGroupWithSuffix:v8];
    textureGroup = v9->_textureGroup;
    v9->_textureGroup = (NUNICalliopeTextureGroup *)v14;

    [(MTLDevice *)v9->_device supportsFamily:1004];
    v9->_bloomDownsampleUsingTileShaders = 0;
    v9->_bloomEnabled = [(MTLDevice *)v9->_device supportsFamily:1004];
    v16 = (void *)MGGetStringAnswer();
    v9->_useLowerResolutionTextures = [v16 isEqualToString:@"t8010"];
    v17 = [MEMORY[0x263F82670] currentDevice];
    v9->_isPhone = [v17 userInterfaceIdiom] == 0;
  }
  return v9;
}

- (void)dealloc
{
  [(NUNICalliopeResourceManager *)self->_resourceManager removeClient];
  v3.receiver = self;
  v3.super_class = (Class)NUNICalliopeRenderer;
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
  uint64_t v4 = *(void *)([a3 structure] + 56);
  id v11 = [MEMORY[0x263F32160] sharedInstance];
  v5 = [MEMORY[0x263F32178] nullTexture2D];
  for (uint64_t i = 0; i != 24; ++i)
  {
    if (v4 != i)
    {
      v7 = [(NUNICalliopeTextureGroup *)self->_textureGroup gradients];
      id v8 = [v7 objectAtIndexedSubscript:i];

      if (v8 != v5)
      {
        v9 = [v8 atlas];
        uint64_t v10 = [v9 uuid];
        [v11 purge:v10];
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

- (void)_updateStateWithScene:(const NUNISceneStructure *)a3 viewport:(NUNIViewport)a4
{
  int width = a4.width;
  int height = a4.height;
  id v8 = [MEMORY[0x263F32160] sharedInstance];
  [v8 updateTextureStreaming];

  long long v76 = *(_OWORD *)&a3->var0;
  float32x4_t v67 = *(float32x4_t *)&a3->var3;
  _Q0 = vsubq_f32(v67, *(float32x4_t *)&a3->var0);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  int32x4_t v16 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  int32x4_t v17 = *(int32x4_t *)&a3->var5;
  float32x4_t v18 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v16, (int8x16_t)v16, 0xCuLL), (int8x16_t)v16, 8uLL);
  _Q3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL);
  float32x4_t v19 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v16, v16), (int8x16_t)v16, 0xCuLL);
  _Q2 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL), vnegq_f32(v19)), _Q3, v18);
  _Q3.i32[0] = _Q2.i32[2];
  __asm { FMLA            S4, S3, V2.S[2] }
  _Q3.f32[0] = sqrtf(_S4);
  if (_Q3.f32[0] < 0.00001)
  {
    _Q2 = vmlaq_f32(vmulq_f32(v19, (float32x4_t)xmmword_21E8F22D0), (float32x4_t)xmmword_21E8F1C00, v18);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v19, (float32x4_t)xmmword_21E8F22E0), (float32x4_t)xmmword_21E8F22F0, v18);
      _Q3.i64[0] = _Q2.u32[2];
      __asm { FMLA            S4, S3, V2.S[2] }
      _Q3.f32[0] = sqrtf(_S4);
    }
  }
  float var1 = a3->var8.var0.var1;
  int32x4_t v26 = (int32x4_t)vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32(v18, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL))), v19, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v26, (int8x16_t)v26, 0xCuLL), (int8x16_t)v26, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v73 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
  int32x4_t v74 = v26;
  float v30 = (float)width / (float)height;
  float32x4_t v75 = (float32x4_t)v16;
  unint64_t var4 = a3[1].var4;
  if (v30 >= 1.0)
  {
    float v32 = 0.34907;
  }
  else
  {
    float v31 = atanf(0.17633 / v30);
    float v32 = v31 + v31;
  }
  *(__n64 *)v33.f32 = UMFloat4x4MakeLookAt(*(double *)v74.i64, v73.f32[0]);
  simd_float4 v79 = v34;
  simd_float4 v80 = v33;
  simd_float4 v77 = v36;
  simd_float4 v78 = v35;
  if (fabsf(var1) > 0.00001)
  {
    __float2 v37 = __sincosf_stret(var1 * 0.5);
    float32x2_t v38 = vmul_n_f32(*(float32x2_t *)v75.f32, v37.__sinval);
    *(__n64 *)v39.f32 = UMFloat4x4Make(v38.f32[0], v38.f32[1], vmuls_lane_f32(v37.__sinval, v75, 2), v37.__cosval);
    v85.columns[0] = v39;
    v85.columns[1] = v40;
    v85.columns[2] = v41;
    v85.columns[3] = v42;
    v81.columns[1] = v79;
    v81.columns[0] = v80;
    v81.columns[3] = v77;
    v81.columns[2] = v78;
    *(double *)v43.i64 = UMMul(v81, v85);
    simd_float4 v79 = v44;
    simd_float4 v80 = v43;
    simd_float4 v77 = v46;
    simd_float4 v78 = v45;
  }
  *(double *)v47.i64 = UMFloat4x4MakeTranslate();
  v86.columns[0] = v47;
  v86.columns[1] = v48;
  v86.columns[2] = v49;
  v86.columns[3] = v50;
  v82.columns[1] = v79;
  v82.columns[0] = v80;
  v82.columns[3] = v77;
  v82.columns[2] = v78;
  *(double *)v51.i64 = UMMul(v82, v86);
  simd_float4 v71 = v52;
  simd_float4 v72 = v51;
  simd_float4 v69 = v54;
  simd_float4 v70 = v53;
  v55.f32[0] = UMFloat4x4MakePerspective((float)(v32 * 180.0) / 3.1416, (float)width / (float)height, 0.001, 5.0);
  simd_float4 v65 = v56;
  simd_float4 v66 = v55;
  simd_float4 v63 = v58;
  simd_float4 v64 = v57;
  *(double *)v83.columns[0].i64 = UMFloat4x4MakeTranslate();
  v87.columns[1] = v65;
  v87.columns[0] = v66;
  v87.columns[3] = v63;
  v87.columns[2] = v64;
  *(double *)v84.columns[0].i64 = UMMul(v83, v87);
  v88.columns[1] = v71;
  v88.columns[0] = v72;
  v88.columns[3] = v69;
  v88.columns[2] = v70;
  *(double *)&long long v59 = UMMul(v84, v88);
  self->_state.viewport.int width = width;
  self->_state.viewport.int height = height;
  self->_state.cameraRoll = var1;
  self->_state.aspect = v30;
  self->_state.fovY = v32;
  *(_DWORD *)self->_anon_304 = 0;
  *(void *)&self->_anon_304[4] = var4;
  *(_OWORD *)&self->_anon_304[12] = v76;
  *(float32x4_t *)&self->_anon_304[28] = v67;
  *(float32x4_t *)&self->_anon_304[44] = v73;
  *(int32x4_t *)&self->_anon_304[60] = v74;
  *(float32x4_t *)&self->_anon_304[76] = v75;
  *(simd_float4 *)&self->_anon_304[92] = v80;
  *(simd_float4 *)&self->_anon_304[108] = v79;
  *(simd_float4 *)&self->_anon_304[124] = v78;
  *(simd_float4 *)&self->_anon_304[140] = v77;
  *(simd_float4 *)&self->_anon_304[156] = v72;
  *(simd_float4 *)&self->_anon_304[172] = v71;
  *(simd_float4 *)&self->_anon_304[188] = v70;
  *(simd_float4 *)&self->_anon_304[204] = v69;
  *(_OWORD *)&self->_anon_304[220] = v59;
  *(_OWORD *)&self->_anon_304[236] = v60;
  *(_OWORD *)&self->_anon_304[252] = v61;
  *(_OWORD *)&self->_anon_304[268] = v62;
}

- (unint64_t)_computePatchSpheroidLodWithPositionInViewSpace:(NUNICalliopeRenderer *)self radius:(SEL)a2 drawableSize:
{
  return (unint64_t)fminf(fmaxf(log2f(fabsf((float)((float)((float)(1024.0 / fmaxf(*(float *)&v4, *((float *)&v4 + 1))) / v3)* *(float *)(v2 + 8))/ 10.0)), 0.0), 1024.0);
}

- (void)_updateTextureLODsForPatchSpheroid:(NUNICalliopeRenderer *)self uvRate:(SEL)a2 drawableSize:(unint64_t)a3
{
  float32x2_t v7 = vmul_f32(*v3, v4);
  float v8 = fminf(v7.f32[0], v7.f32[1]);
  if (self->_isPhone) {
    v9 = (char *)&_NUNIAtlasSizes_iphone;
  }
  else {
    v9 = (char *)&_NUNIAtlasSizes_ipad;
  }
  uint64_t v10 = &_NUNIAtlasMipCounts_iphone;
  float v11 = 1.0 / v8;
  if (!self->_isPhone) {
    uint64_t v10 = &_NUNIAtlasMipCounts_ipad;
  }
  v5.i32[0] = v10[a3];
  uint16x4_t v12 = (uint16x4_t)vmovl_u8((uint8x8_t)v5).u64[0];
  uint16x4_t v29 = v12;
  v5.i32[0] = 1067030938;
  if (!self->_useLowerResolutionTextures) {
    *(float *)v5.i32 = -0.5;
  }
  float32x4_t v27 = (float32x4_t)vdupq_lane_s32(v5, 0);
  int32x4_t v28 = (int32x4_t)vmovl_u16(v12);
  int32x4_t v33 = (int32x4_t)vabsq_f32(vmulq_n_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)&v9[8 * a3])), v11));
  float v30 = log2f(*(float *)&v33.i32[1]);
  v13.f32[0] = log2f(*(float *)v33.i32);
  v13.f32[1] = v30;
  float32x4_t v31 = v13;
  float v14 = log2f(*(float *)&v33.i32[2]);
  float32x4_t v15 = v31;
  v15.f32[2] = v14;
  float32x4_t v32 = v15;
  float v16 = log2f(*(float *)&v33.i32[3]);
  float32x4_t v17 = v32;
  v17.f32[3] = v16;
  int32x4_t v18 = vcvtq_s32_f32(vmaxnmq_f32(vaddq_f32(v27, v17), (float32x4_t)0));
  v19.i64[0] = -1;
  v19.i64[1] = -1;
  v17.i64[0] = 0x400000004;
  v17.i64[1] = 0x400000004;
  int32x4_t v34 = vminq_s32((int32x4_t)vbslq_s8((int8x16_t)vcgtq_s32(v28, v18), (int8x16_t)v18, (int8x16_t)vaddw_u16(v19, v29)), (int32x4_t)v17);
  id v20 = [(NUNIRenderer *)self textureSuffix];
  for (uint64_t i = 0; i != 24; ++i)
  {
    v22 = -[NUNICalliopeResourceManager patchTextureGroupForSpheroid:index:suffix:](self->_resourceManager, "patchTextureGroupForSpheroid:index:suffix:", a3, i, v20, *(_OWORD *)&v27, *(_OWORD *)&v28);
    v23 = [v22->var0 atlas];
    [v23 setMaxMipmapLevelsToDrop:v34.i32[0]];

    v24 = [v22->var1 atlas];
    [v24 setMaxMipmapLevelsToDrop:v34.i32[1]];

    v25 = [v22->var2 atlas];
    [v25 setMaxMipmapLevelsToDrop:v34.i32[2]];

    int32x4_t v26 = [v22->var3 atlas];
    [v26 setMaxMipmapLevelsToDrop:v34.i32[3]];
  }
}

- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3
{
  int width = a3.width;
  uint64_t v35 = *MEMORY[0x263EF8340];
  int height = a3.height;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * self->_frame, 2) <= 0x444444444444444uLL)
  {
    unsigned int v6 = [(NUNIRendererOptions *)self->_rendererOptions changeSequence];
    if (v6 != self->_rendererOptionsChangeSequence)
    {
      int v31 = height;
      uint64_t v7 = 0;
      self->_rendererOptionsChangeSequence = v6;
      do
      {
        float v8 = _updateBaseUniformsForViewport__optionKeys[v7];
        v9 = [(NUNIRendererOptions *)self->_rendererOptions fractionValueForOption:v8];
        uint64_t v10 = v9;
        if (v9)
        {
          [v9 doubleValue];
          __asm { FCVT            H0, D0 }
          if (*(short float *)&self->_anon_5c6[2 * v7 + 1] != *(short float *)&_D0)
          {
            float v16 = NUNILoggingObjectForDomain(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v10;
              _os_log_debug_impl(&dword_21E8AA000, v16, OS_LOG_TYPE_DEBUG, "Overriding option %{public}@ with value %{public}@", buf, 0x16u);
            }

            [v10 doubleValue];
            __asm { FCVT            H0, D0 }
            *(_WORD *)&self->_anon_5c6[2 * v7 + 1] = _D0;
          }
        }

        ++v7;
      }
      while (v7 != 35);
      resourceManager = self->_resourceManager;
      long long v19 = *(_OWORD *)&self->_anon_5c6[49];
      long long v33 = *(_OWORD *)&self->_anon_5c6[33];
      *(_OWORD *)int32x4_t v34 = v19;
      *(void *)&v34[14] = *(void *)&self->_anon_5c6[63];
      long long v20 = *(_OWORD *)&self->_anon_5c6[17];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_5c6[1];
      *(_OWORD *)&buf[16] = v20;
      [(NUNICalliopeResourceManager *)resourceManager setPipelineConstants:buf];
      int height = v31;
    }
  }
  uint64_t v21 = *(void *)&self->_anon_304[4];
  float v22 = (float)width;
  __asm { FMOV            V4.2S, #1.0 }
  HIDWORD(v24) = HIDWORD(_D4);
  if (height > width)
  {
    *((float *)&_D4 + 1) = (float)height / (float)width;
    double v25 = _D4;
  }
  else
  {
    float v22 = (float)height;
    *(float *)&double v24 = (float)width / (float)height;
    double v25 = v24;
  }
  _H4 = *(_WORD *)&self->_anon_5c6[11];
  __asm { FCVT            S4, H4 }
  float v28 = (float)(_S4 * 5.0) + 1.0;
  LOWORD(_S4) = *(_WORD *)&self->_anon_5c6[13];
  __asm { FCVT            S4, H4 }
  float v30 = _S4 * -10.0;
  *(_OWORD *)&self->_baseUniforms.vsh.{?= = 0u;
  *(_OWORD *)&self->_anon_421[15] = 0u;
  *(_OWORD *)&self->_anon_421[31] = 0u;
  *(void *)&self->_anon_421[47] = v21;
  *(double *)&self->_anon_421[55] = v25;
  *(float *)&self->_anon_421[63] = 1.0 / v22;
  *(_OWORD *)&self->_anon_421[67] = 0u;
  *(_OWORD *)&self->_anon_421[83] = 0u;
  *(_OWORD *)&self->_anon_421[99] = 0u;
  *(_OWORD *)&self->_anon_421[115] = 0u;
  *(_OWORD *)&self->_anon_421[131] = 0u;
  *(_OWORD *)&self->_anon_421[147] = 0u;
  *(void *)&self->_anon_421[163] = 0x3D4CCCCD3E31D0D4;
  *(_DWORD *)&self->_anon_421[171] = 0;
  *(float *)&self->_anon_421[175] = v30;
  *(float *)&self->_anon_421[179] = (float)((float)(-1.0 / v28) * v30) - v30;
  *(float *)&self->_anon_421[183] = v28;
  *(void *)&self->_anon_421[195] = 0;
  *(void *)&self->_anon_421[187] = 0;
  *(_DWORD *)&self->_anon_421[203] = 0;
}

- (id)getUniformsBufferForFrameBufferIndex:(unint64_t)a3 pContents:(NUNICalliopeRenderUniforms *)a4 pOffset:(unint64_t *)a5
{
  v9 = &self->_renderUniformsBuffersCounts[a3];
  uint64_t current = v9->current;
  int capacity = v9->capacity;
  p_int capacity = &v9->capacity;
  int v11 = capacity;
  self->_renderUniformsBuffersCounts[a3].uint64_t current = current + 1;
  if ((int)current >= capacity)
  {
    if (v11 <= 10) {
      int v11 = 10;
    }
    int v15 = v11 + 2;
    int *p_capacity = v15;
    float v14 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:(v15 << 8) options:1];
    objc_storeStrong((id *)&self->_renderUniformsBuffers[a3], v14);
  }
  else
  {
    float v14 = self->_renderUniformsBuffers[a3];
  }
  float v16 = v14;
  uint64_t v17 = [(MTLBuffer *)v16 contents];
  if (v17)
  {
    *a4 = (NUNICalliopeRenderUniforms *)(v17 + (current << 8));
    *a5 = current << 8;
    int32x4_t v18 = v16;
  }
  else
  {
    long long v19 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](v19);
    }

    int32x4_t v18 = 0;
    int *p_capacity = 0;
    *a4 = &self->_dummyUniforms;
    *a5 = 0;
  }

  return v18;
}

- (void)_renderOffscreenBackgroundWithRenderEncoder:(id)a3 frameBufferIndex:(unint64_t)a4
{
  uint64_t v31 = 0;
  float32x4_t v32 = 0;
  id v6 = a3;
  uint64_t v7 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:a4 pContents:&v32 pOffset:&v31];
  float v8 = v32;
  *float32x4_t v32 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  long long v9 = *(_OWORD *)&self->_anon_421[63];
  long long v11 = *(_OWORD *)&self->_anon_421[15];
  long long v10 = *(_OWORD *)&self->_anon_421[31];
  v8[3] = *(_OWORD *)&self->_anon_421[47];
  v8[4] = v9;
  v8[1] = v11;
  v8[2] = v10;
  long long v12 = *(_OWORD *)&self->_anon_421[127];
  long long v14 = *(_OWORD *)&self->_anon_421[79];
  long long v13 = *(_OWORD *)&self->_anon_421[95];
  v8[7] = *(_OWORD *)&self->_anon_421[111];
  v8[8] = v12;
  v8[5] = v14;
  v8[6] = v13;
  long long v15 = *(_OWORD *)&self->_anon_421[191];
  long long v17 = *(_OWORD *)&self->_anon_421[143];
  long long v16 = *(_OWORD *)&self->_anon_421[159];
  v8[11] = *(_OWORD *)&self->_anon_421[175];
  v8[12] = v15;
  v8[9] = v17;
  v8[10] = v16;
  *(double *)v18.i64 = UMFloat4x4MakeTranslate();
  v33.columns[0] = v18;
  v33.columns[1] = v19;
  v33.columns[2] = v20;
  v33.columns[3] = v21;
  *(double *)&long long v22 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v33);
  v8[6] = v22;
  v8[7] = v23;
  v8[8] = v24;
  v8[9] = v25;
  [v6 setVertexBuffer:v7 offset:v31 atIndex:1];
  int32x4_t v26 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForStarfield];
  [v6 setLabel:@"Καλλιόπη Starfield"];
  [v6 setRenderPipelineState:v26];
  float32x4_t v27 = [(NUNICalliopeResourceManager *)self->_resourceManager starfieldVerticesBuffer];
  [v6 setVertexBuffer:v27 offset:0 atIndex:0];

  float v28 = [(NUNICalliopeResourceManager *)self->_resourceManager starfieldIndicesBuffer];
  [v6 drawIndexedPrimitives:3 indexCount:384150 indexType:0 indexBuffer:v28 indexBufferOffset:0 instanceCount:1 baseVertex:0 baseInstance:0];

  uint16x4_t v29 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForStar];
  [v6 setLabel:@"Καλλιόπη Star"];
  [v6 setRenderPipelineState:v29];
  float v30 = [(NUNICalliopeResourceManager *)self->_resourceManager starVerticesBuffer];
  [v6 setVertexBuffer:v30 offset:0 atIndex:0];

  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4 instanceCount:702 baseInstance:0];
}

- (void)_renderSunSprite:(NUNICalliopeRenderUniforms *)a3 frameBufferIndex:(unint64_t)a4 renderEncoder:(id)a5 position:(float)a6 scale:(float)a7 opacity:
{
  float v8 = v7;
  float32x4_t v67 = *(float32x4_t *)&a6;
  id v12 = a5;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  long long v13 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:a4 pContents:&v70 pOffset:&v69];
  [v12 setVertexBuffer:v13 offset:v69 atIndex:1];
  [v12 setFragmentBuffer:v13 offset:v69 atIndex:0];
  long long v14 = (_OWORD *)v70;
  *(_OWORD *)uint64_t v70 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  long long v15 = *(_OWORD *)&self->_anon_421[63];
  long long v17 = *(_OWORD *)&self->_anon_421[15];
  long long v16 = *(_OWORD *)&self->_anon_421[31];
  v14[3] = *(_OWORD *)&self->_anon_421[47];
  v14[4] = v15;
  v14[1] = v17;
  v14[2] = v16;
  long long v18 = *(_OWORD *)&self->_anon_421[127];
  long long v20 = *(_OWORD *)&self->_anon_421[79];
  long long v19 = *(_OWORD *)&self->_anon_421[95];
  v14[7] = *(_OWORD *)&self->_anon_421[111];
  v14[8] = v18;
  v14[5] = v20;
  v14[6] = v19;
  long long v21 = *(_OWORD *)&self->_anon_421[191];
  long long v23 = *(_OWORD *)&self->_anon_421[143];
  long long v22 = *(_OWORD *)&self->_anon_421[159];
  v14[11] = *(_OWORD *)&self->_anon_421[175];
  v14[12] = v21;
  v14[9] = v23;
  v14[10] = v22;
  long long v24 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForSpheroid:14 layer:0 config:0];
  if (v24)
  {
    p_state = &self->_state;
    [v12 setLabel:@"Καλλιόπη Sun Sprite"];
    [v12 setRenderPipelineState:v24];
    int32x4_t v26 = [(NUNICalliopeResourceManager *)self->_resourceManager discVerticesBuffer];
    [v12 setVertexBuffer:v26 offset:0 atIndex:0];

    *(_OWORD *)uint64_t v70 = xmmword_21E8F2300;
    _Q0 = vsubq_f32(*(float32x4_t *)&self->_anon_304[12], v67);
    float32x4_t v28 = v67;
    _Q1 = vmulq_f32(_Q0, _Q0);
    _S2 = _Q0.i32[2];
    __asm { FMLA            S1, S2, V0.S[2] }
    _Q1.f32[0] = sqrtf(_Q1.f32[0]);
    int32x4_t v35 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    float32x4_t v36 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v35, v35), (int8x16_t)v35, 0xCuLL);
    float32x4_t v37 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35, (int8x16_t)v35, 0xCuLL), (int8x16_t)v35, 8uLL);
    int32x4_t v38 = (int32x4_t)vmlaq_f32(vmulq_f32(v37, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&p_state[3].viewport.height, *(int32x4_t *)&p_state[3].viewport.height), *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL))), v36, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&p_state[3].viewport.height, *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL), *(int8x16_t *)&p_state[3].viewport.height, 8uLL));
    float32x4_t v39 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v38, (int8x16_t)v38, 0xCuLL), (int8x16_t)v38, 8uLL), vnegq_f32(v36)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v38, v38), (int8x16_t)v38, 0xCuLL), v37);
    v38.i32[3] = 0;
    v39.i32[3] = 0;
    simd_float4 v65 = (simd_float4)v39;
    simd_float4 v66 = (simd_float4)v38;
    v35.i32[3] = 0;
    simd_float4 v64 = (simd_float4)v35;
    v28.i32[3] = 1.0;
    float32x4_t v68 = v28;
    UMFloat4x4MakeScale(a7 + a7);
    v72.columns[0] = v40;
    v72.columns[1] = v41;
    v72.columns[2] = v42;
    v72.columns[3] = v43;
    v71.columns[1] = v65;
    v71.columns[0] = v66;
    v71.columns[2] = v64;
    v71.columns[3] = (simd_float4)v68;
    *(double *)v44.i64 = UMMul(v71, v72);
    v73.columns[0] = v44;
    v73.columns[1] = v45;
    v73.columns[2] = v46;
    v73.columns[3] = v47;
    *(double *)&long long v48 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v73);
    simd_float4 v49 = (_OWORD *)v70;
    *(_OWORD *)(v70 + 96) = v48;
    v49[7] = v50;
    v49[8] = v51;
    v49[9] = v52;
    double v53 = UMMul(*(float32x4_t *)&self->_anon_304[220], *(float32x4_t *)&self->_anon_304[236], *(float32x4_t *)&self->_anon_304[252], *(float32x4_t *)&self->_anon_304[268], v68);
    float v55 = *(float *)&v53 / v54;
    float v56 = *((float *)&v53 + 1) / v54;
    __float2 v57 = __sincosf_stret(self->_state.cameraRoll);
    float v58 = (float)(v56 * v57.__cosval) - (float)(v57.__sinval * v55);
    float v59 = fminf(fmaxf((float)(v58 + -0.8) * 10.0, 0.0), 1.0);
    float v60 = (float)(1.0 - fabsf((float)(v55 * v57.__cosval) - (float)(v57.__sinval * v56)))
        * fminf(fmaxf((float)(v58 + -0.3) * 5.0, 0.0), 1.0);
    if (v59 > v60) {
      float v60 = v59;
    }
    *(float *)(v70 + 160) = (float)((float)(v60 * -0.8) + 1.0) * v8;
    long long v61 = [(NUNICalliopeTextureGroup *)self->_textureGroup gradients];
    long long v62 = [v61 objectAtIndexedSubscript:14];

    simd_float4 v63 = [v62 atlas];
    [v63 bind:v12 slot:5];

    [v12 drawPrimitives:4 vertexStart:0 vertexCount:16];
  }
}

- (void)_renderSaturnRings:(double)a3 frameBufferIndex:(__n128)a4 renderEncoder:(__n128)a5 forwardAngle:(__n128)a6 position:(__n128)a7 isRotated:(float)a8 rotationMatrix:(float)a9 scale:(uint64_t)a10 equatorRotation:(_OWORD *)a11
{
  *(__n128 *)&v62[32] = a6;
  *(__n128 *)&v62[48] = a7;
  *(__n128 *)long long v62 = a4;
  *(__n128 *)&v62[16] = a5;
  id v21 = a13;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  long long v22 = [(id)a1 getUniformsBufferForFrameBufferIndex:a12 pContents:&v72 pOffset:&v71];
  [v21 setVertexBuffer:v22 offset:v71 atIndex:1];
  [v21 setFragmentBuffer:v22 offset:v71 atIndex:0];
  long long v23 = (_OWORD *)v72;
  *(_OWORD *)uint64_t v72 = *a11;
  long long v24 = a11[4];
  long long v26 = a11[1];
  long long v25 = a11[2];
  v23[3] = a11[3];
  v23[4] = v24;
  v23[1] = v26;
  v23[2] = v25;
  long long v27 = a11[8];
  long long v29 = a11[5];
  long long v28 = a11[6];
  v23[7] = a11[7];
  v23[8] = v27;
  v23[5] = v29;
  v23[6] = v28;
  long long v30 = a11[12];
  long long v32 = a11[9];
  long long v31 = a11[10];
  v23[11] = a11[11];
  v23[12] = v30;
  v23[9] = v32;
  v23[10] = v31;
  simd_float4x4 v33 = [*(id *)(a1 + 48) renderOffscreenPipelineForSaturnRing];
  if (v33)
  {
    [v21 setRenderPipelineState:v33];
    UMFloat4x4MakeScale(a8 * 1.2275);
    if (a14)
    {
      *(double *)v35.i64 = UMMul(v34, *(simd_float4x4 *)v62);
      simd_float4 v67 = v36;
      simd_float4 v69 = v35;
      simd_float4 v63 = v38;
      simd_float4 v65 = v37;
      a2 = a2 - a9;
    }
    else
    {
      simd_float4 v67 = v34.columns[1];
      simd_float4 v69 = v34.columns[0];
      simd_float4 v63 = v34.columns[3];
      simd_float4 v65 = v34.columns[2];
    }
    *(double *)v39.i64 = UMFloat4x4MakeRotateZ(a2);
    v75.columns[0] = v39;
    v75.columns[1] = v40;
    v75.columns[2] = v41;
    v75.columns[3] = v42;
    v73.columns[1] = v67;
    v73.columns[0] = v69;
    v73.columns[3] = v63;
    v73.columns[2] = v65;
    *(double *)v43.i64 = UMMul(v73, v75);
    simd_float4 v68 = v44;
    simd_float4 v70 = v43;
    simd_float4 v64 = v46;
    simd_float4 v66 = v45;
    *(double *)v74.columns[0].i64 = UMFloat4x4MakeTranslate();
    v76.columns[1] = v68;
    v76.columns[0] = v70;
    v76.columns[3] = v64;
    v76.columns[2] = v66;
    *(double *)v47.i64 = UMMul(v74, v76);
    v77.columns[0] = v47;
    v77.columns[1] = v48;
    v77.columns[2] = v49;
    v77.columns[3] = v50;
    long long v51 = (_OWORD *)v72;
    *(double *)&long long v52 = UMMul(*(simd_float4x4 *)(a1 + 992), v77);
    v51[6] = v52;
    v51[7] = v53;
    v51[8] = v54;
    v51[9] = v55;
    *(double *)v56.i64 = UMFloat4x4MakeRotateZ(a2);
    *(int64x2_t *)(v72 + 32) = vzip1q_s64(v56, v57);
    [v21 setCullMode:0];
    float v58 = [*(id *)(a1 + 48) saturnRingVerticesBuffer];
    [v21 setVertexBuffer:v58 offset:0 atIndex:0];

    float v59 = [*(id *)(a1 + 56) gradients];
    float v60 = [v59 objectAtIndexedSubscript:7];

    long long v61 = [v60 atlas];
    [v61 bind:v21 slot:1];

    [v21 drawPrimitives:4 vertexStart:0 vertexCount:26];
  }
}

- (void)_renderPatchSpheroid:(const NUNISpheroidStructure *)a3 frustumCullingState:(id *)a4 drawableSize:frameBufferIndex:renderEncoder:
{
  uint64_t v7 = v4;
  *(void *)&long long v249 = v6;
  v246 = a4;
  v257[3] = *MEMORY[0x263EF8340];
  id v10 = v5;
  uint64_t v254 = 0;
  uint64_t v255 = 0;
  long long v11 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:v7 pContents:&v255 pOffset:&v254];
  uint64_t v12 = v255;
  *(_OWORD *)uint64_t v255 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  long long v13 = *(_OWORD *)&self->_anon_421[63];
  long long v15 = *(_OWORD *)&self->_anon_421[15];
  long long v14 = *(_OWORD *)&self->_anon_421[31];
  *(_OWORD *)(v12 + 48) = *(_OWORD *)&self->_anon_421[47];
  *(_OWORD *)(v12 + 64) = v13;
  *(_OWORD *)(v12 + 16) = v15;
  *(_OWORD *)(v12 + 32) = v14;
  long long v16 = *(_OWORD *)&self->_anon_421[127];
  long long v18 = *(_OWORD *)&self->_anon_421[79];
  long long v17 = *(_OWORD *)&self->_anon_421[95];
  *(_OWORD *)(v12 + 112) = *(_OWORD *)&self->_anon_421[111];
  *(_OWORD *)(v12 + 128) = v16;
  *(_OWORD *)(v12 + 80) = v18;
  *(_OWORD *)(v12 + 96) = v17;
  long long v19 = *(_OWORD *)&self->_anon_421[191];
  long long v21 = *(_OWORD *)&self->_anon_421[143];
  long long v20 = *(_OWORD *)&self->_anon_421[159];
  *(_OWORD *)(v12 + 176) = *(_OWORD *)&self->_anon_421[175];
  *(_OWORD *)(v12 + 192) = v19;
  *(_OWORD *)(v12 + 144) = v21;
  *(_OWORD *)(v12 + 160) = v20;
  unint64_t type = a3->type;
  if (a3->type == 3)
  {
    _H0 = *(_WORD *)&self->_anon_5c6[47];
    __asm { FCVT            S0, H0 }
    float v28 = a3[1].equatorRotation * _S0;
    *(float *)(v12 + 188) = v28;
    BOOL v29 = v28 > 0.00001;
    v247.i32[0] = v28 > 0.00001;
  }
  else
  {
    BOOL v29 = 0;
    v247.i32[0] = 0;
  }
  long long v30 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForSpheroid:type layer:0 config:v29];
  if (v30)
  {
    [v10 pushDebugGroup:@"Spheroid"];
    *(float *)(v255 + 160) = a3[1].angle;
    float equatorRotation = a3->equatorRotation;
    float v32 = a3[2].equatorRotation * a3[2].opacity;
    float v33 = v32 * 0.98;
    UMFloat4x4MakeScale(v33);
    v253.columns[0] = v34;
    v253.columns[1] = v35;
    v253.columns[2] = v36;
    v253.columns[3] = v37;
    float32x4_t v245 = *(float32x4_t *)&a3[3].type;
    float32x4_t v242 = *(float32x4_t *)&self->_anon_304[12];
    v244.columns[2].i32[0] = *(void *)&a3[3].angle;
    __float2 v38 = __sincosf_stret(COERCE_FLOAT(HIDWORD(*(void *)&a3[3].angle)));
    v248.i32[0] = LODWORD(v38.__cosval);
    v244.columns[3].i32[0] = *(void *)&v38;
    __float2 v39 = __sincosf_stret(v244.columns[2].f32[0]);
    *(float32x2_t *)v40.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v39.__sinval), LODWORD(v39.__cosval)), v244.columns[3].f32[0]);
    v40.i32[2] = v248.i32[0];
    simd_quatf v41 = *(simd_quatf *)&a3[1].type;
    float32x4_t v42 = vmulq_f32((float32x4_t)v41, (float32x4_t)v41);
    v248.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0];
    float32x4_t v241 = v40;
    if (v248.f32[0] <= 0.00001)
    {
      v244.columns[3] = 0u;
      if (equatorRotation == 0.0)
      {
        unsigned int v237 = 0;
        memset(&v244, 0, 48);
        float32x4_t v248 = v40;
LABEL_20:
        double v234 = *(double *)v245.i64;
        *(double *)v258.columns[0].i64 = UMFloat4x4MakeTranslate();
        simd_float4 v231 = v258.columns[1];
        simd_float4 v232 = v258.columns[0];
        simd_float4 v229 = v258.columns[3];
        simd_float4 v230 = v258.columns[2];
        *(double *)v80.i64 = UMMul(v258, v253);
        v262.columns[0] = v80;
        v262.columns[1] = v81;
        v262.columns[2] = v82;
        v262.columns[3] = v83;
        v253.columns[0] = v80;
        v253.columns[1] = v81;
        v253.columns[2] = v82;
        v253.columns[3] = v83;
        simd_float4x4 v84 = (_OWORD *)v255;
        *(double *)&long long v85 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v262);
        v84[6] = v85;
        v84[7] = v86;
        v84[8] = v87;
        v84[9] = v88;
        simd_float4x4 v259 = __invert_f4(v253);
        float32x4_t v89 = v242;
        v89.i32[3] = 1.0;
        simd_float4x4 v235 = v259;
        float32x4_t v243 = v89;
        *(double *)v90.i64 = UMMul((float32x4_t)v259.columns[0], (float32x4_t)v259.columns[1], (float32x4_t)v259.columns[2], (float32x4_t)v259.columns[3], v89);
        v91 = (float32x4_t *)v255;
        *(float32x4_t *)uint64_t v255 = v248;
        v91[1] = v90;
        uint64_t v238 = v7;
        float32x4_t v236 = v90;
        if (type == 3)
        {
          float32x4_t v92 = vmulq_f32(v241, *(float32x4_t *)&self->_anon_304[76]);
          float v93 = 0.0;
          if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))).f32[0] > 0.0)
          {
            v94.i64[0] = 0x4000000040000000;
            v94.i64[1] = 0x4000000040000000;
            v248.i64[0] = vmlaq_f32(*(float32x4_t *)&a3[3].type, v94, v241).u64[0];
            [v10 setLabel:@"Καλλιόπη Cinematic Sun"];
            *(float *)&double v95 = a3[1].angle;
            LODWORD(v96) = 1033476506;
            [(NUNICalliopeRenderer *)self _renderSunSprite:v255 frameBufferIndex:v7 renderEncoder:v10 position:*(double *)v248.i64 scale:v96 opacity:v95];
          }
          int v97 = 0;
        }
        else if (type == 7)
        {
          if (fabsf(v248.f32[2]) < 0.05)
          {
            float32x4_t v98 = v248;
            v98.i32[2] = 1028443341;
            float32x4_t v99 = vmulq_f32(v248, v248);
            v99.f32[0] = sqrtf(vmlas_n_f32(v99.f32[1], v248.f32[0], v248.f32[0]) + 0.0025);
            float32x4_t *v91 = vdivq_f32(v98, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 0));
          }
          float32x4_t v100 = *(float32x4_t *)&self->_anon_304[76];
          if (vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v100, v100)) <= 0.1) {
            float v93 = 3.1416;
          }
          else {
            float v93 = atan2f(v100.f32[0], v100.f32[1]);
          }
          [v10 setLabel:@"Καλλιόπη Saturn Ring Back"];
          *(float *)&double v101 = v93;
          *(float *)&double v102 = v32 * 0.98;
          *(float *)&double v103 = equatorRotation;
          -[NUNICalliopeRenderer _renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:](self, "_renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:", v255, v7, v10, v237, v101, *(double *)v245.i64, *(double *)v244.columns[0].i64, *(double *)v244.columns[1].i64, *(double *)v244.columns[2].i64, *(double *)v244.columns[3].i64, v102, v103);
          int v97 = 1;
        }
        else
        {
          int v97 = 0;
          float v93 = 0.0;
        }
        [v10 setLabel:@"Καλλιόπη Patch Surface"];
        [v10 setRenderPipelineState:v30];
        [v10 setCullMode:2];
        v104 = [(NUNICalliopeResourceManager *)self->_resourceManager patchVerticesBuffer];
        [v10 setVertexBuffer:v104 offset:0 atIndex:0];

        [v10 setVertexBuffer:v11 offset:v254 atIndex:1];
        [v10 setFragmentBuffer:v11 offset:v254 atIndex:0];
        DWORD2(v252) = 0;
        *(void *)&long long v252 = 0;
        float32x4_t v105 = v245;
        v105.i32[3] = 1.0;
        float32x4_t v245 = v105;
        *(double *)&long long v106 = UMMul(*(float32x4_t *)&self->_anon_304[156], *(float32x4_t *)&self->_anon_304[172], *(float32x4_t *)&self->_anon_304[188], *(float32x4_t *)&self->_anon_304[204], v105);
        long long v252 = v106;
        _NUNICalliopeRenderer_ComputeProjectedSpheroid(self->_state.fovY);
        float32x2_t v251 = vmul_f32(vsqrt_f32(vmla_f32(vmul_f32(v107, v107), v108, v108)), (float32x2_t)vdup_n_s32(0x3E4CCCCDu));
        [(NUNICalliopeRenderer *)self _updateTextureLODsForPatchSpheroid:type uvRate:&v251 drawableSize:*(double *)&v249];
        *(float *)&double v109 = v32 * 0.98;
        unint64_t v110 = [(NUNICalliopeRenderer *)self _computePatchSpheroidLodWithPositionInViewSpace:&v252 radius:v109 drawableSize:*(double *)&v249];
        v233 = a3;
        if (type == 3)
        {
          float32x2_t v112 = (float32x2_t)0x3D4CCCCD3E31D0D4;
        }
        else
        {
          *(float *)v111.i32 = 2.0
                             / (float)((float)(fminf(*(float *)&v249, *((float *)&v249 + 1)) * v33)
                                     / fabsf(*((float *)&v252 + 2)));
          float32x2_t v112 = vadd_f32(vminnm_f32((float32x2_t)vdup_lane_s32(v111, 0), (float32x2_t)0x3E051EB83DCCCCCDLL), (float32x2_t)0x3CA3D70A3E31D0D4);
        }
        *(float32x2_t *)(v255 + 164) = v112;
        *(void *)&long long v249 = [(NUNICalliopeResourceManager *)self->_resourceManager patchIndicesBufferForLod:v110];
        v248.i64[0] = [(NUNICalliopeResourceManager *)self->_resourceManager patchIndexCountForLod:v110];
        [(NUNICalliopeRenderer *)self prepareObjectSpaceFrustumWithTransform:&v253 withState:v246];
        v113 = [(NUNICalliopeResourceManager *)self->_resourceManager patchBoundingBoxForSpheroid];
        int v114 = [(NUNICalliopeRenderer *)self classifyObjectBoundingBoxVersusFrustum:v113 max:(char *)v113 + 16 withState:v246];
        v239 = v30;
        v240 = v11;
        if (v114)
        {
          int v115 = v114;
          uint64_t v116 = 0;
          float32x4_t v117 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v235.columns[0], COERCE_FLOAT(*(_OWORD *)&self->_anon_304[76])), (float32x4_t)v235.columns[1], *(float32x2_t *)&self->_anon_304[76], 1), (float32x4_t)v235.columns[2], *(float32x4_t *)&self->_anon_304[76], 2), (float32x4_t)0, (float32x4_t)v235.columns[3]);
          do
          {
            float32x4_t v118 = vmulq_f32(v117, _renderPatchSpheroid_frustumCullingState_drawableSize_frameBufferIndex_renderEncoder__basisVectors[v116]);
            *((unsigned char *)v256 + v116++) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1))).f32[0] < 0.0;
          }
          while (v116 != 26);
          unint64_t v119 = type;
          uint64_t v120 = 0;
          v117.i32[0] = 1.0;
          do
          {
            float32x4_t v121 = vmulq_f32(v236, _renderPatchSpheroid_frustumCullingState_drawableSize_frameBufferIndex_renderEncoder__basisVectors[v120]);
            BOOL v123 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v121, 2), vaddq_f32(v121, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v121.f32, 1))).f32[0] > 1.0&& *((unsigned char *)v256 + v120) != 0;
            *((unsigned char *)v256 + v120++) = v123;
          }
          while (v120 != 26);
          v124 = [(NUNICalliopeResourceManager *)self->_resourceManager patchBoundingBoxes];
          uint64_t v125 = 0;
          v126 = &byte_21E8F2623;
          do
          {
            int v127 = *((unsigned __int8 *)v256 + *(v126 - 2)) | *((unsigned __int8 *)v256
                                                                               + *(v126 - 3)) | *((unsigned __int8 *)v256 + *(v126 - 1)) | *((unsigned __int8 *)v256 + *v126);
            BOOL v128 = v127 != 0;
            if (v115 == 2 && v127) {
              BOOL v128 = [(NUNICalliopeRenderer *)self isObjectBoundingBoxInsideOrIntersectingFrustum:v124 max:(char *)v124 + 16 withState:v246];
            }
            v126 += 4;
            *((unsigned char *)v257 + v125++) = v128;
            v124 = (const $8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v124 + 32);
          }
          while (v125 != 24);
        }
        else
        {
          unint64_t v119 = type;
          memset(v257, 0, 24);
        }
        uint64_t v129 = 0;
        for (uint64_t i = 0; i != 24; ++i)
        {
          if (*((unsigned char *)v257 + i))
          {
            resourceManager = self->_resourceManager;
            v132 = [(NUNIRenderer *)self textureSuffix];
            v133 = [(NUNICalliopeResourceManager *)resourceManager patchTextureGroupForSpheroid:v119 index:i suffix:v132];

            v134 = [*v133 atlas];
            [v134 bind:v10 slot:1];

            v135 = [v133[1] atlas];
            [v135 bind:v10 slot:2];

            v136 = [v133[2] atlas];
            [v136 bind:v10 slot:3];

            if (v247.i32[0])
            {
              v137 = [v133[3] atlas];
              [v137 bind:v10 slot:4];
            }
            if (v97)
            {
              v138 = [(NUNICalliopeTextureGroup *)self->_textureGroup gradients];
              v139 = [v138 objectAtIndexedSubscript:7];

              v140 = [v139 atlas];
              [v140 bind:v10 slot:5];
            }
            [v10 drawIndexedPrimitives:3 indexCount:v248.i64[0] indexType:0 indexBuffer:(void)v249 indexBufferOffset:0 instanceCount:1 baseVertex:v129 baseInstance:0];
          }
          v129 += 289;
        }
        if (v119 == 3)
        {
          if (v247.i32[0])
          {
            v256[0] = 0;
            uint64_t v250 = 0;
            v141 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:v238 pContents:v256 pOffset:&v250];
            [v10 setVertexBuffer:v141 offset:v250 atIndex:1];
            [v10 setFragmentBuffer:v141 offset:v250 atIndex:0];
            v143 = (_OWORD *)v255;
            v142 = (_OWORD *)v256[0];
            *(_OWORD *)v256[0] = *(_OWORD *)v255;
            long long v144 = v143[4];
            long long v146 = v143[1];
            long long v145 = v143[2];
            v142[3] = v143[3];
            v142[4] = v144;
            v142[1] = v146;
            v142[2] = v145;
            long long v147 = v143[8];
            long long v149 = v143[5];
            long long v148 = v143[6];
            v142[7] = v143[7];
            v142[8] = v147;
            v142[5] = v149;
            v142[6] = v148;
            long long v150 = v143[12];
            long long v152 = v143[9];
            long long v151 = v143[10];
            v142[11] = v143[11];
            v142[12] = v150;
            v142[9] = v152;
            v142[10] = v151;
            uint64_t v153 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForSpheroid:3 layer:1 config:v29];
            if (!v153)
            {

              long long v11 = v240;
              goto LABEL_81;
            }
            v154 = (void *)v153;
            [v10 setLabel:@"Καλλιόπη Patch Homosphere"];
            [v10 setRenderPipelineState:v154];
            UMFloat4x4MakeScale(v32);
            simd_float4x4 v156 = v155;
            simd_float4x4 v253 = v155;
            if (v237)
            {
              *(double *)v157.i64 = UMMul(v155, v244);
              v156.columns[0] = v157;
              v156.columns[1] = v158;
              v156.columns[2] = v159;
              v156.columns[3] = v160;
              v253.columns[0] = v157;
              v253.columns[1] = v158;
              v253.columns[2] = v159;
              v253.columns[3] = v160;
            }
            v260.columns[1] = v231;
            v260.columns[0] = v232;
            v260.columns[3] = v229;
            v260.columns[2] = v230;
            *(double *)v161.i64 = UMMul(v260, v156);
            v263.columns[0] = v161;
            v263.columns[1] = v162;
            v263.columns[2] = v163;
            v263.columns[3] = v164;
            v253.columns[0] = v161;
            v253.columns[1] = v162;
            v253.columns[2] = v163;
            v253.columns[3] = v164;
            v165 = (_OWORD *)v256[0];
            *(double *)&long long v166 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v263);
            v165[6] = v166;
            v165[7] = v167;
            v165[8] = v168;
            v165[9] = v169;
            simd_float4x4 v261 = __invert_f4(v253);
            *(double *)&long long v170 = UMMul((float32x4_t)v261.columns[0], (float32x4_t)v261.columns[1], (float32x4_t)v261.columns[2], (float32x4_t)v261.columns[3], v243);
            uint64_t v171 = 0;
            uint64_t v172 = 0;
            uint64_t v173 = v256[0];
            *(_OWORD *)(v256[0] + 16) = v170;
            *(_DWORD *)(v173 + 164) = 1046807559;
            do
            {
              if (*((unsigned char *)v257 + v172))
              {
                v174 = self->_resourceManager;
                v175 = [(NUNIRenderer *)self textureSuffix];
                uint64_t v176 = [(NUNICalliopeResourceManager *)v174 patchTextureGroupForSpheroid:3 index:v172 suffix:v175];

                v177 = [*(id *)(v176 + 24) atlas];
                [v177 bind:v10 slot:4];

                [v10 drawIndexedPrimitives:3 indexCount:v248.i64[0] indexType:0 indexBuffer:(void)v249 indexBufferOffset:0 instanceCount:1 baseVertex:v171 baseInstance:0];
              }
              ++v172;
              v171 += 289;
            }
            while (v172 != 24);
          }
          v256[0] = 0;
          uint64_t v250 = 0;
          v178 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:v238 pContents:v256 pOffset:&v250];
          [v10 setVertexBuffer:v178 offset:v250 atIndex:1];
          [v10 setFragmentBuffer:v178 offset:v250 atIndex:0];
          v180 = (_OWORD *)v255;
          v179 = (_OWORD *)v256[0];
          *(_OWORD *)v256[0] = *(_OWORD *)v255;
          long long v181 = v180[4];
          long long v183 = v180[1];
          long long v182 = v180[2];
          v179[3] = v180[3];
          v179[4] = v181;
          v179[1] = v183;
          v179[2] = v182;
          long long v184 = v180[8];
          long long v186 = v180[5];
          long long v185 = v180[6];
          v179[7] = v180[7];
          v179[8] = v184;
          v179[5] = v186;
          v179[6] = v185;
          long long v187 = v180[12];
          long long v189 = v180[9];
          long long v188 = v180[10];
          v179[11] = v180[11];
          v179[12] = v187;
          v179[9] = v189;
          v179[10] = v188;
          uint64_t v190 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForAtmosphere];
          long long v30 = v239;
          long long v11 = v240;
          if (!v190)
          {

LABEL_81:
            goto LABEL_82;
          }
          v191 = (void *)v190;
          [v10 setLabel:@"Καλλιόπη Atmosphere"];
          [v10 setRenderPipelineState:v191];
          UMMul(*(float32x4_t *)&self->_anon_304[156], *(float32x4_t *)&self->_anon_304[172], *(float32x4_t *)&self->_anon_304[188], *(float32x4_t *)&self->_anon_304[204], v245);
          _NUNICalliopeRenderer_ComputeProjectedSpheroid(self->_state.fovY);
          __asm { FMOV            V5.2S, #1.0 }
          float32x2_t v193 = vdiv_f32(_D5, *(float32x2_t *)(v256[0] + 56));
          *(float32x2_t *)v256[0] = vmul_f32(vsub_f32(v194, *(float32x2_t *)(v256[0] + 48)), v193);
          uint64_t v196 = v256[0];
          *(float32x2_t *)(v256[0] + 8) = vmul_f32(v195, v193);
          *(float32x2_t *)(v196 + 16) = vmul_f32(v197, v193);
          float32x2_t v198 = vmul_f32(v195, v195);
          v198.i32[0] = vadd_f32(v198, (float32x2_t)vdup_lane_s32((int32x2_t)v198, 1)).u32[0];
          float32x2_t v199 = vrsqrte_f32((float32x2_t)v198.u32[0]);
          float32x2_t v200 = vmul_f32(v199, vrsqrts_f32((float32x2_t)v198.u32[0], vmul_f32(v199, v199)));
          v198.i32[0] = vmul_f32(v200, vrsqrts_f32((float32x2_t)v198.u32[0], vmul_f32(v200, v200))).u32[0];
          float32x2_t v201 = vmul_f32(v197, v197);
          v201.i32[0] = vadd_f32(v201, (float32x2_t)vdup_lane_s32((int32x2_t)v201, 1)).u32[0];
          float32x2_t v202 = vmul_n_f32(v195, v198.f32[0]);
          float32x2_t v203 = vrsqrte_f32((float32x2_t)v201.u32[0]);
          float32x2_t v204 = vmul_f32(v203, vrsqrts_f32((float32x2_t)v201.u32[0], vmul_f32(v203, v203)));
          float32x2_t v205 = vmul_n_f32(v197, vmul_f32(v204, vrsqrts_f32((float32x2_t)v201.u32[0], vmul_f32(v204, v204))).f32[0]);
          float32x4_t v207 = *(float32x4_t *)&self->_anon_304[44];
          float32x4_t v206 = *(float32x4_t *)&self->_anon_304[60];
          float32x4_t v208 = vmlaq_n_f32(vmulq_lane_f32(v207, v205, 1), v206, v205.f32[0]);
          float32x4_t v209 = vmlaq_n_f32(vmulq_lane_f32(v207, v202, 1), v206, v202.f32[0]);
          float cameraRoll = self->_state.cameraRoll;
          if (fabsf(cameraRoll) <= 0.00001)
          {
            v208.i32[3] = 1.0;
            v209.i32[3] = 1.0;
          }
          else
          {
            float32x4_t v247 = v208;
            float32x4_t v248 = v209;
            __float2 v211 = __sincosf_stret(cameraRoll * 0.5);
            *(__n64 *)v212.i8 = UMFloat4x4Make(v211.__sinval * *(float *)&self->_anon_304[76], v211.__sinval * *(float *)&self->_anon_304[80], v211.__sinval * *(float *)&self->_anon_304[84], v211.__cosval);
            int32x4_t v214 = vzip1q_s32(v212, v213);
            int32x4_t v215 = vzip2q_s32(v212, v213);
            int32x4_t v218 = vzip1q_s32(v216, v217);
            int32x4_t v219 = vzip2q_s32(v216, v217);
            float32x4_t v220 = (float32x4_t)vzip1q_s32(v214, v218);
            float32x4_t v221 = (float32x4_t)vzip2q_s32(v214, v218);
            float32x4_t v222 = (float32x4_t)vzip1q_s32(v215, v219);
            float32x4_t v223 = (float32x4_t)vzip2q_s32(v215, v219);
            float32x4_t v208 = vaddq_f32(v223, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v220, v247.f32[0]), v221, *(float32x2_t *)v247.f32, 1), v222, v247, 2));
            float32x4_t v209 = vaddq_f32(v223, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v220, v248.f32[0]), v221, *(float32x2_t *)v248.f32, 1), v222, v248, 2));
            uint64_t v196 = v256[0];
          }
          *(float32x4_t *)(v196 + 32) = v209;
          *(float32x4_t *)(v196 + 48) = v208;
          *(float32x4_t *)(v196 + 64) = v241;
          float32x4_t v227 = vmulq_f32(v241, *(float32x4_t *)&self->_anon_304[76]);
          *(_DWORD *)(v196 + 80) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v227, 2), vaddq_f32(v227, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v227.f32, 1))).u32[0];
          *(float *)(v196 + 160) = v233[1].angle;
          [v10 setCullMode:0];
          v228 = [(NUNICalliopeResourceManager *)self->_resourceManager atmosphereRingVerticesBuffer];
          [v10 setVertexBuffer:v228 offset:0 atIndex:0];

          [v10 drawPrimitives:4 vertexStart:0 vertexCount:50];
        }
        else
        {
          long long v11 = v240;
          if (v97)
          {
            [v10 setLabel:@"Καλλιόπη Saturn Ring Front"];
            *(float *)&double v224 = v93 + 3.1416;
            *(float *)&double v225 = v32 * 0.98;
            *(float *)&double v226 = equatorRotation;
            -[NUNICalliopeRenderer _renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:](self, "_renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:", v255, v238, v10, v237, v224, v234, *(double *)v244.columns[0].i64, *(double *)v244.columns[1].i64, *(double *)v244.columns[2].i64, *(double *)v244.columns[3].i64, v225, v226);
          }
        }
        [v10 setCullMode:0];
        [v10 popDebugGroup];
        goto LABEL_81;
      }
      memset(&v244, 0, 48);
    }
    else
    {
      *(__n64 *)v43.f32 = UMFloat4x4Make(v41);
      v244.columns[0] = v43;
      v244.columns[1] = v44;
      v244.columns[2] = v45;
      v244.columns[3] = v46;
      if (type != 4)
      {
        _Q0 = vaddq_f32(v245, (float32x4_t)xmmword_21E8F2310);
        _Q1 = vmulq_f32(_Q0, _Q0);
        _S2 = _Q0.i32[2];
        __asm { FMLA            S1, S2, V0.S[2] }
        _Q1.f32[0] = sqrtf(_Q1.f32[0]);
        float32x4_t v50 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
        _Q1.f32[0] = fmaxf(v248.f32[0], 0.0);
        float v51 = _Q1.f32[0] / 0.2;
        _NF = _Q1.f32[0] < 0.2;
        float v52 = 1.0;
        if (_NF) {
          float v52 = v51;
        }
        _Q2 = vmlaq_n_f32(v241, vsubq_f32(v50, v241), v52);
        _Q0 = vmulq_f32(_Q2, _Q2);
        _S1 = _Q2.i32[2];
        __asm { FMLA            S0, S1, V2.S[2] }
        _Q0.f32[0] = sqrtf(_Q0.f32[0]);
        float32x4_t v241 = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q0.f32, 0));
      }
      if (equatorRotation == 0.0) {
        goto LABEL_19;
      }
    }
    float v56 = 1.5708;
    if (type != 4) {
      float v56 = 0.0;
    }
    *(double *)v57.i64 = UMFloat4x4MakeRotateZ(v56 + equatorRotation);
    v61.columns[0] = v57;
    v61.columns[1] = v58;
    v61.columns[2] = v59;
    v61.columns[3] = v60;
    if (v248.f32[0] > 0.00001)
    {
      *(double *)v62.i64 = UMMul(v244, v61);
      v61.columns[0] = v62;
      v61.columns[1] = v63;
      v61.columns[2] = v64;
      v61.columns[3] = v65;
    }
    simd_float4x4 v244 = v61;
LABEL_19:
    *(double *)v66.i64 = UMMul(v253, v244);
    v253.columns[0] = v66;
    v253.columns[1] = v67;
    v253.columns[2] = v68;
    v253.columns[3] = v69;
    int32x4_t v70 = vzip1q_s32((int32x4_t)v244.columns[0], (int32x4_t)v244.columns[2]);
    int32x4_t v71 = vzip2q_s32((int32x4_t)v244.columns[0], (int32x4_t)v244.columns[2]);
    int32x4_t v72 = vzip1q_s32((int32x4_t)v244.columns[1], (int32x4_t)v244.columns[3]);
    int32x4_t v73 = vzip2q_s32((int32x4_t)v244.columns[1], (int32x4_t)v244.columns[3]);
    float32x4_t v74 = (float32x4_t)vzip1q_s32(v70, v72);
    float32x4_t v75 = (float32x4_t)vzip2q_s32(v70, v72);
    float32x4_t v76 = (float32x4_t)vzip1q_s32(v71, v73);
    float32x4_t v77 = (float32x4_t)vzip2q_s32(v71, v73);
    float32x4_t v78 = v241;
    v78.i32[3] = 0;
    *(double *)v79.i64 = UMMul(v74, v75, v76, v77, v78);
    float32x4_t v248 = v79;
    unsigned int v237 = 1;
    goto LABEL_20;
  }
LABEL_82:
}

- (void)_renderLocationDot:(const NUNISpheroidStructure *)a3 scene:(const NUNISceneStructure *)a4 uniPtr:(NUNICalliopeRenderUniforms *)a5 viewport:(NUNIViewport)a6 renderEncoder:(id)a7
{
  id v153 = a7;
  uint64_t v12 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForLocationDot];
  if (v12)
  {
    p_state = &self->_state;
    [v153 setLabel:@"Καλλιόπη LocationDot"];
    [v153 setRenderPipelineState:v12];
    long long v14 = [(NUNICalliopeResourceManager *)self->_resourceManager rectVerticesBuffer];
    [v153 setVertexBuffer:v14 offset:0 atIndex:0];

    UMFloat4x4MakeScale(0.11);
    simd_float4 v143 = v16;
    simd_float4 v148 = v15;
    simd_float4 v133 = v18;
    simd_float4 v138 = v17;
    *(double *)v155.columns[0].i64 = UMFloat4x4MakeTranslate();
    simd_float4 v117 = v155.columns[1];
    simd_float4 v118 = v155.columns[0];
    simd_float4 v115 = v155.columns[3];
    simd_float4 v116 = v155.columns[2];
    v167.columns[1] = v143;
    v167.columns[0] = v148;
    v167.columns[3] = v133;
    v167.columns[2] = v138;
    *(double *)v19.i64 = UMMul(v155, v167);
    simd_float4 v144 = v20;
    simd_float4 v149 = v19;
    simd_float4 v134 = v22;
    simd_float4 v139 = v21;
    float distance = a3[4].distance;
    *(double *)v24.i64 = UMFloat4x4MakeRotateX(a3[4].distanceScale * -0.017453);
    simd_float4 v127 = v25;
    simd_float4 v128 = v24;
    simd_float4 v125 = v27;
    simd_float4 v126 = v26;
    *(double *)v28.i64 = UMFloat4x4MakeRotateZ(distance * 0.017453);
    simd_float4 v131 = v29;
    simd_float4 v132 = v28;
    simd_float4 v129 = v31;
    simd_float4 v130 = v30;
    v156.columns[1] = v127;
    v156.columns[0] = v128;
    v156.columns[3] = v125;
    v156.columns[2] = v126;
    v168.columns[1] = v144;
    v168.columns[0] = v149;
    v168.columns[3] = v134;
    v168.columns[2] = v139;
    *(double *)v32.i64 = UMMul(v156, v168);
    v169.columns[0] = v32;
    v169.columns[1] = v33;
    v169.columns[2] = v34;
    v169.columns[3] = v35;
    v157.columns[1] = v131;
    v157.columns[0] = v132;
    v157.columns[3] = v129;
    v157.columns[2] = v130;
    *(double *)v36.i64 = UMMul(v157, v169);
    simd_float4 v145 = v37;
    simd_float4 v150 = v36;
    simd_float4 v135 = v39;
    simd_float4 v140 = v38;
    float equatorRotation = a3->equatorRotation;
    UMFloat4x4MakeScale(a3[2].equatorRotation * a3[2].opacity);
    simd_float4 v113 = v158.columns[1];
    simd_float4 v114 = v158.columns[0];
    simd_float4 v111 = v158.columns[3];
    simd_float4 v112 = v158.columns[2];
    v170.columns[1] = v145;
    v170.columns[0] = v150;
    v170.columns[3] = v135;
    v170.columns[2] = v140;
    *(double *)v41.i64 = UMMul(v158, v170);
    float v42 = fabsf(equatorRotation);
    simd_float4 v146 = v43;
    simd_float4 v151 = v41;
    simd_float4 v136 = v45;
    simd_float4 v141 = v44;
    if (v42 <= 0.00001)
    {
      UMFloat4x4MakeScale(1.0);
      simd_float4 v109 = v51;
      simd_float4 v110 = v50;
      simd_float4 v107 = v53;
      simd_float4 v108 = v52;
    }
    else
    {
      *(double *)v159.columns[0].i64 = UMFloat4x4MakeRotateZ(equatorRotation);
      simd_float4 v109 = v159.columns[1];
      simd_float4 v110 = v159.columns[0];
      simd_float4 v107 = v159.columns[3];
      simd_float4 v108 = v159.columns[2];
      v171.columns[1] = v146;
      v171.columns[0] = v151;
      v171.columns[3] = v136;
      v171.columns[2] = v141;
      *(double *)v46.i64 = UMMul(v159, v171);
      simd_float4 v146 = v47;
      simd_float4 v151 = v46;
      simd_float4 v136 = v49;
      simd_float4 v141 = v48;
    }
    *(double *)v160.columns[0].i64 = UMFloat4x4MakeTranslate();
    simd_float4 v121 = v160.columns[1];
    simd_float4 v122 = v160.columns[0];
    simd_float4 v119 = v160.columns[3];
    simd_float4 v120 = v160.columns[2];
    v172.columns[1] = v146;
    v172.columns[0] = v151;
    v172.columns[3] = v136;
    v172.columns[2] = v141;
    *(double *)v54.i64 = UMMul(v160, v172);
    v173.columns[0] = v54;
    v173.columns[1] = v55;
    v173.columns[2] = v56;
    v173.columns[3] = v57;
    *(double *)v58.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v173);
    float32x4_t v147 = v59;
    float32x4_t v152 = v58;
    float32x4_t v137 = v61;
    float32x4_t v142 = v60;
    *(double *)v62.i64 = UMMul(v58, v59, v60, v61, (float32x4_t)xmmword_21E8F2330);
    int32x4_t v124 = v62;
    *(double *)v63.i64 = UMMul(v152, v147, v142, v137, (float32x4_t)xmmword_21E8F2340);
    int32x4_t v123 = v63;
    *(double *)v64.i64 = UMMul(v152, v147, v142, v137, (float32x4_t)xmmword_21E8F1CC0);
    v65.f32[0] = (float)a6.width;
    v65.f32[1] = (float)a6.height;
    float32x2_t v66 = vmul_f32(v65, (float32x2_t)0x3F0000003F000000);
    float32x2_t v67 = vdiv_f32(vmul_f32(v66, *(float32x2_t *)v123.i8), (float32x2_t)vdup_laneq_s32(v123, 3));
    *(float32x2_t *)v64.i8 = vdiv_f32(vmul_f32(v66, *(float32x2_t *)v64.i8), (float32x2_t)vdup_laneq_s32(v64, 3));
    float32x2_t v68 = vsub_f32(vdiv_f32(vmul_f32(v66, *(float32x2_t *)v124.i8), (float32x2_t)vdup_laneq_s32(v124, 3)), *(float32x2_t *)v64.i8);
    int32x2_t v69 = (int32x2_t)vmul_f32(v68, v68);
    *(float32x2_t *)v64.i8 = vsub_f32(v67, *(float32x2_t *)v64.i8);
    *(float32x2_t *)v64.i8 = vmul_f32(*(float32x2_t *)v64.i8, *(float32x2_t *)v64.i8);
    float32x2_t v70 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v69, *(int32x2_t *)v64.i8), (float32x2_t)vzip2_s32(v69, *(int32x2_t *)v64.i8)));
    if (v70.f32[0] >= v70.f32[1]) {
      v70.f32[0] = v70.f32[1];
    }
    float v71 = v70.f32[0] * 0.23077;
    float var1 = a4[1].var8.var0.var1;
    if (v71 <= var1)
    {
      long long v106 = v153;
      float32x4_t v103 = v147;
      float32x4_t v102 = v152;
      float32x4_t v105 = v137;
      float32x4_t v104 = v142;
    }
    else
    {
      UMFloat4x4MakeScale((float)(var1 * 0.11) / v71);
      v174.columns[0] = v73;
      v174.columns[1] = v74;
      v174.columns[2] = v75;
      v174.columns[3] = v76;
      v161.columns[1] = v117;
      v161.columns[0] = v118;
      v161.columns[3] = v115;
      v161.columns[2] = v116;
      *(double *)v77.i64 = UMMul(v161, v174);
      v175.columns[0] = v77;
      v175.columns[1] = v78;
      v175.columns[2] = v79;
      v175.columns[3] = v80;
      v162.columns[1] = v127;
      v162.columns[0] = v128;
      v162.columns[3] = v125;
      v162.columns[2] = v126;
      *(double *)v81.i64 = UMMul(v162, v175);
      v176.columns[0] = v81;
      v176.columns[1] = v82;
      v176.columns[2] = v83;
      v176.columns[3] = v84;
      v163.columns[1] = v131;
      v163.columns[0] = v132;
      v163.columns[3] = v129;
      v163.columns[2] = v130;
      *(double *)v85.i64 = UMMul(v163, v176);
      v177.columns[0] = v85;
      v177.columns[1] = v86;
      v177.columns[2] = v87;
      v177.columns[3] = v88;
      v164.columns[1] = v113;
      v164.columns[0] = v114;
      v164.columns[3] = v111;
      v164.columns[2] = v112;
      *(double *)v89.i64 = UMMul(v164, v177);
      v93.columns[0] = v89;
      v93.columns[1] = v90;
      v93.columns[2] = v91;
      v93.columns[3] = v92;
      if (v42 > 0.00001)
      {
        v165.columns[1] = v109;
        v165.columns[0] = v110;
        v165.columns[3] = v107;
        v165.columns[2] = v108;
        *(double *)v94.i64 = UMMul(v165, v93);
        v93.columns[0] = v94;
        v93.columns[1] = v95;
        v93.columns[2] = v96;
        v93.columns[3] = v97;
      }
      v166.columns[1] = v121;
      v166.columns[0] = v122;
      v166.columns[3] = v119;
      v166.columns[2] = v120;
      *(double *)v98.i64 = UMMul(v166, v93);
      v178.columns[0] = v98;
      v178.columns[1] = v99;
      v178.columns[2] = v100;
      v178.columns[3] = v101;
      *(double *)v102.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v178);
      long long v106 = v153;
    }
    *(float32x4_t *)&a5[96].vsh.{?= = v102;
    *(float32x4_t *)&a5[112].vsh.{?= = v103;
    *(float32x4_t *)&a5[128].vsh.{?= = v104;
    *(float32x4_t *)&a5[144].vsh.{?= = v105;
    objc_msgSend(v106, "setCullMode:", 1, *(_OWORD *)&v107, *(_OWORD *)&v108, *(_OWORD *)&v109, *(_OWORD *)&v110);
    [v153 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v153 setCullMode:0];
  }
}

- (void)_renderSpriteSpheroid:(const NUNISpheroidStructure *)a3 frameBufferIndex:(unint64_t)a4 renderEncoder:(id)a5
{
  id v8 = a5;
  uint64_t v59 = 0;
  float32x4_t v60 = 0;
  long long v9 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:a4 pContents:&v60 pOffset:&v59];
  [v8 setVertexBuffer:v9 offset:v59 atIndex:1];
  [v8 setFragmentBuffer:v9 offset:v59 atIndex:0];
  id v10 = v60;
  *float32x4_t v60 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  long long v11 = *(_OWORD *)&self->_anon_421[63];
  long long v13 = *(_OWORD *)&self->_anon_421[15];
  long long v12 = *(_OWORD *)&self->_anon_421[31];
  v10[3] = *(_OWORD *)&self->_anon_421[47];
  v10[4] = v11;
  v10[1] = v13;
  v10[2] = v12;
  long long v14 = *(_OWORD *)&self->_anon_421[127];
  long long v16 = *(_OWORD *)&self->_anon_421[79];
  long long v15 = *(_OWORD *)&self->_anon_421[95];
  v10[7] = *(_OWORD *)&self->_anon_421[111];
  v10[8] = v14;
  v10[5] = v16;
  v10[6] = v15;
  long long v17 = *(_OWORD *)&self->_anon_421[191];
  long long v19 = *(_OWORD *)&self->_anon_421[143];
  long long v18 = *(_OWORD *)&self->_anon_421[159];
  v10[11] = *(_OWORD *)&self->_anon_421[175];
  v10[12] = v17;
  v10[9] = v19;
  v10[10] = v18;
  unint64_t type = a3->type;
  simd_float4 v21 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForSpheroid:a3->type layer:0 config:0];
  if (v21)
  {
    [v8 setLabel:@"Καλλιόπη SpriteSpheroid"];
    [v8 setRenderPipelineState:v21];
    long long v23 = [(NUNICalliopeResourceManager *)self->_resourceManager discVerticesBuffer];
    [v8 setVertexBuffer:v23 offset:0 atIndex:0];

    simd_float4 v24 = v60;
    *float32x4_t v60 = s_sprites[a3[4].type];
    *((_DWORD *)v24 + 40) = LODWORD(a3[1].angle);
    float32x4_t v25 = *(float32x4_t *)&a3[3].type;
    if (type == 10)
    {
      simd_float4 v58 = (simd_float4)xmmword_21E8F1C00;
      simd_float4 v56 = (simd_float4)xmmword_21E8F1DE0;
      simd_float4 v57 = (simd_float4)xmmword_21E8F2350;
    }
    else
    {
      _Q0 = vsubq_f32(*(float32x4_t *)&self->_anon_304[12], v25);
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      int32x4_t v33 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
      float32x4_t v34 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v33, v33), (int8x16_t)v33, 0xCuLL);
      float32x4_t v35 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v33, (int8x16_t)v33, 0xCuLL), (int8x16_t)v33, 8uLL);
      p_state = &self->_state;
      int32x4_t v36 = (int32x4_t)vmlaq_f32(vmulq_f32(v35, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&p_state[3].viewport.height, *(int32x4_t *)&p_state[3].viewport.height), *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL))), v34, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&p_state[3].viewport.height, *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL), *(int8x16_t *)&p_state[3].viewport.height, 8uLL));
      float32x4_t v37 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v36, (int8x16_t)v36, 0xCuLL), (int8x16_t)v36, 8uLL), vnegq_f32(v34)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v36, v36), (int8x16_t)v36, 0xCuLL), v35);
      v36.i32[3] = 0;
      v37.i32[3] = 0;
      simd_float4 v56 = (simd_float4)v37;
      simd_float4 v57 = (simd_float4)v36;
      v33.i32[3] = 0;
      simd_float4 v58 = (simd_float4)v33;
    }
    v25.i32[3] = 1.0;
    simd_float4 v55 = (simd_float4)v25;
    float v38 = a3[2].equatorRotation * a3[2].opacity;
    if (type == 14) {
      float v38 = v38 + v38;
    }
    UMFloat4x4MakeScale(v38);
    v62.columns[0] = v39;
    v62.columns[1] = v40;
    v62.columns[2] = v41;
    v62.columns[3] = v42;
    v61.columns[1] = v56;
    v61.columns[0] = v57;
    v61.columns[2] = v58;
    v61.columns[3] = v55;
    *(double *)v43.i64 = UMMul(v61, v62);
    v63.columns[0] = v43;
    v63.columns[1] = v44;
    v63.columns[2] = v45;
    v63.columns[3] = v46;
    *(double *)&long long v47 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v63);
    simd_float4 v48 = v60;
    v60[6] = v47;
    v48[7] = v49;
    v48[8] = v50;
    v48[9] = v51;
    simd_float4 v52 = [(NUNICalliopeTextureGroup *)self->_textureGroup gradients];
    simd_float4 v53 = [v52 objectAtIndexedSubscript:type];

    simd_float4 v54 = [v53 atlas];
    [v54 bind:v8 slot:5];

    [v8 drawPrimitives:4 vertexStart:0 vertexCount:16];
  }
}

- (void)_renderOffscreenSceneWithScene:(const NUNISceneStructure *)a3 spheroids:(id)a4 viewport:(NUNIViewport)a5 commandBuffer:(id)a6 frameBufferIndex:(unint64_t)a7 drawableTexture:(id)a8
{
  v117[4] = *MEMORY[0x263EF8340];
  uint64_t height = a5.height;
  id v12 = a4;
  id v13 = a6;
  id v80 = a8;
  if (self->_bloomDownsampleUsingTileShaders && self->_bloomEnabled)
  {
    long long v14 = [(NUNICalliopeRenderer *)self _getOrCreateOffscreenBloomWithViewport:a5];
    long long v15 = [v14 renderPassDescriptor];
    long long v16 = [v13 renderCommandEncoderWithDescriptor:v15];

    [v16 setLabel:@"Clear Bloom Texture"];
    [v16 endEncoding];
  }
  long long v17 = self->_offscreenScenes[a7];
  long long v18 = v17;
  simd_float4 v79 = v13;
  if (!v17
    || [(NUNCalliopeOffscreen *)v17 width] != a5.width
    || [(NUNCalliopeOffscreen *)v18 height] != height)
  {
    simd_float4 v77 = [MEMORY[0x263F32148] sharedNilTexture2D];
    long long v19 = objc_opt_new();
    [v19 setTextureType:2];
    [v19 setWidth:a5.width];
    [v19 setHeight:*(uint64_t *)&a5 >> 32];
    [v19 setDepth:1];
    [v19 setPixelFormat:10];
    v116[0] = *MEMORY[0x263F0ECF8];
    simd_float4 v20 = [NSNumber numberWithInt:a5];
    v117[0] = v20;
    v116[1] = *MEMORY[0x263F0ECC0];
    simd_float4 v21 = [NSNumber numberWithInt:height];
    uint64_t v22 = *MEMORY[0x263F0ECC8];
    v117[1] = v21;
    v117[2] = &unk_26CFE7898;
    uint64_t v23 = *MEMORY[0x263F0ECA0];
    v116[2] = v22;
    v116[3] = v23;
    v117[3] = &unk_26CFE78B0;
    simd_float4 v24 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:4];

    float32x4_t v25 = (void *)MGGetStringAnswer();
    id v76 = v12;
    simd_float4 v26 = v18;
    if ([v25 isEqualToString:@"t8010"])
    {
      [v19 setUsage:4];
      [v19 setResourceOptions:48];
      simd_float4 v27 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v19];
      simd_float4 v28 = 0;
    }
    else
    {
      [v19 setUsage:5];
      [v19 setResourceOptions:0];
      simd_float4 v28 = (IOSurface *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v24];
      simd_float4 v27 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v19 iosurface:v28 plane:0];
    }
    simd_float4 v29 = self->_contentMaskSurfaces[a7];
    self->_contentMaskSurfaces[a7] = v28;
    simd_float4 v30 = v28;

    simd_float4 v31 = self->_contentMaskTextures[a7];
    self->_contentMaskTextures[a7] = v27;
    simd_float4 v32 = v27;

    long long v18 = -[NUNCalliopeOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNCalliopeOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, a5, height, v77, v32, 2, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);
    objc_storeStrong((id *)&self->_offscreenScenes[a7], v18);

    id v12 = v76;
    id v13 = v79;
  }
  [(NUNCalliopeOffscreen *)v18 setTexture0:v80];
  unint64_t v75 = [v80 width];
  unint64_t v74 = [v80 height];
  int32x4_t v33 = [(NUNCalliopeOffscreen *)v18 renderPassDescriptor];
  [v33 setTileWidth:32];

  float32x4_t v34 = [(NUNCalliopeOffscreen *)v18 renderPassDescriptor];
  [v34 setTileHeight:32];

  simd_float4 v78 = v18;
  float32x4_t v35 = [(NUNCalliopeOffscreen *)v18 renderPassDescriptor];
  int32x4_t v36 = [v13 renderCommandEncoderWithDescriptor:v35];

  memset(v115, 0, sizeof(v115));
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v37 = v12;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v108 objects:v112 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    LODWORD(v40) = 0;
    uint64_t v41 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v109 != v41) {
          objc_enumerationMutation(v37);
        }
        simd_float4 v43 = (float32x4_t *)[*(id *)(*((void *)&v108 + 1) + 8 * i) structure];
        if (v43[5].f32[2] > 0.00001 && v43[3].f32[0] > 0.00001 && v43[9].i8[8])
        {
          __int32 v44 = v43->i32[0];
          _S0 = 0;
          if ((v43->i32[0] - 10) >= 2)
          {
            if (v44 == 13)
            {
              _S0 = 1258291194;
            }
            else if (v44 == 3)
            {
              _S0 = 1258291192;
            }
            else
            {
              _S0 = 1258291196;
              if (((1 << v44) & 0xFFC000) == 0)
              {
                _S0 = 1258291198;
                if (v44 != 12)
                {
                  _S2 = vsubq_f32((float32x4_t)self[784], v43[96]).i32[2];
                  __asm { FMLA            S0, S2, V1.S[2] }
                }
              }
            }
          }
          long long v51 = (int *)&__base[8 * (int)v40];
          *long long v51 = _S0;
          v51[1] = v40;
          *((void *)v115 + (int)v40) = v43;
          LODWORD(v40) = v40 + 1;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v108 objects:v112 count:16];
    }
    while (v39);
  }
  else
  {
    LODWORD(v40) = 0;
  }

  qsort(__base, (int)v40, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNICalliopeRenderCompareObject);
  [v36 setLabel:@"Καλλιόπη Offscreen Scene"];
  long long v87 = 0uLL;
  *(double *)&long long v88 = (double)a5.width;
  *((double *)&v88 + 1) = (double)(int)height;
  long long v89 = xmmword_21E8F2360;
  [v36 setViewport:&v87];
  [v36 setCullMode:0];
  [v36 setFrontFacingWinding:0];
  [(NUNICalliopeRenderer *)self _renderOffscreenBackgroundWithRenderEncoder:v36 frameBufferIndex:a7];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v87 = 0u;
  [(NUNICalliopeRenderer *)self prepareWorldSpaceFrustumWithTransform:&self->_anon_304[220] withState:&v87];
  if ((int)v40 >= 1)
  {
    *(float *)&double v52 = (float)v75;
    *((float *)&v52 + 1) = (float)v74;
    double location = v52;
    uint64_t v40 = v40;
    simd_float4 v53 = &v114;
    do
    {
      uint64_t v54 = *v53;
      v53 += 2;
      uint64_t v55 = *((void *)v115 + v54);
      int v56 = 1 << *(_DWORD *)v55;
      if ((v56 & 0xFBFC00) != 0)
      {
        [(NUNICalliopeRenderer *)self _renderSpriteSpheroid:v55 frameBufferIndex:a7 renderEncoder:v36];
      }
      else if ((v56 & 0x3FE) != 0)
      {
        [(NUNICalliopeRenderer *)self _renderPatchSpheroid:v55 frustumCullingState:&v87 drawableSize:a7 frameBufferIndex:v36 renderEncoder:location];
      }
      if ((v56 & 8) != 0)
      {
        float v57 = *(float *)&a3[1].var6;
        if (v57 > 0.00001)
        {
          float var7 = a3[1].var7;
          uint64_t v85 = 0;
          simd_float4 v86 = 0;
          uint64_t v59 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:a7 pContents:&v86 pOffset:&v85];
          [v36 setVertexBuffer:v59 offset:v85 atIndex:1];
          [v36 setFragmentBuffer:v59 offset:v85 atIndex:0];
          float32x4_t v60 = v86;
          *(_OWORD *)simd_float4 v86 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
          long long v61 = *(_OWORD *)&self->_anon_421[15];
          long long v62 = *(_OWORD *)&self->_anon_421[31];
          long long v63 = *(_OWORD *)&self->_anon_421[63];
          *((_OWORD *)v60 + 3) = *(_OWORD *)&self->_anon_421[47];
          *((_OWORD *)v60 + 4) = v63;
          *((_OWORD *)v60 + 1) = v61;
          *((_OWORD *)v60 + 2) = v62;
          long long v64 = *(_OWORD *)&self->_anon_421[79];
          long long v65 = *(_OWORD *)&self->_anon_421[95];
          long long v66 = *(_OWORD *)&self->_anon_421[127];
          *((_OWORD *)v60 + 7) = *(_OWORD *)&self->_anon_421[111];
          *((_OWORD *)v60 + 8) = v66;
          *((_OWORD *)v60 + 5) = v64;
          *((_OWORD *)v60 + 6) = v65;
          long long v68 = *(_OWORD *)&self->_anon_421[143];
          long long v67 = *(_OWORD *)&self->_anon_421[159];
          long long v69 = *(_OWORD *)&self->_anon_421[191];
          *((_OWORD *)v60 + 11) = *(_OWORD *)&self->_anon_421[175];
          *((_OWORD *)v60 + 12) = v69;
          *((_OWORD *)v60 + 9) = v68;
          *((_OWORD *)v60 + 10) = v67;
          v60[40] = v57 * *(float *)(v55 + 48);
          v60[41] = var7 - floorf(var7);
          v60[43] = a3[1].var8.var0.var0;
          -[NUNICalliopeRenderer _renderLocationDot:scene:uniPtr:viewport:renderEncoder:](self, "_renderLocationDot:scene:uniPtr:viewport:renderEncoder:", v55, a3);
        }
      }
      --v40;
    }
    while (v40);
  }
  if (self->_bloomEnabled)
  {
    float32x2_t v70 = v79;
    float v71 = v78;
    if (self->_bloomDownsampleUsingTileShaders)
    {
      [(NUNICalliopeRenderer *)self _renderOffscreenBloomTextureUsingTileShaderWithViewport:a5 renderEncoder:v36];
      [v36 endEncoding];
    }
    else
    {
      [v36 endEncoding];
      int32x4_t v72 = [(NUNCalliopeOffscreen *)v78 texture0];
      [(NUNICalliopeRenderer *)self _renderOffscreenBloomTextureWithViewport:a5 sceneTexture:v72 commandBuffer:v79];
    }
    simd_float4 v73 = [v79 computeCommandEncoder];
    [(NUNICalliopeRenderer *)self _computeBloomChainTextures:v73];
    [v73 endEncoding];
  }
  else
  {
    [v36 endEncoding];
    float32x2_t v70 = v79;
    float v71 = v78;
  }
}

- (id)_getOrCreateOffscreenBloomWithViewport:(NUNIViewport)a3
{
  uint64_t v5 = (a3.width >> 2);
  uint64_t v6 = *(uint64_t *)&a3 >> 34;
  offscreenBloom = self->_offscreenBloom;
  if (!offscreenBloom
    || [(NUNCalliopeOffscreen *)offscreenBloom width] != v5
    || [(NUNCalliopeOffscreen *)self->_offscreenBloom height] != v6)
  {
    id v8 = _NUNCalliopeCreateTexture(self->_device, v5, v6, 1, 10, 1);
    [(NUNICalliopeRenderer *)self _setupBloomChainWithViewport:a3 bloomTexture:v8];
    long long v9 = -[NUNCalliopeOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNCalliopeOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, v5, v6, v8, 0, 2 * self->_bloomDownsampleUsingTileShaders, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    id v10 = self->_offscreenBloom;
    self->_offscreenBloom = v9;
  }
  long long v11 = self->_offscreenBloom;
  return v11;
}

- (void)_renderOffscreenBloomTextureUsingTileShaderWithViewport:(NUNIViewport)a3 renderEncoder:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NUNICalliopeRenderer *)self _getOrCreateOffscreenBloomWithViewport:a3];
  [v6 pushDebugGroup:@"Καλλιόπη Bloom Downsample"];
  id v8 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForBloomDownsampleUsingTileShader];
  [v6 setRenderPipelineState:v8];

  long long v9 = [v7 texture0];
  [v6 setTileTexture:v9 atIndex:0];

  v10[0] = (unint64_t)[v6 tileWidth] >> 1;
  v10[1] = (unint64_t)[v6 tileHeight] >> 1;
  v10[2] = 1;
  [v6 dispatchThreadsPerTile:v10];
  [v6 setTileTexture:0 atIndex:0];
  [v6 popDebugGroup];
}

- (void)_renderOffscreenBloomTextureWithViewport:(NUNIViewport)a3 sceneTexture:(id)a4 commandBuffer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(NUNICalliopeRenderer *)self _getOrCreateOffscreenBloomWithViewport:a3];
  long long v11 = [v10 renderPassDescriptor];
  id v12 = [v8 renderCommandEncoderWithDescriptor:v11];

  id v13 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForBloomDownsample];
  [v12 setLabel:@"Καλλιόπη Bloom Downsample"];
  [v12 setRenderPipelineState:v13];
  v14[0] = 0;
  v14[1] = 0;
  *(double *)&v14[2] = (double)(int)[v10 width];
  *(double *)&v14[3] = (double)(int)[v10 height];
  long long v15 = xmmword_21E8F2360;
  [v12 setViewport:v14];
  [v12 setCullMode:0];
  [v12 setFragmentTexture:v9 atIndex:0];

  [v12 drawPrimitives:3 vertexStart:0 vertexCount:3];
  [v12 endEncoding];
}

- (void)_setupBloomChainWithViewport:(NUNIViewport)a3 bloomTexture:(id)a4
{
  id v30 = a4;
  if (!v30) {
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]();
  }
  unint64_t v6 = 0;
  float v7 = fmaxf((float)a3.width, (float)a3.height) * 0.025;
  do
    ++v6;
  while ((float)((float)(1 << v6) * 1.5) < v7);
  unint64_t v8 = 16;
  if (v6 < 0x10) {
    unint64_t v8 = v6;
  }
  if (v8 <= 2) {
    unint64_t v9 = 2;
  }
  else {
    unint64_t v9 = v8;
  }
  p_bloomChain = &self->_bloomChain;
  self->_bloomChain.numLevels = v9;
  long long v11 = objc_opt_new();
  objc_msgSend(v11, "setWidth:", (unint64_t)objc_msgSend(v30, "width") >> 1);
  objc_msgSend(v11, "setHeight:", (unint64_t)objc_msgSend(v30, "height") >> 1);
  [v11 setMipmapLevelCount:v9 - 1];
  [v11 setPixelFormat:25];
  [v11 setUsage:3];
  id v12 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  texture = self->_bloomChain.texture;
  self->_bloomChain.texture = v12;

  uint64_t v14 = [v30 width];
  uint64_t v15 = [v30 height];
  if (!v14) {
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]();
  }
  if (!v15) {
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]();
  }
  unint64_t v16 = 0;
  v17.i64[0] = v14;
  v17.i64[1] = v15;
  unint64_t v18 = 16;
  if (v6 < 0x10) {
    unint64_t v18 = v6;
  }
  if (v18 <= 2) {
    unint64_t v18 = 2;
  }
  uint64_t v19 = 32 * v18;
  uint64_t v20 = -1;
  uint64x2_t v31 = (uint64x2_t)vdupq_n_s64(1uLL);
  int64x2_t v32 = vdupq_n_s64(7uLL);
  do
  {
    int64x2_t v33 = v17;
    if (v16)
    {
      uint64_t v21 = -[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](p_bloomChain->texture, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)p_bloomChain->texture pixelFormat], [(MTLTexture *)p_bloomChain->texture textureType], v20, 1, 0, 1);
      uint64_t v22 = p_bloomChain->levels[v16 / 0x20].texture;
      p_bloomChain->levels[v16 / 0x20].texture = (MTLTexture *)v21;
    }
    else
    {
      uint64_t v23 = (MTLTexture *)v30;
      uint64_t v22 = self->_bloomChain.levels[0].texture;
      self->_bloomChain.levels[0].texture = v23;
    }

    simd_float4 v24 = (uint64x2_t *)((char *)p_bloomChain + v16);
    v24[1] = vshrq_n_u64((uint64x2_t)vaddq_s64(v33, v32), 3uLL);
    v24[2].i64[0] = 1;
    int8x16_t v25 = (int8x16_t)vcgtq_u64((uint64x2_t)v33, v31);
    int64x2_t v17 = vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v33, 1uLL), v25), (int64x2_t)vmvnq_s8(v25));
    v16 += 32;
    ++v20;
  }
  while (v19 != v16);
  if (v9 <= 0xF)
  {
    unint64_t v26 = 16;
    if (v6 < 0x10) {
      unint64_t v26 = v6;
    }
    if (v26 <= 2) {
      unint64_t v26 = 2;
    }
    unint64_t v27 = v26 - 1;
    simd_float4 v28 = &self->_bloomChain.levels[v26];
    do
    {
      simd_float4 v29 = v28->texture;
      v28->texture = 0;

      v28->numThreadgroups.int width = 0;
      v28->numThreadgroups.uint64_t height = 0;
      v28->numThreadgroups.depth = 0;
      ++v27;
      ++v28;
    }
    while (v27 < 0xF);
  }
}

- (void)_computeBloomChainTextures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NUNICalliopeResourceManager *)self->_resourceManager computePipelineForBloomChainDownsample];
  uint64_t v6 = [(NUNICalliopeResourceManager *)self->_resourceManager computePipelineForBloomChainUpsample];
  if (!v5) {
    -[NUNICalliopeRenderer _computeBloomChainTextures:]();
  }
  float v7 = (void *)v6;
  if (!v6) {
    -[NUNICalliopeRenderer _computeBloomChainTextures:]();
  }
  [v4 pushDebugGroup:@"Καλλιόπη Bloom Chain Downsample"];
  [v4 setComputePipelineState:v5];
  if (self->_bloomChain.numLevels != 1)
  {
    unint64_t v8 = 0;
    unint64_t v9 = &self->_bloomChain.levels[1];
    int64x2_t v13 = vdupq_n_s64(8uLL);
    do
    {
      if (!v9[-1].texture) {
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.5();
      }
      if (!v9->texture) {
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.6();
      }
      ++v8;
      objc_msgSend(v4, "setTexture:atIndex:");
      [v4 setTexture:v9->texture atIndex:1];
      long long v17 = *(_OWORD *)&v9->numThreadgroups.width;
      depth = (MTLTexture *)v9->numThreadgroups.depth;
      int64x2_t v15 = v13;
      uint64_t v16 = 1;
      [v4 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
      ++v9;
    }
    while (v8 < self->_bloomChain.numLevels - 1);
  }
  objc_msgSend(v4, "popDebugGroup", *(_OWORD *)&v13);
  [v4 pushDebugGroup:@"Καλλιόπη Bloom Chain Upsample"];
  [v4 setComputePipelineState:v7];
  unint64_t numLevels = self->_bloomChain.numLevels;
  unint64_t v11 = numLevels - 1;
  if (numLevels - 1 >= 2)
  {
    id v12 = &self->_contentMaskTextures[4 * numLevels];
    int64x2_t v14 = vdupq_n_s64(8uLL);
    do
    {
      if (!v12[4]) {
        -[NUNICalliopeRenderer _computeBloomChainTextures:]();
      }
      if (!*v12) {
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.4();
      }
      objc_msgSend(v4, "setTexture:atIndex:");
      [v4 setTexture:*v12 atIndex:1];
      long long v17 = *(_OWORD *)(v12 + 1);
      depth = v12[3];
      int64x2_t v15 = v14;
      uint64_t v16 = 1;
      [v4 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
      --v11;
      v12 -= 4;
    }
    while (v11 > 1);
  }
  objc_msgSend(v4, "popDebugGroup", *(_OWORD *)&v14);
}

- (void)_renderOffscreenPostWithScene:(const NUNISceneStructure *)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  NUNIViewport v8 = a4;
  NUNIViewport height = (NUNIViewport)a4.height;
  unint64_t v11 = self->_offscreenScenes[a6];
  id v12 = self->_offscreenPosts;
  p_bloomChain = &self->_bloomChain;
  *(float *)&self->_anon_421[191] = 1.0 / (float)(self->_bloomChain.numLevels - 1);
  uint64_t v42 = 0;
  simd_float4 v43 = 0;
  id v14 = a5;
  int64x2_t v15 = [(NUNICalliopeRenderer *)self getUniformsBufferForFrameBufferIndex:a6 pContents:&v43 pOffset:&v42];
  uint64_t v16 = v43;
  *simd_float4 v43 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  long long v17 = *(_OWORD *)&self->_anon_421[63];
  long long v19 = *(_OWORD *)&self->_anon_421[15];
  long long v18 = *(_OWORD *)&self->_anon_421[31];
  v16[3] = *(_OWORD *)&self->_anon_421[47];
  v16[4] = v17;
  v16[1] = v19;
  v16[2] = v18;
  long long v20 = *(_OWORD *)&self->_anon_421[127];
  long long v22 = *(_OWORD *)&self->_anon_421[79];
  long long v21 = *(_OWORD *)&self->_anon_421[95];
  v16[7] = *(_OWORD *)&self->_anon_421[111];
  v16[8] = v20;
  v16[5] = v22;
  v16[6] = v21;
  long long v23 = *(_OWORD *)&self->_anon_421[191];
  long long v25 = *(_OWORD *)&self->_anon_421[143];
  long long v24 = *(_OWORD *)&self->_anon_421[159];
  v16[11] = *(_OWORD *)&self->_anon_421[175];
  v16[12] = v23;
  v16[9] = v25;
  v16[10] = v24;
  if (!v12
    || [(NUNCalliopeOffscreen *)v12 width] != v8.width
    || [(NUNCalliopeOffscreen *)v12 height] != height.width)
  {
    [MEMORY[0x263F32148] sharedNilTexture2D];
    v27 = unint64_t v26 = v11;
    id v39 = v14;
    NUNIViewport v28 = v8;
    NUNIViewport v8 = height;
    simd_float4 v29 = [NUNCalliopeOffscreen alloc];
    id v30 = v15;
    device = self->_device;
    int64x2_t v32 = [(NUNCalliopeOffscreen *)v26 texture1];
    int64x2_t v33 = v29;
    NUNIViewport height = v8;
    v8.int width = v28.width;
    float32x4_t v34 = -[NUNCalliopeOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](v33, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", device, v28, height, v27, v32, 1, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong((id *)&self->_offscreenPosts, v34);
    unint64_t v11 = v26;
    id v12 = v34;
    int64x2_t v15 = v30;
    id v14 = v39;
    p_bloomChain = &self->_bloomChain;
  }
  float32x4_t v35 = [(NUNCalliopeOffscreen *)v11 texture0];
  [(NUNCalliopeOffscreen *)v12 setTexture0:v35];

  int32x4_t v36 = [(NUNCalliopeOffscreen *)v12 renderPassDescriptor];
  id v37 = [v14 renderCommandEncoderWithDescriptor:v36];

  uint64_t v38 = [(NUNICalliopeResourceManager *)self->_resourceManager renderOffscreenPipelineForPost];
  [v37 setLabel:@"Καλλιόπη Post"];
  [v37 setRenderPipelineState:v38];
  v40[0] = 0;
  v40[1] = 0;
  *(double *)&v40[2] = (double)v8.width;
  *(double *)&v40[3] = (double)height.width;
  long long v41 = xmmword_21E8F2360;
  [v37 setViewport:v40];
  [v37 setCullMode:0];
  [v37 setFragmentBuffer:v15 offset:v42 atIndex:0];
  [v37 setFragmentTexture:p_bloomChain->texture atIndex:1];
  [v37 drawPrimitives:3 vertexStart:0 vertexCount:3];
  [v37 endEncoding];
}

- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5
{
  -[NUNICalliopeRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", [a3 structure], a4);
  [(NUNICalliopeRenderer *)self _updateBaseUniformsForViewport:a4];
}

- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  id v18 = a5;
  unint64_t v10 = self->_frame % 3;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [v12 structure];
  id v14 = [v11 colorAttachments];

  int64x2_t v15 = [v14 objectAtIndexedSubscript:0];

  uint64_t v16 = [v15 texture];
  self->_renderUniformsBuffersCounts[v10].uint64_t current = 0;
  long long v17 = [v12 spheroids];

  [(NUNICalliopeRenderer *)self _renderOffscreenSceneWithScene:v13 spheroids:v17 viewport:a4 commandBuffer:v18 frameBufferIndex:v10 drawableTexture:v16];
  if (self->_bloomEnabled) {
    [(NUNICalliopeRenderer *)self _renderOffscreenPostWithScene:v13 viewport:a4 commandBuffer:v18 frameBufferIndex:v10];
  }
  [(NUNCalliopeOffscreen *)self->_offscreenScenes[v10] setTexture0:0];
  [(NUNCalliopeOffscreen *)self->_offscreenPosts setTexture0:0];
  [(CALayer *)self->_contentMaskLayer setContents:self->_contentMaskSurfaces[v10]];
  ++self->_frame;
}

- (void)prepareWorldSpaceFrustumWithTransform:(id *)a3 withState:(id *)a4
{
  v12.columns[2] = (simd_float4)*((_OWORD *)a3 + 2);
  v12.columns[3] = (simd_float4)*((_OWORD *)a3 + 3);
  v12.columns[0] = *(simd_float4 *)a3;
  v12.columns[1] = (simd_float4)*((_OWORD *)a3 + 1);
  simd_float4x4 v13 = __invert_f4(v12);
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    uint64_t v7 = 0;
    char v8 = v6;
    unint64_t v9 = (char *)&prepareWorldSpaceFrustumWithTransform_withState__projectedPositions + 64 * v5;
    unint64_t v10 = (char *)a4 + 64 * v5;
    do
    {
      float32x4_t v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13.columns[0], COERCE_FLOAT(*(_OWORD *)&v9[v7])), (float32x4_t)v13.columns[1], *(float32x2_t *)&v9[v7], 1), (float32x4_t)v13.columns[2], *(float32x4_t *)&v9[v7], 2), (float32x4_t)v13.columns[3], *(float32x4_t *)&v9[v7], 3);
      *(float32x4_t *)&v10[v7] = vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 3));
      v7 += 16;
    }
    while (v7 != 64);
    char v6 = 0;
    uint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
}

- (void)prepareObjectSpaceFrustumWithTransform:(id *)a3 withState:(id *)a4
{
  v18.columns[2] = (simd_float4)*((_OWORD *)a3 + 2);
  v18.columns[3] = (simd_float4)*((_OWORD *)a3 + 3);
  v18.columns[0] = *(simd_float4 *)a3;
  v18.columns[1] = (simd_float4)*((_OWORD *)a3 + 1);
  simd_float4x4 v19 = __invert_f4(v18);
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    uint64_t v8 = 0;
    char v9 = v7;
    unint64_t v10 = (char *)a4 + 64 * v6;
    do
    {
      *(float32x4_t *)&v10[v8 + 128] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v19.columns[0], COERCE_FLOAT(*(_OWORD *)&v10[v8])), (float32x4_t)v19.columns[1], *(float32x2_t *)&v10[v8], 1), (float32x4_t)v19.columns[2], *(float32x4_t *)&v10[v8], 2), (float32x4_t)v19.columns[3], *(float32x4_t *)&v10[v8], 3);
      v8 += 16;
    }
    while (v8 != 64);
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v9 & 1) != 0);
  float32x4_t v11 = (double *)((char *)a4 + 256);
  uint64_t v12 = -4;
  do
  {
    BOOL v13 = __CFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    uint64_t v15 = v12 + 5;
    if (v13) {
      uint64_t v15 = 0;
    }
    [(NUNICalliopeRenderer *)self buildFrustumPlane:*(v11 - 16) p2:*(v11 - 8) p3:*((double *)a4 + 2 * v15 + 24)];
    *(_OWORD *)float32x4_t v11 = v16;
    v11 += 2;
    uint64_t v12 = v14;
  }
  while (v14);
  [(NUNICalliopeRenderer *)self buildFrustumPlane:*((double *)a4 + 16) p2:*((double *)a4 + 18) p3:*((double *)a4 + 20)];
  *((_OWORD *)a4 + 20) = v17;
}

- (double)buildFrustumPlane:(float32x4_t)a1 p2:(float32x4_t)a2 p3:(float32x4_t)a3
{
  float32x4_t v3 = vsubq_f32(a2, a1);
  float32x4_t v4 = vsubq_f32(a3, a2);
  float32x4_t v5 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL), vnegq_f32(v3)), v4, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v3, (int32x4_t)v3), (int8x16_t)v3, 0xCuLL));
  float32x4_t v6 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5), (int8x16_t)v5, 0xCuLL);
  int32x4_t v7 = (int32x4_t)vmulq_f32(v5, v5);
  v7.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), *(float32x2_t *)v7.i8)).u32[0];
  *(float32x2_t *)v5.f32 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  *(float32x2_t *)v5.f32 = vmul_f32(*(float32x2_t *)v5.f32, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(*(float32x2_t *)v5.f32, *(float32x2_t *)v5.f32)));
  *(void *)&double result = vmulq_n_f32(v6, vmul_f32(*(float32x2_t *)v5.f32, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(*(float32x2_t *)v5.f32, *(float32x2_t *)v5.f32))).f32[0]).u64[0];
  return result;
}

- (int)classifyObjectBoundingBoxVersusFrustum:(NUNICalliopeRenderer *)self max:(SEL)a2 withState:
{
  unint64_t v5 = 0;
  BOOL v6 = 0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v20 = v2;
  uint64_t v21 = v3;
  char v7 = 1;
  __asm { FMOV            V0.4S, #1.0 }
  do
  {
    unsigned int v13 = 0;
    float v14 = -3.4028e38;
    float v15 = 3.4028e38;
    do
    {
      v16.i32[3] = HIDWORD(_Q0);
      v16.i32[0] = *(_DWORD *)*(&v20 + (v13 & 1));
      v16.i32[1] = *(_DWORD *)(*(&v20 + ((v13 >> 1) & 1)) + 4);
      v16.i32[2] = *(_DWORD *)(*(&v20 + (v13 >> 2)) + 8);
      int8x16_t v17 = (int8x16_t)vmulq_f32(*(float32x4_t *)(v4 + 16 * v5 + 256), v16);
      *(float *)v17.i32 = vaddv_f32(vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)));
      float v15 = fminf(v15, *(float *)v17.i32);
      float v14 = fmaxf(v14, *(float *)v17.i32);
      ++v13;
    }
    while (v13 != 8);
    if (v14 < 0.0) {
      break;
    }
    v7 &= v15 >= 0.0;
    BOOL v6 = v5++ > 3;
  }
  while (v5 != 5);
  if (v7) {
    int v18 = 1;
  }
  else {
    int v18 = 2;
  }
  if (v6) {
    return v18;
  }
  else {
    return 0;
  }
}

- (BOOL)isObjectBoundingBoxInsideOrIntersectingFrustum:(NUNICalliopeRenderer *)self max:(SEL)a2 withState:
{
  unint64_t v5 = 0;
  BOOL v6 = 0;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v17 = v2;
  uint64_t v18 = v3;
  __asm { FMOV            V0.4S, #1.0 }
  do
  {
    unsigned int v12 = 0;
    float v13 = -3.4028e38;
    do
    {
      v14.i32[3] = HIDWORD(_Q0);
      v14.i32[0] = *(_DWORD *)*(&v17 + (v12 & 1));
      v14.i32[1] = *(_DWORD *)(*(&v17 + ((v12 >> 1) & 1)) + 4);
      v14.i32[2] = *(_DWORD *)(*(&v17 + (v12 >> 2)) + 8);
      int8x16_t v15 = (int8x16_t)vmulq_f32(*(float32x4_t *)(v4 + 16 * v5 + 256), v14);
      float v13 = fmaxf(v13, vaddv_f32(vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL))));
      ++v12;
    }
    while (v12 != 8);
    if (v13 < 0.0) {
      break;
    }
    BOOL v6 = v5++ > 3;
  }
  while (v5 != 5);
  return v6;
}

- (id)spheroidAtPoint:(id)a3 scene:(NUNIViewport)a4 viewport:
{
  float32x2_t v6 = v4;
  uint64_t v60 = *MEMORY[0x263EF8340];
  int height = a4.height;
  id v9 = a3;
  -[NUNICalliopeRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", [v9 structure], a4);
  p_state = &self->_state;
  memset(v59, 0, sizeof(v59));
  long long v50 = v9;
  float32x4_t v11 = [v9 spheroids];
  int v12 = [v11 count];
  if (v12 < 1)
  {
    int v14 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    int v14 = 0;
    uint64_t v15 = v12;
    do
    {
      float32x4_t v16 = [v11 objectAtIndexedSubscript:v13];
      uint64_t v17 = (float32x4_t *)[v16 structure];

      if (v17[5].f32[2] > 0.00001 && v17[3].f32[0] > 0.00001 && v17[9].i8[8] && ((1 << v17->i32[0]) & 0x3FE) != 0)
      {
        _S2 = vsubq_f32((float32x4_t)p_state[32], v17[96]).i32[2];
        __asm { FMLA            S1, S2, V0.S[2] }
        long long v24 = &__base[8 * v14];
        _DWORD *v24 = _S1;
        v24[1] = v13;
        *((void *)v59 + v13) = v17;
        ++v14;
      }
      ++v13;
    }
    while (v15 != v13);
  }
  float width = (float)a4.width;
  float v53 = (float)height;
  qsort(__base, v14, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNICalliopeRenderCompareObject);
  __asm { FMOV            V1.2S, #1.0 }
  v26.i32[1] = _D1.i32[1];
  if (height > a4.width)
  {
    _D1.f32[1] = width / v53;
    float32x2_t v27 = _D1;
  }
  else
  {
    v26.f32[0] = v53 / width;
    float32x2_t v27 = v26;
  }
  if (v14 < 1)
  {
LABEL_18:
    simd_float4 v48 = 0;
  }
  else
  {
    v28.f32[1] = (float)height;
    v28.f32[0] = (float)a4.width;
    float32x2_t v29 = vmla_f32((float32x2_t)0x3F800000BF800000, (float32x2_t)0xC000000040000000, vdiv_f32(v6, v28));
    float32x4_t v54 = *(float32x4_t *)&p_state[9].aspect;
    float32x4_t v56 = *(float32x4_t *)&p_state[8].fovY;
    float32x4_t v51 = *(float32x4_t *)&p_state[11].viewport.height;
    float32x4_t v52 = *(float32x4_t *)&p_state[10].cameraRoll;
    float fovY = p_state->fovY;
    float32x2_t v31 = *(float32x2_t *)&p_state[1].viewport.height;
    uint64_t v32 = v14;
    int64x2_t v33 = &v58;
    while (1)
    {
      uint64_t v35 = *v33;
      v33 += 2;
      uint64_t v34 = v35;
      float32x4_t v36 = *(float32x4_t *)(*((void *)v59 + v35) + 96);
      v36.i32[3] = 1.0;
      UMMul(v56, v54, v52, v51, v36);
      _NUNICalliopeRenderer_ComputeProjectedSpheroid(fovY);
      float32x2_t v38 = vmul_f32(v27, v37);
      float32x2_t v40 = vmul_f32(v27, v39);
      int32x2_t v42 = (int32x2_t)vmul_f32(v38, v38);
      int32x2_t v43 = (int32x2_t)vmul_f32(v40, v40);
      int32x2_t v44 = (int32x2_t)vadd_f32((float32x2_t)vzip1_s32(v42, v43), (float32x2_t)vzip2_s32(v42, v43));
      float32x2_t v45 = vsub_f32(v29, vmul_f32(v27, vsub_f32(v41, v31)));
      int32x2_t v46 = (int32x2_t)vmul_f32(v45, v45);
      float32x2_t v47 = vadd_f32((float32x2_t)vzip1_s32(v46, v44), (float32x2_t)vzip2_s32(v46, v44));
      if ((vmvn_s8((int8x8_t)vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v47, 1), v47)).u8[0] & 1) == 0) {
        break;
      }
      if (!--v32) {
        goto LABEL_18;
      }
    }
    simd_float4 v48 = [v11 objectAtIndexedSubscript:v34];
  }

  return v48;
}

- (NUNICalliopeResourceManager)resourceManager
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
  __destructor_8_s0_AB8s32n16_S_s8_AE((id *)&self->_bloomChain.texture);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_contentMaskSurfaces[i], 0);
  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_contentMaskTextures[j], 0);
  objc_storeStrong((id *)&self->_offscreenPosts, 0);
  objc_storeStrong((id *)&self->_offscreenBloom, 0);
  for (uint64_t k = 2; k != -1; --k)
    objc_storeStrong((id *)&self->_offscreenScenes[k], 0);
  for (uint64_t m = 2; m != -1; --m)
    objc_storeStrong((id *)&self->_renderUniformsBuffers[m], 0);
  objc_storeStrong((id *)&self->_textureGroup, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)getUniformsBufferForFrameBufferIndex:(os_log_t)log pContents:pOffset:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E8AA000, log, OS_LOG_TYPE_ERROR, "failed to create buffer, reverting to dummyUniforms", v1, 2u);
}

- (void)_setupBloomChainWithViewport:bloomTexture:.cold.1()
{
  __assert_rtn("-[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]", "NUNICalliopeRenderer.m", 2033, "texture != nil");
}

- (void)_setupBloomChainWithViewport:bloomTexture:.cold.2()
{
}

- (void)_setupBloomChainWithViewport:bloomTexture:.cold.3()
{
}

- (void)_computeBloomChainTextures:.cold.1()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2117, "downsamplePipelineState != nil");
}

- (void)_computeBloomChainTextures:.cold.2()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2118, "upsamplePipelineState != nil");
}

- (void)_computeBloomChainTextures:.cold.3()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2160, "source->texture != nil");
}

- (void)_computeBloomChainTextures:.cold.4()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2161, "destination->texture != nil");
}

- (void)_computeBloomChainTextures:.cold.5()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2135, "source->texture != nil");
}

- (void)_computeBloomChainTextures:.cold.6()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2136, "destination->texture != nil");
}

@end