@interface PUPickerContainerController
- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)_isConfiguredForRetailExperience;
- (BOOL)_isConfiguredForStickerSuggestionGroup;
- (BOOL)_shouldLoadLemonadeFeedForDestination:(id)a3;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (BOOL)allowsContextMenuInteractionForPhotosViewController:(id)a3;
- (BOOL)hasContent;
- (BOOL)isShowingLiveWallpaperSuggestions;
- (BOOL)photosViewController:(id)a3 canPlayAssetInline:(id)a4;
- (BOOL)photosViewController:(id)a3 isAssetEligibleForAutoPlayback:(id)a4;
- (BOOL)photosViewController:(id)a3 isAssetEligibleForPlaybackWithSettlingEffect:(id)a4;
- (BOOL)replacesConfirmationButtonWithActivityIndicator;
- (BOOL)searchBarIsFirstResponder;
- (BOOL)shouldAnimateFromHeaderView:(id)a3 toHeaderView:(id)a4;
- (BOOL)shouldStopScrollingItemsViewControllerToTop;
- (CGRect)preferredCropForAsset:(id)a3 withAspectRatio:(double)a4;
- (NSArray)searchResultUUIDs;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)bottomSafeAreaConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)photosIndicatorLeadingConstraint;
- (NSLayoutConstraint)photosIndicatorLeadingSafeAreaConstraint;
- (NSLayoutConstraint)photosIndicatorTopConstraint;
- (NSLayoutConstraint)photosIndicatorTopSafeAreaConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)topSafeAreaConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSString)selectedSuggestionAnalyticsName;
- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel;
- (PUPickerAdditionalSelectionState)additionalSelectionState;
- (PUPickerConfiguration)configuration;
- (PUPickerContainerController)initWithConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5 additionalSelectionState:(id)a6 resizeTaskDescriptorViewModel:(id)a7 actionHandler:(id)a8;
- (PUPickerContainerControllerActionHandler)containerControllerActionHandler;
- (PUPickerOnboardingHeaderView)onboardingHeaderView;
- (PUPickerPrivacyBadge)photosIndicator;
- (PUPickerSearchBar)searchBar;
- (PUPickerSuggestionResultFetcher)pickerSuggestionResultFetcher;
- (PUPickerSuggestionResultFetcherResult)pickerSuggestionResultFetcherResult;
- (PUPickerSuggestionsView)pickerSuggestionsView;
- (PUSessionInfo)sessionInfo;
- (PUSidebarViewController)sidebarViewController;
- (PXAssetsDataSourceManager)photosDataSourceManager;
- (PXPeoplePickerConfigurationController)peopleConfigController;
- (PXPhotosFilterToggleButtonController)filterButtonController;
- (PXPhotosUIViewController)lastVisiblePhotosViewController;
- (PXPhotosUIViewController)photosViewController;
- (PXPhotosViewConfiguration)photosViewConfiguration;
- (PXSectionedSelectionManager)photosSelectionManager;
- (PXSelectionCoordinator)selectionCoordinator;
- (UIBarButtonItem)toolbarNewAlbumBarButton;
- (UIBarButtonItem)toolbarOptionsBarButton;
- (UIBarButtonItem)toolbarShowSelectedGroup;
- (UIBarButtonItem)toolbarSortAndFilterBarButtonItem;
- (UIButton)showSelectedButtonTitleButton;
- (UILabel)showSelectedButtonSubtitleLabel;
- (UILabel)showSelectedButtonTitleLabel;
- (UISegmentedControl)navigationBarSegmentedControl;
- (UIViewController)albumsViewController;
- (UIViewController)collectionsViewController;
- (UIViewController)itemsViewController;
- (UIViewController)unavailableViewController;
- (_UINavigationBarPalette)navigationBarBottomPalette;
- (id)_animationForNavigationBarVisible:(BOOL)a3 fromCurrentOpacity:(double)a4;
- (id)_cancellationBarButtonItemWithTraitCollection:(id)a3;
- (id)_confirmationBarButtonItemWithTraitCollection:(id)a3;
- (id)_containerForTopViewController;
- (id)_currentContainerViewForInteractionBarTransition;
- (id)_peopleSortAndFilterMenu;
- (id)_pickerViewControllerWithConfiguration:(id)a3 sessionInfo:(id)a4 collectionList:(id)a5 selectionCoordinator:(id)a6;
- (id)_updateSelectionStatusBarButtonItem;
- (id)_viewControllerWithSidebarNavigationDestination:(id)a3 configuration:(id)a4 sessionInfo:(id)a5 selectionCoordinator:(id)a6;
- (id)albumsViewControllerIfLoaded;
- (id)collectionListForAlbumIdentifier:(id)a3 configuration:(id)a4;
- (id)headerViewForPhotosViewController:(id)a3;
- (id)photosViewController:(id)a3 animationForProposedAnimation:(id)a4;
- (id)preferredColumnCounts:(id)a3;
- (id)px_gridPresentation;
- (id)px_navigationDestination;
- (id)sessionInfoForConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)_currentPeopleSortOrderForPhotoLibrary:(id)a3;
- (int64_t)assetSortOrderType;
- (int64_t)peopleSortOrderType;
- (unint64_t)photosViewControllerFilterSortedRecordsStrategy:(id)a3;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_addOrReplaceItemViewControllerWithViewController:(id)a3;
- (void)_cleanUpInteractiveBarTransitionIfNeeded;
- (void)_filterWithSearchResultUUIDs:(id)a3;
- (void)_filterWithSuggestionResult:(id)a3;
- (void)_performPhotosGridActionIfPossible:(id)a3;
- (void)_setupAlbumsViewControllerWithPickerConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5 sessionInfo:(id)a6 photosViewConfiguration:(id)a7;
- (void)_setupCollectionsViewControllerWithPickerConfiguration:(id)a3 sessionInfo:(id)a4 photosViewConfiguration:(id)a5;
- (void)_setupPeopleOrPetsPickerWithPickerConfiguration:(id)a3;
- (void)_setupPhotosTabWithPhotosViewConfiguration:(id)a3;
- (void)_setupViewControllersWithConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5;
- (void)_showPhotosIndicatorBrieflyIfNeeded;
- (void)_updateAllowedUUIDs;
- (void)_updateInteractiveBarTransition;
- (void)_updateLastVisiblePhotosViewController:(id)a3;
- (void)_updateNavigationBar;
- (void)_updateNumberOfItemsToPlayInline;
- (void)_updatePeopleSort;
- (void)_updatePhotosViewControllerNoContentPlaceholder;
- (void)_updateSortDescriptors;
- (void)_updateSortOrder;
- (void)_updateToolbar;
- (void)dealloc;
- (void)handleNavigationBarSegmentedControl:(id)a3;
- (void)handleToolbarNewAlbumButton:(id)a3;
- (void)handleToolbarOptionsButton:(id)a3;
- (void)handleToolbarShowSelectedButton:(id)a3;
- (void)makeSearchBarAsFirstResponder;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)navigationWillPresentViewController:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)peopleConfigurationController:(id)a3 didFinishWithCurrentViewController:(id)a4 selectedPerson:(id)a5;
- (void)peopleConfigurationController:(id)a3 didPopViewController:(id)a4;
- (void)photosGridActionPerformer:(id)a3 contentFilterStateChanged:(id)a4;
- (void)pickerOnboardingHeaderViewWantsToLearnMoreAboutDataAccess:(id)a3;
- (void)pickerSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
- (void)pickerSuggestionsViewDidSelectSameSuggestion:(id)a3;
- (void)ppt_switchToAlbumsTab;
- (void)resignSearchBarAsFirstResponder;
- (void)scrollContentToInitialPosition;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)searchWithString:(id)a3;
- (void)sessionInfoStatusDidChange:(id)a3;
- (void)setAssetSortOrderType:(int64_t)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setBottomSafeAreaConstraint:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setOnboardingHeaderView:(id)a3;
- (void)setPeopleSortOrderType:(int64_t)a3;
- (void)setPhotosIndicator:(id)a3;
- (void)setPhotosIndicatorLeadingConstraint:(id)a3;
- (void)setPhotosIndicatorLeadingSafeAreaConstraint:(id)a3;
- (void)setPhotosIndicatorTopConstraint:(id)a3;
- (void)setPhotosIndicatorTopSafeAreaConstraint:(id)a3;
- (void)setPickerSuggestionResultFetcherResult:(id)a3;
- (void)setReplacesConfirmationButtonWithActivityIndicator:(BOOL)a3;
- (void)setSearchResultUUIDs:(id)a3;
- (void)setShouldStopScrollingItemsViewControllerToTop:(BOOL)a3;
- (void)setSidebarViewController:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTopSafeAreaConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBars;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)zoomInContent;
- (void)zoomOutContent;
@end

@implementation PUPickerContainerController

- (id)_containerForTopViewController
{
  v2 = self;
  PUPickerContainerController._containerForTopViewController()(v3);
  v5 = v4;

  return v5;
}

- (id)_pickerViewControllerWithConfiguration:(id)a3 sessionInfo:(id)a4 collectionList:(id)a5 selectionCoordinator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  v15 = (void *)PUPickerContainerController._pickerViewController(configuration:sessionInfo:collectionList:selectionCoordinator:)(v10, v11, a5, a6);

  return v15;
}

- (id)_viewControllerWithSidebarNavigationDestination:(id)a3 configuration:(id)a4 sessionInfo:(id)a5 selectionCoordinator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  v15 = (void *)PUPickerContainerController._viewController(sidebarNavigationDestination:configuration:sessionInfo:selectionCoordinator:)((uint64_t)v10, v11, v12, a6);

  return v15;
}

- (id)px_gridPresentation
{
  v3 = createGridPresentationWithViewController(self);
  v4 = [(PUPickerContainerController *)self sessionInfo];
  [v3 setSessionInfo:v4];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_topSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_pickerSuggestionResultFetcherResult, 0);
  objc_storeStrong((id *)&self->_pickerSuggestionResultFetcher, 0);
  objc_storeStrong((id *)&self->_pickerSuggestionsView, 0);
  objc_storeStrong((id *)&self->_unavailableViewController, 0);
  objc_storeStrong((id *)&self->_photosIndicatorLeadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_photosIndicatorLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_photosIndicatorTopSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_photosIndicatorTopConstraint, 0);
  objc_storeStrong((id *)&self->_peopleConfigController, 0);
  objc_storeStrong((id *)&self->_searchResultUUIDs, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_photosViewConfiguration, 0);
  objc_storeStrong((id *)&self->_photosSelectionManager, 0);
  objc_storeStrong((id *)&self->_photosDataSourceManager, 0);
  objc_storeStrong((id *)&self->_lastVisiblePhotosViewController, 0);
  objc_storeStrong((id *)&self->_photosViewController, 0);
  objc_storeStrong((id *)&self->_toolbarNewAlbumBarButton, 0);
  objc_storeStrong((id *)&self->_toolbarOptionsBarButton, 0);
  objc_storeStrong((id *)&self->_toolbarShowSelectedGroup, 0);
  objc_storeStrong((id *)&self->_showSelectedButtonSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_showSelectedButtonTitleLabel, 0);
  objc_storeStrong((id *)&self->_showSelectedButtonTitleButton, 0);
  objc_storeStrong((id *)&self->_navigationBarBottomPalette, 0);
  objc_storeStrong((id *)&self->_navigationBarSegmentedControl, 0);
  objc_destroyWeak((id *)&self->_containerControllerActionHandler);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_additionalSelectionState, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_sidebarViewController);
  objc_storeStrong((id *)&self->_collectionsViewController, 0);
  objc_storeStrong((id *)&self->_albumsViewController, 0);
  objc_storeStrong((id *)&self->_onboardingHeaderView, 0);
  objc_storeStrong((id *)&self->_photosIndicator, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
  objc_storeStrong((id *)&self->_toolbarSortAndFilterBarButtonItem, 0);
}

- (void)setPeopleSortOrderType:(int64_t)a3
{
  self->_peopleSortOrderType = a3;
}

- (int64_t)peopleSortOrderType
{
  return self->_peopleSortOrderType;
}

- (void)setAssetSortOrderType:(int64_t)a3
{
  self->_assetSortOrderType = a3;
}

- (int64_t)assetSortOrderType
{
  return self->_assetSortOrderType;
}

- (void)setBottomSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomSafeAreaConstraint
{
  return self->_bottomSafeAreaConstraint;
}

- (void)setTopSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)topSafeAreaConstraint
{
  return self->_topSafeAreaConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setPickerSuggestionResultFetcherResult:(id)a3
{
}

- (PUPickerSuggestionResultFetcherResult)pickerSuggestionResultFetcherResult
{
  return self->_pickerSuggestionResultFetcherResult;
}

- (PUPickerSuggestionResultFetcher)pickerSuggestionResultFetcher
{
  return self->_pickerSuggestionResultFetcher;
}

- (PUPickerSuggestionsView)pickerSuggestionsView
{
  return self->_pickerSuggestionsView;
}

- (UIViewController)unavailableViewController
{
  return self->_unavailableViewController;
}

- (void)setPhotosIndicatorLeadingSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)photosIndicatorLeadingSafeAreaConstraint
{
  return self->_photosIndicatorLeadingSafeAreaConstraint;
}

- (void)setPhotosIndicatorLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)photosIndicatorLeadingConstraint
{
  return self->_photosIndicatorLeadingConstraint;
}

- (void)setPhotosIndicatorTopSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)photosIndicatorTopSafeAreaConstraint
{
  return self->_photosIndicatorTopSafeAreaConstraint;
}

- (void)setPhotosIndicatorTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)photosIndicatorTopConstraint
{
  return self->_photosIndicatorTopConstraint;
}

- (PXPeoplePickerConfigurationController)peopleConfigController
{
  return self->_peopleConfigController;
}

- (void)setSearchResultUUIDs:(id)a3
{
}

- (NSArray)searchResultUUIDs
{
  return self->_searchResultUUIDs;
}

- (PUPickerSearchBar)searchBar
{
  return self->_searchBar;
}

- (PXPhotosViewConfiguration)photosViewConfiguration
{
  return self->_photosViewConfiguration;
}

- (PXSectionedSelectionManager)photosSelectionManager
{
  return self->_photosSelectionManager;
}

- (PXAssetsDataSourceManager)photosDataSourceManager
{
  return self->_photosDataSourceManager;
}

- (PXPhotosUIViewController)lastVisiblePhotosViewController
{
  return self->_lastVisiblePhotosViewController;
}

- (PXPhotosUIViewController)photosViewController
{
  return self->_photosViewController;
}

- (void)setShouldStopScrollingItemsViewControllerToTop:(BOOL)a3
{
  self->_shouldStopScrollingItemsViewControllerToTop = a3;
}

- (BOOL)shouldStopScrollingItemsViewControllerToTop
{
  return self->_shouldStopScrollingItemsViewControllerToTop;
}

- (UIBarButtonItem)toolbarNewAlbumBarButton
{
  return self->_toolbarNewAlbumBarButton;
}

- (UIBarButtonItem)toolbarOptionsBarButton
{
  return self->_toolbarOptionsBarButton;
}

- (UIBarButtonItem)toolbarShowSelectedGroup
{
  return self->_toolbarShowSelectedGroup;
}

- (UILabel)showSelectedButtonSubtitleLabel
{
  return self->_showSelectedButtonSubtitleLabel;
}

- (UILabel)showSelectedButtonTitleLabel
{
  return self->_showSelectedButtonTitleLabel;
}

- (UIButton)showSelectedButtonTitleButton
{
  return self->_showSelectedButtonTitleButton;
}

- (_UINavigationBarPalette)navigationBarBottomPalette
{
  return self->_navigationBarBottomPalette;
}

- (UISegmentedControl)navigationBarSegmentedControl
{
  return self->_navigationBarSegmentedControl;
}

- (PUPickerContainerControllerActionHandler)containerControllerActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerControllerActionHandler);
  return (PUPickerContainerControllerActionHandler *)WeakRetained;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (PUPickerAdditionalSelectionState)additionalSelectionState
{
  return self->_additionalSelectionState;
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (PUSidebarViewController)sidebarViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidebarViewController);
  return (PUSidebarViewController *)WeakRetained;
}

- (BOOL)replacesConfirmationButtonWithActivityIndicator
{
  return self->_replacesConfirmationButtonWithActivityIndicator;
}

- (void)setOnboardingHeaderView:(id)a3
{
}

- (void)setPhotosIndicator:(id)a3
{
}

- (void)pickerOnboardingHeaderViewWantsToLearnMoreAboutDataAccess:(id)a3
{
  id v4 = [(PUPickerContainerController *)self containerControllerActionHandler];
  [v4 containerControllerWantsToLearnMoreAboutDataAccess:self];
}

- (void)pickerSuggestionsViewDidSelectSameSuggestion:(id)a3
{
  id v3 = [(PUPickerContainerController *)self itemsViewController];
  objc_msgSend(v3, "pu_scrollToInitialPositionAnimated:", 1);
}

- (void)pickerSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v5 = a4;
  id v6 = [(PUPickerContainerController *)self pickerSuggestionResultFetcher];
  [v6 setCurrentSuggestion:v5];
}

- (id)preferredColumnCounts:(id)a3
{
  id v3 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
  id v4 = [v3 allowedColumnsOverride];

  return v4;
}

- (CGRect)preferredCropForAsset:(id)a3 withAspectRatio:(double)a4
{
  id v5 = a3;
  id v6 = [(PUPickerContainerController *)self configuration];
  int v7 = [v6 showsWallpaperSuggestions];

  double v8 = *MEMORY[0x1E4F1DB20];
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v7)
  {
    id v12 = v5;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [(PUPickerContainerController *)self pickerSuggestionResultFetcher];

    if (v13 && v14)
    {
      v15 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
      v16 = [v15 suggestionSubtypeByAssetUUID];
      v17 = [v13 uuid];
      v18 = [v16 objectForKeyedSubscript:v17];

      if (v18)
      {
        unsigned __int16 v19 = [v18 integerValue];
        uint64_t v20 = [MEMORY[0x1E4F8E858] posterClassificationForSuggestionSubtype:v19];
      }
      else
      {
        v21 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
        uint64_t v20 = [v21 posterClassification];
      }
      v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v22 bounds];
      double v24 = v23;
      double v26 = v25;

      if (v24 <= v26) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = 2;
      }
      v28 = [MEMORY[0x1E4F8CCB0] deviceConfigurationForOrientation:v27];
      [MEMORY[0x1E4F8E858] bestWallpaperCropForAsset:v13 classification:v20 outputCropScore:0 outputLayoutAcceptable:0 layoutConfiguration:v28];
      double v8 = v29;
      double v9 = v30;
      double v10 = v31;
      double v11 = v32;
    }
  }

  double v33 = v8;
  double v34 = v9;
  double v35 = v10;
  double v36 = v11;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)peopleConfigurationController:(id)a3 didPopViewController:(id)a4
{
  id v6 = a3;
  id v7 = [(PUPickerContainerController *)self peopleConfigController];

  if (v7 != v6)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 2448, @"Invalid parameter not satisfying: %@", @"peopleConfigController == self.peopleConfigController" object file lineNumber description];
  }
  [(PUPickerContainerController *)self _updateToolbar];
}

- (void)peopleConfigurationController:(id)a3 didFinishWithCurrentViewController:(id)a4 selectedPerson:(id)a5
{
  id v22 = a3;
  id v7 = [(PUPickerContainerController *)self peopleConfigController];

  double v8 = v22;
  if (v7 != v22)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 2413, @"Invalid parameter not satisfying: %@", @"peopleConfigController == self.peopleConfigController" object file lineNumber description];

    double v8 = v22;
  }
  double v9 = [v8 currentViewController];
  if (!v9)
  {
    v16 = [(PUPickerContainerController *)self containerControllerActionHandler];
    v17 = [v22 addedObjectIDs];
    [v16 containerController:self didTapBatchedItems:v17];

    goto LABEL_12;
  }
  uint64_t v10 = [v22 buttonType];
  if (v10 == 2)
  {
    id v18 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v12 = PXLocalizedString();
    id v13 = v18;
    v14 = v12;
    uint64_t v15 = 2;
  }
  else
  {
    if (v10 != 1)
    {
      v16 = 0;
      goto LABEL_11;
    }
    id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v12 = PXLocalizedString();
    id v13 = v11;
    v14 = v12;
    uint64_t v15 = 0;
  }
  v16 = (void *)[v13 initWithTitle:v14 style:v15 target:v22 action:sel_didAdvanceWithSender_];

LABEL_11:
  unsigned __int16 v19 = [v9 navigationItem];
  [v19 setRightBarButtonItem:v16];

  uint64_t v20 = [(PUPickerContainerController *)self navigationController];
  [v20 pushViewController:v9 animated:1];

  [(PUPickerContainerController *)self _updateToolbar];
LABEL_12:
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  if ([a3 isTracking])
  {
    [(PUPickerContainerController *)self resignSearchBarAsFirstResponder];
  }
}

- (void)sessionInfoStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPickerContainerController *)self configuration];
  uint64_t v6 = [v5 sourceType];

  if (v6 == 2)
  {
    id v7 = [v4 targetAlbum];
    double v8 = [v7 objectID];

    if (v8) {
      [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v8];
    }
    else {
    double v9 = [MEMORY[0x1E4F1CAA0] orderedSet];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PUPickerContainerController_sessionInfoStatusDidChange___block_invoke;
    v11[3] = &unk_1E5F2ECC8;
    v11[4] = self;
    id v12 = v9;
    id v10 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __58__PUPickerContainerController_sessionInfoStatusDidChange___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) selectionCoordinator];
  v2 = [*(id *)(a1 + 32) selectionCoordinator];
  id v3 = [v2 selectedObjectIDs];
  [v4 modifySelectionWithRemovedOIDs:v3 insertedOIDs:*(void *)(a1 + 40)];
}

- (id)_animationForNavigationBarVisible:(BOOL)a3 fromCurrentOpacity:(double)a4
{
  BOOL v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  id v7 = [NSNumber numberWithDouble:a4];
  [v6 setFromValue:v7];

  if (v5) {
    double v8 = &unk_1F078D330;
  }
  else {
    double v8 = &unk_1F078D340;
  }
  [v6 setToValue:v8];
  [v6 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v6 setRemovedOnCompletion:v5];
  [v6 setStiffness:246.7];
  [v6 setDamping:31.4];
  [v6 settlingDuration];
  objc_msgSend(v6, "setDuration:");
  double v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v6 setTimingFunction:v9];

  return v6;
}

- (id)_currentContainerViewForInteractionBarTransition
{
  id v3 = [(PUPickerContainerController *)self childViewControllers];
  id v4 = [(PUPickerContainerController *)self photosViewController];
  int v5 = [v3 containsObject:v4];

  if (v5)
  {
    uint64_t v6 = [(PUPickerContainerController *)self photosViewController];
LABEL_5:
    id v10 = v6;
    id v11 = [v6 view];

    goto LABEL_7;
  }
  id v7 = [(PUPickerContainerController *)self childViewControllers];
  double v8 = [(PUPickerContainerController *)self albumsViewController];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    uint64_t v6 = [(PUPickerContainerController *)self albumsViewController];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_7:
  return v11;
}

- (void)_updateInteractiveBarTransition
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPickerContainerController *)self configuration];
  int v4 = [v3 supportsInteractiveBarTransition];

  if (v4)
  {
    int v5 = [(PUPickerContainerController *)self _currentContainerViewForInteractionBarTransition];
    if (v5)
    {
      self->_hasNavigationBarTransitionPending = 0;
      uint64_t v6 = [(PUPickerContainerController *)self photosViewController];
      id v7 = [v6 contentController];
      double v8 = [v7 gridView];
      [v8 setAvoidSnapshotOnHeightChanges:1];

      int v9 = [(PUPickerContainerController *)self navigationController];
      id v10 = [(PUPickerContainerController *)self configuration];
      [v10 interactiveBarTransitionFractionExpanded];
      double v12 = v11;

      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v57.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v57.c = v13;
      *(_OWORD *)&v57.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(_OWORD *)&v56.a = *(_OWORD *)&v57.a;
      *(_OWORD *)&v56.c = v13;
      *(_OWORD *)&v56.tx = *(_OWORD *)&v57.tx;
      *(_OWORD *)&v55.a = *(_OWORD *)&v57.a;
      *(_OWORD *)&v55.c = v13;
      *(_OWORD *)&v55.tx = *(_OWORD *)&v57.tx;
      v14 = [v9 childViewControllers];
      uint64_t v15 = [v14 count];

      if (v15 == 1)
      {
        v16 = [v9 topViewController];
        v17 = [v16 view];
        [v17 safeAreaInsets];
        double v19 = v18;

        double v20 = (1.0 - v12) * v19;
        v21 = [(PUPickerContainerController *)self view];
        [v21 safeAreaInsets];
        double v23 = v22;

        double v24 = [v9 toolbar];
        [v24 bounds];
        double v26 = v25;

        uint64_t v27 = PLPickerGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf.a) = 134218752;
          *(double *)((char *)&buf.a + 4) = v20;
          WORD2(buf.b) = 2048;
          *(double *)((char *)&buf.b + 6) = v12;
          HIWORD(buf.c) = 2048;
          buf.d = v23;
          LOWORD(buf.tx) = 2048;
          *(double *)((char *)&buf.tx + 2) = v26;
          _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEBUG, "_updateInteractiveBarTransition will transition with offset %f, fractionExpanded %f, bottom safe area %f, toolbar height: %f", (uint8_t *)&buf, 0x2Au);
        }

        memset(&buf, 0, sizeof(buf));
        CGAffineTransformMakeScale(&buf, 1.0, v12);
        memset(&v54, 0, sizeof(v54));
        CGAffineTransformMakeTranslation(&v54, 0.0, v20 * -0.5);
        CGAffineTransform t1 = buf;
        CGAffineTransform t2 = v54;
        CGAffineTransformConcat(&v57, &t1, &t2);
        CGAffineTransformMakeTranslation(&v56, 0.0, (1.0 - v12) * (v23 + v26));
        CGAffineTransformMakeTranslation(&v55, 0.0, -v20);
      }
      else
      {
        BOOL v29 = v12 <= 0.8;
        double v30 = [v9 navigationBar];
        [v30 setHidden:v29];

        double v31 = [v9 toolbar];
        [v31 setHidden:v29];
      }
      CGAffineTransform v51 = v57;
      double v32 = [v9 navigationBar];
      CGAffineTransform v50 = v51;
      [v32 setTransform:&v50];

      CGAffineTransform v49 = v56;
      double v33 = [v9 toolbar];
      CGAffineTransform v48 = v49;
      [v33 setTransform:&v48];

      CGAffineTransform v47 = v55;
      [v5 setTransform:&v47];
      double v34 = [v9 navigationBar];
      double v35 = [v34 layer];
      double v36 = [v35 animationForKey:@"navBarOpacity"];

      if (v36)
      {
        v37 = [v36 toValue];
        [v37 floatValue];
        double v39 = v38;
      }
      else
      {
        v37 = [v9 navigationBar];
        [v37 alpha];
        double v39 = v40;
      }

      BOOL v41 = v12 > 0.8 && v39 == 0.0;
      if (v41 || v39 > 0.0 && v12 < 0.8)
      {
        v42 = [(PUPickerContainerController *)self _animationForNavigationBarVisible:v41 fromCurrentOpacity:v39];
        v43 = [v9 navigationBar];
        v44 = [v43 layer];
        [v44 addAnimation:v42 forKey:@"navBarOpacity"];

        v45 = [v9 navigationBar];
        [v45 setUserInteractionEnabled:v41];

        v46 = [v9 toolbar];
        [v46 setUserInteractionEnabled:v41];
      }
    }
    else
    {
      v28 = PLPickerGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v57.a) = 0;
        _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_DEFAULT, "_updateInteractiveBarTransition will postpone transition, there isn't a view controller presented yet.", (uint8_t *)&v57, 2u);
      }

      self->_hasNavigationBarTransitionPending = 1;
    }
  }
}

- (void)_updateLastVisiblePhotosViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([(PUPickerContainerController *)self lastVisiblePhotosViewController],
          id v5 = (id)objc_claimAutoreleasedReturnValue(),
          v5,
          v5 == v9))
    {
      double v8 = [(PUPickerContainerController *)self lastVisiblePhotosViewController];

      id v4 = v9;
      if (!v8) {
        goto LABEL_8;
      }
      lastVisiblePhotosViewController = self->_lastVisiblePhotosViewController;
      self->_lastVisiblePhotosViewController = 0;
    }
    else
    {
      uint64_t v6 = (PXPhotosUIViewController *)v9;
      lastVisiblePhotosViewController = self->_lastVisiblePhotosViewController;
      self->_lastVisiblePhotosViewController = v6;
    }

    id v4 = v9;
  }
LABEL_8:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PUPhotoPickerResizeTaskDescriptorViewModelObservationContext_70677 == a5) {
    goto LABEL_10;
  }
  if ((void *)PUPhotoPickerPhotosViewControllerViewModelObservationContext == a5)
  {
    if ((a4 & 0x200000000) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    [(PUPickerContainerController *)self updateBars];
    goto LABEL_11;
  }
  if ((void *)PUPhotoPickerConfigurationObservationContext == a5)
  {
    if ((a4 & 0x123) != 0) {
      [(PUPickerContainerController *)self updateBars];
    }
    if ((a4 & 0x29) != 0)
    {
      long long v13 = [(PUPickerContainerController *)self photosViewController];
      [v13 invalidateHeaderView];
    }
    if ((a4 & 0xE0) != 0)
    {
      [(PUPickerContainerController *)self _updateInteractiveBarTransition];
      [(PUPickerContainerController *)self _showPhotosIndicatorBrieflyIfNeeded];
      v14 = [(PUPickerContainerController *)self view];
      [v14 setNeedsUpdateConstraints];
    }
  }
  else
  {
    if ((void *)PUPhotoPickerAdditionalSelectionStateObservationContext != a5)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PUPickerContainerController.m" lineNumber:2281 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v10 = PLPickerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Preparation options were changed.", buf, 2u);
    }

    [(PUPickerContainerController *)self _updateToolbar];
    double v11 = [(PUPickerContainerController *)self configuration];
    uint64_t v12 = [v11 confirmationBehavior];

    if ((unint64_t)(v12 - 2) <= 2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__PUPickerContainerController_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5F2ED10;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
LABEL_11:
}

void __60__PUPickerContainerController_observable_didChange_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) selectionCoordinator];
  id v7 = [v2 selectedObjectIDs];

  if ([v7 count])
  {
    id v3 = [*(id *)(a1 + 32) selectionCoordinator];
    id v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
    [v3 modifySelectionWithRemovedOIDs:v7 insertedOIDs:v4];

    id v5 = [*(id *)(a1 + 32) selectionCoordinator];
    uint64_t v6 = [MEMORY[0x1E4F1CAA0] orderedSet];
    [v5 modifySelectionWithRemovedOIDs:v6 insertedOIDs:v7];
  }
}

- (unint64_t)photosViewControllerFilterSortedRecordsStrategy:(id)a3
{
  if ([(PUPickerContainerController *)self _isConfiguredForStickerSuggestionGroup])
  {
    return 2;
  }
  else
  {
    return PXPreferencesGetBool();
  }
}

- (BOOL)photosViewController:(id)a3 isAssetEligibleForPlaybackWithSettlingEffect:(id)a4
{
  id v4 = [(PUPickerContainerController *)self configuration];
  char v5 = [v4 showsWallpaperSuggestions];

  return v5;
}

- (BOOL)photosViewController:(id)a3 isAssetEligibleForAutoPlayback:(id)a4
{
  return 1;
}

- (BOOL)photosViewController:(id)a3 canPlayAssetInline:(id)a4
{
  id v5 = a4;
  if ([v5 playbackStyle] == 3)
  {
    id v6 = v5;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v7 = v6;

      if (v7)
      {
        double v8 = [(PUPickerContainerController *)self configuration];
        int v9 = [v8 showsWallpaperSuggestions];

        if (v9)
        {
          id v10 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
          double v11 = [v10 inlinePlaybackDisallowedAssetUUIDs];
          uint64_t v12 = [v7 uuid];
          int v13 = [v11 containsObject:v12] ^ 1;

LABEL_10:
          goto LABEL_11;
        }
        if ([(PUPickerContainerController *)self _isConfiguredForStickerSuggestionGroup])
        {
          LOBYTE(v13) = [v7 playbackStyle] == 3;
          goto LABEL_10;
        }
      }
    }
    else
    {

      id v7 = 0;
    }
    LOBYTE(v13) = 0;
    goto LABEL_10;
  }
  LOBYTE(v13) = 0;
LABEL_11:

  return v13;
}

- (BOOL)shouldAnimateFromHeaderView:(id)a3 toHeaderView:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (a4 == 0) & isKindOfClass;
}

- (id)headerViewForPhotosViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPickerContainerController *)self photosViewController];

  if (v5 == v4)
  {
    id v6 = [(PUPickerContainerController *)self configuration];
    uint64_t v7 = [v6 mode];

    if (v7 != 1)
    {
      double v8 = [(PUPickerContainerController *)self configuration];
      int v9 = [v8 shouldShowOnboardingHeaderView];

      if (v9)
      {
        id v10 = [(PUPickerContainerController *)self onboardingHeaderView];
        goto LABEL_7;
      }
      [(PUPickerContainerController *)self setOnboardingHeaderView:0];
    }
  }
  id v10 = 0;
LABEL_7:
  return v10;
}

- (id)photosViewController:(id)a3 animationForProposedAnimation:(id)a4
{
  id v5 = a4;
  if ([(PUPickerContainerController *)self searchBarIsFirstResponder]) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)allowsContextMenuInteractionForPhotosViewController:(id)a3
{
  id v3 = [(PUPickerContainerController *)self configuration];
  char v4 = [v3 allowsContextMenuInteraction];

  return v4;
}

- (BOOL)_shouldLoadLemonadeFeedForDestination:(id)a3
{
  id v3 = a3;
  char v4 = [v3 collection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 collection];
    if (objc_msgSend(v6, "px_isEventsVirtualCollection"))
    {
      char v7 = 1;
    }
    else
    {
      double v8 = [v3 collection];
      if (objc_msgSend(v8, "px_isPeopleVirtualCollection"))
      {
        char v7 = 1;
      }
      else
      {
        int v9 = [v3 collection];
        if (objc_msgSend(v9, "px_isMemoriesVirtualCollection"))
        {
          char v7 = 1;
        }
        else
        {
          id v10 = [v3 collection];
          if (objc_msgSend(v10, "px_isTripsVirtualCollection"))
          {
            char v7 = 1;
          }
          else
          {
            double v11 = [v3 collection];
            if (objc_msgSend(v11, "px_isWallpaperSuggestionsVirtualCollection"))
            {
              char v7 = 1;
            }
            else
            {
              uint64_t v12 = [v3 collection];
              if (objc_msgSend(v12, "px_isFeaturedPhotosCollection"))
              {
                char v7 = 1;
              }
              else
              {
                int v13 = [v3 collection];
                char v7 = objc_msgSend(v13, "px_isMapVirtualCollection");
              }
            }
          }
        }
      }
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)px_navigationDestination
{
  char v4 = [(PUPickerContainerController *)self childViewControllers];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 2123, @"Invalid parameter not satisfying: %@", @"self.childViewControllers.count <= 1" object file lineNumber description];
  }
  id v6 = [(PUPickerContainerController *)self childViewControllers];
  char v7 = [v6 firstObject];

  if (!v7
    || ([(PUPickerContainerController *)self itemsViewController],
        double v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqual:v8],
        v8,
        v9))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F905E8]);
    uint64_t v11 = 21;
LABEL_6:
    uint64_t v12 = [v10 initWithType:v11 revealMode:0];
    goto LABEL_7;
  }
  uint64_t v15 = [(PUPickerContainerController *)self albumsViewController];
  int v16 = [v7 isEqual:v15];

  if (v16)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F905E8]);
    uint64_t v11 = 22;
    goto LABEL_6;
  }
  uint64_t v12 = objc_msgSend(v7, "px_navigationDestination");
LABEL_7:
  int v13 = (void *)v12;

  return v13;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if ([v9 revealMode])
  {
    if ([v9 revealMode] == 3)
    {
      uint64_t v11 = [(PUPickerContainerController *)self childViewControllers];
      uint64_t v12 = [v11 firstObject];

      if (v12)
      {
        if (objc_msgSend(v12, "pu_scrollToInitialPositionAnimated:", (a4 >> 1) & 1)) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 5;
        }
        v10[2](v10, v13, 0);
      }
      else
      {
        double v25 = PLPickerGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CGAffineTransform buf = 138412290;
          id v45 = v9;
          _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_ERROR, "Unsupported scrolling to top (can't find child view controller): %@", buf, 0xCu);
        }

        v10[2](v10, 2, 0);
      }

      goto LABEL_42;
    }
    int v16 = PLPickerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CGAffineTransform buf = 138412290;
      id v45 = v9;
      v17 = "Unsupported destination reveal mode: %@";
LABEL_26:
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if ([v9 type] == 21)
  {
    uint64_t v14 = [(PUPickerContainerController *)self itemsViewController];
LABEL_10:
    uint64_t v15 = (void *)v14;
    goto LABEL_35;
  }
  if ([v9 type] == 22)
  {
    double v18 = [(PUPickerContainerController *)self sidebarViewController];

    if (!v18)
    {
      uint64_t v14 = [(PUPickerContainerController *)self albumsViewController];
      goto LABEL_10;
    }
  }
  double v19 = [v9 collection];

  if (!v19) {
    goto LABEL_24;
  }
  double v20 = [(PUPickerContainerController *)self sidebarViewController];

  if (v20)
  {
    v21 = [(PUPickerContainerController *)self px_gridPresentation];
    if ([(PUPickerContainerController *)self _shouldLoadLemonadeFeedForDestination:v9])
    {
      double v22 = [(PUPickerContainerController *)self configuration];
      double v23 = [(PUPickerContainerController *)self sessionInfo];
      double v24 = [(PUPickerContainerController *)self selectionCoordinator];
      uint64_t v15 = [(PUPickerContainerController *)self _viewControllerWithSidebarNavigationDestination:v9 configuration:v22 sessionInfo:v23 selectionCoordinator:v24];

LABEL_32:
      uint64_t v27 = [v9 collection];
      v28 = [v27 localizedTitle];

      if (v28)
      {
        BOOL v29 = [v9 collection];
        double v30 = [v29 localizedTitle];
        [v15 setTitle:v30];
      }
      double v31 = [(PUPickerContainerController *)self configuration];
      uint64_t v32 = [v31 hasClearBackgroundColor];
      double v33 = [v15 view];
      double v34 = [v33 layer];
      [v34 setHitTestsAsOpaque:v32];

LABEL_35:
      int v26 = 0;
      if (v15) {
        goto LABEL_36;
      }
LABEL_24:
      int v16 = PLPickerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CGAffineTransform buf = 138412290;
        id v45 = v9;
        v17 = "Unsupported destination: %@";
        goto LABEL_26;
      }
LABEL_27:

      v10[2](v10, 2, 0);
      goto LABEL_42;
    }
    double v22 = [v9 collection];
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_31:
        uint64_t v15 = [v21 createViewControllerForAssetCollection:v22];
        goto LABEL_32;
      }
      double v39 = [MEMORY[0x1E4F28B00] currentHandler];
      v42 = (objc_class *)objc_opt_class();
      BOOL v41 = NSStringFromClass(v42);
      v43 = objc_msgSend(v22, "px_descriptionForAssertionMessage");
      [v39 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 2079, @"%@ should be an instance inheriting from %@, but it is %@", @"destination.collection", v41, v43 object file lineNumber description];
    }
    else
    {
      double v39 = [MEMORY[0x1E4F28B00] currentHandler];
      double v40 = (objc_class *)objc_opt_class();
      BOOL v41 = NSStringFromClass(v40);
      [v39 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 2079, @"%@ should be an instance inheriting from %@, but it is nil", @"destination.collection", v41 object file lineNumber description];
    }

    goto LABEL_31;
  }
  uint64_t v15 = [(PUPickerContainerController *)self albumsViewController];
  int v26 = 1;
  if (!v15) {
    goto LABEL_24;
  }
LABEL_36:
  double v35 = [(PUPickerContainerController *)self childViewControllers];
  char v36 = [v35 containsObject:v15];

  if ((v36 & 1) == 0) {
    [(PUPickerContainerController *)self _addOrReplaceItemViewControllerWithViewController:v15];
  }
  [(PUPickerContainerController *)self updateBars];
  if (v26)
  {
    [v15 navigateToDestination:v9 options:a4 completionHandler:v10];
  }
  else
  {
    v37 = [(PUPickerContainerController *)self navigationController];
    id v38 = (id)[v37 popToRootViewControllerAnimated:0];

    v10[2](v10, 1, 0);
  }

LABEL_42:
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  uint64_t v3 = [a3 type];
  if ((unint64_t)(v3 - 8) > 0x13) {
    return 0;
  }
  else {
    return qword_1AEFF8380[v3 - 8];
  }
}

- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = [v9 popoverPresentationController];
    if (v10)
    {
      uint64_t v11 = [v6 actionType];
      if (v11 == (void *)*MEMORY[0x1E4F90FD0])
      {
        uint64_t v12 = [(PUPickerContainerController *)self toolbarSortAndFilterBarButtonItem];
        [v10 setBarButtonItem:v12];
      }
      else
      {
        uint64_t v12 = [(PUPickerContainerController *)self navigationController];
        uint64_t v13 = [v12 view];
        [v10 setSourceView:v13];
      }
    }
    uint64_t v15 = [(PUPickerContainerController *)self navigationController];
    char v14 = 1;
    [v15 presentViewController:v9 animated:1 completion:0];

    int v16 = [v9 presentingViewController];
    if (!v16) {
      char v14 = objc_msgSend(v9, "px_isDelayingPresentation");
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      uint64_t v12 = [(PUPickerContainerController *)self navigationController];
      BOOL v11 = 1;
      objc_msgSend(v12, "px_pushViewController:animated:completion:", v10, 1, 0);

      break;
    case 2:
      BOOL v11 = [(PUPickerContainerController *)self _actionPerformer:v9 presentViewController:v10];
      break;
    case 0:
      char v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PUPickerContainerController.m" lineNumber:2009 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      BOOL v11 = 0;
      break;
  }

  return v11;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  uint64_t v3 = [(PUPickerContainerController *)self navigationController];
  char v4 = [v3 topViewController];

  unint64_t v5 = [v4 undoManager];

  return v5;
}

- (void)handleToolbarNewAlbumButton:(id)a3
{
  char v4 = [(PUPickerContainerController *)self _containerForTopViewController];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(PUPickerContainerController *)self configuration];
    double v8 = [v7 photoLibrary];
    id v9 = objc_msgSend(v8, "px_virtualCollections");
    id v6 = [v9 rootAlbumCollectionList];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F90470]);
  BOOL v11 = (void *)[v10 initWithActionType:*MEMORY[0x1E4F90E38] collectionList:v6];
  [v11 setDelegate:self];
  uint64_t v12 = [(PUPickerContainerController *)self configuration];
  uint64_t v13 = [v12 albumsConfiguration];
  char v14 = [v13 assetsToAddIdentifiers];

  if ([v14 count])
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F38EB8];
    int v16 = [(PUPickerContainerController *)self configuration];
    v17 = [v16 photoLibrary];
    double v18 = [v17 librarySpecificFetchOptions];
    double v19 = [v15 fetchAssetsWithLocalIdentifiers:v14 options:v18];
    double v20 = [v19 fetchedObjects];
    [v11 setPreselectedAssets:v20];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke;
  v22[3] = &unk_1E5F2D4B8;
  id v23 = v11;
  double v24 = self;
  id v21 = v11;
  [v21 performActionWithCompletionHandler:v22];
}

void __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLPickerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v5 localizedDescription];
      *(_DWORD *)CGAffineTransform buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to create new album): %@", buf, 0xCu);
    }
  }
  double v8 = [*(id *)(a1 + 32) createdCollection];
  id v9 = [v8 objectID];
  if (v9) {
    [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v9];
  }
  else {
  id v10 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke_622;
  v12[3] = &unk_1E5F2ECC8;
  v12[4] = *(void *)(a1 + 40);
  id v13 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke_622(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) selectionCoordinator];
  v2 = [*(id *)(a1 + 32) selectionCoordinator];
  uint64_t v3 = [v2 selectedObjectIDs];
  [v4 modifySelectionWithRemovedOIDs:v3 insertedOIDs:*(void *)(a1 + 40)];
}

- (void)handleToolbarOptionsButton:(id)a3
{
  id v5 = [(PUPickerContainerController *)self configuration];
  int v6 = [v5 excludesOptionsMenu];

  if (v6)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 1920, @"Invalid parameter not satisfying: %@", @"!self.configuration.excludesOptionsMenu" object file lineNumber description];
  }
  id v7 = [(PUPickerContainerController *)self navigationController];
  double v8 = [v7 topViewController];

  id v9 = [(PUPickerContainerController *)self configuration];
  id v10 = [(PUPickerContainerController *)self selectionCoordinator];
  id v11 = [(PUPickerContainerController *)self additionalSelectionState];
  uint64_t v12 = +[PUPickerOptionsViewFactory viewControllerWithConfiguration:v9 selectionCoordinator:v10 additionalSelectionState:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v12];
  char v14 = PULocalizedString(@"OPTIONS_BUTTON_TITLE");
  [v12 setTitle:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4FB13F0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__PUPickerContainerController_handleToolbarOptionsButton___block_invoke;
  v21[3] = &unk_1E5F2ADC0;
  id v22 = v8;
  id v16 = v8;
  v17 = [v15 actionWithTitle:&stru_1F06BE7B8 image:0 identifier:0 handler:v21];
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 primaryAction:v17 menu:0];
  double v19 = [v12 navigationItem];
  [v19 setRightBarButtonItem:v18];

  [v16 presentViewController:v13 animated:1 completion:0];
}

uint64_t __58__PUPickerContainerController_handleToolbarOptionsButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)handleToolbarShowSelectedButton:(id)a3
{
  id v5 = a3;
  int v6 = [(PUPickerContainerController *)self selectionCoordinator];
  id v7 = [v6 selectedObjectIDs];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 1914, @"Invalid parameter not satisfying: %@", @"self.selectionCoordinator.selectedObjectIDs.count > 0" object file lineNumber description];
  }
  id v10 = [(PUPickerContainerController *)self containerControllerActionHandler];
  [v10 containerController:self didTapShowSelectedButton:v5];
}

- (void)handleNavigationBarSegmentedControl:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 selectedSegmentIndex];
  uint64_t v5 = v4;
  if (v4)
  {
    if (v4 == 1)
    {
      int v6 = [(PUPickerContainerController *)self childViewControllers];
      id v7 = [(PUPickerContainerController *)self albumsViewController];
      char v8 = [v6 containsObject:v7];

      uint64_t v9 = 22;
      if ((v8 & 1) == 0) {
        goto LABEL_8;
      }
LABEL_6:
      int v13 = 1;
      uint64_t v14 = 3;
      goto LABEL_9;
    }
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = [(PUPickerContainerController *)self childViewControllers];
    id v11 = [(PUPickerContainerController *)self itemsViewController];
    int v12 = [v10 containsObject:v11];

    uint64_t v9 = 21;
    if (v12) {
      goto LABEL_6;
    }
  }
LABEL_8:
  int v13 = 0;
  uint64_t v14 = 0;
LABEL_9:
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithType:v9 revealMode:v14];
  uint64_t v16 = [v15 type];
  v17 = PLPickerGetLog();
  double v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = @"NO";
      if (v13) {
        double v19 = @"YES";
      }
      double v20 = v19;
      *(_DWORD *)CGAffineTransform buf = 134218498;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      BOOL v29 = v20;
      __int16 v30 = 2112;
      double v31 = v15;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "Selected %ld (same item: %@) to navigate to destination: %@", buf, 0x20u);
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __67__PUPickerContainerController_handleNavigationBarSegmentedControl___block_invoke;
    v24[3] = &__block_descriptor_41_e20_v24__0q8__NSError_16l;
    if (v13) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 0;
    }
    v24[4] = v5;
    char v25 = v13;
    [(PUPickerContainerController *)self navigateToDestination:v15 options:v21 completionHandler:v24];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v22 = @"NO";
      if (v13) {
        id v22 = @"YES";
      }
      id v23 = v22;
      *(_DWORD *)CGAffineTransform buf = 134218242;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      BOOL v29 = v23;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Unable to select %ld (same item: %@) because a destination doesn't exist.", buf, 0x16u);
    }
  }
}

void __67__PUPickerContainerController_handleNavigationBarSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PLPickerGetLog();
  id v7 = v6;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      id v10 = v9;
      int v15 = 134218242;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      double v18 = v10;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Selected %ld sucessfully (same item: %@)", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 40)) {
      int v12 = @"YES";
    }
    else {
      int v12 = @"NO";
    }
    int v13 = v12;
    uint64_t v14 = [v5 localizedDescription];
    int v15 = 134218754;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    double v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = a2;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Unable to select %ld (same item: %@) because of error (%ld): %@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)_cleanUpInteractiveBarTransitionIfNeeded
{
  __int16 v17 = [(PUPickerContainerController *)self configuration];
  if ([v17 supportsInteractiveBarTransition])
  {
  }
  else
  {
    uint64_t v3 = [(PUPickerContainerController *)self viewIfLoaded];

    if (v3)
    {
      uint64_t v4 = [(PUPickerContainerController *)self photosViewController];
      id v5 = [v4 contentController];
      uint64_t v6 = [v5 gridView];
      [(id)v6 setAvoidSnapshotOnHeightChanges:0];

      id v7 = [(PUPickerContainerController *)self navigationController];
      uint64_t v8 = [v7 navigationBar];

      long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)double v18 = *MEMORY[0x1E4F1DAB8];
      v21[0] = *MEMORY[0x1E4F1DAB8];
      v21[1] = v16;
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v21[2] = v15;
      [v8 setTransform:v21];
      [v8 setUserInteractionEnabled:1];
      uint64_t v9 = [v8 layer];
      [v9 removeAllAnimations];

      id v10 = [(PUPickerContainerController *)self navigationController];
      LOBYTE(v6) = [v10 isToolbarHidden];

      if ((v6 & 1) == 0)
      {
        uint64_t v11 = [(PUPickerContainerController *)self navigationController];
        int v12 = [v11 toolbar];

        v20[0] = *(_OWORD *)v18;
        v20[1] = v16;
        v20[2] = v15;
        [v12 setTransform:v20];
        [v12 setUserInteractionEnabled:1];
        int v13 = [v12 layer];
        [v13 removeAllAnimations];
      }
      uint64_t v14 = [(PUPickerContainerController *)self _currentContainerViewForInteractionBarTransition];
      v19[0] = *(_OWORD *)v18;
      v19[1] = v16;
      v19[2] = v15;
      [v14 setTransform:v19];
    }
  }
}

- (BOOL)_isConfiguredForRetailExperience
{
  uint64_t v3 = [(PUPickerContainerController *)self configuration];
  uint64_t v4 = [v3 suggestionGroup];
  id v5 = [MEMORY[0x1E4F399C0] retailExperienceSuggestionGroup];
  int v6 = [v4 isEqual:v5];

  if (!v6) {
    return 0;
  }
  id v7 = [(PUPickerContainerController *)self configuration];
  uint64_t v8 = [v7 pickerClientBundleIdentifier];
  char v9 = [v8 isEqual:@"com.apple.mobileslideshow"];

  return v9;
}

- (BOOL)_isConfiguredForStickerSuggestionGroup
{
  v2 = [(PUPickerContainerController *)self configuration];
  uint64_t v3 = [v2 suggestionGroup];
  uint64_t v4 = [MEMORY[0x1E4F399C0] stickersSuggestionGroup];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_filterWithSearchResultUUIDs:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerContainerController.m", 1834, @"%s must be called on the main thread", "-[PUPickerContainerController _filterWithSearchResultUUIDs:]");
  }
  [(PUPickerContainerController *)self setSearchResultUUIDs:v6];
  [(PUPickerContainerController *)self _updateAllowedUUIDs];
}

- (void)_filterWithSuggestionResult:(id)a3
{
  id v22 = a3;
  if (!v22)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 1803, @"Invalid parameter not satisfying: %@", @"result != nil" object file lineNumber description];
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerContainerController.m", 1804, @"%s must be called on the main thread", "-[PUPickerContainerController _filterWithSuggestionResult:]");
  }
  char v5 = [(PUPickerContainerController *)self photosViewController];
  id v6 = [v5 configuration];
  int v7 = [v6 showLoadingPlaceholderWhenEmpty];

  if (v7)
  {
    uint64_t v8 = [(PUPickerContainerController *)self photosViewController];
    char v9 = [v8 viewModelIfLoaded];

    if ([v9 showLoadingPlaceholderWhenEmpty]) {
      [v9 performChanges:&__block_literal_global_600];
    }
    id v10 = [(PUPickerContainerController *)self photosDataSourceManager];
    uint64_t v11 = [v10 filterPredicate];
    if (v11)
    {
      int v12 = (void *)v11;
      int v13 = [v10 filterPredicate];
      uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      int v15 = [v13 isEqual:v14];

      if (v15) {
        [v10 performChanges:&__block_literal_global_603];
      }
    }
  }
  [(PUPickerContainerController *)self setPickerSuggestionResultFetcherResult:v22];
  int v16 = [v22 selectedFilterableSuggestion];
  __int16 v17 = [(PUPickerContainerController *)self searchBar];
  double v18 = v17;
  if (v16)
  {
    [v17 updateContainerFromSuggestion:v22];
  }
  else
  {
    __int16 v19 = [(PUPickerContainerController *)self configuration];
    [v18 updateContainerFromPickerConfiguration:v19];
  }
  [(PUPickerContainerController *)self _updateAllowedUUIDs];
}

void __59__PUPickerContainerController__filterWithSuggestionResult___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a2;
  id v4 = [v2 set];
  [v3 setFilterPredicate:0 provideIncrementalChangeDetailsForAssetCollections:v4];
}

uint64_t __59__PUPickerContainerController__filterWithSuggestionResult___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShowLoadingPlaceholderWhenEmpty:0];
}

- (void)_showPhotosIndicatorBrieflyIfNeeded
{
  id v35 = [(PUPickerContainerController *)self configuration];
  if (([v35 shouldShowPhotosIndicator] & 1) == 0)
  {
LABEL_4:

    return;
  }
  id v3 = [(PUPickerContainerController *)self configuration];
  if ([v3 shouldShowOnboardingOverlayView])
  {

    goto LABEL_4;
  }
  id v4 = [(PUPickerContainerController *)self configuration];
  char v5 = [v4 shouldShowOnboardingHeaderView];

  if ((v5 & 1) == 0)
  {
    id v6 = [(PUPickerContainerController *)self configuration];
    [v6 performChanges:&__block_literal_global_595];

    int v7 = [(PUPickerContainerController *)self photosIndicator];
    [v7 removeFromSuperview];

    uint64_t v8 = [(PUPickerContainerController *)self view];
    char v9 = [(PUPickerContainerController *)self photosIndicator];
    [v8 addSubview:v9];

    id v10 = [(PUPickerContainerController *)self photosIndicator];
    uint64_t v11 = [v10 topAnchor];
    int v12 = [(PUPickerContainerController *)self view];
    int v13 = [v12 topAnchor];
    uint64_t v14 = [v11 constraintEqualToSystemSpacingBelowAnchor:v13 multiplier:1.0];
    [(PUPickerContainerController *)self setPhotosIndicatorTopConstraint:v14];

    int v15 = [(PUPickerContainerController *)self photosIndicator];
    int v16 = [v15 topAnchor];
    __int16 v17 = [(PUPickerContainerController *)self view];
    double v18 = [v17 safeAreaLayoutGuide];
    __int16 v19 = [v18 topAnchor];
    uint64_t v20 = [v16 constraintEqualToSystemSpacingBelowAnchor:v19 multiplier:1.0];
    [(PUPickerContainerController *)self setPhotosIndicatorTopSafeAreaConstraint:v20];

    __int16 v21 = [(PUPickerContainerController *)self photosIndicator];
    id v22 = [v21 leadingAnchor];
    uint64_t v23 = [(PUPickerContainerController *)self view];
    double v24 = [v23 leadingAnchor];
    char v25 = [v22 constraintEqualToSystemSpacingAfterAnchor:v24 multiplier:1.0];
    [(PUPickerContainerController *)self setPhotosIndicatorLeadingConstraint:v25];

    int v26 = [(PUPickerContainerController *)self photosIndicator];
    uint64_t v27 = [v26 leadingAnchor];
    __int16 v28 = [(PUPickerContainerController *)self view];
    BOOL v29 = [v28 safeAreaLayoutGuide];
    __int16 v30 = [v29 leadingAnchor];
    double v31 = [v27 constraintEqualToSystemSpacingAfterAnchor:v30 multiplier:1.0];
    [(PUPickerContainerController *)self setPhotosIndicatorLeadingSafeAreaConstraint:v31];

    uint64_t v32 = [(PUPickerContainerController *)self view];
    [v32 setNeedsUpdateConstraints];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PUPickerContainerController__showPhotosIndicatorBrieflyIfNeeded__block_invoke_2;
    aBlock[3] = &unk_1E5F2CEE8;
    aBlock[4] = self;
    double v33 = _Block_copy(aBlock);
    double v34 = [(PUPickerContainerController *)self photosIndicator];
    [v34 flipToPrivacyIconAndDismissAfterDelay:v33 completion:1.0];
  }
}

uint64_t __66__PUPickerContainerController__showPhotosIndicatorBrieflyIfNeeded__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosIndicator];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setPhotosIndicator:0];
  [*(id *)(a1 + 32) setPhotosIndicatorTopConstraint:0];
  [*(id *)(a1 + 32) setPhotosIndicatorTopSafeAreaConstraint:0];
  [*(id *)(a1 + 32) setPhotosIndicatorLeadingConstraint:0];
  id v3 = *(void **)(a1 + 32);
  return [v3 setPhotosIndicatorLeadingSafeAreaConstraint:0];
}

uint64_t __66__PUPickerContainerController__showPhotosIndicatorBrieflyIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDidShowPhotosIndicator:1];
}

- (id)_updateSelectionStatusBarButtonItem
{
  v115[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPickerContainerController *)self configuration];
  id v4 = [(PUPickerContainerController *)self peopleConfigController];
  int v5 = [v3 isPeoplePicker];
  int v6 = [v3 isPetsPicker];
  int v7 = [v3 isPeopleAndPetsPicker];
  if ([v3 isPeopleOrPetsPicker]) {
    int v8 = [v4 shouldActLikeSingleSelectPicker];
  }
  else {
    int v8 = 0;
  }
  if ([v3 isAlbumPicker]) {
    BOOL v9 = [v3 selectionLimit] == 1;
  }
  else {
    BOOL v9 = 0;
  }
  char v10 = [v3 isCollectionsPicker];
  uint64_t v11 = 0;
  if ((![(PUPickerContainerController *)self hasContent] | v8) & 1) != 0 || v9 || (v10) {
    goto LABEL_110;
  }
  if ([v3 isAddToAlbumPicker])
  {
    uint64_t v11 = 0;
    goto LABEL_110;
  }
  int v12 = [(PUPickerContainerController *)self selectionCoordinator];
  int v13 = [v12 selectedObjectIDs];
  uint64_t v14 = [v13 array];

  int v15 = [v3 generatedFilter];
  [v15 displayAssetMediaType];

  uint64_t v16 = [v14 count];
  if ([v3 isSingleSelection])
  {
    __int16 v17 = 0;
    goto LABEL_44;
  }
  if (v16 < 1)
  {
    if (!v7
      && !v6
      && !v5
      && ![v3 isAlbumPicker]
      && ![v3 isSharedAlbumPicker])
    {
      [v3 isCollectionsPicker];
    }
    uint64_t v22 = PXLocalizedString();
  }
  else
  {
    if (v7
      || v6
      || v5
      || [v3 isAlbumPicker]
      || [v3 isSharedAlbumPicker]
      || [v3 isCollectionsPicker])
    {
      double v18 = PXLocalizedString();
      uint64_t v86 = v16;
      uint64_t v19 = PXLocalizedStringWithValidatedFormat();
LABEL_37:
      __int16 v17 = (void *)v19;

      goto LABEL_44;
    }
    if ([v3 allowsOpeningStagingArea])
    {
      double v18 = PXLocalizedString();
      uint64_t v86 = v16;
      uint64_t v19 = PULocalizedStringWithValidatedFormat(v18, @"%lu");
      goto LABEL_37;
    }
    uint64_t v20 = [v3 generatedFilter];
    __int16 v21 = [v3 photoLibrary];
    [v20 displayAssetMediaTypeConsideringAssetObjectIDs:v14 photoLibrary:v21];

    uint64_t v22 = PXLocalizedSelectionMessageForAssetsCount();
  }
  __int16 v17 = (void *)v22;
LABEL_44:
  if (objc_msgSend(v3, "isLimitedLibraryPicker", v86))
  {
    [v3 hasPreselection];
    uint64_t v23 = v14;
    uint64_t v27 = PXLocalizedString();
LABEL_66:
    v102 = 0;
    goto LABEL_67;
  }
  double v24 = [(PUPickerContainerController *)self configuration];
  if ([v24 excludesOptionsMenu] && objc_msgSend(v3, "allowsDownscaling"))
  {

    if (v16 >= 1)
    {
      uint64_t v23 = v14;
      char v25 = [(PUPickerContainerController *)self resizeTaskDescriptorViewModel];
      uint64_t v26 = [v25 localizedFileSizeDescription];
LABEL_65:
      uint64_t v27 = (void *)v26;

      goto LABEL_66;
    }
  }
  else
  {
  }
  if ([v3 selectionLimit] > 1 && v16 >= 1 && v16 >= objc_msgSend(v3, "selectionLimit") - 10)
  {
    double v31 = [v3 generatedFilter];
    [v31 displayAssetMediaType];

    if ([v3 isAlbumPicker])
    {
      uint64_t v23 = v14;
    }
    else
    {
      uint64_t v23 = v14;
      if (![v3 isSharedAlbumPicker]) {
        [v3 isCollectionsPicker];
      }
    }
    char v25 = PXLocalizedString();
    uint64_t v87 = [v3 selectionLimit];
    uint64_t v26 = PULocalizedStringWithValidatedFormat(v25, @"%ld");
    goto LABEL_65;
  }
  if ([v3 excludesLocationMetadataSubtitle])
  {
    uint64_t v23 = v14;
    v102 = 0;
    uint64_t v27 = 0;
  }
  else
  {
    __int16 v28 = [(PUPickerContainerController *)self additionalSelectionState];
    int v29 = [v28 shouldIncludeLocation];

    uint64_t v23 = v14;
    uint64_t v27 = PXLocalizedString();
    if (v29) {
      __int16 v30 = @"location.fill";
    }
    else {
      __int16 v30 = @"location.slash";
    }
    v102 = [MEMORY[0x1E4FB1818] systemImageNamed:v30];
  }
LABEL_67:
  uint64_t v94 = v16;
  uint64_t v32 = self;
  double v33 = [(PUPickerContainerController *)self configuration];
  int v34 = [v33 excludeStagingSubtitle];

  id v35 = v4;
  char v36 = v23;
  if (v34)
  {

    v37 = 0;
  }
  else
  {
    v37 = v27;
  }
  if (v17) {
    id v38 = v17;
  }
  else {
    id v38 = v37;
  }
  if (v17) {
    double v39 = 0;
  }
  else {
    double v39 = v102;
  }
  if (v17) {
    double v40 = v37;
  }
  else {
    double v40 = 0;
  }
  if (v17) {
    BOOL v41 = v102;
  }
  else {
    BOOL v41 = 0;
  }
  v42 = v17;
  id v43 = v38;
  id v101 = v39;
  id v44 = v40;
  id v100 = v41;
  id v45 = v32;
  v105 = [(PUPickerContainerController *)v32 showSelectedButtonTitleButton];
  v104 = [(PUPickerContainerController *)v32 showSelectedButtonTitleLabel];
  uint64_t v46 = [(PUPickerContainerController *)v32 showSelectedButtonSubtitleLabel];
  v97 = v36;
  id v98 = v44;
  v103 = v43;
  v95 = v37;
  v96 = v42;
  v99 = (void *)v46;
  if (v43)
  {
    CGAffineTransform v47 = [(PUPickerContainerController *)v32 configuration];
    if ([v47 allowsOpeningStagingArea])
    {
      CGAffineTransform v48 = [v105 titleLabel];
      v92 = [v48 font];

      id v44 = v98;
    }
    else
    {
      v92 = [v104 font];
    }

    v90 = v35;
    if (v42)
    {
      CGAffineTransform v51 = v32;
      CGAffineTransform v54 = [(PUPickerContainerController *)v32 configuration];
      if ([v54 allowsOpeningStagingArea]) {
        [v105 titleColorForState:2 * (v94 < 1)];
      }
      else {
      CGAffineTransform v55 = [v104 textColor];
      }

      CGAffineTransform v49 = v99;
    }
    else
    {
      CGAffineTransform v49 = v99;
      CGAffineTransform v55 = [v99 textColor];
      CGAffineTransform v51 = v32;
    }
    uint64_t v56 = *MEMORY[0x1E4FB0700];
    v114[0] = *MEMORY[0x1E4FB06F8];
    v114[1] = v56;
    v115[0] = v92;
    v115[1] = v55;
    CGAffineTransform v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
    unint64_t v52 = 0x1E4F28000uLL;
    v58 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v103];
    objc_msgSend(v58, "addAttributes:range:", v57, 0, objc_msgSend(v103, "length"));
    if (v101)
    {
      uint64_t v59 = [v103 rangeOfString:@"{symbol}"];
      if (v59 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v61 = v59;
        v62 = (void *)MEMORY[0x1E4F28B18];
        uint64_t v88 = v60;
        v63 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v101];
        v64 = [v62 attributedStringWithAttachment:v63];
        v65 = (void *)[v64 mutableCopy];

        id v44 = v98;
        CGAffineTransform v49 = v99;
        objc_msgSend(v65, "addAttributes:range:", v57, 0, 1);
        objc_msgSend(v58, "replaceCharactersInRange:withAttributedString:", v61, v88, v65);
      }
    }
    uint64_t v50 = [v58 copy];

    id v4 = v90;
    char v36 = v97;
    if (v44)
    {
LABEL_99:
      v93 = v51;
      uint64_t v66 = [v49 font];
      v67 = [v49 textColor];
      uint64_t v68 = *MEMORY[0x1E4FB0700];
      v112[0] = *MEMORY[0x1E4FB06F8];
      v112[1] = v68;
      v69 = (void *)v66;
      v113[0] = v66;
      v113[1] = v67;
      v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:2];
      v71 = (void *)[objc_alloc(*(Class *)(v52 + 3656)) initWithString:v44];
      objc_msgSend(v71, "addAttributes:range:", v70, 0, objc_msgSend(v44, "length"));
      if (v100)
      {
        uint64_t v72 = [v44 rangeOfString:@"{symbol}"];
        if (v72 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v74 = v72;
          v75 = (void *)MEMORY[0x1E4F28B18];
          uint64_t v89 = v73;
          v76 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v100];
          v77 = [v75 attributedStringWithAttachment:v76];
          v91 = v4;
          v78 = (void *)[v77 mutableCopy];

          id v44 = v98;
          objc_msgSend(v78, "addAttributes:range:", v70, 0, 1);
          objc_msgSend(v71, "replaceCharactersInRange:withAttributedString:", v74, v89, v78);

          id v4 = v91;
        }
      }
      uint64_t v53 = [v71 copy];

      char v36 = v97;
      CGAffineTransform v49 = v99;
      CGAffineTransform v51 = v93;
      if (v50) {
        goto LABEL_103;
      }
      goto LABEL_87;
    }
  }
  else
  {
    CGAffineTransform v49 = (void *)v46;
    uint64_t v50 = 0;
    id v4 = v35;
    CGAffineTransform v51 = v45;
    unint64_t v52 = 0x1E4F28000;
    if (v44) {
      goto LABEL_99;
    }
  }
  uint64_t v53 = 0;
  if (v50)
  {
LABEL_103:
    v79 = [(PUPickerContainerController *)v51 configuration];
    int v80 = [v79 allowsOpeningStagingArea];

    v81 = (void *)MEMORY[0x1E4FB1EB0];
    if (v80)
    {
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __66__PUPickerContainerController__updateSelectionStatusBarButtonItem__block_invoke;
      v109[3] = &unk_1E5F2ECC8;
      id v82 = v105;
      id v110 = v82;
      id v111 = (id)v50;
      [v81 performWithoutAnimation:v109];
      [v82 setEnabled:v94 > 0];
      [v82 setHidden:0];
      [v104 setHidden:1];

      v83 = v110;
    }
    else
    {
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __66__PUPickerContainerController__updateSelectionStatusBarButtonItem__block_invoke_2;
      v106[3] = &unk_1E5F2ECC8;
      id v84 = v104;
      id v107 = v84;
      id v108 = (id)v50;
      [v81 performWithoutAnimation:v106];
      [v84 setHidden:0];
      [v105 setHidden:1];

      v83 = v107;
    }

    id v44 = v98;
    goto LABEL_107;
  }
LABEL_87:
  [v104 setHidden:1];
  [v105 setHidden:1];
LABEL_107:
  uint64_t v11 = (void *)(v50 | v53);
  [v49 setAttributedText:v53];
  [v49 setHidden:v53 == 0];
  if (v50 | v53)
  {
    uint64_t v11 = [(PUPickerContainerController *)v51 toolbarShowSelectedGroup];
  }

LABEL_110:
  return v11;
}

uint64_t __66__PUPickerContainerController__updateSelectionStatusBarButtonItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAttributedTitle:*(void *)(a1 + 40) forState:0];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __66__PUPickerContainerController__updateSelectionStatusBarButtonItem__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAttributedText:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (id)_confirmationBarButtonItemWithTraitCollection:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PUPickerContainerController *)self configuration];
  int v6 = [(PUPickerContainerController *)self configuration];
  char v7 = [v6 excludeConfirmationButton];

  if (v7) {
    goto LABEL_13;
  }
  int v8 = [(PUPickerContainerController *)self selectionCoordinator];
  BOOL v9 = [v8 selectedObjectIDs];
  uint64_t v10 = [v9 count];

  if (![(PUPickerContainerController *)self hasContent]) {
    goto LABEL_13;
  }
  uint64_t v11 = [v5 confirmationBehavior];
  if (v11)
  {
    if (v11 != 1 && v11 != 3) {
      goto LABEL_13;
    }
    uint64_t v28 = v10;
    if (![(PUPickerContainerController *)self replacesConfirmationButtonWithActivityIndicator])goto LABEL_10; {
LABEL_9:
    }
    int v12 = &stru_1F06BE7B8;
    goto LABEL_11;
  }
  uint64_t v28 = v10;
  if ([(PUPickerContainerController *)self replacesConfirmationButtonWithActivityIndicator])
  {
    goto LABEL_9;
  }
LABEL_10:
  PXLocalizedString();
  int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_13:
    __int16 v21 = 0;
    goto LABEL_14;
  }
LABEL_11:
  objc_initWeak(&location, self);
  int v13 = (void *)MEMORY[0x1E4FB13F0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__PUPickerContainerController__confirmationBarButtonItemWithTraitCollection___block_invoke;
  v30[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v31, &location);
  uint64_t v14 = [v13 actionWithTitle:v12 image:0 identifier:0 handler:v30];
  if ([v4 userInterfaceIdiom] == 5)
  {
    int v15 = [MEMORY[0x1E4FB14D8] tintedButtonConfiguration];
    [v15 setMacIdiomStyle:1];
    objc_msgSend(v15, "setShowsActivityIndicator:", -[PUPickerContainerController replacesConfirmationButtonWithActivityIndicator](self, "replacesConfirmationButtonWithActivityIndicator"));
    uint64_t v16 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:v14];
    __int16 v17 = [v16 widthAnchor];
    double v18 = [v17 constraintGreaterThanOrEqualToConstant:72.0];
    v33[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v16 addConstraints:v19];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];
LABEL_19:
    __int16 v21 = (void *)v20;

    goto LABEL_21;
  }
  if ([(PUPickerContainerController *)self replacesConfirmationButtonWithActivityIndicator])
  {
    int v15 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v15 setShowsActivityIndicator:1];
    uint64_t v16 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:v14];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];
    goto LABEL_19;
  }
  __int16 v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithPrimaryAction:v14];
LABEL_21:
  objc_msgSend(v21, "setStyle:", 2, v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  if (!v21) {
    goto LABEL_14;
  }
  unint64_t v23 = [v5 confirmationBehavior];
  if (v23 >= 2)
  {
    if (v23 != 3) {
      goto LABEL_32;
    }
    uint64_t v25 = 1;
  }
  else
  {
    BOOL v24 = ([v5 allowsUnlimitedMultipleSelection] & 1) != 0 || v29 <= objc_msgSend(v5, "selectionLimit");
    uint64_t v25 = v29 >= [v5 minimumSelectionLimit] && v24;
  }
  [v21 setEnabled:v25];
LABEL_32:
  if ([v21 isEnabled]) {
    uint64_t v26 = [(PUPickerContainerController *)self replacesConfirmationButtonWithActivityIndicator] ^ 1;
  }
  else {
    uint64_t v26 = 0;
  }
  [v21 setEnabled:v26];
  if ([v21 isEnabled])
  {
    unint64_t v27 = [v5 confirmationBehavior];
    if (v27 <= 4) {
      [v21 setAccessibilityIdentifier:off_1E5F2ADE0[v27]];
    }
  }
LABEL_14:

  return v21;
}

void __77__PUPickerContainerController__confirmationBarButtonItemWithTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained containerControllerActionHandler];
  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v3 sender];

  [v4 containerController:v5 didTapAddButton:v6];
}

- (id)_cancellationBarButtonItemWithTraitCollection:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInterfaceIdiom];
  int v6 = [(PUPickerContainerController *)self configuration];
  uint64_t v7 = [v6 cancellationBehaviorWithTraitCollection:v4];

  objc_initWeak(&location, self);
  switch(v7)
  {
    case 3:
      int v12 = (void *)MEMORY[0x1E4FB13F0];
      BOOL v9 = PXLocalizedString();
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      __int16 v30 = __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_3;
      id v31 = &unk_1E5F2E7A8;
      uint64_t v10 = &v32;
      objc_copyWeak(&v32, &location);
      uint64_t v11 = [v12 actionWithTitle:v9 image:0 identifier:0 handler:&v28];
      break;
    case 2:
      int v13 = (void *)MEMORY[0x1E4FB13F0];
      BOOL v9 = PXLocalizedString();
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      void v33[2] = __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_2;
      v33[3] = &unk_1E5F2E7A8;
      uint64_t v10 = &v34;
      objc_copyWeak(&v34, &location);
      uint64_t v11 = [v13 actionWithTitle:v9 image:0 identifier:0 handler:v33];
      break;
    case 1:
      int v8 = (void *)MEMORY[0x1E4FB13F0];
      BOOL v9 = PXLocalizedString();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke;
      v35[3] = &unk_1E5F2E7A8;
      uint64_t v10 = &v36;
      objc_copyWeak(&v36, &location);
      uint64_t v11 = [v8 actionWithTitle:v9 image:0 identifier:0 handler:v35];
      break;
    default:
      uint64_t v20 = 0;
      uint64_t v14 = 0;
      goto LABEL_26;
  }
  uint64_t v14 = (void *)v11;

  objc_destroyWeak(v10);
  if (!v14)
  {
    uint64_t v20 = 0;
    goto LABEL_26;
  }
  if (v5 == 5)
  {
    int v15 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v15 setMacIdiomStyle:1];
    uint64_t v16 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:v14];
    __int16 v17 = [v16 widthAnchor];
    double v18 = [v17 constraintGreaterThanOrEqualToConstant:72.0];
    v38[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [v16 addConstraints:v19];

    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];
    if (!v20) {
      goto LABEL_26;
    }
    goto LABEL_20;
  }
  if (v7 == 3)
  {
    id v21 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v22 = 24;
    goto LABEL_17;
  }
  if (v7 == 2)
  {
    id v21 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v22 = 1;
LABEL_17:
    uint64_t v23 = objc_msgSend(v21, "initWithBarButtonSystemItem:primaryAction:", v22, v14, v28, v29, v30, v31);
    goto LABEL_19;
  }
  uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithPrimaryAction:v14];
LABEL_19:
  uint64_t v20 = (void *)v23;
  if (!v23) {
    goto LABEL_26;
  }
LABEL_20:
  if (v7 == 3)
  {
    uint64_t v26 = @"Close";
  }
  else
  {
    if (v7 != 2)
    {
      BOOL v24 = [(PUPickerContainerController *)self selectionCoordinator];
      uint64_t v25 = [v24 selectedObjectIDs];
      objc_msgSend(v20, "setEnabled:", objc_msgSend(v25, "count") != 0);

      [v20 setAccessibilityIdentifier:@"Clear"];
      goto LABEL_26;
    }
    uint64_t v26 = @"Cancel";
  }
  objc_msgSend(v20, "setAccessibilityIdentifier:", v26, v28, v29, v30, v31);
  [v20 setEnabled:1];
LABEL_26:

  objc_destroyWeak(&location);
  return v20;
}

void __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained containerControllerActionHandler];
  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v3 sender];

  [v4 containerController:v5 didTapClearButton:v6];
}

void __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained containerControllerActionHandler];
  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v3 sender];

  [v4 containerController:v5 didTapCancelButton:v6];
}

void __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained containerControllerActionHandler];
  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v3 sender];

  [v4 containerController:v5 didTapAddButton:v6];
}

- (void)_updateToolbar
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPickerContainerController *)self configuration];
  int v45 = [v3 useSystemBackgroundColorBar];

  id v4 = [(PUPickerContainerController *)self childViewControllers];
  uint64_t v5 = [(PUPickerContainerController *)self itemsViewController];
  int v6 = [v4 containsObject:v5];

  uint64_t v7 = [(PUPickerContainerController *)self configuration];
  LOBYTE(v5) = [v7 excludesSortAndFilterMenu];

  uint64_t v8 = 0;
  if ((v5 & 1) == 0 && v6)
  {
    uint64_t v8 = [(PUPickerContainerController *)self toolbarSortAndFilterBarButtonItem];
  }
  BOOL v9 = [(PUPickerContainerController *)self configuration];
  if ([v9 excludesOptionsMenu])
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [(PUPickerContainerController *)self toolbarOptionsBarButton];
  }

  uint64_t v11 = [(PUPickerContainerController *)self traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 5)
  {
    int v13 = [(PUPickerContainerController *)self traitCollection];
    uint64_t v14 = [(PUPickerContainerController *)self _cancellationBarButtonItemWithTraitCollection:v13];

    int v15 = [(PUPickerContainerController *)self traitCollection];
    uint64_t v16 = [(PUPickerContainerController *)self _confirmationBarButtonItemWithTraitCollection:v15];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v17 = [(PUPickerContainerController *)self _updateSelectionStatusBarButtonItem];
  uint64_t v46 = (void *)v16;
  uint64_t v18 = v14 | v16;
  uint64_t v19 = [(PUPickerContainerController *)self configuration];
  int v20 = [v19 allowsToolbar];
  if (v17 | v18 | v8 | v10) {
    int v21 = v20;
  }
  else {
    int v21 = 0;
  }
  int v47 = v21;

  uint64_t v22 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = v23;
  if (v8) {
    [v23 addObject:v8];
  }
  if (v18 && v10) {
    [v25 addObject:v10];
  }
  if (v17)
  {
    [v25 addObject:v22];
    [v25 addObject:v17];
    [v25 addObject:v22];
  }
  id v44 = (void *)v14;
  if (v18)
  {
    if (v8 && !v17) {
      [v25 addObject:v22];
    }
    if (v14)
    {
      [v25 addObject:v14];
      if (!v46) {
        goto LABEL_33;
      }
      uint64_t v26 = [MEMORY[0x1E4FB14A8] fixedSpaceItemOfWidth:8.0];
      [v25 addObject:v26];

      BOOL v24 = v46;
    }
    else
    {
      BOOL v24 = v46;
      if (!v46) {
        goto LABEL_33;
      }
    }
  }
  else
  {
    if (!v10) {
      goto LABEL_33;
    }
    BOOL v24 = (void *)v10;
    if (v8)
    {
      BOOL v24 = (void *)v10;
      if (!v17)
      {
        [v25 addObject:v22];
        BOOL v24 = (void *)v10;
      }
    }
  }
  [v25 addObject:v24];
LABEL_33:
  id v43 = (void *)v22;
  unint64_t v27 = objc_msgSend(v25, "copy", v24);
  uint64_t v28 = [(PUPickerContainerController *)self albumsViewControllerIfLoaded];
  uint64_t v29 = objc_msgSend(v28, "px_barAppearance");
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __45__PUPickerContainerController__updateToolbar__block_invoke;
  v52[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
  char v53 = v47;
  [v29 performChangesWithAnimationOptions:0 changes:v52];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  __int16 v30 = [(PUPickerContainerController *)self navigationController];
  id v31 = [v30 viewControllers];

  uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * i) setToolbarItems:v27];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v33);
  }

  id v36 = [(PUPickerContainerController *)self navigationController];
  [v36 setToolbarHidden:v47 ^ 1u animated:0];

  if (v45)
  {
    v37 = [(PUPickerContainerController *)self navigationController];
    char v38 = [v37 isToolbarHidden];

    if ((v38 & 1) == 0)
    {
      id v39 = objc_alloc_init(MEMORY[0x1E4FB1DF8]);
      [v39 configureWithOpaqueBackground];
      double v40 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [v39 setBackgroundColor:v40];

      BOOL v41 = [(PUPickerContainerController *)self navigationController];
      v42 = [v41 toolbar];

      [v42 setScrollEdgeAppearance:v39];
      [v42 setStandardAppearance:v39];
      [v42 setCompactAppearance:v39];
      [v42 setCompactScrollEdgeAppearance:v39];
    }
  }
}

void __45__PUPickerContainerController__updateToolbar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 32);
  id v3 = a2;
  [v3 setPrefersToolbarVisible:v2];
  [v3 setPrefersTabBarVisible:0];
}

- (void)_updateNavigationBar
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPickerContainerController *)self configuration];
  id v4 = [(PUPickerContainerController *)self sidebarViewController];

  uint64_t v5 = [(PUPickerContainerController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  uint64_t v7 = [(PUPickerContainerController *)self childViewControllers];
  uint64_t v8 = [(PUPickerContainerController *)self photosViewController];
  int v9 = [v7 containsObject:v8];

  int v10 = 0;
  if ([(PUPickerContainerController *)self hasContent] && v9) {
    int v10 = [v3 allowsSearchBar];
  }
  int v11 = 0;
  if ([(PUPickerContainerController *)self hasContent] && !v4) {
    int v11 = [v3 allowsSegmentedControl];
  }
  if (v9)
  {
    uint64_t v12 = [v3 suggestionGroup];
    BOOL v61 = v12 != 0;
  }
  else
  {
    BOOL v61 = 0;
  }
  int v13 = [(PUPickerContainerController *)self configuration];
  int v63 = [v13 useSystemBackgroundColorBar];

  if (v6 == 5 && ([v3 allowsToolbar] & 1) != 0)
  {
    v67 = 0;
    uint64_t v14 = 0;
    if (v11) {
      goto LABEL_18;
    }
LABEL_16:
    uint64_t v66 = 0;
    goto LABEL_19;
  }
  int v15 = [(PUPickerContainerController *)self traitCollection];
  v67 = [(PUPickerContainerController *)self _cancellationBarButtonItemWithTraitCollection:v15];

  uint64_t v16 = [(PUPickerContainerController *)self configuration];
  int v17 = [v16 isAddToAlbumPicker];

  if (v17)
  {
    uint64_t v14 = [(PUPickerContainerController *)self toolbarNewAlbumBarButton];
    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v18 = [(PUPickerContainerController *)self traitCollection];
    uint64_t v14 = [(PUPickerContainerController *)self _confirmationBarButtonItemWithTraitCollection:v18];

    if (!v11) {
      goto LABEL_16;
    }
  }
LABEL_18:
  uint64_t v66 = [(PUPickerContainerController *)self navigationBarSegmentedControl];
LABEL_19:
  v64 = v3;
  int v19 = [v3 allowsNavigationBar];
  int v20 = [(PUPickerContainerController *)self sidebarViewController];
  int v21 = [v20 navigationController];
  v65 = [v21 navigationBar];

  uint64_t v22 = [(PUPickerContainerController *)self navigationController];
  id v23 = [v22 navigationBar];

  BOOL v24 = [(PUPickerContainerController *)self sidebarViewController];
  uint64_t v25 = [v24 navigationItem];

  uint64_t v26 = [(PUPickerContainerController *)self navigationItem];
  unint64_t v27 = [(PUPickerContainerController *)self configuration];
  char v28 = [v27 supportsInteractiveBarTransition];

  if ((v28 & 1) == 0) {
    [v23 setHidden:v19 ^ 1u];
  }
  uint64_t v29 = [(PUPickerContainerController *)self childViewControllers];
  __int16 v30 = [v29 firstObject];
  id v31 = [v30 title];
  [(PUPickerContainerController *)self setTitle:v31];

  [v25 setLeftBarButtonItem:v67];
  uint64_t v32 = [v25 leftBarButtonItem];
  if (v32)
  {
    [v65 setHidden:0];
  }
  else
  {
    uint64_t v33 = [v25 rightBarButtonItem];
    [v65 setHidden:v33 == 0];
  }
  if (v25) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = v67;
  }
  [v26 setLeftBarButtonItem:v34];
  [v26 setTitleView:v66];
  if ([(PUPickerContainerController *)self _isConfiguredForRetailExperience])
  {
    id v35 = PXLocalizedString();
    id v36 = [(PUPickerContainerController *)self configuration];
    uint64_t v60 = [v36 selectionLimit];
    v37 = PXLocalizedStringWithValidatedFormat();
    objc_msgSend(v26, "setPrompt:", v37, v60);
  }
  char v38 = [(PUPickerContainerController *)self searchBar];
  [v38 setHidden:v10 ^ 1u];

  v62 = v26;
  if (v10)
  {
    int v39 = 1;
    BOOL v40 = v61;
  }
  else
  {
    BOOL v41 = [(PUPickerContainerController *)self searchBar];
    [v41 updateIsEditing:0];

    BOOL v40 = v61;
    int v39 = v61;
  }
  uint64_t v42 = v9 ^ 1u;
  BOOL v43 = !v40;
  id v44 = [(PUPickerContainerController *)self pickerSuggestionsView];
  [v44 setHidden:v43];

  int v45 = [(PUPickerContainerController *)self navigationBarBottomPalette];
  [v45 setHidden:v39 ^ 1u];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v46 = [(PUPickerContainerController *)self navigationController];
  int v47 = [v46 viewControllers];

  uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v69 != v50) {
          objc_enumerationMutation(v47);
        }
        unint64_t v52 = [*(id *)(*((void *)&v68 + 1) + 8 * i) navigationItem];
        [v52 setRightBarButtonItem:v14];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v49);
  }

  char v53 = [(PUPickerContainerController *)self navigationBarSegmentedControl];
  [v53 setSelectedSegmentIndex:v42];

  CGAffineTransform v54 = [(PUPickerContainerController *)self pickerSuggestionsView];
  if (v54)
  {
    uint64_t v55 = [(PUPickerContainerController *)self pickerSuggestionsView];
    int v56 = [v55 isHidden] ^ 1;
  }
  else
  {
    int v56 = 0;
  }

  if ((v56 | v63) == 1)
  {
    id v57 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    v58 = v57;
    if (v63)
    {
      [v57 configureWithOpaqueBackground];
      uint64_t v59 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [v58 setBackgroundColor:v59];
    }
    else if (v56)
    {
      [v57 configureWithDefaultBackground];
    }
    [v23 setStandardAppearance:v58];
    [v23 setCompactAppearance:v58];
    [v23 setCompactScrollEdgeAppearance:v58];
  }
  else
  {
    v58 = 0;
  }
  [v23 setScrollEdgeAppearance:v58];
}

- (void)_updateNumberOfItemsToPlayInline
{
  id v3 = [(PUPickerContainerController *)self configuration];
  if ([v3 shouldDisableInlinePlayback])
  {
    uint64_t v4 = 0;
  }
  else
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

    if (IsReduceMotionEnabled)
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    if ([(PUPickerContainerController *)self _isConfiguredForStickerSuggestionGroup])
    {
      uint64_t v4 = 3;
      goto LABEL_9;
    }
    id v3 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
    uint64_t v4 = [v3 numberOfItemsToPlayInline];
  }

LABEL_9:
  id v7 = [(PUPickerContainerController *)self photosViewController];
  uint64_t v6 = [v7 contentController];
  [v6 setNumberOfItemsToPlayInline:v4];
}

- (void)_updatePeopleSort
{
  int64_t v3 = [(PUPickerContainerController *)self peopleSortOrderType];
  if (v3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3 == 1;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F90428];
  id v7 = [(PUPickerContainerController *)self configuration];
  uint64_t v6 = [v7 photoLibrary];
  [v5 setSortOrder:v4 toPhotoLibrary:v6];
}

- (void)_updateSortDescriptors
{
  v25[5] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PUPickerContainerController *)self photosDataSourceManager];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;

    if (v4)
    {
      if ([(PUPickerContainerController *)self isShowingLiveWallpaperSuggestions])
      {
        uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mediaAnalysisAttributes.activityScore" ascending:1];
        v25[0] = v5;
        uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mediaAnalysisAttributes.wallpaperScore" ascending:1];
        v25[1] = v6;
        id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"favorite" ascending:1];
        v25[2] = v7;
        uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
        v25[3] = v8;
        int v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
        v25[4] = v9;
        int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
        int v11 = [v4 photosDataSource];
        [v11 setSortDescriptors:v10];
      }
      else
      {
        uint64_t v14 = [(PUPickerContainerController *)self configuration];
        int v15 = [v14 showsWallpaperSuggestions];

        if (v15)
        {
          uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
          v24[0] = v5;
          uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
          v24[1] = v6;
          id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
          v24[2] = v7;
          uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
          int v17 = v24;
        }
        else
        {
          uint64_t v18 = [(PUPickerContainerController *)self configuration];
          int v19 = [v18 customSortDescriptors];

          if (v19)
          {
            uint64_t v5 = [(PUPickerContainerController *)self configuration];
            uint64_t v6 = [v5 customSortDescriptors];
            id v7 = [v4 photosDataSource];
            [v7 setSortDescriptors:v6];
            goto LABEL_16;
          }
          if ([(PUPickerContainerController *)self assetSortOrderType] != 1)
          {
            uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
            v22[0] = v5;
            uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
            v22[1] = v6;
            id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
            uint64_t v8 = [v4 photosDataSource];
            [v8 setSortDescriptors:v7];
            goto LABEL_15;
          }
          uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
          v23[0] = v5;
          uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
          v23[1] = v6;
          id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
          v23[2] = v7;
          uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
          int v17 = v23;
        }
        uint64_t v8 = [v16 arrayWithObjects:v17 count:3];
        int v9 = [v4 photosDataSource];
        [v9 setSortDescriptors:v8];
      }

LABEL_15:
LABEL_16:

      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v12 = PLPickerGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412290;
    uint64_t v21 = 0;
    _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Can't update sort descriptors because the data source manager (%@) is not PhotoKit based.", (uint8_t *)&v20, 0xCu);
  }

  id v4 = 0;
LABEL_10:
  int v13 = [(PUPickerContainerController *)self photosViewController];
  [v13 invalidateHeaderView];
}

- (void)_updateSortOrder
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PUPickerContainerController *)self photosDataSourceManager];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;

    if (v4)
    {
      uint64_t v5 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
      int v6 = [v5 shouldReverseSortOrder];

      id v7 = [v4 photosDataSource];
      [v7 setReverseSortOrder:v6 == 0];

      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v8 = PLPickerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    uint64_t v10 = 0;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Can't update sort order because the data source manager (%@) is not PhotoKit based.", (uint8_t *)&v9, 0xCu);
  }

  id v4 = 0;
LABEL_9:
}

- (void)_updatePhotosViewControllerNoContentPlaceholder
{
  int64_t v3 = [(PUPickerContainerController *)self searchResultUUIDs];

  if (v3)
  {
    id v4 = PXLocalizedString();
  }
  else
  {
    int v6 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
    int v7 = [v6 selectedFilterableSuggestion];

    if (!v7
      || ([(PUPickerContainerController *)self configuration],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isProcessingSuggestions],
          v8,
          !v9))
    {
      uint64_t v5 = 0;
      id v4 = 0;
      goto LABEL_9;
    }
    id v4 = PXLocalizedString();
    uint64_t v10 = [(PUPickerContainerController *)self configuration];
    uint64_t v11 = [v10 suggestionGroup];
    char v12 = [v11 isForWallpaper];

    if ((v12 & 1) == 0)
    {
      int v17 = [(PUPickerContainerController *)self configuration];
      uint64_t v18 = [v17 generatedFilter];
      int v19 = [v18 containsStickersFilter];

      if (!v19)
      {
        uint64_t v5 = 0;
        goto LABEL_9;
      }
    }
  }
  uint64_t v5 = PXLocalizedString();
LABEL_9:
  int v13 = [(PUPickerContainerController *)self photosViewController];
  uint64_t v14 = [v13 viewModelIfLoaded];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__PUPickerContainerController__updatePhotosViewControllerNoContentPlaceholder__block_invoke;
  _OWORD v20[3] = &unk_1E5F2AD18;
  id v21 = v4;
  id v22 = v5;
  id v15 = v5;
  id v16 = v4;
  [v14 performChanges:v20];
}

void __78__PUPickerContainerController__updatePhotosViewControllerNoContentPlaceholder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setNoContentPlaceholderFallbackTitle:v3];
  [v4 setNoContentPlaceholderFallbackMessage:*(void *)(a1 + 40)];
}

- (void)_updateAllowedUUIDs
{
  id v3 = [(PUPickerContainerController *)self searchResultUUIDs];
  if (!v3)
  {
    id v4 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
    uint64_t v5 = [v4 fetchResult];

    if (!v5)
    {
      id v3 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = PXMap();
    int v7 = (void *)v6;
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    id v3 = v8;
  }
  [(PUPickerContainerController *)self _updatePhotosViewControllerNoContentPlaceholder];
LABEL_7:
  int v9 = [(PUPickerContainerController *)self photosDataSourceManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PUPickerContainerController__updateAllowedUUIDs__block_invoke_2;
  v12[3] = &unk_1E5F2ACF0;
  id v13 = v3;
  id v10 = v3;
  [v9 performChanges:v12];

  [(PUPickerContainerController *)self _updateSortOrder];
  [(PUPickerContainerController *)self _updateSortDescriptors];
  [(PUPickerContainerController *)self _updateNumberOfItemsToPlayInline];
  [(PUPickerContainerController *)self _updateNavigationBar];
  uint64_t v11 = [(PUPickerContainerController *)self photosViewController];
  objc_msgSend(v11, "pu_scrollToInitialPositionAnimated:", 0);
}

void __50__PUPickerContainerController__updateAllowedUUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v4 = a2;
    id v5 = [v3 setWithArray:v2];
    objc_msgSend(v4, "setAllowedUUIDs:");
  }
  else
  {
    id v5 = a2;
    [v5 setAllowedUUIDs:0];
  }
}

uint64_t __50__PUPickerContainerController__updateAllowedUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)_performPhotosGridActionIfPossible:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUPickerContainerController *)self lastVisiblePhotosViewController];
  uint64_t v6 = [v5 viewModel];
  int v7 = [v6 gridActionManager];

  if ([v7 canPerformActionType:v4])
  {
    uint64_t v8 = [v7 actionPerformerForActionType:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PUPickerContainerController__performPhotosGridActionIfPossible___block_invoke;
    v10[3] = &unk_1E5F2E3B8;
    uint64_t v11 = v4;
    [v8 performActionWithCompletionHandler:v10];

    int v9 = v11;
  }
  else
  {
    int v9 = PLPickerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Can't perform action type %@", buf, 0xCu);
    }
  }
}

void __66__PUPickerContainerController__performPhotosGridActionIfPossible___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLPickerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"NO";
    if (a2) {
      uint64_t v8 = @"YES";
    }
    int v9 = v8;
    int v10 = 138412802;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Finished action %@ with success %@ and error %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)_addOrReplaceItemViewControllerWithViewController:(id)a3
{
  id v33 = a3;
  [(PUPickerContainerController *)self px_addOrReplaceChildViewController:v33 activateConstraints:0];
  id v4 = [(PUPickerContainerController *)self view];
  id v5 = [v33 view];
  uint64_t v6 = [(PUPickerContainerController *)self traitCollection];
  if ([v6 userInterfaceIdiom] == 6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [v4 safeAreaLayoutGuide];
      int v9 = [v8 topAnchor];
      int v10 = [v5 topAnchor];
      uint64_t v11 = [v9 constraintEqualToAnchor:v10];
      [(PUPickerContainerController *)self setTopConstraint:v11];

      __int16 v12 = [v4 safeAreaLayoutGuide];
      id v13 = [v12 bottomAnchor];
      __int16 v14 = [v5 bottomAnchor];
      id v15 = [v13 constraintEqualToAnchor:v14];
      [(PUPickerContainerController *)self setBottomConstraint:v15];

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v16 = [v4 topAnchor];
  int v17 = [v5 topAnchor];
  uint64_t v18 = [v16 constraintEqualToAnchor:v17];
  [(PUPickerContainerController *)self setTopConstraint:v18];

  __int16 v12 = [v4 bottomAnchor];
  id v13 = [v5 bottomAnchor];
  __int16 v14 = [v12 constraintEqualToAnchor:v13];
  [(PUPickerContainerController *)self setBottomConstraint:v14];
LABEL_6:

  int v19 = [v4 leadingAnchor];
  int v20 = [v5 leadingAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];
  [(PUPickerContainerController *)self setLeadingConstraint:v21];

  id v22 = [v4 trailingAnchor];
  id v23 = [v5 trailingAnchor];
  BOOL v24 = [v22 constraintEqualToAnchor:v23];
  [(PUPickerContainerController *)self setTrailingConstraint:v24];

  uint64_t v25 = [v4 safeAreaLayoutGuide];
  uint64_t v26 = [v25 topAnchor];
  unint64_t v27 = [v5 topAnchor];
  char v28 = [v26 constraintEqualToAnchor:v27];
  [(PUPickerContainerController *)self setTopSafeAreaConstraint:v28];

  uint64_t v29 = [v4 safeAreaLayoutGuide];
  __int16 v30 = [v29 bottomAnchor];
  id v31 = [v5 bottomAnchor];
  uint64_t v32 = [v30 constraintEqualToAnchor:v31];
  [(PUPickerContainerController *)self setBottomSafeAreaConstraint:v32];

  [v4 setNeedsUpdateConstraints];
  [(PUPickerContainerController *)self _updateLastVisiblePhotosViewController:v33];
}

- (UIViewController)itemsViewController
{
  id v3 = [(PUPickerContainerController *)self unavailableViewController];

  if (v3)
  {
    uint64_t v4 = [(PUPickerContainerController *)self unavailableViewController];
  }
  else
  {
    id v5 = [(PUPickerContainerController *)self configuration];
    int v6 = [v5 isPeopleOrPetsPicker];

    if (v6)
    {
      uint64_t v7 = [(PUPickerContainerController *)self peopleConfigController];
      uint64_t v8 = [v7 currentViewController];

      goto LABEL_7;
    }
    uint64_t v4 = [(PUPickerContainerController *)self photosViewController];
  }
  uint64_t v8 = (void *)v4;
LABEL_7:
  return (UIViewController *)v8;
}

- (BOOL)searchBarIsFirstResponder
{
  id v3 = [(PUPickerContainerController *)self searchBar];
  if (v3)
  {
    uint64_t v4 = [(PUPickerContainerController *)self firstResponder];
    if (v4)
    {
      id v5 = [(PUPickerContainerController *)self searchBar];
      int v6 = [(PUPickerContainerController *)self firstResponder];
      char v7 = [v5 _containsResponder:v6];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)photosGridActionPerformer:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5 = a4;
  int v6 = [(PUPickerContainerController *)self photosViewController];
  char v7 = [v6 viewModel];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PUPickerContainerController_photosGridActionPerformer_contentFilterStateChanged___block_invoke;
  v9[3] = &unk_1E5F2ACA8;
  id v10 = v5;
  id v8 = v5;
  [v7 performChanges:v9];
}

uint64_t __83__PUPickerContainerController_photosGridActionPerformer_contentFilterStateChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentFilterState:*(void *)(a1 + 32)];
}

- (UIViewController)collectionsViewController
{
  if (!self->_collectionsViewController)
  {
    uint64_t v4 = [(PUPickerContainerController *)self photosViewConfiguration];
    if (v4)
    {
      id v5 = (void *)v4;
      uint64_t v6 = [(PUPickerContainerController *)self sessionInfo];
      if (!v6)
      {
LABEL_8:

        goto LABEL_9;
      }
      char v7 = (void *)v6;
      id v8 = [(PUPickerContainerController *)self configuration];
      uint64_t v9 = [v8 sourceType];

      if (v9 != 5) {
        goto LABEL_9;
      }
      id v5 = [(PUPickerContainerController *)self configuration];
      id v10 = [(PUPickerContainerController *)self sessionInfo];
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_7:
          uint64_t v11 = [(PUPickerContainerController *)self photosViewConfiguration];
          [(PUPickerContainerController *)self _setupCollectionsViewControllerWithPickerConfiguration:v5 sessionInfo:v10 photosViewConfiguration:v11];

          goto LABEL_8;
        }
        __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
        int v17 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v17);
        uint64_t v18 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
        [v14 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 988, @"%@ should be an instance inheriting from %@, but it is %@", @"self.sessionInfo", v16, v18 object file lineNumber description];
      }
      else
      {
        __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
        id v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        [v14 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 988, @"%@ should be an instance inheriting from %@, but it is nil", @"self.sessionInfo", v16 object file lineNumber description];
      }

      goto LABEL_7;
    }
  }
LABEL_9:
  collectionsViewController = self->_collectionsViewController;
  return collectionsViewController;
}

- (id)albumsViewControllerIfLoaded
{
  return self->_albumsViewController;
}

- (UIViewController)albumsViewController
{
  if (!self->_albumsViewController)
  {
    uint64_t v6 = [(PUPickerContainerController *)self photosViewConfiguration];
    if (v6)
    {
      char v7 = (void *)v6;
      id v8 = [(PUPickerContainerController *)self sessionInfo];

      if (v8)
      {
        uint64_t v9 = [(PUPickerContainerController *)self configuration];
        id v10 = [(PUPickerContainerController *)self photosViewConfiguration];
        uint64_t v11 = [v10 loadingStatusManager];
        __int16 v12 = [(PUPickerContainerController *)self selectionCoordinator];
        id v13 = [(PUPickerContainerController *)self sessionInfo];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_9:
            __int16 v14 = [(PUPickerContainerController *)self photosViewConfiguration];
            [(PUPickerContainerController *)self _setupAlbumsViewControllerWithPickerConfiguration:v9 loadingStatusManager:v11 selectionCoordinator:v12 sessionInfo:v13 photosViewConfiguration:v14];

            [(PUPickerContainerController *)self updateBars];
            goto LABEL_2;
          }
          id v15 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v18 = (objc_class *)objc_opt_class();
          int v17 = NSStringFromClass(v18);
          int v19 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
          [v15 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 973, @"%@ should be an instance inheriting from %@, but it is %@", @"self.sessionInfo", v17, v19 object file lineNumber description];
        }
        else
        {
          id v15 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v16 = (objc_class *)objc_opt_class();
          int v17 = NSStringFromClass(v16);
          [v15 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 973, @"%@ should be an instance inheriting from %@, but it is nil", @"self.sessionInfo", v17 object file lineNumber description];
        }

        goto LABEL_9;
      }
    }
  }
LABEL_2:
  albumsViewController = self->_albumsViewController;
  return albumsViewController;
}

- (PUPickerOnboardingHeaderView)onboardingHeaderView
{
  if (!self->_onboardingHeaderView)
  {
    id v3 = [(PUPickerContainerController *)self configuration];
    int v4 = [v3 shouldShowOnboardingHeaderView];

    if (v4)
    {
      objc_initWeak(&location, self);
      id v5 = [PUPickerOnboardingHeaderView alloc];
      uint64_t v6 = [(PUPickerContainerController *)self configuration];
      char v7 = [v6 pickerClientDisplayName];
      id v8 = [(PUPickerContainerController *)self configuration];
      uint64_t v9 = [v8 isLimitedLibraryPicker];
      id v10 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __51__PUPickerContainerController_onboardingHeaderView__block_invoke;
      int v19 = &unk_1E5F2E7A8;
      objc_copyWeak(&v20, &location);
      uint64_t v11 = [v10 actionWithHandler:&v16];
      __int16 v12 = -[PUPickerOnboardingHeaderView initWithClientDisplayName:isLimitedLibraryPicker:closeAction:](v5, "initWithClientDisplayName:isLimitedLibraryPicker:closeAction:", v7, v9, v11, v16, v17, v18, v19);
      onboardingHeaderView = self->_onboardingHeaderView;
      self->_onboardingHeaderView = v12;

      [(PUPickerOnboardingHeaderView *)self->_onboardingHeaderView setDelegate:self];
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  __int16 v14 = self->_onboardingHeaderView;
  return v14;
}

void __51__PUPickerContainerController_onboardingHeaderView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained configuration];
  [v1 performChanges:&__block_literal_global_393];
}

uint64_t __51__PUPickerContainerController_onboardingHeaderView__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDidDismissOnboardingHeaderView:1];
}

- (PUPickerPrivacyBadge)photosIndicator
{
  if (!self->_photosIndicator)
  {
    id v3 = [(PUPickerContainerController *)self configuration];
    int v4 = [v3 shouldShowPhotosIndicator];

    if (v4)
    {
      id v5 = objc_alloc_init(PUPickerPrivacyBadge);
      [(PUPickerPrivacyBadge *)v5 setUserInteractionEnabled:0];
      photosIndicator = self->_photosIndicator;
      self->_photosIndicator = v5;
      char v7 = v5;

      [(PUPickerPrivacyBadge *)self->_photosIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    }
  }
  id v8 = self->_photosIndicator;
  return v8;
}

- (void)zoomOutContent
{
}

- (void)zoomInContent
{
}

- (void)scrollContentToInitialPosition
{
  id v2 = [(PUPickerContainerController *)self lastVisiblePhotosViewController];
  objc_msgSend(v2, "pu_scrollToInitialPositionAnimated:", 1);
}

- (void)setSidebarViewController:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerContainerController.m", 903, @"%s must be called on the main thread", "-[PUPickerContainerController setSidebarViewController:]");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidebarViewController);

  if (WeakRetained != v5)
  {
    objc_storeWeak((id *)&self->_sidebarViewController, v5);
    [(PUPickerContainerController *)self updateBars];
    char v7 = [(PUPickerContainerController *)self navigationController];
    id v8 = [v7 topViewController];
    uint64_t v9 = objc_msgSend(v8, "px_navigationDestination");

    [v5 selectItemForDestination:v9];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PUPickerContainerController_setSidebarViewController___block_invoke;
    v11[3] = &unk_1E5F2AC80;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    [(PUPickerContainerController *)self navigateToDestination:v9 options:0 completionHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __56__PUPickerContainerController_setSidebarViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 == 1
    || ([*(id *)(a1 + 32) configuration],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 sourceType],
        v6,
        v7))
  {
    id v8 = PLPickerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      uint64_t v12 = a2;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Completed content view navigation with result: %ld (error: %@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithType:21 revealMode:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained navigateToDestination:v9 options:0 completionHandler:&__block_literal_global_388];
  }
}

void __56__PUPickerContainerController_setSidebarViewController___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPickerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Completed fallback content view navigation with result: %ld (error: %@)", (uint8_t *)&v6, 0x16u);
  }
}

- (NSString)selectedSuggestionAnalyticsName
{
  id v2 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
  id v3 = [v2 analyticsName];

  return (NSString *)v3;
}

- (BOOL)isShowingLiveWallpaperSuggestions
{
  id v3 = [(PUPickerContainerController *)self childViewControllers];
  id v4 = [(PUPickerContainerController *)self photosViewController];
  if ([v3 containsObject:v4])
  {
    id v5 = [(PUPickerContainerController *)self configuration];
    if ([v5 showsWallpaperSuggestions])
    {
      int v6 = [(PUPickerContainerController *)self pickerSuggestionResultFetcherResult];
      char v7 = [v6 isLiveWallpaperSuggestion];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasContent
{
  id v3 = [(PUPickerContainerController *)self photosViewController];

  if (v3)
  {
    id v4 = [(PUPickerContainerController *)self photosDataSourceManager];
    id v5 = [v4 dataSource];
    if ([v5 containsAnyItems])
    {
      char v6 = 1;
    }
    else
    {
      id v9 = [(PUPickerContainerController *)self photosDataSourceManager];
      uint64_t v10 = [v9 dataSource];
      char v6 = [v10 isFiltered];
    }
    goto LABEL_13;
  }
  char v7 = [(PUPickerContainerController *)self peopleConfigController];
  char v8 = [v7 hasContent];

  if ((v8 & 1) == 0)
  {
    int v11 = [(PUPickerContainerController *)self configuration];
    if ([v11 sourceType] == 2)
    {
    }
    else
    {
      uint64_t v12 = [(PUPickerContainerController *)self configuration];
      uint64_t v13 = [v12 sourceType];

      if (v13 != 6)
      {
        uint64_t v16 = [(PUPickerContainerController *)self configuration];
        uint64_t v17 = [v16 sourceType];

        if (v17 != 5) {
          return 0;
        }
        uint64_t v14 = [(PUPickerContainerController *)self collectionsViewController];
        goto LABEL_12;
      }
    }
    uint64_t v14 = [(PUPickerContainerController *)self albumsViewController];
LABEL_12:
    id v4 = (void *)v14;
    char v6 = v14 != 0;
LABEL_13:

    return v6;
  }
  return 1;
}

- (void)resignSearchBarAsFirstResponder
{
  if ([(PUPickerContainerController *)self searchBarIsFirstResponder])
  {
    id v3 = [(PUPickerContainerController *)self firstResponder];
    [v3 resignFirstResponder];
  }
}

- (void)makeSearchBarAsFirstResponder
{
  id v3 = [(PUPickerContainerController *)self configuration];
  int v4 = [v3 allowsSearchBar];

  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithType:21 revealMode:0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PUPickerContainerController_makeSearchBarAsFirstResponder__block_invoke;
    v6[3] = &unk_1E5F2AC38;
    objc_copyWeak(&v7, &location);
    [(PUPickerContainerController *)self navigateToDestination:v5 options:0 completionHandler:v6];
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
}

void __60__PUPickerContainerController_makeSearchBarAsFirstResponder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = PLPickerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Completed view navigation with result: %ld (error: %@)", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v8 = [WeakRetained searchBar];
  [v8 updateIsEditing:1];
}

- (void)searchWithString:(id)a3
{
  id v4 = a3;
  id v6 = [(PUPickerContainerController *)self searchBar];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];

  [v6 updateSearchText:v5];
}

- (void)updateBars
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerContainerController.m", 849, @"%s must be called on the main thread", "-[PUPickerContainerController updateBars]");
  }
  [(PUPickerContainerController *)self _cleanUpInteractiveBarTransitionIfNeeded];
  [(PUPickerContainerController *)self _updateNavigationBar];
  [(PUPickerContainerController *)self _updateToolbar];
}

- (void)navigationWillPresentViewController:(id)a3
{
  id v4 = a3;
  [(PUPickerContainerController *)self updateBars];
  [(PUPickerContainerController *)self _updateInteractiveBarTransition];
  [(PUPickerContainerController *)self _updateLastVisiblePhotosViewController:v4];
}

- (void)setReplacesConfirmationButtonWithActivityIndicator:(BOOL)a3
{
  if (self->_replacesConfirmationButtonWithActivityIndicator != a3)
  {
    self->_replacesConfirmationButtonWithActivityIndicator = a3;
    [(PUPickerContainerController *)self updateBars];
  }
}

- (id)collectionListForAlbumIdentifier:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 photoLibrary];
  char v8 = [v7 librarySpecificFetchOptions];

  [v8 setIncludeAllPhotosSmartAlbum:1];
  int v9 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v6 options:v8];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v6];

  __int16 v11 = objc_msgSend(v9, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v10);
  id v12 = objc_alloc(MEMORY[0x1E4F39150]);
  uint64_t v13 = [v5 photoLibrary];

  uint64_t v14 = (void *)[v12 initWithOids:v11 photoLibrary:v13 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  uint64_t v15 = (void *)MEMORY[0x1E4F39008];
  uint64_t v16 = PXLocalizedString();
  uint64_t v17 = [v15 transientCollectionListWithCollectionsFetchResult:v14 title:v16];

  return v17;
}

- (int64_t)_currentPeopleSortOrderForPhotoLibrary:(id)a3
{
  int64_t result = [MEMORY[0x1E4F90428] currentSortOrderFor:a3];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)_setupPeopleOrPetsPickerWithPickerConfiguration:(id)a3
{
  id v21 = a3;
  id v5 = [v21 peopleConfigurations];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPickerContainerController.m", 726, @"Invalid parameter not satisfying: %@", @"configuration.peopleConfigurations.count > 0" object file lineNumber description];
  }
  BOOL v7 = [v21 sourceType] == 4 || objc_msgSend(v21, "sourceType") == 3;
  id v8 = objc_alloc(MEMORY[0x1E4F90418]);
  int v9 = [v21 peopleConfigurations];
  uint64_t v10 = [v21 selectionLimit];
  __int16 v11 = [v21 photoLibrary];
  id v12 = (PXPeoplePickerConfigurationController *)[v8 initWithPeopleConfigurations:v9 selectionLimit:v10 wantsPets:v7 configControllerHandler:self photoLibrary:v11];
  peopleConfigController = self->_peopleConfigController;
  self->_peopleConfigController = v12;

  uint64_t v14 = [v21 allPersonIdentifiers];
  uint64_t v15 = [v14 array];
  [(PXPeoplePickerConfigurationController *)self->_peopleConfigController setIdentifiers:v15];

  uint64_t v16 = [v21 preselectedItemIdentifiers];
  uint64_t v17 = [v16 array];
  [(PXPeoplePickerConfigurationController *)self->_peopleConfigController setPreselectedIdentifiers:v17];

  uint64_t v18 = [(PUPickerContainerController *)self selectionCoordinator];
  [(PXPeoplePickerConfigurationController *)self->_peopleConfigController setSelectionCoordinator:v18];

  -[PXPeoplePickerConfigurationController setShouldActLikeSingleSelectPicker:](self->_peopleConfigController, "setShouldActLikeSingleSelectPicker:", [v21 isFollowupSingleSelectionPeoplePicker]);
  -[PXPeoplePickerConfigurationController setCompactMode:](self->_peopleConfigController, "setCompactMode:", [v21 mode] == 1);
  -[PXPeoplePickerConfigurationController setTransparentBackground:](self->_peopleConfigController, "setTransparentBackground:", [v21 hasClearBackgroundColor]);
  int v19 = [v21 photoLibrary];
  [(PUPickerContainerController *)self setPeopleSortOrderType:[(PUPickerContainerController *)self _currentPeopleSortOrderForPhotoLibrary:v19]];
}

- (void)_setupCollectionsViewControllerWithPickerConfiguration:(id)a3 sessionInfo:(id)a4 photosViewConfiguration:(id)a5
{
  if (a5)
  {
    id v7 = a4;
    id v8 = a3;
    int v9 = [(PUPickerContainerController *)self selectionCoordinator];
    uint64_t v10 = [(PUPickerContainerController *)self _pickerViewControllerWithConfiguration:v8 sessionInfo:v7 collectionList:0 selectionCoordinator:v9];

    __int16 v11 = PXLocalizedString();
    [(UIViewController *)v10 setTitle:v11];

    collectionsViewController = self->_collectionsViewController;
    self->_collectionsViewController = v10;
  }
}

- (void)_setupAlbumsViewControllerWithPickerConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5 sessionInfo:(id)a6 photosViewConfiguration:(id)a7
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a7)
  {
    id v12 = [v10 albumsConfiguration];
    uint64_t v13 = [v12 preselectedIdentifiers];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      uint64_t v15 = [v10 photoLibrary];
      uint64_t v16 = [v15 librarySpecificFetchOptions];

      uint64_t v17 = [v10 albumsConfiguration];
      uint64_t v18 = [v17 preselectedIdentifiers];
      int v19 = [v18 firstObject];

      id v20 = (void *)MEMORY[0x1E4F38EE8];
      v41[0] = v19;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      id v22 = [v20 fetchAssetCollectionsWithLocalIdentifiers:v21 options:v16];
      id v23 = [v22 firstObject];

      if (v23)
      {
        [v11 setSourceAlbum:v23];
        [v11 setScrollToSourceAlbumWhenPresented:1];
        [v11 setShowCheckmarkOnSourceAlbum:1];
      }
    }
    BOOL v24 = [v10 albumsConfiguration];
    uint64_t v25 = [v24 _identifiers];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      [v11 setAllowSelectingNonEditableAlbums:1];
      unint64_t v27 = [v10 albumsConfiguration];
      char v28 = [v27 _identifiers];
      uint64_t v29 = [(PUPickerContainerController *)self collectionListForAlbumIdentifier:v28 configuration:v10];
    }
    else
    {
      uint64_t v29 = 0;
    }
    __int16 v30 = [(PUPickerContainerController *)self selectionCoordinator];
    id v31 = [(PUPickerContainerController *)self _pickerViewControllerWithConfiguration:v10 sessionInfo:v11 collectionList:v29 selectionCoordinator:v30];

    uint64_t v32 = [v10 hasClearBackgroundColor];
    uint64_t v33 = [(UIViewController *)v31 view];
    uint64_t v34 = [(id)v33 layer];
    [v34 setHitTestsAsOpaque:v32];

    id v35 = [(PUPickerContainerController *)self configuration];
    LOBYTE(v33) = [v35 isAddToAlbumPicker];

    if ((v33 & 1) == 0)
    {
      id v36 = [(PUPickerContainerController *)self configuration];
      char v37 = [v36 isAlbumPicker];

      if ((v37 & 1) == 0)
      {
        char v38 = [(PUPickerContainerController *)self configuration];
        [v38 isSharedAlbumPicker];
      }
    }
    int v39 = PXLocalizedString();
    [(UIViewController *)v31 setTitle:v39];

    albumsViewController = self->_albumsViewController;
    self->_albumsViewController = v31;
  }
}

- (void)_setupPhotosTabWithPhotosViewConfiguration:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F90590];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithConfiguration:v5];

    id v7 = [(PUPickerContainerController *)self configuration];
    uint64_t v8 = [v7 hasClearBackgroundColor];
    int v9 = [v6 view];
    id v10 = [v9 layer];
    [v10 setHitTestsAsOpaque:v8];

    objc_storeStrong((id *)&self->_photosViewController, v6);
    lastVisiblePhotosViewController = self->_lastVisiblePhotosViewController;
    self->_lastVisiblePhotosViewController = (PXPhotosUIViewController *)v6;
  }
}

- (void)_setupViewControllersWithConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v70 = v9;
  id v71 = v10;
  id v12 = self;
  uint64_t v72 = v11;
  uint64_t v13 = [v11 containerCollectionFetchResult];
  uint64_t v14 = [v13 firstObject];
  if (v14 && (char v15 = [v11 isPeopleOrPetsPicker], v14, (v15 & 1) == 0))
  {
    uint64_t v17 = [v11 generatedFilter];
    uint64_t v18 = [v17 assetPredicate];

    int v19 = [v11 suggestionGroup];
    if (v19)
    {
      id v20 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    }
    else
    {
      id v20 = 0;
    }

    id v21 = [v11 customSortDescriptors];

    if (v21)
    {
      id v22 = [v11 customSortDescriptors];
    }
    else
    {
      if ([v11 showsWallpaperSuggestions])
      {
        id v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
        id location = v23;
        BOOL v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
        int v80 = v24;
        uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
        v81 = v25;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&location count:3];
      }
      else
      {
        id v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
        id location = v23;
        uint64_t v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortToken" ascending:1];
        int v80 = v26;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&location count:2];
      }
    }
    unint64_t v27 = [v11 containerCollectionFetchResult];
    BYTE2(v66) = 0;
    BYTE1(v66) = [v11 allowsSwipeToSelect];
    LOBYTE(v66) = 1;
    uint64_t v16 = PXPhotosViewConfigurationForImagePickerWithAssetCollectionFetchResult();

    objc_msgSend(v16, "setShowLoadingPlaceholderWhenEmpty:", v20 != 0, v66);
    [v16 setIgnoreContentFilterStateWhenNotFiltering:v20 != 0];
    [v16 setStartsInSelectMode:1];
    objc_msgSend(v16, "setWantsNumberedSelectionStyle:", objc_msgSend(v72, "isOrderedSelection"));
    char v28 = [v72 generatedFilter];
    objc_msgSend(v16, "setNoContentPlaceholderType:", objc_msgSend(v28, "noContentPlaceholderType"));

    [v16 setLoadingStatusManager:v70];
    [v16 setDelegate:v12];
    [v16 setContentStartingPosition:2];
    if ([v72 hasClearBackgroundColor]) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = 0;
    }
    [v16 setBackgroundStyle:v29];
    __int16 v30 = [v72 pickerClientBundleIdentifier];
    [v16 setPickerClientBundleIdentifier:v30];

    id v31 = objc_alloc(MEMORY[0x1E4F905A8]);
    uint64_t v32 = [v72 photoLibrary];
    uint64_t v33 = (void *)[v31 initWithPhotoLibrary:v32];
    [v16 setViewOptionsModel:v33];

    [v16 setIgnoreFilterPredicateAssert:1];
    uint64_t v34 = [v72 phPickerConfiguration];
    id v35 = [v34 _aspectRatio];

    if (v35)
    {
      [v35 _aspectRatio];
      if (v36 == *MEMORY[0x1E4F399D0]) {
        double v37 = *MEMORY[0x1E4F90FF8];
      }
      else {
        [v35 _aspectRatio];
      }
      [v16 setItemAspectRatio:v37];
      [v16 setSectionBodyStyle:1];
    }
    if ([v72 showsWallpaperSuggestions])
    {
      [v16 setOverrideDefaultNumberOfColumns:3];
      [v16 setPreferredColumnCountsDelegate:v12];
      [v16 setUseLowMemoryDecode:1];
      [v16 setItemAspectRatio:*MEMORY[0x1E4F90FF8]];
      [v16 setPreferredAssetCropDelegate:v12];
    }
    if ([v72 mode] == 1)
    {
      [v16 setWantsSingleRowScrollingLayout:1];
      [v16 setSectionBodyStyle:0];
      [v16 setContentMode:1];
    }
    if (![v72 sourceType]) {
      objc_msgSend(v16, "setAllowedActions:", objc_msgSend(v16, "allowedActions") | 0x200);
    }
    [v16 setEnableFilterButton:0];
  }
  else
  {
    uint64_t v16 = 0;
  }

  objc_storeStrong((id *)&v12->_photosViewConfiguration, v16);
  if (v16)
  {
    id obj = [(PUPickerContainerController *)v12 sessionInfoForConfiguration:v72 loadingStatusManager:v70 selectionCoordinator:v71];
    objc_storeStrong((id *)&v12->_sessionInfo, obj);
    if (![v72 sourceType]) {
      [(PUPickerContainerController *)v12 _setupPhotosTabWithPhotosViewConfiguration:v16];
    }
    id v67 = [v16 dataSourceManager];
    objc_storeStrong((id *)&v12->_photosDataSourceManager, v67);
    uint64_t v38 = [v16 selectionManager];
    photosSelectionManager = v12->_photosSelectionManager;
    v12->_photosSelectionManager = (PXSectionedSelectionManager *)v38;

    objc_initWeak(&location, v12);
    BOOL v40 = [PUPickerSearchBar alloc];
    BOOL v41 = [v72 photoLibrary];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke;
    v77[3] = &unk_1E5F2ABE8;
    objc_copyWeak(&v78, &location);
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_2;
    v75[3] = &unk_1E5F2D898;
    objc_copyWeak(&v76, &location);
    long long v69 = [(PUPickerSearchBar *)v40 initWithPhotoLibrary:v41 searchHandler:v77 scopeHandler:v75];

    [(PUPickerSearchBar *)v69 updateContainerFromPickerConfiguration:v72];
    id v42 = v72;
    BOOL v43 = v12;
    id v44 = [v42 suggestionGroup];
    if (v44)
    {
      int v45 = [PUPickerSuggestionsView alloc];
      uint64_t v46 = [v42 isProcessingSuggestions];
      uint64_t v47 = [v42 showsWallpaperSuggestions];
      uint64_t v48 = [v42 generatedFilter];
      uint64_t v49 = -[PUPickerSuggestionsView initWithIsProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:](v45, "initWithIsProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:", v46, v47, [v48 containsStickersFilter]);

      uint64_t v50 = [v42 photoLibrary];
      [(PUPickerSuggestionsView *)v49 setPhotoLibrary:v50];

      [(PUPickerSuggestionsView *)v49 setDelegate:v43];
      [(PUPickerSuggestionsView *)v49 setSuggestionGroup:v44];
    }
    else
    {
      uint64_t v49 = 0;
    }

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_3;
    v73[3] = &unk_1E5F2AC10;
    objc_copyWeak(&v74, &location);
    id v51 = v42;
    unint64_t v52 = v73;
    char v53 = [v51 suggestionGroup];

    if (v53)
    {
      CGAffineTransform v54 = [PUPickerSuggestionResultFetcher alloc];
      uint64_t v55 = [v51 photoLibrary];
      uint64_t v56 = [v51 isProcessingSuggestions];
      uint64_t v57 = [v51 showsWallpaperSuggestions];
      v58 = [v51 generatedFilter];
      uint64_t v59 = -[PUPickerSuggestionResultFetcher initWithPhotoLibrary:isProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:updateHandler:](v54, "initWithPhotoLibrary:isProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:updateHandler:", v55, v56, v57, [v58 containsStickersFilter], v52);
    }
    else
    {
      uint64_t v59 = 0;
    }

    objc_storeStrong((id *)&v43->_searchBar, v69);
    objc_storeStrong((id *)&v43->_pickerSuggestionsView, v49);
    objc_storeStrong((id *)&v43->_pickerSuggestionResultFetcher, v59);
    uint64_t v60 = [[PUPickerNavigationBarPalette alloc] initWithTopView:v69 bottomView:v49];
    navigationBarBottomPalette = v43->_navigationBarBottomPalette;
    v43->_navigationBarBottomPalette = &v60->super;

    objc_destroyWeak(&v74);
    objc_destroyWeak(&v76);
    objc_destroyWeak(&v78);
    objc_destroyWeak(&location);
  }
  else if ([v72 isPeopleOrPetsPicker])
  {
    [(PUPickerContainerController *)v12 _setupPeopleOrPetsPickerWithPickerConfiguration:v72];
  }
  else
  {
    v62 = (void *)MEMORY[0x1E4F399A8];
    int v63 = [v72 phPickerConfiguration];
    uint64_t v64 = [v62 unavailableViewController:4 configuration:v63 error:0 delegate:0];
    unavailableViewController = v12->_unavailableViewController;
    v12->_unavailableViewController = (UIViewController *)v64;
  }
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _filterWithSearchResultUUIDs:v3];
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = [WeakRetained pickerSuggestionsView];
    [v3 clearFilterableSuggestion];
  }
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v5);
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _filterWithSuggestionResult:*(void *)(a1 + 32)];
}

- (id)sessionInfoForConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[PUImagePickerSessionInfo initWithPhotosViewDelegate:loadingStatusManager:allowMultipleSelection:limitedLibrary:]([PUImagePickerSessionInfo alloc], "initWithPhotosViewDelegate:loadingStatusManager:allowMultipleSelection:limitedLibrary:", self, v9, 1, [v10 isLimitedLibraryPicker]);

  [(PUSessionInfo *)v11 setSelectionCoordinator:v8];
  -[PUSessionInfo setAllowsSwipeToSelect:](v11, "setAllowsSwipeToSelect:", [v10 allowsSwipeToSelect]);
  id v12 = [v10 generatedFilter];
  uint64_t v13 = [v12 assetPredicate];
  [(PUSessionInfo *)v11 setAssetsFilterPredicate:v13];

  uint64_t v14 = [v10 generatedFilter];
  -[PUSessionInfo setAssetTypesToInclude:](v11, "setAssetTypesToInclude:", [v14 genericAssetTypes]);

  char v15 = [v10 generatedFilter];
  -[PUSessionInfo setNoContentPlaceholderType:](v11, "setNoContentPlaceholderType:", [v15 noContentPlaceholderType]);

  -[PUSessionInfo setWantsNumberedSelectionStyle:](v11, "setWantsNumberedSelectionStyle:", [v10 isOrderedSelection]);
  -[PUSessionInfo setExcludesSharedAlbums:](v11, "setExcludesSharedAlbums:", [v10 excludesSharedAlbums]);
  -[PUSessionInfo setExcludesHiddenAlbum:](v11, "setExcludesHiddenAlbum:", [v10 excludesHiddenAlbum]);
  -[PUSessionInfo setExcludesNewAlbumCreation:](v11, "setExcludesNewAlbumCreation:", [v10 excludesNewAlbumCreation]);
  [(PUSessionInfo *)v11 setReverseSortOrder:1];
  -[PUSessionInfo setHasClearBackgroundColor:](v11, "setHasClearBackgroundColor:", [v10 hasClearBackgroundColor]);
  [(PUSessionInfo *)v11 setContentStartingPosition:2];
  -[PUSessionInfo setSelectingTargetAlbum:](v11, "setSelectingTargetAlbum:", [v10 sourceType] == 2);
  uint64_t v16 = [v10 pickerClientBundleIdentifier];

  [(PUSessionInfo *)v11 setPickerClientBundleIdentifier:v16];
  [(PUSessionInfo *)v11 addSessionInfoObserver:self];
  return v11;
}

- (PXPhotosFilterToggleButtonController)filterButtonController
{
  filterButtonController = self->_filterButtonController;
  if (!filterButtonController)
  {
    id v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    id v5 = [MEMORY[0x1E4FB1618] tintColor];
    [v4 setBaseBackgroundColor:v5];

    uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down"];
    [v4 setImage:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F90568]);
    id v8 = [(PUPickerContainerController *)self photosViewController];
    id v9 = [v8 viewModelIfLoaded];
    id v10 = (void *)[v7 initWithViewModel:v9 actionType:*MEMORY[0x1E4F90FE8]];

    id v11 = objc_alloc(MEMORY[0x1E4F90558]);
    id v12 = [(PUPickerContainerController *)self photosViewController];
    uint64_t v13 = [v12 viewModelIfLoaded];
    uint64_t v14 = (void *)[v11 initWithViewModel:v13 buttonConfiguration:v4 actionPerformer:v10];

    [v14 setShouldUpdateButtonSymbol:0];
    [v14 invalidateButton];
    char v15 = self->_filterButtonController;
    self->_filterButtonController = (PXPhotosFilterToggleButtonController *)v14;

    filterButtonController = self->_filterButtonController;
  }
  return filterButtonController;
}

- (id)_peopleSortAndFilterMenu
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(PUPickerContainerController *)self peopleSortOrderType];
  if (v4 == 1)
  {
    id v5 = @"arrow.up.to.line";
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    id v5 = @"arrow.down.to.line";
LABEL_5:
    uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  id v7 = (void *)MEMORY[0x1E4FB13F0];
  id v8 = PXLocalizedString();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke;
  _OWORD v21[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v22, &location);
  id v9 = [v7 actionWithTitle:v8 image:v6 identifier:0 handler:v21];

  id v10 = (void *)MEMORY[0x1E4FB13F0];
  id v11 = PXLocalizedString();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke_2;
  _OWORD v19[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v20, &location);
  id v12 = [v10 actionWithTitle:v11 image:0 identifier:0 handler:v19];

  int64_t v13 = [(PUPickerContainerController *)self peopleSortOrderType];
  if ((unint64_t)(v13 - 1) >= 2)
  {
    if (v13) {
      goto LABEL_12;
    }
    [v9 setState:0];
    uint64_t v14 = 1;
  }
  else
  {
    [v9 setState:1];
    uint64_t v14 = 0;
  }
  [v12 setState:v14];
LABEL_12:
  [v3 addObject:v9];
  [v3 addObject:v12];
  char v15 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v16 = PXLocalizedString();
  uint64_t v17 = [v15 menuWithTitle:v16 children:v3];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  return v17;
}

void __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained peopleSortOrderType];

  if (v3 != 2)
  {
    if (v3 == 1)
    {
      id v4 = objc_loadWeakRetained(v1);
      id v5 = v4;
      uint64_t v6 = 2;
      goto LABEL_6;
    }
    if (v3) {
      goto LABEL_7;
    }
  }
  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  uint64_t v6 = 1;
LABEL_6:
  [v4 setPeopleSortOrderType:v6];

LABEL_7:
  id v7 = objc_loadWeakRetained(v1);
  [v7 _updatePeopleSort];
}

void __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPeopleSortOrderType:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updatePeopleSort];
}

- (UIBarButtonItem)toolbarSortAndFilterBarButtonItem
{
  toolbarSortAndFilterBarButtonItem = self->_toolbarSortAndFilterBarButtonItem;
  if (!toolbarSortAndFilterBarButtonItem)
  {
    id v4 = [(PUPickerContainerController *)self configuration];
    unint64_t v5 = [v4 sourceType];

    if (v5 <= 4 && ((1 << v5) & 0x1A) != 0)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
      id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down"];
      id v8 = (UIBarButtonItem *)[v6 initWithImage:v7 menu:0];
      id v9 = self->_toolbarSortAndFilterBarButtonItem;
      self->_toolbarSortAndFilterBarButtonItem = v8;

      id v10 = PXLocalizedString();
      [(UIBarButtonItem *)self->_toolbarSortAndFilterBarButtonItem setAccessibilityLabel:v10];

      [(UIBarButtonItem *)self->_toolbarSortAndFilterBarButtonItem setAccessibilityIdentifier:@"Sort"];
      id v11 = [(PUPickerContainerController *)self _peopleSortAndFilterMenu];
      [(UIBarButtonItem *)self->_toolbarSortAndFilterBarButtonItem setMenu:v11];
    }
    else
    {
      id v11 = [(PUPickerContainerController *)self filterButtonController];
      id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
      int64_t v13 = [v11 button];
      uint64_t v14 = (UIBarButtonItem *)[v12 initWithCustomView:v13];
      char v15 = self->_toolbarSortAndFilterBarButtonItem;
      self->_toolbarSortAndFilterBarButtonItem = v14;

      uint64_t v16 = PXLocalizedString();
      [(UIBarButtonItem *)self->_toolbarSortAndFilterBarButtonItem setAccessibilityLabel:v16];

      [(UIBarButtonItem *)self->_toolbarSortAndFilterBarButtonItem setAccessibilityIdentifier:@"Sort and Filter"];
    }

    toolbarSortAndFilterBarButtonItem = self->_toolbarSortAndFilterBarButtonItem;
  }
  return toolbarSortAndFilterBarButtonItem;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v12 traitCollectionDidChange:v4];
  unint64_t v5 = [(PUPickerContainerController *)self traitCollection];
  uint64_t v6 = [v5 _presentationSemanticContext];
  uint64_t v7 = [v4 _presentationSemanticContext];

  if (v6 != v7) {
    [(PUPickerContainerController *)self updateBars];
  }
  id v8 = [(PUPickerContainerController *)self traitCollection];
  id v9 = [v8 preferredContentSizeCategory];
  id v10 = [v4 preferredContentSizeCategory];

  if (v9 != v10)
  {
    id v11 = [(PUPickerContainerController *)self photosViewController];
    [v11 invalidateHeaderView];
  }
}

- (void)updateViewConstraints
{
  id v3 = [(PUPickerContainerController *)self configuration];
  uint64_t v4 = [v3 mode];
  BOOL v5 = v4 == 1;
  BOOL v6 = v4 != 1;

  uint64_t v7 = [(PUPickerContainerController *)self topConstraint];
  [v7 setActive:v6];

  id v8 = [(PUPickerContainerController *)self bottomConstraint];
  [v8 setActive:v6];

  id v9 = [(PUPickerContainerController *)self topSafeAreaConstraint];
  [v9 setActive:v5];

  id v10 = [(PUPickerContainerController *)self bottomSafeAreaConstraint];
  [v10 setActive:v5];

  id v11 = [(PUPickerContainerController *)self leadingConstraint];
  [v11 setActive:1];

  objc_super v12 = [(PUPickerContainerController *)self trailingConstraint];
  [v12 setActive:1];

  int64_t v13 = [(PUPickerContainerController *)self configuration];
  if ([v13 supportsInteractiveBarTransition])
  {
    uint64_t v14 = [(PUPickerContainerController *)self configuration];
    [v14 interactiveBarTransitionFractionExpanded];
    BOOL v16 = v15 < 0.8;
  }
  else
  {
    BOOL v16 = 0;
  }

  uint64_t v17 = [(PUPickerContainerController *)self photosIndicatorTopConstraint];
  [v17 setActive:v16];

  uint64_t v18 = [(PUPickerContainerController *)self photosIndicatorLeadingConstraint];
  [v18 setActive:v16];

  uint64_t v19 = v16 ^ 1;
  id v20 = [(PUPickerContainerController *)self photosIndicatorTopSafeAreaConstraint];
  [v20 setActive:v19];

  id v21 = [(PUPickerContainerController *)self photosIndicatorLeadingSafeAreaConstraint];
  [v21 setActive:v19];

  v22.receiver = self;
  v22.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v22 updateViewConstraints];
}

- (void)viewSafeAreaInsetsDidChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v6 viewSafeAreaInsetsDidChange];
  id v3 = PLPickerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [(PUPickerContainerController *)self view];
    [v4 safeAreaInsets];
    BOOL v5 = NSStringFromUIEdgeInsets(v10);
    *(_DWORD *)CGAffineTransform buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "Call _updateInteractiveBarTransition, safe area insets changed to %@", buf, 0xCu);
  }
  [(PUPickerContainerController *)self _updateInteractiveBarTransition];
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v16 viewDidLayoutSubviews];
  id v3 = [(PUPickerContainerController *)self photosIndicator];
  uint64_t v4 = [v3 superview];
  BOOL v5 = [(PUPickerContainerController *)self photosIndicator];
  [v4 bringSubviewToFront:v5];

  if ([(PUPickerContainerController *)self shouldStopScrollingItemsViewControllerToTop])
  {
    goto LABEL_13;
  }
  objc_super v6 = [(PUPickerContainerController *)self itemsViewController];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = [v7 viewModel];
  uint64_t v9 = [v8 firstSelectedAssetReference];

  UIEdgeInsets v10 = [(PUPickerContainerController *)self configuration];
  if (![v10 shouldScrollToSelectedItemInitially] || !v7)
  {

    goto LABEL_11;
  }

  if (!v9)
  {
LABEL_11:
    id v11 = [(PUPickerContainerController *)self itemsViewController];
    objc_msgSend(v11, "pu_scrollToInitialPositionAnimated:", 0);

    goto LABEL_12;
  }
  [v7 scrollToRevealAssetReference:v9 completion:0];
LABEL_12:
  objc_initWeak(&location, self);
  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__PUPickerContainerController_viewDidLayoutSubviews__block_invoke;
  v13[3] = &unk_1E5F2E530;
  objc_copyWeak(&v14, &location);
  dispatch_after(v12, MEMORY[0x1E4F14428], v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

LABEL_13:
  if (self->_hasNavigationBarTransitionPending) {
    [(PUPickerContainerController *)self _updateInteractiveBarTransition];
  }
}

void __52__PUPickerContainerController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldStopScrollingItemsViewControllerToTop:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v5 viewDidAppear:a3];
  uint64_t v4 = [(PUPickerContainerController *)self containerControllerActionHandler];
  [v4 containerControllerDidAppear:self];

  [(PUPickerContainerController *)self _showPhotosIndicatorBrieflyIfNeeded];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v10 viewIsAppearing:a3];
  uint64_t v4 = [(PUPickerContainerController *)self photosViewController];
  objc_super v5 = [v4 viewModel];
  [v5 registerChangeObserver:self context:PUPhotoPickerPhotosViewControllerViewModelObservationContext];

  objc_super v6 = [(PUPickerContainerController *)self photosViewController];
  id v7 = [v6 contentController];
  id v8 = [v7 gridView];
  uint64_t v9 = [v8 scrollViewController];
  [v9 registerObserver:self];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v24 viewDidLoad];
  [(PUPickerContainerController *)self px_enableExtendedTraitCollection];
  id v3 = [(PUPickerContainerController *)self configuration];
  uint64_t v4 = [v3 allPhotosVirtualCollection];
  objc_super v5 = [v4 title];
  objc_super v6 = [(PUPickerContainerController *)self photosViewController];
  [v6 setTitle:v5];

  id v7 = [(PUPickerContainerController *)self navigationBarBottomPalette];
  id v8 = [(PUPickerContainerController *)self navigationItem];
  [v8 _setBottomPalette:v7];

  if ([(PUPickerContainerController *)self _isConfiguredForStickerSuggestionGroup])
  {
    [(PUPickerContainerController *)self _updateNumberOfItemsToPlayInline];
  }
  uint64_t v9 = [(PUPickerContainerController *)self resizeTaskDescriptorViewModel];
  [v9 performChanges:&__block_literal_global_71008];

  objc_super v10 = [(PUPickerContainerController *)self photosViewController];
  id v11 = [v10 viewModel];
  dispatch_time_t v12 = [v11 gridActionManager];
  [v12 setPerformerDelegate:self];

  int64_t v13 = [(PUPickerContainerController *)self configuration];
  id v14 = [v13 albumsConfiguration];
  if (v14
    || ([(PUPickerContainerController *)self configuration],
        id v14 = objc_claimAutoreleasedReturnValue(),
        ([v14 isAlbumPicker] & 1) != 0))
  {

LABEL_6:
    uint64_t v15 = [(PUPickerContainerController *)self albumsViewController];
    goto LABEL_7;
  }
  uint64_t v17 = [(PUPickerContainerController *)self configuration];
  char v18 = [v17 isSharedAlbumPicker];

  if (v18) {
    goto LABEL_6;
  }
  uint64_t v19 = [(PUPickerContainerController *)self photosViewController];

  if (v19)
  {
    uint64_t v15 = [(PUPickerContainerController *)self photosViewController];
  }
  else
  {
    id v20 = [(PUPickerContainerController *)self peopleConfigController];
    int v21 = [v20 hasContent];

    if (v21)
    {
      objc_super v22 = [(PUPickerContainerController *)self peopleConfigController];
      objc_super v16 = [v22 currentViewController];

      goto LABEL_8;
    }
    id v23 = [(PUPickerContainerController *)self collectionsViewController];

    if (v23) {
      [(PUPickerContainerController *)self collectionsViewController];
    }
    else {
    uint64_t v15 = [(PUPickerContainerController *)self unavailableViewController];
    }
  }
LABEL_7:
  objc_super v16 = (void *)v15;
LABEL_8:
  [(PUPickerContainerController *)self _addOrReplaceItemViewControllerWithViewController:v16];
  [(PUPickerContainerController *)self updateBars];
}

uint64_t __42__PUPickerContainerController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateAssetsForResizing];
}

- (void)dealloc
{
  [MEMORY[0x1E4F90070] tearDownPrivacyControllersIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)PUPickerContainerController;
  [(PUPickerContainerController *)&v3 dealloc];
}

- (PUPickerContainerController)initWithConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5 additionalSelectionState:(id)a6 resizeTaskDescriptorViewModel:(id)a7 actionHandler:(id)a8
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v57 = a7;
  id v19 = a7;
  id v20 = a8;
  v59.receiver = self;
  v59.super_class = (Class)PUPickerContainerController;
  int v21 = [(PUPickerContainerController *)&v59 initWithNibName:0 bundle:0];
  if (v21)
  {
    id v54 = v17;
    id v55 = v16;
    [v15 registerChangeObserver:v21 context:PUPhotoPickerConfigurationObservationContext];
    objc_super v22 = [v18 observable];
    [v22 registerChangeObserver:v21 context:PUPhotoPickerAdditionalSelectionStateObservationContext];

    id v53 = v19;
    [v19 registerChangeObserver:v21 context:PUPhotoPickerResizeTaskDescriptorViewModelObservationContext_70677];
    objc_storeStrong((id *)&v21->_configuration, a3);
    objc_storeStrong((id *)&v21->_selectionCoordinator, a5);
    objc_storeStrong((id *)&v21->_additionalSelectionState, obj);
    objc_storeStrong((id *)&v21->_resizeTaskDescriptorViewModel, v57);
    id v58 = v20;
    objc_storeWeak((id *)&v21->_containerControllerActionHandler, v20);
    id v23 = [PUPickerSegmentedControl alloc];
    objc_super v24 = [v15 allPhotosVirtualCollection];
    uint64_t v25 = [v24 title];
    v61[0] = v25;
    uint64_t v26 = PXLemonadeLocalizedString();
    v61[1] = v26;
    unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    char v28 = [(PUPickerSegmentedControl *)v23 initWithItems:v27];

    [(PUPickerSegmentedControl *)v28 setClipsToBounds:1];
    [(PUPickerSegmentedControl *)v28 _setAlwaysEmitValueChanged:1];
    [(PUPickerSegmentedControl *)v28 addTarget:v21 action:sel_handleNavigationBarSegmentedControl_ forControlEvents:4096];
    [(PUPickerSegmentedControl *)v28 setSelectedSegmentIndex:0];
    objc_storeStrong((id *)&v21->_navigationBarSegmentedControl, v28);
    uint64_t v29 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    __int16 v30 = MEMORY[0x1B3E7AC20](8, 2, 4);
    id v31 = [v29 titleLabel];
    [v31 setFont:v30];

    uint64_t v32 = [v29 titleLabel];
    [v32 setAdjustsFontForContentSizeCategory:1];

    [v29 setShowsLargeContentViewer:1];
    [v29 addTarget:v21 action:sel_handleToolbarShowSelectedButton_ forControlEvents:0x2000];
    uint64_t v33 = [MEMORY[0x1E4FB1618] labelColor];
    [v29 setTitleColor:v33 forState:2];

    objc_storeStrong((id *)&v21->_showSelectedButtonTitleButton, v29);
    id v34 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v34 setAdjustsFontForContentSizeCategory:1];
    [v34 setAdjustsFontSizeToFitWidth:1];
    [v34 setShowsLargeContentViewer:1];
    id v35 = MEMORY[0x1B3E7AC20](8, 2, 4);
    [v34 setFont:v35];

    objc_storeStrong((id *)&v21->_showSelectedButtonTitleLabel, v34);
    id v36 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v37 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v36 setTextColor:v37];

    [v36 setAdjustsFontForContentSizeCategory:1];
    [v36 setShowsLargeContentViewer:1];
    [v36 setAdjustsFontSizeToFitWidth:1];
    uint64_t v38 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [v36 setFont:v38];

    [v36 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27C8]];
    LODWORD(v39) = 1148846080;
    [v36 setContentCompressionResistancePriority:1 forAxis:v39];
    objc_storeStrong((id *)&v21->_showSelectedButtonSubtitleLabel, v36);
    id v40 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v60[0] = v29;
    v60[1] = v34;
    v60[2] = v36;
    BOOL v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
    id v42 = (void *)[v40 initWithArrangedSubviews:v41];

    [v42 setAxis:1];
    [v42 setAlignment:3];
    [v42 setDistribution:0];
    uint64_t v43 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v42];
    toolbarShowSelectedGroup = v21->_toolbarShowSelectedGroup;
    v21->_toolbarShowSelectedGroup = (UIBarButtonItem *)v43;

    id v45 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v46 = [MEMORY[0x1E4FB1818] systemImageNamed:@"switch.2"];
    uint64_t v47 = [v45 initWithImage:v46 style:0 target:v21 action:sel_handleToolbarOptionsButton_];
    toolbarOptionsBarButton = v21->_toolbarOptionsBarButton;
    v21->_toolbarOptionsBarButton = (UIBarButtonItem *)v47;

    uint64_t v49 = PXLocalizedString();
    [(UIBarButtonItem *)v21->_toolbarOptionsBarButton setAccessibilityLabel:v49];

    [(UIBarButtonItem *)v21->_toolbarOptionsBarButton setAccessibilityIdentifier:@"Options"];
    if ([v15 isAddToAlbumPicker])
    {
      uint64_t v50 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:4 target:v21 action:sel_handleToolbarNewAlbumButton_];
      toolbarNewAlbumBarButton = v21->_toolbarNewAlbumBarButton;
      v21->_toolbarNewAlbumBarButton = (UIBarButtonItem *)v50;
    }
    id v17 = v54;
    id v16 = v55;
    [(PUPickerContainerController *)v21 _setupViewControllersWithConfiguration:v15 loadingStatusManager:v55 selectionCoordinator:v54];

    id v19 = v53;
    id v20 = v58;
  }

  return v21;
}

- (void)ppt_switchToAlbumsTab
{
  id v3 = [(PUPickerContainerController *)self navigationBarSegmentedControl];
  [v3 setSelectedSegmentIndex:1];
  [(PUPickerContainerController *)self handleNavigationBarSegmentedControl:v3];
}

@end