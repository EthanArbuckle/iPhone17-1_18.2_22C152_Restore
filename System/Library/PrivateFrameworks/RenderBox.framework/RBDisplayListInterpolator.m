@interface RBDisplayListInterpolator
+ (id)interpolatorWithFrom:(id)a3 to:(id)a4 options:(id)a5;
+ (id)newInterpolatorWithFrom:(id)a3 to:(id)a4 options:(id)a5;
- (BOOL)isIdentity;
- (BOOL)onlyFades;
- (CGRect)boundingRectWithProgress:(float)a3;
- (NSDictionary)options;
- (RBDisplayListContents)from;
- (RBDisplayListContents)to;
- (RBDisplayListInterpolator)initWithFrom:(id)a3 to:(id)a4 options:(id)a5;
- (double)activeDuration;
- (double)maxAbsoluteVelocityWithProgress:(float)a3;
- (id).cxx_construct;
- (id)contentsWithProgress:(float)a3;
- (id)copyContentsWithProgress:(float)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_drawInState:(float32_t)a3 alpha:(float)a4 by:;
- (void)drawInState:(_RBDrawingState *)a3 by:(float)a4;
- (void)initWithFrom:to:options:;
- (void)setFrom:(id)a3;
@end

@implementation RBDisplayListInterpolator

+ (id)interpolatorWithFrom:(id)a3 to:(id)a4 options:(id)a5
{
  v5 = (void *)[a1 newInterpolatorWithFrom:a3 to:a4 options:a5];
  return v5;
}

+ (id)newInterpolatorWithFrom:(id)a3 to:(id)a4 options:(id)a5
{
  v8 = [RBDisplayListInterpolator alloc];
  return [(RBDisplayListInterpolator *)v8 initWithFrom:a3 to:a4 options:a5];
}

- (RBDisplayListInterpolator)initWithFrom:(id)a3 to:(id)a4 options:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)RBDisplayListInterpolator;
  v8 = [(RBDisplayListInterpolator *)&v15 init];
  v9 = v8;
  if (v8)
  {
    p = v8->_from._p;
    if (p != a3)
    {

      v9->_from._p = (_RBDisplayListContents *)a3;
    }
    v11 = v9->_to._p;
    if (v11 != a4)
    {

      v9->_to._p = (_RBDisplayListContents *)a4;
    }
    uint64_t v12 = [a5 copy];

    v9->_options._p = (NSDictionary *)v12;
    uint64_t v13 = [a5 objectForKeyedSubscript:RBDisplayListInterpolatorTransition];
    if ((!v13 || !*(unsigned char *)(-[RBDecodedFontMetadata fontUID](v13) + 12))
    {
        -[RBDisplayListInterpolator initWithFrom:to:options:]::$_0::operator()();
    }
    operator new();
  }
  return 0;
}

- (void)initWithFrom:to:options:
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = *(atomic_uint **)(v4 + 8);
    p = self->_interp._p;
    if (v6 != (atomic_uint *)p)
    {
      if (v6)
      {
        if (atomic_fetch_add_explicit(v6 + 2, 0xFFFFFFFF, memory_order_release) == 1)
        {
          __dmb(9u);
          (*(void (**)(atomic_uint *))(*(void *)v6 + 8))(v6);
        }
        p = self->_interp._p;
      }
      if (p) {
        atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 1u, memory_order_relaxed);
      }
      v5[1] = p;
    }
    v8 = self->_from._p;
    v9 = (_RBDisplayListContents *)v5[2];
    if (v9 != v8)
    {

      v5[2] = v8;
    }
    v10 = self->_to._p;
    v11 = (_RBDisplayListContents *)v5[3];
    if (v11 != v10)
    {

      v5[3] = v10;
    }
    uint64_t v12 = self->_options._p;
    uint64_t v13 = (NSDictionary *)v5[4];
    if (v13 != v12)
    {

      v5[4] = v12;
    }
  }
  return v5;
}

- (RBDisplayListContents)from
{
  return self->_from._p;
}

- (void)setFrom:(id)a3
{
  p = self->_from._p;
  if (p != a3)
  {

    self->_from._p = (_RBDisplayListContents *)a3;
  }
}

- (RBDisplayListContents)to
{
  return self->_to._p;
}

- (NSDictionary)options
{
  return self->_options._p;
}

- (double)activeDuration
{
  p = self->_interp._p;
  if (p) {
    return *((float *)p + 38);
  }
  else {
    return 0.0;
  }
}

- (BOOL)isIdentity
{
  p = self->_interp._p;
  return p && *((unsigned char *)p + 392) && *((_DWORD *)p + 82) && *((_DWORD *)p + 84) == 32;
}

- (BOOL)onlyFades
{
  p = self->_interp._p;
  return p && RB::DisplayList::Interpolator::Layer::is_fade((RB::DisplayList::Interpolator::Layer *)((char *)p + 144));
}

- (CGRect)boundingRectWithProgress:(float)a3
{
  uint64_t v5 = [(_RBDisplayListContents *)self->_from._p _rb_contents];
  v6 = (const RB::DisplayList::Contents *)[(_RBDisplayListContents *)self->_to._p _rb_contents];
  p = self->_interp._p;
  if (p)
  {
    RB::DisplayList::interpolated_bounds((RB::DisplayList *)((char *)p + 144), 0, a3, v5, v6, v7);
    float64x2_t v10 = vcvtq_f64_f32(v9);
    float64x2_t v12 = vcvtq_f64_f32(v11);
  }
  else
  {
    float64x2_t v12 = *(float64x2_t *)MEMORY[0x263F001A0];
    float64x2_t v10 = *(float64x2_t *)(MEMORY[0x263F001A0] + 16);
  }
  double v13 = v12.f64[1];
  double v14 = v10.f64[1];
  result.size.width = v10.f64[0];
  result.origin.x = v12.f64[0];
  result.size.height = v14;
  result.origin.y = v13;
  return result;
}

- (double)maxAbsoluteVelocityWithProgress:(float)a3
{
  p = self->_interp._p;
  double result = 0.0;
  if (p)
  {
    int v7 = *((_DWORD *)p + 84);
    if ((v7 & 0x44) != 0
      || *((unsigned char *)p + 394)
      && ((int v22 = *((unsigned __int8 *)p + 392), (v7 & 3) == 0) ? (v23 = v22 == 0) : (v23 = 1), v23))
    {
      [(_RBDisplayListContents *)self->_from._p boundingRect];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(_RBDisplayListContents *)self->_to._p boundingRect];
      v26.origin.x = v16;
      v26.origin.y = v17;
      v26.size.double width = v18;
      v26.size.height = v19;
      v24.origin.x = v9;
      v24.origin.y = v11;
      v24.size.double width = v13;
      v24.size.height = v15;
      CGRect v25 = CGRectUnion(v24, v26);
      if (v25.size.width >= v25.size.height) {
        double width = v25.size.width;
      }
      else {
        double width = v25.size.height;
      }
      float v21 = a3;
      return width
           * RB::DisplayList::Interpolator::Contents::max_animation_speed((RB::DisplayList::Interpolator::Contents *)((char *)self->_interp._p + 16), v25.origin.x, v25.origin.y);
    }
  }
  return result;
}

- (void)drawInState:(_RBDrawingState *)a3 by:(float)a4
{
}

- (void)_drawInState:(float32_t)a3 alpha:(float)a4 by:
{
  if (a1)
  {
    double v8 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 16), "_rb_contents");
    CGFloat v9 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 24), "_rb_contents");
    uint64_t v10 = a2[1];
    if (!*(void *)(v10 + 24)) {
      make_contents(a2[1]);
    }
    [(id)v10 deviceScale];
    *(void *)&long long v11 = 0;
    *((void *)&v11 + 1) = v12;
    long long v17 = v12;
    long long v18 = v11;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v13 = *(void *)(a1 + 8);
    if (v13) {
      RB::DisplayList::Builder::draw_interpolated((RB::DisplayList::Layer ***)(v10 + 16), (RB::DisplayList::State *)a2, (const RB::DisplayList::Interpolator::Layer *)(v13 + 144), a3, a4, v8, v9, (const RB::AffineTransform *)&v17);
    }
    if (*(void *)(v10 + 304))
    {
      double v14 = (RBDisplayListInterpolator *)objc_msgSend(*(id *)(a1 + 16), "_rb_xml_document", v17, v18, v19, v20);
      CGFloat v15 = (const RB::XML::Document *)objc_msgSend(*(id *)(a1 + 24), "_rb_xml_document");
      if (v14)
      {
        if (v15) {
          RB::XML::DisplayList::draw_interpolated(*(RB::XML::DisplayList **)(v10 + 304), (RB::XML::Document *)a2, (_RBDrawingState *)a1, v14, v15, v16, a3, a4);
        }
      }
    }
  }
}

- (id)copyContentsWithProgress:(float)a3
{
  uint64_t v5 = [RBInterpolatedDisplayListContents alloc];
  return -[RBInterpolatedDisplayListContents initWithInterpolator:by:](v5, self, a3);
}

- (id)contentsWithProgress:(float)a3
{
  id v3 = -[RBDisplayListInterpolator copyContentsWithProgress:](self, "copyContentsWithProgress:");
  return v3;
}

- (void).cxx_destruct
{
  p = self->_interp._p;
  if (p && atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    uint64_t v4 = *(void (**)(void))(*(void *)p + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end