@interface PKPeerPaymentIconEducationView
- (BOOL)showIconsView;
- (BOOL)showWatchView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)_imageForWatchView;
- (void)layoutSubviews;
- (void)setShowIconsView:(BOOL)a3;
- (void)setShowWatchView:(BOOL)a3;
@end

@implementation PKPeerPaymentIconEducationView

- (void)setShowWatchView:(BOOL)a3
{
  if (self->_showWatchView != a3)
  {
    self->_showWatchView = a3;
    watchDeviceImageView = self->_watchDeviceImageView;
    if (a3)
    {
      if (watchDeviceImageView) {
        [(PKWatchDeviceImageOverlayView *)watchDeviceImageView removeFromSuperview];
      }
      v5 = objc_alloc_init(PKWatchDeviceImageOverlayView);
      v6 = self->_watchDeviceImageView;
      self->_watchDeviceImageView = v5;

      v7 = self->_watchDeviceImageView;
      v8 = [(PKPeerPaymentIconEducationView *)self _imageForWatchView];
      [(PKWatchDeviceImageOverlayView *)v7 setOverlayImage:v8];

      [(PKPeerPaymentIconEducationView *)self addSubview:self->_watchDeviceImageView];
    }
    else
    {
      [(PKWatchDeviceImageOverlayView *)watchDeviceImageView removeFromSuperview];
      v9 = self->_watchDeviceImageView;
      self->_watchDeviceImageView = 0;
    }
    [(PKPeerPaymentIconEducationView *)self setNeedsLayout];
  }
}

- (void)setShowIconsView:(BOOL)a3
{
  if (self->_showIconsView != a3)
  {
    self->_showIconsView = a3;
    iconsView = self->_iconsView;
    if (a3)
    {
      if (iconsView) {
        [(PKPaymentSetupInitialCardEducationIconsView *)iconsView removeFromSuperview];
      }
      v5 = objc_alloc_init(PKPaymentSetupInitialCardEducationIconsView);
      v6 = self->_iconsView;
      self->_iconsView = v5;

      [(PKPaymentSetupInitialCardEducationIconsView *)self->_iconsView sizeToFit];
      [(PKPeerPaymentIconEducationView *)self addSubview:self->_iconsView];
    }
    else
    {
      [(PKPaymentSetupInitialCardEducationIconsView *)iconsView removeFromSuperview];
      v7 = self->_iconsView;
      self->_iconsView = 0;
    }
    [(PKPeerPaymentIconEducationView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentIconEducationView;
  [(PKPeerPaymentIconEducationView *)&v15 layoutSubviews];
  [(PKPeerPaymentIconEducationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(PKWatchDeviceImageOverlayView *)self->_watchDeviceImageView frame];
  -[PKWatchDeviceImageOverlayView sizeThatFits:](self->_watchDeviceImageView, "sizeThatFits:", v4, v6);
  PKRectCenteredXInRect();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[PKWatchDeviceImageOverlayView setFrame:](self->_watchDeviceImageView, "setFrame:");
  [(PKPaymentSetupInitialCardEducationIconsView *)self->_iconsView frame];
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  CGRectGetMaxY(v16);
  PKRectCenteredXInRect();
  -[PKPaymentSetupInitialCardEducationIconsView setFrame:](self->_iconsView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[PKPaymentSetupInitialCardEducationIconsView sizeThatFits:](self->_iconsView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[PKWatchDeviceImageOverlayView sizeThatFits:](self->_watchDeviceImageView, "sizeThatFits:", width, height);
  double v11 = fmax(v7, v10);
  double v13 = fmax(v9, v12);
  result.double height = v13;
  result.double width = v11;
  return result;
}

- (id)_imageForWatchView
{
  unint64_t v2 = +[PKBridgeWatchAttributeController heroWatchSize];
  if (v2 <= 4)
  {
    double v3 = PKUIImageNamed(off_1E59DBC70[v2]);
  }

  return v3;
}

- (BOOL)showWatchView
{
  return self->_showWatchView;
}

- (BOOL)showIconsView
{
  return self->_showIconsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchDeviceImageView, 0);

  objc_storeStrong((id *)&self->_iconsView, 0);
}

@end