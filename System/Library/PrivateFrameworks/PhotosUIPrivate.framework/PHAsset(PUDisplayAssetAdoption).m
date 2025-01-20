@interface PHAsset(PUDisplayAssetAdoption)
- (BOOL)isAnimatedImage;
- (double)videoKeyFrameSourceTime;
- (id)accessibilityDescription;
- (id)pathForOriginalImageFile;
- (id)pathForOriginalVideoFile;
- (id)pathForTrimmedVideoFile;
- (id)videoObjectBuilder;
- (uint64_t)contentChangeFromDisplayAsset:()PUDisplayAssetAdoption;
- (uint64_t)hasSyndicationInformation;
- (uint64_t)isCloudPhotoLibraryEnabled;
- (uint64_t)isContentAdjustmentAllowed;
- (uint64_t)isContentEqualTo:()PUDisplayAssetAdoption;
- (uint64_t)isInPlaceVideoTrimAllowed;
- (uint64_t)isResourceDownloadPossible;
- (uint64_t)isTrimmableType;
- (uint64_t)livePhotoVisibilityState;
- (uint64_t)originalEXIFOrientation;
- (uint64_t)originalFilesize;
- (void)photoIrisStillDisplayTime;
- (void)photoIrisVideoDuration;
@end

@implementation PHAsset(PUDisplayAssetAdoption)

- (uint64_t)hasSyndicationInformation
{
  return MEMORY[0x1F4143CA8]();
}

- (id)accessibilityDescription
{
  v1 = [a1 descriptionProperties];
  v2 = [v1 accessibilityDescription];

  return v2;
}

- (double)videoKeyFrameSourceTime
{
  uint64_t v4 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)a2 = *MEMORY[0x1E4F1F9F8];
  *(void *)(a2 + 16) = *(void *)(v4 + 16);
  [a1 fetchPropertySetsIfNeeded];
  long long v8 = 0uLL;
  v5 = [a1 mediaAnalysisProperties];
  v6 = v5;
  if (v5) {
    [v5 bestKeyFrameTime];
  }
  else {
    long long v8 = 0uLL;
  }

  if (BYTE12(v8))
  {
    double result = *(double *)&v8;
    *(_OWORD *)a2 = v8;
    *(void *)(a2 + 16) = 0;
  }
  return result;
}

- (id)pathForTrimmedVideoFile
{
  v1 = objc_msgSend(a1, "pl_managedAsset");
  v2 = [v1 pathForTrimmedVideoFile];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)pathForOriginalVideoFile
{
  v1 = objc_msgSend(a1, "pl_managedAsset");
  v2 = [v1 pathForVideoFile];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)pathForOriginalImageFile
{
  v1 = objc_msgSend(a1, "pl_managedAsset");
  v2 = [v1 pathForOriginalFile];

  return v2;
}

- (uint64_t)isCloudPhotoLibraryEnabled
{
  v1 = [a1 photoLibrary];
  uint64_t v2 = [v1 isCloudPhotoLibraryEnabled];

  return v2;
}

- (uint64_t)isResourceDownloadPossible
{
  return 1;
}

- (uint64_t)originalEXIFOrientation
{
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v2 = [a1 originalMetadataProperties];
  uint64_t v3 = [v2 originalExifOrientation];

  return v3;
}

- (id)videoObjectBuilder
{
  v1 = objc_msgSend(a1, "pl_managedAsset");
  int v2 = [v1 isDefaultAdjustedSlomo];
  uint64_t v3 = [MEMORY[0x1E4F8ABF0] videoAVObjectBuilderForManagedAsset:v1 applyVideoAdjustments:v2 ^ 1u];

  return v3;
}

- (uint64_t)livePhotoVisibilityState
{
  [a1 fetchPropertySetsIfNeeded];
  int v2 = [a1 photoIrisProperties];
  unsigned int v3 = [v2 photoIrisVisibilityState];

  return v3;
}

- (uint64_t)isTrimmableType
{
  if ([a1 isLivePhoto]) {
    return 1;
  }
  return [a1 isVideo];
}

- (uint64_t)isInPlaceVideoTrimAllowed
{
  return 1;
}

- (uint64_t)isContentAdjustmentAllowed
{
  return [a1 canPerformEditOperation:2];
}

- (uint64_t)originalFilesize
{
  [a1 fetchPropertySetsIfNeeded];
  int v2 = [a1 originalMetadataProperties];
  uint64_t v3 = [v2 originalFilesize];

  return v3;
}

- (BOOL)isAnimatedImage
{
  return ([a1 hasAdjustments] & 1) == 0 && objc_msgSend(a1, "playbackStyle") == 2;
}

- (void)photoIrisVideoDuration
{
  [a1 fetchPropertySetsIfNeeded];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = [a1 photoIrisProperties];
  if (v4)
  {
    v5 = v4;
    [v4 photoIrisVideoDuration];
    uint64_t v4 = v5;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
}

- (void)photoIrisStillDisplayTime
{
  [a1 fetchPropertySetsIfNeeded];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = [a1 photoIrisProperties];
  if (v4)
  {
    v5 = v4;
    [v4 photoIrisStillDisplayTime];
    uint64_t v4 = v5;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
}

- (uint64_t)contentChangeFromDisplayAsset:()PUDisplayAssetAdoption
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = [a1 contentChangeFromAsset:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

- (uint64_t)isContentEqualTo:()PUDisplayAssetAdoption
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a1 hasContentEqualTo:v4]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = v4 == 0;
  }

  return v5;
}

@end