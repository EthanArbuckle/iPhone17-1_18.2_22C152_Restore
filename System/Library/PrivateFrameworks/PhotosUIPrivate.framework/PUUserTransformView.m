@interface PUUserTransformView
+ (double)doubleTapZoomScaleForContentSize:(CGSize)a3 inBoundsSize:(CGSize)a4 defaultScale:(double)a5 preferToFillOnDoubleTap:(BOOL)a6;
- (BOOL)_isAnimatingZoomEnd;
- (BOOL)_isContentAnimating;
- (BOOL)_isUpdatingScrollView;
- (BOOL)_isUpdatingState;
- (BOOL)_isUserDeceleratingPan;
- (BOOL)_isUserEndingZoom;
- (BOOL)_isUserPanning;
- (BOOL)_isUserPanningOrDecelerating;
- (BOOL)_isUserZooming;
- (BOOL)_isUserZoomingOrBouncing;
- (BOOL)_needsStateUpdate;
- (BOOL)_needsUpdateAnimatingZoomEnd;
- (BOOL)_needsUpdateContentState;
- (BOOL)_needsUpdateScrollView;
- (BOOL)_needsUpdateShouldTrackContentAnimation;
- (BOOL)_needsUpdateUserAffineTransform;
- (BOOL)_needsUpdateUserInteracting;
- (BOOL)_needsUpdateUserPanningOrDecelerating;
- (BOOL)_needsUpdateUserZoomingOrBouncing;
- (BOOL)_needsUpdateZoomAndScroll;
- (BOOL)_shouldTrackContentAnimation;
- (BOOL)_wasUserInteractingBeforeStateUpdate;
- (BOOL)contentContainsLocationFromProvider:(id)a3;
- (BOOL)hasUserZoomedIn;
- (BOOL)isTrackingZoomGesture;
- (BOOL)isUserInteracting;
- (BOOL)needsUpdateEnabledInteractions;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)preferToFillOnDoubleTap;
- (BOOL)requireTwoTouchesForPan;
- (CADisplayLink)_displayLink;
- (CGAffineTransform)userAffineTransform;
- (CGPoint)_contentCenter;
- (CGPoint)_contentOffsetAdjustmentForContentInsets:(UIEdgeInsets)a3;
- (CGPoint)offset;
- (CGRect)untransformedContentFrame;
- (CGRect)visibleRect;
- (CGSize)contentPixelSize;
- (CGSize)scrollPadding;
- (NSDate)zoomStartDate;
- (PUUserTransformView)initWithFrame:(CGRect)a3;
- (PUUserTransformViewDelegate)delegate;
- (UIEdgeInsets)_contentInsetsForContentScale:(double)a3;
- (UIImage)debugScrollViewContentImage;
- (UIScrollView)_scrollView;
- (UIView)hostedView;
- (UIView)scrollContentView;
- (double)_contentZoomScale;
- (double)_currentPresentationZoomScale;
- (double)_preferredMaximumZoomScale;
- (double)_preferredMinimumZoomScale;
- (double)desiredZoomScale;
- (double)doubleTapZoomScale;
- (double)fillZoomScale;
- (double)minimumZoomScale;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)_numberOfNestedStateChanges;
- (int64_t)_numberOfNestedZoomAndScrollChanges;
- (unint64_t)enabledInteractions;
- (void)_assertInsideStateChangeBlock;
- (void)_assertInsideStateUpdate;
- (void)_assertInsideZoomAndScrollChangeBlock;
- (void)_didChangeState;
- (void)_handleDisplayLink:(id)a3;
- (void)_invalidateAnimatingZoomEnd;
- (void)_invalidateContentState;
- (void)_invalidateEnabledInteractions;
- (void)_invalidateScrollView;
- (void)_invalidateShouldTrackContentAnimation;
- (void)_invalidateUserAffineTransform;
- (void)_invalidateUserInteracting;
- (void)_invalidateUserPanningOrDecelerating;
- (void)_invalidateUserZoomingOrBouncing;
- (void)_invalidateZoomAndScroll;
- (void)_performStateChanges:(id)a3;
- (void)_performZoomAndScrollChanges:(id)a3;
- (void)_setAnimatingZoomEnd:(BOOL)a3;
- (void)_setContentAnimating:(BOOL)a3;
- (void)_setContentCenter:(CGPoint)a3;
- (void)_setContentZoomScale:(double)a3;
- (void)_setDisplayLink:(id)a3;
- (void)_setEnabledInteractions:(unint64_t)a3;
- (void)_setNeedsStateUpdate;
- (void)_setNeedsUpdateAnimatingZoomEnd:(BOOL)a3;
- (void)_setNeedsUpdateContentState:(BOOL)a3;
- (void)_setNeedsUpdateScrollView:(BOOL)a3;
- (void)_setNeedsUpdateShouldTrackContentAnimation:(BOOL)a3;
- (void)_setNeedsUpdateUserAffineTransform:(BOOL)a3;
- (void)_setNeedsUpdateUserInteracting:(BOOL)a3;
- (void)_setNeedsUpdateUserPanningOrDecelerating:(BOOL)a3;
- (void)_setNeedsUpdateUserZoomingOrBouncing:(BOOL)a3;
- (void)_setNeedsUpdateZoomAndScroll:(BOOL)a3;
- (void)_setNumberOfNestedStateChanges:(int64_t)a3;
- (void)_setNumberOfNestedZoomAndScrollChanges:(int64_t)a3;
- (void)_setPreferredMaximumZoomScale:(double)a3;
- (void)_setPreferredMinimumZoomScale:(double)a3;
- (void)_setShouldTrackContentAnimation:(BOOL)a3;
- (void)_setUpdatingScrollView:(BOOL)a3;
- (void)_setUpdatingState:(BOOL)a3;
- (void)_setUserAffineTransform:(CGAffineTransform *)a3;
- (void)_setUserDeceleratingPan:(BOOL)a3;
- (void)_setUserEndingZoom:(BOOL)a3;
- (void)_setUserInteracting:(BOOL)a3;
- (void)_setUserPanning:(BOOL)a3;
- (void)_setUserPanningOrDecelerating:(BOOL)a3;
- (void)_setUserZooming:(BOOL)a3;
- (void)_setUserZoomingOrBouncing:(BOOL)a3;
- (void)_setWasUserInteractingBeforeStateUpdate:(BOOL)a3;
- (void)_updateAnimatingZoomEndIfNeeded;
- (void)_updateContentStateIfNeeded;
- (void)_updateDisplayLink;
- (void)_updateEnabledInteractionsIfNeeded;
- (void)_updateScrollViewFrame;
- (void)_updateScrollViewIfNeeded;
- (void)_updateScrollViewMinimumZoomScaleAndGoToMinimum:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateShouldTrackContentAnimationIfNeeded;
- (void)_updateStateIfNeeded;
- (void)_updateUserAffineTransformIfNeeded;
- (void)_updateUserInteractingIfNeeded;
- (void)_updateUserPanningOrDeceleratingIfNeeded;
- (void)_updateUserZoomingOrBouncingIfNeeded;
- (void)_updateZoomAndScrollIfNeeded;
- (void)_willChangeState;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setContentPixelSize:(CGSize)a3;
- (void)setDebugScrollViewContentImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredZoomScale:(double)a3;
- (void)setEnabledInteractions:(unint64_t)a3;
- (void)setHasUserZoomedIn:(BOOL)a3;
- (void)setHostedView:(id)a3;
- (void)setMinimumZoomScale:(double)a3;
- (void)setMinimumZoomScale:(double)a3 animated:(BOOL)a4;
- (void)setNeedsUpdateEnabledInteractions:(BOOL)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setPreferToFillOnDoubleTap:(BOOL)a3;
- (void)setRequireTwoTouchesForPan:(BOOL)a3;
- (void)setScrollPadding:(CGSize)a3;
- (void)setUntransformedContentFrame:(CGRect)a3;
- (void)setUserAffineTransform:(CGAffineTransform *)a3;
- (void)setZoomStartDate:(id)a3;
- (void)toggleZoomWithLocationProvider:(id)a3;
- (void)zoomInOnLocationFromProvider:(id)a3;
- (void)zoomInOnLocationFromProvider:(id)a3 animated:(BOOL)a4;
- (void)zoomOut:(BOOL)a3;
@end

@implementation PUUserTransformView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugScrollViewContentImage, 0);
  objc_storeStrong((id *)&self->_zoomStartDate, 0);
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostedView, 0);
}

- (UIImage)debugScrollViewContentImage
{
  return self->_debugScrollViewContentImage;
}

- (void)setZoomStartDate:(id)a3
{
}

- (NSDate)zoomStartDate
{
  return self->_zoomStartDate;
}

- (void)_setNeedsUpdateScrollView:(BOOL)a3
{
  self->__needsUpdateScrollView = a3;
}

- (BOOL)_needsUpdateScrollView
{
  return self->__needsUpdateScrollView;
}

- (void)_setNeedsUpdateZoomAndScroll:(BOOL)a3
{
  self->__needsUpdateZoomAndScroll = a3;
}

- (BOOL)_needsUpdateZoomAndScroll
{
  return self->__needsUpdateZoomAndScroll;
}

- (void)_setNumberOfNestedZoomAndScrollChanges:(int64_t)a3
{
  self->__numberOfNestedZoomAndScrollChanges = a3;
}

- (int64_t)_numberOfNestedZoomAndScrollChanges
{
  return self->__numberOfNestedZoomAndScrollChanges;
}

- (double)_preferredMaximumZoomScale
{
  return self->__preferredMaximumZoomScale;
}

- (double)_preferredMinimumZoomScale
{
  return self->__preferredMinimumZoomScale;
}

- (double)desiredZoomScale
{
  return self->_desiredZoomScale;
}

- (void)_setDisplayLink:(id)a3
{
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)setNeedsUpdateEnabledInteractions:(BOOL)a3
{
  self->_needsUpdateEnabledInteractions = a3;
}

- (BOOL)needsUpdateEnabledInteractions
{
  return self->_needsUpdateEnabledInteractions;
}

- (void)_setNeedsUpdateAnimatingZoomEnd:(BOOL)a3
{
  self->__needsUpdateAnimatingZoomEnd = a3;
}

- (BOOL)_needsUpdateAnimatingZoomEnd
{
  return self->__needsUpdateAnimatingZoomEnd;
}

- (void)_setNeedsUpdateContentState:(BOOL)a3
{
  self->__needsUpdateContentState = a3;
}

- (BOOL)_needsUpdateContentState
{
  return self->__needsUpdateContentState;
}

- (void)_setNeedsUpdateUserAffineTransform:(BOOL)a3
{
  self->__needsUpdateUserAffineTransform = a3;
}

- (BOOL)_needsUpdateUserAffineTransform
{
  return self->__needsUpdateUserAffineTransform;
}

- (void)_setNeedsUpdateShouldTrackContentAnimation:(BOOL)a3
{
  self->__needsUpdateShouldTrackContentAnimation = a3;
}

- (BOOL)_needsUpdateShouldTrackContentAnimation
{
  return self->__needsUpdateShouldTrackContentAnimation;
}

- (void)_setNeedsUpdateUserInteracting:(BOOL)a3
{
  self->__needsUpdateUserInteracting = a3;
}

- (BOOL)_needsUpdateUserInteracting
{
  return self->__needsUpdateUserInteracting;
}

- (void)_setNeedsUpdateUserZoomingOrBouncing:(BOOL)a3
{
  self->__needsUpdateUserZoomingOrBouncing = a3;
}

- (BOOL)_needsUpdateUserZoomingOrBouncing
{
  return self->__needsUpdateUserZoomingOrBouncing;
}

- (void)_setNeedsUpdateUserPanningOrDecelerating:(BOOL)a3
{
  self->__needsUpdateUserPanningOrDecelerating = a3;
}

- (BOOL)_needsUpdateUserPanningOrDecelerating
{
  return self->__needsUpdateUserPanningOrDecelerating;
}

- (void)_setWasUserInteractingBeforeStateUpdate:(BOOL)a3
{
  self->__wasUserInteractingBeforeStateUpdate = a3;
}

- (BOOL)_wasUserInteractingBeforeStateUpdate
{
  return self->__wasUserInteractingBeforeStateUpdate;
}

- (void)_setUpdatingState:(BOOL)a3
{
  self->__isUpdatingState = a3;
}

- (BOOL)_isUpdatingState
{
  return self->__isUpdatingState;
}

- (void)_setNumberOfNestedStateChanges:(int64_t)a3
{
  self->__numberOfNestedStateChanges = a3;
}

- (int64_t)_numberOfNestedStateChanges
{
  return self->__numberOfNestedStateChanges;
}

- (BOOL)_isAnimatingZoomEnd
{
  return self->__isAnimatingZoomEnd;
}

- (double)_contentZoomScale
{
  return self->__contentZoomScale;
}

- (CGPoint)_contentCenter
{
  double x = self->__contentCenter.x;
  double y = self->__contentCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)_isContentAnimating
{
  return self->__isContentAnimating;
}

- (BOOL)_shouldTrackContentAnimation
{
  return self->__shouldTrackContentAnimation;
}

- (BOOL)_isUserZoomingOrBouncing
{
  return self->__isUserZoomingOrBouncing;
}

- (BOOL)_isUserPanningOrDecelerating
{
  return self->__isUserPanningOrDecelerating;
}

- (BOOL)_isUserEndingZoom
{
  return self->__isUserEndingZoom;
}

- (BOOL)_isUserZooming
{
  return self->__isUserZooming;
}

- (BOOL)_isUserDeceleratingPan
{
  return self->__isUserDeceleratingPan;
}

- (BOOL)_isUserPanning
{
  return self->__isUserPanning;
}

- (BOOL)_isUpdatingScrollView
{
  return self->__updatingScrollView;
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (PUUserTransformViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUUserTransformViewDelegate *)WeakRetained;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hasUserZoomedIn
{
  return self->_hasUserZoomedIn;
}

- (double)minimumZoomScale
{
  return self->_minimumZoomScale;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void)setPreferToFillOnDoubleTap:(BOOL)a3
{
  self->_preferToFillOnDoubleTap = a3;
}

- (BOOL)preferToFillOnDoubleTap
{
  return self->_preferToFillOnDoubleTap;
}

- (BOOL)isUserInteracting
{
  return self->_isUserInteracting;
}

- (CGSize)scrollPadding
{
  double width = self->_scrollPadding.width;
  double height = self->_scrollPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)enabledInteractions
{
  return self->_enabledInteractions;
}

- (CGAffineTransform)userAffineTransform
{
  long long v3 = *(_OWORD *)&self[14].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[14].c;
  return self;
}

- (CGRect)untransformedContentFrame
{
  double x = self->_untransformedContentFrame.origin.x;
  double y = self->_untransformedContentFrame.origin.y;
  double width = self->_untransformedContentFrame.size.width;
  double height = self->_untransformedContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)requireTwoTouchesForPan
{
  return self->_requireTwoTouchesForPan;
}

- (CGSize)contentPixelSize
{
  double width = self->_contentPixelSize.width;
  double height = self->_contentPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHasUserZoomedIn:(BOOL)a3
{
  if (self->_hasUserZoomedIn != a3)
  {
    self->_hasUserZoomedIn = a3;
    if (self->_delegateFlags.respondsToDidChangeIsZoomedIn)
    {
      id v4 = [(PUUserTransformView *)self delegate];
      [v4 userTransformViewDidChangeIsZoomedIn:self];
    }
  }
}

- (CGRect)visibleRect
{
  long long v3 = [(PUUserTransformView *)self _scrollView];
  id v4 = [(PUUserTransformView *)self scrollContentView];
  if (![(PUUserTransformView *)self _isContentAnimating]) {
    goto LABEL_6;
  }
  v5 = [v3 layer];
  v6 = [v5 presentationLayer];

  v7 = [v4 layer];
  v8 = [v7 presentationLayer];

  if (!v6 || !v8)
  {

LABEL_6:
    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", v4);
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;
    goto LABEL_7;
  }
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toLayer:", v8);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

LABEL_7:
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  double v24 = v16;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7 = a3;
  id v8 = [(PUUserTransformView *)self _scrollView];

  if (v8 != v7)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1199, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke;
  v12[3] = &unk_1E5F2ED10;
  v12[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v12];
  dispatch_time_t v9 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x1E4F14428], block);
}

uint64_t __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUserZooming:0];
  [*(id *)(a1 + 32) _setUserEndingZoom:1];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateContentState];
}

uint64_t __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_3;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = v1;
  return [v1 _performStateChanges:v3];
}

uint64_t __64__PUUserTransformView_scrollViewDidEndZooming_withView_atScale___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUserEndingZoom:0];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v6 = a3;
  id v7 = [(PUUserTransformView *)self _scrollView];

  if (v7 != v6)
  {
    dispatch_time_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1191, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [(PUUserTransformView *)self setZoomStartDate:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PUUserTransformView_scrollViewWillBeginZooming_withView___block_invoke;
  v10[3] = &unk_1E5F2ED10;
  v10[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v10];
}

uint64_t __59__PUUserTransformView_scrollViewWillBeginZooming_withView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUserZooming:1];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5 = a3;
  id v6 = [(PUUserTransformView *)self _scrollView];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1184, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PUUserTransformView_scrollViewDidEndDecelerating___block_invoke;
  v8[3] = &unk_1E5F2ED10;
  v8[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v8];
}

uint64_t __52__PUUserTransformView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUserDeceleratingPan:0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v7 = a3;
  id v8 = [(PUUserTransformView *)self _scrollView];

  if (v8 != v7)
  {
    dispatch_time_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1176, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PUUserTransformView_scrollViewDidEndDragging_willDecelerate___block_invoke;
  v10[3] = &unk_1E5F2E120;
  v10[4] = self;
  BOOL v11 = a4;
  [(PUUserTransformView *)self _performStateChanges:v10];
}

uint64_t __63__PUUserTransformView_scrollViewDidEndDragging_willDecelerate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUserPanning:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 _setUserDeceleratingPan:v3];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5 = a3;
  id v6 = [(PUUserTransformView *)self _scrollView];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1169, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PUUserTransformView_scrollViewWillBeginDragging___block_invoke;
  v8[3] = &unk_1E5F2ED10;
  v8[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v8];
}

uint64_t __51__PUUserTransformView_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUserPanning:1];
}

- (void)scrollViewDidZoom:(id)a3
{
  id v5 = a3;
  id v6 = [(PUUserTransformView *)self _scrollView];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1162, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PUUserTransformView_scrollViewDidZoom___block_invoke;
  v8[3] = &unk_1E5F2ED10;
  v8[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v8];
}

uint64_t __41__PUUserTransformView_scrollViewDidZoom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContentState];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  id v6 = [(PUUserTransformView *)self _scrollView];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1155, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PUUserTransformView_scrollViewDidScroll___block_invoke;
  v8[3] = &unk_1E5F2ED10;
  v8[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v8];
}

uint64_t __43__PUUserTransformView_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContentState];
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v5 = a3;
  id v6 = [(PUUserTransformView *)self _scrollView];

  if (v6 != v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 1149, @"Invalid parameter not satisfying: %@", @"scrollView == [self _scrollView]" object file lineNumber description];
  }
  return [(PUUserTransformView *)self scrollContentView];
}

- (void)_handleDisplayLink:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PUUserTransformView__handleDisplayLink___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUUserTransformView *)self _performStateChanges:v3];
}

uint64_t __42__PUUserTransformView__handleDisplayLink___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContentState];
}

- (void)_updateDisplayLink
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUUserTransformView *)self _shouldTrackContentAnimation];
  id v4 = [(PUUserTransformView *)self _displayLink];
  id v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__handleDisplayLink_];
      if ([MEMORY[0x1E4F91238] highFramerateRequiresReasonAndRange])
      {
        [v5 setHighFrameRateReason:2228225];
        PXFrameRateRangeTypeGetCAFrameRateRange();
        objc_msgSend(v5, "setPreferredFrameRateRange:");
      }
      id v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C3A0]];

      [(PUUserTransformView *)self _setDisplayLink:v5];
      id v7 = PLOneUpGetLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v9 = 134217984;
      double v10 = self;
      id v8 = "%p starting display link";
      goto LABEL_10;
    }
  }
  else if (v4)
  {
    [v4 invalidate];
    [(PUUserTransformView *)self _setDisplayLink:0];
    id v7 = PLOneUpGetLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      goto LABEL_12;
    }
    int v9 = 134217984;
    double v10 = self;
    id v8 = "%p stopping display link";
LABEL_10:
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_11;
  }
LABEL_12:
}

- (double)fillZoomScale
{
  [(PUUserTransformView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PUUserTransformView *)self untransformedContentFrame];
  double v12 = v11;
  double v14 = v13;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  double v15 = CGRectGetWidth(v17) / v12;
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  double result = CGRectGetHeight(v18) / v14;
  if (v15 >= result) {
    return v15;
  }
  return result;
}

- (double)doubleTapZoomScale
{
  [(PUUserTransformView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(PUUserTransformView *)self untransformedContentFrame];
  double v8 = v7;
  double v10 = v9;
  double v11 = objc_opt_class();
  double v12 = +[PUOneUpSettings sharedInstance];
  [v12 doubleTapZoomFactor];
  objc_msgSend(v11, "doubleTapZoomScaleForContentSize:inBoundsSize:defaultScale:preferToFillOnDoubleTap:", -[PUUserTransformView preferToFillOnDoubleTap](self, "preferToFillOnDoubleTap"), v8, v10, v4, v6, v13);
  double v15 = v14;

  return v15;
}

- (void)setHostedView:(id)a3
{
  double v5 = (UIView *)a3;
  p_hostedView = &self->_hostedView;
  hostedView = self->_hostedView;
  double v9 = v5;
  if (hostedView != v5)
  {
    [(UIView *)hostedView removeFromSuperview];
    objc_storeStrong((id *)&self->_hostedView, a3);
    if (*p_hostedView)
    {
      double v8 = [(PUUserTransformView *)self scrollContentView];
      [v8 bounds];
      -[UIView setFrame:](*p_hostedView, "setFrame:");
      [v8 addSubview:*p_hostedView];
    }
  }
}

- (void)_setUpdatingScrollView:(BOOL)a3
{
  if (self->__updatingScrollView != a3)
  {
    self->__updatingScrollView = a3;
    if (!a3) {
      [(PUUserTransformView *)self _invalidateContentState];
    }
  }
}

- (void)_updateScrollViewIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateScrollView])
  {
    [(PUUserTransformView *)self _setNeedsUpdateScrollView:0];
    [(PUUserTransformView *)self contentPixelSize];
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      BOOL v3 = [(PUUserTransformView *)self _isUpdatingScrollView];
      [(PUUserTransformView *)self _setUpdatingScrollView:1];
      [(PUUserTransformView *)self bounds];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(PUUserTransformView *)self untransformedContentFrame];
      CGFloat v13 = v12;
      CGFloat v89 = v14;
      double v16 = v15;
      double v18 = v17;
      [(PUUserTransformView *)self contentPixelSize];
      double v20 = v19;
      double v21 = +[PUOneUpSettings sharedInstance];
      int v22 = [v21 useDebuggingColors];

      double v23 = [(PUUserTransformView *)self _scrollView];
      double v24 = v23;
      if (!v23)
      {
        double v24 = -[_PUUserTransformScrollView initWithFrame:]([_PUUserTransformScrollView alloc], "initWithFrame:", v5, v7, v9, v11);
        [(_PUUserTransformScrollView *)v24 setScrollsToTop:0];
        [(_PUUserTransformScrollView *)v24 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
        [(_PUUserTransformScrollView *)v24 setPreservesCenterDuringRotation:1];
        [(_PUUserTransformScrollView *)v24 setShowsHorizontalScrollIndicator:0];
        [(_PUUserTransformScrollView *)v24 setShowsVerticalScrollIndicator:0];
        [(_PUUserTransformScrollView *)v24 setDelegate:self];
        if (v22)
        {
          v25 = [(_PUUserTransformScrollView *)v24 layer];
          id v26 = [MEMORY[0x1E4FB1618] blueColor];
          objc_msgSend(v25, "setBorderColor:", objc_msgSend(v26, "CGColor"));

          v27 = [(_PUUserTransformScrollView *)v24 layer];
          [v27 setBorderWidth:2.0];
        }
        [(PUUserTransformView *)self addSubview:v24];
        objc_storeStrong((id *)&self->__scrollView, v24);
      }
      CGFloat v90 = v11;
      CGFloat v88 = v9;
      [(PUUserTransformView *)self _updateScrollViewFrame];
      v28 = [(PUUserTransformView *)self scrollContentView];
      v29 = (long long *)MEMORY[0x1E4F1DAD8];
      if (!v28)
      {
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v16, v18);
        v28 = v30;
        if (v22)
        {
          v31 = [v30 layer];
          id v32 = [MEMORY[0x1E4FB1618] purpleColor];
          objc_msgSend(v31, "setBorderColor:", objc_msgSend(v32, "CGColor"));

          v33 = [v28 layer];
          [v33 setBorderWidth:5.0];
        }
        [(_PUUserTransformScrollView *)v24 addSubview:v28];
        objc_storeStrong((id *)&self->_scrollContentView, v28);
        v34 = [(PUUserTransformView *)self debugScrollViewContentImage];
        v35 = [v28 layer];
        id v36 = v34;
        objc_msgSend(v35, "setContents:", objc_msgSend(v36, "CGImage"));

        v37 = [(PUUserTransformView *)self hostedView];
        if (v37)
        {
          [v28 bounds];
          -[UIView setFrame:](self->_hostedView, "setFrame:");
          [v28 addSubview:self->_hostedView];
          if (v22)
          {
            id v38 = [MEMORY[0x1E4FB1618] greenColor];
            uint64_t v39 = [v38 CGColor];
            [v37 layer];
            id v85 = v36;
            v40 = v23;
            v42 = BOOL v41 = v3;
            [v42 setBorderColor:v39];

            BOOL v3 = v41;
            double v23 = v40;
            id v36 = v85;

            v43 = [v37 layer];
            v44 = v43;
            double v45 = 1.0;
          }
          else
          {
            v46 = [v37 layer];
            [v46 setBorderColor:0];

            v43 = [v37 layer];
            v44 = v43;
            double v45 = 0.0;
          }
          [v43 setBorderWidth:v45];
        }
        v29 = (long long *)MEMORY[0x1E4F1DAD8];
      }
      [(PUUserTransformView *)self minimumZoomScale];
      double v48 = v47;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v101 = 0u;
      [(PUUserTransformView *)self userAffineTransform];
      long long v100 = *v29;
      double v81 = v48;
      double v99 = v48;
      v98[0] = v101;
      v98[1] = v102;
      v98[2] = v103;
      PUDecomposeTransform((uint64_t)v98, &v100, &v99, 0, 0);
      v104.origin.double x = v13;
      v104.origin.double y = v89;
      v104.size.double width = v16;
      double v49 = v18;
      v104.size.double height = v18;
      double MidX = CGRectGetMidX(v104);
      v105.origin.double x = v13;
      v105.origin.double y = v89;
      v105.size.double width = v16;
      v105.size.double height = v18;
      CGFloat MidY = CGRectGetMidY(v105);
      CGFloat v52 = v13;
      CGFloat v53 = v16 * v99;
      CGFloat v54 = v18 * v99;
      CGFloat v83 = *(double *)&v100 + MidX - v16 * v99 * 0.5;
      CGFloat v86 = MidY - v54 * 0.5 + *((double *)&v100 + 1);
      v106.origin.double x = v52;
      v106.origin.double y = v89;
      v106.size.double width = v16;
      v106.size.double height = v49;
      v112.origin.double x = v5;
      v112.origin.double y = v7;
      v112.size.double width = v88;
      v112.size.double height = v90;
      CGRectUnion(v106, v112);
      v107.origin.double x = v83;
      v107.origin.double y = v86;
      v107.size.double width = v53;
      v107.size.double height = v54;
      v113.origin.double x = v5;
      v113.origin.double y = v7;
      v113.size.double width = v88;
      v113.size.double height = v90;
      CGRectUnion(v107, v113);
      [(PUUserTransformView *)self _contentInsetsForContentScale:v99];
      double v84 = v56;
      double v87 = v55;
      double v82 = v57;
      double v80 = v58;
      -[PUUserTransformView _contentOffsetAdjustmentForContentInsets:](self, "_contentOffsetAdjustmentForContentInsets:");
      v108.origin.double x = v5;
      v108.origin.double y = v7;
      v108.size.double width = v88;
      v108.size.double height = v90;
      double v59 = CGRectGetWidth(v108) / v16;
      v109.origin.double x = v5;
      v109.origin.double y = v7;
      v109.size.double width = v88;
      v109.size.double height = v90;
      double v60 = CGRectGetHeight(v109) / v49;
      if (v59 < v60) {
        double v59 = v60;
      }
      v61 = [(PUUserTransformView *)self window];
      v62 = [v61 screen];
      if (v62)
      {
        v63 = [(PUUserTransformView *)self window];
        v64 = [v63 screen];
        [v64 scale];
        double v66 = v65;
      }
      else
      {
        v63 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v63 scale];
        double v66 = v67;
      }

      if (v66 <= 0.0) {
        double v68 = 1.0;
      }
      else {
        double v68 = v66;
      }
      double v69 = v20 / (v16 * v68);
      v70 = +[PUOneUpSettings sharedInstance];
      [v70 defaultZoomInFactor];
      double v72 = v71;

      if (v69 * v72 >= 1.0) {
        double v59 = v69 * v72;
      }
      if ((_UIAccessibilityZoomTouchEnabled() & (v59 < 60.0)) != 0) {
        double v73 = 60.0;
      }
      else {
        double v73 = v59;
      }
      PXClamp();
      double v99 = v74;
      -[_PUUserTransformScrollView setContentSize:](v24, "setContentSize:", v16, v49);
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke;
      v93[3] = &unk_1E5F2DA30;
      v93[4] = self;
      double v95 = v81;
      double v96 = v73;
      double v97 = v99;
      v75 = v23;
      v94 = v75;
      [(PUUserTransformView *)self _performZoomAndScrollChanges:v93];
      -[_PUUserTransformScrollView setContentInset:](v24, "setContentInset:", v87, v84, v82, v80);
      [(_PUUserTransformScrollView *)v24 contentSize];
      [(_PUUserTransformScrollView *)v24 bounds];
      CGRectGetWidth(v110);
      PXClamp();
      double v77 = v76;
      [(_PUUserTransformScrollView *)v24 contentSize];
      [(_PUUserTransformScrollView *)v24 bounds];
      CGRectGetHeight(v111);
      PXClamp();
      -[_PUUserTransformScrollView setContentOffset:](v24, "setContentOffset:", v77, v78);
      [(PUUserTransformView *)self _updateScrollViewMinimumZoomScaleAndGoToMinimum:0 animated:0];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke_2;
      v91[3] = &unk_1E5F2E120;
      v91[4] = self;
      BOOL v92 = v3;
      [(PUUserTransformView *)self _performStateChanges:v91];
      if ([(PUUserTransformView *)self requireTwoTouchesForPan])
      {
        v79 = [(_PUUserTransformScrollView *)v24 panGestureRecognizer];
        [v79 setMinimumNumberOfTouches:2];
      }
    }
  }
}

void *__48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMinimumZoomScale:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) _setPreferredMinimumZoomScale:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) _setPreferredMaximumZoomScale:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setDesiredZoomScale:*(double *)(a1 + 64)];
  double result = *(void **)(a1 + 32);
  if (result[59] != *(void *)(a1 + 40))
  {
    return (void *)[result _invalidateZoomAndScroll];
  }
  return result;
}

uint64_t __48__PUUserTransformView__updateScrollViewIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateUserAffineTransform];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 _setUpdatingScrollView:v3];
}

- (void)_invalidateScrollView
{
  if (![(PUUserTransformView *)self isUserInteracting])
  {
    [(UIScrollView *)self->__scrollView setDelegate:0];
    [(UIScrollView *)self->__scrollView removeFromSuperview];
    scrollView = self->__scrollView;
    self->__scrollView = 0;

    scrollContentView = self->_scrollContentView;
    self->_scrollContentView = 0;

    [(PUUserTransformView *)self _setNeedsUpdateScrollView:1];
    [(PUUserTransformView *)self setNeedsLayout];
  }
}

- (CGPoint)_contentOffsetAdjustmentForContentInsets:(UIEdgeInsets)a3
{
  double left = a3.left;
  double top = a3.top;
  [(PUUserTransformView *)self scrollPadding];
  double v7 = v5 * 0.5 - left;
  double v8 = v6 * 0.5 - top;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (BOOL)isTrackingZoomGesture
{
  v2 = [(PUUserTransformView *)self _scrollView];
  char v3 = [v2 isZooming];

  return v3;
}

- (UIEdgeInsets)_contentInsetsForContentScale:(double)a3
{
  [(PUUserTransformView *)self scrollPadding];
  double v7 = v6;
  double v8 = v5;
  if (v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v22 = *MEMORY[0x1E4FB2848];
    double v21 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    [(PUUserTransformView *)self untransformedContentFrame];
    double v11 = v10 * a3;
    double v13 = v12 * a3;
    double v14 = [(PUUserTransformView *)self _scrollView];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    double v19 = fmax((v18 - v13) * 0.5, 0.0) + v8 * 0.5;
    double v20 = fmax((v16 - v11) * 0.5, 0.0) + v7 * 0.5;
    double v21 = v20;
    double v22 = v19;
  }
  result.right = v20;
  result.bottom = v19;
  result.double left = v21;
  result.double top = v22;
  return result;
}

- (void)_updateZoomAndScrollIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateZoomAndScroll])
  {
    [(PUUserTransformView *)self _setNeedsUpdateZoomAndScroll:0];
    if (![(PUUserTransformView *)self isUserInteracting])
    {
      char v3 = [(PUUserTransformView *)self enabledInteractions];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __51__PUUserTransformView__updateZoomAndScrollIfNeeded__block_invoke;
      v4[3] = &unk_1E5F2DA08;
      v4[4] = self;
      char v5 = v3 & 1;
      BOOL v6 = (v3 & 4) != 0;
      BOOL v7 = (v3 & 2) != 0;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
    }
  }
}

void __51__PUUserTransformView__updateZoomAndScrollIfNeeded__block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _scrollView];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  [*(id *)(a1 + 32) desiredZoomScale];
  double v4 = v3;
  double v5 = v3;
  if (*(unsigned char *)(a1 + 41))
  {
    [*(id *)(a1 + 32) minimumZoomScale];
    double v5 = v6;
  }
  double v7 = v4;
  if (*(unsigned char *)(a1 + 42))
  {
    [*(id *)(a1 + 32) _preferredMaximumZoomScale];
    double v7 = v8;
  }
  [v9 setScrollEnabled:v2 != 0];
  [v9 setMinimumZoomScale:v5];
  [v9 setMaximumZoomScale:v7];
  [v9 setZoomScale:v4];
}

- (void)_invalidateZoomAndScroll
{
}

- (void)_assertInsideZoomAndScrollChangeBlock
{
  if ([(PUUserTransformView *)self _numberOfNestedZoomAndScrollChanges] <= 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUUserTransformView.m" lineNumber:845 description:@"not within a zoom and scroll change block"];
  }
}

- (void)_setPreferredMaximumZoomScale:(double)a3
{
  [(PUUserTransformView *)self _assertInsideZoomAndScrollChangeBlock];
  if (self->__preferredMaximumZoomScale != a3)
  {
    self->__preferredMaximumZoomScale = a3;
    [(PUUserTransformView *)self _invalidateZoomAndScroll];
  }
}

- (void)_setPreferredMinimumZoomScale:(double)a3
{
  [(PUUserTransformView *)self _assertInsideZoomAndScrollChangeBlock];
  if (self->__preferredMinimumZoomScale != a3)
  {
    self->__preferredMinimumZoomScale = a3;
    [(PUUserTransformView *)self _invalidateZoomAndScroll];
  }
}

- (void)setDesiredZoomScale:(double)a3
{
  [(PUUserTransformView *)self _assertInsideZoomAndScrollChangeBlock];
  if (self->_desiredZoomScale != a3)
  {
    self->_desiredZoomScale = a3;
    [(PUUserTransformView *)self _invalidateZoomAndScroll];
  }
}

- (void)_setEnabledInteractions:(unint64_t)a3
{
  [(PUUserTransformView *)self _assertInsideZoomAndScrollChangeBlock];
  if (self->_enabledInteractions != a3)
  {
    self->_enabledInteractions = a3;
    [(PUUserTransformView *)self _invalidateZoomAndScroll];
  }
}

- (void)_performZoomAndScrollChanges:(id)a3
{
  double v7 = (void (**)(void))a3;
  if (!v7)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 791, @"Invalid parameter not satisfying: %@", @"changeBlock" object file lineNumber description];
  }
  int64_t v5 = [(PUUserTransformView *)self _numberOfNestedZoomAndScrollChanges];
  [(PUUserTransformView *)self _setNumberOfNestedZoomAndScrollChanges:v5 + 1];
  v7[2]();
  [(PUUserTransformView *)self _setNumberOfNestedZoomAndScrollChanges:v5];
  if (!v5) {
    [(PUUserTransformView *)self _updateZoomAndScrollIfNeeded];
  }
}

- (void)_updateUserAffineTransformIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateUserAffineTransform])
  {
    [(PUUserTransformView *)self _setNeedsUpdateUserAffineTransform:0];
    if (![(PUUserTransformView *)self _isUpdatingScrollView])
    {
      [(PUUserTransformView *)self bounds];
      PXRectGetCenter();
      double v4 = v3;
      double v6 = v5;
      [(PUUserTransformView *)self _contentCenter];
      CGFloat v8 = v7 - v4;
      CGFloat v10 = v9 - v6;
      [(PUUserTransformView *)self _contentZoomScale];
      CGFloat v12 = v11;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v16.c = v13;
      *(_OWORD *)&v16.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
      *(_OWORD *)&v15.c = v13;
      *(_OWORD *)&v15.tdouble x = *(_OWORD *)&v16.tx;
      CGAffineTransformTranslate(&v16, &v15, v8, v10);
      CGAffineTransform v14 = v16;
      CGAffineTransformScale(&v15, &v14, v12, v12);
      CGAffineTransform v16 = v15;
      [(PUUserTransformView *)self _setUserAffineTransform:&v15];
    }
  }
}

- (void)_invalidateUserAffineTransform
{
  [(PUUserTransformView *)self _setNeedsUpdateUserAffineTransform:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (void)_updateAnimatingZoomEndIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateAnimatingZoomEnd])
  {
    [(PUUserTransformView *)self _setNeedsUpdateAnimatingZoomEnd:0];
    BOOL v3 = [(PUUserTransformView *)self _isContentAnimating];
    BOOL v4 = 0;
    if (v3) {
      BOOL v4 = [(PUUserTransformView *)self _isUserEndingZoom];
    }
    [(PUUserTransformView *)self _setAnimatingZoomEnd:v4];
  }
}

- (void)_invalidateAnimatingZoomEnd
{
  [(PUUserTransformView *)self _setNeedsUpdateAnimatingZoomEnd:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (double)_currentPresentationZoomScale
{
  BOOL v3 = [(PUUserTransformView *)self scrollContentView];
  BOOL v4 = [v3 layer];

  double v5 = [v4 presentationLayer];
  double v6 = [(PUUserTransformView *)self _scrollView];
  double v7 = [v6 layer];

  if (v4)
  {
    [v4 transform];
    double v8 = *(double *)&v25;
    if (v5)
    {
LABEL_3:
      [v5 transform];
      double v9 = *(double *)&v17;
      goto LABEL_6;
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v8 = 0.0;
    long long v25 = 0u;
    long long v26 = 0u;
    if (v5) {
      goto LABEL_3;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v9 = 0.0;
  long long v17 = 0u;
  long long v18 = 0u;
LABEL_6:
  CGFloat v10 = objc_msgSend(v4, "animationKeys", v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
  if (![v10 count])
  {
    double v11 = [v5 animationKeys];
    if (![v11 count])
    {
      CGFloat v12 = [v7 animationKeys];
      if (![v12 count])
      {
        CGAffineTransform v14 = [v7 presentationLayer];
        CGAffineTransform v15 = [v14 animationKeys];
        uint64_t v16 = [v15 count];

        if (!v16) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  double v8 = v9;
LABEL_13:

  return v8;
}

- (void)_updateContentStateIfNeeded
{
  if (![(PUUserTransformView *)self _needsUpdateContentState]) {
    return;
  }
  [(PUUserTransformView *)self _setNeedsUpdateContentState:0];
  BOOL v3 = [(PUUserTransformView *)self scrollContentView];

  if (!v3) {
    return;
  }
  BOOL v4 = [(PUUserTransformView *)self layer];
  double v5 = [(PUUserTransformView *)self scrollContentView];
  double v6 = [v5 layer];

  uint64_t v7 = [v6 presentationLayer];
  double v8 = (void *)v7;
  if (v7) {
    double v9 = (void *)v7;
  }
  else {
    double v9 = v6;
  }
  id v10 = v9;

  double v11 = [(PUUserTransformView *)self _scrollView];
  CGFloat v12 = [v11 layer];

  [v6 bounds];
  PXRectGetCenter();
  objc_msgSend(v4, "convertPoint:fromLayer:", v6);
  double v14 = v13;
  double v16 = v15;
  [v10 bounds];
  PXRectGetCenter();
  objc_msgSend(v4, "convertPoint:fromLayer:", v10);
  double v18 = v17;
  double v20 = v19;
  if (!v6)
  {
    double v21 = 0.0;
    if (v10) {
      goto LABEL_8;
    }
LABEL_10:
    double v22 = 0.0;
    goto LABEL_11;
  }
  [v6 transform];
  double v21 = v39;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_8:
  [v10 transform];
  double v22 = v38;
LABEL_11:
  long long v23 = [v6 animationKeys];
  if ([v23 count])
  {

    [(PUUserTransformView *)self _setContentAnimating:1];
  }
  else
  {
    long long v24 = [v10 animationKeys];
    if ([v24 count])
    {
      BOOL v25 = 1;
    }
    else
    {
      long long v26 = [v12 animationKeys];
      if ([v26 count])
      {
        BOOL v25 = 1;
      }
      else
      {
        v37 = [v12 presentationLayer];
        long long v27 = [v37 animationKeys];
        BOOL v25 = [v27 count] != 0;
      }
    }

    [(PUUserTransformView *)self _setContentAnimating:v25];
    if (!v25)
    {
      double v22 = v21;
      double v18 = v14;
      double v20 = v16;
    }
  }
  -[PUUserTransformView _setContentCenter:](self, "_setContentCenter:", v18, v20);
  [(PUUserTransformView *)self _setContentZoomScale:v22];
  [(PUUserTransformView *)self _contentZoomScale];
  -[PUUserTransformView _contentInsetsForContentScale:](self, "_contentInsetsForContentScale:");
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  id v36 = [(PUUserTransformView *)self _scrollView];
  objc_msgSend(v36, "setContentInset:", v29, v31, v33, v35);
}

- (void)_invalidateContentState
{
  [(PUUserTransformView *)self _setNeedsUpdateContentState:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (void)_updateShouldTrackContentAnimationIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateShouldTrackContentAnimation])
  {
    [(PUUserTransformView *)self _setNeedsUpdateShouldTrackContentAnimation:0];
    BOOL v3 = [(PUUserTransformView *)self _isContentAnimating];
    [(PUUserTransformView *)self _setShouldTrackContentAnimation:v3];
  }
}

- (void)_invalidateShouldTrackContentAnimation
{
  [(PUUserTransformView *)self _setNeedsUpdateShouldTrackContentAnimation:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (void)_updateUserInteractingIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateUserInteracting])
  {
    [(PUUserTransformView *)self _setNeedsUpdateUserInteracting:0];
    BOOL v3 = [(PUUserTransformView *)self _isUserPanningOrDecelerating]
      || [(PUUserTransformView *)self _isUserZoomingOrBouncing];
    [(PUUserTransformView *)self _setUserInteracting:v3];
  }
}

- (void)_invalidateUserInteracting
{
  [(PUUserTransformView *)self _setNeedsUpdateUserInteracting:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (void)_updateUserZoomingOrBouncingIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateUserZoomingOrBouncing])
  {
    [(PUUserTransformView *)self _setNeedsUpdateUserZoomingOrBouncing:0];
    BOOL v3 = [(PUUserTransformView *)self _isUserZooming]
      || [(PUUserTransformView *)self _isUserEndingZoom]
      || [(PUUserTransformView *)self _isAnimatingZoomEnd];
    [(PUUserTransformView *)self _setUserZoomingOrBouncing:v3];
  }
}

- (void)_invalidateUserZoomingOrBouncing
{
  [(PUUserTransformView *)self _setNeedsUpdateUserZoomingOrBouncing:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (void)_updateUserPanningOrDeceleratingIfNeeded
{
  if ([(PUUserTransformView *)self _needsUpdateUserPanningOrDecelerating])
  {
    [(PUUserTransformView *)self _setNeedsUpdateUserPanningOrDecelerating:0];
    BOOL v3 = [(PUUserTransformView *)self _isUserPanning]
      || [(PUUserTransformView *)self _isUserDeceleratingPan];
    [(PUUserTransformView *)self _setUserPanningOrDecelerating:v3];
  }
}

- (void)_invalidateUserPanningOrDecelerating
{
  [(PUUserTransformView *)self _setNeedsUpdateUserPanningOrDecelerating:1];
  [(PUUserTransformView *)self _setNeedsStateUpdate];
}

- (void)_setUserAffineTransform:(CGAffineTransform *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v6 = *(_OWORD *)&self->_userAffineTransform.c;
  *(_OWORD *)&v16.a = *(_OWORD *)&self->_userAffineTransform.a;
  *(_OWORD *)&v16.c = v6;
  *(_OWORD *)&v16.tdouble x = *(_OWORD *)&self->_userAffineTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v16))
  {
    long long v7 = *(_OWORD *)&a3->a;
    long long v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_userAffineTransform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_userAffineTransform.tdouble x = v8;
    *(_OWORD *)&self->_userAffineTransform.a = v7;
    double v9 = PLOneUpGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      long long v10 = *(_OWORD *)&a3->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&t1.c = v10;
      *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
      double v11 = NSStringFromCGAffineTransform(&t1);
      LODWORD(t1.a) = 134218242;
      *(void *)((char *)&t1.a + 4) = self;
      WORD2(t1.b) = 2112;
      *(void *)((char *)&t1.b + 6) = v11;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "%p userAffineTransform=%@", (uint8_t *)&t1, 0x16u);
    }
    BOOL v12 = [(PUUserTransformView *)self isUserInteracting];
    uint64_t v13 = [(PUUserTransformView *)self _wasUserInteractingBeforeStateUpdate] | v12;
    double v14 = [(PUUserTransformView *)self delegate];
    long long v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
    [v14 userTransformView:self didChangeUserAffineTransform:&t1 isUserInteracting:v13];
  }
}

- (void)_setAnimatingZoomEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->__isAnimatingZoomEnd != v3)
  {
    self->__isAnimatingZoomEnd = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      long long v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isAnimatingZoomEnd=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserZoomingOrBouncing];
  }
}

- (void)_setContentZoomScale:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->__contentZoomScale != a3)
  {
    long long v5 = [(PUUserTransformView *)self _scrollView];
    int v6 = [v5 isZooming];

    if (v6)
    {
      [(PUUserTransformView *)self minimumZoomScale];
      [(PUUserTransformView *)self setHasUserZoomedIn:v7 < a3];
    }
    self->__contentZoomScale = a3;
    __int16 v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134218240;
      uint64_t v10 = self;
      __int16 v11 = 2048;
      double v12 = a3;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "%p contentZoomScale=%f", (uint8_t *)&v9, 0x16u);
    }

    [(PUUserTransformView *)self _invalidateUserAffineTransform];
  }
}

- (void)_setContentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (x != self->__contentCenter.x || y != self->__contentCenter.y)
  {
    self->__contentCenter.double x = x;
    self->__contentCenter.double y = y;
    double v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14.double x = x;
      v14.double y = y;
      __int16 v8 = NSStringFromCGPoint(v14);
      int v9 = 134218242;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      double v12 = v8;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "%p contentCenter=%@", (uint8_t *)&v9, 0x16u);
    }
    [(PUUserTransformView *)self _invalidateUserAffineTransform];
  }
}

- (void)_setContentAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->__isContentAnimating != v3)
  {
    self->__isContentAnimating = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      double v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isContentAnimating=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateAnimatingZoomEnd];
    [(PUUserTransformView *)self _invalidateShouldTrackContentAnimation];
  }
}

- (void)_setShouldTrackContentAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->__shouldTrackContentAnimation != v3)
  {
    self->__shouldTrackContentAnimation = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      double v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p shouldTrackContentAnimation=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _updateDisplayLink];
  }
}

- (void)_setUserInteracting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->_isUserInteracting != v3)
  {
    self->_isUserInteracting = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      __int16 v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserInteracting=%i", (uint8_t *)&v7, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserAffineTransform];
    if (self->_delegateFlags.respondsToDidChangeIsUserInteracting)
    {
      int v6 = [(PUUserTransformView *)self delegate];
      [v6 userTransformView:self didChangeIsUserInteracting:v3];
    }
  }
}

- (void)_setUserZoomingOrBouncing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->__isUserZoomingOrBouncing != v3)
  {
    self->__isUserZoomingOrBouncing = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserZoomingOrBouncing=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserInteracting];
  }
}

- (void)_setUserPanningOrDecelerating:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateUpdate];
  if (self->__isUserPanningOrDecelerating != v3)
  {
    self->__isUserPanningOrDecelerating = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserPanningOrDecelerating=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserInteracting];
  }
}

- (void)_setUserEndingZoom:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateChangeBlock];
  if (self->__isUserEndingZoom != v3)
  {
    self->__isUserEndingZoom = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserEndingZoom=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserZoomingOrBouncing];
    if (v3) {
      [(PUUserTransformView *)self _invalidateAnimatingZoomEnd];
    }
  }
}

- (void)_updateEnabledInteractionsIfNeeded
{
  if ([(PUUserTransformView *)self needsUpdateEnabledInteractions])
  {
    [(PUUserTransformView *)self setNeedsUpdateEnabledInteractions:0];
    if ([(PUUserTransformView *)self _isUserZooming])
    {
      [(PUUserTransformView *)self setEnabledInteractions:7];
    }
  }
}

- (void)_invalidateEnabledInteractions
{
}

- (void)_setUserZooming:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateChangeBlock];
  if (self->__isUserZooming != v3)
  {
    self->__isUserZooming = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserZooming=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserZoomingOrBouncing];
    if (v3) {
      [(PUUserTransformView *)self _invalidateEnabledInteractions];
    }
  }
}

- (void)_setUserDeceleratingPan:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateChangeBlock];
  if (self->__isUserDeceleratingPan != v3)
  {
    self->__isUserDeceleratingPan = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserDeceleratingPan=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserPanningOrDecelerating];
  }
}

- (void)_setUserPanning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PUUserTransformView *)self _assertInsideStateChangeBlock];
  if (self->__isUserPanning != v3)
  {
    self->__isUserPanning = v3;
    long long v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%p isUserPanning=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PUUserTransformView *)self _invalidateUserPanningOrDecelerating];
  }
}

- (void)_setNeedsStateUpdate
{
  if (![(PUUserTransformView *)self _isUpdatingState]
    && [(PUUserTransformView *)self _numberOfNestedStateChanges] <= 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUUserTransformView.m" lineNumber:445 description:@"not within a state update or change block"];
  }
}

- (BOOL)_needsStateUpdate
{
  if ([(PUUserTransformView *)self _needsUpdateUserPanningOrDecelerating]
    || [(PUUserTransformView *)self _needsUpdateUserZoomingOrBouncing]
    || [(PUUserTransformView *)self _needsUpdateUserInteracting]
    || [(PUUserTransformView *)self _needsUpdateShouldTrackContentAnimation]
    || [(PUUserTransformView *)self _needsUpdateUserAffineTransform]
    || [(PUUserTransformView *)self _needsUpdateContentState])
  {
    return 1;
  }
  return [(PUUserTransformView *)self _needsUpdateAnimatingZoomEnd];
}

- (void)_updateStateIfNeeded
{
  if (![(PUUserTransformView *)self _isUpdatingScrollView])
  {
    if ([(PUUserTransformView *)self _needsStateUpdate])
    {
      BOOL v4 = [(PUUserTransformView *)self _isUpdatingState];
      [(PUUserTransformView *)self _setUpdatingState:1];
      [(PUUserTransformView *)self _setWasUserInteractingBeforeStateUpdate:[(PUUserTransformView *)self isUserInteracting]];
      [(PUUserTransformView *)self _updateUserPanningOrDeceleratingIfNeeded];
      [(PUUserTransformView *)self _updateContentStateIfNeeded];
      [(PUUserTransformView *)self _updateAnimatingZoomEndIfNeeded];
      [(PUUserTransformView *)self _updateUserZoomingOrBouncingIfNeeded];
      [(PUUserTransformView *)self _updateUserInteractingIfNeeded];
      [(PUUserTransformView *)self _updateShouldTrackContentAnimationIfNeeded];
      [(PUUserTransformView *)self _updateUserAffineTransformIfNeeded];
      [(PUUserTransformView *)self _updateEnabledInteractionsIfNeeded];
      [(PUUserTransformView *)self _setUpdatingState:v4];
      if ([(PUUserTransformView *)self _needsStateUpdate])
      {
        id v5 = [MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:a2 object:self file:@"PUUserTransformView.m" lineNumber:427 description:@"state updates still needed after an update cycle"];
      }
    }
  }
}

- (void)_didChangeState
{
  int64_t v3 = [(PUUserTransformView *)self _numberOfNestedStateChanges] - 1;
  [(PUUserTransformView *)self _setNumberOfNestedStateChanges:v3];
  if (!v3)
  {
    [(PUUserTransformView *)self _updateStateIfNeeded];
  }
}

- (void)_willChangeState
{
  int64_t v3 = [(PUUserTransformView *)self _numberOfNestedStateChanges] + 1;
  [(PUUserTransformView *)self _setNumberOfNestedStateChanges:v3];
}

- (void)_performStateChanges:(id)a3
{
  int v6 = (void (**)(void))a3;
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 381, @"Invalid parameter not satisfying: %@", @"changeBlock" object file lineNumber description];
  }
  [(PUUserTransformView *)self _willChangeState];
  v6[2]();
  [(PUUserTransformView *)self _didChangeState];
}

- (void)_assertInsideStateUpdate
{
  if (![(PUUserTransformView *)self _isUpdatingState])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUUserTransformView.m" lineNumber:377 description:@"not within a state update"];
  }
}

- (void)_assertInsideStateChangeBlock
{
  if ([(PUUserTransformView *)self _numberOfNestedStateChanges] <= 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUUserTransformView.m" lineNumber:372 description:@"not within a state change block"];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)PUUserTransformView;
  if (!-[PUUserTransformView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, a4)) {
    return 0;
  }
  if (!self->_delegateFlags.respondsToShouldReceiveTouchAtPoint) {
    return 1;
  }
  int v7 = [(PUUserTransformView *)self delegate];
  char v8 = objc_msgSend(v7, "userTransformView:shouldReceiveTouchAtPoint:", self, x, y);

  return v8;
}

- (void)_updateScrollViewFrame
{
  [(PUUserTransformView *)self bounds];
  [(PUUserTransformView *)self offset];
  PXRectGetCenter();
  PXPointAdd();
  double v4 = v3;
  double v6 = v5;
  id v8 = [(PUUserTransformView *)self _scrollView];
  int v7 = [v8 layer];
  objc_msgSend(v7, "setPosition:", v4, v6);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PUUserTransformView;
  [(PUUserTransformView *)&v13 layoutSubviews];
  [(PUUserTransformView *)self _updateScrollViewFrame];
  double v3 = [(PUUserTransformView *)self _scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  [(PUUserTransformView *)self bounds];
  double v9 = v8;
  double v11 = v10;

  if (v5 != v9 || v7 != v11) {
    [(PUUserTransformView *)self _setNeedsUpdateScrollView:1];
  }
  [(PUUserTransformView *)self _updateScrollViewIfNeeded];
}

- (void)setDebugScrollViewContentImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_debugScrollViewContentImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_debugScrollViewContentImage, a3);
    [(PUUserTransformView *)self _invalidateScrollView];
    double v5 = v6;
  }
}

- (void)zoomOut:(BOOL)a3
{
  if (([(PUUserTransformView *)self enabledInteractions] & 4) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__PUUserTransformView_zoomOut___block_invoke;
    v5[3] = &unk_1E5F2E120;
    v5[4] = self;
    BOOL v6 = a3;
    [(PUUserTransformView *)self _performZoomAndScrollChanges:v5];
  }
}

void __31__PUUserTransformView_zoomOut___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasUserZoomedIn:0];
  id v4 = [*(id *)(a1 + 32) _scrollView];
  [v4 minimumZoomScale];
  double v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setDesiredZoomScale:");
  [v4 setZoomScale:*(unsigned __int8 *)(a1 + 40) animated:v3];
  [*(id *)(a1 + 32) _setEnabledInteractions:7];
}

- (void)zoomInOnLocationFromProvider:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (([(PUUserTransformView *)self enabledInteractions] & 2) != 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__PUUserTransformView_zoomInOnLocationFromProvider_animated___block_invoke;
    v7[3] = &unk_1E5F2DCD0;
    v7[4] = self;
    id v8 = v6;
    BOOL v9 = a4;
    [(PUUserTransformView *)self _performZoomAndScrollChanges:v7];
  }
}

void __61__PUUserTransformView_zoomInOnLocationFromProvider_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasUserZoomedIn:1];
  id v18 = [*(id *)(a1 + 32) _scrollView];
  double v2 = [*(id *)(a1 + 32) scrollContentView];
  double v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 locationInView:v2];
  }
  else
  {
    [v18 bounds];
    PXRectGetCenter();
  }
  [*(id *)(a1 + 32) doubleTapZoomScale];
  double v5 = v4;
  [v2 bounds];
  PXRectWithCenterAndSize();
  [v18 bounds];
  PURectGetAspectRatio(v6, v7, v8, v9);
  PXRectWithAspectRatioFillingRect();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [*(id *)(a1 + 32) setDesiredZoomScale:v5];
  objc_msgSend(v18, "zoomToRect:animated:", *(unsigned __int8 *)(a1 + 48), v11, v13, v15, v17);
  [*(id *)(a1 + 32) _setEnabledInteractions:7];
}

- (void)zoomInOnLocationFromProvider:(id)a3
{
}

- (void)toggleZoomWithLocationProvider:(id)a3
{
  id v4 = a3;
  if ([(PUUserTransformView *)self hasUserZoomedIn]) {
    [(PUUserTransformView *)self zoomInOnLocationFromProvider:v4];
  }
  else {
    [(PUUserTransformView *)self zoomOut:1];
  }
}

- (void)setOffset:(CGPoint)a3 animated:(BOOL)a4
{
  if (a3.x != self->_offset.x || a3.y != self->_offset.y)
  {
    self->_offset = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__PUUserTransformView_setOffset_animated___block_invoke;
    v5[3] = &unk_1E5F2E120;
    v5[4] = self;
    BOOL v6 = a4;
    [(PUUserTransformView *)self _performStateChanges:v5];
  }
}

uint64_t __42__PUUserTransformView_setOffset_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateContentState];
  if (*(unsigned char *)(a1 + 40))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__PUUserTransformView_setOffset_animated___block_invoke_2;
    v4[3] = &unk_1E5F2ED10;
    v4[4] = *(void *)(a1 + 32);
    return [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.3];
  }
  else
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _updateScrollViewFrame];
  }
}

uint64_t __42__PUUserTransformView_setOffset_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScrollViewFrame];
}

- (void)setOffset:(CGPoint)a3
{
}

- (BOOL)contentContainsLocationFromProvider:(id)a3
{
  id v4 = a3;
  double v5 = [(PUUserTransformView *)self scrollContentView];
  if (v5)
  {
    [v4 locationInView:v5];
    char v6 = objc_msgSend(v5, "pointInside:withEvent:", 0);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_updateScrollViewMinimumZoomScaleAndGoToMinimum:(BOOL)a3 animated:(BOOL)a4
{
  [(PUUserTransformView *)self minimumZoomScale];
  uint64_t v8 = v7;
  CGFloat v9 = [(PUUserTransformView *)self _scrollView];
  [v9 zoomScale];
  uint64_t v11 = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke;
  aBlock[3] = &unk_1E5F2D968;
  aBlock[4] = self;
  aBlock[5] = v8;
  BOOL v28 = a4;
  double v12 = _Block_copy(aBlock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_2;
  v24[3] = &unk_1E5F2E0A8;
  id v25 = v9;
  uint64_t v26 = v8;
  id v13 = v9;
  double v14 = _Block_copy(v24);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_3;
  v17[3] = &unk_1E5F2D9E0;
  BOOL v22 = a3;
  uint64_t v20 = v8;
  uint64_t v21 = v11;
  BOOL v23 = a4;
  v17[4] = self;
  id v18 = v12;
  id v19 = v14;
  id v15 = v14;
  id v16 = v12;
  [(PUUserTransformView *)self _performZoomAndScrollChanges:v17];
}

void __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDesiredZoomScale:*(double *)(a1 + 40)];
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v4 = [*(id *)(a1 + 32) _scrollView];
  objc_msgSend(v4, "setContentOffset:", v2, v3);

  id v5 = [*(id *)(a1 + 32) _scrollView];
  [v5 setZoomScale:*(unsigned __int8 *)(a1 + 48) animated:*(double *)(a1 + 40)];
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMinimumZoomScale:*(double *)(a1 + 40)];
}

void __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)
    || ([*(id *)(a1 + 32) _scrollView],
        double v2 = objc_claimAutoreleasedReturnValue(),
        [v2 zoomScale],
        double v4 = v3,
        double v5 = *(double *)(a1 + 56),
        v2,
        v4 < v5))
  {
    [*(id *)(a1 + 32) setHasUserZoomedIn:0];
    if (*(double *)(a1 + 56) <= *(double *)(a1 + 64))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
      if (*(unsigned char *)(a1 + 73))
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_7;
        v12[3] = &unk_1E5F2EBA0;
        id v13 = *(id *)(a1 + 40);
        [v8 animateWithDuration:2 delay:v12 options:0 animations:0.3 completion:0.0];
        uint64_t v7 = v13;
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_8;
        v10[3] = &unk_1E5F2EBA0;
        id v11 = *(id *)(a1 + 40);
        [v8 performWithoutAnimation:v10];
        uint64_t v7 = v11;
      }
    }
    else
    {
      char v6 = (void *)MEMORY[0x1E4FB1EB0];
      if (*(unsigned char *)(a1 + 73))
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_4;
        v19[3] = &unk_1E5F2EBA0;
        id v20 = *(id *)(a1 + 40);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_5;
        v17[3] = &unk_1E5F2D990;
        id v18 = *(id *)(a1 + 48);
        [v6 animateWithDuration:2 delay:v19 options:v17 animations:0.3 completion:0.0];

        uint64_t v7 = v20;
      }
      else
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_6;
        v14[3] = &unk_1E5F2D9B8;
        id v15 = *(id *)(a1 + 40);
        id v16 = *(id *)(a1 + 48);
        [v6 performWithoutAnimation:v14];

        uint64_t v7 = v15;
      }
    }
  }
  else
  {
    CGFloat v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v9();
  }
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PUUserTransformView__updateScrollViewMinimumZoomScaleAndGoToMinimum_animated___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setMinimumZoomScale:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 0.0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUUserTransformView.m", 179, @"Invalid parameter not satisfying: %@", @"minimumZoomScale >= 0" object file lineNumber description];
  }
  double minimumZoomScale = self->_minimumZoomScale;
  if (minimumZoomScale != a3)
  {
    self->_double minimumZoomScale = a3;
    uint64_t v8 = [(PUUserTransformView *)self _scrollView];
    [v8 zoomScale];
    double v10 = v9;

    if (v10 == minimumZoomScale) {
      uint64_t v11 = [(PUUserTransformView *)self isUserInteracting] ^ 1;
    }
    else {
      uint64_t v11 = 0;
    }
    [(PUUserTransformView *)self _updateScrollViewMinimumZoomScaleAndGoToMinimum:v11 animated:v4];
  }
}

- (void)setMinimumZoomScale:(double)a3
{
}

- (void)setScrollPadding:(CGSize)a3
{
  if (a3.width != self->_scrollPadding.width || a3.height != self->_scrollPadding.height)
  {
    self->_scrollPadding = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__PUUserTransformView_setScrollPadding___block_invoke;
    v4[3] = &unk_1E5F2ED10;
    v4[4] = self;
    [(PUUserTransformView *)self _performStateChanges:v4];
  }
}

uint64_t __40__PUUserTransformView_setScrollPadding___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContentState];
}

- (void)setEnabledInteractions:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PUUserTransformView_setEnabledInteractions___block_invoke;
  v3[3] = &unk_1E5F2E0A8;
  v3[4] = self;
  void v3[5] = a3;
  [(PUUserTransformView *)self _performZoomAndScrollChanges:v3];
}

uint64_t __46__PUUserTransformView_setEnabledInteractions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setEnabledInteractions:*(void *)(a1 + 40)];
}

- (void)setUserAffineTransform:(CGAffineTransform *)a3
{
  p_userAffineTransform = &self->_userAffineTransform;
  if ((PUAffineTransformIsApproximatelyEqualToTransform() & 1) == 0)
  {
    long long v6 = *(_OWORD *)&a3->a;
    long long v7 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_userAffineTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_userAffineTransform->tdouble x = v7;
    *(_OWORD *)&p_userAffineTransform->a = v6;
    [(PUUserTransformView *)self _invalidateScrollView];
  }
}

- (void)setUntransformedContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_untransformedContentFrame = &self->_untransformedContentFrame;
  if (!CGRectEqualToRect(a3, self->_untransformedContentFrame))
  {
    p_untransformedContentFrame->origin.CGFloat x = x;
    p_untransformedContentFrame->origin.CGFloat y = y;
    p_untransformedContentFrame->size.CGFloat width = width;
    p_untransformedContentFrame->size.CGFloat height = height;
    [(PUUserTransformView *)self _invalidateScrollView];
  }
}

- (void)setRequireTwoTouchesForPan:(BOOL)a3
{
  if (self->_requireTwoTouchesForPan != a3)
  {
    self->_requireTwoTouchesForPan = a3;
    [(PUUserTransformView *)self _invalidateScrollView];
  }
}

- (void)setContentPixelSize:(CGSize)a3
{
  if (a3.width != self->_contentPixelSize.width || a3.height != self->_contentPixelSize.height)
  {
    self->_contentPixelSize = a3;
    [(PUUserTransformView *)self _invalidateScrollView];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToShouldReceiveTouchAtPoint = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeIsUserInteracting = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeIsZoomedIn = objc_opt_respondsToSelector() & 1;
  }
}

- (PUUserTransformView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUUserTransformView;
  UIEdgeInsets result = -[PUUserTransformView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_userAffineTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_userAffineTransform.c = v5;
    *(_OWORD *)&result->_userAffineTransform.tCGFloat x = *(_OWORD *)(v4 + 32);
    result->_enabledInteractions = 7;
    result->__needsUpdateScrollView = 1;
    result->__preferredMinimumZoomScale = 1.0;
    result->__contentZoomScale = 1.0;
    result->_desiredZoomScale = result->__preferredMinimumZoomScale;
    result->_double minimumZoomScale = result->__preferredMinimumZoomScale;
  }
  return result;
}

+ (double)doubleTapZoomScaleForContentSize:(CGSize)a3 inBoundsSize:(CGSize)a4 defaultScale:(double)a5 preferToFillOnDoubleTap:(BOOL)a6
{
  double width = a3.width;
  double v7 = a4.width / a3.width;
  CGFloat v8 = a4.height / a3.height;
  if (v7 >= a4.height / a3.height) {
    CGFloat v8 = v7;
  }
  if (v8 <= a5) {
    double result = a5;
  }
  else {
    double result = v8;
  }
  if (a3.height != 0.0 && ((double v10 = width / a3.height, v10 > 2.0) || v10 < 0.5) || a6)
  {
    if (v8 > 1.01) {
      return v8;
    }
  }
  return result;
}

@end