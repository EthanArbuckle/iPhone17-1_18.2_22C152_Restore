@interface SiriTTSSynthesisEngineWordTimings
- (_NSRange)textRange;
- (double)startTime;
- (void)setStartTime:(double)a3;
- (void)setTextRange:(_NSRange)a3;
@end

@implementation SiriTTSSynthesisEngineWordTimings

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
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