@interface PGFeatureExtractor
+ (id)featureExtractor;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractor

+ (id)featureExtractor
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)featureLength
{
  return self->featureLength;
}

@end