@interface RoutePlanningOverviewViewController
+ (id)routePlanningOverviewViewControllerWithDataCoordinator:(id)a3;
- (BOOL)_areWaypointsInCountryCode:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasModalViewControllerInTransition;
- (BOOL)_shouldPermitAutomaticSharingContacts;
- (BOOL)_shouldShowAdvisoryCard;
- (BOOL)_supportsTransportTypePicker;
- (BOOL)allowsLongPressToMarkLocation;
- (BOOL)hasIncrementedDigitalIssuanceCountForRoute;
- (BOOL)hasValidEVRoute;
- (BOOL)isAnimatingHeightForMediumLayout;
- (BOOL)isCollectionViewVisible;
- (BOOL)isDisplayingSingleTrip;
- (BOOL)isErrorViewVisible;
- (BOOL)isFittingHeightToRoutes;
- (BOOL)isLoadingViewVisible;
- (BOOL)shouldRefreshRoutePlanningWithCurrentGarage:(id)a3 previousGarage:(id)a4;
- (BOOL)supportTapToHide;
- (CGRect)_loadingAndErrorViewFrame;
- (CGRect)_rectOfRowToKeepVisible;
- (ContainerHeaderView)containerHeaderView;
- (ErrorModeView)errorModeView;
- (LoadingModeView)loadingModeView;
- (MKTransitItemReferenceDateUpdater)referenceDateUpdater;
- (NSLayoutConstraint)collectionViewToBottomConstraint;
- (NSString)originName;
- (RideBookingOutlineController)rideBookingSource;
- (RideBookingRideOptionState)cachedRideOptionState;
- (RoutePlanningDataCoordinator)dataCoordinator;
- (RoutePlanningOutlineRootController)rootController;
- (RoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3;
- (RouteSearchViewController)routeSearchViewController;
- (TransportTypePicker)transportTypePicker;
- (UIAlertController)simulationPromptAlertController;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)collectionViewLayout;
- (UIView)routeOptionsPopoverSourceView;
- (double)_calculatedRouteCellsHeight;
- (double)_cardHeightMinusTableViewHeight;
- (double)_fittingHeightForMediumLayout;
- (double)_heightForFullLayout;
- (double)_maximumMediumCardHeight;
- (double)_minimumMediumCardHeight;
- (double)heightForLayout:(unint64_t)a3;
- (double)routeCellsHeight;
- (id)_indexPathOfCellToShowAtMediumLayout;
- (id)_initialConstraints;
- (id)chargingInfoForWaypointAtIndex:(unint64_t)a3;
- (id)evStepInfoForWaypointAtIndex:(unint64_t)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)_currentSceneActivationState;
- (int64_t)digitalIssuanceUpdateFlags;
- (int64_t)floatingControlsOptions;
- (int64_t)observedRoutePlanningData;
- (unint64_t)countOfRideOptionsBooked;
- (void)_animateUpdatingHeightForSingleTrip;
- (void)_contentSizeCategoryDidChange;
- (void)_doPromptsAndStartNavForRouteCollection:(id)a3;
- (void)_finishLaunchingIntoNavIfPossible:(id)a3;
- (void)_forceChangeOrigin;
- (void)_incrementCountOfRideOptionsBooked;
- (void)_loadGarage;
- (void)_markFeatureDiscoveryShown;
- (void)_prepareRideBookingForFirstUse;
- (void)_presentEbikeOptions;
- (void)_presentRouteOptions;
- (void)_promptForSimulationAndStartNavigationForRouteCollection:(id)a3;
- (void)_refreshContactsDisplayForAutomaticTripSharing;
- (void)_refreshContentInset;
- (void)_refreshOptionsVisibility;
- (void)_refreshRoutePlanning;
- (void)_refreshSelectedVehicleDisplay;
- (void)_refreshTimingDisplay;
- (void)_resetCountOfRideOptionsBooked;
- (void)_sceneDidBackground:(id)a3;
- (void)_sceneWillForeground:(id)a3;
- (void)_scrollToCellToShowAtMediumLayoutAnimated:(BOOL)a3;
- (void)_setCollectionViewVisible:(BOOL)a3;
- (void)_setErrorViewVisible:(BOOL)a3 routePlanningError:(id)a4;
- (void)_setLoadingViewVisible:(BOOL)a3;
- (void)_setupAdvisoryFooterView;
- (void)_setupSubviews;
- (void)_snapToRectOfRowToKeepVisible;
- (void)_startNavigationForRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4;
- (void)_startReferenceDateUpdates;
- (void)_stopReferenceDateUpdates;
- (void)_updateDataSourceRouteCollection:(id)a3;
- (void)_updateDigitalIssuanceStateWithUpdateFlag:(int64_t)a3;
- (void)_updateErrorViewButtonVisibilityWithError:(id)a3;
- (void)_updateForEquivalentRequestState:(int64_t)a3;
- (void)_updateLoadingViewBottomInset;
- (void)_updateRidesharingAnalytics;
- (void)_updateToTransportType:(int64_t)a3;
- (void)dataSource:(id)a3 didSelectRowForRoute:(id)a4;
- (void)dataSource:(id)a3 requiresDeletionOfIndexSet:(id)a4 reloadOfIndexSet:(id)a5 insertionOfIndexSet:(id)a6;
- (void)dataSource:(id)a3 requiresReloadOfSection:(unint64_t)a4;
- (void)dataSourceRequiresReload:(id)a3;
- (void)dealloc;
- (void)didBecomeCurrent;
- (void)didMoveToParentViewController:(id)a3;
- (void)didSelectAppStoreSuggestionWithIdentifier:(id)a3;
- (void)didSelectFeedbackWithAppIdentifier:(id)a3;
- (void)didSelectRideOption:(id)a3;
- (void)didTapAutomaticSharingButtonForRouteOverviewCell:(id)a3;
- (void)didTapDetailsButtonForRouteOverviewCell:(id)a3;
- (void)didTapGoButtonForRouteOverviewCell:(id)a3;
- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3;
- (void)didTapRouteCreationButtonForCell:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handleDismissAction:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)pptTestEndNavigation;
- (void)pptTestStartNavigation;
- (void)pptTestTransitionBetweenFullAndLightGuidance;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRequestState:(int64_t)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRideBookingRideOptionState:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRoutes:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4;
- (void)setCachedRideOptionState:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setCollectionViewToBottomConstraint:(id)a3;
- (void)setContainerHeaderView:(id)a3;
- (void)setDigitalIssuanceUpdateFlags:(int64_t)a3;
- (void)setErrorModeView:(id)a3;
- (void)setHasIncrementedDigitalIssuanceCountForRoute:(BOOL)a3;
- (void)setIsAnimatingHeightForMediumLayout:(BOOL)a3;
- (void)setLoadingModeView:(id)a3;
- (void)setOriginName:(id)a3;
- (void)setReferenceDateUpdater:(id)a3;
- (void)setRideBookingSource:(id)a3;
- (void)setRootController:(id)a3;
- (void)setRouteCellsHeight:(double)a3;
- (void)setSimulationPromptAlertController:(id)a3;
- (void)setTransportTypePicker:(id)a3;
- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly;
- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4;
- (void)transportTypePicker:(id)a3 typeSelected:(int64_t)a4;
- (void)updateTheme;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)virtualGarageDidUpdate:(id)a3;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation RoutePlanningOverviewViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)routePlanningOverviewViewControllerWithDataCoordinator:(id)a3
{
  id v3 = a3;
  v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  v6 = off_1012D3C88;
  if (v5 != (id)5) {
    v6 = off_1012D33A0;
  }
  id v7 = [objc_alloc(*v6) initWithDataCoordinator:v3];

  return v7;
}

- (RoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningOverviewViewController;
  id v5 = [(RoutePlanningOverviewViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataCoordinator, v4);
    id v7 = +[VGVirtualGarageService sharedService];
    [v7 registerObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  id v3 = +[VGVirtualGarageService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v4 dealloc];
}

- (RouteSearchViewController)routeSearchViewController
{
  return 0;
}

- (ErrorModeView)errorModeView
{
  errorModeView = self->_errorModeView;
  if (!errorModeView)
  {
    objc_super v4 = objc_alloc_init(ErrorModeView);
    id v5 = self->_errorModeView;
    self->_errorModeView = v4;

    [(ErrorModeView *)self->_errorModeView setAutoresizingMask:18];
    errorModeView = self->_errorModeView;
  }

  return errorModeView;
}

- (void)_prepareRideBookingForFirstUse
{
  if (sub_10008034C() && !self->_rideBookingSource)
  {
    id v3 = [RideBookingOutlineController alloc];
    objc_super v4 = [(RoutePlanningOverviewViewController *)self collectionView];
    id v5 = [(RideBookingOutlineController *)v3 initWithCollectionView:v4];
    rideBookingSource = self->_rideBookingSource;
    self->_rideBookingSource = v5;

    [(RideBookingOutlineController *)self->_rideBookingSource setDelegate:self];
    id v7 = [(RoutePlanningOverviewViewController *)self rootController];
    -[RoutePlanningOutlineController setHideContent:](self->_rideBookingSource, "setHideContent:", [v7 hideContent]);
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v13 viewDidLoad];
  id v3 = [(RoutePlanningOverviewViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v5 stringByReplacingOccurrencesOfString:@"ViewController" withString:&stru_101324E70];
  [(RoutePlanningOverviewViewController *)self setAccessibilityIdentifier:v6];

  [(RoutePlanningOverviewViewController *)self _setupSubviews];
  id v7 = [(RoutePlanningOverviewViewController *)self _initialConstraints];
  +[NSLayoutConstraint activateConstraints:v7];
  +[DynamicTypeWizard makeObject:self performSelector:"_contentSizeCategoryDidChange" whenSizeCategoryChangesWithOrder:2];
  v8 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  [v8 addObserver:self];

  objc_super v9 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  [v9 setupDataForObserver:self];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_resetCountOfRideOptionsBooked" name:UIApplicationDidEnterBackgroundNotification object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_resetCountOfRideOptionsBooked" name:@"RidesharingDidRequestRideNotificationKey" object:0];

  v12 = +[VGVirtualGarageService sharedService];
  [v12 registerObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v10 viewWillAppear:a3];
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v5 = (unint64_t)[v4 containerStyle];
  unsigned int v6 = (v5 > 7) | (0x5Cu >> v5);

  id v7 = [(RoutePlanningOverviewViewController *)self rootController];
  [v7 setAllowPersistentHighlight:v6 & 1];

  v8 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  objc_super v9 = [v8 routeCollection];
  [(RoutePlanningOverviewViewController *)self _updateDataSourceRouteCollection:v9];

  [(RoutePlanningOverviewViewController *)self _loadGarage];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v4 viewDidDisappear:a3];
  [(RoutePlanningOverviewViewController *)self _updateDataSourceRouteCollection:0];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v13 viewDidLayoutSubviews];
  id v3 = [(ErrorModeView *)self->_errorModeView superview];
  if (v3)
  {
  }
  else
  {
    objc_super v4 = [(LoadingModeView *)self->_loadingModeView superview];

    if (!v4) {
      return;
    }
  }
  [(RoutePlanningOverviewViewController *)self _loadingAndErrorViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[ErrorModeView setFrame:](self->_errorModeView, "setFrame:");
  -[LoadingModeView setFrame:](self->_loadingModeView, "setFrame:", v6, v8, v10, v12);
}

- (CGRect)_loadingAndErrorViewFrame
{
  id v3 = [(ContaineeViewController *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  double v10 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v10 frame];
  CGFloat v12 = v11;

  p_errorModeView = (id *)&self->_errorModeView;
  v14 = [(ErrorModeView *)self->_errorModeView superview];

  if (v14
    || (p_errorModeView = (id *)&self->_loadingModeView,
        [(LoadingModeView *)self->_loadingModeView superview],
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    [*p_errorModeView fittingHeight];
    double v17 = v16;
  }
  else
  {
    double v17 = 0.0;
  }
  v27.origin.x = v5;
  v27.origin.y = v12;
  v27.size.width = v7;
  v27.size.height = v9;
  double Height = CGRectGetHeight(v27);
  v28.origin.x = v5;
  v28.origin.y = v12;
  v28.size.width = v7;
  v28.size.height = v9;
  double v19 = Height - CGRectGetMinY(v28);
  v20 = [(ContaineeViewController *)self cardPresentationController];
  [v20 bottomSafeOffset];
  double v22 = v19 - v21;

  if (v17 <= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v17;
  }
  double v24 = v5;
  double v25 = v12;
  double v26 = v7;
  result.size.height = v23;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)didMoveToParentViewController:(id)a3
{
  int64_t v4 = [(RoutePlanningOverviewViewController *)self _currentSceneActivationState];
  BOOL v6 = v4 != 2 && v4 != -1;
  id v7 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];
  [v7 setActive:v6];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v9 = (unint64_t)[v8 containerStyle];
  if (v9 > 7 || ((1 << v9) & 0xA3) == 0) {
    goto LABEL_5;
  }

  double v10 = [(ContaineeViewController *)self cardPresentationController];
  id v11 = [v10 containeeLayout];

  if (v11 != (id)3)
  {
    double v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 wantsLayout:3];
LABEL_5:
  }
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
}

- (void)updateTheme
{
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOverviewViewController;
  [(MapsThemeViewController *)&v3 updateTheme];
  [(RoutePlanningOverviewViewController *)self setRouteCellsHeight:-1.0];
}

- (int64_t)_currentSceneActivationState
{
  v2 = [(RoutePlanningOverviewViewController *)self view];
  objc_super v3 = [v2 window];
  int64_t v4 = [v3 windowScene];

  if (v4) {
    int64_t v5 = (int64_t)[v4 activationState];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (void)_setupSubviews
{
  objc_super v3 = [_RoutePlanningCollectionView alloc];
  int64_t v4 = +[RoutePlanningOutlineController defaultCollectionViewLayout];
  int64_t v5 = -[_RoutePlanningCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(RoutePlanningOverviewViewController *)self setCollectionView:v5];

  id v6 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = +[UIColor clearColor];
  double v8 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v8 setBackgroundColor:v7];

  unint64_t v9 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v9 setAlwaysBounceVertical:1];

  double v10 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v10 setRemembersLastFocusedIndexPath:0];

  id v11 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v11 setAllowsMultipleSelection:1];

  objc_super v12 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v12 setPreservesSuperviewLayoutMargins:1];

  objc_super v13 = [(RoutePlanningOverviewViewController *)self collectionView];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v13 setAccessibilityIdentifier:v15];

  double v16 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v16 _setVisibleRectEdgeInsets:-10000.0, 0.0, -10000.0, 0.0];

  double v17 = [(ContaineeViewController *)self contentView];
  v18 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v17 addSubview:v18];

  if (sub_1000BBB44(self) == 5) {
    double v19 = 16.0;
  }
  else {
    double v19 = 12.0;
  }
  v20 = [[ContainerHeaderView alloc] initWithHairlineMargin:v19];
  [(RoutePlanningOverviewViewController *)self setContainerHeaderView:v20];

  double v21 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v22 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v22 setDelegate:self];

  double v23 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  LODWORD(v24) = 1148846080;
  [v23 setContentCompressionResistancePriority:1 forAxis:v24];

  double v25 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  double v26 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  CGRect v27 = (objc_class *)objc_opt_class();
  CGRect v28 = NSStringFromClass(v27);
  v29 = [@"RoutePlanning" stringByAppendingString:v28];
  [v25 setAccessibilityIdentifier:v29];

  v30 = [(ContaineeViewController *)self headerView];
  v31 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v30 addSubview:v31];

  if ([(RoutePlanningOverviewViewController *)self _supportsTransportTypePicker])
  {
    v32 = objc_alloc_init(TransportTypePicker);
    [(RoutePlanningOverviewViewController *)self setTransportTypePicker:v32];

    v33 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    [v34 setDelegate:self];

    v35 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    LODWORD(v36) = 1148846080;
    [v35 setContentCompressionResistancePriority:1 forAxis:v36];
  }
  v37 = [LoadingModeView alloc];
  v38 = +[NSBundle mainBundle];
  v39 = [v38 localizedStringForKey:@"Loading ..." value:@"localized string not found" table:0];
  v40 = [(LoadingModeView *)v37 initWithTitle:v39];
  [(RoutePlanningOverviewViewController *)self setLoadingModeView:v40];

  v41 = [(RoutePlanningOverviewViewController *)self loadingModeView];
  [v41 setAutoresizingMask:18];

  v42 = [RoutePlanningOutlineRootController alloc];
  v43 = [(RoutePlanningOverviewViewController *)self collectionView];
  v44 = [(RoutePlanningOutlineRootController *)v42 initWithCollectionView:v43];
  [(RoutePlanningOverviewViewController *)self setRootController:v44];

  v45 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  v46 = [(RoutePlanningOverviewViewController *)self rootController];
  [v46 setDataCoordinator:v45];

  v47 = [(RoutePlanningOverviewViewController *)self rootController];
  [v47 setRouteCellDelegate:self];

  v48 = [(RoutePlanningOverviewViewController *)self rootController];
  [v48 setRouteCreationDelegate:self];

  v49 = [(RoutePlanningOverviewViewController *)self rootController];
  [v49 setRouteSelectionDelegate:self];

  v50 = [(ControlContaineeViewController *)self delegate];
  v51 = [(RoutePlanningOverviewViewController *)self rootController];
  [v51 setTransitPayActionDelegate:v50];

  v52 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v52 setHeaderSize:1];

  v53 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v53 setShouldCenterButtonVertically:0];

  id v54 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v54 setHairLineAlpha:0.0];
}

- (id)_initialConstraints
{
  objc_super v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  int64_t v4 = [v3 superview];

  int64_t v5 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v6 = [v5 bottomAnchor];
  id v7 = [v4 bottomAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [(RoutePlanningOverviewViewController *)self setCollectionViewToBottomConstraint:v8];

  if ([(RoutePlanningOverviewViewController *)self isCollectionViewVisible]) {
    float v9 = 749.0;
  }
  else {
    float v9 = 50.0;
  }
  double v10 = [(RoutePlanningOverviewViewController *)self collectionViewToBottomConstraint];
  *(float *)&double v11 = v9;
  [v10 setPriority:v11];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  objc_super v13 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  v14 = [(ContaineeViewController *)self headerView];
  LODWORD(v15) = 1148846080;
  double v16 = [v13 _maps_constraintsEqualToEdgesOfView:v14 priority:v15];
  double v17 = [v16 allConstraints];
  [v12 addObjectsFromArray:v17];

  return v12;
}

- (void)_loadGarage
{
  objc_initWeak(&location, self);
  v2 = +[VGVirtualGarageService sharedService];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10060D044;
  v3[3] = &unk_1012E65A8;
  objc_copyWeak(&v4, &location);
  [v2 virtualGarageGetGarageWithReply:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)floatingControlsOptions
{
  if (sub_1000BBB44(self) == 5) {
    return 255;
  }
  else {
    return 267;
  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v14 willChangeLayout:"willChangeLayout:"];
  int64_t v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if ((((unint64_t)v6 - 1) | (a3 - 3)) <= 1)
  {
    id v7 = +[MKMapService sharedService];
    [v7 captureUserAction:3010 onTarget:[self currentUITargetForAnalytics] eventValue:0];

    double v8 = [(RoutePlanningOverviewViewController *)self collectionView];
    float v9 = [v8 dataSource];
    double v10 = [(RoutePlanningOverviewViewController *)self rideBookingSource];

    if (v9 == v10)
    {
      double v11 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      id v12 = [v11 rideOptionStateObserver];
      objc_super v13 = [v12 analyticsBookingSession];
      [v13 setComparedRideOptions:1];
    }
  }
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
  id v3 = [(ControlContaineeViewController *)self delegate];
  [v3 closeRoutePlanningViewController:self withSender:0];
}

- (BOOL)supportTapToHide
{
  return 0;
}

- (double)heightForLayout:(unint64_t)a3
{
  int64_t v5 = sub_1005762E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    double v10 = "-[RoutePlanningOverviewViewController heightForLayout:]";
    __int16 v11 = 2080;
    id v12 = "RoutePlanningOverviewViewController.m";
    __int16 v13 = 1024;
    int v14 = 612;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = +[NSThread callStackSymbols];
      int v9 = 138412290;
      double v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(RoutePlanningOverviewViewController *)self doesNotRecognizeSelector:a2];
  return 0.0;
}

- (double)_heightForFullLayout
{
  [(RoutePlanningOverviewViewController *)self heightForLayout:3];
  return result;
}

- (BOOL)allowsLongPressToMarkLocation
{
  return (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
      || (MapsFeature_IsEnabled_Maps420() & 1) != 0
      || (MapsFeature_IsEnabled_Maps182() & 1) != 0
      || sub_1000BBB44(self) == 5;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v6 = [(id)v5 platformController];
  id v7 = [v6 currentSession];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0 && v7)
  {
    double v8 = sub_1005768D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "User tapped route planning close button but we are currently in navigation; ignoring",
        v16,
        2u);
    }
  }
  else
  {
    int v9 = +[MKMapService sharedService];
    [v9 captureUserAction:4 onTarget:[self currentUITargetForAnalytics] eventValue:0];

    double v10 = +[MapsSuggestionsPredictor sharedPredictor];
    [v10 cancelCapturingAnalytics];

    __int16 v11 = [(ControlContaineeViewController *)self delegate];
    [v11 viewControllerGoPreviousState:self withSender:v4];

    id v12 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    [v12 tableViewDismissed];

    __int16 v13 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    int v14 = [v13 rideOptionStateObserver];
    double v15 = [v14 analyticsBookingSession];
    [v15 endSessionOnView:1 state:2];

    [(RoutePlanningOverviewViewController *)self _resetCountOfRideOptionsBooked];
  }
}

- (double)_cardHeightMinusTableViewHeight
{
  [(ContaineeViewController *)self headerHeight];
  double v4 = v3;
  uint64_t v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 bottomSafeOffset];
  double v7 = v4 + v6;

  return v7;
}

- (CGRect)_rectOfRowToKeepVisible
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 transportType];

  if (v4 == (id)4)
  {
    uint64_t v5 = +[NSIndexPath indexPathForRow:0 inSection:0];
    double v6 = [(RoutePlanningOverviewViewController *)self collectionView];
    double v7 = [v6 collectionViewLayout];
    double v8 = [v7 layoutAttributesForItemAtIndexPath:v5];

    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v17 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    v18 = [v17 platformController];
    double v19 = [v18 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    uint64_t v5 = [(RoutePlanningOverviewViewController *)self rootController];
    double v8 = [v21 currentRouteCollection];

    double v22 = [v8 currentRoute];
    [v5 mostImportantRectToFrameWithSelectedRoute:v22];
    double v10 = v23;
    double v12 = v24;
    double v14 = v25;
    double v16 = v26;
  }
  CGRect v27 = [(ContaineeViewController *)self cardPresentationController];
  [v27 bottomSafeOffset];
  double v29 = v16 + v28;

  double v30 = v10;
  double v31 = v12;
  double v32 = v14;
  double v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  unsigned int v3 = (a3 > 7) | (0x5Cu >> a3);
  id v4 = [(RoutePlanningOverviewViewController *)self rootController];
  [v4 setAllowPersistentHighlight:v3 & 1];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v8 willBecomeCurrent:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v5 = (unint64_t)[v4 containerStyle];
  unsigned int v6 = (v5 > 7) | (0x5Cu >> v5);

  double v7 = [(RoutePlanningOverviewViewController *)self rootController];
  [v7 setAllowPersistentHighlight:v6 & 1];

  if (self->_hasPushedRouteCreation)
  {
    self->_hasPushedRouteCreation = 0;
    self->_restoreRoutePlanningAfterRouteCreation = 1;
  }
}

- (void)didBecomeCurrent
{
  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v7 didBecomeCurrent];
  if (self->_restoreRoutePlanningAfterRouteCreation)
  {
    self->_restoreRoutePlanningAfterRouteCreation = 0;
    unsigned int v3 = [(RoutePlanningOverviewViewController *)self _maps_platformController];
    id v4 = [v3 currentSession];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      unsigned int v6 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      [v6 resume];
    }
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(RoutePlanningOverviewViewController *)self _updateLoadingViewBottomInset];
}

- (int64_t)observedRoutePlanningData
{
  return 23676;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)CLLocation);
  double v32 = [v5 resolvedWaypointSet];
  objc_super v7 = [v32 origin];
  objc_super v8 = [v7 latLng];
  [v8 lat];
  double v10 = v9;
  double v11 = [v5 resolvedWaypointSet];
  double v12 = [v11 origin];
  double v13 = [v12 latLng];
  [v13 lng];
  id v15 = [v6 initWithLatitude:v10 longitude:v14];
  double v16 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v17 = [v16 rideOptionStateObserver];
  v18 = [v17 analyticsBookingSession];
  [v18 setOrigin:v15];

  id v19 = objc_alloc((Class)CLLocation);
  double v33 = [v5 resolvedWaypointSet];
  v20 = [v33 destination];
  id v21 = [v20 latLng];
  [v21 lat];
  double v23 = v22;
  double v24 = [v5 resolvedWaypointSet];

  double v25 = [v24 destination];
  double v26 = [v25 latLng];
  [v26 lng];
  id v28 = [v19 initWithLatitude:v23 longitude:v27];
  double v29 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v30 = [v29 rideOptionStateObserver];
  double v31 = [v30 analyticsBookingSession];
  [v31 setDestination:v28];

  [(RoutePlanningOverviewViewController *)self _updateDigitalIssuanceStateWithUpdateFlag:4];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5
{
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  id v39 = a3;
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 dismissRoutePlanningPlaceCardIfNeeded];

  objc_super v7 = [(RoutePlanningOverviewViewController *)self transportTypePicker];

  if (v7)
  {
    objc_super v8 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    [v8 setSelectedType:a4];
  }
  BOOL v9 = sub_10008034C();
  if (a4 == 4 && v9)
  {
    [(RoutePlanningOverviewViewController *)self _stopReferenceDateUpdates];
    [(RoutePlanningOverviewViewController *)self _prepareRideBookingForFirstUse];
    double v10 = [(RoutePlanningOverviewViewController *)self collectionView];
    double v11 = [v10 dataSource];
    double v12 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    if (v11 == v12)
    {
      double v30 = [(RoutePlanningOverviewViewController *)self collectionView];
      double v31 = [v30 delegate];
      double v32 = [(RoutePlanningOverviewViewController *)self rideBookingSource];

      if (v31 == v32) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    double v33 = [(RoutePlanningOverviewViewController *)self rootController];
    [v33 setCollectionView:0];

    v34 = [(RoutePlanningOverviewViewController *)self collectionView];
    v35 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    [v35 setCollectionView:v34];

    double v36 = [(RoutePlanningOverviewViewController *)self rootController];
    v37 = [v36 headerView];
    v38 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    [v38 setHeaderView:v37];
  }
  else
  {
    double v13 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    double v14 = [v13 rideOptionStateObserver];
    id v15 = [v14 analyticsBookingSession];
    [v15 endSessionOnView:1 state:2];

    [(RoutePlanningOverviewViewController *)self _resetCountOfRideOptionsBooked];
    double v16 = [(RoutePlanningOverviewViewController *)self rootController];
    double v17 = [v39 routeCollection];
    [v16 updateWithTransportType:a4 routeCollection:v17 isInACustomRouteRegion:[v39 inACustomRouteRegion]];

    if (a4 == 3) {
      [(RoutePlanningOverviewViewController *)self _startReferenceDateUpdates];
    }
    else {
      [(RoutePlanningOverviewViewController *)self _stopReferenceDateUpdates];
    }
    [(RoutePlanningOverviewViewController *)self _refreshContactsDisplayForAutomaticTripSharing];
    v18 = [(RoutePlanningOverviewViewController *)self collectionView];
    id v19 = [v18 dataSource];
    v20 = [(RoutePlanningOverviewViewController *)self rootController];
    if (v19 == v20)
    {
      id v21 = [(RoutePlanningOverviewViewController *)self collectionView];
      double v22 = [v21 delegate];
      double v23 = [(RoutePlanningOverviewViewController *)self rootController];

      if (v22 == v23) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    double v24 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    [v24 setCollectionView:0];

    double v25 = [(RoutePlanningOverviewViewController *)self collectionView];
    double v26 = [(RoutePlanningOverviewViewController *)self rootController];
    [v26 setCollectionView:v25];

    double v27 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    id v28 = [v27 headerView];
    double v29 = [(RoutePlanningOverviewViewController *)self rootController];
    [v29 setHeaderView:v28];

    [(RoutePlanningOverviewViewController *)self _scrollToCellToShowAtMediumLayoutAnimated:[(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip] ^ 1];
  }
LABEL_16:
  [(RoutePlanningOverviewViewController *)self _refreshTimingDisplay];
  [(RoutePlanningOverviewViewController *)self _refreshOptionsVisibility];
  [(RoutePlanningOverviewViewController *)self _refreshContentInset];
}

- (void)_refreshOptionsVisibility
{
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRideBookingRideOptionState:(id)a4
{
  id v5 = a4;
  id v6 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
  [v6 configureWithRideBookingRideOptionState:v5];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRequestState:(int64_t)a4
{
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 refreshRoutePlanningTimingIfNeeded];

  [(RoutePlanningOverviewViewController *)self _updateForEquivalentRequestState:a4];
}

- (void)_updateRidesharingAnalytics
{
  objc_super v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v4 = [v3 dataSource];
  id v5 = [(RoutePlanningOverviewViewController *)self rideBookingSource];

  if (v4 == v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    objc_super v7 = [v6 rideOptionStateObserver];
    objc_super v8 = [v7 rideOptionState];
    BOOL v9 = [v8 rideOptionStatusMap];
    double v10 = [v9 allValues];

    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v10);
          }
          double v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) rideOptions];
          v13 += (uint64_t)[v16 count];
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    double v17 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    v18 = [v17 rideOptionStateObserver];
    id v19 = [v18 analyticsBookingSession];
    [v19 captureRideOptionCount:v13];

    v20 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v21 = [v20 rideOptionStateObserver];
    double v22 = [v21 analyticsBookingSession];
    [v22 captureView:1];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  objc_super v7 = +[UIMenuSystem mainSystem];
  [v7 setNeedsRebuild];

  [(RoutePlanningOverviewViewController *)self setRouteCellsHeight:-1.0];
  if ([v6 count])
  {
    +[CATransaction setFrameStallSkipRequest:1];
    uint64_t v8 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    if (v8)
    {
      BOOL v9 = (void *)v8;
      id v10 = [v16 desiredTransportType];
      id v11 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
      id v12 = [v11 selectedType];

      if (v10 != v12)
      {
        id v13 = [v16 desiredTransportType];
        uint64_t v14 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
        [v14 setSelectedType:v13];
      }
    }
    [(RoutePlanningOverviewViewController *)self _refreshTimingDisplay];
    [(RoutePlanningOverviewViewController *)self _refreshContactsDisplayForAutomaticTripSharing];
    [(RoutePlanningOverviewViewController *)self _updateDataSourceRouteCollection:v6];
    [(RoutePlanningOverviewViewController *)self _scrollToCellToShowAtMediumLayoutAnimated:[(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip] ^ 1];
    [(RoutePlanningOverviewViewController *)self _setupAdvisoryFooterView];
    [(RoutePlanningOverviewViewController *)self _animateUpdatingHeightForSingleTrip];
    id v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:@"MapsRoutePlanningShowingRoutesNotification" object:self];
  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRoutes:(id)a4
{
  id v5 = a4;
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingTransitRouteUpdateWillUpdateSummary" object:0 userInfo:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        id v12 = [(RoutePlanningOverviewViewController *)self rootController];
        [v12 reloadExistingCellForRoute:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingTransitRouteUpdateDidUpdateSummary" object:0 userInfo:0];
}

- (void)_finishLaunchingIntoNavIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = +[MNNavigationService sharedService];
  unsigned __int8 v6 = [v5 isInNavigatingState];

  unsigned __int8 v7 = [(RoutePlanningOverviewViewController *)self _hasModalViewControllerInTransition];
  if ((v6 & 1) == 0 && (v7 & 1) == 0)
  {
    +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions];
    [(RoutePlanningOverviewViewController *)self _startNavigationForRouteCollection:v4 navigationDetailsOptions:v8];
  }
}

- (BOOL)_hasModalViewControllerInTransition
{
  objc_super v3 = [(RoutePlanningOverviewViewController *)self presentedViewController];
  if ([v3 isBeingPresented])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(RoutePlanningOverviewViewController *)self presentedViewController];
    unsigned __int8 v4 = [v5 isBeingDismissed];
  }
  return v4;
}

- (void)_updateDataSourceRouteCollection:(id)a3
{
  id v4 = a3;
  id v8 = [(RoutePlanningOverviewViewController *)self rootController];
  id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v6 = [v5 transportType];
  unsigned __int8 v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  [v8 updateWithTransportType:v6 routeCollection:v4 isInACustomRouteRegion:[v7 inACustomRouteRegion]];
}

- (void)_refreshTimingDisplay
{
}

- (void)_refreshContentInset
{
}

- (void)_refreshContactsDisplayForAutomaticTripSharing
{
  objc_super v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 platformController];

  id v5 = [v4 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 configuration];

  uint64_t v9 = [v8 automaticSharingContacts];

  if ([(RoutePlanningOverviewViewController *)self _shouldPermitAutomaticSharingContacts])
  {
    id v10 = sub_100576A9C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 134217984;
      id v20 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "RoutePlanningOverviewViewController updating routes list with %lu autosharing contacts", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v11 = [(RoutePlanningOverviewViewController *)self rootController];
    id v12 = v11;
    long long v13 = v9;
LABEL_15:
    [v11 setAutomaticSharingContacts:v13];

    goto LABEL_16;
  }
  if ([v9 count])
  {
    long long v14 = sub_100576A9C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v9 count];
      long long v16 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      double v17 = (char *)[v16 transportType];
      if ((unint64_t)(v17 - 1) > 4) {
        CFStringRef v18 = @"Undefined";
      }
      else {
        CFStringRef v18 = *(&off_1012F2470 + (void)(v17 - 1));
      }
      int v19 = 134218242;
      id v20 = v15;
      __int16 v21 = 2112;
      CFStringRef v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "RoutePlanningOverviewViewController have %lu autosharing contacts but incompatible transport type: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v11 = [(RoutePlanningOverviewViewController *)self rootController];
    id v12 = v11;
    long long v13 = &__NSArray0__struct;
    goto LABEL_15;
  }
LABEL_16:
}

- (BOOL)_shouldPermitAutomaticSharingContacts
{
  v2 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  [v2 transportType];
  char v3 = MSPSharedTripSharingSupportedForTransportType();

  return v3;
}

- (void)_presentEbikeOptions
{
  char v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 transportType];

  if (!v4)
  {
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v4 = [v5 desiredTransportType];
  }
  if (v4 == (id)5 && sub_10050B708())
  {
    id v6 = [(ControlContaineeViewController *)self delegate];
    [v6 presentRoutePlanningViewType:8];
  }
}

- (void)_presentRouteOptions
{
  char v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 transportType];

  if (!v4)
  {
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v4 = [v5 desiredTransportType];
  }
  uint64_t v6 = 17099;
  switch((unint64_t)v4)
  {
    case 0uLL:
      return;
    case 1uLL:
      uint64_t v6 = 3036;
      goto LABEL_7;
    case 3uLL:
      uint64_t v6 = 3035;
      goto LABEL_7;
    case 5uLL:
      uint64_t v6 = 3048;
      goto LABEL_7;
    default:
LABEL_7:
      id v7 = +[MKMapService sharedService];
      [v7 captureUserAction:v6 onTarget:[self currentUITargetForAnalytics] eventValue:0];

      id v8 = [(ControlContaineeViewController *)self delegate];
      [v8 presentRoutePlanningViewType:4];

      return;
  }
}

- (void)_markFeatureDiscoveryShown
{
  if ([(RoutePlanningOverviewViewController *)self _areWaypointsInCountryCode:@"FR"])
  {
    id v3 = [(RoutePlanningOverviewViewController *)self rootController];
    [v3 markFeatureDiscoveryShown];
  }
}

- (BOOL)_areWaypointsInCountryCode:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(RoutePlanningOverviewViewController *)self rootController];
  uint64_t v6 = [v5 routeCollection];
  id v7 = [v6 currentRoute];
  id v8 = [v7 waypoints];

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) mapItemStorage];
        long long v14 = [v13 _bestAvailableCountryCode];
        unsigned int v15 = [v14 isEqual:v4];

        if (!v15)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = a3;
  [(RoutePlanningOverviewViewController *)self _markFeatureDiscoveryShown];
  [(RoutePlanningOverviewViewController *)self handleDismissAction:v5];
}

- (void)dataSourceRequiresReload:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v6 = [v5 dataSource];

  if (v6 == v4)
  {
    [(RoutePlanningOverviewViewController *)self _updateRidesharingAnalytics];
    id v7 = [(RoutePlanningOverviewViewController *)self collectionView];
    [v7 _maps_reloadDataWithoutFocus];

    [(RoutePlanningOverviewViewController *)self _animateUpdatingHeightForSingleTrip];
  }
}

- (void)dataSource:(id)a3 requiresReloadOfSection:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(RoutePlanningOverviewViewController *)self rideBookingSource];

  if (v7 != v6)
  {
    uint64_t v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      double v17 = "-[RoutePlanningOverviewViewController dataSource:requiresReloadOfSection:]";
      __int16 v18 = 2080;
      long long v19 = "RoutePlanningOverviewViewController.m";
      __int16 v20 = 1024;
      int v21 = 987;
      __int16 v22 = 2080;
      long long v23 = "dataSource == self.rideBookingSource";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        double v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v8 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v9 = [v8 dataSource];

  if (v9 == v6)
  {
    [(RoutePlanningOverviewViewController *)self _updateRidesharingAnalytics];
    id v10 = [(RoutePlanningOverviewViewController *)self collectionView];
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10060F260;
    v15[3] = &unk_1012E69C0;
    v15[4] = self;
    v15[5] = a4;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10060F2D4;
    v14[3] = &unk_1012E7D28;
    [v10 performBatchUpdates:v15 completion:v14];
  }
}

- (void)dataSource:(id)a3 requiresDeletionOfIndexSet:(id)a4 reloadOfIndexSet:(id)a5 insertionOfIndexSet:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(RoutePlanningOverviewViewController *)self rideBookingSource];

  if (v14 != v10)
  {
    __int16 v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v26 = "-[RoutePlanningOverviewViewController dataSource:requiresDeletionOfIndexSet:reloadOfIndexSet:insertionOfIndexSet:]";
      __int16 v27 = 2080;
      id v28 = "RoutePlanningOverviewViewController.m";
      __int16 v29 = 1024;
      int v30 = 1004;
      __int16 v31 = 2080;
      double v32 = "dataSource == self.rideBookingSource";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        long long v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  unsigned int v15 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v16 = [v15 dataSource];

  if (v16 == v10)
  {
    double v17 = [(RoutePlanningOverviewViewController *)self collectionView];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10060F5B4;
    v21[3] = &unk_1012E85E0;
    v21[4] = self;
    id v22 = v12;
    id v23 = v11;
    id v24 = v13;
    [v17 performBatchUpdates:v21 completion:&stru_1012F22C8];
  }
}

- (void)didTapRouteCreationButtonForCell:(id)a3
{
  if (!self->_hasPushedRouteCreation)
  {
    id v4 = sub_1005768D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Pressed enter route creation (new route)", buf, 2u);
    }

    self->_hasPushedRouteCreation = 1;
    id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 resolvedWaypointSet];
    id v7 = [v6 origin];

    if (v7
      && ([v7 coordinate],
          CLLocationDegrees v9 = v8,
          [v7 coordinate],
          CLLocationCoordinate2D v30 = CLLocationCoordinate2DMake(v9, v10),
          CLLocationCoordinate2DIsValid(v30)))
    {
      id v11 = [v7 mkMapItem];
      id v12 = sub_1005768D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v7 shortDescription];
        *(_DWORD *)buf = 138477827;
        __int16 v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Providing a pre-selected origin: %{private}@", buf, 0xCu);
      }
    }
    else
    {
      id v12 = sub_1005768D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Origin doesn't have a valid coordinate to use", buf, 2u);
      }
      id v11 = 0;
    }

    id v14 = [v5 resolvedWaypointSet];
    unsigned int v15 = [v14 destination];

    if (v15
      && ([v15 coordinate],
          CLLocationDegrees v17 = v16,
          [v15 coordinate],
          CLLocationCoordinate2D v31 = CLLocationCoordinate2DMake(v17, v18),
          CLLocationCoordinate2DIsValid(v31)))
    {
      long long v19 = [v15 mkMapItem];
      __int16 v20 = sub_1005768D4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = [v15 shortDescription];
        *(_DWORD *)buf = 138477827;
        __int16 v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Providing a pre-selected destination: %{private}@", buf, 0xCu);
      }
    }
    else
    {
      __int16 v20 = sub_1005768D4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Destination doesn't have a valid coordinate to use", buf, 2u);
      }
      long long v19 = 0;
    }

    id v22 = +[MKMapService sharedService];
    [v22 captureUserAction:465 onTarget:[self currentUITargetForAnalytics] eventValue:0];

    id v23 = [(RoutePlanningOverviewViewController *)self _maps_mapsSceneDelegate];
    id v24 = [v23 appCoordinator];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10060FA08;
    v26[3] = &unk_1012E5D08;
    id v27 = v5;
    id v25 = v5;
    [v24 enterRouteCreationWithRoute:0 originMapItem:v11 destinationMapItem:v19 userInfo:0 completion:v26];
  }
}

- (void)didTapGoButtonForRouteOverviewCell:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  id v7 = sub_1005768D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v41 = 138412290;
    v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Go button was tapped at cell indexPath: %@", (uint8_t *)&v41, 0xCu);
  }

  double v8 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  CLLocationDegrees v9 = [v8 platformController];
  CLLocationDegrees v10 = [v9 auxiliaryTasksManager];
  id v11 = [v10 auxilaryTaskForClass:objc_opt_class()];

  [v11 cancelNavigationAutoLaunchIfNeccessary];
  id v12 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v13 = [v12 dataSource];
  id v14 = [(RoutePlanningOverviewViewController *)self rootController];

  if (v13 == v14)
  {
    id v22 = [(RoutePlanningOverviewViewController *)self rootController];
    __int16 v20 = [v22 routeCollection];

    if (![v20 count])
    {
      v38 = sub_1005762E4();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v41 = 136315906;
        v42 = "-[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:]";
        __int16 v43 = 2080;
        v44 = "RoutePlanningOverviewViewController.m";
        __int16 v45 = 1024;
        int v46 = 1058;
        __int16 v47 = 2080;
        v48 = "routeCollection.count > 0";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v41, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v39 = sub_1005762E4();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = +[NSThread callStackSymbols];
          int v41 = 138412290;
          v42 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);
        }
      }
    }
    if ([v20 count])
    {
      id v23 = [(RoutePlanningOverviewViewController *)self rootController];
      id v24 = [v23 indexOfRouteForRowAtIndexPath:v6];

      if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v25 = sub_1005768D4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v41 = 138412290;
          v42 = v6;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not find a route at indexPath %@", (uint8_t *)&v41, 0xCu);
        }

        long long v26 = sub_1005762E4();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int v41 = 136315650;
          v42 = "-[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:]";
          __int16 v43 = 2080;
          v44 = "RoutePlanningOverviewViewController.m";
          __int16 v45 = 1024;
          int v46 = 1063;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
        }

        if (!sub_100BB36BC()) {
          goto LABEL_29;
        }
        int v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v27 = +[NSThread callStackSymbols];
          int v41 = 138412290;
          v42 = v27;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);
        }
        goto LABEL_22;
      }
      v35 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      [v35 updateCurrentRouteIndex:v24];

      double v36 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      uint64_t v37 = [v36 routeCollection];

      [(RoutePlanningOverviewViewController *)self _doPromptsAndStartNavForRouteCollection:v37];
      __int16 v20 = v37;
    }
    else
    {
      v34 = sub_1005768D4();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v41 = 138477827;
        v42 = (const char *)v20;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Attempt to start navigation but the routes data source doesn't have any routes: %{private}@", (uint8_t *)&v41, 0xCu);
      }
    }
    [(RoutePlanningOverviewViewController *)self _markFeatureDiscoveryShown];
    goto LABEL_29;
  }
  unsigned int v15 = [(RoutePlanningOverviewViewController *)self collectionView];
  double v16 = [v15 dataSource];
  CLLocationDegrees v17 = [(RoutePlanningOverviewViewController *)self rideBookingSource];

  if (v16 == v17)
  {
    id v28 = [(RoutePlanningOverviewViewController *)self collectionView];
    __int16 v20 = [v28 dataSource];

    __int16 v29 = -[NSObject outlineSectionAtIndex:](v20, "outlineSectionAtIndex:", [v6 section]);
    [v29 didSelectItemAtIndexPath:v6];
    CLLocationCoordinate2D v30 = +[MKMapService sharedService];
    uint64_t v31 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
    double v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 section]);
    double v33 = [v32 stringValue];
    [v30 captureUserAction:14003 onTarget:v31 eventValue:v33];

    goto LABEL_29;
  }
  CLLocationDegrees v18 = sub_1005768D4();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v41) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Data source is neither route planning nor ride booking; ignoring go button tap",
      (uint8_t *)&v41,
      2u);
  }

  long long v19 = sub_1005762E4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v41 = 136315650;
    v42 = "-[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:]";
    __int16 v43 = 2080;
    v44 = "RoutePlanningOverviewViewController.m";
    __int16 v45 = 1024;
    int v46 = 1084;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    __int16 v20 = sub_1005762E4();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_29:

      goto LABEL_30;
    }
    int v21 = +[NSThread callStackSymbols];
    int v41 = 138412290;
    v42 = (const char *)v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);
LABEL_22:

    goto LABEL_29;
  }
LABEL_30:
}

- (void)_doPromptsAndStartNavForRouteCollection:(id)a3
{
  id v4 = a3;
  if (SBUIIsSystemApertureEnabled())
  {
    [(RoutePlanningOverviewViewController *)self _promptForSimulationAndStartNavigationForRouteCollection:v4];
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1006101D8;
    v5[3] = &unk_1012F22F0;
    v5[4] = self;
    id v6 = v4;
    +[PushNotificationPrompt checkShouldRepeatForUserAction:v5];
  }
}

- (void)_promptForSimulationAndStartNavigationForRouteCollection:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315906;
      *(void *)&location[4] = "-[RoutePlanningOverviewViewController _promptForSimulationAndStartNavigationForRouteCollection:]";
      __int16 v30 = 2080;
      uint64_t v31 = "RoutePlanningOverviewViewController.m";
      __int16 v32 = 1024;
      int v33 = 1117;
      __int16 v34 = 2080;
      v35 = "routeCollection != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", location, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  id v25 = [(RoutePlanningOverviewViewController *)self _maps_platformController];
  id v5 = [v25 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    double v8 = [v4 currentRoute];
    if (([v8 isMultipointRoute] & 1) == 0)
    {
      CLLocationDegrees v9 = [v8 origin];
      CLLocationDegrees v10 = [v9 geoMapItem];

      id v11 = [v8 destination];
      id v12 = [v11 geoMapItem];

      if (v10 && v12)
      {
        id v13 = [v8 transportType];
        id v14 = +[MapsSuggestionsPredictor sharedPredictor];
        unsigned int v15 = MapsSuggestionsMapItemConvertIfNeeded();
        double v16 = MapsSuggestionsMapItemConvertIfNeeded();
        [v14 captureActualTransportationMode:v13 originMapItem:v15 destinationMapItem:v16];
      }
    }
    objc_initWeak((id *)location, self);
    CLLocationDegrees v17 = [v7 configuration];
    id v18 = [v17 isNavigationTracePlayback];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1006108D8;
    v26[3] = &unk_1012F2318;
    objc_copyWeak(&v28, (id *)location);
    id v27 = v4;
    +[NavigationSimulationPromptController promptIfNeededForSimulationForRoute:v8 navigationTracePlayback:v18 continueWithOptions:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315906;
      *(void *)&location[4] = "-[RoutePlanningOverviewViewController _promptForSimulationAndStartNavigationForRouteCollection:]";
      __int16 v30 = 2080;
      uint64_t v31 = "RoutePlanningOverviewViewController.m";
      __int16 v32 = 1024;
      int v33 = 1121;
      __int16 v34 = 2080;
      v35 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", location, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
    double v8 = sub_1005768D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id location = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Attempt to go from route planning to navigation without a currently active RoutePlanningSession", location, 2u);
    }
  }
}

- (void)_startNavigationForRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4
{
  id v6 = a3;
  id v7 = [(ControlContaineeViewController *)self delegate];
  long long v8 = *(_OWORD *)&a4->guidanceType;
  v9[0] = *(_OWORD *)&a4->shouldSimulateLocations;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a4->isReconnecting;
  unint64_t navigationModeContext = a4->navigationModeContext;
  [v7 viewController:self startNavigationWithRouteCollection:v6 navigationDetailsOptions:v9];
}

- (void)didTapDetailsButtonForRouteOverviewCell:(id)a3
{
  id v16 = a3;
  id v4 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v5 = [v4 dataSource];
  id v6 = [(RoutePlanningOverviewViewController *)self rootController];

  if (v5 == v6)
  {
    id v7 = [(RoutePlanningOverviewViewController *)self collectionView];
    long long v8 = [v7 indexPathForCell:v16];

    uint64_t v9 = sub_1000BBB44(self);
    CLLocationDegrees v10 = [(RoutePlanningOverviewViewController *)self rootController];
    id v11 = v10;
    if (v9 == 5)
    {
      [v10 toggleStepsExpansionForRouteAtIndexPath:v8];
    }
    else
    {
      uint64_t v12 = [v10 routeForRowAtIndexPath:v8];

      if (v12)
      {
        id v13 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        [v13 updateCurrentRoute:v12];

        id v14 = [(ControlContaineeViewController *)self delegate];
        [v14 presentRoutePlanningViewType:2];

        id v11 = (void *)v12;
      }
      else
      {
        id v11 = 0;
      }
    }

    unsigned int v15 = +[MKMapService sharedService];
    [v15 captureUserAction:3004 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
}

- (void)didTapAutomaticSharingButtonForRouteOverviewCell:(id)a3
{
  id v3 = [(ControlContaineeViewController *)self delegate];
  [v3 presentRoutePlanningViewType:7];
}

- (void)dataSource:(id)a3 didSelectRowForRoute:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (![(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip]) {
    goto LABEL_4;
  }
  id v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  long long v8 = [v7 routeCollection];
  uint64_t v9 = [v8 currentRoute];
  unsigned int v10 = [v6 isEqual:v9];

  if (v10)
  {
    id v11 = [(ControlContaineeViewController *)self delegate];
    [v11 presentRoutePlanningViewType:2];

    uint64_t v12 = +[MKMapService sharedService];
    [v12 captureUserAction:3004 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
  else
  {
LABEL_4:
    id v13 = [(RoutePlanningOverviewViewController *)self rootController];

    if (v13 != v19) {
      goto LABEL_9;
    }
    id v14 = [(ControlContaineeViewController *)self delegate];
    [v14 dismissRoutePlanningPlaceCardIfNeeded];

    unsigned int v15 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    [v15 updateCurrentRoute:v6];

    id v16 = [(RoutePlanningOverviewViewController *)self rootController];
    unsigned __int8 v17 = [v16 allowsPersistentHighlight];

    if ((v17 & 1) == 0)
    {
      id v18 = [(ContaineeViewController *)self cardPresentationController];
      [v18 wantsLayout:2];
    }
    uint64_t v12 = +[MKMapService sharedService];
    [v12 captureUserAction:3015 onTarget:[self currentUITargetForAnalytics] eventValue:0 routeIndex:[v6 _maps_routeIndex]];
  }

LABEL_9:
}

- (BOOL)_supportsTransportTypePicker
{
  return 1;
}

- (void)transportTypePicker:(id)a3 typeSelected:(int64_t)a4
{
}

- (void)_updateToTransportType:(int64_t)a3
{
  id v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v6 = [v5 transportType];

  if (v6 != (id)a3)
  {
    id v7 = +[MKMapService sharedService];
    if ((unint64_t)a3 > 5) {
      uint64_t v8 = 3012;
    }
    else {
      uint64_t v8 = dword_100F700B8[a3];
    }
    [v7 captureUserAction:v8 onTarget:[self currentUITargetForAnalytics] eventValue:0];
  }
  uint64_t v9 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  [v9 updateTransportType:a3];

  [(RoutePlanningOverviewViewController *)self _refreshTimingDisplay];
  [(RoutePlanningOverviewViewController *)self _refreshOptionsVisibility];
  [(RoutePlanningOverviewViewController *)self _refreshContentInset];
  [(RoutePlanningOverviewViewController *)self _refreshSelectedVehicleDisplay];
  if (sub_1000BBB44(self) == 5)
  {
    unsigned int v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 updateHeightForCurrentLayout];
  }
  id v11 = sub_1005768D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v12 = @"Undefined";
    }
    else {
      CFStringRef v12 = *(&off_1012F2470 + a3 - 1);
    }
    int v17 = 138412290;
    CFStringRef v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User manually changed the transport type: %@", (uint8_t *)&v17, 0xCu);
  }

  id v13 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v14 = [v13 platformController];
  unsigned int v15 = [v14 auxiliaryTasksManager];
  id v16 = [v15 auxilaryTaskForClass:objc_opt_class()];

  [v16 cancelNavigationAutoLaunchIfNeccessary];
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v5 = [v4 transportType];

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 4uLL:
      id v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315650;
        id v14 = "-[RoutePlanningOverviewViewController didTapReportAProblemButtonOnRoutePlanningFooterView:]";
        __int16 v15 = 2080;
        id v16 = "RoutePlanningOverviewViewController.m";
        __int16 v17 = 1024;
        int v18 = 1250;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v13, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        id v7 = sub_1005762E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = +[NSThread callStackSymbols];
          int v13 = 138412290;
          id v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
        }
      }
      goto LABEL_8;
    case 1uLL:
      uint64_t v9 = 301;
      break;
    case 2uLL:
      uint64_t v9 = 302;
      break;
    case 3uLL:
      uint64_t v9 = 303;
      break;
    case 5uLL:
      uint64_t v9 = 305;
      break;
    default:
LABEL_8:
      uint64_t v9 = 0;
      break;
  }
  unsigned int v10 = +[MKMapService sharedService];
  [v10 captureUserAction:5013 onTarget:v9 eventValue:0];

  id v11 = [(RoutePlanningOverviewViewController *)self _maps_mapsSceneDelegate];
  CFStringRef v12 = [v11 rapPresenter];
  [v12 presentReportAProblemForRouteFromEntryPoint:v9];
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  id v9 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v5 = [v9 dataSource];
  id v6 = [(RoutePlanningOverviewViewController *)self rootController];
  if (v5 == v6)
  {
    id v7 = [(RoutePlanningOverviewViewController *)self rootController];
    id v8 = [v7 transportType];

    if (v8 != (id)3) {
      return;
    }
    id v9 = [(RoutePlanningOverviewViewController *)self rootController];
    [v9 reloadVisibleRouteCells];
  }
  else
  {
  }
}

- (void)_startReferenceDateUpdates
{
  id v3 = [(RoutePlanningOverviewViewController *)self rootController];
  id v4 = [v3 transportType];

  if (v4 == (id)3)
  {
    id v5 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];

    if (!v5)
    {
      id v6 = [objc_alloc((Class)MKTransitItemReferenceDateUpdater) initWithDelegate:self];
      [(RoutePlanningOverviewViewController *)self setReferenceDateUpdater:v6];

      id v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:self selector:"_sceneWillForeground:" name:UISceneWillEnterForegroundNotification object:0];

      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"_sceneDidBackground:" name:UISceneDidEnterBackgroundNotification object:0];
    }
    int64_t v9 = [(RoutePlanningOverviewViewController *)self _currentSceneActivationState];
    BOOL v11 = v9 != 2 && v9 != -1;
    id v16 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];
    [v16 setActive:v11];
  }
  else
  {
    CFStringRef v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int v18 = "-[RoutePlanningOverviewViewController _startReferenceDateUpdates]";
      __int16 v19 = 2080;
      __int16 v20 = "RoutePlanningOverviewViewController.m";
      __int16 v21 = 1024;
      int v22 = 1276;
      __int16 v23 = 2080;
      id v24 = "viewingTransitRoutes";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    __int16 v15 = sub_1005768D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Attempted to start reference date updates but current routes are not Transit", buf, 2u);
    }

    [(RoutePlanningOverviewViewController *)self _stopReferenceDateUpdates];
  }
}

- (void)_stopReferenceDateUpdates
{
  id v3 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];

  if (v3)
  {
    id v4 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];
    [v4 setActive:0];

    [(RoutePlanningOverviewViewController *)self setReferenceDateUpdater:0];
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:UISceneWillEnterForegroundNotification object:0];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:UISceneDidEnterBackgroundNotification object:0];
  }
}

- (void)_sceneWillForeground:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(RoutePlanningOverviewViewController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];

  if (v4 == v7)
  {
    id v8 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];
    [v8 setActive:1];
  }
}

- (void)_sceneDidBackground:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(RoutePlanningOverviewViewController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];

  if (v4 == v7)
  {
    id v8 = [(RoutePlanningOverviewViewController *)self referenceDateUpdater];
    [v8 setActive:0];
  }
}

- (void)didSelectFeedbackWithAppIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(ControlContaineeViewController *)self delegate];
    [v5 viewController:self continueRideBookingSessionWithApplicationIdentifier:v4];
  }
}

- (void)didSelectAppStoreSuggestionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:14001 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 viewController:self displayStoreViewControllerForAppWithiTunesIdentifier:v4 clientIdentifier:@"RidesharingStoreProductClientIdentifier"];
}

- (void)didSelectRideOption:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(RoutePlanningOverviewViewController *)self _incrementCountOfRideOptionsBooked];
    id v5 = [v4 application];
    +[RidesharingAppPreferenceManager recordAppSelection:v5];

    +[RidesharingAppPreferenceManager recordRideChoice:v4];
    id v6 = [v4 userActivityForBookingInApplication];

    if (!v6)
    {
      CFStringRef v12 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      int v13 = [v12 rideOptionStateObserver];
      id v14 = [v13 analyticsBookingSession];
      __int16 v15 = [v4 application];
      id v16 = [v15 identifier];
      __int16 v17 = [v4 application];
      int v18 = [v17 version];
      [v14 captureBookedApp:v16 version:v18];

      __int16 v19 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      __int16 v20 = [v19 rideOptionStateObserver];
      __int16 v21 = [v20 analyticsBookingSession];
      int v22 = [v4 name];
      [v21 captureBookedRideOptionName:v22];

      __int16 v23 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      id v24 = [v23 rideOptionStateObserver];
      [v24 startRequestRideForRideOption:v4];

      id v25 = [(ControlContaineeViewController *)self delegate];
      [v25 viewController:self startRideBookingSessionWithRideBookingRideOption:v4];

      goto LABEL_7;
    }
    id v7 = [v4 application];
    id v8 = [v4 userActivityForBookingInApplication];
    [v7 openWithActivity:v8];

    int64_t v9 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    unsigned int v10 = [v9 rideOptionStateObserver];
    BOOL v11 = [v10 analyticsBookingSession];
    [v11 endSessionOnView:1 state:4];

    goto LABEL_4;
  }
  long long v26 = sub_1005762E4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v27 = 136315906;
    id v28 = "-[RoutePlanningOverviewViewController didSelectRideOption:]";
    __int16 v29 = 2080;
    __int16 v30 = "RoutePlanningOverviewViewController.m";
    __int16 v31 = 1024;
    int v32 = 1338;
    __int16 v33 = 2080;
    __int16 v34 = "nil != rideOption";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v27, 0x26u);
  }

  if (sub_100BB36BC())
  {
    int64_t v9 = sub_1005762E4();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    unsigned int v10 = +[NSThread callStackSymbols];
    int v27 = 138412290;
    id v28 = (const char *)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);
LABEL_4:

LABEL_5:
  }
LABEL_7:
}

- (void)_incrementCountOfRideOptionsBooked
{
  unint64_t v2 = self->_countOfRideOptionsBooked + 1;
  self->_countOfRideOptionsBooked = v2;
  BOOL v3 = v2 > 1;
  id v6 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v6 rideOptionStateObserver];
  id v5 = [v4 analyticsBookingSession];
  [v5 setExploredOtherOptions:v3];
}

- (void)_resetCountOfRideOptionsBooked
{
  self->_countOfRideOptionsBooked = 0;
  id v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  unint64_t v2 = [v4 rideOptionStateObserver];
  BOOL v3 = [v2 analyticsBookingSession];
  [v3 setExploredOtherOptions:0];
}

- (void)_updateForEquivalentRequestState:(int64_t)a3
{
  uint64_t v5 = sub_1000BBB44(self);
  BOOL v6 = v5 == 5;
  switch(a3)
  {
    case 0:
      id v14 = 0;
      uint64_t v7 = 0;
      goto LABEL_4;
    case 1:
      id v14 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      BOOL v6 = 1;
      uint64_t v9 = 1;
      break;
    case 2:
      [(RoutePlanningOverviewViewController *)self _setupAdvisoryFooterView];
      id v14 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v7 = 1;
      BOOL v6 = 1;
      break;
    case 3:
      unsigned int v10 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      id v14 = [v10 routePlanningError];

      uint64_t v7 = 0;
      uint64_t v9 = 0;
      BOOL v6 = 1;
      uint64_t v8 = 1;
      break;
    default:
      id v14 = 0;
      uint64_t v7 = 0;
      BOOL v6 = 0;
LABEL_4:
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      break;
  }
  [(RoutePlanningOverviewViewController *)self _setLoadingViewVisible:v9];
  [(RoutePlanningOverviewViewController *)self _setCollectionViewVisible:v7];
  [(RoutePlanningOverviewViewController *)self _setErrorViewVisible:v8 routePlanningError:v14];
  if ([v14 errorCode] == (id)16) {
    [(RoutePlanningOverviewViewController *)self _forceChangeOrigin];
  }
  if (v6)
  {
    if (v5 == 5
      && ([(ContaineeViewController *)self cardPresentationController],
          BOOL v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = [v11 containeeLayout],
          v11,
          v12 != (id)2))
    {
      int v13 = [(ContaineeViewController *)self cardPresentationController];
      [v13 wantsLayout:2];
    }
    else
    {
      int v13 = [(ContaineeViewController *)self cardPresentationController];
      [v13 updateHeightForCurrentLayoutAnimated:1];
    }
  }
}

- (BOOL)_shouldShowAdvisoryCard
{
  BOOL v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 advisoriesInfo];

  if (v4
    && ([v4 genericAdvisorys],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v6))
  {
    uint64_t v7 = [v4 genericAdvisorys];
    uint64_t v8 = [v7 firstObject];

    if ([v8 shouldAlwaysShowAdvisoryCard])
    {
      uint64_t v9 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      BOOL v10 = [v9 transportType] == (id)1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_setupAdvisoryFooterView
{
  BOOL v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v4 = [v3 dataSource];

  if (MapsFeature_IsEnabled_FrenchClimateLaw()
    && [(RoutePlanningOverviewViewController *)self _shouldShowAdvisoryCard])
  {
    uint64_t v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 advisoriesInfo];

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100612184;
    v8[3] = &unk_1012F2340;
    objc_copyWeak(&v10, &location);
    id v7 = v6;
    id v9 = v7;
    [v4 setupAdvisoryInfoLayout:v7 tapHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [v4 setupAdvisoryInfoLayout:0 tapHandler:0];
  }
}

- (void)_forceChangeOrigin
{
  id v4 = sub_1005762E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315650;
    uint64_t v8 = "-[RoutePlanningOverviewViewController _forceChangeOrigin]";
    __int16 v9 = 2080;
    id v10 = "RoutePlanningOverviewViewController.m";
    __int16 v11 = 1024;
    int v12 = 1475;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    uint64_t v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = +[NSThread callStackSymbols];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(RoutePlanningOverviewViewController *)self doesNotRecognizeSelector:a2];
}

- (BOOL)isCollectionViewVisible
{
  if (self->_collectionView)
  {
    unint64_t v2 = [(RoutePlanningOverviewViewController *)self rootController];
    unsigned int v3 = [v2 hideContent] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_setCollectionViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RoutePlanningOverviewViewController *)self isCollectionViewVisible] != a3)
  {
    [(RoutePlanningOverviewViewController *)self setRouteCellsHeight:-1.0];
    uint64_t v5 = [(RoutePlanningOverviewViewController *)self rideBookingSource];
    [v5 setHideContent:!v3];

    id v6 = [(RoutePlanningOverviewViewController *)self rootController];
    [v6 setHideContent:!v3];

    if (v3) {
      float v7 = 749.0;
    }
    else {
      float v7 = 50.0;
    }
    id v9 = [(RoutePlanningOverviewViewController *)self collectionViewToBottomConstraint];
    *(float *)&double v8 = v7;
    [v9 setPriority:v8];
  }
}

- (BOOL)isLoadingViewVisible
{
  unint64_t v2 = self;
  BOOL v3 = [(LoadingModeView *)self->_loadingModeView superview];
  id v4 = [(ContaineeViewController *)v2 contentView];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)_setLoadingViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RoutePlanningOverviewViewController *)self isLoadingViewVisible] != a3)
  {
    if (v3)
    {
      uint64_t v5 = [(ContaineeViewController *)self contentView];
      id v6 = [(RoutePlanningOverviewViewController *)self loadingModeView];
      [v5 addSubview:v6];

      [(RoutePlanningOverviewViewController *)self _loadingAndErrorViewFrame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      __int16 v15 = [(RoutePlanningOverviewViewController *)self loadingModeView];
      [v15 setFrame:v8, v10, v12, v14];
    }
    else
    {
      [(LoadingModeView *)self->_loadingModeView removeFromSuperview];
    }
    [(RoutePlanningOverviewViewController *)self _updateLoadingViewBottomInset];
  }
}

- (void)_updateLoadingViewBottomInset
{
  uint64_t v3 = sub_1000BBB44(self);
  loadingModeView = self->_loadingModeView;
  if (v3 == 5)
  {
    [(LoadingModeView *)loadingModeView setBottomInset:10.0];
  }
  else
  {
    [(LoadingModeView *)loadingModeView fittingHeight];
    double v6 = v5;
    double v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 bottomSafeOffset];
    -[LoadingModeView setBottomInset:](self->_loadingModeView, "setBottomInset:");

    if ([(RoutePlanningOverviewViewController *)self isLoadingViewVisible])
    {
      [(LoadingModeView *)self->_loadingModeView fittingHeight];
      if (vabdd_f64(v8, v6) > 2.22044605e-16)
      {
        id v9 = [(ContaineeViewController *)self cardPresentationController];
        [v9 updateHeightForCurrentLayout];
      }
    }
  }
}

- (BOOL)isErrorViewVisible
{
  unint64_t v2 = self;
  uint64_t v3 = [(ErrorModeView *)self->_errorModeView superview];
  id v4 = [(ContaineeViewController *)v2 contentView];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)_setErrorViewVisible:(BOOL)a3 routePlanningError:(id)a4
{
  BOOL v4 = a3;
  id v23 = a4;
  if ([(RoutePlanningOverviewViewController *)self isErrorViewVisible] != v4)
  {
    double v6 = [(RoutePlanningOverviewViewController *)self errorModeView];
    double v7 = [v23 errorTitle];
    double v8 = [v23 errorMessage];
    [v6 setTitle:v7 andMessage:v8];

    id v9 = [(RoutePlanningOverviewViewController *)self errorModeView];
    double v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 bottomSafeOffset];
    [v9 setVerticalAdjustment:-v11];

    [(RoutePlanningOverviewViewController *)self _updateErrorViewButtonVisibilityWithError:v23];
    if (v4)
    {
      double v12 = [(ContaineeViewController *)self contentView];
      double v13 = [(RoutePlanningOverviewViewController *)self errorModeView];
      [v12 addSubview:v13];

      [(RoutePlanningOverviewViewController *)self _loadingAndErrorViewFrame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      int v22 = [(RoutePlanningOverviewViewController *)self errorModeView];
      [v22 setFrame:v15, v17, v19, v21];
    }
    else
    {
      [(ErrorModeView *)self->_errorModeView removeFromSuperview];
    }
  }
}

- (void)_updateErrorViewButtonVisibilityWithError:(id)a3
{
  id v4 = a3;
  if (![v4 errorViewShouldShowRoutingApps] || !GEOConfigGetBOOL())
  {
    id v9 = [v4 errorViewFeatureAvailabilityPunchoutURL];

    if (v9)
    {
      double v10 = +[NSBundle mainBundle];
      double v6 = [v10 localizedStringForKey:@"Learn More [Route Planning Cycling Coverage]" value:@"localized string not found" table:0];

      double v11 = [v4 errorViewFeatureAvailabilityPunchoutURL];
      double v12 = [(RoutePlanningOverviewViewController *)self errorModeView];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100612F98;
      v38[3] = &unk_1012E9CD8;
      id v39 = v11;
      id v13 = v11;
      [v12 setButtonTitle:v6 handler:v38];

      goto LABEL_7;
    }
    if ([v4 errorViewShouldShowRegularDirectionsFallback])
    {
      double v14 = +[NSBundle mainBundle];
      id v15 = [v14 localizedStringForKey:@"View Directions [Route Planning EV fallback]" value:@"localized string not found" table:0];

      double v16 = [(RoutePlanningOverviewViewController *)self errorModeView];
      double v17 = v16;
      double v18 = &stru_1012F2360;
    }
    else
    {
      if ([v4 errorCode] != (id)21)
      {
        double v20 = [v4 incidentMessage];
        double v21 = [v20 transitIncidents];
        id v22 = [v21 count];

        if (!v22)
        {
          if (!GEOConfigGetBOOL()
            || [v4 errorCode] != (id)2 && objc_msgSend(v4, "errorCode") != (id)22)
          {
            int v32 = [(RoutePlanningOverviewViewController *)self errorModeView];
            [v32 setButtonTitle:0 handler:0];

            goto LABEL_14;
          }
          __int16 v31 = +[NSBundle mainBundle];
          double v6 = [v31 localizedStringForKey:@"Turn Off" value:@"localized string not found" table:@"Offline"];

          objc_initWeak(&location, self);
          double v7 = [(RoutePlanningOverviewViewController *)self errorModeView];
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_100613100;
          v33[3] = &unk_1012EE310;
          double v8 = &v34;
          objc_copyWeak(&v34, &location);
          [v7 setButtonTitle:v6 handler:v33];
          goto LABEL_4;
        }
        id v23 = [v4 incidentMessage];
        id v24 = [v23 transitIncidents];

        id v25 = [v24 count];
        long long v26 = +[NSBundle mainBundle];
        int v27 = v26;
        if (v25 == (id)1) {
          CFStringRef v28 = @"View Incident Singular [SideView]";
        }
        else {
          CFStringRef v28 = @"View Incident Plural [SideView]";
        }
        __int16 v29 = [v26 localizedStringForKey:v28 value:@"localized string not found" table:0];

        objc_initWeak(&location, self);
        __int16 v30 = [(RoutePlanningOverviewViewController *)self errorModeView];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100613094;
        v35[3] = &unk_1012E97E8;
        objc_copyWeak(&v37, &location);
        id v15 = v24;
        id v36 = v15;
        [v30 setButtonTitle:v29 handler:v35];

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);

LABEL_13:
        goto LABEL_14;
      }
      double v19 = +[NSBundle mainBundle];
      id v15 = [v19 localizedStringForKey:@"View Directions [Route Planning LPR fallback]" value:@"localized string not found" table:0];

      double v16 = [(RoutePlanningOverviewViewController *)self errorModeView];
      double v17 = v16;
      double v18 = &stru_1012F2380;
    }
    [v16 setButtonTitle:v15 handler:v18];

    goto LABEL_13;
  }
  double v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"View Routing apps [Route Planning]" value:@"localized string not found" table:0];

  objc_initWeak(&location, self);
  double v7 = [(RoutePlanningOverviewViewController *)self errorModeView];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100612F3C;
  v40[3] = &unk_1012EE310;
  double v8 = &v41;
  objc_copyWeak(&v41, &location);
  [v7 setButtonTitle:v6 handler:v40];
LABEL_4:

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
LABEL_7:

LABEL_14:
}

- (BOOL)isDisplayingSingleTrip
{
  if (sub_1000BBB44(self) == 5) {
    return 0;
  }

  return [(RoutePlanningOverviewViewController *)self isFittingHeightToRoutes];
}

- (BOOL)isFittingHeightToRoutes
{
  unint64_t v2 = [(ContaineeViewController *)self cardPresentationController];
  BOOL v3 = [v2 containeeLayout] == (id)2;

  return v3;
}

- (id)_indexPathOfCellToShowAtMediumLayout
{
  BOOL v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 transportType];

  if (v4 == (id)4)
  {
    double v5 = +[NSIndexPath indexPathForRow:0 inSection:0];
  }
  else
  {
    double v6 = [(RoutePlanningOverviewViewController *)self rootController];
    double v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    double v8 = [v7 routeCollection];
    id v9 = [v8 currentRoute];
    double v5 = [v6 mostImportantIndexPathWithSelectedRoute:v9];
  }

  return v5;
}

- (void)_scrollToCellToShowAtMediumLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v42 = [(RoutePlanningOverviewViewController *)self _indexPathOfCellToShowAtMediumLayout];
  if (!v42)
  {
    double v5 = [(RoutePlanningOverviewViewController *)self collectionView];
    [v5 setContentOffset:CGPointZero animated:0];

    goto LABEL_13;
  }
  if ([(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip])
  {
    [(RoutePlanningOverviewViewController *)self _snapToRectOfRowToKeepVisible];
    goto LABEL_13;
  }
  [(RoutePlanningOverviewViewController *)self _rectOfRowToKeepVisible];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v14 convertRect:0 toView:v7];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v44.origin.x = v7;
  CGFloat rect = v9;
  v44.origin.y = v9;
  v44.size.width = v11;
  v44.size.height = v13;
  double MinY = CGRectGetMinY(v44);
  id v24 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v24 bounds];
  BOOL v25 = MinY < CGRectGetMinY(v45);

  v46.origin.x = v16;
  v46.origin.y = v18;
  v46.size.width = v20;
  v46.size.height = v22;
  double MaxY = CGRectGetMaxY(v46);
  int v27 = [(RoutePlanningOverviewViewController *)self collectionView];
  CFStringRef v28 = [v27 window];
  [v28 bounds];
  double v29 = CGRectGetMaxY(v47);

  int v30 = MaxY > v29 || v25;
  if (MaxY <= v29)
  {
    double MidY = rect;
    if (!v30) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  __int16 v31 = [(ContaineeViewController *)self cardPresentationController];
  [v31 bottomSafeOffset];
  double v13 = v13 - v32;

  v48.origin.x = v7;
  v48.origin.y = rect;
  v48.size.width = v11;
  v48.size.height = v13;
  double MidY = CGRectGetMidY(v48);
  if (v30)
  {
LABEL_12:
    double v34 = v13 * 0.5;
    v49.origin.x = v7;
    v49.origin.y = MidY;
    v49.size.width = v11;
    v49.size.height = v13 * 0.5;
    double v35 = CGRectGetMaxY(v49);
    id v36 = [(RoutePlanningOverviewViewController *)self collectionView];
    id v37 = [v36 collectionViewLayout];
    [v37 collectionViewContentSize];
    double v39 = v35 - v38;

    v40 = [(RoutePlanningOverviewViewController *)self collectionView];
    [v40 scrollRectToVisible:v3 MidY v11 v34 - fmax(v39, 0.0)];
  }
LABEL_13:
}

- (void)_snapToRectOfRowToKeepVisible
{
  [(RoutePlanningOverviewViewController *)self _rectOfRowToKeepVisible];
  double MinY = CGRectGetMinY(v26);
  double v4 = -(MinY * (double)[(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip]);
  double v5 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v5 contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v12 setContentInset:v4, v7, v9, v11];

  double v13 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v13 adjustedContentInset];
  double v15 = v14 - v4;

  CGFloat v16 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v16 setContentOffset:0.0, -(v15 - MinY)];

  double v17 = sub_100613704();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v18 = [(RoutePlanningOverviewViewController *)self collectionView];
    [v18 contentOffset];
    int v20 = 134349568;
    double v21 = self;
    __int16 v22 = 2048;
    double v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] Snapping to contentInset.top: %#.1lf, contentOffset.y: %#.1lf", (uint8_t *)&v20, 0x20u);
  }
}

- (void)_animateUpdatingHeightForSingleTrip
{
  if ([(RoutePlanningOverviewViewController *)self isFittingHeightToRoutes])
  {
    BOOL v3 = [(RoutePlanningOverviewViewController *)self viewIfLoaded];
    double v4 = [v3 superview];

    if (v4)
    {
      [(RoutePlanningOverviewViewController *)self _fittingHeightForMediumLayout];
      double v6 = v5;
      double v7 = [(RoutePlanningOverviewViewController *)self view];
      [v7 frame];
      double Height = CGRectGetHeight(v20);

      if (vabdd_f64(v6, Height) >= 2.22044605e-16)
      {
        if ([(RoutePlanningOverviewViewController *)self isAnimatingHeightForMediumLayout])
        {
          double v9 = [(RoutePlanningOverviewViewController *)self view];
          double v10 = [v9 window];
          [v10 _removeAllAnimations:1];
        }
        [(RoutePlanningOverviewViewController *)self setIsAnimatingHeightForMediumLayout:1];
        double v11 = [(ContaineeViewController *)self cardPresentationController];
        [v11 updateHeightForCurrentLayout];

        double v12 = [(RoutePlanningOverviewViewController *)self collectionView];
        [v12 layoutIfNeeded];

        double v13 = +[UIDevice currentDevice];
        id v14 = [v13 userInterfaceIdiom];

        if (v14 == (id)5)
        {
          double v15 = [(ContaineeViewController *)self headerView];
          [v15 layoutBelowIfNeeded];

          CGFloat v16 = [(RoutePlanningOverviewViewController *)self collectionView];
          double v17 = [(RoutePlanningOverviewViewController *)self loadingModeView];
          [v16 _maps_alignTopToView:v17];
        }
        v18[4] = self;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100613984;
        v19[3] = &unk_1012E5D08;
        v19[4] = self;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1006139C8;
        v18[3] = &unk_1012E7D28;
        +[UIView animateWithDuration:v19 animations:v18 completion:0.25];
      }
    }
  }
}

- (void)_contentSizeCategoryDidChange
{
  BOOL v3 = [(RoutePlanningOverviewViewController *)self collectionView];
  [v3 reloadData];

  [(RoutePlanningOverviewViewController *)self _scrollToCellToShowAtMediumLayoutAnimated:[(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip] ^ 1];
  if ([(RoutePlanningOverviewViewController *)self isDisplayingSingleTrip]
    && ![(RoutePlanningOverviewViewController *)self isAnimatingHeightForMediumLayout])
  {
    id v4 = [(ContaineeViewController *)self cardPresentationController];
    [v4 updateHeightForCurrentLayout];
  }
}

- (double)_calculatedRouteCellsHeight
{
  double v3 = -1.0;
  if ([(RoutePlanningOverviewViewController *)self isCollectionViewVisible])
  {
    id v4 = [(RoutePlanningOverviewViewController *)self collectionView];
    id v5 = [v4 numberOfSections];

    if (v5)
    {
      double v6 = [(RoutePlanningOverviewViewController *)self collectionView];
      [v6 layoutIfNeeded];

      double v7 = [(RoutePlanningOverviewViewController *)self collectionView];
      uint64_t v8 = (uint64_t)[v7 numberOfSections];

      if (v8 < 1)
      {
        return 0.0;
      }
      else
      {
        uint64_t v9 = 0;
        double v3 = 0.0;
        while (1)
        {
          double v10 = [(RoutePlanningOverviewViewController *)self collectionView];
          uint64_t v11 = (uint64_t)[v10 numberOfItemsInSection:v9];

          if (v11 >= 1) {
            break;
          }
LABEL_9:
          ++v9;
          double v21 = [(RoutePlanningOverviewViewController *)self collectionView];
          id v22 = [v21 numberOfSections];

          if (v9 >= (uint64_t)v22) {
            return v3;
          }
        }
        uint64_t v12 = 0;
        while (1)
        {
          double v13 = +[NSIndexPath indexPathForRow:v12 inSection:v9];
          id v14 = [(RoutePlanningOverviewViewController *)self collectionView];
          double v15 = [v14 cellForItemAtIndexPath:v13];

          if (!v15) {
            break;
          }
          CGFloat v16 = [v15 contentView];
          [v15 frame];
          [v16 _maps_compressedSizeForWidth:0 withBlock:CGRectGetWidth(v24)];
          double v18 = v17;

          double v3 = v3 + v18;
          ++v12;
          uint64_t v19 = [(RoutePlanningOverviewViewController *)self collectionView];
          id v20 = [v19 numberOfItemsInSection:v9];

          if (v12 >= (uint64_t)v20) {
            goto LABEL_9;
          }
        }

        return -1.0;
      }
    }
  }
  return v3;
}

- (double)_fittingHeightForMediumLayout
{
  [(RoutePlanningOverviewViewController *)self _cardHeightMinusTableViewHeight];
  double v4 = v3;
  id v5 = [(RoutePlanningOverviewViewController *)self viewIfLoaded];
  double v6 = [v5 window];
  double v7 = [v6 screen];
  if (v7)
  {
    uint64_t v8 = [v5 window];
    uint64_t v9 = [v8 screen];
    [v9 nativeScale];
    double v11 = v10;
  }
  else
  {
    uint64_t v8 = +[UIScreen mainScreen];
    [v8 nativeScale];
    double v11 = v12;
  }

  if (v11 <= 0.0) {
    double v13 = 1.0;
  }
  else {
    double v13 = 1.0 / v11;
  }

  +[RouteOverviewCell minimumHeight];
  double v15 = v14;
  CGFloat v16 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v17 = [v16 requestState];

  if (v17 == (id)3)
  {
    uint64_t v18 = 176;
LABEL_11:
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v18) fittingHeight];
    double v22 = v21;
    goto LABEL_12;
  }
  uint64_t v19 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v20 = [v19 requestState];

  if (v20 == (id)1)
  {
    uint64_t v18 = 168;
    goto LABEL_11;
  }
  __int16 v43 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  if ([v43 requestState] != (id)2)
  {

    goto LABEL_35;
  }
  uint64_t v44 = sub_1000BBB44(self);

  if (v44 != 5)
  {
LABEL_35:
    [(RoutePlanningOverviewViewController *)self _rectOfRowToKeepVisible];
    double Height = CGRectGetHeight(v60);
    v50 = [(ContaineeViewController *)self cardPresentationController];
    [v50 bottomSafeOffset];
    double v52 = Height - v51;

    v53 = [(RoutePlanningOverviewViewController *)self rootController];
    [v53 estimatedFeatureDiscoveryHeight];
    double v22 = v52 - v13 + v54;

    goto LABEL_12;
  }
  [(RoutePlanningOverviewViewController *)self routeCellsHeight];
  if (fabs(v45 + 1.0) <= 2.22044605e-16)
  {
    [(RoutePlanningOverviewViewController *)self _calculatedRouteCellsHeight];
    [(RoutePlanningOverviewViewController *)self setRouteCellsHeight:"setRouteCellsHeight:"];
  }
  [(RoutePlanningOverviewViewController *)self routeCellsHeight];
  if (v46 == -1.0)
  {
    v55 = [(RoutePlanningOverviewViewController *)self collectionView];
    v56 = [v55 collectionViewLayout];
    [v56 collectionViewContentSize];
    double v48 = v57 - v13;
  }
  else
  {
    [(RoutePlanningOverviewViewController *)self routeCellsHeight];
    double v48 = v47;
  }
  +[RouteOverviewCell minimumVerticalPadding];
  double v22 = v48 + v58;
LABEL_12:
  double v23 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  uint64_t v24 = [v23 accessoryView];
  if (!v24)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v25 = (void *)v24;
  uint64_t v26 = sub_1000BBB44(self);

  if (v26 != 5)
  {
    double v23 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
    int v27 = [v23 accessoryView];
    [v27 bounds];
    double v22 = v22 + CGRectGetHeight(v59) + 10.0;

    goto LABEL_15;
  }
LABEL_16:
  uint64_t v28 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
  if (v28)
  {
    double v29 = (void *)v28;
    int v30 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    __int16 v31 = [v30 superview];
    double v32 = [(ContaineeViewController *)self contentView];
    BOOL v33 = v31 == v32;

    if (v33) {
      double v22 = v22 + 48.0;
    }
  }
  if (v22 <= v15) {
    double v34 = v15;
  }
  else {
    double v34 = v22;
  }
  double v35 = v4 + v34;
  if (sub_1000BBB44(self) != 5)
  {
    [(RoutePlanningOverviewViewController *)self _minimumMediumCardHeight];
    if (v35 <= v36)
    {
      [(RoutePlanningOverviewViewController *)self _minimumMediumCardHeight];
      double v35 = v37;
    }
    [(RoutePlanningOverviewViewController *)self _maximumMediumCardHeight];
    if (v35 >= v38) {
      [(RoutePlanningOverviewViewController *)self _maximumMediumCardHeight];
    }
  }
  double v39 = [(RoutePlanningOverviewViewController *)self viewIfLoaded];
  UIRoundToViewScale();
  double v41 = v40;

  return v41;
}

- (double)_minimumMediumCardHeight
{
  double v3 = [(RoutePlanningOverviewViewController *)self view];
  [v3 bounds];
  if (CGRectGetWidth(v8) <= 325.0)
  {
    double v6 = 380.0;
  }
  else
  {
    double v4 = [(ContaineeViewController *)self cardPresentationController];
    [v4 availableHeight];
    double v6 = v5 * 0.5;
  }
  return v6;
}

- (double)_maximumMediumCardHeight
{
  double v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 availableHeight];
  double v5 = v4 * 0.649999976;
  [(RoutePlanningOverviewViewController *)self _heightForFullLayout];
  if (v5 >= v6 + -34.0)
  {
    [(RoutePlanningOverviewViewController *)self _heightForFullLayout];
    double v9 = v10 + -34.0;
  }
  else
  {
    double v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 availableHeight];
    double v9 = v8 * 0.649999976;
  }
  return v9;
}

- (void)_updateDigitalIssuanceStateWithUpdateFlag:(int64_t)a3
{
  [(RoutePlanningOverviewViewController *)self setDigitalIssuanceUpdateFlags:[(RoutePlanningOverviewViewController *)self digitalIssuanceUpdateFlags] | a3];
  if (([(RoutePlanningOverviewViewController *)self digitalIssuanceUpdateFlags] & 4) != 0)
  {
    [(RoutePlanningOverviewViewController *)self setHasIncrementedDigitalIssuanceCountForRoute:0];
    [(RoutePlanningOverviewViewController *)self setDigitalIssuanceUpdateFlags:0];
  }
}

- (void)pptTestStartNavigation
{
  double v3 = [(RoutePlanningOverviewViewController *)self rootController];
  double v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v5 = [v4 routeCollection];
  double v6 = [v5 currentRoute];
  id v9 = [v3 indexPathForRoute:v6];

  double v7 = [(RoutePlanningOverviewViewController *)self collectionView];
  double v8 = [v7 cellForItemAtIndexPath:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(RoutePlanningOverviewViewController *)self didTapGoButtonForRouteOverviewCell:v8];
  }
}

- (void)pptTestEndNavigation
{
  unint64_t v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315650;
    double v6 = "-[RoutePlanningOverviewViewController pptTestEndNavigation]";
    __int16 v7 = 2080;
    double v8 = "RoutePlanningOverviewViewController.m";
    __int16 v9 = 1024;
    int v10 = 1826;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v5, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    double v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v4 = +[NSThread callStackSymbols];
      int v5 = 138412290;
      double v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  unint64_t v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315650;
    double v6 = "-[RoutePlanningOverviewViewController pptTestTransitionBetweenFullAndLightGuidance]";
    __int16 v7 = 2080;
    double v8 = "RoutePlanningOverviewViewController.m";
    __int16 v9 = 1024;
    int v10 = 1831;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v5, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    double v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v4 = +[NSThread callStackSymbols];
      int v5 = 138412290;
      double v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (int)currentUITargetForAnalytics
{
  unint64_t v2 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v3 = (char *)[v2 transportType];
  if ((unint64_t)(v3 - 1) >= 5) {
    int v4 = 0;
  }
  else {
    int v4 = v3 + 300;
  }

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10061460C;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_refreshSelectedVehicleDisplay
{
}

- (void)_refreshRoutePlanning
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 platformController];

  id v5 = [v4 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 requestUpdatedRouteWithRefreshedOrigin:0];
    [(RoutePlanningOverviewViewController *)self _updateForEquivalentRequestState:1];
  }
  else
  {
    id v8 = sub_1005768D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't refresh route planning as there wasn't a current route planning session", v9, 2u);
    }
  }
}

- (BOOL)shouldRefreshRoutePlanningWithCurrentGarage:(id)a3 previousGarage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((MapsFeature_IsEnabled_EVRouting() & 1) != 0 || MapsFeature_IsEnabled_Alberta())
  {
    uint64_t v7 = [v5 selectedVehicle];
    uint64_t v8 = [v6 selectedVehicle];
    if (!(v7 | v8))
    {
      BOOL v29 = 0;
LABEL_30:

      goto LABEL_31;
    }
    __int16 v9 = [(id)v7 identifier];
    int v10 = [(id)v8 identifier];
    unint64_t v11 = v9;
    unint64_t v12 = v10;
    if (v11 | v12)
    {
      double v13 = (void *)v12;
      unsigned __int8 v14 = [(id)v11 isEqual:v12];

      if ((v14 & 1) == 0)
      {
        int v30 = sub_1005768D4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          __int16 v31 = "Will refresh RP because selected vehicle.";
LABEL_27:
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
        }
LABEL_28:
        BOOL v29 = 1;
LABEL_29:

        goto LABEL_30;
      }
    }
    double v15 = [(id)v7 licensePlate];
    CGFloat v16 = [(id)v8 licensePlate];
    unint64_t v17 = v15;
    unint64_t v18 = v16;
    if (!(v17 | v18)
      || (unsigned int v19 = [(id)v17 isEqual:v18], (id)v18, (id)v17, v19))
    {
      id v20 = [(id)v7 lprPowerType];
      double v21 = [(id)v8 lprPowerType];
      unint64_t v22 = v20;
      unint64_t v23 = v21;
      if (!(v22 | v23)
        || (unsigned int v24 = [(id)v22 isEqual:v23], (id)v23,
                                                                        (id)v22,
                                                                        v24))
      {
        uint64_t v25 = [(id)v7 lprVehicleType];
        uint64_t v26 = [(id)v8 lprVehicleType];
        unint64_t v27 = v25;
        unint64_t v28 = v26;
        if (!(v27 | v28))
        {

          goto LABEL_17;
        }
        double v32 = (void *)v28;
        unsigned __int8 v47 = [(id)v27 isEqual:v28];

        if (v47)
        {
LABEL_17:
          id v33 = [(id)v7 supportedConnectors];
          if (v33 == [(id)v8 supportedConnectors])
          {
            unsigned int v34 = [(id)v7 usesPreferredNetworksForRouting];
            if (v34 == [(id)v8 usesPreferredNetworksForRouting])
            {
              double v36 = [(id)v7 preferredChargingNetworks];
              double v37 = [(id)v8 preferredChargingNetworks];
              unint64_t v38 = v36;
              unint64_t v39 = v37;
              if (v38 | v39)
              {
                double v40 = (void *)v39;
                unsigned __int8 v41 = [(id)v38 isEqual:v39];

                if ((v41 & 1) == 0)
                {
                  if ([(id)v7 usesPreferredNetworksForRouting])
                  {
                    int v30 = sub_1005768D4();
                    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_28;
                    }
                    *(_WORD *)buf = 0;
                    __int16 v31 = "Will refresh RP because preferredNetworks changed.";
                    goto LABEL_27;
                  }
                }
              }
              unsigned int v42 = [v5 shouldAssumeFullCharge];
              if (v42 == [v6 shouldAssumeFullCharge])
              {
                __int16 v43 = [(id)v7 currentVehicleState];
                uint64_t v44 = [(id)v8 currentVehicleState];
                unsigned int v45 = [v43 isSignificantlyDifferentFromVehicleState:v44];

                double v46 = sub_1005768D4();
                int v30 = v46;
                if (v45)
                {
                  BOOL v29 = 1;
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Will refresh RP because the selected vehicle's state changed significantly.", buf, 2u);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Will not refresh RP because the latest change in vehicle was not significant.", buf, 2u);
                  }
                  BOOL v29 = 0;
                }
                goto LABEL_29;
              }
              int v30 = sub_1005768D4();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                __int16 v31 = "Will refresh RP because shouldAssumeFullCharge changed.";
                goto LABEL_27;
              }
            }
            else
            {
              int v30 = sub_1005768D4();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                __int16 v31 = "Will refresh RP because usesPreferredNetworksForRouting changed.";
                goto LABEL_27;
              }
            }
          }
          else
          {
            int v30 = sub_1005768D4();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              __int16 v31 = "Will refresh RP because supportedConnectors changed.";
              goto LABEL_27;
            }
          }
          goto LABEL_28;
        }
LABEL_25:
        int v30 = sub_1005768D4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          __int16 v31 = "Will refresh RP because lprInfo changed.";
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
    goto LABEL_25;
  }
  BOOL v29 = 0;
LABEL_31:

  return v29;
}

- (BOOL)hasValidEVRoute
{
  unint64_t v2 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v3 = [v2 currentRoute];

  if ([v3 isEVRoute])
  {
    id v4 = [v3 origin];
    unsigned __int8 v5 = [v4 isCurrentLocation];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)chargingInfoForWaypointAtIndex:(unint64_t)a3
{
  if ([(RoutePlanningOverviewViewController *)self hasValidEVRoute])
  {
    unsigned __int8 v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 currentRoute];

    uint64_t v7 = [v6 waypoints];
    if ((unint64_t)[v7 count] <= a3)
    {
      __int16 v9 = 0;
    }
    else
    {
      uint64_t v8 = [v6 waypoints];
      __int16 v9 = [v8 objectAtIndexedSubscript:a3];
    }
    double v13 = [v9 chargingInfo];
  }
  else
  {
    int v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315650;
      CGFloat v16 = "-[RoutePlanningOverviewViewController chargingInfoForWaypointAtIndex:]";
      __int16 v17 = 2080;
      unint64_t v18 = "RoutePlanningOverviewViewController.m";
      __int16 v19 = 1024;
      int v20 = 1954;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v15, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      unint64_t v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = +[NSThread callStackSymbols];
        int v15 = 138412290;
        CGFloat v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
      }
    }
    double v13 = 0;
  }

  return v13;
}

- (id)evStepInfoForWaypointAtIndex:(unint64_t)a3
{
  if ([(RoutePlanningOverviewViewController *)self hasValidEVRoute])
  {
    unsigned __int8 v5 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v6 = [v5 currentRoute];

    if (!a3)
    {
      __int16 v9 = [v6 firstEVStep];
      uint64_t v26 = [v9 evInfo];
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v7 = [v6 waypoints];
    if ((unint64_t)[v7 count] <= a3)
    {
    }
    else
    {
      uint64_t v8 = [v6 waypoints];
      __int16 v9 = [v8 objectAtIndexedSubscript:a3];

      if (v9)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        __int16 v31 = v6;
        int v10 = [v6 legs];
        id v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v33;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              CGFloat v16 = [v15 destination];
              __int16 v17 = [v16 uniqueID];
              unint64_t v18 = [v9 uniqueID];
              unsigned __int8 v19 = [v17 isEqual:v18];

              if (v19)
              {
                id v6 = v31;
                BOOL v29 = -[NSObject lastEVStepInLegWithIndex:](v31, "lastEVStepInLegWithIndex:", [v15 legIndex]);
                uint64_t v26 = [v29 evInfo];

                goto LABEL_39;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        int v20 = sub_1005768D4();
        id v6 = v31;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          double v21 = [v9 uniqueID];
          *(_DWORD *)buf = 138412546;
          unint64_t v38 = v21;
          __int16 v39 = 2112;
          double v40 = (const char *)v31;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not find waypointId: %@ in route: %@", buf, 0x16u);
        }
        unint64_t v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          unint64_t v38 = "-[RoutePlanningOverviewViewController evStepInfoForWaypointAtIndex:]";
          __int16 v39 = 2080;
          double v40 = "RoutePlanningOverviewViewController.m";
          __int16 v41 = 1024;
          int v42 = 1988;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          int v10 = sub_1005762E4();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            unint64_t v23 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            unint64_t v38 = v23;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
          goto LABEL_35;
        }
LABEL_37:
        uint64_t v26 = 0;
        goto LABEL_40;
      }
    }
    unint64_t v27 = sub_1005762E4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v38 = "-[RoutePlanningOverviewViewController evStepInfoForWaypointAtIndex:]";
      __int16 v39 = 2080;
      double v40 = "RoutePlanningOverviewViewController.m";
      __int16 v41 = 1024;
      int v42 = 1977;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      int v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v28 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        unint64_t v38 = v28;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      __int16 v9 = 0;
LABEL_35:
      uint64_t v26 = 0;
LABEL_39:

      goto LABEL_40;
    }
    __int16 v9 = 0;
    goto LABEL_37;
  }
  unsigned int v24 = sub_1005762E4();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v38 = "-[RoutePlanningOverviewViewController evStepInfoForWaypointAtIndex:]";
    __int16 v39 = 2080;
    double v40 = "RoutePlanningOverviewViewController.m";
    __int16 v41 = 1024;
    int v42 = 1966;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (!sub_100BB36BC())
  {
    uint64_t v26 = 0;
    goto LABEL_42;
  }
  id v6 = sub_1005762E4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    unint64_t v38 = v25;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  uint64_t v26 = 0;
LABEL_41:

LABEL_42:

  return v26;
}

- (LoadingModeView)loadingModeView
{
  return self->_loadingModeView;
}

- (void)setLoadingModeView:(id)a3
{
}

- (void)setErrorModeView:(id)a3
{
}

- (RoutePlanningDataCoordinator)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordinator *)WeakRetained;
}

- (UIView)routeOptionsPopoverSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeOptionsPopoverSourceView);

  return (UIView *)WeakRetained;
}

- (NSString)originName
{
  return self->_originName;
}

- (void)setOriginName:(id)a3
{
}

- (BOOL)hasIncrementedDigitalIssuanceCountForRoute
{
  return self->_hasIncrementedDigitalIssuanceCountForRoute;
}

- (void)setHasIncrementedDigitalIssuanceCountForRoute:(BOOL)a3
{
  self->_hasIncrementedDigitalIssuanceCountForRoute = a3;
}

- (int64_t)digitalIssuanceUpdateFlags
{
  return self->_digitalIssuanceUpdateFlags;
}

- (void)setDigitalIssuanceUpdateFlags:(int64_t)a3
{
  self->_digitalIssuanceUpdateFlags = a3;
}

- (UIAlertController)simulationPromptAlertController
{
  return self->_simulationPromptAlertController;
}

- (void)setSimulationPromptAlertController:(id)a3
{
}

- (ContainerHeaderView)containerHeaderView
{
  return self->_containerHeaderView;
}

- (void)setContainerHeaderView:(id)a3
{
}

- (TransportTypePicker)transportTypePicker
{
  return self->_transportTypePicker;
}

- (void)setTransportTypePicker:(id)a3
{
}

- (BOOL)isAnimatingHeightForMediumLayout
{
  return self->_isAnimatingHeightForMediumLayout;
}

- (void)setIsAnimatingHeightForMediumLayout:(BOOL)a3
{
  self->_isAnimatingHeightForMediumLayout = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (NSLayoutConstraint)collectionViewToBottomConstraint
{
  return self->_collectionViewToBottomConstraint;
}

- (void)setCollectionViewToBottomConstraint:(id)a3
{
}

- (RoutePlanningOutlineRootController)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
}

- (double)routeCellsHeight
{
  return self->_routeCellsHeight;
}

- (void)setRouteCellsHeight:(double)a3
{
  self->_routeCellsdouble Height = a3;
}

- (RideBookingOutlineController)rideBookingSource
{
  return self->_rideBookingSource;
}

- (void)setRideBookingSource:(id)a3
{
}

- (RideBookingRideOptionState)cachedRideOptionState
{
  return self->_cachedRideOptionState;
}

- (void)setCachedRideOptionState:(id)a3
{
}

- (unint64_t)countOfRideOptionsBooked
{
  return self->_countOfRideOptionsBooked;
}

- (MKTransitItemReferenceDateUpdater)referenceDateUpdater
{
  return self->_referenceDateUpdater;
}

- (void)setReferenceDateUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDateUpdater, 0);
  objc_storeStrong((id *)&self->_cachedRideOptionState, 0);
  objc_storeStrong((id *)&self->_rideBookingSource, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_collectionViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_transportTypePicker, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
  objc_storeStrong((id *)&self->_simulationPromptAlertController, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_destroyWeak((id *)&self->_routeOptionsPopoverSourceView);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_virtualGarageAtLastRouteRequest, 0);

  objc_storeStrong((id *)&self->_virtualGarage, 0);
}

@end