@interface NTPBTodayResultOperationInfo(NTAdditions)
- (double)dynamicThumbnailSizeMinimumSizeInPixels;
- (id)assetsDirectoryFileURL;
- (uint64_t)setDynamicThumbnailSizeMinimumSizeInPixels:()NTAdditions;
- (void)setAssetsDirectoryFileURL:()NTAdditions;
@end

@implementation NTPBTodayResultOperationInfo(NTAdditions)

- (uint64_t)setDynamicThumbnailSizeMinimumSizeInPixels:()NTAdditions
{
  [a1 setDynamicThumbnailSizePresetMinimumWidthInPixels:a2];

  return [a1 setDynamicThumbnailSizePresetMinimumHeightInPixels:a3];
}

- (void)setAssetsDirectoryFileURL:()NTAdditions
{
  id v4 = [a3 absoluteString];
  [a1 setAssetsDirectoryFileURLString:v4];
}

- (id)assetsDirectoryFileURL
{
  v1 = [a1 assetsDirectoryFileURLString];
  if (v1)
  {
    v2 = [NSURL fileURLWithPath:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (double)dynamicThumbnailSizeMinimumSizeInPixels
{
  double v2 = (double)[a1 dynamicThumbnailSizePresetMinimumWidthInPixels];
  [a1 dynamicThumbnailSizePresetMinimumHeightInPixels];
  return v2;
}

@end