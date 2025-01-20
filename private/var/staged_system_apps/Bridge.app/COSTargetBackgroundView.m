@interface COSTargetBackgroundView
- (CAGradientLayer)gradientLayer;
- (CAShapeLayer)maskLayer;
- (COSTargetBackgroundView)initWithCutoutPath:(id)a3 gradientHeight:(double)a4;
- (UIBezierPath)cutoutPath;
- (double)gradientHeight;
- (id)scaleBackgroundAnimationWithScale:(float)a3 forPath:(CGPath *)a4;
- (void)drawRect:(CGRect)a3;
- (void)pulseBackground;
- (void)removeAnimation;
- (void)setCutoutPath:(id)a3;
- (void)setGradientHeight:(double)a3;
- (void)setGradientLayer:(id)a3;
- (void)setMaskLayer:(id)a3;
@end

@implementation COSTargetBackgroundView

- (COSTargetBackgroundView)initWithCutoutPath:(id)a3 gradientHeight:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COSTargetBackgroundView;
  v8 = [(COSTargetBackgroundView *)&v12 init];
  if (v8)
  {
    v9 = +[UIColor blackColor];
    v10 = [v9 colorWithAlphaComponent:0.5];
    [(COSTargetBackgroundView *)v8 setBackgroundColor:v10];

    objc_storeStrong((id *)&v8->_cutoutPath, a3);
    v8->_gradientHeight = a4;
  }

  return v8;
}

- (void)drawRect:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)COSTargetBackgroundView;
  -[COSTargetBackgroundView drawRect:](&v18, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_cutoutPath)
  {
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, [(UIBezierPath *)self->_cutoutPath CGPath]);
    [(COSTargetBackgroundView *)self bounds];
    CGPathAddRect(Mutable, 0, v20);
    maskLayer = self->_maskLayer;
    if (!maskLayer)
    {
      v6 = (CAShapeLayer *)objc_opt_new();
      id v7 = self->_maskLayer;
      self->_maskLayer = v6;

      [(CAShapeLayer *)self->_maskLayer setFillRule:kCAFillRuleEvenOdd];
      v8 = self->_maskLayer;
      v9 = [(COSTargetBackgroundView *)self layer];
      [v9 setMask:v8];

      maskLayer = self->_maskLayer;
    }
    [(CAShapeLayer *)maskLayer setPath:Mutable];
    if (!self->_gradientLayer)
    {
      v10 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
      gradientLayer = self->_gradientLayer;
      self->_gradientLayer = v10;

      id v12 = +[UIColor blackColor];
      v19[0] = [v12 CGColor];
      id v13 = +[UIColor clearColor];
      v19[1] = [v13 CGColor];
      v14 = +[NSArray arrayWithObjects:v19 count:2];
      [(CAGradientLayer *)self->_gradientLayer setColors:v14];

      v15 = [(COSTargetBackgroundView *)self layer];
      [v15 addSublayer:self->_gradientLayer];
    }
    memset(&slice, 0, sizeof(slice));
    [(COSTargetBackgroundView *)self bounds];
    CGRectDivide(v21, &slice, &v16, self->_gradientHeight, CGRectMinYEdge);
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
}

- (void)pulseBackground
{
  id v3 = [(COSTargetBackgroundView *)self cutoutPath];
  id v4 = [v3 CGPath];
  LODWORD(v5) = 1061997773;
  id v12 = [(COSTargetBackgroundView *)self scaleBackgroundAnimationWithScale:v4 forPath:v5];

  id v6 = [(COSTargetBackgroundView *)self cutoutPath];
  id v7 = [v6 CGPath];
  LODWORD(v8) = 1063675494;
  v9 = [(COSTargetBackgroundView *)self scaleBackgroundAnimationWithScale:v7 forPath:v8];

  v10 = [(COSTargetBackgroundView *)self maskLayer];
  [v10 addAnimation:v12 forKey:@"path"];

  v11 = [(COSTargetBackgroundView *)self maskLayer];
  [v11 addAnimation:v9 forKey:@"path"];
}

- (id)scaleBackgroundAnimationWithScale:(float)a3 forPath:(CGPath *)a4
{
  id v6 = +[CABasicAnimation animationWithKeyPath:@"path"];
  long long v21 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v24.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v24.m33 = v21;
  long long v20 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v24.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v24.m43 = v20;
  long long v19 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v24.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v24.m13 = v19;
  long long v18 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v24.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v24.m23 = v18;
  id v7 = [(COSTargetBackgroundView *)self cutoutPath];
  BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[v7 CGPath]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;

  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v28);
  *(_OWORD *)&v23.m31 = *(_OWORD *)&v24.m31;
  *(_OWORD *)&v23.m33 = v21;
  *(_OWORD *)&v23.m41 = *(_OWORD *)&v24.m41;
  *(_OWORD *)&v23.m43 = v20;
  *(_OWORD *)&v23.m11 = *(_OWORD *)&v24.m11;
  *(_OWORD *)&v23.m13 = v19;
  *(_OWORD *)&v23.m21 = *(_OWORD *)&v24.m21;
  *(_OWORD *)&v23.m23 = v18;
  CATransform3DTranslate(&v24, &v23, MidX, MidY, 0.0);
  CATransform3D v22 = v24;
  CATransform3DScale(&v23, &v22, a3, a3, 1.0);
  CATransform3D v24 = v23;
  CATransform3D v22 = v23;
  CATransform3DTranslate(&v23, &v22, -MidX, -MidY, 0.0);
  CATransform3D v24 = v23;
  memset(&v22, 0, 48);
  CATransform3DGetAffineTransform((CGAffineTransform *)&v22, &v23);
  CopyByTransformingPath = CGPathCreateCopyByTransformingPath([(UIBezierPath *)self->_cutoutPath CGPath], (const CGAffineTransform *)&v22);
  Mutable = CGPathCreateMutable();
  CGPathAddPath(Mutable, 0, CopyByTransformingPath);
  [(COSTargetBackgroundView *)self bounds];
  CGPathAddRect(Mutable, 0, v29);
  CGRect v16 = [(COSTargetBackgroundView *)self maskLayer];
  [v6 setFromValue:[v16 path]];

  [v6 setToValue:Mutable];
  [v6 setDuration:0.1];
  [v6 setRemovedOnCompletion:0];
  [v6 setFillMode:kCAFillModeForwards];

  return v6;
}

- (void)removeAnimation
{
  id v2 = [(COSTargetBackgroundView *)self maskLayer];
  [v2 removeAllAnimations];
}

- (UIBezierPath)cutoutPath
{
  return self->_cutoutPath;
}

- (void)setCutoutPath:(id)a3
{
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
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
  objc_storeStrong((id *)&self->_maskLayer, 0);

  objc_storeStrong((id *)&self->_cutoutPath, 0);
}

@end