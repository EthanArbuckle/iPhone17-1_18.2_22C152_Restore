@interface SXArticleScrollEvent
- (double)endPosition;
- (double)startPosition;
- (double)targetPosition;
- (double)velocity;
- (void)setEndPosition:(double)a3;
- (void)setStartPosition:(double)a3;
- (void)setTargetPosition:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation SXArticleScrollEvent

- (double)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(double)a3
{
  self->_startPosition = a3;
}

- (double)endPosition
{
  return self->_endPosition;
}

- (void)setEndPosition:(double)a3
{
  self->_endPosition = a3;
}

- (double)targetPosition
{
  return self->_targetPosition;
}

- (void)setTargetPosition:(double)a3
{
  self->_targetPosition = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

@end