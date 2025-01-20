@interface MFPSharpenEffect
+ (id)GUID;
- (MFPSharpenEffect)initWithAmount:(float)a3 radius:(float)a4;
@end

@implementation MFPSharpenEffect

+ (id)GUID
{
  return @"63CBF3EE-C526-402C-8F71-62C540BF5142";
}

- (MFPSharpenEffect)initWithAmount:(float)a3 radius:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFPSharpenEffect;
  result = [(MFPSharpenEffect *)&v7 init];
  if (result)
  {
    result->mAmount = a3;
    result->mRadius = a4;
  }
  return result;
}

@end