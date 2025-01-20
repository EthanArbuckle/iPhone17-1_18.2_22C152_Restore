@interface PHQuestion(PhotosUICore)
+ (id)_px_configurationCache;
+ (id)_px_requestQueue;
+ (uint64_t)_px_fetchRequestIdAndIncrement;
- (BOOL)px_assetCollectionAndAssetFetchResultForAsset:()PhotosUICore assetCollection:assetFetchResult:;
- (PXSurveyQuestionAlbumConfiguration)_px_requestQueue_configurationForAlbum;
- (PXSurveyQuestionAssetGroupConfiguration)_px_requestQueue_configurationForMoment;
- (PXSurveyQuestionCustomizableAssetGroupConfiguration)_px_requestQueue_configurationForExternalAssetRelevance;
- (PXSurveyQuestionMapConfiguration)_px_requestQueue_configurationForAsset;
- (PXSurveyQuestionMemoryConfiguration)_px_requestQueue_configurationForMemory:()PhotosUICore assetCollection:customKeyAssetIdentifier:;
- (PXSurveyQuestionPersonConfiguration)_px_requestQueue_configurationForPerson;
- (PXSurveyQuestionPersonGroupConfiguration)_px_requestQueue_configurationForPersonGroup;
- (PXSurveyQuestionTextConfiguration)_px_requestQueue_configurationForTextWithScalingForLongText:()PhotosUICore;
- (PXSurveyQuestionTextConfiguration)_px_requestQueue_fetchConfiguration;
- (__CFString)_px_localizedQuestionTextForLocationRepresentativeAsset:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromAgeCategory:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromBusinessName:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromHolidayName:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromMemoryMusicEnergySongTitle:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromMemoryMusicQualitySongTitle:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromPersonContactMatchingContactName:()PhotosUICore;
- (__CFString)_px_localizedQuestionTextFromPublicEventName:()PhotosUICore;
- (id)_px_fetchOptions;
- (id)_px_localizedQuestionTextForAlbumClassification;
- (id)_px_localizedQuestionTextForCameraLibrarySwitch;
- (id)_px_localizedQuestionTextForExhaustiveMomentLabelling;
- (id)_px_localizedQuestionTextForExternalAssetRelevance;
- (id)_px_localizedQuestionTextForFeaturedPhoto;
- (id)_px_localizedQuestionTextForFrequentLocation;
- (id)_px_localizedQuestionTextForHighlightTitlingForTitle:()PhotosUICore;
- (id)_px_localizedQuestionTextForMemoryQuality;
- (id)_px_localizedQuestionTextForPetInitial:()PhotosUICore;
- (id)_px_localizedQuestionTextForSharedLibraryAssets;
- (id)_px_localizedQuestionTextForSharedLibraryStart;
- (id)_px_localizedQuestionTextForSocialGroups;
- (id)_px_localizedQuestionTextForStoryPromptSuggestions;
- (id)_px_localizedQuestionTextForSyndicatedAssets;
- (id)_px_localizedQuestionTextForTripKeyAssetWithTripName:()PhotosUICore;
- (id)_px_localizedQuestionTextForTripTitlingForTitle:()PhotosUICore;
- (id)_px_localizedQuestionTextForWallpaper;
- (id)_px_localizedQuestionTextFromMeaningLabel:()PhotosUICore;
- (id)_px_localizedQuestionTextFromPersonActivityMeaningLabel:()PhotosUICore;
- (id)_px_localizedQuestionTextFromRelationshipLabel:()PhotosUICore initial:;
- (id)_px_requestQueue_configurationForDayHighlight;
- (id)_px_requestQueue_configurationForMemory;
- (id)_px_requestQueue_configurationForTrip;
- (id)px_displayTitle;
- (uint64_t)px_requestConfigurationWithResultHandler:()PhotosUICore;
@end

@implementation PHQuestion(PhotosUICore)

- (uint64_t)px_requestConfigurationWithResultHandler:()PhotosUICore
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "_px_fetchRequestIdAndIncrement");
  v6 = objc_msgSend((id)objc_opt_class(), "_px_requestQueue");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PHQuestion_PhotosUICore__px_requestConfigurationWithResultHandler___block_invoke;
  block[3] = &unk_1E5DD34C0;
  block[4] = a1;
  id v10 = v4;
  uint64_t v11 = v5;
  id v7 = v4;
  dispatch_async(v6, block);

  return v5;
}

+ (id)_px_requestQueue
{
  if (_px_requestQueue_onceToken != -1) {
    dispatch_once(&_px_requestQueue_onceToken, &__block_literal_global_42267);
  }
  v0 = (void *)_px_requestQueue_queue;
  return v0;
}

+ (uint64_t)_px_fetchRequestIdAndIncrement
{
  if (_px_fetchRequestIdAndIncrement_onceToken != -1) {
    dispatch_once(&_px_fetchRequestIdAndIncrement_onceToken, &__block_literal_global_195_42263);
  }
  id v2 = a1;
  objc_sync_enter(v2);
  uint64_t v3 = _px_fetchRequestIdAndIncrement__px_requestId++;
  objc_sync_exit(v2);

  return v3;
}

+ (id)_px_configurationCache
{
  if (_px_configurationCache_onceToken != -1) {
    dispatch_once(&_px_configurationCache_onceToken, &__block_literal_global_193_42265);
  }
  v0 = (void *)_px_configurationCache_cache;
  return v0;
}

- (PXSurveyQuestionTextConfiguration)_px_requestQueue_fetchConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 displayType] == 6)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForTextWithScalingForLongText:", objc_msgSend(a1, "type") == 30);
    goto LABEL_22;
  }
  if ([a1 displayType] == 8)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForAlbum");
    goto LABEL_22;
  }
  if (![a1 entityType])
  {
    if ([a1 type] == 29) {
      objc_msgSend(a1, "_px_requestQueue_configurationForExternalAssetRelevance");
    }
    else {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForAsset");
    }
LABEL_22:
    uint64_t v3 = (PXSurveyQuestionTextConfiguration *)v2;
    if (v2) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  if ([a1 entityType] == 1)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForPerson");
    goto LABEL_22;
  }
  if ([a1 entityType] == 5)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForPersonGroup");
    goto LABEL_22;
  }
  if ([a1 entityType] == 2)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForMemory");
    goto LABEL_22;
  }
  if ([a1 entityType] == 3)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForTrip");
    goto LABEL_22;
  }
  if ([a1 entityType] == 7)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForMoment");
    goto LABEL_22;
  }
  if ([a1 entityType] == 8)
  {
    uint64_t v2 = objc_msgSend(a1, "_px_requestQueue_configurationForDayHighlight");
    goto LABEL_22;
  }
LABEL_23:
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [a1 entityIdentifier];
    int v9 = 138412802;
    id v10 = v5;
    __int16 v11 = 1024;
    int v12 = [a1 entityType];
    __int16 v13 = 2112;
    v14 = a1;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Could not find entity (%@) of type %hu backing question (%@)", (uint8_t *)&v9, 0x1Cu);
  }
  v6 = [PXSurveyQuestionTextConfiguration alloc];
  id v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeInvalidQuestionText", @"PhotosUICore");
  uint64_t v3 = [(PXSurveyQuestionTextConfiguration *)v6 initWithTitle:v7 questionText:@"😱" shouldScaleForLongText:0];

LABEL_26:
  return v3;
}

- (PXSurveyQuestionMapConfiguration)_px_requestQueue_configurationForAsset
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"PHFetchResult<PHAsset *> * _Nullable _AssetFetchForQuestion(PHQuestion *__strong)"];
    [v20 handleFailureInFunction:v21, @"PHQuestion+PhotosUICore.m", 114, @"Invalid parameter not satisfying: %@", @"question" file lineNumber description];
  }
  if ([v1 type] != 18)
  {
    int v9 = [v1 type];
    id v3 = [v1 photoLibrary];
    uint64_t v2 = [v1 entityIdentifier];
    if (v9 == 1)
    {
      id v3 = v3;
      if (!v3)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"PHFetchOptions *_LimitedFetchOptionsForPhotoLibraryAssetGroup(PHPhotoLibrary *__strong)"];
        [v22 handleFailureInFunction:v23, @"PHQuestion+PhotosUICore.m", 154, @"Invalid parameter not satisfying: %@", @"photoLibrary" file lineNumber description];
      }
      id v4 = [v3 librarySpecificFetchOptions];
      [v4 setFetchLimit:9];
    }
    else
    {
      id v4 = _LimitedFetchOptionsForPhotoLibrary(v3);
    }
    id v10 = (void *)MEMORY[0x1E4F38EB8];
    *(void *)buf = v2;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    v8 = [v10 fetchAssetsWithLocalIdentifiers:v5 options:v4];
    goto LABEL_12;
  }
  id v24 = 0;
  uint64_t v2 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v24];
  id v3 = v24;
  if (v2)
  {
    id v4 = [v1 entityIdentifier];
    uint64_t v5 = _LimitedFetchOptionsForPhotoLibrary(v2);
    [v5 setIncludeGuestAssets:1];
    v6 = (void *)MEMORY[0x1E4F38EB8];
    *(void *)buf = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    v8 = [v6 fetchAssetsWithSyndicationIdentifiers:v7 options:v5];

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Failed to open the syndication photo library: %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_13:

  __int16 v11 = [v8 firstObject];
  if (!v11)
  {
    __int16 v13 = 0;
    goto LABEL_23;
  }
  if ([v1 displayType] == 7)
  {
    int v12 = PXSurveyQuestionWallpaperConfiguration;
LABEL_21:
    id v18 = [v12 alloc];
    v16 = objc_msgSend(v1, "px_displayTitle");
    __int16 v13 = (PXSurveyQuestionMapConfiguration *)[v18 initWithTitle:v16 asset:v11];
    goto LABEL_22;
  }
  if ([v1 displayType] != 4
    || ([v11 location], v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    int v12 = PXSurveyQuestionAssetConfiguration;
    goto LABEL_21;
  }
  uint64_t v15 = [PXSurveyQuestionMapConfiguration alloc];
  v16 = objc_msgSend(v1, "px_displayTitle");
  v17 = [v11 location];
  __int16 v13 = [(PXSurveyQuestionMapConfiguration *)v15 initWithTitle:v16 location:v17];

LABEL_22:
LABEL_23:

  return v13;
}

- (PXSurveyQuestionTextConfiguration)_px_requestQueue_configurationForTextWithScalingForLongText:()PhotosUICore
{
  uint64_t v5 = [a1 additionalInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8E940]];

  id v7 = [PXSurveyQuestionTextConfiguration alloc];
  v8 = objc_msgSend(a1, "px_displayTitle");
  int v9 = [(PXSurveyQuestionTextConfiguration *)v7 initWithTitle:v8 questionText:v6 shouldScaleForLongText:a3];

  return v9;
}

- (id)px_displayTitle
{
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"QUESTION TEXT PLACEHOLDER FOR TYPE (%d)", objc_msgSend(a1, "type"));
  switch([a1 type])
  {
    case 1u:
      id v3 = [a1 additionalInfo];
      uint64_t v4 = [v3 objectForKeyedSubscript:@"contactName"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromPersonContactMatchingContactName:", v4);
      goto LABEL_28;
    case 3u:
      v6 = [a1 additionalInfo];
      uint64_t v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8E9B0]];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromMeaningLabel:", v4);
      goto LABEL_28;
    case 4u:
      id v7 = [a1 additionalInfo];
      uint64_t v4 = [v7 objectForKeyedSubscript:@"businessName"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromBusinessName:", v4);
      goto LABEL_28;
    case 5u:
      v8 = [a1 additionalInfo];
      uint64_t v4 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8EA28]];

      int v9 = [a1 additionalInfo];
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8E940]];
      BOOL v11 = v10 != 0;

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromRelationshipLabel:initial:", v4, v11);
      goto LABEL_28;
    case 6u:
      int v12 = [a1 additionalInfo];
      uint64_t v4 = [v12 objectForKeyedSubscript:@"publicEventName"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromPublicEventName:", v4);
      goto LABEL_28;
    case 7u:
      __int16 v13 = [a1 additionalInfo];
      uint64_t v4 = [v13 objectForKeyedSubscript:@"localizedHolidayName"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromHolidayName:", v4);
      goto LABEL_28;
    case 8u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForFrequentLocation");
      goto LABEL_31;
    case 0xAu:
      uint64_t v15 = [a1 additionalInfo];
      uint64_t v4 = [v15 objectForKeyedSubscript:@"ageCategory"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromAgeCategory:", v4);
      goto LABEL_28;
    case 0xBu:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForMemoryQuality");
      goto LABEL_31;
    case 0xCu:
      v16 = [a1 additionalInfo];
      uint64_t v4 = [v16 objectForKeyedSubscript:@"tripName"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextForTripKeyAssetWithTripName:", v4);
      goto LABEL_28;
    case 0xDu:
      v17 = [a1 additionalInfo];
      id v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F8E940]];
      BOOL v19 = v18 != 0;

      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForPetInitial:", v19);
      goto LABEL_31;
    case 0xEu:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForFeaturedPhoto");
      goto LABEL_31;
    case 0xFu:
      v20 = [a1 additionalInfo];
      uint64_t v4 = [v20 objectForKeyedSubscript:@"songTitle"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromMemoryMusicQualitySongTitle:", v4);
      goto LABEL_28;
    case 0x10u:
      v21 = [a1 additionalInfo];
      uint64_t v4 = [v21 objectForKeyedSubscript:@"songTitle"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromMemoryMusicEnergySongTitle:", v4);
      goto LABEL_28;
    case 0x11u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForSocialGroups");
      goto LABEL_31;
    case 0x12u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForSyndicatedAssets");
      goto LABEL_31;
    case 0x13u:
      v22 = [a1 additionalInfo];
      uint64_t v4 = [v22 objectForKeyedSubscript:@"personActivityMeaningLabel"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextFromPersonActivityMeaningLabel:", v4);
      goto LABEL_28;
    case 0x14u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForSharedLibraryAssets");
      goto LABEL_31;
    case 0x15u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForSharedLibraryStart");
      goto LABEL_31;
    case 0x16u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForWallpaper");
      goto LABEL_31;
    case 0x17u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForCameraLibrarySwitch");
      goto LABEL_31;
    case 0x18u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForAlbumClassification");
      goto LABEL_31;
    case 0x19u:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForExhaustiveMomentLabelling");
      goto LABEL_31;
    case 0x1Au:
      v23 = [a1 additionalInfo];
      uint64_t v4 = [v23 objectForKeyedSubscript:@"tripTitle"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextForTripTitlingForTitle:", v4);
      goto LABEL_28;
    case 0x1Bu:
      id v24 = [a1 additionalInfo];
      uint64_t v4 = [v24 objectForKeyedSubscript:@"localizedLocationName"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextForLocationRepresentativeAsset:", v4);
      goto LABEL_28;
    case 0x1Cu:
      v25 = [a1 additionalInfo];
      uint64_t v4 = [v25 objectForKeyedSubscript:@"highlightTitle"];

      uint64_t v5 = objc_msgSend(a1, "_px_localizedQuestionTextForHighlightTitlingForTitle:", v4);
LABEL_28:
      uint64_t v26 = (void *)v5;

      uint64_t v2 = (void *)v4;
      goto LABEL_32;
    case 0x1Du:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForExternalAssetRelevance");
      goto LABEL_31;
    case 0x1Eu:
      uint64_t v14 = objc_msgSend(a1, "_px_localizedQuestionTextForStoryPromptSuggestions");
LABEL_31:
      uint64_t v26 = (void *)v14;
LABEL_32:

      uint64_t v2 = v26;
      break;
    default:
      break;
  }
  return v2;
}

- (id)_px_localizedQuestionTextFromRelationshipLabel:()PhotosUICore initial:
{
  id v5 = a3;
  if ([v5 isEqualToString:@"FAMILY"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipFamilyQuestionText";
LABEL_35:
    uint64_t v7 = PXLocalizedStringFromTable(v6, @"PhotosUICore");
    goto LABEL_36;
  }
  if ([v5 isEqualToString:@"FRIEND"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipFriendQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"COWORKER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipCoworkerQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"PARTNER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipPartnerQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"PARENT"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipParentQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"SIBLING"])
  {
    if (a4) {
      v6 = @"PXInternalPhotosChallengeRelationshipSiblingInitialQuestionText";
    }
    else {
      v6 = @"PXInternalPhotosChallengeRelationshipSiblingQuestionText";
    }
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"SISTER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipSisterQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"BROTHER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipBrotherQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"FATHER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipFatherQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"MOTHER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipMotherQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"ALUMNI"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipAlumniQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"CHILD"])
  {
    if (a4) {
      v6 = @"PXInternalPhotosChallengeRelationshipChildInitialQuestionText";
    }
    else {
      v6 = @"PXInternalPhotosChallengeRelationshipChildQuestionText";
    }
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"SON"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipSonQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"DAUGHTER"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipDaughterQuestionText";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"ME"])
  {
    v6 = @"PXInternalPhotosChallengeRelationshipMeQuestionText";
    goto LABEL_35;
  }
  uint64_t v7 = [NSString stringWithFormat:@"RELATIONSHIP QUESTION TEXT PLACEHOLDER (%@)", v5];
LABEL_36:
  v8 = (void *)v7;

  return v8;
}

- (__CFString)_px_localizedQuestionTextForLocationRepresentativeAsset:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeLocationRepresentativeAssetQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"LOCATION REPRESENTATIVE ASSET TEXT PLACEHOLDER";
  }
  return v5;
}

- (BOOL)px_assetCollectionAndAssetFetchResultForAsset:()PhotosUICore assetCollection:assetFetchResult:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PHQuestion+PhotosUICore.m", 757, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"PHQuestion+PhotosUICore.m", 756, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_15:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"PHQuestion+PhotosUICore.m", 758, @"Invalid parameter not satisfying: %@", @"assetFetchResult" object file lineNumber description];

LABEL_4:
  if ([a1 type] == 18)
  {
    PXContentSyndicationCollectionAndFetchResultForAsset(v9, a4, a5);
    BOOL v10 = 1;
  }
  else
  {
    BOOL v11 = [v9 photoLibrary];
    int v12 = [v11 librarySpecificFetchOptions];
    [v12 setFetchLimit:1];
    __int16 v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v9 withType:3 options:v12];
    uint64_t v14 = [v13 firstObject];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F390A0] fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v11];
      v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v24[0] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [v15 setSortDescriptors:v17];

      id v18 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v14 options:v15];
      uint64_t v19 = [v18 count];
      BOOL v10 = v19 != 0;
      if (v19)
      {
        *a4 = v14;
        *a5 = v18;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (id)_px_localizedQuestionTextForStoryPromptSuggestions
{
  return PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsQuestionText");
}

- (id)_px_localizedQuestionTextForHighlightTitlingForTitle:()PhotosUICore
{
  id v3 = a3;
  uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeDayHighlightTitlingQuestionText", @"PhotosUICore");
  id v5 = PXStringWithValidatedFormat();

  return v5;
}

- (id)_px_localizedQuestionTextForExternalAssetRelevance
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeExternalAssetRelevanceText", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForTripTitlingForTitle:()PhotosUICore
{
  id v3 = a3;
  uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeTripTitlingQuestionText", @"PhotosUICore");
  id v5 = PXStringWithValidatedFormat();

  return v5;
}

- (id)_px_localizedQuestionTextForExhaustiveMomentLabelling
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeExhaustiveMomentLabelling", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForAlbumClassification
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationQuestionText", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForCameraLibrarySwitch
{
  return PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeCameraLibrarySwitchQuestionText");
}

- (id)_px_localizedQuestionTextForSharedLibraryStart
{
  return PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryStartQuestionText");
}

- (id)_px_localizedQuestionTextForSharedLibraryAssets
{
  return PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAssetsQuestionText");
}

- (id)_px_localizedQuestionTextForSyndicatedAssets
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSyndicatedAssetsQuestionText", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForSocialGroups
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeSocialGroupsQuestionText", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForFeaturedPhoto
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeFeaturedPhotoQuestionText", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForPetInitial:()PhotosUICore
{
  if (a3) {
    id v3 = @"PXInternalPhotosChallengePetInitialQuestionText";
  }
  else {
    id v3 = @"PXInternalPhotosChallengePetQuestionText";
  }
  uint64_t v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");
  id v5 = [NSString stringWithFormat:@"%@", v4];

  return v5;
}

- (__CFString)_px_localizedQuestionTextFromAgeCategory:()PhotosUICore
{
  id v3 = @"PERSON AGE CATEGORY MATCHING QUESTION TEXT PLACEHOLDER";
  switch([a3 unsignedIntegerValue])
  {
    case 0:
      break;
    default:
      uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengePersonAgeCategoryQuestionText", @"PhotosUICore");
      PXStringWithValidatedFormat();
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v3;
}

- (__CFString)_px_localizedQuestionTextFromPersonContactMatchingContactName:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengePersonContactMatchingQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"PERSON CONTACT MATCHING QUESTION TEXT PLACEHOLDER";
  }
  return v5;
}

- (id)_px_localizedQuestionTextForFrequentLocation
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonFrequentLocationMessage", @"PhotosUICore");
}

- (__CFString)_px_localizedQuestionTextFromHolidayName:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHolidayQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"HOLIDAY QUESTION TEXT PLACEHOLDER";
  }
  return v5;
}

- (id)_px_localizedQuestionTextForTripKeyAssetWithTripName:()PhotosUICore
{
  id v3 = a3;
  uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeTripKeyAssetQuestionText", @"PhotosUICore");
  id v5 = PXStringWithValidatedFormat();

  return v5;
}

- (__CFString)_px_localizedQuestionTextFromMemoryMusicEnergySongTitle:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicEnergyQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"MEMORY MUSIC ENERGY QUESTION TEXT PLACEHOLDER";
  }
  return v5;
}

- (__CFString)_px_localizedQuestionTextFromMemoryMusicQualitySongTitle:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"MEMORY MUSIC QUALITY QUESTION TEXT PLACEHOLDER";
  }
  return v5;
}

- (id)_px_localizedQuestionTextForMemoryQuality
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryQualityQuestionText", @"PhotosUICore");
}

- (id)_px_localizedQuestionTextForWallpaper
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeWallpaperQuestionText", @"PhotosUICore");
}

- (__CFString)_px_localizedQuestionTextFromPublicEventName:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengePublicEventQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"PUBLIC EVENT QUESTION TEXT PLACEHOLDER";
  }
  return v5;
}

- (__CFString)_px_localizedQuestionTextFromBusinessName:()PhotosUICore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeBusinessItemQuestionText", @"PhotosUICore");
    PXStringWithValidatedFormat();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"BUSINESS ITEM QUESTION TEXT PLACEHOLDER";
  }
  return v5;
}

- (id)_px_localizedQuestionTextFromPersonActivityMeaningLabel:()PhotosUICore
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PersonBeachWater"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengePersonActivityMeaningPersonBeachWaterQuestionText";
LABEL_13:
    uint64_t v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"PersonToys"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengePersonActivityMeaningPersonToysQuestionText";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"PersonPlayground"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengePersonActivityMeaningPersonPlaygroundQuestionText";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"PersonActionSwimming"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengePersonActivityMeaningPersonActionSwimmingQuestionText";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"PersonActionPlayingOnASwing"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengePersonActivityMeaningPersonActionPlayingOnASwingQuestionText";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"PersonActionPlayingOnASlide"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengePersonActivityMeaningPersonActionPlayingOnASlideQuestionText";
    goto LABEL_13;
  }
  uint64_t v5 = [NSString stringWithFormat:@"PERSON ACTIVITY MEANING QUESTION TEXT PLACEHOLDER (%@)", v3];
LABEL_14:
  v6 = (void *)v5;

  return v6;
}

- (id)_px_localizedQuestionTextFromMeaningLabel:()PhotosUICore
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Hiking"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningHikingQuestionText";
LABEL_51:
    uint64_t v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
    goto LABEL_52;
  }
  if ([v3 isEqualToString:@"Climbing"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningClimbingQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Beaching"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningBeachingQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Diving"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningDivingQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"WinterSport"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningWinterSportQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Entertainment"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningEntertainmentQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"AmusementPark"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningAmusementParkQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Performance"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningPerformanceQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Concert"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningConcertQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Festival"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningFestivalQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Theater"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningTheaterQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Dance"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningDanceQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"SportEvent"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningSportEventQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"NightOut"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningNightOutQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Museum"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningMuseumQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Celebration"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningCelebrationQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Birthday"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningBirthdayQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Anniversary"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningAnniversaryQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Wedding"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningWeddingQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"HolidayEvent"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningHolidayEventQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Gathering"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningGatheringQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Restaurant"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningRestaurantQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Breakfast"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningBreakfastQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Lunch"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningLunchQuestionText";
    goto LABEL_51;
  }
  if ([v3 isEqualToString:@"Dinner"])
  {
    uint64_t v4 = @"PXInternalPhotosChallengeMeaningDinnerQuestionText";
    goto LABEL_51;
  }
  uint64_t v5 = [NSString stringWithFormat:@"MEANING QUESTION TEXT PLACEHOLDER (%@)", v3];
LABEL_52:
  v6 = (void *)v5;

  return v6;
}

- (PXSurveyQuestionAlbumConfiguration)_px_requestQueue_configurationForAlbum
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 entityIdentifier];
  id v3 = (void *)MEMORY[0x1E4F38EE8];
  v12[0] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v5 = objc_msgSend(a1, "_px_fetchOptions");
  v6 = [v3 fetchAssetCollectionsWithLocalIdentifiers:v4 options:v5];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [PXSurveyQuestionAlbumConfiguration alloc];
    id v9 = objc_msgSend(a1, "px_displayTitle");
    BOOL v10 = [(PXSurveyQuestionAlbumConfiguration *)v8 initWithTitle:v9 album:v7];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (PXSurveyQuestionMemoryConfiguration)_px_requestQueue_configurationForMemory:()PhotosUICore assetCollection:customKeyAssetIdentifier:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = objc_msgSend(a1, "px_displayTitle");
  if (v8) {
    int v12 = v8;
  }
  else {
    int v12 = v9;
  }
  id v13 = v12;
  if ([a1 type] == 15 || objc_msgSend(a1, "type") == 16)
  {
    uint64_t v14 = [a1 additionalInfo];
    uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F8EA08]];

    if (v15) {
      v16 = [[PXSurveyQuestionMemoryConfiguration alloc] initWithTitle:v11 memory:v13 songAdamId:v15 customKeyAssetIdentifier:v10];
    }
    else {
      v16 = [[PXSurveyQuestionTextConfiguration alloc] initWithTitle:@"This Photos Challenge Special Edition question is no longer valid. Please select Skip." questionText:@"⚠️" shouldScaleForLongText:0];
    }
    v17 = v16;
  }
  else
  {
    v17 = [[PXSurveyQuestionMemoryConfiguration alloc] initWithTitle:v11 memory:v13 songAdamId:0 customKeyAssetIdentifier:v10];
  }

  return v17;
}

- (id)_px_requestQueue_configurationForTrip
{
  uint64_t v2 = [a1 entityIdentifier];
  id v3 = objc_msgSend(a1, "_px_fetchOptions");
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dayGroupAssets.uuid CONTAINS %@", v2];
  [v3 setInternalPredicate:v4];

  uint64_t v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v3];
  v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(a1, "_px_requestQueue_configurationForMemory:assetCollection:customKeyAssetIdentifier:", 0, v6, v2);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_px_requestQueue_configurationForDayHighlight
{
  uint64_t v2 = [a1 entityIdentifier];
  id v3 = objc_msgSend(a1, "_px_fetchOptions");
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assets.uuid CONTAINS %@", v2];
  [v3 setInternalPredicate:v4];

  uint64_t v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];
  v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(a1, "_px_requestQueue_configurationForMemory:assetCollection:customKeyAssetIdentifier:", 0, v6, v2);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (PXSurveyQuestionAssetGroupConfiguration)_px_requestQueue_configurationForMoment
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 entityIdentifier];
  id v3 = (void *)MEMORY[0x1E4F38EE8];
  v12[0] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v5 = objc_msgSend(a1, "_px_fetchOptions");
  v6 = [v3 fetchAssetCollectionsWithType:3 localIdentifiers:v4 options:v5];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [PXSurveyQuestionAssetGroupConfiguration alloc];
    id v9 = objc_msgSend(a1, "px_displayTitle");
    id v10 = [(PXSurveyQuestionAssetGroupConfiguration *)v8 initWithTitle:v9 assetCollection:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (PXSurveyQuestionCustomizableAssetGroupConfiguration)_px_requestQueue_configurationForExternalAssetRelevance
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];

  uint64_t v4 = [a1 additionalInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F397F0]];

  v6 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v7 = [v5 allObjects];
  id v8 = [v6 fetchAssetCollectionsWithType:3 localIdentifiers:v7 options:v3];

  if (![v8 count])
  {
    uint64_t v26 = 0;
    goto LABEL_13;
  }
  id v9 = [a1 photoLibrary];
  id v10 = [v9 librarySpecificFetchOptions];

  BOOL v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v8 options:v10];
  int v12 = [v11 fetchedObjects];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v12];
  if ([v13 count])
  {
    v28 = v10;
    uint64_t v14 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v15 = [a1 entityIdentifier];
    uint64_t v29 = [v14 localIdentifierWithUUID:v15];

    v16 = [a1 additionalInfo];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F8E958]];
    LODWORD(v14) = [v17 isEqual:MEMORY[0x1E4F1CC28]];

    if (v14)
    {
      id v18 = [a1 photoLibrary];
      uint64_t v19 = [v18 librarySpecificFetchOptions];

      v20 = (void *)MEMORY[0x1E4F38EB8];
      v30[0] = v29;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      v22 = [v20 fetchAssetsWithLocalIdentifiers:v21 options:v19];
      v23 = [v22 firstObject];

      if (!v23) {
        goto LABEL_10;
      }
      [v13 addObject:v23];
    }
    uint64_t v19 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v13 title:0];
    if (v19)
    {
      id v24 = objc_msgSend(a1, "_px_localizedQuestionTextForExternalAssetRelevance");
      v25 = (void *)v29;
      uint64_t v26 = [[PXSurveyQuestionCustomizableAssetGroupConfiguration alloc] initWithTitle:v24 assetCollection:v19 customMaximumPreviewAssetCount:&unk_1F02D6430 keyAssetLocalIdentifier:v29];

      id v10 = v28;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v26 = 0;
    id v10 = v28;
    v25 = (void *)v29;
    goto LABEL_11;
  }
  uint64_t v26 = 0;
LABEL_12:

LABEL_13:
  return v26;
}

- (id)_px_requestQueue_configurationForMemory
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 entityIdentifier];
  id v3 = (void *)MEMORY[0x1E4F38EE8];
  v10[0] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v5 = objc_msgSend(a1, "_px_fetchOptions");
  v6 = [v3 fetchAssetCollectionsWithType:4 localIdentifiers:v4 options:v5];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = objc_msgSend(a1, "_px_requestQueue_configurationForMemory:assetCollection:customKeyAssetIdentifier:", v7, 0, 0);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (PXSurveyQuestionPersonGroupConfiguration)_px_requestQueue_configurationForPersonGroup
{
  uint64_t v2 = [a1 additionalInfo];
  id v3 = [v2 objectForKeyedSubscript:@"personUUIDs"];

  uint64_t v4 = [a1 photoLibrary];
  uint64_t v5 = [v4 librarySpecificFetchOptions];

  [v5 setPersonContext:1];
  v6 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v3 options:v5];
  uint64_t v7 = [v6 fetchedObjects];
  uint64_t v8 = [v3 count];
  if (v8 == [v6 count])
  {
    id v9 = [PXSurveyQuestionPersonGroupConfiguration alloc];
    id v10 = objc_msgSend(a1, "px_displayTitle");
    BOOL v11 = [(PXSurveyQuestionPersonGroupConfiguration *)v9 initWithTitle:v10 personGroup:v7];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (PXSurveyQuestionPersonConfiguration)_px_requestQueue_configurationForPerson
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 entityIdentifier];
  id v3 = (void *)MEMORY[0x1E4F391F0];
  v12[0] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v5 = objc_msgSend(a1, "_px_fetchOptions");
  v6 = [v3 fetchPersonsWithLocalIdentifiers:v4 options:v5];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    uint64_t v8 = [PXSurveyQuestionPersonConfiguration alloc];
    id v9 = objc_msgSend(a1, "px_displayTitle");
    id v10 = [(PXSurveyQuestionPersonConfiguration *)v8 initWithTitle:v9 person:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_px_fetchOptions
{
  id v1 = [a1 photoLibrary];
  uint64_t v2 = _LimitedFetchOptionsForPhotoLibrary(v1);

  return v2;
}

@end