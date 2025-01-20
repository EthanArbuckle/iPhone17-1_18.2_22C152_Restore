@interface _SFHairlineBorderView
- (UIColor)borderColor;
- (_SFHairlineBorderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBorderColor:(id)a3;
@end

@implementation _SFHairlineBorderView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_SFHairlineBorderView;
  [(_SFHairlineBorderView *)&v5 layoutSubviews];
  v3 = [(UIColor *)self->_borderColor CGColor];
  v4 = [(_SFHairlineBorderView *)self layer];
  [v4 setBorderColor:v3];
}

- (void)setBorderColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  borderColor = self->_borderColor;
  if (borderColor != v5)
  {
    v8 = v5;
    char v7 = [(UIColor *)borderColor isEqual:v5];
    objc_super v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_borderColor, a3);
      [(_SFHairlineBorderView *)self setNeedsLayout];
      objc_super v5 = v8;
    }
  }
}

- (_SFHairlineBorderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFHairlineBorderView;
  v3 = -[_SFHairlineBorderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_SFSiteIcon cornerRadius];
    -[_SFHairlineBorderView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:");
    double v4 = _SFOnePixel();
    objc_super v5 = [(_SFHairlineBorderView *)v3 layer];
    [v5 setBorderWidth:v4];

    v6 = v3;
  }

  return v3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void).cxx_destruct
{
}

@end