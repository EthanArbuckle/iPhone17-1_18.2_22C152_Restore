@interface PKPayLaterCardView
- (BOOL)isInvalidated;
- (BOOL)isMotionEnabled;
- (BOOL)isPaused;
- (BOOL)isPresented;
- (PKPayLaterCardView)init;
- (PKPayLaterCardView)initWithCoder:(id)a3;
- (PKPayLaterCardView)initWithFrame:(CGRect)a3;
- (PKPayLaterCardView)initWithOverlay:(CGImage *)a3 magnitudesProvider:(id)a4;
- (id)_initWithOverlay:(void *)a3 magnitudesProvider:;
- (uint64_t)_updatePaused;
- (void)_setDeviceAttitude:(uint64_t)a1;
- (void)_updateDrawableSize;
- (void)_updateMotionEnabled;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)motionManager:(id)a3 didReceiveMotion:(id)a4;
- (void)refreshMagnitudes;
- (void)renderLoop:(id)a3 drawAtTime:(double)a4;
- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4;
- (void)setMotionEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPresented:(BOOL)a3;
@end

@implementation PKPayLaterCardView

- (PKPayLaterCardView)init
{
  return 0;
}

- (PKPayLaterCardView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPayLaterCardView)initWithCoder:(id)a3
{
  return 0;
}

- (PKPayLaterCardView)initWithOverlay:(CGImage *)a3 magnitudesProvider:(id)a4
{
  if (a3)
  {
    self = (PKPayLaterCardView *)-[PKPayLaterCardView _initWithOverlay:magnitudesProvider:](self, (uint64_t)a3, a4);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithOverlay:(void *)a3 magnitudesProvider:
{
  id v6 = a3;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)PKPayLaterCardView;
    a1 = objc_msgSendSuper2(&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    if (a1)
    {
      id v7 = MTLCreateSystemDefaultDevice();
      if (!v7) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"could not create metal device"];
      }
      v8 = [[PKMetalRenderLoop alloc] initWithPixelFormat:115 forDevice:v7];
      v9 = (void *)*((void *)a1 + 55);
      *((void *)a1 + 55) = v8;

      v10 = (void *)*((void *)a1 + 55);
      if (v10)
      {
        [v10 setDelegate:a1];
        v11 = -[PKPayLaterCardRenderer initWithRenderLoop:overlay:]((id *)[PKPayLaterCardRenderer alloc], *((void **)a1 + 55), a2);
        v12 = (void *)*((void *)a1 + 56);
        *((void *)a1 + 56) = v11;

        v13 = (void *)*((void *)a1 + 55);
        if (*((void *)a1 + 56))
        {
          v14 = [v13 layer];
          [v14 setOpaque:1];
          v15 = [a1 layer];
          [v15 addSublayer:v14];

          *((_OWORD *)a1 + 26) = RestingQuaternion;
          -[PKPayLaterCardRenderer setRotation:](*((__n128 **)a1 + 56), (__n128)_PromotedConst_0);
          *((unsigned char *)a1 + 409) = 1;
          *((unsigned char *)a1 + 410) = [*((id *)a1 + 55) isPaused];
          -[PKPayLaterCardView _updatePaused]((uint64_t)a1);
          objc_storeStrong((id *)a1 + 58, a3);
          objc_initWeak(&location, a1);
          v16 = (void *)*((void *)a1 + 58);
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke;
          v18[3] = &unk_2644F9068;
          objc_copyWeak(&v19, &location);
          [v16 setUpdateHandler:v18];
          objc_destroyWeak(&v19);
          objc_destroyWeak(&location);
LABEL_10:

          goto LABEL_11;
        }
        [v13 invalidate];
      }
      v14 = v7;
      id v7 = a1;
      a1 = 0;
      goto LABEL_10;
    }
  }
LABEL_11:

  return a1;
}

- (uint64_t)_updatePaused
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 409) && !*(unsigned char *)(result + 408))
    {
      result = -[PKPayLaterCardRenderer isInvalidated](*(void *)(result + 448));
      int v2 = result;
    }
    else
    {
      int v2 = 1;
    }
    if (*(unsigned __int8 *)(v1 + 410) != v2)
    {
      *(unsigned char *)(v1 + 410) = v2;
      v3 = *(void **)(v1 + 440);
      return objc_msgSend(v3, "setPaused:");
    }
  }
  return result;
}

void __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke_2;
  v5[3] = &unk_2644F9040;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __58__PKPayLaterCardView__initWithOverlay_magnitudesProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if ([WeakRetained isPresented])
    {
      -[PKPayLaterCardRenderer setMagnitudes:](*((void *)v3 + 56), *(void **)(a1 + 32));
      id WeakRetained = v3;
      if (*((void *)v3 + 54) == 210) {
        goto LABEL_7;
      }
      *((void *)v3 + 54) = 210;
      *((unsigned char *)v3 + 409) = 1;
      -[PKPayLaterCardView _updatePaused]((uint64_t)v3);
    }
    else
    {
      objc_storeStrong((id *)v3 + 57, *(id *)(a1 + 32));
    }
    id WeakRetained = v3;
  }
LABEL_7:
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(PKPayLaterCardView *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCardView;
  [(PKPayLaterCardView *)&v3 dealloc];
}

- (void)refreshMagnitudes
{
}

- (void)setPresented:(BOOL)a3
{
  -[PKPayLaterCardRenderer setPresented:]((uint64_t)self->_renderer, a3);
  pendingMagnitudes = self->_pendingMagnitudes;
  if (pendingMagnitudes)
  {
    -[PKPayLaterCardRenderer setMagnitudes:]((uint64_t)self->_renderer, pendingMagnitudes);
    v5 = self->_pendingMagnitudes;
    self->_pendingMagnitudes = 0;
  }
  if (self->_framesToRender != 210)
  {
    self->_framesToRender = 210;
    self->_draw = 1;
    -[PKPayLaterCardView _updatePaused]((uint64_t)self);
  }
}

- (BOOL)isPresented
{
  return -[PKPayLaterCardRenderer isPresented]((BOOL)self->_renderer);
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
    id v4 = [(PKMetalRenderLoop *)self->_renderLoop layer];
    [v4 removeFromSuperlayer];

    renderLoop = self->_renderLoop;
    self->_renderLoop = 0;

    -[PKPayLaterCardRenderer invalidate]((uint64_t)self->_renderer);
    renderer = self->_renderer;
    self->_renderer = 0;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterCardView;
  [(PKPayLaterCardView *)&v4 layoutSubviews];
  objc_super v3 = [(PKMetalRenderLoop *)self->_renderLoop layer];
  [(PKPayLaterCardView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  -[PKPayLaterCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateDrawableSize
{
  if (a1)
  {
    [a1 bounds];
    int v2 = [a1[55] screen];
    id v3 = v2;
    if (v2) {
      [v2 scale];
    }
    PKSizeRoundToPixelWithScale();
    objc_msgSend(a1[55], "setDrawableSize:");
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterCardView;
  [(PKPayLaterCardView *)&v6 didMoveToWindow];
  id v3 = [(PKPayLaterCardView *)self window];
  renderLoop = self->_renderLoop;
  v5 = [v3 windowScene];
  [(PKRenderLoop *)renderLoop attachToWindowScene:v5];

  -[PKPayLaterCardView _updateDrawableSize]((id *)&self->super.super.super.isa);
}

- (void)_updateMotionEnabled
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 473);
    if (*(unsigned char *)(a1 + 473)) {
      int v2 = !*(unsigned char *)(a1 + 472)
    }
        && [*(id *)(a1 + 440) isRunnable]
        && *(unsigned char *)(a1 + 408) == 0;
    if (*(unsigned __int8 *)(a1 + 411) != v2)
    {
      *(unsigned char *)(a1 + 411) = v2;
      int v3 = *(unsigned __int8 *)(a1 + 411);
      objc_super v4 = +[PKMotionManager sharedManager];
      id v13 = v4;
      if (v3)
      {
        if ([v4 isMonitoring])
        {
          v5 = [v13 motion];
          objc_super v6 = v5;
          if (v5)
          {
            id v7 = [v5 attitude];
            [v7 quaternion];
            v9.f64[1] = v8;
            v11.f64[1] = v10;
            -[PKPayLaterCardView _setDeviceAttitude:](a1, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v9));
          }
        }
        v12 = +[PKMotionManager sharedManager];
        [v12 registerClient:a1];
      }
      else
      {
        [v4 unregisterClient:a1];
      }
    }
  }
}

- (void)_setDeviceAttitude:(uint64_t)a1
{
  if (a1)
  {
    float32x4_t v3 = vmulq_f32(a2, (float32x4_t)xmmword_21EEE7850);
    int32x4_t v4 = (int32x4_t)vnegq_f32(v3);
    int8x16_t v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, v4));
    float32x4_t v6 = (float32x4_t)vextq_s8(v5, v5, 8uLL);
    float32x4_t v7 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL), (float32x4_t)0);
    float32x4_t v8 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
    v8.i32[0] = v4.i32[1];
    v8.i32[3] = v4.i32[2];
    __n128 v22 = (__n128)vaddq_f32(vmlaq_f32(vmulq_f32(v3, (float32x4_t)vdupq_n_s32(0x3F74C5EFu)), (float32x4_t)0, v8), vmlaq_f32(v7, (float32x4_t)vdupq_n_s32(0x3E95F619u), v6));
    -[PKPayLaterCardRenderer setGravity:](*(__n128 **)(a1 + 448), (__n128)vaddq_f32(vmlaq_f32(v3, (float32x4_t)0, v8), vmlaq_f32(v7, (float32x4_t)0, v6)));
    -[PKPayLaterCardRenderer setRotation:](*(__n128 **)(a1 + 448), v22);
    float32x4_t v9 = *(float32x4_t *)(a1 + 416);
    float32x4_t v10 = vmulq_f32(v9, (float32x4_t)xmmword_21EEE7850);
    int8x16_t v11 = (int8x16_t)vmulq_f32(v9, v9);
    *(float32x2_t *)v11.i8 = vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    v11.i32[0] = vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1)).u32[0];
    float32x2_t v12 = vrecpe_f32((float32x2_t)v11.u32[0]);
    float32x2_t v13 = vmul_f32(v12, vrecps_f32((float32x2_t)v11.u32[0], v12));
    float32x4_t v14 = vmulq_n_f32(v10, vmul_f32(v13, vrecps_f32((float32x2_t)v11.u32[0], v13)).f32[0]);
    int32x4_t v15 = (int32x4_t)vnegq_f32((float32x4_t)v22);
    int8x16_t v16 = (int8x16_t)vtrn2q_s32((int32x4_t)v22, vtrn1q_s32((int32x4_t)v22, v15));
    float32x4_t v17 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v22, (int8x16_t)v15, 8uLL), *(float32x2_t *)v14.f32, 1), (float32x4_t)vextq_s8(v16, v16, 8uLL), v14.f32[0]);
    float32x4_t v18 = (float32x4_t)vrev64q_s32((int32x4_t)v22);
    v18.i32[0] = v15.i32[1];
    v18.i32[3] = v15.i32[2];
    float32x4_t v19 = vaddq_f32(v17, vmlaq_laneq_f32(vmulq_laneq_f32((float32x4_t)v22, v14, 3), v18, v14, 2));
    float32x4_t v20 = vmulq_f32(v19, v19);
    float v21 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0]), v19.f32[3]);
    if (fabsf(v21 + v21) > 0.0008)
    {
      *(unsigned char *)(a1 + 409) = 1;
      -[PKPayLaterCardView _updatePaused](a1);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKPayLaterCardView _updatePaused]((uint64_t)self);
    -[PKPayLaterCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_motionEnabled != a3)
  {
    self->_motionEnabled = a3;
    -[PKPayLaterCardView _updateMotionEnabled]((uint64_t)self);
  }
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  self->_draw = 1;
  -[PKPayLaterCardView _updatePaused]((uint64_t)self);
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  if (-[PKPayLaterCardRenderer renderAtTime:]((uint64_t)self->_renderer))
  {
    unint64_t framesToRender = self->_framesToRender;
    if (framesToRender)
    {
      unint64_t v6 = framesToRender - 1;
      self->_unint64_t framesToRender = v6;
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  self->_draw = v7;
  *(double *)&long long v8 = -[PKPayLaterCardRenderer rotation]((uint64_t)self->_renderer);
  *(_OWORD *)&self->_anon_1a0[4] = v8;

  -[PKPayLaterCardView _updatePaused]((uint64_t)self);
}

- (void)motionManager:(id)a3 didReceiveMotion:(id)a4
{
  objc_msgSend(a4, "attitude", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 quaternion];
  v6.f64[1] = v5;
  v8.f64[1] = v7;
  -[PKPayLaterCardView _setDeviceAttitude:]((uint64_t)self, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v6));
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
  objc_storeStrong((id *)&self->_magnitudesProvider, 0);
  objc_storeStrong((id *)&self->_pendingMagnitudes, 0);
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_renderLoop, 0);
}

@end