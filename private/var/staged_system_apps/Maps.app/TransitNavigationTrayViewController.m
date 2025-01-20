@interface TransitNavigationTrayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_updateListContentInsetWithHeight:(double)a3;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (CGRect)_rectOfRowToKeepVisible;
- (NSNumber)displayedItemIndexForAnalytics;
- (TransitNavigationTrayDelegate)trayDelegate;
- (TransitNavigationTrayViewController)initWithRoute:(id)a3 stepsListDelegate:(id)a4;
- (UIScrollView)pptTestScrollView;
- (double)_maximumMediumCardHeight;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (id)headerView;
- (id)transitionContextForTransitionController:(id)a3;
- (int)currentUITargetForAnalytics;
- (int64_t)pptTestCurrentStepIndex;
- (void)_endButtonPressed;
- (void)_recordChangeToLayout:(unint64_t)a3;
- (void)_updateHeaderViewForCurrentCardHeight:(double)a3;
- (void)_updateListBackgroundAlphaForCurrentCardHeight:(double)a3;
- (void)_updateTransitionControllerForTransitionProgressSmallToMedium:(double)a3 mediumToFull:(double)a4;
- (void)_updateTransitionProgressForCurrentCard;
- (void)didChangeContainerStyle:(unint64_t)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)headerViewTapped:(id)a3;
- (void)pptTestMoveToNextStep;
- (void)setTitle:(id)a3;
- (void)setTrayDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBacklightSceneEnvironment;
- (void)updateForClusteredLegSelectedRideIndexChange;
- (void)updateForCurrentDisplayedStep;
- (void)updateForCurrentDisplayedStepAnimated:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation TransitNavigationTrayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TransitNavigationTrayViewController)initWithRoute:(id)a3 stepsListDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TransitNavigationTrayViewController;
  v8 = [(TransitNavigationTrayViewController *)&v17 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [v6 destination];
    v10 = [v9 navDisplayName];
    [(TransitNavigationTrayViewController *)v8 setTitle:v10];

    v11 = [(ContaineeViewController *)v8 cardPresentationController];
    [v11 setHideContentInSmallLayout:0];

    v12 = [[TransitDirectionsListViewController alloc] initWithRoute:v6 forNavigation:1];
    listViewController = v8->_listViewController;
    v8->_listViewController = v12;

    v14 = [(TransitDirectionsListViewController *)v8->_listViewController dataSource];
    [v14 setDelegate:v7];

    v15 = [(TransitDirectionsListViewController *)v8->_listViewController dataSource];
    [v15 setAutomaticallyScrollToDisplayedStep:0];
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitNavigationTrayViewController;
  id v4 = a3;
  [(TransitNavigationTrayViewController *)&v5 setTitle:v4];
  -[ContainerHeaderView setTitle:](self->_containerHeaderView, "setTitle:", v4, v5.receiver, v5.super_class);
}

- (void)viewDidLoad
{
  v80.receiver = self;
  v80.super_class = (Class)TransitNavigationTrayViewController;
  [(ContaineeViewController *)&v80 viewDidLoad];
  v3 = [(TransitNavigationTrayViewController *)self view];
  [v3 setAccessibilityIdentifier:@"TransitNavigationTray"];

  id v4 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  [v4 setContentInsetAdjustmentBehavior:2];

  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setFirstCard:1];

  [(TransitNavigationTrayViewController *)self addChildViewController:self->_listViewController];
  id v6 = [(TransitDirectionsListViewController *)self->_listViewController view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setClipsToBounds:1];
  id v7 = [(TransitNavigationTrayViewController *)self view];
  [v7 addSubview:v6];

  [(TransitDirectionsListViewController *)self->_listViewController didMoveToParentViewController:self];
  v8 = [[ContainerHeaderView alloc] initWithCardButtonType:0];
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v8;

  [(ContainerHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_containerHeaderView setButtonHidden:1];
  v10 = [(TransitNavigationTrayViewController *)self title];
  [(ContainerHeaderView *)self->_containerHeaderView setTitle:v10];

  v11 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:UIFontWeightBold];
  [(ContainerHeaderView *)self->_containerHeaderView setCustomTitleFont:v11];

  [(ContainerHeaderView *)self->_containerHeaderView setDelegate:self];
  LODWORD(v12) = 1148846080;
  [(ContainerHeaderView *)self->_containerHeaderView setContentHuggingPriority:1 forAxis:v12];
  v13 = [(TransitNavigationTrayViewController *)self view];
  [v13 addSubview:self->_containerHeaderView];

  v14 = [CardButton alloc];
  v15 = +[CardButtonConfiguration close];
  v16 = [(CardButton *)v14 initWithConfiguration:v15];
  endButton = self->_endButton;
  self->_endButton = v16;

  [(CardButton *)self->_endButton setAccessibilityIdentifier:@"TransitNavigationEndButton"];
  [(CardButton *)self->_endButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardButton *)self->_endButton addTarget:self action:"_endButtonPressed" forControlEvents:64];
  v18 = [(TransitNavigationTrayViewController *)self view];
  [v18 addSubview:self->_endButton];

  id v79 = objc_alloc_init((Class)NSMutableArray);
  v19 = [(ContainerHeaderView *)self->_containerHeaderView bottomAnchor];
  v20 = [(TransitNavigationTrayViewController *)self view];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  headerBottomConstraint = self->_headerBottomConstraint;
  self->_headerBottomConstraint = v22;

  v81[0] = self->_headerBottomConstraint;
  v77 = [(ContainerHeaderView *)self->_containerHeaderView heightAnchor];
  LODWORD(v24) = 1132068864;
  v76 = [v77 constraintEqualToConstant:60.0 priority:v24];
  v81[1] = v76;
  v75 = [(ContainerHeaderView *)self->_containerHeaderView heightAnchor];
  v74 = [v75 constraintGreaterThanOrEqualToConstant:60.0];
  v81[2] = v74;
  v72 = [(ContainerHeaderView *)self->_containerHeaderView leadingAnchor];
  v73 = [(TransitNavigationTrayViewController *)self view];
  v71 = [v73 leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v81[3] = v70;
  v69 = [(TransitNavigationTrayViewController *)self view];
  v68 = [v69 trailingAnchor];
  v67 = [(ContainerHeaderView *)self->_containerHeaderView trailingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v81[4] = v66;
  v65 = [v6 topAnchor];
  v64 = [(ContainerHeaderView *)self->_containerHeaderView bottomAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v81[5] = v63;
  v61 = [v6 leadingAnchor];
  v62 = [(TransitNavigationTrayViewController *)self view];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v81[6] = v59;
  v58 = [(TransitNavigationTrayViewController *)self view];
  v57 = [v58 trailingAnchor];
  v78 = v6;
  v56 = [v6 trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v81[7] = v55;
  v54 = [(TransitNavigationTrayViewController *)self view];
  v53 = [v54 bottomAnchor];
  v52 = [v6 bottomAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v81[8] = v51;
  v49 = [(CardButton *)self->_endButton topAnchor];
  v50 = [(TransitNavigationTrayViewController *)self view];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v81[9] = v47;
  v25 = [(TransitNavigationTrayViewController *)self view];
  v26 = [v25 trailingAnchor];
  v27 = [(CardButton *)self->_endButton trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v81[10] = v28;
  v29 = [(TransitNavigationTrayViewController *)self view];
  v30 = [v29 bottomAnchor];
  v31 = [(CardButton *)self->_endButton bottomAnchor];
  v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31];
  v81[11] = v32;
  v33 = +[NSArray arrayWithObjects:v81 count:12];
  [v79 addObjectsFromArray:v33];

  +[NSLayoutConstraint activateConstraints:v79];
  v34 = [RoutePlanningTransitionController alloc];
  v35 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  v36 = [(RoutePlanningTransitionController *)v34 initWithScrollView:v35];
  transitionController = self->_transitionController;
  self->_transitionController = v36;

  [(RoutePlanningTransitionController *)self->_transitionController setDelegate:self];
  [(RoutePlanningTransitionController *)self->_transitionController setShowMaximumContentWhenExpanding:0];
  [(TransitDirectionsListViewController *)self->_listViewController setScrollViewDelegate:self->_transitionController];
  [(TransitNavigationTrayViewController *)self _updateHeaderViewForCurrentCardHeight:0.0];
  v38 = [(ContaineeViewController *)self cardPresentationController];
  [v38 cardHeight];
  -[TransitNavigationTrayViewController _updateListContentInsetWithHeight:](self, "_updateListContentInsetWithHeight:");

  id v39 = objc_alloc((Class)UIView);
  v40 = [(TransitNavigationTrayViewController *)self view];
  [v40 bounds];
  v41 = [v39 initWithFrame:];
  lowLuminanceBackgroundView = self->_lowLuminanceBackgroundView;
  self->_lowLuminanceBackgroundView = v41;

  [(UIView *)self->_lowLuminanceBackgroundView setAlpha:0.0];
  v43 = sub_100826530();
  [(UIView *)self->_lowLuminanceBackgroundView setBackgroundColor:v43];

  [(UIView *)self->_lowLuminanceBackgroundView setAutoresizingMask:18];
  v44 = [(TransitNavigationTrayViewController *)self view];
  v45 = self->_lowLuminanceBackgroundView;
  v46 = [(TransitDirectionsListViewController *)self->_listViewController view];
  [v44 insertSubview:v45 belowSubview:v46];
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)TransitNavigationTrayViewController;
  [(TransitNavigationTrayViewController *)&v11 viewWillLayoutSubviews];
  if (!self->_hasForcedInitialContaineeHeight)
  {
    v3 = [(ContaineeViewController *)self cardPresentationController];

    if (v3)
    {
      id v4 = [(ContaineeViewController *)self cardPresentationController];
      self->_previousLayoutForTransition = (unint64_t)[v4 containeeLayout];

      objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
      self->_previousStyleForTransition = (unint64_t)[v5 containerStyle];

      if (-[ContainerViewController delaysFirstCardPresentation]_0())
      {
        BOOL v6 = self->_previousLayoutForTransition == 3;
        id v7 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
        [v7 setScrollEnabled:v6];
      }
      BOOL v8 = self->_previousLayoutForTransition != 3;
      v9 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
      [v9 setUseCollapsedDisplayStyle:v8];

      [(TransitNavigationTrayViewController *)self _rectOfRowToKeepVisible];
      if (CGRectGetHeight(v12) > 0.0)
      {
        self->_hasForcedInitialContaineeHeight = 1;
        v10 = [(ContaineeViewController *)self cardPresentationController];
        [v10 updateHeightForCurrentLayout];
      }
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TransitNavigationTrayViewController;
  [(ContaineeViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  if ([v3 containeeLayout] != (id)2) {
    goto LABEL_4;
  }
  double v4 = fabs(self->_previousMediumTransitionHeight);

  if (v4 <= 2.22044605e-16)
  {
    v3 = [(ContaineeViewController *)self cardPresentationController];
    [v3 cardHeight];
    self->_previousMediumTransitionHeight = v5;
LABEL_4:
  }
  [(TransitNavigationTrayViewController *)self _updateTransitionProgressForCurrentCard];
}

- (void)_updateTransitionProgressForCurrentCard
{
  v3 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v4 = (unint64_t)[v3 containerStyle];
  if (v4 > 7 || ((1 << v4) & 0xA3) == 0)
  {
    double v8 = 1.0;
    double v10 = 1.0;
  }
  else
  {

    objc_super v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 transitionProgressToAscendingLayoutFromLayout:1];
    double v8 = v7;

    v3 = [(ContaineeViewController *)self cardPresentationController];
    [v3 transitionProgressToAscendingLayoutFromLayout:2];
    double v10 = v9;
  }

  objc_super v11 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  [v11 contentOffset];
  if (v12 <= 0.0)
  {
    self->_preTransitionContentOffsetY = 0.0;
  }
  else
  {
    v13 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
    [v13 contentOffset];
    self->_preTransitionContentOffsetY = v14;
  }
  [(TransitNavigationTrayViewController *)self _updateHeaderViewForCurrentCardHeight:v10];
  v15 = [(ContaineeViewController *)self cardPresentationController];
  [v15 cardHeight];
  -[TransitNavigationTrayViewController _updateListContentInsetWithHeight:](self, "_updateListContentInsetWithHeight:");

  [(TransitNavigationTrayViewController *)self _updateTransitionControllerForTransitionProgressSmallToMedium:v8 mediumToFull:v10];

  [(TransitNavigationTrayViewController *)self _updateListBackgroundAlphaForCurrentCardHeight:v10];
}

- (BOOL)_updateListContentInsetWithHeight:(double)a3
{
  unint64_t v4 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  unsigned __int8 v5 = [v4 isDragging];

  if (v5) {
    return 0;
  }
  [(NSLayoutConstraint *)self->_headerBottomConstraint constant];
  [(TransitDirectionsListViewController *)self->_listViewController _heightOfFinalRow];
  objc_super v6 = [(TransitNavigationTrayViewController *)self view];
  UIRoundToViewScale();
  double v8 = v7;

  double v9 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  [v9 contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (vabdd_f64(v8, v15) <= 2.22044605e-16) {
    return 0;
  }
  v18 = sub_1004D2970();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 134218240;
    double v22 = v15;
    __int16 v23 = 2048;
    double v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Updating contentInset.bottom (prev: %#.5lf, new: %#.5lf)", (uint8_t *)&v21, 0x16u);
  }

  v19 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  [v19 setContentInset:v11, v13, v8, v17];

  return 1;
}

- (void)_updateTransitionControllerForTransitionProgressSmallToMedium:(double)a3 mediumToFull:(double)a4
{
  double v7 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  unsigned __int8 v8 = [v7 isDragging];

  if (v8) {
    return;
  }
  double v9 = [(ContaineeViewController *)self cardPresentationController];
  double v10 = (char *)[v9 containeeLayout];

  double v11 = [(ContaineeViewController *)self cardPresentationController];
  id v12 = [v11 containerStyle];

  if (fabs(a4) <= 2.22044605e-16)
  {
    BOOL v32 = v10 == (char *)2;
LABEL_6:
    if (fabs(a3) <= 2.22044605e-16)
    {
      int v13 = 0;
    }
    else
    {
      BOOL v14 = fabs(a3 + -1.0) > 2.22044605e-16;
      int v13 = (unint64_t)(v10 - 1) <= 1 && v14;
    }
    goto LABEL_11;
  }
  BOOL v32 = v10 == (char *)2;
  if (fabs(a4 + -1.0) <= 2.22044605e-16) {
    goto LABEL_6;
  }
  int v13 = 1;
LABEL_11:
  unint64_t previousLayoutForTransition = self->_previousLayoutForTransition;
  unint64_t previousStyleForTransition = self->_previousStyleForTransition;
  double v16 = [(ContaineeViewController *)self cardPresentationController];
  [v16 cardHeight];
  double v18 = v17;

  BOOL v19 = 0;
  if ((v13 & 1) == 0 && v32) {
    BOOL v19 = vabdd_f64(self->_previousMediumTransitionHeight, v18) > 2.22044605e-16;
  }
  v20 = sub_1004D2970();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    if (v13) {
      int v21 = @"YES";
    }
    else {
      int v21 = @"NO";
    }
    v30 = v21;
    if ((char *)previousLayoutForTransition == v10) {
      double v22 = @"NO";
    }
    else {
      double v22 = @"YES";
    }
    __int16 v23 = v22;
    if ((id)previousStyleForTransition == v12) {
      double v24 = @"NO";
    }
    else {
      double v24 = @"YES";
    }
    id v31 = v12;
    v25 = v24;
    if (v19) {
      v26 = @"YES";
    }
    else {
      v26 = @"NO";
    }
    v27 = v26;
    *(_DWORD *)buf = 134219522;
    double v35 = a4;
    __int16 v36 = 2048;
    double v37 = a3;
    __int16 v38 = 2048;
    double v39 = v18;
    __int16 v40 = 2112;
    v41 = v30;
    __int16 v42 = 2112;
    v43 = v23;
    __int16 v44 = 2112;
    v45 = v25;
    __int16 v46 = 2112;
    v47 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Updating transition controller (progressM-F: %#.5lf, progressS-M: %#.5lf, cardHeight: %lf, transitioning: %@, layoutChanged: %@, styleChanged: %@, currentMediumChangedInPlace: %@)", buf, 0x48u);

    id v12 = v31;
  }

  if ((char *)previousLayoutForTransition == v10) {
    int v28 = v13;
  }
  else {
    int v28 = 1;
  }
  if ((id)previousStyleForTransition != v12) {
    int v28 = 1;
  }
  if ((v28 | v19) == 1) {
    [(RoutePlanningTransitionController *)self->_transitionController setTransitioning:1];
  }
  if (((v13 | ![(RoutePlanningTransitionController *)self->_transitionController isTransitioning]) & 1) == 0)
  {
    v29 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
    [v29 setUseCollapsedDisplayStyle:v10 != (char *)3];
  }
  if ([(RoutePlanningTransitionController *)self->_transitionController isTransitioning]) {
    [(RoutePlanningTransitionController *)self->_transitionController updateTransitionWithHeight:v18];
  }
  if ((v13 & 1) == 0)
  {
    self->_unint64_t previousLayoutForTransition = (unint64_t)v10;
    self->_unint64_t previousStyleForTransition = (unint64_t)v12;
    if (v32 && vabdd_f64(v18, self->_previousMediumTransitionHeight) > 2.22044605e-16) {
      self->_previousMediumTransitionHeight = v18;
    }
    [(RoutePlanningTransitionController *)self->_transitionController setTransitioning:0];
  }
}

- (void)_updateHeaderViewForCurrentCardHeight:(double)a3
{
  unsigned __int8 v5 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
  if ([v5 isDragging])
  {
    unint64_t previousLayoutForTransition = self->_previousLayoutForTransition;

    if (previousLayoutForTransition == 3) {
      return;
    }
  }
  else
  {
  }
  [(ContainerHeaderView *)self->_containerHeaderView bounds];
  CGRectGetHeight(v13);
  double v7 = [(TransitNavigationTrayViewController *)self view];
  UIRoundToViewScale();
  double v9 = v8;

  [(NSLayoutConstraint *)self->_headerBottomConstraint constant];
  if (vabdd_f64(v9, v10) > 2.22044605e-16)
  {
    [(NSLayoutConstraint *)self->_headerBottomConstraint setConstant:v9];
    containerHeaderView = self->_containerHeaderView;
    [(ContainerHeaderView *)containerHeaderView setAlpha:a3];
  }
}

- (void)_updateListBackgroundAlphaForCurrentCardHeight:(double)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TransitNavigationTrayViewController;
  [(ContaineeViewController *)&v8 viewWillAppear:a3];
  unint64_t v4 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v5 = (unint64_t)[v4 containerStyle];
  unsigned int v6 = (v5 > 7) | (0x5Cu >> v5);

  [(RoutePlanningTransitionController *)self->_transitionController setCardDragEnabled:(v6 & 1) == 0];
  double v7 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  [v7 setAutomaticallyScrollToDisplayedStep:v6 & 1];
}

- (void)updateForClusteredLegSelectedRideIndexChange
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  [v2 updateForClusteredLegSelectedRideIndexChange];
}

- (void)updateForCurrentDisplayedStep
{
}

- (void)updateForCurrentDisplayedStepAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (v6 == (id)2)
  {
    double v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 cardHeight];
    double v9 = v8;

    [(TransitNavigationTrayViewController *)self heightForLayout:2];
    double v11 = vabdd_f64(v9, v10);
    id v12 = sub_1004D2970();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11 <= 2.22044605e-16)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "updateForCurrentDisplayedStep: need to scroll in place", buf, 2u);
      }

      [(TransitNavigationTrayViewController *)self _rectOfRowToKeepVisible];
      double v17 = v16;
      double v19 = v18;
      double v15 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
      [v15 setContentOffset:v3 animated:v17];
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "updateForCurrentDisplayedStep: need to reload current tray height", buf, 2u);
      }

      if (v3)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1004D31D0;
        v20[3] = &unk_1012E5D08;
        v20[4] = self;
        +[UIView animateWithDuration:v20 animations:0.25];
        return;
      }
      double v15 = [(ContaineeViewController *)self cardPresentationController];
      [v15 updateHeightForCurrentLayout];
    }
  }
  else
  {
    BOOL v14 = sub_1004D2970();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "updateForCurrentDisplayedStep: need to switch to Medium layout", buf, 2u);
    }

    double v15 = [(ContaineeViewController *)self cardPresentationController];
    [v15 wantsLayout:2 animated:v3];
  }
}

- (void)updateBacklightSceneEnvironment
{
  BOOL v3 = [(TransitNavigationTrayViewController *)self traitCollection];
  unsigned int v4 = [v3 isLuminanceReduced];

  if (v4)
  {
    id v8 = [(TransitNavigationTrayViewController *)self view];
    unint64_t v5 = [v8 window];
    id v6 = [v5 windowScene];
    double v7 = [v6 _backlightSceneEnvironment];
    [v7 invalidateAllTimelinesForReason:@"TransitNavigationTray didReceiveUpdate"];
  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitNavigationTrayViewController;
  [(ContaineeViewController *)&v6 willChangeLayout:"willChangeLayout:"];
  if (a3 <= 2)
  {
    unint64_t v5 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
    [v5 collapseAllItems];
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransitNavigationTrayViewController;
  [(ContaineeViewController *)&v7 didChangeLayout:"didChangeLayout:"];
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    unint64_t v5 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
    [v5 setScrollEnabled:a3 == 3];
  }
  objc_super v6 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  [v6 setUseCollapsedDisplayStyle:a3 != 3];

  [(TransitNavigationTrayViewController *)self _recordChangeToLayout:a3];
  [(TransitNavigationTrayViewController *)self _updateTransitionProgressForCurrentCard];
}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TransitNavigationTrayViewController;
  -[ContaineeViewController didChangeContainerStyle:](&v11, "didChangeContainerStyle:");
  char v5 = (a3 > 7) | (0x5Cu >> a3);
  [(RoutePlanningTransitionController *)self->_transitionController setCardDragEnabled:((a3 > 7) | (0x5Cu >> a3) & 1) == 0];
  objc_super v6 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  objc_super v7 = v6;
  uint64_t v8 = v5 & 1;
  if (v5) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  [v6 setAutomaticallyScrollToDisplayedStep:v8];

  double v10 = [(ContaineeViewController *)self cardPresentationController];
  [v10 wantsLayout:v9];

  [(TransitNavigationTrayViewController *)self _updateTransitionProgressForCurrentCard];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 < 2)
  {
    double v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 availableHeight];
    double v4 = v14;
LABEL_17:

    return v4;
  }
  if (a3 == 1)
  {
    [(ContaineeViewController *)self headerHeight];
    double v16 = v15 + 8.0;
    double v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 bottomSafeOffset];
    double v4 = v16 + v17;
    goto LABEL_17;
  }
  double v4 = 0.0;
  if (a3 == 2)
  {
    char v5 = [(TransitNavigationTrayViewController *)self traitCollection];
    id v6 = [v5 verticalSizeClass];

    double v4 = -1.0;
    if (v6 != (id)1)
    {
      [(TransitNavigationTrayViewController *)self _maximumMediumCardHeight];
      double v8 = v7;
      [(TransitNavigationTrayViewController *)self _rectOfRowToKeepVisible];
      double v9 = CGRectGetHeight(v25) + 8.0;
      double v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 bottomSafeOffset];
      double v12 = v11;
      double v13 = 48.0;
      if (v12 >= 48.0)
      {
        id v6 = [(ContaineeViewController *)self cardPresentationController];
        [v6 bottomSafeOffset];
      }
      if (v8 < v9 + v13)
      {
        [(TransitNavigationTrayViewController *)self _maximumMediumCardHeight];
        double v4 = v23;
      }
      else
      {
        [(TransitNavigationTrayViewController *)self _rectOfRowToKeepVisible];
        double v18 = CGRectGetHeight(v26) + 8.0;
        double v19 = [(ContaineeViewController *)self cardPresentationController];
        [v19 bottomSafeOffset];
        if (v20 < 48.0)
        {
          double v4 = v18 + 48.0;
        }
        else
        {
          int v21 = [(ContaineeViewController *)self cardPresentationController];
          [v21 bottomSafeOffset];
          double v4 = v18 + v22;
        }
      }
      if (v12 >= 48.0) {

      }
      goto LABEL_17;
    }
  }
  return v4;
}

- (id)headerView
{
  return self->_containerHeaderView;
}

- (id)contentView
{
  return [(TransitDirectionsListViewController *)self->_listViewController view];
}

- (void)headerViewTapped:(id)a3
{
  double v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  if (v5 == (id)3)
  {
    id v6 = [(TransitDirectionsListViewController *)self->_listViewController scrollView];
    [v6 stopScrollingAndZooming];

    id v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 wantsMinimizeLayout];
  }
  else
  {
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 wantsExpandLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TransitNavigationTrayViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v11 traitCollectionDidChange:v4];
  id v5 = [(TransitNavigationTrayViewController *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    id v7 = [(TransitNavigationTrayViewController *)self traitCollection];
    id v8 = [v7 isLuminanceReduced];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004D386C;
    v9[3] = &unk_1012E6300;
    char v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:v8 animations:v9];
  }
}

- (id)transitionContextForTransitionController:(id)a3
{
  id v4 = a3;
  [(TransitNavigationTrayViewController *)self _rectOfRowToKeepVisible];
  double Height = CGRectGetHeight(v27);
  int v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 bottomSafeOffset];
  double v8 = Height + v7;

  [(TransitNavigationTrayViewController *)self _maximumMediumCardHeight];
  double v9 = v8;
  if (v8 >= v10)
  {
    [(TransitNavigationTrayViewController *)self _maximumMediumCardHeight];
    double v9 = v11;
  }
  double v12 = [(ContaineeViewController *)self cardPresentationController];
  [v12 availableHeight];
  double v14 = v13;
  [(ContaineeViewController *)self headerHeight];
  double v16 = v15;

  objc_initWeak(&location, self);
  double v17 = [RoutePlanningTransitionContext alloc];
  double v18 = v14 - v16;
  BOOL v19 = self->_previousLayoutForTransition == 3;
  double preTransitionContentOffsetY = self->_preTransitionContentOffsetY;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1004D3AC0;
  v23[3] = &unk_1012ECB48;
  objc_copyWeak(&v24, &location);
  int v21 = [(RoutePlanningTransitionContext *)v17 initWithFullTableHeight:v19 initiatedFromFullLayout:v23 withInitialOffsetY:v18 heightToFrame:preTransitionContentOffsetY originToFrameHandler:v8 + v9 - v8];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v21;
}

- (CGRect)_rectOfRowToKeepVisible
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  [v2 frameOfDisplayedComposedRouteStepCell];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_maximumMediumCardHeight
{
  double v3 = [(ContaineeViewController *)self cardPresentationController];

  if (!v3) {
    return 1.79769313e308;
  }
  double v4 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v5 = (unint64_t)[v4 containerStyle];
  if (v5 <= 7 && ((1 << v5) & 0xA3) != 0)
  {

    double v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 availableHeight];
    double v8 = v7 * 0.5;
  }
  else
  {

    double v6 = [(ContaineeViewController *)self cardPresentationController];
    [v6 availableHeight];
    double v8 = v9;
  }

  return v8;
}

- (void)_endButtonPressed
{
  double v3 = sub_1004D2970();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "User pressed end button", v5, 2u);
  }

  double v4 = [(TransitNavigationTrayViewController *)self trayDelegate];
  [v4 transitNavigationTrayDidTapClose:self];
}

- (BOOL)pptTestSupportStepping
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  unsigned __int8 v3 = [v2 pptTestSupportStepping];

  return v3;
}

- (int64_t)pptTestCurrentStepIndex
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  id v3 = [v2 pptTestCurrentStepIndex];

  return (int64_t)v3;
}

- (BOOL)pptTestHasNextStep
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  unsigned __int8 v3 = [v2 pptTestHasNextStep];

  return v3;
}

- (void)pptTestMoveToNextStep
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  [v2 pptTestMoveToNextStep];
}

- (BOOL)pptTestMoveToBoardStep
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  unsigned __int8 v3 = [v2 pptTestMoveToBoardStep];

  return v3;
}

- (UIScrollView)pptTestScrollView
{
  return [(TransitDirectionsListViewController *)self->_listViewController scrollView];
}

- (int)currentUITargetForAnalytics
{
  return 610;
}

- (void)_recordChangeToLayout:(unint64_t)a3
{
  unint64_t previousLayoutForTransition = self->_previousLayoutForTransition;
  if (previousLayoutForTransition)
  {
    if (previousLayoutForTransition >= a3)
    {
      if (previousLayoutForTransition <= a3) {
        return;
      }
      id v9 = +[MKMapService sharedService];
      uint64_t v5 = [(TransitNavigationTrayViewController *)self currentUITargetForAnalytics];
      double v6 = [(TransitNavigationTrayViewController *)self displayedItemIndexForAnalytics];
      double v7 = v9;
      uint64_t v8 = 2;
    }
    else
    {
      id v9 = +[MKMapService sharedService];
      uint64_t v5 = [(TransitNavigationTrayViewController *)self currentUITargetForAnalytics];
      double v6 = [(TransitNavigationTrayViewController *)self displayedItemIndexForAnalytics];
      double v7 = v9;
      uint64_t v8 = 1;
    }
    [v7 captureUserAction:v8 onTarget:v5 eventValue:0 transitStep:v6];
  }
}

- (NSNumber)displayedItemIndexForAnalytics
{
  id v2 = [(TransitDirectionsListViewController *)self->_listViewController dataSource];
  unsigned __int8 v3 = [v2 displayedItemIndexForAnalytics];

  return (NSNumber *)v3;
}

- (TransitNavigationTrayDelegate)trayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trayDelegate);

  return (TransitNavigationTrayDelegate *)WeakRetained;
}

- (void)setTrayDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trayDelegate);
  objc_storeStrong((id *)&self->_lowLuminanceBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);

  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end