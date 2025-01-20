@interface _UIImageViewOverlayView
- (_UIImageViewOverlayViewDelegate)overlayViewDelegate;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setOverlayViewDelegate:(id)a3;
@end

@implementation _UIImageViewOverlayView

- (void)setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIImageViewOverlayView;
  -[UIView setClipsToBounds:](&v6, sel_setClipsToBounds_);
  v5 = [(_UIImageViewOverlayView *)self overlayViewDelegate];
  [v5 overlayView:self didChangeClipsToBounds:v3];
}

- (_UIImageViewOverlayViewDelegate)overlayViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayViewDelegate);
  return (_UIImageViewOverlayViewDelegate *)WeakRetained;
}

- (void)setOverlayViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end