@interface PXPhotosLayoutAnimationHelper
- (BOOL)wantsAnimationWithSpriteTransfer;
- (BOOL)wantsDoubleSidedAnimations;
- (BOOL)wantsFromSnapshot;
- (BOOL)wantsPresentationAdjustment;
- (BOOL)wantsToSnapshot;
- (PXPhotosLayoutAnimationContext)context;
- (PXPhotosLayoutAnimationHelper)init;
- (PXPhotosLayoutAnimationHelper)initWithContext:(id)a3;
- (double)animationDuration;
- (int64_t)animationCurve;
- (unsigned)highFrameRateReason;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
@end

@implementation PXPhotosLayoutAnimationHelper

- (void).cxx_destruct
{
}

- (BOOL)wantsToSnapshot
{
  return self->_wantsToSnapshot;
}

- (BOOL)wantsFromSnapshot
{
  return self->_wantsFromSnapshot;
}

- (PXPhotosLayoutAnimationContext)context
{
  return self->_context;
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

- (BOOL)wantsAnimationWithSpriteTransfer
{
  return 0;
}

- (BOOL)wantsPresentationAdjustment
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

- (PXPhotosLayoutAnimationHelper)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosLayoutAnimationHelper.m", 25, @"%s is not available as initializer", "-[PXPhotosLayoutAnimationHelper init]");

  abort();
}

- (PXPhotosLayoutAnimationHelper)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosLayoutAnimationHelper;
  v5 = [(PXPhotosLayoutAnimationHelper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (PXPhotosLayoutAnimationContext *)v6;
  }
  return v5;
}

@end