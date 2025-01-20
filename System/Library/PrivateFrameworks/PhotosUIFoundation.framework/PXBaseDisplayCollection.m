@interface PXBaseDisplayCollection
- (BOOL)canContainAssets;
- (BOOL)canContainCollections;
- (BOOL)px_allowsImplicitSelectionForProjectOrSharingAction;
- (BOOL)px_allowsKeyAssetDisplay;
- (BOOL)px_allowsMoveToPersonalLibrary;
- (BOOL)px_allowsMoveToSharedLibrary;
- (BOOL)px_canAddContent;
- (BOOL)px_canCreateContent;
- (BOOL)px_canDeleteContent;
- (BOOL)px_canRearrangeContent;
- (BOOL)px_canRemoveContent;
- (BOOL)px_containsPrivateContent;
- (BOOL)px_isAllAlbumsVirtualCollection;
- (BOOL)px_isAllLibraryDuplicatesSmartAlbum;
- (BOOL)px_isAllMacSyncedAlbumsFolder;
- (BOOL)px_isAllPhotosSmartAlbum;
- (BOOL)px_isAnimatedSmartAlbum;
- (BOOL)px_isBookmarksVirtualCollection;
- (BOOL)px_isBurstsSmartAlbum;
- (BOOL)px_isCinematicSmartAlbum;
- (BOOL)px_isCloudMultipleContributorsEnabled;
- (BOOL)px_isContentSyndicationAlbum;
- (BOOL)px_isContentSyndicationAllPhotosAlbum;
- (BOOL)px_isContentSyndicationFolder;
- (BOOL)px_isContentSyndicationVirtualCollection;
- (BOOL)px_isDayGroupHighlight;
- (BOOL)px_isDayHighlight;
- (BOOL)px_isDeletable;
- (BOOL)px_isDepthEffectSmartAlbum;
- (BOOL)px_isDuplicatesAlbum;
- (BOOL)px_isEvent;
- (BOOL)px_isEventsVirtualCollection;
- (BOOL)px_isFavoritesSmartAlbum;
- (BOOL)px_isFeaturedPhotosCollection;
- (BOOL)px_isFolder;
- (BOOL)px_isHiddenSmartAlbum;
- (BOOL)px_isHighlight;
- (BOOL)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed;
- (BOOL)px_isImportAssetCollection;
- (BOOL)px_isImportHistoryCollection;
- (BOOL)px_isImportSessionCollection;
- (BOOL)px_isImportedAlbum;
- (BOOL)px_isInReadWriteCloudLibrary;
- (BOOL)px_isLemonadeUtilitiesAlbum;
- (BOOL)px_isLivePhotosSmartAlbum;
- (BOOL)px_isLongExposuresSmartAlbum;
- (BOOL)px_isMacSyncedAlbum;
- (BOOL)px_isMacSyncedEventsFolder;
- (BOOL)px_isMacSyncedFacesAlbum;
- (BOOL)px_isMacSyncedFacesFolder;
- (BOOL)px_isMacSyncedRegularAlbum;
- (BOOL)px_isMapVirtualCollection;
- (BOOL)px_isMediaTypeSmartAlbum;
- (BOOL)px_isMediaTypesFolder;
- (BOOL)px_isMemoriesVirtualCollection;
- (BOOL)px_isMemory;
- (BOOL)px_isMoment;
- (BOOL)px_isMomentShare;
- (BOOL)px_isMomentShareVirtualCollection;
- (BOOL)px_isMomentsVirtualCollection;
- (BOOL)px_isMonthHighlight;
- (BOOL)px_isMyAlbumsVirtualCollection;
- (BOOL)px_isMyPhotoStreamAlbum;
- (BOOL)px_isOwnedSharedAlbum;
- (BOOL)px_isPanoramasSmartAlbum;
- (BOOL)px_isPeopleVirtualCollection;
- (BOOL)px_isPhotosVirtualCollection;
- (BOOL)px_isPlacesSmartAlbum;
- (BOOL)px_isPrivacySensitiveAlbum;
- (BOOL)px_isProResSmartAlbum;
- (BOOL)px_isProject;
- (BOOL)px_isProjectsFolder;
- (BOOL)px_isRAWSmartAlbum;
- (BOOL)px_isRecentlyAddedSmartAlbum;
- (BOOL)px_isRecentlyDeletedSmartAlbum;
- (BOOL)px_isRecentlyEditedCollection;
- (BOOL)px_isRecentlyEditedSmartAlbum;
- (BOOL)px_isRecentlySavedCollection;
- (BOOL)px_isRecentlySharedCollection;
- (BOOL)px_isRecentlyViewedCollection;
- (BOOL)px_isRecentsCollection;
- (BOOL)px_isRecentsSmartAlbum;
- (BOOL)px_isRecoveredSmartAlbum;
- (BOOL)px_isRegularAlbum;
- (BOOL)px_isRegularFolder;
- (BOOL)px_isRenamable;
- (BOOL)px_isRootSmartAlbum;
- (BOOL)px_isSavedTodayCollection;
- (BOOL)px_isScreenRecordingsSmartAlbum;
- (BOOL)px_isScreenshotsSmartAlbum;
- (BOOL)px_isSearchResultsVirtualCollection;
- (BOOL)px_isSelfPortraitsSmartAlbum;
- (BOOL)px_isSharedActivityVirtualCollection;
- (BOOL)px_isSharedAlbum;
- (BOOL)px_isSharedAlbumsAndActivityFolder;
- (BOOL)px_isSharedAlbumsFolder;
- (BOOL)px_isSharedAlbumsVirtualCollection;
- (BOOL)px_isSharedLibrarySharingSuggestion;
- (BOOL)px_isSharedLibrarySharingSuggestionsSmartAlbum;
- (BOOL)px_isSlomoVideosSmartAlbum;
- (BOOL)px_isSmartAlbum;
- (BOOL)px_isSmartFolder;
- (BOOL)px_isSpatialSmartAlbum;
- (BOOL)px_isSuggestion;
- (BOOL)px_isTimelapsesSmartAlbum;
- (BOOL)px_isTopLevelFolder;
- (BOOL)px_isTransientPlacesCollection;
- (BOOL)px_isTrip;
- (BOOL)px_isTripsVirtualCollection;
- (BOOL)px_isUnableToUploadSmartAlbum;
- (BOOL)px_isUserCreated;
- (BOOL)px_isUserSmartAlbum;
- (BOOL)px_isUtilitiesFolder;
- (BOOL)px_isUtilityCollection;
- (BOOL)px_isVideosSmartAlbum;
- (BOOL)px_isWallpaperSuggestionsVirtualCollection;
- (BOOL)px_shouldUseFacesRectForSmartCropping;
- (BOOL)px_supportsFastCuration;
- (BOOL)px_wantsCurationByDefault;
- (BOOL)px_wantsShareAllAction;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)px_symbolImageName;
- (id)px_cheapLogIdentifier;
@end

@implementation PXBaseDisplayCollection

- (id)px_cheapLogIdentifier
{
  return (id)[NSString stringWithFormat:@"%@ %p", objc_opt_class(), self];
}

- (BOOL)px_isSavedTodayCollection
{
  return 0;
}

- (BOOL)px_isRecentlySharedCollection
{
  return 0;
}

- (BOOL)px_isRecentlyEditedCollection
{
  return 0;
}

- (BOOL)px_isRecentlyViewedCollection
{
  return 0;
}

- (BOOL)px_isRecentlySavedCollection
{
  return 0;
}

- (BOOL)px_isTransientPlacesCollection
{
  return 0;
}

- (BOOL)px_isImportAssetCollection
{
  return 0;
}

- (BOOL)px_isImportSessionCollection
{
  return 0;
}

- (BOOL)px_isImportHistoryCollection
{
  return 0;
}

- (BOOL)px_isMomentShareVirtualCollection
{
  return 0;
}

- (BOOL)px_isContentSyndicationAllPhotosAlbum
{
  return 0;
}

- (BOOL)px_isMapVirtualCollection
{
  return 0;
}

- (BOOL)px_isContentSyndicationVirtualCollection
{
  return 0;
}

- (BOOL)px_isSharedAlbumsVirtualCollection
{
  return 0;
}

- (BOOL)px_isMyAlbumsVirtualCollection
{
  return 0;
}

- (BOOL)px_isAllAlbumsVirtualCollection
{
  return 0;
}

- (BOOL)px_isSharedActivityVirtualCollection
{
  return 0;
}

- (BOOL)px_isPeopleVirtualCollection
{
  return 0;
}

- (BOOL)px_isMemoriesVirtualCollection
{
  return 0;
}

- (BOOL)px_isSearchResultsVirtualCollection
{
  return 0;
}

- (BOOL)px_isBookmarksVirtualCollection
{
  return 0;
}

- (BOOL)px_isWallpaperSuggestionsVirtualCollection
{
  return 0;
}

- (BOOL)px_isFeaturedPhotosCollection
{
  return 0;
}

- (BOOL)px_isTripsVirtualCollection
{
  return 0;
}

- (BOOL)px_isEventsVirtualCollection
{
  return 0;
}

- (BOOL)px_isMomentsVirtualCollection
{
  return 0;
}

- (BOOL)px_isPhotosVirtualCollection
{
  return 0;
}

- (BOOL)px_isProject
{
  return 0;
}

- (BOOL)px_isMacSyncedFacesFolder
{
  return 0;
}

- (BOOL)px_isMacSyncedEventsFolder
{
  return 0;
}

- (BOOL)px_isMacSyncedFacesAlbum
{
  return 0;
}

- (BOOL)px_isMacSyncedRegularAlbum
{
  return 0;
}

- (BOOL)px_isMacSyncedAlbum
{
  return 0;
}

- (BOOL)px_isAllMacSyncedAlbumsFolder
{
  return 0;
}

- (BOOL)px_isContentSyndicationFolder
{
  return 0;
}

- (BOOL)px_isProjectsFolder
{
  return 0;
}

- (BOOL)px_isUtilitiesFolder
{
  return 0;
}

- (BOOL)px_isMediaTypesFolder
{
  return 0;
}

- (BOOL)px_isSharedAlbumsAndActivityFolder
{
  return 0;
}

- (BOOL)px_isSharedAlbumsFolder
{
  return 0;
}

- (BOOL)px_isTopLevelFolder
{
  return 0;
}

- (BOOL)px_isRegularFolder
{
  return 0;
}

- (BOOL)px_isSmartFolder
{
  return 0;
}

- (BOOL)px_isFolder
{
  return 0;
}

- (BOOL)px_isInReadWriteCloudLibrary
{
  return 0;
}

- (BOOL)px_isCloudMultipleContributorsEnabled
{
  return 0;
}

- (BOOL)px_isOwnedSharedAlbum
{
  return 0;
}

- (BOOL)px_isSharedAlbum
{
  return 0;
}

- (BOOL)px_isContentSyndicationAlbum
{
  return 0;
}

- (BOOL)px_isMomentShare
{
  return 0;
}

- (BOOL)px_isSuggestion
{
  return 0;
}

- (BOOL)px_isMonthHighlight
{
  return 0;
}

- (BOOL)px_isTrip
{
  return 0;
}

- (BOOL)px_isEvent
{
  return 0;
}

- (BOOL)px_isDayHighlight
{
  return 0;
}

- (BOOL)px_isDayGroupHighlight
{
  return 0;
}

- (BOOL)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed
{
  return 0;
}

- (BOOL)px_isHighlight
{
  return 0;
}

- (BOOL)px_isMemory
{
  return 0;
}

- (BOOL)px_isMoment
{
  return 0;
}

- (BOOL)px_containsPrivateContent
{
  return 0;
}

- (BOOL)px_isPrivacySensitiveAlbum
{
  return 0;
}

- (BOOL)px_isRecoveredSmartAlbum
{
  return 0;
}

- (BOOL)px_isAllLibraryDuplicatesSmartAlbum
{
  return 0;
}

- (BOOL)px_isSpatialSmartAlbum
{
  return 0;
}

- (BOOL)px_isPanoramasSmartAlbum
{
  return 0;
}

- (BOOL)px_isSharedLibrarySharingSuggestion
{
  return 0;
}

- (BOOL)px_isSharedLibrarySharingSuggestionsSmartAlbum
{
  return 0;
}

- (BOOL)px_isUnableToUploadSmartAlbum
{
  return 0;
}

- (BOOL)px_isDuplicatesAlbum
{
  return 0;
}

- (BOOL)px_isRecentsCollection
{
  return 0;
}

- (BOOL)px_isUtilityCollection
{
  return 0;
}

- (BOOL)px_isProResSmartAlbum
{
  return 0;
}

- (BOOL)px_isCinematicSmartAlbum
{
  return 0;
}

- (BOOL)px_isRAWSmartAlbum
{
  return 0;
}

- (BOOL)px_isLongExposuresSmartAlbum
{
  return 0;
}

- (BOOL)px_isAnimatedSmartAlbum
{
  return 0;
}

- (BOOL)px_isLivePhotosSmartAlbum
{
  return 0;
}

- (BOOL)px_isDepthEffectSmartAlbum
{
  return 0;
}

- (BOOL)px_isScreenshotsSmartAlbum
{
  return 0;
}

- (BOOL)px_isSelfPortraitsSmartAlbum
{
  return 0;
}

- (BOOL)px_isSlomoVideosSmartAlbum
{
  return 0;
}

- (BOOL)px_isBurstsSmartAlbum
{
  return 0;
}

- (BOOL)px_isTimelapsesSmartAlbum
{
  return 0;
}

- (BOOL)px_isVideosSmartAlbum
{
  return 0;
}

- (BOOL)px_isScreenRecordingsSmartAlbum
{
  return 0;
}

- (BOOL)px_isRecentlyEditedSmartAlbum
{
  return 0;
}

- (BOOL)px_isRecentsSmartAlbum
{
  return 0;
}

- (BOOL)px_isPlacesSmartAlbum
{
  return 0;
}

- (BOOL)px_isRecentlyDeletedSmartAlbum
{
  return 0;
}

- (BOOL)px_isRecentlyAddedSmartAlbum
{
  return 0;
}

- (BOOL)px_isHiddenSmartAlbum
{
  return 0;
}

- (BOOL)px_isFavoritesSmartAlbum
{
  return 0;
}

- (BOOL)px_isAllPhotosSmartAlbum
{
  return 0;
}

- (BOOL)px_isLemonadeUtilitiesAlbum
{
  return 0;
}

- (BOOL)px_isMediaTypeSmartAlbum
{
  return 0;
}

- (BOOL)px_isRootSmartAlbum
{
  return 0;
}

- (BOOL)px_isSmartAlbum
{
  return 0;
}

- (BOOL)px_isUserSmartAlbum
{
  return 0;
}

- (BOOL)px_isMyPhotoStreamAlbum
{
  return 0;
}

- (BOOL)px_isImportedAlbum
{
  return 0;
}

- (BOOL)px_isRegularAlbum
{
  return 0;
}

- (BOOL)px_isUserCreated
{
  return 0;
}

- (BOOL)px_wantsShareAllAction
{
  return 0;
}

- (BOOL)px_wantsCurationByDefault
{
  return 0;
}

- (BOOL)px_supportsFastCuration
{
  return 0;
}

- (BOOL)px_shouldUseFacesRectForSmartCropping
{
  return 0;
}

- (BOOL)px_allowsMoveToPersonalLibrary
{
  return 0;
}

- (BOOL)px_allowsMoveToSharedLibrary
{
  return 0;
}

- (BOOL)px_isRenamable
{
  return 0;
}

- (BOOL)px_isDeletable
{
  return 0;
}

- (BOOL)px_canRearrangeContent
{
  return 0;
}

- (BOOL)px_canCreateContent
{
  return 0;
}

- (BOOL)px_canAddContent
{
  return 0;
}

- (BOOL)px_canRemoveContent
{
  return 0;
}

- (BOOL)px_canDeleteContent
{
  return 0;
}

- (BOOL)px_allowsImplicitSelectionForProjectOrSharingAction
{
  return 0;
}

- (BOOL)px_allowsKeyAssetDisplay
{
  return 0;
}

- (BOOL)canContainCollections
{
  return 0;
}

- (BOOL)canContainAssets
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (NSString)localizedTitle
{
  return 0;
}

- (NSString)px_symbolImageName
{
  return (NSString *)@"rectangle.stack";
}

- (NSDate)endDate
{
  return 0;
}

- (NSDate)startDate
{
  return 0;
}

@end