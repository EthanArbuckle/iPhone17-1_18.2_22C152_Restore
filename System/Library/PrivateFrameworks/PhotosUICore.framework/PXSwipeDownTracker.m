@interface PXSwipeDownTracker
- (BOOL)shouldFinishDismissal;
- (CGAffineTransform)trackedTransform;
- (CGPoint)trackedCenter;
- (CGRect)trackedBounds;
- (PXChangeDirectionNumberFilter)verticalDirectionFilter;
- (PXDisplayVelocity)trackedVelocity;
- (PXInitialHysteresisNumberFilter)horizontalTranslationFilter;
- (PXSwipeDownTracker)init;
- (PXSwipeDownTracker)initWithOptions:(unint64_t)a3;
- (double)dismissalProgress;
- (double)finalAnimationDuration;
- (double)finalAnimationSpringDamping;
- (unint64_t)options;
- (void)setDismissalProgress:(double)a3;
- (void)setHorizontalTranslationFilter:(id)a3;
- (void)setShouldFinishDismissal:(BOOL)a3;
- (void)setTrackedBounds:(CGRect)a3;
- (void)setTrackedCenter:(CGPoint)a3;
- (void)setTrackedTransform:(CGAffineTransform *)a3;
- (void)setTrackedVelocity:(PXDisplayVelocity)a3;
- (void)setVerticalDirectionFilter:(id)a3;
- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6 velocity:(CGPoint)a7;
- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
@end

@implementation PXSwipeDownTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalTranslationFilter, 0);
  objc_storeStrong((id *)&self->_verticalDirectionFilter, 0);
}

- (void)setHorizontalTranslationFilter:(id)a3
{
}

- (PXInitialHysteresisNumberFilter)horizontalTranslationFilter
{
  return self->_horizontalTranslationFilter;
}

- (void)setVerticalDirectionFilter:(id)a3
{
}

- (PXChangeDirectionNumberFilter)verticalDirectionFilter
{
  return self->_verticalDirectionFilter;
}

- (double)finalAnimationSpringDamping
{
  return self->_finalAnimationSpringDamping;
}

- (double)finalAnimationDuration
{
  return self->_finalAnimationDuration;
}

- (void)setTrackedVelocity:(PXDisplayVelocity)a3
{
  self->_trackedVelocity = a3;
}

- (PXDisplayVelocity)trackedVelocity
{
  double x = self->_trackedVelocity.x;
  double y = self->_trackedVelocity.y;
  double scale = self->_trackedVelocity.scale;
  double rotation = self->_trackedVelocity.rotation;
  result.double rotation = rotation;
  result.double scale = scale;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTrackedTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trackedTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trackedTransform.tdouble x = v4;
  *(_OWORD *)&self->_trackedTransform.a = v3;
}

- (CGAffineTransform)trackedTransform
{
  long long v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].b;
  return self;
}

- (void)setTrackedBounds:(CGRect)a3
{
  self->_trackedBounds = a3;
}

- (CGRect)trackedBounds
{
  double x = self->_trackedBounds.origin.x;
  double y = self->_trackedBounds.origin.y;
  double width = self->_trackedBounds.size.width;
  double height = self->_trackedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTrackedCenter:(CGPoint)a3
{
  self->_trackedCenter = a3;
}

- (CGPoint)trackedCenter
{
  double x = self->_trackedCenter.x;
  double y = self->_trackedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShouldFinishDismissal:(BOOL)a3
{
  self->_shouldFinishDismissal = a3;
}

- (BOOL)shouldFinishDismissal
{
  return self->_shouldFinishDismissal;
}

- (void)setDismissalProgress:(double)a3
{
  self->_dismissalProgress = a3;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  char v7 = [(PXSwipeDownTracker *)self options] & 1;
  if (v7) {
    double v8 = 0.0;
  }
  else {
    double v8 = x;
  }
  v9 = +[PXSwipeDownSettings sharedInstance];
  v10 = [(PXSwipeDownTracker *)self verticalDirectionFilter];
  if (!v10)
  {
    v11 = objc_alloc_init(PXChangeDirectionNumberFilter);
    [(PXChangeDirectionNumberFilter *)v11 setMinimumChange:5.0];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke;
    v36[3] = &unk_1E5DB7220;
    v10 = v11;
    v37 = v10;
    [(PXNumberFilter *)v10 performChanges:v36];
    [(PXSwipeDownTracker *)self setVerticalDirectionFilter:v10];
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2;
  v35[3] = &__block_descriptor_48_e33_v16__0___PXMutableNumberFilter__8l;
  *(double *)&v35[4] = v8;
  *(double *)&v35[5] = y;
  [(PXNumberFilter *)v10 performChanges:v35];
  [v9 transitionDistance];
  double v13 = v12;
  [(PXNumberFilter *)v10 output];
  if (self->_didStartTracking)
  {
    v15 = [(PXSwipeDownTracker *)self horizontalTranslationFilter];
    if (!v15)
    {
      v15 = objc_alloc_init(PXInitialHysteresisNumberFilter);
      [v9 rotationHorizontalMotionHysteresisDistance];
      -[PXInitialHysteresisNumberFilter setHysteresis:](v15, "setHysteresis:");
      [(PXSwipeDownTracker *)self setHorizontalTranslationFilter:v15];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3;
    aBlock[3] = &unk_1E5DAF008;
    char v34 = v7;
    aBlock[4] = v9;
    aBlock[5] = self;
    *(double *)&aBlock[6] = v8;
    *(double *)&aBlock[7] = y;
    v16 = (void (**)(void *, long long *, uint64_t *, uint64_t *, double, double, double))_Block_copy(aBlock);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5;
    v32[3] = &__block_descriptor_48_e33_v16__0___PXMutableNumberFilter__8l;
    *(double *)&v32[4] = v8;
    *(double *)&v32[5] = y;
    [(PXNumberFilter *)v15 performChanges:v32];
    [(PXNumberFilter *)v15 output];
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3010000000;
    v30[3] = &unk_1AB5D584F;
    long long v31 = *MEMORY[0x1E4F1DAD8];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    uint64_t v29 = 0x3FF0000000000000;
    uint64_t v24 = 0;
    v25 = (double *)&v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    v16[2](v16, &v31, &v29, &v27, v8, y, v17);
    long long v18 = *(_OWORD *)&self->_initialTransform.tx;
    long long v19 = *(_OWORD *)&self->_initialTransform.a;
    *(_OWORD *)&v23.c = *(_OWORD *)&self->_initialTransform.c;
    *(_OWORD *)&v23.tdouble x = v18;
    CGFloat v20 = v25[3];
    *(_OWORD *)&v22.a = v19;
    *(_OWORD *)&v22.c = *(_OWORD *)&v23.c;
    *(_OWORD *)&v22.tdouble x = *(_OWORD *)&self->_initialTransform.tx;
    *(_OWORD *)&v23.a = v19;
    CGAffineTransformRotate(&v23, &v22, v20);
    v16;
    v15;
    PXDerivative();
  }
  BOOL v21 = v14 >= 0.0;
  [(PXSwipeDownTracker *)self setDismissalProgress:y / v13];
  [(PXSwipeDownTracker *)self setShouldFinishDismissal:v21];
}

void __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 minimumChange];
  [v4 setInput:v3 + 1.0];
}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 40)];
}

void __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3(uint64_t a1, double a2, double a3)
{
  if (a3 > 0.0 && !*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = [*(id *)(a1 + 32) scaleDownDistance];
    long double v8 = MEMORY[0x1AD10AED0](v6, a3 / v7);
    cos(v8);
    [*(id *)(a1 + 32) scaleDownFactor];
    PXFloatByLinearlyInterpolatingFloats();
  }
  uint64_t v9 = [*(id *)(a1 + 32) horizontalMotionType];
  [*(id *)(a1 + 32) horizontalResistanceDistance];
  __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_4(v9, a2, v10);
  v11 = *(void **)(a1 + 32);
  if (a3 <= 0.0)
  {
    uint64_t v12 = [v11 upMotionType];
    [*(id *)(a1 + 32) upResistanceDistance];
  }
  else
  {
    uint64_t v12 = [v11 downMotionType];
    [*(id *)(a1 + 32) downResistanceDistance];
  }
  __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_4(v12, a3, v13);
  if ([*(id *)(a1 + 32) rotationOnHorizontalMotion])
  {
    [*(id *)(a1 + 32) rotationHorizontalMotionFactor];
    PXDegreesToRadians();
  }
  if ([*(id *)(a1 + 32) rotationOnVerticalMotion])
  {
    uint64_t v15 = *(void *)(a1 + 40);
    double v14 = *(double *)(v15 + 16);
    if (v14 - *(double *)(v15 + 32) != 0.0)
    {
      CGRectGetWidth(*(CGRect *)(v15 + 48));
      [*(id *)(a1 + 32) rotationVerticalMotionResistanceDistance];
      log(fabs(a3 / v16) + 1.0);
      PXFloatSign();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "rotationMaximumAngle", v14);
  PXDegreesToRadians();
}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 56) + a2;
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) outputDerivative];
  (*(void (**)(uint64_t, uint64_t, void, void, double, double, double))(v6 + 16))(v6, *(void *)(*(void *)(a1 + 48) + 8) + 32, 0, 0, v5, v4, v7 * a2);
  return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7(uint64_t a1, double a2)
{
  return *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) outputDerivative];
  (*(void (**)(uint64_t, void, uint64_t, void, double, double, double))(v6 + 16))(v6, 0, *(void *)(*(void *)(a1 + 48) + 8) + 24, 0, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9(uint64_t a1, double a2)
{
  double v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) outputDerivative];
  (*(void (**)(uint64_t, void, void, uint64_t, double, double, double))(v6 + 16))(v6, 0, 0, *(void *)(*(void *)(a1 + 48) + 8) + 24, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_4(uint64_t result, double a2, double a3)
{
  if (result == 1)
  {
    log(fabs(a2) / a3 + 1.0);
    PXFloatSign();
  }
  return result;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6 velocity:(CGPoint)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  self->_didStartTracking = 1;
  self->_initialTouchLocation = a6;
  self->_initialCenter = a3;
  self->_initialBounds = a4;
  long long v13 = *(_OWORD *)&a5->a;
  long long v14 = *(_OWORD *)&a5->tx;
  *(_OWORD *)&self->_initialTransform.c = *(_OWORD *)&a5->c;
  *(_OWORD *)&self->_initialTransform.tdouble x = v14;
  *(_OWORD *)&self->_initialTransform.a = v13;
  -[PXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:");
  -[PXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", x, y, width, height);
  long long v15 = *(_OWORD *)&a5->c;
  v16[0] = *(_OWORD *)&a5->a;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a5->tx;
  [(PXSwipeDownTracker *)self setTrackedTransform:v16];
  PXPointIsNull();
}

- (PXSwipeDownTracker)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSwipeDownTracker;
  CGPoint result = [(PXSwipeDownTracker *)&v5 init];
  if (result)
  {
    result->_options = a3;
    *(_OWORD *)&result->_trackedVelocity.double x = 0u;
    *(_OWORD *)&result->_trackedVelocity.double scale = 0u;
    *(_OWORD *)&result->_finalAnimationDuration = xmmword_1AB359AD0;
  }
  return result;
}

- (PXSwipeDownTracker)init
{
  return [(PXSwipeDownTracker *)self initWithOptions:0];
}

@end