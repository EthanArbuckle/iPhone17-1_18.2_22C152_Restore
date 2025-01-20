@interface PXStoryRelatedAnimationDelegate
- (PXStoryRelatedAnimationDelegate)init;
- (PXStoryRelatedAnimationDelegate)initWithSelectedRelatedLayout:(id)a3;
- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5;
@end

@implementation PXStoryRelatedAnimationDelegate

- (void).cxx_destruct
{
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length = a7.length;
  id v22 = a3;
  if (length)
  {
    v12 = a6 + 1;
    p_var2 = &a4->var0.var2;
    do
    {
      uint64_t v15 = *(void *)&v12->var0;
      v12 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v12 + 40);
      int v14 = v15;
      if ((v15 & 0x20000) != 0)
      {
        a5->var0 = -a5->var0;
      }
      else
      {
        if ((v14 & 0x10000) == 0)
        {
          float32x2_t v16 = (float32x2_t)p_var2[1];
          float32x2_t v17 = vmul_f32(v16, (float32x2_t)0x3F0000003F000000);
          CGFloat v18 = *(p_var2 - 2) - v17.f32[0];
          CGFloat v19 = *(p_var2 - 1) - v17.f32[1];
          CGFloat v20 = v16.f32[0];
          CGFloat v21 = v16.f32[1];
          CGRect v24 = CGRectInset(self->_selectedRelatedInitialRect, -self->_tolerance, -self->_tolerance);
          v25.origin.x = v18;
          v25.origin.y = v19;
          v25.size.width = v20;
          v25.size.height = v21;
          if (CGRectContainsRect(v24, v25)) {
            PXRectNormalize();
          }
        }
        double *p_var2 = *p_var2 + 2.0;
      }
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      p_var2 += 4;
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length = a7.length;
  id v21 = a3;
  if (length)
  {
    v12 = a6 + 1;
    p_var2 = &a4->var0.var2;
    do
    {
      if ((*(&v12->var1 + 1) & 3) != 0)
      {
        float v14 = a5->var0 * -9999.00025;
        a5->var0 = v14;
      }
      else
      {
        float32x2_t v15 = (float32x2_t)p_var2[1];
        float32x2_t v16 = vmul_f32(v15, (float32x2_t)0x3F0000003F000000);
        CGFloat v17 = *(p_var2 - 2) - v16.f32[0];
        CGFloat v18 = *(p_var2 - 1) - v16.f32[1];
        CGFloat v19 = v15.f32[0];
        CGFloat v20 = v15.f32[1];
        CGRect v23 = CGRectInset(self->_selectedRelatedFinalRect, -self->_tolerance, -self->_tolerance);
        v24.origin.x = v17;
        v24.origin.y = v18;
        v24.size.width = v19;
        v24.size.height = v20;
        if (CGRectContainsRect(v23, v24)) {
          PXRectNormalize();
        }
      }
      v12 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v12 + 40);
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      p_var2 += 4;
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  p_rootLayout = &self->_rootLayout;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_rootLayout);

  if (WeakRetained != v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStoryRelatedAnimation.m", 103, @"Invalid parameter not satisfying: %@", @"rootLayout == _rootLayout" object file lineNumber description];
  }
  PXPointAdd();
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  id v10 = a4;
  id v11 = a5;
  if ([v10 count])
  {
    unsigned int v12 = [v10 firstIndex];
    unsigned int v13 = [v10 lastIndex];
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [v11 visibleRect];
    if (v12 <= v13)
    {
      do
      {
        uint64_t v15 = v12;
        uint64_t v16 = *((void *)&a8[1].var0 + 5 * v12);
        if ((v16 & 0x10000) != 0) {
          PXRectApproximatelyEqualToRect();
        }
        if ((v16 & 0x20000) != 0) {
          [v14 addIndex:v15];
        }
        unsigned int v12 = v15 + 1;
      }
      while ((int)v15 + 1 <= v13);
    }
    CGFloat v17 = (void *)[v14 copy];
  }
  else
  {
    CGFloat v17 = 0;
  }

  return v17;
}

- (PXStoryRelatedAnimationDelegate)initWithSelectedRelatedLayout:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXStoryRelatedAnimation.m", 52, @"Invalid parameter not satisfying: %@", @"selectedRelatedLayout != nil" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStoryRelatedAnimationDelegate;
  v6 = [(PXStoryRelatedAnimationDelegate *)&v10 init];
  if (v6)
  {
    v7 = [v5 rootLayout];
    objc_storeWeak((id *)&v6->_rootLayout, v7);

    objc_loadWeakRetained((id *)&v6->_rootLayout);
    [v5 contentSize];
    PXRectWithOriginAndSize();
  }

  return 0;
}

- (PXStoryRelatedAnimationDelegate)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRelatedAnimation.m", 48, @"%s is not available as initializer", "-[PXStoryRelatedAnimationDelegate init]");

  abort();
}

@end