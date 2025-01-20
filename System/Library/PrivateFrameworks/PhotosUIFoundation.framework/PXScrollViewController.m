@interface PXScrollViewController
- (BOOL)adjustsContentInsetWhenScrollDisabled;
- (BOOL)allowsKeyboardScrolling;
- (BOOL)alwaysBounceHorizontal;
- (BOOL)alwaysBounceVertical;
- (BOOL)clipsToBounds;
- (BOOL)deferContentOffsetUpdates;
- (BOOL)draggingPerformsScroll;
- (BOOL)hasWindow;
- (BOOL)isAnimatingScroll;
- (BOOL)isAnimatingScrollTowardsEdge;
- (BOOL)isBouncing;
- (BOOL)isDecelerating;
- (BOOL)isDragging;
- (BOOL)isFloatingSublayer:(id)a3;
- (BOOL)isInterruptingScrollWithDirection:(CGPoint *)a3;
- (BOOL)isManuallyChanging;
- (BOOL)isScrollEnabled;
- (BOOL)isScrolledAtEdge:(unsigned int)a3 tolerance:(double)a4;
- (BOOL)isScrubbing;
- (BOOL)isSubview:(id)a3;
- (BOOL)isTracking;
- (BOOL)respectsContentZOrder;
- (BOOL)scrollViewIsAnimatingScroll;
- (BOOL)scrollViewShouldBeginScrollingWithPanAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 velocity:(CGPoint)a5;
- (BOOL)scrollViewShouldScrollToTop;
- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (BOOL)transfersScrollToContainer;
- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3;
- (CGRect)scrollViewActiveRect;
- (CGRect)scrollViewConstrainedVisibleRect;
- (CGRect)scrollViewContentBounds;
- (CGRect)scrollViewTargetRect;
- (CGRect)scrollViewVisibleRect;
- (CGRect)scrollViewVisibleRectOutsideBounds;
- (CGSize)presentedContentSize;
- (CGSize)scrollViewContentSize;
- (CGSize)scrollViewReferenceSize;
- (NSHashTable)_observers;
- (PXAnonymousScrollView)scrollView;
- (PXScrollControllerUpdateDelegate)updateDelegate;
- (PXScrollInfo)scrollInfo;
- (PXScrollViewController)init;
- (PXScrollViewController)initWithFrame:(CGRect)a3;
- (UICoordinateSpace)contentCoordinateSpace;
- (UIEdgeInsets)contentInset;
- (UIEdgeInsets)hitTestContentInsets;
- (UIEdgeInsets)horizontalScrollIndicatorInsets;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (double)horizontalInterPageSpacing;
- (int64_t)activeEdgeScrollAnimations;
- (int64_t)contentInsetAdjustmentBehavior;
- (int64_t)decelerationRate;
- (int64_t)indicatorStyle;
- (void)addFloatingSublayer:(id)a3 forAxis:(int64_t)a4;
- (void)addSubview:(id)a3;
- (void)addSubviewToScrollView:(id)a3;
- (void)applyScrollInfo:(id)a3;
- (void)contentInsetAdjustmentBehaviorDidChange;
- (void)decelerationRateDidChange;
- (void)indicatorStyleDidChange;
- (void)performManualChange:(id)a3;
- (void)registerObserver:(id)a3;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)scrollRectToVisible:(CGRect)a3 avoidingContentInsetEdges:(unint64_t)a4 animated:(BOOL)a5;
- (void)scrollToEdge:(unsigned int)a3 animated:(BOOL)a4;
- (void)scrollToEdge:(unsigned int)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)scrollToEdge:(unsigned int)a3 padding:(UIEdgeInsets)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)scrollViewContentBoundsDidChange;
- (void)scrollViewDidBeginFocusFastScrolling;
- (void)scrollViewDidEndFocusFastScrolling;
- (void)scrollViewDidEndScrolling;
- (void)scrollViewDidEndScrollingAnimation;
- (void)scrollViewDidLayout;
- (void)scrollViewDidScroll;
- (void)scrollViewLayoutIfNeeded;
- (void)scrollViewWillBeginScrolling;
- (void)scrollViewWillBeginScrollingAnimationTowardsContentEdges:(unint64_t)a3;
- (void)scrollViewWillLayout;
- (void)setActiveEdgeScrollAnimations:(int64_t)a3;
- (void)setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3;
- (void)setAllowsKeyboardScrolling:(BOOL)a3;
- (void)setAlwaysBounceHorizontal:(BOOL)a3;
- (void)setAlwaysBounceVertical:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentInsetAdjustmentBehavior:(int64_t)a3;
- (void)setDecelerationRate:(int64_t)a3;
- (void)setDeferContentOffsetUpdates:(BOOL)a3;
- (void)setDraggingPerformsScroll:(BOOL)a3;
- (void)setHitTestContentInsets:(UIEdgeInsets)a3;
- (void)setHorizontalInterPageSpacing:(double)a3;
- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setIndicatorStyle:(int64_t)a3;
- (void)setIsScrollEnabled:(BOOL)a3;
- (void)setPresentedContentSize:(CGSize)a3;
- (void)setRespectsContentZOrder:(BOOL)a3;
- (void)setScrollInfo:(id)a3;
- (void)setScrollViewContentBounds:(CGRect)a3;
- (void)setScrollViewNeedsLayout;
- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setTransfersScrollToContainer:(BOOL)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setVisibleOrigin:(CGPoint)a3;
- (void)stopScrollingAndZoomingAnimations;
- (void)unregisterObserver:(id)a3;
- (void)willEndScrollingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
@end

@implementation PXScrollViewController

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXScrollViewController)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXScrollViewController;
  v3 = [(PXScrollViewController *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v3->__observers;
    v3->__observers = (NSHashTable *)v4;

    *(_OWORD *)&v3->_contentInsetAdjustmentBehavior = xmmword_259D732A0;
    v3->_transfersScrollToContainer = 1;
  }
  return v3;
}

- (void)scrollViewContentBoundsDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewControllerContentBoundsDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v5 = a3.left == self->_contentInset.left && a3.top == self->_contentInset.top && a3.right == self->_contentInset.right;
  if (!v5 || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(PXScrollViewController *)self _observers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 scrollViewControllerContentInsetDidChange:self];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(PXScrollViewController *)self setNeedsUpdate];
  }
}

- (void)registerObserver:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(PXScrollViewController *)self _observers];
  [v4 addObject:v14];

  if (objc_opt_respondsToSelector())
  {
    willLayoutSubviewsObservers = self->_willLayoutSubviewsObservers;
    if (!willLayoutSubviewsObservers)
    {
      uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      uint64_t v7 = self->_willLayoutSubviewsObservers;
      self->_willLayoutSubviewsObservers = v6;

      willLayoutSubviewsObservers = self->_willLayoutSubviewsObservers;
    }
    [(NSHashTable *)willLayoutSubviewsObservers addObject:v14];
  }
  if (objc_opt_respondsToSelector())
  {
    didLayoutSubviewsObservers = self->_didLayoutSubviewsObservers;
    if (!didLayoutSubviewsObservers)
    {
      uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      long long v10 = self->_didLayoutSubviewsObservers;
      self->_didLayoutSubviewsObservers = v9;

      didLayoutSubviewsObservers = self->_didLayoutSubviewsObservers;
    }
    [(NSHashTable *)didLayoutSubviewsObservers addObject:v14];
  }
  if (objc_opt_respondsToSelector())
  {
    didScrollObservers = self->_didScrollObservers;
    if (!didScrollObservers)
    {
      long long v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      long long v13 = self->_didScrollObservers;
      self->_didScrollObservers = v12;

      didScrollObservers = self->_didScrollObservers;
    }
    [(NSHashTable *)didScrollObservers addObject:v14];
  }
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (BOOL)isAnimatingScroll
{
  if ([(PXScrollViewController *)self isAnimatingScrollTowardsEdge]) {
    return 1;
  }

  return [(PXScrollViewController *)self scrollViewIsAnimatingScroll];
}

- (BOOL)isAnimatingScrollTowardsEdge
{
  return [(PXScrollViewController *)self activeEdgeScrollAnimations] > 0;
}

- (int64_t)activeEdgeScrollAnimations
{
  return self->_activeEdgeScrollAnimations;
}

- (void)scrollViewDidScroll
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = +[PXScheduler sharedScheduler];
  [v3 scrollViewDidScroll];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_didScrollObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "scrollViewControllerDidScroll:", self, (void)v12);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [(PXScrollViewController *)self updateDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(PXScrollViewController *)self updateDelegate];
    objc_msgSend(v11, "px_scrollControllerDidScroll:", self);
  }
}

- (void)scrollViewWillLayout
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = +[PXScheduler sharedScheduler];
  [v3 scrollViewWillLayoutSubviews];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_willLayoutSubviewsObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "scrollViewControllerWillLayoutSubviews:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)scrollViewDidLayout
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(PXScrollViewController *)self updateDelegate];
  objc_msgSend(v3, "px_scrollControllerDidUpdate:", self);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_didLayoutSubviewsObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "scrollViewControllerDidLayoutSubviews:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (PXScrollControllerUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (PXScrollControllerUpdateDelegate *)WeakRetained;
}

- (BOOL)isManuallyChanging
{
  return self->_isManuallyChanging;
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (void)performManualChange:(id)a3
{
  BOOL isManuallyChanging = self->_isManuallyChanging;
  self->_BOOL isManuallyChanging = 1;
  (*((void (**)(id, PXScrollViewController *))a3 + 2))(a3, self);
  self->_BOOL isManuallyChanging = isManuallyChanging;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_contentCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_scrollInfo, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_didScrollObservers, 0);
  objc_storeStrong((id *)&self->_didLayoutSubviewsObservers, 0);

  objc_storeStrong((id *)&self->_willLayoutSubviewsObservers, 0);
}

- (CGSize)scrollViewContentSize
{
  double width = self->_scrollViewContentSize.width;
  double height = self->_scrollViewContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDeferContentOffsetUpdates:(BOOL)a3
{
  self->_deferContentOffsetUpdates = a3;
}

- (BOOL)deferContentOffsetUpdates
{
  return self->_deferContentOffsetUpdates;
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  self->_horizontalInterPageSpacing = a3;
}

- (double)horizontalInterPageSpacing
{
  return self->_horizontalInterPageSpacing;
}

- (BOOL)transfersScrollToContainer
{
  return self->_transfersScrollToContainer;
}

- (BOOL)draggingPerformsScroll
{
  return self->_draggingPerformsScroll;
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  self->_hitTestContentInsets = a3;
}

- (UIEdgeInsets)hitTestContentInsets
{
  double top = self->_hitTestContentInsets.top;
  double left = self->_hitTestContentInsets.left;
  double bottom = self->_hitTestContentInsets.bottom;
  double right = self->_hitTestContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  self->_verticalScrollIndicatorInsets = a3;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double top = self->_verticalScrollIndicatorInsets.top;
  double left = self->_verticalScrollIndicatorInsets.left;
  double bottom = self->_verticalScrollIndicatorInsets.bottom;
  double right = self->_verticalScrollIndicatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  self->_horizontalScrollIndicatorInsets = a3;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double top = self->_horizontalScrollIndicatorInsets.top;
  double left = self->_horizontalScrollIndicatorInsets.left;
  double bottom = self->_horizontalScrollIndicatorInsets.bottom;
  double right = self->_horizontalScrollIndicatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3
{
  self->_adjustsContentInsetWhenScrollDisabled = a3;
}

- (BOOL)adjustsContentInsetWhenScrollDisabled
{
  return self->_adjustsContentInsetWhenScrollDisabled;
}

- (void)setIsScrollEnabled:(BOOL)a3
{
  self->_isScrollEnabled = a3;
}

- (BOOL)isScrollEnabled
{
  return self->_isScrollEnabled;
}

- (void)setAllowsKeyboardScrolling:(BOOL)a3
{
  self->_allowsKeyboardScrolling = a3;
}

- (BOOL)allowsKeyboardScrolling
{
  return self->_allowsKeyboardScrolling;
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  self->_alwaysBounceVertical = a3;
}

- (BOOL)alwaysBounceVertical
{
  return self->_alwaysBounceVertical;
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  self->_alwaysBounceHorizontal = a3;
}

- (BOOL)alwaysBounceHorizontal
{
  return self->_alwaysBounceHorizontal;
}

- (int64_t)indicatorStyle
{
  return self->_indicatorStyle;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  self->_showsVerticalScrollIndicator = a3;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  self->_showsHorizontalScrollIndicator = a3;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void)setClipsToBounds:(BOOL)a3
{
  self->_clipsToBounds = a3;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (int64_t)decelerationRate
{
  return self->_decelerationRate;
}

- (UICoordinateSpace)contentCoordinateSpace
{
  return self->_contentCoordinateSpace;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (BOOL)isBouncing
{
  return self->_isBouncing;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (BOOL)isDecelerating
{
  return self->_isDecelerating;
}

- (PXAnonymousScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  self->_respectsContentZOrder = a3;
}

- (BOOL)respectsContentZOrder
{
  return self->_respectsContentZOrder;
}

- (PXScrollInfo)scrollInfo
{
  return self->_scrollInfo;
}

- (void)setPresentedContentSize:(CGSize)a3
{
  self->presentedContentSize = a3;
}

- (CGSize)presentedContentSize
{
  double width = self->presentedContentSize.width;
  double height = self->presentedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScrollInfo:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_scrollInfo != (PXScrollInfo *)v4)
  {
    uint64_t v8 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqual:");
    uint64_t v5 = (uint64_t)v8;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = (PXScrollInfo *)[v8 copy];
      scrollInfo = self->_scrollInfo;
      self->_scrollInfo = v6;

      uint64_t v4 = [(PXScrollViewController *)self applyScrollInfo:self->_scrollInfo];
      uint64_t v5 = (uint64_t)v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)setTransfersScrollToContainer:(BOOL)a3
{
  if (self->_transfersScrollToContainer != a3)
  {
    self->_transfersScrollToContainer = a3;
    [(PXScrollViewController *)self transfersScrollToContainerDidChange];
  }
}

- (void)setDraggingPerformsScroll:(BOOL)a3
{
  if (self->_draggingPerformsScroll != a3)
  {
    self->_draggingPerformsScroll = a3;
    [(PXScrollViewController *)self draggingPerformsScrollDidChange];
  }
}

- (void)contentInsetAdjustmentBehaviorDidChange
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 439, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController contentInsetAdjustmentBehaviorDidChange]", v6 object file lineNumber description];

  abort();
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  if (self->_contentInsetAdjustmentBehavior != a3)
  {
    self->_contentInsetAdjustmentBehavior = a3;
    [(PXScrollViewController *)self contentInsetAdjustmentBehaviorDidChange];
  }
}

- (void)indicatorStyleDidChange
{
  v2 = PXAssertGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_259CDA000, v2, OS_LOG_TYPE_FAULT, "not implemented on the current platform", v3, 2u);
  }
}

- (void)setIndicatorStyle:(int64_t)a3
{
  if (self->_indicatorStyle != a3)
  {
    self->_indicatorStyle = a3;
    [(PXScrollViewController *)self indicatorStyleDidChange];
  }
}

- (void)decelerationRateDidChange
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 415, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController decelerationRateDidChange]", v6 object file lineNumber description];

  abort();
}

- (void)setDecelerationRate:(int64_t)a3
{
  if (self->_decelerationRate != a3)
  {
    self->_decelerationRate = a3;
    [(PXScrollViewController *)self decelerationRateDidChange];
  }
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3.x, a3.y);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 379, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController setVisibleOrigin:]", v7 object file lineNumber description];

  abort();
}

- (BOOL)isInterruptingScrollWithDirection:(CGPoint *)a3
{
  return 0;
}

- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 313, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController setShouldScrollSimultaneouslyWithDescendantScrollView:]", v7 object file lineNumber description];

  abort();
}

- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 309, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController shouldScrollSimultaneouslyWithDescendantScrollView]", v6 object file lineNumber description];

  abort();
}

- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 305, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollIndicatorFrameForAxis:]", v7 object file lineNumber description];

  abort();
}

- (void)applyScrollInfo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 301, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController applyScrollInfo:]", v8 object file lineNumber description];

  abort();
}

- (void)setScrollViewContentBounds:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 297, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController setScrollViewContentBounds:]", v7 object file lineNumber description];

  abort();
}

- (CGRect)scrollViewContentBounds
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 292, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewContentBounds]", v6 object file lineNumber description];

  abort();
}

- (CGRect)scrollViewTargetRect
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 288, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewTargetRect]", v6 object file lineNumber description];

  abort();
}

- (CGRect)scrollViewConstrainedVisibleRect
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 284, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewConstrainedVisibleRect]", v6 object file lineNumber description];

  abort();
}

- (CGRect)scrollViewVisibleRectOutsideBounds
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 280, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewVisibleRectOutsideBounds]", v6 object file lineNumber description];

  abort();
}

- (CGRect)scrollViewVisibleRect
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 276, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewVisibleRect]", v6 object file lineNumber description];

  abort();
}

- (CGRect)scrollViewActiveRect
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 272, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewActiveRect]", v6 object file lineNumber description];

  abort();
}

- (CGSize)scrollViewReferenceSize
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 268, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewReferenceSize]", v6 object file lineNumber description];

  abort();
}

- (BOOL)scrollViewIsAnimatingScroll
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 264, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewIsAnimatingScroll]", v6 object file lineNumber description];

  abort();
}

- (void)scrollViewLayoutIfNeeded
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 260, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollViewLayoutIfNeeded]", v6 object file lineNumber description];

  abort();
}

- (void)setScrollViewNeedsLayout
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 256, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController setScrollViewNeedsLayout]", v6 object file lineNumber description];

  abort();
}

- (void)stopScrollingAndZoomingAnimations
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 252, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController stopScrollingAndZoomingAnimations]", v6 object file lineNumber description];

  abort();
}

- (void)scrollRectToVisible:(CGRect)a3 avoidingContentInsetEdges:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 248, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollRectToVisible:avoidingContentInsetEdges:animated:]", v9 object file lineNumber description];

  abort();
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
}

- (BOOL)isScrolledAtEdge:(unsigned int)a3 tolerance:(double)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", *(void *)&a3, a4);
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 240, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController isScrolledAtEdge:tolerance:]", v8 object file lineNumber description];

  abort();
}

- (void)scrollToEdge:(unsigned int)a3 padding:(UIEdgeInsets)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v8 = a6;
  long long v9 = [MEMORY[0x263F08690] currentHandler];
  long long v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 236, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController scrollToEdge:padding:animated:completionHandler:]", v11 object file lineNumber description];

  abort();
}

- (void)scrollToEdge:(unsigned int)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)scrollToEdge:(unsigned int)a3 animated:(BOOL)a4
{
}

- (void)addSubviewToScrollView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 224, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController addSubviewToScrollView:]", v8 object file lineNumber description];

  abort();
}

- (BOOL)isFloatingSublayer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 220, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController isFloatingSublayer:]", v8 object file lineNumber description];

  abort();
}

- (void)addFloatingSublayer:(id)a3 forAxis:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
  id v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 216, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController addFloatingSublayer:forAxis:]", v9 object file lineNumber description];

  abort();
}

- (BOOL)isSubview:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 212, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController isSubview:]", v8 object file lineNumber description];

  abort();
}

- (void)addSubview:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 208, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController addSubview:]", v8 object file lineNumber description];

  abort();
}

- (void)scrollViewDidEndFocusFastScrolling
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewControllerDidEndFocusFastScrolling:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)scrollViewDidBeginFocusFastScrolling
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewControllerDidBeginFocusFastScrolling:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)scrollViewDidEndScrollingAnimation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(PXScrollViewController *)self setActiveEdgeScrollAnimations:[(PXScrollViewController *)self activeEdgeScrollAnimations] - 1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewControllerDidEndScrollingAnimation:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)scrollViewWillBeginScrollingAnimationTowardsContentEdges:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(PXScrollViewController *)self setActiveEdgeScrollAnimations:[(PXScrollViewController *)self activeEdgeScrollAnimations] + 1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(PXScrollViewController *)self _observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 scrollViewControllerWillBeginScrollingAnimation:self towardsContentEdges:a3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)scrollViewShouldScrollToTop
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ![v8 scrollViewControllerShouldScrollToTop:self])
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)scrollViewDidEndScrolling
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewControllerDidEndScrolling:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)willEndScrollingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(PXScrollViewController *)self visibleRect];
  double v9 = v8;
  double v11 = v10;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v12 = [(PXScrollViewController *)self _observers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v17, "scrollViewControllerWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a4, x, y, v9, v11);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)scrollViewWillBeginScrolling
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(PXScrollViewController *)self _observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 scrollViewControllerWillBeginScrolling:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)scrollViewShouldBeginScrollingWithPanAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a3.y;
  double v8 = a3.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v11 = [(PXScrollViewController *)self _observers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "scrollViewController:shouldBeginScrollingWithPanAtLocation:inCoordinateSpace:velocity:", self, v10, v8, v7, x, y))
        {
          BOOL v17 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)hasWindow
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewController.m", 85, @"Method %s is a responsibility of subclass %@", "-[PXScrollViewController hasWindow]", v6 object file lineNumber description];

  abort();
}

- (void)setActiveEdgeScrollAnimations:(int64_t)a3
{
  if (self->_activeEdgeScrollAnimations != a3)
  {
    self->_activeEdgeScrollAnimations = a3;
    [(PXScrollViewController *)self activeEdgeScrollAnimations];
    kdebug_trace();
  }
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PXScrollViewController *)self _observers];
  [v4 removeObject:v5];

  [(NSHashTable *)self->_willLayoutSubviewsObservers removeObject:v5];
  [(NSHashTable *)self->_didLayoutSubviewsObservers removeObject:v5];
  [(NSHashTable *)self->_didScrollObservers removeObject:v5];
}

- (PXScrollViewController)init
{
  return -[PXScrollViewController initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

@end