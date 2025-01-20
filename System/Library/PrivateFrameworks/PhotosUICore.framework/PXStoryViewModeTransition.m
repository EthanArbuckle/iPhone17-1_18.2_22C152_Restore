@interface PXStoryViewModeTransition
- ($74445421B386A896E969A1525619931B)swipeDownInteractionState;
- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6;
- (BOOL)hasActiveAnimation;
- (BOOL)hasSourceOrDestinationViewMode:(int64_t)a3;
- (BOOL)isCancelled;
- (BOOL)isComplete;
- (BOOL)isFinished;
- (BOOL)shouldFinish;
- (NSString)description;
- (PXAssetReference)assetReference;
- (PXNumberAnimator)fadeoutAnimator;
- (PXNumberAnimator)progressAnimator;
- (PXRegionOfInterest)regionOfInterest;
- (PXStoryTimelineLayoutSnapshot)destinationSnapshot;
- (PXStoryTimelineLayoutSnapshot)sourceSnapshot;
- (PXStoryViewModeTransition)init;
- (PXStoryViewModeTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7;
- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- (double)dampingRatio;
- (double)fadeoutDuration;
- (double)springStiffness;
- (double)valueWithFadeout:(double)a3;
- (float)fractionCompleted;
- (id)presentedBoundingBoxForViewMode:(int64_t)a3;
- (int64_t)destinationViewMode;
- (int64_t)sourceViewMode;
- (void)_invalidateIsComplete;
- (void)_updateIsComplete;
- (void)cancel;
- (void)didPerformChanges;
- (void)finish;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setFractionCompleted:(float)a3;
- (void)setRegionOfInterest:(id)a3;
- (void)setSwipeDownInteractionState:(id *)a3;
- (void)start;
@end

@implementation PXStoryViewModeTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeoutAnimator, 0);
  objc_storeStrong((id *)&self->_progressAnimator, 0);
  objc_storeStrong((id *)&self->_regionOfInterest, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_destinationSnapshot, 0);
  objc_storeStrong((id *)&self->_sourceSnapshot, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (PXNumberAnimator)fadeoutAnimator
{
  return self->_fadeoutAnimator;
}

- (PXNumberAnimator)progressAnimator
{
  return self->_progressAnimator;
}

- (float)fractionCompleted
{
  return self->_fractionCompleted;
}

- ($74445421B386A896E969A1525619931B)swipeDownInteractionState
{
  long long v3 = *(_OWORD *)&self[3].var0.y;
  retstr->var2 = *(CGPoint *)&self[2].var5;
  *(_OWORD *)&retstr->var3 = v3;
  retstr->var5 = self[3].var1.y;
  CGPoint v4 = *(CGPoint *)&self[2].var3;
  retstr->var0 = self[2].var2;
  retstr->var1 = v4;
  return self;
}

- (PXRegionOfInterest)regionOfInterest
{
  return self->_regionOfInterest;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (PXStoryTimelineLayoutSnapshot)destinationSnapshot
{
  return self->_destinationSnapshot;
}

- (PXStoryTimelineLayoutSnapshot)sourceSnapshot
{
  return self->_sourceSnapshot;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (int64_t)destinationViewMode
{
  return self->_destinationViewMode;
}

- (int64_t)sourceViewMode
{
  return self->_sourceViewMode;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ProgressAnimatorObservationContext == a5)
  {
    if ((v6 & 6) != 0)
    {
      v12 = v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v13 = __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke;
      goto LABEL_14;
    }
  }
  else
  {
    if ((void *)CompletionProgressAnimatorObservationContext != a5
      && CenterAnimatorObservationContext != (void)a5
      && FadeoutAnimatorObservationContext != (void)a5)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PXStoryViewModeTransition.m" lineNumber:250 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 6) != 0)
    {
      v12 = &v15;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v13 = __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke_2;
LABEL_14:
      v12[2] = (uint64_t)v13;
      v12[3] = (uint64_t)&unk_1E5DC2EC8;
      v12[4] = (uint64_t)self;
      -[PXStoryViewModeTransition performChanges:](self, "performChanges:", v15, v16);
    }
  }
}

uint64_t __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressAnimator];
  [v2 presentationValue];
  *(float *)&double v3 = v3;
  [*(id *)(a1 + 32) setFractionCompleted:v3];

  CGPoint v4 = *(void **)(a1 + 32);
  return [v4 _invalidateIsComplete];
}

uint64_t __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) signalChange:1];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateIsComplete];
}

- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6
{
  long long v7 = *(_OWORD *)&a5->var1.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&retstr->var1.origin.y = v7;
  retstr->var1.size.height = a5->var1.size.height;
  return self;
}

- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
}

- (BOOL)shouldFinish
{
  return 1;
}

- (id)presentedBoundingBoxForViewMode:(int64_t)a3
{
  return 0;
}

- (void)_updateIsComplete
{
  if (![(PXStoryViewModeTransition *)self hasActiveAnimation])
  {
    [(PXStoryViewModeTransition *)self fadeoutDuration];
    if (v3 <= 0.0 || self->_fadeoutAnimator)
    {
      [(PXStoryViewModeTransition *)self progressAnimator];
      [(id)objc_claimAutoreleasedReturnValue() presentationValue];
      PXFloatApproximatelyEqualToFloat();
    }
    double v4 = v3;
    v5 = (PXNumberAnimator *)[objc_alloc((Class)off_1E5DA74E8) initWithValue:1.0];
    fadeoutAnimator = self->_fadeoutAnimator;
    self->_fadeoutAnimator = v5;

    [(PXNumberAnimator *)self->_fadeoutAnimator performChangesWithDuration:1 curve:&__block_literal_global_19_20759 changes:v4];
    long long v7 = self->_fadeoutAnimator;
    uint64_t v8 = FadeoutAnimatorObservationContext;
    [(PXNumberAnimator *)v7 registerChangeObserver:self context:v8];
  }
}

uint64_t __46__PXStoryViewModeTransition__updateIsComplete__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:0.0];
}

- (void)_invalidateIsComplete
{
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewModeTransition;
  [(PXStoryViewModeTransition *)&v3 didPerformChanges];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (BOOL)hasSourceOrDestinationViewMode:(int64_t)a3
{
  return [(PXStoryViewModeTransition *)self sourceViewMode] == a3
      || [(PXStoryViewModeTransition *)self destinationViewMode] == a3;
}

- (void)cancel
{
  if (![(PXStoryViewModeTransition *)self isComplete])
  {
    self->_isCancelled = 1;
    self->_isComplete = 1;
    [(PXStoryViewModeTransition *)self signalChange:2];
  }
}

- (void)finish
{
  if (![(PXStoryViewModeTransition *)self isComplete])
  {
    self->_isFinished = 1;
    self->_isComplete = 1;
    [(PXStoryViewModeTransition *)self signalChange:2];
  }
}

- (void)start
{
  id v6 = [(PXStoryViewModeTransition *)self progressAnimator];
  [(PXStoryViewModeTransition *)self springStiffness];
  double v4 = v3;
  [(PXStoryViewModeTransition *)self dampingRatio];
  [v6 performChangesUsingSpringAnimationWithStiffness:&__block_literal_global_20765 dampingRatio:v4 initialVelocity:v5 changes:0.0];
}

uint64_t __34__PXStoryViewModeTransition_start__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

- (double)dampingRatio
{
  return 1.0;
}

- (double)springStiffness
{
  v2 = +[PXStorySettings sharedInstance];
  [v2 viewModeTransitionSpringStiffness];
  double v4 = v3;

  return v4;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewModeTransition;
  [(PXStoryViewModeTransition *)&v3 performChanges:a3];
}

- (BOOL)hasActiveAnimation
{
  objc_super v3 = [(PXStoryViewModeTransition *)self progressAnimator];
  if (([v3 isAnimating] & 1) == 0
    && ([(PXNumberAnimator *)self->_fadeoutAnimator isAnimating] & 1) == 0)
  {
    [(PXStoryViewModeTransition *)self swipeDownInteractionState];
    if (PXStorySwipeDownInteractionStateEqualsState((uint64_t)v5, (uint64_t)&PXStorySwipeDownInteractionStateNull))
    {
      [v3 presentationValue];
      PXFloatApproximatelyEqualToFloat();
    }
  }

  return 1;
}

- (void)setSwipeDownInteractionState:(id *)a3
{
  p_swipeDownInteractionState = &self->_swipeDownInteractionState;
  long long v6 = *(_OWORD *)&self->_swipeDownInteractionState.coordinateSpace;
  v15[2] = self->_swipeDownInteractionState.velocity;
  v15[3] = v6;
  double lastTimestamp = self->_swipeDownInteractionState.lastTimestamp;
  CGPoint location = self->_swipeDownInteractionState.location;
  v15[0] = self->_swipeDownInteractionState.initialLocation;
  v15[1] = location;
  long long v8 = *(_OWORD *)&a3->var3;
  v13[2] = a3->var2;
  v13[3] = v8;
  double var5 = a3->var5;
  CGPoint var1 = a3->var1;
  v13[0] = a3->var0;
  v13[1] = var1;
  if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)v15, (uint64_t)v13) & 1) == 0)
  {
    p_swipeDownInteractionState->initialLocation = a3->var0;
    CGPoint v10 = a3->var1;
    CGPoint var2 = a3->var2;
    long long v12 = *(_OWORD *)&a3->var3;
    p_swipeDownInteractionState->double lastTimestamp = a3->var5;
    p_swipeDownInteractionState->velocity = var2;
    *(_OWORD *)&p_swipeDownInteractionState->coordinateSpace = v12;
    p_swipeDownInteractionState->CGPoint location = v10;
    [(PXStoryViewModeTransition *)self signalChange:1];
    [(PXStoryViewModeTransition *)self _invalidateIsComplete];
    [(PXStoryViewModeTransition *)self swipeDownInteractionStateDidChange];
  }
}

- (void)setRegionOfInterest:(id)a3
{
  double v5 = (PXRegionOfInterest *)a3;
  if (self->_regionOfInterest != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_regionOfInterest, a3);
    [(PXStoryViewModeTransition *)self signalChange:1];
    double v5 = v6;
  }
}

- (void)setFractionCompleted:(float)a3
{
  if (self->_fractionCompleted != a3)
  {
    self->_fractionCompleted = a3;
    [(PXStoryViewModeTransition *)self signalChange:1];
    [(PXStoryViewModeTransition *)self _invalidateIsComplete];
  }
}

- (double)valueWithFadeout:(double)a3
{
  fadeoutAnimator = self->_fadeoutAnimator;
  if (fadeoutAnimator)
  {
    [(PXNumberAnimator *)fadeoutAnimator presentationValue];
    return v5 * a3;
  }
  return a3;
}

- (double)fadeoutDuration
{
  return 0.0;
}

- (NSString)description
{
  objc_super v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  long long v6 = PXStoryViewModeDescription([(PXStoryViewModeTransition *)self sourceViewMode]);
  long long v7 = PXStoryViewModeDescription([(PXStoryViewModeTransition *)self destinationViewMode]);
  long long v8 = [v3 stringWithFormat:@"<%p:%@ %@ -> %@>", self, v5, v6, v7];

  return (NSString *)v8;
}

- (PXStoryViewModeTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryViewModeTransition;
  uint64_t v16 = [(PXStoryViewModeTransition *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v16];
    updater = v16->_updater;
    v16->_updater = (PXUpdater *)v17;

    [(PXUpdater *)v16->_updater addUpdateSelector:sel__updateIsComplete];
    v16->_sourceViewMode = a3;
    objc_storeStrong((id *)&v16->_sourceSnapshot, a4);
    v16->_destinationViewMode = a5;
    objc_storeStrong((id *)&v16->_destinationSnapshot, a6);
    objc_storeStrong((id *)&v16->_assetReference, a7);
    v16->_swipeDownInteractionState.initialLocation = 0u;
    v16->_swipeDownInteractionState.CGPoint location = 0u;
    v16->_swipeDownInteractionState.velocity = 0u;
    *(_OWORD *)&v16->_swipeDownInteractionState.coordinateSpace = 0u;
    v16->_swipeDownInteractionState.double lastTimestamp = 0.0;
    uint64_t v19 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    progressAnimator = v16->_progressAnimator;
    v16->_progressAnimator = (PXNumberAnimator *)v19;

    [(PXNumberAnimator *)v16->_progressAnimator registerChangeObserver:v16 context:ProgressAnimatorObservationContext];
  }

  return v16;
}

- (PXStoryViewModeTransition)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewModeTransition.m", 51, @"%s is not available as initializer", "-[PXStoryViewModeTransition init]");

  abort();
}

@end