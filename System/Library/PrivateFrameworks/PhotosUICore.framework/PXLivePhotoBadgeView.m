@interface PXLivePhotoBadgeView
- (CGRect)trackedRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXLivePhotoBadgeView)initWithFrame:(CGRect)a3;
- (PXLivePhotoBadgeViewDelegate)delegate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setTrackedRect:(CGRect)a3;
- (void)setWantsPlayback:(BOOL)a3;
@end

@implementation PXLivePhotoBadgeView

- (void).cxx_destruct
{
}

- (CGRect)trackedRect
{
  double x = self->_trackedRect.origin.x;
  double y = self->_trackedRect.origin.y;
  double width = self->_trackedRect.size.width;
  double height = self->_trackedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXLivePhotoBadgeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXLivePhotoBadgeViewDelegate *)WeakRetained;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoBadgeView;
  [(PXLivePhotoBadgeView *)&v3 layoutSubviews];
  [(PXLivePhotoBadgeView *)self bounds];
  -[PXLivePhotoBadgeView setTrackedRect:](self, "setTrackedRect:");
}

- (void)setWantsPlayback:(BOOL)a3
{
  if (self->_delegateRespondsTo.wantsPlayback)
  {
    BOOL v3 = a3;
    id v5 = [(PXLivePhotoBadgeView *)self delegate];
    [v5 livePhotoBadgeView:self wantsPlayback:v3];
  }
}

- (void)setTrackedRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_trackedRect = &self->_trackedRect;
  if (!CGRectEqualToRect(a3, self->_trackedRect))
  {
    p_trackedRect->origin.CGFloat x = x;
    p_trackedRect->origin.CGFloat y = y;
    p_trackedRect->size.CGFloat width = width;
    p_trackedRect->size.CGFloat height = height;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.wantsPlayback = objc_opt_respondsToSelector() & 1;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXLivePhotoBadgeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXLivePhotoBadgeView;
  BOOL v3 = -[PXLivePhotoBadgeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PXLivePhotoBadgeView *)v3 _setUpContent];
  }
  return v4;
}

@end