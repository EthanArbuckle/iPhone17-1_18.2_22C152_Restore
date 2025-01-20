@interface PXGScrollViewContainer
- (BOOL)isRTL;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4;
- (CGRect)clippingRect;
- (PXGScrollViewContainer)initWithFrame:(CGRect)a3;
- (PXGScrollViewContainerConfiguration)userData;
- (PXGScrollViewContainerDelegate)delegate;
- (PXGScrollViewModel)scrollViewModel;
- (PXScrollViewController)scrollViewController;
- (PXScrollViewSpeedometer)speedometer;
- (PXUpdater)updater;
- (id)focusItemsForScrollViewController:(id)a3 inRect:(CGRect)a4;
- (void)_invalidateScrollViewController;
- (void)_invalidateScrollViewDecelerationRate;
- (void)_invalidateScrollViewModel;
- (void)_updateScrollViewController;
- (void)_updateScrollViewDecelerationRate;
- (void)_updateScrollViewModel;
- (void)_willLayout;
- (void)addHostedLayer:(id)a3;
- (void)addHostedView:(id)a3;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)setAlpha:(double)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollViewModel:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGScrollViewContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scrollViewModel, 0);
  objc_storeStrong((id *)&self->_speedometer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (PXGScrollViewContainerDelegate)delegate
{
  return self->_delegate;
}

- (PXGScrollViewModel)scrollViewModel
{
  return self->_scrollViewModel;
}

- (PXScrollViewSpeedometer)speedometer
{
  return self->_speedometer;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (PXGScrollViewContainerConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)focusItemsForScrollViewController:(id)a3 inRect:(CGRect)a4
{
  if (self->_delegateRespondsTo.focusItemsInRect)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    v9 = [(PXGScrollViewContainer *)self delegate];
    v10 = objc_msgSend(v9, "focusItemsForScrollViewContainer:inRect:", self, x, y, width, height);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  if (self->_delegateRespondsTo.didEndScrolling)
  {
    id v4 = [(PXGScrollViewContainer *)self delegate];
    [v4 scrollViewContainerDidEndScrolling:self];
  }
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = a3;
  if (self->_delegateRespondsTo.willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset)
  {
    id v15 = v12;
    BOOL v13 = [(PXGScrollViewContainer *)self shouldFlipContentOffset];
    [v15 contentBounds];
    [(PXGScrollViewContainer *)self bounds];
    if (v13) {
      PXContentOffsetFlippedHorizontally();
    }
    v14 = [(PXGScrollViewContainer *)self delegate];
    objc_msgSend(v14, "scrollViewContainerWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a5, v10, v9, x, y);

    id v12 = v15;
  }
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  if (self->_delegateRespondsTo.didScroll)
  {
    id v4 = [(PXGScrollViewContainer *)self delegate];
    [v4 scrollViewContainerDidScroll:self];
  }
  [(PXGScrollViewContainer *)self _invalidateScrollViewModel];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  if (self->_delegateRespondsTo.willBeginScrolling)
  {
    id v4 = [(PXGScrollViewContainer *)self delegate];
    [v4 scrollViewContainerWillBeginScrolling:self];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)ScrollViewModelObservationContext == a5)
  {
    id v13 = v9;
    char v10 = [v9 changesOptions];
    if ((v6 & 0xFFE3) != 0 && (v10 & 2) == 0) {
      [(PXGScrollViewContainer *)self _invalidateScrollViewController];
    }
    if ((v6 & 8) != 0) {
      [(PXGScrollViewContainer *)self _invalidateScrollViewDecelerationRate];
    }
    id v9 = v13;
    if ((v6 & 0x10) != 0)
    {
      v11 = [(PXGScrollViewContainer *)self scrollViewController];
      [v11 stopScrollingAndZoomingAnimations];

      goto LABEL_12;
    }
  }
  else
  {
    if ((void *)SpeedometerObservationContext != a5)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXGScrollViewContainer.m" lineNumber:320 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 2) != 0)
    {
      id v13 = v9;
      [(PXGScrollViewContainer *)self _invalidateScrollViewModel];
LABEL_12:
      id v9 = v13;
    }
  }
}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  scrollViewController = self->_scrollViewController;
  id v7 = a4;
  id v8 = [(PXScrollViewController *)scrollViewController scrollView];
  id v9 = [v8 layer];

  objc_msgSend(v9, "convertPoint:fromLayer:", v7, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)addHostedLayer:(id)a3
{
}

- (void)addHostedView:(id)a3
{
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  double v10 = (PXGScrollViewContainerConfiguration *)a3;
  id v4 = self->_userData;
  v5 = v10;
  if (v4 != v10)
  {
    BOOL v6 = [(PXGScrollViewContainerConfiguration *)v10 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    id v7 = (PXGScrollViewContainerConfiguration *)[(PXGScrollViewContainerConfiguration *)v10 copy];
    userData = self->_userData;
    self->_userData = v7;

    id v9 = [(PXGScrollViewContainerConfiguration *)self->_userData scrollViewModel];
    [(PXGScrollViewContainer *)self setScrollViewModel:v9];

    v5 = [(PXGScrollViewContainerConfiguration *)self->_userData delegate];
    [(PXGScrollViewContainer *)self setDelegate:v5];
  }

LABEL_5:
}

- (void)_updateScrollViewModel
{
  v3 = [(PXGScrollViewContainer *)self scrollViewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PXGScrollViewContainer__updateScrollViewModel__block_invoke;
  v4[3] = &unk_1E5DB23B8;
  v4[4] = self;
  [v3 performChanges:v4 options:2];
}

void __48__PXGScrollViewContainer__updateScrollViewModel__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = [v3 scrollViewController];
  [v10 visibleOrigin];
  double v6 = v5;
  double v8 = v7;
  if ([*(id *)(a1 + 32) shouldFlipContentOffset])
  {
    [v10 visibleOrigin];
    [v10 contentBounds];
    [*(id *)(a1 + 32) bounds];
    PXContentOffsetFlippedHorizontally();
  }
  objc_msgSend(v4, "setContentOffset:", v6, v8);
  id v9 = [*(id *)(a1 + 32) speedometer];
  objc_msgSend(v4, "setScrollRegime:", objc_msgSend(v9, "regime"));
}

- (void)_invalidateScrollViewModel
{
  if (!self->_isUpdatingScrollViewController) {
    [(PXGScrollViewContainer *)self _updateScrollViewModel];
  }
}

- (void)_updateScrollViewDecelerationRate
{
  id v8 = [(PXGScrollViewContainer *)self scrollViewModel];
  unint64_t v3 = [v8 scrollDecelerationRate];
  if (v3 >= 2)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    double v7 = [NSString stringWithUTF8String:"PXScrollViewDecelerationRate PXScrollViewDecelerationRateFromPXGScrollDecelerationRate(PXGScrollDecelerationRate)"];
    [v6 handleFailureInFunction:v7 file:@"PXGScrollViewContainer.m" lineNumber:28 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  unint64_t v4 = v3;
  double v5 = [(PXGScrollViewContainer *)self scrollViewController];
  [v5 setDecelerationRate:v4];
}

- (void)_invalidateScrollViewDecelerationRate
{
  id v2 = [(PXGScrollViewContainer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrollViewDecelerationRate];
}

- (void)_updateScrollViewController
{
  [(PXGScrollViewContainer *)self scrollViewController];
  objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [(PXGScrollViewContainer *)self scrollViewModel];
  self->_isUpdatingScrollViewController = 1;
  [v3 contentSize];
  PXRectWithOriginAndSize();
}

- (void)_invalidateScrollViewController
{
  id v2 = [(PXGScrollViewContainer *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrollViewController];
}

- (BOOL)isRTL
{
  return [(PXGScrollViewContainer *)self effectiveUserInterfaceLayoutDirection] == 1;
}

- (void)setAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGScrollViewContainer;
  -[PXGScrollViewContainer setAlpha:](&v5, sel_setAlpha_);
  [(PXGScrollViewContainer *)self setHidden:a3 == 0.0];
}

- (void)layoutSubviews
{
  [(PXGScrollViewContainer *)self _willLayout];
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollViewContainer;
  [(PXGScrollViewContainer *)&v3 layoutSubviews];
}

- (void)_willLayout
{
  id v2 = [(PXGScrollViewContainer *)self updater];
  [v2 updateIfNeeded];
}

- (void)setDelegate:(id)a3
{
  objc_super v5 = (PXGScrollViewContainerDelegate *)a3;
  if (self->_delegate != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_delegate, a3);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->willBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didScroll = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didEndScrolling = objc_opt_respondsToSelector() & 1;
    BOOL v7 = objc_opt_respondsToSelector() & 1;
    objc_super v5 = v8;
    p_delegateRespondsTo->focusItemsInRect = v7;
  }
}

- (void)setScrollViewModel:(id)a3
{
  objc_super v5 = (PXGScrollViewModel *)a3;
  scrollViewModel = self->_scrollViewModel;
  if (scrollViewModel != v5)
  {
    BOOL v7 = v5;
    [(PXGScrollViewModel *)scrollViewModel unregisterChangeObserver:self context:ScrollViewModelObservationContext];
    objc_storeStrong((id *)&self->_scrollViewModel, a3);
    [(PXGScrollViewModel *)self->_scrollViewModel registerChangeObserver:self context:ScrollViewModelObservationContext];
    [(PXGScrollViewContainer *)self _invalidateScrollViewController];
    [(PXGScrollViewContainer *)self _invalidateScrollViewDecelerationRate];
    objc_super v5 = v7;
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
}

- (PXGScrollViewContainer)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PXGScrollViewContainer;
  objc_super v3 = -[PXGScrollViewContainer initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateScrollViewController needsUpdate:1];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateScrollViewDecelerationRate needsUpdate:1];
    double v6 = [PXUIScrollViewController alloc];
    [(PXGScrollViewContainer *)v3 bounds];
    BOOL v7 = -[PXUIScrollViewController initWithFrame:](v6, "initWithFrame:");
    [(PXUIScrollViewController *)v7 setFocusItemProvider:v3];
    id v8 = [(PXUIScrollViewController *)v7 scrollView];
    [v8 setAutoresizingMask:18];
    scrollViewController = v3->_scrollViewController;
    v3->_scrollViewController = &v7->super;
    id v10 = v7;

    [(PXScrollViewController *)v3->_scrollViewController registerObserver:v3];
    [(PXGScrollViewContainer *)v3 addSubview:v8];
    uint64_t v11 = [objc_alloc((Class)off_1E5DA83C8) initWithScrollController:v3->_scrollViewController];
    speedometer = v3->_speedometer;
    v3->_speedometer = (PXScrollViewSpeedometer *)v11;

    [(PXScrollViewSpeedometer *)v3->_speedometer registerChangeObserver:v3 context:SpeedometerObservationContext];
  }
  return v3;
}

@end