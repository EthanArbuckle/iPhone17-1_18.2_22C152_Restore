@interface PHAsset(PXDisplayAssetAdoption)
- (BOOL)isAutoPlaybackEligibilityEstimated;
- (BOOL)isInCloud;
- (__CFString)localizedDetailedGeoDescriptionForRTL:()PXDisplayAssetAdoption;
- (double)bestCropRectForAspectRatio:()PXDisplayAssetAdoption verticalContentMode:cropMode:;
- (double)bestCropRectForAspectRatioV2:()PXDisplayAssetAdoption verticalContentMode:cropMode:;
- (float)audioScore;
- (id)fetchColorNormalizationData;
- (id)importDate;
- (id)localizedGeoDescription;
- (uint64_t)bestCropRectForAspectRatio:()PXDisplayAssetAdoption;
- (uint64_t)defaultImageProviderClass;
- (uint64_t)isContentEqualTo:()PXDisplayAssetAdoption;
- (uint64_t)isEligibleForAutoPlayback;
- (uint64_t)originalFileSize;
- (uint64_t)thumbnailVersion;
- (void)livePhotoStillDisplayTime;
- (void)livePhotoVideoDuration;
@end

@implementation PHAsset(PXDisplayAssetAdoption)

- (id)fetchColorNormalizationData
{
  [a1 fetchPropertySetsIfNeeded];
  v2 = [a1 mediaAnalysisProperties];
  v3 = [v2 colorNormalizationData];

  return v3;
}

- (void)livePhotoStillDisplayTime
{
  [a1 fetchPropertySetsIfNeeded];
  v4 = [a1 photoIrisProperties];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (v4)
  {
    id v5 = v4;
    [v4 photoIrisStillDisplayTime];
    v4 = v5;
  }
}

- (void)livePhotoVideoDuration
{
  [a1 fetchPropertySetsIfNeeded];
  v4 = [a1 photoIrisProperties];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (v4)
  {
    id v5 = v4;
    [v4 photoIrisVideoDuration];
    v4 = v5;
  }
}

- (float)audioScore
{
  [a1 fetchPropertySetsIfNeeded];
  v2 = [a1 mediaAnalysisProperties];
  [v2 audioScore];
  float v4 = v3;

  return v4;
}

- (uint64_t)isEligibleForAutoPlayback
{
  if (![a1 isAutoPlaybackEligibilityEstimated])
  {
    [a1 highlightVisibilityScore];
    double v5 = 0.763358779;
    return v4 >= v5;
  }
  uint64_t v2 = [a1 playbackStyle];
  if (v2 == 5) {
    return 1;
  }
  if (v2 == 4)
  {
    [a1 duration];
    double v5 = 2.0;
    return v4 >= v5;
  }
  if (v2 != 3 || ([MEMORY[0x1E4F29060] isMainThread] & 1) != 0) {
    return 0;
  }
  [a1 fetchPropertySetsIfNeeded];
  v7 = +[PXCuratedLibrarySettings sharedInstance];
  [v7 minAutoplaySuggestionScore];
  double v9 = v8;

  v10 = [a1 mediaAnalysisProperties];
  [v10 autoplaySuggestionScore];
  BOOL v3 = v9 < v11;

  return v3;
}

- (BOOL)isAutoPlaybackEligibilityEstimated
{
  [a1 highlightVisibilityScore];
  return v1 == 0.0;
}

- (id)importDate
{
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v2 = [a1 curationProperties];
  BOOL v3 = [v2 addedDate];

  return v3;
}

- (double)bestCropRectForAspectRatioV2:()PXDisplayAssetAdoption verticalContentMode:cropMode:
{
  uint64_t v4 = [a1 pixelWidth];
  uint64_t v5 = [a1 pixelHeight];
  if (!v4) {
    return *(double *)off_1E5DAB010;
  }
  uint64_t v6 = v5;
  if (!v5) {
    return *(double *)off_1E5DAB010;
  }
  v7 = (void *)MEMORY[0x1E4F8CBF8];
  [a1 preferredCropRect];
  uint64_t v32 = v8;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [a1 acceptableCropRect];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [a1 normalizedFaceAreaRect];
  objc_msgSend(v7, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", v4, v6, a2, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v32, v10, v12, v14, v16, v18, v20, v22, v23,
    v24,
    v25,
    v26);
  double x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  if (CGRectIsEmpty(v33)) {
    PXAssertGetLog();
  }
  v34.origin.double x = 0.0;
  v34.origin.CGFloat y = 0.0;
  v34.size.CGFloat width = 1.0;
  v34.size.CGFloat height = 1.0;
  v35.origin.double x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  if (!CGRectContainsRect(v34, v35)) {
    PXAssertGetLog();
  }
  return x;
}

- (double)bestCropRectForAspectRatio:()PXDisplayAssetAdoption verticalContentMode:cropMode:
{
  uint64_t v8 = (void *)MEMORY[0x1E4F8CBF8];
  uint64_t v9 = [a1 pixelWidth];
  uint64_t v10 = [a1 pixelHeight];
  [a1 preferredCropRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [a1 acceptableCropRect];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  [a1 normalizedFaceAreaRect];
  objc_msgSend(v8, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a4, a5, v9, v10, a2, v12, v14, v16, v18, v20, v22, v24, v26, v27, v28, v29,
    v30);
  double x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  if (CGRectIsEmpty(v37)) {
    PXAssertGetLog();
  }
  v38.origin.double x = 0.0;
  v38.origin.CGFloat y = 0.0;
  v38.size.CGFloat width = 1.0;
  v38.size.CGFloat height = 1.0;
  v39.origin.double x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  if (!CGRectContainsRect(v38, v39)) {
    PXAssertGetLog();
  }
  return x;
}

- (uint64_t)bestCropRectForAspectRatio:()PXDisplayAssetAdoption
{
  return objc_msgSend(a1, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 3);
}

- (uint64_t)thumbnailVersion
{
  uint64_t v2 = [a1 modificationDate];
  uint64_t v3 = [v2 hash];
  uint64_t v4 = [a1 pixelWidth] ^ v3;
  uint64_t v5 = v4 ^ ([a1 pixelHeight] << 32);

  return v5;
}

- (uint64_t)isContentEqualTo:()PXDisplayAssetAdoption
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

- (uint64_t)defaultImageProviderClass
{
  return objc_opt_class();
}

- (__CFString)localizedDetailedGeoDescriptionForRTL:()PXDisplayAssetAdoption
{
  char v15 = 0;
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v5 = [a1 photosOneUpProperties];
  uint64_t v6 = [v5 placeNamesForLocalizedDetailedDescriptionIsHome:&v15];

  if (v15)
  {
    PXLocalizedStringFromTable(@"PXPHOTOBROWSER_TITLE_AT_HOME", @"PhotosUICore");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if ([v6 count])
  {
    uint64_t v8 = PXLocalizedStringFromTable(@"PXOneUpPlaceNamesDelimiter", @"PhotosUICore");
    uint64_t v9 = [NSString stringWithFormat:@"%@%@%@", @"⁩", v8, @"⁨"];
    uint64_t v10 = NSString;
    if (a3) {
      double v11 = @"\u200F";
    }
    else {
      double v11 = @"\u200E";
    }
    double v12 = [v6 array];
    double v13 = [v12 componentsJoinedByString:v9];
    v7 = [v10 stringWithFormat:@"%@%@%@%@", v11, @"⁨", v13, @"⁩"];
  }
  else
  {
    v7 = &stru_1F00B0030;
  }

  return v7;
}

- (id)localizedGeoDescription
{
  char v6 = 0;
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v2 = [a1 photosOneUpProperties];
  uint64_t v3 = [v2 localizedGeoDescriptionIsHome:&v6];

  if (v6)
  {
    uint64_t v4 = PXLocalizedStringFromTable(@"PXPHOTOBROWSER_TITLE_AT_HOME", @"PhotosUICore");

    uint64_t v3 = (void *)v4;
  }
  return v3;
}

- (uint64_t)originalFileSize
{
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v2 = [a1 originalMetadataProperties];
  uint64_t v3 = [v2 originalFilesize];

  return v3;
}

- (BOOL)isInCloud
{
  return [a1 cloudPlaceholderKind] == 2;
}

@end