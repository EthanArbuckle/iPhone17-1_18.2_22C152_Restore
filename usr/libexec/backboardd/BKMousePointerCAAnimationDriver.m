@interface BKMousePointerCAAnimationDriver
- (BKMousePointerCAAnimationDriver)initWithRelativeTranslation:(CGPoint)a3 animationSettings:(id)a4;
- (BOOL)isComplete;
- (CGPoint)currentTranslation;
- (void)applyForTime:(double)a3;
@end

@implementation BKMousePointerCAAnimationDriver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDictionary, 0);
  objc_storeStrong((id *)&self->_animation, 0);

  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (CGPoint)currentTranslation
{
  double x = self->_currentTranslation.x;
  double y = self->_currentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isComplete
{
  return _BSFloatGreaterThanOrEqualToFloat(self->_elapsedTime, self->_duration);
}

- (void)applyForTime:(double)a3
{
  self->_elapsedTime = a3;
  -[CABasicAnimation applyForTime:presentationObject:modelObject:](self->_animation, "applyForTime:presentationObject:modelObject:", self->_valueDictionary, 0);
  id v6 = [(NSMutableDictionary *)self->_valueDictionary objectForKey:@"value"];
  [v6 bs_CGPointValue];
  self->_currentTranslation.double x = v4;
  self->_currentTranslation.double y = v5;
}

- (BKMousePointerCAAnimationDriver)initWithRelativeTranslation:(CGPoint)a3 animationSettings:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BKMousePointerCAAnimationDriver;
  v8 = -[BKMousePointerAnimationDriver initWithRelativeTranslation:](&v22, "initWithRelativeTranslation:", x, y);
  if (v8)
  {
    v9 = (BSAnimationSettings *)[v7 copy];
    animationSettings = v8->_animationSettings;
    v8->_animationSettings = v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    valueDictionardouble y = v8->_valueDictionary;
    v8->_valueDictionardouble y = (NSMutableDictionary *)v11;

    if ([(BSAnimationSettings *)v8->_animationSettings isSpringAnimation])
    {
      v13 = (CABasicAnimation *)objc_alloc_init((Class)CASpringAnimation);
      [(BSAnimationSettings *)v8->_animationSettings applyToCAAnimation:v13];
      [(CABasicAnimation *)v13 settlingDuration];
      v8->_duration = v14;
      -[CABasicAnimation setDuration:](v13, "setDuration:");
      animation = v8->_animation;
      v8->_animation = v13;
    }
    else
    {
      v16 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
      v17 = v8->_animation;
      v8->_animation = v16;

      [(BSAnimationSettings *)v8->_animationSettings applyToCAAnimation:v8->_animation];
      [(BSAnimationSettings *)v8->_animationSettings duration];
      v8->_duration = v18;
    }
    [(CABasicAnimation *)v8->_animation setBeginTime:0.0];
    [(CABasicAnimation *)v8->_animation setKeyPath:@"value"];
    [(CABasicAnimation *)v8->_animation setRemovedOnCompletion:0];
    [(CABasicAnimation *)v8->_animation setFillMode:kCAFillModeBoth];
    v19 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", CGPointZero.x, CGPointZero.y);
    [(CABasicAnimation *)v8->_animation setFromValue:v19];

    v20 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", x, y);
    [(CABasicAnimation *)v8->_animation setToValue:v20];
  }
  return v8;
}

@end