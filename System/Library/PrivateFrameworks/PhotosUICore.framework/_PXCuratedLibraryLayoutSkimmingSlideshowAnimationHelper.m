@interface _PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper
- (BOOL)_shoulAnimateSpriteWithInfo:(id *)a3 matchingSectionIndexPath:(PXSimpleIndexPath *)a4 spriteKind:(unsigned __int8 *)a5;
- (BOOL)wantsDoubleSidedAnimations;
- (_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper)initWithLayout:(id)a3;
- (double)animationDuration;
- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8;
- (int64_t)animationCurve;
- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)setUserData:(id)a3;
@end

@implementation _PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper

- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7
{
  uint64_t length = a6.length;
  v8 = &OBJC_IVAR____PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper__fromIndexPath;
  if (a7)
  {
    v8 = &OBJC_IVAR____PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper__toIndexPath;
    int v9 = 1;
  }
  else
  {
    int v9 = -1;
  }
  if (a7) {
    int v10 = -1;
  }
  else {
    int v10 = 1;
  }
  v11 = (long long *)((char *)self + *v8);
  long long v12 = v11[1];
  long long v25 = *v11;
  long long v26 = v12;
  if (self->_userInterfaceDirection) {
    int v13 = v9;
  }
  else {
    int v13 = v10;
  }
  if (a6.length)
  {
    double v16 = (double)v13;
    if (a7) {
      float v17 = -0.2;
    }
    else {
      float v17 = 1.0;
    }
    if (a7) {
      double v18 = -0.1;
    }
    else {
      double v18 = 0.1;
    }
    p_var2 = &a3->var0.var2;
    p_var1 = &a4->var1.var0.var0.var1;
    do
    {
      char v24 = 0;
      v23[0] = v25;
      v23[1] = v26;
      if ([(_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper *)self _shoulAnimateSpriteWithInfo:a5 matchingSectionIndexPath:v23 spriteKind:&v24])
      {
        if (v24 == 1)
        {
          v27.origin.x = *(p_var1 - 1);
          v27.origin.CGFloat y = *p_var1;
          v27.size.width = p_var1[1];
          v27.size.CGFloat height = p_var1[2];
          CGRect v28 = CGRectOffset(v27, v16 * v27.size.width * 0.1, 0.0);
          CGFloat height = v28.size.height;
          CGFloat y = v28.origin.y;
          *(float32x4_t *)(p_var1 - 1) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v28.origin), (float64x2_t)v28.size);
          *(p_var1 - 2) = v17;
          double *p_var2 = v18 + *p_var2;
        }
        else if (v24 == 3)
        {
          *(p_var1 - 2) = -1.0;
        }
      }
      p_var2 += 4;
      a5 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)a5 + 40);
      p_var1 += 40;
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  int v10 = (objc_class *)MEMORY[0x1E4F28E60];
  id v11 = a4;
  id v12 = objc_alloc_init(v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __170___PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke;
  v17[3] = &unk_1E5DCA2F0;
  v17[4] = self;
  v19 = a8;
  id v13 = v12;
  id v18 = v13;
  [v11 enumerateIndexesUsingBlock:v17];

  v14 = v18;
  id v15 = v13;

  return v15;
}

- (BOOL)_shoulAnimateSpriteWithInfo:(id *)a3 matchingSectionIndexPath:(PXSimpleIndexPath *)a4 spriteKind:(unsigned __int8 *)a5
{
}

- (double)animationDuration
{
  return 0.666666667;
}

- (int64_t)animationCurve
{
  return 2;
}

- (BOOL)wantsDoubleSidedAnimations
{
  return 1;
}

- (void)setUserData:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper;
  [(PXCuratedLibraryLayoutAnimationHelper *)&v16 setUserData:a3];
  v5 = [(PXCuratedLibraryLayoutAnimationHelper *)self userData];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v10 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayoutAnimationHelper.m", 194, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.userData", v12, v13 object file lineNumber description];
    }
  }
  v6 = [v5 objectForKeyedSubscript:@"PXCuratedLibrarySkimmingSlideshowFromSectionKey"];
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "px_simpleIndexPathValue");
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  *(_OWORD *)&self->_fromIndexPath.dataSourceIdentifier = v14;
  *(_OWORD *)&self->_fromIndexPath.item = v15;

  v8 = [v5 objectForKeyedSubscript:@"PXCuratedLibrarySkimmingSlideshowToSectionKey"];
  int v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "px_simpleIndexPathValue");
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  *(_OWORD *)&self->_toIndexPath.dataSourceIdentifier = v14;
  *(_OWORD *)&self->_toIndexPath.item = v15;
}

- (_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper)initWithLayout:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper;
  v5 = [(PXCuratedLibraryLayoutAnimationHelper *)&v7 initWithLayout:v4];
  if (v5) {
    v5->_userInterfaceDirection = [v4 userInterfaceDirection];
  }

  return v5;
}

@end