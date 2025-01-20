@interface _TUICursorEffectAnimationState
- (CABasicAnimation)animation;
- (double)startTime;
- (void)setAnimation:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation _TUICursorEffectAnimationState

- (void).cxx_destruct
{
}

- (void)setAnimation:(id)a3
{
}

- (CABasicAnimation)animation
{
  return self->_animation;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

@end