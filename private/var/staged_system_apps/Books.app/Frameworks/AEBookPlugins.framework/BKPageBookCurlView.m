@interface BKPageBookCurlView
- (BKPageBookCurlView)initWithImage:(id)a3 borderColor:(id)a4 isLeft:(BOOL)a5;
- (BKPageBookCurlView)initWithImage:(id)a3 borderColor:(id)a4 isLeft:(BOOL)a5 gutterImage:(id)a6;
- (BOOL)isLeft;
- (BOOL)shouldAnimate;
- (BOOL)shouldHaveGradient;
- (BOOL)useInvertedColors;
- (CALayer)smallGradientLayer;
- (UIImage)image;
- (double)duration;
- (void)pageCurlWillCancel;
- (void)pageCurlWillCancelWithDuration:(double)a3;
- (void)setDuration:(double)a3;
- (void)setImage:(id)a3;
- (void)setLeft:(BOOL)a3;
- (void)setShouldAnimate:(BOOL)a3;
- (void)setShouldHaveGradient:(BOOL)a3;
- (void)setSmallGradientLayer:(id)a3;
- (void)setUseInvertedColors:(BOOL)a3;
- (void)takeSnapshotOfView:(id)a3;
- (void)takeSnapshotOfView:(id)a3 rect:(CGRect)a4;
- (void)takeSnapshotOfView:(id)a3 rect:(CGRect)a4 afterScreenUpdates:(BOOL)a5;
- (void)updateCurlPercent:(double)a3;
@end

@implementation BKPageBookCurlView

- (BKPageBookCurlView)initWithImage:(id)a3 borderColor:(id)a4 isLeft:(BOOL)a5
{
  return [(BKPageBookCurlView *)self initWithImage:a3 borderColor:a4 isLeft:a5 gutterImage:0];
}

- (BKPageBookCurlView)initWithImage:(id)a3 borderColor:(id)a4 isLeft:(BOOL)a5 gutterImage:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BKPageBookCurlView;
  v11 = [(BKPageBookCurlView *)&v26 init];
  v12 = v11;
  if (v11)
  {
    [(BKPageBookCurlView *)v11 setUserInteractionEnabled:0];
    v12->_left = v7;
    [v9 size];
    double v14 = v13;
    double v16 = v15;
    if (v9)
    {
      id v17 = [v9 CGImage];
      v18 = [(BKPageBookCurlView *)v12 layer];
      [v18 setContents:v17];
    }
    if (v10)
    {
      id v19 = [objc_alloc((Class)UIImageView) initWithImage:v10];
      [v10 size];
      double v21 = v20 * -0.5;
      if (v7) {
        double v22 = v14 + v21;
      }
      else {
        double v22 = v21;
      }
      [v10 size];
      [v19 setFrame:v22, 0.0, v23, v16];
      [(BKPageBookCurlView *)v12 addSubview:v19];
    }
    v24 = v12;
  }

  return v12;
}

- (void)takeSnapshotOfView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  -[BKPageBookCurlView takeSnapshotOfView:rect:afterScreenUpdates:](self, "takeSnapshotOfView:rect:afterScreenUpdates:", v4, 0);
}

- (void)takeSnapshotOfView:(id)a3 rect:(CGRect)a4
{
}

- (void)takeSnapshotOfView:(id)a3 rect:(CGRect)a4 afterScreenUpdates:(BOOL)a5
{
  v6 = [a3 resizableSnapshotViewFromRect:a5 afterScreenUpdates:a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [(BKPageBookCurlView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  [v6 bounds];
  if (v8 != v12 || v10 != v11)
  {
    CGSizeScaleThatFitsInCGSize();
    CGAffineTransformMakeScale(&v16, v14, v14);
    CGAffineTransform v15 = v16;
    [v6 setTransform:&v15];
    [(BKPageBookCurlView *)self bounds];
    [v6 setFrame:];
  }
  [(BKPageBookCurlView *)self addSubview:v6];
}

- (UIImage)image
{
  v3 = [(BKPageBookCurlView *)self layer];
  id v4 = [v3 contents];
  if (v4)
  {
    v5 = [(BKPageBookCurlView *)self layer];
    v6 = [v5 contents];
    double v7 = +[UIImage imageWithCGImage:v6];
  }
  else
  {
    double v7 = 0;
  }

  return (UIImage *)v7;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v7 = [(BKPageBookCurlView *)self layer];
  id v5 = v4;
  id v6 = [v5 CGImage];

  [v7 setContents:v6];
}

- (void)pageCurlWillCancel
{
  id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  v3 = +[NSNumber numberWithFloat:0.0];
  [v5 setToValue:v3];

  [v5 setDuration:0.1];
  id v4 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v5 setTimingFunction:v4];

  [v5 setRemovedOnCompletion:0];
  [v5 setFillMode:kCAFillModeForwards];
  [(CAGradientLayer *)self->_largeGradientLayer addAnimation:v5 forKey:@"largeGradientOrderOut"];
}

- (void)setShouldHaveGradient:(BOOL)a3
{
  largeGradientLayer = self->_largeGradientLayer;
  if (a3)
  {
    if (!largeGradientLayer)
    {
      id v6 = (CAGradientLayer *)objc_opt_new();
      id v7 = self->_largeGradientLayer;
      self->_largeGradientLayer = v6;

      [(BKPageBookCurlView *)self bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      unsigned int v16 = [(BKPageBookCurlView *)self isLeft];
      unsigned int v17 = [(BKPageBookCurlView *)self useInvertedColors];
      if (v16)
      {
        if (v17)
        {
          double v18 = 1.0;
          id v19 = +[UIColor colorWithWhite:1.0 alpha:0.0];
          id v20 = [v19 CGColor];
          id v21 = +[UIColor colorWithWhite:0.529999971 alpha:0.389999986];
          id v22 = [v21 CGColor];
          id v23 = +[UIColor colorWithWhite:0.519999981 alpha:0.219999999];
          smallGradientLayer = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v22, [v23 CGColor], 0);

          v25 = +[NSNumber numberWithFloat:0.0];
          LODWORD(v26) = 1063675494;
          v27 = +[NSNumber numberWithFloat:v26];
          LODWORD(v28) = 1.0;
          v29 = +[NSNumber numberWithFloat:v28];
          v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, 0);
          double v31 = 0.360000014;
LABEL_13:

          -[CAGradientLayer setFrame:](self->_largeGradientLayer, "setFrame:", v9, v11, v13, v15);
          -[CAGradientLayer setStartPoint:](self->_largeGradientLayer, "setStartPoint:", v31, 0.5);
          -[CAGradientLayer setEndPoint:](self->_largeGradientLayer, "setEndPoint:", v18, 0.5);
          [(CAGradientLayer *)self->_largeGradientLayer setColors:smallGradientLayer];
          [(CAGradientLayer *)self->_largeGradientLayer setLocations:v30];
          if (self->_animate)
          {
            v54 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
            v55 = +[NSNumber numberWithFloat:0.0];
            [v54 setFromValue:v55];

            LODWORD(v56) = 1.0;
            v57 = +[NSNumber numberWithFloat:v56];
            [v54 setToValue:v57];

            [v54 setDuration:self->_duration];
            v58 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [v54 setTimingFunction:v58];

            v59 = self->_largeGradientLayer;
            v60 = +[NSDictionary dictionaryWithObject:v54 forKey:kCAOnOrderIn];
            [(CAGradientLayer *)v59 setActions:v60];
          }
          else
          {
            [(CAGradientLayer *)self->_largeGradientLayer setOpacity:0.0];
          }
          v61 = [(BKPageBookCurlView *)self layer];
          [v61 addSublayer:self->_largeGradientLayer];

          goto LABEL_17;
        }
        v64 = +[UIColor blackColor];
        id v40 = [v64 colorWithAlphaComponent:0.230000004];
        id v62 = [v40 CGColor];
        v41 = +[UIColor blackColor];
        id v42 = [v41 colorWithAlphaComponent:0.0500000007];
        id v43 = [v42 CGColor];
        v44 = +[UIColor blackColor];
        id v45 = [v44 colorWithAlphaComponent:0.129999995];
        smallGradientLayer = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v62, v43, [v45 CGColor], 0);

        v25 = +[NSNumber numberWithFloat:0.0];
        LODWORD(v46) = 1059565076;
      }
      else
      {
        if (v17)
        {
          id v33 = +[UIColor colorWithWhite:0.519999981 alpha:0.219999999];
          id v34 = [v33 CGColor];
          id v35 = +[UIColor colorWithWhite:0.529999971 alpha:0.389999986];
          id v36 = [v35 CGColor];
          double v31 = 0.0;
          id v37 = +[UIColor colorWithWhite:1.0 alpha:0.0];
          smallGradientLayer = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v34, v36, [v37 CGColor], 0);

          v25 = +[NSNumber numberWithFloat:0.0];
          LODWORD(v38) = 1036831949;
          v27 = +[NSNumber numberWithFloat:v38];
          LODWORD(v39) = 1.0;
          v29 = +[NSNumber numberWithFloat:v39];
          v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, 0);
          double v18 = 0.639999986;
          goto LABEL_13;
        }
        v65 = +[UIColor blackColor];
        id v47 = [v65 colorWithAlphaComponent:0.129999995];
        id v63 = [v47 CGColor];
        v48 = +[UIColor blackColor];
        id v49 = [v48 colorWithAlphaComponent:0.0500000007];
        id v50 = [v49 CGColor];
        v51 = +[UIColor blackColor];
        id v52 = [v51 colorWithAlphaComponent:0.230000004];
        smallGradientLayer = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v63, v50, [v52 CGColor], 0);

        v25 = +[NSNumber numberWithFloat:0.0];
        LODWORD(v46) = 1051763671;
      }
      v27 = +[NSNumber numberWithFloat:v46];
      LODWORD(v53) = 1.0;
      v29 = +[NSNumber numberWithFloat:v53];
      v30 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v27, v29, 0);
      double v31 = 0.0;
      double v18 = 1.0;
      goto LABEL_13;
    }
  }
  else if (largeGradientLayer)
  {
    [(CAGradientLayer *)largeGradientLayer removeFromSuperlayer];
    v32 = self->_largeGradientLayer;
    self->_largeGradientLayer = 0;

    smallGradientLayer = self->_smallGradientLayer;
    self->_smallGradientLayer = 0;
LABEL_17:
  }
  self->_hasGradient = a3;
}

- (void)updateCurlPercent:(double)a3
{
  unsigned int v5 = [(BKPageBookCurlView *)self useInvertedColors];
  double v6 = 0.5;
  if (!v5) {
    double v6 = 1.0;
  }
  double v7 = v6 * a3;
  if (self->_hasGradient && v7 < 1.0)
  {
    float v9 = v7;
    *(float *)&double v7 = v9;
    [(CAGradientLayer *)self->_largeGradientLayer setOpacity:v7];
    smallGradientLayer = self->_smallGradientLayer;
    *(float *)&double v11 = v9;
    [(CAGradientLayer *)smallGradientLayer setOpacity:v11];
  }
}

- (void)pageCurlWillCancelWithDuration:(double)a3
{
  [(CAGradientLayer *)self->_largeGradientLayer removeAnimationForKey:@"largeGradientOrderOut"];
  id v9 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  unsigned int v5 = [(CAGradientLayer *)self->_largeGradientLayer presentationLayer];
  [v5 opacity];
  double v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v9 setFromValue:v6];

  double v7 = +[NSNumber numberWithFloat:0.0];
  [v9 setToValue:v7];

  [v9 setDuration:a3];
  double v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v9 setTimingFunction:v8];

  [v9 setRemovedOnCompletion:0];
  [v9 setFillMode:kCAFillModeForwards];
  [(CAGradientLayer *)self->_largeGradientLayer addAnimation:v9 forKey:@"largeGradientOrderOut"];
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

- (BOOL)isLeft
{
  return self->_left;
}

- (void)setLeft:(BOOL)a3
{
  self->_left = a3;
}

- (CALayer)smallGradientLayer
{
  return &self->_smallGradientLayer->super;
}

- (void)setSmallGradientLayer:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)useInvertedColors
{
  return self->_useInvertedColors;
}

- (void)setUseInvertedColors:(BOOL)a3
{
  self->_useInvertedColors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallGradientLayer, 0);

  objc_storeStrong((id *)&self->_largeGradientLayer, 0);
}

@end