@interface ExtensionsBannerView
- (CGSize)intrinsicContentSize;
- (ExtensionsBannerView)initWithCoder:(id)a3;
- (ExtensionsBannerView)initWithFrame:(CGRect)a3;
- (UIView)remoteView;
- (void)_commonInit;
- (void)_updateConstraints;
- (void)setRemoteView:(id)a3;
@end

@implementation ExtensionsBannerView

- (ExtensionsBannerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerView;
  v3 = [(ExtensionsBannerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ExtensionsBannerView *)v3 _commonInit];
  }
  return v4;
}

- (ExtensionsBannerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerView;
  v3 = -[ExtensionsBannerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ExtensionsBannerView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  occludingView = self->_occludingView;
  self->_occludingView = v3;

  v5 = [(UIView *)self->_occludingView layer];
  [v5 setHitTestsAsOpaque:1];

  [(ExtensionsBannerView *)self addSubview:self->_occludingView];

  [(ExtensionsBannerView *)self _updateConstraints];
}

- (void)_updateConstraints
{
  [(ExtensionsBannerView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_occludingView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(UIView *)self->_occludingView _maps_constraintsForCenteringInView:self];
  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)setRemoteView:(id)a3
{
  v5 = (UIView *)a3;
  remoteView = self->_remoteView;
  if (remoteView != v5)
  {
    v8 = v5;
    [(UIView *)remoteView removeFromSuperview];
    objc_storeStrong((id *)&self->_remoteView, a3);
    v5 = v8;
    if (v8)
    {
      [(ExtensionsBannerView *)self insertSubview:v8 belowSubview:self->_occludingView];
      [(UIView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      v7 = [(UIView *)v8 _maps_constraintsForCenteringInView:self];
      +[NSLayoutConstraint activateConstraints:v7];

      v5 = v8;
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 137.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIView)remoteView
{
  return self->_remoteView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteView, 0);

  objc_storeStrong((id *)&self->_occludingView, 0);
}

@end