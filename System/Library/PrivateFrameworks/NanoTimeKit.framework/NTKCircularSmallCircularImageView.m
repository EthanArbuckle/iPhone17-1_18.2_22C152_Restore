@interface NTKCircularSmallCircularImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (CDComplicationImageView)imageView;
- (NTKCircularSmallCircularImageView)initWithFrame:(CGRect)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
- (void)setUsesMediumLayout:(BOOL)a3;
@end

@implementation NTKCircularSmallCircularImageView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKCircularSmallCircularImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCircularSmallCircularImageView;
  id v3 = -[NTKCircularComplicationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NTKCircularComplicationView *)v3 setWantsPlatter:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCircularSmallCircularImageView;
  [(NTKCircularComplicationView *)&v12 layoutSubviews];
  [(NTKCircularSmallCircularImageView *)self bounds];
  [(CDComplicationImageView *)self->_imageView sizeToFit];
  [(CDComplicationImageView *)self->_imageView frame];
  id v3 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v5, v7, v9, v11);
}

- (void)setUsesMediumLayout:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCircularSmallCircularImageView;
  [(NTKCircularComplicationView *)&v3 setUsesMediumLayout:a3];
}

- (void)_updateForTemplateChange
{
  id v10 = [(NTKCircularComplicationView *)self complicationTemplate];
  objc_super v3 = [v10 imageProvider];
  imageView = self->_imageView;
  double v5 = [(CDComplicationImageView *)imageView imageProvider];
  char v6 = [off_1E62BD5F0 existingImageView:imageView supportsImageProvider:v5];

  double v7 = self->_imageView;
  if ((v6 & 1) == 0)
  {
    [(CDComplicationImageView *)v7 removeFromSuperview];
    double v8 = [off_1E62BD5F0 viewForImageProvider:v3];
    double v9 = self->_imageView;
    self->_imageView = v8;

    if (self->_imageView)
    {
      -[NTKCircularSmallCircularImageView addSubview:](self, "addSubview:");
      double v7 = self->_imageView;
    }
    else
    {
      double v7 = 0;
    }
  }
  [(CDComplicationImageView *)v7 setImageProvider:v3];
  [(NTKCircularComplicationView *)self _updateImageViewColor:self->_imageView];
  [(NTKCircularSmallCircularImageView *)self setNeedsLayout];
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end