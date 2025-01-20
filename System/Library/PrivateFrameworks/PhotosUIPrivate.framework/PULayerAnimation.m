@interface PULayerAnimation
- (BOOL)isReadyToComplete;
- (CAAnimation)_animation;
- (CALayer)layer;
- (NSString)description;
- (NSString)key;
- (PULayerAnimation)init;
- (PULayerAnimation)initWithLayer:(id)a3 key:(id)a4;
- (void)_setAnimation:(id)a3;
- (void)_updateLayerAnimation;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)finishImmediately;
- (void)setSpeed:(float)a3 timeOffset:(double)a4 beginTime:(double)a5;
@end

@implementation PULayerAnimation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animation, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

- (void)_setAnimation:(id)a3
{
}

- (CAAnimation)_animation
{
  return self->__animation;
}

- (NSString)key
{
  return self->_key;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PULayerAnimation *)self layer];
  v7 = [(PULayerAnimation *)self key];
  v8 = [v3 stringWithFormat:@"<%@ %p; layer: %@; key: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(PULayerAnimation *)self _animation];

  if (v6 == v5)
  {
    self->_isAnimationRunning = 0;
    [(PUAnimationGroup *)self completeIfNeeded];
    [(PULayerAnimation *)self _setAnimation:0];
  }
}

- (void)animationDidStart:(id)a3
{
  id v4 = a3;
  id v5 = [(PULayerAnimation *)self _animation];

  if (v5 == v4) {
    self->_isAnimationRunning = 1;
  }
}

- (void)_updateLayerAnimation
{
  v3 = [(PULayerAnimation *)self _animation];
  id v4 = (void *)[v3 mutableCopy];

  *(float *)&double v5 = self->_speed;
  [v4 setSpeed:v5];
  [v4 setTimeOffset:self->_timeOffset];
  [v4 setBeginTime:self->_beginTime];
  [v4 setDelegate:self];
  id v6 = [(PULayerAnimation *)self layer];
  v7 = [(PULayerAnimation *)self key];
  [v6 removeAnimationForKey:v7];
  [v6 addAnimation:v4 forKey:v7];
  id v8 = [v6 animationForKey:v7];

  [(PULayerAnimation *)self _setAnimation:v8];
}

- (void)finishImmediately
{
  v7.receiver = self;
  v7.super_class = (Class)PULayerAnimation;
  [(PUAnimationGroup *)&v7 finishImmediately];
  v3 = [(PULayerAnimation *)self _animation];
  id v4 = [(PULayerAnimation *)self layer];
  double v5 = [(PULayerAnimation *)self key];
  id v6 = [v4 animationForKey:v5];

  if (v3 == v6) {
    [v4 removeAnimationForKey:v5];
  }
}

- (void)setSpeed:(float)a3 timeOffset:(double)a4 beginTime:(double)a5
{
  v9 = [(PULayerAnimation *)self _animation];
  if (v9)
  {
    id v15 = v9;
    v10 = [(PULayerAnimation *)self layer];
    v11 = [(PULayerAnimation *)self key];
    id v12 = [v10 animationForKey:v11];

    if (v15 == v12)
    {
      if (a3 == 0.0)
      {
        if (a4 < 0.0) {
          a4 = 0.0;
        }
        [v15 duration];
        double v14 = v13 + -0.01;
        if (a4 >= v14) {
          a4 = v14;
        }
      }
      if (self->_speed != a3 || a4 != self->_timeOffset || self->_beginTime != a5)
      {
        self->_speed = a3;
        self->_timeOffset = a4;
        self->_beginTime = a5;
        [(PULayerAnimation *)self _updateLayerAnimation];
      }
    }
    else
    {
      self->_isAnimationRunning = 0;
      [(PULayerAnimation *)self _setAnimation:0];
    }

    v9 = v15;
  }
}

- (BOOL)isReadyToComplete
{
  v10.receiver = self;
  v10.super_class = (Class)PULayerAnimation;
  if ([(PUAnimationGroup *)&v10 isReadyToComplete])
  {
    v3 = [(PULayerAnimation *)self _animation];
    if (v3 && self->_isAnimationRunning)
    {
      id v4 = [(PULayerAnimation *)self layer];
      double v5 = [(PULayerAnimation *)self key];
      id v6 = [v4 animationForKey:v5];
      BOOL v7 = v3 == v6;

      char v8 = !v7;
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (PULayerAnimation)initWithLayer:(id)a3 key:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PULayerAnimation.m", 30, @"Invalid parameter not satisfying: %@", @"layer != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PULayerAnimation.m", 31, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PULayerAnimation;
  v11 = [(PULayerAnimation *)&v23 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layer, a3);
    uint64_t v13 = [v10 copy];
    key = v12->_key;
    v12->_key = (NSString *)v13;

    uint64_t v15 = [v8 animationForKey:v12->_key];
    animation = v12->__animation;
    v12->__animation = (CAAnimation *)v15;

    [(CAAnimation *)v12->__animation speed];
    v12->_speed = v17;
    [(CAAnimation *)v12->__animation timeOffset];
    v12->_timeOffset = v18;
    [(CAAnimation *)v12->__animation beginTime];
    v12->_beginTime = v19;
    v12->_isAnimationRunning = v12->_speed > 0.0;
  }

  return v12;
}

- (PULayerAnimation)init
{
  return [(PULayerAnimation *)self initWithLayer:0 key:0];
}

@end