@interface RBSymbolAnimator
- ($4C453035CF9D444C7FDAB91FAAAE42FC)transform;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorForStyle:(unsigned int)a3;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)opacities;
- (BOOL)flipsRightToLeft;
- (BOOL)isAnimating;
- (BOOL)isHidden;
- (CGPoint)anchorPoint;
- (CGPoint)position;
- (CGPoint)presentationPosition;
- (CGRect)alignmentRect;
- (CGRect)boundingRect;
- (CGRect)unroundedAlignmentRect;
- (CGSize)size;
- (CUINamedVectorGlyph)glyph;
- (_RBSymbolUpdate)beginUpdateWithRenderingMode:(unsigned int)a3;
- (_RBSymbolUpdate)beginUpdateWithRenderingMode:(unsigned int)a3 position:(const CGPoint *)a4 size:(const CGSize *)a5 flags:(unsigned int)a6;
- (double)currentTime;
- (double)maxVelocity;
- (double)variableValue;
- (id).cxx_construct;
- (id)copyDebugDescriptionForUpdate:(_RBSymbolUpdate *)a3;
- (int)scaleLevel;
- (uint64_t)notifyObservers;
- (uint64_t)unblockObservers;
- (unsigned)addAnimation:(unsigned int)a3 options:(id)a4;
- (unsigned)depth;
- (unsigned)renderingMode;
- (unsigned)styleMask;
- (unsigned)version;
- (void)addObserver:(uint64_t)a1;
- (void)cancelAllAnimations;
- (void)cancelAnimation:(unsigned int)a3;
- (void)cancelAnimationWithID:(unsigned int)a3;
- (void)dealloc;
- (void)endUpdate:(_RBSymbolUpdate *)a3;
- (void)notifyObservers;
- (void)removeAllAnimations;
- (void)removeAnimation:(unsigned int)a3;
- (void)removeAnimationWithID:(unsigned int)a3;
- (void)removeObserver:(uint64_t)a1;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setColor:(id)a3 forStyle:(unsigned int)a4;
- (void)setCurrentTime:(double)a3;
- (void)setDepth:(unsigned int)a3;
- (void)setFlipsRightToLeft:(BOOL)a3;
- (void)setGlyph:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setOpacities:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setPresentationPosition:(CGPoint)a3;
- (void)setPriority:(float)a3 ofAnimationWithID:(unsigned int)a4;
- (void)setRenderingMode:(unsigned int)a3;
- (void)setScaleLevel:(int)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(id)a3;
- (void)setVariableValue:(double)a3;
@end

@implementation RBSymbolAnimator

- (unsigned)styleMask
{
  return RB::Symbol::Animator::style_mask(&self->_animator._lock._lock);
}

- (unsigned)version
{
  return *(_DWORD *)&self->_anon_38[12];
}

- (BOOL)isAnimating
{
  return RB::Symbol::Animator::animating(&self->_animator._lock._lock);
}

- (CUINamedVectorGlyph)glyph
{
  return (CUINamedVectorGlyph *)RB::Symbol::Animator::glyph(&self->_animator._lock._lock);
}

- (unsigned)renderingMode
{
  return RB::Symbol::Animator::rendering_mode(&self->_animator._lock._lock);
}

- (id).cxx_construct
{
  self->_lock._lock._os_unfair_lock_opaque = 0;
  self->_observers._p_2 = 0;
  *(void *)&self->_observers.var0 = 0x200000000;
  self->_needs_notify.__a_.__a_value = 0;
  return self;
}

- (void)setFlipsRightToLeft:(BOOL)a3
{
  if (RB::Symbol::Animator::set_flips_rtl((RB::Symbol::Animator *)&self->_animator, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setPresentationPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  if (RB::Symbol::Animator::set_presentation_position((uint64_t)&self->_animator, vcvt_f32_f64((float64x2_t)a3)))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (CGRect)alignmentRect
{
  v2 = (float32x2_t *)RB::Symbol::Model::glyph_info((RB::Symbol::Model *)self->_animator._model._p);
  v3.i32[0] = 0;
  float32x2_t v4 = v2[10];
  uint32x2_t v5 = (uint32x2_t)vcgtz_f32(v4);
  *(uint32x2_t *)v6.i8 = vpmin_u32(v5, v5);
  int8x16_t v7 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v3, v6), 0);
  int8x16_t v8 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v4), *(int8x16_t *)(MEMORY[0x263F001A0] + 16));
  int8x16_t v9 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v2[9]), *MEMORY[0x263F001A0]);
  double v10 = *(double *)&v9.i64[1];
  double v11 = *(double *)&v8.i64[1];
  result.size.width = *(double *)v8.i64;
  result.origin.x = *(double *)v9.i64;
  result.size.height = v11;
  result.origin.CGFloat y = v10;
  return result;
}

- (void)setVariableValue:(double)a3
{
  float v4 = a3;
  if (RB::Symbol::Animator::set_variable_value(&self->_animator._lock._lock, v4))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setRenderingMode:(unsigned int)a3
{
  if (RB::Symbol::Animator::set_rendering_mode((uint64_t)&self->_animator, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setSize:(CGSize)a3
{
  CGFloat height = a3.height;
  if (RB::Symbol::Animator::set_size((uint64_t)&self->_animator, vcvt_f32_f64((float64x2_t)a3)))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  if (RB::Symbol::Animator::set_position((uint64_t)&self->_animator, vcvt_f32_f64((float64x2_t)a3)))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setAnchorPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  if (RB::Symbol::Animator::set_anchor_point((uint64_t)&self->_animator, vcvt_f32_f64((float64x2_t)a3)))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setGlyph:(id)a3
{
  if (RB::Symbol::Animator::set_glyph((RB::Symbol::Animator *)&self->_animator, (CUINamedVectorGlyph *)a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (double)variableValue
{
  return RB::Symbol::Animator::variable_value(&self->_animator._lock._lock);
}

- (void)notifyObservers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a1 && (*(unsigned char *)(a1 + 120) & 1) != 0)
  {
    v20 = 0;
    size_t v21 = 0;
    unint64_t v22 = 4;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if (*(void *)(a1 + 104)) {
      v2 = *(void ***)(a1 + 104);
    }
    else {
      v2 = (void **)(a1 + 88);
    }
    uint64_t v3 = *(unsigned int *)(a1 + 112);
    if (v3)
    {
      uint64_t v4 = 8 * v3;
      do
      {
        uint32x2_t v5 = *v2;
        id v6 = (id)a1;
        id v7 = v5;
        size_t v8 = v21;
        size_t v9 = v21 + 1;
        if (v22 < v21 + 1)
        {
          RB::vector<std::pair<RB::objc_ptr<RBSymbolAnimator *>,RB::objc_ptr<objc_object  {objcproto24RBSymbolAnimatorObserver}*>>,4ul,unsigned long>::reserve_slow(v19, v9);
          size_t v8 = v21;
          size_t v9 = v21 + 1;
        }
        double v10 = v20;
        if (!v20) {
          double v10 = v19;
        }
        double v11 = &v10[16 * v8];
        *double v11 = v6;
        v11[1] = v7;
        size_t v21 = v9;
        ++v2;
        v4 -= 8;
      }
      while (v4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 120) = 0;
    if (v21)
    {
      if (!pthread_main_np()) {
        operator new();
      }
      v12 = v20;
      v13 = v19;
      if (v20) {
        v13 = v20;
      }
      if (!v21) {
        goto LABEL_28;
      }
      uint64_t v14 = 16 * v21;
      v15 = (id *)(v13 + 8);
      do
      {
        [*v15 symbolAnimatorDidChange:*v15];
        v15 += 2;
        v14 -= 16;
      }
      while (v14);
      v12 = v20;
      v16 = v19;
      if (v20) {
        v16 = v20;
      }
      if (!v21) {
        goto LABEL_28;
      }
      size_t v17 = 0;
      v18 = (id *)(v16 + 8);
      do
      {

        ++v17;
        v18 += 2;
      }
      while (v17 < v21);
    }
    v12 = v20;
LABEL_28:
    if (v12) {
      free(v12);
    }
  }
}

- (void)endUpdate:(_RBSymbolUpdate *)a3
{
  uint64_t v4 = RB::Symbol::Presentation::shared((RB::Symbol::Presentation *)self);
  RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)a3);
  os_unfair_lock_lock((os_unfair_lock_t)v4);
  *(void *)a3 = *(void *)(v4 + 8);
  *(void *)(v4 + 8) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)v4);
}

- (_RBSymbolUpdate)beginUpdateWithRenderingMode:(unsigned int)a3 position:(const CGPoint *)a4 size:(const CGSize *)a5 flags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v9 = *(void *)&a3;
  uint64_t v11 = RB::Symbol::Presentation::shared((RB::Symbol::Presentation *)self);
  os_unfair_lock_lock((os_unfair_lock_t)v11);
  v12 = *(void **)(v11 + 8);
  if (v12) {
    *(void *)(v11 + 8) = *v12;
  }
  else {
    v12 = malloc_type_malloc(0x820uLL, 0x9E39E26DuLL);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v11);
  if (a4)
  {
    CGPoint v13 = *a4;
    *(float32x2_t *)&v13.x = vcvt_f32_f64(*(float64x2_t *)a4);
    if (a5)
    {
LABEL_6:
      float32x2_t v14 = vcvt_f32_f64(*(float64x2_t *)a5);
      uint64_t v15 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    v13.x = 0.0;
    if (a5) {
      goto LABEL_6;
    }
  }
  float32x2_t v14 = 0;
  uint64_t v15 = 0;
LABEL_9:
  return (_RBSymbolUpdate *)RB::Symbol::Presentation::Presentation(v12, &self->_animator, *(void *)&v14, v15, v9, v6, (__n128)v13);
}

- (void)dealloc
{
  RB::Symbol::Animator::remove_all_animations(&self->_animator._lock._lock);
  v3.receiver = self;
  v3.super_class = (Class)RBSymbolAnimator;
  [(RBSymbolAnimator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  p_2 = self->_observers._p_2;
  if (p_2) {
    free(p_2);
  }
  p = self->_animator._animations._p;
  if (self->_animator._animations._size)
  {
    unint64_t v5 = 0;
    uint64_t v6 = (atomic_uint **)&p[2].terms_and_args._p[16];
    do
    {
      id v7 = *v6;
      if (*v6 && atomic_fetch_add_explicit(v7 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *, SEL))(*(void *)v7 + 8))(v7, a2);
      }
      uint64_t v8 = (uint64_t)*(v6 - 1);
      *(v6 - 1) = 0;
      if (v8) {
        std::default_delete<RB::Symbol::Animation::Timing>::operator()[abi:nn180100]((uint64_t)(v6 - 1), v8);
      }

      ++v5;
      v6 += 11;
    }
    while (v5 < self->_animator._animations._size);
    p = self->_animator._animations._p;
  }
  if (p) {
    free(p);
  }
  uint64_t v9 = self->_animator._model._p;
  if (v9 && atomic_fetch_add_explicit((atomic_uint *volatile)v9 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    double v10 = *(void (**)(void))(*(void *)v9 + 8);
    v10();
  }
}

- (void)addObserver:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    uint64_t v5 = *(void *)(a1 + 104);
    if (v5) {
      uint64_t v6 = *(void **)(a1 + 104);
    }
    else {
      uint64_t v6 = (void *)(a1 + 88);
    }
    uint64_t v7 = *(unsigned int *)(a1 + 112);
    if (v7)
    {
      uint64_t v8 = 8 * v7;
      while (*v6 != a2)
      {
        ++v6;
        v8 -= 8;
        if (!v8) {
          goto LABEL_9;
        }
      }
    }
    else
    {
LABEL_9:
      if (*(_DWORD *)(a1 + 116) < (v7 + 1))
      {
        RB::vector<objc_object  {objcproto24RBSymbolAnimatorObserver}*,2ul,unsigned int>::reserve_slow((void *)(a1 + 88), v7 + 1);
        uint64_t v5 = *(void *)(a1 + 104);
        uint64_t v7 = *(unsigned int *)(a1 + 112);
      }
      if (!v5) {
        uint64_t v5 = a1 + 88;
      }
      *(void *)(v5 + 8 * v7) = a2;
      ++*(_DWORD *)(a1 + 112);
      *(unsigned char *)(a1 + 120) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)removeObserver:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    uint64_t v5 = *(unsigned int *)(a1 + 112);
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 104);
        if (!v8) {
          uint64_t v8 = a1 + 88;
        }
        if (*(void *)(v8 + v6) == a2)
        {
          unsigned int v9 = v5 - 1;
          *(void *)(v8 + v6) = *(void *)(v8 + 8 * v9);
          *(void *)(v8 + 8 * v9) = a2;
          LODWORD(v5) = *(_DWORD *)(a1 + 112) - 1;
          *(_DWORD *)(a1 + 112) = v5;
        }
        v6 += 8;
      }
      while (v7 != v6);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (uint64_t)unblockObservers
{
  if (result) {
    *(unsigned char *)(result + 120) = 1;
  }
  return result;
}

- (BOOL)flipsRightToLeft
{
  return RB::Symbol::Animator::flips_rtl(&self->_animator._lock._lock);
}

- ($4C453035CF9D444C7FDAB91FAAAE42FC)transform
{
  double v2 = RB::Symbol::Animator::transform(&self->_animator._lock._lock);
  double v3 = *((float *)&v2 + 1);
  double v5 = v4;
  double v7 = v6;
  double v8 = *(float *)&v2;
  double v9 = v3;
  result.var1.dCGFloat y = v7;
  result.var1.dx = v5;
  result.var0.dCGFloat y = v9;
  result.var0.dx = v8;
  return result;
}

- (void)setTransform:(id)a3
{
  dCGFloat y = a3.var0.dy;
  CGFloat v5 = a3.var1.dy;
  *(float32x2_t *)var20._terms._p = vcvt_f32_f64((float64x2_t)a3.var0);
  *(float32x2_t *)&var20._terms._p[8] = vcvt_f32_f64((float64x2_t)a3.var1);
  if (RB::Symbol::Animator::set_transform(&self->_animator._lock._lock, &var20)) {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorForStyle:(unsigned int)a3
{
  float v3 = RB::Symbol::Animator::color((uint64_t)&self->_animator, a3);
  result.var3 = v6;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)setColor:(id)a3 forStyle:(unsigned int)a4
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 v5 = a3;
  if (RB::Symbol::Animator::set_color((uint64_t)&self->_animator, a4, (float32x4_t *)&v5)) {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)opacities
{
  float v4 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 0, v2);
  float v5 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 1uLL, v4);
  float v6 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 2uLL, v5);
  float v7 = RB::Symbol::Model::alpha((RB::Symbol::Model *)self->_animator._model._p, 3uLL, v6);
  float v8 = v4;
  float v9 = v5;
  float v10 = v6;
  result.var3 = v7;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)setOpacities:(id)a3
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 v4 = a3;
  if (RB::Symbol::Animator::set_alpha(&self->_animator._lock._lock, &v4.var0, 4uLL)) {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (BOOL)isHidden
{
  return RB::Symbol::Animator::hidden(&self->_animator._lock._lock);
}

- (void)setHidden:(BOOL)a3
{
  if (RB::Symbol::Animator::set_hidden(&self->_animator._lock._lock, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (int)scaleLevel
{
  int v2 = RB::Symbol::Animator::scale_level(&self->_animator._lock._lock);
  if (v2) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  if (v2 >= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)setScaleLevel:(int)a3
{
  if (RB::Symbol::Animator::set_scale_level(&self->_animator._lock._lock, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (unsigned)depth
{
  int v2 = [(RBSymbolAnimator *)self scaleLevel];
  if (v2 == -1) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (void)setDepth:(unsigned int)a3
{
  if (a3 == 2) {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  [(RBSymbolAnimator *)self setScaleLevel:v3];
}

- (CGPoint)anchorPoint
{
  float64x2_t v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::anchor_point(&self->_animator._lock._lock)));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (CGPoint)position
{
  float64x2_t v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::position(&self->_animator._lock._lock)));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (CGSize)size
{
  float64x2_t v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::size(&self->_animator._lock._lock)));
  double v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.CGFloat height = v3;
  return result;
}

- (CGPoint)presentationPosition
{
  float64x2_t v2 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(RB::Symbol::Animator::presentation_position(&self->_animator._lock._lock)));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (unsigned)addAnimation:(unsigned int)a3 options:(id)a4
{
  unsigned int v66 = 0;
  float32x2_t v65 = (float32x2_t)a3;
  long long v67 = xmmword_21421C120;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  unint64_t v68 = 0;
  if (a4)
  {
    float v7 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationPriority];
    if (v7)
    {
      [v7 floatValue];
      LODWORD(v67) = v8;
    }
    float v9 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationSpeed];
    if (v9)
    {
      [v9 floatValue];
      float v11 = v10;
      *((float *)&v67 + 1) = v10;
      v12 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationClampsSpeed];
      if (!v12 || [v12 BOOLValue])
      {
        float v13 = 0.5;
        if (v11 >= 0.5) {
          float v13 = v11;
        }
        if (v13 > 2.0) {
          float v13 = 2.0;
        }
        *((float *)&v67 + 1) = v13;
      }
    }
    float32x2_t v14 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationRepeatCount];
    if (v14)
    {
      [v14 floatValue];
      DWORD2(v67) = v15;
    }
    v16 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationRepeatDelay];
    if (v16)
    {
      [v16 floatValue];
      HIDWORD(v67) = v17;
    }
    v18 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationByLayer];
    if (v18)
    {
      int v19 = 16;
      if ([v18 BOOLValue]) {
        __int32 v20 = 16;
      }
      else {
        __int32 v20 = 0;
      }
      v65.i32[1] = v20;
      unsigned int v66 = 16;
    }
    else
    {
      int v19 = 0;
      __int32 v20 = 0;
    }
    uint64_t v69 = [a4 objectForKeyedSubscript:RBSymbolAnimationTiming];
    uint64_t v21 = [a4 objectForKeyedSubscript:RBSymbolAnimationOnCompletion];
    if (v21) {
      uint64_t v70 = v21;
    }
    switch(a3)
    {
      case 1u:
        v26 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationVariableColorOptions];
        if (v26)
        {
          unsigned int v27 = [v26 unsignedIntValue];
          v20 |= (v27 << 27) & 0x40000000 | (v27 << 31) | (((v27 >> 1) & 1) << 29);
          if ((v27 & 0xB) != 0) {
            v65.i32[1] = v20;
          }
          v19 |= 0xE0000000;
          unsigned int v66 = v19;
        }
        v28 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationSymbolDefaults];
        if (v28
          || (v53 = [(RBSymbolAnimator *)self glyph]) != 0
          && (v54 = v53, (objc_opt_respondsToSelector() & 1) != 0)
          && (v28 = (void *)[(CUINamedVectorGlyph *)v54 symbolDefaults]) != 0)
        {
          v29 = (void *)[v28 objectForKeyedSubscript:@"variableColorContinuous"];
          if (v29)
          {
            if ([v29 BOOLValue]) {
              v65.i32[1] = v20 | 0x10000000;
            }
            unsigned int v30 = v19 | 0x10000000;
            goto LABEL_131;
          }
        }
        break;
      case 2u:
        v31 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationPulseOptions];
        if (v31)
        {
          int v32 = [v31 unsignedIntValue] & 0xF;
          if (v32 == 2) {
            goto LABEL_57;
          }
          if (v32 == 1) {
            goto LABEL_81;
          }
        }
        break;
      case 3u:
        v33 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationBounceOptions];
        if (!v33) {
          break;
        }
        char v34 = [v33 unsignedIntValue];
        if ((v34 & 0xF) == 1) {
          goto LABEL_48;
        }
        if ((v34 & 0xF) == 2)
        {
          v20 |= 0x80000000;
          v65.i32[1] = v20;
LABEL_48:
          unsigned int v66 = v19 | 0x80000000;
        }
        if ((v34 & 0x10) != 0) {
          v65.i32[1] = v20 | 0x20;
        }
        break;
      case 4u:
      case 8u:
        v65.i32[0] = 4;
        break;
      case 5u:
      case 9u:
        unint64_t v22 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationAppearDisappearOptions];
        if (!v22) {
          break;
        }
        char v23 = [v22 unsignedIntValue];
        int v24 = v23 & 0xF;
        switch(v24)
        {
          case 1:
            goto LABEL_88;
          case 2:
            unsigned int v25 = 0x40000000;
            break;
          case 3:
            unsigned int v25 = 0x80000000;
            break;
          default:
            unsigned int v30 = 16;
            if ((v23 & 0x10) != 0) {
              goto LABEL_131;
            }
            goto LABEL_132;
        }
        v65.i32[1] = v20 | v25;
LABEL_88:
        unsigned int v66 = v19 | 0xC0000000;
        unsigned int v30 = -1073741808;
        if ((v23 & 0x10) != 0) {
          goto LABEL_131;
        }
        break;
      case 6u:
        v35 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationReplaceOptions];
        if (!v35) {
          break;
        }
        char v36 = [v35 unsignedIntValue];
        unsigned int v37 = 0x40000000;
        switch(v36 & 0xF)
        {
          case 1:
            goto LABEL_97;
          case 2:
            goto LABEL_96;
          case 3:
            unsigned int v37 = 0x80000000;
            goto LABEL_96;
          case 4:
            unsigned int v37 = -1073741824;
LABEL_96:
            v20 |= v37;
            v65.i32[1] = v20;
LABEL_97:
            v19 |= 0xC0000000;
            unsigned int v66 = v19;
            break;
          default:
            break;
        }
        if ((v36 & 0x10) != 0)
        {
          v19 |= 0x10u;
          unsigned int v66 = v19;
          if ((v36 & 0x20) == 0)
          {
LABEL_100:
            if ((v36 & 0x40) == 0) {
              break;
            }
LABEL_104:
            unsigned int v51 = v20 & 0xEFFFFFFF;
            unsigned int v52 = v19 | 0x10000000;
            goto LABEL_105;
          }
        }
        else if ((v36 & 0x20) == 0)
        {
          goto LABEL_100;
        }
        v20 &= ~0x20000000u;
        v19 |= 0x20000000u;
        v65.i32[1] = v20;
        unsigned int v66 = v19;
        if ((v36 & 0x40) == 0) {
          break;
        }
        goto LABEL_104;
      case 7u:
        v38 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationInterpolateOptions];
        if (!v38) {
          break;
        }
        if ([v38 unsignedIntValue]) {
          goto LABEL_56;
        }
        goto LABEL_57;
      case 0xAu:
        v39 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationWiggleAngle];
        if (v39)
        {
          [v39 floatValue];
          __float2 v41 = __sincosf_stret(v40);
          unint64_t v68 = __PAIR64__(LODWORD(v41.__sinval), LODWORD(v41.__cosval));
          v19 |= 0x80000000;
          unsigned int v66 = v19;
        }
        v42 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationWiggleOptions];
        if (!v42) {
          goto LABEL_117;
        }
        __int16 v43 = [v42 unsignedIntValue];
        int v44 = v43 & 0xF;
        if ((v43 & 0xF) == 0 || v19 < 0) {
          goto LABEL_111;
        }
        if (v44 == 3)
        {
          v20 |= 0x80000000;
          v65.i32[1] = v20;
        }
        else
        {
          if (v44 == 2)
          {
            uint64_t v45 = 0x3F80000000000000;
          }
          else
          {
            if (v44 != 1) {
              goto LABEL_111;
            }
            uint64_t v45 = 1065353216;
          }
          unint64_t v68 = v45;
        }
        v19 |= 0x80000000;
        unsigned int v66 = v19;
LABEL_111:
        if ((v43 & 0xF0) == 0x10) {
          goto LABEL_114;
        }
        if ((v43 & 0xF0) == 0x20)
        {
          v20 |= 0x40000000u;
          v65.i32[1] = v20;
LABEL_114:
          v19 |= 0x40000000u;
          unsigned int v66 = v19;
        }
        if ((v43 & 0x100) != 0)
        {
          v20 |= 0x20u;
          v65.i32[1] = v20;
        }
LABEL_117:
        if (v19 < 0) {
          break;
        }
        v56 = (CUINamedVectorGlyph *)[a4 objectForKeyedSubscript:RBSymbolAnimationSymbolDefaults];
        if (!v56)
        {
          v56 = [(RBSymbolAnimator *)self glyph];
          if (v56)
          {
            if (objc_opt_respondsToSelector()) {
              v56 = (CUINamedVectorGlyph *)[(CUINamedVectorGlyph *)v56 symbolDefaults];
            }
            else {
              v56 = 0;
            }
          }
        }
        v57 = (void *)[(CUINamedVectorGlyph *)v56 objectForKeyedSubscript:@"wiggleStyle"];
        if (!v57) {
          break;
        }
        int v58 = [v57 unsignedIntValue];
        if ((v58 - 1) >= 2)
        {
          if (v58 != 3) {
            break;
          }
          v60 = (void *)[(CUINamedVectorGlyph *)v56 objectForKeyedSubscript:@"wiggleAngle"];
          if (!v60) {
            break;
          }
          [v60 doubleValue];
          *(float *)&double v61 = v61 * 0.0174532925;
          __float2 v62 = __sincosf_stret(*(float *)&v61);
          unint64_t v68 = __PAIR64__(LODWORD(v62.__sinval), LODWORD(v62.__cosval));
          unsigned int v59 = v19 | 0x80000000;
          unsigned int v66 = v19 | 0x80000000;
          if ((v19 & 0x40000000) != 0) {
            break;
          }
        }
        else
        {
          unsigned int v59 = v19 | 0x80000000;
          v65.i32[1] = v20 | 0x80000000;
          unsigned int v66 = v19 | 0x80000000;
          if ((v19 & 0x40000000) != 0) {
            break;
          }
          if (v58 != 1) {
            v65.i32[1] = v20 | 0xC0000000;
          }
        }
        unsigned int v30 = v59 | 0x40000000;
LABEL_131:
        unsigned int v66 = v30;
        break;
      case 0xBu:
        v46 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationRotateOptions];
        if (!v46) {
          goto LABEL_75;
        }
        char v47 = [v46 unsignedIntValue];
        if ((v47 & 0xF) == 1) {
          goto LABEL_71;
        }
        if ((v47 & 0xF) == 2)
        {
          v20 |= 0x80000000;
          v65.i32[1] = v20;
LABEL_71:
          v19 |= 0x80000000;
          unsigned int v66 = v19;
        }
        if ((v47 & 0x10) != 0)
        {
          v20 |= 0x20u;
          v65.i32[1] = v20;
        }
        if (v19 < 0) {
          break;
        }
LABEL_75:
        v48 = (CUINamedVectorGlyph *)[a4 objectForKeyedSubscript:RBSymbolAnimationSymbolDefaults];
        if (!v48)
        {
          v48 = [(RBSymbolAnimator *)self glyph];
          if (v48)
          {
            v55 = v48;
            if (objc_opt_respondsToSelector()) {
              v48 = (CUINamedVectorGlyph *)[(CUINamedVectorGlyph *)v55 symbolDefaults];
            }
            else {
              v48 = 0;
            }
          }
        }
        v49 = (void *)[(CUINamedVectorGlyph *)v48 objectForKeyedSubscript:@"rotatesClockwise"];
        if (!v49) {
          break;
        }
        if (([v49 BOOLValue] & 1) == 0) {
LABEL_56:
        }
          v65.i32[1] = v20 | 0x80000000;
LABEL_57:
        unsigned int v30 = v19 | 0x80000000;
        goto LABEL_131;
      case 0xCu:
        v50 = (void *)[a4 objectForKeyedSubscript:RBSymbolAnimationBreatheOptions];
        if (v50 && ([v50 unsignedIntValue] & 1) != 0)
        {
LABEL_81:
          unsigned int v51 = v20 | 0x80000000;
          unsigned int v52 = v19 | 0x80000000;
LABEL_105:
          v65.i32[1] = v51;
          unsigned int v66 = v52;
        }
        break;
      default:
        break;
    }
  }
LABEL_132:
  unsigned int v63 = RB::Symbol::Animator::add_animation((uint64_t)&self->_animator, &v65);
  if (v63) {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
  return v63;
}

- (void)cancelAnimationWithID:(unsigned int)a3
{
  if (a3 && RB::Symbol::Animator::cancel_animation_by_id(&self->_animator._lock._lock, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)cancelAnimation:(unsigned int)a3
{
  if (RB::Symbol::Animator::cancel_animations_by_mask(&self->_animator._lock._lock, 1 << a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)cancelAllAnimations
{
  if (RB::Symbol::Animator::cancel_animations_by_mask(&self->_animator._lock._lock, 0xFFFFFFFF))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)removeAnimationWithID:(unsigned int)a3
{
  if (a3 && RB::Symbol::Animator::remove_animation_by_id(&self->_animator._lock._lock, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)removeAnimation:(unsigned int)a3
{
  if (RB::Symbol::Animator::remove_animations_by_mask(&self->_animator._lock._lock, 1 << a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)removeAllAnimations
{
  if (RB::Symbol::Animator::remove_all_animations(&self->_animator._lock._lock))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setPriority:(float)a3 ofAnimationWithID:(unsigned int)a4
{
  if (RB::Symbol::Animator::set_priority_by_id(&self->_animator._lock._lock, a4, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (void)setCurrentTime:(double)a3
{
  if (RB::Symbol::Animator::set_current_time(&self->_animator._lock._lock, a3))
  {
    -[RBSymbolAnimator notifyObservers]((uint64_t)self);
  }
}

- (double)currentTime
{
  return self->_animator._current_time;
}

- (double)maxVelocity
{
  return *(float *)&self->_anon_38[16];
}

- (CGRect)unroundedAlignmentRect
{
  float64x2_t v2 = (float32x2_t *)RB::Symbol::Model::glyph_info((RB::Symbol::Model *)self->_animator._model._p);
  v3.i32[0] = 0;
  float32x2_t v4 = v2[8];
  uint32x2_t v5 = (uint32x2_t)vcgtz_f32(v4);
  *(uint32x2_t *)v6.i8 = vpmin_u32(v5, v5);
  int8x16_t v7 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v3, v6), 0);
  int8x16_t v8 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v4), *(int8x16_t *)(MEMORY[0x263F001A0] + 16));
  int8x16_t v9 = vbslq_s8(v7, (int8x16_t)vcvtq_f64_f32(v2[7]), *MEMORY[0x263F001A0]);
  double v10 = *(double *)&v9.i64[1];
  double v11 = *(double *)&v8.i64[1];
  result.size.width = *(double *)v8.i64;
  result.origin.x = *(double *)v9.i64;
  result.size.CGFloat height = v11;
  result.origin.CGFloat y = v10;
  return result;
}

- (CGRect)boundingRect
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2.n128_u64[0] = (unint64_t)vdup_n_s32(0x437F0000u);
  RB::Symbol::Presentation::Presentation(v20, &self->_animator, 0, 0, 255, 0, v2);
  double v7 = RB::Symbol::Presentation::bounding_rect((RB::Symbol::Presentation *)v20, v3, v4, v5, v6);
  float32x2_t v9 = v8;
  int8x16_t v18 = *(int8x16_t *)(MEMORY[0x263F001A0] + 16);
  int8x16_t v19 = *(int8x16_t *)MEMORY[0x263F001A0];
  RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)v20);
  v10.i32[0] = 0;
  uint32x2_t v11 = (uint32x2_t)vcgtz_f32(v9);
  *(uint32x2_t *)v12.i8 = vpmin_u32(v11, v11);
  int8x16_t v13 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v10, v12), 0);
  int8x16_t v14 = vbslq_s8(v13, (int8x16_t)vcvtq_f64_f32(v9), v18);
  int8x16_t v15 = vbslq_s8(v13, (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&v7), v19);
  double v16 = *(double *)&v15.i64[1];
  double v17 = *(double *)&v14.i64[1];
  result.size.width = *(double *)v14.i64;
  result.origin.x = *(double *)v15.i64;
  result.size.CGFloat height = v17;
  result.origin.CGFloat y = v16;
  return result;
}

- (_RBSymbolUpdate)beginUpdateWithRenderingMode:(unsigned int)a3
{
  return [(RBSymbolAnimator *)self beginUpdateWithRenderingMode:*(void *)&a3 position:0 size:0 flags:0];
}

- (id)copyDebugDescriptionForUpdate:(_RBSymbolUpdate *)a3
{
  *(_OWORD *)&v10[9] = 0u;
  if (self) {
    p_animator = &self->_animator;
  }
  else {
    p_animator = 0;
  }
  *(_OWORD *)__p = 0uLL;
  *(_OWORD *)int32x4_t v10 = 0uLL;
  RB::Symbol::Presentation::print((RB::Symbol::Presentation *)a3, (std::string *)__p, &p_animator->_lock._lock, 0);
  id v5 = [NSString alloc];
  if (v10[7] >= 0) {
    int32x4_t v6 = __p;
  }
  else {
    int32x4_t v6 = (void **)__p[0];
  }
  double v7 = (void *)[v5 initWithUTF8String:v6];
  if ((v10[7] & 0x80000000) != 0) {
    operator delete(__p[0]);
  }
  return v7;
}

- (uint64_t)notifyObservers
{
  __n128 v2 = (char *)*((void *)a1 + 8);
  uint64_t v3 = *((void *)a1 + 9);
  if (v2) {
    double v4 = v2;
  }
  else {
    double v4 = a1;
  }
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v5 = 16 * v3;
  int32x4_t v6 = (void **)(v4 + 8);
  do
  {
    double v7 = *v6;
    v6 += 2;
    uint64_t result = [v7 symbolAnimatorDidChange:v7];
    v5 -= 16;
  }
  while (v5);
  if (a1)
  {
    __n128 v2 = (char *)*((void *)a1 + 8);
    if (v2) {
      float32x2_t v9 = (char *)*((void *)a1 + 8);
    }
    else {
      float32x2_t v9 = a1;
    }
    if (*((void *)a1 + 9))
    {
      unint64_t v10 = 0;
      uint32x2_t v11 = (id *)(v9 + 8);
      do
      {

        ++v10;
        v11 += 2;
      }
      while (v10 < *((void *)a1 + 9));
      __n128 v2 = (char *)*((void *)a1 + 8);
    }
LABEL_15:
    if (v2) {
      free(v2);
    }
    JUMPOUT(0x21669AC10);
  }
  return result;
}

@end