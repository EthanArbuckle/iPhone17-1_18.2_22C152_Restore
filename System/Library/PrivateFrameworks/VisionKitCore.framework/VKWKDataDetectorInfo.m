@interface VKWKDataDetectorInfo
- (DDScannerResult)result;
- (NSArray)boundingQuads;
- (_NSRange)characterRange;
- (void)setBoundingQuads:(id)a3;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setResult:(id)a3;
@end

@implementation VKWKDataDetectorInfo

- (DDScannerResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSArray)boundingQuads
{
  return self->_boundingQuads;
}

- (void)setBoundingQuads:(id)a3
{
}

- (_NSRange)characterRange
{
  NSUInteger length = self->_characterRange.length;
  NSUInteger location = self->_characterRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingQuads, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end