@interface PKWatchDeviceAppCarouselView
- (CGSize)_appIconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKWatchDeviceAppCarouselView)initWithFrame:(CGRect)a3;
- (UIImage)appIconImage;
- (id)_carouselViewImage;
- (void)layoutSubviews;
- (void)setAppIconImage:(id)a3;
@end

@implementation PKWatchDeviceAppCarouselView

- (PKWatchDeviceAppCarouselView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)PKWatchDeviceAppCarouselView;
  v7 = -[PKWatchDeviceAppCarouselView initWithFrame:](&v17, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[PKWatchHeroImageView initWithFrame:]([PKWatchHeroImageView alloc], "initWithFrame:", x, y, width, height);
    watchDeviceImageView = v7->_watchDeviceImageView;
    v7->_watchDeviceImageView = v8;

    [(PKWatchHeroImageView *)v7->_watchDeviceImageView setHideDoneLabel:1];
    [(PKWatchDeviceAppCarouselView *)v7 addSubview:v7->_watchDeviceImageView];
    id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
    v11 = [(PKWatchDeviceAppCarouselView *)v7 _carouselViewImage];
    uint64_t v12 = [v10 initWithImage:v11];
    carouselImageView = v7->_carouselImageView;
    v7->_carouselImageView = (UIImageView *)v12;

    [(UIImageView *)v7->_carouselImageView setContentMode:1];
    [(PKWatchHeroImageView *)v7->_watchDeviceImageView addSubview:v7->_carouselImageView];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    appIconImageView = v7->_appIconImageView;
    v7->_appIconImageView = (UIImageView *)v14;

    [(UIImageView *)v7->_appIconImageView setContentMode:1];
    [(PKWatchHeroImageView *)v7->_watchDeviceImageView addSubview:v7->_appIconImageView];
  }
  return v7;
}

- (void)setAppIconImage:(id)a3
{
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKWatchDeviceAppCarouselView;
  [(PKWatchDeviceAppCarouselView *)&v10 layoutSubviews];
  [(PKWatchDeviceAppCarouselView *)self bounds];
  -[PKWatchHeroImageView setFrame:](self->_watchDeviceImageView, "setFrame:");
  carouselImageView = self->_carouselImageView;
  [(PKWatchHeroImageView *)self->_watchDeviceImageView watchScreenFrame];
  -[UIImageView setFrame:](carouselImageView, "setFrame:");
  appIconImageView = self->_appIconImageView;
  [(PKWatchHeroImageView *)self->_watchDeviceImageView watchScreenCenter];
  -[UIImageView setCenter:](appIconImageView, "setCenter:");
  v5 = self->_appIconImageView;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PKWatchDeviceAppCarouselView *)self _appIconSize];
  -[UIImageView setFrame:](v5, "setFrame:", v6, v7, v8, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKWatchHeroImageView sizeThatFits:](self->_watchDeviceImageView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)_carouselViewImage
{
  unint64_t v2 = +[PKBridgeWatchAttributeController heroWatchSize];
  if (v2 > 4)
  {
    double v3 = 0;
  }
  else
  {
    double v3 = PKUIImageNamed(off_1E59D8D58[v2]);
  }

  return v3;
}

- (CGSize)_appIconSize
{
  unint64_t v3 = +[PKBridgeWatchAttributeController heroWatchSize];
  PKScreenScale();
  double v5 = 0.0;
  if (v3 <= 4)
  {
    double v6 = (double *)&unk_1A0444AA8;
    if (v4 > 2.0) {
      double v6 = (double *)&unk_1A0444A80;
    }
    double v5 = v6[v3];
  }
  [(PKWatchHeroImageView *)self->_watchDeviceImageView watchDeviceImageScaleFactor];
  double v8 = v5 * v7;
  double v9 = v8;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (UIImage)appIconImage
{
  return self->_appIconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
  objc_storeStrong((id *)&self->_carouselImageView, 0);

  objc_storeStrong((id *)&self->_watchDeviceImageView, 0);
}

@end