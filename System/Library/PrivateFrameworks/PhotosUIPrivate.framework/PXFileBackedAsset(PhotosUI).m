@interface PXFileBackedAsset(PhotosUI)
- (__n128)photoIrisStillDisplayTime;
- (__n128)photoIrisVideoDuration;
- (double)duration;
- (uint64_t)hasPhotoColorAdjustments;
- (uint64_t)isGuestAsset;
- (uint64_t)isHidden;
- (uint64_t)isLivePhoto;
- (uint64_t)isPhotoIrisPlaceholder;
- (uint64_t)isTemporaryPlaceholder;
- (uint64_t)localizedGeoDescription;
- (uint64_t)modificationDate;
- (uint64_t)originalFilesize;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
@end

@implementation PXFileBackedAsset(PhotosUI)

- (uint64_t)isGuestAsset
{
  return 0;
}

- (unint64_t)pixelHeight
{
  [a1 size];
  return (unint64_t)v1;
}

- (unint64_t)pixelWidth
{
  [a1 size];
  return (unint64_t)v1;
}

- (__n128)photoIrisVideoDuration
{
  uint64_t v1 = MEMORY[0x1E4F1FA48];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)a1 = *MEMORY[0x1E4F1FA48];
  *(void *)(a1 + 16) = *(void *)(v1 + 16);
  return result;
}

- (__n128)photoIrisStillDisplayTime
{
  uint64_t v1 = MEMORY[0x1E4F1FA48];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)a1 = *MEMORY[0x1E4F1FA48];
  *(void *)(a1 + 16) = *(void *)(v1 + 16);
  return result;
}

- (uint64_t)hasPhotoColorAdjustments
{
  return 0;
}

- (uint64_t)isTemporaryPlaceholder
{
  return 0;
}

- (uint64_t)isPhotoIrisPlaceholder
{
  return 0;
}

- (uint64_t)isLivePhoto
{
  return 0;
}

- (uint64_t)isHidden
{
  return 0;
}

- (uint64_t)modificationDate
{
  return 0;
}

- (uint64_t)originalFilesize
{
  return 0;
}

- (uint64_t)localizedGeoDescription
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

@end