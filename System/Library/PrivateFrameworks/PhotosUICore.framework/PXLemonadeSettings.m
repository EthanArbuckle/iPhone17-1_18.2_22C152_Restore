@interface PXLemonadeSettings
+ (PXLemonadeSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowProfileIcon;
- (BOOL)alwaysEnterDetailsViewInFullscreenPlayback;
- (BOOL)alwaysFilterPlaceholder;
- (BOOL)enableAggregatedHighlightGridInEditorial;
- (BOOL)enableCollectionsSortButton;
- (BOOL)enableCubeMode;
- (BOOL)enableCuratedLibrary;
- (BOOL)enableDetailsSummaryButton;
- (BOOL)enableDetailsViewHorizontalKeyboardScrolling;
- (BOOL)enableDetailsViewHorizontalPaging;
- (BOOL)enableDetailsViewPrototype;
- (BOOL)enableDismissPersistence;
- (BOOL)enableDocumentsSection;
- (BOOL)enableDynamicHeader;
- (BOOL)enableEmbeddingOnlyResultsInExactMatches;
- (BOOL)enableEmbeddingSearch;
- (BOOL)enableEventsCellCollageStyle;
- (BOOL)enableEventsDebugOverlay;
- (BOOL)enableExactMatchResults;
- (BOOL)enableFocusMapLensOnAnchors;
- (BOOL)enableFullPageScreenshotDebuggingOverlays;
- (BOOL)enableFullPageScreenshots;
- (BOOL)enableHorizontalPagingHint;
- (BOOL)enableHybridMatchResults;
- (BOOL)enableInlinePlaybackDebugHUD;
- (BOOL)enableInlinePlaybackEvents;
- (BOOL)enableInlinePlaybackMemories;
- (BOOL)enableInlinePlaybackOnHover;
- (BOOL)enableInlinePlaybackSocialGroupFeed;
- (BOOL)enableInlinePlaybackSocialGroupShelf;
- (BOOL)enableInlinePlaybackTrips;
- (BOOL)enableInlinePlaybackTripsShelf;
- (BOOL)enableKenBurnsInCollectionPreview;
- (BOOL)enableLargeThumbnailAlbumCellStyle;
- (BOOL)enableLensesInPlacesMapView;
- (BOOL)enableLoadingStatusHUD;
- (BOOL)enableMetadataSearch;
- (BOOL)enableMonthHeroPromotion;
- (BOOL)enableMonthLocationTitles;
- (BOOL)enableNavigationBarBlur;
- (BOOL)enableNavigationBarBlurInCollections;
- (BOOL)enableNewDetailsView;
- (BOOL)enableNextTokenSuggestions;
- (BOOL)enablePhotosChallenge;
- (BOOL)enablePhototypes;
- (BOOL)enablePreviewCaching;
- (BOOL)enablePreviewKeyAsset;
- (BOOL)enablePreviewSharing;
- (BOOL)enableProtoBanner;
- (BOOL)enableQueryUnderstanding;
- (BOOL)enableRadarButton;
- (BOOL)enableRecentlyEditedCollection;
- (BOOL)enableRecentlySharedCollection;
- (BOOL)enableRecentlyViewedCollection;
- (BOOL)enableResponsiveScrolling;
- (BOOL)enableSavedToday;
- (BOOL)enableSearchResultDiffAnimation;
- (BOOL)enableShelfDrawBorders;
- (BOOL)enableShelfIPadLayout;
- (BOOL)enableShelves;
- (BOOL)enableShelvesLoader;
- (BOOL)enableShelvesLoaderGradualDelivery;
- (BOOL)enableSidebarHeaderSelection;
- (BOOL)enableStackCounting;
- (BOOL)enableUserSmartAlbums;
- (BOOL)enableUtilityPrototypeCollections;
- (BOOL)enableZKWForPad;
- (BOOL)enabledShelvesLazyVStack;
- (BOOL)forceDarkDetailsView;
- (BOOL)forceHideProcessingUI;
- (BOOL)forceRenderingStatus;
- (BOOL)forceShowProcessingUI;
- (BOOL)hideInlinePlayerOnFirstSegment;
- (BOOL)hideNotifications;
- (BOOL)implicitSearchScopeForPickerSuggestionScopeSearch;
- (BOOL)includeSharedAlbumsActivityInProfileNotifications;
- (BOOL)inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal;
- (BOOL)limitFullPageScreenshotScale;
- (BOOL)limitFullPageScreenshotSize;
- (BOOL)onlyDismissedInProfile;
- (BOOL)overrideSuggestionPills;
- (BOOL)preferNewPlayerForFeeds;
- (BOOL)presentZoomableGridFromMapCluster;
- (BOOL)resetAllPhotosOnDismiss;
- (BOOL)sharedWithYouOnlyFilterIncludesUnsaved;
- (BOOL)shouldRemoveFilteredEventsFromUI;
- (BOOL)shouldUsePhotosIntelligenceSPIForUtilities;
- (BOOL)showSearchDebugBadges;
- (BOOL)showSharedLibraryPill;
- (BOOL)simulateDetailsViewLeaking;
- (BOOL)simulateEmptyShelves;
- (BOOL)simulateFromMyMacAlbums;
- (BOOL)useFeatureAvailabilityReporter;
- (PXLemonadeOneUpSettings)oneUpSettings;
- (char)collectionPreviewKenBurnsScaleDirection;
- (double)bannerTopMargin;
- (double)curatedLibraryBottomPadding;
- (double)curatedLibraryChromeAutoAnimateSpringStiffness;
- (double)curatedLibraryCollapseMinScrollDistance;
- (double)curatedLibraryExpansionFastToggleSpringStiffness;
- (double)curatedLibraryExpansionGestureSpringStiffness;
- (double)curatedLibraryExpansionMinScrollDistance;
- (double)curatedLibraryExpansionToggleSpringStiffness;
- (double)curatedLibraryTransitionChromeCollapsePercentage;
- (double)curatedLibraryTransitionChromeExpandPercentage;
- (double)curatedLibraryTransitionShelfHeaderBlurRadius;
- (double)curatedLibraryTransitionToolbarBlurRadius;
- (double)defaultFloatingToolbarBottomInset;
- (double)detailsViewHeaderAspectRatio;
- (double)dynamicHeaderChromeHidingDelay;
- (double)dynamicHeaderDismissAreaBottomInset;
- (double)dynamicHeaderMaximumDelayFromMovie;
- (double)dynamicHeaderMaximumDelayFromPreview;
- (double)eventsCellItemAspectRatio;
- (double)eventsPromotionScoreThreshold;
- (double)horizontalPagingHintMaximumOvershoot;
- (double)horizontalPagingHintMaximumScale;
- (double)inlinePlaybackOnHoverPlaybackDelay;
- (double)inlinePlaybackVisibilityThreshold;
- (double)inlinePlayerCoveredDurationForPause;
- (double)inlinePlayerFirstSegmentPlaceholderDuration;
- (double)inlinePlayerFrameLatencyApproximation;
- (double)inlinePlayerPlaceholderKenBurnsExtraDuration;
- (double)inlinePlayerPlaceholderKenBurnsScale;
- (double)lowQualityAggregationPromotionScoreThreshold;
- (double)mapLensAnchorFocusKilometerRadius;
- (double)mapTabInitialKilometerRadius;
- (double)mapTileInitialKilometerDiameter;
- (double)maximumFullPageScreenshotDimension;
- (double)minimumCuratedLibraryVisibleFractionForExpansion;
- (double)navigationBarAnimationDuration;
- (double)navigationBarBlurDistanceToBaseline;
- (double)navigationBarBlurLegibilityEDRBoost;
- (double)navigationBarBlurRadius;
- (double)navigationBarLegibilityEDRBoost;
- (double)navigationBarTintOpacity;
- (double)navigationBarTitleAppearDelay;
- (double)navigationBarTitleAppearDuration;
- (double)navigationBarTitleDisappearDuration;
- (double)opacityOfPlayerOnFirstSegment;
- (double)profileButtonShapeOutset;
- (double)savedTodayToleranceInHours;
- (double)scrollThresholdForTopCenteredTitle;
- (double)searchButtonShapeOutset;
- (double)searchQueryTimeout;
- (double)sectionedFeedTabBarItemSpacing;
- (double)selectButtonShapeOutset;
- (double)shelfSpacing;
- (double)simulatedDetailsViewLoadingDelay;
- (double)simulatedPreviewPlayerDelay;
- (double)titleOverlayDetachingDistance;
- (double)titleOverlayScaleAtTop;
- (double)titleOverlayScaleDistance;
- (double)titleOverlaySingleLineTopDetentTolerance;
- (double)titleOverlayTopDetentTolerance;
- (double)titleOverlayVerticalOffsetAtTop;
- (double)topCenteredTitleVerticalOffset;
- (double)topTitleVerticalSpace;
- (double)wallpaperLoadingArtificialDelay;
- (double)wallpaperLoadingTimeout;
- (id)parentSettings;
- (int)eventsExtendedCountThreshold;
- (int)eventsSummaryCountThreshold;
- (int64_t)aggregatedHighlightColumns;
- (int64_t)collectionPreviewTransition;
- (int64_t)dynamicHeaderDebugBehavior;
- (int64_t)dynamicHeaderDebugOverlay;
- (int64_t)eventFilterType;
- (int64_t)eventsAlgorithm;
- (int64_t)horizontalPagingTechnique;
- (int64_t)inlinePlaybackMaxConcurrentPlayers;
- (int64_t)inlinePlaybackMaxPreloadPlayers;
- (int64_t)inlinePlaybackMaxSupportedVisiblePlayers;
- (int64_t)maxCuratedCollectionsPerType;
- (int64_t)maxNumberOfSharedAlbumActivityItemsToShow;
- (int64_t)maxRankedAssetSearchResults;
- (int64_t)maxSearchResults;
- (int64_t)maxSearchSuggestions;
- (int64_t)maximumNumberOfAssetsForPlaybackAsMemory;
- (int64_t)minQueryLengthForFullRanking;
- (int64_t)minimumNumberOfAssetsForPlaybackAsMemory;
- (int64_t)movieCurationAffordance;
- (int64_t)navigationBarTintCurve;
- (int64_t)scrubberKind;
- (int64_t)tripsSource;
- (int64_t)version;
- (int64_t)yearsAndMonthsMode;
- (unint64_t)defaultPhoneFeedNavigationType;
- (unint64_t)detailsDismissArea;
- (unint64_t)detailsViewGridContent;
- (unint64_t)maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications;
- (unint64_t)maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications;
- (unint64_t)minNumberOfResultsForNextTokenGeneration;
- (void)createChildren;
- (void)setAggregatedHighlightColumns:(int64_t)a3;
- (void)setAllowProfileIcon:(BOOL)a3;
- (void)setAlwaysEnterDetailsViewInFullscreenPlayback:(BOOL)a3;
- (void)setAlwaysFilterPlaceholder:(BOOL)a3;
- (void)setBannerTopMargin:(double)a3;
- (void)setCollectionPreviewKenBurnsScaleDirection:(char)a3;
- (void)setCollectionPreviewTransition:(int64_t)a3;
- (void)setCuratedLibraryBottomPadding:(double)a3;
- (void)setCuratedLibraryChromeAutoAnimateSpringStiffness:(double)a3;
- (void)setCuratedLibraryCollapseMinScrollDistance:(double)a3;
- (void)setCuratedLibraryExpansionFastToggleSpringStiffness:(double)a3;
- (void)setCuratedLibraryExpansionGestureSpringStiffness:(double)a3;
- (void)setCuratedLibraryExpansionMinScrollDistance:(double)a3;
- (void)setCuratedLibraryExpansionToggleSpringStiffness:(double)a3;
- (void)setCuratedLibraryTransitionChromeCollapsePercentage:(double)a3;
- (void)setCuratedLibraryTransitionChromeExpandPercentage:(double)a3;
- (void)setCuratedLibraryTransitionShelfHeaderBlurRadius:(double)a3;
- (void)setCuratedLibraryTransitionToolbarBlurRadius:(double)a3;
- (void)setDefaultFloatingToolbarBottomInset:(double)a3;
- (void)setDefaultPhoneFeedNavigationType:(unint64_t)a3;
- (void)setDefaultValues;
- (void)setDetailsDismissArea:(unint64_t)a3;
- (void)setDetailsViewGridContent:(unint64_t)a3;
- (void)setDetailsViewHeaderAspectRatio:(double)a3;
- (void)setDynamicHeaderChromeHidingDelay:(double)a3;
- (void)setDynamicHeaderDebugBehavior:(int64_t)a3;
- (void)setDynamicHeaderDebugOverlay:(int64_t)a3;
- (void)setDynamicHeaderDismissAreaBottomInset:(double)a3;
- (void)setDynamicHeaderMaximumDelayFromMovie:(double)a3;
- (void)setDynamicHeaderMaximumDelayFromPreview:(double)a3;
- (void)setEnableAggregatedHighlightGridInEditorial:(BOOL)a3;
- (void)setEnableCollectionsSortButton:(BOOL)a3;
- (void)setEnableCubeMode:(BOOL)a3;
- (void)setEnableCuratedLibrary:(BOOL)a3;
- (void)setEnableDetailsSummaryButton:(BOOL)a3;
- (void)setEnableDetailsViewHorizontalKeyboardScrolling:(BOOL)a3;
- (void)setEnableDetailsViewHorizontalPaging:(BOOL)a3;
- (void)setEnableDetailsViewPrototype:(BOOL)a3;
- (void)setEnableDismissPersistence:(BOOL)a3;
- (void)setEnableDocumentsSection:(BOOL)a3;
- (void)setEnableDynamicHeader:(BOOL)a3;
- (void)setEnableEmbeddingOnlyResultsInExactMatches:(BOOL)a3;
- (void)setEnableEmbeddingSearch:(BOOL)a3;
- (void)setEnableEventsCellCollageStyle:(BOOL)a3;
- (void)setEnableEventsDebugOverlay:(BOOL)a3;
- (void)setEnableExactMatchResults:(BOOL)a3;
- (void)setEnableFocusMapLensOnAnchors:(BOOL)a3;
- (void)setEnableFullPageScreenshotDebuggingOverlays:(BOOL)a3;
- (void)setEnableFullPageScreenshots:(BOOL)a3;
- (void)setEnableHorizontalPagingHint:(BOOL)a3;
- (void)setEnableHybridMatchResults:(BOOL)a3;
- (void)setEnableInlinePlaybackDebugHUD:(BOOL)a3;
- (void)setEnableInlinePlaybackEvents:(BOOL)a3;
- (void)setEnableInlinePlaybackMemories:(BOOL)a3;
- (void)setEnableInlinePlaybackOnHover:(BOOL)a3;
- (void)setEnableInlinePlaybackSocialGroupFeed:(BOOL)a3;
- (void)setEnableInlinePlaybackSocialGroupShelf:(BOOL)a3;
- (void)setEnableInlinePlaybackTrips:(BOOL)a3;
- (void)setEnableInlinePlaybackTripsShelf:(BOOL)a3;
- (void)setEnableKenBurnsInCollectionPreview:(BOOL)a3;
- (void)setEnableLargeThumbnailAlbumCellStyle:(BOOL)a3;
- (void)setEnableLensesInPlacesMapView:(BOOL)a3;
- (void)setEnableLoadingStatusHUD:(BOOL)a3;
- (void)setEnableMetadataSearch:(BOOL)a3;
- (void)setEnableMonthHeroPromotion:(BOOL)a3;
- (void)setEnableMonthLocationTitles:(BOOL)a3;
- (void)setEnableNavigationBarBlur:(BOOL)a3;
- (void)setEnableNavigationBarBlurInCollections:(BOOL)a3;
- (void)setEnableNewDetailsView:(BOOL)a3;
- (void)setEnableNextTokenSuggestions:(BOOL)a3;
- (void)setEnablePhotosChallenge:(BOOL)a3;
- (void)setEnablePhototypes:(BOOL)a3;
- (void)setEnablePreviewCaching:(BOOL)a3;
- (void)setEnablePreviewKeyAsset:(BOOL)a3;
- (void)setEnablePreviewSharing:(BOOL)a3;
- (void)setEnableProtoBanner:(BOOL)a3;
- (void)setEnableQueryUnderstanding:(BOOL)a3;
- (void)setEnableRadarButton:(BOOL)a3;
- (void)setEnableRecentlyEditedCollection:(BOOL)a3;
- (void)setEnableRecentlySharedCollection:(BOOL)a3;
- (void)setEnableRecentlyViewedCollection:(BOOL)a3;
- (void)setEnableResponsiveScrolling:(BOOL)a3;
- (void)setEnableSavedToday:(BOOL)a3;
- (void)setEnableSearchResultDiffAnimation:(BOOL)a3;
- (void)setEnableShelfDrawBorders:(BOOL)a3;
- (void)setEnableShelfIPadLayout:(BOOL)a3;
- (void)setEnableShelves:(BOOL)a3;
- (void)setEnableShelvesLoader:(BOOL)a3;
- (void)setEnableShelvesLoaderGradualDelivery:(BOOL)a3;
- (void)setEnableSidebarHeaderSelection:(BOOL)a3;
- (void)setEnableStackCounting:(BOOL)a3;
- (void)setEnableUserSmartAlbums:(BOOL)a3;
- (void)setEnableUtilityPrototypeCollections:(BOOL)a3;
- (void)setEnableZKWForPad:(BOOL)a3;
- (void)setEnabledShelvesLazyVStack:(BOOL)a3;
- (void)setEventFilterType:(int64_t)a3;
- (void)setEventsAlgorithm:(int64_t)a3;
- (void)setEventsCellItemAspectRatio:(double)a3;
- (void)setEventsExtendedCountThreshold:(int)a3;
- (void)setEventsPromotionScoreThreshold:(double)a3;
- (void)setEventsSummaryCountThreshold:(int)a3;
- (void)setForceDarkDetailsView:(BOOL)a3;
- (void)setForceHideProcessingUI:(BOOL)a3;
- (void)setForceRenderingStatus:(BOOL)a3;
- (void)setForceShowProcessingUI:(BOOL)a3;
- (void)setHideInlinePlayerOnFirstSegment:(BOOL)a3;
- (void)setHideNotifications:(BOOL)a3;
- (void)setHorizontalPagingHintMaximumOvershoot:(double)a3;
- (void)setHorizontalPagingHintMaximumScale:(double)a3;
- (void)setHorizontalPagingTechnique:(int64_t)a3;
- (void)setImplicitSearchScopeForPickerSuggestionScopeSearch:(BOOL)a3;
- (void)setIncludeSharedAlbumsActivityInProfileNotifications:(BOOL)a3;
- (void)setInlinePlaybackMaxConcurrentPlayers:(int64_t)a3;
- (void)setInlinePlaybackMaxPreloadPlayers:(int64_t)a3;
- (void)setInlinePlaybackMaxSupportedVisiblePlayers:(int64_t)a3;
- (void)setInlinePlaybackOnHoverPlaybackDelay:(double)a3;
- (void)setInlinePlaybackSimulateMainPresenterDisappearanceOnDismissal:(BOOL)a3;
- (void)setInlinePlaybackVisibilityThreshold:(double)a3;
- (void)setInlinePlayerCoveredDurationForPause:(double)a3;
- (void)setInlinePlayerFirstSegmentPlaceholderDuration:(double)a3;
- (void)setInlinePlayerFrameLatencyApproximation:(double)a3;
- (void)setInlinePlayerPlaceholderKenBurnsExtraDuration:(double)a3;
- (void)setInlinePlayerPlaceholderKenBurnsScale:(double)a3;
- (void)setLimitFullPageScreenshotScale:(BOOL)a3;
- (void)setLimitFullPageScreenshotSize:(BOOL)a3;
- (void)setLowQualityAggregationPromotionScoreThreshold:(double)a3;
- (void)setMapLensAnchorFocusKilometerRadius:(double)a3;
- (void)setMapTabInitialKilometerRadius:(double)a3;
- (void)setMapTileInitialKilometerDiameter:(double)a3;
- (void)setMaxCuratedCollectionsPerType:(int64_t)a3;
- (void)setMaxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications:(unint64_t)a3;
- (void)setMaxNumberOfMainViewUnreadSharedAlbumsActivityNotifications:(unint64_t)a3;
- (void)setMaxNumberOfSharedAlbumActivityItemsToShow:(int64_t)a3;
- (void)setMaxRankedAssetSearchResults:(int64_t)a3;
- (void)setMaxSearchResults:(int64_t)a3;
- (void)setMaxSearchSuggestions:(int64_t)a3;
- (void)setMaximumFullPageScreenshotDimension:(double)a3;
- (void)setMaximumNumberOfAssetsForPlaybackAsMemory:(int64_t)a3;
- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3;
- (void)setMinQueryLengthForFullRanking:(int64_t)a3;
- (void)setMinimumCuratedLibraryVisibleFractionForExpansion:(double)a3;
- (void)setMinimumNumberOfAssetsForPlaybackAsMemory:(int64_t)a3;
- (void)setMovieCurationAffordance:(int64_t)a3;
- (void)setNavigationBarAnimationDuration:(double)a3;
- (void)setNavigationBarBlurDistanceToBaseline:(double)a3;
- (void)setNavigationBarBlurLegibilityEDRBoost:(double)a3;
- (void)setNavigationBarBlurRadius:(double)a3;
- (void)setNavigationBarLegibilityEDRBoost:(double)a3;
- (void)setNavigationBarTintCurve:(int64_t)a3;
- (void)setNavigationBarTintOpacity:(double)a3;
- (void)setNavigationBarTitleAppearDelay:(double)a3;
- (void)setNavigationBarTitleAppearDuration:(double)a3;
- (void)setNavigationBarTitleDisappearDuration:(double)a3;
- (void)setOneUpSettings:(id)a3;
- (void)setOnlyDismissedInProfile:(BOOL)a3;
- (void)setOpacityOfPlayerOnFirstSegment:(double)a3;
- (void)setOverrideSuggestionPills:(BOOL)a3;
- (void)setPreferNewPlayerForFeeds:(BOOL)a3;
- (void)setPresentZoomableGridFromMapCluster:(BOOL)a3;
- (void)setProfileButtonShapeOutset:(double)a3;
- (void)setResetAllPhotosOnDismiss:(BOOL)a3;
- (void)setSavedTodayToleranceInHours:(double)a3;
- (void)setScrollThresholdForTopCenteredTitle:(double)a3;
- (void)setScrubberKind:(int64_t)a3;
- (void)setSearchButtonShapeOutset:(double)a3;
- (void)setSearchQueryTimeout:(double)a3;
- (void)setSectionedFeedTabBarItemSpacing:(double)a3;
- (void)setSelectButtonShapeOutset:(double)a3;
- (void)setSharedWithYouOnlyFilterIncludesUnsaved:(BOOL)a3;
- (void)setShelfSpacing:(double)a3;
- (void)setShouldRemoveFilteredEventsFromUI:(BOOL)a3;
- (void)setShouldUsePhotosIntelligenceSPIForUtilities:(BOOL)a3;
- (void)setShowSearchDebugBadges:(BOOL)a3;
- (void)setShowSharedLibraryPill:(BOOL)a3;
- (void)setSimulateDetailsViewLeaking:(BOOL)a3;
- (void)setSimulateEmptyShelves:(BOOL)a3;
- (void)setSimulateFromMyMacAlbums:(BOOL)a3;
- (void)setSimulatedDetailsViewLoadingDelay:(double)a3;
- (void)setSimulatedPreviewPlayerDelay:(double)a3;
- (void)setTitleOverlayDetachingDistance:(double)a3;
- (void)setTitleOverlayScaleAtTop:(double)a3;
- (void)setTitleOverlayScaleDistance:(double)a3;
- (void)setTitleOverlaySingleLineTopDetentTolerance:(double)a3;
- (void)setTitleOverlayTopDetentTolerance:(double)a3;
- (void)setTitleOverlayVerticalOffsetAtTop:(double)a3;
- (void)setTopCenteredTitleVerticalOffset:(double)a3;
- (void)setTopTitleVerticalSpace:(double)a3;
- (void)setTripsSource:(int64_t)a3;
- (void)setUseFeatureAvailabilityReporter:(BOOL)a3;
- (void)setWallpaperLoadingArtificialDelay:(double)a3;
- (void)setWallpaperLoadingTimeout:(double)a3;
- (void)setYearsAndMonthsMode:(int64_t)a3;
@end

@implementation PXLemonadeSettings

- (BOOL)allowProfileIcon
{
  return self->_allowProfileIcon;
}

- (double)shelfSpacing
{
  return self->_shelfSpacing;
}

- (BOOL)enableNavigationBarBlur
{
  return self->_enableNavigationBarBlur;
}

- (double)navigationBarTintOpacity
{
  return self->_navigationBarTintOpacity;
}

- (int64_t)navigationBarTintCurve
{
  return self->_navigationBarTintCurve;
}

- (double)navigationBarBlurDistanceToBaseline
{
  return self->_navigationBarBlurDistanceToBaseline;
}

- (double)selectButtonShapeOutset
{
  return self->_selectButtonShapeOutset;
}

- (BOOL)showSharedLibraryPill
{
  return self->_showSharedLibraryPill;
}

- (double)profileButtonShapeOutset
{
  return self->_profileButtonShapeOutset;
}

- (double)curatedLibraryTransitionShelfHeaderBlurRadius
{
  return self->_curatedLibraryTransitionShelfHeaderBlurRadius;
}

+ (PXLemonadeSettings)sharedInstance
{
  if (sharedInstance_onceToken_140892 != -1) {
    dispatch_once(&sharedInstance_onceToken_140892, &__block_literal_global_140893);
  }
  v2 = (void *)sharedInstance_sharedInstance_140894;
  return (PXLemonadeSettings *)v2;
}

- (BOOL)enableShelfDrawBorders
{
  return self->_enableShelfDrawBorders;
}

- (BOOL)enableEventsCellCollageStyle
{
  return self->_enableEventsCellCollageStyle;
}

- (double)defaultFloatingToolbarBottomInset
{
  return self->_defaultFloatingToolbarBottomInset;
}

- (double)eventsCellItemAspectRatio
{
  return self->_eventsCellItemAspectRatio;
}

- (double)curatedLibraryBottomPadding
{
  return self->_curatedLibraryBottomPadding;
}

- (BOOL)enableShelvesLoader
{
  return self->_enableShelvesLoader;
}

- (BOOL)simulateEmptyShelves
{
  return self->_simulateEmptyShelves;
}

- (double)savedTodayToleranceInHours
{
  return self->_savedTodayToleranceInHours;
}

- (BOOL)enableCuratedLibrary
{
  return self->_enableCuratedLibrary;
}

- (double)wallpaperLoadingTimeout
{
  return self->_wallpaperLoadingTimeout;
}

- (double)wallpaperLoadingArtificialDelay
{
  return self->_wallpaperLoadingArtificialDelay;
}

- (BOOL)shouldRemoveFilteredEventsFromUI
{
  return self->_shouldRemoveFilteredEventsFromUI;
}

- (double)searchButtonShapeOutset
{
  return self->_searchButtonShapeOutset;
}

- (BOOL)onlyDismissedInProfile
{
  return self->_onlyDismissedInProfile;
}

- (double)navigationBarBlurRadius
{
  return self->_navigationBarBlurRadius;
}

- (double)navigationBarBlurLegibilityEDRBoost
{
  return self->_navigationBarBlurLegibilityEDRBoost;
}

- (double)navigationBarAnimationDuration
{
  return self->_navigationBarAnimationDuration;
}

- (unint64_t)maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications
{
  return self->_maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications;
}

- (unint64_t)maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications
{
  return self->_maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications;
}

- (double)mapTileInitialKilometerDiameter
{
  return self->_mapTileInitialKilometerDiameter;
}

- (double)inlinePlaybackVisibilityThreshold
{
  return self->_inlinePlaybackVisibilityThreshold;
}

- (double)inlinePlaybackOnHoverPlaybackDelay
{
  return self->_inlinePlaybackOnHoverPlaybackDelay;
}

- (int64_t)inlinePlaybackMaxSupportedVisiblePlayers
{
  return self->_inlinePlaybackMaxSupportedVisiblePlayers;
}

- (int64_t)inlinePlaybackMaxPreloadPlayers
{
  return self->_inlinePlaybackMaxPreloadPlayers;
}

- (int64_t)inlinePlaybackMaxConcurrentPlayers
{
  return self->_inlinePlaybackMaxConcurrentPlayers;
}

- (BOOL)includeSharedAlbumsActivityInProfileNotifications
{
  return self->_includeSharedAlbumsActivityInProfileNotifications;
}

- (int)eventsExtendedCountThreshold
{
  return self->_eventsExtendedCountThreshold;
}

- (int64_t)eventFilterType
{
  return self->_eventFilterType;
}

- (BOOL)enabledShelvesLazyVStack
{
  return self->_enabledShelvesLazyVStack;
}

- (BOOL)enableUserSmartAlbums
{
  return self->_enableUserSmartAlbums;
}

- (BOOL)enableShelves
{
  return self->_enableShelves;
}

- (BOOL)enableSavedToday
{
  return self->_enableSavedToday;
}

- (BOOL)enablePhototypes
{
  return self->_enablePhototypes;
}

- (BOOL)enableNavigationBarBlurInCollections
{
  return self->_enableNavigationBarBlurInCollections;
}

- (BOOL)enableInlinePlaybackOnHover
{
  return self->_enableInlinePlaybackOnHover;
}

- (BOOL)enableInlinePlaybackDebugHUD
{
  return self->_enableInlinePlaybackDebugHUD;
}

- (unint64_t)defaultPhoneFeedNavigationType
{
  return self->_defaultPhoneFeedNavigationType;
}

- (BOOL)enableMonthLocationTitles
{
  return self->_enableMonthLocationTitles;
}

- (BOOL)enableShelvesLoaderGradualDelivery
{
  return self->_enableShelvesLoaderGradualDelivery;
}

- (BOOL)hideNotifications
{
  return self->_hideNotifications;
}

- (BOOL)enableLoadingStatusHUD
{
  return self->_enableLoadingStatusHUD;
}

- (double)curatedLibraryTransitionToolbarBlurRadius
{
  return self->_curatedLibraryTransitionToolbarBlurRadius;
}

- (int64_t)aggregatedHighlightColumns
{
  return self->_aggregatedHighlightColumns;
}

- (BOOL)enableCubeMode
{
  return self->_enableCubeMode;
}

- (BOOL)forceDarkDetailsView
{
  return self->_forceDarkDetailsView;
}

- (void)createChildren
{
  v3 = [(PTSettings *)[PXLemonadeOneUpSettings alloc] initWithDefaultValues];
  [(PXLemonadeSettings *)self setOneUpSettings:v3];
}

- (void)setOneUpSettings:(id)a3
{
}

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)PXLemonadeSettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(PXLemonadeSettings *)self setProfileButtonShapeOutset:4.0];
  [(PXLemonadeSettings *)self setSearchButtonShapeOutset:4.0];
  [(PXLemonadeSettings *)self setSelectButtonShapeOutset:4.0];
  [(PXLemonadeSettings *)self setNavigationBarLegibilityEDRBoost:0.125];
  [(PXLemonadeSettings *)self setEnableNavigationBarBlur:1];
  [(PXLemonadeSettings *)self setEnableNavigationBarBlurInCollections:1];
  [(PXLemonadeSettings *)self setNavigationBarBlurLegibilityEDRBoost:0.25];
  [(PXLemonadeSettings *)self setNavigationBarBlurRadius:1.5];
  [(PXLemonadeSettings *)self setNavigationBarBlurDistanceToBaseline:90.0];
  [(PXLemonadeSettings *)self setNavigationBarTintCurve:4];
  [(PXLemonadeSettings *)self setNavigationBarTintOpacity:0.6];
  [(PXLemonadeSettings *)self setAllowProfileIcon:1];
  [(PXLemonadeSettings *)self setNavigationBarAnimationDuration:0.3];
  [(PXLemonadeSettings *)self setNavigationBarTitleAppearDuration:0.45];
  [(PXLemonadeSettings *)self setNavigationBarTitleAppearDelay:0.05];
  [(PXLemonadeSettings *)self setNavigationBarTitleDisappearDuration:0.2];
  [(PXLemonadeSettings *)self setDefaultPhoneFeedNavigationType:1];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackMemories:1];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackTrips:1];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackTripsShelf:1];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackEvents:0];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackSocialGroupShelf:1];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackSocialGroupFeed:1];
  [(PXLemonadeSettings *)self setHideInlinePlayerOnFirstSegment:1];
  [(PXLemonadeSettings *)self setOpacityOfPlayerOnFirstSegment:0.0];
  [(PXLemonadeSettings *)self setInlinePlayerFirstSegmentPlaceholderDuration:2.0];
  [(PXLemonadeSettings *)self setInlinePlayerFrameLatencyApproximation:0.2];
  [(PXLemonadeSettings *)self setInlinePlayerPlaceholderKenBurnsScale:1.08];
  [(PXLemonadeSettings *)self setInlinePlayerPlaceholderKenBurnsExtraDuration:1.0];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackOnHover:1];
  [(PXLemonadeSettings *)self setInlinePlaybackOnHoverPlaybackDelay:0.75];
  [(PXLemonadeSettings *)self setAlwaysFilterPlaceholder:0];
  [(PXLemonadeSettings *)self setInlinePlaybackMaxConcurrentPlayers:1];
  [(PXLemonadeSettings *)self setInlinePlaybackMaxPreloadPlayers:1];
  [(PXLemonadeSettings *)self setInlinePlaybackMaxSupportedVisiblePlayers:30];
  [(PXLemonadeSettings *)self setEnableInlinePlaybackDebugHUD:0];
  [(PXLemonadeSettings *)self setInlinePlaybackSimulateMainPresenterDisappearanceOnDismissal:0];
  [(PXLemonadeSettings *)self setInlinePlaybackVisibilityThreshold:0.75];
  [(PXLemonadeSettings *)self setInlinePlayerCoveredDurationForPause:1.0];
  [(PXLemonadeSettings *)self setPreferNewPlayerForFeeds:0];
  [(PXLemonadeSettings *)self setShouldUsePhotosIntelligenceSPIForUtilities:0];
  [(PXLemonadeSettings *)self setMaxNumberOfSharedAlbumActivityItemsToShow:8];
  [(PXLemonadeSettings *)self setEnableCollectionsSortButton:1];
  [(PXLemonadeSettings *)self setEnableUserSmartAlbums:0];
  [(PXLemonadeSettings *)self setEnableLargeThumbnailAlbumCellStyle:0];
  [(PXLemonadeSettings *)self setEventsAlgorithm:10];
  [(PXLemonadeSettings *)self setEnableEventsCellCollageStyle:0];
  [(PXLemonadeSettings *)self setEventsCellItemAspectRatio:1.17];
  [(PXLemonadeSettings *)self setShouldRemoveFilteredEventsFromUI:1];
  [(PXLemonadeSettings *)self setEventFilterType:1];
  [(PXLemonadeSettings *)self setEventsPromotionScoreThreshold:0.45];
  [(PXLemonadeSettings *)self setEventsExtendedCountThreshold:4];
  [(PXLemonadeSettings *)self setEventsSummaryCountThreshold:3];
  [(PXLemonadeSettings *)self setEnableEventsDebugOverlay:0];
  [(PXLemonadeSettings *)self setEnableSavedToday:1];
  [(PXLemonadeSettings *)self setSavedTodayToleranceInHours:2.0];
  [(PXLemonadeSettings *)self setTripsSource:1];
  [(PXLemonadeSettings *)self setEnableNewDetailsView:1];
  [(PXLemonadeSettings *)self setForceDarkDetailsView:0];
  [(PXLemonadeSettings *)self setEnablePreviewSharing:1];
  [(PXLemonadeSettings *)self setEnablePreviewCaching:0];
  [(PXLemonadeSettings *)self setEnablePreviewKeyAsset:1];
  [(PXLemonadeSettings *)self setSimulateDetailsViewLeaking:0];
  [(PXLemonadeSettings *)self setSimulatedDetailsViewLoadingDelay:0.0];
  [(PXLemonadeSettings *)self setSimulatedPreviewPlayerDelay:0.0];
  [(PXLemonadeSettings *)self setScrubberKind:0];
  [(PXLemonadeSettings *)self setEnableDetailsViewHorizontalKeyboardScrolling:0];
  [(PXLemonadeSettings *)self setEnableDetailsViewHorizontalPaging:1];
  [(PXLemonadeSettings *)self setHorizontalPagingTechnique:0];
  [(PXLemonadeSettings *)self setEnableHorizontalPagingHint:1];
  [(PXLemonadeSettings *)self setHorizontalPagingHintMaximumScale:0.22];
  [(PXLemonadeSettings *)self setHorizontalPagingHintMaximumOvershoot:600.0];
  [(PXLemonadeSettings *)self setEnableAggregatedHighlightGridInEditorial:0];
  [(PXLemonadeSettings *)self setAggregatedHighlightColumns:3];
  [(PXLemonadeSettings *)self setLowQualityAggregationPromotionScoreThreshold:0.35];
  [(PXLemonadeSettings *)self setDetailsViewHeaderAspectRatio:0.84];
  [(PXLemonadeSettings *)self setEnableFocusMapLensOnAnchors:1];
  [(PXLemonadeSettings *)self setMapLensAnchorFocusKilometerRadius:0.5];
  [(PXLemonadeSettings *)self setEnableDetailsSummaryButton:0];
  [(PXLemonadeSettings *)self setEnableDetailsViewPrototype:0];
  [(PXLemonadeSettings *)self setEnableDynamicHeader:1];
  [(PXLemonadeSettings *)self setDynamicHeaderChromeHidingDelay:2.0];
  [(PXLemonadeSettings *)self setDynamicHeaderDebugOverlay:0];
  [(PXLemonadeSettings *)self setDynamicHeaderDebugBehavior:0];
  [(PXLemonadeSettings *)self setDynamicHeaderMaximumDelayFromPreview:2.0];
  [(PXLemonadeSettings *)self setDynamicHeaderMaximumDelayFromMovie:0.3];
  [(PXLemonadeSettings *)self setDynamicHeaderDismissAreaBottomInset:0.0];
  [(PXLemonadeSettings *)self setDetailsDismissArea:1];
  [(PXLemonadeSettings *)self setEnableProtoBanner:0];
  [(PXLemonadeSettings *)self setTopTitleVerticalSpace:123.0];
  [(PXLemonadeSettings *)self setTitleOverlayScaleAtTop:0.75];
  [(PXLemonadeSettings *)self setTitleOverlayVerticalOffsetAtTop:6.0];
  [(PXLemonadeSettings *)self setBannerTopMargin:10.0];
  [(PXLemonadeSettings *)self setTitleOverlayScaleDistance:150.0];
  [(PXLemonadeSettings *)self setTitleOverlayDetachingDistance:150.0];
  [(PXLemonadeSettings *)self setTitleOverlayTopDetentTolerance:3.0];
  [(PXLemonadeSettings *)self setTitleOverlaySingleLineTopDetentTolerance:34.0];
  [(PXLemonadeSettings *)self setMovieCurationAffordance:1];
  [(PXLemonadeSettings *)self setAlwaysEnterDetailsViewInFullscreenPlayback:0];
  [(PXLemonadeSettings *)self setScrollThresholdForTopCenteredTitle:20.0];
  [(PXLemonadeSettings *)self setTopCenteredTitleVerticalOffset:2.0];
  [(PXLemonadeSettings *)self setMapTabInitialKilometerRadius:100.0];
  [(PXLemonadeSettings *)self setMapTileInitialKilometerDiameter:self->_mapTabInitialKilometerRadius * 1000.0];
  [(PXLemonadeSettings *)self setPresentZoomableGridFromMapCluster:1];
  [(PXLemonadeSettings *)self setEnableUtilityPrototypeCollections:0];
  [(PXLemonadeSettings *)self setEnableRecentlySharedCollection:1];
  [(PXLemonadeSettings *)self setEnableRecentlyViewedCollection:1];
  [(PXLemonadeSettings *)self setEnableRecentlyEditedCollection:1];
  [(PXLemonadeSettings *)self setEnableDocumentsSection:1];
  [(PXLemonadeSettings *)self setMaximumNumberOfAssetsForPlaybackAsMemory:500];
  [(PXLemonadeSettings *)self setMinimumNumberOfAssetsForPlaybackAsMemory:4];
  [(PXLemonadeSettings *)self setEnableCuratedLibrary:1];
  [(PXLemonadeSettings *)self setEnableCubeMode:0];
  [(PXLemonadeSettings *)self setEnableRadarButton:1];
  [(PXLemonadeSettings *)self setEnableMonthLocationTitles:0];
  [(PXLemonadeSettings *)self setEnableMonthHeroPromotion:0];
  [(PXLemonadeSettings *)self setShowSharedLibraryPill:0];
  [(PXLemonadeSettings *)self setSharedWithYouOnlyFilterIncludesUnsaved:0];
  [(PXLemonadeSettings *)self setResetAllPhotosOnDismiss:1];
  [(PXLemonadeSettings *)self setMinimumCuratedLibraryVisibleFractionForExpansion:0.25];
  [(PXLemonadeSettings *)self setYearsAndMonthsMode:2];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] != 0;

  [(PXLemonadeSettings *)self setCollectionPreviewTransition:v4];
  [(PXLemonadeSettings *)self setEnableKenBurnsInCollectionPreview:1];
  [(PXLemonadeSettings *)self setCollectionPreviewKenBurnsScaleDirection:2];
  [(PXLemonadeSettings *)self setCuratedLibraryExpansionGestureSpringStiffness:150.0];
  [(PXLemonadeSettings *)self setCuratedLibraryExpansionToggleSpringStiffness:110.0];
  [(PXLemonadeSettings *)self setCuratedLibraryExpansionFastToggleSpringStiffness:250.0];
  [(PXLemonadeSettings *)self setCuratedLibraryChromeAutoAnimateSpringStiffness:50.0];
  [(PXLemonadeSettings *)self setCuratedLibraryExpansionMinScrollDistance:100.0];
  [(PXLemonadeSettings *)self setCuratedLibraryCollapseMinScrollDistance:100.0];
  [(PXLemonadeSettings *)self setCuratedLibraryBottomPadding:22.0];
  [(PXLemonadeSettings *)self setCuratedLibraryTransitionToolbarBlurRadius:20.0];
  [(PXLemonadeSettings *)self setCuratedLibraryTransitionShelfHeaderBlurRadius:5.0];
  [(PXLemonadeSettings *)self setCuratedLibraryTransitionChromeExpandPercentage:0.85];
  [(PXLemonadeSettings *)self setCuratedLibraryTransitionChromeCollapsePercentage:1.0];
  [(PXLemonadeSettings *)self setEnableSearchResultDiffAnimation:0];
  [(PXLemonadeSettings *)self setEnableMetadataSearch:1];
  [(PXLemonadeSettings *)self setEnableEmbeddingSearch:_os_feature_enabled_impl()];
  [(PXLemonadeSettings *)self setMaxRankedAssetSearchResults:13];
  [(PXLemonadeSettings *)self setMaxSearchSuggestions:4];
  [(PXLemonadeSettings *)self setMinQueryLengthForFullRanking:0];
  [(PXLemonadeSettings *)self setMaxCuratedCollectionsPerType:2];
  [(PXLemonadeSettings *)self setEnableZKWForPad:1];
  [(PXLemonadeSettings *)self setOverrideSuggestionPills:0];
  [(PXLemonadeSettings *)self setShowSearchDebugBadges:0];
  [(PXLemonadeSettings *)self setImplicitSearchScopeForPickerSuggestionScopeSearch:1];
  [(PXLemonadeSettings *)self setEnableExactMatchResults:0];
  [(PXLemonadeSettings *)self setEnableHybridMatchResults:1];
  [(PXLemonadeSettings *)self setMinNumberOfResultsForNextTokenGeneration:*MEMORY[0x1E4F39820]];
  [(PXLemonadeSettings *)self setSearchQueryTimeout:*MEMORY[0x1E4F39828]];
  [(PXLemonadeSettings *)self setEnableEmbeddingOnlyResultsInExactMatches:1];
  [(PXLemonadeSettings *)self setEnableFullPageScreenshots:0];
  [(PXLemonadeSettings *)self setEnableFullPageScreenshotDebuggingOverlays:0];
  [(PXLemonadeSettings *)self setLimitFullPageScreenshotScale:0];
  [(PXLemonadeSettings *)self setLimitFullPageScreenshotSize:1];
  [(PXLemonadeSettings *)self setMaximumFullPageScreenshotDimension:10000.0];
  [(PXLemonadeSettings *)self setEnableStackCounting:0];
  [(PXLemonadeSettings *)self setEnablePhotosChallenge:1];
  [(PXLemonadeSettings *)self setEnableShelfIPadLayout:1];
  [(PXLemonadeSettings *)self setEnableShelfDrawBorders:0];
  [(PXLemonadeSettings *)self setShelfSpacing:36.0];
  [(PXLemonadeSettings *)self setEnableSidebarHeaderSelection:1];
  [(PXLemonadeSettings *)self setEnableDismissPersistence:0];
  [(PXLemonadeSettings *)self setOnlyDismissedInProfile:1];
  [(PXLemonadeSettings *)self setIncludeSharedAlbumsActivityInProfileNotifications:1];
  [(PXLemonadeSettings *)self setHideNotifications:0];
  [(PXLemonadeSettings *)self setMaxNumberOfMainViewUnreadSharedAlbumsActivityNotifications:1];
  [(PXLemonadeSettings *)self setMaxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications:5];
  [(PXLemonadeSettings *)self setWallpaperLoadingTimeout:5.0];
  [(PXLemonadeSettings *)self setWallpaperLoadingArtificialDelay:0.0];
  [(PXLemonadeSettings *)self setForceShowProcessingUI:0];
  [(PXLemonadeSettings *)self setForceHideProcessingUI:0];
  [(PXLemonadeSettings *)self setForceRenderingStatus:0];
  [(PXLemonadeSettings *)self setUseFeatureAvailabilityReporter:0];
  [(PXLemonadeSettings *)self setSectionedFeedTabBarItemSpacing:8.0];
  [(PXLemonadeSettings *)self setDefaultFloatingToolbarBottomInset:20.0];
  [(PXLemonadeSettings *)self setEnableShelves:1];
  [(PXLemonadeSettings *)self setEnableShelvesLoader:1];
  [(PXLemonadeSettings *)self setEnableShelvesLoaderGradualDelivery:1];
  [(PXLemonadeSettings *)self setEnabledShelvesLazyVStack:0];
  [(PXLemonadeSettings *)self setEnableResponsiveScrolling:1];
  [(PXLemonadeSettings *)self setEnableLoadingStatusHUD:0];
  [(PXLemonadeSettings *)self setSimulateEmptyShelves:0];
  [(PXLemonadeSettings *)self setSimulateFromMyMacAlbums:0];
  [(PXLemonadeSettings *)self setEnablePhototypes:0];
}

- (void)setYearsAndMonthsMode:(int64_t)a3
{
  self->_yearsAndMonthsMode = a3;
}

- (void)setWallpaperLoadingTimeout:(double)a3
{
  self->_wallpaperLoadingTimeout = a3;
}

- (void)setWallpaperLoadingArtificialDelay:(double)a3
{
  self->_wallpaperLoadingArtificialDelay = a3;
}

- (void)setUseFeatureAvailabilityReporter:(BOOL)a3
{
  self->_useFeatureAvailabilityReporter = a3;
}

- (void)setTripsSource:(int64_t)a3
{
  self->_tripsSource = a3;
}

- (void)setTopTitleVerticalSpace:(double)a3
{
  self->_topTitleVerticalSpace = a3;
}

- (void)setTitleOverlayVerticalOffsetAtTop:(double)a3
{
  self->_titleOverlayVerticalOffsetAtTop = a3;
}

- (void)setTitleOverlayTopDetentTolerance:(double)a3
{
  self->_titleOverlayTopDetentTolerance = a3;
}

- (void)setTitleOverlaySingleLineTopDetentTolerance:(double)a3
{
  self->_titleOverlaySingleLineTopDetentTolerance = a3;
}

- (void)setTitleOverlayScaleDistance:(double)a3
{
  self->_titleOverlayScaleDistance = a3;
}

- (void)setTitleOverlayScaleAtTop:(double)a3
{
  self->_titleOverlayScaleAtTop = a3;
}

- (void)setTitleOverlayDetachingDistance:(double)a3
{
  self->_titleOverlayDetachingDistance = a3;
}

- (void)setSimulatedPreviewPlayerDelay:(double)a3
{
  self->_simulatedPreviewPlayerDelay = a3;
}

- (void)setSimulatedDetailsViewLoadingDelay:(double)a3
{
  self->_simulatedDetailsViewLoadingDelay = a3;
}

- (void)setSimulateEmptyShelves:(BOOL)a3
{
  self->_simulateEmptyShelves = a3;
}

- (void)setSimulateDetailsViewLeaking:(BOOL)a3
{
  self->_simulateDetailsViewLeaking = a3;
}

- (void)setShowSharedLibraryPill:(BOOL)a3
{
  self->_showSharedLibraryPill = a3;
}

- (void)setShowSearchDebugBadges:(BOOL)a3
{
  self->_showSearchDebugBadges = a3;
}

- (void)setShouldUsePhotosIntelligenceSPIForUtilities:(BOOL)a3
{
  self->_shouldUsePhotosIntelligenceSPIForUtilities = a3;
}

- (void)setShouldRemoveFilteredEventsFromUI:(BOOL)a3
{
  self->_shouldRemoveFilteredEventsFromUI = a3;
}

- (void)setShelfSpacing:(double)a3
{
  self->_shelfSpacing = a3;
}

- (void)setSharedWithYouOnlyFilterIncludesUnsaved:(BOOL)a3
{
  self->_sharedWithYouOnlyFilterIncludesUnsaved = a3;
}

- (void)setSelectButtonShapeOutset:(double)a3
{
  self->_selectButtonShapeOutset = a3;
}

- (void)setSectionedFeedTabBarItemSpacing:(double)a3
{
  self->_sectionedFeedTabBarItemSpacing = a3;
}

- (void)setSearchQueryTimeout:(double)a3
{
  self->_searchQueryTimeout = a3;
}

- (void)setSearchButtonShapeOutset:(double)a3
{
  self->_searchButtonShapeOutset = a3;
}

- (void)setScrubberKind:(int64_t)a3
{
  self->_scrubberKind = a3;
}

- (void)setSavedTodayToleranceInHours:(double)a3
{
  self->_savedTodayToleranceInHours = a3;
}

- (void)setResetAllPhotosOnDismiss:(BOOL)a3
{
  self->_resetAllPhotosOnDismiss = a3;
}

- (void)setProfileButtonShapeOutset:(double)a3
{
  self->_profileButtonShapeOutset = a3;
}

- (void)setPresentZoomableGridFromMapCluster:(BOOL)a3
{
  self->_presentZoomableGridFromMapCluster = a3;
}

- (void)setPreferNewPlayerForFeeds:(BOOL)a3
{
  self->_preferNewPlayerForFeeds = a3;
}

- (void)setOverrideSuggestionPills:(BOOL)a3
{
  self->_overrideSuggestionPills = a3;
}

- (void)setOpacityOfPlayerOnFirstSegment:(double)a3
{
  self->_opacityOfPlayerOnFirstSegment = a3;
}

- (void)setOnlyDismissedInProfile:(BOOL)a3
{
  self->_onlyDismissedInProfile = a3;
}

- (void)setNavigationBarTitleDisappearDuration:(double)a3
{
  self->_navigationBarTitleDisappearDuration = a3;
}

- (void)setNavigationBarTitleAppearDuration:(double)a3
{
  self->_navigationBarTitleAppearDuration = a3;
}

- (void)setNavigationBarTitleAppearDelay:(double)a3
{
  self->_navigationBarTitleAppearDelay = a3;
}

- (void)setNavigationBarTintOpacity:(double)a3
{
  self->_navigationBarTintOpacity = a3;
}

- (void)setNavigationBarTintCurve:(int64_t)a3
{
  self->_navigationBarTintCurve = a3;
}

- (void)setNavigationBarLegibilityEDRBoost:(double)a3
{
  self->_navigationBarLegibilityEDRBoost = a3;
}

- (void)setNavigationBarBlurRadius:(double)a3
{
  self->_navigationBarBlurRadius = a3;
}

- (void)setNavigationBarBlurLegibilityEDRBoost:(double)a3
{
  self->_navigationBarBlurLegibilityEDRBoost = a3;
}

- (void)setNavigationBarBlurDistanceToBaseline:(double)a3
{
  self->_navigationBarBlurDistanceToBaseline = a3;
}

- (void)setNavigationBarAnimationDuration:(double)a3
{
  self->_navigationBarAnimationDuration = a3;
}

- (void)setMovieCurationAffordance:(int64_t)a3
{
  self->_movieCurationAffordance = a3;
}

- (void)setMinimumNumberOfAssetsForPlaybackAsMemory:(int64_t)a3
{
  self->_minimumNumberOfAssetsForPlaybackAsMemory = a3;
}

- (void)setMinimumCuratedLibraryVisibleFractionForExpansion:(double)a3
{
  self->_minimumCuratedLibraryVisibleFractionForExpansion = a3;
}

- (void)setMinQueryLengthForFullRanking:(int64_t)a3
{
  self->_minQueryLengthForFullRanking = a3;
}

- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3
{
  self->_minNumberOfResultsForNextTokenGeneration = a3;
}

- (void)setMaximumNumberOfAssetsForPlaybackAsMemory:(int64_t)a3
{
  self->_maximumNumberOfAssetsForPlaybackAsMemory = a3;
}

- (void)setMaximumFullPageScreenshotDimension:(double)a3
{
  self->_maximumFullPageScreenshotDimension = a3;
}

- (void)setMaxSearchSuggestions:(int64_t)a3
{
  self->_maxSearchSuggestions = a3;
}

- (void)setMaxRankedAssetSearchResults:(int64_t)a3
{
  self->_maxRankedAssetSearchResults = a3;
}

- (void)setMaxNumberOfSharedAlbumActivityItemsToShow:(int64_t)a3
{
  self->_maxNumberOfSharedAlbumActivityItemsToShow = a3;
}

- (void)setMaxNumberOfMainViewUnreadSharedAlbumsActivityNotifications:(unint64_t)a3
{
  self->_maxNumberOfMainViewUnreadSharedAlbumsActivityNotifications = a3;
}

- (void)setMaxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications:(unint64_t)a3
{
  self->_maxNumberOfAccountViewUnreadSharedAlbumsActivityNotifications = a3;
}

- (void)setMaxCuratedCollectionsPerType:(int64_t)a3
{
  self->_maxCuratedCollectionsPerType = a3;
}

- (void)setMapTileInitialKilometerDiameter:(double)a3
{
  self->_mapTileInitialKilometerDiameter = a3;
}

- (void)setMapTabInitialKilometerRadius:(double)a3
{
  self->_mapTabInitialKilometerRadius = a3;
}

- (void)setMapLensAnchorFocusKilometerRadius:(double)a3
{
  self->_mapLensAnchorFocusKilometerRadius = a3;
}

- (void)setLowQualityAggregationPromotionScoreThreshold:(double)a3
{
  self->_lowQualityAggregationPromotionScoreThreshold = a3;
}

- (void)setLimitFullPageScreenshotSize:(BOOL)a3
{
  self->_limitFullPageScreenshotSize = a3;
}

- (void)setLimitFullPageScreenshotScale:(BOOL)a3
{
  self->_limitFullPageScreenshotScale = a3;
}

- (void)setInlinePlayerPlaceholderKenBurnsScale:(double)a3
{
  self->_inlinePlayerPlaceholderKenBurnsScale = a3;
}

- (void)setInlinePlayerPlaceholderKenBurnsExtraDuration:(double)a3
{
  self->_inlinePlayerPlaceholderKenBurnsExtraDuration = a3;
}

- (void)setInlinePlayerFrameLatencyApproximation:(double)a3
{
  self->_inlinePlayerFrameLatencyApproximation = a3;
}

- (void)setInlinePlayerFirstSegmentPlaceholderDuration:(double)a3
{
  self->_inlinePlayerFirstSegmentPlaceholderDuration = a3;
}

- (void)setInlinePlayerCoveredDurationForPause:(double)a3
{
  self->_inlinePlayerCoveredDurationForPause = a3;
}

- (void)setInlinePlaybackVisibilityThreshold:(double)a3
{
  self->_inlinePlaybackVisibilityThreshold = a3;
}

- (void)setInlinePlaybackSimulateMainPresenterDisappearanceOnDismissal:(BOOL)a3
{
  self->_inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal = a3;
}

- (void)setInlinePlaybackOnHoverPlaybackDelay:(double)a3
{
  self->_inlinePlaybackOnHoverPlaybackDelay = a3;
}

- (void)setInlinePlaybackMaxSupportedVisiblePlayers:(int64_t)a3
{
  self->_inlinePlaybackMaxSupportedVisiblePlayers = a3;
}

- (void)setInlinePlaybackMaxPreloadPlayers:(int64_t)a3
{
  self->_inlinePlaybackMaxPreloadPlayers = a3;
}

- (void)setInlinePlaybackMaxConcurrentPlayers:(int64_t)a3
{
  self->_inlinePlaybackMaxConcurrentPlayers = a3;
}

- (void)setIncludeSharedAlbumsActivityInProfileNotifications:(BOOL)a3
{
  self->_includeSharedAlbumsActivityInProfileNotifications = a3;
}

- (void)setImplicitSearchScopeForPickerSuggestionScopeSearch:(BOOL)a3
{
  self->_implicitSearchScopeForPickerSuggestionScopeSearch = a3;
}

- (void)setHorizontalPagingTechnique:(int64_t)a3
{
  self->_horizontalPagingTechnique = a3;
}

- (void)setHorizontalPagingHintMaximumScale:(double)a3
{
  self->_horizontalPagingHintMaximumScale = a3;
}

- (void)setHorizontalPagingHintMaximumOvershoot:(double)a3
{
  self->_horizontalPagingHintMaximumOvershoot = a3;
}

- (void)setHideNotifications:(BOOL)a3
{
  self->_hideNotifications = a3;
}

- (void)setHideInlinePlayerOnFirstSegment:(BOOL)a3
{
  self->_hideInlinePlayerOnFirstSegment = a3;
}

- (void)setForceShowProcessingUI:(BOOL)a3
{
  self->_forceShowProcessingUI = a3;
}

- (void)setForceHideProcessingUI:(BOOL)a3
{
  self->_forceHideProcessingUI = a3;
}

- (void)setForceDarkDetailsView:(BOOL)a3
{
  self->_forceDarkDetailsView = a3;
}

- (void)setEventsSummaryCountThreshold:(int)a3
{
  self->_eventsSummaryCountThreshold = a3;
}

- (void)setEventsPromotionScoreThreshold:(double)a3
{
  self->_eventsPromotionScoreThreshold = a3;
}

- (void)setEventsExtendedCountThreshold:(int)a3
{
  self->_eventsExtendedCountThreshold = a3;
}

- (void)setEventsCellItemAspectRatio:(double)a3
{
  self->_eventsCellItemAspectRatio = a3;
}

- (void)setEventsAlgorithm:(int64_t)a3
{
  self->_eventsAlgorithm = a3;
}

- (void)setEventFilterType:(int64_t)a3
{
  self->_eventFilterType = a3;
}

- (void)setEnabledShelvesLazyVStack:(BOOL)a3
{
  self->_enabledShelvesLazyVStack = a3;
}

- (void)setEnableZKWForPad:(BOOL)a3
{
  self->_enableZKWForPad = a3;
}

- (void)setEnableUtilityPrototypeCollections:(BOOL)a3
{
  self->_enableUtilityPrototypeCollections = a3;
}

- (void)setEnableUserSmartAlbums:(BOOL)a3
{
  self->_enableUserSmartAlbums = a3;
}

- (void)setEnableStackCounting:(BOOL)a3
{
  self->_enableStackCounting = a3;
}

- (void)setEnableSidebarHeaderSelection:(BOOL)a3
{
  self->_enableSidebarHeaderSelection = a3;
}

- (void)setEnableShelvesLoaderGradualDelivery:(BOOL)a3
{
  self->_enableShelvesLoaderGradualDelivery = a3;
}

- (void)setEnableShelvesLoader:(BOOL)a3
{
  self->_enableShelvesLoader = a3;
}

- (void)setEnableShelves:(BOOL)a3
{
  self->_enableShelves = a3;
}

- (void)setEnableShelfIPadLayout:(BOOL)a3
{
  self->_enableShelfIPadLayout = a3;
}

- (void)setEnableShelfDrawBorders:(BOOL)a3
{
  self->_enableShelfDrawBorders = a3;
}

- (void)setEnableSearchResultDiffAnimation:(BOOL)a3
{
  self->_enableSearchResultDiffAnimation = a3;
}

- (void)setEnableSavedToday:(BOOL)a3
{
  self->_enableSavedToday = a3;
}

- (void)setEnableResponsiveScrolling:(BOOL)a3
{
  self->_enableResponsiveScrolling = a3;
}

- (void)setEnableRecentlyViewedCollection:(BOOL)a3
{
  self->_enableRecentlyViewedCollection = a3;
}

- (void)setEnableRecentlySharedCollection:(BOOL)a3
{
  self->_enableRecentlySharedCollection = a3;
}

- (void)setEnableRecentlyEditedCollection:(BOOL)a3
{
  self->_enableRecentlyEditedCollection = a3;
}

- (void)setEnableRadarButton:(BOOL)a3
{
  self->_enableRadarButton = a3;
}

- (void)setEnableProtoBanner:(BOOL)a3
{
  self->_enableProtoBanner = a3;
}

- (void)setEnablePreviewSharing:(BOOL)a3
{
  self->_enablePreviewSharing = a3;
}

- (void)setEnablePreviewKeyAsset:(BOOL)a3
{
  self->_enablePreviewKeyAsset = a3;
}

- (void)setEnablePreviewCaching:(BOOL)a3
{
  self->_enablePreviewCaching = a3;
}

- (void)setEnablePhototypes:(BOOL)a3
{
  self->_enablePhototypes = a3;
}

- (void)setEnablePhotosChallenge:(BOOL)a3
{
  self->_enablePhotosChallenge = a3;
}

- (void)setEnableNewDetailsView:(BOOL)a3
{
  self->_enableNewDetailsView = a3;
}

- (void)setEnableNavigationBarBlurInCollections:(BOOL)a3
{
  self->_enableNavigationBarBlurInCollections = a3;
}

- (void)setEnableNavigationBarBlur:(BOOL)a3
{
  self->_enableNavigationBarBlur = a3;
}

- (void)setEnableMonthLocationTitles:(BOOL)a3
{
  self->_enableMonthLocationTitles = a3;
}

- (void)setEnableMonthHeroPromotion:(BOOL)a3
{
  self->_enableMonthHeroPromotion = a3;
}

- (void)setEnableMetadataSearch:(BOOL)a3
{
  self->_enableMetadataSearch = a3;
}

- (void)setEnableLoadingStatusHUD:(BOOL)a3
{
  self->_enableLoadingStatusHUD = a3;
}

- (void)setEnableKenBurnsInCollectionPreview:(BOOL)a3
{
  self->_enableKenBurnsInCollectionPreview = a3;
}

- (void)setEnableInlinePlaybackTripsShelf:(BOOL)a3
{
  self->_enableInlinePlaybackTripsShelf = a3;
}

- (void)setEnableInlinePlaybackTrips:(BOOL)a3
{
  self->_enableInlinePlaybackTrips = a3;
}

- (void)setEnableInlinePlaybackSocialGroupShelf:(BOOL)a3
{
  self->_enableInlinePlaybackSocialGroupShelf = a3;
}

- (void)setEnableInlinePlaybackSocialGroupFeed:(BOOL)a3
{
  self->_enableInlinePlaybackSocialGroupFeed = a3;
}

- (void)setEnableInlinePlaybackOnHover:(BOOL)a3
{
  self->_enableInlinePlaybackOnHover = a3;
}

- (void)setEnableInlinePlaybackMemories:(BOOL)a3
{
  self->_enableInlinePlaybackMemories = a3;
}

- (void)setEnableInlinePlaybackEvents:(BOOL)a3
{
  self->_enableInlinePlaybackEvents = a3;
}

- (void)setEnableInlinePlaybackDebugHUD:(BOOL)a3
{
  self->_enableInlinePlaybackDebugHUD = a3;
}

- (void)setEnableHybridMatchResults:(BOOL)a3
{
  self->_enableHybridMatchResults = a3;
}

- (void)setEnableHorizontalPagingHint:(BOOL)a3
{
  self->_enableHorizontalPagingHint = a3;
}

- (void)setEnableFullPageScreenshots:(BOOL)a3
{
  self->_enableFullPageScreenshots = a3;
}

- (void)setEnableFullPageScreenshotDebuggingOverlays:(BOOL)a3
{
  self->_enableFullPageScreenshotDebuggingOverlays = a3;
}

- (void)setEnableFocusMapLensOnAnchors:(BOOL)a3
{
  self->_enableFocusMapLensOnAnchors = a3;
}

- (void)setEnableExactMatchResults:(BOOL)a3
{
  self->_enableExactMatchResults = a3;
}

- (void)setEnableEventsDebugOverlay:(BOOL)a3
{
  self->_enableEventsDebugOverlay = a3;
}

- (void)setEnableEventsCellCollageStyle:(BOOL)a3
{
  self->_enableEventsCellCollageStyle = a3;
}

- (void)setEnableEmbeddingSearch:(BOOL)a3
{
  self->_enableEmbeddingSearch = a3;
}

- (void)setEnableDynamicHeader:(BOOL)a3
{
  self->_enableDynamicHeader = a3;
}

- (void)setEnableDocumentsSection:(BOOL)a3
{
  self->_enableDocumentsSection = a3;
}

- (void)setEnableDismissPersistence:(BOOL)a3
{
  self->_enableDismissPersistence = a3;
}

- (void)setEnableDetailsViewPrototype:(BOOL)a3
{
  self->_enableDetailsViewPrototype = a3;
}

- (void)setEnableDetailsViewHorizontalPaging:(BOOL)a3
{
  self->_enableDetailsViewHorizontalPaging = a3;
}

- (void)setEnableDetailsViewHorizontalKeyboardScrolling:(BOOL)a3
{
  self->_enableDetailsViewHorizontalKeyboardScrolling = a3;
}

- (void)setEnableDetailsSummaryButton:(BOOL)a3
{
  self->_enableDetailsSummaryButton = a3;
}

- (void)setEnableCuratedLibrary:(BOOL)a3
{
  self->_enableCuratedLibrary = a3;
}

- (void)setEnableCubeMode:(BOOL)a3
{
  self->_enableCubeMode = a3;
}

- (void)setEnableCollectionsSortButton:(BOOL)a3
{
  self->_enableCollectionsSortButton = a3;
}

- (void)setEnableAggregatedHighlightGridInEditorial:(BOOL)a3
{
  self->_enableAggregatedHighlightGridInEditorial = a3;
}

- (void)setDynamicHeaderMaximumDelayFromPreview:(double)a3
{
  self->_dynamicHeaderMaximumDelayFromPreview = a3;
}

- (void)setDynamicHeaderMaximumDelayFromMovie:(double)a3
{
  self->_dynamicHeaderMaximumDelayFromMovie = a3;
}

- (void)setDynamicHeaderDismissAreaBottomInset:(double)a3
{
  self->_dynamicHeaderDismissAreaBottomInset = a3;
}

- (void)setDynamicHeaderDebugOverlay:(int64_t)a3
{
  self->_dynamicHeaderDebugOverlay = a3;
}

- (void)setDynamicHeaderDebugBehavior:(int64_t)a3
{
  self->_dynamicHeaderDebugBehavior = a3;
}

- (void)setDynamicHeaderChromeHidingDelay:(double)a3
{
  self->_dynamicHeaderChromeHidingDelay = a3;
}

- (void)setDetailsViewHeaderAspectRatio:(double)a3
{
  self->_detailsViewHeaderAspectRatio = a3;
}

- (void)setDetailsDismissArea:(unint64_t)a3
{
  self->_detailsDismissArea = a3;
}

- (void)setDefaultPhoneFeedNavigationType:(unint64_t)a3
{
  self->_defaultPhoneFeedNavigationType = a3;
}

- (void)setDefaultFloatingToolbarBottomInset:(double)a3
{
  self->_defaultFloatingToolbarBottomInset = a3;
}

- (void)setCuratedLibraryTransitionToolbarBlurRadius:(double)a3
{
  self->_curatedLibraryTransitionToolbarBlurRadius = a3;
}

- (void)setCuratedLibraryTransitionShelfHeaderBlurRadius:(double)a3
{
  self->_curatedLibraryTransitionShelfHeaderBlurRadius = a3;
}

- (void)setCuratedLibraryTransitionChromeExpandPercentage:(double)a3
{
  self->_curatedLibraryTransitionChromeExpandPercentage = a3;
}

- (void)setCuratedLibraryTransitionChromeCollapsePercentage:(double)a3
{
  self->_curatedLibraryTransitionChromeCollapsePercentage = a3;
}

- (void)setCuratedLibraryExpansionToggleSpringStiffness:(double)a3
{
  self->_curatedLibraryExpansionToggleSpringStiffness = a3;
}

- (void)setCuratedLibraryExpansionMinScrollDistance:(double)a3
{
  self->_curatedLibraryExpansionMinScrollDistance = a3;
}

- (void)setCuratedLibraryExpansionGestureSpringStiffness:(double)a3
{
  self->_curatedLibraryExpansionGestureSpringStiffness = a3;
}

- (void)setCuratedLibraryExpansionFastToggleSpringStiffness:(double)a3
{
  self->_curatedLibraryExpansionFastToggleSpringStiffness = a3;
}

- (void)setCuratedLibraryCollapseMinScrollDistance:(double)a3
{
  self->_curatedLibraryCollapseMinScrollDistance = a3;
}

- (void)setCuratedLibraryChromeAutoAnimateSpringStiffness:(double)a3
{
  self->_curatedLibraryChromeAutoAnimateSpringStiffness = a3;
}

- (void)setCuratedLibraryBottomPadding:(double)a3
{
  self->_curatedLibraryBottomPadding = a3;
}

- (void)setCollectionPreviewTransition:(int64_t)a3
{
  self->_collectionPreviewTransition = a3;
}

- (void)setCollectionPreviewKenBurnsScaleDirection:(char)a3
{
  self->_collectionPreviewKenBurnsScaleDirection = a3;
}

- (void)setBannerTopMargin:(double)a3
{
  self->_bannerTopMargin = a3;
}

- (void)setAlwaysFilterPlaceholder:(BOOL)a3
{
  self->_alwaysFilterPlaceholder = a3;
}

- (void)setAlwaysEnterDetailsViewInFullscreenPlayback:(BOOL)a3
{
  self->_alwaysEnterDetailsViewInFullscreenPlayback = a3;
}

- (void)setAllowProfileIcon:(BOOL)a3
{
  self->_allowProfileIcon = a3;
}

- (void)setAggregatedHighlightColumns:(int64_t)a3
{
  self->_aggregatedHighlightColumns = a3;
}

void __36__PXLemonadeSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 lemonadeSettings];
  v1 = (void *)sharedInstance_sharedInstance_140894;
  sharedInstance_sharedInstance_140894 = v0;
}

- (int64_t)yearsAndMonthsMode
{
  return self->_yearsAndMonthsMode;
}

- (int64_t)tripsSource
{
  return self->_tripsSource;
}

- (double)inlinePlayerPlaceholderKenBurnsScale
{
  return self->_inlinePlayerPlaceholderKenBurnsScale;
}

- (double)inlinePlayerPlaceholderKenBurnsExtraDuration
{
  return self->_inlinePlayerPlaceholderKenBurnsExtraDuration;
}

- (double)inlinePlayerFirstSegmentPlaceholderDuration
{
  return self->_inlinePlayerFirstSegmentPlaceholderDuration;
}

- (BOOL)enablePhotosChallenge
{
  return self->_enablePhotosChallenge;
}

- (BOOL)enableInlinePlaybackTripsShelf
{
  return self->_enableInlinePlaybackTripsShelf;
}

+ (id)settingsControllerModule
{
}

- (void).cxx_destruct
{
}

- (BOOL)enableResponsiveScrolling
{
  return self->_enableResponsiveScrolling;
}

- (void)setSimulateFromMyMacAlbums:(BOOL)a3
{
  self->_simulateFromMyMacAlbums = a3;
}

- (BOOL)simulateFromMyMacAlbums
{
  return self->_simulateFromMyMacAlbums;
}

- (double)sectionedFeedTabBarItemSpacing
{
  return self->_sectionedFeedTabBarItemSpacing;
}

- (BOOL)useFeatureAvailabilityReporter
{
  return self->_useFeatureAvailabilityReporter;
}

- (void)setForceRenderingStatus:(BOOL)a3
{
  self->_forceRenderingStatus = a3;
}

- (BOOL)forceRenderingStatus
{
  return self->_forceRenderingStatus;
}

- (BOOL)forceShowProcessingUI
{
  return self->_forceShowProcessingUI;
}

- (BOOL)forceHideProcessingUI
{
  return self->_forceHideProcessingUI;
}

- (BOOL)enableDismissPersistence
{
  return self->_enableDismissPersistence;
}

- (BOOL)enableSidebarHeaderSelection
{
  return self->_enableSidebarHeaderSelection;
}

- (BOOL)enableShelfIPadLayout
{
  return self->_enableShelfIPadLayout;
}

- (BOOL)enableStackCounting
{
  return self->_enableStackCounting;
}

- (double)maximumFullPageScreenshotDimension
{
  return self->_maximumFullPageScreenshotDimension;
}

- (BOOL)limitFullPageScreenshotSize
{
  return self->_limitFullPageScreenshotSize;
}

- (BOOL)limitFullPageScreenshotScale
{
  return self->_limitFullPageScreenshotScale;
}

- (BOOL)enableFullPageScreenshotDebuggingOverlays
{
  return self->_enableFullPageScreenshotDebuggingOverlays;
}

- (BOOL)enableFullPageScreenshots
{
  return self->_enableFullPageScreenshots;
}

- (BOOL)implicitSearchScopeForPickerSuggestionScopeSearch
{
  return self->_implicitSearchScopeForPickerSuggestionScopeSearch;
}

- (BOOL)showSearchDebugBadges
{
  return self->_showSearchDebugBadges;
}

- (BOOL)overrideSuggestionPills
{
  return self->_overrideSuggestionPills;
}

- (void)setEnableNextTokenSuggestions:(BOOL)a3
{
  self->_enableNextTokenSuggestions = a3;
}

- (BOOL)enableNextTokenSuggestions
{
  return self->_enableNextTokenSuggestions;
}

- (double)searchQueryTimeout
{
  return self->_searchQueryTimeout;
}

- (void)setEnableEmbeddingOnlyResultsInExactMatches:(BOOL)a3
{
  self->_enableEmbeddingOnlyResultsInExactMatches = a3;
}

- (BOOL)enableEmbeddingOnlyResultsInExactMatches
{
  return self->_enableEmbeddingOnlyResultsInExactMatches;
}

- (unint64_t)minNumberOfResultsForNextTokenGeneration
{
  return self->_minNumberOfResultsForNextTokenGeneration;
}

- (BOOL)enableHybridMatchResults
{
  return self->_enableHybridMatchResults;
}

- (BOOL)enableExactMatchResults
{
  return self->_enableExactMatchResults;
}

- (BOOL)enableZKWForPad
{
  return self->_enableZKWForPad;
}

- (int64_t)maxCuratedCollectionsPerType
{
  return self->_maxCuratedCollectionsPerType;
}

- (int64_t)minQueryLengthForFullRanking
{
  return self->_minQueryLengthForFullRanking;
}

- (int64_t)maxSearchSuggestions
{
  return self->_maxSearchSuggestions;
}

- (int64_t)maxRankedAssetSearchResults
{
  return self->_maxRankedAssetSearchResults;
}

- (void)setMaxSearchResults:(int64_t)a3
{
  self->_maxSearchResults = a3;
}

- (int64_t)maxSearchResults
{
  return self->_maxSearchResults;
}

- (void)setEnableQueryUnderstanding:(BOOL)a3
{
  self->_enableQueryUnderstanding = a3;
}

- (BOOL)enableQueryUnderstanding
{
  return self->_enableQueryUnderstanding;
}

- (BOOL)enableEmbeddingSearch
{
  return self->_enableEmbeddingSearch;
}

- (BOOL)enableMetadataSearch
{
  return self->_enableMetadataSearch;
}

- (BOOL)enableSearchResultDiffAnimation
{
  return self->_enableSearchResultDiffAnimation;
}

- (double)curatedLibraryTransitionChromeCollapsePercentage
{
  return self->_curatedLibraryTransitionChromeCollapsePercentage;
}

- (double)curatedLibraryTransitionChromeExpandPercentage
{
  return self->_curatedLibraryTransitionChromeExpandPercentage;
}

- (double)curatedLibraryCollapseMinScrollDistance
{
  return self->_curatedLibraryCollapseMinScrollDistance;
}

- (double)curatedLibraryExpansionMinScrollDistance
{
  return self->_curatedLibraryExpansionMinScrollDistance;
}

- (double)curatedLibraryChromeAutoAnimateSpringStiffness
{
  return self->_curatedLibraryChromeAutoAnimateSpringStiffness;
}

- (double)curatedLibraryExpansionFastToggleSpringStiffness
{
  return self->_curatedLibraryExpansionFastToggleSpringStiffness;
}

- (double)curatedLibraryExpansionToggleSpringStiffness
{
  return self->_curatedLibraryExpansionToggleSpringStiffness;
}

- (double)curatedLibraryExpansionGestureSpringStiffness
{
  return self->_curatedLibraryExpansionGestureSpringStiffness;
}

- (char)collectionPreviewKenBurnsScaleDirection
{
  return self->_collectionPreviewKenBurnsScaleDirection;
}

- (BOOL)enableKenBurnsInCollectionPreview
{
  return self->_enableKenBurnsInCollectionPreview;
}

- (int64_t)collectionPreviewTransition
{
  return self->_collectionPreviewTransition;
}

- (double)minimumCuratedLibraryVisibleFractionForExpansion
{
  return self->_minimumCuratedLibraryVisibleFractionForExpansion;
}

- (BOOL)sharedWithYouOnlyFilterIncludesUnsaved
{
  return self->_sharedWithYouOnlyFilterIncludesUnsaved;
}

- (BOOL)enableMonthHeroPromotion
{
  return self->_enableMonthHeroPromotion;
}

- (BOOL)resetAllPhotosOnDismiss
{
  return self->_resetAllPhotosOnDismiss;
}

- (BOOL)enableRadarButton
{
  return self->_enableRadarButton;
}

- (PXLemonadeOneUpSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (BOOL)enableDocumentsSection
{
  return self->_enableDocumentsSection;
}

- (BOOL)enableRecentlySharedCollection
{
  return self->_enableRecentlySharedCollection;
}

- (BOOL)enableRecentlyEditedCollection
{
  return self->_enableRecentlyEditedCollection;
}

- (BOOL)enableRecentlyViewedCollection
{
  return self->_enableRecentlyViewedCollection;
}

- (BOOL)enableUtilityPrototypeCollections
{
  return self->_enableUtilityPrototypeCollections;
}

- (void)setEnableLensesInPlacesMapView:(BOOL)a3
{
  self->_enableLensesInPlacesMapView = a3;
}

- (BOOL)enableLensesInPlacesMapView
{
  return self->_enableLensesInPlacesMapView;
}

- (BOOL)presentZoomableGridFromMapCluster
{
  return self->_presentZoomableGridFromMapCluster;
}

- (double)mapTabInitialKilometerRadius
{
  return self->_mapTabInitialKilometerRadius;
}

- (int64_t)maximumNumberOfAssetsForPlaybackAsMemory
{
  return self->_maximumNumberOfAssetsForPlaybackAsMemory;
}

- (int64_t)minimumNumberOfAssetsForPlaybackAsMemory
{
  return self->_minimumNumberOfAssetsForPlaybackAsMemory;
}

- (void)setTopCenteredTitleVerticalOffset:(double)a3
{
  self->_topCenteredTitleVerticalOffset = a3;
}

- (double)topCenteredTitleVerticalOffset
{
  return self->_topCenteredTitleVerticalOffset;
}

- (void)setScrollThresholdForTopCenteredTitle:(double)a3
{
  self->_scrollThresholdForTopCenteredTitle = a3;
}

- (double)scrollThresholdForTopCenteredTitle
{
  return self->_scrollThresholdForTopCenteredTitle;
}

- (BOOL)alwaysEnterDetailsViewInFullscreenPlayback
{
  return self->_alwaysEnterDetailsViewInFullscreenPlayback;
}

- (int64_t)movieCurationAffordance
{
  return self->_movieCurationAffordance;
}

- (double)titleOverlaySingleLineTopDetentTolerance
{
  return self->_titleOverlaySingleLineTopDetentTolerance;
}

- (double)titleOverlayTopDetentTolerance
{
  return self->_titleOverlayTopDetentTolerance;
}

- (double)titleOverlayDetachingDistance
{
  return self->_titleOverlayDetachingDistance;
}

- (double)titleOverlayScaleDistance
{
  return self->_titleOverlayScaleDistance;
}

- (double)bannerTopMargin
{
  return self->_bannerTopMargin;
}

- (double)titleOverlayVerticalOffsetAtTop
{
  return self->_titleOverlayVerticalOffsetAtTop;
}

- (double)titleOverlayScaleAtTop
{
  return self->_titleOverlayScaleAtTop;
}

- (double)topTitleVerticalSpace
{
  return self->_topTitleVerticalSpace;
}

- (BOOL)enableProtoBanner
{
  return self->_enableProtoBanner;
}

- (unint64_t)detailsDismissArea
{
  return self->_detailsDismissArea;
}

- (double)dynamicHeaderDismissAreaBottomInset
{
  return self->_dynamicHeaderDismissAreaBottomInset;
}

- (double)dynamicHeaderMaximumDelayFromMovie
{
  return self->_dynamicHeaderMaximumDelayFromMovie;
}

- (double)dynamicHeaderMaximumDelayFromPreview
{
  return self->_dynamicHeaderMaximumDelayFromPreview;
}

- (int64_t)dynamicHeaderDebugBehavior
{
  return self->_dynamicHeaderDebugBehavior;
}

- (int64_t)dynamicHeaderDebugOverlay
{
  return self->_dynamicHeaderDebugOverlay;
}

- (double)dynamicHeaderChromeHidingDelay
{
  return self->_dynamicHeaderChromeHidingDelay;
}

- (BOOL)enableDynamicHeader
{
  return self->_enableDynamicHeader;
}

- (BOOL)enableDetailsViewPrototype
{
  return self->_enableDetailsViewPrototype;
}

- (BOOL)enableDetailsSummaryButton
{
  return self->_enableDetailsSummaryButton;
}

- (double)mapLensAnchorFocusKilometerRadius
{
  return self->_mapLensAnchorFocusKilometerRadius;
}

- (BOOL)enableFocusMapLensOnAnchors
{
  return self->_enableFocusMapLensOnAnchors;
}

- (double)detailsViewHeaderAspectRatio
{
  return self->_detailsViewHeaderAspectRatio;
}

- (double)lowQualityAggregationPromotionScoreThreshold
{
  return self->_lowQualityAggregationPromotionScoreThreshold;
}

- (BOOL)enableAggregatedHighlightGridInEditorial
{
  return self->_enableAggregatedHighlightGridInEditorial;
}

- (double)horizontalPagingHintMaximumOvershoot
{
  return self->_horizontalPagingHintMaximumOvershoot;
}

- (double)horizontalPagingHintMaximumScale
{
  return self->_horizontalPagingHintMaximumScale;
}

- (BOOL)enableHorizontalPagingHint
{
  return self->_enableHorizontalPagingHint;
}

- (int64_t)horizontalPagingTechnique
{
  return self->_horizontalPagingTechnique;
}

- (BOOL)enableDetailsViewHorizontalPaging
{
  return self->_enableDetailsViewHorizontalPaging;
}

- (BOOL)enableDetailsViewHorizontalKeyboardScrolling
{
  return self->_enableDetailsViewHorizontalKeyboardScrolling;
}

- (void)setDetailsViewGridContent:(unint64_t)a3
{
  self->_detailsViewGridContent = a3;
}

- (unint64_t)detailsViewGridContent
{
  return self->_detailsViewGridContent;
}

- (int64_t)scrubberKind
{
  return self->_scrubberKind;
}

- (double)simulatedPreviewPlayerDelay
{
  return self->_simulatedPreviewPlayerDelay;
}

- (double)simulatedDetailsViewLoadingDelay
{
  return self->_simulatedDetailsViewLoadingDelay;
}

- (BOOL)simulateDetailsViewLeaking
{
  return self->_simulateDetailsViewLeaking;
}

- (BOOL)enablePreviewKeyAsset
{
  return self->_enablePreviewKeyAsset;
}

- (BOOL)enablePreviewCaching
{
  return self->_enablePreviewCaching;
}

- (BOOL)enablePreviewSharing
{
  return self->_enablePreviewSharing;
}

- (BOOL)enableNewDetailsView
{
  return self->_enableNewDetailsView;
}

- (BOOL)enableEventsDebugOverlay
{
  return self->_enableEventsDebugOverlay;
}

- (int)eventsSummaryCountThreshold
{
  return self->_eventsSummaryCountThreshold;
}

- (double)eventsPromotionScoreThreshold
{
  return self->_eventsPromotionScoreThreshold;
}

- (int64_t)eventsAlgorithm
{
  return self->_eventsAlgorithm;
}

- (void)setEnableLargeThumbnailAlbumCellStyle:(BOOL)a3
{
  self->_enableLargeThumbnailAlbumCellStyle = a3;
}

- (BOOL)enableLargeThumbnailAlbumCellStyle
{
  return self->_enableLargeThumbnailAlbumCellStyle;
}

- (BOOL)enableCollectionsSortButton
{
  return self->_enableCollectionsSortButton;
}

- (int64_t)maxNumberOfSharedAlbumActivityItemsToShow
{
  return self->_maxNumberOfSharedAlbumActivityItemsToShow;
}

- (BOOL)shouldUsePhotosIntelligenceSPIForUtilities
{
  return self->_shouldUsePhotosIntelligenceSPIForUtilities;
}

- (BOOL)alwaysFilterPlaceholder
{
  return self->_alwaysFilterPlaceholder;
}

- (double)inlinePlayerFrameLatencyApproximation
{
  return self->_inlinePlayerFrameLatencyApproximation;
}

- (double)opacityOfPlayerOnFirstSegment
{
  return self->_opacityOfPlayerOnFirstSegment;
}

- (BOOL)hideInlinePlayerOnFirstSegment
{
  return self->_hideInlinePlayerOnFirstSegment;
}

- (BOOL)preferNewPlayerForFeeds
{
  return self->_preferNewPlayerForFeeds;
}

- (double)inlinePlayerCoveredDurationForPause
{
  return self->_inlinePlayerCoveredDurationForPause;
}

- (BOOL)inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal
{
  return self->_inlinePlaybackSimulateMainPresenterDisappearanceOnDismissal;
}

- (BOOL)enableInlinePlaybackSocialGroupFeed
{
  return self->_enableInlinePlaybackSocialGroupFeed;
}

- (BOOL)enableInlinePlaybackSocialGroupShelf
{
  return self->_enableInlinePlaybackSocialGroupShelf;
}

- (BOOL)enableInlinePlaybackEvents
{
  return self->_enableInlinePlaybackEvents;
}

- (BOOL)enableInlinePlaybackTrips
{
  return self->_enableInlinePlaybackTrips;
}

- (BOOL)enableInlinePlaybackMemories
{
  return self->_enableInlinePlaybackMemories;
}

- (double)navigationBarTitleDisappearDuration
{
  return self->_navigationBarTitleDisappearDuration;
}

- (double)navigationBarTitleAppearDelay
{
  return self->_navigationBarTitleAppearDelay;
}

- (double)navigationBarTitleAppearDuration
{
  return self->_navigationBarTitleAppearDuration;
}

- (double)navigationBarLegibilityEDRBoost
{
  return self->_navigationBarLegibilityEDRBoost;
}

- (int64_t)version
{
  return 2;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end