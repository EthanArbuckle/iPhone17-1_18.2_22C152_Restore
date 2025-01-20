@interface PKWatchDeviceImageOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKWatchDeviceImageOverlayView)initWithFrame:(CGRect)a3;
- (UIImage)overlayImage;
- (id)pk_childrenForAppearance;
- (void)layoutSubviews;
- (void)setOverlayImage:(id)a3;
@end

@implementation PKWatchDeviceImageOverlayView

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PKWatchDeviceImageOverlayView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKWatchDeviceImageOverlayView;
  v3 = -[PKWatchDeviceImageOverlayView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKWatchHeroImageView);
    watchView = v3->_watchView;
    v3->_watchView = v4;

    [(PKWatchHeroImageView *)v3->_watchView setHideDoneLabel:1];
    [(PKWatchDeviceImageOverlayView *)v3 addSubview:v3->_watchView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKWatchDeviceImageOverlayView;
  [(PKWatchDeviceImageOverlayView *)&v3 layoutSubviews];
  [(PKWatchDeviceImageOverlayView *)self bounds];
  -[PKWatchHeroImageView setFrame:](self->_watchView, "setFrame:");
}

- (void)setOverlayImage:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKWatchHeroImageView sizeThatFits:](self->_watchView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImage, 0);

  objc_storeStrong((id *)&self->_watchView, 0);
}

@end