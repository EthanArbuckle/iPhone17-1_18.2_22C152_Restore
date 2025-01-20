@interface _PIDisparitySampleResult
- (_PIDisparitySampleResult)initWithDisparityValue:(float)a3;
- (float)sampledDisparityValue;
@end

@implementation _PIDisparitySampleResult

- (float)sampledDisparityValue
{
  return self->_sampledDisparityValue;
}

- (_PIDisparitySampleResult)initWithDisparityValue:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PIDisparitySampleResult;
  result = [(_PIDisparitySampleResult *)&v5 init];
  if (result) {
    result->_sampledDisparityValue = a3;
  }
  return result;
}

@end