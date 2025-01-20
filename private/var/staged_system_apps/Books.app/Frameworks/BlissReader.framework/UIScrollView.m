@interface UIScrollView
- (BOOL)canScroll;
- (BOOL)isAncestorScrollViewDragging;
- (BOOL)isSettledOnFirstOrLastPage;
- (BOOL)tsaxAnimationEndedShouldHandleDelegateCallbacks;
- (BOOL)tsaxContentOffsetWasChanged;
- (BOOL)tsaxIsScrollingDisabled;
- (BOOL)tsaxScrollStatusPrefersHorizontal;
- (BOOL)tsaxShouldIgnoreSiblingPageControl;
- (BOOL)tsaxUseContentInset;
- (CGPoint)spi_pageDecelerationTarget;
- (NSString)tsaxScrollStatusFormatString;
- (double)tsaxScrollAnnouncementDelay;
- (unint64_t)pageCount;
- (void)th_killPans;
- (void)tsaxSetAnimationEndedShouldHandleDelegateCallbacks:(BOOL)a3;
- (void)tsaxSetContentOffsetWasChanged:(BOOL)a3;
- (void)tsaxSetScrollAnnouncementDelay:(double)a3;
- (void)tsaxSetScrollStatusFormatString:(id)a3;
- (void)tsaxSetScrollStatusPrefersHorizontal:(BOOL)a3;
- (void)tsaxSetScrollingDisabled:(BOOL)a3;
- (void)tsaxSetShouldIgnoreSiblingPageControl:(BOOL)a3;
- (void)tsaxSetUseContentInset:(BOOL)a3;
@end

@implementation UIScrollView

- (BOOL)isAncestorScrollViewDragging
{
  if ([(UIScrollView *)self isDragging]) {
    return 1;
  }
  id v4 = [(UIScrollView *)self superview];

  return [v4 isAncestorScrollViewDragging];
}

- (BOOL)isSettledOnFirstOrLastPage
{
  if ([(UIScrollView *)self isTracking]) {
    LOBYTE(v3) = 0;
  }
  else {
    unsigned int v3 = ![(UIScrollView *)self isDecelerating];
  }
  if ([(UIScrollView *)self isPagingEnabled])
  {
    [(UIScrollView *)self contentOffset];
    if (fabs(v4) >= 0.00999999978)
    {
      [(UIScrollView *)self contentOffset];
      double v7 = v6;
      [(UIScrollView *)self contentSize];
      double v9 = v8;
      [(UIScrollView *)self bounds];
      BOOL v5 = vabdd_f64(v7, v9 - CGRectGetWidth(v11)) < 0.00999999978;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  return v3 & v5;
}

- (unint64_t)pageCount
{
  if (![(UIScrollView *)self isPagingEnabled]) {
    return 0;
  }
  [(UIScrollView *)self contentSize];
  double v4 = v3;
  [(UIScrollView *)self bounds];
  return (unint64_t)(v4 / CGRectGetWidth(v6));
}

- (BOOL)canScroll
{
  [(UIScrollView *)self contentSize];
  double v4 = v3;
  [(UIScrollView *)self bounds];
  if (v4 > CGRectGetWidth(v8)) {
    return 1;
  }
  [(UIScrollView *)self contentSize];
  double v7 = v6;
  [(UIScrollView *)self bounds];
  return v7 > CGRectGetHeight(v9);
}

- (void)th_killPans
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(UIScrollView *)self gestureRecognizers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v7 state] <= 2) {
          [v7 setState:4];
        }
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (CGPoint)spi_pageDecelerationTarget
{
  [(UIScrollView *)self _pageDecelerationTarget];
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSString)tsaxScrollStatusFormatString
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_5738CB);
}

- (void)tsaxSetScrollStatusFormatString:(id)a3
{
}

- (BOOL)tsaxUseContentInset
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738CC);
}

- (void)tsaxSetUseContentInset:(BOOL)a3
{
}

- (double)tsaxScrollAnnouncementDelay
{
  __TSAccessibilityGetAssociatedTimeInterval(self, &unk_5738CD);
  return result;
}

- (void)tsaxSetScrollAnnouncementDelay:(double)a3
{
}

- (BOOL)tsaxScrollStatusPrefersHorizontal
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738CE);
}

- (void)tsaxSetScrollStatusPrefersHorizontal:(BOOL)a3
{
}

- (BOOL)tsaxShouldIgnoreSiblingPageControl
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738CF);
}

- (void)tsaxSetShouldIgnoreSiblingPageControl:(BOOL)a3
{
}

- (BOOL)tsaxIsScrollingDisabled
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738D0);
}

- (void)tsaxSetScrollingDisabled:(BOOL)a3
{
}

- (BOOL)tsaxAnimationEndedShouldHandleDelegateCallbacks
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738D1);
}

- (void)tsaxSetAnimationEndedShouldHandleDelegateCallbacks:(BOOL)a3
{
}

- (BOOL)tsaxContentOffsetWasChanged
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738D2);
}

- (void)tsaxSetContentOffsetWasChanged:(BOOL)a3
{
}

@end