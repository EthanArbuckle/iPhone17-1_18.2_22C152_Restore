@interface PXMockDisplayAssetCollection
- (BOOL)canContainAssets;
- (BOOL)canContainCollections;
- (BOOL)isAggregation;
- (BOOL)isEnriched;
- (BOOL)isEnrichmentComplete;
- (BOOL)isPrivacySensitiveAlbum;
- (BOOL)isRecent;
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
- (NSArray)localizedLocationNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)localizedDateDescription;
- (NSString)localizedShortDateDescription;
- (NSString)localizedSmartDescription;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)px_symbolImageName;
- (NSString)uuid;
- (PXMockDisplayAssetCollection)init;
- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6;
- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8;
- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 isPrivacySensitiveAlbum:(BOOL)a9;
- (double)promotionScore;
- (id)localizedDateDescriptionWithOptions:(unint64_t)a3;
- (id)px_cheapLogIdentifier;
- (int64_t)px_highlightKind;
- (int64_t)subtype;
- (int64_t)type;
- (unint64_t)estimatedAssetCount;
- (unsigned)px_highlightEnrichmentState;
@end

@implementation PXMockDisplayAssetCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->localizedSmartDescription, 0);
  objc_storeStrong((id *)&self->localizedLocationNames, 0);
  objc_storeStrong((id *)&self->localizedShortDateDescription, 0);
  objc_storeStrong((id *)&self->localizedDateDescription, 0);
}

- (BOOL)isPrivacySensitiveAlbum
{
  return self->_isPrivacySensitiveAlbum;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (int64_t)px_highlightKind
{
  return self->px_highlightKind;
}

- (unsigned)px_highlightEnrichmentState
{
  return self->px_highlightEnrichmentState;
}

- (double)promotionScore
{
  return self->promotionScore;
}

- (NSString)localizedSmartDescription
{
  return self->localizedSmartDescription;
}

- (NSArray)localizedLocationNames
{
  return self->localizedLocationNames;
}

- (NSString)localizedShortDateDescription
{
  return self->localizedShortDateDescription;
}

- (NSString)localizedDateDescription
{
  return self->localizedDateDescription;
}

- (BOOL)isRecent
{
  return self->isRecent;
}

- (BOOL)isEnrichmentComplete
{
  return self->isEnrichmentComplete;
}

- (BOOL)isEnriched
{
  return self->isEnriched;
}

- (BOOL)isAggregation
{
  return self->isAggregation;
}

- (unint64_t)estimatedAssetCount
{
  return self->estimatedAssetCount;
}

- (id)px_cheapLogIdentifier
{
  return (id)[NSString stringWithFormat:@"%@ %p", objc_opt_class(), self];
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXMockDisplayAssetCollection.m" lineNumber:564 description:@"not implemented yet"];

  abort();
}

- (NSString)uuid
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"%@-%p", v5, self];

  return (NSString *)v6;
}

- (BOOL)px_isSavedTodayCollection
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
  return [(PXMockDisplayAssetCollection *)self subtype] == 4;
}

- (BOOL)px_isMacSyncedRegularAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 5;
}

- (BOOL)px_isMacSyncedAlbum
{
  int64_t v2 = [(PXMockDisplayAssetCollection *)self subtype];
  return v2 == 3 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)px_isSharedAlbumsAndActivityFolder
{
  return 0;
}

- (BOOL)px_isSharedAlbumsFolder
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

- (BOOL)px_isContentSyndicationAlbum
{
  return 0;
}

- (BOOL)px_isMomentShare
{
  return [(PXMockDisplayAssetCollection *)self type] == 7;
}

- (BOOL)px_isSuggestion
{
  return [(PXMockDisplayAssetCollection *)self type] == 8;
}

- (BOOL)px_isTrip
{
  return 0;
}

- (BOOL)px_isEvent
{
  return 0;
}

- (BOOL)px_isMonthHighlight
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
  BOOL v3 = [(PXMockDisplayAssetCollection *)self px_isHighlight];
  if (v3) {
    LOBYTE(v3) = [(PXMockDisplayAssetCollection *)self px_highlightEnrichmentState] > 2;
  }
  return v3;
}

- (BOOL)px_isHighlight
{
  return [(PXMockDisplayAssetCollection *)self type] == 6;
}

- (BOOL)px_isMemory
{
  return [(PXMockDisplayAssetCollection *)self type] == 4;
}

- (BOOL)px_isMoment
{
  return [(PXMockDisplayAssetCollection *)self type] == 3;
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
  return [(PXMockDisplayAssetCollection *)self subtype] == 101;
}

- (BOOL)px_containsPrivateContent
{
  return 0;
}

- (BOOL)px_isPrivacySensitiveAlbum
{
  return self->_isPrivacySensitiveAlbum;
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
  return [(PXMockDisplayAssetCollection *)self subtype] == 221;
}

- (BOOL)px_isPanoramasSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 201;
}

- (BOOL)px_isUnableToUploadSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 216;
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
  return [(PXMockDisplayAssetCollection *)self subtype] == 219;
}

- (BOOL)px_isCinematicSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 218;
}

- (BOOL)px_isRAWSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 217;
}

- (BOOL)px_isLongExposuresSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 215;
}

- (BOOL)px_isAnimatedSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 214;
}

- (BOOL)px_isLivePhotosSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 213;
}

- (BOOL)px_isDepthEffectSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 212;
}

- (BOOL)px_isScreenshotsSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 211;
}

- (BOOL)px_isSelfPortraitsSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 210;
}

- (BOOL)px_isSlomoVideosSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 208;
}

- (BOOL)px_isBurstsSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 207;
}

- (BOOL)px_isTimelapsesSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 204;
}

- (BOOL)px_isVideosSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 202;
}

- (BOOL)px_isScreenRecordingsSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 1000000207;
}

- (BOOL)px_isRecentlyEditedSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 1000000206;
}

- (BOOL)px_isRecentsSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 209;
}

- (BOOL)px_isRecentlyDeletedSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 1000000201;
}

- (BOOL)px_isRecentlyAddedSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 206;
}

- (BOOL)px_isHiddenSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 205;
}

- (BOOL)px_isPlacesSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 1000000203;
}

- (BOOL)px_isFavoritesSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 203;
}

- (BOOL)px_isAllPhotosSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 1000000205;
}

- (BOOL)px_isLemonadeUtilitiesAlbum
{
  return 0;
}

- (BOOL)px_isMediaTypeSmartAlbum
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F38EE8], "px_mediaTypeSmartAlbumSubtypes");
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXMockDisplayAssetCollection subtype](self, "subtype"));
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)px_isRootSmartAlbum
{
  BOOL v3 = [(PXMockDisplayAssetCollection *)self px_isSmartAlbum];
  if (v3)
  {
    if ([(PXMockDisplayAssetCollection *)self px_isUserSmartAlbum]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PXMockDisplayAssetCollection *)self px_isMediaTypeSmartAlbum];
    }
  }
  return v3;
}

- (BOOL)px_isSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self type] == 2;
}

- (BOOL)px_isUserSmartAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 1000000204;
}

- (BOOL)px_isMyPhotoStreamAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 100;
}

- (BOOL)px_isImportedAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 6;
}

- (BOOL)px_isRegularAlbum
{
  return [(PXMockDisplayAssetCollection *)self subtype] == 2;
}

- (BOOL)px_isUserCreated
{
  if ([(PXMockDisplayAssetCollection *)self px_isRegularAlbum]
    || [(PXMockDisplayAssetCollection *)self px_isRegularFolder]
    || [(PXMockDisplayAssetCollection *)self px_isUserSmartAlbum])
  {
    return 1;
  }
  return [(PXMockDisplayAssetCollection *)self px_isProject];
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

- (NSString)px_symbolImageName
{
  return (NSString *)@"rectangle.stack";
}

- (BOOL)canContainCollections
{
  return 0;
}

- (BOOL)canContainAssets
{
  return 1;
}

- (PXMockDisplayAssetCollection)init
{
  return [(PXMockDisplayAssetCollection *)self initWithTitle:0 subtitle:0 type:0 subtype:0 startDate:0 endDate:0];
}

- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6
{
  return [(PXMockDisplayAssetCollection *)self initWithTitle:a3 subtitle:a4 type:a5 subtype:a6 startDate:0 endDate:0];
}

- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  LOBYTE(v9) = 0;
  return [(PXMockDisplayAssetCollection *)self initWithTitle:a3 subtitle:a4 type:a5 subtype:a6 startDate:a7 endDate:a8 isPrivacySensitiveAlbum:v9];
}

- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 isPrivacySensitiveAlbum:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PXMockDisplayAssetCollection;
  v19 = [(PXMockDisplayAssetCollection *)&v25 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    localizedTitle = v19->_localizedTitle;
    v19->_localizedTitle = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    localizedSubtitle = v19->_localizedSubtitle;
    v19->_localizedSubtitle = (NSString *)v22;

    v19->_type = a5;
    v19->_subtype = a6;
    objc_storeStrong((id *)&v19->_startDate, a7);
    objc_storeStrong((id *)&v19->_endDate, a8);
    v19->_isPrivacySensitiveAlbum = a9;
  }

  return v19;
}

@end