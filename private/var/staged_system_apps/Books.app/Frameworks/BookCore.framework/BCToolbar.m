@interface BCToolbar
- (double)_imageButtonMargin;
- (double)imageButtonMarginOverride;
- (void)setBackgroundHidden:(BOOL)a3;
- (void)setImageButtonMarginOverride:(double)a3;
- (void)setSeparatorsVisible:(BOOL)a3;
@end

@implementation BCToolbar

- (void)setSeparatorsVisible:(BOOL)a3
{
}

- (void)setBackgroundHidden:(BOOL)a3
{
  if (a3)
  {
    id v4 = (id)objc_opt_new();
    [(BCToolbar *)self setBackgroundImage:v4 forToolbarPosition:0 barMetrics:0];
  }
  else
  {
    [(BCToolbar *)self setBackgroundImage:0 forToolbarPosition:0 barMetrics:0];
  }
}

- (double)_imageButtonMargin
{
  [(BCToolbar *)self imageButtonMarginOverride];
  if (v3 <= 0.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)BCToolbar;
    [(BCToolbar *)&v5 _imageButtonMargin];
  }
  else
  {
    [(BCToolbar *)self imageButtonMarginOverride];
  }
  return result;
}

- (double)imageButtonMarginOverride
{
  return self->_imageButtonMarginOverride;
}

- (void)setImageButtonMarginOverride:(double)a3
{
  self->_imageButtonMarginOverride = a3;
}

@end