@interface COSTargetProgressView
- (CAShapeLayer)pathLayer;
- (COSTargetProgressView)initWithOutlinePath:(id)a3;
- (UIBezierPath)outlinePath;
- (double)cachedProgress;
- (id)scaleAnimationWithScale:(float)a3 path:(CGPath *)a4;
- (void)animateToColor:(id)a3;
- (void)pulseAnimation;
- (void)removeAnimation;
- (void)setCachedProgress:(double)a3;
- (void)setOutlinePath:(id)a3;
- (void)setPathLayer:(id)a3;
@end

@implementation COSTargetProgressView

- (COSTargetProgressView)initWithOutlinePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSTargetProgressView;
  v6 = [(COSTargetProgressView *)&v9 init];
  if (v6)
  {
    v7 = +[UIColor clearColor];
    [(COSTargetProgressView *)v6 setBackgroundColor:v7];

    objc_storeStrong((id *)&v6->_outlinePath, a3);
    v6->_cachedProgress = -1.0;
  }

  return v6;
}

- (void)animateToColor:(id)a3
{
  id v4 = a3;
  id v5 = [(COSTargetProgressView *)self pathLayer];

  if (!v5)
  {
    v6 = +[CAShapeLayer layer];
    [v6 setPath:[self->_outlinePath CGPath]];
    [v6 setFillColor:0];
    [v6 setLineWidth:6.0];
    v7 = [(COSTargetProgressView *)self layer];
    [v7 addSublayer:v6];

    [(COSTargetProgressView *)self setPathLayer:v6];
  }
  id v12 = +[CABasicAnimation animationWithKeyPath:@"strokeColor"];
  [v12 setDelegate:self];
  id v8 = v4;
  [v12 setToValue:[v8 CGColor]];
  [v12 setDuration:0.3];
  [v12 setRemovedOnCompletion:0];
  [v12 setFillMode:kCAFillModeForwards];
  objc_super v9 = [v8 description];

  v10 = +[NSString stringWithFormat:@"strokeColor-%@", v9];

  v11 = [(COSTargetProgressView *)self pathLayer];
  [v11 addAnimation:v12 forKey:v10];
}

- (void)pulseAnimation
{
  v3 = [(COSTargetProgressView *)self pathLayer];
  id v4 = [v3 path];
  LODWORD(v5) = 1061997773;
  id v12 = [(COSTargetProgressView *)self scaleAnimationWithScale:v4 path:v5];

  v6 = [(COSTargetProgressView *)self pathLayer];
  id v7 = [v6 path];
  LODWORD(v8) = 1063675494;
  objc_super v9 = [(COSTargetProgressView *)self scaleAnimationWithScale:v7 path:v8];

  [v9 setBeginTime:CACurrentMediaTime() + 0.1];
  v10 = [(COSTargetProgressView *)self pathLayer];
  [v10 addAnimation:v12 forKey:@"scaleDown"];

  v11 = [(COSTargetProgressView *)self pathLayer];
  [v11 addAnimation:v9 forKey:@"scaleUp"];
}

- (id)scaleAnimationWithScale:(float)a3 path:(CGPath *)a4
{
  v6 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  long long v18 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v21.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v21.m33 = v18;
  long long v17 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v21.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v21.m43 = v17;
  long long v16 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v21.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v21.m13 = v16;
  long long v15 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v21.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v21.m23 = v15;
  BoundingBoCGFloat x = CGPathGetBoundingBox(a4);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  double MidX = CGRectGetMidX(BoundingBox);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v24);
  *(_OWORD *)&v20.m31 = *(_OWORD *)&v21.m31;
  *(_OWORD *)&v20.m33 = v18;
  *(_OWORD *)&v20.m41 = *(_OWORD *)&v21.m41;
  *(_OWORD *)&v20.m43 = v17;
  *(_OWORD *)&v20.m11 = *(_OWORD *)&v21.m11;
  *(_OWORD *)&v20.m13 = v16;
  *(_OWORD *)&v20.m21 = *(_OWORD *)&v21.m21;
  *(_OWORD *)&v20.m23 = v15;
  CATransform3DTranslate(&v21, &v20, MidX, MidY, 0.0);
  CATransform3D v19 = v21;
  CATransform3DScale(&v20, &v19, a3, a3, 1.0);
  CATransform3D v21 = v20;
  CATransform3D v19 = v20;
  CATransform3DTranslate(&v20, &v19, -MidX, -MidY, 0.0);
  CATransform3D v21 = v20;
  v13 = +[NSValue valueWithCATransform3D:&v20];
  [v6 setToValue:v13];

  [v6 setDuration:0.1];
  [v6 setRemovedOnCompletion:0];
  [v6 setFillMode:kCAFillModeForwards];

  return v6;
}

- (void)removeAnimation
{
  id v2 = [(COSTargetProgressView *)self pathLayer];
  [v2 removeAllAnimations];
}

- (UIBezierPath)outlinePath
{
  return self->_outlinePath;
}

- (void)setOutlinePath:(id)a3
{
}

- (CAShapeLayer)pathLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pathLayer);

  return (CAShapeLayer *)WeakRetained;
}

- (void)setPathLayer:(id)a3
{
}

- (double)cachedProgress
{
  return self->_cachedProgress;
}

- (void)setCachedProgress:(double)a3
{
  self->_cachedProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pathLayer);

  objc_storeStrong((id *)&self->_outlinePath, 0);
}

@end