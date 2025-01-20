@interface MacChromeViewController
- (BOOL)_sharingEnabled;
- (BOOL)_shouldHideSidebar;
- (BOOL)_sidebarVisible;
- (BOOL)canDeleteStop;
- (BOOL)isCurrentInteractionDidDeselect;
- (BOOL)isEligibleForMapViewFrameRateLimiting;
- (BOOL)mapLoadedWithoutError;
- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3;
- (BOOL)supportsDefaultFullscreenViewControllerPresentation;
- (NSLayoutConstraint)mapViewInsetsSideBarWidthConstraint;
- (NSLayoutConstraint)viewportSideBarWidthConstraint;
- (PassThroughViewController)fallbackDetailViewController;
- (SupplementalStackViewController)masterViewController;
- (ToolbarController)toolbarController;
- (UIEdgeInsets)labelEdgeInsets;
- (UIEdgeInsets)mapAttributionInsets;
- (UISplitViewController)splitViewController;
- (UIView)dividerView;
- (UIViewController)detailViewController;
- (id)_currentRouteSearchViewController;
- (id)_macBaseActionCoordinator;
- (id)_mapAndWeatherAttribution;
- (id)_separatorColor;
- (id)allComponents;
- (id)checkForInternetError:(id)a3;
- (id)currentCollectionShareItemSource;
- (id)mapItemFromWaypoint:(id)a3;
- (id)preferredFocusEnvironments;
- (id)topSidebarController_forTests;
- (id)urlForRoute:(id)a3;
- (void)_locationManagerApprovalDidChange:(id)a3;
- (void)_maps_splitViewControllerDidChangePrimaryColumnWidth:(id)a3;
- (void)_setSidebarContentControllers:(id)a3 forContext:(id)a4;
- (void)_showLocationServicesAlertIfNeeded;
- (void)_updateDividerFrame;
- (void)_updateShareButton;
- (void)_updateSidebarConstraints;
- (void)_updateSidebarHiddenUserDefault:(BOOL)a3;
- (void)_updateSidebarWithAnimation:(id)a3;
- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)deleteStop;
- (void)find:(id)a3;
- (void)hideSideBar:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)hideSideBar:(BOOL)a3 animation:(id)a4 completion:(id)a5;
- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4;
- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4;
- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)mapViewWillStartRenderingMap:(id)a3;
- (void)newSceneInTab:(BOOL)a3;
- (void)notifyToolbarOfRoutePlanningState:(id)a3;
- (void)orderFrontStandardAboutPanel:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)popSidebarViewController;
- (void)prepareMapViewForFirstUse;
- (void)presentAddNewCollection;
- (void)presentAddToCollection:(id)a3;
- (void)presentAddToFavorites;
- (void)pushSidebarViewController:(id)a3;
- (void)requestNewTab:(id)a3;
- (void)requestNewWindow:(id)a3;
- (void)select3dMode;
- (void)setAppCoordinator:(id)a3;
- (void)setCurrentInteractionDidDeselect:(BOOL)a3;
- (void)setDetailViewController:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setFallbackDetailViewController:(id)a3;
- (void)setMapLoadedWithoutError:(BOOL)a3;
- (void)setMapViewInsetsSideBarWidthConstraint:(id)a3;
- (void)setMasterViewController:(id)a3;
- (void)setSidebarViewControllers:(id)a3;
- (void)setSplitViewController:(id)a3;
- (void)setToolbarController:(id)a3;
- (void)setViewportSideBarWidthConstraint:(id)a3;
- (void)tapDirectionButton:(id)a3;
- (void)tapLocateMe:(id)a3;
- (void)tapShareButton:(id)a3;
- (void)tapToggleSidebar:(id)a3;
- (void)tapUserProfileButton:(id)a3;
- (void)toggleDirections;
- (void)toggleMapScale;
- (void)toggleSidebar:(id)a3;
- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5;
- (void)updateMapViewDisplayOptions;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MacChromeViewController

- (void)setAppCoordinator:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MacChromeViewController;
  id v4 = a3;
  [(IOSBasedChromeViewController *)&v6 setAppCoordinator:v4];
  v5 = [v4 platformController];

  [v5 addObserver:self];
}

- (void)viewDidLoad
{
  v81.receiver = self;
  v81.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v81 viewDidLoad];
  v3 = objc_alloc_init(SupplementalStackViewController);
  [(MacChromeViewController *)self setMasterViewController:v3];

  id v4 = [(MacChromeViewController *)self masterViewController];
  v5 = [v4 view];
  [v5 setClipsToBounds:1];

  objc_super v6 = objc_alloc_init(PassThroughViewController);
  [(PassThroughViewController *)v6 setDelegate:self];
  v7 = [(PassThroughViewController *)v6 view];
  [v7 setAccessibilityIdentifier:@"MacChromeFallbackPassthroughView"];

  v80 = v6;
  [(MacChromeViewController *)self setFallbackDetailViewController:v6];
  [(MacChromeViewController *)self setDetailViewController:v6];
  v8 = objc_alloc_init(BlurInWindowSplitViewController);
  [(MacChromeViewController *)self setSplitViewController:v8];

  v9 = [(MacChromeViewController *)self masterViewController];
  v83[0] = v9;
  v10 = [(MacChromeViewController *)self detailViewController];
  v83[1] = v10;
  v11 = +[NSArray arrayWithObjects:v83 count:2];
  v12 = [(MacChromeViewController *)self splitViewController];
  [v12 setViewControllers:v11];

  v13 = [(MacChromeViewController *)self splitViewController];
  [v13 setPreferredPrimaryColumnWidthFraction:0.150000006];

  v14 = [(MacChromeViewController *)self splitViewController];
  [v14 setMinimumPrimaryColumnWidth:282.0];

  v15 = [(MacChromeViewController *)self splitViewController];
  [v15 setMaximumPrimaryColumnWidth:380.0];

  v16 = +[UIColor clearColor];
  v17 = [(MacChromeViewController *)self splitViewController];
  v18 = [v17 view];
  [v18 setBackgroundColor:v16];

  v19 = [(MacChromeViewController *)self splitViewController];
  LODWORD(v20) = 1.0;
  [v19 setGutterWidth:v20];

  v21 = [(MacChromeViewController *)self splitViewController];
  [v21 setPrimaryBackgroundStyle:1];

  if ([(MacChromeViewController *)self _shouldHideSidebar]) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2;
  }
  v23 = [(MacChromeViewController *)self splitViewController];
  [v23 setPreferredDisplayMode:v22];

  v24 = [(MacChromeViewController *)self splitViewController];
  [v24 setDelegate:self];

  v25 = [(MacChromeViewController *)self splitViewController];
  [(MacChromeViewController *)self addChildViewController:v25];

  v26 = [(MacChromeViewController *)self view];
  v27 = [(MacChromeViewController *)self splitViewController];
  v28 = [v27 view];
  v29 = [(ChromeViewController *)self mapView];
  [v26 insertSubview:v28 aboveSubview:v29];

  v30 = [(MacChromeViewController *)self splitViewController];
  [v30 didMoveToParentViewController:self];

  v79 = [(MacChromeViewController *)self splitViewController];
  v31 = [v79 view];
  v32 = [(MacChromeViewController *)self view];
  id v33 = v31;
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  v78 = [v33 topAnchor];
  v77 = [v32 topAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v84[0] = v76;
  v75 = [v33 leadingAnchor];
  v74 = [v32 leadingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v84[1] = v73;
  v34 = [v33 bottomAnchor];
  v35 = [v32 bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v84[2] = v36;
  v37 = [v33 widthAnchor];

  v38 = [v32 widthAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  v84[3] = v39;
  v40 = +[NSArray arrayWithObjects:v84 count:4];
  +[NSLayoutConstraint activateConstraints:v40];

  id v41 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(MacChromeViewController *)self setDividerView:v41];

  v42 = [(MacChromeViewController *)self _separatorColor];
  v43 = [(MacChromeViewController *)self dividerView];
  [v43 setBackgroundColor:v42];

  v44 = [(MacChromeViewController *)self dividerView];
  [v44 setUserInteractionEnabled:0];

  v45 = [(MacChromeViewController *)self view];
  v46 = [(MacChromeViewController *)self dividerView];
  [v45 addSubview:v46];

  v47 = [(ChromeViewController *)self viewportLayoutGuide];
  v48 = [v47 leadingAnchor];
  v49 = [(MacChromeViewController *)self view];
  v50 = [v49 safeAreaLayoutGuide];
  v51 = [v50 leadingAnchor];
  v52 = [v48 constraintGreaterThanOrEqualToAnchor:v51 constant:0.0];
  [(MacChromeViewController *)self setViewportSideBarWidthConstraint:v52];

  v53 = [(ChromeViewController *)self mapInsetsLayoutGuide];
  v54 = [v53 leadingAnchor];
  v55 = [(MacChromeViewController *)self view];
  v56 = [v55 safeAreaLayoutGuide];
  v57 = [v56 leadingAnchor];
  v58 = [v54 constraintGreaterThanOrEqualToAnchor:v57 constant:0.0];
  [(MacChromeViewController *)self setMapViewInsetsSideBarWidthConstraint:v58];

  v59 = [(MacChromeViewController *)self viewportSideBarWidthConstraint];
  v82[0] = v59;
  v60 = [(MacChromeViewController *)self mapViewInsetsSideBarWidthConstraint];
  v82[1] = v60;
  v61 = [(ChromeViewController *)self mapInsetsLayoutGuide];
  v62 = [v61 topAnchor];
  v63 = [(MacChromeViewController *)self view];
  v64 = [v63 safeAreaLayoutGuide];
  v65 = [v64 topAnchor];
  v66 = [v62 constraintGreaterThanOrEqualToAnchor:v65 constant:sub_1000BBAF8()];
  v82[2] = v66;
  v67 = +[NSArray arrayWithObjects:v82 count:3];
  +[NSLayoutConstraint activateConstraints:v67];

  v68 = +[NSNotificationCenter defaultCenter];
  [v68 addObserver:self selector:"_locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  v69 = +[NSNotificationCenter defaultCenter];
  v70 = +[MapsSettings settingsUpdatedNotificationKey];
  [v69 addObserver:self selector:"updateMapViewSettings:" name:v70 object:0];

  v71 = +[NSNotificationCenter defaultCenter];
  [v71 addObserver:self selector:"notifyToolbarOfRoutePlanningState:" name:@"RoutePlanningPresentedDidChangeNotification" object:0];

  v72 = [(ChromeViewController *)self mapView];
  [v72 _forceFrame];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v5 viewDidAppear:a3];
  id v4 = [(ChromeViewController *)self mapView];
  [v4 becomeFirstResponder];
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  id v6 = +[MKLocationManager sharedLocationManager];
  if ([v6 isLocationServicesEnabled]) {
    id v4 = [v6 isLocationServicesApproved];
  }
  else {
    id v4 = 0;
  }
  objc_super v5 = [(MacChromeViewController *)self toolbarController];
  [v5 setLocationServicesEnabled:v4];
}

- (id)_separatorColor
{
  v2 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
  v9[0] = v2;
  id v4 = +[UIColor systemGray6Color];
  v9[1] = v3;
  v10[0] = v4;
  objc_super v5 = +[UIColor opaqueSeparatorColor];
  v10[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  v7 = +[UIColor _dynamicColorWithColorsByTraitCollection:v6];

  return v7;
}

- (void)_updateDividerFrame
{
  v3 = [(MacChromeViewController *)self view];
  id v4 = [v3 effectiveUserInterfaceLayoutDirection];

  objc_super v5 = [(MacChromeViewController *)self masterViewController];
  id v6 = [v5 view];
  v7 = v6;
  if (v4 == (id)1)
  {
    v8 = [(MacChromeViewController *)self masterViewController];
    v9 = [v8 view];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(MacChromeViewController *)self view];
    [v7 convertRect:v18 toView:v11];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v34.origin.x = v20;
    v34.origin.y = v22;
    v34.size.width = v24;
    v34.size.height = v26;
    double MinX = CGRectGetMinX(v34);
  }
  else
  {
    [v6 frame];
    double MinX = CGRectGetMaxX(v35);
  }
  v28 = [(MacChromeViewController *)self view];
  [v28 bounds];
  double MaxY = CGRectGetMaxY(v36);

  LODWORD(v28) = [(MacChromeViewController *)self _sidebarVisible];
  v30 = [(MacChromeViewController *)self dividerView];
  id v32 = v30;
  double v31 = 0.0;
  if (v28) {
    double v31 = MinX;
  }
  [v30 setFrame:v31, 0.0, 1.0, MaxY];
}

- (void)_updateSidebarConstraints
{
  v3 = [(MacChromeViewController *)self splitViewController];
  double v4 = 0.0;
  if ([v3 displayMode] != (id)1)
  {
    objc_super v5 = [(MacChromeViewController *)self splitViewController];
    [v5 primaryColumnWidth];
    double v4 = v6;
  }
  v7 = [(MacChromeViewController *)self viewportSideBarWidthConstraint];
  [v7 constant];
  double v9 = v8;

  if (v9 != v4)
  {
    double v10 = [(MacChromeViewController *)self viewportSideBarWidthConstraint];
    [v10 setConstant:v4];

    double v11 = [(MacChromeViewController *)self mapViewInsetsSideBarWidthConstraint];
    [v11 setConstant:v4];

    double v12 = [(MacChromeViewController *)self view];
    [v12 layoutIfNeeded];

    [(ChromeViewController *)self setNeedsUpdateComponent:@"mapInsets" animated:0];
    [(IOSBasedChromeViewController *)self updateComponentsIfNeeded];
  }
}

- (BOOL)supportsDefaultFullscreenViewControllerPresentation
{
  return 0;
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v26 contextStackWillUpdateFrom:v8 to:v9 withAnimation:v10];
  double v11 = [v8 lastObject];
  double v12 = [v9 lastObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (GEOConfigGetBOOL())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 lastObject];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1007A8AF0;
      v22[3] = &unk_1012E5D08;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = v23;
      [v10 addPreparation:v22 animations:0 completion:0];
    }
  }
  else
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1007A8AD0;
    v24[3] = &unk_1012E6300;
    v24[4] = self;
    unsigned __int8 v25 = [v10 isAnimated];
    [v10 addPreparation:v24 animations:0 completion:0];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1007A8B04;
  v18[3] = &unk_1012E66E0;
  id v14 = v11;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  double v21 = self;
  [v10 addPreparation:v18];
  if (GEOConfigGetBOOL())
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1007A8D10;
    v16[3] = &unk_1012E6160;
    v16[4] = self;
    id v17 = v9;
    [v10 addCompletion:v16];
  }
}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v20 contextStackDidUpdateFrom:a3 to:v8 withAnimation:v9];
  id v10 = [v8 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v12 = [v8 lastObject];
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1007A9054;
  v17[3] = &unk_1012F8940;
  v17[4] = self;
  char v18 = isKindOfClass & 1;
  char v19 = v13 & 1;
  [v9 addPreparation:v17];
  if ((isKindOfClass & 1) != 0 && (GEOConfigGetBOOL() & 1) == 0) {
    -[MacChromeViewController hideSideBar:animated:completion:](self, "hideSideBar:animated:completion:", -[MacChromeViewController _shouldHideSidebar](self, "_shouldHideSidebar"), [v9 isAnimated], 0);
  }
  if (v13)
  {
    [v8 lastObject];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007A9178;
    v15[3] = &unk_1012E7D28;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v16;
    [v9 addCompletion:v15];
  }
}

- (void)prepareMapViewForFirstUse
{
  v6.receiver = self;
  v6.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v6 prepareMapViewForFirstUse];
  v3 = +[UIColor systemBlueColor];
  double v4 = [(ChromeViewController *)self mapView];
  [v4 setTintColor:v3];

  objc_super v5 = [(ChromeViewController *)self mapView];
  [v5 _setAutomaticallySnapsToNorth:1];
}

- (id)allComponents
{
  v5.receiver = self;
  v5.super_class = (Class)MacChromeViewController;
  v2 = [(IOSBasedChromeViewController *)&v5 allComponents];
  v3 = [v2 arrayByAddingObject:@"sidebar"];

  return v3;
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v11 updateComponent:v8 forTiming:a4 withAnimation:v9];
  if (v8 == @"sidebar")
  {
    [(MacChromeViewController *)self _updateSidebarWithAnimation:v9];
  }
  else if (@"mapInsets" == v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_1007A938C;
    v10[3] = &unk_1012E5D08;
    v10[4] = self;
    [v9 addAnimations:v10];
  }
}

- (void)pushSidebarViewController:(id)a3
{
  id v8 = a3;
  if (GEOConfigGetBOOL())
  {
    double v4 = [(ChromeViewController *)self nextTopContext];
    objc_super v5 = [(NSMapTable *)self->_sidebarControllersForContext objectForKey:v4];
    objc_super v6 = +[NSMutableArray arrayWithArray:v5];

    id v7 = [v6 lastObject];

    if (v7 != v8)
    {
      [v6 addObject:v8];
      [(MacChromeViewController *)self _setSidebarContentControllers:v6 forContext:v4];
    }
  }
  else
  {
    double v4 = [(MacChromeViewController *)self masterViewController];
    [v4 pushContainee:v8 animated:1 completion:0];
  }
}

- (void)popSidebarViewController
{
  if (GEOConfigGetBOOL())
  {
    sidebarControllersForContext = self->_sidebarControllersForContext;
    double v4 = [(ChromeViewController *)self topContext];
    objc_super v5 = [(NSMapTable *)sidebarControllersForContext objectForKey:v4];
    id v7 = [v5 mutableCopy];

    if ([v7 count])
    {
      [v7 removeLastObject];
      objc_super v6 = [(ChromeViewController *)self topContext];
      [(MacChromeViewController *)self _setSidebarContentControllers:v7 forContext:v6];
    }
  }
  else
  {
    id v7 = [(MacChromeViewController *)self masterViewController];
    [v7 popContainee:1 completion:0];
  }
}

- (void)setSidebarViewControllers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [(MacChromeViewController *)self masterViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007A97D0;
  v6[3] = &unk_1012E6998;
  objc_copyWeak(&v7, &location);
  [v5 setContainees:v4 animated:1 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)topSidebarController_forTests
{
  v2 = [(MacChromeViewController *)self masterViewController];
  v3 = [v2 topContainee_forTests];

  return v3;
}

- (ToolbarController)toolbarController
{
  toolbarController = self->_toolbarController;
  if (!toolbarController)
  {
    id v4 = [ToolbarController alloc];
    objc_super v5 = [(IOSBasedChromeViewController *)self settingsController];
    objc_super v6 = [(ToolbarController *)v4 initWithSettingsController:v5];
    id v7 = self->_toolbarController;
    self->_toolbarController = v6;

    toolbarController = self->_toolbarController;
  }

  return toolbarController;
}

- (void)hideSideBar:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = +[GroupAnimation animationForAnimatedFlag:v5];
  id v11 = v9;
  double v10 = 0.200000003;
  if (!v5) {
    double v10 = 0.0;
  }
  [v9 setDuration:v10];
  [(MacChromeViewController *)self hideSideBar:v6 animation:v11 completion:v8];

  [v11 runWithDefaultOptions];
}

- (void)hideSideBar:(BOOL)a3 animation:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if (v6) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  id v11 = [(MacChromeViewController *)self splitViewController];
  id v12 = [v11 preferredDisplayMode];

  if (v12 == (id)v10)
  {
    if (v9) {
      v9[2](v9, 1);
    }
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1007A9AE8;
    v13[3] = &unk_1012F5910;
    unsigned __int8 v16 = [v8 isAnimated];
    v13[4] = self;
    uint64_t v15 = v10;
    BOOL v17 = v6;
    id v14 = v9;
    [v8 addAnimations:v13];
  }
}

- (void)tapLocateMe:(id)a3
{
  int IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery();
  BOOL v5 = [(ChromeViewController *)self mapView];
  BOOL v6 = v5;
  if (IsEnabled_SearchAndDiscovery) {
    [v5 _setUserTrackingMode:1 animated:1 fromTrackingButton:1];
  }
  else {
    [v5 setUserTrackingMode:1 animated:1];
  }

  [(MacChromeViewController *)self _showLocationServicesAlertIfNeeded];
}

- (void)_showLocationServicesAlertIfNeeded
{
  v2 = +[UIApplication sharedMapsDelegate];
  [v2 promptLocationServicesAuthorizationWithHandler:0];

  v3 = +[MKLocationManager sharedLocationManager];
  id v9 = 0;
  unsigned __int8 v4 = [v3 isLocationServicesPossiblyAvailable:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    BOOL v6 = [v5 domain];
    unsigned int v7 = [v6 isEqualToString:MKLocationErrorDomain];

    if (v7)
    {
      id v8 = +[UIApplication sharedMapsDelegate];
      [v8 showLocationServicesAlertWithError:v5];
    }
  }
}

- (void)updateMapViewDisplayOptions
{
  v3.receiver = self;
  v3.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v3 updateMapViewDisplayOptions];
  [(MacChromeViewController *)self updateMapViewSettings:self];
}

- (void)toggleSidebar:(id)a3
{
  unsigned __int8 v4 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v6 = [(MacChromeViewController *)self _sidebarVisible];
    [(MacChromeViewController *)self hideSideBar:v6 animated:1 completion:0];
    [(MacChromeViewController *)self _updateSidebarHiddenUserDefault:v6];
  }
}

- (void)tapToggleSidebar:(id)a3
{
}

- (void)tapDirectionButton:(id)a3
{
  id v3 = [(IOSBasedChromeViewController *)self appCoordinator];
  [v3 toggleRoutePlanning];
}

- (void)tapShareButton:(id)a3
{
  id v14 = [(MacChromeViewController *)self view];
  [v14 bounds];
  double Width = CGRectGetWidth(v16);
  [v14 bounds];
  double MinY = CGRectGetMinY(v17);
  BOOL v6 = [(MacChromeViewController *)self view];
  id v7 = [v6 effectiveUserInterfaceLayoutDirection];

  if (v7 == (id)1)
  {
    [v14 bounds];
    double MinY = CGRectGetMinY(v18);
    double v8 = 50.0;
  }
  else
  {
    double v8 = Width + -50.0;
  }
  id v9 = [(IOSBasedChromeViewController *)self currentShareItemSource];
  uint64_t v10 = [[MapsActivityViewController alloc] initWithShareItem:v9];
  id v11 = [(MapsActivityViewController *)v10 popoverPresentationController];
  [v11 setSourceView:v14];

  id v12 = [(MapsActivityViewController *)v10 popoverPresentationController];
  [v12 setSourceRect:v8 MinY + 33.0, 1.0, 1.0];

  char v13 = [(MapsActivityViewController *)v10 popoverPresentationController];
  [v13 setPermittedArrowDirections:1];

  [(MacChromeViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)tapUserProfileButton:(id)a3
{
  id v3 = [(IOSBasedChromeViewController *)self appCoordinator];
  [v3 openUserProfile];
}

- (BOOL)_sidebarVisible
{
  v2 = [(MacChromeViewController *)self splitViewController];
  BOOL v3 = [v2 displayMode] == (id)2;

  return v3;
}

- (UIEdgeInsets)mapAttributionInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)labelEdgeInsets
{
  double v3 = 0.0;
  if ([(MacChromeViewController *)self _sidebarVisible])
  {
    unsigned __int8 v4 = [(MacChromeViewController *)self splitViewController];
    [v4 primaryColumnWidth];
    double v3 = v5;
  }
  BOOL v6 = [(MacChromeViewController *)self view];
  id v7 = [v6 effectiveUserInterfaceLayoutDirection];

  double v8 = [(MacChromeViewController *)self view];
  [v8 safeAreaInsets];
  double v10 = v9;

  if (v7 == (id)1) {
    double v11 = 0.0;
  }
  else {
    double v11 = v3;
  }
  if (v7 == (id)1) {
    double v12 = v3;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = 0.0;
  double v14 = v10;
  result.double right = v12;
  result.double bottom = v13;
  result.double left = v11;
  result.double top = v14;
  return result;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[v4 action];
  if (v5 == "toggleSidebar:")
  {
    unsigned int v7 = [(MacChromeViewController *)self _sidebarVisible];
    double v8 = +[NSBundle mainBundle];
    double v9 = v8;
    if (v7) {
      CFStringRef v10 = @"[Menu] Hide Sidebar";
    }
    else {
      CFStringRef v10 = @"[Menu] Show Sidebar";
    }
    goto LABEL_15;
  }
  BOOL v6 = v5;
  if (v5 == "toggleDirections")
  {
    double v9 = [(IOSBasedChromeViewController *)self appCoordinator];
    [v4 _maps_setUseDisableFeatureTitle:[v9 isRoutePlanningPresented]];
LABEL_16:

    goto LABEL_19;
  }
  if (v5 == "toggleMapScale")
  {
    [v4 _maps_setUseDisableFeatureTitle:[MapsSettings alwaysShowScale]];
    goto LABEL_19;
  }
  if (v5 == "deleteStop" && ![(MacChromeViewController *)self canDeleteStop]
    || v6 == "delete:"
    || v6 == "pasteAndMatchStyle:")
  {
    goto LABEL_17;
  }
  if (v6 == "copy:")
  {
    double v8 = +[NSBundle mainBundle];
    double v9 = v8;
    CFStringRef v10 = @"Copy Link";
LABEL_15:
    double v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
    [v4 setTitle:v11];

    goto LABEL_16;
  }
  if (v6 == "redo:")
  {
LABEL_17:
    [v4 setAttributes:4];
    goto LABEL_19;
  }
  v12.receiver = self;
  v12.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v12 validateCommand:v4];
LABEL_19:
}

- (void)toggleDirections
{
}

- (void)toggleMapScale
{
  uint64_t v2 = +[MapsSettings alwaysShowScale] ^ 1;

  +[MapsSettings setAlwaysShowScale:v2];
}

- (BOOL)canDeleteStop
{
  double v3 = [(IOSBasedChromeViewController *)self appCoordinator];
  if ([v3 isRoutePlanningPresented])
  {
    id v4 = [(MacChromeViewController *)self _currentRouteSearchViewController];
    unsigned __int8 v5 = [v4 canDeleteCurrentFieldIndex];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)deleteStop
{
  id v2 = [(MacChromeViewController *)self _currentRouteSearchViewController];
  [v2 deleteCurrentFieldIndex];
}

- (id)_currentRouteSearchViewController
{
  id v2 = [(IOSBasedChromeViewController *)self appCoordinator];
  double v3 = [v2 baseActionCoordinator];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 containerViewController];

  unsigned int v7 = [v6 currentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  CFStringRef v10 = [v9 routeSearchViewController];

  return v10;
}

- (void)find:(id)a3
{
  id v4 = [(ChromeViewController *)self topContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1007AA6AC;
    v6[3] = &unk_1012E7D28;
    void v6[4] = self;
    [(MacChromeViewController *)self hideSideBar:0 animated:1 completion:v6];
    [(MacChromeViewController *)self _updateSidebarHiddenUserDefault:0];
  }
}

- (id)mapItemFromWaypoint:(id)a3
{
  id v3 = a3;
  id v4 = [v3 geoMapItem];
  if (v4)
  {
    id v5 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v4 isPlaceHolderPlace:0];
  }
  else
  {
    BOOL v6 = [v3 location];
    [v6 coordinate];
    double v8 = v7;
    double v10 = v9;

    id v11 = [objc_alloc((Class)CLLocation) initWithLatitude:v8 longitude:v10];
    id v5 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v11];
  }

  return v5;
}

- (id)urlForRoute:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MKURLSerializer);
  if ([v4 transportType] == 1)
  {
    BOOL v6 = [v4 routeAttributes];
    unsigned int v7 = [v6 hasTimepoint];

    if (v7)
    {
      double v8 = [v4 routeAttributes];
      double v9 = v8;
      if (v8) {
        [v8 timepoint];
      }
      else {
        uint64_t v18 = 0;
      }
    }
  }
  double v10 = [v4 origin];
  id v11 = [(MacChromeViewController *)self mapItemFromWaypoint:v10];

  objc_super v12 = [v4 destination];
  double v13 = [(MacChromeViewController *)self mapItemFromWaypoint:v12];

  double v14 = 0;
  if (v11 && v13)
  {
    unsigned int v15 = [v4 transportType];
    if (v15 > 5) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = qword_100F720C8[v15];
    }
    double v14 = [v5 urlForDirectionsFromMapItem:v11 toMapItem:v13 transportType:v16 options:0];
  }

  return v14;
}

- (void)presentAddNewCollection
{
  id v3 = +[CollectionHandler collection];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"[Collections] New Guide" value:@"localized string not found" table:0];

  [v3 updateTitle:v5];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007AAB68;
  v7[3] = &unk_1012EB690;
  objc_copyWeak(&v9, &location);
  id v6 = v3;
  id v8 = v6;
  [v6 createCollection:v7];
  +[GEOAPPortal captureUserAction:2072 target:0 value:0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)presentAddToCollection:(id)a3
{
  id v4 = [a3 propertyList];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = +[CollectionManager sharedManager];
  id v6 = [v5 currentCollections];

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      objc_super v12 = [v11 identifier];
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v14 = v11;

    if (!v14) {
      goto LABEL_13;
    }
    unsigned int v15 = [(CollectionEditSession *)[CollectionSaveSession alloc] initWithCollection:v14];
    uint64_t v16 = [(IOSBasedChromeViewController *)self appCoordinator];
    CGRect v17 = [v16 baseActionCoordinator];
    [v17 viewController:self addItemsFromACToCollection:v15];

    id v6 = v14;
  }
LABEL_12:

LABEL_13:
}

- (void)presentAddToFavorites
{
  id v5 = [(IOSBasedChromeViewController *)self appCoordinator];
  id v3 = [v5 baseActionCoordinator];
  id v4 = +[ShortcutEditSession addSession];
  [v3 viewController:self showAddShortcut:v4];
}

- (void)requestNewTab:(id)a3
{
}

- (void)requestNewWindow:(id)a3
{
}

- (void)newSceneInTab:(BOOL)a3
{
  id v16 = [(MacChromeViewController *)self _maps_mapsSceneDelegate];
  id v4 = [v16 entryPointsCoordinator];
  id v5 = [v4 launchAlertsManager];
  if ([v5 currentlyShowingAlert])
  {
  }
  else
  {
    unsigned __int8 v6 = +[MapsWelcomeScreenViewController mapsWelcomeCurrentlyBeingPresented];

    if ((v6 & 1) == 0)
    {
      id v7 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.NewWindow"];
      [v7 setEligibleForHandoff:0];
      id v8 = [(MacChromeViewController *)self _maps_mapsSceneDelegate];
      uint64_t v9 = [v8 mapsActivityWithFidelity:2];

      uint64_t v10 = [v9 data];
      id v11 = [v10 bzip2CompressedData];

      if (v11)
      {
        CFStringRef v17 = @"bs";
        long long v18 = v11;
        objc_super v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        [v7 setUserInfo:v12];
      }
      id v13 = objc_alloc_init((Class)UISceneActivationRequestOptions);
      id v14 = [(MacChromeViewController *)self _maps_uiScene];
      [v13 setRequestingScene:v14];

      unsigned int v15 = +[UIApplication sharedApplication];
      [v15 requestSceneSessionActivation:0 userActivity:v7 options:v13 errorHandler:0];
    }
  }
}

- (void)select3dMode
{
  v2.receiver = self;
  v2.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v2 select3dMode];
}

- (void)orderFrontStandardAboutPanel:(id)a3
{
  uint64_t v3 = [(MacChromeViewController *)self _mapAndWeatherAttribution];
  id v4 = (void *)v3;
  if (v3)
  {
    CFStringRef v7 = @"Credits";
    uint64_t v8 = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }
  unsigned __int8 v6 = +[UIApplication sharedMapsDelegate];
  objc_msgSend(objc_msgSend(v6, "appKitBundleClass"), "orderFrontStandardAboutPanelWithOptions:", v5);
}

- (id)_mapAndWeatherAttribution
{
  id v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v3 setAlignment:1];
  v11[0] = NSForegroundColorAttributeName;
  id v4 = +[UIColor labelColor];
  v12[0] = v4;
  v11[1] = NSFontAttributeName;
  id v5 = +[UIFont systemFontOfSize:10.0];
  v11[2] = NSParagraphStyleAttributeName;
  v12[1] = v5;
  v12[2] = v3;
  unsigned __int8 v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  CFStringRef v7 = [(ChromeViewController *)self mapView];
  uint64_t v8 = [v7 mapAttributionWithStringAttributes:v6 underlineText:1 linkAttribution:1];

  uint64_t v9 = [v8 string];

  return v9;
}

- (id)currentCollectionShareItemSource
{
  v9.receiver = self;
  v9.super_class = (Class)MacChromeViewController;
  id v3 = [(IOSBasedChromeViewController *)&v9 currentCollectionShareItemSource];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unsigned __int8 v6 = [(MacChromeViewController *)self _macBaseActionCoordinator];
    CFStringRef v7 = [v6 injectedCollection];
    if (v7) {
      id v5 = [[PersonalCollectionShareItemSource alloc] initWithCollectionHandlerInfo:v7];
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)notifyToolbarOfRoutePlanningState:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(IOSBasedChromeViewController *)self appCoordinator];
  unsigned __int8 v6 = [v5 baseActionCoordinator];

  if (v4 == v6)
  {
    id v10 = [(IOSBasedChromeViewController *)self appCoordinator];
    CFStringRef v7 = [v10 baseActionCoordinator];
    id v8 = [v7 isRoutePlanningPresented];
    objc_super v9 = [(MacChromeViewController *)self toolbarController];
    [v9 setRoutePlanningButtonActive:v8];
  }
}

- (BOOL)_sharingEnabled
{
  id v3 = [(IOSBasedChromeViewController *)self appCoordinator];
  id v4 = [v3 platformController];

  id v5 = [v4 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v6 = [v5 currentRouteCollection];
    CFStringRef v7 = [v6 currentRoute];
    if ([v7 isMultipointRoute])
    {
      id v8 = [(IOSBasedChromeViewController *)self currentShareItemSource];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_updateShareButton
{
  BOOL v3 = [(MacChromeViewController *)self _sharingEnabled];
  id v4 = [(MacChromeViewController *)self toolbarController];
  [v4 setShareButtonEnabled:v3];
}

- (id)_macBaseActionCoordinator
{
  objc_super v2 = [(IOSBasedChromeViewController *)self appCoordinator];
  BOOL v3 = [v2 baseActionCoordinator];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)mapViewWillStartRenderingMap:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MacChromeViewController;
  [(MacChromeViewController *)&v4 mapViewWillStartRenderingMap:a3];
  self->_mapLoadedWithoutError = 1;
}

- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v21 mapViewDidFailLoadingMap:a3 withError:v6];
  self->_mapLoadedWithoutError = 0;
  CFStringRef v7 = [(MacChromeViewController *)self checkForInternetError:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;

    id v6 = v9;
  }
  id v10 = [v6 domain];
  id v11 = [v6 code];
  if ([v10 isEqualToString:NSURLErrorDomain])
  {
    objc_super v12 = +[NSBundle mainBundle];
    id v13 = v12;
    if (v11 == (id)-1009) {
      CFStringRef v14 = @"No Internet Connection";
    }
    else {
      CFStringRef v14 = @"Connection Issue.";
    }
  }
  else
  {
    unsigned int v15 = GEOErrorDomain();
    unsigned int v16 = [v10 isEqualToString:v15];

    CFStringRef v17 = 0;
    if (!v16 || v11 != (id)-9) {
      goto LABEL_13;
    }
    objc_super v12 = +[NSBundle mainBundle];
    id v13 = v12;
    CFStringRef v14 = @"No Internet Connection";
  }
  CFStringRef v17 = [v12 localizedStringForKey:v14 value:@"localized string not found" table:0];

  if (v17)
  {
    long long v18 = [(IOSBasedChromeViewController *)self errorString];
    unsigned __int8 v19 = [v18 isEqualToString:v17];

    if ((v19 & 1) == 0)
    {
      [(IOSBasedChromeViewController *)self setErrorString:v17];
      long long v20 = [(MacChromeViewController *)self _maps_mapsSceneDelegate];
      [v20 refreshTitle];
    }
  }
LABEL_13:
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacChromeViewController;
  [(MacChromeViewController *)&v7 mapViewDidFinishRenderingMap:a3 fullyRendered:a4];
  if (self->_mapLoadedWithoutError)
  {
    id v5 = [(IOSBasedChromeViewController *)self errorString];

    if (v5)
    {
      [(IOSBasedChromeViewController *)self setErrorString:0];
      id v6 = [(MacChromeViewController *)self _maps_mapsSceneDelegate];
      [v6 refreshTitle];
    }
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MacChromeViewController;
  [(MacChromeViewController *)&v8 mapView:a3 didChangeUserTrackingMode:a4 animated:a5];
  objc_super v7 = [(MacChromeViewController *)self toolbarController];
  [v7 setLocationButtonActive:a4 == 1];
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacChromeViewController;
  -[IOSBasedChromeViewController mapView:didChangeLookAroundAvailability:](&v7, "mapView:didChangeLookAroundAvailability:", a3);
  id v6 = [(MacChromeViewController *)self toolbarController];
  [v6 setLookAroundEnabled:a4 == 2];
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v7 mapView:a3 canEnter3DModeDidChange:a4];
  BOOL v5 = [(IOSBasedChromeViewController *)self canEnter3dMode];
  id v6 = [(MacChromeViewController *)self toolbarController];
  [v6 setThirdDimensionButtonEnabled:v5];
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  id v4 = a3;
  [(MacChromeViewController *)self setCurrentInteractionDidDeselect:0];
  BOOL v5 = [(ChromeViewController *)self topContext];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(ChromeViewController *)self topContext];
    [v7 mapViewDidStartUserInteraction:v4];
  }
  v8.receiver = self;
  v8.super_class = (Class)MacChromeViewController;
  [(MacChromeViewController *)&v8 mapViewDidStartUserInteraction:v4];
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MacChromeViewController *)self setCurrentInteractionDidDeselect:1];
  v8.receiver = self;
  v8.super_class = (Class)MacChromeViewController;
  [(IOSBasedChromeViewController *)&v8 mapView:v7 didDeselectLabelMarker:v6];
}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v4 = a3;
  if ([(MacChromeViewController *)self isCurrentInteractionDidDeselect])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(ChromeViewController *)self mapView];
    id v7 = [v6 _mapLayer];
    objc_super v8 = [v7 selectedLabelMarker];

    if (!v8)
    {
      id v9 = [(ChromeViewController *)self mapView];
      id v10 = [v9 _mapLayer];
      [v10 clearPreviouslySelectedLabelMarker];
    }
    v13.receiver = self;
    v13.super_class = (Class)MacChromeViewController;
    BOOL v5 = [(IOSBasedChromeViewController *)&v13 mapViewShouldHandleTapToDeselect:v4];
    if (v5)
    {
      id v11 = [(MacChromeViewController *)self _macBaseActionCoordinator];
      [v11 handleMapViewTapToDeselect];
    }
    [(MacChromeViewController *)self setCurrentInteractionDidDeselect:1];
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = [(ChromeViewController *)self mapView];
  id v4 = [(MacChromeViewController *)self masterViewController];
  v8[1] = v4;
  BOOL v5 = [(MacChromeViewController *)self detailViewController];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (id)checkForInternetError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 domain];
  if ([v5 isEqualToString:NSURLErrorDomain])
  {
    id v6 = [v4 code];

    if (v6 == (id)-1009)
    {
      id v7 = v4;
      goto LABEL_26;
    }
  }
  else
  {
  }
  objc_super v8 = [v4 userInfo];
  id v9 = [v8 objectForKey:@"UnderlyingErrors"];
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = [v4 userInfo];
    objc_super v12 = [v11 objectForKey:@"UnderlyingErrors"];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
LABEL_8:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [(MacChromeViewController *)self checkForInternetError:*(void *)(*((void *)&v32 + 1) + 8 * v17)];
        if (v18) {
          goto LABEL_25;
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v15) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
  unsigned __int8 v19 = [v4 userInfo];
  long long v20 = [v19 objectForKey:@"SimpleTileRequesterUnderlyingErrors"];
  id v7 = [v20 count];

  if (!v7) {
    goto LABEL_26;
  }
  objc_super v21 = [v4 userInfo];
  CGFloat v22 = [v21 objectForKey:@"SimpleTileRequesterUnderlyingErrors"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v22;
  id v23 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (!v23)
  {
LABEL_24:

    id v7 = 0;
    goto LABEL_26;
  }
  id v24 = v23;
  uint64_t v25 = *(void *)v29;
LABEL_18:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v29 != v25) {
      objc_enumerationMutation(v13);
    }
    uint64_t v18 = -[MacChromeViewController checkForInternetError:](self, "checkForInternetError:", *(void *)(*((void *)&v28 + 1) + 8 * v26), (void)v28);
    if (v18) {
      break;
    }
    if (v24 == (id)++v26)
    {
      id v24 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v24) {
        goto LABEL_18;
      }
      goto LABEL_24;
    }
  }
LABEL_25:
  id v7 = (id)v18;

LABEL_26:

  return v7;
}

- (BOOL)_shouldHideSidebar
{
  if (GEOConfigGetBOOL())
  {
    BOOL v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"MapsDefaultHideSidebar"];
  }
  else
  {
    BOOL v3 = [(ChromeViewController *)self topContext];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      BOOL v5 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v4 = [v5 BOOLForKey:@"MapsDefaultHideSidebar"];
    }
  }

  return v4;
}

- (void)_updateSidebarHiddenUserDefault:(BOOL)a3
{
  BOOL v3 = a3;
  if (GEOConfigGetBOOL())
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setBool:v3 forKey:@"MapsDefaultHideSidebar"];
  }
  else
  {
    id v6 = [(ChromeViewController *)self topContext];
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v5 = +[NSUserDefaults standardUserDefaults];
      [v5 setBool:v3 forKey:@"MapsDefaultHideSidebar"];
    }
  }
}

- (void)_updateSidebarWithAnimation:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    objc_initWeak(&location, v4);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1007AC2D4;
    v5[3] = &unk_1012E7ED0;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    [v4 addPreparation:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_setSidebarContentControllers:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (GEOConfigGetBOOL())
  {
    if (!self->_sidebarControllersForContext)
    {
      objc_super v8 = +[NSMapTable weakToStrongObjectsMapTable];
      sidebarControllersForContext = self->_sidebarControllersForContext;
      self->_sidebarControllersForContext = v8;
    }
    id v10 = [v6 count];
    id v11 = self->_sidebarControllersForContext;
    if (v10)
    {
      id v12 = [v6 copy];
      [(NSMapTable *)v11 setObject:v12 forKey:v7];
    }
    else
    {
      [(NSMapTable *)v11 setObject:0 forKey:v7];
    }
    [(ChromeViewController *)self setNeedsUpdateComponent:@"sidebar" animated:1];
  }
  else
  {
    id v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = +[NSString stringWithFormat:@"Attempting to store sidebar controllers for context but sidebar isn't a chrome component"];
      int v17 = 136315906;
      uint64_t v18 = "-[MacChromeViewController _setSidebarContentControllers:forContext:]";
      __int16 v19 = 2080;
      long long v20 = "MacChromeViewController.m";
      __int16 v21 = 1024;
      int v22 = 1165;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v17, 0x26u);
    }
    if (sub_100BB36BC())
    {
      id v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = +[NSThread callStackSymbols];
        int v17 = 138412290;
        uint64_t v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (void)_maps_splitViewControllerDidChangePrimaryColumnWidth:(id)a3
{
  [(MacChromeViewController *)self _updateDividerFrame];

  [(MacChromeViewController *)self _updateSidebarConstraints];
}

- (BOOL)isEligibleForMapViewFrameRateLimiting
{
  return 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 removeObserver:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 addObserver:self];
  }
  [(MacChromeViewController *)self _updateShareButton];
}

- (UISplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
}

- (UIViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
}

- (PassThroughViewController)fallbackDetailViewController
{
  return self->_fallbackDetailViewController;
}

- (void)setFallbackDetailViewController:(id)a3
{
}

- (SupplementalStackViewController)masterViewController
{
  return self->_masterViewController;
}

- (void)setMasterViewController:(id)a3
{
}

- (NSLayoutConstraint)viewportSideBarWidthConstraint
{
  return self->_viewportSideBarWidthConstraint;
}

- (void)setViewportSideBarWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)mapViewInsetsSideBarWidthConstraint
{
  return self->_mapViewInsetsSideBarWidthConstraint;
}

- (void)setMapViewInsetsSideBarWidthConstraint:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (void)setToolbarController:(id)a3
{
}

- (BOOL)mapLoadedWithoutError
{
  return self->_mapLoadedWithoutError;
}

- (void)setMapLoadedWithoutError:(BOOL)a3
{
  self->_mapLoadedWithoutError = a3;
}

- (BOOL)isCurrentInteractionDidDeselect
{
  return self->_currentInteractionDidDeselect;
}

- (void)setCurrentInteractionDidDeselect:(BOOL)a3
{
  self->_currentInteractionDidDeselect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_mapViewInsetsSideBarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewportSideBarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_masterViewController, 0);
  objc_storeStrong((id *)&self->_fallbackDetailViewController, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_sidebarControllersForContext, 0);

  objc_storeStrong((id *)&self->_popoverSettingsViewController, 0);
}

@end