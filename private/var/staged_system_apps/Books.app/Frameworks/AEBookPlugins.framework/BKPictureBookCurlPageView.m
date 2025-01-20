@interface BKPictureBookCurlPageView
- (BKPictureBookCurlPageView)initWithFrame:(CGRect)a3;
- (BOOL)drawsSpine;
- (BOOL)isMirror;
- (BOOL)isNightMode;
- (BOOL)isRight;
- (BOOL)shouldAnimate;
- (BOOL)shouldHaveGradient;
- (BOOL)useNightColors;
- (CAGradientLayer)largeGradientLayer;
- (UIImage)image;
- (UIView)topView;
- (double)duration;
- (double)scale;
- (id)description;
- (int64_t)pageOffset;
- (void)addGutter:(BOOL)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pageCurlWillCancel;
- (void)reset;
- (void)setDrawsSpine:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setImage:(id)a3;
- (void)setLargeGradientLayer:(id)a3;
- (void)setMirror:(BOOL)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)setRight:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setShouldAnimate:(BOOL)a3;
- (void)setShouldHaveGradient:(BOOL)a3;
- (void)setTopView:(id)a3 isRightPage:(BOOL)a4;
- (void)setUseNightColors:(BOOL)a3;
- (void)updateCurlPercent:(double)a3;
@end

@implementation BKPictureBookCurlPageView

- (BKPictureBookCurlPageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKPictureBookCurlPageView;
  v3 = -[BKPictureBookCurlPageView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKPictureBookCurlPageView *)v3 setOpaque:1];
    if ([(BKPictureBookCurlPageView *)v4 isNightMode]) {
      +[UIColor blackColor];
    }
    else {
    v5 = +[UIColor whiteColor];
    }
    [(BKPictureBookCurlPageView *)v4 setBackgroundColor:v5];

    [(BKPictureBookCurlPageView *)v4 setClipsToBounds:1];
    v4->_scale = 1.0;
    v6 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(UIImageView *)self->_imageView removeFromSuperview];
  [(UIImageView *)self->_gutter removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookCurlPageView;
  [(BKPictureBookCurlPageView *)&v3 dealloc];
}

- (BOOL)isNightMode
{
  v2 = [(BKPictureBookCurlPageView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == (char *)&dword_0 + 2 || UIAccessibilityIsInvertColorsEnabled();

  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookCurlPageView;
  [(BKPictureBookCurlPageView *)&v9 layoutSubviews];
  BOOL v3 = [(UIImageView *)self->_gutter image];
  v4 = v3;
  if (v3)
  {
    [v3 size];
    double v6 = v5 * self->_scale;
    [(UIImageView *)self->_gutter frame];
    double v8 = v7;
    [(BKPictureBookCurlPageView *)self bounds];
    -[UIImageView setFrame:](self->_gutter, "setFrame:", v8, 0.0, v6, CGRectGetHeight(v10));
  }
  [(BKPictureBookCurlPageView *)self bounds];
  -[CAGradientLayer setFrame:](self->_largeGradientLayer, "setFrame:");
  [(BKPictureBookCurlPageView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v10 = v4;
  if (self->_imageView)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v6 = objc_alloc((Class)UIImageView);
    [(BKPictureBookCurlPageView *)self bounds];
    double v7 = (UIImageView *)[v6 initWithFrame:];
    imageView = self->_imageView;
    self->_imageView = v7;

    [(UIImageView *)self->_imageView setAutoresizingMask:18];
    [(UIImageView *)self->_imageView setContentMode:2];
    objc_super v9 = [(UIImageView *)self->_imageView layer];
    [v9 setMagnificationFilter:kCAFilterLinear];

    [(BKPictureBookCurlPageView *)self insertSubview:self->_imageView atIndex:0];
    id v5 = v10;
    if (v10) {
      goto LABEL_3;
    }
  }
  [(BKPictureBookCurlPageView *)self addGutter:self->_right];
  id v5 = v10;
LABEL_3:
  [(UIImageView *)self->_imageView setImage:v5];
}

- (void)reset
{
  [(UIImageView *)self->_imageView setImage:0];
  BOOL v3 = [(BKPictureBookCurlPageView *)self layer];
  [v3 setMask:0];

  [(UIImageView *)self->_gutter removeFromSuperview];
  gutter = self->_gutter;
  self->_gutter = 0;
}

- (void)setTopView:(id)a3 isRightPage:(BOOL)a4
{
  BOOL v4 = a4;
  self->_right = a4;
  id obj = a3;
  [(BKPictureBookCurlPageView *)self bounds];
  [obj setFrame:];
  [(BKPictureBookCurlPageView *)self addSubview:obj];
  [(BKPictureBookCurlPageView *)self addGutter:v4];
  [(BKPictureBookCurlPageView *)self setClipsToBounds:1];
  objc_storeWeak((id *)&self->_topView, obj);
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setMirror:(BOOL)a3
{
  self->_mirror = a3;
  BOOL v4 = [(BKPictureBookCurlPageView *)self layer];
  id v5 = v4;
  if (v4) {
    [v4 sublayerTransform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CATransform3DScale(&v9, &v8, -1.0, 1.0, 1.0);
  id v6 = [(BKPictureBookCurlPageView *)self layer];
  CATransform3D v7 = v9;
  [v6 setSublayerTransform:&v7];
}

- (void)addGutter:(BOOL)a3
{
  if (!self->_gutter && self->_drawsSpine)
  {
    BOOL v4 = a3;
    id v10 = +[UIImage imageNamed:@"PictureBookSpine.png"];
    id v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v10];
    gutter = self->_gutter;
    self->_gutter = v5;

    [(BKPictureBookCurlPageView *)self addSubview:self->_gutter];
    [v10 size];
    double v8 = v7 * self->_scale;
    if (v4)
    {
      double v9 = v8 * -0.5;
    }
    else
    {
      [(BKPictureBookCurlPageView *)self bounds];
      double v9 = CGRectGetWidth(v12) + v8 * -0.5;
    }
    [(BKPictureBookCurlPageView *)self bounds];
    -[UIImageView setFrame:](self->_gutter, "setFrame:", v9, 0.0, v8, CGRectGetHeight(v13));
  }
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookCurlPageView;
  BOOL v3 = [(BKPictureBookCurlPageView *)&v14 description];
  if (self->_right) {
    CFStringRef v4 = @"Yes";
  }
  else {
    CFStringRef v4 = @"No";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topView);
  int64_t pageOffset = self->_pageOffset;
  double v7 = [(BKPictureBookCurlPageView *)self layer];
  double v8 = [v7 mask];
  if (v8)
  {
    double v9 = [(BKPictureBookCurlPageView *)self layer];
    id v10 = [v9 mask];
    v11 = [v10 description];
    CGRect v12 = +[NSString stringWithFormat:@"%@ isRight=%@ topView=%p pageOffset=%ld mask=%@", v3, v4, WeakRetained, pageOffset, v11];
  }
  else
  {
    CGRect v12 = +[NSString stringWithFormat:@"%@ isRight=%@ topView=%p pageOffset=%ld mask=%@", v3, v4, WeakRetained, pageOffset, @"<nil>"];
  }

  return v12;
}

- (void)setShouldHaveGradient:(BOOL)a3
{
  largeGradientLayer = self->_largeGradientLayer;
  if (a3)
  {
    if (!largeGradientLayer)
    {
      id v6 = (CAGradientLayer *)objc_opt_new();
      double v7 = self->_largeGradientLayer;
      self->_largeGradientLayer = v6;

      [(BKPictureBookCurlPageView *)self bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      unsigned __int8 v16 = [(BKPictureBookCurlPageView *)self isRight];
      unsigned int v17 = [(BKPictureBookCurlPageView *)self useNightColors];
      if (v16)
      {
        if (v17)
        {
          id v18 = +[UIColor colorWithWhite:0.519999981 alpha:0.219999999];
          id v19 = [v18 CGColor];
          id v20 = +[UIColor colorWithWhite:0.529999971 alpha:0.389999986];
          id v21 = [v20 CGColor];
          double v22 = 0.0;
          id v23 = +[UIColor colorWithWhite:1.0 alpha:0.0];
          v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v21, [v23 CGColor], 0);

          v25 = +[NSNumber numberWithFloat:0.0];
          LODWORD(v26) = 1036831949;
          v27 = +[NSNumber numberWithFloat:v26];
          LODWORD(v28) = 1.0;
          v29 = +[NSNumber numberWithFloat:v28];
          v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, 0);
          double v31 = 0.639999986;
LABEL_13:

          -[CAGradientLayer setFrame:](self->_largeGradientLayer, "setFrame:", v9, v11, v13, v15);
          -[CAGradientLayer setStartPoint:](self->_largeGradientLayer, "setStartPoint:", v22, 0.5);
          -[CAGradientLayer setEndPoint:](self->_largeGradientLayer, "setEndPoint:", v31, 0.5);
          [(CAGradientLayer *)self->_largeGradientLayer setColors:v24];
          [(CAGradientLayer *)self->_largeGradientLayer setLocations:v30];
          if (self->_animate)
          {
            v53 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
            v54 = +[NSNumber numberWithFloat:0.0];
            [v53 setFromValue:v54];

            LODWORD(v55) = 1.0;
            v56 = +[NSNumber numberWithFloat:v55];
            [v53 setToValue:v56];

            [v53 setDuration:self->_duration];
            v57 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [v53 setTimingFunction:v57];

            v58 = self->_largeGradientLayer;
            v59 = +[NSDictionary dictionaryWithObject:v53 forKey:kCAOnOrderIn];
            [(CAGradientLayer *)v58 setActions:v59];
          }
          else
          {
            [(CAGradientLayer *)self->_largeGradientLayer setOpacity:0.0];
          }
          v60 = [(BKPictureBookCurlPageView *)self layer];
          [v60 addSublayer:self->_largeGradientLayer];

          goto LABEL_17;
        }
        v63 = +[UIColor blackColor];
        id v39 = [v63 colorWithAlphaComponent:0.129999995];
        id v61 = [v39 CGColor];
        v40 = +[UIColor blackColor];
        id v41 = [v40 colorWithAlphaComponent:0.0500000007];
        id v42 = [v41 CGColor];
        v43 = +[UIColor blackColor];
        id v44 = [v43 colorWithAlphaComponent:0.230000004];
        v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v61, v42, [v44 CGColor], 0);

        v25 = +[NSNumber numberWithFloat:0.0];
        LODWORD(v45) = 1051763671;
      }
      else
      {
        if (v17)
        {
          double v31 = 1.0;
          id v32 = +[UIColor colorWithWhite:1.0 alpha:0.0];
          id v33 = [v32 CGColor];
          id v34 = +[UIColor colorWithWhite:0.529999971 alpha:0.389999986];
          id v35 = [v34 CGColor];
          id v36 = +[UIColor colorWithWhite:0.519999981 alpha:0.219999999];
          v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v33, v35, [v36 CGColor], 0);

          v25 = +[NSNumber numberWithFloat:0.0];
          LODWORD(v37) = 1063675494;
          v27 = +[NSNumber numberWithFloat:v37];
          LODWORD(v38) = 1.0;
          v29 = +[NSNumber numberWithFloat:v38];
          v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, 0);
          double v22 = 0.360000014;
          goto LABEL_13;
        }
        v64 = +[UIColor blackColor];
        id v46 = [v64 colorWithAlphaComponent:0.230000004];
        id v62 = [v46 CGColor];
        v47 = +[UIColor blackColor];
        id v48 = [v47 colorWithAlphaComponent:0.0500000007];
        id v49 = [v48 CGColor];
        v50 = +[UIColor blackColor];
        id v51 = [v50 colorWithAlphaComponent:0.129999995];
        v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v62, v49, [v51 CGColor], 0);

        v25 = +[NSNumber numberWithFloat:0.0];
        LODWORD(v45) = 1059565076;
      }
      v27 = +[NSNumber numberWithFloat:v45];
      LODWORD(v52) = 1.0;
      v29 = +[NSNumber numberWithFloat:v52];
      v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, 0);
      double v22 = 0.0;
      double v31 = 1.0;
      goto LABEL_13;
    }
  }
  else if (largeGradientLayer)
  {
    [(CAGradientLayer *)largeGradientLayer removeFromSuperlayer];
    v24 = self->_largeGradientLayer;
    self->_largeGradientLayer = 0;
LABEL_17:
  }
  self->_hasGradient = a3;
}

- (void)updateCurlPercent:(double)a3
{
  double v3 = 0.5;
  if (!self->_useNightColors) {
    double v3 = 1.0;
  }
  double v4 = v3 * a3;
  if (self->_hasGradient && v4 < 1.0)
  {
    *(float *)&double v4 = v4;
    [(CAGradientLayer *)self->_largeGradientLayer setOpacity:v4];
  }
}

- (void)pageCurlWillCancel
{
  id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  double v3 = +[NSNumber numberWithFloat:0.0];
  [v5 setToValue:v3];

  [v5 setDuration:0.1];
  double v4 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v5 setTimingFunction:v4];

  [v5 setRemovedOnCompletion:0];
  [v5 setFillMode:kCAFillModeForwards];
  [(CAGradientLayer *)self->_largeGradientLayer addAnimation:v5 forKey:@"largeGradientOrderOut"];
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (void)setDrawsSpine:(BOOL)a3
{
  self->_drawsSpine = a3;
}

- (CAGradientLayer)largeGradientLayer
{
  return self->_largeGradientLayer;
}

- (void)setLargeGradientLayer:(id)a3
{
}

- (BOOL)useNightColors
{
  return self->_useNightColors;
}

- (void)setUseNightColors:(BOOL)a3
{
  self->_useNightColors = a3;
}

- (BOOL)shouldHaveGradient
{
  return self->_hasGradient;
}

- (BOOL)shouldAnimate
{
  return self->_animate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isRight
{
  return self->_right;
}

- (void)setRight:(BOOL)a3
{
  self->_right = a3;
}

- (UIView)topView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topView);

  return (UIView *)WeakRetained;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_int64_t pageOffset = a3;
}

- (BOOL)isMirror
{
  return self->_mirror;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeGradientLayer, 0);
  objc_storeStrong((id *)&self->_gutter, 0);
  objc_destroyWeak((id *)&self->_topView);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end