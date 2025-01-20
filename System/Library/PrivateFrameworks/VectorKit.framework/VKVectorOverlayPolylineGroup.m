@interface VKVectorOverlayPolylineGroup
- (CGColor)color;
- (NSArray)polylines;
- (VKVectorOverlayPolylineGroup)initWithPolylines:(id)a3;
- (double)alpha;
- (double)lineWidth;
- (double)miterLimit;
- (double)strokeEnd;
- (double)strokeStart;
- (id).cxx_construct;
- (int64_t)lineCap;
- (int64_t)lineJoin;
- (shared_ptr<md::PolylineOverlayStyle>)style;
- (void)_updateStyleColor;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setBlendMode:(int64_t)a3;
- (void)setColor:(CGColor *)a3;
- (void)setColorStopColors:(id)a3 locations:(id)a4;
- (void)setLineCap:(int64_t)a3;
- (void)setLineJoin:(int64_t)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setStrokeEnd:(double)a3;
- (void)setStrokeStart:(double)a3;
@end

@implementation VKVectorOverlayPolylineGroup

- (id).cxx_construct
{
  *((_DWORD *)self + 22) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polylines, 0);
  cntrl = self->_style.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (NSArray)polylines
{
  return self->_polylines;
}

- (shared_ptr<md::PolylineOverlayStyle>)style
{
  cntrl = self->_style.__cntrl_;
  *v2 = self->_style.__ptr_;
  v2[1] = (PolylineOverlayStyle *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PolylineOverlayStyle *)self;
  return result;
}

- (void)setStrokeEnd:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  self->_strokeEnd = a3;
  ptr = self->_style.__ptr_;
  float strokeStart = self->_strokeStart;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *((float *)ptr + 38) = strokeStart;
  *(float *)&a3 = a3;
  *((_DWORD *)ptr + 39) = LODWORD(a3);
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
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
  ptr = self->_style.__ptr_;
  float strokeEnd = self->_strokeEnd;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *(float *)&a3 = a3;
  *((_DWORD *)ptr + 38) = LODWORD(a3);
  *((float *)ptr + 39) = strokeEnd;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
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

- (void)setLineCap:(int64_t)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  if (self->_lineCap != a3)
  {
    self->_lineCap = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:1];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (int64_t)lineCap
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  int64_t lineCap = self->_lineCap;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return lineCap;
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

- (void)setAlpha:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double alpha = self->_alpha;
  self->_double alpha = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  float v8 = a3;
  *((float *)ptr + 40) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
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

- (void)setColor:(CGColor *)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  BOOL v6 = CGColorEqualToColor(a3, self->_color);
  CGColorRelease(self->_color);
  self->_color = CGColorRetain(a3);
  [(VKVectorOverlayPolylineGroup *)self _updateStyleColor];
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    [WeakRetained vectorOverlayNeedsDisplay:self needsFullInvalidate:0];
  }
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
}

- (CGColor)color
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  color = self->_color;
  os_unfair_lock_unlock(&p_propertiesLock->_lock);
  return color;
}

- (void)setLineWidth:(double)a3
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock(&self->_propertiesLock._lock);
  double lineWidth = self->_lineWidth;
  self->_double lineWidth = a3;
  ptr = self->_style.__ptr_;
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  float v8 = a3;
  *((float *)ptr + 33) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
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
  color = self->_color;
  float32x4_t v7 = 0u;
  if (color)
  {
    v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, kCGRenderingIntentDefault, color, 0);
    CFRelease(v4);
    if (CopyByMatchingToColorSpace)
    {
      Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
      float32x4_t v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]);
      CGColorRelease(CopyByMatchingToColorSpace);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *(float32x4_t *)((char *)ptr + 136) = v7;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
}

- (void)setColorStopColors:(id)a3 locations:(id)a4
{
  id v58 = a3;
  id v6 = a4;
  v57 = self;
  if ([v6 count])
  {
    uint64_t v7 = [v6 count];
    if (v7 == [v58 count])
    {
      unint64_t v8 = [v6 count];
      unint64_t v9 = v8;
      if (v8)
      {
        if (v8 > 0xCCCCCCCCCCCCCCCLL) {
          abort();
        }
        v10 = (float *)operator new(20 * v8);
        v11 = (char *)&v10[5 * v9];
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      unint64_t v34 = 0;
      CFStringRef v35 = (const __CFString *)*MEMORY[0x1E4F1DC98];
      v12 = v10;
      while (1)
      {
        while (1)
        {
          if (v34 >= objc_msgSend(v6, "count", v57)) {
            goto LABEL_7;
          }
          v36 = [v6 objectAtIndexedSubscript:v34];
          [v36 floatValue];
          int v38 = v37;

          v39 = [v58 objectAtIndexedSubscript:v34];

          float v40 = 0.0;
          if (v39) {
            break;
          }
          float v43 = 0.0;
          float v44 = 0.0;
          float v45 = 0.0;
          if (v12 >= (float *)v11) {
            goto LABEL_57;
          }
LABEL_49:
          float *v12 = v40;
          v12[1] = v43;
          v12[2] = v44;
          v12[3] = v45;
          *((_DWORD *)v12 + 4) = v38;
          v12 += 5;
          ++v34;
        }
        v41 = CGColorSpaceCreateWithName(v35);
        CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v41, kCGRenderingIntentDefault, (CGColorRef)v39, 0);
        CFRelease(v41);
        float v43 = 0.0;
        float v44 = 0.0;
        float v45 = 0.0;
        if (CopyByMatchingToColorSpace)
        {
          Components = CGColorGetComponents(CopyByMatchingToColorSpace);
          double v47 = *Components;
          double v48 = Components[1];
          double v49 = Components[2];
          double v50 = Components[3];
          CGColorRelease(CopyByMatchingToColorSpace);
          float v40 = v47;
          float v43 = v48;
          float v44 = v49;
          float v45 = v50;
        }
        if (v12 < (float *)v11) {
          goto LABEL_49;
        }
LABEL_57:
        unint64_t v51 = 0xCCCCCCCCCCCCCCCDLL * (v12 - v10) + 1;
        if (v51 > 0xCCCCCCCCCCCCCCCLL) {
          abort();
        }
        if (0x999999999999999ALL * ((v11 - (char *)v10) >> 2) > v51) {
          unint64_t v51 = 0x999999999999999ALL * ((v11 - (char *)v10) >> 2);
        }
        if (0xCCCCCCCCCCCCCCCDLL * ((v11 - (char *)v10) >> 2) >= 0x666666666666666) {
          unint64_t v52 = 0xCCCCCCCCCCCCCCCLL;
        }
        else {
          unint64_t v52 = v51;
        }
        if (v52 > 0xCCCCCCCCCCCCCCCLL) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        v53 = (char *)operator new(20 * v52);
        v54 = (float *)&v53[4 * (v12 - v10)];
        float *v54 = v40;
        v54[1] = v43;
        v54[2] = v44;
        v54[3] = v45;
        *((_DWORD *)v54 + 4) = v38;
        if (v12 == v10)
        {
          v56 = &v53[4 * (v12 - v10)];
        }
        else
        {
          v55 = &v53[4 * (v12 - v10)];
          do
          {
            v56 = v55 - 20;
            *(_OWORD *)(v55 - 20) = *(_OWORD *)(v12 - 5);
            *((float *)v55 - 1) = *(v12 - 1);
            v12 -= 5;
            v55 -= 20;
          }
          while (v12 != v10);
        }
        v11 = &v53[20 * v52];
        v12 = v54 + 5;
        if (v10) {
          operator delete(v10);
        }
        v10 = (float *)v56;
        ++v34;
      }
    }
  }
  v10 = 0;
  v12 = 0;
LABEL_7:
  unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * (v12 - v10);
  if (v13 <= 0x10)
  {
    ptr = v57->_style.__ptr_;
    os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
    v15 = (char *)*((void *)ptr + 21);
    uint64_t v16 = *((void *)ptr + 23);
    if (0xCCCCCCCCCCCCCCCDLL * ((v16 - (uint64_t)v15) >> 2) >= v13)
    {
      v20 = (char *)*((void *)ptr + 22);
      if (0xCCCCCCCCCCCCCCCDLL * ((v20 - v15) >> 2) >= v13)
      {
        v26 = (char *)*((void *)ptr + 21);
        if (v10 != v12)
        {
          v27 = v10;
          do
          {
            *(float *)v26 = *v27;
            *((float *)v26 + 1) = v27[1];
            *((float *)v26 + 2) = v27[2];
            *((float *)v26 + 3) = v27[3];
            *((float *)v26 + 4) = v27[4];
            v26 += 20;
            v27 += 5;
          }
          while (v27 != v12);
        }
        int64_t v23 = v26 - v15;
        v20 = v15;
        goto LABEL_32;
      }
      v24 = (char *)&v10[(v20 - v15) >> 2];
      if (v20 != v15)
      {
        v25 = (char *)v10;
        do
        {
          *(_DWORD *)v15 = *(_DWORD *)v25;
          *((_DWORD *)v15 + 1) = *((_DWORD *)v25 + 1);
          *((_DWORD *)v15 + 2) = *((_DWORD *)v25 + 2);
          *((_DWORD *)v15 + 3) = *((_DWORD *)v25 + 3);
          *((_DWORD *)v15 + 4) = *((_DWORD *)v25 + 4);
          v25 += 20;
          v15 += 20;
        }
        while (v25 != v24);
      }
      for (i = v20; v24 != (char *)v12; v24 += 20)
      {
        *(_OWORD *)i = *(_OWORD *)v24;
        *((_DWORD *)i + 4) = *((_DWORD *)v24 + 4);
        i += 20;
      }
    }
    else
    {
      if (v15)
      {
        *((void *)ptr + 22) = v15;
        operator delete(v15);
        uint64_t v16 = 0;
        *((void *)ptr + 21) = 0;
        *((void *)ptr + 22) = 0;
        *((void *)ptr + 23) = 0;
      }
      unint64_t v17 = 0xCCCCCCCCCCCCCCCDLL * (v16 >> 2);
      unint64_t v18 = 0x999999999999999ALL * (v16 >> 2);
      if (v18 <= v13) {
        unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * (v12 - v10);
      }
      if (v17 >= 0x666666666666666) {
        unint64_t v19 = 0xCCCCCCCCCCCCCCCLL;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19 > 0xCCCCCCCCCCCCCCCLL) {
        abort();
      }
      v20 = (char *)operator new(20 * v19);
      *((void *)ptr + 21) = v20;
      *((void *)ptr + 22) = v20;
      *((void *)ptr + 23) = &v20[20 * v19];
      i = v20;
      if (v10 != v12)
      {
        v22 = v10;
        i = v20;
        do
        {
          *(_OWORD *)i = *(_OWORD *)v22;
          *((float *)i + 4) = v22[4];
          i += 20;
          v22 += 5;
        }
        while (v22 != v12);
      }
    }
    int64_t v23 = i - v20;
LABEL_32:
    v28 = &v20[v23];
    *((void *)ptr + 22) = &v20[v23];
    v29 = (char *)*((void *)ptr + 21);
    if (v29 == v28)
    {
      BOOL v32 = 0;
    }
    else
    {
      v30 = (float *)(v29 + 20);
      do
      {
        float v31 = *(v30 - 2);
        BOOL v32 = v31 < 1.0;
        BOOL v33 = v31 < 1.0 || v30 == (float *)v28;
        v30 += 5;
      }
      while (!v33);
    }
    *((unsigned char *)ptr + 192) = v32;
    os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
  }
  if (v10) {
    operator delete(v10);
  }
}

- (void)setBlendMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayPolylineGroup;
  -[VKVectorOverlayData setBlendMode:](&v7, sel_setBlendMode_);
  ptr = self->_style.__ptr_;
  if ((unint64_t)(a3 - 1) < 0x11) {
    int v6 = a3;
  }
  else {
    int v6 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)ptr + 49);
  *((_DWORD *)ptr + 41) = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)ptr + 49);
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)VKVectorOverlayPolylineGroup;
  [(VKVectorOverlayPolylineGroup *)&v3 dealloc];
}

- (VKVectorOverlayPolylineGroup)initWithPolylines:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKVectorOverlayPolylineGroup;
  v5 = [(VKVectorOverlayData *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    objc_super v7 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v6;

    *((void *)v5 + 8) = 0x4024000000000000;
    *((void *)v5 + 9) = 0;
    *((void *)v5 + 10) = 0x3FF0000000000000;
    unint64_t v8 = operator new(0xE0uLL);
    v8[1] = 0;
    v8[2] = 0;
    *unint64_t v8 = &unk_1EF581018;
    unint64_t v9 = md::PolylineOverlayStyle::PolylineOverlayStyle((md::PolylineOverlayStyle *)(v8 + 3));
    v10 = (os_unfair_lock_s **)(v5 + 96);
    v11 = (std::__shared_weak_count *)*((void *)v5 + 13);
    *((void *)v5 + 12) = v9;
    *((void *)v5 + 13) = v8;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    v12 = *v10;
    *(float *)&uint32_t v13 = *((double *)v5 + 9);
    *(float *)&uint32_t v14 = *((double *)v5 + 10);
    v15 = *v10 + 49;
    os_unfair_lock_lock(v15);
    v12[38]._os_unfair_lock_opaque = v13;
    v12[39]._os_unfair_lock_opaque = v14;
    os_unfair_lock_unlock(v15);
    uint64_t v16 = v5;
  }

  return (VKVectorOverlayPolylineGroup *)v5;
}

@end