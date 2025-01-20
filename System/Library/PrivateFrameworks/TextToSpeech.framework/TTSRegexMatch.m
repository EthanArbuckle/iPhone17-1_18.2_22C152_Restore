@interface TTSRegexMatch
- (NSArray)captureGroups;
- (_NSRange)utf8Range;
- (void)setCaptureGroups:(id)a3;
- (void)setUtf8Range:(_NSRange)a3;
@end

@implementation TTSRegexMatch

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

- (NSArray)captureGroups
{
  return self->_captureGroups;
}

- (void)setCaptureGroups:(id)a3
{
}

- (void).cxx_destruct
{
}

@end