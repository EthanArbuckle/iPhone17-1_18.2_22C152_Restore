@interface PFAssetAdjustments(PUReviewAdditions)
- (id)phAdjustmentData;
@end

@implementation PFAssetAdjustments(PUReviewAdditions)

- (id)phAdjustmentData
{
  id v2 = objc_alloc(MEMORY[0x1E4F38E98]);
  v3 = [a1 adjustmentFormatIdentifier];
  v4 = [a1 adjustmentFormatVersion];
  v5 = [a1 adjustmentData];
  v6 = (void *)[v2 initWithFormatIdentifier:v3 formatVersion:v4 data:v5];

  uint64_t v7 = [a1 adjustmentBaseVersion];
  if (v7 == 2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = v7 == 1;
  }
  [v6 setBaseVersion:v8];
  return v6;
}

@end