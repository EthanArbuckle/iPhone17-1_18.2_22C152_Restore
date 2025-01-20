@interface PXSyntheticAsset(PXStoryResource)
- (double)px_storyResourceFetchBestPlaybackRange;
- (double)px_storyResourceFetchBestPlaybackRect;
- (uint64_t)px_storyResourceFetchNormalizationData;
- (uint64_t)px_storyResourceFetchVideoAdjustments;
- (uint64_t)px_storyResourceKind;
@end

@implementation PXSyntheticAsset(PXStoryResource)

- (uint64_t)px_storyResourceFetchVideoAdjustments
{
  return 0;
}

- (uint64_t)px_storyResourceFetchNormalizationData
{
  return 0;
}

- (double)px_storyResourceFetchBestPlaybackRect
{
  return *MEMORY[0x1E4F1DB20];
}

- (double)px_storyResourceFetchBestPlaybackRange
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

- (uint64_t)px_storyResourceKind
{
  return 1;
}

@end