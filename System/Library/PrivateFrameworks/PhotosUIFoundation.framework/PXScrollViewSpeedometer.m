@interface PXScrollViewSpeedometer
- (BOOL)isAnimatingScroll;
- (BOOL)isManuallyChanging;
- (BOOL)isScrubbing;
- (PXScrollViewController)scrollViewController;
- (PXScrollViewSpeedometer)init;
- (PXScrollViewSpeedometer)initWithScrollController:(id)a3;
- (id)scrollview;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidEndScrollingAnimation:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4;
@end

@implementation PXScrollViewSpeedometer

- (PXScrollViewSpeedometer)initWithScrollController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXScrollViewSpeedometer;
  v6 = [(PXScrollSpeedometer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollViewController, a3);
    [v5 registerObserver:v7];
  }

  return v7;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  [a3 visibleRect];

  -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 0);
}

- (BOOL)isScrubbing
{
  v2 = [(PXScrollViewSpeedometer *)self scrollViewController];
  char v3 = [v2 isScrubbing];

  return v3;
}

- (BOOL)isManuallyChanging
{
  v2 = [(PXScrollViewSpeedometer *)self scrollViewController];
  char v3 = [v2 isManuallyChanging];

  return v3;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (void).cxx_destruct
{
}

- (void)scrollViewControllerDidEndScrollingAnimation:(id)a3
{
  [a3 visibleRect];

  -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 1);
}

- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4
{
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  [a3 visibleRect];

  -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 1);
}

- (BOOL)isAnimatingScroll
{
  v2 = [(PXScrollViewSpeedometer *)self scrollViewController];
  char v3 = [v2 isAnimatingScrollTowardsEdge];

  return v3;
}

- (id)scrollview
{
  v2 = [(PXScrollViewSpeedometer *)self scrollViewController];
  char v3 = [v2 scrollView];

  return v3;
}

- (PXScrollViewSpeedometer)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXScrollViewSpeedometer.m", 31, @"%@ not supported", v5 object file lineNumber description];

  abort();
}

@end