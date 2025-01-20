@interface PXPhotosViewModel
- (BOOL)_shouldMimicSystemChromelessUsingManualScrollEdgeAppearance;
- (BOOL)allowsAccessoriesContextMenuCustomization;
- (BOOL)allowsActionMenuBehavior;
- (BOOL)allowsAddAction;
- (BOOL)allowsAddToLibraryAction;
- (BOOL)allowsCMMActions;
- (BOOL)allowsCaptionsInSquareBehavior;
- (BOOL)allowsChromeManagementBehavior;
- (BOOL)allowsContentSyndicationSaveAllAction;
- (BOOL)allowsContextMenuCustomization;
- (BOOL)allowsCopyAction;
- (BOOL)allowsDismissAction;
- (BOOL)allowsDoubleTapBehavior;
- (BOOL)allowsDragIn;
- (BOOL)allowsDragOut;
- (BOOL)allowsEmptyPlaceholderBehavior;
- (BOOL)allowsFileRadarAction;
- (BOOL)allowsGridAppearanceActions;
- (BOOL)allowsHoverBehavior;
- (BOOL)allowsInfoAction;
- (BOOL)allowsInlineAddBehavior;
- (BOOL)allowsInteractiveFavoriteBadges;
- (BOOL)allowsLensControl;
- (BOOL)allowsLinkInteractions;
- (BOOL)allowsMacStyleSelection;
- (BOOL)allowsMergeDuplicatesAction;
- (BOOL)allowsMoveToLibraryAction;
- (BOOL)allowsMoveToPersonalLibraryAction;
- (BOOL)allowsMoveToSharedLibraryAction;
- (BOOL)allowsMultiSelectMenu;
- (BOOL)allowsOneUpPresentation;
- (BOOL)allowsPickAssetAction;
- (BOOL)allowsPopOnContainerDeleteBehavior;
- (BOOL)allowsPopOnEmptyBehavior;
- (BOOL)allowsPreviewHeader;
- (BOOL)allowsQuickLookAction;
- (BOOL)allowsReplyAction;
- (BOOL)allowsSearch;
- (BOOL)allowsSelectAllAction;
- (BOOL)allowsSelectModeToggle;
- (BOOL)allowsSelectSectionAction;
- (BOOL)allowsSelectionUserActivityBehavior;
- (BOOL)allowsShareAction;
- (BOOL)allowsShareAllAction;
- (BOOL)allowsShowDetails;
- (BOOL)allowsShowMapAction;
- (BOOL)allowsSlideshowAction;
- (BOOL)allowsSwipeToSelect;
- (BOOL)allowsSwitchLibraryAction;
- (BOOL)allowsSyndicatedContentFiltering;
- (BOOL)allowsTapbackAction;
- (BOOL)allowsTrashAction;
- (BOOL)allowsUserDefaults;
- (BOOL)alwaysIncludeSharedWithYouAssets;
- (BOOL)alwaysRequiresLightChrome;
- (BOOL)aspectFitContent;
- (BOOL)attemptSetInSelectMode:(BOOL)a3;
- (BOOL)canEnterSelectMode;
- (BOOL)canFilterContent;
- (BOOL)canPresentOneUp;
- (BOOL)canShowSortButton;
- (BOOL)canSwipeSelect;
- (BOOL)captionsVisible;
- (BOOL)contentStartsAtEnd;
- (BOOL)dismissRequested;
- (BOOL)footerHasImportantInformation;
- (BOOL)handlePrimaryAction:(id)a3;
- (BOOL)hasScrollableContent;
- (BOOL)hideFooterInSelectMode;
- (BOOL)hideSurroundingContent;
- (BOOL)hidesAssetCountInFooter;
- (BOOL)hidesNavbar;
- (BOOL)hidesToolbar;
- (BOOL)hidesViewOptionsToolbar;
- (BOOL)ignoreContentFilterStateWhenNotFiltering;
- (BOOL)isAppearing;
- (BOOL)isContentBelowTitle;
- (BOOL)isEmbedded;
- (BOOL)isFaceModeEnabled;
- (BOOL)isInCompactMode;
- (BOOL)isInSelectMode;
- (BOOL)isInitializing;
- (BOOL)isInteractiveZooming;
- (BOOL)isModalInPresentation;
- (BOOL)isScrollDisabledForAxis:(int64_t)a3;
- (BOOL)isScrolledToBottom;
- (BOOL)isScrolledToTop;
- (BOOL)isShowingAlternateContent;
- (BOOL)keepsTabBarAlwaysHidden;
- (BOOL)lowMemoryMode;
- (BOOL)neverShowsLensControl;
- (BOOL)prefersActionsInToolbar;
- (BOOL)preventShowInAllPhotosAction;
- (BOOL)requiresLightTopBars;
- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3;
- (BOOL)shouldAlwaysRespectToolbarActionPlacementPreference;
- (BOOL)shouldAnimateZooming;
- (BOOL)shouldAspectFitContentByDefault;
- (BOOL)shouldOptOutOfChromelessBars;
- (BOOL)showLoadingPlaceholderWhenEmpty;
- (BOOL)showsOnlyAssetsInSelectedItemSectionInOneUp;
- (BOOL)showsPlayAsMemoryButton;
- (BOOL)startsInSelectMode;
- (BOOL)supportsAspectRatioToggle;
- (BOOL)supportsPeopleActions;
- (BOOL)supportsSocialGroupActions;
- (BOOL)supportsZooming;
- (BOOL)swift_collectionKindSupportsTogglingPreviewHeader;
- (BOOL)useLowMemoryDecode;
- (BOOL)viewBasedDecorationsEnabled;
- (BOOL)viewDelegateRespondsTo:(unint64_t)a3;
- (BOOL)wantsAdaptiveSelectModeBarButton;
- (BOOL)wantsAssetIndexBadge;
- (BOOL)wantsCPLStatus;
- (BOOL)wantsContentFilterVisible;
- (BOOL)wantsContentUnavailableUnlockButtonVisible;
- (BOOL)wantsCuration;
- (BOOL)wantsDimmedSelectionStyle;
- (BOOL)wantsDynamicTitles;
- (BOOL)wantsFileSizeBadge;
- (BOOL)wantsFloatingTitle;
- (BOOL)wantsFooterMask;
- (BOOL)wantsFooterVisible;
- (BOOL)wantsFooterVisibleImmediately;
- (BOOL)wantsFooterVisibleWhenEmpty;
- (BOOL)wantsLensControlVisible;
- (BOOL)wantsModernNavBarButtons;
- (BOOL)wantsNavbarVisible;
- (BOOL)wantsNumberedSelectionStyle;
- (BOOL)wantsOneUpShowInLibraryButton;
- (BOOL)wantsRenderingStatus;
- (BOOL)wantsSelectButton;
- (BOOL)wantsSelectModeCaptionInContextMenu;
- (BOOL)wantsShareGridButtonVisible;
- (BOOL)wantsSingleRowScrollingLayout;
- (BOOL)wantsTabBarVisible;
- (BOOL)wantsTitleInNavigationBar;
- (BOOL)wantsToolbarVisible;
- (BOOL)wantsTopBadgesWithViewBasedDecorations;
- (Class)cplActionManagerClass;
- (Class)decorationViewClass;
- (NSArray)availableLenses;
- (NSArray)fullscreenOverlayControllers;
- (NSArray)internalMenuProducers;
- (NSNumber)topDismissAreaHeight;
- (NSNumber)userWantsAspectFitContent;
- (NSOrderedSet)visibleAssetCollections;
- (NSSet)draggedAssetReferences;
- (NSString)centerAccessoryActionType;
- (NSString)collectionKindPreviewHeaderDisabledUserDefaultsKey;
- (NSString)containerTitle;
- (NSString)debugDescription;
- (NSString)footerSubtitle;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (NSString)initialScrollPositionDetentIdentifier;
- (NSString)noContentPlaceholderFallbackMessage;
- (NSString)noContentPlaceholderFallbackTitle;
- (NSString)pickerClientBundleIdentifier;
- (NSString)previewHeaderDisabledUserDefaultsKey;
- (NSString)title;
- (NSString)trailingAccessoryActionType;
- (NSURL)footerLearnMoreURL;
- (PXAssetActionManager)assetActionManager;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXAssetImportStatusManager)assetImportStatusManager;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetReference)firstSelectedAssetReference;
- (PXAssetReference)singleSelectedAssetReference;
- (PXAssetReference)zoomAnchorAssetReference;
- (PXAssetsDataSource)currentDataSource;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXBrowserSelectionSnapshot)browserSelectionSnapshot;
- (PXContentFilterState)contentFilterState;
- (PXContentPrivacyController)privacyController;
- (PXFooterViewModel)footerViewModel;
- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController;
- (PXLibraryFilterState)libraryFilterState;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXMediaProvider)mediaProvider;
- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory;
- (PXPhotosCustomViewDecorationDataSource)decorationDataSource;
- (PXPhotosGridActionManager)gridActionManager;
- (PXPhotosHeaderCustomizationModel)headerCustomizationModel;
- (PXPhotosLayoutSpecManager)specManager;
- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate;
- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate;
- (PXPhotosViewDelegate)viewDelegate;
- (PXPhotosViewLens)currentLens;
- (PXPhotosViewModel)init;
- (PXPhotosViewModel)initWithConfiguration:(id)a3 specManager:(id)a4;
- (PXPhotosViewModel)initWithConfiguration:(id)a3 specManager:(id)a4 inlinePlaybackController:(id)a5;
- (PXPhotosViewOptionsModel)viewOptionsModel;
- (PXScrollDetent)lastPreferredScrollDetent;
- (PXScrollDetent)lastTargetPreferredScrollDetent;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (PXSectionedObjectReference)initialNavigationObjectReference;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXStatusViewModel)emptyPlaceholderStatusViewModel;
- (PXTapbackStatusManager)tapbackStatusManager;
- (PXUpdater)updater;
- (PXZoomablePhotosUserDefaults)customUserDefaults;
- (UIEdgeInsets)additionalAspectFitEdgeMargins;
- (UIEdgeInsets)contentBackgroundInsets;
- (UIView)customBannerView;
- (UIView)customLeadingAccessoryView;
- (UIView)customTrailingAccessoryView;
- (_NSRange)yearsMonthsZoomStepRange;
- (double)chromeOpacity;
- (double)chromeTitleFloatingFraction;
- (double)contentBackgroundOpacity;
- (double)floatingTitleOpacity;
- (double)headerFloatingThresholdOffset;
- (double)headerTitleTopInset;
- (double)itemAspectRatio;
- (double)titleBackgroundOpacity;
- (double)topBarsAppearanceChangeAnimationDuration;
- (double)zoomStep;
- (id)_indexPathsForAssetCollectionReference:(id)a3;
- (id)_initialContentFilterState;
- (id)_initialLibraryFilterStateForConfiguration:(id)a3;
- (id)_updatedContentFilterState;
- (id)badgesModifier;
- (id)bannerControllerProvider;
- (id)currentDataSourceContainer;
- (id)customAssetSelectionHandler;
- (id)customExcludedActionTypesProvider;
- (id)effectProvider;
- (id)infoActionHandler;
- (id)selectionManager:(id)a3 validateSnapshot:(id)a4;
- (int64_t)allowedGesturesKind;
- (int64_t)appearState;
- (int64_t)configuredSectionBodyStyle;
- (int64_t)configuredSectionHeaderStyle;
- (int64_t)contentPrivacyState;
- (int64_t)contentShiftStrategy;
- (int64_t)defaultZoomStep;
- (int64_t)desiredCurationLength;
- (int64_t)dismissAffordance;
- (int64_t)emptyPlaceholderState;
- (int64_t)footerVisibilityStyle;
- (int64_t)gridStyle;
- (int64_t)initialNavigationScrollPosition;
- (int64_t)navBarStyle;
- (int64_t)noContentPlaceholderType;
- (int64_t)numberOfZoomSteps;
- (int64_t)oneUpPresentationOrigin;
- (int64_t)overrideDefaultNumberOfColumns;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)scrollingBehavior;
- (int64_t)searchActionLocation;
- (int64_t)selectionContext;
- (int64_t)systemAuthenticationType;
- (int64_t)toolbarStyle;
- (unint64_t)allowedChromeItems;
- (unint64_t)chromeItemsToBeConsideredVisibleForLayoutPurpose;
- (unint64_t)forbiddenBadges;
- (unint64_t)viewDelegateRespondsTo;
- (void)_invalidateAspectFitContent;
- (void)_invalidateAssetsDataSourceManager;
- (void)_invalidateAvailableLenses;
- (void)_invalidateChromeVisibility;
- (void)_invalidateContentPrivacyState;
- (void)_invalidateCurrentDataSourceContainer;
- (void)_invalidateCurrentLens;
- (void)_invalidateDraggedAssetReferences;
- (void)_invalidateEmptyPlaceholderState;
- (void)_invalidateFooterVisibility;
- (void)_invalidateGridAppearance;
- (void)_invalidatePersonContainerProperties;
- (void)_invalidateSystemAuthenticationType;
- (void)_invalidateTopBarsStyles;
- (void)_invalidateUserWantsAspectFitContent;
- (void)_invalidateWantsContentUnavailableUnlockButtonVisible;
- (void)_invalidateWantsLensControlVisible;
- (void)_setNeedsUpdate;
- (void)_updateAspectFitContent;
- (void)_updateAssetsDataSourceManager;
- (void)_updateAvailableLenses;
- (void)_updateChromeVisibility;
- (void)_updateContentPrivacyState;
- (void)_updateCurrentDataSourceContainer;
- (void)_updateCurrentLens;
- (void)_updateDataSourceDependentProperties;
- (void)_updateDraggedAssetReferences;
- (void)_updateEmptyPlaceholderState;
- (void)_updateFooterVisibility;
- (void)_updateGridAppearance;
- (void)_updatePersonContainerProperties;
- (void)_updateSortOrder;
- (void)_updateSystemAuthenticationType;
- (void)_updateTopBarsStyles;
- (void)_updateUserWantsAspectFitContent;
- (void)_updateWantsContentUnavailableUnlockButtonVisible;
- (void)_updateWantsLensControlVisible;
- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3;
- (void)assetsDataSourceManagerDidFinishLoadingInitialDataSource:(id)a3;
- (void)clickSelectAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4;
- (void)clickSelectIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4;
- (void)dealloc;
- (void)deselectAll;
- (void)didPerformChanges;
- (void)markContentAsViewed;
- (void)noteFullscreenOverlayControllersChanged;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performChanges:(id)a3;
- (void)registerInternalMenuProducer:(id)a3;
- (void)resetToInitialSelectionAndFilteringState;
- (void)selectAll;
- (void)setAdditionalAspectFitEdgeMargins:(UIEdgeInsets)a3;
- (void)setAllowedChromeItems:(unint64_t)a3;
- (void)setAllowedGesturesKind:(int64_t)a3;
- (void)setAllowsEmptyPlaceholderBehavior:(BOOL)a3;
- (void)setAllowsPreviewHeader:(BOOL)a3;
- (void)setAlwaysRequiresLightChrome:(BOOL)a3;
- (void)setAppearState:(int64_t)a3;
- (void)setAspectFitContent:(BOOL)a3;
- (void)setAspectRatioToggleAllowed:(BOOL)a3 forReason:(id)a4;
- (void)setAvailableLenses:(id)a3;
- (void)setCaptionsVisible:(BOOL)a3;
- (void)setChromeItemsToBeConsideredVisibleForLayoutPurpose:(unint64_t)a3;
- (void)setChromeOpacity:(double)a3;
- (void)setChromeTitleFloatingFraction:(double)a3;
- (void)setContentBackgroundInsets:(UIEdgeInsets)a3;
- (void)setContentBackgroundOpacity:(double)a3;
- (void)setContentBelowTitle:(BOOL)a3;
- (void)setContentFilterState:(id)a3;
- (void)setContentPrivacyState:(int64_t)a3;
- (void)setCplActionManagerClass:(Class)a3;
- (void)setCurrentDataSource:(id)a3;
- (void)setCurrentDataSourceContainer:(id)a3;
- (void)setCurrentLens:(id)a3;
- (void)setCustomBannerView:(id)a3;
- (void)setCustomExcludedActionTypesProvider:(id)a3;
- (void)setCustomLeadingAccessoryView:(id)a3;
- (void)setCustomTrailingAccessoryView:(id)a3;
- (void)setDecorationViewClass:(Class)a3;
- (void)setDefaultZoomStep:(int64_t)a3;
- (void)setDesiredCurationLength:(int64_t)a3;
- (void)setDismissRequested:(BOOL)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setEffectProvider:(id)a3;
- (void)setEmptyPlaceholderState:(int64_t)a3;
- (void)setEmptyPlaceholderStatusViewModel:(id)a3;
- (void)setEnterSelectModeAllowed:(BOOL)a3 forReason:(id)a4;
- (void)setFaceModeEnabled:(BOOL)a3;
- (void)setFloatingTitleOpacity:(double)a3;
- (void)setFooterHasImportantInformation:(BOOL)a3;
- (void)setFooterVisibilityStyle:(int64_t)a3;
- (void)setHasScrollableContent:(BOOL)a3;
- (void)setHeaderFloatingThresholdOffset:(double)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderTitleTopInset:(double)a3;
- (void)setHideSurroundingContent:(BOOL)a3 forReason:(id)a4;
- (void)setHidesNavbar:(BOOL)a3;
- (void)setHidesToolbar:(BOOL)a3;
- (void)setInfoActionHandler:(id)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setIsInCompactMode:(BOOL)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setIsInteractiveZooming:(BOOL)a3;
- (void)setKeepsTabBarAlwaysHidden:(BOOL)a3;
- (void)setLastPreferredScrollDetent:(id)a3;
- (void)setLastTargetPreferredScrollDetent:(id)a3;
- (void)setModalInPresentation:(BOOL)a3 forReason:(id)a4;
- (void)setNoContentPlaceholderFallbackMessage:(id)a3;
- (void)setNoContentPlaceholderFallbackTitle:(id)a3;
- (void)setNumberOfZoomSteps:(int64_t)a3;
- (void)setOneUpPresentationAllowed:(BOOL)a3 forReason:(id)a4;
- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3;
- (void)setRequiresLightTopBars:(BOOL)a3;
- (void)setScrollDisabled:(BOOL)a3 axis:(int64_t)a4 forReason:(id)a5;
- (void)setScrolledToBottom:(BOOL)a3;
- (void)setScrolledToTop:(BOOL)a3;
- (void)setSearchQueryMatchInfo:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setShouldAlwaysRespectToolbarActionPlacementPreference:(BOOL)a3;
- (void)setShouldAnimateZooming:(BOOL)a3;
- (void)setShowLoadingPlaceholderWhenEmpty:(BOOL)a3;
- (void)setShowingAlternateContent:(BOOL)a3;
- (void)setShowsOnlyAssetsInSelectedItemSectionInOneUp:(BOOL)a3;
- (void)setSupportsAspectRatioToggle:(BOOL)a3;
- (void)setSystemAuthenticationType:(int64_t)a3;
- (void)setTapbackStatusManager:(id)a3;
- (void)setTitleBackgroundOpacity:(double)a3;
- (void)setTopDismissAreaHeight:(id)a3;
- (void)setUserWantsAspectFitContent:(id)a3;
- (void)setViewBasedDecorationsEnabled:(BOOL)a3;
- (void)setViewDelegate:(id)a3;
- (void)setWantsContentFilterVisible:(BOOL)a3;
- (void)setWantsContentUnavailableUnlockButtonVisible:(BOOL)a3;
- (void)setWantsCuration:(BOOL)a3;
- (void)setWantsFooterVisible:(BOOL)a3;
- (void)setWantsLensControlVisible:(BOOL)a3;
- (void)setWantsNavbarVisible:(BOOL)a3;
- (void)setWantsTabBarVisible:(BOOL)a3;
- (void)setWantsToolbarVisible:(BOOL)a3;
- (void)setYearsMonthsZoomStepRange:(_NSRange)a3;
- (void)setZoomAnchorAssetReference:(id)a3;
- (void)setZoomStep:(double)a3;
- (void)setZoomStep:(double)a3 isInteractive:(BOOL)a4 shouldAnimate:(BOOL)a5 anchorAssetReference:(id)a6;
- (void)swift_actionMenuVisibilityChangedToVisible:(BOOL)a3;
- (void)swift_didPerformChanges;
- (void)swift_initWithConfiguration:(id)a3;
- (void)toggleSelectionForAssetCollectionReference:(id)a3;
- (void)toggleSelectionForAssetReference:(id)a3;
- (void)toggleSelectionForAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4;
- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3;
- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4;
- (void)unregisterInternalMenuProducer:(id)a3;
@end

@implementation PXPhotosViewModel

- (id)customExcludedActionTypesProvider
{
  v2 = self;
  sub_1A9E936AC();
}

- (void)setCustomExcludedActionTypesProvider:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1A9E936AC();
}

- (BOOL)supportsZooming
{
  v2 = self;
  PXPhotosViewModel.supportsZooming.getter();
}

- (NSString)collectionKindPreviewHeaderDisabledUserDefaultsKey
{
  v2 = self;
  PXPhotosViewModel.collectionKindPreviewHeaderDisabledUserDefaultsKey.getter();
}

- (BOOL)swift_collectionKindSupportsTogglingPreviewHeader
{
  v2 = self;
  sub_1A9E936AC();
}

- (void)swift_initWithConfiguration:(id)a3
{
  v4 = (PXPhotosViewConfiguration *)a3;
  v5 = self;
  PXPhotosViewModel.swift_init(configuration:)(v4);
}

- (void)swift_didPerformChanges
{
  swift_dynamicCastObjCProtocolUnconditional();
  swift_getObjectType();
  v3 = self;
  sub_1A9E95F9C();
}

- (void)swift_actionMenuVisibilityChangedToVisible:(BOOL)a3
{
}

- (BOOL)handlePrimaryAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9E96E38((uint64_t)v4);
}

- (PXBrowserSelectionSnapshot)browserSelectionSnapshot
{
  id v4 = [(PXPhotosViewModel *)self selectionSnapshot];
  v5 = [(PXPhotosViewModel *)self currentDataSource];
  v6 = [v4 dataSource];

  if (v5 != v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXPhotosViewModel+PXBrowserSnapshot.m" lineNumber:21 description:@"Expected data source to be same as selection snapshot datasource."];
  }
  v7 = [v4 selectedIndexPaths];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PXPhotosViewModel_PXBrowserSnapshot__browserSelectionSnapshot__block_invoke;
  v13[3] = &unk_1E5DCC248;
  id v14 = v8;
  id v9 = v8;
  [v7 enumerateAllIndexPathsUsingBlock:v13];
  v10 = +[PXBrowserSelectionSnapshot selectionWithIndexPaths:v9 dataSource:v5];

  return (PXBrowserSelectionSnapshot *)v10;
}

void __64__PXPhotosViewModel_PXBrowserSnapshot__browserSelectionSnapshot__block_invoke()
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewHeaderDisabledUserDefaultsKey, 0);
  objc_storeStrong(&self->_currentDataSourceContainer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_inlinePlaybackController);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong((id *)&self->_noContentPlaceholderFallbackMessage, 0);
  objc_storeStrong((id *)&self->_noContentPlaceholderFallbackTitle, 0);
  objc_storeStrong(&self->_effectProvider, 0);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_storeStrong((id *)&self->_emptyPlaceholderStatusViewModel, 0);
  objc_storeStrong((id *)&self->_decorationViewClass, 0);
  objc_storeStrong((id *)&self->_initialNavigationObjectReference, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_customBannerView, 0);
  objc_storeStrong((id *)&self->_customTrailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_customLeadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryActionType, 0);
  objc_storeStrong((id *)&self->_centerAccessoryActionType, 0);
  objc_storeStrong(&self->_infoActionHandler, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_footerLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_footerSubtitle, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customUserDefaults, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_lastTargetPreferredScrollDetent, 0);
  objc_storeStrong((id *)&self->_lastPreferredScrollDetent, 0);
  objc_storeStrong((id *)&self->_initialScrollPositionDetentIdentifier, 0);
  objc_storeStrong((id *)&self->_availableLenses, 0);
  objc_storeStrong((id *)&self->_currentLens, 0);
  objc_storeStrong((id *)&self->_zoomAnchorAssetReference, 0);
  objc_storeStrong((id *)&self->_userWantsAspectFitContent, 0);
  objc_storeStrong((id *)&self->_topDismissAreaHeight, 0);
  objc_destroyWeak((id *)&self->_preferredColumnCountsDelegate);
  objc_destroyWeak((id *)&self->_preferredAssetCropDelegate);
  objc_storeStrong(&self->_bannerControllerProvider, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong(&self->_customAssetSelectionHandler, 0);
  objc_storeStrong((id *)&self->_cplActionManagerClass, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_fullscreenOverlayControllers, 0);
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_gridActionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_internalMenuProducers, 0);
  objc_storeStrong((id *)&self->_visibleAssetCollections, 0);
  objc_storeStrong((id *)&self->_scrollDisabledReasonsByAxis, 0);
  objc_storeStrong((id *)&self->_modalInPresentationReasons, 0);
  objc_storeStrong((id *)&self->_hideSurroundingContentForReasons, 0);
  objc_storeStrong((id *)&self->_aspectRatioTogglePreventedForReasons, 0);
  objc_storeStrong((id *)&self->_oneUpPresentationPreventedForReasons, 0);
  objc_storeStrong((id *)&self->_enterSelectModePreventedForReasons, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
}

- (BOOL)_shouldMimicSystemChromelessUsingManualScrollEdgeAppearance
{
  return self->__shouldMimicSystemChromelessUsingManualScrollEdgeAppearance;
}

- (BOOL)startsInSelectMode
{
  return self->_startsInSelectMode;
}

- (void)setWantsCuration:(BOOL)a3
{
  self->_wantsCuration = a3;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (BOOL)neverShowsLensControl
{
  return self->_neverShowsLensControl;
}

- (int64_t)configuredSectionBodyStyle
{
  return self->_configuredSectionBodyStyle;
}

- (int64_t)configuredSectionHeaderStyle
{
  return self->_configuredSectionHeaderStyle;
}

- (NSString)previewHeaderDisabledUserDefaultsKey
{
  return self->_previewHeaderDisabledUserDefaultsKey;
}

- (BOOL)canShowSortButton
{
  return self->_canShowSortButton;
}

- (BOOL)alwaysIncludeSharedWithYouAssets
{
  return self->_alwaysIncludeSharedWithYouAssets;
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (unint64_t)viewDelegateRespondsTo
{
  return self->_viewDelegateRespondsTo;
}

- (id)currentDataSourceContainer
{
  return self->_currentDataSourceContainer;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (int64_t)contentShiftStrategy
{
  return self->_contentShiftStrategy;
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inlinePlaybackController);
  return (PXGDisplayAssetPixelBufferSourcesProvider *)WeakRetained;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (BOOL)wantsFooterVisibleWhenEmpty
{
  return self->_wantsFooterVisibleWhenEmpty;
}

- (BOOL)wantsFooterVisibleImmediately
{
  return self->_wantsFooterVisibleImmediately;
}

- (NSString)noContentPlaceholderFallbackMessage
{
  return self->_noContentPlaceholderFallbackMessage;
}

- (NSString)noContentPlaceholderFallbackTitle
{
  return self->_noContentPlaceholderFallbackTitle;
}

- (int64_t)noContentPlaceholderType
{
  return self->_noContentPlaceholderType;
}

- (id)effectProvider
{
  return self->_effectProvider;
}

- (PXPhotosViewDelegate)viewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);
  return (PXPhotosViewDelegate *)WeakRetained;
}

- (void)setEmptyPlaceholderStatusViewModel:(id)a3
{
}

- (PXStatusViewModel)emptyPlaceholderStatusViewModel
{
  return self->_emptyPlaceholderStatusViewModel;
}

- (void)setDecorationViewClass:(Class)a3
{
}

- (Class)decorationViewClass
{
  return self->_decorationViewClass;
}

- (int64_t)scrollingBehavior
{
  return self->_scrollingBehavior;
}

- (int64_t)initialNavigationScrollPosition
{
  return self->_initialNavigationScrollPosition;
}

- (PXSectionedObjectReference)initialNavigationObjectReference
{
  return self->_initialNavigationObjectReference;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setShowsOnlyAssetsInSelectedItemSectionInOneUp:(BOOL)a3
{
  self->_showsOnlyAssetsInSelectedItemSectionInOneUp = a3;
}

- (BOOL)showsOnlyAssetsInSelectedItemSectionInOneUp
{
  return self->_showsOnlyAssetsInSelectedItemSectionInOneUp;
}

- (BOOL)allowsMergeDuplicatesAction
{
  return self->_allowsMergeDuplicatesAction;
}

- (UIView)customBannerView
{
  return self->_customBannerView;
}

- (UIView)customTrailingAccessoryView
{
  return self->_customTrailingAccessoryView;
}

- (UIView)customLeadingAccessoryView
{
  return self->_customLeadingAccessoryView;
}

- (NSString)trailingAccessoryActionType
{
  return self->_trailingAccessoryActionType;
}

- (NSString)centerAccessoryActionType
{
  return self->_centerAccessoryActionType;
}

- (BOOL)wantsOneUpShowInLibraryButton
{
  return self->_wantsOneUpShowInLibraryButton;
}

- (BOOL)preventShowInAllPhotosAction
{
  return self->_preventShowInAllPhotosAction;
}

- (int64_t)oneUpPresentationOrigin
{
  return self->_oneUpPresentationOrigin;
}

- (BOOL)wantsFloatingTitle
{
  return self->_wantsFloatingTitle;
}

- (double)floatingTitleOpacity
{
  return self->_floatingTitleOpacity;
}

- (double)headerFloatingThresholdOffset
{
  return self->_headerFloatingThresholdOffset;
}

- (BOOL)hideFooterInSelectMode
{
  return self->_hideFooterInSelectMode;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)wantsModernNavBarButtons
{
  return self->_wantsModernNavBarButtons;
}

- (BOOL)shouldOptOutOfChromelessBars
{
  return self->_shouldOptOutOfChromelessBars;
}

- (int64_t)navBarStyle
{
  return self->_navBarStyle;
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (void)setInfoActionHandler:(id)a3
{
}

- (id)infoActionHandler
{
  return self->_infoActionHandler;
}

- (BOOL)allowsInteractiveFavoriteBadges
{
  return self->_allowsInteractiveFavoriteBadges;
}

- (unint64_t)forbiddenBadges
{
  return self->_forbiddenBadges;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSURL)footerLearnMoreURL
{
  return self->_footerLearnMoreURL;
}

- (NSString)footerSubtitle
{
  return self->_footerSubtitle;
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)dismissAffordance
{
  return self->_dismissAffordance;
}

- (BOOL)wantsAdaptiveSelectModeBarButton
{
  return self->_wantsAdaptiveSelectModeBarButton;
}

- (BOOL)wantsSelectModeCaptionInContextMenu
{
  return self->_wantsSelectModeCaptionInContextMenu;
}

- (BOOL)showsPlayAsMemoryButton
{
  return self->_showsPlayAsMemoryButton;
}

- (BOOL)allowsLensControl
{
  return self->_allowsLensControl;
}

- (BOOL)allowsMultiSelectMenu
{
  return self->_allowsMultiSelectMenu;
}

- (BOOL)allowsLinkInteractions
{
  return self->_allowsLinkInteractions;
}

- (PXZoomablePhotosUserDefaults)customUserDefaults
{
  return self->_customUserDefaults;
}

- (BOOL)allowsUserDefaults
{
  return self->_allowsUserDefaults;
}

- (BOOL)allowsDragOut
{
  return self->_allowsDragOut;
}

- (BOOL)allowsDragIn
{
  return self->_allowsDragIn;
}

- (BOOL)allowsSwipeToSelect
{
  return self->_allowsSwipeToSelect;
}

- (BOOL)allowsTapbackAction
{
  return self->_allowsTapbackAction;
}

- (BOOL)allowsReplyAction
{
  return self->_allowsReplyAction;
}

- (BOOL)allowsContentSyndicationSaveAllAction
{
  return self->_allowsContentSyndicationSaveAllAction;
}

- (BOOL)allowsSyndicatedContentFiltering
{
  return self->_allowsSyndicatedContentFiltering;
}

- (BOOL)allowsCMMActions
{
  return self->_allowsCMMActions;
}

- (BOOL)allowsInfoAction
{
  return self->_allowsInfoAction;
}

- (BOOL)allowsMoveToSharedLibraryAction
{
  return self->_allowsMoveToSharedLibraryAction;
}

- (BOOL)allowsMoveToPersonalLibraryAction
{
  return self->_allowsMoveToPersonalLibraryAction;
}

- (BOOL)allowsMoveToLibraryAction
{
  return self->_allowsMoveToLibraryAction;
}

- (BOOL)allowsSwitchLibraryAction
{
  return self->_allowsSwitchLibraryAction;
}

- (BOOL)allowsAddToLibraryAction
{
  return self->_allowsAddToLibraryAction;
}

- (BOOL)allowsShareAction
{
  return self->_allowsShareAction;
}

- (BOOL)allowsTrashAction
{
  return self->_allowsTrashAction;
}

- (BOOL)allowsFileRadarAction
{
  return self->_allowsFileRadarAction;
}

- (BOOL)allowsDismissAction
{
  return self->_allowsDismissAction;
}

- (BOOL)allowsOneUpPresentation
{
  return self->_allowsOneUpPresentation;
}

- (BOOL)allowsPickAssetAction
{
  return self->_allowsPickAssetAction;
}

- (BOOL)allowsShowMapAction
{
  return self->_allowsShowMapAction;
}

- (BOOL)allowsQuickLookAction
{
  return self->_allowsQuickLookAction;
}

- (BOOL)allowsShareAllAction
{
  return self->_allowsShareAllAction;
}

- (BOOL)allowsGridAppearanceActions
{
  return self->_allowsGridAppearanceActions;
}

- (BOOL)allowsSelectSectionAction
{
  return self->_allowsSelectSectionAction;
}

- (BOOL)allowsCopyAction
{
  return self->_allowsCopyAction;
}

- (BOOL)allowsAddAction
{
  return self->_allowsAddAction;
}

- (BOOL)allowsSlideshowAction
{
  return self->_allowsSlideshowAction;
}

- (BOOL)allowsSelectAllAction
{
  return self->_allowsSelectAllAction;
}

- (BOOL)allowsSelectModeToggle
{
  return self->_allowsSelectModeToggle;
}

- (BOOL)allowsMacStyleSelection
{
  return self->_allowsMacStyleSelection;
}

- (BOOL)allowsAccessoriesContextMenuCustomization
{
  return self->_allowsAccessoriesContextMenuCustomization;
}

- (BOOL)allowsContextMenuCustomization
{
  return self->_allowsContextMenuCustomization;
}

- (BOOL)allowsCaptionsInSquareBehavior
{
  return self->_allowsCaptionsInSquareBehavior;
}

- (BOOL)allowsHoverBehavior
{
  return self->_allowsHoverBehavior;
}

- (BOOL)allowsDoubleTapBehavior
{
  return self->_allowsDoubleTapBehavior;
}

- (BOOL)allowsActionMenuBehavior
{
  return self->_allowsActionMenuBehavior;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return self->_allowsPopOnEmptyBehavior;
}

- (BOOL)allowsPopOnContainerDeleteBehavior
{
  return self->_allowsPopOnContainerDeleteBehavior;
}

- (BOOL)allowsSelectionUserActivityBehavior
{
  return self->_allowsSelectionUserActivityBehavior;
}

- (BOOL)allowsInlineAddBehavior
{
  return self->_allowsInlineAddBehavior;
}

- (BOOL)allowsChromeManagementBehavior
{
  return self->_allowsChromeManagementBehavior;
}

- (BOOL)allowsShowDetails
{
  return self->_allowsShowDetails;
}

- (BOOL)allowsSearch
{
  return self->_allowsSearch;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (BOOL)wantsTopBadgesWithViewBasedDecorations
{
  return self->_wantsTopBadgesWithViewBasedDecorations;
}

- (BOOL)captionsVisible
{
  return self->_captionsVisible;
}

- (BOOL)viewBasedDecorationsEnabled
{
  return self->_viewBasedDecorationsEnabled;
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (UIEdgeInsets)contentBackgroundInsets
{
  double top = self->_contentBackgroundInsets.top;
  double left = self->_contentBackgroundInsets.left;
  double bottom = self->_contentBackgroundInsets.bottom;
  double right = self->_contentBackgroundInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)contentBackgroundOpacity
{
  return self->_contentBackgroundOpacity;
}

- (double)titleBackgroundOpacity
{
  return self->_titleBackgroundOpacity;
}

- (double)topBarsAppearanceChangeAnimationDuration
{
  return self->_topBarsAppearanceChangeAnimationDuration;
}

- (BOOL)requiresLightTopBars
{
  return self->_requiresLightTopBars;
}

- (BOOL)isShowingAlternateContent
{
  return self->_showingAlternateContent;
}

- (BOOL)isContentBelowTitle
{
  return self->_contentBelowTitle;
}

- (BOOL)wantsTitleInNavigationBar
{
  return self->_wantsTitleInNavigationBar;
}

- (BOOL)prefersActionsInToolbar
{
  return self->_prefersActionsInToolbar;
}

- (BOOL)shouldAlwaysRespectToolbarActionPlacementPreference
{
  return self->_shouldAlwaysRespectToolbarActionPlacementPreference;
}

- (BOOL)hidesToolbar
{
  return self->_hidesToolbar;
}

- (BOOL)hidesNavbar
{
  return self->_hidesNavbar;
}

- (BOOL)wantsToolbarVisible
{
  return self->_wantsToolbarVisible;
}

- (BOOL)wantsNavbarVisible
{
  return self->_wantsNavbarVisible;
}

- (BOOL)wantsTabBarVisible
{
  return self->_wantsTabBarVisible;
}

- (BOOL)wantsContentUnavailableUnlockButtonVisible
{
  return self->_wantsContentUnavailableUnlockButtonVisible;
}

- (int64_t)systemAuthenticationType
{
  return self->_systemAuthenticationType;
}

- (int64_t)contentPrivacyState
{
  return self->_contentPrivacyState;
}

- (int64_t)emptyPlaceholderState
{
  return self->_emptyPlaceholderState;
}

- (BOOL)footerHasImportantInformation
{
  return self->_footerHasImportantInformation;
}

- (BOOL)wantsFooterVisible
{
  return self->_wantsFooterVisible;
}

- (int64_t)footerVisibilityStyle
{
  return self->_footerVisibilityStyle;
}

- (PXScrollDetent)lastTargetPreferredScrollDetent
{
  return self->_lastTargetPreferredScrollDetent;
}

- (PXScrollDetent)lastPreferredScrollDetent
{
  return self->_lastPreferredScrollDetent;
}

- (NSString)initialScrollPositionDetentIdentifier
{
  return self->_initialScrollPositionDetentIdentifier;
}

- (int64_t)desiredCurationLength
{
  return self->_desiredCurationLength;
}

- (NSArray)availableLenses
{
  return self->_availableLenses;
}

- (PXPhotosViewLens)currentLens
{
  return self->_currentLens;
}

- (BOOL)wantsLensControlVisible
{
  return self->_wantsLensControlVisible;
}

- (BOOL)wantsContentFilterVisible
{
  return self->_wantsContentFilterVisible;
}

- (_NSRange)yearsMonthsZoomStepRange
{
  p_yearsMonthsZoomStepRange = &self->_yearsMonthsZoomStepRange;
  NSUInteger location = self->_yearsMonthsZoomStepRange.location;
  NSUInteger length = p_yearsMonthsZoomStepRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)shouldAnimateZooming
{
  return self->_shouldAnimateZooming;
}

- (BOOL)isInteractiveZooming
{
  return self->_isInteractiveZooming;
}

- (PXAssetReference)zoomAnchorAssetReference
{
  return self->_zoomAnchorAssetReference;
}

- (void)setDefaultZoomStep:(int64_t)a3
{
  self->_defaultZoomStep = a3;
}

- (int64_t)defaultZoomStep
{
  return self->_defaultZoomStep;
}

- (double)zoomStep
{
  return self->_zoomStep;
}

- (int64_t)numberOfZoomSteps
{
  return self->_numberOfZoomSteps;
}

- (NSNumber)userWantsAspectFitContent
{
  return self->_userWantsAspectFitContent;
}

- (NSNumber)topDismissAreaHeight
{
  return self->_topDismissAreaHeight;
}

- (int64_t)allowedGesturesKind
{
  return self->_allowedGesturesKind;
}

- (double)chromeTitleFloatingFraction
{
  return self->_chromeTitleFloatingFraction;
}

- (unint64_t)chromeItemsToBeConsideredVisibleForLayoutPurpose
{
  return self->_chromeItemsToBeConsideredVisibleForLayoutPurpose;
}

- (unint64_t)allowedChromeItems
{
  return self->_allowedChromeItems;
}

- (BOOL)alwaysRequiresLightChrome
{
  return self->_alwaysRequiresLightChrome;
}

- (double)chromeOpacity
{
  return self->_chromeOpacity;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (BOOL)supportsSocialGroupActions
{
  return self->_supportsSocialGroupActions;
}

- (BOOL)supportsPeopleActions
{
  return self->_supportsPeopleActions;
}

- (BOOL)ignoreContentFilterStateWhenNotFiltering
{
  return self->_ignoreContentFilterStateWhenNotFiltering;
}

- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredColumnCountsDelegate);
  return (PXPhotosPreferredColumnCountsDelegate *)WeakRetained;
}

- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredAssetCropDelegate);
  return (PXPhotosPreferredAssetCropDelegate *)WeakRetained;
}

- (BOOL)allowsEmptyPlaceholderBehavior
{
  return self->_allowsEmptyPlaceholderBehavior;
}

- (BOOL)showLoadingPlaceholderWhenEmpty
{
  return self->_showLoadingPlaceholderWhenEmpty;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (id)bannerControllerProvider
{
  return self->_bannerControllerProvider;
}

- (UIEdgeInsets)additionalAspectFitEdgeMargins
{
  double top = self->_additionalAspectFitEdgeMargins.top;
  double left = self->_additionalAspectFitEdgeMargins.left;
  double bottom = self->_additionalAspectFitEdgeMargins.bottom;
  double right = self->_additionalAspectFitEdgeMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)aspectFitContent
{
  return self->_aspectFitContent;
}

- (BOOL)supportsAspectRatioToggle
{
  return self->_supportsAspectRatioToggle;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (BOOL)allowsPreviewHeader
{
  return self->_allowsPreviewHeader;
}

- (double)headerTitleTopInset
{
  return self->_headerTitleTopInset;
}

- (BOOL)isScrolledToBottom
{
  return self->_scrolledToBottom;
}

- (BOOL)isScrolledToTop
{
  return self->_scrolledToTop;
}

- (BOOL)hasScrollableContent
{
  return self->_hasScrollableContent;
}

- (BOOL)dismissRequested
{
  return self->_dismissRequested;
}

- (int64_t)appearState
{
  return self->_appearState;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (BOOL)isInCompactMode
{
  return self->_isInCompactMode;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (id)customAssetSelectionHandler
{
  return self->_customAssetSelectionHandler;
}

- (Class)cplActionManagerClass
{
  return self->_cplActionManagerClass;
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (PXPhotosLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (BOOL)hidesViewOptionsToolbar
{
  return self->_hidesViewOptionsToolbar;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (BOOL)wantsShareGridButtonVisible
{
  return self->_wantsShareGridButtonVisible;
}

- (BOOL)wantsSingleRowScrollingLayout
{
  return self->_wantsSingleRowScrollingLayout;
}

- (BOOL)isEmbedded
{
  return self->_isEmbedded;
}

- (BOOL)wantsRenderingStatus
{
  return self->_wantsRenderingStatus;
}

- (BOOL)wantsCPLStatus
{
  return self->_wantsCPLStatus;
}

- (BOOL)hidesAssetCountInFooter
{
  return self->_hidesAssetCountInFooter;
}

- (BOOL)wantsFooterMask
{
  return self->_wantsFooterMask;
}

- (BOOL)wantsDynamicTitles
{
  return self->_wantsDynamicTitles;
}

- (NSArray)fullscreenOverlayControllers
{
  return self->_fullscreenOverlayControllers;
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (PXAssetActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXPhotosGridActionManager)gridActionManager
{
  return self->_gridActionManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (BOOL)keepsTabBarAlwaysHidden
{
  return self->_keepsTabBarAlwaysHidden;
}

- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3
{
  if ([(PXPhotosViewModel *)self isInSelectMode]) {
    return 0;
  }
  else {
    return ![(PXPhotosViewModel *)self wantsDimmedSelectionStyle];
  }
}

- (id)selectionManager:(id)a3 validateSnapshot:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if ([(PXPhotosViewModel *)self viewDelegateRespondsTo:0x100000])
  {
    v7 = [(PXPhotosViewModel *)self viewDelegate];
    v6 = [v7 photosViewController:0 validateSelectionSnapshot:v5];
  }
  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ((void *)UserDefaultsPreviewHeaderDisabledObservationContext == a6)
  {
    v16 = [(PXPhotosViewModel *)self previewHeaderDisabledUserDefaultsKey];
    if (v16)
    {
      location[1] = (id)MEMORY[0x1E4F143A8];
      location[2] = (id)3221225472;
      location[3] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke;
      location[4] = &unk_1E5DD32A8;
      location[5] = self;
      location[6] = v16;
      id v17 = v16;
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    if ((void *)UserDefaultsIncludeSharedWithYouObservationContext != a6)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PXPhotosViewModel.m" lineNumber:2014 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v14 = [(PXPhotosViewModel *)self _updatedContentFilterState];
    objc_initWeak(location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v21, location);
    id v20 = v14;
    id v15 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
}

void __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v2[3] = &unk_1E5DCF6C0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

void __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
  v3[3] = &unk_1E5DCF6C0;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained performChanges:v3];
}

uint64_t __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setContentFilterState:*(void *)(a1 + 32)];
}

void __68__PXPhotosViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a2;
  id v5 = [v3 standardUserDefaults];
  objc_msgSend(v4, "setAllowsPreviewHeader:", objc_msgSend(v5, "BOOLForKey:", *(void *)(a1 + 32)) ^ 1);
}

- (id)_updatedContentFilterState
{
  id v3 = [(PXPhotosViewModel *)self dataSourceManager];
  id v4 = [v3 dataSource];
  id v5 = [v4 containerCollection];

  v6 = +[PXUserDefaults standardUserDefaults];
  v7 = [(PXPhotosViewModel *)self contentFilterState];
  v8 = (void *)[v7 copy];

  [v8 setIncludeScreenshots:1];
  if (objc_msgSend(v5, "px_isContentSyndicationAlbum"))
  {
    [v8 setIncludeSharedWithYou:1];
  }
  else
  {
    id v9 = [v6 includeSharedWithYou];
    objc_msgSend(v8, "setIncludeSharedWithYou:", objc_msgSend(v9, "BOOLValue"));
  }
  return v8;
}

- (void)assetsDataSourceManagerDidFinishLoadingInitialDataSource:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__PXPhotosViewModel_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke;
  v3[3] = &unk_1E5DCF6C0;
  void v3[4] = self;
  [(PXPhotosViewModel *)self performChanges:v3];
}

uint64_t __78__PXPhotosViewModel_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateEmptyPlaceholderState];
}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__PXPhotosViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke;
  v3[3] = &unk_1E5DCF6C0;
  void v3[4] = self;
  [(PXPhotosViewModel *)self performChanges:v3];
}

uint64_t __72__PXPhotosViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateEmptyPlaceholderState];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)DataSourceManagerObservationContext_60890 == a5 || (void *)SelectionManagerObservationContext_60891 == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    id v11 = v9;
    [(PXPhotosViewModel *)self _updateDataSourceDependentProperties];
    goto LABEL_9;
  }
  if ((void *)PrivacyControllerObservationContext == a5)
  {
    id v11 = v9;
    if (v6)
    {
      [(PXPhotosViewModel *)self performChanges:&__block_literal_global_385];
      id v9 = v11;
      if ((v6 & 4) == 0)
      {
LABEL_15:
        if ((v6 & 8) == 0) {
          goto LABEL_10;
        }
        goto LABEL_19;
      }
    }
    else if ((v6 & 4) == 0)
    {
      goto LABEL_15;
    }
    [(PXPhotosViewModel *)self performChanges:&__block_literal_global_387];
    id v9 = v11;
    if ((v6 & 8) == 0) {
      goto LABEL_10;
    }
LABEL_19:
    [(PXPhotosViewModel *)self performChanges:&__block_literal_global_389];
    goto LABEL_9;
  }
  if ((void *)SortOrderStateObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosViewModel.m" lineNumber:1961 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXPhotosViewModel *)self _updateSortOrder];
LABEL_9:
    id v9 = v11;
  }
LABEL_10:
}

uint64_t __50__PXPhotosViewModel_observable_didChange_context___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _updateWantsContentUnavailableUnlockButtonVisible];
}

void __50__PXPhotosViewModel_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateSystemAuthenticationType];
  [v2 _updateWantsContentUnavailableUnlockButtonVisible];
}

void __50__PXPhotosViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateContentPrivacyState];
  [v2 _invalidateEmptyPlaceholderState];
  [v2 _invalidateChromeVisibility];
  [v2 _invalidateWantsLensControlVisible];
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  id v3 = [(PXPhotosViewModel *)self viewDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(PXPhotosViewModel *)self viewDelegate];
    id v5 = [v4 memoryAssetsActionFactory];
  }
  else
  {
    id v5 = 0;
  }

  return (PXMemoryAssetsActionFactory *)v5;
}

- (void)setViewDelegate:(id)a3
{
  p_viewDelegate = &self->_viewDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_viewDelegate, v5);
  self->_viewDelegateRespondsTo = 0;
  self->_viewDelegateRespondsTo |= objc_opt_respondsToSelector() & 1;
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = 2;
  if ((v6 & 1) == 0) {
    uint64_t v7 = 0;
  }
  self->_viewDelegateRespondsTo |= v7;
  char v8 = objc_opt_respondsToSelector();
  uint64_t v9 = 0x8000;
  if ((v8 & 1) == 0) {
    uint64_t v9 = 0;
  }
  self->_viewDelegateRespondsTo |= v9;
  char v10 = objc_opt_respondsToSelector();
  uint64_t v11 = 4;
  if ((v10 & 1) == 0) {
    uint64_t v11 = 0;
  }
  self->_viewDelegateRespondsTo |= v11;
  char v12 = objc_opt_respondsToSelector();
  uint64_t v13 = 8;
  if ((v12 & 1) == 0) {
    uint64_t v13 = 0;
  }
  self->_viewDelegateRespondsTo |= v13;
  char v14 = objc_opt_respondsToSelector();
  uint64_t v15 = 16;
  if ((v14 & 1) == 0) {
    uint64_t v15 = 0;
  }
  self->_viewDelegateRespondsTo |= v15;
  char v16 = objc_opt_respondsToSelector();
  uint64_t v17 = 4096;
  if ((v16 & 1) == 0) {
    uint64_t v17 = 0;
  }
  self->_viewDelegateRespondsTo |= v17;
  char v18 = objc_opt_respondsToSelector();
  uint64_t v19 = 0x2000;
  if ((v18 & 1) == 0) {
    uint64_t v19 = 0;
  }
  self->_viewDelegateRespondsTo |= v19;
  char v20 = objc_opt_respondsToSelector();
  uint64_t v21 = 0x10000;
  if ((v20 & 1) == 0) {
    uint64_t v21 = 0;
  }
  self->_viewDelegateRespondsTo |= v21;
  char v22 = objc_opt_respondsToSelector();
  uint64_t v23 = 0x4000;
  if ((v22 & 1) == 0) {
    uint64_t v23 = 0;
  }
  self->_viewDelegateRespondsTo |= v23;
  char v24 = objc_opt_respondsToSelector();
  uint64_t v25 = 32;
  if ((v24 & 1) == 0) {
    uint64_t v25 = 0;
  }
  self->_viewDelegateRespondsTo |= v25;
  char v26 = objc_opt_respondsToSelector();
  uint64_t v27 = 0x100000;
  if ((v26 & 1) == 0) {
    uint64_t v27 = 0;
  }
  self->_viewDelegateRespondsTo |= v27;
  char v28 = objc_opt_respondsToSelector();
  uint64_t v29 = 64;
  if ((v28 & 1) == 0) {
    uint64_t v29 = 0;
  }
  self->_viewDelegateRespondsTo |= v29;
  char v30 = objc_opt_respondsToSelector();
  uint64_t v31 = 128;
  if ((v30 & 1) == 0) {
    uint64_t v31 = 0;
  }
  self->_viewDelegateRespondsTo |= v31;
  char v32 = objc_opt_respondsToSelector();
  uint64_t v33 = 256;
  if ((v32 & 1) == 0) {
    uint64_t v33 = 0;
  }
  self->_viewDelegateRespondsTo |= v33;
  char v34 = objc_opt_respondsToSelector();
  uint64_t v35 = 512;
  if ((v34 & 1) == 0) {
    uint64_t v35 = 0;
  }
  self->_viewDelegateRespondsTo |= v35;
  char v36 = objc_opt_respondsToSelector();
  uint64_t v37 = 1024;
  if ((v36 & 1) == 0) {
    uint64_t v37 = 0;
  }
  self->_viewDelegateRespondsTo |= v37;
  char v38 = objc_opt_respondsToSelector();
  uint64_t v39 = 2048;
  if ((v38 & 1) == 0) {
    uint64_t v39 = 0;
  }
  self->_viewDelegateRespondsTo |= v39;
  char v40 = objc_opt_respondsToSelector();
  uint64_t v41 = 0x20000;
  if ((v40 & 1) == 0) {
    uint64_t v41 = 0;
  }
  self->_viewDelegateRespondsTo |= v41;
  char v42 = objc_opt_respondsToSelector();
  uint64_t v43 = 0x40000;
  if ((v42 & 1) == 0) {
    uint64_t v43 = 0;
  }
  self->_viewDelegateRespondsTo |= v43;
  char v44 = objc_opt_respondsToSelector();

  uint64_t v45 = 0x80000;
  if ((v44 & 1) == 0) {
    uint64_t v45 = 0;
  }
  self->_viewDelegateRespondsTo |= v45;
}

- (BOOL)viewDelegateRespondsTo:(unint64_t)a3
{
  return (a3 & ~self->_viewDelegateRespondsTo) == 0;
}

- (void)unregisterInternalMenuProducer:(id)a3
{
}

- (void)registerInternalMenuProducer:(id)a3
{
  id v4 = a3;
  internalMenuProducers = self->_internalMenuProducers;
  id v8 = v4;
  if (!internalMenuProducers)
  {
    char v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_internalMenuProducers;
    self->_internalMenuProducers = v6;

    id v4 = v8;
    internalMenuProducers = self->_internalMenuProducers;
  }
  [(NSHashTable *)internalMenuProducers addObject:v4];
}

- (NSArray)internalMenuProducers
{
  id v2 = [(NSHashTable *)self->_internalMenuProducers allObjects];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (BOOL)contentStartsAtEnd
{
  int64_t contentStartingPosition = self->_contentStartingPosition;
  if (contentStartingPosition == 1) {
    return 1;
  }
  if (contentStartingPosition) {
    return 0;
  }
  id v3 = [(PXPhotosViewModel *)self currentDataSource];
  char v4 = [v3 startsAtEnd];

  return v4;
}

- (void)resetToInitialSelectionAndFilteringState
{
  if ([(PXPhotosViewModel *)self allowsSelectModeToggle]) {
    [(PXPhotosViewModel *)self attemptSetInSelectMode:[(PXPhotosViewModel *)self startsInSelectMode]];
  }
  id v3 = [(PXPhotosViewModel *)self _initialContentFilterState];
  [(PXPhotosViewModel *)self setContentFilterState:v3];
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  id v5 = (PXSearchQueryMatchInfo *)a3;
  if (self->_searchQueryMatchInfo != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_searchQueryMatchInfo, a3);
    id v5 = v6;
  }
}

- (void)setNoContentPlaceholderFallbackMessage:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_noContentPlaceholderFallbackMessage != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_noContentPlaceholderFallbackMessage, a3);
    [(PXPhotosViewModel *)self signalChange:0x8000000000000];
    id v5 = v6;
  }
}

- (void)setNoContentPlaceholderFallbackTitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_noContentPlaceholderFallbackTitle != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_noContentPlaceholderFallbackTitle, a3);
    [(PXPhotosViewModel *)self signalChange:0x8000000000000];
    id v5 = v6;
  }
}

- (void)setEffectProvider:(id)a3
{
  id aBlock = a3;
  char v4 = _Block_copy(self->_effectProvider);
  id v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      id v8 = _Block_copy(aBlock);
      id effectProvider = self->_effectProvider;
      self->_id effectProvider = v8;

      [(PXPhotosViewModel *)self signalChange:0x1000000000];
    }
  }
}

- (void)setContentBackgroundInsets:(UIEdgeInsets)a3
{
}

- (void)setContentBackgroundOpacity:(double)a3
{
  if (self->_contentBackgroundOpacity != a3)
  {
    self->_contentBackgroundOpacity = a3;
    [(PXPhotosViewModel *)self signalChange:0x20000000000000];
  }
}

- (void)setTitleBackgroundOpacity:(double)a3
{
  if (self->_titleBackgroundOpacity != a3)
  {
    self->_titleBackgroundOpacity = a3;
    [(PXPhotosViewModel *)self signalChange:0x800000000];
  }
}

- (NSOrderedSet)visibleAssetCollections
{
  return (NSOrderedSet *)self->_visibleAssetCollections;
}

- (void)setFloatingTitleOpacity:(double)a3
{
  if (self->_floatingTitleOpacity != a3)
  {
    self->_floatingTitleOpacity = a3;
    PXFloatEqualToFloatWithTolerance();
  }
}

- (void)setHeaderFloatingThresholdOffset:(double)a3
{
  if (self->_headerFloatingThresholdOffset != a3)
  {
    self->_headerFloatingThresholdOffset = a3;
    [(PXPhotosViewModel *)self signalChange:0x100000000];
  }
}

- (void)setContentFilterState:(id)a3
{
  id v8 = (PXContentFilterState *)a3;
  char v4 = self->_contentFilterState;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXContentFilterState *)v8 isEqual:v4];

    if (!v5)
    {
      char v6 = (PXContentFilterState *)[(PXContentFilterState *)v8 copy];
      contentFilterState = self->_contentFilterState;
      self->_contentFilterState = v6;

      [(PXPhotosViewModel *)self signalChange:0x2000000];
      [(PXPhotosViewModel *)self _invalidateAssetsDataSourceManager];
      [(PXPhotosViewModel *)self _invalidateWantsLensControlVisible];
    }
  }
}

- (void)setCaptionsVisible:(BOOL)a3
{
  if (self->_captionsVisible != a3)
  {
    self->_captionsVisible = a3;
    [(PXPhotosViewModel *)self signalChange:2048];
  }
}

- (void)setViewBasedDecorationsEnabled:(BOOL)a3
{
  if (self->_viewBasedDecorationsEnabled != a3)
  {
    self->_viewBasedDecorationsEnabled = a3;
    [(PXPhotosViewModel *)self signalChange:1024];
  }
}

- (void)setEmptyPlaceholderState:(int64_t)a3
{
  if (self->_emptyPlaceholderState != a3)
  {
    self->_emptyPlaceholderState = a3;
    [(PXPhotosViewModel *)self signalChange:0x200000000];
  }
}

- (void)setFooterVisibilityStyle:(int64_t)a3
{
  if (self->_footerVisibilityStyle != a3)
  {
    self->_footerVisibilityStyle = a3;
    [(PXPhotosViewModel *)self _updateFooterVisibility];
  }
}

- (void)setFooterHasImportantInformation:(BOOL)a3
{
  if (self->_footerHasImportantInformation != a3)
  {
    self->_footerHasImportantInformation = a3;
    [(PXPhotosViewModel *)self signalChange:128];
  }
}

- (void)setWantsFooterVisible:(BOOL)a3
{
  if (self->_wantsFooterVisible != a3)
  {
    self->_wantsFooterVisible = a3;
    [(PXPhotosViewModel *)self signalChange:64];
  }
}

- (void)setWantsContentFilterVisible:(BOOL)a3
{
  if (self->_wantsContentFilterVisible != a3)
  {
    self->_wantsContentFilterVisible = a3;
    [(PXPhotosViewModel *)self signalChange:16];
  }
}

- (void)setLastTargetPreferredScrollDetent:(id)a3
{
  id v8 = (PXScrollDetent *)a3;
  BOOL v5 = self->_lastTargetPreferredScrollDetent;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    BOOL v7 = [(PXScrollDetent *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_lastTargetPreferredScrollDetent, a3);
      [(PXPhotosViewModel *)self signalChange:0x800000000000000];
    }
  }
}

- (void)setLastPreferredScrollDetent:(id)a3
{
  id v8 = (PXScrollDetent *)a3;
  BOOL v5 = self->_lastPreferredScrollDetent;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    BOOL v7 = [(PXScrollDetent *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_lastPreferredScrollDetent, a3);
      [(PXPhotosViewModel *)self signalChange:0x800000000000000];
    }
  }
}

- (void)setDesiredCurationLength:(int64_t)a3
{
  if (self->_desiredCurationLength != a3)
  {
    self->_desiredCurationLength = a3;
    [(PXPhotosViewModel *)self _invalidateAssetsDataSourceManager];
    [(PXPhotosViewModel *)self signalChange:0x200000000000];
  }
}

- (void)setWantsLensControlVisible:(BOOL)a3
{
  if (self->_wantsLensControlVisible != a3)
  {
    self->_wantsLensControlVisible = a3;
    [(PXPhotosViewModel *)self _invalidateFooterVisibility];
    [(PXPhotosViewModel *)self signalChange:0x80000000000];
  }
}

- (void)setAvailableLenses:(id)a3
{
  id v8 = (NSArray *)a3;
  char v4 = self->_availableLenses;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      availableLenses = self->_availableLenses;
      self->_availableLenses = v6;

      [(PXPhotosViewModel *)self signalChange:0x100000000000];
      [(PXPhotosViewModel *)self _invalidateCurrentLens];
    }
  }
}

- (void)setCurrentLens:(id)a3
{
  id v8 = (PXPhotosViewLens *)a3;
  char v5 = self->_currentLens;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    BOOL v7 = [(PXPhotosViewLens *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLens, a3);
      [(PXPhotosViewModel *)self signalChange:0x100000000000];
      [(PXPhotosViewModel *)self _invalidateAssetsDataSourceManager];
      [(PXPhotosViewModel *)self _invalidateFooterVisibility];
      [(PXPhotosViewModel *)self _invalidateAspectFitContent];
    }
  }
}

- (void)setWantsContentUnavailableUnlockButtonVisible:(BOOL)a3
{
  if (self->_wantsContentUnavailableUnlockButtonVisible != a3)
  {
    self->_wantsContentUnavailableUnlockButtonVisible = a3;
    [(PXPhotosViewModel *)self signalChange:0x20000000000];
  }
}

- (void)setSystemAuthenticationType:(int64_t)a3
{
  if (self->_systemAuthenticationType != a3)
  {
    self->_systemAuthenticationType = a3;
    [(PXPhotosViewModel *)self signalChange:0x10000000000];
  }
}

- (void)setContentPrivacyState:(int64_t)a3
{
  if (self->_contentPrivacyState != a3)
  {
    self->_contentPrivacyState = a3;
    [(PXPhotosViewModel *)self signalChange:0x400000000];
  }
}

- (void)setRequiresLightTopBars:(BOOL)a3
{
  if (self->_requiresLightTopBars != a3)
  {
    self->_requiresLightTopBars = a3;
    [(PXPhotosViewModel *)self signalChange:0x1000000];
  }
}

- (void)setShowingAlternateContent:(BOOL)a3
{
  if (self->_showingAlternateContent != a3)
  {
    self->_showingAlternateContent = a3;
    [(PXPhotosViewModel *)self signalChange:0x800000];
    [(PXPhotosViewModel *)self _invalidateTopBarsStyles];
  }
}

- (void)setContentBelowTitle:(BOOL)a3
{
  if (self->_contentBelowTitle != a3)
  {
    self->_contentBelowTitle = a3;
    [(PXPhotosViewModel *)self signalChange:0x400000];
    [(PXPhotosViewModel *)self _invalidateTopBarsStyles];
  }
}

- (void)setWantsToolbarVisible:(BOOL)a3
{
  if (self->_wantsToolbarVisible != a3)
  {
    self->_wantsToolbarVisible = a3;
    [(PXPhotosViewModel *)self signalChange:32];
  }
}

- (void)setWantsNavbarVisible:(BOOL)a3
{
  if (self->_wantsNavbarVisible != a3)
  {
    self->_wantsNavbarVisible = a3;
    [(PXPhotosViewModel *)self signalChange:32];
  }
}

- (void)setWantsTabBarVisible:(BOOL)a3
{
  if (self->_wantsTabBarVisible != a3)
  {
    self->_wantsTabBarVisible = a3;
    [(PXPhotosViewModel *)self signalChange:32];
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    [(PXPhotosViewModel *)self signalChange:0x40000000000];
  }
}

- (void)setSupportsAspectRatioToggle:(BOOL)a3
{
  if (self->_supportsAspectRatioToggle != a3)
  {
    self->_supportsAspectRatioToggle = a3;
    [(PXPhotosViewModel *)self signalChange:0x80000];
  }
}

- (void)setZoomStep:(double)a3 isInteractive:(BOOL)a4 shouldAnimate:(BOOL)a5 anchorAssetReference:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  [(PXPhotosViewModel *)self setZoomStep:a3];
  [(PXPhotosViewModel *)self setIsInteractiveZooming:v7];
  [(PXPhotosViewModel *)self setShouldAnimateZooming:v6];
  [(PXPhotosViewModel *)self setZoomAnchorAssetReference:v10];
}

- (void)setZoomAnchorAssetReference:(id)a3
{
  char v5 = (PXAssetReference *)a3;
  if (self->_zoomAnchorAssetReference != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_zoomAnchorAssetReference, a3);
    [(PXPhotosViewModel *)self signalChange:0x20000];
    char v5 = v6;
  }
}

- (void)setShouldAnimateZooming:(BOOL)a3
{
  if (self->_shouldAnimateZooming != a3) {
    self->_shouldAnimateZooming = a3;
  }
}

- (void)setIsInteractiveZooming:(BOOL)a3
{
  if (self->_isInteractiveZooming != a3)
  {
    self->_isInteractiveZooming = a3;
    [(PXPhotosViewModel *)self signalChange:0x40000];
  }
}

- (void)setYearsMonthsZoomStepRange:(_NSRange)a3
{
  if (self->_yearsMonthsZoomStepRange.location != a3.location || self->_yearsMonthsZoomStepRange.length != a3.length)
  {
    self->_yearsMonthsZoomStepRange = a3;
    [(PXPhotosViewModel *)self signalChange:0x8000];
  }
}

- (void)setNumberOfZoomSteps:(int64_t)a3
{
  if (self->_numberOfZoomSteps != a3)
  {
    self->_numberOfZoomSteps = a3;
    [(PXPhotosViewModel *)self signalChange:0x8000];
  }
}

- (void)setZoomStep:(double)a3
{
  if (self->_zoomStep != a3)
  {
    self->_zoomStep = a3;
    [(PXPhotosViewModel *)self signalChange:0x10000];
    [(PXPhotosViewModel *)self _invalidateGridAppearance];
  }
}

- (void)setUserWantsAspectFitContent:(id)a3
{
  char v14 = (NSNumber *)a3;
  char v4 = self->_userWantsAspectFitContent;
  if (v4 != v14)
  {
    char v5 = v4;
    char v6 = [(NSNumber *)v4 isEqual:v14];

    BOOL v7 = v14;
    if (v6) {
      goto LABEL_11;
    }
    id v8 = (NSNumber *)[(NSNumber *)v14 copy];
    userWantsAspectFitContent = self->_userWantsAspectFitContent;
    self->_userWantsAspectFitContent = v8;

    id v10 = [(PXPhotosViewModel *)self specManager];
    uint64_t v11 = [v10 spec];
    if ([v11 userInterfaceIdiom] == 2)
    {
      BOOL v12 = [(PXPhotosViewModel *)self isInCompactMode];

      if (v12)
      {
        uint64_t v13 = +[PXUserDefaults standardUserDefaults];
        [v13 setPhotosGridAspectFitInCompact:v14];
LABEL_9:

        [(PXPhotosViewModel *)self signalChange:0x4000000];
        [(PXPhotosViewModel *)self _invalidateAspectFitContent];
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v13 = +[PXUserDefaults standardUserDefaults];
    [v13 setPhotosGridAspectFit:v14];
    goto LABEL_9;
  }

LABEL_10:
  BOOL v7 = v14;
LABEL_11:
}

- (BOOL)shouldAspectFitContentByDefault
{
  int64_t contentMode = self->_contentMode;
  if (contentMode) {
    return contentMode == 2;
  }
  char v5 = [(PXPhotosViewModel *)self specManager];
  char v6 = [v5 spec];
  if (([v6 userInterfaceIdiom] == 4 || !-[PXPhotosViewModel isInCompactMode](self, "isInCompactMode"))
    && (unint64_t)([(PXPhotosViewModel *)self gridStyle] - 3) <= 0xFFFFFFFFFFFFFFFDLL
    && ([(PXPhotosViewModel *)self itemAspectRatio], v7 == 1.0))
  {
    id v8 = [(PXPhotosViewModel *)self specManager];
    uint64_t v9 = [v8 spec];
    BOOL v3 = [v9 userInterfaceIdiom] != 5;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)setTopDismissAreaHeight:(id)a3
{
  char v4 = (NSNumber *)[a3 copy];
  topDismissAreaHeight = self->_topDismissAreaHeight;
  self->_topDismissAreaHeight = v4;
}

- (void)setAllowedGesturesKind:(int64_t)a3
{
  self->_allowedGesturesKind = a3;
}

- (int64_t)searchActionLocation
{
  if (![(PXPhotosViewModel *)self allowsSearch]
    || ([(PXPhotosViewModel *)self allowedChromeItems] & 8) == 0)
  {
    return 0;
  }
  char v4 = [(PXPhotosViewModel *)self specManager];
  char v5 = [v4 spec];
  int64_t v6 = [v5 searchActionLocation];

  return v6;
}

- (BOOL)wantsSelectButton
{
  LODWORD(v3) = [(PXPhotosViewModel *)self canEnterSelectMode];
  if (v3) {
    return ([(PXPhotosViewModel *)self allowedChromeItems] >> 2) & 1;
  }
  return v3;
}

- (void)setChromeTitleFloatingFraction:(double)a3
{
  if (self->_chromeTitleFloatingFraction != a3)
  {
    self->_chromeTitleFloatingFraction = a3;
    [(PXPhotosViewModel *)self signalChange:0x2000000000000000];
  }
}

- (void)setChromeItemsToBeConsideredVisibleForLayoutPurpose:(unint64_t)a3
{
  if (self->_chromeItemsToBeConsideredVisibleForLayoutPurpose != a3)
  {
    self->_chromeItemsToBeConsideredVisibleForLayoutPurpose = a3;
    [(PXPhotosViewModel *)self signalChange:0x2000000000000000];
  }
}

- (void)setAllowedChromeItems:(unint64_t)a3
{
  if (self->_allowedChromeItems != a3)
  {
    self->_allowedChromeItems = a3;
    [(PXPhotosViewModel *)self signalChange:32];
  }
}

- (void)setAlwaysRequiresLightChrome:(BOOL)a3
{
  if (self->_alwaysRequiresLightChrome != a3)
  {
    self->_alwaysRequiresLightChrome = a3;
    [(PXPhotosViewModel *)self _invalidateTopBarsStyles];
  }
}

- (void)setChromeOpacity:(double)a3
{
  if (self->_chromeOpacity != a3)
  {
    self->_chromeOpacity = a3;
    [(PXPhotosViewModel *)self signalChange:0x2000000000000000];
  }
}

- (void)setAdditionalAspectFitEdgeMargins:(UIEdgeInsets)a3
{
}

- (void)setAspectFitContent:(BOOL)a3
{
  if (self->_aspectFitContent != a3)
  {
    self->_aspectFitContent = a3;
    [(PXPhotosViewModel *)self signalChange:0x4000];
  }
}

- (PXAssetReference)firstSelectedAssetReference
{
  BOOL v3 = [(PXPhotosViewModel *)self selectionManager];
  char v4 = [v3 selectionSnapshot];

  long long v11 = 0u;
  long long v12 = 0u;
  if (v4
    && (([v4 firstSelectedIndexPath], (void)v11 != *(void *)off_1E5DAAED8)
      ? (BOOL v5 = (void)v12 == 0x7FFFFFFFFFFFFFFFLL)
      : (BOOL v5 = 1),
        !v5 ? (BOOL v6 = *((void *)&v12 + 1) == 0x7FFFFFFFFFFFFFFFLL) : (BOOL v6 = 0),
        v6))
  {
    id v8 = [(PXPhotosViewModel *)self currentDataSource];
    v10[0] = v11;
    v10[1] = v12;
    double v7 = [v8 assetReferenceAtItemIndexPath:v10];
  }
  else
  {
    double v7 = 0;
  }

  return (PXAssetReference *)v7;
}

- (PXAssetReference)singleSelectedAssetReference
{
  BOOL v3 = [(PXPhotosViewModel *)self selectionManager];
  char v4 = [v3 selectionSnapshot];
  BOOL v5 = [v4 selectedIndexPaths];
  if ([v5 count] == 1)
  {
    BOOL v6 = [(PXPhotosViewModel *)self firstSelectedAssetReference];
  }
  else
  {
    BOOL v6 = 0;
  }

  return (PXAssetReference *)v6;
}

- (void)setTapbackStatusManager:(id)a3
{
  BOOL v5 = (PXTapbackStatusManager *)a3;
  if (self->_tapbackStatusManager != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_tapbackStatusManager, a3);
    [(PXPhotosViewModel *)self signalChange:0x4000000000];
    BOOL v5 = v6;
  }
}

- (void)setDropTargetAssetReference:(id)a3
{
  id v8 = (PXAssetReference *)a3;
  BOOL v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(PXAssetReference *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      [(PXPhotosViewModel *)self signalChange:512];
    }
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  id v8 = (NSSet *)a3;
  BOOL v5 = self->_draggedAssetReferences;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(NSSet *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_draggedAssetReferences, a3);
      [(PXPhotosViewModel *)self signalChange:256];
    }
  }
}

- (void)setCplActionManagerClass:(Class)a3
{
  p_cplActionManagerClass = &self->_cplActionManagerClass;
  if (*p_cplActionManagerClass != a3)
  {
    objc_storeStrong((id *)p_cplActionManagerClass, a3);
    [(PXPhotosViewModel *)self signalChange:0x8000000000];
  }
}

- (void)setCustomBannerView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (self->_customBannerView != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_customBannerView, a3);
    [(PXPhotosViewModel *)self signalChange:32];
    BOOL v5 = v6;
  }
}

- (void)setCustomTrailingAccessoryView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (self->_customTrailingAccessoryView != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_customTrailingAccessoryView, a3);
    [(PXPhotosViewModel *)self signalChange:32];
    BOOL v5 = v6;
  }
}

- (void)setCustomLeadingAccessoryView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (self->_customLeadingAccessoryView != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_customLeadingAccessoryView, a3);
    [(PXPhotosViewModel *)self signalChange:32];
    BOOL v5 = v6;
  }
}

- (void)setAllowsPreviewHeader:(BOOL)a3
{
  if (self->_allowsPreviewHeader != a3)
  {
    BOOL v3 = a3;
    self->_allowsPreviewHeader = a3;
    [(PXPhotosViewModel *)self signalChange:0x800000000000];
    id v6 = [(PXPhotosViewModel *)self previewHeaderDisabledUserDefaultsKey];
    if (v6)
    {
      BOOL v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v5 setBool:!v3 forKey:v6];
    }
  }
}

- (void)setHeaderTitleTopInset:(double)a3
{
  if (self->_headerTitleTopInset != a3)
  {
    self->_headerTitleTopInset = a3;
    [(PXPhotosViewModel *)self signalChange:0x10000000];
  }
}

- (void)setHeaderSubtitle:(id)a3
{
  id v8 = (NSString *)a3;
  char v4 = self->_headerSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      headerSubtitle = self->_headerSubtitle;
      self->_headerSubtitle = v6;

      [(PXPhotosViewModel *)self signalChange:0x80000000000000];
    }
  }
}

- (void)setHeaderTitle:(id)a3
{
  id v8 = (NSString *)a3;
  char v4 = self->_headerTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      headerTitle = self->_headerTitle;
      self->_headerTitle = v6;

      [(PXPhotosViewModel *)self signalChange:0x80000000000000];
    }
  }
}

- (void)setScrolledToBottom:(BOOL)a3
{
  if (self->_scrolledToBottom != a3)
  {
    self->_scrolledToBottom = a3;
    [(PXPhotosViewModel *)self signalChange:0x100000000000000];
  }
}

- (void)setScrolledToTop:(BOOL)a3
{
  if (self->_scrolledToTop != a3)
  {
    self->_scrolledToTop = a3;
    [(PXPhotosViewModel *)self signalChange:0x80000000];
  }
}

- (void)setHasScrollableContent:(BOOL)a3
{
  if (self->_hasScrollableContent != a3)
  {
    self->_hasScrollableContent = a3;
    [(PXPhotosViewModel *)self signalChange:0x100000];
    [(PXPhotosViewModel *)self _invalidateFooterVisibility];
  }
}

- (void)setDismissRequested:(BOOL)a3
{
  if (self->_dismissRequested != a3)
  {
    self->_dismissRequested = a3;
    [(PXPhotosViewModel *)self signalChange:0x40000000];
  }
}

- (void)setIsAppearing:(BOOL)a3
{
  if (self->_isAppearing != a3)
  {
    self->_isAppearing = a3;
    [(PXPhotosViewModel *)self signalChange:4096];
  }
}

- (void)setAppearState:(int64_t)a3
{
  if (self->_appearState != a3)
  {
    self->_appearState = a3;
    [(PXPhotosViewModel *)self signalChange:4096];
    [(PXPhotosViewModel *)self setIsAppearing:a3 == 1];
  }
}

- (void)setIsInCompactMode:(BOOL)a3
{
  if (self->_isInCompactMode != a3)
  {
    self->_isInCompactMode = a3;
    [(PXPhotosViewModel *)self signalChange:0x2000];
    [(PXPhotosViewModel *)self _invalidateChromeVisibility];
    [(PXPhotosViewModel *)self _invalidateUserWantsAspectFitContent];
    [(PXPhotosViewModel *)self _invalidateAspectFitContent];
  }
}

- (BOOL)canPresentOneUp
{
  return self->_allowsOneUpPresentation
      && [(NSMutableSet *)self->_oneUpPresentationPreventedForReasons count] == 0;
}

- (BOOL)isModalInPresentation
{
  return [(NSMutableSet *)self->_modalInPresentationReasons count] != 0;
}

- (void)setModalInPresentation:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  BOOL v6 = [(PXPhotosViewModel *)self isModalInPresentation];
  modalInPresentationReasons = self->_modalInPresentationReasons;
  if (modalInPresentationReasons) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    id v10 = self->_modalInPresentationReasons;
    self->_modalInPresentationReasons = v9;

    modalInPresentationReasons = self->_modalInPresentationReasons;
  }
  if (v4) {
    [(NSMutableSet *)modalInPresentationReasons addObject:v11];
  }
  else {
    [(NSMutableSet *)modalInPresentationReasons removeObject:v11];
  }
  if (v6 != [(PXPhotosViewModel *)self isModalInPresentation]) {
    [(PXPhotosViewModel *)self signalChange:0x1000000000000000];
  }
}

- (BOOL)isScrollDisabledForAxis:(int64_t)a3
{
  scrollDisabledReasonsByAxis = self->_scrollDisabledReasonsByAxis;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  char v5 = [(NSMutableDictionary *)scrollDisabledReasonsByAxis objectForKeyedSubscript:v4];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)setScrollDisabled:(BOOL)a3 axis:(int64_t)a4 forReason:(id)a5
{
  BOOL v6 = a3;
  id v17 = a5;
  BOOL v8 = [(PXPhotosViewModel *)self isScrollDisabledForAxis:a4];
  scrollDisabledReasonsByAxis = self->_scrollDisabledReasonsByAxis;
  id v10 = [NSNumber numberWithInteger:a4];
  id v11 = [(NSMutableDictionary *)scrollDisabledReasonsByAxis objectForKeyedSubscript:v10];

  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v6;
  }
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v13 = self->_scrollDisabledReasonsByAxis;
    if (!v13)
    {
      char v14 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v15 = self->_scrollDisabledReasonsByAxis;
      self->_scrollDisabledReasonsByAxis = v14;

      uint64_t v13 = self->_scrollDisabledReasonsByAxis;
    }
    char v16 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v13 setObject:v11 forKeyedSubscript:v16];
  }
  if (v6) {
    [v11 addObject:v17];
  }
  else {
    [v11 removeObject:v17];
  }
  if (v8 != [(PXPhotosViewModel *)self isScrollDisabledForAxis:a4]) {
    [(PXPhotosViewModel *)self signalChange:0x200000000000000];
  }
}

- (BOOL)hideSurroundingContent
{
  return [(NSMutableSet *)self->_hideSurroundingContentForReasons count] != 0;
}

- (void)setHideSurroundingContent:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(PXPhotosViewModel *)self hideSurroundingContent];
  hideSurroundingContentForReasons = self->_hideSurroundingContentForReasons;
  if (v4) {
    [(NSMutableSet *)hideSurroundingContentForReasons addObject:v6];
  }
  else {
    [(NSMutableSet *)hideSurroundingContentForReasons removeObject:v6];
  }

  if (v7 != [(PXPhotosViewModel *)self hideSurroundingContent])
  {
    [(PXPhotosViewModel *)self signalChange:0x20000000];
  }
}

- (void)setAspectRatioToggleAllowed:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  aspectRatioTogglePreventedForReasons = self->_aspectRatioTogglePreventedForReasons;
  id v7 = a4;
  uint64_t v8 = [(NSMutableSet *)aspectRatioTogglePreventedForReasons count];
  uint64_t v9 = self->_aspectRatioTogglePreventedForReasons;
  if (v4) {
    [(NSMutableSet *)v9 removeObject:v7];
  }
  else {
    [(NSMutableSet *)v9 addObject:v7];
  }

  if ((v8 == 0) == ([(NSMutableSet *)self->_aspectRatioTogglePreventedForReasons count] != 0))
  {
    [(PXPhotosViewModel *)self _invalidateAspectFitContent];
  }
}

- (void)setOneUpPresentationAllowed:(BOOL)a3 forReason:(id)a4
{
  oneUpPresentationPreventedForReasons = self->_oneUpPresentationPreventedForReasons;
  if (a3) {
    [(NSMutableSet *)oneUpPresentationPreventedForReasons removeObject:a4];
  }
  else {
    [(NSMutableSet *)oneUpPresentationPreventedForReasons addObject:a4];
  }
}

- (BOOL)canFilterContent
{
  BOOL v3 = [(PXPhotosViewModel *)self dataSourceManager];
  if ([v3 supportsFiltering])
  {
    BOOL v4 = [(PXPhotosViewModel *)self contentFilterState];
    if ([v4 isFiltering])
    {
      char v5 = 1;
    }
    else
    {
      id v6 = [(PXPhotosViewModel *)self currentDataSource];
      char v5 = [v6 containsAnyItems];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)deselectAll
{
  id v2 = [(PXPhotosViewModel *)self selectionManager];
  [v2 performChanges:&__block_literal_global_336];
}

uint64_t __32__PXPhotosViewModel_deselectAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)selectAll
{
  id v2 = [(PXPhotosViewModel *)self selectionManager];
  [v2 performChanges:&__block_literal_global_334];
}

uint64_t __30__PXPhotosViewModel_selectAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (BOOL)canSwipeSelect
{
  BOOL v3 = [(PXPhotosViewModel *)self isInSelectMode];
  if (v3) {
    LOBYTE(v3) = [(NSMutableSet *)self->_enterSelectModePreventedForReasons count] == 0;
  }
  return v3;
}

- (BOOL)canEnterSelectMode
{
  BOOL v3 = [(PXPhotosViewModel *)self allowsSelectModeToggle];
  if (v3) {
    LOBYTE(v3) = [(NSMutableSet *)self->_enterSelectModePreventedForReasons count] == 0;
  }
  return v3;
}

- (void)setEnterSelectModeAllowed:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(PXPhotosViewModel *)self canEnterSelectMode];
  enterSelectModePreventedForReasons = self->_enterSelectModePreventedForReasons;
  if (v4) {
    [(NSMutableSet *)enterSelectModePreventedForReasons removeObject:v6];
  }
  else {
    [(NSMutableSet *)enterSelectModePreventedForReasons addObject:v6];
  }

  if (v7 != [(PXPhotosViewModel *)self canEnterSelectMode])
  {
    [(PXPhotosViewModel *)self signalChange:0x200000];
  }
}

- (BOOL)attemptSetInSelectMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    if (![(PXPhotosViewModel *)self canEnterSelectMode]) {
      goto LABEL_3;
    }
  }
  else if (![(PXPhotosViewModel *)self canExitSelectMode])
  {
LABEL_3:
    PXAssertGetLog();
  }
  [(PXPhotosViewModel *)self setIsInSelectMode:v3];
  return 1;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    BOOL v3 = a3;
    self->_isInSelectMode = a3;
    [(PXPhotosViewModel *)self signalChange:4];
    if (!v3)
    {
      char v5 = [(PXPhotosViewModel *)self selectionManager];
      [v5 performChanges:&__block_literal_global_60932];
    }
    [(PXPhotosViewModel *)self _invalidateChromeVisibility];
    [(PXPhotosViewModel *)self _invalidateWantsLensControlVisible];
    [(PXPhotosViewModel *)self setScrollDisabled:v3 axis:2 forReason:@"selectMode"];
    [(PXPhotosViewModel *)self setModalInPresentation:v3 forReason:@"selectMode"];
  }
}

uint64_t __39__PXPhotosViewModel_setIsInSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)setSelectionSnapshot:(id)a3
{
  uint64_t v8 = (PXSelectionSnapshot *)a3;
  char v5 = self->_selectionSnapshot;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PXSelectionSnapshot *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      [(PXPhotosViewModel *)self signalChange:2];
    }
  }
}

- (void)setCurrentDataSource:(id)a3
{
  uint64_t v8 = (PXAssetsDataSource *)a3;
  char v5 = self->_currentDataSource;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PXAssetsDataSource *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentDataSource, a3);
      [(PXPhotosViewModel *)self signalChange:1];
      [(PXPhotosViewModel *)self _invalidateDraggedAssetReferences];
      [(PXPhotosViewModel *)self _invalidateChromeVisibility];
      [(PXPhotosViewModel *)self _invalidateEmptyPlaceholderState];
      [(PXPhotosViewModel *)self _invalidateCurrentDataSourceContainer];
    }
  }
}

- (void)markContentAsViewed
{
  id v2 = [(PXPhotosViewModel *)self dataSourceManager];
  [v2 markContentAsViewed];
}

- (void)noteFullscreenOverlayControllersChanged
{
}

- (void)setShouldAlwaysRespectToolbarActionPlacementPreference:(BOOL)a3
{
  if (self->_shouldAlwaysRespectToolbarActionPlacementPreference != a3)
  {
    self->_shouldAlwaysRespectToolbarActionPlacementPreference = a3;
    [(PXPhotosViewModel *)self signalChange:0x2000000000];
  }
}

- (void)setAllowsEmptyPlaceholderBehavior:(BOOL)a3
{
  if (self->_allowsEmptyPlaceholderBehavior != a3)
  {
    self->_allowsEmptyPlaceholderBehavior = a3;
    [(PXPhotosViewModel *)self signalChange:0];
    [(PXPhotosViewModel *)self _invalidateEmptyPlaceholderState];
  }
}

- (void)setShowLoadingPlaceholderWhenEmpty:(BOOL)a3
{
  if (self->_showLoadingPlaceholderWhenEmpty != a3)
  {
    self->_showLoadingPlaceholderWhenEmpty = a3;
    [(PXPhotosViewModel *)self signalChange:0];
    [(PXPhotosViewModel *)self _invalidateEmptyPlaceholderState];
  }
}

- (void)setHidesToolbar:(BOOL)a3
{
  if (self->_hidesToolbar != a3)
  {
    self->_hidesToolbar = a3;
    [(PXPhotosViewModel *)self signalChange:0];
    [(PXPhotosViewModel *)self _invalidateChromeVisibility];
  }
}

- (void)setHidesNavbar:(BOOL)a3
{
  if (self->_hidesNavbar != a3)
  {
    self->_hidesNavbar = a3;
    [(PXPhotosViewModel *)self signalChange:0];
    [(PXPhotosViewModel *)self _invalidateTopBarsStyles];
    [(PXPhotosViewModel *)self _invalidateChromeVisibility];
  }
}

- (void)setKeepsTabBarAlwaysHidden:(BOOL)a3
{
  if (self->_keepsTabBarAlwaysHidden != a3)
  {
    self->_keepsTabBarAlwaysHidden = a3;
    [(PXPhotosViewModel *)self signalChange:0];
    [(PXPhotosViewModel *)self _invalidateChromeVisibility];
  }
}

- (id)_indexPathsForAssetCollectionReference:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  char v5 = [(PXPhotosViewModel *)self currentDataSource];
  id v6 = v5;
  if (v5)
  {
    [v5 indexPathForAssetCollectionReference:v4];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  char v7 = [(PXPhotosViewModel *)self currentDataSource];
  v10[0] = v11;
  v10[1] = v12;
  uint64_t v8 = [v7 indexPathSetForItemsInIndexPath:v10];

  return v8;
}

- (void)clickSelectAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  char v7 = [(PXPhotosViewModel *)self currentDataSource];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 indexPathForAssetReference:v6];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }

  if ((void)v9 == *(void *)off_1E5DAAED8) {
    PXAssertGetLog();
  }
  *(_OWORD *)buf = v9;
  long long v12 = v10;
  [(PXPhotosViewModel *)self clickSelectIndexPath:buf updateCursorIndexPath:v4];
}

- (void)clickSelectIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4
{
  BOOL v4 = a4;
  char v7 = [(PXPhotosViewModel *)self selectionSnapshot];
  long long v8 = *(_OWORD *)&a3->item;
  v27[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v27[1] = v8;
  char v9 = [v7 isIndexPathSelected:v27];

  if (v9)
  {
    if (!v4) {
      return;
    }
    long long v10 = [(PXPhotosViewModel *)self selectionManager];
    long long v11 = v10;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke_2;
    char v18 = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v12 = *(_OWORD *)&a3->item;
    long long v19 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v20 = v12;
    uint64_t v13 = &v15;
  }
  else
  {
    long long v10 = [(PXPhotosViewModel *)self selectionManager];
    long long v11 = v10;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke;
    char v24 = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v14 = *(_OWORD *)&a3->item;
    long long v25 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v26 = v14;
    uint64_t v13 = &v21;
  }
  objc_msgSend(v10, "performChanges:", v13, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
}

uint64_t __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

uint64_t __64__PXPhotosViewModel_clickSelectIndexPath_updateCursorIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setCursorIndexPath:v4];
}

- (void)toggleSelectionForAssetCollectionReference:(id)a3
{
  BOOL v4 = [(PXPhotosViewModel *)self _indexPathsForAssetCollectionReference:a3];
  char v5 = [(PXPhotosViewModel *)self selectionSnapshot];
  id v6 = [v5 selectedIndexPaths];
  char v7 = [v4 isSubsetOfSet:v6];

  long long v8 = [(PXPhotosViewModel *)self selectionManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __64__PXPhotosViewModel_toggleSelectionForAssetCollectionReference___block_invoke;
  v10[3] = &unk_1E5DCFE48;
  char v12 = v7;
  id v11 = v4;
  id v9 = v4;
  [v8 performChanges:v10];
}

uint64_t __64__PXPhotosViewModel_toggleSelectionForAssetCollectionReference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedState:*(unsigned char *)(a1 + 40) == 0 forIndexPathSet:*(void *)(a1 + 32)];
}

- (void)toggleSelectionForAssetReference:(id)a3
{
}

- (void)toggleSelectionForAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  char v7 = [(PXPhotosViewModel *)self currentDataSource];
  long long v8 = v7;
  if (v7)
  {
    [v7 indexPathForAssetReference:v6];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }

  if ((void)v9 == *(void *)off_1E5DAAED8) {
    PXAssertGetLog();
  }
  *(_OWORD *)buf = v9;
  long long v12 = v10;
  [(PXPhotosViewModel *)self toggleSelectionForIndexPath:buf updateCursorIndexPath:v4];
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v4[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v4[1] = v3;
  [(PXPhotosViewModel *)self toggleSelectionForIndexPath:v4 updateCursorIndexPath:0];
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4
{
  char v7 = [(PXPhotosViewModel *)self selectionSnapshot];
  long long v8 = *(_OWORD *)&a3->item;
  v17[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v17[1] = v8;
  char v9 = [v7 isIndexPathSelected:v17];

  long long v10 = [(PXPhotosViewModel *)self selectionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PXPhotosViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke;
  v12[3] = &__block_descriptor_66_e37_v16__0___PXMutableSelectionManager__8l;
  char v15 = v9;
  long long v11 = *(_OWORD *)&a3->item;
  long long v13 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v14 = v11;
  BOOL v16 = a4;
  [v10 performChanges:v12];
}

uint64_t __71__PXPhotosViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(unsigned char *)(a1 + 64) == 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 65);
  long long v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  return [a2 setSelectedState:v2 forIndexPath:v6 andUpdateCursorIndexPath:v3];
}

- (int64_t)selectionContext
{
  int64_t selectionContext = self->_selectionContext;
  if (!selectionContext)
  {
    uint64_t v3 = [(PXPhotosViewModel *)self currentDataSource];
    long long v4 = [v3 containerCollection];

    if (objc_msgSend(v4, "px_isSmartAlbum"))
    {
      if (objc_msgSend(v4, "px_isRecentlyDeletedSmartAlbum"))
      {
        int64_t selectionContext = 21;
LABEL_14:

        return selectionContext;
      }
      BOOL v5 = objc_msgSend(v4, "px_isRecoveredSmartAlbum") == 0;
      uint64_t v6 = 27;
      uint64_t v7 = 22;
    }
    else
    {
      if (objc_msgSend(v4, "px_isMoment"))
      {
        int64_t selectionContext = 14;
        goto LABEL_14;
      }
      if ((objc_msgSend(v4, "px_isImportSessionCollection") & 1) != 0
        || (objc_msgSend(v4, "px_isImportHistoryCollection") & 1) != 0)
      {
        int64_t selectionContext = 6;
        goto LABEL_14;
      }
      if (objc_msgSend(v4, "px_isContentSyndicationAlbum"))
      {
        int64_t selectionContext = 29;
        goto LABEL_14;
      }
      BOOL v5 = objc_msgSend(v4, "px_isSharedAlbum") == 0;
      uint64_t v6 = 28;
      uint64_t v7 = 24;
    }
    if (v5) {
      int64_t selectionContext = v6;
    }
    else {
      int64_t selectionContext = v7;
    }
    goto LABEL_14;
  }
  return selectionContext;
}

- (void)_updatePersonContainerProperties
{
  v25[1] = *MEMORY[0x1E4F143B8];
  long long v4 = [(PXPhotosViewModel *)self assetCollectionActionManager];
  BOOL v5 = [(PXPhotosViewModel *)self currentDataSource];
  uint64_t v6 = [v5 container];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v20 = (objc_class *)objc_opt_class();
      long long v19 = NSStringFromClass(v20);
      uint64_t v21 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v17 handleFailureInMethod:a2, self, @"PXPhotosViewModel.m", 858, @"%@ should be an instance inheriting from %@, but it is %@", @"container", v19, v21 object file lineNumber description];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      char v18 = (objc_class *)objc_opt_class();
      long long v19 = NSStringFromClass(v18);
      [v17 handleFailureInMethod:a2, self, @"PXPhotosViewModel.m", 858, @"%@ should be an instance inheriting from %@, but it is nil", @"container", v19 object file lineNumber description];
    }

LABEL_4:
    v25[0] = v7;
    long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    char v9 = [v7 photoLibrary];
    long long v10 = +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:v8 photoLibrary:v9];
    [v4 setPeople:v10];

    long long v11 = [(PXPhotosViewModel *)self dataSourceManager];
    +[PXPeopleUtilities sortDescriptorsWithPersonAssetSortOrder:](PXPeopleUtilities, "sortDescriptorsWithPersonAssetSortOrder:", [v7 assetSortOrder]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [v11 sortDescriptors];
    if (v13 == v12)
    {

      BOOL v16 = v12;
    }
    else
    {
      long long v14 = v13;
      char v15 = [v13 isEqual:v12];

      if (v15)
      {
LABEL_9:

        goto LABEL_10;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke;
      block[3] = &unk_1E5DD32A8;
      id v23 = v11;
      id v24 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);

      BOOL v16 = v23;
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke_2;
  v2[3] = &unk_1E5DB4A80;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performChanges:v2];
}

uint64_t __53__PXPhotosViewModel__updatePersonContainerProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSortDescriptors:*(void *)(a1 + 32)];
}

- (void)_invalidatePersonContainerProperties
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersonContainerProperties];
}

- (void)setCurrentDataSourceContainer:(id)a3
{
  id v5 = a3;
  if (self->_currentDataSourceContainer != v5)
  {
    id v6 = v5;
    objc_storeStrong(&self->_currentDataSourceContainer, a3);
    [(PXPhotosViewModel *)self _invalidatePersonContainerProperties];
    id v5 = v6;
  }
}

- (void)_updateCurrentDataSourceContainer
{
  id v4 = [(PXPhotosViewModel *)self currentDataSource];
  id v3 = [v4 container];
  [(PXPhotosViewModel *)self setCurrentDataSourceContainer:v3];
}

- (void)_invalidateCurrentDataSourceContainer
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentDataSourceContainer];
}

- (void)_updateSortOrder
{
  id v3 = [(PXPhotosViewModel *)self viewOptionsModel];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 sortOrderState];
    id v6 = PXFetchSortOrderStandardAssetSortDescriptors([v5 sortOrder]);

    id v7 = [(PXPhotosViewModel *)self dataSourceManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__PXPhotosViewModel__updateSortOrder__block_invoke;
    v9[3] = &unk_1E5DD1458;
    id v10 = v6;
    id v8 = v6;
    [v7 performChanges:v9];
  }
}

uint64_t __37__PXPhotosViewModel__updateSortOrder__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSortDescriptors:*(void *)(a1 + 32)];
}

- (void)_updateWantsLensControlVisible
{
  if ([(PXPhotosViewModel *)self allowsLensControl]
    && (int64_t v3 = [(PXPhotosViewModel *)self contentPrivacyState],
        ![(PXPhotosViewModel *)self neverShowsLensControl]))
  {
    uint64_t v4 = (v3 != 1) & ~[(PXPhotosViewModel *)self isInSelectMode];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(PXPhotosViewModel *)self setWantsLensControlVisible:v4];
}

- (void)_invalidateWantsLensControlVisible
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsLensControlVisible];
}

- (void)_updateCurrentLens
{
  id v8 = [(PXPhotosViewModel *)self availableLenses];
  uint64_t v3 = [(PXPhotosViewModel *)self currentLens];
  if (!v3
    || (uint64_t v4 = (void *)v3,
        [(PXPhotosViewModel *)self currentLens],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v8 containsObject:v5],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v7 = [v8 firstObject];
    [(PXPhotosViewModel *)self setCurrentLens:v7];
  }
}

- (void)_invalidateCurrentLens
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentLens];
}

- (void)_updateAvailableLenses
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(PXPhotosViewModel *)self allowsLensControl])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(PXPhotosViewModel *)self availableLenses];
    id v5 = v4;
    if (v4)
    {
      id v3 = v4;
    }
    else
    {
      char v6 = [[PXPhotosViewLens alloc] initWithTitle:@"Configured" symbolName:0 defaultSectionBodyStyle:self->_configuredSectionBodyStyle];
      v7[0] = v6;
      id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
  }
  [(PXPhotosViewModel *)self setAvailableLenses:v3];
}

- (void)_invalidateAvailableLenses
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAvailableLenses];
}

- (void)_updateWantsContentUnavailableUnlockButtonVisible
{
  id v3 = [(PXPhotosViewModel *)self privacyController];
  int v4 = [v3 willPerformAuthenticationAutomatically];

  id v5 = +[PXContentPrivacySettings sharedInstance];
  char v6 = self;
  unsigned int v7 = [v6 shouldAlwaysShowUnlockButtonInContentUnavailableViews];

  [(PXPhotosViewModel *)self setWantsContentUnavailableUnlockButtonVisible:v4 ^ 1 | v7];
}

- (void)_invalidateWantsContentUnavailableUnlockButtonVisible
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsContentUnavailableUnlockButtonVisible];
}

- (void)_updateSystemAuthenticationType
{
  id v3 = [(PXPhotosViewModel *)self privacyController];
  uint64_t v4 = [v3 authenticationType];

  [(PXPhotosViewModel *)self setSystemAuthenticationType:v4];
}

- (void)_invalidateSystemAuthenticationType
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSystemAuthenticationType];
}

- (void)_updateContentPrivacyState
{
  id v3 = [(PXPhotosViewModel *)self privacyController];
  unsigned int v4 = [v3 isLocked];

  [(PXPhotosViewModel *)self setContentPrivacyState:v4];
}

- (void)_invalidateContentPrivacyState
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateContentPrivacyState];
}

- (void)_updateEmptyPlaceholderState
{
  id v11 = [(PXPhotosViewModel *)self dataSourceManager];
  int64_t v3 = [(PXPhotosViewModel *)self contentPrivacyState];
  unsigned int v4 = [(PXPhotosViewModel *)self currentDataSource];
  int v5 = [v4 containsAnyItems];

  int v6 = [v11 isLoadingInitialDataSource];
  if (v6 & 1) != 0 || (v5)
  {
    BOOL v7 = v3 == 1;
    uint64_t v8 = 3;
    if (v5) {
      uint64_t v8 = 0;
    }
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    if ([v11 isBackgroundFetching])
    {
      BOOL v7 = v3 == 1;
LABEL_10:
      uint64_t v8 = 2;
      goto LABEL_11;
    }
    BOOL v9 = [(PXPhotosViewModel *)self showLoadingPlaceholderWhenEmpty];
    BOOL v7 = v3 == 1;
    if (v9) {
      goto LABEL_10;
    }
    uint64_t v8 = 3;
  }
LABEL_11:
  if (v7) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v8;
  }
  [(PXPhotosViewModel *)self setEmptyPlaceholderState:v10];
}

- (void)_invalidateEmptyPlaceholderState
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateEmptyPlaceholderState];
}

- (void)_updateAssetsDataSourceManager
{
  unsigned int v4 = [(PXPhotosViewModel *)self contentFilterState];
  if ([v4 isFiltering])
  {
  }
  else
  {
    BOOL v5 = [(PXPhotosViewModel *)self ignoreContentFilterStateWhenNotFiltering];

    if (v5) {
      return;
    }
  }
  int v6 = [(PXPhotosViewModel *)self selectionSnapshot];
  BOOL v7 = [v6 dataSource];

  uint64_t v8 = [(PXPhotosViewModel *)self visibleAssetCollections];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__60967;
  v40[4] = __Block_byref_object_dispose__60968;
  BOOL v9 = [v8 set];
  id v41 = (id)[v9 mutableCopy];

  uint64_t v10 = [(PXPhotosViewModel *)self selectionSnapshot];
  id v11 = [v10 selectedIndexPaths];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke;
  v37[3] = &unk_1E5DB4A30;
  uint64_t v39 = v40;
  id v12 = v7;
  id v38 = v12;
  [v11 enumerateItemIndexSetsUsingBlock:v37];

  BOOL v13 = [v12 numberOfSections] > 1;
  long long v14 = [v12 containerCollection];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  char v15 = +[PXCompleteMyMomentSettings sharedInstance];
  int v16 = [v15 emulatesEmptyMomentShare];

  if (!v16)
  {
LABEL_8:
    char v18 = [(PXPhotosViewModel *)self contentFilterState];
    id v17 = [v18 predicateForUseCase:v13];

    goto LABEL_9;
  }
  id v17 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
LABEL_9:
  id v19 = [v12 filterPredicate];
  id v20 = v17;
  if (v19 == v20) {
    char v21 = 1;
  }
  else {
    char v21 = [v19 isEqual:v20];
  }

  char v22 = [v12 includeOthersInSocialGroupAssets];
  id v23 = [(PXPhotosViewModel *)self contentFilterState];
  char v24 = [v23 includeOthersInSocialGroupAssets];

  long long v25 = [(PXPhotosViewModel *)self dataSourceManager];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke_2;
  v29[3] = &unk_1E5DB4A58;
  char v35 = v21 ^ 1;
  char v36 = v22 ^ v24;
  v29[4] = self;
  SEL v34 = a2;
  id v26 = v12;
  id v30 = v26;
  id v27 = v20;
  id v31 = v27;
  id v28 = v8;
  id v32 = v28;
  uint64_t v33 = v40;
  [v25 performChanges:v29];

  _Block_object_dispose(v40, 8);
}

void __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if ([a4 count])
  {
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v10[0] = a2;
    v10[1] = a3;
    int64x2_t v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    BOOL v9 = [v7 assetCollectionAtSectionIndexPath:v10];
    [v8 addObject:v9];
  }
}

void __51__PXPhotosViewModel__updateAssetsDataSourceManager__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned int v4 = *(unsigned char **)(a1 + 32);
  if (!v4[184] && [v4 isInitializing] && (*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 81))) {
    PXAssertGetLog();
  }
  if ((*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 81)) && [*(id *)(a1 + 56) count])
  {
    BOOL v5 = [*(id *)(a1 + 56) lastObject];
    id v6 = objc_alloc((Class)off_1E5DA55C0);
    long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v15 = *(_OWORD *)off_1E5DAB028;
    long long v16 = v7;
    uint64_t v8 = (void *)[v6 initWithAssetCollection:v5 keyAssetReference:0 indexPath:&v15];
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v9 = *(void **)(a1 + 40);
    if (v9)
    {
      [v9 indexPathForAssetCollectionReference:v8];
      if ((void)v15 != *(void *)off_1E5DAAED8
        && *((void *)&v15 + 1) != 0x7FFFFFFFFFFFFFFFLL
        && (void)v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v3, "setBackgroundFetchOriginSection:");
      }
    }
  }
  objc_msgSend(v3, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), (void)v15);
  uint64_t v10 = [*(id *)(a1 + 32) contentFilterState];
  objc_msgSend(v3, "setIncludeOthersInSocialGroupAssets:provideIncrementalChangeDetailsForAssetCollections:", objc_msgSend(v10, "includeOthersInSocialGroupAssets"), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));

  int64x2_t v11 = [*(id *)(a1 + 32) currentLens];
  if ([v3 supportsCurationToggling] && v11)
  {
    if ([v11 wantsCuration])
    {
      id v12 = +[PXPhotosGridSettings sharedInstance];
      uint64_t v13 = [v12 shouldCurateEditorialLens];
    }
    else
    {
      uint64_t v13 = 0;
    }
    if ([v11 isDefaultCurationLength]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = [v11 curationLength];
    }
    [v3 setCurationEnabledForAllCollections:v13 curationLength:v14 collectionsToDiff:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
}

- (void)_invalidateAssetsDataSourceManager
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetsDataSourceManager];
}

- (PXFooterViewModel)footerViewModel
{
  footerViewModel = self->_footerViewModel;
  if (!footerViewModel)
  {
    unsigned int v4 = objc_alloc_init(PXFooterViewModel);
    BOOL v5 = self->_footerViewModel;
    self->_footerViewModel = v4;

    [(PXFooterViewModel *)self->_footerViewModel configureWithPhotosEnvironment:self];
    footerViewModel = self->_footerViewModel;
  }
  return footerViewModel;
}

- (void)_updateFooterVisibility
{
  int64_t footerVisibilityStyle = self->_footerVisibilityStyle;
  if (footerVisibilityStyle == 2
    || footerVisibilityStyle == 1 && [(PXPhotosViewModel *)self hasScrollableContent])
  {
    unsigned int v4 = [(PXPhotosViewModel *)self currentLens];
    uint64_t v5 = [v4 allowsFooter];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(PXPhotosViewModel *)self setWantsFooterVisible:v5];
}

- (void)_invalidateFooterVisibility
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterVisibility];
}

- (void)_updateGridAppearance
{
  id v3 = [(PXPhotosViewModel *)self specManager];
  unsigned int v4 = [v3 spec];
  id v9 = [v4 assetsSpec];

  if (([v9 disableConfigurators] & 1) == 0)
  {
    uint64_t v5 = [(PXPhotosViewModel *)self dataSourceManager];
    id v6 = [v5 dataSource];
    uint64_t v7 = [v9 numberOfGridZoomStepsWithDataSource:v6];

    if ([(PXPhotosViewModel *)self supportsAspectRatioToggle]) {
      uint64_t v8 = [v9 supportsGridAspectRatioToggle];
    }
    else {
      uint64_t v8 = 0;
    }
    [(PXPhotosViewModel *)self setNumberOfZoomSteps:v7];
    [(PXPhotosViewModel *)self setSupportsAspectRatioToggle:v8];
  }
}

- (void)_invalidateGridAppearance
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateGridAppearance];
}

- (void)_updateDraggedAssetReferences
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPhotosViewModel *)self currentDataSource];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(PXPhotosViewModel *)self draggedAssetReferences];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [v3 assetReferenceForAssetReference:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }
  [(PXPhotosViewModel *)self setDraggedAssetReferences:v11];
}

- (void)_invalidateDraggedAssetReferences
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDraggedAssetReferences];
}

- (void)_updateChromeVisibility
{
  BOOL v3 = [(PXPhotosViewModel *)self allowsChromeManagementBehavior];
  int v4 = [(PXPhotosViewModel *)self isEmbedded];
  BOOL v5 = [(PXPhotosViewModel *)self isInSelectMode];
  BOOL v14 = [(PXPhotosViewModel *)self isInCompactMode];
  if (v3)
  {
    uint64_t v6 = [(PXPhotosViewModel *)self currentDataSource];
    int v7 = [v6 containsAnyItems] ^ 1;
  }
  else
  {
    int v7 = 0;
  }
  if ([(PXPhotosViewModel *)self navBarStyle]) {
    BOOL v8 = [(PXPhotosViewModel *)self navBarStyle] != 8;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = ![(PXPhotosViewModel *)self hidesNavbar]
    && [(PXPhotosViewModel *)self navBarStyle] != 8
    && [(PXPhotosViewModel *)self navBarStyle] != 7;
  int64_t v10 = [(PXPhotosViewModel *)self contentPrivacyState];
  if (!v3)
  {
    uint64_t v11 = 0;
    if (!v5) {
      goto LABEL_13;
    }
LABEL_15:
    int v12 = 1;
    goto LABEL_16;
  }
  uint64_t v11 = (v7 | !v5) & ~[(PXPhotosViewModel *)self keepsTabBarAlwaysHidden];
  if (v5) {
    goto LABEL_15;
  }
LABEL_13:
  int v12 = [(PXPhotosViewModel *)self prefersActionsInToolbar] & (v11 ^ 1);
LABEL_16:
  uint64_t v13 = 0;
  if ((v3 & (v7 ^ 1)) == 1 && v12)
  {
    if (v14 || v8)
    {
      if (v10 == 1)
      {
        uint64_t v13 = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    uint64_t v13 = 0;
    if ([(PXPhotosViewModel *)self prefersActionsInToolbar] && v10 != 1) {
LABEL_23:
    }
      uint64_t v13 = [(PXPhotosViewModel *)self hidesToolbar] ^ 1;
  }
LABEL_24:
  [(PXPhotosViewModel *)self setWantsNavbarVisible:(v5 | ~v4) & v9];
  [(PXPhotosViewModel *)self setWantsTabBarVisible:v11];
  [(PXPhotosViewModel *)self setWantsToolbarVisible:v13];
}

- (void)_invalidateChromeVisibility
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChromeVisibility];
}

- (void)_updateAspectFitContent
{
  if (self->_allowsAspectFitToggle && ![(NSMutableSet *)self->_aspectRatioTogglePreventedForReasons count])
  {
    int v4 = [(PXPhotosViewModel *)self currentLens];
    BOOL v3 = (unint64_t)([v4 defaultSectionBodyStyle] - 6) < 0xFFFFFFFFFFFFFFFCLL;
  }
  else
  {
    BOOL v3 = 0;
  }
  [(PXPhotosViewModel *)self setSupportsAspectRatioToggle:v3];
  uint64_t v5 = [(PXPhotosViewModel *)self shouldAspectFitContentByDefault];
  if (self->_allowsAspectFitToggle)
  {
    uint64_t v6 = [(PXPhotosViewModel *)self userWantsAspectFitContent];

    if (v6)
    {
      int v7 = [(PXPhotosViewModel *)self userWantsAspectFitContent];
      uint64_t v5 = [v7 BOOLValue];
    }
  }
  [(PXPhotosViewModel *)self setAspectFitContent:v5];
}

- (void)_invalidateAspectFitContent
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAspectFitContent];
}

- (void)_updateUserWantsAspectFitContent
{
  id v7 = +[PXUserDefaults standardUserDefaults];
  BOOL v3 = [v7 photosGridAspectFit];
  int v4 = [(PXPhotosViewModel *)self specManager];
  uint64_t v5 = [v4 spec];
  if ([v5 userInterfaceIdiom] == 2)
  {
    BOOL v6 = [(PXPhotosViewModel *)self isInCompactMode];

    if (!v6) {
      goto LABEL_6;
    }
    [v7 photosGridAspectFitInCompact];
    v3 = int v4 = v3;
  }
  else
  {
  }
LABEL_6:
  [(PXPhotosViewModel *)self setUserWantsAspectFitContent:v3];
}

- (void)_invalidateUserWantsAspectFitContent
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateUserWantsAspectFitContent];
}

- (void)_updateTopBarsStyles
{
  BOOL v3 = ([(PXPhotosViewModel *)self navBarStyle] == 1
     || [(PXPhotosViewModel *)self navBarStyle] == 2
     || [(PXPhotosViewModel *)self navBarStyle] == 3
     || [(PXPhotosViewModel *)self navBarStyle] == 7)
    && ([(PXPhotosViewModel *)self isContentBelowTitle]
     || [(PXPhotosViewModel *)self isEmbedded])
    && ![(PXPhotosViewModel *)self isShowingAlternateContent]
    && (![(PXPhotosViewModel *)self hidesNavbar]
     || [(PXPhotosViewModel *)self wantsModernNavBarButtons])
    || [(PXPhotosViewModel *)self alwaysRequiresLightChrome];
  [(PXPhotosViewModel *)self setRequiresLightTopBars:v3];
}

- (void)_invalidateTopBarsStyles
{
  id v2 = [(PXPhotosViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTopBarsStyles];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosViewModel;
  [(PXPhotosViewModel *)&v4 didPerformChanges];
  [(PXPhotosViewModel *)self swift_didPerformChanges];
  BOOL v3 = [(PXPhotosViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (id)_initialContentFilterState
{
  BOOL v3 = [(PXPhotosViewModel *)self dataSourceManager];
  objc_super v4 = [v3 dataSource];
  uint64_t v5 = [v4 containerCollection];

  id v6 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  BOOL v8 = [v7 photoLibrary];
  BOOL v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  int v12 = +[PXContentFilterState defaultFilterStateForContainerCollection:v6 photoLibrary:v11];
  if ([(PXPhotosViewModel *)self alwaysIncludeSharedWithYouAssets]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = [v12 includeSharedWithYou];
  }
  [v12 setIncludeSharedWithYou:v13];

  return v12;
}

- (id)_initialLibraryFilterStateForConfiguration:(id)a3
{
  objc_super v4 = [(PXPhotosViewModel *)self dataSourceManager];
  uint64_t v5 = [v4 dataSource];
  char v6 = [v5 ignoreSharedLibraryFilters];

  if (v6)
  {
    id v7 = objc_alloc_init(PXLibraryFilterState);
  }
  else
  {
    BOOL v8 = [PXLibraryFilterState alloc];
    BOOL v9 = [(PXPhotosViewModel *)self sharedLibraryStatusProvider];
    id v7 = [(PXLibraryFilterState *)v8 initWithSharedLibraryStatusProvider:v9];
  }
  return v7;
}

- (void)_updateDataSourceDependentProperties
{
  BOOL v3 = [(PXPhotosViewModel *)self dataSourceManager];
  objc_super v4 = [v3 dataSource];

  uint64_t v5 = [v4 libraryFilter];
  char v6 = [(PXPhotosViewModel *)self selectionManager];
  id v7 = [v6 selectionSnapshot];

  BOOL v8 = [v7 dataSource];
  int v9 = [v4 isEqual:v8];

  if (v9)
  {
    id v10 = [(PXPhotosViewModel *)self libraryFilterState];
    [v10 setViewMode:v5];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PXPhotosViewModel__updateDataSourceDependentProperties__block_invoke;
    v11[3] = &unk_1E5DC4C68;
    id v12 = v4;
    id v13 = v7;
    [(PXPhotosViewModel *)self performChanges:v11];
  }
}

void __57__PXPhotosViewModel__updateDataSourceDependentProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setCurrentDataSource:v3];
  [v4 setSelectionSnapshot:*(void *)(a1 + 40)];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosViewModel;
  [(PXPhotosViewModel *)&v3 performChanges:a3];
}

- (NSString)debugDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(PXPhotosViewModel *)self currentDataSource];
  char v6 = [v3 stringWithFormat:@"<%@:%p currentDataSource:%@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)dealloc
{
  objc_super v3 = [(PXPhotosViewModel *)self dataSourceManager];
  uint64_t v4 = [v3 dataSource];
  uint64_t v5 = [v4 containerCollection];

  char v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = v6;
  previewHeaderDisabledUserDefaultsKey = self->_previewHeaderDisabledUserDefaultsKey;
  if (previewHeaderDisabledUserDefaultsKey) {
    [v6 removeObserver:self forKeyPath:previewHeaderDisabledUserDefaultsKey context:UserDefaultsPreviewHeaderDisabledObservationContext];
  }
  if ((objc_msgSend(v5, "px_isContentSyndicationAlbum") & 1) == 0) {
    [v7 removeObserver:self forKeyPath:@"IncludeSharedWithYou" context:UserDefaultsIncludeSharedWithYouObservationContext];
  }

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosViewModel;
  [(PXPhotosViewModel *)&v9 dealloc];
}

- (PXPhotosViewModel)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosViewModel.m", 476, @"%s is not available as initializer", "-[PXPhotosViewModel init]");

  abort();
}

- (PXPhotosViewModel)initWithConfiguration:(id)a3 specManager:(id)a4 inlinePlaybackController:(id)a5
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v170.receiver = self;
  v170.super_class = (Class)PXPhotosViewModel;
  id v12 = [(PXPhotosViewModel *)&v170 init];
  id v13 = v12;
  if (!v12) {
    goto LABEL_61;
  }
  v12->_isInitializing = 1;
  uint64_t v14 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v12];
  updater = v13->_updater;
  v13->_updater = (PXUpdater *)v14;

  [(PXUpdater *)v13->_updater setNeedsUpdateSelector:sel__setNeedsUpdate];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateContentPrivacyState];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateAvailableLenses];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateCurrentLens];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateAssetsDataSourceManager];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateWantsLensControlVisible];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateUserWantsAspectFitContent];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateAspectFitContent];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateTopBarsStyles];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateChromeVisibility];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateDraggedAssetReferences];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateGridAppearance];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateFooterVisibility];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateSystemAuthenticationType];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateWantsContentUnavailableUnlockButtonVisible];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateEmptyPlaceholderState];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateCurrentDataSourceContainer];
  [(PXUpdater *)v13->_updater addUpdateSelector:sel__updatePersonContainerProperties];
  v167 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_storeStrong((id *)&v13->_specManager, a4);
  objc_storeWeak((id *)&v13->_inlinePlaybackController, v11);
  uint64_t v16 = [v9 dataSourceManager];
  dataSourceManager = v13->_dataSourceManager;
  v13->_dataSourceManager = (PXAssetsDataSourceManager *)v16;

  if (objc_opt_respondsToSelector())
  {
    char v18 = [(PXAssetsDataSourceManager *)v13->_dataSourceManager sharedLibraryStatusProvider];
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v160 = [MEMORY[0x1E4F28B00] currentHandler];
        v161 = (objc_class *)objc_opt_class();
        v162 = NSStringFromClass(v161);
        [(PXSharedLibraryStatusProvider *)v18 px_descriptionForAssertionMessage];
        v164 = id v163 = v10;
        [v160 handleFailureInMethod:a2, v13, @"PXPhotosViewModel.m", 184, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[(id<_PXStatusProviderWorkaround>)_dataSourceManager sharedLibraryStatusProvider]", v162, v164 object file lineNumber description];

        id v10 = v163;
      }
    }
    sharedLibraryStatusProvider = v13->_sharedLibraryStatusProvider;
    v13->_sharedLibraryStatusProvider = v18;
  }
  uint64_t v20 = [v9 mediaProvider];
  mediaProvider = v13->_mediaProvider;
  v13->_mediaProvider = (PXMediaProvider *)v20;

  uint64_t v22 = [v9 privacyController];
  privacyController = v13->_privacyController;
  v13->_privacyController = (PXContentPrivacyController *)v22;

  uint64_t v24 = [v9 assetCollectionActionManager];
  assetCollectionActionManager = v13->_assetCollectionActionManager;
  v13->_assetCollectionActionManager = (PXAssetCollectionActionManager *)v24;

  uint64_t v26 = [v9 loadingStatusManager];
  loadingStatusManager = v13->_loadingStatusManager;
  v13->_loadingStatusManager = (PXLoadingStatusManager *)v26;

  uint64_t v28 = [v9 decorationDataSource];
  decorationDataSource = v13->_decorationDataSource;
  v13->_decorationDataSource = (PXPhotosCustomViewDecorationDataSource *)v28;

  uint64_t v30 = [v9 tapbackStatusManager];
  tapbackStatusManager = v13->_tapbackStatusManager;
  v13->_tapbackStatusManager = (PXTapbackStatusManager *)v30;

  uint64_t v32 = [v9 assetImportStatusManager];
  assetImportStatusManager = v13->_assetImportStatusManager;
  v13->_assetImportStatusManager = (PXAssetImportStatusManager *)v32;

  SEL v34 = [[PXPhotosGridActionManager alloc] initWithViewModel:v13];
  gridActionManager = v13->_gridActionManager;
  v13->_gridActionManager = v34;

  uint64_t v36 = [v9 assetActionManager];
  assetActionManager = v13->_assetActionManager;
  v13->_assetActionManager = (PXAssetActionManager *)v36;

  uint64_t v38 = [v9 fullscreenOverlayControllers];
  fullscreenOverlayControllers = v13->_fullscreenOverlayControllers;
  v13->_fullscreenOverlayControllers = (NSArray *)v38;

  uint64_t v40 = [v9 customAssetSelectionHandler];
  id customAssetSelectionHandler = v13->_customAssetSelectionHandler;
  v13->_id customAssetSelectionHandler = (id)v40;

  v13->_wantsTitleInNavigationBar = [v9 wantsTitleInNavigationBar];
  char v42 = [v9 selectionManager];

  if (v42)
  {
    uint64_t v43 = [v9 selectionManager];
    char v44 = [v43 dataSourceManager];
    uint64_t v45 = v13->_dataSourceManager;

    if (v44 != v45)
    {
      v159 = [MEMORY[0x1E4F28B00] currentHandler];
      [v159 handleFailureInMethod:a2, v13, @"PXPhotosViewModel.m", 202, @"Invalid parameter not satisfying: %@", @"configuration.selectionManager.dataSourceManager == _dataSourceManager" object file lineNumber description];
    }
    v46 = [v9 assetActionManager];
    uint64_t v47 = [v46 selectionManager];
    if (v47)
    {
      v48 = (void *)v47;
      SEL v166 = a2;
      v49 = [v9 assetActionManager];
      [v49 selectionManager];
      v51 = id v50 = v10;
      v52 = [v9 selectionManager];

      BOOL v53 = v51 == v52;
      id v10 = v50;
      if (v53)
      {
LABEL_14:
        uint64_t v54 = [v9 selectionManager];
        goto LABEL_15;
      }
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:v166, v13, @"PXPhotosViewModel.m", 203, @"Invalid parameter not satisfying: %@", @"configuration.assetActionManager.selectionManager == nil || configuration.assetActionManager.selectionManager == configuration.selectionManager" object file lineNumber description];
    }

    goto LABEL_14;
  }
  v56 = [v9 assetActionManager];
  v57 = [v56 selectionManager];

  if (v57)
  {
    v58 = [v9 assetActionManager];
    v59 = [v58 selectionManager];
    v60 = [v59 dataSourceManager];
    v61 = [v9 dataSourceManager];

    if (v60 != v61)
    {
      v165 = [MEMORY[0x1E4F28B00] currentHandler];
      [v165 handleFailureInMethod:a2, v13, @"PXPhotosViewModel.m", 206, @"Invalid parameter not satisfying: %@", @"configuration.assetActionManager.selectionManager.dataSourceManager == configuration.dataSourceManager" object file lineNumber description];
    }
    v55 = [v9 assetActionManager];
    uint64_t v62 = [v55 selectionManager];
    selectionManager = v13->_selectionManager;
    v13->_selectionManager = (PXSectionedSelectionManager *)v62;

    goto LABEL_20;
  }
  uint64_t v54 = [objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v13->_dataSourceManager];
LABEL_15:
  v55 = v13->_selectionManager;
  v13->_selectionManager = (PXSectionedSelectionManager *)v54;
LABEL_20:

  v13->_int64_t selectionContext = [v9 selectionContextOverride];
  [(PXAssetActionManager *)v13->_assetActionManager setSelectionManager:v13->_selectionManager];
  v64 = [v9 delegate];
  [(PXPhotosViewModel *)v13 setViewDelegate:v64];

  [(PXAssetsDataSourceManager *)v13->_dataSourceManager registerChangeObserver:v13 context:DataSourceManagerObservationContext_60890];
  [(PXSectionedSelectionManager *)v13->_selectionManager registerChangeObserver:v13 context:SelectionManagerObservationContext_60891];
  [(PXContentPrivacyController *)v13->_privacyController registerChangeObserver:v13 context:PrivacyControllerObservationContext];
  v65 = [(PXSectionedSelectionManager *)v13->_selectionManager snapshotValidator];

  if (!v65) {
    [(PXSectionedSelectionManager *)v13->_selectionManager setSnapshotValidator:v13];
  }
  v66 = [v9 initialScrollPositionDetentIdentifier];
  uint64_t v67 = [v66 copy];
  initialScrollPositionDetentIdentifier = v13->_initialScrollPositionDetentIdentifier;
  v13->_initialScrollPositionDetentIdentifier = (NSString *)v67;

  uint64_t v69 = [(PXAssetsDataSourceManager *)v13->_dataSourceManager dataSource];
  currentDataSource = v13->_currentDataSource;
  v13->_currentDataSource = (PXAssetsDataSource *)v69;

  uint64_t v71 = [(PXSectionedSelectionManager *)v13->_selectionManager selectionSnapshot];
  selectionSnapshot = v13->_selectionSnapshot;
  v13->_selectionSnapshot = (PXSelectionSnapshot *)v71;

  v73 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  visibleAssetCollections = v13->_visibleAssetCollections;
  v13->_visibleAssetCollections = v73;

  v13->_int64_t contentStartingPosition = [v9 contentStartingPosition];
  uint64_t v75 = [v9 decorationViewClass];
  Class decorationViewClass = v13->_decorationViewClass;
  v13->_Class decorationViewClass = (Class)v75;

  uint64_t v77 = [v9 emptyPlaceholderStatusViewModel];
  emptyPlaceholderStatusViewModel = v13->_emptyPlaceholderStatusViewModel;
  v13->_emptyPlaceholderStatusViewModel = (PXStatusViewModel *)v77;

  v13->_wantsContentFilterVisible = [v9 wantsContentFilterVisible];
  v13->_int64_t footerVisibilityStyle = [v9 footerVisibilityStyle];
  v13->_wantsDimmedSelectionStyle = [v9 wantsDimmedSelectionStyle];
  v13->_wantsNumberedSelectionStyle = [v9 wantsNumberedSelectionStyle];
  v13->_wantsFileSizeBadge = [v9 wantsFileSizeBadge];
  v13->_wantsAssetIndexBadge = [v9 wantsAssetIndexBadge];
  v13->_noContentPlaceholderType = [v9 noContentPlaceholderType];
  v13->_wantsDynamicTitles = [v9 wantsDynamicTitles];
  v13->_wantsFooterMask = [v9 wantsFooterMask];
  v13->_hidesAssetCountInFooter = [v9 hidesAssetCountInFooter];
  v13->_wantsCPLStatus = [v9 wantsCPLStatus];
  v13->_wantsRenderingStatus = [v9 wantsRenderingStatus];
  v13->_alwaysIncludeSharedWithYouAssets = [v9 alwaysIncludeSharedWithYouAssets];
  v13->_wantsShareGridButtonVisible = [v9 wantsShareGridButtonVisible];
  v13->_isEmbedded = [v9 isEmbedded];
  uint64_t v79 = [v9 bannerControllerProvider];
  id bannerControllerProvider = v13->_bannerControllerProvider;
  v13->_id bannerControllerProvider = (id)v79;

  v13->_gridStyle = [v9 gridStyle];
  v13->_preferredUserInterfaceStyle = [v9 preferredUserInterfaceStyle];
  v13->_configuredSectionHeaderStyle = [v9 sectionHeaderStyle];
  v13->_configuredSectionBodyStyle = [v9 sectionBodyStyle];
  v13->_wantsSingleRowScrollingLayout = [v9 wantsSingleRowScrollingLayout];
  uint64_t v81 = [v9 pickerClientBundleIdentifier];
  pickerClientBundleIdentifier = v13->_pickerClientBundleIdentifier;
  v13->_pickerClientBundleIdentifier = (NSString *)v81;

  [v9 itemAspectRatio];
  v13->_itemAspectRatio = v83;
  v13->_showLoadingPlaceholderWhenEmpty = [v9 showLoadingPlaceholderWhenEmpty];
  v84 = [v9 preferredAssetCropDelegate];
  objc_storeWeak((id *)&v13->_preferredAssetCropDelegate, v84);

  v85 = [v9 preferredColumnCountsDelegate];
  objc_storeWeak((id *)&v13->_preferredColumnCountsDelegate, v85);

  v13->_overrideDefaultNumberOfColumns = [v9 overrideDefaultNumberOfColumns];
  v13->_ignoreContentFilterStateWhenNotFiltering = [v9 ignoreContentFilterStateWhenNotFiltering];
  v13->_ignoreFilterPredicateAssert = [v9 ignoreFilterPredicateAssert];
  v13->_allowsOneUpPresentation = ([v9 allowedActions] & 0x80) != 0;
  v13->_allowsSearch = ([v9 allowedBehaviors] >> 16) & 1;
  v13->_allowsShowDetails = ((unsigned __int16)[v9 allowedActions] >> 8) & 1;
  v13->_allowsChromeManagementBehavior = [v9 allowedBehaviors] & 1;
  v13->_allowsInlineAddBehavior = ([v9 allowedBehaviors] & 2) != 0;
  v13->_allowsSelectionUserActivityBehavior = ([v9 allowedBehaviors] & 4) != 0;
  v13->_allowsPopOnContainerDeleteBehavior = ([v9 allowedBehaviors] & 8) != 0;
  v13->_allowsPopOnEmptyBehavior = ([v9 allowedBehaviors] & 0x800) != 0;
  v13->_allowsEmptyPlaceholderBehavior = ([v9 allowedBehaviors] & 0x10) != 0;
  v13->_allowsActionMenuBehavior = ([v9 allowedBehaviors] & 0x20) != 0;
  v13->_allowsDoubleTapBehavior = ([v9 allowedBehaviors] & 0x40) != 0;
  v13->_allowsHoverBehavior = ([v9 allowedBehaviors] & 0x400) != 0;
  v13->_allowsCaptionsInSquareBehavior = ([v9 allowedBehaviors] & 0x1000) != 0;
  v13->_allowsContextMenuCustomization = ([v9 allowedBehaviors] & 0x80) != 0;
  v13->_allowsAccessoriesContextMenuCustomization = ([v9 allowedBehaviors] & 0x200) != 0;
  v13->_allowsMacStyleSelection = ((unsigned __int16)[v9 allowedBehaviors] >> 8) & 1;
  v13->_allowsLensControl = ([v9 allowedBehaviors] & 0x4000) != 0;
  v13->_wantsSelectModeCaptionInContextMenu = [v9 wantsSelectModeCaptionInContextMenu];
  v13->_neverShowsLensControl = [v9 containerProvidesSecondaryToolbar];
  v13->_canShowSortButton = ([v9 allowedBehaviors] & 0x8000) != 0;
  v13->_wantsTopBadgesWithViewBasedDecorations = ([v9 allowedBehaviors] & 0x2000) != 0;
  v13->_allowsSelectModeToggle = ([v9 allowedActions] & 0x20) != 0;
  v13->_allowsSelectAllAction = [v9 allowedActions] & 1;
  v86 = +[PXPhotosGridSettings sharedInstance];
  if ([v86 enableAspectFitToggle]
    && (unint64_t)([v9 gridStyle] - 3) <= 0xFFFFFFFFFFFFFFFDLL
    && ([v9 allowedActions] & 0x200) != 0)
  {
    [v9 itemAspectRatio];
    BOOL v87 = v158 == 1.0;
  }
  else
  {
    BOOL v87 = 0;
  }
  v13->_allowsAspectFitToggle = v87;

  v13->_allowsSlideshowAction = 0;
  v13->_allowsAddAction = ([v9 allowedActions] & 8) != 0;
  v13->_allowsCopyAction = ([v9 allowedActions] & 0x40) != 0;
  v13->_allowsSelectSectionAction = ([v9 allowedActions] & 0x10) != 0;
  v13->_allowsGridAppearanceActions = [v9 allowsGridAppearanceActions];
  v13->_allowsShareAllAction = ([v9 allowedActions] & 0x400) != 0;
  v13->_allowsQuickLookAction = ([v9 allowedActions] & 0x800) != 0;
  v13->_allowsShowMapAction = ([v9 allowedActions] & 0x1000) != 0;
  v13->_allowsPickAssetAction = ([v9 allowedActions] & 2) != 0;
  v13->_allowsDismissAction = ([v9 allowedActions] & 0x2000) != 0;
  v88 = +[PXRootSettings sharedInstance];
  int v89 = [v88 canShowInternalUI];
  LOBYTE(v90) = 0;
  if (v89) {
    unint64_t v90 = ((unint64_t)[v9 allowedActions] >> 14) & 1;
  }
  v13->_allowsFileRadarAction = v90;

  v13->_allowsTrashAction = ([v9 allowedActions] & 0x8000) != 0;
  v13->_allowsShareAction = ([v9 allowedActions] & 0x20000000) != 0;
  v13->_allowsAddToLibraryAction = ([v9 allowedActions] >> 16) & 1;
  v13->_allowsSwitchLibraryAction = ([v9 allowedActions] >> 24) & 1;
  v13->_allowsMoveToLibraryAction = ([v9 allowedActions] & 0x2000000) != 0;
  v13->_allowsMoveToPersonalLibraryAction = ([v9 allowedActions] & 0x8000000) != 0;
  v13->_allowsMoveToSharedLibraryAction = ([v9 allowedActions] & 0x4000000) != 0;
  v13->_allowsInfoAction = ([v9 allowedActions] & 0x80000) != 0;
  v13->_allowsCMMActions = ([v9 allowedActions] & 0x20000) != 0;
  v13->_allowsSyndicatedContentFiltering = ([v9 allowedActions] & 0x200000) != 0;
  v13->_allowsContentSyndicationSaveAllAction = ([v9 allowedActions] & 0x40000) != 0;
  v13->_allowsReplyAction = ([v9 allowedActions] & 0x100000) != 0;
  v13->_allowsTapbackAction = ([v9 allowedActions] & 0x400000) != 0;
  v13->_allowsMergeDuplicatesAction = ([v9 allowedActions] & 0x800000) != 0;
  v13->_supportsPeopleActions = ([v9 allowedActions] & 0x10000000) != 0;
  v13->_supportsSocialGroupActions = ([v9 allowedActions] & 0x40000000) != 0;
  v13->_showsOnlyAssetsInSelectedItemSectionInOneUp = [v9 showsOnlyAssetsInSelectedItemSectionInOneUp];
  v13->_allowsSwipeToSelect = [v9 allowsSwipeToSelect];
  v13->_allowsDragIn = [v9 allowsDragIn];
  char v91 = [v9 allowsDragOut];
  v13->_allowsDragOut = v91;
  if (v13->_allowsDragIn && (v91 & 1) == 0) {
    PXAssertGetLog();
  }
  v13->_allowsUserDefaults = [v9 allowsUserDefaults];
  uint64_t v92 = [v9 customUserDefaults];
  customUserDefaults = v13->_customUserDefaults;
  v13->_customUserDefaults = (PXZoomablePhotosUserDefaults *)v92;

  v13->_allowsLinkInteractions = [v9 allowsLinkInteractions];
  v13->_allowsMultiSelectMenu = [v9 allowsMultiSelectMenu];
  v13->_lowMemoryMode = [v9 lowMemoryMode];
  v13->_oneUpPresentationOrigin = [v9 oneUpPresentationOrigin];
  v13->_preventShowInAllPhotosAction = [v9 preventShowInAllPhotosAction];
  v13->_wantsOneUpShowInLibraryButton = [v9 wantsOneUpShowInLibraryButton];
  v13->_wantsFooterVisibleImmediately = [v9 wantsFooterVisibleImmediately];
  v13->_wantsFooterVisibleWhenEmpty = [v9 wantsFooterVisibleWhenEmpty];
  v94 = [v9 centerAccessoryActionType];
  uint64_t v95 = [v94 copy];
  centerAccessoryActionType = v13->_centerAccessoryActionType;
  v13->_centerAccessoryActionType = (NSString *)v95;

  v97 = [v9 trailingAccessoryActionType];
  uint64_t v98 = [v97 copy];
  trailingAccessoryActionType = v13->_trailingAccessoryActionType;
  v13->_trailingAccessoryActionType = (NSString *)v98;

  v13->_dismissAffordance = [v9 dismissAffordance];
  uint64_t v100 = [v9 initialNavigationObjectReference];
  initialNavigationObjectReference = v13->_initialNavigationObjectReference;
  v13->_initialNavigationObjectReference = (PXSectionedObjectReference *)v100;

  v13->_initialNavigationScrollPosition = [v9 initialNavigationScrollPosition];
  v13->_scrollingBehavior = [v9 scrollingBehavior];
  if ([v9 sectionBodyStyle] == 2) {
    int v102 = PLIsMobileSlideShow() ^ 1;
  }
  else {
    LOBYTE(v102) = 0;
  }
  v13->__shouldMimicSystemChromelessUsingManualScrollEdgeAppearance = v102;
  v13->_int64_t contentMode = [v9 contentMode];
  v103 = +[PXUserDefaults standardUserDefaults];
  uint64_t v104 = [v103 photosGridAspectFit];
  userWantsAspectFitContent = v13->_userWantsAspectFitContent;
  v13->_userWantsAspectFitContent = (NSNumber *)v104;

  if (v13->_allowsCopyAction || v13->_allowsQuickLookAction || v13->_allowsPickAssetAction)
  {
    id v106 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v107 = v106;
    if (v13->_allowsCopyAction) {
      [v106 addObject:@"PXAssetActionTypeCopy"];
    }
    if (v13->_allowsQuickLookAction) {
      [v107 addObject:@"PXAssetActionTypeQuickLook"];
    }
    if (v13->_allowsPickAssetAction) {
      [v107 addObject:@"PXAssetActionTypePickAsset"];
    }
    [(PXActionManager *)v13->_assetActionManager setAllowedActionTypes:v107];
  }
  v108 = [v9 title];
  uint64_t v109 = [v108 copy];
  title = v13->_title;
  v13->_title = (NSString *)v109;

  v111 = [v9 containerTitle];
  uint64_t v112 = [v111 copy];
  containerTitle = v13->_containerTitle;
  v13->_containerTitle = (NSString *)v112;

  v13->_floatingTitleOpacity = 1.0;
  v13->_titleBackgroundOpacity = 1.0;
  v13->_wantsFloatingTitle = 1;
  v114 = [v9 footerSubtitle];
  uint64_t v115 = [v114 copy];
  footerSubtitle = v13->_footerSubtitle;
  v13->_footerSubtitle = (NSString *)v115;

  v117 = [v9 footerLearnMoreURL];
  uint64_t v118 = [v117 copy];
  footerLearnMoreURL = v13->_footerLearnMoreURL;
  v13->_footerLearnMoreURL = (NSURL *)v118;

  v13->_forbiddenBadges = [v9 forbiddenBadges];
  v13->_allowsInteractiveFavoriteBadges = [v9 allowsInteractiveFavoriteBadges];
  uint64_t v120 = [v9 infoActionHandler];
  id infoActionHandler = v13->_infoActionHandler;
  v13->_id infoActionHandler = (id)v120;

  v13->_int64_t navBarStyle = [v9 navBarStyle];
  v13->_toolbarStyle = [v9 toolbarStyle];
  v13->_shouldOptOutOfChromelessBars = [v9 shouldOptOutOfChromelessBars];
  v122 = +[PXPhotosGridSettings sharedInstance];
  if ([v122 enableTitleLegibilityDimmingFilter])
  {
    int64_t navBarStyle = v13->_navBarStyle;

    if (navBarStyle == 1) {
      v13->_int64_t navBarStyle = 2;
    }
  }
  else
  {
  }
  v13->_wantsModernNavBarButtons = [v9 wantsModernNavBarButtons];
  v13->_wantsAdaptiveSelectModeBarButton = [v9 wantsAdaptiveSelectModeBarButton];
  v13->_chromeOpacity = 1.0;
  v13->_allowedChromeItems = -1;
  v13->_allowedGesturesKind = 0;
  v124 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  enterSelectModePreventedForReasons = v13->_enterSelectModePreventedForReasons;
  v13->_enterSelectModePreventedForReasons = v124;

  v126 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  oneUpPresentationPreventedForReasons = v13->_oneUpPresentationPreventedForReasons;
  v13->_oneUpPresentationPreventedForReasons = v126;

  v128 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aspectRatioTogglePreventedForReasons = v13->_aspectRatioTogglePreventedForReasons;
  v13->_aspectRatioTogglePreventedForReasons = v128;

  v130 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  hideSurroundingContentForReasons = v13->_hideSurroundingContentForReasons;
  v13->_hideSurroundingContentForReasons = v130;

  v13->_prefersActionsInToolbar = [v9 prefersActionsInToolbar];
  v13->_topBarsAppearanceChangeAnimationDuration = 0.25;
  uint64_t v132 = [v9 footerViewModel];
  footerViewModel = v13->_footerViewModel;
  v13->_footerViewModel = (PXFooterViewModel *)v132;

  uint64_t v134 = [v9 viewOptionsModel];
  viewOptionsModel = v13->_viewOptionsModel;
  v13->_viewOptionsModel = (PXPhotosViewOptionsModel *)v134;

  v13->_hidesViewOptionsToolbar = [v9 hidesViewOptionsToolbar];
  v136 = [(PXPhotosViewOptionsModel *)v13->_viewOptionsModel sortOrderState];
  [v136 registerChangeObserver:v13 context:SortOrderStateObservationContext];

  [(PXPhotosViewModel *)v13 _updateSortOrder];
  uint64_t v137 = [v9 searchQueryMatchInfo];
  searchQueryMatchInfo = v13->_searchQueryMatchInfo;
  v13->_searchQueryMatchInfo = (PXSearchQueryMatchInfo *)v137;

  uint64_t v139 = [v9 badgesModifier];
  id badgesModifier = v13->_badgesModifier;
  v13->_id badgesModifier = (id)v139;

  uint64_t v141 = [v10 headerCustomizationModel];
  headerCustomizationModel = v13->_headerCustomizationModel;
  v13->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v141;

  uint64_t v143 = [(PXPhotosViewModel *)v13 _initialLibraryFilterStateForConfiguration:v9];
  libraryFilterState = v13->_libraryFilterState;
  v13->_libraryFilterState = (PXLibraryFilterState *)v143;

  v13->_useLowMemoryDecode = [v9 useLowMemoryDecode];
  v13->_contentShiftStrategy = [v9 contentShiftStrategy];
  v13->_startsInSelectMode = [v9 startsInSelectMode];
  [(PXPhotosViewModel *)v13 swift_initWithConfiguration:v9];
  if (objc_msgSend(off_1E5DA5398, "px_accessibilityIsReduceMotionEnabled"))
  {
    v13->_BOOL allowsPreviewHeader = 0;
  }
  else
  {
    if ([(PXPhotosViewModel *)v13 swift_collectionKindSupportsTogglingPreviewHeader])
    {
      uint64_t v145 = [(PXPhotosViewModel *)v13 collectionKindPreviewHeaderDisabledUserDefaultsKey];
      previewHeaderDisabledUserDefaultsKey = v13->_previewHeaderDisabledUserDefaultsKey;
      v13->_previewHeaderDisabledUserDefaultsKey = (NSString *)v145;

      char v147 = [v167 BOOLForKey:v13->_previewHeaderDisabledUserDefaultsKey] ^ 1;
    }
    else
    {
      v148 = v13->_previewHeaderDisabledUserDefaultsKey;
      v13->_previewHeaderDisabledUserDefaultsKey = 0;

      char v147 = 1;
    }
    v13->_BOOL allowsPreviewHeader = v147;
  }
  v149 = PLGridZeroGetLog();
  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
  {
    BOOL allowsPreviewHeader = v13->_allowsPreviewHeader;
    v151 = v13->_previewHeaderDisabledUserDefaultsKey;
    *(_DWORD *)buf = 67109378;
    BOOL v172 = allowsPreviewHeader;
    __int16 v173 = 2112;
    v174 = v151;
    _os_log_impl(&dword_1A9AE7000, v149, OS_LOG_TYPE_DEBUG, "preview header allowed: %i key: %@", buf, 0x12u);
  }

  v168[0] = MEMORY[0x1E4F143A8];
  v168[1] = 3221225472;
  v168[2] = __80__PXPhotosViewModel_initWithConfiguration_specManager_inlinePlaybackController___block_invoke;
  v168[3] = &unk_1E5DCF6C0;
  v152 = v13;
  v169 = v152;
  [(PXPhotosViewModel *)v152 performChanges:v168];
  v153 = [(PXPhotosViewModel *)v152 dataSourceManager];
  v154 = [v153 dataSource];
  v155 = [v154 containerCollection];

  v156 = v152->_previewHeaderDisabledUserDefaultsKey;
  if (v156) {
    [v167 addObserver:v152 forKeyPath:v156 options:0 context:UserDefaultsPreviewHeaderDisabledObservationContext];
  }
  if ((objc_msgSend(v155, "px_isContentSyndicationAlbum") & 1) == 0) {
    [v167 addObserver:v152 forKeyPath:@"IncludeSharedWithYou" options:0 context:UserDefaultsIncludeSharedWithYouObservationContext];
  }
  v13->_isInitializing = 0;

LABEL_61:
  return v13;
}

uint64_t __80__PXPhotosViewModel_initWithConfiguration_specManager_inlinePlaybackController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 321);
  id v4 = a2;
  [v4 setIsInSelectMode:v3];
  uint64_t v5 = [*(id *)(a1 + 32) _initialContentFilterState];
  [v4 setContentFilterState:v5];

  [*(id *)(a1 + 32) _invalidateContentPrivacyState];
  [*(id *)(a1 + 32) _invalidateSystemAuthenticationType];
  [*(id *)(a1 + 32) _invalidateWantsContentUnavailableUnlockButtonVisible];
  [*(id *)(a1 + 32) _invalidateTopBarsStyles];
  [*(id *)(a1 + 32) _invalidateUserWantsAspectFitContent];
  [*(id *)(a1 + 32) _invalidateAspectFitContent];
  [*(id *)(a1 + 32) _invalidateChromeVisibility];
  [*(id *)(a1 + 32) _invalidateGridAppearance];
  [*(id *)(a1 + 32) _invalidateFooterVisibility];
  [*(id *)(a1 + 32) _invalidateEmptyPlaceholderState];
  [*(id *)(a1 + 32) _invalidateAvailableLenses];
  [*(id *)(a1 + 32) _invalidateCurrentLens];
  char v6 = *(void **)(a1 + 32);
  return [v6 _invalidateWantsLensControlVisible];
}

- (PXPhotosViewModel)initWithConfiguration:(id)a3 specManager:(id)a4
{
  return [(PXPhotosViewModel *)self initWithConfiguration:a3 specManager:a4 inlinePlaybackController:0];
}

@end