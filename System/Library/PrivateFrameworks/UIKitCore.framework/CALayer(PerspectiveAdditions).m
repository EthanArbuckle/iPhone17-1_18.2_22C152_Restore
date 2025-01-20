@interface CALayer(PerspectiveAdditions)
- (uint64_t)setPerspectiveDistance:()PerspectiveAdditions;
@end

@implementation CALayer(PerspectiveAdditions)

- (uint64_t)setPerspectiveDistance:()PerspectiveAdditions
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  [a1 sublayerTransform];
  *((double *)&v11 + 1) = -1.0 / a2;
  v5[6] = v12;
  v5[7] = v13;
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[5] = v11;
  return [a1 setSublayerTransform:v5];
}

@end