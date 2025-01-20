@interface MFPTintEffect
+ (id)GUID;
- (MFPTintEffect)initWithHue:(int)a3 amount:(int)a4;
@end

@implementation MFPTintEffect

+ (id)GUID
{
  return @"1077AF00-2848-4441-9489-44AD4C2D7A2C";
}

- (MFPTintEffect)initWithHue:(int)a3 amount:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFPTintEffect;
  result = [(MFPTintEffect *)&v7 init];
  if (result)
  {
    result->mHue = a3;
    result->mAmount = a4;
  }
  return result;
}

@end