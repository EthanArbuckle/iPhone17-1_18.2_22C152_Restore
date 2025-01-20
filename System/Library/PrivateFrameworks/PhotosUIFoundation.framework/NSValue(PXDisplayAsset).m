@interface NSValue(PXDisplayAsset)
+ (id)valueWithPXDisplayAssetDetailedCounts:()PXDisplayAsset;
+ (id)valueWithPXDisplayAssetTypedCount:()PXDisplayAsset;
- (uint64_t)PXDisplayAssetDetailedCountsValue;
- (uint64_t)PXDisplayAssetTypedCountValue;
@end

@implementation NSValue(PXDisplayAsset)

- (uint64_t)PXDisplayAssetTypedCountValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return v2[0];
}

+ (id)valueWithPXDisplayAssetTypedCount:()PXDisplayAsset
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:v6 objCType:"{?=Qq}"];

  return v4;
}

- (uint64_t)PXDisplayAssetDetailedCountsValue
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return [a1 getValue:x8_0];
}

+ (id)valueWithPXDisplayAssetDetailedCounts:()PXDisplayAsset
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:a3 objCType:"{?=QQQ}"];

  return v3;
}

@end