@interface PXPhotosViewConfiguration
- (BOOL)allowsCaptions;
- (BOOL)allowsDragAndDrop;
- (BOOL)allowsDragIn;
- (BOOL)allowsDragOut;
- (BOOL)allowsGridAppearanceActions;
- (BOOL)allowsInteractiveFavoriteBadges;
- (BOOL)allowsLinkInteractions;
- (BOOL)allowsMergeDuplicatesAction;
- (BOOL)allowsMultiSelectMenu;
- (BOOL)allowsSwipeToSelect;
- (BOOL)allowsUserDefaults;
- (BOOL)alwaysIncludeSharedWithYouAssets;
- (BOOL)containerProvidesSecondaryToolbar;
- (BOOL)enableFilterButton;
- (BOOL)enableSupportForTungstenUnderlay;
- (BOOL)hidesAssetCountInFooter;
- (BOOL)hidesViewOptionsToolbar;
- (BOOL)ignoreContentFilterStateWhenNotFiltering;
- (BOOL)ignoreFilterPredicateAssert;
- (BOOL)isEmbedded;
- (BOOL)lowMemoryMode;
- (BOOL)prefersActionsInToolbar;
- (BOOL)preventShowInAllPhotosAction;
- (BOOL)shouldOptOutOfChromelessBars;
- (BOOL)showLoadingPlaceholderWhenEmpty;
- (BOOL)showsOnlyAssetsInSelectedItemSectionInOneUp;
- (BOOL)startsInSelectMode;
- (BOOL)useLowMemoryDecode;
- (BOOL)wantsAdaptiveSelectModeBarButton;
- (BOOL)wantsAssetIndexBadge;
- (BOOL)wantsCPLStatus;
- (BOOL)wantsContentFilterVisible;
- (BOOL)wantsDimmedSelectionStyle;
- (BOOL)wantsDynamicTitles;
- (BOOL)wantsExternallyRenderedSecondaryToolbar;
- (BOOL)wantsFileSizeBadge;
- (BOOL)wantsFooterMask;
- (BOOL)wantsFooterVisibleImmediately;
- (BOOL)wantsFooterVisibleWhenEmpty;
- (BOOL)wantsModernNavBarButtons;
- (BOOL)wantsNumberedSelectionStyle;
- (BOOL)wantsOneUpShowInLibraryButton;
- (BOOL)wantsRenderingStatus;
- (BOOL)wantsSelectModeCaptionInContextMenu;
- (BOOL)wantsShareGridButtonVisible;
- (BOOL)wantsSingleRowScrollingLayout;
- (BOOL)wantsTabBarHidden;
- (BOOL)wantsTitleInNavigationBar;
- (Class)decorationViewClass;
- (Class)scrollDetentsProviderClass;
- (NSArray)fullscreenOverlayControllers;
- (NSString)centerAccessoryActionType;
- (NSString)containerTitle;
- (NSString)footerSubtitle;
- (NSString)initialScrollPositionDetentIdentifier;
- (NSString)pickerClientBundleIdentifier;
- (NSString)title;
- (NSString)trailingAccessoryActionType;
- (NSURL)footerLearnMoreURL;
- (PXAssetActionManager)assetActionManager;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXAssetImportStatusManager)assetImportStatusManager;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXContentPrivacyController)privacyController;
- (PXFooterViewModel)footerViewModel;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXMediaProvider)mediaProvider;
- (PXPhotosBannerProvider)bannerProvider;
- (PXPhotosCustomSectionBodyLayoutProvider)sectionBodyLayoutProvider;
- (PXPhotosCustomViewDecorationDataSource)decorationDataSource;
- (PXPhotosGlobalHeaderLayoutProvider)globalHeaderLayoutProvider;
- (PXPhotosOverlayController)overlayController;
- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate;
- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate;
- (PXPhotosSectionHeaderLayoutProvider)sectionHeaderLayoutProvider;
- (PXPhotosViewConfiguration)init;
- (PXPhotosViewConfiguration)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 selectionManager:(id)a5 assetActionManager:(id)a6 assetCollectionActionManager:(id)a7;
- (PXPhotosViewDelegate)delegate;
- (PXPhotosViewOptionsModel)viewOptionsModel;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (PXSectionedObjectReference)initialNavigationObjectReference;
- (PXSectionedSelectionManager)selectionManager;
- (PXStatusViewModel)emptyPlaceholderStatusViewModel;
- (PXTapbackStatusManager)tapbackStatusManager;
- (PXZoomablePhotosUserDefaults)customUserDefaults;
- (double)itemAspectRatio;
- (id)adjustedExtendedTraitCollection:(id)a3;
- (id)badgesModifier;
- (id)bannerControllerProvider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customAssetSelectionHandler;
- (id)customDismissHandler;
- (id)infoActionHandler;
- (int64_t)backgroundStyle;
- (int64_t)contentMode;
- (int64_t)contentShiftStrategy;
- (int64_t)contentStartingPosition;
- (int64_t)darkModeBackgroundStyle;
- (int64_t)dismissAffordance;
- (int64_t)footerVisibilityStyle;
- (int64_t)gridStyle;
- (int64_t)initialNavigationScrollPosition;
- (int64_t)lightModeBackgroundStyle;
- (int64_t)navBarStyle;
- (int64_t)noContentPlaceholderType;
- (int64_t)oneUpPresentationOrigin;
- (int64_t)overrideDefaultNumberOfColumns;
- (int64_t)preferredBackgroundStyle;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)scrollIndicatorStyle;
- (int64_t)scrollingBehavior;
- (int64_t)sectionBodyStyle;
- (int64_t)sectionHeaderStyle;
- (int64_t)selectionContextOverride;
- (int64_t)summaryStyle;
- (int64_t)toolbarStyle;
- (unint64_t)allowedActions;
- (unint64_t)allowedBehaviors;
- (unint64_t)allowedInteractiveDismissBehaviors;
- (unint64_t)forbiddenBadges;
- (unsigned)gridPresentationType;
- (void)copySwiftPropertiesFromConfiguration:(id)a3;
- (void)setAllowedActions:(unint64_t)a3;
- (void)setAllowedBehaviors:(unint64_t)a3;
- (void)setAllowedInteractiveDismissBehaviors:(unint64_t)a3;
- (void)setAllowsCaptions:(BOOL)a3;
- (void)setAllowsDragAndDrop:(BOOL)a3;
- (void)setAllowsDragIn:(BOOL)a3;
- (void)setAllowsDragOut:(BOOL)a3;
- (void)setAllowsGridAppearanceActions:(BOOL)a3;
- (void)setAllowsInteractiveFavoriteBadges:(BOOL)a3;
- (void)setAllowsLinkInteractions:(BOOL)a3;
- (void)setAllowsMergeDuplicatesAction:(BOOL)a3;
- (void)setAllowsMultiSelectMenu:(BOOL)a3;
- (void)setAllowsSwipeToSelect:(BOOL)a3;
- (void)setAllowsUserDefaults:(BOOL)a3;
- (void)setAlwaysIncludeSharedWithYouAssets:(BOOL)a3;
- (void)setAssetImportStatusManager:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBadgesModifier:(id)a3;
- (void)setBannerControllerProvider:(id)a3;
- (void)setBannerProvider:(id)a3;
- (void)setCenterAccessoryActionType:(id)a3;
- (void)setContainerProvidesSecondaryToolbar:(BOOL)a3;
- (void)setContainerTitle:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentShiftStrategy:(int64_t)a3;
- (void)setContentStartingPosition:(int64_t)a3;
- (void)setCustomAssetSelectionHandler:(id)a3;
- (void)setCustomDismissHandler:(id)a3;
- (void)setCustomUserDefaults:(id)a3;
- (void)setDarkModeBackgroundStyle:(int64_t)a3;
- (void)setDecorationDataSource:(id)a3;
- (void)setDecorationViewClass:(Class)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissAffordance:(int64_t)a3;
- (void)setEmptyPlaceholderStatusViewModel:(id)a3;
- (void)setEnableFilterButton:(BOOL)a3;
- (void)setEnableSupportForTungstenUnderlay:(BOOL)a3;
- (void)setFooterLearnMoreURL:(id)a3;
- (void)setFooterSubtitle:(id)a3;
- (void)setFooterViewModel:(id)a3;
- (void)setFooterVisibilityStyle:(int64_t)a3;
- (void)setForbiddenBadges:(unint64_t)a3;
- (void)setFullscreenOverlayControllers:(id)a3;
- (void)setGlobalHeaderLayoutProvider:(id)a3;
- (void)setGridPresentationType:(unsigned __int8)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setHidesAssetCountInFooter:(BOOL)a3;
- (void)setHidesViewOptionsToolbar:(BOOL)a3;
- (void)setIgnoreContentFilterStateWhenNotFiltering:(BOOL)a3;
- (void)setIgnoreFilterPredicateAssert:(BOOL)a3;
- (void)setInfoActionHandler:(id)a3;
- (void)setInitialNavigationObjectReference:(id)a3;
- (void)setInitialNavigationScrollPosition:(int64_t)a3;
- (void)setInitialScrollPositionDetentIdentifier:(id)a3;
- (void)setIsEmbedded:(BOOL)a3;
- (void)setItemAspectRatio:(double)a3;
- (void)setLightModeBackgroundStyle:(int64_t)a3;
- (void)setLoadingStatusManager:(id)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setNavBarStyle:(int64_t)a3;
- (void)setNoContentPlaceholderType:(int64_t)a3;
- (void)setOneUpPresentationOrigin:(int64_t)a3;
- (void)setOverlayController:(id)a3;
- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3;
- (void)setPickerClientBundleIdentifier:(id)a3;
- (void)setPreferredAssetCropDelegate:(id)a3;
- (void)setPreferredBackgroundStyle:(int64_t)a3;
- (void)setPreferredColumnCountsDelegate:(id)a3;
- (void)setPreferredUserInterfaceStyle:(int64_t)a3;
- (void)setPrefersActionsInToolbar:(BOOL)a3;
- (void)setPreventShowInAllPhotosAction:(BOOL)a3;
- (void)setPrivacyController:(id)a3;
- (void)setScrollDetentsProviderClass:(Class)a3;
- (void)setScrollIndicatorStyle:(int64_t)a3;
- (void)setScrollingBehavior:(int64_t)a3;
- (void)setSearchQueryMatchInfo:(id)a3;
- (void)setSectionBodyLayoutProvider:(id)a3;
- (void)setSectionBodyStyle:(int64_t)a3;
- (void)setSectionHeaderLayoutProvider:(id)a3;
- (void)setSectionHeaderStyle:(int64_t)a3;
- (void)setSelectionContextOverride:(int64_t)a3;
- (void)setShouldOptOutOfChromelessBars:(BOOL)a3;
- (void)setShowLoadingPlaceholderWhenEmpty:(BOOL)a3;
- (void)setShowsOnlyAssetsInSelectedItemSectionInOneUp:(BOOL)a3;
- (void)setStartsInSelectMode:(BOOL)a3;
- (void)setSummaryStyle:(int64_t)a3;
- (void)setTapbackStatusManager:(id)a3;
- (void)setTitle:(id)a3;
- (void)setToolbarStyle:(int64_t)a3;
- (void)setTrailingAccessoryActionType:(id)a3;
- (void)setUseLowMemoryDecode:(BOOL)a3;
- (void)setViewOptionsModel:(id)a3;
- (void)setWantsAdaptiveSelectModeBarButton:(BOOL)a3;
- (void)setWantsAssetIndexBadge:(BOOL)a3;
- (void)setWantsCPLStatus:(BOOL)a3;
- (void)setWantsContentFilterVisible:(BOOL)a3;
- (void)setWantsDimmedSelectionStyle:(BOOL)a3;
- (void)setWantsDynamicTitles:(BOOL)a3;
- (void)setWantsExternallyRenderedSecondaryToolbar:(BOOL)a3;
- (void)setWantsFileSizeBadge:(BOOL)a3;
- (void)setWantsFooterMask:(BOOL)a3;
- (void)setWantsFooterVisibleImmediately:(BOOL)a3;
- (void)setWantsFooterVisibleWhenEmpty:(BOOL)a3;
- (void)setWantsModernNavBarButtons:(BOOL)a3;
- (void)setWantsNumberedSelectionStyle:(BOOL)a3;
- (void)setWantsOneUpShowInLibraryButton:(BOOL)a3;
- (void)setWantsRenderingStatus:(BOOL)a3;
- (void)setWantsSelectModeCaptionInContextMenu:(BOOL)a3;
- (void)setWantsShareGridButtonVisible:(BOOL)a3;
- (void)setWantsSingleRowScrollingLayout:(BOOL)a3;
- (void)setWantsTabBarHidden:(BOOL)a3;
- (void)setWantsTitleInNavigationBar:(BOOL)a3;
@end

@implementation PXPhotosViewConfiguration

- (int64_t)preferredBackgroundStyle
{
  v2 = self;
  PXPhotosViewConfiguration.preferredBackgroundStyle.getter();
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
}

- (id)adjustedExtendedTraitCollection:(id)a3
{
  sub_1A9C65360(&qword_1E9820C58, &qword_1E9820C60);
  sub_1A9B21070(0, (unint64_t *)&qword_1E981B808);
  sub_1A9C65360(&qword_1E981B800, (unint64_t *)&qword_1E981B808);
  a3;
  v5 = self;
  sub_1AB2349CC();
}

- (void)copySwiftPropertiesFromConfiguration:(id)a3
{
  id v4 = a3;
  self;
  sub_1AA1B0D20();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollDetentsProviderClass, 0);
  objc_storeStrong((id *)&self->_initialScrollPositionDetentIdentifier, 0);
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_initialNavigationObjectReference, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusViewModel, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_decorationViewClass, 0);
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryActionType, 0);
  objc_storeStrong((id *)&self->_centerAccessoryActionType, 0);
  objc_storeStrong(&self->_infoActionHandler, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customUserDefaults, 0);
  objc_storeStrong((id *)&self->_fullscreenOverlayControllers, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_destroyWeak((id *)&self->_preferredColumnCountsDelegate);
  objc_destroyWeak((id *)&self->_preferredAssetCropDelegate);
  objc_storeStrong(&self->_bannerControllerProvider, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_sectionBodyLayoutProvider, 0);
  objc_storeStrong((id *)&self->_globalHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLayoutProvider, 0);
  objc_storeStrong((id *)&self->_footerLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_footerSubtitle, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong(&self->_customDismissHandler, 0);
  objc_storeStrong(&self->_customAssetSelectionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (void)setScrollDetentsProviderClass:(Class)a3
{
}

- (Class)scrollDetentsProviderClass
{
  return self->_scrollDetentsProviderClass;
}

- (void)setInitialScrollPositionDetentIdentifier:(id)a3
{
}

- (NSString)initialScrollPositionDetentIdentifier
{
  return self->_initialScrollPositionDetentIdentifier;
}

- (void)setEnableSupportForTungstenUnderlay:(BOOL)a3
{
  self->_enableSupportForTungstenUnderlay = a3;
}

- (BOOL)enableSupportForTungstenUnderlay
{
  return self->_enableSupportForTungstenUnderlay;
}

- (void)setUseLowMemoryDecode:(BOOL)a3
{
  self->_useLowMemoryDecode = a3;
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (void)setPickerClientBundleIdentifier:(id)a3
{
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (void)setContentShiftStrategy:(int64_t)a3
{
  self->_contentShiftStrategy = a3;
}

- (int64_t)contentShiftStrategy
{
  return self->_contentShiftStrategy;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (void)setScrollingBehavior:(int64_t)a3
{
  self->_scrollingBehavior = a3;
}

- (int64_t)scrollingBehavior
{
  return self->_scrollingBehavior;
}

- (void)setInitialNavigationScrollPosition:(int64_t)a3
{
  self->_initialNavigationScrollPosition = a3;
}

- (int64_t)initialNavigationScrollPosition
{
  return self->_initialNavigationScrollPosition;
}

- (void)setInitialNavigationObjectReference:(id)a3
{
}

- (PXSectionedObjectReference)initialNavigationObjectReference
{
  return self->_initialNavigationObjectReference;
}

- (void)setAllowedInteractiveDismissBehaviors:(unint64_t)a3
{
  self->_allowedInteractiveDismissBehaviors = a3;
}

- (unint64_t)allowedInteractiveDismissBehaviors
{
  return self->_allowedInteractiveDismissBehaviors;
}

- (void)setDismissAffordance:(int64_t)a3
{
  self->_dismissAffordance = a3;
}

- (int64_t)dismissAffordance
{
  return self->_dismissAffordance;
}

- (void)setWantsSingleRowScrollingLayout:(BOOL)a3
{
  self->_wantsSingleRowScrollingLayout = a3;
}

- (BOOL)wantsSingleRowScrollingLayout
{
  return self->_wantsSingleRowScrollingLayout;
}

- (void)setWantsFooterVisibleWhenEmpty:(BOOL)a3
{
  self->_wantsFooterVisibleWhenEmpty = a3;
}

- (BOOL)wantsFooterVisibleWhenEmpty
{
  return self->_wantsFooterVisibleWhenEmpty;
}

- (void)setWantsFooterVisibleImmediately:(BOOL)a3
{
  self->_wantsFooterVisibleImmediately = a3;
}

- (BOOL)wantsFooterVisibleImmediately
{
  return self->_wantsFooterVisibleImmediately;
}

- (void)setBadgesModifier:(id)a3
{
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (void)setPrivacyController:(id)a3
{
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void)setEmptyPlaceholderStatusViewModel:(id)a3
{
}

- (PXStatusViewModel)emptyPlaceholderStatusViewModel
{
  return self->_emptyPlaceholderStatusViewModel;
}

- (void)setIsEmbedded:(BOOL)a3
{
  self->_isEmbedded = a3;
}

- (BOOL)isEmbedded
{
  return self->_isEmbedded;
}

- (void)setTapbackStatusManager:(id)a3
{
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (void)setDecorationDataSource:(id)a3
{
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (void)setDecorationViewClass:(Class)a3
{
}

- (Class)decorationViewClass
{
  return self->_decorationViewClass;
}

- (void)setContentStartingPosition:(int64_t)a3
{
  self->_contentStartingPosition = a3;
}

- (int64_t)contentStartingPosition
{
  return self->_contentStartingPosition;
}

- (void)setAssetImportStatusManager:(id)a3
{
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setTrailingAccessoryActionType:(id)a3
{
}

- (NSString)trailingAccessoryActionType
{
  return self->_trailingAccessoryActionType;
}

- (void)setCenterAccessoryActionType:(id)a3
{
}

- (NSString)centerAccessoryActionType
{
  return self->_centerAccessoryActionType;
}

- (void)setInfoActionHandler:(id)a3
{
}

- (id)infoActionHandler
{
  return self->_infoActionHandler;
}

- (void)setAllowsMergeDuplicatesAction:(BOOL)a3
{
  self->_allowsMergeDuplicatesAction = a3;
}

- (BOOL)allowsMergeDuplicatesAction
{
  return self->_allowsMergeDuplicatesAction;
}

- (void)setAlwaysIncludeSharedWithYouAssets:(BOOL)a3
{
  self->_alwaysIncludeSharedWithYouAssets = a3;
}

- (BOOL)alwaysIncludeSharedWithYouAssets
{
  return self->_alwaysIncludeSharedWithYouAssets;
}

- (void)setWantsOneUpShowInLibraryButton:(BOOL)a3
{
  self->_wantsOneUpShowInLibraryButton = a3;
}

- (BOOL)wantsOneUpShowInLibraryButton
{
  return self->_wantsOneUpShowInLibraryButton;
}

- (void)setPreventShowInAllPhotosAction:(BOOL)a3
{
  self->_preventShowInAllPhotosAction = a3;
}

- (BOOL)preventShowInAllPhotosAction
{
  return self->_preventShowInAllPhotosAction;
}

- (void)setOneUpPresentationOrigin:(int64_t)a3
{
  self->_oneUpPresentationOrigin = a3;
}

- (int64_t)oneUpPresentationOrigin
{
  return self->_oneUpPresentationOrigin;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setContainerTitle:(id)a3
{
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setAllowsMultiSelectMenu:(BOOL)a3
{
  self->_allowsMultiSelectMenu = a3;
}

- (BOOL)allowsMultiSelectMenu
{
  return self->_allowsMultiSelectMenu;
}

- (void)setAllowsLinkInteractions:(BOOL)a3
{
  self->_allowsLinkInteractions = a3;
}

- (BOOL)allowsLinkInteractions
{
  return self->_allowsLinkInteractions;
}

- (void)setCustomUserDefaults:(id)a3
{
}

- (PXZoomablePhotosUserDefaults)customUserDefaults
{
  return self->_customUserDefaults;
}

- (void)setAllowsUserDefaults:(BOOL)a3
{
  self->_allowsUserDefaults = a3;
}

- (BOOL)allowsUserDefaults
{
  return self->_allowsUserDefaults;
}

- (void)setAllowsSwipeToSelect:(BOOL)a3
{
  self->_allowsSwipeToSelect = a3;
}

- (BOOL)allowsSwipeToSelect
{
  return self->_allowsSwipeToSelect;
}

- (void)setAllowsDragIn:(BOOL)a3
{
  self->_allowsDragIn = a3;
}

- (BOOL)allowsDragIn
{
  return self->_allowsDragIn;
}

- (void)setAllowsDragOut:(BOOL)a3
{
  self->_allowsDragOut = a3;
}

- (BOOL)allowsDragOut
{
  return self->_allowsDragOut;
}

- (void)setAllowsGridAppearanceActions:(BOOL)a3
{
  self->_allowsGridAppearanceActions = a3;
}

- (BOOL)allowsGridAppearanceActions
{
  return self->_allowsGridAppearanceActions;
}

- (void)setAllowsInteractiveFavoriteBadges:(BOOL)a3
{
  self->_allowsInteractiveFavoriteBadges = a3;
}

- (BOOL)allowsInteractiveFavoriteBadges
{
  return self->_allowsInteractiveFavoriteBadges;
}

- (void)setForbiddenBadges:(unint64_t)a3
{
  self->_forbiddenBadges = a3;
}

- (unint64_t)forbiddenBadges
{
  return self->_forbiddenBadges;
}

- (void)setAllowedBehaviors:(unint64_t)a3
{
  self->_allowedBehaviors = a3;
}

- (unint64_t)allowedBehaviors
{
  return self->_allowedBehaviors;
}

- (void)setAllowedActions:(unint64_t)a3
{
  self->_allowedActions = a3;
}

- (unint64_t)allowedActions
{
  return self->_allowedActions;
}

- (void)setNoContentPlaceholderType:(int64_t)a3
{
  self->_noContentPlaceholderType = a3;
}

- (int64_t)noContentPlaceholderType
{
  return self->_noContentPlaceholderType;
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  self->_wantsAssetIndexBadge = a3;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  self->_wantsFileSizeBadge = a3;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (void)setSelectionContextOverride:(int64_t)a3
{
  self->_selectionContextOverride = a3;
}

- (int64_t)selectionContextOverride
{
  return self->_selectionContextOverride;
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  self->_wantsNumberedSelectionStyle = a3;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  self->_wantsDimmedSelectionStyle = a3;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (void)setWantsSelectModeCaptionInContextMenu:(BOOL)a3
{
  self->_wantsSelectModeCaptionInContextMenu = a3;
}

- (BOOL)wantsSelectModeCaptionInContextMenu
{
  return self->_wantsSelectModeCaptionInContextMenu;
}

- (void)setStartsInSelectMode:(BOOL)a3
{
  self->_startsInSelectMode = a3;
}

- (BOOL)startsInSelectMode
{
  return self->_startsInSelectMode;
}

- (void)setAllowsCaptions:(BOOL)a3
{
  self->_allowsCaptions = a3;
}

- (BOOL)allowsCaptions
{
  return self->_allowsCaptions;
}

- (void)setDarkModeBackgroundStyle:(int64_t)a3
{
  self->_darkModeBackgroundStyle = a3;
}

- (int64_t)darkModeBackgroundStyle
{
  return self->_darkModeBackgroundStyle;
}

- (void)setLightModeBackgroundStyle:(int64_t)a3
{
  self->_lightModeBackgroundStyle = a3;
}

- (int64_t)lightModeBackgroundStyle
{
  return self->_lightModeBackgroundStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setIgnoreFilterPredicateAssert:(BOOL)a3
{
  self->_ignoreFilterPredicateAssert = a3;
}

- (BOOL)ignoreFilterPredicateAssert
{
  return self->_ignoreFilterPredicateAssert;
}

- (void)setEnableFilterButton:(BOOL)a3
{
  self->_enableFilterButton = a3;
}

- (BOOL)enableFilterButton
{
  return self->_enableFilterButton;
}

- (void)setIgnoreContentFilterStateWhenNotFiltering:(BOOL)a3
{
  self->_ignoreContentFilterStateWhenNotFiltering = a3;
}

- (BOOL)ignoreContentFilterStateWhenNotFiltering
{
  return self->_ignoreContentFilterStateWhenNotFiltering;
}

- (void)setFullscreenOverlayControllers:(id)a3
{
}

- (NSArray)fullscreenOverlayControllers
{
  return self->_fullscreenOverlayControllers;
}

- (void)setOverlayController:(id)a3
{
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (void)setPreferredColumnCountsDelegate:(id)a3
{
}

- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredColumnCountsDelegate);
  return (PXPhotosPreferredColumnCountsDelegate *)WeakRetained;
}

- (void)setPreferredAssetCropDelegate:(id)a3
{
}

- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredAssetCropDelegate);
  return (PXPhotosPreferredAssetCropDelegate *)WeakRetained;
}

- (void)setShowLoadingPlaceholderWhenEmpty:(BOOL)a3
{
  self->_showLoadingPlaceholderWhenEmpty = a3;
}

- (BOOL)showLoadingPlaceholderWhenEmpty
{
  return self->_showLoadingPlaceholderWhenEmpty;
}

- (void)setItemAspectRatio:(double)a3
{
  self->_itemAspectRatio = a3;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (void)setGridPresentationType:(unsigned __int8)a3
{
  self->_gridPresentationType = a3;
}

- (unsigned)gridPresentationType
{
  return self->_gridPresentationType;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setSummaryStyle:(int64_t)a3
{
  self->_summaryStyle = a3;
}

- (int64_t)summaryStyle
{
  return self->_summaryStyle;
}

- (void)setBannerControllerProvider:(id)a3
{
}

- (id)bannerControllerProvider
{
  return self->_bannerControllerProvider;
}

- (void)setBannerProvider:(id)a3
{
}

- (PXPhotosBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (void)setSectionBodyLayoutProvider:(id)a3
{
}

- (PXPhotosCustomSectionBodyLayoutProvider)sectionBodyLayoutProvider
{
  return self->_sectionBodyLayoutProvider;
}

- (void)setSectionBodyStyle:(int64_t)a3
{
  self->_sectionBodyStyle = a3;
}

- (int64_t)sectionBodyStyle
{
  return self->_sectionBodyStyle;
}

- (void)setGlobalHeaderLayoutProvider:(id)a3
{
}

- (PXPhotosGlobalHeaderLayoutProvider)globalHeaderLayoutProvider
{
  return self->_globalHeaderLayoutProvider;
}

- (void)setSectionHeaderLayoutProvider:(id)a3
{
}

- (PXPhotosSectionHeaderLayoutProvider)sectionHeaderLayoutProvider
{
  return self->_sectionHeaderLayoutProvider;
}

- (void)setSectionHeaderStyle:(int64_t)a3
{
  self->_sectionHeaderStyle = a3;
}

- (int64_t)sectionHeaderStyle
{
  return self->_sectionHeaderStyle;
}

- (void)setWantsAdaptiveSelectModeBarButton:(BOOL)a3
{
  self->_wantsAdaptiveSelectModeBarButton = a3;
}

- (BOOL)wantsAdaptiveSelectModeBarButton
{
  return self->_wantsAdaptiveSelectModeBarButton;
}

- (void)setWantsModernNavBarButtons:(BOOL)a3
{
  self->_wantsModernNavBarButtons = a3;
}

- (BOOL)wantsModernNavBarButtons
{
  return self->_wantsModernNavBarButtons;
}

- (void)setShouldOptOutOfChromelessBars:(BOOL)a3
{
  self->_shouldOptOutOfChromelessBars = a3;
}

- (BOOL)shouldOptOutOfChromelessBars
{
  return self->_shouldOptOutOfChromelessBars;
}

- (void)setScrollIndicatorStyle:(int64_t)a3
{
  self->_scrollIndicatorStyle = a3;
}

- (int64_t)scrollIndicatorStyle
{
  return self->_scrollIndicatorStyle;
}

- (void)setNavBarStyle:(int64_t)a3
{
  self->_navBarStyle = a3;
}

- (int64_t)navBarStyle
{
  return self->_navBarStyle;
}

- (void)setToolbarStyle:(int64_t)a3
{
  self->_toolbarStyle = a3;
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (void)setShowsOnlyAssetsInSelectedItemSectionInOneUp:(BOOL)a3
{
  self->_showsOnlyAssetsInSelectedItemSectionInOneUp = a3;
}

- (BOOL)showsOnlyAssetsInSelectedItemSectionInOneUp
{
  return self->_showsOnlyAssetsInSelectedItemSectionInOneUp;
}

- (void)setContainerProvidesSecondaryToolbar:(BOOL)a3
{
  self->_containerProvidesSecondaryToolbar = a3;
}

- (BOOL)containerProvidesSecondaryToolbar
{
  return self->_containerProvidesSecondaryToolbar;
}

- (void)setWantsExternallyRenderedSecondaryToolbar:(BOOL)a3
{
  self->_wantsExternallyRenderedSecondaryToolbar = a3;
}

- (BOOL)wantsExternallyRenderedSecondaryToolbar
{
  return self->_wantsExternallyRenderedSecondaryToolbar;
}

- (void)setWantsDynamicTitles:(BOOL)a3
{
  self->_wantsDynamicTitles = a3;
}

- (BOOL)wantsDynamicTitles
{
  return self->_wantsDynamicTitles;
}

- (void)setWantsShareGridButtonVisible:(BOOL)a3
{
  self->_wantsShareGridButtonVisible = a3;
}

- (BOOL)wantsShareGridButtonVisible
{
  return self->_wantsShareGridButtonVisible;
}

- (void)setWantsContentFilterVisible:(BOOL)a3
{
  self->_wantsContentFilterVisible = a3;
}

- (BOOL)wantsContentFilterVisible
{
  return self->_wantsContentFilterVisible;
}

- (void)setWantsRenderingStatus:(BOOL)a3
{
  self->_wantsRenderingStatus = a3;
}

- (BOOL)wantsRenderingStatus
{
  return self->_wantsRenderingStatus;
}

- (void)setWantsCPLStatus:(BOOL)a3
{
  self->_wantsCPLStatus = a3;
}

- (BOOL)wantsCPLStatus
{
  return self->_wantsCPLStatus;
}

- (void)setHidesAssetCountInFooter:(BOOL)a3
{
  self->_hidesAssetCountInFooter = a3;
}

- (BOOL)hidesAssetCountInFooter
{
  return self->_hidesAssetCountInFooter;
}

- (void)setWantsFooterMask:(BOOL)a3
{
  self->_wantsFooterMask = a3;
}

- (BOOL)wantsFooterMask
{
  return self->_wantsFooterMask;
}

- (void)setFooterLearnMoreURL:(id)a3
{
}

- (NSURL)footerLearnMoreURL
{
  return self->_footerLearnMoreURL;
}

- (void)setFooterSubtitle:(id)a3
{
}

- (NSString)footerSubtitle
{
  return self->_footerSubtitle;
}

- (void)setFooterViewModel:(id)a3
{
}

- (PXFooterViewModel)footerViewModel
{
  return self->_footerViewModel;
}

- (void)setHidesViewOptionsToolbar:(BOOL)a3
{
  self->_hidesViewOptionsToolbar = a3;
}

- (BOOL)hidesViewOptionsToolbar
{
  return self->_hidesViewOptionsToolbar;
}

- (void)setViewOptionsModel:(id)a3
{
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (void)setFooterVisibilityStyle:(int64_t)a3
{
  self->_footerVisibilityStyle = a3;
}

- (int64_t)footerVisibilityStyle
{
  return self->_footerVisibilityStyle;
}

- (void)setPrefersActionsInToolbar:(BOOL)a3
{
  self->_prefersActionsInToolbar = a3;
}

- (BOOL)prefersActionsInToolbar
{
  return self->_prefersActionsInToolbar;
}

- (void)setCustomDismissHandler:(id)a3
{
}

- (id)customDismissHandler
{
  return self->_customDismissHandler;
}

- (void)setCustomAssetSelectionHandler:(id)a3
{
}

- (id)customAssetSelectionHandler
{
  return self->_customAssetSelectionHandler;
}

- (void)setWantsTitleInNavigationBar:(BOOL)a3
{
  self->_wantsTitleInNavigationBar = a3;
}

- (BOOL)wantsTitleInNavigationBar
{
  return self->_wantsTitleInNavigationBar;
}

- (void)setWantsTabBarHidden:(BOOL)a3
{
  self->_wantsTabBarHidden = a3;
}

- (BOOL)wantsTabBarHidden
{
  return self->_wantsTabBarHidden;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosViewDelegate *)WeakRetained;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (PXAssetActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setAllowsDragAndDrop:(BOOL)a3
{
  BOOL v3 = a3;
  -[PXPhotosViewConfiguration setAllowsDragIn:](self, "setAllowsDragIn:");
  [(PXPhotosViewConfiguration *)self setAllowsDragOut:v3];
}

- (BOOL)allowsDragAndDrop
{
  BOOL v3 = [(PXPhotosViewConfiguration *)self allowsDragIn];
  if (v3)
  {
    LOBYTE(v3) = [(PXPhotosViewConfiguration *)self allowsDragOut];
  }
  return v3;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
  self->_lightModeBackgroundStyle = a3;
  self->_darkModeBackgroundStyle = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PXPhotosViewConfiguration alloc];
  v5 = [(PXPhotosViewConfiguration *)self dataSourceManager];
  v6 = [(PXPhotosViewConfiguration *)self mediaProvider];
  v7 = [(PXPhotosViewConfiguration *)self selectionManager];
  v8 = [(PXPhotosViewConfiguration *)self assetActionManager];
  v9 = [(PXPhotosViewConfiguration *)self assetCollectionActionManager];
  v10 = [(PXPhotosViewConfiguration *)v4 initWithDataSourceManager:v5 mediaProvider:v6 selectionManager:v7 assetActionManager:v8 assetCollectionActionManager:v9];

  v11 = [(PXPhotosViewConfiguration *)self title];
  [(PXPhotosViewConfiguration *)v10 setTitle:v11];

  v12 = [(PXPhotosViewConfiguration *)self containerTitle];
  [(PXPhotosViewConfiguration *)v10 setContainerTitle:v12];

  [(PXPhotosViewConfiguration *)v10 setWantsTabBarHidden:[(PXPhotosViewConfiguration *)self wantsTabBarHidden]];
  [(PXPhotosViewConfiguration *)v10 setWantsDynamicTitles:[(PXPhotosViewConfiguration *)self wantsDynamicTitles]];
  [(PXPhotosViewConfiguration *)v10 setToolbarStyle:[(PXPhotosViewConfiguration *)self toolbarStyle]];
  [(PXPhotosViewConfiguration *)v10 setWantsExternallyRenderedSecondaryToolbar:[(PXPhotosViewConfiguration *)self wantsExternallyRenderedSecondaryToolbar]];
  [(PXPhotosViewConfiguration *)v10 setContainerProvidesSecondaryToolbar:[(PXPhotosViewConfiguration *)self containerProvidesSecondaryToolbar]];
  [(PXPhotosViewConfiguration *)v10 setPrefersActionsInToolbar:[(PXPhotosViewConfiguration *)self prefersActionsInToolbar]];
  [(PXPhotosViewConfiguration *)v10 setWantsContentFilterVisible:[(PXPhotosViewConfiguration *)self wantsContentFilterVisible]];
  [(PXPhotosViewConfiguration *)v10 setFooterVisibilityStyle:[(PXPhotosViewConfiguration *)self footerVisibilityStyle]];
  v13 = [(PXPhotosViewConfiguration *)self footerSubtitle];
  [(PXPhotosViewConfiguration *)v10 setFooterSubtitle:v13];

  v14 = [(PXPhotosViewConfiguration *)self footerLearnMoreURL];
  [(PXPhotosViewConfiguration *)v10 setFooterLearnMoreURL:v14];

  v15 = [(PXPhotosViewConfiguration *)self footerViewModel];
  [(PXPhotosViewConfiguration *)v10 setFooterViewModel:v15];

  v16 = [(PXPhotosViewConfiguration *)self viewOptionsModel];
  [(PXPhotosViewConfiguration *)v10 setViewOptionsModel:v16];

  [(PXPhotosViewConfiguration *)v10 setHidesViewOptionsToolbar:[(PXPhotosViewConfiguration *)self hidesViewOptionsToolbar]];
  [(PXPhotosViewConfiguration *)v10 setWantsFooterMask:[(PXPhotosViewConfiguration *)self wantsFooterMask]];
  [(PXPhotosViewConfiguration *)v10 setHidesAssetCountInFooter:[(PXPhotosViewConfiguration *)self hidesAssetCountInFooter]];
  [(PXPhotosViewConfiguration *)v10 setWantsCPLStatus:[(PXPhotosViewConfiguration *)self wantsCPLStatus]];
  [(PXPhotosViewConfiguration *)v10 setWantsRenderingStatus:[(PXPhotosViewConfiguration *)self wantsRenderingStatus]];
  [(PXPhotosViewConfiguration *)v10 setNavBarStyle:[(PXPhotosViewConfiguration *)self navBarStyle]];
  [(PXPhotosViewConfiguration *)v10 setScrollIndicatorStyle:[(PXPhotosViewConfiguration *)self scrollIndicatorStyle]];
  [(PXPhotosViewConfiguration *)v10 setShouldOptOutOfChromelessBars:[(PXPhotosViewConfiguration *)self shouldOptOutOfChromelessBars]];
  [(PXPhotosViewConfiguration *)v10 setWantsModernNavBarButtons:[(PXPhotosViewConfiguration *)self wantsModernNavBarButtons]];
  [(PXPhotosViewConfiguration *)v10 setWantsAdaptiveSelectModeBarButton:[(PXPhotosViewConfiguration *)self wantsAdaptiveSelectModeBarButton]];
  [(PXPhotosViewConfiguration *)v10 setSectionHeaderStyle:[(PXPhotosViewConfiguration *)self sectionHeaderStyle]];
  v17 = [(PXPhotosViewConfiguration *)self sectionHeaderLayoutProvider];
  [(PXPhotosViewConfiguration *)v10 setSectionHeaderLayoutProvider:v17];

  [(PXPhotosViewConfiguration *)v10 setSectionBodyStyle:[(PXPhotosViewConfiguration *)self sectionBodyStyle]];
  v18 = [(PXPhotosViewConfiguration *)self sectionBodyLayoutProvider];
  [(PXPhotosViewConfiguration *)v10 setSectionBodyLayoutProvider:v18];

  v19 = [(PXPhotosViewConfiguration *)self globalHeaderLayoutProvider];
  [(PXPhotosViewConfiguration *)v10 setGlobalHeaderLayoutProvider:v19];

  v20 = [(PXPhotosViewConfiguration *)self bannerProvider];
  [(PXPhotosViewConfiguration *)v10 setBannerProvider:v20];

  v21 = [(PXPhotosViewConfiguration *)self bannerControllerProvider];
  [(PXPhotosViewConfiguration *)v10 setBannerControllerProvider:v21];

  [(PXPhotosViewConfiguration *)v10 setGridStyle:[(PXPhotosViewConfiguration *)self gridStyle]];
  [(PXPhotosViewConfiguration *)v10 setGridPresentationType:[(PXPhotosViewConfiguration *)self gridPresentationType]];
  [(PXPhotosViewConfiguration *)v10 setPreferredUserInterfaceStyle:[(PXPhotosViewConfiguration *)self preferredUserInterfaceStyle]];
  [(PXPhotosViewConfiguration *)self itemAspectRatio];
  -[PXPhotosViewConfiguration setItemAspectRatio:](v10, "setItemAspectRatio:");
  [(PXPhotosViewConfiguration *)v10 setShowLoadingPlaceholderWhenEmpty:[(PXPhotosViewConfiguration *)self showLoadingPlaceholderWhenEmpty]];
  v22 = [(PXPhotosViewConfiguration *)self preferredAssetCropDelegate];
  [(PXPhotosViewConfiguration *)v10 setPreferredAssetCropDelegate:v22];

  v23 = [(PXPhotosViewConfiguration *)self preferredColumnCountsDelegate];
  [(PXPhotosViewConfiguration *)v10 setPreferredColumnCountsDelegate:v23];

  [(PXPhotosViewConfiguration *)v10 setIgnoreContentFilterStateWhenNotFiltering:[(PXPhotosViewConfiguration *)self ignoreContentFilterStateWhenNotFiltering]];
  [(PXPhotosViewConfiguration *)v10 setIgnoreFilterPredicateAssert:[(PXPhotosViewConfiguration *)self ignoreFilterPredicateAssert]];
  [(PXPhotosViewConfiguration *)v10 setAllowsCaptions:[(PXPhotosViewConfiguration *)self allowsCaptions]];
  [(PXPhotosViewConfiguration *)v10 setAllowsGridAppearanceActions:[(PXPhotosViewConfiguration *)self allowsGridAppearanceActions]];
  [(PXPhotosViewConfiguration *)v10 setAllowedActions:[(PXPhotosViewConfiguration *)self allowedActions]];
  [(PXPhotosViewConfiguration *)v10 setAllowedBehaviors:[(PXPhotosViewConfiguration *)self allowedBehaviors]];
  [(PXPhotosViewConfiguration *)v10 setWantsDimmedSelectionStyle:[(PXPhotosViewConfiguration *)self wantsDimmedSelectionStyle]];
  [(PXPhotosViewConfiguration *)v10 setWantsNumberedSelectionStyle:[(PXPhotosViewConfiguration *)self wantsNumberedSelectionStyle]];
  [(PXPhotosViewConfiguration *)v10 setSelectionContextOverride:[(PXPhotosViewConfiguration *)self selectionContextOverride]];
  [(PXPhotosViewConfiguration *)v10 setWantsFileSizeBadge:[(PXPhotosViewConfiguration *)self wantsFileSizeBadge]];
  [(PXPhotosViewConfiguration *)v10 setWantsAssetIndexBadge:[(PXPhotosViewConfiguration *)self wantsAssetIndexBadge]];
  [(PXPhotosViewConfiguration *)v10 setNoContentPlaceholderType:[(PXPhotosViewConfiguration *)self noContentPlaceholderType]];
  [(PXPhotosViewConfiguration *)v10 setForbiddenBadges:[(PXPhotosViewConfiguration *)self forbiddenBadges]];
  [(PXPhotosViewConfiguration *)v10 setAllowsInteractiveFavoriteBadges:[(PXPhotosViewConfiguration *)self allowsInteractiveFavoriteBadges]];
  [(PXPhotosViewConfiguration *)v10 setAllowsDragIn:[(PXPhotosViewConfiguration *)self allowsDragIn]];
  [(PXPhotosViewConfiguration *)v10 setAllowsDragOut:[(PXPhotosViewConfiguration *)self allowsDragOut]];
  [(PXPhotosViewConfiguration *)v10 setAllowsSwipeToSelect:[(PXPhotosViewConfiguration *)self allowsSwipeToSelect]];
  [(PXPhotosViewConfiguration *)v10 setOneUpPresentationOrigin:[(PXPhotosViewConfiguration *)self oneUpPresentationOrigin]];
  [(PXPhotosViewConfiguration *)v10 setPreventShowInAllPhotosAction:[(PXPhotosViewConfiguration *)self preventShowInAllPhotosAction]];
  [(PXPhotosViewConfiguration *)v10 setWantsOneUpShowInLibraryButton:[(PXPhotosViewConfiguration *)self wantsOneUpShowInLibraryButton]];
  [(PXPhotosViewConfiguration *)v10 setAllowsMergeDuplicatesAction:[(PXPhotosViewConfiguration *)self allowsMergeDuplicatesAction]];
  [(PXPhotosViewConfiguration *)v10 setAlwaysIncludeSharedWithYouAssets:[(PXPhotosViewConfiguration *)self alwaysIncludeSharedWithYouAssets]];
  v24 = [(PXPhotosViewConfiguration *)self infoActionHandler];
  [(PXPhotosViewConfiguration *)v10 setInfoActionHandler:v24];

  v25 = [(PXPhotosViewConfiguration *)self centerAccessoryActionType];
  [(PXPhotosViewConfiguration *)v10 setCenterAccessoryActionType:v25];

  v26 = [(PXPhotosViewConfiguration *)self trailingAccessoryActionType];
  [(PXPhotosViewConfiguration *)v10 setTrailingAccessoryActionType:v26];

  v27 = [(PXPhotosViewConfiguration *)self loadingStatusManager];
  [(PXPhotosViewConfiguration *)v10 setLoadingStatusManager:v27];

  v28 = [(PXPhotosViewConfiguration *)self assetImportStatusManager];
  [(PXPhotosViewConfiguration *)v10 setAssetImportStatusManager:v28];

  v29 = [(PXPhotosViewConfiguration *)self delegate];
  [(PXPhotosViewConfiguration *)v10 setDelegate:v29];

  [(PXPhotosViewConfiguration *)v10 setStartsInSelectMode:[(PXPhotosViewConfiguration *)self startsInSelectMode]];
  [(PXPhotosViewConfiguration *)v10 setWantsSelectModeCaptionInContextMenu:[(PXPhotosViewConfiguration *)self wantsSelectModeCaptionInContextMenu]];
  [(PXPhotosViewConfiguration *)v10 setLowMemoryMode:[(PXPhotosViewConfiguration *)self lowMemoryMode]];
  [(PXPhotosViewConfiguration *)v10 setContentMode:[(PXPhotosViewConfiguration *)self contentMode]];
  [(PXPhotosViewConfiguration *)v10 setContentStartingPosition:[(PXPhotosViewConfiguration *)self contentStartingPosition]];
  [(PXPhotosViewConfiguration *)v10 setDecorationViewClass:[(PXPhotosViewConfiguration *)self decorationViewClass]];
  [(PXPhotosViewConfiguration *)v10 setBackgroundStyle:[(PXPhotosViewConfiguration *)self backgroundStyle]];
  [(PXPhotosViewConfiguration *)v10 setLightModeBackgroundStyle:[(PXPhotosViewConfiguration *)self lightModeBackgroundStyle]];
  [(PXPhotosViewConfiguration *)v10 setDarkModeBackgroundStyle:[(PXPhotosViewConfiguration *)self darkModeBackgroundStyle]];
  v30 = [(PXPhotosViewConfiguration *)self tapbackStatusManager];
  [(PXPhotosViewConfiguration *)v10 setTapbackStatusManager:v30];

  v31 = [(PXPhotosViewConfiguration *)self decorationDataSource];
  [(PXPhotosViewConfiguration *)v10 setDecorationDataSource:v31];

  [(PXPhotosViewConfiguration *)v10 setIsEmbedded:[(PXPhotosViewConfiguration *)self isEmbedded]];
  [(PXPhotosViewConfiguration *)v10 setAllowsUserDefaults:[(PXPhotosViewConfiguration *)self allowsUserDefaults]];
  v32 = [(PXPhotosViewConfiguration *)self customUserDefaults];
  [(PXPhotosViewConfiguration *)v10 setCustomUserDefaults:v32];

  [(PXPhotosViewConfiguration *)v10 setAllowsLinkInteractions:[(PXPhotosViewConfiguration *)self allowsLinkInteractions]];
  [(PXPhotosViewConfiguration *)v10 setAllowsMultiSelectMenu:[(PXPhotosViewConfiguration *)self allowsMultiSelectMenu]];
  v33 = [(PXPhotosViewConfiguration *)self emptyPlaceholderStatusViewModel];
  [(PXPhotosViewConfiguration *)v10 setEmptyPlaceholderStatusViewModel:v33];

  v34 = [(PXPhotosViewConfiguration *)self privacyController];
  [(PXPhotosViewConfiguration *)v10 setPrivacyController:v34];

  v35 = [(PXPhotosViewConfiguration *)self searchQueryMatchInfo];
  [(PXPhotosViewConfiguration *)v10 setSearchQueryMatchInfo:v35];

  v36 = [(PXPhotosViewConfiguration *)self badgesModifier];
  [(PXPhotosViewConfiguration *)v10 setBadgesModifier:v36];

  [(PXPhotosViewConfiguration *)v10 setWantsFooterVisibleImmediately:[(PXPhotosViewConfiguration *)self wantsFooterVisibleImmediately]];
  [(PXPhotosViewConfiguration *)v10 setWantsFooterVisibleWhenEmpty:[(PXPhotosViewConfiguration *)self wantsFooterVisibleWhenEmpty]];
  [(PXPhotosViewConfiguration *)v10 setWantsSingleRowScrollingLayout:[(PXPhotosViewConfiguration *)self wantsSingleRowScrollingLayout]];
  [(PXPhotosViewConfiguration *)v10 setDismissAffordance:[(PXPhotosViewConfiguration *)self dismissAffordance]];
  [(PXPhotosViewConfiguration *)v10 setAllowedInteractiveDismissBehaviors:[(PXPhotosViewConfiguration *)self allowedInteractiveDismissBehaviors]];
  v37 = [(PXPhotosViewConfiguration *)self initialNavigationObjectReference];
  [(PXPhotosViewConfiguration *)v10 setInitialNavigationObjectReference:v37];

  [(PXPhotosViewConfiguration *)v10 setInitialNavigationScrollPosition:[(PXPhotosViewConfiguration *)self initialNavigationScrollPosition]];
  [(PXPhotosViewConfiguration *)v10 setScrollingBehavior:[(PXPhotosViewConfiguration *)self scrollingBehavior]];
  [(PXPhotosViewConfiguration *)v10 setWantsShareGridButtonVisible:[(PXPhotosViewConfiguration *)self wantsShareGridButtonVisible]];
  [(PXPhotosViewConfiguration *)v10 setOverrideDefaultNumberOfColumns:[(PXPhotosViewConfiguration *)self overrideDefaultNumberOfColumns]];
  [(PXPhotosViewConfiguration *)v10 setContentShiftStrategy:[(PXPhotosViewConfiguration *)self contentShiftStrategy]];
  v38 = [(PXPhotosViewConfiguration *)self pickerClientBundleIdentifier];
  [(PXPhotosViewConfiguration *)v10 setPickerClientBundleIdentifier:v38];

  [(PXPhotosViewConfiguration *)v10 setUseLowMemoryDecode:[(PXPhotosViewConfiguration *)self useLowMemoryDecode]];
  [(PXPhotosViewConfiguration *)v10 setEnableSupportForTungstenUnderlay:[(PXPhotosViewConfiguration *)self enableSupportForTungstenUnderlay]];
  v39 = [(PXPhotosViewConfiguration *)self overlayController];
  [(PXPhotosViewConfiguration *)v10 setOverlayController:v39];

  v40 = [(PXPhotosViewConfiguration *)self fullscreenOverlayControllers];
  [(PXPhotosViewConfiguration *)v10 setFullscreenOverlayControllers:v40];

  v41 = [(PXPhotosViewConfiguration *)self customAssetSelectionHandler];
  [(PXPhotosViewConfiguration *)v10 setCustomAssetSelectionHandler:v41];

  v42 = [(PXPhotosViewConfiguration *)self customDismissHandler];
  [(PXPhotosViewConfiguration *)v10 setCustomDismissHandler:v42];

  [(PXPhotosViewConfiguration *)v10 setShowsOnlyAssetsInSelectedItemSectionInOneUp:[(PXPhotosViewConfiguration *)self showsOnlyAssetsInSelectedItemSectionInOneUp]];
  [(PXPhotosViewConfiguration *)v10 setWantsTitleInNavigationBar:[(PXPhotosViewConfiguration *)self wantsTitleInNavigationBar]];
  [(PXPhotosViewConfiguration *)v10 setScrollDetentsProviderClass:[(PXPhotosViewConfiguration *)self scrollDetentsProviderClass]];
  v43 = [(PXPhotosViewConfiguration *)self initialScrollPositionDetentIdentifier];
  [(PXPhotosViewConfiguration *)v10 setInitialScrollPositionDetentIdentifier:v43];

  [(PXPhotosViewConfiguration *)v10 copySwiftPropertiesFromConfiguration:self];
  [(PXPhotosViewConfiguration *)v10 setEnableFilterButton:[(PXPhotosViewConfiguration *)self enableFilterButton]];
  return v10;
}

- (PXPhotosViewConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosViewConfiguration.m", 62, @"%s is not available as initializer", "-[PXPhotosViewConfiguration init]");

  abort();
}

- (PXPhotosViewConfiguration)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 selectionManager:(id)a5 assetActionManager:(id)a6 assetCollectionActionManager:(id)a7
{
  id v11 = a3;
  id v14 = a3;
  id v43 = a4;
  id v15 = a5;
  id v16 = a6;
  id obj = a7;
  id v42 = a7;
  if (v15)
  {
    id v17 = [v15 dataSourceManager];

    if (v17 != v14)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PXPhotosViewConfiguration.m", 30, @"Invalid parameter not satisfying: %@", @"selectionManager == nil || selectionManager.dataSourceManager == dataSourceManager" object file lineNumber description];
    }
  }
  uint64_t v19 = [v16 selectionManager];
  if (v19)
  {
    v20 = (void *)v19;
    [v16 selectionManager];
    id v40 = v16;
    id v21 = v15;
    v22 = self;
    id v23 = v11;
    id v24 = a4;
    id v25 = a5;
    v26 = a2;
    v28 = id v27 = v14;
    id v29 = [v28 dataSourceManager];

    id v14 = v27;
    a2 = v26;
    a5 = v25;
    a4 = v24;
    id v11 = v23;
    self = v22;
    id v15 = v21;
    id v16 = v40;

    if (v29 != v14)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, self, @"PXPhotosViewConfiguration.m", 31, @"Invalid parameter not satisfying: %@", @"assetActionManager.selectionManager == nil || assetActionManager.selectionManager.dataSourceManager == dataSourceManager" object file lineNumber description];
    }
  }
  if (v15)
  {
    uint64_t v31 = [v16 selectionManager];
    if (v31)
    {
      v32 = (void *)v31;
      id v33 = [v16 selectionManager];

      if (v33 != v15)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, self, @"PXPhotosViewConfiguration.m", 32, @"Invalid parameter not satisfying: %@", @"selectionManager == nil || assetActionManager.selectionManager == nil || assetActionManager.selectionManager == selectionManager" object file lineNumber description];
      }
    }
  }
  v44.receiver = self;
  v44.super_class = (Class)PXPhotosViewConfiguration;
  v35 = [(PXPhotosViewConfiguration *)&v44 init];
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_dataSourceManager, v11);
    objc_storeStrong((id *)&v36->_mediaProvider, a4);
    objc_storeStrong((id *)&v36->_selectionManager, a5);
    if (v16) {
      v37 = (PXAssetActionManager *)v16;
    }
    else {
      v37 = [[PXAssetActionManager alloc] initWithSelectionManager:0];
    }
    assetActionManager = v36->_assetActionManager;
    v36->_assetActionManager = v37;

    objc_storeStrong((id *)&v36->_assetCollectionActionManager, obj);
    v36->_allowsInteractiveFavoriteBadges = 1;
    *(_WORD *)&v36->_allowsDragOut = 257;
    v36->_allowsSwipeToSelect = 1;
    v36->_isEmbedded = 1;
    v36->_itemAspectRatio = 1.0;
    v36->_allowedActions = 536903840;
    v36->_allowedBehaviors = 65585;
    v36->_contentStartingPosition = 0;
    v36->_allowsUserDefaults = PLIsPhotoPicker() ^ 1;
    v36->_allowsMultiSelectMenu = PLIsMobileSlideShow();
    v36->_dismissAffordance = 0;
    v36->_initialNavigationScrollPosition = 0;
    v36->_gridPresentationType = 0;
    v36->_scrollIndicatorStyle = 0;
    v36->_enableFilterButton = 1;
  }

  return v36;
}

@end