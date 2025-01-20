@interface PXStoryBufferingStatusView
- (CGRect)clippingRect;
- (PXStoryBufferingStatusView)initWithFrame:(CGRect)a3;
- (PXStoryBufferingStatusViewConfiguration)userData;
- (UIActivityIndicatorView)spinnerView;
- (void)_updateAnimation;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXStoryBufferingStatusView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (PXStoryBufferingStatusViewConfiguration)userData
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

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v4 = (PXStoryBufferingStatusViewConfiguration *)[a3 copy];
  userData = self->_userData;
  self->_userData = v4;

  [(PXStoryBufferingStatusView *)self setNeedsLayout];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryBufferingStatusView;
  [(PXStoryBufferingStatusView *)&v3 didMoveToWindow];
  [(PXStoryBufferingStatusView *)self _updateAnimation];
}

- (void)_updateAnimation
{
  objc_super v3 = [(PXStoryBufferingStatusView *)self window];

  spinnerView = self->_spinnerView;
  if (v3)
  {
    [(UIActivityIndicatorView *)spinnerView startAnimating];
  }
  else
  {
    [(UIActivityIndicatorView *)spinnerView stopAnimating];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryBufferingStatusView;
  [(PXStoryBufferingStatusView *)&v3 layoutSubviews];
  [(PXStoryBufferingStatusView *)self bounds];
  PXRectGetCenter();
}

- (PXStoryBufferingStatusView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryBufferingStatusView;
  objc_super v3 = -[PXStoryBufferingStatusView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:9];
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = (UIActivityIndicatorView *)v4;

    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIActivityIndicatorView *)v3->_spinnerView setColor:v6];

    [(PXStoryBufferingStatusView *)v3 addSubview:v3->_spinnerView];
    [(PXStoryBufferingStatusView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

@end