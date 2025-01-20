@interface _PIParallaxClockMaterialResult
- (_PIParallaxClockMaterialResult)initWithClockAreaLuminance:(double)a3;
- (double)clockAreaLuminance;
@end

@implementation _PIParallaxClockMaterialResult

- (double)clockAreaLuminance
{
  return self->_clockAreaLuminance;
}

- (_PIParallaxClockMaterialResult)initWithClockAreaLuminance:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PIParallaxClockMaterialResult;
  result = [(_PIParallaxClockMaterialResult *)&v5 init];
  if (result) {
    result->_clockAreaLuminance = a3;
  }
  return result;
}

@end