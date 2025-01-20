@interface TrailingFadeLabel
- (BOOL)isTextTruncated;
- (TrailingFadeLabel)initWithFrame:(CGRect)a3;
- (void)_updateFadeDirection;
- (void)_updateFadeVisibility;
- (void)_updateFadeWidth;
- (void)layoutSubviews;
@end

@implementation TrailingFadeLabel

- (TrailingFadeLabel)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TrailingFadeLabel;
  v3 = -[TrailingFadeLabel initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    v15 = +[UIColor whiteColor];
    id v6 = [v15 colorWithAlphaComponent:1.0];
    v17[0] = [v6 CGColor];
    v7 = +[UIColor whiteColor];
    id v8 = [v7 colorWithAlphaComponent:1.0];
    v17[1] = [v8 CGColor];
    v9 = +[UIColor whiteColor];
    id v10 = [v9 colorWithAlphaComponent:0.0];
    v17[2] = [v10 CGColor];
    v11 = +[UIColor whiteColor];
    id v12 = [v11 colorWithAlphaComponent:0.0];
    v17[3] = [v12 CGColor];
    v13 = +[NSArray arrayWithObjects:v17 count:4];
    [(CAGradientLayer *)v3->_gradientLayer setColors:v13];

    [(TrailingFadeLabel *)v3 _updateFadeDirection];
    [(TrailingFadeLabel *)v3 _updateFadeWidth];
    [(TrailingFadeLabel *)v3 _updateFadeVisibility];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TrailingFadeLabel;
  [(TrailingFadeLabel *)&v3 layoutSubviews];
  [(TrailingFadeLabel *)self _updateFadeWidth];
  [(TrailingFadeLabel *)self _updateFadeVisibility];
  [(TrailingFadeLabel *)self _updateFadeDirection];
}

- (void)_updateFadeWidth
{
  [(TrailingFadeLabel *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  [(TrailingFadeLabel *)self bounds];
  double v4 = -14.0 / v3;
  [(TrailingFadeLabel *)self bounds];
  v11[0] = &off_1001DCCB0;
  double v5 = v4 + 1.0;
  double v7 = -2.0 / v6;
  id v8 = +[NSNumber numberWithDouble:v5];
  v11[1] = v8;
  v9 = +[NSNumber numberWithDouble:v7 + 1.0];
  v11[2] = v9;
  v11[3] = &off_1001DCCC0;
  id v10 = +[NSArray arrayWithObjects:v11 count:4];
  [(CAGradientLayer *)self->_gradientLayer setLocations:v10];

  [(CAGradientLayer *)self->_gradientLayer setNeedsDisplay];
}

- (void)_updateFadeDirection
{
  id v3 = [(TrailingFadeLabel *)self effectiveUserInterfaceLayoutDirection];
  if (v3 == (id)1) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  if (v3 == (id)1) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(CAGradientLayer *)self->_gradientLayer setStartPoint:v4];
  gradientLayer = self->_gradientLayer;

  -[CAGradientLayer setEndPoint:](gradientLayer, "setEndPoint:", v5, 0.0);
}

- (void)_updateFadeVisibility
{
  if ([(TrailingFadeLabel *)self isTextTruncated])
  {
    gradientLayer = self->_gradientLayer;
    double v4 = [(TrailingFadeLabel *)self layer];
    id v6 = v4;
    double v5 = gradientLayer;
  }
  else
  {
    double v4 = [(TrailingFadeLabel *)self layer];
    id v6 = v4;
    double v5 = 0;
  }
  [v4 setMask:v5];
}

- (BOOL)isTextTruncated
{
  id v3 = [(TrailingFadeLabel *)self attributedText];
  [(TrailingFadeLabel *)self bounds];
  [v3 boundingRectWithSize:1 options:0 context:1.79769313e308 v4];
  double v6 = v5;

  [(TrailingFadeLabel *)self bounds];
  return v6 > v7;
}

- (void).cxx_destruct
{
}

@end