@interface _UIKeyboardTypingSpeedLogger
- (_UIKeyboardTypingSpeedLogger)init;
- (void)logToAggregate;
- (void)recordTypingDelay:(double)a3;
@end

@implementation _UIKeyboardTypingSpeedLogger

- (_UIKeyboardTypingSpeedLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardTypingSpeedLogger;
  result = [(_UIKeyboardTypingSpeedLogger *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_typingDelaySamples[6] = 0u;
    *(_OWORD *)&result->_typingDelaySamples[4] = 0u;
    *(_OWORD *)&result->_typingDelaySamples[2] = 0u;
    *(_OWORD *)result->_typingDelaySamples = 0u;
  }
  return result;
}

- (void)recordTypingDelay:(double)a3
{
  if (_UIGetUIKeyboardTypingSpeedLogger())
  {
    ++self->_typingDelaySampleCount;
    if (a3 <= 0.1)
    {
      uint64_t v5 = 0;
    }
    else if (a3 <= 0.15)
    {
      uint64_t v5 = 1;
    }
    else if (a3 <= 0.2)
    {
      uint64_t v5 = 2;
    }
    else if (a3 <= 0.25)
    {
      uint64_t v5 = 3;
    }
    else if (a3 <= 0.3)
    {
      uint64_t v5 = 4;
    }
    else
    {
      uint64_t v5 = 5;
      if (a3 > 0.4) {
        uint64_t v5 = 6;
      }
    }
    ++self->_typingDelaySamples[v5];
    if (self->_typingDelaySampleCount >= 300)
    {
      [(_UIKeyboardTypingSpeedLogger *)self logToAggregate];
    }
  }
}

- (void)logToAggregate
{
  if (_UIGetUIKeyboardTypingSpeedLogger())
  {
    for (uint64_t i = 0; i != 7; ++i)
    {
      ADClientAddValueForScalarKey();
      self->_typingDelaySamples[i] = 0;
    }
    self->_typingDelaySampleCount = 0;
  }
}

@end