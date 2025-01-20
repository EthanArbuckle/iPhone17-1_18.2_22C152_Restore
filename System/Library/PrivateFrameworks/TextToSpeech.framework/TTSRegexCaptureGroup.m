@interface TTSRegexCaptureGroup
- (_NSRange)utf8Range;
- (void)setUtf8Range:(_NSRange)a3;
@end

@implementation TTSRegexCaptureGroup

- (_NSRange)utf8Range
{
  NSUInteger length = self->_utf8Range.length;
  NSUInteger location = self->_utf8Range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setUtf8Range:(_NSRange)a3
{
  self->_utf8Range = a3;
}

@end