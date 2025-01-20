@interface AXKonaMarker
- (NSString)text;
- (_NSRange)originalStringRange;
- (unsigned)framePosition;
- (void)setFramePosition:(unsigned int)a3;
- (void)setOriginalStringRange:(_NSRange)a3;
- (void)setText:(id)a3;
@end

@implementation AXKonaMarker

- (_NSRange)originalStringRange
{
  NSUInteger length = self->_originalStringRange.length;
  NSUInteger location = self->_originalStringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setOriginalStringRange:(_NSRange)a3
{
  self->_originalStringRange = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (unsigned)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unsigned int)a3
{
  self->_framePosition = a3;
}

- (void).cxx_destruct
{
}

@end