@interface PXStoryViewModePlayerToBrowserTransition
- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6;
- (BOOL)hasActiveAnimation;
- (BOOL)shouldFinish;
- (CGRect)frameForClipWithInfo:(id *)a3 proposedFrame:(CGRect)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- (PXStoryViewModePlayerToBrowserTransition)initWithSourceTimelineLayoutSnapshot:(id)a3 assetReference:(id)a4 trackingClipIdentifier:(int64_t)a5;
- (PXSwipeDownTracker)swipeDownTracker;
- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- (double)fadeoutDuration;
- (id)presentedBoundingBoxForViewMode:(int64_t)a3;
- (void)swipeDownInteractionStateDidChange;
@end

@implementation PXStoryViewModePlayerToBrowserTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_referenceLayout, 0);
  objc_storeStrong((id *)&self->_centerOffsetAnimator, 0);
  objc_storeStrong((id *)&self->_completionProgressAnimator, 0);
}

- (PXSwipeDownTracker)swipeDownTracker
{
  return self->_swipeDownTracker;
}

- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6
{
  id v12 = a7;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.origin.y = 0u;
  retstr->var1.size.CGFloat height = 0.0;
  if (self->_swipeDownTracker
    && ([(PXStoryViewModeFocusedClipsViewTransition *)self focusedClipIdentifiers],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 containsIndex:a4->var0],
        v13,
        v14))
  {
    if (self->_completionProgressAnimator
      && [(PXSwipeDownTracker *)self->_swipeDownTracker shouldFinishDismissal])
    {
      [(PXNumberAnimator *)self->_completionProgressAnimator presentationValue];
      PXFloatByLinearlyInterpolatingFloats();
    }
    long long v18 = *(_OWORD *)&a5->var1.origin.y;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
    *(_OWORD *)&retstr->var1.origin.y = v18;
    CGFloat height = a5->var1.size.height;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    memcpy(__dst, a4, sizeof(__dst));
    long long v15 = *(_OWORD *)&a5->var1.origin.y;
    v20[0] = *(_OWORD *)&a5->var0;
    v20[1] = v15;
    CGFloat v21 = a5->var1.size.height;
    [($B0175D27BC26B8A5DA33FAD13D27C2F3 *)&v23 contentsTransformOverrideForClipWithInfo:__dst proposedOverride:v20 inViewMode:a6 layout:v12];
    long long v16 = v25;
    *(_OWORD *)&retstr->var0 = v24;
    *(_OWORD *)&retstr->var1.origin.y = v16;
    CGFloat height = v26;
  }
  retstr->var1.size.CGFloat height = height;

  return result;
}

- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [(PXStoryViewModeTransition *)self regionOfInterest];
  if (v11
    && (id v12 = (void *)v11,
        [(PXStoryViewModeFocusedClipsViewTransition *)self focusedClipIdentifiers],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 containsIndex:a3->var0],
        v13,
        v12,
        v14))
  {
    unint64_t var1 = a3->var1;
    if (var1 <= 5)
    {
      if (((1 << var1) & 0xD) != 0)
      {
        long long v16 = +[PXStorySettings sharedInstance];
        [v16 viewModeTransitionAccessoryFadepoint];

        [(PXStoryViewModeTransition *)self fractionCompleted];
        PXFloatProgressBetween();
      }
      [(PXStoryViewModeTransition *)self valueWithFadeout:a4];
      BOOL v20 = v19 < a4;
      a4 = v19;
      if (v20)
      {
        double v21 = v19;
        int64_t var0 = a3->var0;
        if (var0 == [(PXStoryViewModeFocusedClipsViewTransition *)self trackingClipIdentifier]) {
          a4 = v21;
        }
        else {
          a4 = 0.0;
        }
      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    memcpy(v23, a3, sizeof(v23));
    [(PXStoryViewModeTransition *)&v24 alphaForClipWithInfo:v23 proposedAlpha:a5 inViewMode:v10 layout:a4];
    a4 = v17;
  }
  if (self->_shouldFadeOutEverything)
  {
    [(PXStoryViewModeTransition *)self fractionCompleted];
    PXFloatNormalize();
  }

  return a4;
}

- (CGRect)frameForClipWithInfo:(id *)a3 proposedFrame:(CGRect)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  int v14 = [(PXStoryViewModeTransition *)self regionOfInterest];
  [(PXStoryViewModeTransition *)self swipeDownInteractionState];
  int v15 = PXStorySwipeDownInteractionStateEqualsState((uint64_t)v60, (uint64_t)&PXStorySwipeDownInteractionStateNull);
  if (v14
    && ((char v16 = v15, !v15) || self->_swipeDownTracker || self->_centerOffsetAnimator || self->_completionProgressAnimator))
  {
    [v13 visibleRect];
    double v17 = [v13 rootLayout];
    long long v18 = [v17 coordinateSpace];
    [v14 rectInCoordinateSpace:v18];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    v27 = [v13 rootLayout];
    objc_msgSend(v13, "convertRect:fromLayout:", v27, v20, v22, v24, v26);

    BOOL v28 = [(PXStoryViewModePlayerToBrowserTransition *)self shouldFinish];
    swipeDownTracker = self->_swipeDownTracker;
    if (v16)
    {
      double v30 = width;
      if (swipeDownTracker && !self->_completionProgressAnimator)
      {
        [(PXStoryViewModeTransition *)self springStiffness];
        double v32 = v31;
        [(PXStoryViewModeTransition *)self dampingRatio];
        double v34 = v33;
        v35 = [(PXStoryViewModeTransition *)self progressAnimator];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_2;
        v52[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
        BOOL v53 = v28;
        [v35 performChangesUsingSpringAnimationWithStiffness:v52 dampingRatio:v32 initialVelocity:v34 changes:0.0];

        [(PXSwipeDownTracker *)self->_swipeDownTracker trackedVelocity];
        [(PXSwipeDownTracker *)self->_swipeDownTracker trackedCenter];
        PXRectGetCenter();
      }
    }
    else
    {
      double v30 = width;
      if (!swipeDownTracker)
      {
        v36 = [[PXSwipeDownTracker alloc] initWithOptions:0];
        v37 = self->_swipeDownTracker;
        self->_swipeDownTracker = v36;

        memset(__dst, 0, 72);
        [(PXStoryViewModeTransition *)self swipeDownInteractionState];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke;
        aBlock[3] = &unk_1E5DB1168;
        id v38 = v13;
        long long v56 = __dst[1];
        long long v57 = __dst[2];
        long long v58 = __dst[3];
        aBlock[4] = v38;
        uint64_t v59 = *(void *)&__dst[4];
        long long v55 = __dst[0];
        v39 = (void (**)(double, double))_Block_copy(aBlock);
        v39[2](*(double *)__dst, *((double *)__dst + 1));
        PXRectGetCenter();
      }
    }
    unint64_t var1 = a3->var1;
    if (var1 <= 5 && ((1 << var1) & 0x32) != 0)
    {
      v41 = [(PXStoryViewModeFocusedClipsViewTransition *)self focusedClipIdentifiers];
      int v42 = [v41 containsIndex:a3->var0];

      if (v42) {
        PXRectNormalize();
      }
    }
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    memcpy(__dst, a3, sizeof(__dst));
    -[PXStoryViewModeFocusedClipsViewTransition frameForClipWithInfo:proposedFrame:inViewMode:layout:](&v51, sel_frameForClipWithInfo_proposedFrame_inViewMode_layout_, __dst, a5, v13, x, y, width, height);
    double x = v43;
    double y = v44;
    double v30 = v45;
    double height = v46;
  }

  double v47 = x;
  double v48 = y;
  double v49 = v30;
  double v50 = height;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

void __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke(uint64_t a1)
{
}

uint64_t __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v2 = 0.0;
  }
  return [a2 setValue:v2];
}

uint64_t __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

uint64_t __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (BOOL)shouldFinish
{
  v3 = [(PXStoryViewModePlayerToBrowserTransition *)self swipeDownTracker];
  v4 = v3;
  if (v3 && ![v3 shouldFinishDismissal])
  {
    BOOL v8 = 0;
  }
  else
  {
    double lastSwipeDownDuration = self->_lastSwipeDownDuration;
    v6 = +[PXStorySettings sharedInstance];
    [v6 swipeDownSignificantDuration];
    BOOL v8 = lastSwipeDownDuration >= v7;
  }
  return v8;
}

- (id)presentedBoundingBoxForViewMode:(int64_t)a3
{
  if (a3 == 1)
  {
    if ([(PXStoryViewModeFocusedClipsViewTransition *)self trackingClipIdentifier])
    {
      referenceLayout = self->_referenceLayout;
      if (referenceLayout)
      {
        [(PXGLayout *)referenceLayout visibleRect];
        PXRectWithOriginAndSize();
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  v6 = [(PXStoryViewModeTransition *)&v8 presentedBoundingBoxForViewMode:a3];
  return v6;
}

- (void)swipeDownInteractionStateDidChange
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  [(PXStoryViewModeTransition *)&v20 swipeDownInteractionStateDidChange];
  double v19 = 0.0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  [(PXStoryViewModeTransition *)self swipeDownInteractionState];
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v25 = 0;
  *(_OWORD *)buf = 0u;
  long long v22 = 0u;
  if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)buf, (uint64_t)&PXStorySwipeDownInteractionStateNull) & 1) == 0)
  {
    if (self->_swipeDownTracker) {
      PXPointSubtract();
    }
    v3 = [(PXStoryViewModeTransition *)self progressAnimator];
    [v3 presentationValue];
    uint64_t v5 = v4;

    v6 = [(PXStoryViewModeTransition *)self progressAnimator];
    objc_msgSend(v6, "performChangesWithoutAnimation:", &v14, v9, v10, v11, v12, v13, MEMORY[0x1E4F143A8], 3221225472, __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke, &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l, v5);

    self->_double lastSwipeDownDuration = v19 - *((double *)&v18 + 1);
    double v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v8 = self->_lastSwipeDownDuration * 1000.0;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "Last swipe down duration: %0.3f ms", buf, 0xCu);
    }
  }
}

uint64_t __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

void __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 304);
  id v3 = a2;
  [v2 dismissalProgress];
  objc_msgSend(v3, "setValue:");
}

- (double)fadeoutDuration
{
  swipeDownTracker = self->_swipeDownTracker;
  if (!swipeDownTracker) {
    return 0.1;
  }
  BOOL v3 = [(PXSwipeDownTracker *)swipeDownTracker shouldFinishDismissal];
  double result = 0.1;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (BOOL)hasActiveAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  if ([(PXStoryViewModeTransition *)&v4 hasActiveAnimation]
    || ([(PXPointAnimator *)self->_centerOffsetAnimator isAnimating] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [(PXNumberAnimator *)self->_completionProgressAnimator isAnimating];
  }
}

- (PXStoryViewModePlayerToBrowserTransition)initWithSourceTimelineLayoutSnapshot:(id)a3 assetReference:(id)a4 trackingClipIdentifier:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F28E60];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  uint64_t v12 = [v8 timeline];
  if (v8) {
    [v8 timeRange];
  }
  else {
    memset(v27, 0, sizeof(v27));
  }
  [v8 timelineRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __119__PXStoryViewModePlayerToBrowserTransition_initWithSourceTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke;
  v25[3] = &unk_1E5DBF840;
  id v26 = v11;
  id v21 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v27, v25, v14, v16, v18, v20);

  v24.receiver = self;
  v24.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  long long v22 = [(PXStoryViewModeFocusedClipsViewTransition *)&v24 initWithSourceViewMode:1 sourceSnapshot:v8 destinationViewMode:2 destinationSnapshot:0 assetReference:v10 focusedClipIdentifiers:v21 trackingClipIdentifier:a5];

  return v22;
}

uint64_t __119__PXStoryViewModePlayerToBrowserTransition_initWithSourceTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2 >= 1)
  {
    uint64_t v14 = v8;
    uint64_t v15 = v7;
    uint64_t v16 = v6;
    uint64_t v17 = v5;
    uint64_t v18 = v9;
    uint64_t v19 = v10;
    uint64_t v12 = a2;
    uint64_t v13 = result;
    do
    {
      double result = objc_msgSend(*(id *)(v13 + 32), "addIndex:", *a5, v14, v15, v16, v17, v18, v19);
      a5 += 96;
      --v12;
    }
    while (v12);
  }
  return result;
}

@end