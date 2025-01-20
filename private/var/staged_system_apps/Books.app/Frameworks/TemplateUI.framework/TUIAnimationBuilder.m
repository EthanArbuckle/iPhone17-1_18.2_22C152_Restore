@interface TUIAnimationBuilder
- (TUIAnimationBuilder)init;
- (id)finalizeAnimationWithContext:(id)a3;
- (void)addFromAnimationStep:(id)a3;
- (void)addKeyframeStep:(id)a3;
- (void)addToAnimationStep:(id)a3;
- (void)configureWithNode:(id)a3 attributes:(id)a4;
@end

@implementation TUIAnimationBuilder

- (TUIAnimationBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIAnimationBuilder;
  result = [(TUIAnimationBuilder *)&v3 init];
  if (result) {
    result->_error = 0;
  }
  return result;
}

- (void)configureWithNode:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  [v6 floatForAttribute:66 node:a3.var0];
  self->_delay = v7;
  [v6 floatForAttribute:69 node:a3.var0];
  self->_duration = v8;
  self->_options = (unint64_t)[v6 animationCalculationModeAndCurveForNode:a3.var0];
  if (v6)
  {
    [v6 springTimingParametersForAttribute:202 node:a3.var0];
  }
  else
  {
    CGFloat v11 = 0.0;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  *(_OWORD *)&self->_timing.mass = v9;
  *(_OWORD *)&self->_timing.damping = v10;
  self->_timing.initialVelocity.dy = v11;
}

- (void)addFromAnimationStep:(id)a3
{
  id v5 = a3;
  if (self->_from || self->_keyFrames)
  {
    self->_error = 1019;
  }
  else
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_from, a3);
    id v5 = v6;
  }
}

- (void)addToAnimationStep:(id)a3
{
  id v5 = a3;
  if (*(_OWORD *)&self->_to == 0)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_to, a3);
    id v5 = v6;
  }
  else
  {
    self->_error = 1019;
  }
}

- (void)addKeyframeStep:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_from == 0)
  {
    keyFrames = self->_keyFrames;
    id v8 = v4;
    if (!keyFrames)
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      double v7 = self->_keyFrames;
      self->_keyFrames = v6;

      keyFrames = self->_keyFrames;
    }
    [(NSMutableArray *)keyFrames addObject:v8];
    id v4 = v8;
  }
  else
  {
    self->_error = 1019;
  }
}

- (id)finalizeAnimationWithContext:(id)a3
{
  unint64_t error = self->_error;
  if (error)
  {
    [a3 reportError:error];
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(TUIAnimation);
    [(TUIAnimation *)v4 setFrom:self->_from];
    [(TUIAnimation *)v4 setTo:self->_to];
    [(TUIAnimation *)v4 setSteps:self->_keyFrames];
    [(TUIAnimation *)v4 setDelay:self->_delay];
    [(TUIAnimation *)v4 setDuration:self->_duration];
    [(TUIAnimation *)v4 setOptions:self->_options | [(TUIAnimation *)v4 options]];
    long long v6 = *(_OWORD *)&self->_timing.damping;
    v8[0] = *(_OWORD *)&self->_timing.mass;
    v8[1] = v6;
    CGFloat dy = self->_timing.initialVelocity.dy;
    [(TUIAnimation *)v4 setTiming:v8];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFrames, 0);
  objc_storeStrong((id *)&self->_to, 0);

  objc_storeStrong((id *)&self->_from, 0);
}

@end