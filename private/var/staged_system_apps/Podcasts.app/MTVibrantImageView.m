@interface MTVibrantImageView
- (MTVibrantImageView)initWithFrame:(CGRect)a3;
- (UIColor)vibrancyColor;
- (UIImage)image;
- (UIImageView)imageView;
- (UIView)vibrancyView;
- (id)compositingFilter;
- (void)setCompositingFilter:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setVibrancyColor:(id)a3;
- (void)setVibrancyView:(id)a3;
@end

@implementation MTVibrantImageView

- (MTVibrantImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)MTVibrantImageView;
  v7 = -[MTVibrantImageView initWithFrame:](&v16, "initWithFrame:");
  if (v7)
  {
    v8 = [objc_alloc((Class)UIImageView) initWithFrame:x, y, width, height];
    imageView = v7->_imageView;
    v7->_imageView = v8;

    [(UIImageView *)v7->_imageView setAutoresizingMask:18];
    [(UIImageView *)v7->_imageView setContentMode:2];
    [(MTVibrantImageView *)v7 addSubview:v7->_imageView];
    v10 = [objc_alloc((Class)UIView) initWithFrame:x, y, width, height];
    vibrancyView = v7->_vibrancyView;
    v7->_vibrancyView = v10;

    uint64_t v12 = kCAFilterPlusL;
    v13 = [(UIView *)v7->_vibrancyView layer];
    [v13 setCompositingFilter:v12];

    [(UIView *)v7->_vibrancyView setAutoresizingMask:18];
    v14 = +[UIColor colorWithWhite:1.0 alpha:0.4];
    [(UIView *)v7->_vibrancyView setBackgroundColor:v14];

    [(MTVibrantImageView *)v7 addSubview:v7->_vibrancyView];
  }
  return v7;
}

- (void)setImage:(id)a3
{
}

- (id)compositingFilter
{
  v2 = [(UIView *)self->_vibrancyView layer];
  v3 = [v2 compositingFilter];

  return v3;
}

- (void)setCompositingFilter:(id)a3
{
  vibrancyView = self->_vibrancyView;
  id v4 = a3;
  id v5 = [(UIView *)vibrancyView layer];
  [v5 setCompositingFilter:v4];
}

- (UIColor)vibrancyColor
{
  return [(UIView *)self->_vibrancyView backgroundColor];
}

- (void)setVibrancyColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end