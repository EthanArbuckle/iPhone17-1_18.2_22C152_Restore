@interface MapsFadingLabel
- (BOOL)isTruncated;
- (CAGradientLayer)gradientLayer;
- (CALayer)containerLayer;
- (CALayer)maskLayer;
- (CALayer)multiLineFillLayer;
- (MapsFadingLabel)initWithFrame:(CGRect)a3;
- (MapsFadingLabelDelegate)delegate;
- (double)_lineHeight;
- (double)trailingPadding;
- (void)_localeDidChangeNotification:(id)a3;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_updateFadeDirection;
- (void)_updateFadeVisibility;
- (void)_updateFadeWidth;
- (void)layoutSubviews;
- (void)setContainerLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setMaskLayer:(id)a3;
- (void)setMultiLineFillLayer:(id)a3;
- (void)setText:(id)a3;
- (void)setTrailingPadding:(double)a3;
- (void)setTruncated:(BOOL)a3;
@end

@implementation MapsFadingLabel

- (MapsFadingLabel)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)MapsFadingLabel;
  v3 = -[MapsFadingLabel initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MapsFadingLabel *)v3 setLineBreakStrategy:0];
    [(MapsFadingLabel *)v4 setLineBreakMode:2];
    v5 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = v5;

    uint64_t v7 = kCAFilterDestOut;
    [(CAGradientLayer *)v4->_gradientLayer setCompositingFilter:kCAFilterDestOut];
    [(CAGradientLayer *)v4->_gradientLayer setLocations:&off_1013AE5B0];
    id v8 = +[UIColor whiteColor];
    v31[0] = [v8 CGColor];
    id v9 = +[UIColor whiteColor];
    v31[1] = [v9 CGColor];
    id v10 = +[UIColor clearColor];
    v31[2] = [v10 CGColor];
    id v11 = +[UIColor clearColor];
    v31[3] = [v11 CGColor];
    v12 = +[NSArray arrayWithObjects:v31 count:4];
    [(CAGradientLayer *)v4->_gradientLayer setColors:v12];

    uint64_t v13 = objc_opt_new();
    multiLineFillLayer = v4->_multiLineFillLayer;
    v4->_multiLineFillLayer = (CALayer *)v13;

    id v15 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v4->_multiLineFillLayer, "setBackgroundColor:", [v15 CGColor]);

    [(CALayer *)v4->_multiLineFillLayer setCompositingFilter:v7];
    uint64_t v16 = objc_opt_new();
    maskLayer = v4->_maskLayer;
    v4->_maskLayer = (CALayer *)v16;

    id v18 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v4->_maskLayer, "setBackgroundColor:", [v18 CGColor]);

    uint64_t v19 = objc_opt_new();
    containerLayer = v4->_containerLayer;
    v4->_containerLayer = (CALayer *)v19;

    id v21 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v4->_containerLayer, "setBackgroundColor:", [v21 CGColor]);

    [(CALayer *)v4->_containerLayer setCompositingFilter:v7];
    [(CALayer *)v4->_containerLayer addSublayer:v4->_multiLineFillLayer];
    [(CALayer *)v4->_containerLayer addSublayer:v4->_gradientLayer];
    [(CALayer *)v4->_maskLayer addSublayer:v4->_containerLayer];
    [(MapsFadingLabel *)v4 _updateFadeDirection];
    [(MapsFadingLabel *)v4 _updateFadeWidth];
    [(MapsFadingLabel *)v4 _updateFadeVisibility];
    uint64_t v30 = objc_opt_class();
    v22 = +[NSArray arrayWithObjects:&v30 count:1];
    id v23 = [(MapsFadingLabel *)v4 registerForTraitChanges:v22 withAction:"_preferredContentSizeCategoryDidChange"];

    uint64_t v29 = objc_opt_class();
    v24 = +[NSArray arrayWithObjects:&v29 count:1];
    id v25 = [(MapsFadingLabel *)v4 registerForTraitChanges:v24 withAction:"_updateFadeDirection"];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v4 selector:"_localeDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MapsFadingLabel;
  [(MapsFadingLabel *)&v3 layoutSubviews];
  [(MapsFadingLabel *)self _updateFadeWidth];
  [(MapsFadingLabel *)self _updateFadeVisibility];
}

- (void)setFont:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsFadingLabel;
  [(MapsFadingLabel *)&v4 setFont:a3];
  [(MapsFadingLabel *)self _updateFadeWidth];
  [(MapsFadingLabel *)self _updateFadeVisibility];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsFadingLabel;
  [(MapsFadingLabel *)&v4 setText:a3];
  [(MapsFadingLabel *)self _updateFadeVisibility];
}

- (void)_preferredContentSizeCategoryDidChange
{
  [(MapsFadingLabel *)self _updateFadeWidth];

  [(MapsFadingLabel *)self _updateFadeVisibility];
}

- (void)_updateFadeWidth
{
  [(MapsFadingLabel *)self bounds];
  -[CALayer setFrame:](self->_maskLayer, "setFrame:");
  [(MapsFadingLabel *)self bounds];
  -[CALayer setFrame:](self->_containerLayer, "setFrame:");
  [(MapsFadingLabel *)self _lineHeight];
  double v4 = v3;
  [(MapsFadingLabel *)self bounds];
  double v6 = v5 - v4;
  [(MapsFadingLabel *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", 0.0, v6);
  [(MapsFadingLabel *)self bounds];
  double v8 = v7;
  [(MapsFadingLabel *)self bounds];
  -[CALayer setFrame:](self->_multiLineFillLayer, "setFrame:", 0.0, 0.0, v8, v9 - v4);
  id v10 = [(MapsFadingLabel *)self font];
  id v11 = [(MapsFadingLabel *)self traitCollection];
  v12 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v11];

  [(MapsFadingLabel *)self trailingPadding];
  double v14 = v13;
  [(MapsFadingLabel *)self frame];
  double v16 = v15;
  [v12 _bodyLeading];
  double v18 = 100.0;
  if (v17 + v17 < 100.0)
  {
    [v12 _bodyLeading];
    double v18 = v19 + v19;
  }
  [(MapsFadingLabel *)self frame];
  v25[0] = &off_1013AF568;
  double v21 = 1.0 - v14 / v16;
  v22 = +[NSNumber numberWithDouble:v21 - v18 / v20];
  v25[1] = v22;
  id v23 = +[NSNumber numberWithDouble:v21];
  v25[2] = v23;
  v25[3] = &off_1013AF598;
  v24 = +[NSArray arrayWithObjects:v25 count:4];
  [(CAGradientLayer *)self->_gradientLayer setLocations:v24];

  [(CALayer *)self->_maskLayer setNeedsDisplay];
  [(CALayer *)self->_containerLayer setNeedsDisplay];
  [(CAGradientLayer *)self->_gradientLayer setNeedsDisplay];
  [(CALayer *)self->_multiLineFillLayer setNeedsDisplay];
}

- (void)_updateFadeDirection
{
  id v3 = [(MapsFadingLabel *)self effectiveUserInterfaceLayoutDirection];
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
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v4, 0.5);
  gradientLayer = self->_gradientLayer;

  -[CAGradientLayer setEndPoint:](gradientLayer, "setEndPoint:", v5, 0.5);
}

- (void)_updateFadeVisibility
{
  id v4 = [(MapsFadingLabel *)self font];
  [v4 leading];
  [(MapsFadingLabel *)self setTruncated:[(MapsFadingLabel *)self isTextTruncatedIgnoringLeading:v3 < 0.0]];
}

- (double)_lineHeight
{
  [(MapsFadingLabel *)self _firstBaselineOffsetFromTop];
  double v4 = v3;
  [(MapsFadingLabel *)self _baselineOffsetFromBottom];
  double v6 = v4 + v5;
  double v7 = [(MapsFadingLabel *)self font];
  [v7 lineHeight];
  if (v6 > v8)
  {
    [(MapsFadingLabel *)self _firstBaselineOffsetFromTop];
    double v13 = v12;
    [(MapsFadingLabel *)self _baselineOffsetFromBottom];
    double v11 = v13 + v14;
  }
  else
  {
    double v9 = [(MapsFadingLabel *)self font];
    [v9 lineHeight];
    double v11 = v10;
  }
  return v11;
}

- (void)setTruncated:(BOOL)a3
{
  if (self->_truncated != a3)
  {
    self->_truncated = a3;
    if (a3)
    {
      maskLayer = self->_maskLayer;
      double v5 = [(MapsFadingLabel *)self layer];
      double v6 = v5;
      double v7 = maskLayer;
    }
    else
    {
      double v5 = [(MapsFadingLabel *)self layer];
      double v6 = v5;
      double v7 = 0;
    }
    [v5 setMask:v7];

    id v8 = [(MapsFadingLabel *)self delegate];
    [v8 fadingLabelTruncationChanged:self];
  }
}

- (void)setTrailingPadding:(double)a3
{
  if (self->_trailingPadding != a3)
  {
    self->_trailingPadding = a3;
    [(MapsFadingLabel *)self _updateFadeWidth];
  }
}

- (void)_localeDidChangeNotification:(id)a3
{
  [(MapsFadingLabel *)self _updateFadeWidth];

  [(MapsFadingLabel *)self _updateFadeDirection];
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

- (double)trailingPadding
{
  return self->_trailingPadding;
}

- (MapsFadingLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsFadingLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
}

- (CALayer)multiLineFillLayer
{
  return self->_multiLineFillLayer;
}

- (void)setMultiLineFillLayer:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_multiLineFillLayer, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end