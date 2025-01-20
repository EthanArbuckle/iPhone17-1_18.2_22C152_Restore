@interface VKVectorOverlayPolygonGroup
- (CGColor)fillColor;
- (CGColor)strokeColor;
- (NSArray)polygons;
- (VKVectorOverlayPolygonGroup)initWithPolygons:(id)a3;
- (double)alpha;
- (double)lineWidth;
- (double)miterLimit;
- (double)strokeEnd;
- (double)strokeStart;
- (id).cxx_construct;
- (int64_t)lineJoin;
- (shared_ptr<md::PolygonOverlayRenderable::Style>)_style;
- (void)_updateStyleColor;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setBlendMode:(int64_t)a3;
- (void)setFillColor:(CGColor *)a3;
- (void)setLineJoin:(int64_t)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setStrokeColor:(CGColor *)a3;
- (void)setStrokeEnd:(double)a3;
- (void)setStrokeStart:(double)a3;
@end

@implementation VKVectorOverlayPolygonGroup

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((_DWORD *)self + 28) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_style.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_polygons, 0);
}

- (shared_ptr<md::PolygonOverlayRenderable::Style>)_style
{
  cntrl = self->_style.__cntrl_;
  *v2 = self->_style.__ptr_;
  v2[1] = (Style *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Style *)self;
  return result;
}

- (NSArray)polygons
{
  return self->_polygons;
}

- (void)setStrokeEnd:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_strokeEnd = a3;
  float strokeStart = self->_strokeStart;
  uint64_t v7 = *((void *)self->_style.__ptr_ + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 196));
  *(float *)(v7 + 152) = strokeStart;
  *(float *)&a3 = a3;
  *(_DWORD *)(v7 + 156) = LODWORD(a3);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 196));
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];

  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)strokeEnd
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double strokeEnd = self->_strokeEnd;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeEnd;
}

- (void)setStrokeStart:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_float strokeStart = a3;
  float strokeEnd = self->_strokeEnd;
  uint64_t v7 = *((void *)self->_style.__ptr_ + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 196));
  *(float *)&a3 = a3;
  *(_DWORD *)(v7 + 152) = LODWORD(a3);
  *(float *)(v7 + 156) = strokeEnd;
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 196));
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];

  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)strokeStart
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double strokeStart = self->_strokeStart;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeStart;
}

- (void)setAlpha:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double alpha = self->_alpha;
  self->_double alpha = a3;
  ptr = self->_style.__ptr_;
  float v8 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 6);
  *((float *)ptr + 4) = v8;
  uint64_t v9 = *((void *)ptr + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 196));
  *(float *)(v9 + 160) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 196));
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 6);
  double v10 = vabdd_f64(a3, alpha);
  if (v10 > fabs(alpha + a3) * 2.22044605e-14 && v10 >= 2.22507386e-308)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)alpha
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double alpha = self->_alpha;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return alpha;
}

- (void)setStrokeColor:(CGColor *)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  BOOL v6 = CGColorEqualToColor(a3, self->_strokeColor);
  CGColorRelease(self->_strokeColor);
  self->_strokeColor = CGColorRetain(a3);
  [(VKVectorOverlayPolygonGroup *)self _updateStyleColor];
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)strokeColor
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  strokeColor = self->_strokeColor;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return strokeColor;
}

- (void)setFillColor:(CGColor *)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  BOOL v6 = CGColorEqualToColor(a3, self->_fillColor);
  CGColorRelease(self->_fillColor);
  self->_fillColor = CGColorRetain(a3);
  [(VKVectorOverlayPolygonGroup *)self _updateStyleColor];
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)fillColor
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  fillColor = self->_fillColor;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return fillColor;
}

- (void)setMiterLimit:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double miterLimit = self->_miterLimit;
  double v7 = vabdd_f64(a3, miterLimit);
  self->_double miterLimit = a3;
  BOOL v8 = v7 <= fabs(miterLimit + a3) * 2.22044605e-14 || v7 < 2.22507386e-308;
  if (!v8 && self->_lineJoin == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:1];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)miterLimit
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double miterLimit = self->_miterLimit;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return miterLimit;
}

- (void)setLineJoin:(int64_t)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  if (self->_lineJoin != a3)
  {
    self->_lineJoin = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:1];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (int64_t)lineJoin
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  int64_t lineJoin = self->_lineJoin;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineJoin;
}

- (void)setLineWidth:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double lineWidth = self->_lineWidth;
  self->_double lineWidth = a3;
  uint64_t v8 = *((void *)self->_style.__ptr_ + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 196));
  float v7 = a3;
  *(float *)(v8 + 132) = v7;
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 196));
  double v9 = vabdd_f64(a3, lineWidth);
  if (v9 > fabs(lineWidth + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (double)lineWidth
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double lineWidth = self->_lineWidth;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineWidth;
}

- (void)_updateStyleColor
{
  ptr = self->_style.__ptr_;
  fillColor = self->_fillColor;
  float32x4_t v5 = 0uLL;
  float32x4_t v18 = 0u;
  BOOL v6 = (CFStringRef *)MEMORY[0x1E4F1DC98];
  if (fillColor)
  {
    float v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, fillColor, 0);
    CFRelease(v7);
    float32x4_t v5 = 0uLL;
    if (CopyByMatchingToColorSpace)
    {
      Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
      float32x4_t v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
      CGColorRelease(CopyByMatchingToColorSpace);
      float32x4_t v5 = v19;
    }
  }
  int8x16_t v20 = (int8x16_t)v5;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 6);
  int8x16_t v10 = v20;
  *(int8x16_t *)ptr = v20;
  v10.i32[0] = vextq_s8(v10, v10, 8uLL).u32[0];
  int32x2_t v11 = vceq_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 0), *(float32x2_t *)v10.i8);
  ptr[48] = v11.i8[4] & v11.i8[0] & 1;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 6);
  v12 = self->_style.__ptr_;
  strokeColor = self->_strokeColor;
  if (strokeColor)
  {
    v14 = CGColorSpaceCreateWithName(*v6);
    v15 = CGColorCreateCopyByMatchingToColorSpace(v14, kCGRenderingIntentDefault, strokeColor, 0);
    CFRelease(v14);
    if (v15)
    {
      v16 = (float64x2_t *)CGColorGetComponents(v15);
      float32x4_t v18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v16), v16[1]);
      CGColorRelease(v15);
    }
  }
  uint64_t v17 = *((void *)v12 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v17 + 196));
  *(float32x4_t *)(v17 + 136) = v18;
  os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 196));
}

- (void)setBlendMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayPolygonGroup;
  -[VKVectorOverlayData setBlendMode:](&v7, sel_setBlendMode_);
  ptr = (os_unfair_lock_s *)self->_style.__ptr_;
  if ((unint64_t)(a3 - 1) < 0x11) {
    uint32_t v6 = a3;
  }
  else {
    uint32_t v6 = 0;
  }
  os_unfair_lock_lock(ptr + 6);
  ptr[5]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(ptr + 6);
}

- (void)dealloc
{
  CGColorRelease(self->_fillColor);
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)VKVectorOverlayPolygonGroup;
  [(VKVectorOverlayPolygonGroup *)&v3 dealloc];
}

- (VKVectorOverlayPolygonGroup)initWithPolygons:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VKVectorOverlayPolygonGroup;
  float32x4_t v5 = [(VKVectorOverlayData *)&v19 init];
  uint32_t v6 = (VKVectorOverlayPolygonGroup *)v5;
  if (v5)
  {
    uint64_t v7 = [v4 copy];
    uint64_t v8 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v7;

    *((void *)v5 + 10) = 0x4024000000000000;
    _ZNSt3__115allocate_sharedB8nn180100IN2md24PolygonOverlayRenderable5StyleENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v18);
    double v9 = v5 + 32;
    long long v10 = v18;
    long long v18 = 0uLL;
    int32x2_t v11 = (std::__shared_weak_count *)*((void *)v5 + 5);
    *(_OWORD *)double v9 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    v12 = (std::__shared_weak_count *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v18 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    v13 = *(os_unfair_lock_s **)(*(void *)v9 + 32);
    os_unfair_lock_lock(v13 + 49);
    v13[33]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v13 + 49);
    uint64_t v14 = *(void *)v9;
    os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
    *(_DWORD *)(v14 + 16) = 0;
    v15 = *(os_unfair_lock_s **)(v14 + 32);
    os_unfair_lock_lock(v15 + 49);
    v15[40]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v15 + 49);
    os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 24));
    [(VKVectorOverlayPolygonGroup *)v6 _updateStyleColor];
    v16 = v6;
  }

  return v6;
}

@end