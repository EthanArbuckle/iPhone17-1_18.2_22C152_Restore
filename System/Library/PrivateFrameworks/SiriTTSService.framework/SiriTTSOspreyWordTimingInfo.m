@interface SiriTTSOspreyWordTimingInfo
- (_NSRange)textRange;
- (double)timestamp;
- (void)setTextRange:(_NSRange)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SiriTTSOspreyWordTimingInfo

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

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

@end