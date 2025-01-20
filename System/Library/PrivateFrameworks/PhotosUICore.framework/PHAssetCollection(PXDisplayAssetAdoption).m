@interface PHAssetCollection(PXDisplayAssetAdoption)
- (BOOL)isAggregation;
- (BOOL)isEnriched;
- (BOOL)isEnrichmentComplete;
- (BOOL)px_isAllLibraryDuplicatesSmartAlbum;
- (BOOL)px_isAllPhotosSmartAlbum;
- (BOOL)px_isAnimatedSmartAlbum;
- (BOOL)px_isBurstsSmartAlbum;
- (BOOL)px_isCinematicSmartAlbum;
- (BOOL)px_isContentSyndicationAlbum;
- (BOOL)px_isDepthEffectSmartAlbum;
- (BOOL)px_isDuplicatesAlbum;
- (BOOL)px_isFavoritesSmartAlbum;
- (BOOL)px_isHiddenSmartAlbum;
- (BOOL)px_isHighlight;
- (BOOL)px_isImportSessionCollection;
- (BOOL)px_isImportedAlbum;
- (BOOL)px_isLivePhotosSmartAlbum;
- (BOOL)px_isLongExposuresSmartAlbum;
- (BOOL)px_isMacSyncedAlbum;
- (BOOL)px_isMacSyncedFacesAlbum;
- (BOOL)px_isMacSyncedRegularAlbum;
- (BOOL)px_isMemory;
- (BOOL)px_isMoment;
- (BOOL)px_isMomentShare;
- (BOOL)px_isMyPhotoStreamAlbum;
- (BOOL)px_isPanoramasSmartAlbum;
- (BOOL)px_isPlacesSmartAlbum;
- (BOOL)px_isProResSmartAlbum;
- (BOOL)px_isRAWSmartAlbum;
- (BOOL)px_isRecentlyAddedSmartAlbum;
- (BOOL)px_isRecentlyDeletedSmartAlbum;
- (BOOL)px_isRecentlyEditedSmartAlbum;
- (BOOL)px_isRecentsSmartAlbum;
- (BOOL)px_isRecoveredSmartAlbum;
- (BOOL)px_isRegularAlbum;
- (BOOL)px_isScreenRecordingsSmartAlbum;
- (BOOL)px_isScreenshotsSmartAlbum;
- (BOOL)px_isSelfPortraitsSmartAlbum;
- (BOOL)px_isSharedAlbum;
- (BOOL)px_isSharedLibrarySharingSuggestionsSmartAlbum;
- (BOOL)px_isSlomoVideosSmartAlbum;
- (BOOL)px_isSpatialSmartAlbum;
- (BOOL)px_isSuggestion;
- (BOOL)px_isTimelapsesSmartAlbum;
- (BOOL)px_isUnableToUploadSmartAlbum;
- (BOOL)px_isUserSmartAlbum;
- (BOOL)px_isVideosSmartAlbum;
- (BOOL)px_supportsFastCuration;
- (__CFString)px_symbolImageName;
- (double)promotionScore;
- (id)localizedDateDescription;
- (id)localizedDateDescriptionWithOptions:()PXDisplayAssetAdoption;
- (id)localizedDebugDescription;
- (id)localizedShortDateDescription;
- (id)localizedSmartDescription;
- (uint64_t)isRecent;
- (uint64_t)px_allowsImplicitSelectionForProjectOrSharingAction;
- (uint64_t)px_containsPrivateContent;
- (uint64_t)px_highlightEnrichmentState;
- (uint64_t)px_highlightKind;
- (uint64_t)px_isAllAlbumsVirtualCollection;
- (uint64_t)px_isBookmarksVirtualCollection;
- (uint64_t)px_isContentSyndicationAllPhotosAlbum;
- (uint64_t)px_isContentSyndicationVirtualCollection;
- (uint64_t)px_isEventsVirtualCollection;
- (uint64_t)px_isFeaturedPhotosCollection;
- (uint64_t)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed;
- (uint64_t)px_isImportAssetCollection;
- (uint64_t)px_isImportHistoryCollection;
- (uint64_t)px_isLemonadeUtilitiesAlbum;
- (uint64_t)px_isMapVirtualCollection;
- (uint64_t)px_isMediaTypeSmartAlbum;
- (uint64_t)px_isMemoriesVirtualCollection;
- (uint64_t)px_isMomentShareVirtualCollection;
- (uint64_t)px_isMomentsVirtualCollection;
- (uint64_t)px_isMyAlbumsVirtualCollection;
- (uint64_t)px_isPeopleVirtualCollection;
- (uint64_t)px_isPhotosVirtualCollection;
- (uint64_t)px_isRecentlyEditedCollection;
- (uint64_t)px_isRecentlySavedCollection;
- (uint64_t)px_isRecentlySharedCollection;
- (uint64_t)px_isRecentlyViewedCollection;
- (uint64_t)px_isRootSmartAlbum;
- (uint64_t)px_isSavedTodayCollection;
- (uint64_t)px_isSearchResultsVirtualCollection;
- (uint64_t)px_isSharedActivityVirtualCollection;
- (uint64_t)px_isSharedAlbumsVirtualCollection;
- (uint64_t)px_isSharedLibrarySharingSuggestion;
- (uint64_t)px_isSmartAlbum;
- (uint64_t)px_isTripsVirtualCollection;
- (uint64_t)px_isWallpaperSuggestionsVirtualCollection;
- (uint64_t)px_wantsShareAllAction;
@end

@implementation PHAssetCollection(PXDisplayAssetAdoption)

- (BOOL)px_supportsFastCuration
{
  return [a1 assetCollectionType] == 4 || objc_msgSend(a1, "assetCollectionType") == 6;
}

- (uint64_t)px_highlightEnrichmentState
{
  if ([a1 assetCollectionType] != 6) {
    return 0;
  }
  return [a1 enrichmentState];
}

- (uint64_t)isRecent
{
  return 0;
}

- (BOOL)px_isRecentlyDeletedSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000201;
}

- (uint64_t)px_isSavedTodayCollection
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 hasPrefix:@"PXTransientCollectionIdentifierSavedToday"];

  return v2;
}

- (BOOL)px_isUserSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000204;
}

- (BOOL)px_isFavoritesSmartAlbum
{
  return [a1 assetCollectionSubtype] == 203;
}

- (uint64_t)px_containsPrivateContent
{
  uint64_t v2 = +[PXContentPrivacySettings sharedInstance];
  uint64_t v3 = [v2 simulationMode];
  if (v3 == 1)
  {
    uint64_t v5 = objc_msgSend(a1, "px_isPrivacySensitiveAlbum");
  }
  else if (v3 || ![a1 containsPrivateContent])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v4 = +[PXContentPrivacyController privacyControllerForCollection:a1];
    uint64_t v5 = [v4 isContentPrivacyEnabled];
  }
  return v5;
}

- (__CFString)px_symbolImageName
{
  if ([a1 isTransient])
  {
    uint64_t v2 = [a1 transientIdentifier];
    if (PXSymbolNameForTransientCollectionIdentifier_onceToken != -1) {
      dispatch_once(&PXSymbolNameForTransientCollectionIdentifier_onceToken, &__block_literal_global_165515);
    }
    uint64_t v3 = [(id)PXSymbolNameForTransientCollectionIdentifier_symbolNames objectForKeyedSubscript:v2];
    v4 = (void *)v3;
    uint64_t v5 = @"rectangle.stack";
    if (v3) {
      uint64_t v5 = (__CFString *)v3;
    }
    v6 = v5;
  }
  else
  {
    uint64_t v7 = [a1 assetCollectionSubtype];
    if (PXSymbolNameForAssetCollectionSubtype_onceToken != -1) {
      dispatch_once(&PXSymbolNameForAssetCollectionSubtype_onceToken, &__block_literal_global_870);
    }
    v8 = (void *)PXSymbolNameForAssetCollectionSubtype_symbolNames;
    uint64_t v2 = [NSNumber numberWithInteger:v7];
    v6 = [v8 objectForKeyedSubscript:v2];
  }

  return v6;
}

- (uint64_t)px_isMapVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    uint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXTransientCollectionIdentifierMap"];

    return v4;
  }
  return result;
}

- (BOOL)px_isRecoveredSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000219;
}

- (BOOL)px_isAllLibraryDuplicatesSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000212;
}

- (BOOL)px_isSharedLibrarySharingSuggestionsSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000214;
}

- (uint64_t)px_isSharedLibrarySharingSuggestion
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([a1 isSharingSuggestion]) {
    return 1;
  }
  uint64_t v3 = [a1 transientIdentifier];
  uint64_t v4 = [v3 isEqualToString:@"PXSharedLibrarySharingSuggestionTransientIdentifier"];

  return v4;
}

- (BOOL)px_isSharedAlbum
{
  return [a1 assetCollectionSubtype] == 101;
}

- (BOOL)px_isAllPhotosSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000205;
}

- (BOOL)px_isMacSyncedFacesAlbum
{
  return [a1 assetCollectionSubtype] == 4;
}

- (BOOL)px_isMacSyncedRegularAlbum
{
  return [a1 assetCollectionSubtype] == 5;
}

- (BOOL)px_isMacSyncedAlbum
{
  uint64_t v1 = [a1 assetCollectionSubtype];
  return v1 == 3 || (v1 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)px_isContentSyndicationAlbum
{
  uint64_t v2 = +[PXContentSyndicationSettings sharedInstance];
  unint64_t v3 = [v2 dataSourceType];
  if (v3 <= 5)
  {
    uint64_t v4 = [a1 photoLibrary];
    uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

    if (v5 != 3)
    {
      BOOL v6 = [a1 assetCollectionSubtype] == 1000000501;
      goto LABEL_8;
    }
    goto LABEL_3;
  }
  if (v3 == 6)
  {
    if ((objc_msgSend(a1, "px_isMomentShare") & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_8;
    }
  }
  else if (v3 != 7 || (objc_msgSend(a1, "px_isSharedAlbum") & 1) == 0)
  {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (BOOL)px_isMomentShare
{
  return [a1 assetCollectionType] == 7;
}

- (BOOL)px_isSuggestion
{
  return [a1 assetCollectionType] == 8;
}

- (uint64_t)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed
{
  uint64_t result = objc_msgSend(a1, "px_isHighlight");
  if (result) {
    return objc_msgSend(a1, "px_highlightEnrichmentState") > 2;
  }
  return result;
}

- (BOOL)px_isHighlight
{
  return [a1 assetCollectionType] == 6;
}

- (BOOL)px_isMoment
{
  return [a1 assetCollectionType] == 3;
}

- (BOOL)px_isUnableToUploadSmartAlbum
{
  return [a1 assetCollectionSubtype] == 216;
}

- (BOOL)px_isDuplicatesAlbum
{
  return [a1 assetCollectionSubtype] == 1000000601;
}

- (BOOL)px_isSpatialSmartAlbum
{
  return [a1 assetCollectionSubtype] == 219;
}

- (BOOL)px_isPanoramasSmartAlbum
{
  return [a1 assetCollectionSubtype] == 201;
}

- (BOOL)px_isProResSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000211;
}

- (BOOL)px_isCinematicSmartAlbum
{
  return [a1 assetCollectionSubtype] == 218;
}

- (BOOL)px_isRAWSmartAlbum
{
  return [a1 assetCollectionSubtype] == 217;
}

- (BOOL)px_isLongExposuresSmartAlbum
{
  return [a1 assetCollectionSubtype] == 215;
}

- (BOOL)px_isAnimatedSmartAlbum
{
  return [a1 assetCollectionSubtype] == 214;
}

- (BOOL)px_isLivePhotosSmartAlbum
{
  return [a1 assetCollectionSubtype] == 213;
}

- (BOOL)px_isDepthEffectSmartAlbum
{
  return [a1 assetCollectionSubtype] == 212;
}

- (BOOL)px_isScreenshotsSmartAlbum
{
  return [a1 assetCollectionSubtype] == 211;
}

- (BOOL)px_isSelfPortraitsSmartAlbum
{
  return [a1 assetCollectionSubtype] == 210;
}

- (BOOL)px_isSlomoVideosSmartAlbum
{
  return [a1 assetCollectionSubtype] == 208;
}

- (BOOL)px_isBurstsSmartAlbum
{
  return [a1 assetCollectionSubtype] == 207;
}

- (BOOL)px_isTimelapsesSmartAlbum
{
  return [a1 assetCollectionSubtype] == 204;
}

- (BOOL)px_isVideosSmartAlbum
{
  return [a1 assetCollectionSubtype] == 202;
}

- (BOOL)px_isScreenRecordingsSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000207;
}

- (BOOL)px_isRecentlyEditedSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000206;
}

- (BOOL)px_isRecentsSmartAlbum
{
  return [a1 assetCollectionSubtype] == 209;
}

- (uint64_t)px_isRecentlySharedCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXRecentlySharedVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isRecentlyEditedCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXRecentlyEditedVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isRecentlyViewedCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXRecentlyViewedVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isImportAssetCollection
{
  return 0;
}

- (BOOL)px_isImportSessionCollection
{
  return [a1 assetCollectionType] == 9;
}

- (uint64_t)px_isMomentShareVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXCompleteMyMomentVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isContentSyndicationAllPhotosAlbum
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXContentSyndicationAllPhotosAssetCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isContentSyndicationVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXContentSyndicationVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isSharedAlbumsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXSharedAlbumsVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isMyAlbumsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXMyAlbumsVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isAllAlbumsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXAllAlbumsVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isImportHistoryCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXImportHistoryVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isSharedActivityVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXSharedActivityVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isPeopleVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXPeopleVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isMemoriesVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXMemoriesVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isSearchResultsVirtualCollection
{
  uint64_t v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXPhotosSearchResultsVirtualCollection"];

  return v2;
}

- (uint64_t)px_isBookmarksVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXTransientCollectionIdentifierBookmarks"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isWallpaperSuggestionsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXTransientCollectionIdentifierWallpaperSuggestions"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isFeaturedPhotosCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 hasPrefix:@"PXFeaturedPhotosVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isTripsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXTransientCollectionIdentifierTrips"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isEventsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXTransientCollectionIdentifierEvents"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isMomentsVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXMomentsVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isPhotosVirtualCollection
{
  uint64_t result = [a1 isTransient];
  if (result)
  {
    unint64_t v3 = [a1 transientIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"PXPhotosVirtualCollection"];

    return v4;
  }
  return result;
}

- (uint64_t)px_isRecentlySavedCollection
{
  if ([a1 assetCollectionSubtype] == 1000000218) {
    return 1;
  }
  return objc_msgSend(a1, "px_isSavedTodayCollection");
}

- (BOOL)px_isPlacesSmartAlbum
{
  return [a1 assetCollectionSubtype] == 1000000203;
}

- (BOOL)px_isRecentlyAddedSmartAlbum
{
  return [a1 assetCollectionSubtype] == 206;
}

- (BOOL)px_isHiddenSmartAlbum
{
  return [a1 assetCollectionSubtype] == 205;
}

- (uint64_t)px_isLemonadeUtilitiesAlbum
{
  if ((objc_msgSend(a1, "px_isUtilityCollection") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentsCollection") & 1) != 0
    || (objc_msgSend(a1, "px_isHiddenSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isAllLibraryDuplicatesSmartAlbum") & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "px_isImportHistoryCollection");
}

- (uint64_t)px_isMediaTypeSmartAlbum
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "px_mediaTypeSmartAlbumSubtypes");
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "assetCollectionSubtype"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)px_isRootSmartAlbum
{
  uint64_t result = objc_msgSend(a1, "px_isSmartAlbum");
  if (result)
  {
    if ((objc_msgSend(a1, "px_isPlacesSmartAlbum") & 1) != 0
      || (objc_msgSend(a1, "px_isUserSmartAlbum") & 1) != 0
      || (objc_msgSend(a1, "px_isMediaTypeSmartAlbum") & 1) != 0)
    {
      return 0;
    }
    else
    {
      return objc_msgSend(a1, "px_isLemonadeUtilitiesAlbum") ^ 1;
    }
  }
  return result;
}

- (uint64_t)px_isSmartAlbum
{
  if ([a1 assetCollectionType] == 2) {
    return [a1 isTransient] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)px_isMyPhotoStreamAlbum
{
  return [a1 assetCollectionSubtype] == 100;
}

- (BOOL)px_isImportedAlbum
{
  return [a1 assetCollectionSubtype] == 6;
}

- (BOOL)px_isRegularAlbum
{
  return [a1 assetCollectionSubtype] == 2;
}

- (uint64_t)px_allowsImplicitSelectionForProjectOrSharingAction
{
  if ((objc_msgSend(a1, "px_isRecentsSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isImportHistoryCollection") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "px_isSearchResultsVirtualCollection") ^ 1;
  }
}

- (BOOL)px_isMemory
{
  return [a1 assetCollectionType] == 4;
}

- (id)localizedDebugDescription
{
  if ([a1 assetCollectionType] == 6)
  {
    id v4 = a1;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        [v4 type];
        uint64_t v5 = PHShortDescriptionForPhotosHighlightType();
        [v4 enrichmentState];
        BOOL v6 = PHShortDescriptionForPhotosHighlightEnrichmentState();
        uint64_t v7 = objc_msgSend(v4, "countForCurationType:", objc_msgSend(v4, "px_curationType"));
        v8 = NSString;
        [v4 promotionScore];
        v10 = [v8 stringWithFormat:@"%@ | %@ | %.2f | %li", v5, v6, v9, v7];

        goto LABEL_6;
      }
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v15);
      v16 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, v4, @"PHAsset+PXDisplayAssetAdoption.m", 938, @"%@ should be an instance inheriting from %@, but it is %@", @"self", v14, v16 object file lineNumber description];
    }
    else
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      [v12 handleFailureInMethod:a2, 0, @"PHAsset+PXDisplayAssetAdoption.m", 938, @"%@ should be an instance inheriting from %@, but it is nil", @"self", v14 object file lineNumber description];
    }

    goto LABEL_4;
  }
  v10 = 0;
LABEL_6:
  return v10;
}

- (id)localizedSmartDescription
{
  if ([a1 assetCollectionType] == 6)
  {
    id v4 = a1;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        uint64_t v5 = [v4 smartDescription];

        goto LABEL_6;
      }
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v10);
      v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, v4, @"PHAsset+PXDisplayAssetAdoption.m", 930, @"%@ should be an instance inheriting from %@, but it is %@", @"self", v9, v11 object file lineNumber description];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v7 handleFailureInMethod:a2, 0, @"PHAsset+PXDisplayAssetAdoption.m", 930, @"%@ should be an instance inheriting from %@, but it is nil", @"self", v9 object file lineNumber description];
    }

    goto LABEL_4;
  }
  uint64_t v5 = 0;
LABEL_6:
  return v5;
}

- (id)localizedDateDescriptionWithOptions:()PXDisplayAssetAdoption
{
  if ([a1 assetCollectionType] == 6)
  {
    id v6 = a1;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        uint64_t v7 = [v6 dateDescriptionWithOptions:a3 & 3];

        goto LABEL_6;
      }
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v12);
      v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, v6, @"PHAsset+PXDisplayAssetAdoption.m", 922, @"%@ should be an instance inheriting from %@, but it is %@", @"self", v11, v13 object file lineNumber description];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, 0, @"PHAsset+PXDisplayAssetAdoption.m", 922, @"%@ should be an instance inheriting from %@, but it is nil", @"self", v11 object file lineNumber description];
    }

    goto LABEL_4;
  }
  uint64_t v7 = 0;
LABEL_6:
  return v7;
}

- (id)localizedShortDateDescription
{
  if ([a1 assetCollectionType] == 6)
  {
    id v4 = a1;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        uint64_t v5 = [v4 shortDateDescription];

        goto LABEL_6;
      }
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v10);
      v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, v4, @"PHAsset+PXDisplayAssetAdoption.m", 914, @"%@ should be an instance inheriting from %@, but it is %@", @"self", v9, v11 object file lineNumber description];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v7 handleFailureInMethod:a2, 0, @"PHAsset+PXDisplayAssetAdoption.m", 914, @"%@ should be an instance inheriting from %@, but it is nil", @"self", v9 object file lineNumber description];
    }

    goto LABEL_4;
  }
  uint64_t v5 = 0;
LABEL_6:
  return v5;
}

- (id)localizedDateDescription
{
  if ([a1 assetCollectionType] == 6)
  {
    id v4 = a1;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        uint64_t v5 = [v4 dateDescription];

        goto LABEL_6;
      }
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v10);
      v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, v4, @"PHAsset+PXDisplayAssetAdoption.m", 906, @"%@ should be an instance inheriting from %@, but it is %@", @"self", v9, v11 object file lineNumber description];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v7 handleFailureInMethod:a2, 0, @"PHAsset+PXDisplayAssetAdoption.m", 906, @"%@ should be an instance inheriting from %@, but it is nil", @"self", v9 object file lineNumber description];
    }

    goto LABEL_4;
  }
  uint64_t v5 = 0;
LABEL_6:
  return v5;
}

- (BOOL)isAggregation
{
  return [a1 assetCollectionType] == 6 && objc_msgSend(a1, "type") == 3;
}

- (uint64_t)px_wantsShareAllAction
{
  if ((objc_msgSend(a1, "px_isRegularAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isSharedAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isTrip") & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "px_isEvent");
}

- (double)promotionScore
{
  return 0.0;
}

- (uint64_t)px_highlightKind
{
  if ([a1 assetCollectionType] == 6) {
    return [a1 kind];
  }
  else {
    return -1;
  }
}

- (BOOL)isEnrichmentComplete
{
  if ([a1 assetCollectionType] == 4)
  {
    uint64_t v2 = [a1 graphMemoryIdentifier];
    BOOL v3 = v2 != 0;
  }
  else
  {
    return [a1 assetCollectionType] == 6 && objc_msgSend(a1, "enrichmentState") > 3;
  }
  return v3;
}

- (BOOL)isEnriched
{
  if ([a1 assetCollectionType] != 4) {
    return 0;
  }
  uint64_t v2 = [a1 graphMemoryIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

@end