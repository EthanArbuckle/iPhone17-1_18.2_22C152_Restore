@interface MFPColorMatrixEffect
+ (id)GUID;
- (MFPColorMatrixEffect)initWithColorMatrix:(float)a3[5][5];
@end

@implementation MFPColorMatrixEffect

+ (id)GUID
{
  return @"718F2615-7933-40E3-A511-5F68FE14DD74";
}

- (MFPColorMatrixEffect)initWithColorMatrix:(float)a3[5][5]
{
  v8.receiver = self;
  v8.super_class = (Class)MFPColorMatrixEffect;
  result = [(MFPColorMatrixEffect *)&v8 init];
  if (result)
  {
    uint64_t v5 = 0;
    mColorMatrix = result->mColorMatrix;
    do
    {
      for (uint64_t i = 0; i != 5; ++i)
        (*mColorMatrix)[i] = (*a3)[i];
      ++v5;
      ++a3;
      ++mColorMatrix;
    }
    while (v5 != 5);
  }
  return result;
}

@end