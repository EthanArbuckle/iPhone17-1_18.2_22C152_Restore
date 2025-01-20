@interface THWImageCropAnimationController
- (BOOL)isAnimationDisabled;
- (CALayer)backgroundLayer;
- (CALayer)cropLayer;
- (CALayer)imageContentLayer;
- (CALayer)wrapperLayer;
- (CGRect)backgroundSourceFrame;
- (CGRect)backgroundTargetFrame;
- (CGRect)sourceContentsRect;
- (CGRect)targetContentsRect;
- (THWImageCropAnimationController)initWithImageContentLayer:(id)a3;
- (double)backgroundDurationScale;
- (double)cornerRadiusDurationScale;
- (double)cropDurationScale;
- (double)sourceCornerRadius;
- (double)targetCornerRadius;
- (id)backgroundShadowPath;
- (id)sourceShadowPath;
- (void)addAnimationWithDuration:(double)a3 targetScale:(double)a4;
- (void)addBackgroundAnimationWithDuration:(double)a3 targetScale:(double)a4;
- (void)dealloc;
- (void)setAnimationDisabled:(BOOL)a3;
- (void)setBackgroundDurationScale:(double)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setBackgroundSourceFrame:(CGRect)a3;
- (void)setBackgroundTargetFrame:(CGRect)a3;
- (void)setCornerRadiusDurationScale:(double)a3;
- (void)setCropDurationScale:(double)a3;
- (void)setSourceContentsRect:(CGRect)a3;
- (void)setSourceCornerRadius:(double)a3;
- (void)setTargetContentsRect:(CGRect)a3;
- (void)setTargetCornerRadius:(double)a3;
- (void)setupWrapperLayer;
- (void)teardownWrapperLayer;
@end

@implementation THWImageCropAnimationController

- (THWImageCropAnimationController)initWithImageContentLayer:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)THWImageCropAnimationController;
  v4 = [(THWImageCropAnimationController *)&v11 init];
  if (v4)
  {
    *((void *)v4 + 9) = a3;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v4 + 40) = _Q0;
    *((void *)v4 + 7) = 0x3FF0000000000000;
  }
  return (THWImageCropAnimationController *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWImageCropAnimationController;
  [(THWImageCropAnimationController *)&v3 dealloc];
}

- (void)setupWrapperLayer
{
  objc_super v3 = +[CALayer layer];
  self->_wrapperLayer = v3;
  -[CALayer setAnchorPoint:](v3, "setAnchorPoint:", 0.5, 0.5);
  [(CALayer *)self->_imageContentLayer frame];
  -[CALayer setFrame:](self->_wrapperLayer, "setFrame:");
  [[(CALayer *)self->_imageContentLayer superlayer] replaceSublayer:self->_imageContentLayer with:self->_wrapperLayer];
  double y = CGPointZero.y;
  [(CALayer *)self->_wrapperLayer frame];
  -[CALayer setFrame:](self->_imageContentLayer, "setFrame:", CGPointZero.x, y);
  [(CALayer *)self->_imageContentLayer bounds];
  double v6 = v5;
  double v8 = v7;
  double x = self->_sourceContentsRect.origin.x;
  double v9 = self->_sourceContentsRect.origin.y;
  double v15 = x * v5;
  double v16 = v9 * v7;
  double v11 = v5 * self->_sourceContentsRect.size.width;
  double v12 = v7 * self->_sourceContentsRect.size.height;
  v13 = +[CALayer layer];
  self->_cropLayer = v13;
  [(CALayer *)v13 setMasksToBounds:1];
  -[CALayer setAnchorPoint:](self->_cropLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_cropLayer, "setFrame:", v15, v16, v11, v12);
  [(CALayer *)self->_cropLayer setCornerRadius:self->_sourceCornerRadius];
  CATransform3DMakeTranslation(&v18, -(x * v6), -(v9 * v8), 0.0);
  cropLayer = self->_cropLayer;
  CATransform3D v17 = v18;
  [(CALayer *)cropLayer setSublayerTransform:&v17];
  [(CALayer *)self->_cropLayer addSublayer:self->_imageContentLayer];
  if (self->_backgroundLayer) {
    -[CALayer addSublayer:](self->_wrapperLayer, "addSublayer:");
  }
  [(CALayer *)self->_wrapperLayer addSublayer:self->_cropLayer];
  [(CALayer *)self->_imageContentLayer removeAllAnimations];
}

- (void)setBackgroundLayer:(id)a3
{
  backgroundLayer = self->_backgroundLayer;
  if (backgroundLayer != a3)
  {
    if (backgroundLayer)
    {
      [(CALayer *)backgroundLayer removeFromSuperlayer];
      [(CALayer *)self->_backgroundLayer removeAllAnimations];
      double v6 = self->_backgroundLayer;
    }
    else
    {
      double v6 = 0;
    }

    double v7 = (CALayer *)a3;
    self->_backgroundLayer = v7;
    if (v7)
    {
      [(CALayer *)self->_wrapperLayer insertSublayer:v7 atIndex:0];
      double v8 = self->_backgroundLayer;
      [(CALayer *)v8 removeAllAnimations];
    }
  }
}

- (void)teardownWrapperLayer
{
  [(CALayer *)self->_wrapperLayer frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CALayer *)self->_imageContentLayer superlayer] == self->_cropLayer)
  {
    double v11 = [(CALayer *)self->_wrapperLayer superlayer];
    -[CALayer setFrame:](self->_imageContentLayer, "setFrame:", v4, v6, v8, v10);
    [(CALayer *)v11 replaceSublayer:self->_wrapperLayer with:self->_imageContentLayer];
  }
  [(CALayer *)self->_wrapperLayer removeFromSuperlayer];
  [(CALayer *)self->_backgroundLayer removeAllAnimations];
  [(CALayer *)self->_imageContentLayer removeAllAnimations];

  self->_wrapperLayer = 0;
  self->_cropLayer = 0;
}

- (void)addAnimationWithDuration:(double)a3 targetScale:(double)a4
{
  if (!self->_animationDisabled)
  {
    double v6 = self->_cropDurationScale * a3;
    double v31 = self->_cornerRadiusDurationScale * a3;
    [(CALayer *)self->_imageContentLayer bounds];
    double v8 = v7;
    double v10 = v9;
    double x = self->_sourceContentsRect.origin.x;
    double y = self->_sourceContentsRect.origin.y;
    double v22 = x * v7;
    double v23 = y * v9;
    double v11 = v7 * self->_sourceContentsRect.size.width;
    double v12 = v9 * self->_sourceContentsRect.size.height;
    double v28 = self->_targetContentsRect.origin.x;
    double v29 = self->_targetContentsRect.origin.y;
    double v24 = v7 * v28;
    double v25 = v9 * v29;
    double v13 = v7 * self->_targetContentsRect.size.width;
    double v14 = v9 * self->_targetContentsRect.size.height;
    double v15 = +[CABasicAnimation animationWithKeyPath:@"bounds.size"];
    [(CABasicAnimation *)v15 setFromValue:+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v11, v12)];
    [(CABasicAnimation *)v15 setToValue:+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v13, v14)];
    [(CABasicAnimation *)v15 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v15 setFillMode:kCAFillModeForwards];
    [(CABasicAnimation *)v15 setDuration:v6];
    double v16 = +[CABasicAnimation animationWithKeyPath:@"position"];
    [(CABasicAnimation *)v16 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v22, v23)];
    [(CABasicAnimation *)v16 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v25)];
    [(CABasicAnimation *)v16 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v16 setFillMode:kCAFillModeForwards];
    [(CABasicAnimation *)v16 setDuration:v6];
    CATransform3D v17 = +[CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
    CATransform3DMakeTranslation(&v33, -(x * v8), -(y * v10), 0.0);
    [(CABasicAnimation *)v17 setFromValue:+[NSValue valueWithCATransform3D:&v33]];
    CATransform3DMakeTranslation(&v32, -(v8 * v28), -(v10 * v29), 0.0);
    [(CABasicAnimation *)v17 setToValue:+[NSValue valueWithCATransform3D:&v32]];
    [(CABasicAnimation *)v17 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v17 setFillMode:kCAFillModeForwards];
    [(CABasicAnimation *)v17 setDuration:v6];
    CATransform3D v18 = +[CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    double sourceCornerRadius = self->_sourceCornerRadius;
    *(float *)&double sourceCornerRadius = sourceCornerRadius;
    [(CABasicAnimation *)v18 setFromValue:+[NSNumber numberWithFloat:sourceCornerRadius]];
    double v20 = self->_targetCornerRadius / a4;
    *(float *)&double v20 = v20;
    [(CABasicAnimation *)v18 setToValue:+[NSNumber numberWithFloat:v20]];
    [(CABasicAnimation *)v18 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v18 setFillMode:kCAFillModeForwards];
    [(CABasicAnimation *)v18 setDuration:v31];
    [(CABasicAnimation *)v18 setBeginTime:a3 - v31];
    id v21 = +[CAAnimationGroup animation];
    [v21 setAnimations:[NSArray arrayWithObjects:v15, v16, v18, v17, nil]];
    [v21 setDuration:a3];
    [v21 setRemovedOnCompletion:0];
    [v21 setFillMode:kCAFillModeForwards];
    [(CALayer *)self->_cropLayer addAnimation:v21 forKey:@"cropAnimation"];
  }
}

- (void)addBackgroundAnimationWithDuration:(double)a3 targetScale:(double)a4
{
  if (!self->_animationDisabled && self->_backgroundLayer)
  {
    double v5 = self->_backgroundDurationScale * a3;
    double x = self->_backgroundSourceFrame.origin.x;
    double y = self->_backgroundSourceFrame.origin.y;
    TSDMultiplyRectScalar();
    double v9 = v8;
    double v11 = v10;
    double v12 = +[CABasicAnimation animationWithKeyPath:@"position"];
    [(CABasicAnimation *)v12 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y)];
    [(CABasicAnimation *)v12 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v9, v11)];
    [(CABasicAnimation *)v12 setDuration:v5];
    [(CABasicAnimation *)v12 setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)v12 setRemovedOnCompletion:0];
    double v13 = +[CABasicAnimation animationWithKeyPath:@"bounds"];
    TSDRectWithSize();
    [(CABasicAnimation *)v13 setFromValue:+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:")];
    TSDRectWithSize();
    [(CABasicAnimation *)v13 setToValue:+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:")];
    [(CABasicAnimation *)v13 setDuration:v5];
    [(CABasicAnimation *)v13 setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)v13 setRemovedOnCompletion:0];
    id v14 = +[CAAnimationGroup animation];
    [v14 setAnimations:[NSArray arrayWithObjects:v12, v13, nil]];
    [v14 setDuration:v5];
    [v14 setRemovedOnCompletion:0];
    [v14 setFillMode:kCAFillModeBoth];
    backgroundLayer = self->_backgroundLayer;
    [(CALayer *)backgroundLayer addAnimation:v14 forKey:@"frame"];
  }
}

- (id)sourceShadowPath
{
  [(CALayer *)self->_imageContentLayer bounds];
  double v4 = self->_sourceContentsRect.origin.x * v3;
  double v5 = v3 * self->_sourceContentsRect.size.width;
  double v7 = self->_sourceContentsRect.origin.y * v6;
  double v8 = v6 * self->_sourceContentsRect.size.height;
  double sourceCornerRadius = self->_sourceCornerRadius;

  return +[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v7, v5, v8, sourceCornerRadius);
}

- (id)backgroundShadowPath
{
  id result = self->_backgroundLayer;
  if (result)
  {
    wrapperLayer = self->_wrapperLayer;
    [result bounds];
    -[CALayer convertRect:fromLayer:](wrapperLayer, "convertRect:fromLayer:", self->_backgroundLayer);
    return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
  }
  return result;
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (CGRect)sourceContentsRect
{
  double x = self->_sourceContentsRect.origin.x;
  double y = self->_sourceContentsRect.origin.y;
  double width = self->_sourceContentsRect.size.width;
  double height = self->_sourceContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentsRect:(CGRect)a3
{
  self->_sourceContentsRect = a3;
}

- (CGRect)targetContentsRect
{
  double x = self->_targetContentsRect.origin.x;
  double y = self->_targetContentsRect.origin.y;
  double width = self->_targetContentsRect.size.width;
  double height = self->_targetContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetContentsRect:(CGRect)a3
{
  self->_targetContentsRect = a3;
}

- (double)sourceCornerRadius
{
  return self->_sourceCornerRadius;
}

- (void)setSourceCornerRadius:(double)a3
{
  self->_double sourceCornerRadius = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_targetCornerRadius = a3;
}

- (CGRect)backgroundSourceFrame
{
  double x = self->_backgroundSourceFrame.origin.x;
  double y = self->_backgroundSourceFrame.origin.y;
  double width = self->_backgroundSourceFrame.size.width;
  double height = self->_backgroundSourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundSourceFrame:(CGRect)a3
{
  self->_backgroundSourceFrame = a3;
}

- (CGRect)backgroundTargetFrame
{
  double x = self->_backgroundTargetFrame.origin.x;
  double y = self->_backgroundTargetFrame.origin.y;
  double width = self->_backgroundTargetFrame.size.width;
  double height = self->_backgroundTargetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundTargetFrame:(CGRect)a3
{
  self->_backgroundTargetFrame = a3;
}

- (BOOL)isAnimationDisabled
{
  return self->_animationDisabled;
}

- (void)setAnimationDisabled:(BOOL)a3
{
  self->_animationDisabled = a3;
}

- (double)cropDurationScale
{
  return self->_cropDurationScale;
}

- (void)setCropDurationScale:(double)a3
{
  self->_cropDurationScale = a3;
}

- (double)cornerRadiusDurationScale
{
  return self->_cornerRadiusDurationScale;
}

- (void)setCornerRadiusDurationScale:(double)a3
{
  self->_cornerRadiusDurationScale = a3;
}

- (double)backgroundDurationScale
{
  return self->_backgroundDurationScale;
}

- (void)setBackgroundDurationScale:(double)a3
{
  self->_backgroundDurationScale = a3;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (CALayer)imageContentLayer
{
  return self->_imageContentLayer;
}

- (CALayer)cropLayer
{
  return self->_cropLayer;
}

@end