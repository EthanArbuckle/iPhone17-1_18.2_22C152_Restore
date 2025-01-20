@interface VKVectorOverlayCircle
- (Box<double,)_bounds;
- (CGColor)fillColor;
- (CGColor)strokeColor;
- (VKVectorOverlayCircle)initWithMapRect:(id)a3 lineWidth:(double)a4 fillColor:(CGColor *)a5 strokeColor:(CGColor *)a6 alpha:(double)a7;
- (double)alpha;
- (double)lineWidth;
- (id).cxx_construct;
- (shared_ptr<md::CircleOverlayRenderable>)_renderable;
- (void)_updateStyleColor;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setBlendMode:(int64_t)a3;
- (void)setFillColor:(CGColor *)a3;
- (void)setLineWidth:(double)a3;
- (void)setStrokeColor:(CGColor *)a3;
@end

@implementation VKVectorOverlayCircle

- (id).cxx_construct
{
  *((_DWORD *)self + 30) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
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
  v4 = self->_renderable.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v4 + 16))(v4, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
}

- (shared_ptr<md::CircleOverlayRenderable>)_renderable
{
  cntrl = self->_renderable.__cntrl_;
  *v2 = self->_renderable.__ptr_;
  v2[1] = (CircleOverlayRenderable *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CircleOverlayRenderable *)self;
  return result;
}

- (Box<double,)_bounds
{
  double v2 = self->_bounds._minimum._e[0];
  double v3 = self->_bounds._minimum._e[1];
  double v4 = self->_bounds._maximum._e[0];
  double v5 = self->_bounds._maximum._e[1];
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (void)setAlpha:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double alpha = self->_alpha;
  self->_double alpha = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 11);
  float v8 = a3;
  *((float *)ptr + 9) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 11);
  double v9 = vabdd_f64(a3, alpha);
  if (v9 > fabs(alpha + a3) * 2.22044605e-14 && v9 >= 2.22507386e-308)
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
  [(VKVectorOverlayCircle *)self _updateStyleColor];
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
  [(VKVectorOverlayCircle *)self _updateStyleColor];
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

- (void)setLineWidth:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double lineWidth = self->_lineWidth;
  self->_double lineWidth = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 11);
  float v8 = a3;
  *(float *)ptr = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 11);
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
  float32x4_t v15 = 0u;
  BOOL v6 = (CFStringRef *)MEMORY[0x1E4F1DC98];
  if (fillColor)
  {
    v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, fillColor, 0);
    CFRelease(v7);
    float32x4_t v5 = 0uLL;
    if (CopyByMatchingToColorSpace)
    {
      Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
      float32x4_t v16 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
      CGColorRelease(CopyByMatchingToColorSpace);
      float32x4_t v5 = v16;
    }
  }
  float32x4_t v17 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 11);
  *(float32x4_t *)(ptr + 20) = v17;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 11);
  v10 = self->_style.__ptr_;
  strokeColor = self->_strokeColor;
  if (strokeColor)
  {
    v12 = CGColorSpaceCreateWithName(*v6);
    v13 = CGColorCreateCopyByMatchingToColorSpace(v12, kCGRenderingIntentDefault, strokeColor, 0);
    CFRelease(v12);
    if (v13)
    {
      v14 = (float64x2_t *)CGColorGetComponents(v13);
      float32x4_t v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*v14), v14[1]);
      CGColorRelease(v13);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)v10 + 11);
  *(float32x4_t *)(v10 + 4) = v15;
  os_unfair_lock_unlock((os_unfair_lock_t)v10 + 11);
}

- (void)setBlendMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayCircle;
  -[VKVectorOverlayData setBlendMode:](&v7, sel_setBlendMode_);
  ptr = (os_unfair_lock_s *)self->_style.__ptr_;
  if ((unint64_t)(a3 - 1) < 0x11) {
    uint32_t v6 = a3;
  }
  else {
    uint32_t v6 = 0;
  }
  os_unfair_lock_lock(ptr + 11);
  ptr[10]._os_unfair_lock_opaque = v6;
  os_unfair_lock_unlock(ptr + 11);
}

- (void)dealloc
{
  CGColorRelease(self->_fillColor);
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)VKVectorOverlayCircle;
  [(VKVectorOverlayCircle *)&v3 dealloc];
}

- (VKVectorOverlayCircle)initWithMapRect:(id)a3 lineWidth:(double)a4 fillColor:(CGColor *)a5 strokeColor:(CGColor *)a6 alpha:(double)a7
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v13 = a3.var0.var1;
  double v14 = a3.var0.var0;
  v37.receiver = self;
  v37.super_class = (Class)VKVectorOverlayCircle;
  float32x4_t v15 = [(VKVectorOverlayData *)&v37 init];
  float32x4_t v16 = v15;
  float32x4_t v17 = v15;
  if (v15)
  {
    v15->_float lineWidth = a4;
    v15->_fillColor = CGColorRetain(a5);
    v17->_strokeColor = CGColorRetain(a6);
    v17->_float alpha = a7;
    v18 = (char *)operator new(0x48uLL);
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 2) = 0;
    *(void *)v18 = &unk_1EF581718;
    *(_OWORD *)(v18 + 40) = 0u;
    *(_OWORD *)(v18 + 56) = 0u;
    *(_OWORD *)(v18 + 24) = 0u;
    p_style = (float **)&v16->_style;
    cntrl = (std::__shared_weak_count *)v16->_style.__cntrl_;
    v16->_style.__ptr_ = (Style *)(v18 + 24);
    v16->_style.__cntrl_ = (__shared_weak_count *)v18;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v21 = *p_style;
    float lineWidth = v17->_lineWidth;
    v23 = (os_unfair_lock_s *)(*p_style + 11);
    os_unfair_lock_lock(v23);
    float *v21 = lineWidth;
    os_unfair_lock_unlock(v23);
    v24 = *p_style;
    float alpha = v17->_alpha;
    v26 = (os_unfair_lock_s *)(*p_style + 11);
    os_unfair_lock_lock(v26);
    v24[9] = alpha;
    os_unfair_lock_unlock(v26);
    double v27 = *(double *)(MEMORY[0x1E4F63F08] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F63F08] + 24);
    v16->_bounds._minimum._e[0] = v14 / v27;
    v16->_bounds._minimum._e[1] = 1.0 - (var1 + v13) / v28;
    v16->_bounds._maximum._e[0] = (var0 + v14) / v27;
    v16->_bounds._maximum._e[1] = 1.0 - v13 / v28;
    v29 = (char *)operator new(0xC0uLL);
    *((void *)v29 + 1) = 0;
    *((void *)v29 + 2) = 0;
    *(void *)v29 = &unk_1EF581750;
    Matrix<double, 2, 1> minimum = v16->_bounds._minimum;
    *(Matrix<double, 2, 1> *)(v29 + 40) = v16->_bounds._maximum;
    *(Matrix<double, 2, 1> *)(v29 + 24) = minimum;
    *((void *)v29 + 7) = *p_style;
    v31 = v16->_style.__cntrl_;
    *((void *)v29 + 8) = v31;
    if (v31) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v31 + 1, 1uLL, memory_order_relaxed);
    }
    *((_OWORD *)v29 + 10) = 0u;
    *((_OWORD *)v29 + 11) = 0u;
    *((_OWORD *)v29 + 8) = 0u;
    *((_OWORD *)v29 + 9) = 0u;
    *((_OWORD *)v29 + 6) = 0u;
    *((_OWORD *)v29 + 7) = 0u;
    *((_OWORD *)v29 + 5) = 0u;
    v32 = operator new(0xF8uLL);
    v32[1] = 0;
    v32[2] = 0;
    void *v32 = &unk_1EF583D28;
    ggl::BufferData::BufferData((uint64_t)(v32 + 3), 2, 1, 0, 6, 6);
    *((_DWORD *)v32 + 60) = 0;
    v32[3] = &unk_1EF55B630;
    v32[4] = 2;
    v32[28] = &unk_1EF55B650;
    v32[29] = "circle index data";
    uint64_t v33 = v32[12];
    *(void *)uint64_t v33 = 0x200010000;
    *(_DWORD *)(v33 + 8) = 196610;
    v34 = operator new(0xF8uLL);
    v34[1] = 0;
    v34[2] = 0;
    void *v34 = &unk_1EF584380;
    ggl::BufferData::BufferData((uint64_t)(v34 + 3), 8, 0, 0, 6, 4);
    v34[29] = "circle vertex data";
    v34[30] = &ggl::CommonMesh::bufferPos2Reflection;
    v34[3] = &unk_1EF55BF88;
    v34[28] = &unk_1EF55BFA8;
    v35 = (_OWORD *)v34[12];
    _OWORD *v35 = xmmword_1A28FCE90;
    v35[1] = xmmword_1A28FD270;
    operator new();
  }

  return 0;
}

@end