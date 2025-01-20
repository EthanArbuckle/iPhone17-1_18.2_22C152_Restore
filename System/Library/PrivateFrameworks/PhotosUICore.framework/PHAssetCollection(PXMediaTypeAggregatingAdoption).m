@interface PHAssetCollection(PXMediaTypeAggregatingAdoption)
- (uint64_t)aggregateMediaType;
@end

@implementation PHAssetCollection(PXMediaTypeAggregatingAdoption)

- (uint64_t)aggregateMediaType
{
  uint64_t v2 = [a1 estimatedPhotosCount];
  uint64_t v3 = [a1 estimatedVideosCount];
  uint64_t result = [a1 estimatedAssetCount];
  if (result)
  {
    if (v3 || v2 != result)
    {
      if (v3 == result && v2 == 0) {
        return 2;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end