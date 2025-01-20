@interface MPMediaItem(VideosUI)
+ (id)vui_mediaItemForPersistentIdentifier:()VideosUI;
+ (id)vui_mediaItemForStoreIdentifier:()VideosUI;
+ (id)vui_mediaItemForStoreIdentifierString:()VideosUI;
+ (uint64_t)_vui_isLocalWithPropertyValues:()VideosUI;
+ (uint64_t)_vui_isNetworkPlayableWithPropertyValues:()VideosUI;
+ (uint64_t)vui_MPMediaItemAudioCapabilityFromVUIMediaEntityAudioCapability:()VideosUI;
+ (uint64_t)vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:()VideosUI;
+ (uint64_t)vui_MPMediaItemVideoQualityFromVUIMediaEntityResolution:()VideosUI;
+ (uint64_t)vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:()VideosUI;
+ (uint64_t)vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:()VideosUI;
+ (uint64_t)vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:()VideosUI;
- (BOOL)vui_isDownloadedOrDownloadingOrEnqueued;
- (BOOL)vui_isHomeSharingMediaItem;
- (VUIMPMediaEntityImageLoadParams)vui_imageLoadParamsWithImageType:()VideosUI;
- (VUIMediaItemCredits)vui_credits;
- (id)_vui_imageIdentifierWithImageType:()VideosUI;
- (id)vui_HLSAudioCapability;
- (id)vui_HLSColorCapability;
- (id)vui_HLSResolution;
- (id)vui_adamIDString;
- (id)vui_artworkCatalogWithImageType:()VideosUI;
- (id)vui_assetTypeIgnoringLocalAsset:()VideosUI;
- (id)vui_audioCapability;
- (id)vui_colorCapability;
- (id)vui_contentRating;
- (id)vui_extrasURL;
- (id)vui_homeSharingLibrary;
- (id)vui_imageIdentifierWithImageType:()VideosUI;
- (id)vui_isLocalCheckingSidebandLibrary:()VideosUI;
- (id)vui_isPlayable;
- (id)vui_mediaEntityType;
- (id)vui_playedState;
- (id)vui_rentalEndDate;
- (id)vui_rentalExpirationDate;
- (id)vui_rentalPlaybackEndDate;
- (id)vui_resolution;
- (id)vui_seasonIdentifier;
- (id)vui_showIdentifier;
- (id)vui_studio;
- (uint64_t)vui_assetType;
- (uint64_t)vui_coverArtImageIdentifier;
- (uint64_t)vui_previewFrameImageIdentifier;
@end

@implementation MPMediaItem(VideosUI)

- (BOOL)vui_isHomeSharingMediaItem
{
  v1 = objc_msgSend(a1, "vui_homeSharingLibrary");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)vui_homeSharingLibrary
{
  v1 = [a1 mediaLibrary];
  BOOL v2 = [v1 libraryDataProvider];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 homeSharingLibrary];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)vui_adamIDString
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31500]];
  BOOL v2 = v1;
  if (v1 && [v1 longLongValue])
  {
    v3 = [v2 stringValue];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)vui_mediaEntityType
{
  __int16 v2 = [a1 mediaType];
  if ((v2 & 0x100) != 0)
  {
    if ([a1 isRental]) {
      +[VUIMediaEntityType movieRental];
    }
    else {
    v3 = +[VUIMediaEntityType movie];
    }
  }
  else if ((v2 & 0x200) != 0)
  {
    v3 = +[VUIMediaEntityType episode];
  }
  else if ((v2 & 0x2000) != 0)
  {
    v3 = +[VUIMediaEntityType homeVideo];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)vui_resolution
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31540]];
  if (v1)
  {
    __int16 v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:", objc_msgSend(v1, "integerValue")));
  }
  else
  {
    __int16 v2 = 0;
  }

  return v2;
}

- (id)vui_colorCapability
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31328]];
  if (v1)
  {
    __int16 v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:", objc_msgSend(v1, "integerValue")));
  }
  else
  {
    __int16 v2 = 0;
  }

  return v2;
}

- (id)vui_audioCapability
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31310]];
  if (v1)
  {
    __int16 v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:", objc_msgSend(v1, "integerValue")));
  }
  else
  {
    __int16 v2 = 0;
  }

  return v2;
}

- (id)vui_HLSResolution
{
  uint64_t v2 = *MEMORY[0x1E4F313A8];
  uint64_t v3 = *MEMORY[0x1E4F31390];
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313A8], *MEMORY[0x1E4F31390], 0);
  v5 = [a1 valuesForProperties:v4];

  v6 = [v5 objectForKey:v2];
  LODWORD(v4) = [v6 BOOLValue];

  v7 = 0;
  if (v4)
  {
    v8 = [v5 objectForKey:v3];
    if (v8)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:", objc_msgSend(v8, "integerValue")));
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)vui_HLSColorCapability
{
  uint64_t v2 = *MEMORY[0x1E4F313A8];
  uint64_t v3 = *MEMORY[0x1E4F31380];
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313A8], *MEMORY[0x1E4F31380], 0);
  v5 = [a1 valuesForProperties:v4];

  v6 = [v5 objectForKey:v2];
  LODWORD(v4) = [v6 BOOLValue];

  v7 = 0;
  if (v4)
  {
    v8 = [v5 objectForKey:v3];
    if (v8)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:", objc_msgSend(v8, "integerValue")));
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)vui_HLSAudioCapability
{
  uint64_t v2 = *MEMORY[0x1E4F313A8];
  uint64_t v3 = *MEMORY[0x1E4F31378];
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313A8], *MEMORY[0x1E4F31378], 0);
  v5 = [a1 valuesForProperties:v4];

  v6 = [v5 objectForKey:v2];
  LODWORD(v4) = [v6 BOOLValue];

  v7 = 0;
  if (v4)
  {
    v8 = [v5 objectForKey:v3];
    if (v8)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:", objc_msgSend(v8, "integerValue")));
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (uint64_t)vui_coverArtImageIdentifier
{
  return objc_msgSend(a1, "_vui_imageIdentifierWithImageType:", 0);
}

- (uint64_t)vui_previewFrameImageIdentifier
{
  return objc_msgSend(a1, "_vui_imageIdentifierWithImageType:", 1);
}

- (id)vui_showIdentifier
{
  if (([a1 mediaType] & 0x200) != 0)
  {
    uint64_t v2 = +[VUIMPMediaEntityIdentifier showIdentifierWithMediaItem:a1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)vui_seasonIdentifier
{
  if (([a1 mediaType] & 0x200) != 0)
  {
    uint64_t v2 = +[VUIMPSeasonMediaCollectionIdentifier seasonIdentifierWithMediaItem:a1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)vui_studio
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31428]];
  uint64_t v2 = objc_msgSend(v1, "vui_stringForKey:", @"studio");

  return v2;
}

- (VUIMediaItemCredits)vui_credits
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31428]];
  uint64_t v2 = objc_alloc_init(VUIMediaItemCredits);
  uint64_t v3 = objc_msgSend(v1, "vui_arrayForKey:", @"cast");
  v4 = v3;
  if (v3)
  {
    v5 = __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v3, v3);
    [(VUIMediaItemCredits *)v2 setCast:v5];
  }
  v6 = objc_msgSend(v1, "vui_arrayForKey:", @"producers");
  v7 = v6;
  if (v6)
  {
    v8 = __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v6, v6);
    [(VUIMediaItemCredits *)v2 setProducers:v8];
  }
  v9 = objc_msgSend(v1, "vui_arrayForKey:", @"directors");
  v10 = v9;
  if (v9)
  {
    v11 = __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v9, v9);
    [(VUIMediaItemCredits *)v2 setDirectors:v11];
  }
  v12 = objc_msgSend(v1, "vui_arrayForKey:", @"screenwriters");
  v13 = v12;
  if (v12)
  {
    v14 = __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v12, v12);
    [(VUIMediaItemCredits *)v2 setScreenwriters:v14];
  }
  return v2;
}

- (id)vui_contentRating
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F31338]];
  uint64_t v2 = objc_msgSend(v1, "vui_stringForKey:", @"localizedRating");
  uint64_t v3 = objc_msgSend(v1, "vui_stringForKey:", @"localizedReason");
  v4 = objc_msgSend(v1, "vui_stringForKey:", @"ratingLevel");
  v5 = objc_msgSend(v1, "vui_stringForKey:", @"ratingProvider");
  uint64_t v6 = [v4 integerValue];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3C60]) initWithRatingSystemString:v5 ratingLabel:v2 rank:v6 ratingDescription:v3];

  return v7;
}

- (id)vui_isPlayable
{
  v1 = objc_msgSend(a1, "vui_assetType");
  BOOL v2 = [v1 unsignedIntegerValue] != 0;
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:v2];

  return v3;
}

- (id)vui_isLocalCheckingSidebandLibrary:()VideosUI
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313E0], *MEMORY[0x1E4F31410], 0);
  uint64_t v6 = [a1 valuesForProperties:v5];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  char v25 = objc_msgSend((id)objc_opt_class(), "_vui_isLocalWithPropertyValues:", v6);
  int v7 = *((unsigned __int8 *)v23 + 24);
  if (*((unsigned char *)v23 + 24)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 == 0;
  }
  if (!v8)
  {
    v9 = [a1 valueForProperty:*MEMORY[0x1E4F31500]];
    v10 = v9;
    if (v9 && [v9 longLongValue])
    {
      v11 = [v10 stringValue];
      v12 = +[VUIMediaLibraryManager defaultManager];
      v13 = [v12 sidebandMediaLibrary];
      v14 = objc_msgSend(v13, "videoForAdamID:useMainThreadContext:", v11, objc_msgSend(MEMORY[0x1E4F29060], "isMainThread"));

      if (v14)
      {
        if ([MEMORY[0x1E4F29060] isMainThread])
        {
          BOOL v15 = [v14 downloadState] == 2;
          *((unsigned char *)v23 + 24) = v15;
        }
        else
        {
          v16 = [v14 managedObjectContext];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __60__MPMediaItem_VideosUI__vui_isLocalCheckingSidebandLibrary___block_invoke;
          v19[3] = &unk_1E6DF4B00;
          v21 = &v22;
          id v20 = v14;
          [v16 performBlockAndWait:v19];
        }
      }
    }
    int v7 = *((unsigned __int8 *)v23 + 24);
  }
  v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v7 != 0];
  _Block_object_dispose(&v22, 8);

  return v17;
}

- (BOOL)vui_isDownloadedOrDownloadingOrEnqueued
{
  BOOL v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313E0], *MEMORY[0x1E4F31410], 0);
  uint64_t v3 = [a1 valuesForProperties:v2];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  char v23 = objc_msgSend((id)objc_opt_class(), "_vui_isLocalWithPropertyValues:", v3);
  if (*((unsigned char *)v21 + 24)
    || (char v4 = objc_msgSend(a1, "MPSD_isDownloadInProgress"), *((unsigned char *)v21 + 24) = v4, (v4 & 1) != 0))
  {
    BOOL v5 = 1;
  }
  else
  {
    int v7 = [a1 valueForProperty:*MEMORY[0x1E4F31500]];
    BOOL v8 = v7;
    if (v7 && [v7 longLongValue])
    {
      v9 = [v8 stringValue];
      v10 = +[VUIMediaLibraryManager defaultManager];
      v11 = [v10 sidebandMediaLibrary];
      v12 = objc_msgSend(v11, "videoForAdamID:useMainThreadContext:", v9, objc_msgSend(MEMORY[0x1E4F29060], "isMainThread"));

      if (v12)
      {
        if ([MEMORY[0x1E4F29060] isMainThread])
        {
          uint64_t v13 = [v12 downloadState];
          BOOL v15 = v13 == 2 || (v13 & 0xFFFFFFFFFFFFFFFDLL) == 1;
          *((unsigned char *)v21 + 24) = v15;
        }
        else
        {
          v16 = [v12 managedObjectContext];
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __64__MPMediaItem_VideosUI__vui_isDownloadedOrDownloadingOrEnqueued__block_invoke;
          v17[3] = &unk_1E6DF4130;
          id v18 = v12;
          v19 = &v20;
          [v16 performBlockAndWait:v17];
        }
      }
    }
    BOOL v5 = *((unsigned char *)v21 + 24) != 0;
  }
  _Block_object_dispose(&v20, 8);

  return v5;
}

- (id)vui_extrasURL
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F314F0]];
  if (v1)
  {
    BOOL v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (id)vui_playedState
{
  BOOL v2 = [a1 valueForProperty:*MEMORY[0x1E4F31438]];
  uint64_t v3 = [a1 valueForProperty:*MEMORY[0x1E4F313A0]];
  char v4 = [a1 valueForProperty:*MEMORY[0x1E4F31318]];
  BOOL v5 = [a1 valueForProperty:*MEMORY[0x1E4F31440]];
  uint64_t v6 = v5;
  if (v2) {
    BOOL v7 = v3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || v4 == 0 || v5 == 0)
  {
    int64_t v13 = 0;
  }
  else
  {
    [v5 doubleValue];
    double v11 = v10;
    [v4 doubleValue];
    int64_t v13 = +[VUIPlaybackUtilities playedStateForDuration:elapsedTime:hasBeenPlayed:playCount:](VUIPlaybackUtilities, "playedStateForDuration:elapsedTime:hasBeenPlayed:playCount:", [v3 BOOLValue], objc_msgSend(v2, "unsignedIntegerValue"), v11, v12);
  }
  v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:v13];

  return v14;
}

- (id)vui_rentalEndDate
{
  uint64_t v2 = *MEMORY[0x1E4F31488];
  uint64_t v3 = *MEMORY[0x1E4F31468];
  char v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F31488], *MEMORY[0x1E4F31468], 0);
  BOOL v5 = [a1 valuesForProperties:v4];

  uint64_t v6 = [v5 objectForKey:v2];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 == 0.0)
  {
    int64_t v13 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v8];
    double v10 = [v5 objectForKey:v3];
    [v10 doubleValue];
    double v12 = v11;

    int64_t v13 = 0;
    if (v9 && v12 != 0.0) {
      int64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v9 sinceDate:v12];
    }
  }
  return v13;
}

- (id)vui_rentalPlaybackEndDate
{
  uint64_t v2 = *MEMORY[0x1E4F31480];
  uint64_t v3 = *MEMORY[0x1E4F31478];
  char v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F31480], *MEMORY[0x1E4F31478], 0);
  BOOL v5 = [a1 valuesForProperties:v4];

  uint64_t v6 = [v5 objectForKey:v2];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 == 0.0)
  {
    int64_t v13 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v8];
    double v10 = [v5 objectForKey:v3];
    [v10 doubleValue];
    double v12 = v11;

    int64_t v13 = 0;
    if (v9 && v12 != 0.0) {
      int64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v9 sinceDate:v12];
    }
  }
  return v13;
}

- (id)vui_rentalExpirationDate
{
  uint64_t v2 = objc_msgSend(a1, "vui_rentalPlaybackEndDate");
  uint64_t v3 = objc_msgSend(a1, "vui_rentalEndDate");
  char v4 = v3;
  if (v2 && v3)
  {
    id v5 = [v2 earlierDate:v3];
  }
  else if (v2)
  {
    id v5 = v2;
  }
  else if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (uint64_t)vui_assetType
{
  return objc_msgSend(a1, "vui_assetTypeIgnoringLocalAsset:", 0);
}

- (id)vui_assetTypeIgnoringLocalAsset:()VideosUI
{
  uint64_t v5 = *MEMORY[0x1E4F31408];
  uint64_t v6 = *MEMORY[0x1E4F313A8];
  double v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313E0], *MEMORY[0x1E4F31408], *MEMORY[0x1E4F31410], *MEMORY[0x1E4F313A8], *MEMORY[0x1E4F313B8], *MEMORY[0x1E4F31500], 0);
  double v8 = [a1 valuesForProperties:v7];

  uint64_t v9 = 0;
  if ((a3 & 1) == 0)
  {
    double v10 = objc_msgSend(a1, "vui_isLocalCheckingSidebandLibrary:", 1);
    unsigned int v11 = [v10 BOOLValue];

    uint64_t v9 = v11;
  }
  double v12 = [v8 objectForKey:v5];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = +[VUIMediaLibraryApplicationController defaultController];
    v9 |= [v14 assetTypeForRentalMediaItem:a1];
  }
  else if (objc_msgSend((id)objc_opt_class(), "_vui_isNetworkPlayableWithPropertyValues:", v8))
  {
    BOOL v15 = [v8 objectForKey:v6];
    int v16 = [v15 BOOLValue];

    uint64_t v17 = 4;
    if (v16) {
      uint64_t v17 = 6;
    }
    v9 |= v17;
  }
  id v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v9];

  return v18;
}

+ (uint64_t)vui_MPMediaItemVideoQualityFromVUIMediaEntityResolution:()VideosUI
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (uint64_t)vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:()VideosUI
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (uint64_t)vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:()VideosUI
{
  return a3 & 3;
}

+ (uint64_t)vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:()VideosUI
{
  return a3 & 3;
}

+ (uint64_t)vui_MPMediaItemAudioCapabilityFromVUIMediaEntityAudioCapability:()VideosUI
{
  return a3 & 1;
}

+ (uint64_t)vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:()VideosUI
{
  return a3 & 1;
}

+ (id)vui_mediaItemForPersistentIdentifier:()VideosUI
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F31968] predicateWithValue:a3 forProperty:*MEMORY[0x1E4F31430]];
    id v4 = objc_alloc(MEMORY[0x1E4F31970]);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v3, 0);
    uint64_t v6 = (void *)[v4 initWithFilterPredicates:v5];

    [v6 setIgnoreSystemFilterPredicates:1];
    [v6 setEntityLimit:1];
    double v7 = [v6 items];
    double v8 = [v7 firstObject];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

+ (id)vui_mediaItemForStoreIdentifierString:()VideosUI
{
  id v3 = a3;
  if ([v3 length] && (uint64_t v4 = objc_msgSend(v3, "longLongValue")) != 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F31928];
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v4];
    double v7 = objc_msgSend(v5, "vui_mediaItemForStoreIdentifier:", v6);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (id)vui_mediaItemForStoreIdentifier:()VideosUI
{
  if (a3)
  {
    id v3 = [MEMORY[0x1E4F31968] predicateWithValue:a3 forProperty:*MEMORY[0x1E4F31500]];
    id v4 = objc_alloc(MEMORY[0x1E4F31970]);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v3, 0);
    uint64_t v6 = (void *)[v4 initWithFilterPredicates:v5];

    [v6 setIgnoreSystemFilterPredicates:1];
    [v6 setEntityLimit:1];
    double v7 = [v6 items];
    double v8 = [v7 firstObject];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)vui_imageIdentifierWithImageType:()VideosUI
{
  if (a3) {
    objc_msgSend(a1, "vui_previewFrameImageIdentifier");
  }
  else {
  id v3 = objc_msgSend(a1, "vui_coverArtImageIdentifier");
  }
  return v3;
}

- (id)vui_artworkCatalogWithImageType:()VideosUI
{
  if (a3) {
    [a1 screenshotArtworkCatalog];
  }
  else {
  id v3 = [a1 artworkCatalog];
  }
  return v3;
}

- (VUIMPMediaEntityImageLoadParams)vui_imageLoadParamsWithImageType:()VideosUI
{
  if (a3 == 1
    && ([a1 mediaLibrary],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 homeSharingDatabaseID],
        v5,
        v6))
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [[VUIMPMediaEntityImageLoadParams alloc] initWithMediaItem:a1 andImageType:a3];
  }
  return v7;
}

+ (uint64_t)_vui_isLocalWithPropertyValues:()VideosUI
{
  uint64_t v3 = *MEMORY[0x1E4F313E0];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:v3];
  int v6 = [v4 objectForKey:*MEMORY[0x1E4F31410]];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || ![v5 BOOLValue]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [v6 BOOLValue] ^ 1;
  }

  return v8;
}

+ (uint64_t)_vui_isNetworkPlayableWithPropertyValues:()VideosUI
{
  uint64_t v3 = *MEMORY[0x1E4F31408];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:v3];
  int v6 = [v5 BOOLValue];

  BOOL v7 = [v4 objectForKey:*MEMORY[0x1E4F31500]];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 objectForKey:*MEMORY[0x1E4F313B8]];

  LODWORD(v4) = [v9 BOOLValue];
  return v6 | v8 | v4;
}

- (id)_vui_imageIdentifierWithImageType:()VideosUI
{
  if (_vui_imageIdentifierWithImageType__onceToken != -1) {
    dispatch_once(&_vui_imageIdentifierWithImageType__onceToken, &__block_literal_global_52_0);
  }
  uint64_t v5 = [a1 valuesForProperties:_vui_imageIdentifierWithImageType____propertiesToFetch];
  int v6 = [v5 objectForKey:*MEMORY[0x1E4F313F0]];
  char v7 = [v6 BOOLValue];

  uint64_t v8 = objc_msgSend(a1, "vui_artworkCatalogWithImageType:", a3);
  uint64_t v9 = (void *)v8;
  double v10 = 0;
  if ((v7 & 1) == 0 && v8)
  {
    unsigned int v11 = VUIImageTypeString(a3);
    double v12 = [v5 objectForKey:*MEMORY[0x1E4F31430]];
    uint64_t v13 = [v12 unsignedLongLongValue];

    v14 = [v9 visualIdenticalityIdentifier];
    BOOL v15 = [v14 stringRepresentation];
    int v16 = objc_msgSend(v15, "tv_SHA256String");

    uint64_t v17 = objc_msgSend(v16, "tv_filenameSafeString");

    double v10 = [NSString stringWithFormat:@"%llu_%@_%@", v13, v11, v17];
  }
  return v10;
}

@end