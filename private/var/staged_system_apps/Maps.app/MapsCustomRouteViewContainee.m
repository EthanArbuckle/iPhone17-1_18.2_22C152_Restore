@interface MapsCustomRouteViewContainee
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)shouldCollapseOnMapGesture;
- (GEOComposedRoute)route;
- (MapsCustomRouteViewContainee)initWithContext:(id)a3;
- (double)headerHeight;
- (double)heightForLayout:(unint64_t)a3;
- (void)_insertAppropriateCardStateForRoute:(id)a3;
- (void)_insertRouteCardIfNeeded;
- (void)_updateRouteCardWithRoute:(id)a3;
- (void)didUpdateLayout;
- (void)handleButtonTap:(unint64_t)a3;
- (void)headerViewTapped:(id)a3;
- (void)pressedNavigation;
- (void)pressedOfflineDataManagement;
- (void)pressedOfflineDownload;
- (void)pressedRoutePlanning;
- (void)pressedSaveToLibrary;
- (void)pressedStepping;
- (void)trailingButtonTapped:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MapsCustomRouteViewContainee

- (MapsCustomRouteViewContainee)initWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapsCustomRouteViewContainee;
  v5 = [(MapsCustomRouteViewContainee *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    uint64_t v7 = [v4 composedRoute];
    route = v6->_route;
    v6->_route = (GEOComposedRoute *)v7;

    v6->_previousWidth = 1.79769313e308;
    v9 = [(ContaineeViewController *)v6 cardPresentationController];
    [v9 setAllowResizeInFloatingStyle:1];

    v10 = [(ContaineeViewController *)v6 cardPresentationController];
    [v10 setDefaultContaineeLayout:2];
  }
  return v6;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)MapsCustomRouteViewContainee;
  [(ContaineeViewController *)&v33 viewDidLoad];
  v3 = [(ContaineeViewController *)self headerView];
  id v4 = +[NSMutableArray array];
  if (+[MapsTapToRadarExtras shouldEnableTTRButton]
    && GEOConfigGetBOOL())
  {
    v5 = +[CardButtonConfiguration close];
    [v5 setInsets:*(double *)&qword_1015F3528, 0.0, *(double *)&qword_1015F3530, *(double *)&qword_1015F3528];
    v6 = [[CardButton alloc] initWithConfiguration:v5];
    [v4 addObject:v6];

    uint64_t v7 = +[CardButtonConfiguration ttr];
    -[CardButton setInsets:](v7, "setInsets:", *(double *)&qword_1015F3528, *(double *)&qword_1015F3528, *(double *)&qword_1015F3530, *(double *)&qword_1015F3528);
    v8 = [[CardButton alloc] initWithConfiguration:v7];
    [v4 addObject:v8];
  }
  else
  {
    v5 = +[CardButtonConfiguration close];
    [v5 setInsets:*(double *)&qword_1015F3528, *(double *)&qword_1015F3528, *(double *)&qword_1015F3530, *(double *)&qword_1015F3528];
    uint64_t v7 = [[CardButton alloc] initWithConfiguration:v5];
    [v4 addObject:v7];
  }

  v9 = [MapsSubtitleHeaderView alloc];
  v10 = [(GEOComposedRoute *)self->_route userProvidedName];
  v32 = v4;
  if (v10)
  {
    v11 = [(MapsSubtitleHeaderView *)v9 initWithTitle:v10 subtitle:0 leadingButton:0 trailingButtons:v4 delegate:self];
  }
  else
  {
    objc_super v12 = [(GEOComposedRoute *)self->_route name];
    v11 = [(MapsSubtitleHeaderView *)v9 initWithTitle:v12 subtitle:0 leadingButton:0 trailingButtons:v4 delegate:self];
  }
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v11;
  v31 = v11;

  [(MapsSubtitleHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v14) = 1148846080;
  [(MapsSubtitleHeaderView *)self->_containerHeaderView setContentCompressionResistancePriority:1 forAxis:v14];
  [v3 addSubview:self->_containerHeaderView];
  v15 = (MapsCustomRouteCardView *)objc_opt_new();
  cardView = self->_cardView;
  self->_cardView = v15;

  [(MapsCustomRouteCardView *)self->_cardView setDelegate:self];
  [(MapsCustomRouteCardView *)self->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsCustomRouteViewContainee *)self _updateRouteCardWithRoute:self->_route];
  v30 = [(MapsSubtitleHeaderView *)self->_containerHeaderView leadingAnchor];
  v29 = [v3 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v34[0] = v28;
  v27 = [(MapsSubtitleHeaderView *)self->_containerHeaderView topAnchor];
  v17 = [v3 topAnchor];
  v18 = [v27 constraintEqualToAnchor:v17];
  v34[1] = v18;
  v19 = [(MapsSubtitleHeaderView *)self->_containerHeaderView trailingAnchor];
  v20 = [v3 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v34[2] = v21;
  v22 = [(MapsSubtitleHeaderView *)self->_containerHeaderView bottomAnchor];
  v23 = [v3 bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v34[3] = v24;
  +[NSArray arrayWithObjects:v34 count:4];
  v25 = v26 = v3;
  +[NSLayoutConstraint activateConstraints:v25];

  [(MapsCustomRouteViewContainee *)self _insertRouteCardIfNeeded];
  [(MapsCustomRouteViewContainee *)self _insertAppropriateCardStateForRoute:self->_route];
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MapsCustomRouteViewContainee;
  [(ContaineeViewController *)&v11 viewDidLayoutSubviews];
  v3 = [(ContaineeViewController *)self contentView];
  [v3 frame];
  double v5 = v4;

  double previousWidth = self->_previousWidth;
  double v7 = fabs(previousWidth + -1.79769313e308);
  double v8 = vabdd_f64(previousWidth, v5);
  if (v7 <= 2.22044605e-16 || v8 > 2.22044605e-16)
  {
    self->_double previousWidth = v5;
    v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 updateHeightForCurrentLayout];
  }
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (double)headerHeight
{
  [(MapsSubtitleHeaderView *)self->_containerHeaderView layoutIfNeeded];
  containerHeaderView = self->_containerHeaderView;
  [(MapsSubtitleHeaderView *)containerHeaderView frame];
  double v5 = v4;
  LODWORD(v4) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[MapsSubtitleHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](containerHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, UILayoutFittingCompressedSize.height, v4, v6);
  return v7;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 2 >= 2)
  {
    double v14 = -1.0;
    if (a3 == 1)
    {
      [(MapsCustomRouteViewContainee *)self headerHeight];
      double v16 = v15;
      v17 = [(ContaineeViewController *)self cardPresentationController];
      [v17 bottomSafeOffset];
      double v14 = v16 + v18;
    }
  }
  else
  {
    [(MapsCustomRouteCardView *)self->_cardView layoutIfNeeded];
    cardView = self->_cardView;
    [(MapsCustomRouteCardView *)cardView frame];
    double v6 = v5;
    LODWORD(v5) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[MapsCustomRouteCardView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](cardView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, UILayoutFittingCompressedSize.height, v5, v7);
    double v9 = v8;
    v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 bottomSafeOffset];
    double v12 = v11;

    [(MapsCustomRouteViewContainee *)self headerHeight];
    return v12 + v9 + v13;
  }
  return v14;
}

- (BOOL)shouldCollapseOnMapGesture
{
  return 0;
}

- (void)headerViewTapped:(id)a3
{
  double v4 = [(ContaineeViewController *)self cardPresentationController];
  if ([v4 containeeLayout] == (id)2)
  {

LABEL_4:
    double v7 = [(ContaineeViewController *)self cardPresentationController];
    id v9 = v7;
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  double v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (v6 == (id)3) {
    goto LABEL_4;
  }
  double v7 = [(ContaineeViewController *)self cardPresentationController];
  id v9 = v7;
  uint64_t v8 = 2;
LABEL_6:
  [v7 wantsLayout:v8];
}

- (void)trailingButtonTapped:(id)a3
{
  id v4 = [a3 type];

  [(MapsCustomRouteViewContainee *)self handleButtonTap:v4];
}

- (void)handleButtonTap:(unint64_t)a3
{
  if (a3 == 8)
  {
    double v5 = sub_10057683C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "pressed TTR", (uint8_t *)&v9, 2u);
    }

    id v6 = +[MapsRadarController sharedInstance];
    [v6 launchTTR];
    goto LABEL_9;
  }
  if (!a3)
  {
    id v4 = sub_10057683C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed close", (uint8_t *)&v9, 2u);
    }

    [(ContaineeViewController *)self handleDismissAction:0];
    return;
  }
  double v7 = sub_1005762E4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    v10 = "-[MapsCustomRouteViewContainee handleButtonTap:]";
    __int16 v11 = 2080;
    double v12 = "MapsCustomRouteViewContainee.m";
    __int16 v13 = 1024;
    int v14 = 221;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = +[NSThread callStackSymbols];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
    }
LABEL_9:
  }
}

- (void)pressedStepping
{
  [(MapsCustomRouteCardView *)self->_cardView setButtonEnabled:0];
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C31318;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [WeakRetained pushSuggestedNavigationMode:2 withCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pressedNavigation
{
  [(MapsCustomRouteCardView *)self->_cardView setButtonEnabled:0];
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C31510;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [WeakRetained pushSuggestedNavigationMode:1 withCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pressedRoutePlanning
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained pushSuggestedNavigationMode:4 withCompletionHandler:0];
}

- (void)pressedSaveToLibrary
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C31740;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  [WeakRetained pushSaveContaineeWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pressedOfflineDownload
{
  v3 = [(MapsCustomRouteViewContainee *)self _maps_mapsSceneDelegate];
  id v4 = [v3 appCoordinator];
  id v5 = [v4 baseActionCoordinator];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v18 = [WeakRetained composedRoute];

  int v9 = [v18 userProvidedName];
  if ([v9 length]) {
    [v18 userProvidedName];
  }
  else {
  v10 = [v18 name];
  }

  id v11 = objc_loadWeakRetained((id *)&self->_context);
  double v12 = [v11 composedRoute];
  __int16 v13 = [v12 boundingMapRegion];
  int v14 = +[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:v13];
  id v15 = objc_loadWeakRetained((id *)&self->_context);
  double v16 = [v15 composedRoute];
  LOBYTE(v17) = 1;
  [v7 viewController:self showOfflineMapRegionSelectorForRegion:v14 name:v10 route:v16 shouldUseSessionlessAnalytics:0 shouldShowDataManagementAfterDownload:0 shouldShowDataManagementAfterDownloadIfRegionDiffers:v17 dismissalBlock:0];
}

- (void)pressedOfflineDataManagement
{
  v3 = [(MapsCustomRouteViewContainee *)self _maps_mapsSceneDelegate];
  id v4 = [v3 appCoordinator];
  id v5 = [v4 baseActionCoordinator];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 viewControllerShowOfflineMaps:self];
}

- (void)didUpdateLayout
{
  id v2 = [(ContaineeViewController *)self cardPresentationController];
  [v2 updateHeightForCurrentLayout];
}

- (void)_insertAppropriateCardStateForRoute:(id)a3
{
  id v4 = a3;
  [(MapsCustomRouteViewContainee *)self loadViewIfNeeded];
  [(MapsCustomRouteViewContainee *)self _insertRouteCardIfNeeded];
  [(MapsCustomRouteViewContainee *)self _updateRouteCardWithRoute:v4];
}

- (void)_insertRouteCardIfNeeded
{
  v3 = self->_cardView;
  [(MapsCustomRouteCardView *)v3 setAlpha:1.0];
  id v4 = [(MapsCustomRouteCardView *)v3 superview];

  if (!v4)
  {
    id v5 = [(ContaineeViewController *)self contentView];
    [v5 addSubview:v3];

    uint64_t v17 = [(MapsCustomRouteCardView *)v3 leadingAnchor];
    id v18 = [(ContaineeViewController *)self contentView];
    double v16 = [v18 leadingAnchor];
    id v15 = [v17 constraintEqualToAnchor:v16];
    v19[0] = v15;
    id v6 = [(MapsCustomRouteCardView *)v3 trailingAnchor];
    id v7 = [(ContaineeViewController *)self contentView];
    uint64_t v8 = [v7 trailingAnchor];
    int v9 = [v6 constraintEqualToAnchor:v8];
    v19[1] = v9;
    v10 = [(MapsCustomRouteCardView *)v3 topAnchor];
    id v11 = [(ContaineeViewController *)self headerView];
    double v12 = [v11 bottomAnchor];
    __int16 v13 = [v10 constraintEqualToAnchor:v12];
    v19[2] = v13;
    int v14 = +[NSArray arrayWithObjects:v19 count:3];
    +[NSLayoutConstraint activateConstraints:v14];
  }
}

- (void)_updateRouteCardWithRoute:(id)a3
{
  [(MapsCustomRouteCardView *)self->_cardView setRoute:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 updateHeightForCurrentLayout];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);

  objc_destroyWeak((id *)&self->_context);
}

@end