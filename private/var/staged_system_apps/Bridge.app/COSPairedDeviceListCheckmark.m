@interface COSPairedDeviceListCheckmark
- (CGSize)intrinsicContentSize;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
@end

@implementation COSPairedDeviceListCheckmark

- (CGSize)intrinsicContentSize
{
  double v2 = 28.0;
  double v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setChecked:(BOOL)a3
{
  if (a3)
  {
    [(COSPairedDeviceListCheckmark *)self setLoading:0];
    id v4 = +[UIImage systemImageNamed:@"checkmark"];
    [(COSPairedDeviceListCheckmark *)self setImage:v4];
  }
  else
  {
    [(COSPairedDeviceListCheckmark *)self setImage:0];
  }
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    [(COSPairedDeviceListCheckmark *)self setChecked:0];
    loadingView = self->_loadingView;
    if (!loadingView)
    {
      v5 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      v6 = self->_loadingView;
      self->_loadingView = v5;

      [(UIActivityIndicatorView *)self->_loadingView setHidesWhenStopped:1];
      [(COSPairedDeviceListCheckmark *)self addSubview:self->_loadingView];
      loadingView = self->_loadingView;
    }
    [(UIActivityIndicatorView *)loadingView startAnimating];
  }
  else
  {
    v7 = self->_loadingView;
    [(UIActivityIndicatorView *)v7 stopAnimating];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)COSPairedDeviceListCheckmark;
  [(COSPairedDeviceListCheckmark *)&v3 layoutSubviews];
  [(COSPairedDeviceListCheckmark *)self bounds];
  -[UIActivityIndicatorView setFrame:](self->_loadingView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end