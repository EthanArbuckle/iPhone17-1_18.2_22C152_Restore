@interface PKTexturedCardView
- (BOOL)isInvalidated;
- (BOOL)isMotionEnabled;
- (BOOL)isPaused;
- (PKTexturedCardView)init;
- (PKTexturedCardView)initWithCoder:(id)a3;
- (PKTexturedCardView)initWithFrame:(CGRect)a3;
- (id)_initWithPixelFormat:(void *)a3 renderer:;
- (uint64_t)_updatePaused;
- (void)_setDeviceAttitude:(uint64_t)a1;
- (void)_updateDrawableSize;
- (void)_updateMotionEnabled;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)motionManager:(id)a3 didReceiveMotion:(id)a4;
- (void)renderLoop:(id)a3 drawAtTime:(double)a4;
- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4;
- (void)setMotionEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation PKTexturedCardView

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  objc_msgSend(a4, "attitude", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 quaternion];
  v6.f64[1] = v5;
  v8.f64[1] = v7;
  -[PKTexturedCardView _setDeviceAttitude:]((uint64_t)self, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v6));
}

- (void)_setDeviceAttitude:(uint64_t)a1
{
  if (a1)
  {
    float32x4_t v3 = vmulq_f32(a2, (float32x4_t)xmmword_21EEE7850);
    int32x4_t v4 = (int32x4_t)vnegq_f32(v3);
    int8x16_t v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, v4));
    float32x4_t v6 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
    v6.i32[0] = v4.i32[1];
    v6.i32[3] = v4.i32[2];
    float32x4_t v7 = vaddq_f32(vmlaq_f32(vmulq_f32(v3, (float32x4_t)vdupq_n_s32(0x3F74C5EFu)), (float32x4_t)0, v6), vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL), (float32x4_t)0), (float32x4_t)vdupq_n_s32(0x3E95F619u), (float32x4_t)vextq_s8(v5, v5, 8uLL)));
    if (*(unsigned char *)(a1 + 448))
    {
      float32x4_t v8 = vmulq_f32(v7, (float32x4_t)xmmword_21EEE7850);
      int32x4_t v9 = (int32x4_t)vnegq_f32(v8);
      int8x16_t v10 = (int8x16_t)vtrn2q_s32((int32x4_t)v8, vtrn1q_s32((int32x4_t)v8, v9));
      float32x4_t v11 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v8, (int8x16_t)v9, 8uLL), (float32x4_t)0);
      float32x4_t v12 = (float32x4_t)vrev64q_s32((int32x4_t)v8);
      v12.i32[0] = v9.i32[1];
      v12.i32[3] = v9.i32[2];
      float32x4_t v13 = vaddq_f32(v12, vmlaq_f32(v11, (float32x4_t)0, (float32x4_t)vextq_s8(v10, v10, 8uLL)));
      int32x4_t v14 = (int32x4_t)vnegq_f32(v13);
      int8x16_t v15 = (int8x16_t)vtrn2q_s32((int32x4_t)v13, vtrn1q_s32((int32x4_t)v13, v14));
      float32x4_t v16 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v14, 8uLL), *(float32x2_t *)v7.f32, 1), (float32x4_t)vextq_s8(v15, v15, 8uLL), v7.f32[0]);
      float32x4_t v17 = (float32x4_t)vrev64q_s32((int32x4_t)v13);
      v17.i32[0] = v14.i32[1];
      v17.i32[3] = v14.i32[2];
      float32x4_t v66 = v7;
      double v18 = acosf(COERCE_FLOAT(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v13, v7, 3), v17, v7, 2), v16).i32[2]));
      if (v18 <= 0.0785398163)
      {
        __n128 v42 = (__n128)v66;
      }
      else
      {
        float v19 = 0.0785398163 / v18;
        float32x4_t v20 = vmulq_f32(v66, (float32x4_t)xmmword_21EEE7810);
        float32x4_t v21 = (float32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL);
        *(float32x2_t *)v20.f32 = vadd_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v21.f32);
        v20.f32[0] = vaddv_f32(*(float32x2_t *)v20.f32);
        v21.i64[0] = 0;
        float32x4_t v22 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v20, v21)), 0), (int8x16_t)vnegq_f32(v66), (int8x16_t)v66);
        float v23 = 1.0;
        float v24 = 1.0 - v19;
        float32x4_t v25 = vsubq_f32((float32x4_t)xmmword_21EEE7810, v22);
        int8x16_t v26 = (int8x16_t)vmulq_f32(v25, v25);
        float32x4_t v65 = v22;
        float32x4_t v27 = vaddq_f32(v22, (float32x4_t)xmmword_21EEE7810);
        int8x16_t v28 = (int8x16_t)vmulq_f32(v27, v27);
        float v29 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL)))));
        float v30 = v29 + v29;
        BOOL v31 = (float)(v29 + v29) == 0.0;
        float v32 = 1.0;
        if (!v31) {
          float v32 = sinf(v30) / v30;
        }
        float v33 = v32;
        float32x2_t v34 = vrecpe_f32((float32x2_t)LODWORD(v32));
        float32x2_t v35 = vmul_f32(v34, vrecps_f32((float32x2_t)LODWORD(v33), v34));
        LODWORD(v36) = vmul_f32(v35, vrecps_f32((float32x2_t)LODWORD(v33), v35)).u32[0];
        if ((float)(v24 * v30) != 0.0)
        {
          float v63 = v36;
          v35.f32[0] = sinf(v24 * v30);
          float v36 = v63;
          float v23 = v35.f32[0] / (float)(v24 * v30);
        }
        v35.f32[0] = v24 * (float)(v36 * v23);
        float32x4_t v37 = (float32x4_t)vdupq_lane_s32((int32x2_t)v35, 0);
        float v38 = v30 * v19;
        float v39 = 1.0;
        if (v38 != 0.0)
        {
          float32x4_t v62 = v37;
          float v64 = v36;
          float v40 = sinf(v38);
          float32x4_t v37 = v62;
          float v36 = v64;
          float v39 = v40 / v38;
        }
        float32x4_t v41 = vmulq_n_f32(v65, (float)(v36 * v39) * v19);
        __n128 v42 = (__n128)xmmword_21EEE7810;
        float32x4_t v43 = vmlaq_f32(v41, (float32x4_t)xmmword_21EEE7810, v37);
        int8x16_t v44 = (int8x16_t)vmulq_f32(v43, v43);
        float32x2_t v45 = vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
        if (vaddv_f32(v45) != 0.0)
        {
          unsigned __int32 v46 = vadd_f32(v45, (float32x2_t)vdup_lane_s32((int32x2_t)v45, 1)).u32[0];
          float32x2_t v47 = vrsqrte_f32((float32x2_t)v46);
          float32x2_t v48 = vmul_f32(v47, vrsqrts_f32((float32x2_t)v46, vmul_f32(v47, v47)));
          __n128 v42 = (__n128)vmulq_n_f32(v43, vmul_f32(v48, vrsqrts_f32((float32x2_t)v46, vmul_f32(v48, v48))).f32[0]);
        }
      }
    }
    else
    {
      __n128 v42 = (__n128)v7;
    }
    float32x4_t v67 = (float32x4_t)v42;
    -[PKTexturedCardRenderer setRotation:](*(__n128 **)(a1 + 440), v42);
    float32x4_t v49 = *(float32x4_t *)(a1 + 416);
    float32x4_t v50 = vmulq_f32(v49, (float32x4_t)xmmword_21EEE7850);
    int8x16_t v51 = (int8x16_t)vmulq_f32(v49, v49);
    *(float32x2_t *)v51.i8 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
    v51.i32[0] = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v51.i8, 1)).u32[0];
    float32x2_t v52 = vrecpe_f32((float32x2_t)v51.u32[0]);
    float32x2_t v53 = vmul_f32(v52, vrecps_f32((float32x2_t)v51.u32[0], v52));
    float32x4_t v54 = vmulq_n_f32(v50, vmul_f32(v53, vrecps_f32((float32x2_t)v51.u32[0], v53)).f32[0]);
    int32x4_t v55 = (int32x4_t)vnegq_f32(v67);
    int8x16_t v56 = (int8x16_t)vtrn2q_s32((int32x4_t)v67, vtrn1q_s32((int32x4_t)v67, v55));
    float32x4_t v57 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v67, (int8x16_t)v55, 8uLL), *(float32x2_t *)v54.f32, 1), (float32x4_t)vextq_s8(v56, v56, 8uLL), v54.f32[0]);
    float32x4_t v58 = (float32x4_t)vrev64q_s32((int32x4_t)v67);
    v58.i32[0] = v55.i32[1];
    v58.i32[3] = v55.i32[2];
    float32x4_t v59 = vaddq_f32(v57, vmlaq_laneq_f32(vmulq_laneq_f32(v67, v54, 3), v58, v54, 2));
    float32x4_t v60 = vmulq_f32(v59, v59);
    float v61 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).f32[0]), v59.f32[3]);
    if (fabsf(v61 + v61) > 0.0008)
    {
      *(unsigned char *)(a1 + 409) = 1;
      -[PKTexturedCardView _updatePaused](a1);
    }
  }
}

- (uint64_t)_updatePaused
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 409) && !*(unsigned char *)(result + 408))
    {
      result = -[PKPayLaterCardRenderer isInvalidated](*(void *)(result + 440));
      int v2 = result;
    }
    else
    {
      int v2 = 1;
    }
    if (*(unsigned __int8 *)(v1 + 410) != v2)
    {
      *(unsigned char *)(v1 + 410) = v2;
      float32x4_t v3 = *(void **)(v1 + 432);
      return objc_msgSend(v3, "setPaused:");
    }
  }
  return result;
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  -[PKTexturedCardRenderer renderAtTime:]((uint64_t)self->_renderer);
  char v6 = v5 ^ 1;
  if (!self->_draw) {
    char v6 = 0;
  }
  self->_draw = v6;
  *(double *)&long long v7 = -[PKTexturedCardRenderer rotation]((uint64_t)self->_renderer);
  *(_OWORD *)&self->_anon_1a0[4] = v7;

  -[PKTexturedCardView _updatePaused]((uint64_t)self);
}

- (void)_updateMotionEnabled
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 450);
    if (*(unsigned char *)(a1 + 450)) {
      int v2 = !*(unsigned char *)(a1 + 449)
    }
        && [*(id *)(a1 + 432) isRunnable]
        && *(unsigned char *)(a1 + 408) == 0;
    if (*(unsigned __int8 *)(a1 + 411) != v2)
    {
      *(unsigned char *)(a1 + 411) = v2;
      int v3 = *(unsigned __int8 *)(a1 + 411);
      id v4 = +[PKMotionManager sharedManager];
      if (v3) {
        [v4 registerClient:a1];
      }
      else {
        [v4 unregisterClient:a1];
      }
    }
  }
}

- (id)_initWithPixelFormat:(void *)a3 renderer:
{
  char v5 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKTexturedCardView;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    if (a1)
    {
      id v6 = MTLCreateSystemDefaultDevice();
      if (!v6) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"could not create metal device"];
      }
      long long v7 = [[PKMetalRenderLoop alloc] initWithPixelFormat:a2 forDevice:v6];
      id v8 = a1[54];
      a1[54] = v7;

      id v9 = a1[54];
      if (v9)
      {
        [v9 setDelegate:a1];
        if (v5)
        {
          int8x16_t v10 = ((void (**)(id, id))v5)[2](v5, a1[54]);
        }
        else
        {
          int8x16_t v10 = 0;
        }
        objc_storeStrong(a1 + 55, v10);
        if (v5) {

        }
        id v11 = a1[54];
        if (a1[55])
        {
          float32x4_t v12 = [v11 layer];
          [v12 setOpaque:0];
          float32x4_t v13 = [a1 layer];
          [v13 addSublayer:v12];

          *((_OWORD *)a1 + 26) = xmmword_21EEE7810;
          -[PKTexturedCardView _setDeviceAttitude:]((uint64_t)a1, (float32x4_t)_PromotedConst);
          *((unsigned char *)a1 + 409) = 1;
          *((unsigned char *)a1 + 410) = [a1[54] isPaused];
          -[PKTexturedCardView _updatePaused]((uint64_t)a1);
LABEL_15:

          goto LABEL_16;
        }
        [v11 invalidate];
      }
      float32x4_t v12 = v6;
      id v6 = a1;
      a1 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:

  return a1;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTexturedCardView;
  [(PKTexturedCardView *)&v4 layoutSubviews];
  int v3 = [(PKMetalRenderLoop *)self->_renderLoop layer];
  [(PKTexturedCardView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  -[PKTexturedCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateDrawableSize
{
  if (a1)
  {
    [a1 bounds];
    int v2 = [a1[54] screen];
    id v3 = v2;
    if (v2) {
      [v2 scale];
    }
    PKSizeRoundToPixelWithScale();
    objc_msgSend(a1[54], "setDrawableSize:");
  }
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  self->_draw = 1;
  -[PKTexturedCardView _updatePaused]((uint64_t)self);
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)PKTexturedCardView;
  [(PKTexturedCardView *)&v6 didMoveToWindow];
  id v3 = [(PKTexturedCardView *)self window];
  renderLoop = self->_renderLoop;
  char v5 = [v3 windowScene];
  [(PKRenderLoop *)renderLoop attachToWindowScene:v5];

  -[PKTexturedCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_motionEnabled != a3)
  {
    self->_motionEnabled = a3;
    -[PKTexturedCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (PKTexturedCardView)init
{
  return 0;
}

- (PKTexturedCardView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKTexturedCardView)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(PKTexturedCardView *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKTexturedCardView;
  [(PKTexturedCardView *)&v3 dealloc];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_effectiveMotionEnabled)
    {
      objc_super v3 = +[PKMotionManager sharedManager];
      [v3 unregisterClient:self];
    }
    [(PKRenderLoop *)self->_renderLoop invalidate];
    [(PKRenderLoop *)self->_renderLoop setDelegate:0];
    objc_super v4 = [(PKMetalRenderLoop *)self->_renderLoop layer];
    [v4 removeFromSuperlayer];

    renderLoop = self->_renderLoop;
    self->_renderLoop = 0;

    -[PKTexturedCardRenderer invalidate]((uint64_t)self->_renderer);
    renderer = self->_renderer;
    self->_renderer = 0;
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKTexturedCardView _updatePaused]((uint64_t)self);
    -[PKTexturedCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isMotionEnabled
{
  return self->_motionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_renderLoop, 0);
}

@end