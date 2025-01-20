@interface MFPLevelsEffect
+ (id)GUID;
- (MFPLevelsEffect)initWithHighlight:(int)a3 midtone:(int)a4 shadow:(int)a5;
@end

@implementation MFPLevelsEffect

+ (id)GUID
{
  return @"99C354EC-2A31-4F3A-8C34-17A803B33A25";
}

- (MFPLevelsEffect)initWithHighlight:(int)a3 midtone:(int)a4 shadow:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MFPLevelsEffect;
  result = [(MFPLevelsEffect *)&v9 init];
  if (result)
  {
    result->mHighlight = a3;
    result->mMidtone = a4;
    result->mShadow = a5;
  }
  return result;
}

@end