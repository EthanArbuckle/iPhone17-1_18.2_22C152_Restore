@interface _UIKBRTDecayingOffset
- (CGPoint)offset;
- (CGPoint)originalOffset;
- (_UIKBRTDecayingOffset)initWithTimeoutDuration:(double)a3 limitMovement:(BOOL)a4;
- (void)reset;
- (void)updateOffsetTo:(CGPoint)a3;
@end

@implementation _UIKBRTDecayingOffset

- (_UIKBRTDecayingOffset)initWithTimeoutDuration:(double)a3 limitMovement:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTDecayingOffset;
  result = [(_UIKBRTDecayingObject *)&v6 initWithTimeoutDuration:a3];
  if (result) {
    result->_limitMovement = a4;
  }
  return result;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTDecayingOffset;
  [(_UIKBRTDecayingObject *)&v3 reset];
  self->_offset = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (void)updateOffsetTo:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(_UIKBRTDecayingObject *)self isActive];
  [(_UIKBRTDecayingOffset *)self offset];
  if (v6 && self->_limitMovement)
  {
    double v9 = x - v7;
    double v10 = y - v8;
    double v11 = v9 * v9 + v10 * v10;
    if (v11 > 625.0)
    {
      double v12 = 25.0 / sqrt(v11);
      double v9 = v9 * v12;
      double v10 = v10 * v12;
    }
    double v13 = self->_offset.y;
    double x = trunc(v9 + self->_offset.x + 0.5);
    self->_offset.double x = x;
    self->_offset.double y = trunc(v10 + v13 + 0.5);
  }
  else
  {
    self->_offset.double x = x;
    self->_offset.double y = y;
  }
  if (fabs(x) >= 1.0 || fabs(self->_offset.y) >= 1.0)
  {
    double v14 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    [(_UIKBRTDecayingObject *)self resetDecayTo:v14];
  }
  else
  {
    [(_UIKBRTDecayingOffset *)self reset];
    self->_offset = (CGPoint)*MEMORY[0x1E4F1DAD8];
  }
}

- (CGPoint)offset
{
  [(_UIKBRTDecayingObject *)self updateDecay];
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)originalOffset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end