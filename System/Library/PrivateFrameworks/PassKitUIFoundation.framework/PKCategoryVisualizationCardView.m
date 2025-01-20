@interface PKCategoryVisualizationCardView
- (BOOL)isBlurDisabled;
- (BOOL)isMotionEnabled;
- (BOOL)isPaused;
- (NSArray)bucketColors;
- (NSSet)magnitudes;
- (PKCategoryVisualizationCardView)init;
- (PKCategoryVisualizationCardView)initWithFrame:(CGRect)a3;
- (float)_calculateNewCirclePositions;
- (id)rendererState;
- (unint64_t)_updateRenderPassDescriptorWithDrawable:(void *)a1;
- (void)_createMetalResourcesWithTextures:(uint64_t)a1;
- (void)_empty;
- (void)_startMotionUpdates;
- (void)_stopMotionUpdates;
- (void)_updateCircles;
- (void)_updateMotionEnabled;
- (void)_updatePausedState;
- (void)_updateTextureAndBlurShader;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)motionManager:(id)a3 didReceiveMotion:(id)a4;
- (void)renderLoop:(id)a3 drawAtTime:(double)a4;
- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4;
- (void)renderWithTextures:(id)a3 rendererState:(id)a4;
- (void)setBlurDisabled:(BOOL)a3;
- (void)setBucketColors:(id)a3;
- (void)setMagnitudes:(id)a3 withStyle:(int64_t)a4;
- (void)setMotionEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation PKCategoryVisualizationCardView

float32x4_t __68__PKCategoryVisualizationCardView_renderWithTextures_rendererState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float64_t v10 = 0.0;
  float64_t v11 = 0.0;
  float64_t v8 = 0.0;
  float64_t v9 = 0.0;
  [a2 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];
  v5.f64[0] = v11;
  v6.f64[0] = v9;
  v5.f64[1] = v10;
  v6.f64[1] = v8;
  float32x4_t result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v6);
  *(float32x4_t *)(*(void *)(a1 + 56) + 16 * a3) = result;
  return result;
}

- (void)setMagnitudes:(id)a3 withStyle:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!self->_invalidated)
  {
    float64x2_t v6 = (NSSet *)[a3 copy];
    magnitudes = self->_magnitudes;
    self->_magnitudes = v6;

    unint64_t bucketCount = self->_state.bucketCount;
    if (bucketCount) {
      bzero(self->_state.magnitudeForBucket, 8 * bucketCount);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    float64_t v9 = self->_magnitudes;
    uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "magnitude", (void)v20);
          double v16 = fmin(fmax(v15, 0.0), 1.0);
          unint64_t v17 = [v14 bucket];
          BOOL v18 = v16 <= 0.0 || (uint64_t)v17 < 1;
          if (!v18 && v17 < self->_state.bucketCount) {
            self->_state.magnitudeForBucket[v17] = fmin(fmax(v16 + self->_state.magnitudeForBucket[v17], 0.0), 1.0);
          }
        }
        uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    self->_needsDraw = 1;
    -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
    if (!self->_emptying)
    {
      if ((unint64_t)(a4 - 1) <= 1 && self->_effectivePaused)
      {
        self->_hasPendingUpdate = 1;
        self->_pendingUpdateStyle = a4;
        return;
      }
      self->_hasPendingUpdate = 0;
      if (a4 == 2)
      {
        -[PKCategoryVisualizationCardView _empty](self);
        return;
      }
      if (a4 == 1)
      {
        if (!self->_anon_268[10156])
        {
          self->_anon_268[10156] = 1;
          v19.n128_u64[0] = 0x4170000033D6BF95;
          *(void *)&self->_anon_268[172] = 0x4170000033D6BF95;
        }
      }
      else if (a4)
      {
        return;
      }
      [(PKCategoryVisualizationCardView *)(uint64_t)self _updateCircles];
    }
  }
}

- (void)_updateCircles
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  uint64_t v3 = *(void *)(a1 + 880);
  uint64_t v4 = *(void *)(a1 + 600);
  if (v4)
  {
    uint64_t v5 = 0;
    float64x2_t v6 = *(double **)(a1 + 608);
    do
    {
      double v7 = *v6++;
      a2.n128_f64[0] = v7;
      if (v7 > 0.0) {
        ++v5;
      }
      --v4;
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)(a1 + 10752) = v5;
  MEMORY[0x270FA5388](a2);
  float64_t v8 = v50;
  v56 = v50;
  if (!v3)
  {
    uint32_t v46 = arc4random();
    float64_t v8 = v56;
    float v47 = (float)((float)v46 * 2.3283e-10) * 6.28318531;
    float v54 = v47;
    unint64_t v48 = *(void *)(a1 + 600);
    float v49 = 6.28318531 / (double)v48;
    float v53 = v49;
    if (v48) {
      goto LABEL_11;
    }
LABEL_43:
    size_t v11 = 0;
    char v45 = 1;
    goto LABEL_45;
  }
  uint64_t v9 = *(void *)(a1 + 600);
  float v54 = 0.0;
  float v53 = 0.0;
  if (!v9) {
    goto LABEL_43;
  }
LABEL_11:
  v51[1] = v51;
  unint64_t v10 = 0;
  size_t v11 = 0;
  uint64_t v12 = (void *)(a1 + 592);
  v55 = v8 + 28;
  float64x2_t v59 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
  float64x2_t v52 = (float64x2_t)vdupq_n_s64(0x3FD999999999999AuLL);
  float32x2_t v13 = (float32x2_t)vdup_n_s32(0x2F800000u);
  __asm { FMOV            V0.2D, #2.0 }
  float64x2_t v58 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  float64x2_t v57 = _Q0;
  do
  {
    double v20 = *(double *)(v12[2] + 8 * v10);
    if (v20 <= 0.0) {
      goto LABEL_39;
    }
    double v21 = v20 * 80.0;
    BOOL v22 = v21 > 1.0 || v21 <= 0.0;
    unint64_t v23 = vcvtad_u64_f64(v21);
    if (!v22) {
      unint64_t v23 = 1;
    }
    unint64_t v24 = 88 - v11 >= v23 ? v23 : 88 - v11;
    if (!v24) {
      goto LABEL_39;
    }
    if (!v3)
    {
      __float2 v37 = __sincosf_stret(v54 + (float)((float)v10 * v53));
      float32x2_t v29 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32((float32x2_t)v37), v52));
      goto LABEL_34;
    }
    uint64_t v25 = v12[36];
    if (!v25)
    {
      float32x2_t v29 = 0;
LABEL_34:
      v38 = &v55[112 * v11];
      do
      {
        long long v60 = *(_OWORD *)(*(void *)(a1 + 616) + 16 * v10);
        float32x2_t v39 = v29;
        if (v3)
        {
          uint32_t v40 = arc4random();
          float32x2_t v39 = vadd_f32(v29, vcvt_f32_f64(vmulq_f64(vmlaq_f64(v57, v58, vcvtq_f64_f32(vmul_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(arc4random(), v40)), v13))), v59)));
        }
        float v41 = (float)((float)((float)arc4random() * 2.3283e-10) * 0.12) + 0.04;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        float v42 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 592);
        *(float32x2_t *)(v38 - 28) = v39;
        *(void *)(v38 - 20) = 0;
        *((float *)v38 - 3) = v41;
        *((void *)v38 - 1) = 0x3F8000003DCCCCCDLL;
        *(float *)v38 = v42;
        *(_OWORD *)(v38 + 4) = v60;
        long long v43 = v62;
        *(_OWORD *)(v38 + 20) = v61;
        *(_OWORD *)(v38 + 36) = v43;
        long long v44 = v64;
        *(_OWORD *)(v38 + 52) = v63;
        *(_OWORD *)(v38 + 68) = v44;
        ++v11;
        v38 += 112;
        --v24;
      }
      while (v24);
      goto LABEL_38;
    }
    unint64_t v26 = 0;
    float32x4_t v27 = *(float32x4_t *)(v12[3] + 16 * v10);
    v28 = v12 + 38;
    float32x2_t v29 = 0;
    do
    {
      float32x4_t v30 = *((float32x4_t *)v28 + 2);
      if ((vminvq_u32((uint32x4_t)vceqq_f32(v30, v27)) & 0x80000000) != 0)
      {
        float32x2_t v31 = *(float32x2_t *)v28;
        v32 = &v8[112 * v11];
        *(void *)v32 = *v28;
        uint64_t v33 = v28[3];
        *(_OWORD *)(v32 + 8) = *(_OWORD *)(v28 + 1);
        *((void *)v32 + 3) = v33;
        *((float32x4_t *)v32 + 2) = v30;
        long long v34 = *((_OWORD *)v28 + 6);
        long long v36 = *((_OWORD *)v28 + 3);
        long long v35 = *((_OWORD *)v28 + 4);
        *((_OWORD *)v32 + 5) = *((_OWORD *)v28 + 5);
        *((_OWORD *)v32 + 6) = v34;
        *((_OWORD *)v32 + 3) = v36;
        *((_OWORD *)v32 + 4) = v35;
        ++v11;
        float32x2_t v29 = vadd_f32(v29, v31);
        if (++v26 >= v24) {
          break;
        }
      }
      v28 += 14;
      --v25;
    }
    while (v25);
    if (v26)
    {
      v27.f32[0] = (float)v26;
      float32x2_t v29 = vdiv_f32(v29, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0));
    }
    BOOL v22 = v24 > v26;
    v24 -= v26;
    if (v22) {
      goto LABEL_34;
    }
LABEL_38:
    float64_t v8 = v56;
    if (v11 > 0x57) {
      goto LABEL_41;
    }
LABEL_39:
    ++v10;
    uint64_t v12 = (void *)(a1 + 592);
  }
  while (v10 < *(void *)(a1 + 600));
  if (v11)
  {
LABEL_41:
    qsort(v8, v11, 0x70uLL, (int (__cdecl *)(const void *, const void *))PKCompareCircleDataByCreated);
    float64_t v8 = v56;
    char v45 = 0;
    goto LABEL_45;
  }
  char v45 = 1;
LABEL_45:
  memcpy((void *)(a1 + 896), v8, 112 * v11);
  *(void *)(a1 + 880) = v11;
  if (!v3 && (v45 & 1) == 0)
  {
    *(_DWORD *)(a1 + 10768) += 210;
    -[PKCategoryVisualizationCardView _updatePausedState](a1);
  }
}

- (void)renderWithTextures:(id)a3 rendererState:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  float64x2_t v6 = (char *)a4;
  if (!self->_invalidated)
  {
    id v7 = a3;
    PKCategoryVisualizationRendererStateDestroy((uint64_t)&self->_state);
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v8 = *(_OWORD *)&self->_anon_268[24];
      long long v23 = *(_OWORD *)&self->_anon_268[8];
      long long v24 = v8;
      long long v9 = *(_OWORD *)&self->_anon_268[56];
      long long v25 = *(_OWORD *)&self->_anon_268[40];
      long long v26 = v9;
      memcpy(v21, v6 + 16, sizeof(v21));
      PKCategoryVisualizationRendererStateCopy((uint64_t)v21, (uint64_t)v22);
      memcpy(&self->_state, v22, 0x27D0uLL);
      long long v10 = v24;
      *(_OWORD *)&self->_anon_268[8] = v23;
      *(_OWORD *)&self->_anon_268[24] = v10;
      long long v11 = v26;
      *(_OWORD *)&self->_anon_268[40] = v25;
      *(_OWORD *)&self->_anon_268[56] = v11;
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      unint64_t v13 = [(NSArray *)self->_bucketColors count];
      v14 = malloc_type_malloc(8 * v13, 0xB464822DuLL);
      bzero(v14, 8 * v13);
      double v15 = malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
      bucketColors = self->_bucketColors;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __68__PKCategoryVisualizationCardView_renderWithTextures_rendererState___block_invoke;
      v18[3] = &__block_descriptor_10224_e24_v32__0__UIColor_8Q16_B24l;
      *(double *)&v18[4] = Current;
      v18[5] = v13;
      v18[6] = v14;
      v18[7] = v15;
      bzero(v19, 0x2798uLL);
      int32x2_t v17 = vdup_n_s32(0xBBA3D70A);
      v19[1267] = v17;
      long long v20 = 0u;
      [(NSArray *)bucketColors enumerateObjectsUsingBlock:v18];
      self->_state.startTime = Current;
      self->_state.unint64_t bucketCount = v13;
      self->_state.magnitudeForBucket = (double *)v14;
      *(void *)self->_anon_268 = v15;
      bzero(&self->_anon_268[8], 0x2798uLL);
      *(int32x2_t *)&self->_anon_268[10144] = v17;
      *(_OWORD *)&self->_anon_268[10152] = 0u;
    }
    -[PKCategoryVisualizationCardView _createMetalResourcesWithTextures:]((uint64_t)self, v7);
  }
}

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "attitude", a3);
  [v5 quaternion];
  v7.f64[1] = v6;
  v9.f64[1] = v8;
  float32x4_t v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7);

  float32x4_t v10 = vmulq_f32(v40, (float32x4_t)xmmword_21EEE7850);
  int32x4_t v11 = (int32x4_t)vnegq_f32(v10);
  int8x16_t v12 = (int8x16_t)vtrn2q_s32((int32x4_t)v10, vtrn1q_s32((int32x4_t)v10, v11));
  float32x4_t v39 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v10, (int8x16_t)v11, 8uLL), (float32x4_t)0);
  float32x4_t v13 = (float32x4_t)vrev64q_s32((int32x4_t)v10);
  v13.i32[0] = v11.i32[1];
  v13.i32[3] = v11.i32[2];
  float32x4_t v38 = (float32x4_t)vextq_s8(v12, v12, 8uLL);
  float32x4_t v41 = v10;
  float32x4_t v37 = v13;
  float32x4_t v14 = vaddq_f32(vmlaq_f32(v10, (float32x4_t)0, v13), vmlaq_f32(v39, (float32x4_t)0, v38));
  int8x16_t v15 = (int8x16_t)vmulq_f32(v14, v14);
  float32x2_t v16 = vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
  float32x4_t v17 = (float32x4_t)xmmword_21EEE7810;
  if (vaddv_f32(v16) != 0.0)
  {
    unsigned __int32 v18 = vadd_f32(v16, (float32x2_t)vdup_lane_s32((int32x2_t)v16, 1)).u32[0];
    float32x2_t v19 = vrsqrte_f32((float32x2_t)v18);
    float32x2_t v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18, vmul_f32(v19, v19)));
    float32x4_t v17 = vmulq_n_f32(v14, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18, vmul_f32(v20, v20))).f32[0]);
  }
  *(double *)v21.i64 = simd_matrix4x4(v17);
  p_state = &self->_state;
  p_state[423].magnitudeForBucket = (double *)vneg_f32((float32x2_t)*(_OWORD *)&vmlaq_f32(vaddq_f32(v23, vmlaq_f32(vmulq_f32(v21, (float32x4_t)0), (float32x4_t)0, v22)), (float32x4_t)0, v24));
  float32x4_t v26 = vaddq_f32(vmlaq_f32(vmulq_f32(v41, (float32x4_t)vdupq_n_s32(0x3F74C5EFu)), (float32x4_t)0, v37), vmlaq_f32(v39, (float32x4_t)vdupq_n_s32(0x3E95F619u), v38));
  int8x16_t v27 = (int8x16_t)vmulq_f32(v26, v26);
  float32x2_t v28 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
  float32x4_t v29 = (float32x4_t)xmmword_21EEE7810;
  if (vaddv_f32(v28) != 0.0)
  {
    unsigned __int32 v30 = vadd_f32(v28, (float32x2_t)vdup_lane_s32((int32x2_t)v28, 1)).u32[0];
    float32x2_t v31 = vrsqrte_f32((float32x2_t)v30);
    float32x2_t v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30, vmul_f32(v31, v31)));
    float32x4_t v29 = vmulq_n_f32(v26, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30, vmul_f32(v32, v32))).f32[0]);
  }
  *(double *)&long long v33 = simd_matrix4x4(v29);
  *(_OWORD *)&p_state[4].startTime = v33;
  *(_OWORD *)&p_state[4].magnitudeForBucket = v34;
  *(_OWORD *)&p_state[5].unint64_t bucketCount = v35;
  *(_OWORD *)&p_state[6].startTime = v36;
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  if ([(PKMetalRenderLoop *)self->_renderLoop isDrawableAvailable])
  {
    uint64_t v5 = [(PKMetalRenderLoop *)self->_renderLoop currentDrawable];
    if (v5 && -[PKCategoryVisualizationCardView _updateRenderPassDescriptorWithDrawable:](self, v5))
    {
      *(float *)&double v7 = [(PKCategoryVisualizationCardView *)(uint64_t)self _calculateNewCirclePositions];
      float64_t v8 = (_OWORD *)[(MTLBuffer *)self->_circleUniformsBuffer contents];
      *float64_t v8 = *(_OWORD *)&self->_anon_268[8];
      long long v9 = *(_OWORD *)&self->_anon_268[72];
      long long v11 = *(_OWORD *)&self->_anon_268[24];
      long long v10 = *(_OWORD *)&self->_anon_268[40];
      v8[3] = *(_OWORD *)&self->_anon_268[56];
      v8[4] = v9;
      v8[1] = v11;
      v8[2] = v10;
      long long v12 = *(_OWORD *)&self->_anon_268[136];
      long long v14 = *(_OWORD *)&self->_anon_268[88];
      long long v13 = *(_OWORD *)&self->_anon_268[104];
      v8[7] = *(_OWORD *)&self->_anon_268[120];
      v8[8] = v12;
      v8[5] = v14;
      v8[6] = v13;
      memcpy((void *)[(MTLBuffer *)self->_circleDataBuffer contents], &self->_anon_268[280], 112 * *(void *)&self->_anon_268[264]);
      int8x16_t v15 = (_OWORD *)[(MTLBuffer *)self->_singleCircleDataBuffer contents];
      long long v17 = *(_OWORD *)&self->_anon_268[168];
      long long v16 = *(_OWORD *)&self->_anon_268[184];
      *int8x16_t v15 = *(_OWORD *)&self->_anon_268[152];
      v15[1] = v17;
      v15[2] = v16;
      long long v18 = *(_OWORD *)&self->_anon_268[248];
      long long v20 = *(_OWORD *)&self->_anon_268[200];
      long long v19 = *(_OWORD *)&self->_anon_268[216];
      v15[5] = *(_OWORD *)&self->_anon_268[232];
      v15[6] = v18;
      v15[3] = v20;
      v15[4] = v19;
      float32x4_t v21 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      if (self->_overlayTextureLoader || self->_overlayNormalTextureLoader)
      {
        float32x4_t v22 = [(PKMetalRenderLoop *)self->_renderLoop device];
        float32x4_t v23 = v21;
        float32x4_t v24 = [v21 blitCommandEncoder];
        overlayTextureLoader = self->_overlayTextureLoader;
        if (overlayTextureLoader)
        {
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke;
          v41[3] = &unk_2644F8F48;
          v41[4] = self;
          id v42 = v22;
          id v43 = v24;
          [(PKTextureLoader *)overlayTextureLoader tiling:1 read:v41];
          float32x4_t v26 = self->_overlayTextureLoader;
          self->_overlayTextureLoader = 0;
        }
        overlayNormalTextureLoader = self->_overlayNormalTextureLoader;
        if (overlayNormalTextureLoader)
        {
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke_46;
          v38[3] = &unk_2644F8F48;
          v38[4] = self;
          id v39 = v22;
          id v40 = v24;
          [(PKTextureLoader *)overlayNormalTextureLoader tiling:1 read:v38];
          float32x2_t v28 = self->_overlayNormalTextureLoader;
          self->_overlayNormalTextureLoader = 0;
        }
        [v24 endEncoding];

        float32x4_t v21 = v23;
      }
      if (!self->_overlayTexture || !self->_overlayNormalTexture)
      {
        [(PKCategoryVisualizationCardView *)self invalidate];
LABEL_26:

        goto LABEL_27;
      }
      float32x4_t v29 = [v21 renderCommandEncoderWithDescriptor:self->_renderPassDescriptor];
      [v29 setRenderPipelineState:self->_circlePipelineState];
      [v29 setVertexBuffer:self->_vertexCoordsBuffer offset:0 atIndex:0];
      [v29 setVertexBuffer:self->_textureCoordsBuffer offset:0 atIndex:1];
      [v29 setVertexBuffer:self->_circleUniformsBuffer offset:0 atIndex:2];
      [v29 setVertexBuffer:self->_circleDataBuffer offset:0 atIndex:3];
      if (*(void *)&self->_anon_268[264]) {
        objc_msgSend(v29, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 4, 0, 4);
      }
      unsigned __int32 v30 = v21;
      if (*(float *)&self->_anon_268[172] != *(float *)&self->_anon_268[176])
      {
        [v29 setRenderPipelineState:self->_circleOutlinePipelineState];
        [v29 setVertexBuffer:self->_singleCircleDataBuffer offset:0 atIndex:3];
        [v29 drawPrimitives:4 vertexStart:0 vertexCount:4];
      }
      [v29 endEncoding];

      blurShader = self->_blurShader;
      texture = self->_texture;
      long long v33 = [v5 texture];
      long long v34 = texture;
      float32x4_t v21 = v30;
      [(MPSUnaryImageKernel *)blurShader encodeToCommandBuffer:v30 sourceTexture:v34 destinationTexture:v33];

      long long v35 = [v30 renderCommandEncoderWithDescriptor:self->_secondRenderPassDescriptor];
      [v35 setRenderPipelineState:self->_overlayPipelineState];
      [v35 setVertexBuffer:self->_vertexCoordsBuffer offset:0 atIndex:0];
      [v35 setVertexBuffer:self->_textureCoordsBuffer offset:0 atIndex:1];
      [v35 setFragmentBuffer:self->_circleUniformsBuffer offset:0 atIndex:0];
      [v35 setFragmentTexture:self->_overlayTexture atIndex:0];
      [v35 setFragmentTexture:self->_overlayNormalTexture atIndex:1];
      [v35 drawPrimitives:4 vertexStart:0 vertexCount:4];
      [v35 endEncoding];
      [v30 presentDrawable:v5];
      [v30 commit];
      if (self->_needsDraw)
      {
        self->_needsDraw = 0;
        int v36 = *(_DWORD *)&self->_anon_268[10152];
        if (!v36) {
          goto LABEL_24;
        }
      }
      else
      {
        int v36 = *(_DWORD *)&self->_anon_268[10152];
        if (!v36) {
          goto LABEL_25;
        }
      }
      int v37 = v36 - 1;
      *(_DWORD *)&self->_anon_268[10152] = v37;
      if (!v37) {
LABEL_24:
      }
        -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_27:
}

- (float)_calculateNewCirclePositions
{
  if (!a1) {
    return result;
  }
  uint64_t v3 = (float32x2_t *)(a1 + 592);
  unint64_t v4 = *(void *)(a1 + 880);
  if (!v4) {
    goto LABEL_23;
  }
  unint64_t v5 = 0;
  float v6 = (float)*(unint64_t *)(a1 + 10752) * -0.14 + 1.5;
  __asm { FMOV            V3.2S, #-4.0 }
  float32x2_t v12 = (float32x2_t)vdup_n_s32(0x3D4CCCCDu);
  float32x2_t v13 = (float32x2_t)vdup_n_s32(0x3A83126Fu);
  float32x2_t v14 = (float32x2_t)vdup_n_s32(0x3F5C28F6u);
  float32x2_t v15 = (float32x2_t)vdup_n_s32(0xBE4CCCCD);
  do
  {
    uint64_t v16 = 0;
    long long v17 = &v3[14 * v5];
    long long v18 = v17 + 38;
    float32x2_t v19 = v17[38];
    float32x2_t v20 = v17[39];
    float v21 = v17[40].f32[0];
    float v22 = v17[40].f32[1];
    float v23 = v17[41].f32[0];
    float32x4_t v24 = *(float32x4_t *)v17[42].f32;
    v2.f32[0] = (float)(v21 * v22) * v6;
    long long v25 = (float32x4_t *)&v3[42];
    float32x2_t v26 = 0;
    do
    {
      if (v5 == v16) {
        goto LABEL_16;
      }
      float v27 = v25[-1].f32[0] * v25[-1].f32[1];
      unsigned int v28 = vminvq_u32((uint32x4_t)vceqq_f32(v24, *v25));
      float32x2_t v29 = vsub_f32(v19, *(float32x2_t *)v25[-2].f32);
      float v30 = sqrtf(vaddv_f32(vmul_f32(v29, v29))) - (float)(v2.f32[0] + v27);
      double v31 = v30;
      if ((v28 & 0x80000000) != 0 && v31 > 0.1)
      {
        float32x2_t v26 = vmla_f32(v26, v15, vmul_n_f32(v29, (float)(v2.f32[0] * v27) / (float)(v30 * v30)));
        goto LABEL_16;
      }
      if ((v28 & 0x80000000) != 0 && v30 < 0.0)
      {
        float v32 = v30 * v30;
LABEL_15:
        float32x2_t v26 = vmla_f32(v26, (float32x2_t)0x3F0000003F000000, vmul_n_f32(v29, v32 * 600.0));
        goto LABEL_16;
      }
      if ((v28 & 0x80000000) == 0 && v31 < 0.08)
      {
        float v33 = v31 + -0.08;
        float v32 = v33 * v33;
        goto LABEL_15;
      }
LABEL_16:
      ++v16;
      v25 += 7;
    }
    while (v4 != v16);
    double v34 = vaddv_f32(vmul_f32(v19, v19));
    if (v34 > 0.3)
    {
      float v35 = v34 + -0.3;
      float32x2_t v26 = vmla_f32(v26, _D3, vmul_n_f32(v19, v35));
    }
    float32x2_t v2 = vmla_f32(vdiv_f32(vmul_f32(vmla_f32(v26, v12, v3[1271]), v13), (float32x2_t)vdup_lane_s32((int32x2_t)v2, 0)), v14, v20);
    float32x2_t v36 = vadd_f32(v19, v2);
    double v37 = v22;
    double v38 = (float)(v23 - v22);
    if (v23 == 1.0) {
      double v39 = 0.04;
    }
    else {
      double v39 = 0.125;
    }
    float32_t v40 = v37 + v38 * v39;
    *(float *)&unsigned int v41 = (float)(v21 * v40) * 0.85;
    float v42 = *(float *)&v41;
    LODWORD(v43) = 0;
    HIDWORD(v43) = v41;
    *(void *)&long long v44 = 0;
    *((void *)&v44 + 1) = v41;
    *(float32x2_t *)&long long v45 = v36;
    *((void *)&v45 + 1) = 0x3F80000000000000;
    *long long v18 = v36;
    v18[1] = v2;
    v18[2].f32[1] = v40;
    *(_OWORD *)v18[6].f32 = LODWORD(v42);
    *(_OWORD *)v18[8].f32 = v43;
    *(_OWORD *)v18[10].f32 = v44;
    *(_OWORD *)v18[12].f32 = v45;
    ++v5;
    uint64_t v3 = (float32x2_t *)(a1 + 592);
    unint64_t v4 = *(void *)(a1 + 880);
  }
  while (v5 < v4);
LABEL_23:
  float v46 = v3[24].f32[1] + 0.075;
  v3[24].f32[1] = fminf(v46, v3[25].f32[0]);
  *(void *)&long long v47 = 0;
  float v48 = *(float *)(a1 + 788);
  float v49 = *(float *)(a1 + 792);
  LODWORD(v50) = 0;
  HIDWORD(v50) = 0;
  *(void *)((char *)&v50 + 4) = LODWORD(v48);
  *((void *)&v47 + 1) = LODWORD(v48);
  *(_OWORD *)(a1 + 816) = LODWORD(v48);
  *(_OWORD *)(a1 + 832) = v50;
  *(_OWORD *)(a1 + 848) = v47;
  *(_OWORD *)(a1 + 864) = xmmword_21EEE7810;
  if (v48 == v49) {
    *(unsigned char *)(a1 + 10772) = 0;
  }
  double v51 = 0.75;
  if (!*(void *)(a1 + 10752)) {
    double v51 = 0.5;
  }
  float32x4_t result = *(float *)(a1 + 752) * 0.95 + v51 * 0.05;
  *(float *)(a1 + 752) = result;
  return result;
}

- (unint64_t)_updateRenderPassDescriptorWithDrawable:(void *)a1
{
  unint64_t v2 = (unint64_t)a1;
  if (a1)
  {
    uint64_t v3 = [a2 texture];
    uint64_t v4 = [v3 width];
    uint64_t v5 = [v3 height];
    if (*(void *)(v2 + 432) != v4 || *(void *)(v2 + 440) != v5)
    {
      *(void *)(v2 + 432) = v4;
      *(void *)(v2 + 440) = v5;
      float v6 = *(void **)(v2 + 416);
      *(void *)(v2 + 416) = 0;

      double v7 = *(void **)(v2 + 424);
      *(void *)(v2 + 424) = 0;

      uint64_t v4 = *(void *)(v2 + 432);
    }
    if (!v4 || !*(void *)(v2 + 440)) {
      goto LABEL_17;
    }
    float64_t v8 = *(void **)(v2 + 424);
    long long v9 = v8;
    if (!v8)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F129A0]);
      long long v11 = *(void **)(v2 + 424);
      *(void *)(v2 + 424) = v10;

      long long v9 = *(void **)(v2 + 424);
    }
    float32x2_t v12 = [v9 colorAttachments];
    float32x2_t v13 = [v12 objectAtIndexedSubscript:0];
    float32x2_t v14 = v13;
    if (!v8)
    {
      [v13 setLoadAction:1];
      [v14 setStoreAction:1];
    }
    [v14 setTexture:v3];
    uint64_t v15 = *(void *)(v2 + 424);

    if (v15)
    {
      uint64_t v16 = *(void **)(v2 + 416);
      long long v17 = v16;
      if (!v16)
      {
        id v18 = objc_alloc_init(MEMORY[0x263F129A0]);
        float32x2_t v19 = *(void **)(v2 + 416);
        *(void *)(v2 + 416) = v18;

        long long v17 = *(void **)(v2 + 416);
      }
      float32x2_t v20 = [v17 colorAttachments];
      float v21 = [v20 objectAtIndexedSubscript:0];
      float v22 = v21;
      if (!v16)
      {
        [v21 setLoadAction:2];
        objc_msgSend(v22, "setClearColor:", 1.0, 1.0, 1.0, 1.0);
        [v22 setStoreAction:1];
      }
      [v22 setTexture:*(void *)(v2 + 472)];
      unint64_t v2 = *(void *)(v2 + 416) != 0;
    }
    else
    {
LABEL_17:
      unint64_t v2 = 0;
    }
  }
  return v2;
}

- (void)_updateMotionEnabled
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 10784);
    if (*(unsigned char *)(a1 + 10784))
    {
      if (*(unsigned char *)(a1 + 585)) {
        int v2 = 0;
      }
      else {
        int v2 = [*(id *)(a1 + 408) effectiveIsPaused] ^ 1;
      }
    }
    if (*(unsigned __int8 *)(a1 + 586) != v2)
    {
      *(unsigned char *)(a1 + 586) = v2;
      if (*(unsigned char *)(a1 + 586))
      {
        -[PKCategoryVisualizationCardView _startMotionUpdates](a1);
      }
      else
      {
        -[PKCategoryVisualizationCardView _stopMotionUpdates](a1);
      }
    }
  }
}

void __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke_46(uint64_t a1, uint64_t a2)
{
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 488);
  *(void *)(v4 + 488) = DefaultPrivate2DTexture;

  if (!*(void *)(*(void *)(a1 + 32) + 488))
  {
    float v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_21EEBD000, v6, OS_LOG_TYPE_DEFAULT, "PKCategoryVisualizationCardView: could not load overlay normal texture.", v7, 2u);
    }
  }
}

void __57__PKCategoryVisualizationCardView_renderLoop_drawAtTime___block_invoke(uint64_t a1, uint64_t a2)
{
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 480);
  *(void *)(v4 + 480) = DefaultPrivate2DTexture;

  if (!*(void *)(*(void *)(a1 + 32) + 480))
  {
    float v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_21EEBD000, v6, OS_LOG_TYPE_DEFAULT, "PKCategoryVisualizationCardView: could not load overlay texture.", v7, 2u);
    }
  }
}

- (void)_startMotionUpdates
{
  if (a1 && !*(unsigned char *)(a1 + 584))
  {
    id v2 = +[PKMotionManager sharedManager];
    [v2 registerClient:a1];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
  }
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_motionEnabled != a3)
  {
    self->_motionEnabled = a3;
    -[PKCategoryVisualizationCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (void)setBucketColors:(id)a3
{
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PKCategoryVisualizationCardView;
  [(PKCategoryVisualizationCardView *)&v20 layoutSubviews];
  [(PKCategoryVisualizationCardView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(PKMetalRenderLoop *)self->_renderLoop layer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  float32x2_t v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 scale];

  PKSizeRoundToPixelWithScale();
  double v14 = v13;
  double v16 = v15;
  [(PKMetalRenderLoop *)self->_renderLoop drawableSize];
  if (v18 != v14 || v17 != v16) {
    -[PKMetalRenderLoop setDrawableSize:](self->_renderLoop, "setDrawableSize:", v14, v16);
  }
}

- (void)_createMetalResourcesWithTextures:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && !*(unsigned char *)(a1 + 584))
  {
    double v4 = *(void **)(a1 + 408);
    if (v4)
    {
      double v5 = [v4 device];
    }
    else
    {
      double v5 = MTLCreateSystemDefaultDevice();
      if (!v5) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"could not create metal device"];
      }
      double v6 = [[PKMetalRenderLoop alloc] initWithPixelFormat:80 forDevice:v5];
      double v7 = *(void **)(a1 + 408);
      *(void *)(a1 + 408) = v6;

      [*(id *)(a1 + 408) setColorSpace:PKColorSpaceStandardRGB()];
      [*(id *)(a1 + 408) setFramebufferOnly:0];
      LODWORD(v8) = 30.0;
      LODWORD(v9) = 30.0;
      LODWORD(v10) = 30.0;
      objc_msgSend(*(id *)(a1 + 408), "setPreferredFrameRateRange:", v8, v9, v10);
      [*(id *)(a1 + 408) setDelegate:a1];
      [*(id *)(a1 + 408) setPaused:*(unsigned __int8 *)(a1 + 585)];
      uint64_t v11 = [v5 newCommandQueue];
      float32x2_t v12 = *(void **)(a1 + 448);
      *(void *)(a1 + 448) = v11;

      double v13 = [*(id *)(a1 + 408) layer];
      [v13 setOpaque:0];
      double v14 = [(id)a1 layer];
      [v14 addSublayer:v13];

      [(id)a1 setNeedsLayout];
    }
    uint64_t v15 = [v5 newBufferWithBytes:&textureCoords length:32 options:0];
    double v16 = *(void **)(a1 + 528);
    *(void *)(a1 + 528) = v15;

    uint64_t v17 = [v5 newBufferWithBytes:&vertexCoords length:64 options:0];
    double v18 = *(void **)(a1 + 520);
    *(void *)(a1 + 520) = v17;

    uint64_t v19 = [v5 newBufferWithLength:144 options:0];
    objc_super v20 = *(void **)(a1 + 536);
    *(void *)(a1 + 536) = v19;

    uint64_t v21 = [v5 newBufferWithLength:9856 options:0];
    float v22 = *(void **)(a1 + 544);
    *(void *)(a1 + 544) = v21;

    uint64_t v23 = [v5 newBufferWithLength:112 options:0];
    float32x4_t v24 = *(void **)(a1 + 552);
    *(void *)(a1 + 552) = v23;

    long long v25 = PKPassKitUIFoundationBundle();
    float32x2_t v26 = (void *)[v5 newDefaultLibraryWithBundle:v25 error:0];
    float v27 = [v25 pathForResource:@"CategoryVisualizationCardView" ofType:@"pipelinelib"];
    if (v27) {
      uint64_t v28 = [v5 newPipelineLibraryWithFilePath:v27 error:0];
    }
    else {
      uint64_t v28 = 0;
    }
    double v51 = (void *)v28;
    id v29 = objc_alloc_init(MEMORY[0x263F129C0]);
    [v29 setPipelineLibrary:v28];
    id v30 = objc_alloc_init(MEMORY[0x263F128B0]);
    char v57 = 0;
    [v30 setConstantValue:&v57 type:53 atIndex:0];
    double v31 = [v29 colorAttachments];
    float v32 = [v31 objectAtIndexedSubscript:0];
    objc_msgSend(v32, "setPixelFormat:", objc_msgSend(*(id *)(a1 + 408), "pixelFormat"));
    [v32 setBlendingEnabled:1];
    [v32 setRgbBlendOperation:0];
    [v32 setSourceRGBBlendFactor:4];
    [v32 setDestinationRGBBlendFactor:5];
    [v32 setAlphaBlendOperation:0];
    [v32 setSourceAlphaBlendFactor:4];
    [v32 setDestinationAlphaBlendFactor:5];

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __69__PKCategoryVisualizationCardView__createMetalResourcesWithTextures___block_invoke;
    v52[3] = &unk_2644F96F0;
    id v53 = v29;
    id v54 = v26;
    id v55 = v30;
    id v56 = v5;
    id v33 = v5;
    id v50 = v30;
    id v34 = v26;
    id v35 = v29;
    float32x2_t v36 = (void (**)(void, void, void))MEMORY[0x223C3D8D0](v52);
    uint64_t v37 = ((void (**)(void, __CFString *, __CFString *))v36)[2](v36, @"circleVertex", @"circleFragment");
    double v38 = *(void **)(a1 + 504);
    *(void *)(a1 + 504) = v37;

    uint64_t v39 = ((void (**)(void, __CFString *, __CFString *))v36)[2](v36, @"circleOutlineVertex", @"circleOutlineFragment");
    float32_t v40 = *(void **)(a1 + 512);
    *(void *)(a1 + 512) = v39;

    uint64_t v41 = ((void (**)(void, __CFString *, __CFString *))v36)[2](v36, @"overlayVertex", @"overlayFragment");
    float v42 = *(void **)(a1 + 496);
    *(void *)(a1 + 496) = v41;

    id v43 = [[PKTextureLoadDescriptor alloc] initForDevice:v33];
    id v44 = [v3 overlayMaterialPropertyImage];
    uint64_t v45 = objc_msgSend(v43, "createLoaderForCGImage:", objc_msgSend(v44, "imageRef"));
    float v46 = *(void **)(a1 + 456);
    *(void *)(a1 + 456) = v45;

    id v47 = [v3 normalMaterialPropertyImage];
    uint64_t v48 = objc_msgSend(v43, "createLoaderForCGImage:", objc_msgSend(v47, "imageRef"));
    float v49 = *(void **)(a1 + 464);
    *(void *)(a1 + 464) = v48;

    -[PKCategoryVisualizationCardView _updateTextureAndBlurShader](a1);
    *(unsigned char *)(a1 + 587) = 1;
    -[PKCategoryVisualizationCardView _updatePausedState](a1);
  }
}

- (void)_updatePausedState
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 584)) {
      int v2 = 1;
    }
    else {
      int v2 = !*(unsigned char *)(a1 + 587) && !*(_DWORD *)(a1 + 10768) && *(unsigned char *)(a1 + 10785) != 0;
    }
    if (*(unsigned __int8 *)(a1 + 585) != v2)
    {
      *(unsigned char *)(a1 + 585) = v2;
      [*(id *)(a1 + 408) setPaused:*(unsigned __int8 *)(a1 + 585)];
      -[PKCategoryVisualizationCardView _updateMotionEnabled](a1);
      if (!*(unsigned char *)(a1 + 585))
      {
        if (*(unsigned char *)(a1 + 568))
        {
          *(unsigned char *)(a1 + 568) = 0;
          uint64_t v3 = *(void *)(a1 + 576);
          if (v3 == 2)
          {
            -[PKCategoryVisualizationCardView _empty]((unsigned char *)a1);
          }
          else
          {
            if (v3 == 1)
            {
              if (!*(unsigned char *)(a1 + 10772))
              {
                *(unsigned char *)(a1 + 10772) = 1;
                *(_DWORD *)(a1 + 788) = 869711765;
                *(_DWORD *)(a1 + 792) = 1097859072;
              }
            }
            else if (v3)
            {
              return;
            }
            -[PKCategoryVisualizationCardView _updateCircles](a1);
          }
        }
      }
    }
  }
}

- (void)_updateTextureAndBlurShader
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 584))
    {
      int v2 = *(void **)(a1 + 408);
      if (v2)
      {
        [v2 drawableSize];
        double v5 = v3;
        double v6 = v4;
        if (v3 <= 0.0 || v4 <= 0.0) {
          double v8 = 1.0;
        }
        else {
          double v8 = v4 / v3;
        }
        float v9 = 1.0 / v8;
        LODWORD(v10) = 0;
        *((float *)&v10 + 1) = v9;
        *(_OWORD *)(a1 + 624) = xmmword_21EEE7800;
        *(_OWORD *)(a1 + 640) = v10;
        *(_OWORD *)(a1 + 656) = xmmword_21EEE79C0;
        *(_OWORD *)(a1 + 672) = xmmword_21EEE7810;
        uint64_t v11 = [MEMORY[0x263F1C920] mainScreen];
        [v11 scale];
        double v13 = v12 * 50.0;

        double v14 = (double)(uint64_t)v13;
        double v15 = v14 / v8;
        double v16 = (double)(uint64_t)(v14 / v8);
        unint64_t v17 = (unint64_t)(v5 + v16 * 2.0);
        unint64_t v18 = (unint64_t)(v6 + v14 * 2.0);
        uint64_t v19 = [*(id *)(a1 + 408) device];
        objc_super v20 = *(void **)(a1 + 472);
        if (!v20 || [v20 width] != v17 || objc_msgSend(*(id *)(a1 + 472), "height") != v18)
        {
          uint64_t v21 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(*(id *)(a1 + 408), "pixelFormat"), v17, v18, 0);
          [v21 setUsage:5];
          uint64_t v22 = [v19 newTextureWithDescriptor:v21];
          uint64_t v23 = *(void **)(a1 + 472);
          *(void *)(a1 + 472) = v22;
        }
        if (*(unsigned char *)(a1 + 10786)) {
          double v24 = 0.0;
        }
        else {
          double v24 = v13;
        }
        long long v25 = *(void **)(a1 + 560);
        if (v25)
        {
          float32x2_t v26 = [v25 device];
          if (v26 == v19)
          {
            [*(id *)(a1 + 560) sigma];
            double v28 = v27;

            if (v24 == v28)
            {
LABEL_22:
              [*(id *)(a1 + 560) setEdgeMode:1];
              id v33 = *(void **)(a1 + 560);
              v36[0] = (uint64_t)v15;
              v36[1] = (uint64_t)v13;
              v36[2] = 0;
              [v33 setOffset:v36];
              id v34 = *(void **)(a1 + 560);
              memset(v35, 0, 24);
              v35[3] = (unint64_t)((double)v17 - v16 * 2.0);
              v35[4] = (unint64_t)((double)v18 - v14 * 2.0);
              v35[5] = 1;
              [v34 setClipRect:v35];

              return;
            }
          }
          else
          {
          }
        }
        id v29 = objc_alloc(MEMORY[0x263F13288]);
        *(float *)&double v30 = v24;
        uint64_t v31 = [v29 initWithDevice:v19 sigma:v30];
        float v32 = *(void **)(a1 + 560);
        *(void *)(a1 + 560) = v31;

        goto LABEL_22;
      }
    }
  }
}

id __69__PKCategoryVisualizationCardView__createMetalResourcesWithTextures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  id v7 = a3;
  double v8 = (void *)[v6 newFunctionWithName:a2];
  [v5 setVertexFunction:v8];

  float v9 = *(void **)(a1 + 32);
  unint64_t v10 = (void *)[*(id *)(a1 + 40) newFunctionWithName:v7 constantValues:*(void *)(a1 + 48) error:0];

  [v9 setFragmentFunction:v10];
  uint64_t v11 = (void *)[*(id *)(a1 + 56) newRenderPipelineStateWithDescriptor:*(void *)(a1 + 32) error:0];

  return v11;
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  -[PKCategoryVisualizationCardView _updateTextureAndBlurShader]((uint64_t)self);
  self->_needsDraw = 1;

  -[PKCategoryVisualizationCardView _updatePausedState]((uint64_t)self);
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)PKCategoryVisualizationCardView;
  [(PKCategoryVisualizationCardView *)&v6 didMoveToWindow];
  double v3 = [(PKCategoryVisualizationCardView *)self window];
  renderLoop = self->_renderLoop;
  double v5 = [v3 windowScene];
  [(PKRenderLoop *)renderLoop attachToWindowScene:v5];

  -[PKCategoryVisualizationCardView _updateMotionEnabled]((uint64_t)self);
}

- (void)setBlurDisabled:(BOOL)a3
{
  if (self->_blurDisabled != a3)
  {
    self->_blurDisabled = a3;
    -[PKCategoryVisualizationCardView _updateTextureAndBlurShader]((uint64_t)self);
  }
}

- (PKCategoryVisualizationCardView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCategoryVisualizationCardView;
  float32x4_t result = -[PKCategoryVisualizationCardView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_needsDraw = 1;
  }
  return result;
}

- (PKCategoryVisualizationCardView)init
{
  return -[PKCategoryVisualizationCardView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)dealloc
{
  PKCategoryVisualizationRendererStateDestroy((uint64_t)&self->_state);
  [(PKCategoryVisualizationCardView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKCategoryVisualizationCardView;
  [(PKCategoryVisualizationCardView *)&v3 dealloc];
}

- (id)rendererState
{
  objc_super v3 = [PKPassFaceViewCategoryVisualizationRendererState alloc];
  memcpy(v6, &self->_state, sizeof(v6));
  objc_super v4 = -[PKPassFaceViewCategoryVisualizationRendererState initWithCurrentRendererState:](v3, v6);

  return v4;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKRenderLoop *)self->_renderLoop setDelegate:0];
    [(PKRenderLoop *)self->_renderLoop invalidate];
    objc_super v3 = [(PKMetalRenderLoop *)self->_renderLoop layer];
    [v3 removeFromSuperlayer];

    renderLoop = self->_renderLoop;
    self->_renderLoop = 0;

    commandQueue = self->_commandQueue;
    self->_commandQueue = 0;

    overlayTextureLoader = self->_overlayTextureLoader;
    self->_overlayTextureLoader = 0;

    overlayNormalTextureLoader = self->_overlayNormalTextureLoader;
    self->_overlayNormalTextureLoader = 0;

    texture = self->_texture;
    self->_texture = 0;

    overlayTexture = self->_overlayTexture;
    self->_overlayTexture = 0;

    overlayNormalTexture = self->_overlayNormalTexture;
    self->_overlayNormalTexture = 0;

    overlayPipelineState = self->_overlayPipelineState;
    self->_overlayPipelineState = 0;

    circlePipelineState = self->_circlePipelineState;
    self->_circlePipelineState = 0;

    circleOutlinePipelineState = self->_circleOutlinePipelineState;
    self->_circleOutlinePipelineState = 0;

    vertexCoordsBuffer = self->_vertexCoordsBuffer;
    self->_vertexCoordsBuffer = 0;

    textureCoordsBuffer = self->_textureCoordsBuffer;
    self->_textureCoordsBuffer = 0;

    circleUniformsBuffer = self->_circleUniformsBuffer;
    self->_circleUniformsBuffer = 0;

    circleDataBuffer = self->_circleDataBuffer;
    self->_circleDataBuffer = 0;

    singleCircleDataBuffer = self->_singleCircleDataBuffer;
    self->_singleCircleDataBuffer = 0;

    blurShader = self->_blurShader;
    self->_blurShader = 0;

    if (self->_effectiveMotionEnabled)
    {
      -[PKCategoryVisualizationCardView _stopMotionUpdates]((uint64_t)self);
    }
  }
}

- (void)_stopMotionUpdates
{
  if (a1 && !*(unsigned char *)(a1 + 584))
  {
    id v2 = +[PKMotionManager sharedManager];
    [v2 unregisterClient:a1];
  }
}

- (void)_empty
{
  if (val && !val[588] && *((void *)val + 110) && !val[584])
  {
    val[588] = 1;
    objc_initWeak(&location, val);
    if (*((void *)val + 110))
    {
      id v2 = 0;
      objc_super v3 = MEMORY[0x263EF83A0];
      do
      {
        dispatch_time_t v4 = dispatch_time(0, (uint64_t)(((double)(unint64_t)v2 * 1.5 / -80.0 + 1.5) * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__PKCategoryVisualizationCardView__empty__block_invoke;
        block[3] = &unk_2644F9550;
        objc_copyWeak(v9, &location);
        v9[1] = v2;
        dispatch_after(v4, v3, block);
        objc_destroyWeak(v9);
        ++v2;
      }
      while ((unint64_t)v2 < *((void *)val + 110));
    }
    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__PKCategoryVisualizationCardView__empty__block_invoke_2;
    v6[3] = &unk_2644F9330;
    objc_copyWeak(&v7, &location);
    dispatch_after(v5, MEMORY[0x263EF83A0], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __41__PKCategoryVisualizationCardView__empty__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(_DWORD *)&WeakRetained[112 * *(void *)(a1 + 40) + 920] = 0x40000000;
    WeakRetained[587] = 1;
    objc_super v3 = WeakRetained;
    -[PKCategoryVisualizationCardView _updatePausedState]();
    WeakRetained = v3;
  }
}

void __41__PKCategoryVisualizationCardView__empty__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[588] = 0;
    *((void *)WeakRetained + 110) = 0;
    id v2 = WeakRetained;
    -[PKCategoryVisualizationCardView _updateCircles]();
    v2[587] = 1;
    -[PKCategoryVisualizationCardView _updatePausedState](v2);
    WeakRetained = v2;
  }
}

- (NSArray)bucketColors
{
  return self->_bucketColors;
}

- (NSSet)magnitudes
{
  return self->_magnitudes;
}

- (BOOL)isMotionEnabled
{
  return self->_motionEnabled;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isBlurDisabled
{
  return self->_blurDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnitudes, 0);
  objc_storeStrong((id *)&self->_bucketColors, 0);
  objc_storeStrong((id *)&self->_blurShader, 0);
  objc_storeStrong((id *)&self->_singleCircleDataBuffer, 0);
  objc_storeStrong((id *)&self->_circleDataBuffer, 0);
  objc_storeStrong((id *)&self->_circleUniformsBuffer, 0);
  objc_storeStrong((id *)&self->_textureCoordsBuffer, 0);
  objc_storeStrong((id *)&self->_vertexCoordsBuffer, 0);
  objc_storeStrong((id *)&self->_circleOutlinePipelineState, 0);
  objc_storeStrong((id *)&self->_circlePipelineState, 0);
  objc_storeStrong((id *)&self->_overlayPipelineState, 0);
  objc_storeStrong((id *)&self->_overlayNormalTexture, 0);
  objc_storeStrong((id *)&self->_overlayTexture, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_overlayNormalTextureLoader, 0);
  objc_storeStrong((id *)&self->_overlayTextureLoader, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_secondRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);

  objc_storeStrong((id *)&self->_renderLoop, 0);
}

@end