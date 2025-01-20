@interface VKAnchorWrapper
- ($1AB5FA073B851C12C2339EC22442E995)coordinate3D;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)followsTerrain;
- (CGPoint)pointInLayer:(id)a3 bound:(CGRect)a4;
- (MDRenderTarget)displayLayer;
- (double)elevationOffset;
- (double)pointOffsetForDistanceOffset:(double)a3;
- (id).cxx_construct;
- (shared_ptr<md::Anchor>)_anchorWithContext:(void *)a3;
- (void)_updateCachedPoint;
- (void)anchorWorldPointDidChange:(void *)a3;
- (void)dealloc;
- (void)destroyAnchor;
- (void)layoutWithContext:(const void *)a3;
- (void)prepare:(CGSize)a3 cameraContext:(const void *)a4 anchorContext:(const AnchorContext *)a5;
- (void)setDisplayLayer:(id)a3;
- (void)setFollowsTerrain:(BOOL)a3;
- (void)updateIfNeeded;
@end

@implementation VKAnchorWrapper

- (double)pointOffsetForDistanceOffset:(double)a3
{
  return self->_pointsPerMeter * a3;
}

- (void)layoutWithContext:(const void *)a3
{
  id v24 = *(id *)a3;
  [v24 size];
  v5 = (uint64_t *)*((void *)a3 + 1);
  int8x8_t v6 = (int8x8_t)v5[1];
  if (!*(void *)&v6)
  {
    uint64_t v9 = 0;
    goto LABEL_48;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v8 = 0x1AF456233693CD46;
    if (*(void *)&v6 <= 0x1AF456233693CD46uLL) {
      uint64_t v8 = 0x1AF456233693CD46uLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v6 - 1) & 0x1AF456233693CD46;
  }
  uint64_t v10 = *v5;
  v11 = *(void **)(v10 + 8 * v8);
  if (!v11) {
    goto LABEL_25;
  }
  v12 = (void *)*v11;
  if (!v12) {
    goto LABEL_25;
  }
  if (v7.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v14 = v12[1];
      if (v14 == 0x1AF456233693CD46)
      {
        if (v12[2] == 0x1AF456233693CD46) {
          goto LABEL_23;
        }
      }
      else if ((v14 & (*(void *)&v6 - 1)) != v8)
      {
        goto LABEL_25;
      }
      v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_25;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v12[1];
    if (v13 == 0x1AF456233693CD46) {
      break;
    }
    if (v13 >= *(void *)&v6) {
      v13 %= *(void *)&v6;
    }
    if (v13 != v8) {
      goto LABEL_25;
    }
LABEL_12:
    v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_25;
    }
  }
  if (v12[2] != 0x1AF456233693CD46) {
    goto LABEL_12;
  }
LABEL_23:
  uint64_t v15 = v12[5];
  if (*(void *)(v15 + 8) == 0x1AF456233693CD46)
  {
    uint64_t v9 = *(void *)(v15 + 32);
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
LABEL_26:
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v16 = 0x63B6FE00C0848868;
    if (*(void *)&v6 <= 0x63B6FE00C0848868uLL) {
      uint64_t v16 = 0x63B6FE00C0848868uLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v16 = (*(void *)&v6 - 1) & 0x63B6FE00C0848868;
  }
  v17 = *(void **)(v10 + 8 * v16);
  if (!v17) {
    goto LABEL_48;
  }
  v18 = (void *)*v17;
  if (!v18) {
    goto LABEL_48;
  }
  if (v7.u32[0] < 2uLL)
  {
    uint64_t v19 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v21 = v18[1];
      if (v21 == 0x63B6FE00C0848868)
      {
        if (v18[2] == 0x63B6FE00C0848868) {
          goto LABEL_46;
        }
      }
      else if ((v21 & v19) != v16)
      {
        goto LABEL_48;
      }
      v18 = (void *)*v18;
      if (!v18) {
        goto LABEL_48;
      }
    }
  }
  while (2)
  {
    unint64_t v20 = v18[1];
    if (v20 != 0x63B6FE00C0848868)
    {
      if (v20 >= *(void *)&v6) {
        v20 %= *(void *)&v6;
      }
      if (v20 != v16) {
        goto LABEL_48;
      }
      goto LABEL_35;
    }
    if (v18[2] != 0x63B6FE00C0848868)
    {
LABEL_35:
      v18 = (void *)*v18;
      if (!v18) {
        goto LABEL_48;
      }
      continue;
    }
    break;
  }
LABEL_46:
  uint64_t v22 = v18[5];
  if (*(void *)(v22 + 8) == 0x63B6FE00C0848868)
  {
    uint64_t v23 = *(void *)(v22 + 32);
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v23 = 0;
LABEL_49:
  -[VKAnchorWrapper prepare:cameraContext:anchorContext:](self, "prepare:cameraContext:anchorContext:", v9, v23);
}

- (void)prepare:(CGSize)a3 cameraContext:(const void *)a4 anchorContext:(const AnchorContext *)a5
{
  self->_canvasSize = a3;
  self->_cameraContext = a4;
  if (a5) {
    self->_anchorManager = a5->var0;
  }
  [(VKAnchorWrapper *)self _updateCachedPoint];
}

- (void)_updateCachedPoint
{
  if (!self->_isUpdating)
  {
    if (self->_cameraContext && self->_anchorManager)
    {
      self->_isUpdating = 1;
      -[VKAnchorWrapper _anchorWithContext:](self, "_anchorWithContext:");
      double v3 = (*(double (**)())(*(void *)v39 + 40))();
      double v37 = v5;
      double v38 = v4;
      double v6 = v3
         + (double)(*(uint64_t (**)(uint64_t, const void *))(*(void *)v39 + 72))(v39, self->_cameraContext);
      cameraContext = (char *)self->_cameraContext;
      double v8 = 1.0
         / (*((double *)cameraContext + 116)
          + *((double *)cameraContext + 104) * v6
          + *((double *)cameraContext + 108) * v38
          + *((double *)cameraContext + 112) * v37);
      float64x2_t v9 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*(float64x2_t *)(cameraContext + 904), *(float64x2_t *)(cameraContext + 808), v6), *(float64x2_t *)(cameraContext + 840), v38), *(float64x2_t *)(cameraContext + 872), v37), v8);
      double v10 = v8
          * (*((double *)cameraContext + 115)
           + *((double *)cameraContext + 103) * v6
           + *((double *)cameraContext + 107) * v38
           + *((double *)cameraContext + 111) * v37);
      int64x2_t v11 = vdupq_n_s64(0x7FF8000000000000uLL);
      int64x2_t v41 = v11;
      BOOL v13 = *(void *)&v9.f64[0] == v11.i64[0]
         && *(void *)&v9.f64[1] == v11.i64[1]
         && *(void *)&v10 == 0x7FF8000000000000;
      if (v13 || v10 < -1.05 || v10 > 1.05)
      {
        self->_screenPointInCanvas = (CGPoint)vdupq_n_s64(0x43E0000000000000uLL);
      }
      else
      {
        double v36 = v6;
        __asm { FMOV            V1.2D, #0.5 }
        float64x2_t v18 = vmulq_f64(v9, _Q1);
        *(void *)&v19.f64[0] = *(_OWORD *)&vaddq_f64(v18, _Q1);
        v19.f64[1] = vsubq_f64(_Q1, v18).f64[1];
        self->_screenPointInCanvas = (CGPoint)vmulq_f64((float64x2_t)self->_canvasSize, v19);
        char v20 = (*(uint64_t (**)())(*(void *)v39 + 16))();
        uint64_t v21 = (double *)self->_cameraContext;
        double v23 = v21[62];
        double v22 = v21[63];
        double v24 = v21[64];
        double v25 = 1.0;
        if (v20)
        {
          long double v26 = exp(v38 * 6.28318531 + -3.14159265);
          long double v27 = atan(v26) * 114.591559 + -90.0;
          long double v28 = cos(v27 * 0.034906585) * -559.82 + 111132.92;
          long double v29 = v28 + cos(v27 * 0.0698131701) * 1.175;
          long double v30 = v29 + cos(v27 * 0.104719755) * -0.0023;
          long double v31 = v27 * 0.00872664626;
          long double v32 = tan(v27 * 0.00872664626 + 0.78103484);
          double v33 = log(v32);
          long double v34 = tan(v31 + 0.789761487);
          double v25 = fabs((log(v34) - v33) * 0.159154943) / v30;
        }
        double v35 = (v36 - v23) * v21[386] + (v38 - v22) * v21[387] + (v37 - v24) * v21[388];
        self->_pointsPerMeter = self->_canvasSize.width * v25 / (v21[470] * (v35 + v35));
        (*(void (**)(int64x2_t *__return_ptr))(*(void *)v39 + 64))(&v41);
        *(int64x2_t *)&self->_lastCoordinate.latitude._value = v41;
        self->_lastCoordinate.altitude._value = v42;
      }
      self->_isUpdating = 0;
      if (v40)
      {
        if (!atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)())v40->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v40);
        }
      }
    }
    else
    {
      self->_screenPointInCanvas = (CGPoint)vdupq_n_s64(0x43E0000000000000uLL);
    }
  }
}

- (shared_ptr<md::Anchor>)_anchorWithContext:(void *)a3
{
  double v6 = v3;
  ptr = self->_anchor.__ptr_;
  if (!ptr) {
    goto LABEL_14;
  }
  if (*((void **)ptr + 1) != a3
    || (char v8 = (*(uint64_t (**)(Anchor *, SEL))(*(void *)ptr + 16))(ptr, a2) ^ (*((unsigned char *)a3 + 8) != 0),
        ptr = self->_anchor.__ptr_,
        (v8 & 1) != 0))
  {
LABEL_9:
    BOOL v13 = (Anchor *)objc_storeWeak((id *)ptr + 8, 0);
    cntrl = self->_anchor.__cntrl_;
    self->_anchor.__ptr_ = 0;
    self->_anchor.__cntrl_ = 0;
    if (!cntrl) {
      goto LABEL_14;
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      uint64_t v15 = self->_anchor.__ptr_;
      if (!v15) {
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    uint64_t v15 = self->_anchor.__ptr_;
    if (v15) {
      goto LABEL_15;
    }
LABEL_14:
    [(VKAnchorWrapper *)self coordinate3D];
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = v19;
    md::AnchorManager::newAnchorAtCoordinate(&v22, (uint64_t)a3, (uint64_t)v21, self->_followsTerrain);
  }
  if (((*(uint64_t (**)(Anchor *))(*(void *)ptr + 24))(ptr) & 1) == 0
    && self->_followsTerrain != (*(unsigned int (**)(Anchor *))(*(void *)self->_anchor.__ptr_ + 32))(self->_anchor.__ptr_))
  {
    ptr = self->_anchor.__ptr_;
    goto LABEL_9;
  }
  [(VKAnchorWrapper *)self coordinate3D];
  float64x2_t v9 = self->_anchor.__ptr_;
  v23[0] = v10;
  v23[1] = v11;
  v23[2] = v12;
  BOOL v13 = (Anchor *)(*(uint64_t (**)(Anchor *, void *))(*(void *)v9 + 88))(v9, v23);
  uint64_t v15 = self->_anchor.__ptr_;
  if (!v15) {
    goto LABEL_14;
  }
LABEL_15:
  char v20 = self->_anchor.__cntrl_;
  *double v6 = v15;
  v6[1] = (Anchor *)v20;
  if (v20) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v20 + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = v14;
  result.__ptr_ = v13;
  return result;
}

- (void)updateIfNeeded
{
  if (self->_cameraContext)
  {
    if (self->_anchorManager)
    {
      [(VKAnchorWrapper *)self coordinate3D];
      if (self->_lastCoordinate.latitude._value != v5
        || self->_lastCoordinate.longitude._value != v3
        || self->_lastCoordinate.altitude._value != v4)
      {
        [(VKAnchorWrapper *)self _updateCachedPoint];
      }
    }
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate3D
{
  [(VKAnchorWrapper *)self coordinate];
  double v4 = v3;
  double v6 = v5;
  [(VKAnchorWrapper *)self elevationOffset];
  double v8 = v7;
  double v9 = v4;
  double v10 = v6;
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (double)elevationOffset
{
  return 0.0;
}

- (void)anchorWorldPointDidChange:(void *)a3
{
  if (self->_cameraContext)
  {
    if (self->_anchorManager) {
      [(VKAnchorWrapper *)self _updateCachedPoint];
    }
  }
}

- (CGPoint)pointInLayer:(id)a3 bound:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v7 = a3;
  double v8 = v7;
  double x = self->_screenPointInCanvas.x;
  if (x == 9.22337204e18 || (double y = self->_screenPointInCanvas.y, y == 9.22337204e18))
  {
LABEL_3:
    double y = NAN;
    double x = NAN;
    goto LABEL_4;
  }
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      -[MDRenderTarget convertPoint:toLayer:](self->_displayLayer, "convertPoint:toLayer:", v8, self->_screenPointInCanvas.x, self->_screenPointInCanvas.y);
      double x = v13;
      double y = v14;
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v16 = self->_canvasSize.width;
  double v15 = self->_canvasSize.height;
  if (width != v16 || height != v15)
  {
    double x = x + (width - v16) * 0.5;
    double y = y + (height - v15) * 0.5;
  }
LABEL_4:

  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)setFollowsTerrain:(BOOL)a3
{
  self->_followsTerrain = a3;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void)setDisplayLayer:(id)a3
{
  self->_displayLayer = (MDRenderTarget *)a3;
}

- (void).cxx_destruct
{
  cntrl = self->_anchor.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (MDRenderTarget)displayLayer
{
  return self->_displayLayer;
}

- (BOOL)followsTerrain
{
  return self->_followsTerrain;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2 = -180.0;
  double v3 = -180.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)destroyAnchor
{
  ptr = self->_anchor.__ptr_;
  if (ptr) {
    objc_storeWeak((id *)ptr + 8, 0);
  }
  cntrl = self->_anchor.__cntrl_;
  self->_anchor.__ptr_ = 0;
  self->_anchor.__cntrl_ = 0;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  self->_displayLayer = 0;
  self->_canvasSize = 0u;
  *(_OWORD *)&self->_cameraContext = 0u;
}

- (void)dealloc
{
  ptr = self->_anchor.__ptr_;
  if (ptr) {
    objc_storeWeak((id *)ptr + 8, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)VKAnchorWrapper;
  [(VKAnchorWrapper *)&v4 dealloc];
}

@end