@interface MapsRouteCreationContainee
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)_isValidRoute;
- (BOOL)shouldCollapseOnMapGesture;
- (GEOComposedRoute)route;
- (MapsRouteCreationContainee)initWithContext:(id)a3;
- (double)headerHeight;
- (double)heightForLayout:(unint64_t)a3;
- (void)_insertAppropriateCardStateForRoute:(id)a3;
- (void)_insertEmptyStateIfNeeded;
- (void)_insertRouteCardIfNeeded;
- (void)_showExitConfirmationAlert;
- (void)_updateDoneButton;
- (void)_updateEmptyStateContent;
- (void)_updateRouteCardWithRoute:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)setRoute:(id)a3;
- (void)trailingButtonTapped:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MapsRouteCreationContainee

- (MapsRouteCreationContainee)initWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsRouteCreationContainee;
  v5 = [(MapsRouteCreationContainee *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v6->_previousWidth = 1.79769313e308;
    v7 = [(ContaineeViewController *)v6 cardPresentationController];
    [v7 setAllowResizeInFloatingStyle:1];

    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setDefaultContaineeLayout:2];
  }
  return v6;
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)MapsRouteCreationContainee;
  [(ContaineeViewController *)&v42 viewDidLoad];
  v3 = [(MapsRouteCreationContainee *)self view];
  [v3 setAccessibilityIdentifier:@"CreateARouteView"];

  id v4 = +[NSMutableArray array];
  if (+[MapsTapToRadarExtras shouldEnableTTRButton]
    && GEOConfigGetBOOL())
  {
    v5 = +[CardButtonConfiguration close];
    [v5 setInsets:*(double *)&qword_1015F3528, 0.0, *(double *)&qword_1015F3530, *(double *)&qword_1015F3528];
    v6 = [[CardButton alloc] initWithConfiguration:v5];
    [v4 addObject:v6];

    v7 = +[CardButtonConfiguration ttr];
    -[CardButton setInsets:](v7, "setInsets:", *(double *)&qword_1015F3528, *(double *)&qword_1015F3528, *(double *)&qword_1015F3530, *(double *)&qword_1015F3528);
    v8 = [[CardButton alloc] initWithConfiguration:v7];
    [v4 addObject:v8];
  }
  else
  {
    v5 = +[CardButtonConfiguration close];
    [v5 setInsets:*(double *)&qword_1015F3528, *(double *)&qword_1015F3528, *(double *)&qword_1015F3530, *(double *)&qword_1015F3528];
    v7 = [[CardButton alloc] initWithConfiguration:v5];
    [v4 addObject:v7];
  }

  v9 = [(ContaineeViewController *)self headerView];
  objc_super v10 = +[NSBundle mainBundle];
  v41 = [v10 localizedStringForKey:@"[Route Creation] Create Route" value:@"localized string not found" table:0];

  v40 = [[MapsSubtitleHeaderView alloc] initWithTitle:v41 subtitle:0 leadingButton:0 trailingButtons:v4 delegate:self];
  [(MapsSubtitleHeaderView *)v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v11) = 1148846080;
  [(MapsSubtitleHeaderView *)v40 setContentCompressionResistancePriority:1 forAxis:v11];
  [v9 addSubview:v40];
  objc_storeStrong((id *)&self->_modalHeaderView, v40);
  v12 = (MapsLoopingVideoPlayerView *)objc_opt_new();
  playerView = self->_playerView;
  self->_playerView = v12;

  [(MapsLoopingVideoPlayerView *)self->_playerView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v14) = 1148846080;
  [(MapsLoopingVideoPlayerView *)self->_playerView setContentCompressionResistancePriority:1 forAxis:v14];
  v15 = (RouteCreationCardView *)objc_opt_new();
  cardView = self->_cardView;
  self->_cardView = v15;

  [(RouteCreationCardView *)self->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [(RouteCreationCardView *)self->_cardView setEditingDelegate:WeakRetained];

  id v18 = objc_loadWeakRetained((id *)&self->_context);
  v19 = [v18 composedRoute];
  [(MapsRouteCreationContainee *)self _updateRouteCardWithRoute:v19];

  v37 = [(MapsSubtitleHeaderView *)self->_modalHeaderView leadingAnchor];
  v36 = [v9 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v44[0] = v35;
  v34 = [(MapsSubtitleHeaderView *)self->_modalHeaderView topAnchor];
  v20 = v9;
  v21 = [v9 topAnchor];
  v22 = [v34 constraintEqualToAnchor:v21];
  v44[1] = v22;
  v23 = [(MapsSubtitleHeaderView *)self->_modalHeaderView trailingAnchor];
  v38 = v20;
  v24 = [v20 trailingAnchor];
  [v23 constraintEqualToAnchor:v24];
  v25 = v39 = v4;
  v44[2] = v25;
  v26 = [(MapsSubtitleHeaderView *)self->_modalHeaderView bottomAnchor];
  v27 = [v20 bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v44[3] = v28;
  v29 = +[NSArray arrayWithObjects:v44 count:4];
  +[NSLayoutConstraint activateConstraints:v29];

  uint64_t v43 = objc_opt_class();
  v30 = +[NSArray arrayWithObjects:&v43 count:1];
  id v31 = [(MapsRouteCreationContainee *)self registerForTraitChanges:v30 withTarget:self action:"_userInterfaceStyleDidChange"];

  [(MapsRouteCreationContainee *)self _insertRouteCardIfNeeded];
  id v32 = objc_loadWeakRetained((id *)&self->_context);
  v33 = [v32 composedRoute];
  [(MapsRouteCreationContainee *)self _insertAppropriateCardStateForRoute:v33];
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MapsRouteCreationContainee;
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
    objc_super v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 updateHeightForCurrentLayout];
  }
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (double)headerHeight
{
  [(MapsSubtitleHeaderView *)self->_modalHeaderView layoutIfNeeded];
  modalHeaderView = self->_modalHeaderView;
  [(MapsSubtitleHeaderView *)modalHeaderView frame];
  double v5 = v4;
  LODWORD(v4) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[MapsSubtitleHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](modalHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, UILayoutFittingCompressedSize.height, v4, v6);
  return v7;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 2 >= 2)
  {
    double v9 = -1.0;
    if (a3 == 1)
    {
      [(MapsRouteCreationContainee *)self headerHeight];
      double v11 = v10;
      v12 = [(ContaineeViewController *)self cardPresentationController];
      [v12 bottomSafeOffset];
      double v9 = v11 + v13;
    }
  }
  else
  {
    double v4 = [(MapsLoopingVideoPlayerView *)self->_playerView superview];

    if (v4)
    {
      double v5 = [(ContaineeViewController *)self contentView];
      [v5 layoutIfNeeded];

      double v6 = [(ContaineeViewController *)self contentView];
      [v6 frame];
      double v8 = v7 * 0.580817044;
    }
    else
    {
      [(RouteCreationCardView *)self->_cardView layoutIfNeeded];
      cardView = self->_cardView;
      [(RouteCreationCardView *)cardView frame];
      double v16 = v15;
      LODWORD(v15) = 1148846080;
      LODWORD(v17) = 1112014848;
      -[RouteCreationCardView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](cardView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v16, UILayoutFittingCompressedSize.height, v15, v17);
      double v8 = v18;
    }
    v19 = [(ContaineeViewController *)self cardPresentationController];
    [v19 bottomSafeOffset];
    double v21 = v20;

    if (fabs(v21) <= 2.22044605e-16) {
      double v21 = 16.0;
    }
    [(MapsRouteCreationContainee *)self headerHeight];
    return v8 + v22 + v21;
  }
  return v9;
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
  if (v4 == (id)8)
  {
    id v6 = sub_10057683C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "pressed TTR", (uint8_t *)&v10, 2u);
    }

    double v7 = +[MapsRadarController sharedInstance];
    [v7 launchTTR];
    goto LABEL_11;
  }
  if (!v4)
  {
    double v5 = sub_10057683C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "pressed cancel", (uint8_t *)&v10, 2u);
    }

    if (self->_route && GEOConfigGetBOOL()) {
      [(MapsRouteCreationContainee *)self _showExitConfirmationAlert];
    }
    else {
      [(ContaineeViewController *)self handleDismissAction:0];
    }
    return;
  }
  uint64_t v8 = sub_1005762E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315650;
    double v11 = "-[MapsRouteCreationContainee trailingButtonTapped:]";
    __int16 v12 = 2080;
    double v13 = "MapsRouteCreationContainee.m";
    __int16 v14 = 1024;
    int v15 = 268;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v10, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    double v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = +[NSThread callStackSymbols];
      int v10 = 138412290;
      double v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
    }
LABEL_11:
  }
}

- (void)_showExitConfirmationAlert
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"[Route Creation] Exit Alert Title" value:@"localized string not found" table:0];
  double v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[Route Creation] Exit Alert Message" value:@"localized string not found" table:0];
  double v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  objc_initWeak(&location, self);
  uint64_t v8 = [v7 view];
  [v8 setAccessibilityIdentifier:@"ExitAlert"];

  id v9 = +[NSBundle mainBundle];
  int v10 = [v9 localizedStringForKey:@"[Route Creation] Exit Delete Option" value:@"localized string not found" table:0];
  int v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  double v17 = sub_100579D4C;
  double v18 = &unk_1012E8EB8;
  objc_copyWeak(&v19, &location);
  double v11 = +[UIAlertAction actionWithTitle:v10 style:2 handler:&v15];

  [v11 setAccessibilityIdentifier:@"DeleteAction" v15, v16, v17, v18];
  [v7 addAction:v11];
  __int16 v12 = +[NSBundle mainBundle];
  double v13 = [v12 localizedStringForKey:@"[Route Creation] Exit Cancel Option" value:@"localized string not found" table:0];
  __int16 v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:0];

  [v14 setAccessibilityIdentifier:@"CancelAction"];
  [v7 addAction:v14];
  [(MapsRouteCreationContainee *)self _maps_topMostPresentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
  id v5 = a3;
  [(MapsRouteCreationContainee *)self _insertAppropriateCardStateForRoute:v5];
}

- (void)_insertAppropriateCardStateForRoute:(id)a3
{
  id v9 = a3;
  id v4 = [(MapsLoopingVideoPlayerView *)self->_playerView superview];

  [(MapsRouteCreationContainee *)self loadViewIfNeeded];
  id v5 = [v9 legs];
  if (![v5 count])
  {

    goto LABEL_6;
  }
  id v6 = [v9 waypoints];
  id v7 = [v6 count];

  if ((unint64_t)v7 < 2)
  {
LABEL_6:
    [(MapsRouteCreationContainee *)self _insertEmptyStateIfNeeded];
    [(MapsRouteCreationContainee *)self _updateEmptyStateContent];
    goto LABEL_7;
  }
  [(MapsRouteCreationContainee *)self _insertRouteCardIfNeeded];
  [(MapsRouteCreationContainee *)self _updateRouteCardWithRoute:v9];
  if (v4)
  {
LABEL_7:
    uint64_t v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 updateHeightForCurrentLayout];
  }
}

- (void)_insertEmptyStateIfNeeded
{
  [(RouteCreationCardView *)self->_cardView setAlpha:0.0];
  v3 = self->_playerView;
  id v4 = v3;
  if (v3)
  {
    id v5 = [(MapsLoopingVideoPlayerView *)v3 superview];

    if (!v5)
    {
      id v6 = [(ContaineeViewController *)self contentView];
      [v6 addSubview:v4];

      double v22 = [(MapsLoopingVideoPlayerView *)v4 leadingAnchor];
      v23 = [(ContaineeViewController *)self contentView];
      double v21 = [v23 leadingAnchor];
      double v20 = [v22 constraintEqualToAnchor:v21];
      v24[0] = v20;
      double v18 = [(MapsLoopingVideoPlayerView *)v4 trailingAnchor];
      id v19 = [(ContaineeViewController *)self contentView];
      double v17 = [v19 trailingAnchor];
      uint64_t v16 = [v18 constraintEqualToAnchor:v17];
      v24[1] = v16;
      id v7 = [(MapsLoopingVideoPlayerView *)v4 topAnchor];
      uint64_t v8 = [(ContaineeViewController *)self headerView];
      id v9 = [v8 bottomAnchor];
      int v10 = [v7 constraintEqualToAnchor:v9];
      v24[2] = v10;
      double v11 = [(MapsLoopingVideoPlayerView *)v4 heightAnchor];
      __int16 v12 = [(ContaineeViewController *)self contentView];
      double v13 = [v12 widthAnchor];
      __int16 v14 = [v11 constraintEqualToAnchor:v13 multiplier:0.580817044 constant:0.0];
      v24[3] = v14;
      int v15 = +[NSArray arrayWithObjects:v24 count:4];
      +[NSLayoutConstraint activateConstraints:v15];
    }
  }
}

- (void)_insertRouteCardIfNeeded
{
  [(MapsLoopingVideoPlayerView *)self->_playerView removeFromSuperview];
  currentVideoName = self->_currentVideoName;
  self->_currentVideoName = 0;

  id v4 = self->_cardView;
  [(RouteCreationCardView *)v4 setAlpha:1.0];
  id v5 = [(RouteCreationCardView *)v4 superview];

  if (!v5)
  {
    id v6 = [(ContaineeViewController *)self contentView];
    [v6 addSubview:v4];

    double v18 = [(RouteCreationCardView *)v4 leadingAnchor];
    id v19 = [(ContaineeViewController *)self contentView];
    double v17 = [v19 leadingAnchor];
    uint64_t v16 = [v18 constraintEqualToAnchor:v17];
    v20[0] = v16;
    id v7 = [(RouteCreationCardView *)v4 trailingAnchor];
    uint64_t v8 = [(ContaineeViewController *)self contentView];
    id v9 = [v8 trailingAnchor];
    int v10 = [v7 constraintEqualToAnchor:v9];
    v20[1] = v10;
    double v11 = [(RouteCreationCardView *)v4 topAnchor];
    __int16 v12 = [(ContaineeViewController *)self headerView];
    double v13 = [v12 bottomAnchor];
    __int16 v14 = [v11 constraintEqualToAnchor:v13];
    v20[2] = v14;
    int v15 = +[NSArray arrayWithObjects:v20 count:3];
    +[NSLayoutConstraint activateConstraints:v15];
  }
}

- (void)_updateRouteCardWithRoute:(id)a3
{
  [(RouteCreationCardView *)self->_cardView setRoute:a3];

  [(MapsRouteCreationContainee *)self _updateDoneButton];
}

- (BOOL)_isValidRoute
{
  v2 = [(RouteCreationCardView *)self->_cardView route];
  v3 = [v2 legs];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_updateDoneButton
{
  BOOL v3 = [(MapsRouteCreationContainee *)self _isValidRoute];
  id v4 = [(RouteCreationCardView *)self->_cardView saveButton];
  [v4 setEnabled:v3];
}

- (void)_updateEmptyStateContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v4 = [WeakRetained emptyStateVideoName];

  id v5 = sub_10057683C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    __int16 v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating video: %@", buf, 0x16u);
  }

  if (v4 && ![(NSString *)self->_currentVideoName isEqualToString:v4])
  {
    id v6 = [objc_alloc((Class)NSDataAsset) initWithName:v4];
    id v7 = [v6 data];
    v11[0] = AVAssetPreferPreciseDurationAndTimingKey;
    v11[1] = AVAssetReferenceRestrictionsKey;
    v12[0] = &__kCFBooleanFalse;
    v12[1] = &off_1013A78D0;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    id v9 = +[AVAsset assetWithData:v7 contentType:AVFileTypeAppleM4V options:v8];

    int v10 = +[AVPlayerItem playerItemWithAsset:v9];
    [(MapsLoopingVideoPlayerView *)self->_playerView replaceCurrentItemWithPlayerItem:v10 preserveCurrentTimestamp:0];
    objc_storeStrong((id *)&self->_currentVideoName, v4);
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_currentVideoName, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);

  objc_destroyWeak((id *)&self->_context);
}

@end