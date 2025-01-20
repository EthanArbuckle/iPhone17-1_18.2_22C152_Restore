@interface PXGScrollViewModel
- (BOOL)alwaysBounceHorizontal;
- (BOOL)alwaysBounceVertical;
- (BOOL)clipsToBounds;
- (BOOL)draggingPerformsScroll;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (BOOL)transfersScrollToContainer;
- (CGPoint)contentOffset;
- (CGSize)contentSize;
- (PXGScrollViewModel)init;
- (UIEdgeInsets)hitTestContentInsets;
- (UIEdgeInsets)horizontalScrollIndicatorInsets;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (double)horizontalInterPageSpacing;
- (id)description;
- (int64_t)scrollDecelerationRate;
- (int64_t)scrollRegime;
- (unint64_t)changesOptions;
- (void)didEndChangeHandling;
- (void)performChanges:(id)a3 options:(unint64_t)a4;
- (void)setAlwaysBounceHorizontal:(BOOL)a3;
- (void)setAlwaysBounceVertical:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDraggingPerformsScroll:(BOOL)a3;
- (void)setHitTestContentInsets:(UIEdgeInsets)a3;
- (void)setHorizontalInterPageSpacing:(double)a3;
- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setScrollDecelerationRate:(int64_t)a3;
- (void)setScrollRegime:(int64_t)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setTransfersScrollToContainer:(BOOL)a3;
- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)stopScrolling;
@end

@implementation PXGScrollViewModel

- (unint64_t)changesOptions
{
  return self->_changesOptions;
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

- (BOOL)alwaysBounceVertical
{
  return self->_alwaysBounceVertical;
}

- (BOOL)alwaysBounceHorizontal
{
  return self->_alwaysBounceHorizontal;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (int64_t)scrollDecelerationRate
{
  return self->_scrollDecelerationRate;
}

- (int64_t)scrollRegime
{
  return self->_scrollRegime;
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CGFloat width = self->_contentSize.width;
  CGFloat height = self->_contentSize.height;
  CGFloat x = self->_contentOffset.x;
  CGFloat y = self->_contentOffset.y;
  int64_t scrollRegime = self->_scrollRegime;
  int64_t scrollDecelerationRate = self->_scrollDecelerationRate;
  if (self->_clipsToBounds) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  if (self->_showsHorizontalScrollIndicator) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v14 = v13;
  if (self->_showsVerticalScrollIndicator) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = v15;
  if (self->_draggingPerformsScroll) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  v18 = v17;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; contentSize={%g, %g}; contentOffset={%g, %g}; scrollRegime=%ti; scrollDecelerationRate=%ti; clipsToBounds=%@; showsHorizontalScrollIndicator=%@; showsVerticalScrollIndicator=%@; draggingPerformsScroll=%@>",
    v4,
    self,
    *(void *)&width,
    *(void *)&height,
    *(void *)&x,
    *(void *)&y,
    scrollRegime,
    scrollDecelerationRate,
    v12,
    v14,
    v16,
  v19 = v18);

  return v19;
}

- (void)setTransfersScrollToContainer:(BOOL)a3
{
  if (self->_transfersScrollToContainer != a3)
  {
    self->_transfersScrollToContainer = a3;
    [(PXGScrollViewModel *)self signalChange:0x8000];
  }
}

- (void)setDraggingPerformsScroll:(BOOL)a3
{
  if (self->_draggingPerformsScroll != a3)
  {
    self->_draggingPerformsScroll = a3;
    [(PXGScrollViewModel *)self signalChange:128];
  }
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  if (self->_horizontalInterPageSpacing != a3)
  {
    self->_horizontalInterPageSpacing = a3;
    [(PXGScrollViewModel *)self signalChange:512];
  }
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  if (self->_alwaysBounceVertical != a3)
  {
    self->_alwaysBounceVertical = a3;
    [(PXGScrollViewModel *)self signalChange:2048];
  }
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  if (self->_alwaysBounceHorizontal != a3)
  {
    self->_alwaysBounceHorizontal = a3;
    [(PXGScrollViewModel *)self signalChange:1024];
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  if (self->_showsVerticalScrollIndicator != a3)
  {
    self->_showsVerticalScrollIndicator = a3;
    [(PXGScrollViewModel *)self signalChange:64];
  }
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  if (self->_showsHorizontalScrollIndicator != a3)
  {
    self->_showsHorizontalScrollIndicator = a3;
    [(PXGScrollViewModel *)self signalChange:32];
  }
}

- (void)setClipsToBounds:(BOOL)a3
{
  if (self->_clipsToBounds != a3)
  {
    self->_clipsToBounds = a3;
    [(PXGScrollViewModel *)self signalChange:256];
  }
}

- (void)stopScrolling
{
}

- (void)setScrollDecelerationRate:(int64_t)a3
{
  if (self->_scrollDecelerationRate != a3)
  {
    self->_int64_t scrollDecelerationRate = a3;
    [(PXGScrollViewModel *)self signalChange:8];
  }
}

- (void)setScrollRegime:(int64_t)a3
{
  if (self->_scrollRegime != a3)
  {
    self->_int64_t scrollRegime = a3;
    [(PXGScrollViewModel *)self signalChange:4];
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  if (a3.x != self->_contentOffset.x || a3.y != self->_contentOffset.y)
  {
    self->_contentOffset = a3;
    [(PXGScrollViewModel *)self signalChange:2];
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    [(PXGScrollViewModel *)self signalChange:1];
  }
}

- (void)didEndChangeHandling
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollViewModel;
  [(PXGScrollViewModel *)&v3 didEndChangeHandling];
  self->_changesOptions = 0;
}

- (void)performChanges:(id)a3 options:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t changesOptions = self->_changesOptions;
  if ((changesOptions & 4) == 0)
  {
    if (changesOptions) {
      BOOL v8 = changesOptions == a4;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8) {
      PXAssertGetLog();
    }
  }
  self->_unint64_t changesOptions = a4;
  v9.receiver = self;
  v9.super_class = (Class)PXGScrollViewModel;
  [(PXGScrollViewModel *)&v9 performChanges:v6];
}

- (PXGScrollViewModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollViewModel;
  CGSize result = [(PXGScrollViewModel *)&v3 init];
  if (result) {
    result->_transfersScrollToContainer = 1;
  }
  return result;
}

@end