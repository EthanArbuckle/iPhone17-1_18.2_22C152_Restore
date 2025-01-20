@interface PXCuratedLibraryLayoutAnimationHelper
+ (id)createAnimationIfNeededForLayout:(id)a3 context:(int64_t)a4 userData:(id)a5;
+ (id)createTransitionIfNeededForLayout:(id)a3 context:(int64_t)a4;
- (BOOL)wantsAnimationWithSpriteTransfer;
- (BOOL)wantsDoubleSidedAnimations;
- (BOOL)wantsPresentationAdjustment;
- (NSDictionary)userData;
- (PXCuratedLibraryLayout)layout;
- (PXCuratedLibraryLayoutAnimationHelper)init;
- (PXCuratedLibraryLayoutAnimationHelper)initWithLayout:(id)a3;
- (double)animationDuration;
- (int64_t)animationCurve;
- (unsigned)highFrameRateReason;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)setUserData:(id)a3;
@end

@implementation PXCuratedLibraryLayoutAnimationHelper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (BOOL)wantsAnimationWithSpriteTransfer
{
  return self->_wantsAnimationWithSpriteTransfer;
}

- (BOOL)wantsPresentationAdjustment
{
  return self->_wantsPresentationAdjustment;
}

- (PXCuratedLibraryLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXCuratedLibraryLayout *)WeakRetained;
}

- (void)setUserData:(id)a3
{
}

- (NSDictionary)userData
{
  return self->_userData;
}

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

- (BOOL)wantsDoubleSidedAnimations
{
  return 0;
}

- (unsigned)highFrameRateReason
{
  return 0;
}

- (double)animationDuration
{
  v2 = +[PXPhotosGridSettings sharedInstance];
  [v2 defaultAnimationDuration];
  double v4 = v3;

  return v4;
}

- (int64_t)animationCurve
{
  return 2;
}

- (PXCuratedLibraryLayoutAnimationHelper)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayoutAnimationHelper;
  v5 = [(PXCuratedLibraryLayoutAnimationHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_layout, v4);
  }

  return v6;
}

- (PXCuratedLibraryLayoutAnimationHelper)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryLayoutAnimationHelper.m", 128, @"%s is not available as initializer", "-[PXCuratedLibraryLayoutAnimationHelper init]");

  abort();
}

+ (id)createTransitionIfNeededForLayout:(id)a3 context:(int64_t)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() createAnimationIfNeededForLayout:v5 context:a4 userData:0];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    objc_super v8 = [v5 createTransitionWithAnimations:v7];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

+ (id)createAnimationIfNeededForLayout:(id)a3 context:(int64_t)a4 userData:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [v9 pendingAnimations];
  v12 = [v11 lastObject];

  if (PXCuratedLibraryAnimationGetContext(v12) >= a4)
  {
    v13 = 0;
  }
  else
  {
    switch(a4)
    {
      case 0:
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:a1 file:@"PXCuratedLibraryLayoutAnimationHelper.m" lineNumber:80 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        v14 = (objc_class *)objc_opt_class();
        break;
      default:
        v14 = 0;
        break;
    }
    v15 = (void *)[[v14 alloc] initWithLayout:v9];
    [v15 setUserData:v10];
    if (v12)
    {
      id v16 = v12;
    }
    else
    {
      id v16 = [v9 createAnimation];
    }
    v13 = v16;
    objc_msgSend(v16, "setCurve:", objc_msgSend(v15, "animationCurve"));
    [v15 animationDuration];
    objc_msgSend(v13, "setDuration:");
    objc_msgSend(v13, "setDoubleSided:", objc_msgSend(v15, "wantsDoubleSidedAnimations"));
    objc_msgSend(v13, "setSupportsPresentationAdjustment:", objc_msgSend(v15, "wantsPresentationAdjustment"));
    objc_msgSend(v13, "setSupportsSpriteTransfer:", objc_msgSend(v15, "wantsAnimationWithSpriteTransfer"));
    objc_msgSend(v13, "setHighFrameRateReason:", objc_msgSend(v15, "highFrameRateReason"));
    [v13 setDelegate:v15];
    [v13 setUserData:v10];
    _PXCuratedLibraryAnimationSetContext(v13, a4);
  }
  return v13;
}

@end