@interface PlaceCardViewController
+ (BOOL)shouldInsertRecentPOIForRouting;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isHomeWorkSchoolShortcut;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)isActive;
- (BOOL)isAdditionalStop;
- (BOOL)isContact;
- (BOOL)isMapItemInFavorites;
- (BOOL)isMeCard;
- (BOOL)isPresentedInSearchAlongTheRoute;
- (BOOL)placeViewController:(id)a3 canSelectDepartureSequence:(id)a4 mapItem:(id)a5;
- (BOOL)shouldMoveLookAroundStorefrontViewForPlaceViewController:(id)a3;
- (BOOL)shouldPresentSecondaryActionWhenReady;
- (BOOL)suggestionViewProviderIsPlacePinned:(id)a3;
- (LookAroundActionCoordination)actionCoordinator;
- (MKLookAroundView)lookAroundView;
- (MKMapItem)mapItem;
- (NSArray)draggableContent;
- (PlaceCardDismissable)placeCardDismissalDelegate;
- (PlaceCardItem)placeCardItem;
- (PlaceCardViewController)init;
- (PlaceCardViewController)initWithCoder:(id)a3;
- (PlaceCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PlaceCardViewController)initWithVisualEffectDisabled:(BOOL)a3;
- (PlaceCardViewControllerDelegate)placeCardDelegate;
- (double)_mediumLayoutHeightInSAR;
- (double)headerSecondaryNameLabelPadding;
- (double)heightForLayout:(unint64_t)a3;
- (double)placeViewControllerPlaceCardHeaderTitleTrailingConstant:(id)a3;
- (id)_secondaryButtonController;
- (id)_shortcut;
- (id)activityViewControllerForPlaceViewController:(id)a3;
- (id)alternatePrimaryButtonControllerForPlaceViewController:(id)a3;
- (id)analyticsDelegate;
- (id)curatedCollectionSyncCoordinator;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)headerActionItems;
- (id)inlineRatingViewControllerForPlaceViewController:(id)a3;
- (id)libraryAccessProvider;
- (id)menuElementForActionItem:(id)a3;
- (id)placeViewController:(id)a3 collectionViewsForPlaceItem:(id)a4;
- (id)placeViewController:(id)a3 hikingTipViewForTipModel:(id)a4;
- (id)placeViewController:(id)a3 webPlacecardGuidesForPlaceItem:(id)a4;
- (id)placeViewControllerUserIcon:(id)a3;
- (id)secondaryButtonControllerForPlaceViewController:(id)a3;
- (id)shareItemSource;
- (id)suggestionViewController;
- (id)suggestionViewForPlaceViewController:(id)a3;
- (id)targetedDragPreviewForInteraction:(id)a3;
- (id)traitsForPlaceViewController:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)mapTypeForPlaceViewController:(id)a3;
- (int64_t)_overriddenUserInterfaceStyle;
- (int64_t)excludedContent;
- (int64_t)overriddenInterfaceStyleForPlaceViewControllerSubviews:(id)a3;
- (unint64_t)_collectionsCount;
- (unint64_t)_numberOfRAPsInReview;
- (unint64_t)preferredPresentationStyle;
- (void)_addPlaceToCollection:(id)a3 editCollection:(BOOL)a4;
- (void)_carryOverTransitDisplayInformationFromCurrentItemToNewFetchedResult:(id)a3;
- (void)_chromeViewControllerPresent:(id)a3;
- (void)_clearOfflineDownloadTipIfNeeded;
- (void)_initSuggestion;
- (void)_instrumentHeaderButtonAction:(int)a3 withFeedbackType:(int)a4;
- (void)_presentPOIEnrichmentCoordinator:(id)a3 presentingViewController:(id)a4 progressObserver:(id)a5 dismissalDelegate:(id)a6;
- (void)_presentPOIEnrichmentCoordinator:(id)a3 withProgressObserver:(id)a4;
- (void)_routeFromCurrentSearchResult;
- (void)_routeToCurrentSearchResultWithTransportType:(int64_t)a3;
- (void)_searchWithSuggestion:(id)a3;
- (void)_setupConstraintsForSuggestionView:(id)a3;
- (void)_showAddToLibraryTipsIfNeeded;
- (void)_submitInlineRatingsIfNeeded;
- (void)_updateCallToActionStateIfNeeded;
- (void)_updateCollectionsAnimated:(BOOL)a3;
- (void)_updateOfflineFeatureDiscoveryViewIfNeededWithMapItem:(id)a3;
- (void)_updatePlacecardCallToActionAnimated:(BOOL)a3;
- (void)_updatePopoverCoordinate;
- (void)_updateRAPInReviewStatus;
- (void)_updateShortcut;
- (void)_updateSuggestionVisibility;
- (void)_updateTitleHeaderViewConstraintsIfNeeded;
- (void)_updateVerifiedBusinessHeaderIfNeeded;
- (void)appStoreAppSelected:(id)a3;
- (void)callToActionViewProviderDidFinishClearingExistingState:(id)a3;
- (void)callToActionViewProviderDidFinishResolvingEditState:(id)a3;
- (void)callToActionViewProviderDidUpdateWithPreferredUserUploadedPhoto:(id)a3 photoID:(id)a4 numberOfPhotos:(int64_t)a5;
- (void)callToActionViewProviderInitialLoadingStateDidChange:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)copy:(id)a3;
- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3;
- (void)dealloc;
- (void)didBecomeCurrent;
- (void)didDismissViewController:(id)a3 mapItem:(id)a4;
- (void)didResignCurrent;
- (void)didScrollPastTransition;
- (void)dismissContactsViewController;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)handleAddOrRemoveFromLibraryHeaderAction:(BOOL)a3;
- (void)handleAddOrRemovePlaceFromLibrary:(BOOL)a3;
- (void)handleShareWithPresentationOptions:(id)a3;
- (void)headerViewDidLayoutSubviews:(id)a3;
- (void)hideHeader;
- (void)initPlaceCard;
- (void)inlinePOIEnrichmentController:(id)a3 didSelectTermsOfServiceURL:(id)a4;
- (void)inlinePOIEnrichmentController:(id)a3 requestsPresentationOfPhotosWithCoordinator:(id)a4;
- (void)insertInHistory;
- (void)instrumentDismissAction;
- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4;
- (void)mapView:(id)a3 didGetHikingToolTipRegionId:(unint64_t)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openFindMy;
- (void)openRequestLocation;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)placeCardCollectionMembershipProviderDidUpdate:(id)a3;
- (void)placeCardItemMapItemDidChangeWithFailedRefinement:(BOOL)a3;
- (void)placeEnrichmentAPIContollerDidFetchEnrichmentData:(id)a3 forMapItem:(id)a4;
- (void)placePhotoViewerSceneWillDisconnect:(id)a3;
- (void)placeViewController:(id)a3 didFinishDismissingViewController:(id)a4;
- (void)placeViewController:(id)a3 didRequestAddOrRemovePlaceFromLibrary:(BOOL)a4;
- (void)placeViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 completion:(id)a6;
- (void)placeViewController:(id)a3 didRequestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a4;
- (void)placeViewController:(id)a3 didRequestSceneActivationForPhotoGalleryViewController:(id)a4;
- (void)placeViewController:(id)a3 didSelectAddMissingDataOfType:(int64_t)a4;
- (void)placeViewController:(id)a3 didSelectAddPhotosWithPresentationOptions:(id)a4 entryPoint:(int64_t)a5 originTarget:(id)a6;
- (void)placeViewController:(id)a3 didSelectAddRatingsWithPresentationOptions:(id)a4 overallState:(int64_t)a5 originTarget:(id)a6;
- (void)placeViewController:(id)a3 didSelectAddToCollectionWithPlaceActionEnvironment:(id)a4;
- (void)placeViewController:(id)a3 didSelectDepartureSequence:(id)a4 mapItem:(id)a5;
- (void)placeViewController:(id)a3 didSelectDirectionsForDestinationAddress:(id)a4 contact:(id)a5 transportType:(id)a6;
- (void)placeViewController:(id)a3 didSelectDirectionsForDestinationMapItem:(id)a4 transportType:(id)a5;
- (void)placeViewController:(id)a3 didSelectEditPlaceDetailsOfType:(int64_t)a4;
- (void)placeViewController:(id)a3 didSelectEditSubmissionWithPresentationOptions:(id)a4;
- (void)placeViewController:(id)a3 didSelectMapsExtension:(id)a4 usingAppStoreApp:(id)a5;
- (void)placeViewController:(id)a3 didSelectParent:(id)a4;
- (void)placeViewController:(id)a3 didSelectPhotoCategoryAtIndex:(unint64_t)a4;
- (void)placeViewController:(id)a3 didSelectPhotoToReport:(id)a4 withPhotoGalleryViewController:(id)a5;
- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithMode:(unint64_t)a4;
- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithTransportTypePreference:(id)a4;
- (void)placeViewController:(id)a3 didSelectSearchCategory:(id)a4;
- (void)placeViewController:(id)a3 didSelectShareCurrentLocationWithCompletion:(id)a4;
- (void)placeViewController:(id)a3 didSelectTransitConnectionInformation:(id)a4;
- (void)placeViewController:(id)a3 didSelectTransitLine:(id)a4;
- (void)placeViewController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5;
- (void)placeViewController:(id)a3 launchAttributionURLs:(id)a4 withAttribution:(id)a5 completionHandler:(id)a6;
- (void)placeViewController:(id)a3 openURL:(id)a4;
- (void)placeViewController:(id)a3 photoGalleryDidScroll:(id)a4;
- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4;
- (void)placeViewController:(id)a3 requestsDismissingPresentingViewControllerWithCompletion:(id)a4;
- (void)placeViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6;
- (void)placeViewController:(id)a3 selectCollectionIdentifier:(id)a4;
- (void)placeViewController:(id)a3 selectCuratedCollection:(id)a4;
- (void)placeViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4;
- (void)placeViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7;
- (void)placeViewController:(id)a3 showTransitIncidents:(id)a4;
- (void)placeViewControllerDidSelectAddAPlace:(id)a3 isQuickAction:(BOOL)a4;
- (void)placeViewControllerDidSelectAddShortcut:(id)a3;
- (void)placeViewControllerDidSelectChangeAddress:(id)a3;
- (void)placeViewControllerDidSelectDisplayedAddress:(id)a3;
- (void)placeViewControllerDidSelectDownloadOffline:(id)a3 isQuickAction:(BOOL)a4;
- (void)placeViewControllerDidSelectDropPin:(id)a3;
- (void)placeViewControllerDidSelectFlyover:(id)a3;
- (void)placeViewControllerDidSelectOfflineManagement:(id)a3;
- (void)placeViewControllerDidSelectPauseOfflineDownload:(id)a3;
- (void)placeViewControllerDidSelectPlaceEnrichmentRAP:(id)a3;
- (void)placeViewControllerDidSelectRAPViewReport:(id)a3;
- (void)placeViewControllerDidSelectRefineLocation:(id)a3;
- (void)placeViewControllerDidSelectRemoveMarker:(id)a3;
- (void)placeViewControllerDidSelectRemoveShortcut:(id)a3;
- (void)placeViewControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5;
- (void)placeViewControllerDidSelectSeeMorePhotos:(id)a3 withStartingIndex:(unint64_t)a4;
- (void)placeViewControllerDidTapHikingTip:(id)a3;
- (void)placeViewControllerDidTapMiniBrowseCategory:(id)a3;
- (void)placeViewControllerDidUpdateHeight:(id)a3;
- (void)poiEnrichmentCoordinator:(id)a3 didFinishSubmissionLookup:(id)a4;
- (void)poiEnrichmentCoordinator:(id)a3 didUpdateUserConsent:(BOOL)a4;
- (void)poiEnrichmentCoordinatorDidUpdateUserSubmission:(id)a3;
- (void)prepareForPresentationWithExistingPlaceCardItem;
- (void)presentAppClip:(id)a3;
- (void)presentAppStoreApp:(id)a3;
- (void)presentExtensionFlowController:(id)a3;
- (void)presentPermissionsController:(id)a3;
- (void)presentQuickLink:(id)a3;
- (void)relatedSearchSuggestionViewController:(id)a3 didDismissWithReason:(unint64_t)a4;
- (void)relatedSearchSuggestionViewControllerDidScrollLeft:(id)a3;
- (void)relatedSearchSuggestionViewControllerDidScrollRight:(id)a3;
- (void)relatedSearchSuggestionViewControllerDidTapActionButton:(id)a3;
- (void)resetState;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchFindMyFriendDidRemoveHandleWithIdentifier:(id)a3;
- (void)setActionCoordinator:(id)a3;
- (void)setDraggableContent:(id)a3;
- (void)setExcludedContent:(int64_t)a3;
- (void)setIsAdditionalStop:(BOOL)a3;
- (void)setIsMapItemInFavorites:(BOOL)a3;
- (void)setIsPresentedInSearchAlongTheRoute:(BOOL)a3;
- (void)setNeedsContentUpdate;
- (void)setPlaceCardDelegate:(id)a3;
- (void)setPlaceCardDismissalDelegate:(id)a3;
- (void)setPlaceCardItem:(id)a3;
- (void)setPlaceCardItem:(id)a3 withHistory:(BOOL)a4;
- (void)setShouldPresentSecondaryActionWhenReady:(BOOL)a3;
- (void)suggestionViewProviderDidSelectAddPhotos:(id)a3;
- (void)suggestionViewProviderDidSelectRateThisPlace:(id)a3 overallState:(int64_t)a4;
- (void)suggestionViewProviderDidUpdateView:(id)a3;
- (void)updateContent;
- (void)updateForViewMode:(int64_t)a3;
- (void)updateHeaderTitle:(id)a3;
- (void)updatePreviewDrag;
- (void)viewContact;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willChangeLayout:(unint64_t)a3;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation PlaceCardViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PlaceCardViewController)initWithVisualEffectDisabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PlaceCardViewController;
  v3 = [(PlaceCardViewController *)&v8 initWithNibName:0 bundle:0];
  v4 = v3;
  if (v3)
  {
    v5 = [(ContaineeViewController *)v3 cardPresentationController];
    [v5 setAlwaysUseDefaultContaineeLayout:1];

    v6 = [(ContaineeViewController *)v4 cardPresentationController];
    [v6 setGrabberBlurEnabled:1];
  }
  return v4;
}

- (PlaceCardViewController)init
{
  return [(PlaceCardViewController *)self initWithVisualEffectDisabled:0];
}

- (PlaceCardViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PlaceCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (void)dealloc
{
  placeCardItem = self->_placeCardItem;
  if (placeCardItem) {
    [(PlaceCardItem *)placeCardItem removeObserver:self forKeyPath:@"mapItem"];
  }
  if (self->_currentDragSession)
  {
    v4 = +[MapsDragAndDropManager sharedManager];
    [v4 setDragSession:0];
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PlaceCardViewController;
  [(InfoCardViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PlaceCardViewController;
  [(InfoCardViewController *)&v3 viewDidLoad];
  [(PlaceCardViewController *)self initPlaceCard];
}

- (void)viewWillAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PlaceCardViewController;
  [(ContaineeViewController *)&v20 viewWillAppear:a3];
  if (self->_placeViewController)
  {
    v4 = [DrivePreferences alloc];
    v5 = +[NSUserDefaults standardUserDefaults];
    objc_super v6 = [(DrivePreferences *)v4 initWithDefaults:v5];
    v7 = [(DrivePreferences *)v6 automobileOptions];
    [(MUPlaceViewController *)self->_placeViewController setAutomobileOptions:v7];

    objc_super v8 = [WalkPreferences alloc];
    v9 = +[NSUserDefaults standardUserDefaults];
    v10 = [(WalkPreferences *)v8 initWithDefaults:v9];
    v11 = [(WalkPreferences *)v10 walkingOptions];
    [(MUPlaceViewController *)self->_placeViewController setWalkingOptions:v11];

    v12 = [TransitPreferences alloc];
    v13 = +[NSUserDefaults standardUserDefaults];
    v14 = [(WatchSyncedPreferences *)v12 initWithDefaults:v13];
    v15 = [(TransitPreferences *)v14 transitOptions];
    [(MUPlaceViewController *)self->_placeViewController setTransitOptions:v15];

    v16 = [CyclePreferences alloc];
    v17 = +[NSUserDefaults standardUserDefaults];
    v18 = [(CyclePreferences *)v16 initWithDefaults:v17];
    v19 = [(CyclePreferences *)v18 cyclingOptions];
    [(MUPlaceViewController *)self->_placeViewController setCyclingOptions:v19];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PlaceCardViewController;
  [(InfoCardViewController *)&v4 viewDidDisappear:a3];
  if (([(PlaceCardViewController *)self isMovingFromParentViewController] & 1) != 0|| sub_1000BBB44(self) == 5)
  {
    if (self->_wantsInsertOnDismiss) {
      [(PlaceCardViewController *)self insertInHistory];
    }
    [(PlaceCardViewController *)self resetState];
  }
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PlaceCardViewController;
  [(PlaceCardViewController *)&v6 viewWillLayoutSubviews];
  [(PlaceCardViewController *)self headerSecondaryNameLabelPadding];
  double v4 = v3;
  v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setHeaderTransitionHeight:v4];

  [(PlaceCardViewController *)self _updateVerifiedBusinessHeaderIfNeeded];
}

- (void)_updateVerifiedBusinessHeaderIfNeeded
{
  if (sub_1000BBB44(self) != 5)
  {
    double v3 = [(ContaineeViewController *)self cardPresentationController];
    id v4 = [v3 containerStyle];

    v5 = [(ContaineeViewController *)self cardPresentationController];
    objc_super v6 = v5;
    if (v4 == (id)4)
    {
      [v5 transitionProgressFromLayout:1 toLayout:3];
      double v8 = v7;

      if (v8 < 0.5) {
        double v9 = 0.0;
      }
      else {
        double v9 = v8 + -0.5 + v8 + -0.5;
      }
    }
    else
    {
      [v5 transitionProgressFromLayout:2 toLayout:3];
      double v9 = v10;
    }
    [(MUPlaceViewController *)self->_placeViewController setVerifiedHeaderExpansionProgress:v9];
    v11 = [(InfoCardViewController *)self titleHeaderView];
    unsigned int v12 = [v11 hideTitleLabel];

    if (v12)
    {
      id v13 = [(MUPlaceViewController *)self->_placeViewController shouldBlurChromeHeaderButtons];
      v14 = [(InfoCardViewController *)self titleHeaderView];
      id v16 = v14;
      id v15 = v13;
    }
    else
    {
      v14 = [(InfoCardViewController *)self titleHeaderView];
      id v16 = v14;
      id v15 = 0;
    }
    [v14 setBlurButtons:v15];
  }
}

- (void)copy:(id)a3
{
  id v4 = a3;
  id v5 = [(PlaceCardViewController *)self placeCardDelegate];
  [v5 placeCardViewController:self requestCopyLinkToClipboard:v4];
}

- (double)_mediumLayoutHeightInSAR
{
  v2 = [(PlaceCardViewController *)self view];
  double v3 = [v2 window];
  id v4 = [v3 windowScene];
  id v5 = [v4 screen];

  if (!v5)
  {
    id v5 = +[UIScreen mainScreen];
  }
  [v5 bounds];
  double v7 = v6;
  [v5 bounds];
  if (v7 == 320.0)
  {
    [v5 bounds];
    UIRoundToScreenScale();
    double v10 = v9;
  }
  else
  {
    double v10 = dbl_100F6F690[v8 > 750.0];
  }

  return v10;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 2 && [(PlaceCardViewController *)self isPresentedInSearchAlongTheRoute])
  {
    [(PlaceCardViewController *)self _mediumLayoutHeightInSAR];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PlaceCardViewController;
    [(InfoCardViewController *)&v6 heightForLayout:a3];
  }
  return result;
}

- (void)willChangeLayout:(unint64_t)a3
{
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  v17.receiver = self;
  v17.super_class = (Class)PlaceCardViewController;
  [(InfoCardViewController *)&v17 willChangeLayout:a3];
  double v7 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v8 = (unint64_t)[v7 containerStyle];

  BOOL v10 = v8 - 1 < 2 || (v8 & 0xFFFFFFFFFFFFFFFELL) == 4;
  if (a3 - 3 <= 1 && v10 && v6) {
    [(PlaceCardViewController *)self insertInHistory];
  }
  v11 = [(ContaineeViewController *)self cardPresentationController];
  id v12 = [v11 containeeLayout];

  unint64_t previousLayout = self->_previousLayout;
  if (previousLayout) {
    BOOL v14 = previousLayout >= (unint64_t)v12;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v15 = [(PlaceCardViewController *)self analyticsDelegate];
    [v15 infoCardAnalyticsDidSelectAction:1 eventValue:0 feedbackDelegateSelector:0];

    unint64_t previousLayout = self->_previousLayout;
  }
  if (v12 && previousLayout > (unint64_t)v12)
  {
    id v16 = [(PlaceCardViewController *)self analyticsDelegate];
    [v16 infoCardAnalyticsDidSelectAction:2 eventValue:0 feedbackDelegateSelector:0];
  }
  self->_unint64_t previousLayout = (unint64_t)v12;
}

- (double)headerSecondaryNameLabelPadding
{
  [(MUPlaceViewController *)self->_placeViewController headerSecondaryNameLabelPadding];
  return result;
}

- (void)didBecomeCurrent
{
  v18.receiver = self;
  v18.super_class = (Class)PlaceCardViewController;
  [(ContaineeViewController *)&v18 didBecomeCurrent];
  double v3 = [(PlaceCardViewController *)self placeCardDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PlaceCardViewController *)self placeCardDelegate];
    [v5 placeCardViewControllerWillBecomeCurrent:self];
  }
  [(MUPlaceViewController *)self->_placeViewController becomeActive];
  id v6 = [(PlaceCardItem *)self->_placeCardItem searchResult];
  double v7 = [v6 autocompletePerson];

  unint64_t v8 = [v7 handle];
  double v9 = [v8 handle];

  if (v9)
  {
    BOOL v10 = [_TtC4Maps33SearchFindMyFriendshipCoordinator alloc];
    v11 = [v7 handle];
    id v12 = [v11 handle];
    id v13 = [v12 handleIdentifier];
    BOOL v14 = [(SearchFindMyFriendshipCoordinator *)v10 initWith:v13];
    friendshipCoordinator = self->_friendshipCoordinator;
    self->_friendshipCoordinator = v14;

    [(SearchFindMyFriendshipCoordinator *)self->_friendshipCoordinator setDelegate:self];
    id v16 = sub_100576544();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      placeCardItem = self->_placeCardItem;
      *(_DWORD *)buf = 138412546;
      objc_super v20 = placeCardItem;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Started monitoring friendship stream for PlaceCardItem: %@, person: %@", buf, 0x16u);
    }

    [(SearchFindMyFriendshipCoordinator *)self->_friendshipCoordinator startMonitoringHandles];
  }
}

- (void)willResignCurrent:(BOOL)a3
{
  char v4 = [(PlaceCardViewController *)self placeCardDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PlaceCardViewController *)self placeCardDelegate];
    [v6 placeCardViewControllerWillResignCurrent:self];
  }
}

- (void)didResignCurrent
{
  [(MUPlaceViewController *)self->_placeViewController resignActive];
  [(PlaceCardViewController *)self _submitInlineRatingsIfNeeded];
  objc_initWeak(&location, self);
  friendshipCoordinator = self->_friendshipCoordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10095823C;
  v5[3] = &unk_1012E7ED0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  [(SearchFindMyFriendshipCoordinator *)friendshipCoordinator stopMonitoringHandlesWithCompletionHandler:v5];
  v4.receiver = self;
  v4.super_class = (Class)PlaceCardViewController;
  [(ContaineeViewController *)&v4 didResignCurrent];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)resetState
{
  [(PlaceCardViewController *)self setPlaceCardItem:0];
  self->_originalContent = 1;
  self->_shouldPresentSecondaryActionWhenReady = 0;
  self->_didInsertInHistory = 0;
  self->_shouldInsertInHistory = 0;
  self->_contentNeedsUpdating = 0;
  self->_shouldFetchDraggableViews = 0;
  self->_refinementFailed = 0;
  updatedCurrentLocation = self->_updatedCurrentLocation;
  self->_updatedCurrentLocation = 0;

  objc_super v4 = [(MUPlaceViewController *)self->_placeViewController view];
  [v4 setHidden:1];

  [(MUPlaceViewController *)self->_placeViewController resetAnalyticsState];
  self->_isAdditionalStop = 0;
  [(RelatedSearchSuggestionViewController *)self->_suggestionViewController resetData];
  suggestionViewProvider = self->_suggestionViewProvider;
  self->_suggestionViewProvider = 0;

  [(PlaceCardViewController *)self setDraggableContent:0];
  id v6 = +[ShortcutManager sharedManager];
  [v6 removeObserver:self];

  double v7 = +[CuratedCollectionSyncManager sharedManager];
  [v7 removeObserver:self];

  unint64_t v8 = +[UserProfileReportHistoryManager sharedInstance];
  double v9 = [v8 observers];
  [v9 unregisterObserver:self];

  BOOL v10 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
  [v10 unregisterObserver:self];

  offlineMapProvider = self->_offlineMapProvider;
  self->_offlineMapProvider = 0;

  libraryOperationsCoordinator = self->_libraryOperationsCoordinator;
  self->_libraryOperationsCoordinator = 0;

  collectionMembershipProvider = self->_collectionMembershipProvider;
  self->_collectionMembershipProvider = 0;

  tipKitController = self->_tipKitController;

  [(InfoCardTipKitController *)tipKitController reset];
}

- (void)prepareForPresentationWithExistingPlaceCardItem
{
  [(MUPlaceViewController *)self->_placeViewController resetAnalyticsState];
  [(MUPlaceViewController *)self->_placeViewController setForceCaptureRevealEventOnNextBecomeActive:1];
  double v3 = [(PlaceCardViewController *)self placeCardDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(PlaceCardViewController *)self placeCardDelegate];
    char v5 = [(PlaceCardViewController *)self placeCardItem];
    [v6 placeCardViewController:self willReusePlaceCardItem:v5];
  }
}

- (void)setNeedsContentUpdate
{
  if (!self->_contentNeedsUpdating)
  {
    self->_contentNeedsUpdating = 1;
    self->_shouldFetchDraggableViews = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100958634;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)hideHeader
{
  double v3 = [(InfoCardViewController *)self titleHeaderView];
  [v3 setHideTitleLabel:1];

  id v4 = [(InfoCardViewController *)self titleHeaderView];
  [v4 setHairLineAlpha:0.0];
}

- (void)updateContent
{
  self->_contentNeedsUpdating = 0;
  [(PlaceCardViewController *)self initPlaceCard];
  [(PlaceCardViewController *)self hideHeader];
  double v3 = [(InfoCardViewController *)self contentViewController];
  [v3 scrollToTopAnimated:0];

  id v4 = [(MUPlaceViewController *)self->_placeViewController view];
  [v4 setHidden:0];

  char v5 = [(PlaceCardViewController *)self placeCardItem];
  id v6 = [v5 searchResult];
  double v7 = [v6 relatedSearchSuggestion];

  if (v7)
  {
    [(PlaceCardViewController *)self _initSuggestion];
    [(PlaceCardViewController *)self _updateSuggestionVisibility];
  }
  unint64_t v8 = [(PlaceCardItem *)self->_placeCardItem mapItem];
  if ([v8 _hasMUID] && objc_msgSend(v8, "_muid"))
  {
    int v78 = 1;
  }
  else
  {
    if (![(PlaceCardItem *)self->_placeCardItem isDroppedPin]
      && [(PlaceCardItem *)self->_placeCardItem isIntermediateMapItem])
    {
      [(PlaceCardItem *)self->_placeCardItem setIsIntermediateMapItem:0];
    }
    int v78 = 0;
  }
  double v9 = +[UIApplication sharedApplication];
  BOOL v10 = [v9 delegate];

  v80 = v10;
  v81 = v8;
  if ([v10 isCoreRoutineEnabled])
  {
    v11 = [(PlaceCardViewController *)self placeCardItem];
    unsigned int v12 = [v11 isHomeWorkSchoolAddress];

    if (v12) {
      unint64_t v13 = ((self->_excludedContent << 15) & 0x40000 | ((unint64_t)((self->_excludedContent & 0x408) == 0) << 19)) ^ 0x40000;
    }
    else {
      unint64_t v13 = 0;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  unint64_t excludedContent = self->_excludedContent;
  unint64_t v79 = excludedContent >> 12;
  uint64_t v15 = (8 * (excludedContent & 1)) | v13;
  if ((excludedContent & 0x20) != 0) {
    uint64_t v16 = 0x420001061;
  }
  else {
    uint64_t v16 = 536875041;
  }
  uint64_t v17 = ~((_WORD)excludedContent << 7) & 0x100;
  objc_super v18 = [(PlaceCardViewController *)self placeCardItem];
  if ([v18 canAddToCollections]) {
    uint64_t v19 = 0x8000;
  }
  else {
    uint64_t v19 = 0;
  }

  objc_super v20 = [(PlaceCardViewController *)self placeCardItem];
  if ([v20 canAddToLibrary]) {
    uint64_t v21 = 0x10000000000;
  }
  else {
    uint64_t v21 = 0;
  }

  v22 = [(PlaceCardViewController *)self placeCardItem];
  if ([v22 canAddNote]) {
    uint64_t v23 = 0x20000000000;
  }
  else {
    uint64_t v23 = 0;
  }

  int64_t v24 = self->_excludedContent;
  unint64_t v25 = v15 & 0xFFFFFFFBFFFFFFFFLL | ((v79 & 1) << 34) | v16 | v17 | v19 | v21 | v23 | (v24 << 18) & 0x4000000 | (v24 << 20) & 0x80000000 | (v24 << 23) & 0x1000000000 | (v24 << 19) & 0x2000000 | (unint64_t)(~(v24 << 10) & 0x20000) | ~(v24 << 20) & 0x400000 | ~(v24 << 16) & 0x100000;
  v26 = +[GEOPlatform sharedPlatform];
  unsigned int v27 = [v26 isInternalInstall];

  if (v27)
  {
    v28 = +[NSUserDefaults standardUserDefaults];
    unsigned int v29 = [v28 BOOLForKey:@"__internal__PlaceCardLocationSimulation"];
    uint64_t v30 = 0x2000;
    if (!v29) {
      uint64_t v30 = 0;
    }
    v25 |= v30;
  }
  v31 = +[NSUserDefaults standardUserDefaults];
  if ([v31 BOOLForKey:@"GEOPlaceShowGEOIDKey"]) {
    uint64_t v32 = 0x1000000;
  }
  else {
    uint64_t v32 = 0;
  }

  v33 = [(PlaceCardViewController *)self placeCardItem];
  unsigned int v34 = [v33 canAddToShortcuts];
  uint64_t v35 = 0x10000000;
  if (!v34) {
    uint64_t v35 = 0;
  }
  unint64_t v36 = v32 | v25 | v35;

  unint64_t v37 = v36 | ((unint64_t)self->_isAdditionalStop << 33) | ((unint64_t)self->_isPresentedInSearchAlongTheRoute << 35);
  uint64_t v38 = v37 | 0x40800000;
  if (MapsFeature_IsEnabled_MapsWally())
  {
    v39 = [(PlaceCardViewController *)self placeCardItem];
    unsigned int v40 = [v39 canShowOpenFindMyAction];

    if (v40)
    {
      uint64_t v38 = v37 | 0x2040800000;
    }
    else
    {
      v41 = [(PlaceCardViewController *)self placeCardItem];
      unsigned int v42 = [v41 canShowRequestLocation];

      if (v42) {
        uint64_t v38 = v37 | 0x4040800000;
      }
    }
  }
  if (GEOConfigGetBOOL())
  {
    v43 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v44 = [v43 isUsingOfflineMaps];

    if (!v44) {
      v38 |= 0x40000000000uLL;
    }
  }
  [(MUPlaceViewController *)self->_placeViewController setOptions:v38];
  if (!v78 || self->_refinementFailed) {
    goto LABEL_46;
  }
  if (([v81 _hasResolvablePartialInformation] & 1) == 0)
  {
    v75 = [v81 _geoMapItem];
    if (([v75 hasExpiredComponents] & 1) != 0
      || [(PlaceCardItem *)self->_placeCardItem isIntermediateMapItem]
      || (objc_msgSend(v81, "_maps_isIncompleteVenueSearchResult") & 1) != 0)
    {

      goto LABEL_64;
    }
    if (objc_msgSend(v81, "_maps_isVenueOrBuilding"))
    {
      v76 = [v81 _browseCategories];
      if (![v76 count])
      {
        BOOL originalContent = self->_originalContent;

        if (originalContent) {
          goto LABEL_64;
        }
LABEL_46:
        v45 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
        [v45 disableDeferLoggingUntilRefinementWithShouldInvokeReveal:0];
        uint64_t v46 = 0;
        goto LABEL_47;
      }
    }
    goto LABEL_46;
  }
LABEL_64:
  uint64_t v46 = 1;
  [(PlaceCardItem *)self->_placeCardItem setIsIntermediateMapItem:1];
  v45 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
  [v45 setDisableDeferLoggingUntilRefinement];
LABEL_47:

  [(InfoCardTipKitController *)self->_tipKitController setNeedsRefinement:v46];
  v47 = [(PlaceCardItem *)self->_placeCardItem placeItem];
  [(MUPlaceViewController *)self->_placeViewController setPlaceItem:v47 updateOriginalContact:!self->_originalContent];
  v48 = [v47 name];
  v49 = [(InfoCardViewController *)self titleHeaderView];
  [v49 setTitle:v48];

  [(PlaceCardViewController *)self _updateTitleHeaderViewConstraintsIfNeeded];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if ([(PlaceCardItem *)self->_placeCardItem isCurrentLocation])
    {
      libraryOperationsCoordinator = self->_libraryOperationsCoordinator;
      self->_libraryOperationsCoordinator = 0;
    }
    else
    {
      v51 = objc_alloc_init(_TtC4Maps37PlaceCardLibraryOperationsCoordinator);
      v52 = self->_libraryOperationsCoordinator;
      self->_libraryOperationsCoordinator = v51;

      [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator setViewControllerForPresentingAlert:self];
      [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator registerObserver:self];
      libraryOperationsCoordinator = [(PlaceCardViewController *)self mapItem];
      [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator setMapItem:libraryOperationsCoordinator];
    }

    [(MUPlaceViewController *)self->_placeViewController setLibraryAccessProvider:self->_libraryOperationsCoordinator];
    [(InfoCardViewController *)self rebuildHeaderViewButtons];
  }
  [(InfoCardViewController *)self rebuildHeaderMenu];
  v53 = [(ContaineeViewController *)self cardPresentationController];
  id v54 = [v53 containeeLayout];

  if (v54 == (id)1) {
    [(InfoCardViewController *)self applyAlphaToContent:0.0];
  }
  [(InfoCardViewController *)self applyLayoutToContent:v54];
  v55 = +[ShortcutManager sharedManager];
  [v55 addObserver:self];

  v56 = +[MapsFavoritesManager sharedManager];
  [v56 registerObserver:self];

  [(PlaceCardViewController *)self _updateShortcut];
  v57 = objc_alloc_init(_TtC4Maps37PlaceCardCollectionMembershipProvider);
  collectionMembershipProvider = self->_collectionMembershipProvider;
  self->_collectionMembershipProvider = v57;

  [(PlaceCardCollectionMembershipProvider *)self->_collectionMembershipProvider setDelegate:self];
  v59 = [(PlaceCardViewController *)self placeCardItem];
  v60 = [v59 mapItem];
  [(PlaceCardCollectionMembershipProvider *)self->_collectionMembershipProvider setMapItem:v60];

  v61 = +[CuratedCollectionSyncManager sharedManager];
  [v61 addObserver:self];

  [(PlaceCardViewController *)self _updateCollectionsAnimated:0];
  v62 = +[UserProfileReportHistoryManager sharedInstance];
  v63 = [v62 observers];
  [v63 registerObserver:self];

  [(PlaceCardViewController *)self _updateRAPInReviewStatus];
  v64 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
  [v64 registerObserver:self];

  if (MapsFeature_IsEnabled_SydneyARP())
  {
    v65 = [[UGCSuggestionViewProvider alloc] initWithMapItem:v81];
    suggestionViewProvider = self->_suggestionViewProvider;
    self->_suggestionViewProvider = v65;

    [(UGCSuggestionViewProvider *)self->_suggestionViewProvider setDelegate:self];
  }
  if (v46)
  {
    v67 = +[UIApplication sharedMapsDelegate];
    v68 = [v67 poiSearchManager];

    v69 = [(PlaceCardViewController *)self placeCardDelegate];
    id v70 = [v69 newTraits];

    [v70 useOnlineToOfflineFailoverRequestModeIfAllowed];
    v71 = [v81 _identifier];
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1009590C8;
    v82[3] = &unk_1013033A8;
    v82[4] = self;
    [v68 searchForIdentifier:v71 allowExpired:0 traits:v70 completionHandler:v82];
  }
  v72 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  [v72 setNeedsUserActivityUpdate];

  self->_shouldFetchDraggableViews = !self->_contentNeedsUpdating;
  [(PlaceCardViewController *)self _updateCallToActionStateIfNeeded];
  [(PlaceCardViewController *)self _updateVerifiedBusinessHeaderIfNeeded];
  v73 = [[PlaceCardOfflineMapProvider alloc] initWithMapItem:v81];
  offlineMapProvider = self->_offlineMapProvider;
  self->_offlineMapProvider = v73;

  [(MUPlaceViewController *)self->_placeViewController setOfflineMapProvider:self->_offlineMapProvider];
  [(PlaceCardViewController *)self _updateOfflineFeatureDiscoveryViewIfNeededWithMapItem:v81];
}

- (void)_carryOverTransitDisplayInformationFromCurrentItemToNewFetchedResult:(id)a3
{
  id v14 = a3;
  id v4 = [(PlaceCardViewController *)self placeCardItem];
  char v5 = [v4 mapItem];
  id v6 = [v5 _geoMapItem];

  double v7 = [v14 mapItem];
  unint64_t v8 = [v7 _geoMapItem];

  double v9 = [v6 _identifier];
  BOOL v10 = [v8 _identifier];
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v12 = [v6 _labelMarker];
      if (objc_opt_respondsToSelector())
      {
        unint64_t v13 = [v8 _mapItemBySettingIsTransitDisplayFeature:[v12 isTransit]];
        [v14 updateWithGEOMapItem:v13];
      }
    }
  }
}

- (id)analyticsDelegate
{
  return [(MUPlaceViewController *)self->_placeViewController analyticsController];
}

- (void)handleShareWithPresentationOptions:(id)a3
{
}

- (id)libraryAccessProvider
{
  return self->_libraryOperationsCoordinator;
}

- (void)handleAddOrRemoveFromLibraryHeaderAction:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator mapItem];
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", [v5 _muid], v3, 201);

  [(InfoCardTipKitController *)self->_tipKitController usedAddToLibrary];

  [(PlaceCardViewController *)self handleAddOrRemovePlaceFromLibrary:v3];
}

- (void)handleAddOrRemovePlaceFromLibrary:(BOOL)a3
{
  libraryOperationsCoordinator = self->_libraryOperationsCoordinator;
  if (a3)
  {
    char v5 = [(PlaceCardLibraryOperationsCoordinator *)libraryOperationsCoordinator mapItem];
    unsigned int v6 = [v5 _maps_canRenameCollectionItem];

    if (v6)
    {
      double v7 = [(PlaceCardViewController *)self placeCardDelegate];
      unint64_t v8 = [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator mapItem];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10095966C;
      v10[3] = &unk_1012E78C8;
      v10[4] = self;
      [v7 placeCardViewController:self editNameOfMapItem:v8 saveHandler:v10 cancelHandler:0];
    }
    else
    {
      double v9 = self->_libraryOperationsCoordinator;
      [(PlaceCardLibraryOperationsCoordinator *)v9 addPlaceToLibraryWithCustomName:0];
    }
  }
  else
  {
    [(PlaceCardLibraryOperationsCoordinator *)libraryOperationsCoordinator deletePlaceFromLibrary];
  }
}

- (void)updateHeaderTitle:(id)a3
{
  placeViewController = self->_placeViewController;
  id v5 = a3;
  [(MUPlaceViewController *)placeViewController updateHeaderTitle];
  id v6 = [(InfoCardViewController *)self titleHeaderView];
  [v6 setTitle:v5];
}

- (void)setPlaceCardItem:(id)a3 withHistory:(BOOL)a4
{
  self->_shouldInsertInHistory = a4;
  self->_suppressNotifyMapItemDidChange = 1;
  [(PlaceCardViewController *)self setPlaceCardItem:a3];
  self->_suppressNotifyMapItemDidChange = 0;
}

- (void)setPlaceCardItem:(id)a3
{
  p_placeCardItem = &self->_placeCardItem;
  id v9 = a3;
  if (PlaceCardItemsAreEqual(*p_placeCardItem, v9))
  {
    id v6 = [(InfoCardViewController *)self contentViewController];
    [v6 scrollToTopAnimated:0];
  }
  else
  {
    double v7 = [(PlaceCardViewController *)self placeCardDelegate];
    [v7 placeCardViewController:self placeCardItemWillChange:v9];

    if (*p_placeCardItem) {
      [(PlaceCardItem *)*p_placeCardItem removeObserver:self forKeyPath:@"mapItem"];
    }
    objc_storeStrong((id *)&self->_placeCardItem, a3);
    self->_shouldPresentSecondaryActionWhenReady = 0;
    [(PlaceCardViewController *)self _updatePopoverCoordinate];
    if (*p_placeCardItem)
    {
      [(PlaceCardItem *)*p_placeCardItem addObserver:self forKeyPath:@"mapItem" options:0 context:off_1015EE5E8];
      unint64_t v8 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
      [v8 registerObserver:self];

      [(PlaceCardViewController *)self placeCardItemMapItemDidChangeWithFailedRefinement:0];
      [(PlaceCardViewController *)self _updateCallToActionStateIfNeeded];
    }
  }
}

- (void)setExcludedContent:(int64_t)a3
{
  if (self->_excludedContent != a3)
  {
    self->_unint64_t excludedContent = a3;
    [(PlaceCardViewController *)self setNeedsContentUpdate];
  }
}

- (void)setIsAdditionalStop:(BOOL)a3
{
  if (self->_isAdditionalStop != a3)
  {
    self->_isAdditionalStop = a3;
    [(PlaceCardViewController *)self setNeedsContentUpdate];
  }
}

- (void)setIsPresentedInSearchAlongTheRoute:(BOOL)a3
{
  if (self->_isPresentedInSearchAlongTheRoute != a3)
  {
    self->_isPresentedInSearchAlongTheRoute = a3;
    [(PlaceCardViewController *)self setNeedsContentUpdate];
  }
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)[(MUPlaceViewController *)self->_placeViewController lookAroundView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015EE5E8 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", @"mapItem", a4, a5))
    {
      [(PlaceCardViewController *)self placeCardItemMapItemDidChangeWithFailedRefinement:0];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PlaceCardViewController;
    -[InfoCardViewController observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)placeCardItemMapItemDidChangeWithFailedRefinement:(BOOL)a3
{
  self->_refinementFailed = a3;
  id v4 = [(PlaceCardViewController *)self placeCardDelegate];
  id v5 = [(PlaceCardViewController *)self placeCardItem];
  [v4 placeCardViewController:self didUpdateLinkedPlacesFromPlaceCardItem:v5];

  if (!self->_suppressNotifyMapItemDidChange)
  {
    id v6 = [(PlaceCardViewController *)self placeCardDelegate];
    objc_super v7 = [(PlaceCardViewController *)self placeCardItem];
    unint64_t v8 = [v7 mapItem];
    [v6 placeCardViewController:self mapItemDidChange:v8];
  }

  [(PlaceCardViewController *)self setNeedsContentUpdate];
}

- (void)insertInHistory
{
  if (!self->_didInsertInHistory && self->_shouldInsertInHistory)
  {
    placeCardItem = self->_placeCardItem;
    if (placeCardItem)
    {
      if ([(PlaceCardItem *)placeCardItem shouldInsertInHistory])
      {
        id v4 = [(PlaceCardItem *)self->_placeCardItem mapItem];
        id v5 = [(PlaceCardItem *)self->_placeCardItem searchResult];
        id v6 = [v5 searchToSupersedeIfRecordedInHistory];
        +[HistoryEntryRecentsItem saveMapItem:v4 superseedUUID:v6 tracksRAPReportingOnly:[(PlaceCardItem *)self->_placeCardItem shouldInsertInHistoryForRAPTrackingOnly]];

        self->_didInsertInHistory = 1;
      }
    }
  }
}

- (void)didScrollPastTransition
{
  v3.receiver = self;
  v3.super_class = (Class)PlaceCardViewController;
  [(InfoCardViewController *)&v3 didScrollPastTransition];
  if (sub_1000BBB44(self) == 5) {
    self->_wantsInsertOnDismiss = 1;
  }
  else {
    [(PlaceCardViewController *)self insertInHistory];
  }
}

- (void)_updateTitleHeaderViewConstraintsIfNeeded
{
  if (sub_1000BBB44(self) == 5)
  {
    objc_super v3 = [(MUPlaceViewController *)self->_placeViewController headerViewTitleLabelToTopLayoutGuide];
    if (v3)
    {
      v28 = +[NSMutableArray array];
      unsigned int v27 = [(InfoCardViewController *)self titleHeaderView];
      unint64_t v25 = [v27 topAnchor];
      v26 = [(PlaceCardViewController *)self view];
      int64_t v24 = [v26 safeAreaLayoutGuide];
      uint64_t v23 = [v24 topAnchor];
      v22 = [v25 constraintGreaterThanOrEqualToAnchor:v23];
      v29[0] = v22;
      uint64_t v21 = [(InfoCardViewController *)self titleHeaderView];
      uint64_t v19 = [v21 trailingAnchor];
      objc_super v20 = [(PlaceCardViewController *)self view];
      objc_super v18 = [v20 safeAreaLayoutGuide];
      uint64_t v17 = [v18 trailingAnchor];
      uint64_t v16 = [v19 constraintEqualToAnchor:v17];
      v29[1] = v16;
      uint64_t v15 = [(InfoCardViewController *)self titleHeaderView];
      unint64_t v13 = [v15 leadingAnchor];
      id v14 = [(PlaceCardViewController *)self view];
      id v4 = [v14 safeAreaLayoutGuide];
      id v5 = [v4 leadingAnchor];
      id v6 = [v13 constraintEqualToAnchor:v5];
      v29[2] = v6;
      objc_super v7 = [(InfoCardViewController *)self titleHeaderView];
      unint64_t v8 = [v7 topAnchor];
      id v9 = [v3 topAnchor];
      [v8 constraintGreaterThanOrEqualToAnchor:v9];
      v11 = BOOL v10 = v3;
      v29[3] = v11;
      unsigned int v12 = +[NSArray arrayWithObjects:v29 count:4];
      [v28 addObjectsFromArray:v12];

      objc_super v3 = v10;
      [(InfoCardViewController *)self updateHeaderWithConstraints:v28];
    }
  }
}

- (void)_updateOfflineFeatureDiscoveryViewIfNeededWithMapItem:(id)a3
{
  id v4 = a3;
  uint64_t UInteger = GEOConfigGetUInteger();
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v7 = [v6 BOOLForKey:@"OfflineMapsPlaceCardDownloadTipsShownKey"];

  unint64_t v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = (char *)[v8 integerForKey:@"OfflineMapsPlaceCardDownloadTipsDisplayedCountKey"];

  if ((v7 & 1) == 0 && (uint64_t)v9 < UInteger)
  {
    BOOL v10 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v11 = [v4 _displayMapRegion];
    unsigned __int8 v12 = [v10 isRegionDownloaded:v11 requireFullyDownloaded:0];

    if ((v12 & 1) == 0
      && ((objc_msgSend(v4, "_maps_isLargeAreaPlace") & 1) != 0
       || [v4 _isMapItemTypeSettlement]))
    {
      unint64_t v13 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
      -[ImageIconWithBackgroundConfiguration setIconSize:](v13, "setIconSize:", 35.0, 35.0);
      id v14 = +[UIColor systemGrayColor];
      [(ImageIconWithBackgroundConfiguration *)v13 setTintColor:v14];

      uint64_t v15 = +[UIColor clearColor];
      [(ImageIconWithBackgroundConfiguration *)v13 setBackgroundColor:v15];

      uint64_t v16 = +[UIImageSymbolConfiguration configurationWithPointSize:34.0];
      +[UIImage systemImageNamed:@"arrow.down.circle" withConfiguration:v16];
      uint64_t v17 = v28 = self;
      unsigned int v29 = [v17 _maps_imageIconWithBackgroundConfiguration:v13];

      objc_super v18 = +[NSBundle mainBundle];
      uint64_t v19 = [v18 localizedStringForKey:@"[Offline] download tip title in placecard" value:@"localized string not found" table:@"Offline"];
      objc_super v20 = [v4 name];
      uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20);

      v22 = +[NSBundle mainBundle];
      uint64_t v23 = [v22 localizedStringForKey:@"[Offline] download tip subtitle in placecard" value:@"localized string not found" table:@"Offline"];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10095A230;
      v30[3] = &unk_1012E5D08;
      v30[4] = v28;
      LOBYTE(v27) = 1;
      int64_t v24 = [[FeatureDiscoveryModel alloc] initWithImage:v29 title:v21 subtitle:v23 actionTitle:0 actionHandler:0 bodyTapHandler:0 displayedHandler:0 dismissHandler:v30 disableAffordanceAfterAction:v27];
      [(FeatureDiscoveryModel *)v24 setIsTipMode:1];
      unint64_t v25 = -[FeatureDiscoveryView initWithFrame:]([FeatureDiscoveryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(FeatureDiscoveryView *)v25 setModel:v24];
      [(MUPlaceViewController *)v28->_placeViewController setOfflineFeatureDiscoveryView:v25];
      v26 = +[NSUserDefaults standardUserDefaults];
      [v26 setInteger:v9 + 1 forKey:@"OfflineMapsPlaceCardDownloadTipsDisplayedCountKey"];
    }
  }
}

- (void)_clearOfflineDownloadTipIfNeeded
{
  objc_super v3 = [(MUPlaceViewController *)self->_placeViewController offlineFeatureDiscoveryView];

  if (v3)
  {
    placeViewController = self->_placeViewController;
    [(MUPlaceViewController *)placeViewController setOfflineFeatureDiscoveryView:0];
  }
}

- (void)initPlaceCard
{
  if (!self->_placeViewController)
  {
    objc_super v3 = (MUPlaceViewController *)[objc_alloc((Class)MUPlaceViewController) initWithMapItem:0];
    placeViewController = self->_placeViewController;
    self->_placeViewController = v3;

    [(MUPlaceViewController *)self->_placeViewController setPlaceViewControllerDelegate:self];
    [(MUPlaceViewController *)self->_placeViewController setMapsAppDelegate:self];
    [(InfoCardViewController *)self setContentViewController:self->_placeViewController];
    id v5 = +[UIColor clearColor];
    id v6 = [(MUPlaceViewController *)self->_placeViewController view];
    [v6 setBackgroundColor:v5];

    unsigned __int8 v7 = [(MUPlaceViewController *)self->_placeViewController view];
    [v7 _setHostsLayoutEngine:1];

    unint64_t v8 = [(MUPlaceViewController *)self->_placeViewController view];
    [v8 _maps_annotateViewWithPlaceCardViewController:self];

    id v9 = objc_alloc_init(_TtC4Maps34MapsSyncPlaceItemMapStorageUpdater);
    mapsSyncPlaceItemMapStorageUpdater = self->_mapsSyncPlaceItemMapStorageUpdater;
    self->_mapsSyncPlaceItemMapStorageUpdater = v9;

    unsigned int v11 = [[_TtC4Maps24InfoCardTipKitController alloc] initWithHostViewController:self];
    tipKitController = self->_tipKitController;
    self->_tipKitController = v11;

    id v16 = +[GEOPlatform sharedPlatform];
    if ([v16 isInternalInstall])
    {
      unint64_t v13 = +[NSUserDefaults standardUserDefaults];
      unsigned int v14 = [v13 BOOLForKey:@"EnablePlacecardImpressionLoggingVisualization"];

      if (!v14) {
        return;
      }
      id v16 = +[MapsImpressionsPlaceCardFloatingDebugViewController sharedInstance];
      uint64_t v15 = [(MUPlaceViewController *)self->_placeViewController impressionsCalculator];
      [v16 setCalculator:v15];

      if (([v16 isAttached] & 1) == 0) {
        [v16 attach];
      }
    }
  }
}

+ (BOOL)shouldInsertRecentPOIForRouting
{
  if (qword_101610128 != -1) {
    dispatch_once(&qword_101610128, &stru_1013033C8);
  }
  return byte_101610120;
}

- (void)updateForViewMode:(int64_t)a3
{
  p_placeCardDelegate = &self->_placeCardDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_placeCardDelegate);
    [v8 placeCardViewController:self didUpdateForViewMode:a3];
  }
}

- (BOOL)isActive
{
  return [(MUPlaceViewController *)self->_placeViewController isActive];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
}

- (void)mapView:(id)a3 didGetHikingToolTipRegionId:(unint64_t)a4
{
}

- (void)placeViewController:(id)a3 launchAttributionURLs:(id)a4 withAttribution:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    id v21 = v10;
    id v22 = v9;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[NSURL URLWithString:*(void *)(*((void *)&v24 + 1) + 8 * (void)v15)];
        uint64_t v17 = [v16 scheme];
        if ([v17 isEqualToString:@"http"])
        {

LABEL_12:
          objc_super v20 = [(PlaceCardViewController *)self placeCardDelegate];
          [v20 placeCardViewController:self openURL:v16];

          id v10 = v21;
          id v9 = v22;
          goto LABEL_13;
        }
        objc_super v18 = [v16 scheme];
        unsigned int v19 = [v18 isEqualToString:@"https"];

        if (v19) {
          goto LABEL_12;
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v10 = v21;
      id v9 = v22;
      if (v13) {
        continue;
      }
      break;
    }
  }

  +[MKAppLaunchController launchAttributionURLs:v11 withAttribution:v9 completionHandler:v10];
LABEL_13:
}

- (double)placeViewControllerPlaceCardHeaderTitleTrailingConstant:(id)a3
{
  if (+[UIFont accessibilityTextEnabled]) {
    return 0.0;
  }

  [(InfoCardViewController *)self titleTrailingConstant];
  return result;
}

- (id)traitsForPlaceViewController:(id)a3
{
  objc_super v3 = [(PlaceCardViewController *)self placeCardDelegate];
  id v4 = [v3 newTraits];

  return v4;
}

- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithMode:(unint64_t)a4
{
  unint64_t v4 = a4;
  switch(a4)
  {
    case 1uLL:
      break;
    case 2uLL:
      unint64_t v4 = 2;
      break;
    case 4uLL:
      unint64_t v4 = 3;
      break;
    case 8uLL:
      unint64_t v4 = 5;
      break;
    default:
      unint64_t v4 = 0;
      break;
  }
  [(PlaceCardViewController *)self _routeToCurrentSearchResultWithTransportType:v4];
}

- (void)placeViewController:(id)a3 didSelectDirectionsForDestinationMapItem:(id)a4 transportType:(id)a5
{
  id v7 = a4;
  if (v7)
  {
    id v8 = a5;
    unsigned int v9 = [(PlaceCardViewController *)self isAdditionalStop];
    id v10 = objc_alloc_init(SearchFieldItem);
    if (v9)
    {
      id v11 = [[SearchResult alloc] initWithMapItem:v7];
      [(SearchFieldItem *)v10 setSearchResult:v11];

      long long v26 = v10;
      id v12 = +[NSArray arrayWithObjects:&v26 count:1];
    }
    else
    {
      id v13 = +[SearchResult currentLocationSearchResult];
      [(SearchFieldItem *)v10 setSearchResult:v13];

      uint64_t v14 = objc_alloc_init(SearchFieldItem);
      uint64_t v15 = [[SearchResult alloc] initWithMapItem:v7];
      [(SearchFieldItem *)v14 setSearchResult:v15];

      v25[0] = v10;
      v25[1] = v14;
      id v12 = +[NSArray arrayWithObjects:v25 count:2];
    }
    id v16 = [DirectionItem alloc];
    uint64_t v17 = (char *)[v8 integerValue];

    if ((unint64_t)(v17 - 1) < 4) {
      uint64_t v18 = (uint64_t)(v17 + 1);
    }
    else {
      uint64_t v18 = 1;
    }
    unsigned int v19 = [(DirectionItem *)v16 initWithItems:v12 transportType:v18];
    objc_super v20 = +[NSNumber numberWithBool:[(PlaceCardViewController *)self isAdditionalStop]];
    v24[2] = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:3];

    id v22 = [(PlaceCardViewController *)self placeCardDelegate];
    [v22 placeCardViewController:self doDirectionItem:v19 userInfo:v21];
  }
}

- (void)placeViewController:(id)a3 didSelectDirectionsForDestinationAddress:(id)a4 contact:(id)a5 transportType:(id)a6
{
  id v9 = a4;
  if (v9 && a5)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = [[AddressBookAddress alloc] initWithContact:v11 addressValue:v9];

    id v13 = [SearchResult alloc];
    uint64_t v14 = [(AddressBookAddress *)v12 generatedMapItem];
    uint64_t v15 = [(SearchResult *)v13 initWithMapItem:v14];

    unsigned int v16 = [(PlaceCardViewController *)self isAdditionalStop];
    uint64_t v17 = objc_alloc_init(SearchFieldItem);
    if (v16)
    {
      uint64_t v18 = [[SearchResult alloc] initWithSearchResult:v15 address:v12];
      [(SearchFieldItem *)v17 setSearchResult:v18];

      v39 = v17;
      unsigned int v19 = +[NSArray arrayWithObjects:&v39 count:1];
    }
    else
    {
      objc_super v20 = +[SearchResult currentLocationSearchResult];
      [(SearchFieldItem *)v17 setSearchResult:v20];

      id v21 = objc_alloc_init(SearchFieldItem);
      uint64_t v35 = v15;
      id v22 = [[SearchResult alloc] initWithSearchResult:v15 address:v12];
      uint64_t v23 = [v9 identifier];
      long long v24 = +[MapsAutocompletePerson sharedLocationLabelIdentifier];
      unsigned int v25 = [v23 isEqualToString:v24];

      if (v25)
      {
        long long v26 = [(PlaceCardItem *)self->_placeCardItem searchResult];
        long long v27 = [v26 autocompletePerson];
        [(SearchResult *)v22 setAutocompletePerson:v27];
      }
      [(SearchFieldItem *)v21 setSearchResult:v22];
      v38[0] = v17;
      v38[1] = v21;
      unsigned int v19 = +[NSArray arrayWithObjects:v38 count:2];

      uint64_t v15 = v35;
    }

    v28 = [DirectionItem alloc];
    unsigned int v29 = (char *)[v10 integerValue];

    if ((unint64_t)(v29 - 1) < 4) {
      uint64_t v30 = (uint64_t)(v29 + 1);
    }
    else {
      uint64_t v30 = 1;
    }
    v31 = [(DirectionItem *)v28 initWithItems:v19 transportType:v30];
    v36[0] = @"DirectionsRestoreCamera";
    v36[1] = @"DirectionsSessionInitiatorKey";
    v37[0] = &__kCFBooleanTrue;
    v37[1] = &off_1013A95F8;
    v36[2] = @"AppendDirectionItem";
    uint64_t v32 = +[NSNumber numberWithBool:[(PlaceCardViewController *)self isAdditionalStop]];
    v37[2] = v32;
    v33 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];

    unsigned int v34 = [(PlaceCardViewController *)self placeCardDelegate];
    [v34 placeCardViewController:self doDirectionItem:v31 userInfo:v33];
  }
}

- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithTransportTypePreference:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = (char *)[v6 integerValue];
    if ((unint64_t)(v8 - 1) < 4) {
      uint64_t v9 = (uint64_t)(v8 + 1);
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(PlaceCardViewController *)self _routeToCurrentSearchResultWithTransportType:v9];
}

- (id)shareItemSource
{
  objc_super v3 = [(PlaceCardViewController *)self placeCardItem];
  if ([v3 isCurrentLocation])
  {
    updatedCurrentLocation = self->_updatedCurrentLocation;
    if (updatedCurrentLocation)
    {
      id v5 = updatedCurrentLocation;
    }
    else
    {
      id v8 = [(PlaceCardViewController *)self placeCardItem];
      id v5 = [v8 mapItem];
    }
    uint64_t v9 = +[ShareItem shareItemForCurrentLocationIncludingPrintActivity:1 withBackingMapItem:v5];
  }
  else
  {
    id v6 = [v3 searchResult];
    id v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v10 = [SearchResult alloc];
      id v11 = [v3 mapItem];
      id v5 = [(SearchResult *)v10 initWithMapItem:v11];
    }
    id v12 = [v3 address];

    if (v12)
    {
      id v13 = [v3 address];
      [(MKMapItem *)v5 setAddress:v13];
    }
    uint64_t v14 = [v3 contact];
    if (v14
      && (uint64_t v15 = (void *)v14,
          [v3 address],
          unsigned int v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      id v17 = objc_alloc_init((Class)CNMutableContact);
      uint64_t v18 = [v3 contact];
      [v17 setContactType:[v18 contactType]];

      if (![v17 contactType])
      {
        unsigned int v19 = [v3 contact];
        objc_super v20 = [v19 namePrefix];
        [v17 setNamePrefix:v20];

        id v21 = [v3 contact];
        id v22 = [v21 givenName];
        [v17 setGivenName:v22];

        uint64_t v23 = [v3 contact];
        long long v24 = [v23 familyName];
        [v17 setFamilyName:v24];

        unsigned int v25 = [v3 contact];
        long long v26 = [v25 nameSuffix];
        [v17 setNameSuffix:v26];
      }
      long long v27 = +[CNContactFormatter stringFromContact:v17 style:0];
      if ([v17 contactType] == (id)1 || !objc_msgSend(v27, "length"))
      {
        v28 = [v3 contact];
        unsigned int v29 = [v28 organizationName];
        [v17 setOrganizationName:v29];
      }
      uint64_t v30 = [v3 address];
      v31 = [v30 addressValue];

      if (v31)
      {
        unint64_t v36 = v31;
        uint64_t v32 = +[NSArray arrayWithObjects:&v36 count:1];
        [v17 setPostalAddresses:v32];
      }
      id v33 = [v17 copy];
    }
    else
    {
      id v33 = [(MKMapItem *)v5 unknownContact];
    }
    if (sub_1000BBB44(self) == 5)
    {
      unsigned int v34 = &__NSArray0__struct;
    }
    else
    {
      unsigned int v34 = [(MUPlaceViewController *)self->_placeViewController createShareSheetFooterActions];
    }
    uint64_t v9 = +[ShareItem shareItemWithSearchResult:v5 contact:v33 includePrintActivity:1 applicationActivities:v34];
  }

  return v9;
}

- (id)activityViewControllerForPlaceViewController:(id)a3
{
  p_placeCardDelegate = &self->_placeCardDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (id v7 = objc_loadWeakRetained((id *)p_placeCardDelegate),
        [v7 activityViewControllerForPlaceViewController:self],
        id v8 = (MapsActivityViewController *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    uint64_t v9 = [MapsActivityViewController alloc];
    id v10 = [(PlaceCardViewController *)self shareItemSource];
    id v8 = [(MapsActivityViewController *)v9 initWithShareItem:v10];

    id v11 = +[UIApplication sharedMapsDelegate];
    id v12 = [v11 appCoordinator];
    [(MapsActivityViewController *)v8 setMapsActivityDelegate:v12];
  }

  return v8;
}

- (int64_t)overriddenInterfaceStyleForPlaceViewControllerSubviews:(id)a3
{
  p_placeCardDelegate = &self->_placeCardDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_placeCardDelegate);
  id v8 = [v7 overriddenInterfaceStyleForPlaceViewControllerSubviews:self];

  return (int64_t)v8;
}

- (void)_routeToCurrentSearchResultWithTransportType:(int64_t)a3
{
  id v5 = sub_10095B858();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v6 = @"Undefined";
    }
    else {
      CFStringRef v6 = *(&off_1013035C8 + a3 - 1);
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Routing to current search result with transport type: %@", buf, 0xCu);
  }

  unsigned int v7 = [(PlaceCardViewController *)self isAdditionalStop];
  id v8 = objc_alloc_init(SearchFieldItem);
  if (v7)
  {
    uint64_t v9 = [(PlaceCardItem *)self->_placeCardItem searchResult];
    if (v9)
    {
      [(SearchFieldItem *)v8 setSearchResult:v9];
    }
    else
    {
      id v13 = [SearchResult alloc];
      uint64_t v14 = [(PlaceCardItem *)self->_placeCardItem mapItem];
      uint64_t v15 = [(SearchResult *)v13 initWithMapItem:v14];
      [(SearchFieldItem *)v8 setSearchResult:v15];
    }
    long long v27 = v8;
    unsigned int v16 = +[NSArray arrayWithObjects:&v27 count:1];
  }
  else
  {
    id v10 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v8 setSearchResult:v10];

    id v11 = objc_alloc_init(SearchFieldItem);
    id v12 = [(PlaceCardItem *)self->_placeCardItem searchResult];
    if (v12)
    {
      [(SearchFieldItem *)v11 setSearchResult:v12];
    }
    else
    {
      id v17 = [SearchResult alloc];
      uint64_t v18 = [(PlaceCardItem *)self->_placeCardItem mapItem];
      unsigned int v19 = [(SearchResult *)v17 initWithMapItem:v18];
      [(SearchFieldItem *)v11 setSearchResult:v19];
    }
    v26[0] = v8;
    v26[1] = v11;
    unsigned int v16 = +[NSArray arrayWithObjects:v26 count:2];
  }
  objc_super v20 = [[DirectionItem alloc] initWithItems:v16 transportType:a3];
  if (+[PlaceCardViewController shouldInsertRecentPOIForRouting])
  {
    [(PlaceCardViewController *)self insertInHistory];
  }
  v24[0] = @"DirectionsRestoreCamera";
  v24[1] = @"DirectionsSessionInitiatorKey";
  v25[0] = &__kCFBooleanTrue;
  v25[1] = &off_1013A95F8;
  v24[2] = @"AppendDirectionItem";
  id v21 = +[NSNumber numberWithBool:[(PlaceCardViewController *)self isAdditionalStop]];
  void v25[2] = v21;
  id v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

  uint64_t v23 = [(PlaceCardViewController *)self placeCardDelegate];
  [v23 placeCardViewController:self doDirectionItem:v20 userInfo:v22];
}

- (void)_routeFromCurrentSearchResult
{
  objc_super v3 = sub_10095B858();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Routing from current search result", v15, 2u);
  }

  unint64_t v4 = objc_alloc_init(SearchFieldItem);
  id v5 = [(PlaceCardItem *)self->_placeCardItem searchResult];
  if (v5)
  {
    [(SearchFieldItem *)v4 setSearchResult:v5];
  }
  else
  {
    CFStringRef v6 = [SearchResult alloc];
    unsigned int v7 = [(PlaceCardItem *)self->_placeCardItem mapItem];
    id v8 = [(SearchResult *)v6 initWithMapItem:v7];
    [(SearchFieldItem *)v4 setSearchResult:v8];
  }
  uint64_t v9 = [DirectionItem alloc];
  v18[0] = v4;
  id v10 = objc_opt_new();
  v18[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v18 count:2];
  id v12 = [(DirectionItem *)v9 initWithItems:v11 transportType:0];

  if (+[PlaceCardViewController shouldInsertRecentPOIForRouting])
  {
    [(PlaceCardViewController *)self insertInHistory];
  }
  v16[0] = @"DirectionsRestoreCamera";
  v16[1] = @"DirectionsSessionInitiatorKey";
  v17[0] = &__kCFBooleanTrue;
  v17[1] = &off_1013A95F8;
  id v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v14 = [(PlaceCardViewController *)self placeCardDelegate];
  [v14 placeCardViewController:self doDirectionItem:v12 userInfo:v13];
}

- (void)placeViewControllerDidUpdateHeight:(id)a3
{
  id v4 = a3;
  if (self->_shouldFetchDraggableViews)
  {
    id v8 = v4;
    id v5 = [(PlaceCardViewController *)self placeCardItem];
    unsigned __int8 v6 = [v5 isIntermediateMapItem];

    id v4 = v8;
    if ((v6 & 1) == 0)
    {
      unsigned int v7 = [(MUPlaceViewController *)self->_placeViewController draggableContent];
      [(PlaceCardViewController *)self setDraggableContent:v7];

      id v4 = v8;
    }
  }
}

- (id)secondaryButtonControllerForPlaceViewController:(id)a3
{
  return [(PlaceCardViewController *)self _secondaryButtonController];
}

- (id)alternatePrimaryButtonControllerForPlaceViewController:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    objc_initWeak(&location, self);
    id v5 = +[NSBundle mainBundle];
    unsigned __int8 v6 = [v5 localizedStringForKey:@"Plan Route [Place Card]" value:@"localized string not found" table:0];
    unsigned int v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"From Here[Place Card]" value:@"localized string not found" table:0];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10095BD14;
    v11[3] = &unk_1012F4058;
    objc_copyWeak(&v12, &location);
    uint64_t v9 = +[_MKPlaceActionButtonController actionButtonControllerWithTitle:v6 subTitle:v8 selectedBlock:v11];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)headerActionItems
{
  return [(MUPlaceViewController *)self->_placeViewController createMenuActions];
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (id)menuElementForActionItem:(id)a3
{
  id v4 = a3;
  uint64_t v30 = v4;
  if ([v4 type] == (id)16)
  {
    uint64_t v5 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:1];
LABEL_3:
    unsigned __int8 v6 = (void *)v5;
    goto LABEL_25;
  }
  if ([v4 type] != (id)21)
  {
    if ([v4 type] == (id)2)
    {
      objc_initWeak(&location, self);
      if (GEOConfigGetBOOL())
      {
        unsigned int v25 = +[NSBundle mainBundle];
        [v25 localizedStringForKey:@"[Placecard Menu] Report Something Missing" value:@"localized string not found" table:0];
      }
      else
      {
        unsigned int v25 = +[NSBundle mainBundle];
        [v25 localizedStringForKey:@"[Menu] Add to Maps" value:@"localized string not found" table:0];
      long long v27 = };

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10095C550;
      v34[3] = &unk_1012E8CD0;
      objc_copyWeak(&v35, &location);
      unsigned __int8 v6 = +[UIAction actionWithTitle:v27 image:0 identifier:0 handler:v34];
      objc_destroyWeak(&v35);

      objc_destroyWeak(&location);
      goto LABEL_25;
    }
    v33.receiver = self;
    v33.super_class = (Class)PlaceCardViewController;
    uint64_t v5 = [(InfoCardViewController *)&v33 menuElementForActionItem:v4];
    goto LABEL_3;
  }
  unsigned int v7 = [(PlaceCardViewController *)self placeCardItem];
  CFStringRef v29 = [v7 mapItem];

  id v8 = +[CollectionManager sharedManager];
  uint64_t v9 = [v8 collectionsNotContainingMapItem:v29];

  uint64_t v32 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v14 = [v13 title];
        uint64_t v15 = (void *)v14;
        if (v14) {
          CFStringRef v16 = (const __CFString *)v14;
        }
        else {
          CFStringRef v16 = &stru_101324E70;
        }
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10095C3D8;
        v39[3] = &unk_1012E6368;
        objc_copyWeak(&v40, &location);
        v39[4] = v13;
        id v17 = +[UIAction actionWithTitle:v16 image:0 identifier:0 handler:v39];

        [v32 addObject:v17];
        objc_destroyWeak(&v40);
      }
      id v10 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v10);
  }

  uint64_t v18 = +[NSBundle mainBundle];
  unsigned int v19 = [v18 localizedStringForKey:@"[Place Card] New Guide…" value:@"localized string not found" table:0];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10095C42C;
  void v36[3] = &unk_1012E6368;
  objc_copyWeak(&v38, &location);
  id v20 = v29;
  id v37 = v20;
  id v21 = +[UIAction actionWithTitle:v19 image:0 identifier:0 handler:v36];
  uint64_t v46 = v21;
  id v22 = +[NSArray arrayWithObjects:&v46 count:1];
  uint64_t v23 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v22];

  [v32 addObject:v23];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    long long v24 = +[NSBundle mainBundle];
    [v24 localizedStringForKey:@"[Library] Add to a Guide" value:@"localized string not found" table:0];
  }
  else
  {
    long long v24 = +[NSBundle mainBundle];
    [v24 localizedStringForKey:@"[Place Card] Save to Guide" value:@"localized string not found" table:0];
  long long v26 = };

  unsigned __int8 v6 = +[UIMenu menuWithTitle:v26 children:v32];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

LABEL_25:

  return v6;
}

- (void)_showAddToLibraryTipsIfNeeded
{
  if (GEOConfigGetBOOL())
  {
    objc_super v3 = [(InfoCardViewController *)self titleHeaderView];
    id v6 = [v3 getActionButtonWithType:5];

    if (v6)
    {
      [v6 layoutIfNeeded];
      tipKitController = self->_tipKitController;
      uint64_t v5 = [v6 underlyingButton];
      [(InfoCardTipKitController *)tipKitController presentAddToLibraryTipIfNeededWithSourceItem:v5];
    }
  }
}

- (void)headerViewDidLayoutSubviews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PlaceCardViewController;
  [(InfoCardViewController *)&v4 headerViewDidLayoutSubviews:a3];
  if (sub_1000BBB44(self) != 5) {
    [(PlaceCardViewController *)self _showAddToLibraryTipsIfNeeded];
  }
}

- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4
{
  [(InfoCardViewController *)self rebuildHeaderViewButtons];

  [(InfoCardViewController *)self rebuildHeaderMenu];
}

- (void)placeCardCollectionMembershipProviderDidUpdate:(id)a3
{
}

- (unint64_t)_collectionsCount
{
  v2 = [(PlaceCardCollectionMembershipProvider *)self->_collectionMembershipProvider containingCollections];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)placeViewController:(id)a3 collectionViewsForPlaceItem:(id)a4
{
  uint64_t v5 = [a4 mapItem:a3];
  if (v5)
  {
    id v21 = v5;
    id v6 = +[NSMutableDictionary dictionary];
    unsigned int v7 = [(PlaceCardCollectionMembershipProvider *)self->_collectionMembershipProvider containingCollections];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (sub_1000BBB44(self) == 5)
          {
            CFStringRef v16 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
            id v17 = +[TwoLinesContentViewModelComposer cellModelForCollection:v15];
            [(TwoLinesContentView *)v16 setViewModel:v17];
          }
          else
          {
            CFStringRef v16 = [[CollectionView alloc] initWithCollectionViewSize:0];
            [(TwoLinesContentView *)v16 setCollectionInfo:v15];
          }
          uint64_t v18 = [v15 identifier];
          [v6 setObject:v16 forKeyedSubscript:v18];
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
    id v19 = [v6 copy];

    uint64_t v5 = v21;
  }
  else
  {
    id v19 = &__NSDictionary0__struct;
  }

  return v19;
}

- (id)placeViewController:(id)a3 webPlacecardGuidesForPlaceItem:(id)a4
{
  uint64_t v5 = [a4 mapItem:a3];
  if (v5)
  {
    long long v22 = v5;
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(PlaceCardCollectionMembershipProvider *)self->_collectionMembershipProvider containingCollections];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v11 image:v22];
          id v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
          id v13 = UIImagePNGRepresentation(v12);

          id v14 = objc_alloc((Class)MUPersonalGuideViewModel);
          uint64_t v15 = [v11 identifier];
          CFStringRef v16 = [v11 title];
          id v17 = [v11 numberOfItems];
          uint64_t v18 = [v13 base64EncodedStringWithOptions:0];
          id v19 = [v14 initWithGuideID:v15 title:v16 numberOfPlaces:v17 image:v18];

          [v6 addObject:v19];
        }
        id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }
    id v20 = [v6 copy:v22];

    uint64_t v5 = v23;
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

- (void)placeViewController:(id)a3 didSelectAddToCollectionWithPlaceActionEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PlaceCardViewController *)self placeCardItem];
  uint64_t v9 = [v8 mapItem];

  uint64_t v10 = [(CollectionSaveSession *)[CollectionAddOrRemoveSession alloc] initWithMapItem:v9];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10095CD1C;
  v14[3] = &unk_1013033F0;
  objc_copyWeak(&v16, &location);
  id v11 = v7;
  id v15 = v11;
  [(CollectionEditSession *)v10 setAnalyticsHandler:v14];
  id v12 = [v11 sourceView];
  id v13 = [(PlaceCardViewController *)self placeCardDelegate];
  [v12 bounds];
  [v13 placeCardViewController:self pickCollectionWithSession:v10 sourceView:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)placeViewController:(id)a3 selectCollectionIdentifier:(id)a4
{
  id v6 = [(PlaceCardCollectionMembershipProvider *)self->_collectionMembershipProvider containingCollectionWithIdentifer:a4];
  if (v6)
  {
    uint64_t v5 = [(PlaceCardViewController *)self placeCardDelegate];
    [v5 placeCardViewController:self showCollection:v6];
  }
}

- (void)_addPlaceToCollection:(id)a3 editCollection:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PlaceCardViewController *)self placeCardItem];
  id v8 = [v7 mapItem];

  uint64_t v9 = [(PlaceCardViewController *)self placeCardDelegate];
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_10095D070;
  v18[3] = &unk_101303440;
  id v10 = v6;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  BOOL v23 = a4;
  id v12 = v9;
  id v21 = v12;
  objc_copyWeak(&v22, &location);
  id v13 = objc_retainBlock(v18);
  if (objc_msgSend(v11, "_maps_canRenameCollectionItem"))
  {
    id v14 = [(PlaceCardViewController *)self placeCardDelegate];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10095D274;
    v15[3] = &unk_1012E8EE0;
    id v16 = v11;
    id v17 = v13;
    [v14 placeCardViewController:self editNameOfMapItem:v16 saveHandler:v15 cancelHandler:0];
  }
  else
  {
    ((void (*)(void *))v13[2])(v13);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_updateCollectionsAnimated:(BOOL)a3
{
  [(MUPlaceViewController *)self->_placeViewController updateCollectionViewsAnimated:a3];
  [(MUPlaceViewController *)self->_placeViewController setPlaceInCollections:[(PlaceCardViewController *)self _collectionsCount] != 0];
  [(MUPlaceViewController *)self->_placeViewController updateActionRowView];

  [(InfoCardViewController *)self rebuildHeaderMenu];
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
}

- (void)placeEnrichmentAPIContollerDidFetchEnrichmentData:(id)a3 forMapItem:(id)a4
{
  id v5 = a4;
  id v6 = [(PlaceCardViewController *)self placeCardItem];
  id v7 = [v6 mapItem];
  unsigned int v8 = [v7 isEqual:v5];

  if (v8)
  {
    placeViewController = self->_placeViewController;
    [(MUPlaceViewController *)placeViewController updatePlaceEnrichment];
  }
}

- (void)_updateRAPInReviewStatus
{
  [(MUPlaceViewController *)self->_placeViewController setPlaceNumberOfReportsInReview:[(PlaceCardViewController *)self _numberOfRAPsInReview]];
  placeViewController = self->_placeViewController;

  [(MUPlaceViewController *)placeViewController updatePlaceInfo];
}

- (unint64_t)_numberOfRAPsInReview
{
  if (!_MKRAPIsAvailable()) {
    return 0;
  }
  if (sub_100521BD0()) {
    return 0;
  }
  if (!MapsFeature_IsEnabled_RAPSydney()) {
    return 0;
  }
  id v3 = [(PlaceCardViewController *)self mapItem];
  objc_super v4 = [v3 _identifier];

  if (!v4) {
    return 0;
  }
  id v5 = +[UserProfileReportHistoryManager sharedInstance];
  id v6 = [v5 rapHistory];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10095D530;
  v10[3] = &unk_101303468;
  v10[4] = self;
  id v7 = sub_1000AC254(v6, v10);
  id v8 = [v7 count];

  return (unint64_t)v8;
}

- (id)placeViewControllerUserIcon:(id)a3
{
  id v3 = +[UserInformationManager sharedInstance];
  objc_super v4 = [v3 userIcon];

  return v4;
}

- (void)placeViewController:(id)a3 selectCuratedCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(PlaceCardViewController *)self placeCardDelegate];
  [v6 placeCardViewController:self showCuratedCollection:v5];
}

- (void)placeViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  id v5 = a4;
  id v6 = [(PlaceCardViewController *)self placeCardDelegate];
  [v6 placeCardViewController:self selectExploreGuidesWithGuideLocation:v5];
}

- (void)placeViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(PlaceCardViewController *)self placeCardDelegate];
  [v12 placeCardViewController:self seeAllCollections:v11 usingTitle:v10 usingCollectionIds:v9];
}

- (id)curatedCollectionSyncCoordinator
{
  return +[CuratedCollectionSyncManager sharedManager];
}

- (void)inlinePOIEnrichmentController:(id)a3 requestsPresentationOfPhotosWithCoordinator:(id)a4
{
}

- (void)inlinePOIEnrichmentController:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5 = a4;
  id v6 = [(PlaceCardViewController *)self placeCardDelegate];
  [v6 placeCardViewController:self openURL:v5];
}

- (void)callToActionViewProviderInitialLoadingStateDidChange:(id)a3
{
}

- (void)callToActionViewProviderDidFinishResolvingEditState:(id)a3
{
}

- (void)callToActionViewProviderDidFinishClearingExistingState:(id)a3
{
}

- (void)_updatePlacecardCallToActionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    id v6 = [(UGCCallToActionViewProvider *)self->_callToActionViewProvider submissionStatusAppearance];
    if (MapsFeature_IsEnabled_SydneyARP())
    {
      [(UGCSuggestionViewProvider *)self->_suggestionViewProvider setSubmissionStatus:v6];
      [(UGCInlinePOIEnrichmentController *)self->_inlineRatingsController setSubmissionStatus:v6];
      id v5 = [(UGCCallToActionViewProvider *)self->_callToActionViewProvider lookupResult];
      [(UGCInlinePOIEnrichmentController *)self->_inlineRatingsController setLookupResult:v5];
    }
    [(MUPlaceViewController *)self->_placeViewController updateViewsWithSubmissionStatus:v6 animated:v3];
  }
}

- (void)callToActionViewProviderDidUpdateWithPreferredUserUploadedPhoto:(id)a3 photoID:(id)a4 numberOfPhotos:(int64_t)a5
{
}

- (void)placeViewControllerDidSelectSeeMorePhotos:(id)a3 withStartingIndex:(unint64_t)a4
{
  id v6 = [a3 mapItem];
  id v7 = +[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:v6 withStartingIndex:a4];

  [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v7 withProgressObserver:0];
}

- (void)placeViewController:(id)a3 didSelectAddPhotosWithPresentationOptions:(id)a4 entryPoint:(int64_t)a5 originTarget:(id)a6
{
  id v16 = a4;
  id v9 = a6;
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    if (a5 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (a5 == 2);
    }
    id v11 = [(PlaceCardViewController *)self placeCardItem];
    id v12 = [v11 mapItem];
    id v13 = +[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:v12 preferredSourceType:v10 originTarget:v9];

    id v14 = [v16 sourceView];
    [v13 setAnchoringView:v14];

    id v15 = [v16 progressObserver];
    [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v13 withProgressObserver:v15];
  }
}

- (void)placeViewController:(id)a3 didSelectEditSubmissionWithPresentationOptions:(id)a4
{
  id v9 = a4;
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    id v5 = [(PlaceCardViewController *)self placeCardItem];
    id v6 = [v5 mapItem];
    id v7 = +[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:v6 entryPoint:0 originTarget:0];

    id v8 = [v9 progressObserver];
    [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v7 withProgressObserver:v8];
  }
}

- (void)placeViewController:(id)a3 didSelectAddRatingsWithPresentationOptions:(id)a4 overallState:(int64_t)a5 originTarget:(id)a6
{
  id v15 = a4;
  id v9 = a6;
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    if (a5 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (a5 == 2);
    }
    id v11 = [(PlaceCardViewController *)self placeCardItem];
    id v12 = [v11 mapItem];
    id v13 = +[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:v12 initialOverallState:v10 entryPoint:0 originTarget:v9];

    id v14 = [v15 progressObserver];
    [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v13 withProgressObserver:v14];
  }
}

- (void)_presentPOIEnrichmentCoordinator:(id)a3 presentingViewController:(id)a4 progressObserver:(id)a5 dismissalDelegate:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_photoViewerScene) {
    +[MacPlacePhotoViewerScene teardownCurrentScene];
  }
  [v15 setPresentingViewController:v10];
  [v15 setSubmissionLookupObserver:v11];
  [v15 setPlaceCardDismissalDelegate:v12];
  [v15 setSubmissionStatusDelegate:self];
  [v15 setPresentationContext:1];
  id v13 = [(UGCCallToActionViewProvider *)self->_callToActionViewProvider lookupResult];
  [v15 setSubmissionLookupResult:v13];

  id v14 = [(PlaceCardViewController *)self placeCardDelegate];
  [v14 placeCardViewController:self presentPOIEnrichmentWithCoordinator:v15];
}

- (void)_presentPOIEnrichmentCoordinator:(id)a3 withProgressObserver:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  id v8 = [v10 topMostPresentedViewController];
  id v9 = [(PlaceCardViewController *)self placeCardDismissalDelegate];
  [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v7 presentingViewController:v8 progressObserver:v6 dismissalDelegate:v9];
}

- (void)poiEnrichmentCoordinator:(id)a3 didUpdateUserConsent:(BOOL)a4
{
}

- (void)poiEnrichmentCoordinatorDidUpdateUserSubmission:(id)a3
{
}

- (void)poiEnrichmentCoordinator:(id)a3 didFinishSubmissionLookup:(id)a4
{
  id v6 = a4;
  id v5 = [v6 status];
  if (v5 == (id)1)
  {
    [(UGCCallToActionViewProvider *)self->_callToActionViewProvider updateWithFetchedLookupResult:v6];
  }
  else if (v5 == (id)3)
  {
    [(UGCCallToActionViewProvider *)self->_callToActionViewProvider resolveForUserEdit];
  }
}

- (void)_updateCallToActionStateIfNeeded
{
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    if (!self->_callToActionViewProvider)
    {
      BOOL v3 = [[UGCCallToActionViewProvider alloc] initWithDelegate:self];
      callToActionViewProvider = self->_callToActionViewProvider;
      self->_callToActionViewProvider = v3;
    }
    id v5 = [(PlaceCardViewController *)self placeCardItem];
    id v6 = [v5 mapItem];
    id v7 = [(UGCCallToActionViewProvider *)self->_callToActionViewProvider mapItem];

    if (v6 != v7)
    {
      id v8 = [(PlaceCardViewController *)self placeCardItem];
      id v9 = [v8 mapItem];
      [(UGCCallToActionViewProvider *)self->_callToActionViewProvider setMapItem:v9];
    }
    BOOL v10 = self->_inlineRatingsController != 0;
    id v11 = self->_callToActionViewProvider;
    [(UGCCallToActionViewProvider *)v11 setAlwaysRefinesUserSubmission:v10];
  }
}

- (void)_submitInlineRatingsIfNeeded
{
}

- (id)inlineRatingViewControllerForPlaceViewController:(id)a3
{
  objc_super v4 = [(PlaceCardViewController *)self mapItem];

  if (v4)
  {
    inlineRatingsController = self->_inlineRatingsController;
    if (!inlineRatingsController) {
      goto LABEL_6;
    }
    id v6 = [(UGCInlinePOIEnrichmentController *)inlineRatingsController mapItem];
    id v7 = [(PlaceCardViewController *)self mapItem];

    if (v6 != v7)
    {
      [(PlaceCardViewController *)self _submitInlineRatingsIfNeeded];
      id v8 = self->_inlineRatingsController;
      self->_inlineRatingsController = 0;
    }
    id v9 = self->_inlineRatingsController;
    if (!v9)
    {
LABEL_6:
      BOOL v10 = [UGCInlinePOIEnrichmentController alloc];
      id v11 = [(PlaceCardViewController *)self mapItem];
      id v12 = [(UGCInlinePOIEnrichmentController *)v10 initWithMapItem:v11];
      id v13 = self->_inlineRatingsController;
      self->_inlineRatingsController = v12;

      [(UGCInlinePOIEnrichmentController *)self->_inlineRatingsController setDelegate:self];
      id v14 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
      [(UGCInlinePOIEnrichmentController *)self->_inlineRatingsController setAnalyticsController:v14];

      [(UGCInlinePOIEnrichmentController *)self->_inlineRatingsController setPresentingViewController:self];
      [(PlaceCardViewController *)self _updateCallToActionStateIfNeeded];
      [(PlaceCardViewController *)self _updatePlacecardCallToActionAnimated:0];
      id v9 = self->_inlineRatingsController;
    }
    id v15 = [(UGCInlinePOIEnrichmentController *)v9 contentViewController];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)suggestionViewForPlaceViewController:(id)a3
{
  return [(UGCSuggestionViewProvider *)self->_suggestionViewProvider suggestionView];
}

- (void)placeViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(PlaceCardViewController *)self placeCardDelegate];
  [v15 placeCardViewController:self showRelatedMapItems:v14 withTitle:v13 originalMapItem:v12 analyticsDelegate:v11];
}

- (void)placeViewController:(id)a3 didRequestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = [(PlaceCardViewController *)self placeCardDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(PlaceCardViewController *)self placeCardDelegate];
    [v9 placeCardViewController:self didRequestHikingToolTipRegionIDForLocation:latitude, longitude];
  }
}

- (id)placeViewController:(id)a3 hikingTipViewForTipModel:(id)a4
{
  id v5 = a4;
  id v6 = +[GEOFeatureStyleAttributes customSavedRouteDashedStyleAttributes];
  id v7 = [(PlaceCardViewController *)self view];
  char v8 = [v7 traitCollection];
  [v8 displayScale];
  id v9 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v6, 3, 0);

  BOOL v10 = [FeatureDiscoveryModel alloc];
  id v11 = [v5 title];
  id v12 = [v5 subtitle];

  LOBYTE(v16) = 0;
  id v13 = [(FeatureDiscoveryModel *)v10 initWithImage:v9 title:v11 subtitle:v12 actionTitle:0 actionHandler:0 bodyTapHandler:0 displayedHandler:0 dismissHandler:0 disableAffordanceAfterAction:v16];

  id v14 = objc_alloc_init(FeatureDiscoveryView);
  [(FeatureDiscoveryView *)v14 setModel:v13];

  return v14;
}

- (void)placeViewControllerDidTapHikingTip:(id)a3
{
  objc_super v4 = [(PlaceCardViewController *)self placeCardDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PlaceCardViewController *)self placeCardDelegate];
    [v6 placeCardViewControllerDidTapHikingTip:self];

    id v7 = [(PlaceCardViewController *)self analyticsDelegate];
    [v7 infoCardAnalyticsDidSelectAction:465 eventValue:0 feedbackDelegateSelector:0];
  }
}

- (id)_shortcut
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    BOOL v3 = +[MapsFavoritesManager sharedManager];
    objc_super v4 = [(PlaceCardViewController *)self placeCardItem];
    char v5 = [v4 mapItem];
    [v3 shortcutForMapItem:v5];
  }
  else
  {
    id v6 = +[ShortcutManager sharedManager];
    BOOL v3 = [v6 meCard];

    objc_super v4 = [(PlaceCardViewController *)self placeCardItem];
    char v5 = [v4 mapItem];
    [v3 _maps_shortcutIncludingHiddenForMapItem:v5];
  id v7 = };

  return v7;
}

- (BOOL)_isHomeWorkSchoolShortcut
{
  v2 = [(PlaceCardViewController *)self _shortcut];
  BOOL v3 = v2;
  BOOL v4 = v2
    && ([v2 isHidden] & 1) == 0
    && ([v3 type] == (id)2 || [v3 type] == (id)3 || [v3 type] == (id)5);

  return v4;
}

- (void)placeViewControllerDidSelectAddShortcut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PlaceCardViewController *)self _shortcut];
  if (!v5
    || (id v6 = (void *)v5,
        [(PlaceCardViewController *)self _shortcut],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isHidden],
        v7,
        v6,
        v8))
  {
    if (!self->_shortcutEditSession)
    {
      id v9 = [(PlaceCardViewController *)self _shortcut];

      if (v9)
      {
        BOOL v10 = [(PlaceCardViewController *)self _shortcut];
        id v11 = +[ShortcutEditSession addSessionWithShortcut:v10];
        id v12 = 0;
      }
      else
      {
        if ((id)[(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator savedStateOfPlace] != (id)1|| ([(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator syncObject], id v14 = objc_claimAutoreleasedReturnValue(), objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v14, (isKindOfClass & 1) == 0))
        {
          uint64_t v16 = [(PlaceCardViewController *)self placeCardItem];
          if ([v16 isHomeWorkSchoolAddress])
          {
            id v17 = [(PlaceCardViewController *)self placeCardItem];
            unint64_t v18 = (unint64_t)[v17 addressType];
            if (v18 > 2) {
              uint64_t v19 = 1;
            }
            else {
              uint64_t v19 = qword_100F72AC0[v18];
            }
          }
          else
          {
            uint64_t v19 = 1;
          }

          BOOL v10 = [(PlaceCardViewController *)self placeCardItem];
          id v13 = [(MapsFavoriteItem *)v10 mapItem];
          id v20 = +[ShortcutEditSession addSessionWithType:v19 mapItem:v13];
          shortcutEditSession = self->_shortcutEditSession;
          self->_shortcutEditSession = v20;

          id v12 = 0;
          goto LABEL_17;
        }
        id v12 = [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator syncObject];
        BOOL v10 = [[_TtC4Maps16MapsFavoriteItem alloc] initWithCollectionItem:v12];
        id v11 = +[ShortcutEditSession addSessionWithShortcut:v10];
      }
      id v13 = self->_shortcutEditSession;
      self->_shortcutEditSession = v11;
LABEL_17:

      objc_initWeak(&location, self);
      id v22 = self->_shortcutEditSession;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10095E960;
      void v24[3] = &unk_1012E5D30;
      objc_copyWeak(&v26, &location);
      id v23 = v12;
      id v25 = v23;
      [(ShortcutEditSession *)v22 saveWithCompletion:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
}

- (void)placeViewControllerDidSelectRemoveShortcut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PlaceCardViewController *)self _shortcut];
  if (v5 && !self->_shortcutEditSession)
  {
    id v6 = +[ShortcutEditSession editSessionWithShortcut:v5];
    shortcutEditSession = self->_shortcutEditSession;
    self->_shortcutEditSession = v6;

    objc_initWeak(&location, self);
    unsigned int v8 = self->_shortcutEditSession;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10095EBA8;
    v9[3] = &unk_1012E6998;
    objc_copyWeak(&v10, &location);
    [(ShortcutEditSession *)v8 removeFromShortcutsWithCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)placeViewControllerDidSelectChangeAddress:(id)a3
{
  id v4 = [(PlaceCardViewController *)self _shortcut];
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = +[ShortcutEditSession editSessionWithShortcut:v4];
    [v5 setEditingModeType:2];
    id v6 = [(PlaceCardViewController *)self placeCardDelegate];
    [v6 placeCardViewController:self editShortcut:v5];

    id v4 = v7;
  }
}

- (void)placeViewControllerDidSelectRefineLocation:(id)a3
{
  id v4 = [(PlaceCardViewController *)self _shortcut];
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = +[ShortcutEditSession editSessionWithShortcut:v4];
    [v5 setEditingModeType:3];
    id v6 = [(PlaceCardViewController *)self placeCardDelegate];
    [v6 placeCardViewController:self editShortcut:v5];

    id v4 = v7;
  }
}

- (void)_updateShortcut
{
  BOOL v3 = [(PlaceCardViewController *)self _shortcut];
  id v5 = v3;
  if (v3) {
    uint64_t v4 = [v3 isHidden] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }
  [(MUPlaceViewController *)self->_placeViewController setPlaceInShortcuts:v4];
  [(InfoCardViewController *)self rebuildHeaderMenu];
}

- (int)mapTypeForPlaceViewController:(id)a3
{
  BOOL v3 = [(PlaceCardViewController *)self placeCardDelegate];
  id v4 = [v3 displayedViewMode];
  if ((unint64_t)v4 + 1 > 7) {
    int v5 = 1;
  }
  else {
    int v5 = dword_100F72AD8[(void)v4 + 1];
  }

  return v5;
}

- (void)placeViewController:(id)a3 didSelectDepartureSequence:(id)a4 mapItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PlaceCardViewController *)self placeCardDelegate];
  [v9 placeCardViewController:self showTransitScheduleForMapItem:v7 departureSequence:v8];
}

- (BOOL)placeViewController:(id)a3 canSelectDepartureSequence:(id)a4 mapItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PlaceCardViewController *)self placeCardDelegate];
  LOBYTE(self) = [v9 placeCardViewController:self shouldShowTransitScheduleForMapItem:v7 departureSequence:v8];

  return (char)self;
}

- (void)placeViewController:(id)a3 didSelectTransitLine:(id)a4
{
  id v5 = a4;
  id v6 = [IncompleteTransitLineItem alloc];
  id v7 = [v5 mapItemIdentifier];
  id v8 = [v5 labelText];

  id v10 = [(IncompleteTransitLineItem *)v6 initWithIdentifier:v7 name:v8];
  id v9 = [(PlaceCardViewController *)self placeCardDelegate];
  [v9 placeCardViewController:self selectTransitLineItem:v10];
}

- (void)placeViewController:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [(PlaceCardViewController *)self placeCardDelegate];
  [v6 placeCardViewController:self openURL:v5];
}

- (void)placeViewController:(id)a3 showTransitIncidents:(id)a4
{
  id v5 = a4;
  id v6 = [(PlaceCardViewController *)self placeCardDelegate];
  [v6 placeCardViewController:self showTransitIncidents:v5];
}

- (void)placeViewControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = [v8 view];
  }
  id v10 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  id v11 = [v10 rapPresenter];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10095F1E8;
  v14[3] = &unk_1012ED628;
  void v14[4] = self;
  int64_t v12 = [(PlaceCardViewController *)self _overriddenUserInterfaceStyle];
  if (a5) {
    uint64_t v13 = 30;
  }
  else {
    uint64_t v13 = [(PlaceCardViewController *)self currentUITargetForAnalytics];
  }
  [v11 presentReportAProblemFromPlaceCardViewController:self editingContext:v14 overriddenUserInterfaceStyle:v12 sourceView:v9 entryPoint:v13 completion:0];
}

- (void)placeViewController:(id)a3 didSelectPhotoToReport:(id)a4 withPhotoGalleryViewController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [UGCReportImageryController alloc];
  id v10 = [(PlaceCardItem *)self->_placeCardItem mapItem];
  id v11 = [(UGCReportImageryController *)v9 initWithMapItem:v10 reportedPhoto:v8 presentingViewController:v7];

  reportImageryController = self->_reportImageryController;
  self->_reportImageryController = v11;

  [v7 startAnimatingActivityIndicatorViewForRAP];
  uint64_t v13 = self->_reportImageryController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10095F378;
  v15[3] = &unk_1012E75E8;
  id v16 = v7;
  id v14 = v7;
  [(UGCReportImageryController *)v13 fetchLayoutAndPresentWithCompletion:v15];
}

- (void)placeViewController:(id)a3 photoGalleryDidScroll:(id)a4
{
  reportImageryController = self->_reportImageryController;
  id v5 = a4;
  [(UGCReportImageryController *)reportImageryController cancelPresentation];
  [v5 stopAnimatingActivityIndicatorViewForRAP];
}

- (int64_t)_overriddenUserInterfaceStyle
{
  BOOL v3 = [(PlaceCardViewController *)self placeCardDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(PlaceCardViewController *)self placeCardDelegate];
  id v6 = [v5 overriddenInterfaceStyleForPlaceViewControllerSubviews:self];

  return (int64_t)v6;
}

- (void)placeViewControllerDidSelectAddAPlace:(id)a3 isQuickAction:(BOOL)a4
{
  placeCardItem = self->_placeCardItem;
  id v7 = a3;
  BOOL v8 = [(PlaceCardItem *)placeCardItem isDroppedPin]
    || [(PlaceCardItem *)self->_placeCardItem isCurrentLocation];
  id v9 = self->_placeCardItem;
  if (a4) {
    uint64_t v10 = 30;
  }
  else {
    uint64_t v10 = [(PlaceCardViewController *)self currentUITargetForAnalytics];
  }
  id v11 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  int64_t v12 = [v11 rapPresenter];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10095F5CC;
  v16[3] = &unk_1012ED628;
  id v17 = v9;
  uint64_t v13 = v9;
  int64_t v14 = [(PlaceCardViewController *)self _overriddenUserInterfaceStyle];
  id v15 = [v7 view];

  [v12 presentAddAPlaceFromPlacecardWithEditingContext:v16 overriddenUserInterfaceStyle:v14 shouldShowDetailedFlow:v8 sourceView:v15 entryPoint:v10 completion:0];
  +[GEOAPPortal captureUserAction:222 target:v10 value:0];
}

- (void)placeViewController:(id)a3 didSelectAddMissingDataOfType:(int64_t)a4
{
  id v6 = self->_placeCardItem;
  id v7 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  BOOL v8 = [v7 rapPresenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10095F708;
  v10[3] = &unk_1012ED628;
  id v11 = v6;
  id v9 = v6;
  [v8 presentAddMissingDataOfType:a4 fromPlacecardWithEditingContext:v10];
}

- (void)placeViewController:(id)a3 didSelectEditPlaceDetailsOfType:(int64_t)a4
{
  id v6 = self->_placeCardItem;
  id v7 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  BOOL v8 = [v7 rapPresenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10095F844;
  v10[3] = &unk_1012ED628;
  id v11 = v6;
  id v9 = v6;
  [v8 presentEditPlaceDetailsOfType:a4 fromPlacecardWithEditingContext:v10];
}

- (void)placeViewControllerDidSelectRAPViewReport:(id)a3
{
  id v4 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  BOOL v3 = [v4 rapPresenter];
  [v3 presentReportAProblemWithCompletion:0];
}

- (void)placeViewControllerDidSelectPlaceEnrichmentRAP:(id)a3
{
  id v4 = self->_placeCardItem;
  id v5 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  id v6 = [v5 rapPresenter];
  uint64_t v7 = [(PlaceCardViewController *)self currentUITargetForAnalytics];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10095F9E8;
  v9[3] = &unk_1012ED628;
  uint64_t v10 = v4;
  BOOL v8 = v4;
  [v6 presentPlaceEnrichmentRAPWithTarget:v7 fromPlacecardWithEditingContext:v9 completion:0];
}

- (void)placeViewControllerDidSelectDownloadOffline:(id)a3 isQuickAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = [(PlaceCardOfflineMapProvider *)self->_offlineMapProvider subscriptionInfo];
  if (v12)
  {
    if (v4)
    {
      id v6 = [(PlaceCardViewController *)self placeCardDelegate];
      [v6 placeCardViewControllerShowOfflineMaps:self];
    }
    else
    {
      id v6 = +[MapsOfflineUIHelper sharedHelper];
      [v6 resumeDownloadForSubscriptionInfo:v12 mode:1];
    }
  }
  else
  {
    uint64_t v7 = [(PlaceCardViewController *)self mapItem];
    BOOL v8 = [v7 _geoMapItem];
    id v6 = [v8 offlineDownloadRegion];

    id v9 = [(PlaceCardViewController *)self mapItem];
    uint64_t v10 = [v9 name];

    id v11 = [(PlaceCardViewController *)self placeCardDelegate];
    [v11 placeCardViewController:self showOfflineMapRegionSelectorForRegion:v6 name:v10 shouldShowDataManagementAfterDownload:v4];
  }
  [(PlaceCardViewController *)self _clearOfflineDownloadTipIfNeeded];
}

- (void)placeViewControllerDidSelectPauseOfflineDownload:(id)a3
{
  id v4 = [(PlaceCardOfflineMapProvider *)self->_offlineMapProvider subscriptionInfo];
  if (v4)
  {
    BOOL v3 = +[MapsOfflineUIHelper sharedHelper];
    [v3 pauseDownloadForSubscriptionInfo:v4];
  }
}

- (void)placeViewControllerDidSelectOfflineManagement:(id)a3
{
  id v4 = [(PlaceCardViewController *)self placeCardDelegate];
  [v4 placeCardViewControllerShowOfflineMaps:self];
}

- (void)placeViewControllerDidSelectFlyover:(id)a3
{
  id v6 = [(PlaceCardViewController *)self placeCardDelegate];
  id v4 = [(PlaceCardViewController *)self placeCardItem];
  id v5 = [v4 mapItem];
  [v6 placeCardViewController:self enterFlyoverForMapItem:v5];
}

- (void)placeViewControllerDidSelectDropPin:(id)a3
{
  id v5 = [(PlaceCardViewController *)self placeCardDelegate];
  id v4 = +[SearchResult currentLocationSearchResult];
  [v5 placeCardViewController:self createDroppedPin:v4];
}

- (void)placeViewController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PlaceCardViewController *)self placeCardDelegate];
  [v9 placeCardViewController:self enterLookAroundForMapItem:v8 lookAroundView:v7];
}

- (BOOL)shouldMoveLookAroundStorefrontViewForPlaceViewController:(id)a3
{
  return !self->_contentNeedsUpdating;
}

- (void)placeViewControllerDidSelectDisplayedAddress:(id)a3
{
  id v4 = [(PlaceCardViewController *)self placeCardDelegate];
  id v5 = [(PlaceCardViewController *)self placeCardItem];
  [v4 placeCardViewController:self selectDisplayedAddressFromPlaceCardItem:v5];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 wantsLayout:1];
}

- (void)placeViewControllerDidSelectRemoveMarker:(id)a3
{
  id v4 = [(PlaceCardViewController *)self placeCardItem];
  id v6 = [v4 searchResult];

  id v5 = [(PlaceCardViewController *)self placeCardDelegate];
  [v5 placeCardViewController:self removeDroppedPin:v6];
}

- (void)placeViewController:(id)a3 didSelectSearchCategory:(id)a4
{
  id v5 = a4;
  id v8 = [(PlaceCardViewController *)self placeCardDelegate];
  id v6 = [(PlaceCardViewController *)self placeCardItem];
  id v7 = [v6 mapItem];
  [v8 placeCardViewController:self presentCategoryPlacesListForMapItem:v7 searchCategory:v5];
}

- (void)placeViewController:(id)a3 didSelectParent:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    if (sub_1000BBB44(self) != 5)
    {
      id v6 = [(ContaineeViewController *)self cardPresentationController];
      id v7 = [v6 containerStyle];

      if (v7 == (id)1)
      {
        id v8 = [(ContaineeViewController *)self cardPresentationController];
        [v8 wantsLayout:2];
      }
    }
    id v9 = [(PlaceCardViewController *)self placeCardDelegate];
    [v9 placeCardViewController:self didSelectParent:v5];
  }
}

- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009600D0;
  v5[3] = &unk_1012E76C0;
  id v6 = a4;
  id v4 = v6;
  +[UIApplication _maps_unlockApplicationWithCompletion:v5];
}

- (void)placeViewControllerDidTapMiniBrowseCategory:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsLayout:3];
}

- (void)placeViewController:(id)a3 didSelectShareCurrentLocationWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v9 = [v8 isAuthorizedForPreciseLocation];

  if (v9)
  {
    v7[2](v7, 1);
  }
  else
  {
    uint64_t v10 = @"AppInfoTemporaryPreciseLocationAuthorizationForShareLocationPurposeKey";
    objc_initWeak(&location, self);
    id v11 = +[MKMapService sharedService];
    [v11 captureUserAction:56 onTarget:690 eventValue:0];

    id v12 = +[MKLocationManager sharedLocationManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10096037C;
    v13[3] = &unk_1012E9690;
    objc_copyWeak(&v15, &location);
    int64_t v14 = v7;
    [v12 requestTemporaryPreciseLocationAuthorizationWithPurposeKey:v10 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)placeViewController:(id)a3 didSelectMapsExtension:(id)a4 usingAppStoreApp:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unsigned __int8 v9 = [RestaurantReservationRouter alloc];
  uint64_t v10 = [(PlaceCardViewController *)self mapItem];
  id v11 = [(RestaurantReservationRouter *)v9 initWithExtension:v8 appStoreApp:v7 mapItem:v10 presenter:self];

  reservationRouter = self->_reservationRouter;
  self->_reservationRouter = v11;

  uint64_t v13 = self->_reservationRouter;

  [(RestaurantReservationRouter *)v13 resolve];
}

- (void)presentPermissionsController:(id)a3
{
}

- (void)placeViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = [(PlaceCardViewController *)self placeCardDelegate];
  id v12 = [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator mapItem];
  objc_msgSend(v13, "placeCardViewController:didRequestEditingNoteWithInitialText:libraryAccessProvider:placeMUID:completion:", self, v11, v10, objc_msgSend(v12, "_muid"), v9);
}

- (void)placeViewController:(id)a3 didSelectTransitConnectionInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIApplication sharedMapsDelegate];
  id v9 = [v8 poiSearchManager];

  id v10 = objc_alloc((Class)MKMapItemIdentifier);
  id v11 = [v7 itemIdentifier];
  id v12 = [v10 initWithGEOMapItemIdentifier:v11];

  id v13 = [(PlaceCardViewController *)self placeCardDelegate];
  id v14 = [v13 newTraits];

  [v14 useOnlineToOfflineFailoverRequestModeIfAllowed];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10096099C;
  v15[3] = &unk_1013034B8;
  objc_copyWeak(&v16, &location);
  [v9 searchForIdentifier:v12 allowExpired:0 traits:v14 completionHandler:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)placeViewController:(id)a3 didRequestAddOrRemovePlaceFromLibrary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator mapItem];
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", [v6 _muid], v4, 30);

  [(PlaceCardViewController *)self handleAddOrRemovePlaceFromLibrary:v4];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  suggestionViewController = self->_suggestionViewController;
  id v5 = a3;
  [(RelatedSearchSuggestionViewController *)suggestionViewController dismiss];
  v6.receiver = self;
  v6.super_class = (Class)PlaceCardViewController;
  [(ContaineeViewController *)&v6 scrollViewWillBeginDragging:v5];
}

- (id)_secondaryButtonController
{
  if ([(PlaceCardViewController *)self isPresentedInSearchAlongTheRoute])
  {
    id v3 = 0;
    goto LABEL_63;
  }
  objc_initWeak(&location, self);
  int64_t excludedContent = self->_excludedContent;
  if ([(PlaceCardViewController *)self isContact])
  {
    id v5 = +[NSBundle mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"Contacts" value:@"localized string not found" table:0];

    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_10096166C;
    v79[3] = &unk_1012F4058;
    objc_copyWeak(&v80, &location);
    id v7 = objc_retainBlock(v79);
    if (MapsFeature_IsEnabled_MapsWally())
    {
      if ([(PlaceCardItem *)self->_placeCardItem canShowOpenFindMyAction])
      {
        id v8 = +[NSBundle mainBundle];
        uint64_t v9 = [v8 localizedStringForKey:@"Find My" value:@"localized string not found" table:0];

        id v10 = (id *)&v78;
        id v11 = v77;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        id v12 = sub_1009616D4;
LABEL_23:
        objc_super v6 = (void *)v9;
        v11[2] = v12;
        v11[3] = &unk_1012F4058;
        objc_copyWeak(v10, &location);
        long long v27 = objc_retainBlock(v11);

        objc_destroyWeak(v10);
        CFStringRef v28 = @"findmy";
        id v7 = v27;
LABEL_25:
        objc_destroyWeak(&v80);
        unint64_t v29 = 0;
        id v30 = 0;
        goto LABEL_53;
      }
      if ([(PlaceCardItem *)self->_placeCardItem canShowRequestLocation])
      {
        id v26 = +[NSBundle mainBundle];
        uint64_t v9 = [v26 localizedStringForKey:@"Location" value:@"localized string not found" table:0];

        id v10 = (id *)&v76;
        id v11 = v75;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        id v12 = sub_100961714;
        goto LABEL_23;
      }
    }
    CFStringRef v28 = @"person.fill";
    goto LABEL_25;
  }
  if ((excludedContent & 8) == 0)
  {
    id v13 = [(PlaceCardViewController *)self placeCardItem];
    unsigned int v14 = [v13 isDroppedPin];

    if (v14)
    {
      id v15 = +[NSBundle mainBundle];
      objc_super v6 = [v15 localizedStringForKey:@"Move [Marked Location in Place Card]" value:@"localized string not found" table:0];

      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100961754;
      v73[3] = &unk_1012F4058;
      objc_copyWeak(&v74, &location);
      id v7 = objc_retainBlock(v73);
      objc_destroyWeak(&v74);
LABEL_32:
      unint64_t v29 = 0;
      id v30 = 0;
      CFStringRef v28 = @"mappin.and.ellipse";
      goto LABEL_53;
    }
  }
  id v16 = [(PlaceCardViewController *)self placeCardItem];
  id v17 = [v16 mapItem];
  if ([v17 _hasFlyover])
  {
    BOOL v18 = (self->_excludedContent & 4) == 0;

    if (v18)
    {
      uint64_t v19 = +[VKPlatform sharedPlatform];
      unsigned int v20 = [v19 supportsARMode];

      +[NSBundle mainBundle];
      if (v20) {
        id v21 = {;
      }
        [v21 localizedStringForKey:@"Flyover" value:@"localized string not found" table:0];
      }
      else {
        id v21 = {;
      }
        [v21 localizedStringForKey:@"Flyover Tour" value:@"localized string not found" table:0];
      objc_super v6 = };

      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100961824;
      v71[3] = &unk_1012F4058;
      objc_copyWeak(&v72, &location);
      id v7 = objc_retainBlock(v71);
      objc_destroyWeak(&v72);
      unint64_t v29 = 0;
      id v30 = 0;
      CFStringRef v28 = @"buildings.3d";
      goto LABEL_53;
    }
  }
  else
  {
  }
  id v22 = [(PlaceCardViewController *)self placeCardItem];
  unsigned int v23 = [v22 isCurrentLocation];

  if (v23)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      long long v24 = +[NSBundle mainBundle];
      [v24 localizedStringForKey:@"Mark My Location" value:@"localized string not found" table:0];
    }
    else
    {
      long long v24 = +[NSBundle mainBundle];
      [v24 localizedStringForKey:@"Drop Pin" value:@"localized string not found" table:0];
    objc_super v6 = };

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1009618F4;
    v69[3] = &unk_1013034E0;
    objc_copyWeak(&v70, &location);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1009619A4;
    v67[3] = &unk_101303508;
    v67[4] = self;
    v68 = objc_retainBlock(v69);
    v39 = v68;
    id v7 = objc_retainBlock(v67);

    objc_destroyWeak(&v70);
    goto LABEL_32;
  }
  if ((excludedContent & 8) == 0
    && [(PlaceCardViewController *)self _isHomeWorkSchoolShortcut])
  {
    id v25 = +[NSBundle mainBundle];
    objc_super v6 = [v25 localizedStringForKey:@"Move [Marked Location in Place Card]" value:@"localized string not found" table:0];

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100961C68;
    v65[3] = &unk_1012F4058;
    objc_copyWeak(&v66, &location);
    id v7 = objc_retainBlock(v65);
    objc_destroyWeak(&v66);
    goto LABEL_32;
  }
  v31 = [(PlaceCardViewController *)self placeCardItem];
  uint64_t v32 = [v31 chargeStationWaypointInfo];

  if (!v32)
  {
    id v40 = [(PlaceCardViewController *)self placeCardItem];
    if ([v40 isMeCard])
    {
    }
    else
    {
      long long v43 = [(PlaceCardViewController *)self mapItem];
      long long v44 = [v43 _quickLinks];
      BOOL v45 = [v44 count] == 0;

      if (!v45)
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v46 = [(PlaceCardViewController *)self mapItem];
        v47 = [v46 _quickLinks];

        id v48 = [v47 countByEnumeratingWithState:&v61 objects:v82 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v62;
LABEL_44:
          uint64_t v50 = 0;
          while (1)
          {
            if (*(void *)v62 != v49) {
              objc_enumerationMutation(v47);
            }
            v51 = *(void **)(*((void *)&v61 + 1) + 8 * v50);
            if ([v51 type] == (id)1) {
              break;
            }
            if (v48 == (id)++v50)
            {
              id v48 = [v47 countByEnumeratingWithState:&v61 objects:v82 count:16];
              if (v48) {
                goto LABEL_44;
              }
              goto LABEL_50;
            }
          }
          unint64_t v29 = v51;

          if (v29)
          {
            v56 = [(id)v29 title];
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_100961CD8;
            v58[3] = &unk_1012F2340;
            objc_copyWeak(&v60, &location);
            id v57 = (id)v29;
            id v59 = v57;
            id v3 = +[_MKPlaceActionButtonController actionButtonControllerWithTitle:v56 subTitle:0 selectedBlock:v58];

            objc_destroyWeak(&v60);
            id v7 = 0;
            id v30 = 0;
            objc_super v6 = 0;
            goto LABEL_62;
          }
          id v7 = 0;
          goto LABEL_52;
        }
LABEL_50:
      }
    }
    id v7 = 0;
    unint64_t v29 = 0;
LABEL_52:
    CFStringRef v28 = 0;
    id v30 = 0;
    objc_super v6 = 0;
    goto LABEL_53;
  }
  objc_super v33 = [(PlaceCardViewController *)self placeCardItem];
  unsigned int v34 = [v33 chargeStationWaypointInfo];
  id v35 = [v34 chargeInfo];
  [v35 chargingTime];
  id v37 = +[NSString _navigation_stringWithSeconds:(unint64_t)v36 abbreviated:1];

  unint64_t v29 = v37 != 0;
  if (v37)
  {
    id v38 = +[NSBundle mainBundle];
    objc_super v6 = [v38 localizedStringForKey:@"EV_Routing_stop_added" value:@"localized string not found" table:0];

    if (sub_1000BBB44(self) == 5)
    {
      id v30 = v37;
    }
    else
    {
      long long v41 = +[NSBundle mainBundle];
      long long v42 = [v41 localizedStringForKey:@"EV_Routing_charge_duration" value:@"localized string not found" table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v42, v37);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFStringRef v28 = @"bolt.car.fill";
  }
  else
  {
    CFStringRef v28 = 0;
    id v30 = 0;
    objc_super v6 = 0;
  }

  id v7 = &stru_101303548;
LABEL_53:
  if (MapsFeature_IsEnabled_MapsWally()
    && [(PlaceCardItem *)self->_placeCardItem canShowOpenFindMyAction])
  {
    id v52 = objc_alloc((Class)_MKPlaceActionButtonController);
    uint64_t v53 = 403;
LABEL_59:
    id v54 = [v52 initWithTitle:v6 subTitle:v30 analyticsAction:v53 selectedBlock:v7 disabled:v29 symbolName:v28];
    goto LABEL_61;
  }
  if (MapsFeature_IsEnabled_MapsWally()
    && [(PlaceCardItem *)self->_placeCardItem canShowRequestLocation])
  {
    id v52 = objc_alloc((Class)_MKPlaceActionButtonController);
    uint64_t v53 = 405;
    goto LABEL_59;
  }
  id v54 = +[_MKPlaceActionButtonController actionButtonControllerWithTitle:v6 subTitle:v30 selectedBlock:v7 disabled:v29 symbolName:v28];
LABEL_61:
  id v3 = v54;
LABEL_62:
  objc_destroyWeak(&location);

LABEL_63:

  return v3;
}

- (void)_instrumentHeaderButtonAction:(int)a3 withFeedbackType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
  [v6 instrumentAction:v5 forModuleType:2 usingFeedbackType:v4];
}

- (void)_chromeViewControllerPresent:(id)a3
{
  id v3 = a3;
  id v6 = +[UIApplication sharedMapsDelegate];
  uint64_t v4 = [v6 appCoordinator];
  uint64_t v5 = [v4 chromeViewController];
  [v5 presentViewController:v3 animated:1 completion:0];
}

- (void)viewContact
{
  id v3 = [(PlaceCardViewController *)self placeCardItem];
  uint64_t v4 = [v3 address];
  uint64_t v5 = [v4 contact];

  if (MapsFeature_IsEnabled_MapsWally())
  {
    id v6 = [v5 mutableCopy];
    id v7 = [v5 postalAddresses];
    id v8 = +[NSPredicate predicateWithBlock:&stru_101303588];
    uint64_t v9 = [v7 filteredArrayUsingPredicate:v8];
    [v6 setPostalAddresses:v9];

    id v10 = [v6 copy];
    uint64_t v5 = v10;
  }
  id v11 = +[CNContactViewController viewControllerForContact:v5];
  [v11 setDelegate:self];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissContactsViewController"];
  id v13 = [v11 navigationItem];
  [v13 setBackBarButtonItem:v12];

  [v11 setModalPresentationStyle:3];
  [v11 setDisplayMode:1];
  id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
  if (sub_1000BBB44(self) == 5)
  {
    [v14 setModalPresentationStyle:2];
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100962168;
    v15[3] = &unk_1012E6690;
    objc_copyWeak(&v17, &location);
    id v16 = v14;
    [(PlaceCardViewController *)self dismissViewControllerAnimated:1 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PlaceCardViewController *)self _maps_topMostPresentViewController:v14 animated:1 completion:0];
  }
}

- (void)openFindMy
{
  id v3 = [(PlaceCardViewController *)self placeCardItem];
  uint64_t v4 = [v3 searchResult];
  uint64_t v5 = [v4 autocompletePerson];
  id v6 = [v5 openFindMyURL];

  if (v6)
  {
    objc_initWeak(location, self);
    id v7 = +[UIApplication sharedApplication];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1009623F8;
    id v16 = &unk_1012E5D30;
    objc_copyWeak(&v18, location);
    id v17 = v6;
    [v7 _maps_openURL:v17 options:0 completionHandler:&v13];

    id v8 = [(PlaceCardViewController *)self analyticsDelegate];
    [v8 infoCardAnalyticsDidSelectAction:403 eventValue:0 feedbackDelegateSelector:0];

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v9 = sub_100576544();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(PlaceCardViewController *)self placeCardItem];
      id v11 = [v10 searchResult];
      id v12 = [v11 autocompletePerson];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error opening the find my app, missing handle Identifier for person: %@", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)openRequestLocation
{
  id v3 = [(PlaceCardViewController *)self placeCardItem];
  uint64_t v4 = [v3 searchResult];
  uint64_t v5 = [v4 autocompletePerson];
  id v6 = [v5 requestLocationURL];

  if (v6)
  {
    objc_initWeak(location, self);
    id v7 = +[UIApplication sharedApplication];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1009626F0;
    id v16 = &unk_1012E5D30;
    objc_copyWeak(&v18, location);
    id v17 = self;
    [v7 _maps_openURL:v6 options:0 completionHandler:&v13];

    id v8 = [(PlaceCardViewController *)self analyticsDelegate];
    [v8 infoCardAnalyticsDidSelectAction:405 eventValue:0 feedbackDelegateSelector:0];

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v9 = sub_100576544();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(PlaceCardViewController *)self placeCardItem];
      id v11 = [v10 searchResult];
      id v12 = [v11 autocompletePerson];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error opening messages app, missing request location Identifier for person: %@", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)searchFindMyFriendDidRemoveHandleWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PlaceCardItem *)self->_placeCardItem searchResult];
  id v6 = [v5 autocompletePerson];

  if (v6)
  {
    id v7 = [(PlaceCardItem *)self->_placeCardItem searchResult];
    id v8 = [v7 autocompletePerson];
    uint64_t v9 = [v8 handle];
    id v10 = [v9 handle];
    id v11 = [v10 handleIdentifier];

    if ([v4 isEqualToString:v11])
    {
      id v12 = sub_100576544();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found a placecard representing the handle that was removed", buf, 2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10096297C;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)dismissContactsViewController
{
  id v3 = [(PlaceCardViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = +[UIApplication sharedMapsDelegate];
    id v6 = [v5 appCoordinator];
    id v7 = [v6 chromeViewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100962B30;
    v8[3] = &unk_1012E6708;
    objc_copyWeak(&v9, &location);
    [v7 dismissViewControllerAnimated:1 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PlaceCardViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)isContact
{
  v2 = [(PlaceCardViewController *)self placeCardItem];
  id v3 = [v2 address];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isMeCard
{
  id v3 = [(PlaceCardViewController *)self placeCardItem];
  BOOL v4 = [v3 address];
  if ([v4 isMeCard])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(PlaceCardViewController *)self placeCardItem];
    unsigned __int8 v5 = [v6 isHomeWorkSchoolAddress];
  }
  return v5;
}

- (void)appStoreAppSelected:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PlaceCardViewController *)self placeCardDelegate];
  id v6 = [v4 identifier];
  id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 integerValue]);
  [v5 placeCardViewController:self displayStoreViewControllerForAppWithiTunesIdentifier:v7];

  if ([(MUPlaceViewController *)self->_placeViewController conformsToProtocol:&OBJC_PROTOCOL____MKInfoCardAnalyticsDelegate])id v9 = self->_placeViewController; {
  else
  }
    id v9 = 0;
  id v8 = [v4 iOSBundleIdentifier];

  [(MUPlaceViewController *)v9 infoCardAnalyticsDidSelectAction:45 target:733 eventValue:v8 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (void)presentQuickLink:(id)a3
{
  id v4 = [a3 URLString];
  if ([v4 length])
  {
    id v5 = [objc_alloc((Class)NSURL) initWithString:v4];
    if (v5)
    {
      id v6 = [(PlaceCardViewController *)self placeCardDelegate];
      [v6 placeCardViewController:self openURL:v5];
    }
    else
    {
      id v6 = sub_100576544();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        id v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The URL associated with quicklink %@ is nil", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)presentAppClip:(id)a3
{
  id v4 = a3;
  id v5 = [v4 appClipURL];
  id v6 = +[MKClipServices sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100962F34;
  v8[3] = &unk_1012EC2D8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [v6 requestAppClip:v4 completion:v8];
}

- (void)presentExtensionFlowController:(id)a3
{
  id v4 = a3;
  [v4 setContentUpdateDelegate:self];
  id v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)presentAppStoreApp:(id)a3
{
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v4 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [v4 postalAddresses];
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    id v21 = v4;
    id obj = v5;
    uint64_t v8 = *(void *)v25;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      id v11 = [v10 value];
      id v12 = [(PlaceCardViewController *)self placeCardItem];
      id v13 = [v12 address];
      uint64_t v14 = [v13 addressValue];
      id v15 = [v14 value];
      unsigned __int8 v16 = [v11 isEqual:v15];

      if (v16) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        id v4 = v21;
        id v5 = obj;
        goto LABEL_12;
      }
    }
    id v17 = v10;

    id v4 = v21;
    if (!v17) {
      goto LABEL_13;
    }
    id v18 = [objc_alloc((Class)MKMapItem) initWithContact:v21];
    uint64_t v19 = [[AddressBookAddress alloc] initWithContact:v21 addressValue:v17];
    unsigned int v20 = [(PlaceCardViewController *)self placeCardDelegate];
    [v20 placeCardViewController:self selectMapItem:v18 address:v19];

    id v5 = v17;
  }
LABEL_12:

LABEL_13:
}

- (void)setDraggableContent:(id)a3
{
  id v4 = (NSArray *)a3;
  if (self->_draggableContent != v4)
  {
    draggableContentInteractions = self->_draggableContentInteractions;
    if (draggableContentInteractions)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v6 = [(NSMapTable *)draggableContentInteractions keyEnumerator];
      id v7 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v47;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v47 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            id v12 = [(NSMapTable *)self->_draggableContentInteractions objectForKey:v11];
            id v13 = [v12 view];
            [v13 removeInteraction:v11];
          }
          id v8 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v8);
      }

      [(NSMapTable *)self->_draggableContentInteractions removeAllObjects];
      uint64_t v14 = self->_draggableContentInteractions;
      self->_draggableContentInteractions = 0;
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v15 = [(InfoCardViewController *)self titleHeaderView];
    unsigned __int8 v16 = [v15 interactions];

    id v17 = [v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * (void)j);
          id v22 = [(InfoCardViewController *)self titleHeaderView];
          [v22 removeInteraction:v21];
        }
        id v18 = [v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v18);
    }

    unsigned int v23 = (NSArray *)[(NSArray *)v4 copy];
    draggableContent = self->_draggableContent;
    self->_draggableContent = v23;

    if (self->_draggableContent)
    {
      id v37 = v4;
      long long v25 = +[NSMapTable strongToStrongObjectsMapTable];
      long long v26 = self->_draggableContentInteractions;
      self->_draggableContentInteractions = v25;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v27 = self->_draggableContent;
      id v28 = [(NSArray *)v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v39;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void **)(*((void *)&v38 + 1) + 8 * (void)k);
            id v33 = [objc_alloc((Class)UIDragInteraction) initWithDelegate:self];
            unsigned int v34 = [v32 view];
            [v34 addInteraction:v33];

            [(NSMapTable *)self->_draggableContentInteractions setObject:v32 forKey:v33];
          }
          id v29 = [(NSArray *)v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v29);
      }

      id v4 = v37;
      if (sub_1000BBB44(self) != 5 && [(NSArray *)self->_draggableContent count])
      {
        id v35 = [objc_alloc((Class)UIDragInteraction) initWithDelegate:self];
        double v36 = [(InfoCardViewController *)self titleHeaderView];
        [v36 addInteraction:v35];
      }
    }
  }
}

- (void)updatePreviewDrag
{
  if (self->_currentDragSession)
  {
    previewView = self->_previewView;
    if (previewView)
    {
      id v4 = [(DragAndDropPreview *)previewView renderPreviewImage];
      [v4 dragPreview];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1009637F8;
      v9[3] = &unk_1012EBCE0;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      currentDragSession = self->_currentDragSession;
      id v6 = v10;
      id v7 = [(UIDragSession *)currentDragSession items];
      id v8 = [v7 firstObject];
      [v8 setPreviewProvider:v9];
    }
  }
}

- (id)targetedDragPreviewForInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  id v6 = [(InfoCardViewController *)self titleHeaderView];

  if (v5 == v6)
  {
    id v8 = [(InfoCardViewController *)self titleHeaderView];
    unsigned int v9 = 1;
  }
  else
  {
    id v7 = [(NSMapTable *)self->_draggableContentInteractions objectForKey:v4];
    id v8 = [v7 view];
    unsigned int v9 = [v7 isHeader];
  }
  id v10 = objc_alloc_init((Class)UIDragPreviewParameters);
  uint64_t v11 = [(PlaceCardViewController *)self theme];
  id v12 = [v11 controlBackgroundColor];
  [v10 setBackgroundColor:v12];

  if (v9)
  {
    if ([(InfoCardViewController *)self isShowingFullHeader])
    {
      id v13 = [(MUPlaceViewController *)self->_placeViewController draggableHeaderView];

      uint64_t v14 = [v13 snapshotViewAfterScreenUpdates:0];
    }
    else
    {
      id v13 = [(InfoCardViewController *)self titleHeaderView];

      id v15 = [(InfoCardViewController *)self titleHeaderView];
      [v15 setHideActionButtons:1];

      uint64_t v14 = [v13 snapshotViewAfterScreenUpdates:1];
      unsigned __int8 v16 = [(InfoCardViewController *)self titleHeaderView];
      [v16 setHideActionButtons:0];
    }
    id v8 = v13;
    [v14 frame];
    double v18 = v17;
    [v14 frame];
    double v20 = v19;
    uint64_t v21 = [(InfoCardViewController *)self titleHeaderView];
    [v21 _cornerRadius];
    double v23 = v22;
    long long v24 = [(InfoCardViewController *)self titleHeaderView];
    [v24 _cornerRadius];
    double v26 = v25;

    long long v27 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, 0.0, 0.0, v18, v20, v23, v26);
    [v10 setVisiblePath:v27];
  }
  else
  {
    uint64_t v14 = [v8 snapshotViewAfterScreenUpdates:0];
  }
  id v28 = v14;
  id v29 = [v8 window];
  if (v29)
  {
    [v8 bounds];
    [v8 convertRect:v29 toView:v8];
    [v28 setFrame:];
    id v30 = objc_alloc((Class)UIDragPreviewTarget);
    [v28 frame];
    double MidX = CGRectGetMidX(v47);
    [v28 frame];
    id v32 = [v30 initWithContainer:v29 center:MidX, CGRectGetMidY(v48)];
    [v29 frame];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    [v32 center];
    v46.x = v41;
    v46.double y = v42;
    v49.origin.x = v34;
    v49.origin.double y = v36;
    v49.size.double width = v38;
    v49.size.double height = v40;
    if (CGRectContainsPoint(v49, v46)) {
      id v43 = [objc_alloc((Class)UITargetedDragPreview) initWithView:v28 parameters:v10 target:v32];
    }
    else {
      id v43 = 0;
    }
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  id v6 = +[MapsDragAndDropManager sharedManager];
  unsigned int v7 = [v6 canStartNewDrag];

  if (!v7)
  {
    double v22 = &__NSArray0__struct;
    goto LABEL_18;
  }
  id v8 = [v5 view];
  unsigned int v9 = [(InfoCardViewController *)self titleHeaderView];

  if (v8 == v9)
  {
    double v23 = [(PlaceCardViewController *)self placeCardItem];
    uint64_t v11 = [v23 mapItem];

    id v12 = [(PlaceCardViewController *)self placeCardItem];
    uint64_t v14 = 0;
    uint64_t v13 = 1501;
    if (v11) {
      goto LABEL_4;
    }
  }
  else
  {
    id v10 = [(NSMapTable *)self->_draggableContentInteractions objectForKey:v5];
    uint64_t v11 = [v10 draggableContent];
    id v12 = v10;
    uint64_t v13 = (uint64_t)[v12 analyticsTarget];
    uint64_t v14 = [v12 view];

    if (v11)
    {
LABEL_4:
      objc_opt_class();
      double v39 = v14;
      if (objc_opt_isKindOfClass())
      {
        id v15 = +[DragAndDropMapItem dragAndDropItemWithObject:v11];
        uint64_t v16 = [v15 itemProviderWriting];

        double v17 = [DragAndDropPreview alloc];
        double v18 = [(PlaceCardViewController *)self view];
        double v19 = [v18 traitCollection];
        double v20 = [(DragAndDropPreview *)v17 initWithDragAndDropMapItem:v15 traitCollection:v19];
        previewView = self->_previewView;
        self->_previewView = v20;

        [(DragAndDropPreview *)self->_previewView setContentUpdateDelegate:self];
        CGFloat v38 = [v15 analyticsHelper];
        uint64_t v11 = (void *)v16;
      }
      else
      {
        long long v24 = [MapsAnalyticsHelper alloc];
        id v15 = [(PlaceCardViewController *)self placeCardItem];
        double v25 = [v15 mapItem];
        CGFloat v38 = [(MapsAnalyticsHelper *)v24 initWithMapItem:v25];
      }
      uint64_t v26 = v13;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v11;
        id v28 = [(PlaceCardViewController *)self placeCardItem];
        id v29 = [v28 mapItem];
        id v30 = [v29 name];
        id v31 = +[NSItemProvider itemProviderWithURL:v27 title:v30];
      }
      else
      {
        id v31 = [objc_alloc((Class)NSItemProvider) initWithObject:v11];
      }
      id v32 = [(PlaceCardViewController *)self placeCardItem];
      double v33 = [v32 mapItem];
      CGFloat v34 = [v33 name];
      [v31 setSuggestedName:v34];

      id v35 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v31];
      CGFloat v36 = objc_opt_new();
      [v36 setContent:v12];
      [v36 setAnalyticsTarget:v26];
      [v36 setAnalyticsHelper:v38];
      uint64_t v14 = v39;
      if (sub_1000BBB44(self) == 5 && v39)
      {
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_100963FF4;
        v40[3] = &unk_1012EBCE0;
        id v41 = v39;
        [v35 setPreviewProvider:v40];
      }
      [v35 setLocalObject:v36];
      id v42 = v35;
      double v22 = +[NSArray arrayWithObjects:&v42 count:1];

      goto LABEL_17;
    }
  }
  double v22 = &__NSArray0__struct;
LABEL_17:

LABEL_18:

  return v22;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return -[PlaceCardViewController targetedDragPreviewForInteraction:](self, "targetedDragPreviewForInteraction:", a3, a4, a5);
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009640AC;
  v5[3] = &unk_1012E8E50;
  void v5[4] = self;
  [a4 addCompletion:v5];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a4;
  id v6 = [MapsDragLocalContext alloc];
  unsigned int v7 = [(PlaceCardViewController *)self view];
  id v8 = [v7 window];
  unsigned int v9 = [v8 windowScene];
  id v10 = [(MapsDragLocalContext *)v6 initWithWindowScene:v9];
  [v5 setLocalContext:v10];

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = (UIDragSession *)v5;
  id v12 = v5;

  uint64_t v13 = +[MapsDragAndDropManager sharedManager];
  [v13 setDragSession:v12];

  [(PlaceCardViewController *)self updatePreviewDrag];
  uint64_t v14 = [v12 items];
  id v21 = [v14 firstObject];

  id v15 = [v21 localObject];
  uint64_t v16 = [v15 analyticsHelper];
  double v17 = +[MKMapService sharedService];

  id v18 = [v15 analyticsTarget];
  double v19 = [v16 eventValue];
  double v20 = [v16 actionDetails];
  [v17 captureUserAction:17001 onTarget:v18 eventValue:v19 placeActionDetails:v20];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  unsigned int v7 = [a4 items];
  id v18 = [v7 firstObject];

  id v8 = [v18 localObject];
  unsigned int v9 = [v8 analyticsHelper];
  if (a5 == 2)
  {
    uint64_t v10 = 17003;
  }
  else
  {
    if (a5) {
      goto LABEL_6;
    }
    uint64_t v10 = 17002;
  }
  uint64_t v11 = +[MKMapService sharedService];
  id v12 = [v8 analyticsTarget];
  uint64_t v13 = [v9 eventValue];
  uint64_t v14 = [v9 actionDetails];
  [v11 captureUserAction:v10 onTarget:v12 eventValue:v13 placeActionDetails:v14];

LABEL_6:
  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  uint64_t v16 = +[MapsDragAndDropManager sharedManager];
  [v16 setDragSession:0];

  previewView = self->_previewView;
  self->_previewView = 0;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  return -[PlaceCardViewController targetedDragPreviewForInteraction:](self, "targetedDragPreviewForInteraction:", a3, a4, a5);
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (void)relatedSearchSuggestionViewControllerDidScrollLeft:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2022 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)relatedSearchSuggestionViewControllerDidScrollRight:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2023 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)relatedSearchSuggestionViewControllerDidTapActionButton:(id)a3
{
  id v4 = [a3 pdSuggestion];
  [(PlaceCardViewController *)self _searchWithSuggestion:v4];
}

- (void)relatedSearchSuggestionViewController:(id)a3 didDismissWithReason:(unint64_t)a4
{
  id v8 = a3;
  if (a4 >= 3)
  {
    id v6 = +[NSString stringWithFormat:@"(unknown: %lu)", a4];
  }
  else
  {
    id v6 = *(&off_1013035F0 + a4);
  }
  unsigned int v7 = +[MKMapService sharedService];
  [v7 captureUserAction:2021 onTarget:[self currentUITargetForAnalytics] eventValue:v6];
}

- (id)suggestionViewController
{
  suggestionViewController = self->_suggestionViewController;
  if (!suggestionViewController)
  {
    id v4 = objc_alloc_init(RelatedSearchSuggestionViewController);
    id v5 = [(RelatedSearchSuggestionViewController *)v4 view];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RelatedSearchSuggestionViewController *)v4 setDelegate:self];
    [(RelatedSearchSuggestionViewController *)v4 willMoveToParentViewController:self];
    id v6 = [(PlaceCardViewController *)self view];
    [v6 addSubview:v5];

    [(PlaceCardViewController *)self addChildViewController:v4];
    [(RelatedSearchSuggestionViewController *)v4 didMoveToParentViewController:self];
    [(PlaceCardViewController *)self _setupConstraintsForSuggestionView:v5];
    unsigned int v7 = self->_suggestionViewController;
    self->_suggestionViewController = v4;

    suggestionViewController = self->_suggestionViewController;
  }

  return suggestionViewController;
}

- (void)_initSuggestion
{
  id v3 = [(PlaceCardViewController *)self placeCardItem];
  id v4 = [v3 searchResult];
  id v11 = [v4 relatedSearchSuggestion];

  if (v11)
  {
    id v5 = [(PlaceCardViewController *)self suggestionViewController];
    [v5 setSuggestion:v11];

    id v6 = [(PlaceCardViewController *)self suggestionViewController];
    unsigned int v7 = [v6 view];
    [v7 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];

    [(PlaceCardViewController *)self _updateSuggestionVisibility];
    id v8 = +[MKMapService sharedService];
    uint64_t v9 = [(PlaceCardViewController *)self currentUITargetForAnalytics];
    uint64_t v10 = [v11 displayString];
    [v8 captureUserAction:2019 onTarget:v9 eventValue:v10];
  }
}

- (void)_searchWithSuggestion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v9 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v9 setSuggestion:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
    [WeakRetained placeCardViewController:self doSearchItem:v9 withUserInfo:0];

    id v6 = +[MKMapService sharedService];
    uint64_t v7 = [(PlaceCardViewController *)self currentUITargetForAnalytics];
    id v8 = [v4 displayString];

    [v6 captureUserAction:2020 onTarget:v7 eventValue:v8];
  }
}

- (void)_setupConstraintsForSuggestionView:(id)a3
{
  _NSDictionaryOfVariableBindings(@"suggestionView", a3, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[NSMutableArray array];
  id v4 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[suggestionView]-0-|", 0, 0, v6);
  [v3 addObjectsFromArray:v4];

  id v5 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[suggestionView]-0@250-|", 0, 0, v6);
  [v3 addObjectsFromArray:v5];

  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)_updateSuggestionVisibility
{
  suggestionViewController = self->_suggestionViewController;
  if (suggestionViewController)
  {
    id v5 = suggestionViewController;
    id v3 = [(RelatedSearchSuggestionViewController *)v5 suggestion];
    BOOL v4 = v3 == 0;

    [(RelatedSearchSuggestionViewController *)v5 setHidden:v4 animated:1];
  }
}

- (unint64_t)preferredPresentationStyle
{
  return 3;
}

- (void)_updatePopoverCoordinate
{
  id v3 = [(PlaceCardViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    id v5 = [(PlaceCardViewController *)self placeCardItem];
    id v6 = [v5 mapItem];
    [v6 _presentCoordinate];
    BOOL v7 = CLLocationCoordinate2DIsValid(v27);
    id v8 = [(PlaceCardViewController *)self placeCardItem];
    uint64_t v9 = [v8 mapItem];
    uint64_t v10 = v9;
    if (v7) {
      [v9 _presentCoordinate];
    }
    else {
      [v9 _coordinate];
    }
    double v13 = v11;
    double v14 = v12;
    id v15 = [(InfoCardViewController *)self macPopoverPresentationController];
    [v15 setCoordinate:v13, v14];

    id v25 = [(PlaceCardViewController *)self placeCardItem];
    [v25 calloutAnchorRect];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    long long v24 = [(InfoCardViewController *)self macPopoverPresentationController];
    [v24 setAnchorRect:v17, v19, v21, v23];
  }
}

- (void)placeViewController:(id)a3 requestsDismissingPresentingViewControllerWithCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  uint64_t v9 = sub_1000BBB44(v7);

  if (v9 == 5)
  {
    uint64_t v10 = [(PlaceCardViewController *)self placeCardDelegate];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100964CF8;
    v12[3] = &unk_1012E5F78;
    id v14 = v6;
    id v13 = v8;
    [v10 placeCardViewController:self dismissAnimated:1 completion:v12];
  }
  else
  {
    double v11 = [v8 topMostPresentedViewController];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

- (void)placeViewController:(id)a3 didFinishDismissingViewController:(id)a4
{
  id v8 = a4;
  if (sub_1000BBB44(a3) == 5)
  {
    id v6 = [(PlaceCardViewController *)self placeCardItem];
    id v7 = [v6 mapItem];
    [(PlaceCardViewController *)self didDismissViewController:v8 mapItem:v7];
  }
}

- (void)placeViewController:(id)a3 didRequestSceneActivationForPhotoGalleryViewController:(id)a4
{
  id v5 = a4;
  id v6 = +[MacPlacePhotoViewerScene requestSceneActivation];
  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = v6;

  id v8 = [MacPlacePhotoViewerConfiguration alloc];
  uint64_t v9 = [(PlaceCardViewController *)self placeCardItem];
  uint64_t v10 = [v9 mapItem];
  id v14 = [(MacPlacePhotoViewerConfiguration *)v8 initWithMapItem:v10 photoGalleryViewController:v5];

  double v11 = [(UGCCallToActionViewProvider *)self->_callToActionViewProvider lookupResult];
  [(MacPlacePhotoViewerConfiguration *)v14 setUserSubmissionLookupResult:v11];

  double v12 = self->_photoViewerScene;
  id v13 = [(PlaceCardViewController *)self _maps_mapsSceneDelegate];
  [(MacPlacePhotoViewerScene *)v12 openPhotoGalleryWithConfiguration:v14 sceneDelegate:v13 delegate:self];
}

- (void)placeViewController:(id)a3 didSelectPhotoCategoryAtIndex:(unint64_t)a4
{
  id v6 = [(PlaceCardViewController *)self placeCardItem];
  id v7 = [v6 mapItem];
  id v8 = +[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:v7 albumIndex:a4];

  [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v8 withProgressObserver:0];
}

- (void)placePhotoViewerSceneWillDisconnect:(id)a3
{
  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = 0;
}

- (void)didDismissViewController:(id)a3 mapItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PlaceCardViewController *)self placeCardDismissalDelegate];
  [v8 didDismissViewController:v7 mapItem:v6];
}

- (MKMapItem)mapItem
{
  v2 = [(PlaceCardViewController *)self placeCardItem];
  id v3 = [v2 mapItem];

  return (MKMapItem *)v3;
}

- (void)suggestionViewProviderDidUpdateView:(id)a3
{
  id v7 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    [(MUPlaceViewController *)self->_placeViewController updateSuggestionView];
    placeViewController = self->_placeViewController;
    id v5 = [v7 suggestionViewModelForWebPlacecard];
    [(MUPlaceViewController *)placeViewController updateWebPlacecardSuggestionViewWithViewModel:v5];

    id v6 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
    [v6 instrumentAction:339 forModuleType:3 usingFeedbackType:0];
  }
}

- (void)suggestionViewProviderDidSelectAddPhotos:(id)a3
{
  id v7 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach())
  {
    id v4 = [v7 mapItem];
    id v5 = +[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:v4 entryPoint:2 originTarget:@"PLACECARD_ARP_SUGGESTION"];

    [v5 setEntryPointRequiresARPPrivacyScreenIfNeeded:1];
    [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v5 withProgressObserver:0];
    id v6 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
    [v6 instrumentAction:300 target:201 eventValue:@"Suggestion" moduleType:3 feedbackType:0];
  }
}

- (void)suggestionViewProviderDidSelectRateThisPlace:(id)a3 overallState:(int64_t)a4
{
  id v12 = a3;
  int IsEnabled_LagunaBeach = MapsFeature_IsEnabled_LagunaBeach();
  id v7 = v12;
  if (IsEnabled_LagunaBeach)
  {
    id v8 = [v12 mapItem];
    uint64_t v9 = +[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:v8 initialOverallState:a4 entryPoint:2 originTarget:@"PLACECARD_ARP_SUGGESTION"];

    [(PlaceCardViewController *)self _presentPOIEnrichmentCoordinator:v9 withProgressObserver:0];
    if ((unint64_t)a4 > 2) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = dword_100F72AF8[a4];
    }
    double v11 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
    [v11 instrumentAction:v10 target:201 eventValue:@"Suggestion" moduleType:3 feedbackType:0];

    id v7 = v12;
  }
}

- (BOOL)suggestionViewProviderIsPlacePinned:(id)a3
{
  return [(PlaceCardLibraryOperationsCoordinator *)self->_libraryOperationsCoordinator isPinned];
}

- (void)instrumentDismissAction
{
  id v2 = [(MUPlaceViewController *)self->_placeViewController analyticsController];
  [v2 instrumentAction:4 forModuleType:1 usingFeedbackType:0];
}

- (PlaceCardItem)placeCardItem
{
  return self->_placeCardItem;
}

- (int64_t)excludedContent
{
  return self->_excludedContent;
}

- (PlaceCardViewControllerDelegate)placeCardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);

  return (PlaceCardViewControllerDelegate *)WeakRetained;
}

- (void)setPlaceCardDelegate:(id)a3
{
}

- (PlaceCardDismissable)placeCardDismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDismissalDelegate);

  return (PlaceCardDismissable *)WeakRetained;
}

- (void)setPlaceCardDismissalDelegate:(id)a3
{
}

- (BOOL)isAdditionalStop
{
  return self->_isAdditionalStop;
}

- (BOOL)isPresentedInSearchAlongTheRoute
{
  return self->_isPresentedInSearchAlongTheRoute;
}

- (BOOL)shouldPresentSecondaryActionWhenReady
{
  return self->_shouldPresentSecondaryActionWhenReady;
}

- (void)setShouldPresentSecondaryActionWhenReady:(BOOL)a3
{
  self->_shouldPresentSecondaryActionWhenReaddouble y = a3;
}

- (LookAroundActionCoordination)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void)setActionCoordinator:(id)a3
{
  self->_actionCoordinator = (LookAroundActionCoordination *)a3;
}

- (BOOL)isMapItemInFavorites
{
  return self->_isMapItemInFavorites;
}

- (void)setIsMapItemInFavorites:(BOOL)a3
{
  self->_isMapItemInFavorites = a3;
}

- (NSArray)draggableContent
{
  return self->_draggableContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggableContent, 0);
  objc_destroyWeak((id *)&self->_placeCardDismissalDelegate);
  objc_destroyWeak((id *)&self->_placeCardDelegate);
  objc_storeStrong((id *)&self->_placeCardItem, 0);
  objc_storeStrong((id *)&self->_tipKitController, 0);
  objc_storeStrong((id *)&self->_collectionMembershipProvider, 0);
  objc_storeStrong((id *)&self->_mapsSyncPlaceItemMapStorageUpdater, 0);
  objc_storeStrong((id *)&self->_libraryOperationsCoordinator, 0);
  objc_storeStrong((id *)&self->_friendshipCoordinator, 0);
  objc_storeStrong((id *)&self->_offlineMapProvider, 0);
  objc_storeStrong((id *)&self->_inlineRatingsController, 0);
  objc_storeStrong((id *)&self->_reservationRouter, 0);
  objc_storeStrong((id *)&self->_photoViewerScene, 0);
  objc_storeStrong((id *)&self->_reportImageryController, 0);
  objc_storeStrong((id *)&self->_suggestionViewProvider, 0);
  objc_storeStrong((id *)&self->_callToActionViewProvider, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_draggableContentInteractions, 0);
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
  objc_storeStrong((id *)&self->_updatedCurrentLocation, 0);

  objc_storeStrong((id *)&self->_placeViewController, 0);
}

@end