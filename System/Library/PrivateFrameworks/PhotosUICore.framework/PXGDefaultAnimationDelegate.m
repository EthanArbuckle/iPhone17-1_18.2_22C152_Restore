@interface PXGDefaultAnimationDelegate
+ (PXGDefaultAnimationDelegate)sharedInstance;
+ (void)adjustGeometry:(id *)a3 style:(id *)a4 info:(id *)a5 forTextSpriteAnimatingFromAttributes:(id *)a6 toAttributes:(id *)a7 inRootLayout:(id)a8;
- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
@end

@implementation PXGDefaultAnimationDelegate

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length = a7.length;
  if (a7.length)
  {
    do
    {
      a5->var0 = 0.0;
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length = a7.length;
  if (a7.length)
  {
    do
    {
      a5->var0 = 0.0;
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      --length;
    }
    while (length);
  }
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  return a4;
}

+ (void)adjustGeometry:(id *)a3 style:(id *)a4 info:(id *)a5 forTextSpriteAnimatingFromAttributes:(id *)a6 toAttributes:(id *)a7 inRootLayout:(id)a8
{
  id v10 = a8;
  double x = a6->var3.x;
  double y = a6->var3.y;
  double v14 = a7->var3.x;
  CGFloat v13 = a7->var3.y;
  double var2 = a7->var2;
  double v16 = a6->var2;
  if ([v10 userInterfaceDirection] == 1)
  {
    [v10 referenceSize];
    double x = v17 - x;
    double v14 = v17 - v14;
  }
  double v18 = fabs(var2 / v16);
  BOOL v19 = v18 < INFINITY;
  BOOL v20 = v18 <= INFINITY;
  double v21 = 1.0;
  if (v19) {
    double v21 = var2 / v16;
  }
  memset(&v25.c, 0, 32);
  if (v20) {
    double v22 = v21;
  }
  else {
    double v22 = var2 / v16;
  }
  *(_OWORD *)&v25.a = 0uLL;
  CGAffineTransformMakeTranslation(&v25, v14, v13);
  CGAffineTransform v23 = v25;
  CGAffineTransformScale(&v24, &v23, v22, v22);
  CGAffineTransform v25 = v24;
  CGAffineTransform v23 = v24;
  CGAffineTransformTranslate(&v24, &v23, -x, -y);
  CGAffineTransform v25 = v24;
  PXRectWithCenterAndSize();
}

+ (PXGDefaultAnimationDelegate)sharedInstance
{
  if (sharedInstance_onceToken_72812 != -1) {
    dispatch_once(&sharedInstance_onceToken_72812, &__block_literal_global_72813);
  }
  v2 = (void *)sharedInstance_sharedInstance_72814;
  return (PXGDefaultAnimationDelegate *)v2;
}

void __45__PXGDefaultAnimationDelegate_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXGDefaultAnimationDelegate);
  v1 = (void *)sharedInstance_sharedInstance_72814;
  sharedInstance_sharedInstance_72814 = (uint64_t)v0;
}

@end