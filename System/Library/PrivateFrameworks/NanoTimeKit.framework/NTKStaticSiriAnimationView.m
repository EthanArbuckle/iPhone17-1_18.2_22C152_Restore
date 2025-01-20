@interface NTKStaticSiriAnimationView
- (BOOL)usesLegibility;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKStaticSiriAnimationView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (UIColor)color;
- (UIColor)overrideColor;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
@end

@implementation NTKStaticSiriAnimationView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKStaticSiriAnimationView initWithFrame:forDevice:](self, "initWithFrame:forDevice:", a3, 0.0, 0.0, 44.0, 44.0);
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return 0;
}

- (NTKStaticSiriAnimationView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKStaticSiriAnimationView;
  v11 = -[NTKStaticSiriAnimationView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    NTKImageNamed(@"SiriHero");
  }

  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = [(CLKDevice *)self->_device sizeClass];
  double v4 = 33.0;
  if (!v3) {
    double v4 = 28.0;
  }
  double v5 = v4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  [(NTKStaticSiriAnimationView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  MEMORY[0x1C1874A70]([(NTKStaticSiriAnimationView *)self bounds]);
  imageView = self->_imageView;

  -[UIImageView setCenter:](imageView, "setCenter:");
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibilitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end