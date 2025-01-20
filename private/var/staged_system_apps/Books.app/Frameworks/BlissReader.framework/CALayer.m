@interface CALayer
- (CGPath)tracedShadowPathWithScale:(double)a3;
- (id)_th_undoInvertColorsFilter;
- (id)p_recoilAnimationFromPoint:(CGPoint)a3 scale:(double)a4 duration:(double)a5 hardRebound:(BOOL)a6;
- (void)addButtonShadow;
- (void)addCABasicOpacityAnimationToValue:(double)a3 duration:(double)a4 removedOnCompletion:(BOOL)a5;
- (void)addMomentumTiltWithVelocity:(CGPoint)a3;
- (void)addPressAnimationFromPoint:(CGPoint)a3 scale:(double)a4;
- (void)addRecoilAnimationFromPoint:(CGPoint)a3 hardRebound:(BOOL)a4;
- (void)addRelaxAnimationFromPoint:(CGPoint)a3;
- (void)copyAnimationsFromLayer:(id)a3;
- (void)removeButtonShadow;
- (void)removeMomentumTiltAnimation;
- (void)removePressAnimation;
- (void)removeRecoilAnimation;
- (void)removeRelaxAnimation;
- (void)setFadeMaskWithTopHeight:(double)a3 bottomHeight:(double)a4;
- (void)spi_setPreloadsCache:(BOOL)a3;
- (void)th_accessibilityUndoInvertColorsIfNecessary;
- (void)translateToSuperlayer:(id)a3;
- (void)translateToSuperlayer:(id)a3 below:(id)a4;
@end

@implementation CALayer

- (void)addMomentumTiltWithVelocity:(CGPoint)a3
{
  [(CALayer *)self removeMomentumTiltAnimation];
  [(CALayer *)self addPerspectiveProjection];
  TSDPointLength();
  double v5 = v4;
  TSDNormalizePoint();
  double v7 = v6;
  double v9 = v8;
  double v10 = 1.0;
  if (v5 < 25.0) {
    double v10 = v5 / 25.0;
  }
  double v11 = (v10 + -2.0) * v10 * -0.698131701;
  v12 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
  [(CABasicAnimation *)v12 setFromValue:+[NSNumber numberWithDouble:-(v9 * v11)]];
  [(CABasicAnimation *)v12 setToValue:+[NSNumber numberWithDouble:0.0]];
  [(CABasicAnimation *)v12 setDuration:0.5];
  [(CABasicAnimation *)v12 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  v13 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
  [(CABasicAnimation *)v13 setFromValue:+[NSNumber numberWithDouble:v7 * v11]];
  [(CABasicAnimation *)v13 setToValue:+[NSNumber numberWithDouble:0.0]];
  [(CABasicAnimation *)v13 setDuration:0.5];
  [(CABasicAnimation *)v13 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  id v14 = objc_alloc_init((Class)CAAnimationGroup);
  [v14 setAnimations:[NSArray arrayWithObjects:v12, v13, nil]];
  [v14 setDuration:0.5];

  [(CALayer *)self addAnimation:v14 forKey:@"kTHWFreeTransformControllerMomentumTiltAnimationKey"];
}

- (void)removeMomentumTiltAnimation
{
}

- (void)copyAnimationsFromLayer:(id)a3
{
  id v5 = [a3 animationKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", objc_msgSend(objc_msgSend(a3, "animationForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9)), "copy"), *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addPressAnimationFromPoint:(CGPoint)a3 scale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(CALayer *)self removeRecoilAnimation];
  [(CALayer *)self removeRelaxAnimation];
  [(CALayer *)self removePressAnimation];
  [(CALayer *)self frame];
  CGFloat v8 = v27.origin.x;
  CGFloat v9 = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  double v12 = (x - CGRectGetMinX(v27)) / v27.size.width;
  v28.origin.double x = v8;
  v28.origin.double y = v9;
  v28.size.double width = width;
  v28.size.double height = height;
  double v13 = (y - CGRectGetMinY(v28)) / height;
  id v14 = +[CABasicAnimation animationWithKeyPath:@"anchorPoint"];
  v15 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v12, v13);
  [(CABasicAnimation *)v14 setToValue:v15];
  [(CABasicAnimation *)v14 setFromValue:v15];
  [(CABasicAnimation *)v14 setDuration:1.0];
  [(CALayer *)self anchorPoint];
  TSDSubtractPoints();
  double v17 = width * v16;
  double v19 = height * v18;
  v20 = +[CABasicAnimation animationWithKeyPath:@"position"];
  v21 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v17, v19);
  [(CABasicAnimation *)v20 setToValue:v21];
  [(CABasicAnimation *)v20 setFromValue:v21];
  [(CABasicAnimation *)v20 setDuration:0.1];
  [(CABasicAnimation *)v20 setAdditive:1];
  v22 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  [self valueForKeyPath:@"transform.scale.xy"].floatValue;
  double v24 = v23 * a4;
  *(float *)&double v24 = v24;
  [(CABasicAnimation *)v22 setToValue:+[NSNumber numberWithFloat:v24]];
  [(CABasicAnimation *)v22 setDuration:0.1];
  id v25 = objc_alloc_init((Class)CAAnimationGroup);
  [v25 setAnimations:[NSArray arrayWithObjects:v14, v20, v22, 0]];
  [v25 setDuration:0.1];
  [v25 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [v25 setRemovedOnCompletion:0];
  [v25 setFillMode:kCAFillModeForwards];

  [(CALayer *)self addAnimation:v25 forKey:@"kTHPressAnimationKey"];
}

- (void)removePressAnimation
{
}

- (void)addButtonShadow
{
  [self setShadowColor:[+[TSUColor blackColor](TSUColor, "blackColor") CGColor]];
  -[CALayer setShadowOffset:](self, "setShadowOffset:", 0.0, 0.0);
  LODWORD(v3) = 1.0;
  [(CALayer *)self setShadowOpacity:v3];
  [(CALayer *)self setShadowRadius:0.0];
  LODWORD(v4) = *(_DWORD *)"ff&?";

  [(CALayer *)self setOpacity:v4];
}

- (void)removeButtonShadow
{
  [self setShadowColor:[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
  LODWORD(v3) = 1.0;

  [(CALayer *)self setOpacity:v3];
}

- (id)p_recoilAnimationFromPoint:(CGPoint)a3 scale:(double)a4 duration:(double)a5 hardRebound:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a3.y;
  double x = a3.x;
  [self valueForKeyPath:@"transform.scale.xy"].floatValue;
  double v13 = v12;
  double v14 = v12 - a4;
  double v40 = v13 + v14 * 0.5;
  double v41 = v13 + v14 * -0.4;
  double v39 = v13 + v14 * -0.3;
  [(CALayer *)self frame];
  CGFloat v15 = v42.origin.x;
  CGFloat v16 = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  double v19 = (x - CGRectGetMinX(v42)) / v42.size.width;
  v43.origin.double x = v15;
  v43.origin.double y = v16;
  v43.size.double width = width;
  v43.size.double height = height;
  double v20 = (y - CGRectGetMinY(v43)) / height;
  v21 = +[CABasicAnimation animationWithKeyPath:@"anchorPoint"];
  v22 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, v20);
  [(CABasicAnimation *)v21 setToValue:v22];
  [(CABasicAnimation *)v21 setFromValue:v22];
  [(CABasicAnimation *)v21 setDuration:1.0];
  [(CALayer *)self anchorPoint];
  TSDSubtractPoints();
  double v24 = width * v23;
  double v26 = height * v25;
  CGRect v27 = +[CABasicAnimation animationWithKeyPath:@"position"];
  CGRect v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v26);
  [(CABasicAnimation *)v27 setToValue:v28];
  [(CABasicAnimation *)v27 setFromValue:v28];
  [(CABasicAnimation *)v27 setDuration:a5];
  [(CABasicAnimation *)v27 setAdditive:1];
  v29 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  [(CABasicAnimation *)v29 setFromValue:+[NSNumber numberWithDouble:a4]];
  if (v6) {
    double v30 = v41;
  }
  else {
    double v30 = v39;
  }
  if (v6) {
    double v31 = v13;
  }
  else {
    double v31 = v40;
  }
  if (v6) {
    CAMediaTimingFunctionName v32 = kCAMediaTimingFunctionLinear;
  }
  else {
    CAMediaTimingFunctionName v32 = kCAMediaTimingFunctionEaseOut;
  }
  if (v6) {
    CAMediaTimingFunctionName v33 = kCAMediaTimingFunctionEaseOut;
  }
  else {
    CAMediaTimingFunctionName v33 = kCAMediaTimingFunctionEaseInEaseOut;
  }
  [(CABasicAnimation *)v29 setToValue:+[NSNumber numberWithDouble:v31]];
  [(CABasicAnimation *)v29 setTimingFunction:+[CAMediaTimingFunction functionWithName:v32]];
  [(CABasicAnimation *)v29 setDuration:a5 * 0.5];
  v34 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  [(CABasicAnimation *)v34 setFromValue:+[NSNumber numberWithDouble:v31]];
  [(CABasicAnimation *)v34 setToValue:+[NSNumber numberWithDouble:v30]];
  [(CABasicAnimation *)v34 setTimingFunction:+[CAMediaTimingFunction functionWithName:v33]];
  [(CABasicAnimation *)v34 setBeginTime:a5 * 0.5];
  [(CABasicAnimation *)v34 setDuration:a5 * 0.3];
  v35 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  [(CABasicAnimation *)v35 setFromValue:+[NSNumber numberWithDouble:v30]];
  [(CABasicAnimation *)v35 setToValue:+[NSNumber numberWithDouble:v13]];
  [(CABasicAnimation *)v35 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  [(CABasicAnimation *)v35 setBeginTime:a5 * 0.8];
  [(CABasicAnimation *)v35 setDuration:a5 * 0.2];
  id v36 = objc_alloc_init((Class)CAAnimationGroup);
  [v36 setAnimations:[NSArray arrayWithObjects:v21, v27, v29, v34, v35, nil]];
  [v36 setDuration:a5];
  [v36 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [v36 setFillMode:kCAFillModeForwards];
  return v36;
}

- (void)addRecoilAnimationFromPoint:(CGPoint)a3 hardRebound:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(CALayer *)self removeRecoilAnimation];
  [self valueForKeyPath:@"transform.scale.xy"].floatValue;
  float v9 = v8;
  if ([(CALayer *)self animationForKey:@"kTHPressAnimationKey"])
  {
    [(-[CALayer presentationLayer](self, "presentationLayer")) valueForKeyPath:@"transform.scale.xy"].floatValue;
    float v9 = v10;
    [(CALayer *)self removePressAnimation];
  }
  id v11 = -[CALayer p_recoilAnimationFromPoint:scale:duration:hardRebound:](self, "p_recoilAnimationFromPoint:scale:duration:hardRebound:", v4, x, y, v9, 0.2);

  [(CALayer *)self addAnimation:v11 forKey:@"kTHRecoilAnimationKey"];
}

- (void)removeRecoilAnimation
{
}

- (void)addRelaxAnimationFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CALayer *)self removeRelaxAnimation];
  [self valueForKeyPath:@"transform.scale.xy"].floatValue;
  float v7 = v6;
  if ([(CALayer *)self animationForKey:@"kTHPressAnimationKey"])
  {
    [(-[CALayer presentationLayer](self, "presentationLayer")) valueForKeyPath:@"transform.scale.xy"].floatValue;
    float v7 = v8;
    [(CALayer *)self removePressAnimation];
  }
  [(CALayer *)self frame];
  CGFloat v9 = v28.origin.x;
  CGFloat v10 = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  double v13 = (x - CGRectGetMinX(v28)) / v28.size.width;
  v29.origin.double x = v9;
  v29.origin.double y = v10;
  v29.size.double width = width;
  v29.size.double height = height;
  double v14 = (y - CGRectGetMinY(v29)) / height;
  CGFloat v15 = +[CABasicAnimation animationWithKeyPath:@"anchorPoint"];
  CGFloat v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, v14);
  [(CABasicAnimation *)v15 setToValue:v16];
  [(CABasicAnimation *)v15 setFromValue:v16];
  [(CABasicAnimation *)v15 setDuration:1.0];
  [(CALayer *)self anchorPoint];
  TSDSubtractPoints();
  double v18 = width * v17;
  double v20 = height * v19;
  v21 = +[CABasicAnimation animationWithKeyPath:@"position"];
  v22 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v18, v20);
  [(CABasicAnimation *)v21 setToValue:v22];
  [(CABasicAnimation *)v21 setFromValue:v22];
  [(CABasicAnimation *)v21 setDuration:0.1];
  [(CABasicAnimation *)v21 setAdditive:1];
  double v23 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  *(float *)&double v24 = v7;
  [(CABasicAnimation *)v23 setFromValue:+[NSNumber numberWithFloat:v24]];
  double v25 = v7 / fabs(v7);
  *(float *)&double v25 = v25;
  [(CABasicAnimation *)v23 setToValue:+[NSNumber numberWithFloat:v25]];
  [(CABasicAnimation *)v23 setDuration:0.1];
  id v26 = objc_alloc_init((Class)CAAnimationGroup);
  [v26 setAnimations:[NSArray arrayWithObjects:v15, v21, v23, nil]];
  [v26 setDuration:0.1];
  [v26 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [v26 setFillMode:kCAFillModeForwards];

  [(CALayer *)self addAnimation:v26 forKey:@"kTHRelaxAnimationKey"];
}

- (void)removeRelaxAnimation
{
}

- (void)setFadeMaskWithTopHeight:(double)a3 bottomHeight:(double)a4
{
  id v17 = objc_alloc_init((Class)CAGradientLayer);
  [(CALayer *)self frame];
  [v17 setFrame:];
  [v17 setColors:[NSArray arrayWithObjects:[TSUColor clearColor], [TSUColor blackColor], [TSUColor blackColor], [TSUColor clearColor], nil]];
  [(CALayer *)self bounds];
  double v8 = a3 / v7;
  [(CALayer *)self bounds];
  double v10 = a4 / v9;
  id v11 = +[NSNumber numberWithFloat:0.0];
  *(float *)&double v12 = v8;
  double v13 = +[NSNumber numberWithFloat:v12];
  double v14 = 1.0 - v10;
  *(float *)&double v14 = 1.0 - v10;
  CGFloat v15 = +[NSNumber numberWithFloat:v14];
  LODWORD(v16) = 1.0;
  [v17 setLocations:[NSArray arrayWithObjects:v11, v13, v15, [NSNumber numberWithFloat:v16], nil]];
  [(CALayer *)self setMask:v17];
}

- (void)translateToSuperlayer:(id)a3
{
  id v5 = [(CALayer *)self superlayer];
  [(CALayer *)self position];
  -[CALayer convertPoint:toLayer:](v5, "convertPoint:toLayer:", a3);
  -[CALayer setPosition:](self, "setPosition:");

  [a3 addSublayer:self];
}

- (void)translateToSuperlayer:(id)a3 below:(id)a4
{
  double v7 = [(CALayer *)self superlayer];
  [(CALayer *)self position];
  -[CALayer convertPoint:toLayer:](v7, "convertPoint:toLayer:", a3);
  -[CALayer setPosition:](self, "setPosition:");

  [a3 insertSublayer:self below:a4];
}

- (CGPath)tracedShadowPathWithScale:(double)a3
{
  [(CALayer *)self bounds];
  TSDMultiplySizeScalar();
  id v5 = (CGContext *)TSDBitmapContextCreate();
  if (v5)
  {
    float v6 = v5;
    CGContextScaleCTM(v5, a3, a3);
    objc_opt_class();
    [(CALayer *)self delegate];
    double v7 = (void *)TSUDynamicCast();
    if (v7)
    {
      double v8 = v7;
      [v7 contentOffset];
      CGFloat v10 = -v9;
      [v8 contentOffset];
      CGContextTranslateCTM(v6, v10, -v11);
    }
    [(CALayer *)self renderInContext:v6];
    CGImageRef Image = CGBitmapContextCreateImage(v6);
    if (Image)
    {
      double v13 = Image;
      double v14 = (TSDBezierPath *)+[TSDBezierPath tracedPathForImage:Image alphaThreshold:0.5 pointSpacing:2.0];
      CGImageRelease(v13);
      CGContextRelease(v6);
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      CGContextRelease(v6);
    }
  }
  TSDRectWithSize();
  double v14 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
LABEL_9:

  return (CGPath *)[(TSDBezierPath *)v14 CGPath];
}

- (void)spi_setPreloadsCache:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(CALayer *)self setPreloadsCache:v3];
  }
}

- (void)addCABasicOpacityAnimationToValue:(double)a3 duration:(double)a4 removedOnCompletion:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  *(float *)&double v10 = a3;
  [(CABasicAnimation *)v9 setToValue:+[NSNumber numberWithFloat:v10]];
  if (a4 > 0.0) {
    [(CABasicAnimation *)v9 setDuration:a4];
  }
  [(CABasicAnimation *)v9 setRemovedOnCompletion:v5];
  [(CABasicAnimation *)v9 setFillMode:kCAFillModeForwards];

  [(CALayer *)self addAnimation:v9 forKey:@"opacity"];
}

- (void)th_accessibilityUndoInvertColorsIfNecessary
{
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  id v4 = [(CALayer *)self _th_undoInvertColorsFilter];
  id v5 = v4;
  if (IsInvertColorsEnabled)
  {
    if (v4) {
      return;
    }
    float v6 = +[CAFilter filterWithType:kCAFilterColorInvert];
    [(CAFilter *)v6 setName:@"kTHAXUndoInvertColorsFilter"];
    id v7 = [(NSArray *)[(CALayer *)self filters] mutableCopy];
    if (!v7) {
      id v7 = (id)objc_opt_new();
    }
    id v8 = v7;
    [v7 addObject:v6];
  }
  else
  {
    if (!v4) {
      return;
    }
    id v8 = [(NSArray *)[(CALayer *)self filters] mutableCopy];
    [v8 removeObject:v5];
  }
  [(CALayer *)self setFilters:v8];
}

- (id)_th_undoInvertColorsFilter
{
  v2 = [(CALayer *)self filters];

  return [(NSArray *)v2 tsu_firstObjectPassingTest:&stru_458FE8];
}

@end