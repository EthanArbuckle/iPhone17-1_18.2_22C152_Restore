@interface ICASConversionMethod
- (ICASConversionMethod)initWithConversionMethod:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)conversionMethod;
@end

@implementation ICASConversionMethod

- (ICASConversionMethod)initWithConversionMethod:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASConversionMethod;
  result = [(ICASConversionMethod *)&v5 init];
  if (result) {
    result->_conversionMethod = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASConversionMethod *)self conversionMethod];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"manual";
  }
  if (v3 == 2) {
    return @"automatic";
  }
  else {
    return v4;
  }
}

- (int64_t)conversionMethod
{
  return self->_conversionMethod;
}

@end