@interface SSMLRangeConversionResult
- (NSError)error;
- (NSString)plainString;
- (SSMLRangeConversionResult)init;
- (_NSRange)convertedRange;
- (void)setConvertedRange:(_NSRange)a3;
- (void)setError:(id)a3;
- (void)setPlainString:(id)a3;
@end

@implementation SSMLRangeConversionResult

- (SSMLRangeConversionResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSMLRangeConversionResult;
  result = [(SSMLRangeConversionResult *)&v3 init];
  if (result)
  {
    result->_convertedRange.location = 0;
    result->_convertedRange.length = 0;
  }
  return result;
}

- (NSString)plainString
{
  return self->_plainString;
}

- (void)setPlainString:(id)a3
{
}

- (_NSRange)convertedRange
{
  NSUInteger length = self->_convertedRange.length;
  NSUInteger location = self->_convertedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setConvertedRange:(_NSRange)a3
{
  self->_convertedRange = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_plainString, 0);
}

@end