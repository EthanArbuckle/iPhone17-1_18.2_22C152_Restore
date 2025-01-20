@interface NavSignListViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowDebugViewController;
- (BOOL)_showsHairlineForItemIndex:(unint64_t)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)debugViewControllerEnabled;
- (BOOL)hasElevationGraph;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isDragging;
- (BOOL)isExpanded;
- (BOOL)isLaneGuidanceActive;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)cellClassForItemType:(unint64_t)a3;
- (DirectionsElevationGraphView)graphView;
- (GEOComposedRoute)route;
- (MUBlurView)graphBackgroundView;
- (NavSignFooterView)footerView;
- (NavSignListViewController)initWithSignDelegate:(id)a3;
- (NavSignListViewControllerDelegate)signDelegate;
- (NavigationDebugViewsController)debugViewController;
- (RouteStepListDataSource)dataSource;
- (UICollectionView)collectionView;
- (double)_collapsedSignHeight;
- (double)_graphTopPosition;
- (double)_lastSignHeight;
- (double)_signContainerAvailableHeight;
- (double)activeStepFadeIn;
- (double)cardWidth;
- (double)collapsedHeight;
- (double)cornerRadius;
- (double)footerBottomPosition;
- (double)layoutProgress;
- (id)VIOEnabledHintLabel;
- (id)_displayIndexPath;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)_displayStepIndex;
- (unint64_t)_stateForItemIndex:(unint64_t)a3;
- (unint64_t)activeStepIndex;
- (unint64_t)cornerMask;
- (unint64_t)selectedStepIndex;
- (void)_applyCornerMask;
- (void)_cancelReroute;
- (void)_cleanupStepCountdowns;
- (void)_didPan:(id)a3;
- (void)_didTap:(id)a3;
- (void)_handleNewRoute:(id)a3;
- (void)_insertGraphView;
- (void)_processSignUpdate;
- (void)_reapplySignCountdown;
- (void)_triggerSignListAnalytics;
- (void)_updateActiveStepIndexAnimated:(BOOL)a3;
- (void)_updateCollectionViewBottomInset;
- (void)_updateCurrentManeuverBackground;
- (void)_updateGraphContainerTop;
- (void)_updateGraphViewIfNeeded;
- (void)_updateLaneGuidancePositioning;
- (void)_updateLayoutProgressWithDuration:(double)a3 completion:(id)a4;
- (void)_updateRoute:(id)a3;
- (void)_updateSelectionBackgrounds;
- (void)cell:(id)a3 setPressed:(BOOL)a4;
- (void)clearDragState;
- (void)clearPartialExpansionAnimated:(BOOL)a3;
- (void)clearSelectionAnimated:(BOOL)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)hideVIOLabel:(BOOL)a3;
- (void)loadView;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationServiceDidCancelReroute:(id)a3;
- (void)navigationServiceWillReroute:(id)a3;
- (void)reloadDataSource:(id)a3;
- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4;
- (void)reloadUIForDataSource:(id)a3;
- (void)scrollToIndexPath:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActiveStepIndex:(unint64_t)a3;
- (void)setCardWidth:(double)a3;
- (void)setCollectionView:(id)a3;
- (void)setConnectedToCarPlay:(BOOL)a3 animated:(BOOL)a4;
- (void)setCornerMask:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDebugViewController:(id)a3;
- (void)setDebugViewControllerEnabled:(BOOL)a3;
- (void)setDragging:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setGraphBackgroundView:(id)a3;
- (void)setGraphView:(id)a3;
- (void)setLaneGuidanceActive:(BOOL)a3;
- (void)setLayoutProgress:(double)a3;
- (void)setRoute:(id)a3;
- (void)setSelectedStepIndex:(unint64_t)a3;
- (void)toggleExpansionAnimated:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFooterConstraints;
- (void)updateHeightConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NavSignListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavSignListViewController)initWithSignDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NavSignListViewController;
  v5 = [(NavSignListViewController *)&v12 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = sub_100467248();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(NavSignListViewController *)v5 setAccessibilityIdentifier:v8];

    objc_storeWeak((id *)&v5->_signDelegate, v4);
    uint64_t v9 = +[RouteStepListMetrics navSignMetrics];
    metrics = v5->_metrics;
    v5->_metrics = (RouteStepListMetrics *)v9;

    v5->_selectedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)dealloc
{
  v3 = sub_100467248();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NavSignListViewController;
  [(NavSignListViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(NavSignListViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v183.receiver = self;
  v183.super_class = (Class)NavSignListViewController;
  [(NavSignListViewController *)&v183 viewDidLoad];
  id v3 = [(NavSignListViewController *)self view];
  [v3 setClipsToBounds:1];

  objc_super v4 = (MUBlurView *)[objc_alloc((Class)MUBlurView) initWithBlurEffectStyle:19];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  v6 = [(MUBlurView *)self->_backgroundView layer];
  [v6 setCornerCurve:kCACornerCurveContinuous];

  v7 = self->_backgroundView;
  v8 = [(MUBlurView *)v7 layer];
  [v8 setMasksToBounds:1];

  uint64_t v9 = sub_1008263F8();
  [(MUBlurView *)v7 setNonBlurredColor:v9];

  [(MUBlurView *)v7 setBlurGroupName:@"NavSignBlur"];
  [(MUBlurView *)v7 setStyle:2];
  [(MUBlurView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(NavSignListViewController *)self view];
  v182 = v7;
  [v10 addSubview:v7];

  v11 = (UIView *)objc_opt_new();
  graphContainerView = self->_graphContainerView;
  self->_graphContainerView = v11;

  [(UIView *)self->_graphContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = self->_graphContainerView;
  id v14 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTap:"];
  [(UIView *)v13 addGestureRecognizer:v14];

  [(UIView *)self->_graphContainerView setAccessibilityIdentifier:@"GraphContainerView"];
  v15 = [(NavSignListViewController *)self view];
  [v15 addSubview:self->_graphContainerView];

  v16 = (MUBlurView *)[objc_alloc((Class)MUBlurView) initWithBlurEffectStyle:19];
  graphBackgroundView = self->_graphBackgroundView;
  self->_graphBackgroundView = v16;

  v18 = sub_1008263F8();
  [(MUBlurView *)self->_graphBackgroundView setNonBlurredColor:v18];

  [(MUBlurView *)self->_graphBackgroundView setBlurGroupName:@"NavSignBlur"];
  [(MUBlurView *)self->_graphBackgroundView setStyle:2];
  [(MUBlurView *)self->_graphBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_graphContainerView addSubview:self->_graphBackgroundView];
  v19 = (UIView *)objc_opt_new();
  containerView = self->_containerView;
  self->_containerView = v19;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView setClipsToBounds:1];
  v21 = [(UIView *)self->_containerView layer];
  [v21 setMasksToBounds:1];

  [(UIView *)self->_containerView setAccessibilityIdentifier:@"NavSignListContainerView"];
  v22 = self->_containerView;
  id v23 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTap:"];
  [(UIView *)v22 addGestureRecognizer:v23];

  v24 = [(NavSignListViewController *)self view];
  [v24 addSubview:self->_containerView];

  v25 = objc_opt_new();
  [v25 setMinimumLineSpacing:0.0];
  [v25 setMinimumInteritemSpacing:0.0];
  v179 = v25;
  v26 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  collectionView = self->_collectionView;
  self->_collectionView = v26;

  v28 = [(NavSignListViewController *)self cellClassForItemType:1];
  v29 = self->_collectionView;
  v30 = NSStringFromClass(v28);
  [(UICollectionView *)v29 registerClass:v28 forCellWithReuseIdentifier:v30];

  v31 = self->_collectionView;
  uint64_t v32 = objc_opt_class();
  v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  [(UICollectionView *)v31 registerClass:v32 forCellWithReuseIdentifier:v34];

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = +[UIColor clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v35];

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  [(UICollectionView *)self->_collectionView setDelaysContentTouches:0];
  [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"NavSignListCollectionView"];
  [(UIView *)self->_containerView addSubview:self->_collectionView];
  v36 = (MUGradientView *)objc_opt_new();
  gradientView = self->_gradientView;
  self->_gradientView = v36;

  [(MUGradientView *)self->_gradientView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUGradientView *)self->_gradientView setUserInteractionEnabled:0];
  v38 = sub_1008263F8();
  v39 = [v38 colorWithAlphaComponent:0.0];
  v186[0] = v39;
  v40 = sub_1008263F8();
  v41 = [v40 colorWithAlphaComponent:0.25];
  v186[1] = v41;
  v42 = sub_1008263F8();
  v186[2] = v42;
  v43 = +[NSArray arrayWithObjects:v186 count:3];
  [(MUGradientView *)self->_gradientView setColors:v43];

  [(UIView *)self->_containerView addSubview:self->_gradientView];
  v44 = (NavSignFooterView *)objc_opt_new();
  footerView = self->_footerView;
  self->_footerView = v44;

  [(NavSignFooterView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v46 = self->_footerView;
  id v47 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTap:"];
  [(NavSignFooterView *)v46 addGestureRecognizer:v47];

  v48 = self->_footerView;
  id v49 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"_didPan:"];
  [(NavSignFooterView *)v48 addGestureRecognizer:v49];

  v50 = [(NavSignListViewController *)self view];
  [v50 safeAreaInsets];
  [(NavSignFooterView *)self->_footerView setBottomPadding:v51];

  v52 = [(NavSignFooterView *)self->_footerView endButton];
  v53 = [(NavSignListViewController *)self signDelegate];
  [v52 addTarget:v53 action:"pressedEndNavigationWithSender:" forControlEvents:64];

  v54 = [(NavSignListViewController *)self view];
  [v54 addSubview:self->_footerView];

  v55 = [(UICollectionView *)self->_collectionView topAnchor];
  v56 = [(UIView *)self->_containerView topAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  collectionViewTopConstraint = self->_collectionViewTopConstraint;
  self->_collectionViewTopConstraint = v57;

  v59 = +[MNNavigationService sharedService];
  v60 = [v59 route];

  v177 = v60;
  if (v60
    && [v60 transportType] == 2
    && +[VIOSessionTask isVIOModeEnabled])
  {
    v61 = self->_containerView;
    v62 = [(NavSignListViewController *)self VIOEnabledHintLabel];
    [(UIView *)v61 addSubview:v62];

    self->_vioHintLabelVisible = 1;
    v63 = [(UILabel *)self->_vioHintLabel topAnchor];
    v64 = [(UIView *)self->_containerView topAnchor];
    v65 = [v63 constraintEqualToAnchor:v64];
    vioHintLabelTopConstraint = self->_vioHintLabelTopConstraint;
    self->_vioHintLabelTopConstraint = v65;

    v67 = [(UICollectionView *)self->_collectionView topAnchor];
    v68 = [(UILabel *)self->_vioHintLabel bottomAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    v70 = self->_collectionViewTopConstraint;
    self->_collectionViewTopConstraint = v69;

    v185[0] = self->_vioHintLabelTopConstraint;
    v173 = [(UILabel *)self->_vioHintLabel leadingAnchor];
    v171 = [(UIView *)self->_containerView leadingAnchor];
    v71 = [v173 constraintEqualToAnchor:v171 constant:8.0];
    v185[1] = v71;
    v72 = [(UILabel *)self->_vioHintLabel trailingAnchor];
    v73 = [(UIView *)self->_containerView trailingAnchor];
    v74 = [v72 constraintEqualToAnchor:v73 constant:-8.0];
    v185[2] = v74;
    v75 = [(UILabel *)self->_vioHintLabel heightAnchor];
    v76 = [v75 constraintGreaterThanOrEqualToConstant:30.0];
    v185[3] = v76;
    v180 = +[NSArray arrayWithObjects:v185 count:4];
  }
  else
  {
    v180 = &__NSArray0__struct;
  }
  v77 = [(UIView *)self->_graphContainerView topAnchor];
  v78 = [(NavSignListViewController *)self view];
  v79 = [v78 topAnchor];
  v80 = [v77 constraintEqualToAnchor:v79 constant:-92.0];
  graphTopConstraint = self->_graphTopConstraint;
  self->_graphTopConstraint = v80;

  v82 = [(UIView *)self->_containerView heightAnchor];
  v83 = [v82 constraintEqualToConstant:110.0];
  containerViewHeightConstraint = self->_containerViewHeightConstraint;
  self->_containerViewHeightConstraint = v83;

  LODWORD(v85) = 1148829696;
  [(NSLayoutConstraint *)self->_containerViewHeightConstraint setPriority:v85];
  v86 = [(MUGradientView *)self->_gradientView topAnchor];
  v87 = [(UIView *)self->_containerView topAnchor];
  v88 = [v86 constraintEqualToAnchor:v87 constant:110.0];
  gradientViewTopConstraint = self->_gradientViewTopConstraint;
  self->_gradientViewTopConstraint = v88;

  v90 = [(MUGradientView *)self->_gradientView bottomAnchor];
  v91 = [(UICollectionView *)self->_collectionView bottomAnchor];
  [(NavSignFooterView *)self->_footerView maximumHeight];
  v93 = [v90 constraintEqualToAnchor:v91 constant:-v92];
  gradientViewBottomConstraint = self->_gradientViewBottomConstraint;
  self->_gradientViewBottomConstraint = v93;

  v95 = [(NavSignFooterView *)self->_footerView heightAnchor];
  [(NavSignFooterView *)self->_footerView minimumHeight];
  [v95 constraintEqualToConstant:];
  v96 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  footerHeightConstraint = self->_footerHeightConstraint;
  self->_footerHeightConstraint = v96;

  v172 = [(UIView *)self->_graphContainerView leadingAnchor];
  v174 = [(NavSignListViewController *)self view];
  v170 = [v174 leadingAnchor];
  v169 = [v172 constraintEqualToAnchor:v170];
  v184[0] = v169;
  v167 = [(UIView *)self->_graphContainerView trailingAnchor];
  v168 = [(NavSignListViewController *)self view];
  v166 = [v168 trailingAnchor];
  v165 = [v167 constraintEqualToAnchor:v166];
  v98 = self->_graphTopConstraint;
  v184[1] = v165;
  v184[2] = v98;
  v164 = [(UIView *)self->_graphContainerView heightAnchor];
  v163 = [v164 constraintEqualToConstant:92.0];
  v184[3] = v163;
  v162 = [(MUBlurView *)self->_graphBackgroundView leadingAnchor];
  v161 = [(UIView *)self->_graphContainerView leadingAnchor];
  v160 = [v162 constraintEqualToAnchor:v161];
  v184[4] = v160;
  v159 = [(MUBlurView *)self->_graphBackgroundView trailingAnchor];
  v158 = [(UIView *)self->_graphContainerView trailingAnchor];
  v157 = [v159 constraintEqualToAnchor:v158];
  v184[5] = v157;
  v156 = [(MUBlurView *)self->_graphBackgroundView topAnchor];
  v155 = [(UIView *)self->_graphContainerView topAnchor];
  v154 = [v156 constraintEqualToAnchor:v155];
  v184[6] = v154;
  v176 = [(MUBlurView *)self->_graphBackgroundView bottomAnchor];
  v153 = [(UIView *)self->_graphContainerView bottomAnchor];
  v152 = [v176 constraintEqualToAnchor:v153];
  v184[7] = v152;
  v150 = [(UIView *)self->_containerView leadingAnchor];
  v151 = [(NavSignListViewController *)self view];
  v149 = [v151 leadingAnchor];
  v148 = [v150 constraintEqualToAnchor:v149];
  v184[8] = v148;
  v146 = [(UIView *)self->_containerView trailingAnchor];
  v147 = [(NavSignListViewController *)self view];
  v145 = [v147 trailingAnchor];
  v144 = [v146 constraintEqualToAnchor:v145];
  v184[9] = v144;
  v142 = [(UIView *)self->_containerView topAnchor];
  v178 = [(UIView *)self->_graphContainerView bottomAnchor];
  v141 = [v142 constraintEqualToAnchor:v178];
  v99 = self->_containerViewHeightConstraint;
  v184[10] = v141;
  v184[11] = v99;
  v140 = [(MUBlurView *)v182 leadingAnchor];
  v139 = [(UIView *)self->_containerView leadingAnchor];
  v138 = [v140 constraintEqualToAnchor:v139];
  v184[12] = v138;
  v137 = [(MUBlurView *)v182 trailingAnchor];
  v136 = [(UIView *)self->_containerView trailingAnchor];
  v135 = [v137 constraintEqualToAnchor:v136];
  v184[13] = v135;
  v134 = [(MUBlurView *)v182 topAnchor];
  v133 = [(UIView *)self->_containerView topAnchor];
  v132 = [v134 constraintEqualToAnchor:v133];
  v184[14] = v132;
  v131 = [(MUBlurView *)v182 bottomAnchor];
  v130 = [(NavSignFooterView *)self->_footerView bottomAnchor];
  v129 = [v131 constraintEqualToAnchor:v130];
  v184[15] = v129;
  v128 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v127 = [(UIView *)self->_containerView leadingAnchor];
  v126 = [v128 constraintEqualToAnchor:v127];
  v184[16] = v126;
  v125 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v124 = [(UIView *)self->_containerView trailingAnchor];
  v123 = [v125 constraintEqualToAnchor:v124];
  v100 = self->_collectionViewTopConstraint;
  v184[17] = v123;
  v184[18] = v100;
  v122 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v175 = [(NavSignListViewController *)self view];
  v121 = [v175 bottomAnchor];
  v120 = [v122 constraintEqualToAnchor:v121];
  v184[19] = v120;
  v119 = [(MUGradientView *)self->_gradientView leadingAnchor];
  v118 = [(UIView *)self->_containerView leadingAnchor];
  v117 = [v119 constraintEqualToAnchor:v118];
  v184[20] = v117;
  v181 = [(MUGradientView *)self->_gradientView trailingAnchor];
  v116 = [(UIView *)self->_containerView trailingAnchor];
  v115 = [v181 constraintEqualToAnchor:v116];
  v101 = self->_gradientViewTopConstraint;
  v184[21] = v115;
  v184[22] = v101;
  v184[23] = self->_gradientViewBottomConstraint;
  v114 = [(NavSignFooterView *)self->_footerView leadingAnchor];
  v143 = [(NavSignListViewController *)self view];
  v113 = [v143 leadingAnchor];
  v112 = [v114 constraintEqualToAnchor:v113];
  v184[24] = v112;
  v102 = [(NavSignFooterView *)self->_footerView trailingAnchor];
  v103 = [(NavSignListViewController *)self view];
  v104 = [v103 trailingAnchor];
  v105 = [v102 constraintEqualToAnchor:v104];
  v184[25] = v105;
  v106 = [(NavSignFooterView *)self->_footerView topAnchor];
  v107 = [(UIView *)self->_containerView bottomAnchor];
  v108 = [v106 constraintEqualToAnchor:v107];
  v109 = self->_footerHeightConstraint;
  v184[26] = v108;
  v184[27] = v109;
  v110 = +[NSArray arrayWithObjects:v184 count:28];
  v111 = [v110 arrayByAddingObjectsFromArray:v180];
  +[NSLayoutConstraint activateConstraints:v111];

  [(NavSignListViewController *)self _applyCornerMask];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewWillAppear:](&v25, "viewWillAppear:");
  if (!self->_firstSetupDone)
  {
    self->_firstSetupDone = 1;
    v5 = +[MNNavigationService sharedService];
    [v5 registerObserver:self];

    v6 = +[MNNavigationService sharedService];
    v7 = [v6 route];

    v8 = sub_100467248();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 name];
      v10 = [v7 uniqueRouteID];
      id v11 = [v7 stepsCount];
      *(_DWORD *)buf = 134349826;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v9;
      __int16 v30 = 2112;
      v31 = v10;
      __int16 v32 = 2048;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Setting up sign list with route %@ (%@) with steps %lu", buf, 0x2Au);
    }
    [(NavSignListViewController *)self setRoute:v7];
    objc_super v12 = [(NavSignListViewController *)self dataSource];
    v13 = +[MNNavigationService sharedService];
    id v14 = [v12 itemIndexForStepIndex:[v13 stepIndex]];

    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v15 = 0;
    }
    else {
      id v15 = v14;
    }
    [(NavSignListViewController *)self setActiveStepIndex:v15];
    BOOL expanded = self->_expanded;
    v17 = [(NavSignListViewController *)self collectionView];
    [v17 setScrollEnabled:expanded];

    [(NavSignListViewController *)self _updateActiveStepIndexAnimated:0];
    [(NavSignListViewController *)self setDebugViewControllerEnabled:[(NavSignListViewController *)self _shouldShowDebugViewController]];
    if (self->_vioHintLabelVisible)
    {
      objc_initWeak((id *)buf, self);
      GEOConfigGetDouble();
      double v19 = v18;
      id v20 = &_dispatch_main_q;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1004689EC;
      v23[3] = &unk_1012E7638;
      objc_copyWeak(&v24, (id *)buf);
      v21 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v23 block:v19];
      vioHintLabelDismissTimer = self->_vioHintLabelDismissTimer;
      self->_vioHintLabelDismissTimer = v21;

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
  [(NavSignListViewController *)self setDragging:0];
  [(NavSignListViewController *)self clearPartialExpansionAnimated:v3];
}

- (void)hideVIOLabel:(BOOL)a3
{
  if (self->_vioHintLabelVisible)
  {
    BOOL v3 = a3;
    v5 = [(NavSignListViewController *)self signDelegate];
    [v5 signListHeightWillChangeAnimated:v3];

    v6 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self willChangeValueForKey:v6];

    self->_vioHintLabelVisible = 0;
    v7 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self didChangeValueForKey:v7];

    vioHintLabelDismissTimer = self->_vioHintLabelDismissTimer;
    self->_vioHintLabelDismissTimer = 0;

    [(UILabel *)self->_vioHintLabel frame];
    [(NSLayoutConstraint *)self->_vioHintLabelTopConstraint setConstant:-v9];
    [(NSLayoutConstraint *)self->_collectionViewTopConstraint setActive:0];
    v10 = [(UICollectionView *)self->_collectionView topAnchor];
    id v11 = [(UIView *)self->_containerView topAnchor];
    objc_super v12 = [v10 constraintEqualToAnchor:v11];
    collectionViewTopConstraint = self->_collectionViewTopConstraint;
    self->_collectionViewTopConstraint = v12;

    [(NSLayoutConstraint *)self->_collectionViewTopConstraint setActive:1];
    objc_initWeak(&location, self);
    if (v3) {
      double v14 = 0.5;
    }
    else {
      double v14 = 0.0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100468C7C;
    v17[3] = &unk_1012E5D08;
    v17[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100468CE4;
    v15[3] = &unk_1012E6998;
    objc_copyWeak(&v16, &location);
    +[UIView animateWithDuration:v17 animations:v15 completion:v14];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NavSignListViewController;
  -[NavSignListViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(NavSignListViewController *)self setDragging:0];
  [(NavSignListViewController *)self clearPartialExpansionAnimated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NavSignListViewController;
  [(NavSignListViewController *)&v4 viewDidAppear:a3];
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsTestingMapsRegionUpdatedWithGuidanceStep" object:self userInfo:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)NavSignListViewController;
  [(NavSignListViewController *)&v9 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(NavSignListViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  v6 = [(NavSignListViewController *)self footerView];
  [v6 setBottomPadding:v5];

  [(NavSignListViewController *)self updateHeightConstraints];
  v7 = [(NavSignListViewController *)self footerView];
  [v7 maximumHeight];
  [(NSLayoutConstraint *)self->_gradientViewBottomConstraint setConstant:-v8];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NavSignListViewController;
  [(NavSignListViewController *)&v10 viewDidLayoutSubviews];
  computedWidth = self->_computedWidth;
  if (!computedWidth)
  {
    double cardWidth = self->_cardWidth;
    goto LABEL_5;
  }
  [(NSNumber *)computedWidth cgFloatValue];
  double v5 = v4;
  double cardWidth = self->_cardWidth;
  if (vabdd_f64(v5, cardWidth) > 2.22044605e-16)
  {
LABEL_5:
    v7 = +[NSNumber numberWithDouble:cardWidth];
    double v8 = self->_computedWidth;
    self->_computedWidth = v7;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100468FB4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NavSignListViewController;
  id v4 = a3;
  [(NavSignListViewController *)&v12 traitCollectionDidChange:v4];
  double v5 = [(NavSignListViewController *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  v7 = [(NavSignListViewController *)self traitCollection];
  double v8 = v7;
  if (v6)
  {
    id v9 = [v7 isLuminanceReduced];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1004691C8;
    v10[3] = &unk_1012E6300;
    char v11 = (char)v9;
    v10[4] = self;
    +[UIView _maps_animateForAndromeda:v9 animations:v10];
    [(NavSignListViewController *)self _updateSelectionBackgrounds];
  }
  else
  {
    [(RouteStepListDataSource *)self->_dataSource setTraitCollection:v7];
  }
}

- (void)setRoute:(id)a3
{
  double v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    int v6 = sub_100467248();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(GEOComposedRoute *)v5 uniqueRouteID];
      int v10 = 134349314;
      char v11 = self;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new route: %@", (uint8_t *)&v10, 0x16u);
    }
    objc_storeStrong((id *)&self->_route, a3);
    [(RouteStepListDataSource *)self->_dataSource setRoute:v5];
    graphView = self->_graphView;
    id v9 = [(GEOComposedRoute *)v5 elevationProfile];
    [(GEOComposedRoute *)v5 distance];
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](graphView, "setElevationProfile:routeLength:", v9);

    [(DirectionsElevationGraphView *)self->_graphView setNavigationProgress:0.0];
    [(NavSignListViewController *)self _updateGraphViewIfNeeded];
  }
}

- (DirectionsElevationGraphView)graphView
{
  graphView = self->_graphView;
  if (!graphView)
  {
    id v4 = [DirectionsElevationGraphConfiguration alloc];
    double v5 = [(NavSignListViewController *)self traitCollection];
    int v6 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v4, "initWithUseType:userInterfaceIdiom:", 2, [v5 userInterfaceIdiom]);

    v7 = [[DirectionsElevationGraphView alloc] initWithConfiguration:v6];
    double v8 = self->_graphView;
    self->_graphView = v7;

    [(DirectionsElevationGraphView *)self->_graphView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DirectionsElevationGraphView *)self->_graphView setOverrideUserInterfaceStyle:2];
    id v9 = self->_graphView;
    int v10 = [(NavSignListViewController *)self route];
    char v11 = [v10 elevationProfile];
    __int16 v12 = [(NavSignListViewController *)self route];
    [v12 distance];
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](v9, "setElevationProfile:routeLength:", v11);

    graphView = self->_graphView;
  }

  return graphView;
}

- (void)setCardWidth:(double)a3
{
  if (vabdd_f64(a3, self->_cardWidth) > 2.22044605e-16)
  {
    self->_double cardWidth = a3;
    computedWidth = self->_computedWidth;
    if (computedWidth)
    {
      [(NSNumber *)computedWidth cgFloatValue];
      if (vabdd_f64(v6, a3) > 2.22044605e-16)
      {
        v7 = [(NavSignListViewController *)self view];
        [v7 setNeedsLayout];

        id v8 = [(NavSignListViewController *)self view];
        [v8 layoutIfNeeded];
      }
    }
  }
}

- (void)setDragging:(BOOL)a3
{
  if (self->_dragging != a3)
  {
    BOOL v3 = a3;
    double v5 = sub_100467248();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL dragging = self->_dragging;
      int v7 = 134349568;
      id v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = dragging;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Changing dragging from: %d to %d", (uint8_t *)&v7, 0x18u);
    }

    self->_BOOL dragging = v3;
  }
}

- (id)VIOEnabledHintLabel
{
  vioHintLabel = self->_vioHintLabel;
  if (!vioHintLabel)
  {
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_vioHintLabel;
    self->_vioHintLabel = v4;

    [(UILabel *)self->_vioHintLabel setClipsToBounds:1];
    [(UILabel *)self->_vioHintLabel setNumberOfLines:0];
    [(UILabel *)self->_vioHintLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(NavSignListViewController *)self theme];
    int v7 = [v6 navSignMinorTextColor];
    [(UILabel *)self->_vioHintLabel setTextColor:v7];

    [(UILabel *)self->_vioHintLabel setTextAlignment:1];
    id v8 = +[UIFont _maps_systemFontWithFixedSize:17.0];
    [(UILabel *)self->_vioHintLabel setFont:v8];

    __int16 v9 = +[NSBundle mainBundle];
    BOOL v10 = [v9 localizedStringForKey:@"Walking_Navigation_Hint_Enhanced_Accuracy_On" value:@"localized string not found" table:0];
    [(UILabel *)self->_vioHintLabel setText:v10];

    LODWORD(v11) = 1148846080;
    [(UILabel *)self->_vioHintLabel setContentCompressionResistancePriority:1 forAxis:v11];
    vioHintLabel = self->_vioHintLabel;
  }

  return vioHintLabel;
}

- (RouteStepListDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    id v4 = [RouteStepListDataSource alloc];
    double v5 = [(NavSignListViewController *)self traitCollection];
    double v6 = [(RouteStepListDataSource *)v4 initWithTraitCollection:v5 options:8 metrics:self->_metrics context:1];
    int v7 = self->_dataSource;
    self->_dataSource = v6;

    [(RouteStepListDataSource *)self->_dataSource setDelegate:self];
    id v8 = [(NavSignListViewController *)self route];
    [(RouteStepListDataSource *)self->_dataSource setRoute:v8];

    [(RouteStepListDataSource *)self->_dataSource setActiveStepIndex:[(NavSignListViewController *)self activeStepIndex]];
    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (BOOL)hasElevationGraph
{
  v2 = [(DirectionsElevationGraphView *)self->_graphView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setLayoutProgress:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (vabdd_f64(self->_layoutProgress, v3) > 2.22044605e-16)
  {
    self->_layoutProgress = v3;
    [(NavSignListViewController *)self _applyCornerMask];
  }
}

- (void)setSelectedStepIndex:(unint64_t)a3
{
  if (self->_selectedStepIndex != a3)
  {
    double v5 = sub_100467248();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349312;
      __int16 v9 = self;
      __int16 v10 = 2048;
      unint64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating selected step index: %lu", (uint8_t *)&v8, 0x16u);
    }

    double v6 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self willChangeValueForKey:v6];

    self->_selectedStepIndex = a3;
    int v7 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self didChangeValueForKey:v7];
  }
}

- (void)setActiveStepIndex:(unint64_t)a3
{
  if (self->_activeStepIndex != a3)
  {
    double v5 = sub_100467248();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 134349312;
      unint64_t v11 = self;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating active step index: %lu", (uint8_t *)&v10, 0x16u);
    }

    unint64_t selectedStepIndex = self->_selectedStepIndex;
    int v7 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self willChangeValueForKey:v7];

    self->_unint64_t selectedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_activeStepIndex = a3;
    [(RouteStepListDataSource *)self->_dataSource setActiveStepIndex:a3];
    int v8 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self didChangeValueForKey:v8];

    if (selectedStepIndex != self->_selectedStepIndex)
    {
      __int16 v9 = [(NavSignListViewController *)self signDelegate];
      [v9 selectStep:0];
    }
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  id v4 = [(MUBlurView *)self->_backgroundView layer];
  [v4 setCornerRadius:a3];
}

- (void)setCornerMask:(unint64_t)a3
{
  if (self->_cornerMask != a3)
  {
    self->_cornerMask = a3;
    [(NavSignListViewController *)self _applyCornerMask];
  }
}

- (void)_applyCornerMask
{
  unint64_t cornerMask = self->_cornerMask;
  unint64_t v4 = cornerMask;
  if ([(NavSignListViewController *)self hasElevationGraph])
  {
    [(NavSignListViewController *)self layoutProgress];
    if (v5 > 0.01) {
      unint64_t v4 = cornerMask & 0xFFFFFFFFFFFFFFFDLL;
    }
    else {
      unint64_t v4 = cornerMask;
    }
  }
  double v6 = [(MUBlurView *)self->_backgroundView layer];
  [v6 setMaskedCorners:v4];

  id v7 = [(MUBlurView *)self->_graphBackgroundView layer];
  [v7 setMaskedCorners:cornerMask & 3];
}

- (void)setConnectedToCarPlay:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_connectedToCarPlay == a3) {
    return;
  }
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_connectedToCarPlay = a3;
  id v7 = sub_100467248();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    id v16 = self;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] setConnectedToCarPlay: %d", buf, 0x12u);
  }

  if (v5)
  {
    if (!self->_expanded) {
      goto LABEL_8;
    }
  }
  else if (self->_expanded)
  {
LABEL_8:
    [(NavSignListViewController *)self toggleExpansionAnimated:v4];
  }
  double v8 = 0.0;
  uint64_t v10 = 3221225472;
  __int16 v9 = _NSConcreteStackBlock;
  unint64_t v11 = sub_10046A064;
  __int16 v12 = &unk_1012E6300;
  if (v4) {
    double v8 = 0.25;
  }
  unint64_t v13 = self;
  BOOL v14 = v5;
  +[UIView animateWithDuration:&v9 animations:v8];
  [(NavSignListViewController *)self setDebugViewControllerEnabled:[(NavSignListViewController *)self _shouldShowDebugViewController]];
}

- (double)_collapsedSignHeight
{
  double v3 = [(NavSignListViewController *)self dataSource];
  BOOL v4 = [v3 items];
  id v5 = [v4 count];

  if (v5)
  {
    double v6 = [(NavSignListViewController *)self _displayIndexPath];
    id v7 = [(NavSignListViewController *)self collectionView];
    [(NavSignListViewController *)self collectionView:v7 layout:0 sizeForItemAtIndexPath:v6];
    double height = v8;
  }
  else
  {
    double height = CGSizeZero.height;
  }
  [(RouteStepListMetrics *)self->_metrics textBottomMargin];
  double v11 = v10;
  if (self->_vioHintLabelVisible) {
    [(UILabel *)self->_vioHintLabel frame];
  }
  else {
    double v12 = 0.0;
  }
  return height - v11 + v12;
}

- (double)collapsedHeight
{
  [(NavSignListViewController *)self _collapsedSignHeight];
  double v4 = v3;
  id v5 = [(NavSignListViewController *)self footerView];
  [v5 minimumHeight];
  double v7 = v4 + v6;

  return v7;
}

- (double)_lastSignHeight
{
  double v3 = [(NavSignListViewController *)self dataSource];
  double v4 = [v3 items];
  id v5 = [v4 count];

  if (!v5) {
    return CGSizeZero.height;
  }
  if (self->_isRerouting)
  {
    double v6 = 0;
  }
  else
  {
    double v8 = [(NavSignListViewController *)self dataSource];
    __int16 v9 = [v8 items];
    double v6 = (char *)[v9 count] - 1;
  }
  double v10 = +[NSIndexPath indexPathForRow:v6 inSection:0];
  double v11 = [(NavSignListViewController *)self collectionView];
  [(NavSignListViewController *)self collectionView:v11 layout:0 sizeForItemAtIndexPath:v10];
  double v7 = v12;

  return v7;
}

- (double)footerBottomPosition
{
  double v3 = [(DirectionsElevationGraphView *)self->_graphView superview];

  if (v3)
  {
    [(NavSignListViewController *)self _graphTopPosition];
    double v5 = v4 + 92.0;
  }
  else
  {
    double v5 = 0.0;
  }
  [(NSLayoutConstraint *)self->_containerViewHeightConstraint constant];
  double v7 = v5 + v6;
  double v8 = [(NavSignListViewController *)self footerView];
  [v8 currentHeight];
  double v10 = v7 + v9;

  return v10;
}

- (void)setLaneGuidanceActive:(BOOL)a3
{
  if (self->_laneGuidanceActive != a3)
  {
    self->_laneGuidanceActive = a3;
    [(NavSignListViewController *)self _updateLaneGuidancePositioning];
  }
}

- (unint64_t)_displayStepIndex
{
  if (self->_isRerouting) {
    return 0;
  }
  unint64_t selectedStepIndex = self->_selectedStepIndex;
  if (selectedStepIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return self->_activeStepIndex;
  }
  return selectedStepIndex;
}

- (id)_displayIndexPath
{
  if (self->_isRerouting) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = [(NavSignListViewController *)self _displayStepIndex];
  }
  double v3 = +[NSIndexPath indexPathForRow:v2 inSection:0];

  return v3;
}

- (void)updateFooterConstraints
{
  if (self->_expanded)
  {
    id v7 = [(NavSignListViewController *)self signDelegate];
    [v7 signListHeight];
    double v4 = v3;
    double v5 = [(NavSignListViewController *)self footerView];
    [v5 currentHeight];
    [(NSLayoutConstraint *)self->_containerViewHeightConstraint setConstant:v4 - v6];
  }
}

- (void)clearSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NavSignListViewController *)self setSelectedStepIndex:0x7FFFFFFFFFFFFFFFLL];

  [(NavSignListViewController *)self _updateActiveStepIndexAnimated:v3];
}

- (void)clearDragState
{
  if ([(NavSignListViewController *)self isDragging])
  {
    BOOL v3 = sub_100467248();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 134349056;
      double v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "[%{public}p] Drag state was leaked as true! Removing...", (uint8_t *)&v4, 0xCu);
    }

    [(NavSignListViewController *)self setDragging:0];
  }
}

- (void)clearPartialExpansionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NavSignListViewController *)self isDragging])
  {
    [(NavSignListViewController *)self layoutProgress];
    double v6 = v5;
    BOOL v8 = fabs(v5) > 2.22044605e-16;
    double v7 = fabs(v5 + -1.0);
    BOOL v8 = v8 && v7 > 2.22044605e-16;
    if (v8)
    {
      double v9 = sub_100467248();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v6 <= 0.5)
      {
        double v11 = 0.0;
        if (v10)
        {
          *(_DWORD *)buf = 134349056;
          id v20 = self;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Clearing partial expansion by force collapsing the list", buf, 0xCu);
        }
        BOOL v12 = 0;
      }
      else
      {
        double v11 = 1.0;
        if (v10)
        {
          *(_DWORD *)buf = 134349056;
          id v20 = self;
          BOOL v12 = 1;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Clearing partial expansion by forcing full expansion", buf, 0xCu);
        }
        else
        {
          BOOL v12 = 1;
        }
      }

      self->_BOOL expanded = v12;
      [(NavSignListViewController *)self setLayoutProgress:v11];
      double v13 = 1.0 - v6;
      if (v6 <= 0.5) {
        double v13 = v6;
      }
      double v14 = v13 * 0.25;
      if (v3) {
        double v15 = v14;
      }
      else {
        double v15 = 0.0;
      }
      id v16 = [(NavSignListViewController *)self signDelegate];
      [v16 signListHeightWillChangeAnimated:v3];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10046A804;
      v17[3] = &unk_1012E6300;
      v17[4] = self;
      BOOL v18 = v3;
      [(NavSignListViewController *)self _updateLayoutProgressWithDuration:v17 completion:v15];
    }
  }
}

- (void)_updateCollectionViewBottomInset
{
  BOOL v3 = [(NavSignListViewController *)self viewIfLoaded];
  int v4 = [v3 window];

  if (v4)
  {
    double v5 = [(NavSignListViewController *)self collectionView];
    [v5 contentInset];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    BOOL v12 = [(NavSignListViewController *)self collectionView];
    [v12 frame];
    double Height = CGRectGetHeight(v18);
    [(NavSignListViewController *)self _lastSignHeight];
    double v15 = Height - v14;

    id v16 = [(NavSignListViewController *)self collectionView];
    [v16 setContentInset:v7, v9, v15, v11];
  }
}

- (void)cell:(id)a3 setPressed:(BOOL)a4
{
  id v6 = a3;
  if (GEOConfigGetBOOL() && self->_expanded)
  {
    if (a4)
    {
      [v6 setSelectedWithLayoutProgress:1.0];
      double v7 = [(NavSignListViewController *)self collectionView];
      double v8 = [v7 indexPathForCell:v6];

      if (v8)
      {
        id v9 = [v8 row];
        if (v9 != (id)[(NavSignListViewController *)self activeStepIndex])
        {
          double v10 = self;
          uint64_t v11 = (uint64_t)v9;
LABEL_14:
          [(NavSignListViewController *)v10 setSelectedStepIndex:v11];

          goto LABEL_15;
        }
      }
      else
      {
        double v14 = sub_100467248();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 134349314;
          id v16 = self;
          __int16 v17 = 2112;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}p] Selected cell: %@ but no indexPath available", (uint8_t *)&v15, 0x16u);
        }
      }
      double v10 = self;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
    id v12 = [v6 state];
    double v13 = 0.0;
    if (v12 == (id)1) {
      double v13 = 1.0;
    }
    [v6 setSelectedWithLayoutProgress:v13];
    [(NavSignListViewController *)self setSelectedStepIndex:0x7FFFFFFFFFFFFFFFLL];
  }
LABEL_15:
}

- (void)reloadDataSource:(id)a3
{
  int v4 = NSStringFromSelector("collapsedHeight");
  [(NavSignListViewController *)self willChangeValueForKey:v4];

  double v5 = [(NavSignListViewController *)self dataSource];
  id v6 = +[MNNavigationService sharedService];
  id v7 = [v5 itemIndexForStepIndex:[v6 stepIndex]];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = (unint64_t)v7;
  }
  self->_activeStepIndex = v8;
  [(NavSignListViewController *)self _reapplySignCountdown];
  id v9 = [(NavSignListViewController *)self collectionView];
  [v9 reloadData];

  [(RouteStepListDataSource *)self->_dataSource setActiveStepIndex:self->_activeStepIndex];
  double v10 = NSStringFromSelector("collapsedHeight");
  [(NavSignListViewController *)self didChangeValueForKey:v10];

  [(NavSignListViewController *)self _updateActiveStepIndexAnimated:0];
}

- (void)reloadUIForDataSource:(id)a3
{
  int v4 = NSStringFromSelector("collapsedHeight");
  [(NavSignListViewController *)self willChangeValueForKey:v4];

  [(NavSignListViewController *)self _reapplySignCountdown];
  double v5 = [(NavSignListViewController *)self collectionView];
  [v5 reloadData];

  id v6 = NSStringFromSelector("collapsedHeight");
  [(NavSignListViewController *)self didChangeValueForKey:v6];

  [(NavSignListViewController *)self _updateActiveStepIndexAnimated:0];
}

- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4
{
  if (!self->_isRerouting)
  {
    id v5 = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10046AD9C;
    v8[3] = &unk_1012EB2B8;
    id v9 = (id)objc_opt_new();
    id v6 = v9;
    [v5 enumerateIndexesUsingBlock:v8];

    id v7 = [(NavSignListViewController *)self collectionView];
    [v7 reloadItemsAtIndexPaths:v6];
  }
}

- (void)_reapplySignCountdown
{
  unint64_t activeStepIndex = self->_activeStepIndex;
  int v4 = [(RouteStepListDataSource *)self->_dataSource items];
  id v5 = [v4 count];

  if (activeStepIndex < (unint64_t)v5)
  {
    if (![(NavSignListViewController *)self isLaneGuidanceActive]
      || (p_latestSignGuidance = &self->_latestLaneInfo,
          [(MNGuidanceLaneInfo *)self->_latestLaneInfo isForManeuver]))
    {
      p_latestSignGuidance = &self->_latestSignGuidance;
    }
    id v9 = *p_latestSignGuidance;
    id v7 = [(RouteStepListDataSource *)self->_dataSource items];
    unint64_t v8 = [v7 objectAtIndexedSubscript:activeStepIndex];
    [v8 setUserInfo:v9];
  }
}

- (Class)cellClassForItemType:(unint64_t)a3
{
  if (a3 == 1)
  {
    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }
  return (Class)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_isRerouting) {
    return 1;
  }
  id v5 = [(NavSignListViewController *)self dataSource];
  id v6 = [v5 items];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  if (self->_isRerouting)
  {
    id v6 = a4;
    id v7 = a3;
    unint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

    [v10 startAnimating];
    [(NavSignListViewController *)self layoutProgress];
    [v10 setSelectedWithLayoutProgress:];
  }
  else
  {
    id v11 = a4;
    id v12 = a3;
    id v13 = [v11 row];
    double v14 = [(NavSignListViewController *)self dataSource];
    int v15 = [v14 items];
    id v16 = [v15 objectAtIndexedSubscript:v13];

    __int16 v17 = NSStringFromClass((Class)[v16 cellClass]);
    id v18 = [v12 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v11];

    [v16 setShowsHairline:[self _showsHairlineForItemIndex:v13]];
    [v18 setItem:v16];
    if ([(NavSignListViewController *)self isLaneGuidanceActive]) {
      BOOL v19 = v13 == (id)[(NavSignListViewController *)self activeStepIndex];
    }
    else {
      BOOL v19 = 0;
    }
    [v18 setHideManeuverArrow:v19];
    unint64_t v20 = [(NavSignListViewController *)self _stateForItemIndex:v13];
    [(NavSignListViewController *)self layoutProgress];
    [v18 setState:v20];
    [v18 setDelegate:self];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10046B20C;
    v22[3] = &unk_1012E5D08;
    id v10 = v18;
    id v23 = v10;
    +[UIView performWithoutAnimation:v22];
  }

  return v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 row];
    id v10 = [(NavSignListViewController *)self dataSource];
    id v11 = [v10 items];
    id v12 = [v11 objectAtIndexedSubscript:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10046B34C;
    v14[3] = &unk_1012EB038;
    id v15 = v12;
    id v16 = self;
    id v17 = v7;
    id v18 = v9;
    id v13 = v12;
    +[UIView performWithoutAnimation:v14];
  }
}

- (BOOL)_showsHairlineForItemIndex:(unint64_t)a3
{
  BOOL v5 = [(NavSignListViewController *)self activeStepIndex] > a3;
  return (char *)[(NavSignListViewController *)self activeStepIndex] - v5 != (unsigned char *)a3;
}

- (unint64_t)_stateForItemIndex:(unint64_t)a3
{
  if ([(NavSignListViewController *)self activeStepIndex] > a3) {
    return 0;
  }
  if ([(NavSignListViewController *)self activeStepIndex] == a3) {
    return 1;
  }
  return 2;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  computedWidth = self->_computedWidth;
  if (computedWidth)
  {
    [(NSNumber *)computedWidth cgFloatValue];
    double cardWidth = v12;
  }
  else
  {
    double cardWidth = self->_cardWidth;
  }
  if (self->_isRerouting)
  {
    double v14 = 96.0;
  }
  else
  {
    id v15 = [(NavSignListViewController *)self dataSource];
    id v16 = [v15 items];
    id v17 = [v16 objectAtIndexedSubscript:[v10 row]];

    id v18 = [v17 cellClass];
    if (sub_100C58A2C()) {
      double v19 = 160.0;
    }
    else {
      double v19 = 200.0;
    }
    [v18 heightForItem:v17 width:cardWidth maximumHeight:v19];
    double v21 = v20;
    if (sub_100C58A2C()) {
      double v22 = 160.0;
    }
    else {
      double v22 = 200.0;
    }
    if (v21 >= v22)
    {
      if (sub_100C58A2C()) {
        double v14 = 160.0;
      }
      else {
        double v14 = 200.0;
      }
    }
    else
    {
      id v23 = [v17 cellClass];
      int v24 = sub_100C58A2C();
      double v25 = 160.0;
      if (!v24) {
        double v25 = 200.0;
      }
      [v23 heightForItem:v17 width:cardWidth maximumHeight:v25];
      double v14 = v26;
    }
  }
  double v27 = cardWidth;
  double v28 = v14;
  result.double height = v28;
  result.width = v27;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  int v4 = [(NavSignListViewController *)self view];
  BOOL v5 = [v4 window];
  [v5 safeAreaInsets];
  double v6 = 20.0;
  if (v7 <= 20.0)
  {
    id v8 = [(NavSignListViewController *)self view];
    id v9 = [v8 window];
    [v9 safeAreaInsets];
    double v6 = v10;
  }
  id v11 = [(NavSignListViewController *)self collectionView];
  [v11 contentOffset];
  double v13 = v12;

  id v21 = +[NSIndexPath indexPathForItem:[(NavSignListViewController *)self activeStepIndex] inSection:0];
  double v14 = [(NavSignListViewController *)self collectionView];
  id v15 = [v14 cellForItemAtIndexPath:v21];

  double v16 = 0.0;
  if (v15)
  {
    [v15 frame];
    if (v13 >= v17 - v6)
    {
      if (v13 >= v17)
      {
        double v19 = v17 + v18;
        double v16 = 1.0;
        if (v13 >= v17 + v18)
        {
          double v16 = 0.0;
          if (v13 < v19 + 20.0) {
            double v16 = (v13 - v19) / -20.0 + 1.0;
          }
        }
      }
      else
      {
        double v16 = (v13 - (v17 - v6)) / v6;
      }
    }
  }
  self->_activeStepFadeIn = v16;
  double v20 = [(NavSignListViewController *)self signDelegate];
  [v20 signListDidScroll];
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100467248();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v36 = 134349314;
    v37 = self;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Got an updated sign info: %@", (uint8_t *)&v36, 0x16u);
  }

  objc_storeStrong((id *)&self->_latestSignGuidance, a4);
  id v9 = [(NavSignListViewController *)self dataSource];
  double v10 = [v9 items];
  id v11 = [v10 count];

  if (!v11)
  {
    id v21 = [v6 route];
    double v26 = [(NavSignListViewController *)self route];
    unsigned int v27 = [v6 navigationState];
    double v28 = sub_100467248();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
    if (!v26 && v21 && v27 == 2)
    {
      if (v29)
      {
        int v36 = 134349056;
        v37 = self;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Our data source is empty; attempting to recover",
          (uint8_t *)&v36,
          0xCu);
      }

      [(NavSignListViewController *)self _handleNewRoute:v21];
    }
    else
    {
      if (v29)
      {
        int v36 = 134349056;
        v37 = self;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Our data source is empty; ignoring sign info update",
          (uint8_t *)&v36,
          0xCu);
      }
    }
    goto LABEL_26;
  }
  unint64_t v12 = [(NavSignListViewController *)self activeStepIndex];
  double v13 = [(NavSignListViewController *)self dataSource];
  double v14 = [v13 items];
  id v15 = [v14 count];

  if (v12 < (unint64_t)v15)
  {
    double v16 = [(NavSignListViewController *)self dataSource];
    id v17 = [v16 itemIndexForStepIndex:[v7 stepIndex]];

    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v17 = 0;
    }
    unint64_t v18 = [(NavSignListViewController *)self activeStepIndex];
    [(NavSignListViewController *)self setActiveStepIndex:v17];
    double v19 = [(NavSignListViewController *)self dataSource];
    double v20 = [v19 items];
    id v21 = [v20 objectAtIndexedSubscript:v17];

    double v22 = sub_100467248();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v21 userInfo];
      int v36 = 134349314;
      v37 = self;
      __int16 v38 = 2112;
      unint64_t v39 = (unint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Existing item user info: %@", (uint8_t *)&v36, 0x16u);
    }
    int v24 = [v21 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      [v21 setUserInfo:v7];
      [v21 setState:2];
      [(NavSignListViewController *)self _processSignUpdate];
    }
    if ((id)v18 == v17)
    {
      if (self->_expanded || self->_layoutProgress > 0.0)
      {
        double v26 = [(NavSignListViewController *)self collectionView];
        [(NavSignListViewController *)self scrollViewDidScroll:v26];
LABEL_26:

        goto LABEL_29;
      }
      v34 = self;
      uint64_t v35 = 0;
    }
    else
    {
      v34 = self;
      uint64_t v35 = 1;
    }
    [(NavSignListViewController *)v34 _updateActiveStepIndexAnimated:v35];
    goto LABEL_29;
  }
  id v21 = sub_100467248();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    unint64_t v30 = [(NavSignListViewController *)self activeStepIndex];
    v31 = [(NavSignListViewController *)self dataSource];
    __int16 v32 = [v31 items];
    id v33 = [v32 count];
    int v36 = 134349568;
    v37 = self;
    __int16 v38 = 2048;
    unint64_t v39 = v30;
    __int16 v40 = 2048;
    id v41 = v33;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] The active step index (%lu) is larger than our data source items (%lu); ignoring sign info update",
      (uint8_t *)&v36,
      0x20u);
  }
LABEL_29:
}

- (void)_processSignUpdate
{
  unint64_t v3 = [(NavSignListViewController *)self activeStepIndex];
  int v4 = +[NSIndexPath indexPathForItem:v3 inSection:0];
  BOOL v5 = [(NavSignListViewController *)self collectionView];
  id v6 = [v5 cellForItemAtIndexPath:v4];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = sub_100467248();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (isKindOfClass)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134349314;
      double v22 = self;
      __int16 v23 = 2112;
      unint64_t v24 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating cell content: %@", buf, 0x16u);
    }

    [v6 redrawContent];
    double v10 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self willChangeValueForKey:v10];

    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10046BF1C;
    unint64_t v18 = &unk_1012E5D58;
    double v19 = self;
    id v20 = v4;
    +[UIView performWithoutAnimation:&v15];
    id v11 = NSStringFromSelector("collapsedHeight");
    -[NavSignListViewController didChangeValueForKey:](self, "didChangeValueForKey:", v11, v15, v16, v17, v18, v19);

    unint64_t v12 = [(NavSignListViewController *)self dataSource];
    double v13 = [v12 items];
    double v14 = (char *)[v13 count] - 1;

    if ((char *)v3 == v14) {
      [(NavSignListViewController *)self _updateCollectionViewBottomInset];
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134349312;
      double v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = [(NavSignListViewController *)self activeStepIndex];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Cell for active step index (%lu) is not a nav sign maneuver cell; ignoring sign update",
        buf,
        0x16u);
    }
  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  BOOL v9 = [(NavSignListViewController *)self route];
  unsigned int v10 = [v9 isWalkingOnlyTransitRoute];

  if (v10)
  {
    id v11 = [(NavSignListViewController *)self dataSource];
    unint64_t v12 = [v11 items];
    id v13 = [v12 count];

    if (!v13)
    {
      id v20 = sub_100467248();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v29 = 134349056;
        unint64_t v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Our data source is empty; ignoring distance info update",
          (uint8_t *)&v29,
          0xCu);
      }
      goto LABEL_18;
    }
    double v14 = [(NavSignListViewController *)self dataSource];
    id v15 = [v14 itemIndexForStepIndex:a6];

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v16 = 0;
    }
    else {
      id v16 = v15;
    }
    unint64_t v17 = [(NavSignListViewController *)self activeStepIndex];
    [(NavSignListViewController *)self setActiveStepIndex:v16];
    unint64_t v18 = [(NavSignListViewController *)self dataSource];
    double v19 = [v18 items];
    id v20 = [v19 objectAtIndexedSubscript:v16];

    id v21 = sub_100467248();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      double v22 = [v20 userInfo];
      int v29 = 134349314;
      unint64_t v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Existing item user info: %@", (uint8_t *)&v29, 0x16u);
    }
    __int16 v23 = [v20 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v25 = +[NSNumber numberWithDouble:a4];
      [v20 setUserInfo:v25];

      [v20 setState:2];
      [(NavSignListViewController *)self _processSignUpdate];
    }
    if ((id)v17 == v16)
    {
      if (self->_expanded || self->_layoutProgress > 0.0)
      {
        double v26 = [(NavSignListViewController *)self collectionView];
        [(NavSignListViewController *)self scrollViewDidScroll:v26];

LABEL_18:
        return;
      }
      unsigned int v27 = self;
      uint64_t v28 = 0;
    }
    else
    {
      unsigned int v27 = self;
      uint64_t v28 = 1;
    }
    [(NavSignListViewController *)v27 _updateActiveStepIndexAnimated:v28];
    goto LABEL_18;
  }
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v15 = a5;
  id v7 = [(NavSignListViewController *)self route];
  [v7 distance];
  double v9 = v8;
  [v15 distanceRemainingToEndOfLeg];
  if (v9 - v10 < 0.0)
  {
    [(DirectionsElevationGraphView *)self->_graphView setNavigationProgress:0.0];
  }
  else
  {
    id v11 = [(NavSignListViewController *)self route];
    [v11 distance];
    double v13 = v12;
    [v15 distanceRemainingToEndOfLeg];
    [(DirectionsElevationGraphView *)self->_graphView setNavigationProgress:v13 - v14];
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v32 = a4;
  BOOL v5 = [v32 titles];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = v32;
  }
  else
  {
    id v31 = objc_alloc((Class)MNGuidanceLaneInfo);
    uint64_t v8 = [v32 uniqueID];
    id v9 = [v32 isForManeuver];
    double v10 = [v32 lanes];
    id v11 = [(MNGuidanceSignInfo *)self->_latestSignGuidance primarySign];
    double v12 = [v11 titles];
    double v13 = [v32 instructions];
    double v14 = [v32 variableOverrides];
    id v15 = [v32 distanceDetailLevel];
    LODWORD(v30) = [v32 composedGuidanceEventIndex];
    id v29 = v15;
    id v16 = (void *)v8;
    id v17 = [v31 initWithID:v8 isForManeuver:v9 lanes:v10 titles:v12 instructions:v13 variableOverrides:v14 distanceDetailLevel:v29 composedGuidanceEventIndex:v30];

    unint64_t v18 = [(MNGuidanceSignInfo *)self->_latestSignGuidance primarySign];
    double v19 = [v18 primaryStrings];
    [v17 setPrimaryStrings:v19];

    id v7 = v17;
  }
  id v33 = v7;
  objc_storeStrong((id *)&self->_latestLaneInfo, v7);
  [(NavSignListViewController *)self setLaneGuidanceActive:1];
  unint64_t v20 = [(NavSignListViewController *)self activeStepIndex];
  id v21 = [(NavSignListViewController *)self dataSource];
  double v22 = [v21 items];
  if (v20 >= (unint64_t)[v22 count])
  {
    double v25 = 0;
  }
  else
  {
    __int16 v23 = [(NavSignListViewController *)self dataSource];
    unint64_t v24 = [v23 items];
    double v25 = [v24 objectAtIndexedSubscript:v20];
  }
  double v26 = [v25 userInfo];
  if ([v33 isForManeuver]
    && (latestSignGuidance = self->_latestSignGuidance, v26 != latestSignGuidance)
    || ([v33 isForManeuver] & 1) == 0
    && (unsigned __int8 v28 = [v33 isEqual:v26],
        latestSignGuidance = (MNGuidanceSignInfo *)v33,
        (v28 & 1) == 0))
  {
    [v25 setUserInfo:latestSignGuidance];
  }
  [(NavSignListViewController *)self _processSignUpdate];
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  unint64_t v5 = (unint64_t)a4;
  [(NavSignListViewController *)self setLaneGuidanceActive:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v26 = self;
  id v6 = [(NavSignListViewController *)self dataSource];
  id v7 = [v6 items];

  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v13 = [v12 userInfo];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v15 = [v12 userInfo];
          unint64_t v16 = [v15 uniqueID];
          id v17 = (id)v5;
          if (!(v5 | v16)
            || (unint64_t v18 = v17,
                unsigned int v19 = [(id)v16 isEqual:v17],
                v18,
                (id)v16,
                (id)v16,
                v19))
          {
            [v12 setUserInfo:0];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  id v20 = [(NavSignListViewController *)v26 activeStepIndex];
  id v21 = [(NavSignListViewController *)v26 dataSource];
  double v22 = [v21 items];
  if (v20 >= [v22 count])
  {
    double v25 = 0;
  }
  else
  {
    __int16 v23 = [(NavSignListViewController *)v26 dataSource];
    unint64_t v24 = [v23 items];
    double v25 = [v24 objectAtIndexedSubscript:v20];
  }
  [v25 setUserInfo:v26->_latestSignGuidance];
  [(NavSignListViewController *)v26 _processSignUpdate];
}

- (void)navigationServiceWillReroute:(id)a3
{
  if ([a3 arrivalState] == (id)1)
  {
    int v4 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self willChangeValueForKey:v4];

    self->_isRerouting = 1;
    unint64_t v5 = [(NavSignListViewController *)self collectionView];
    [v5 reloadData];

    [(NavSignListViewController *)self _updateActiveStepIndexAnimated:1];
    id v6 = NSStringFromSelector("collapsedHeight");
    [(NavSignListViewController *)self didChangeValueForKey:v6];

    [(NavSignListViewController *)self _updateCollectionViewBottomInset];
  }
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
}

- (void)_cancelReroute
{
  unint64_t v3 = NSStringFromSelector("collapsedHeight");
  [(NavSignListViewController *)self willChangeValueForKey:v3];

  self->_isRerouting = 0;
  int v4 = [(NavSignListViewController *)self collectionView];
  [v4 reloadData];

  [(NavSignListViewController *)self _updateActiveStepIndexAnimated:0];
  unint64_t v5 = NSStringFromSelector("collapsedHeight");
  [(NavSignListViewController *)self didChangeValueForKey:v5];

  [(NavSignListViewController *)self _updateCollectionViewBottomInset];
}

- (void)_handleNewRoute:(id)a3
{
  self->_isRerouting = 0;
  self->_unint64_t selectedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(NavSignListViewController *)self _updateRoute:a3];

  [(NavSignListViewController *)self _updateCollectionViewBottomInset];
}

- (void)_updateRoute:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = v4;
    id v6 = sub_100467248();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 uniqueRouteID];
      int v16 = 134349314;
      id v17 = self;
      __int16 v18 = 2112;
      unsigned int v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating route (%@) from navigation callback", (uint8_t *)&v16, 0x16u);
    }
    [(NavSignListViewController *)self setRoute:v5];
  }
  else
  {
    id v8 = +[MNNavigationService sharedService];
    id v9 = +[MNNavigationService sharedService];
    unint64_t v5 = [v9 route];

    [v8 state];
    int IsNavigating = MNNavigationServiceStateIsNavigating();
    id v11 = sub_100467248();
    double v12 = v11;
    if (IsNavigating) {
      BOOL v13 = v5 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 134349056;
        id v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}p] Skipped updating route from navigation service", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v15 = [v5 uniqueRouteID];
        int v16 = 134349314;
        id v17 = self;
        __int16 v18 = 2112;
        unsigned int v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Updating route (%@) from navigation service", (uint8_t *)&v16, 0x16u);
      }
      [(NavSignListViewController *)self setRoute:v5];
    }
  }
}

- (void)_updateActiveStepIndexAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NavSignListViewController *)self dataSource];
  id v6 = [v5 items];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"MapsPPTGuidanceWillUpdateNotifcation" object:0];

    id v9 = [(NavSignListViewController *)self view];
    uint64_t v10 = [v9 superview];
    [v10 layoutIfNeeded];

    id v11 = [(NavSignListViewController *)self _displayIndexPath];
    if (v3) {
      double v12 = 0.25;
    }
    else {
      double v12 = 0.0;
    }
    void v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10046CE44;
    v15[3] = &unk_1012E5D58;
    void v15[4] = self;
    id v16 = v11;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10046CF74;
    v14[3] = &unk_1012E7D28;
    id v13 = v11;
    +[UIView animateWithDuration:v15 animations:v14 completion:v12];
  }
}

- (void)_updateLayoutProgressWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(NavSignListViewController *)self view];
  id v8 = [v7 superview];
  [v8 layoutIfNeeded];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10046D0F4;
  v12[3] = &unk_1012E5D08;
  v12[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10046D164;
  v10[3] = &unk_1012EB2E0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  +[UIView animateWithDuration:v12 animations:v10 completion:a3];
}

- (void)_updateLaneGuidancePositioning
{
  BOOL v3 = [(NavSignListViewController *)self view];
  id v4 = [v3 superview];
  [v4 layoutIfNeeded];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10046D298;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  +[UIView animateWithDuration:v5 animations:0.3];
}

- (void)updateHeightConstraints
{
  [(NavSignListViewController *)self layoutProgress];
  double v4 = v3;
  unint64_t v5 = [(NavSignListViewController *)self footerView];
  [v5 setLayoutProgress:v4];

  id v6 = [(NavSignListViewController *)self footerView];
  [v6 currentHeight];
  double v8 = v7;

  [(NSLayoutConstraint *)self->_footerHeightConstraint setConstant:v8];
  [(NavSignListViewController *)self _updateGraphContainerTop];
  id v9 = [(DirectionsElevationGraphView *)self->_graphView superview];
  if (v9) {
    double v10 = 92.0;
  }
  else {
    double v10 = 0.0;
  }

  [(NavSignListViewController *)self _collapsedSignHeight];
  double v12 = v11;
  [(NavSignListViewController *)self _signContainerAvailableHeight];
  double v14 = v13 - v10;
  [(NavSignListViewController *)self layoutProgress];
  double v16 = v12 + v14 * v15;
  [(NSLayoutConstraint *)self->_containerViewHeightConstraint setConstant:v16];
  [(NSLayoutConstraint *)self->_gradientViewTopConstraint setConstant:v12];
  id v17 = [(NavSignListViewController *)self signDelegate];
  [v17 setSignListHeight:v8 + v16];

  if (self->_expanded)
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    footerView = self->_footerView;
  }
  else
  {
    footerView = self->_footerView;
    double top = -30.0;
    double left = 0.0;
    double bottom = 0.0;
    double right = 0.0;
  }
  -[NavSignFooterView _setTouchInsets:](footerView, "_setTouchInsets:", top, left, bottom, right);
  [(NavSignListViewController *)self _updateCurrentManeuverBackground];

  [(NavSignListViewController *)self _updateCollectionViewBottomInset];
}

- (void)_cleanupStepCountdowns
{
  double v3 = [(NavSignListViewController *)self dataSource];
  double v4 = [v3 items];

  unint64_t v5 = [(NavSignListViewController *)self activeStepIndex];
  id v6 = objc_opt_new();
  if ([v4 count])
  {
    unint64_t v7 = 0;
    do
    {
      double v8 = [v4 objectAtIndexedSubscript:v7];
      id v9 = v8;
      if (v5 != v7)
      {
        double v10 = [v8 userInfo];

        if (v10)
        {
          double v11 = +[NSIndexPath indexPathForItem:v7 inSection:0];
          [v6 addObject:v11];

          [v9 setUserInfo:0];
        }
      }

      ++v7;
    }
    while (v7 < (unint64_t)[v4 count]);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      double v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v16);
        __int16 v18 = [(NavSignListViewController *)self collectionView];
        unsigned int v19 = [v18 cellForItemAtIndexPath:v17];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v19 redrawContent];
        }

        double v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)_updateSelectionBackgrounds
{
  double v3 = +[NSIndexPath indexPathForRow:[(NavSignListViewController *)self activeStepIndex] inSection:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = [(NavSignListViewController *)self collectionView];
  unint64_t v5 = [v4 indexPathsForVisibleItems];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [(NavSignListViewController *)self collectionView];
        id v12 = [v11 cellForItemAtIndexPath:v10];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v13 = [v3 isEqual:v10];
          double v14 = 0.0;
          if (v13) {
            [(NavSignListViewController *)self layoutProgress];
          }
          [v12 setSelectedWithLayoutProgress:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_updateGraphViewIfNeeded
{
  double v3 = [(NavSignListViewController *)self route];
  double v4 = [v3 elevationProfile];

  unint64_t v5 = [(DirectionsElevationGraphView *)self->_graphView superview];
  id v6 = v5;
  if (v4)
  {

    if (v6) {
      return;
    }
    [(NavSignListViewController *)self _insertGraphView];
  }
  else
  {

    if (!v6) {
      return;
    }
    [(DirectionsElevationGraphView *)self->_graphView removeFromSuperview];
    graphView = self->_graphView;
    self->_graphView = 0;

    [(NavSignListViewController *)self _updateGraphContainerTop];
  }

  [(NavSignListViewController *)self _applyCornerMask];
}

- (void)_updateGraphContainerTop
{
  double v3 = [(DirectionsElevationGraphView *)self->_graphView superview];

  graphContainerView = self->_graphContainerView;
  if (v3)
  {
    [(UIView *)graphContainerView setAlpha:1.0];
    [(NavSignListViewController *)self _graphTopPosition];
  }
  else
  {
    [(UIView *)graphContainerView setAlpha:0.0];
    double v5 = -92.0;
  }
  graphTopConstraint = self->_graphTopConstraint;

  [(NSLayoutConstraint *)graphTopConstraint setConstant:v5];
}

- (void)_insertGraphView
{
  graphContainerView = self->_graphContainerView;
  double v4 = [(NavSignListViewController *)self graphView];
  [(UIView *)graphContainerView addSubview:v4];

  [(NavSignListViewController *)self _updateGraphContainerTop];
  long long v20 = [(NavSignListViewController *)self graphView];
  unsigned int v19 = [v20 leadingAnchor];
  long long v18 = [(UIView *)self->_graphContainerView leadingAnchor];
  long long v17 = [v19 constraintEqualToAnchor:v18 constant:16.0];
  v21[0] = v17;
  long long v16 = [(NavSignListViewController *)self graphView];
  long long v15 = [v16 trailingAnchor];
  double v5 = [(UIView *)self->_graphContainerView trailingAnchor];
  id v6 = [v15 constraintEqualToAnchor:v5 constant:-16.0];
  v21[1] = v6;
  id v7 = [(NavSignListViewController *)self graphView];
  uint64_t v8 = [v7 topAnchor];
  id v9 = [(UIView *)self->_graphContainerView topAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9 constant:16.0];
  v21[2] = v10;
  double v11 = [(NavSignListViewController *)self graphView];
  id v12 = [v11 heightAnchor];
  unsigned int v13 = [v12 constraintEqualToConstant:60.0];
  v21[3] = v13;
  double v14 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (double)_signContainerAvailableHeight
{
  double v3 = [(NavSignListViewController *)self view];
  [v3 frame];
  double Height = CGRectGetHeight(v11);
  [(NavSignListViewController *)self _collapsedSignHeight];
  double v6 = Height - v5;
  id v7 = [(NavSignListViewController *)self footerView];
  [v7 maximumHeight];
  double v9 = v6 - v8;

  return v9;
}

- (void)_updateCurrentManeuverBackground
{
  if (self->_isRerouting) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = [(NavSignListViewController *)self activeStepIndex];
  }
  id v11 = +[NSIndexPath indexPathForRow:v3 inSection:0];
  double v4 = [(NavSignListViewController *)self collectionView];
  double v5 = [v4 cellForItemAtIndexPath:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NavSignListViewController *)self layoutProgress];
    [v5 setState:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NavSignListViewController *)self layoutProgress];
      [v5 setSelectedWithLayoutProgress:];
    }
  }
  double v6 = [(NavSignListViewController *)self traitCollection];
  unsigned __int8 v7 = [v6 isLuminanceReduced];

  if ((v7 & 1) == 0)
  {
    double v8 = sub_10082634C();
    [(NavSignListViewController *)self layoutProgress];
    uint64_t v10 = [v8 colorWithAlphaComponent:v9 * 0.239999995];
    [(MUBlurView *)self->_graphBackgroundView setOverlayColor:v10];
  }
}

- (void)_didPan:(id)a3
{
  id v4 = a3;
  if ([(NavSignListViewController *)self isConnectedToCarPlay])
  {
    double v5 = sub_100467248();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v27 = 134349056;
      long long v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring pan gesture, CarPlay is connected", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    double v6 = [(NavSignListViewController *)self footerView];
    [v4 translationInView:v6];
    double v8 = v7;

    if ([v4 state] == (id)3)
    {
      [(NavSignListViewController *)self setDragging:0];
      double v9 = [(NavSignListViewController *)self footerView];
      [v4 velocityInView:v9];
      double v11 = v10;

      double v12 = v8 + v11 * 0.1;
      BOOL expanded = self->_expanded;
      [(NavSignListViewController *)self _signContainerAvailableHeight];
      if (expanded)
      {
        double v12 = v12 + v14;
        [(NavSignListViewController *)self _signContainerAvailableHeight];
      }
      double v15 = v12 / v14;
      [(NavSignListViewController *)self setLayoutProgress:round(v15)];
      int v16 = self->_expanded;
      [(NavSignListViewController *)self layoutProgress];
      int v18 = v17 > 0.5;
      self->_BOOL expanded = v18;
      if (v16 != v18)
      {
        [(NavSignListViewController *)self _triggerSignListAnalytics];
        int v16 = self->_expanded;
      }
      double v19 = 1.0 - v15;
      if (!v16) {
        double v19 = v15;
      }
      double v20 = v19 * 0.25;
      long long v21 = [(NavSignListViewController *)self signDelegate];
      [v21 signListHeightWillChangeAnimated:0];

      long long v22 = [(NavSignListViewController *)self collectionView];
      [(NavSignListViewController *)self scrollViewDidScroll:v22];

      [(NavSignListViewController *)self _updateLayoutProgressWithDuration:0 completion:v20];
      [(NavSignListViewController *)self _updateActiveStepIndexAnimated:0];
    }
    else
    {
      [(NavSignListViewController *)self setDragging:1];
      BOOL v23 = self->_expanded;
      [(NavSignListViewController *)self _signContainerAvailableHeight];
      if (v23)
      {
        double v8 = v8 + v24;
        [(NavSignListViewController *)self _signContainerAvailableHeight];
      }
      [(NavSignListViewController *)self setLayoutProgress:v8 / v24];
      double v25 = [(NavSignListViewController *)self signDelegate];
      [v25 signListHeightWillChangeAnimated:0];

      double v26 = [(NavSignListViewController *)self collectionView];
      [(NavSignListViewController *)self scrollViewDidScroll:v26];

      [(NavSignListViewController *)self _updateLayoutProgressWithDuration:0 completion:0.0];
    }
  }
}

- (void)_didTap:(id)a3
{
  if ([(NavSignListViewController *)self isConnectedToCarPlay])
  {
    id v4 = sub_100467248();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134349056;
      double v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring tap gesture, CarPlay is connected", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [(NavSignListViewController *)self toggleExpansionAnimated:1];
  }
}

- (void)toggleExpansionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 1.0;
  if (self->_expanded) {
    double v5 = 0.0;
  }
  [(NavSignListViewController *)self setLayoutProgress:v5];
  self->_expanded ^= 1u;
  double v6 = [(NavSignListViewController *)self signDelegate];
  [v6 signListHeightWillChangeAnimated:v3];

  [(NavSignListViewController *)self hideVIOLabel:0];
  double v7 = [(NavSignListViewController *)self collectionView];
  [(NavSignListViewController *)self scrollViewDidScroll:v7];

  [(NavSignListViewController *)self _triggerSignListAnalytics];
  double v8 = 0.25;
  if (!v3) {
    double v8 = 0.0;
  }
  [(NavSignListViewController *)self _updateLayoutProgressWithDuration:0 completion:v8];
  [(NavSignListViewController *)self _updateActiveStepIndexAnimated:v3];
  if (!self->_expanded)
  {
    if ([(NavSignListViewController *)self selectedStepIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = [(NavSignListViewController *)self signDelegate];
      [v13 selectStep:0];
    }
    else
    {
      double v9 = [(NavSignListViewController *)self dataSource];
      double v10 = [v9 items];
      [v10 objectAtIndexedSubscript:[self selectedStepIndex]];
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      double v11 = [(NavSignListViewController *)self signDelegate];
      double v12 = [v13 step];
      [v11 selectStep:v12];
    }
  }
}

- (void)scrollToIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NavSignListViewController *)self collectionView];
  double v8 = [v7 collectionViewLayout];
  id v10 = [v8 layoutAttributesForItemAtIndexPath:v6];

  double v9 = [(NavSignListViewController *)self collectionView];
  [v10 frame];
  [v9 setContentOffset:v4 animated:YES];
}

- (double)_graphTopPosition
{
  [(NavSignListViewController *)self layoutProgress];
  return (1.0 - v2) * -92.0;
}

- (void)_triggerSignListAnalytics
{
  if (self->_expanded) {
    uint64_t v2 = 3004;
  }
  else {
    uint64_t v2 = 140;
  }
  +[GEOAPPortal captureUserAction:v2 target:505 value:0];
}

- (NavigationDebugViewsController)debugViewController
{
  debugViewController = self->_debugViewController;
  if (!debugViewController)
  {
    BOOL v4 = (NavigationDebugViewsController *)objc_opt_new();
    double v5 = self->_debugViewController;
    self->_debugViewController = v4;

    [(NavigationDebugViewsController *)self->_debugViewController setShowTraceControlsForStaleLocations:0];
    [(NavigationDebugViewsController *)self->_debugViewController setAutomaticallyHideTraceControls:0];
    [(NavigationDebugViewsController *)self->_debugViewController setUpCameraSnapshotPickerVCFromViewController:self];
    debugViewController = self->_debugViewController;
  }

  return debugViewController;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  if (self->_debugViewControllerEnabled != a3)
  {
    self->_debugViewControllerEnabled = a3;
    if (a3)
    {
      BOOL v4 = [(NavSignListViewController *)self debugViewController];
      double v5 = [v4 debugControlsView];

      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v6 = [(NavSignListViewController *)self view];
      [v6 addSubview:v5];

      double v7 = [(NavSignListViewController *)self collectionView];
      [v7 layoutMargins];
      double v9 = v8;
      double v11 = v10;

      [v5 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
      double v13 = v12;
      long long v29 = [v5 leadingAnchor];
      long long v28 = [(UIView *)self->_containerView leadingAnchor];
      int v27 = [v29 constraintEqualToAnchor:v28 constant:v9];
      v30[0] = v27;
      double v26 = [v5 trailingAnchor];
      double v14 = [(UIView *)self->_containerView trailingAnchor];
      double v15 = [v26 constraintEqualToAnchor:v14 constant:-v11];
      v30[1] = v15;
      int v16 = [v5 heightAnchor];
      double v17 = [v16 constraintEqualToConstant:v13];
      v30[2] = v17;
      int v18 = [v5 bottomAnchor];
      double v19 = [(NavSignFooterView *)self->_footerView topAnchor];
      double v20 = [v18 constraintEqualToAnchor:v19 constant:-10.0];
      v30[3] = v20;
      long long v21 = +[NSArray arrayWithObjects:v30 count:4];
      +[NSLayoutConstraint activateConstraints:v21];

      long long v22 = [(NavSignListViewController *)self debugViewController];
      [v22 didManuallyAddDebugViews];
    }
    else
    {
      debugViewController = self->_debugViewController;
      if (debugViewController)
      {
        double v24 = [(NavigationDebugViewsController *)debugViewController debugControlsView];
        [v24 removeFromSuperview];

        double v25 = self->_debugViewController;
        [(NavigationDebugViewsController *)v25 didManuallyRemoveDebugViews];
      }
    }
  }
}

- (BOOL)_shouldShowDebugViewController
{
  BOOL v3 = +[GEOPlatform sharedPlatform];
  if ([v3 isInternalInstall])
  {
    BOOL v4 = +[NSUserDefaults standardUserDefaults];
    if ([v4 BOOLForKey:@"PlaybackControls"] && self->_connectedToCarPlay)
    {
      double v5 = +[MNNavigationService sharedService];
      if ((char *)[v5 simulationType] - 1 >= (char *)4)
      {
        double v7 = +[MNNavigationService sharedService];
        unsigned __int8 v6 = [v7 isNavigatingFromTrace];
      }
      else
      {
        unsigned __int8 v6 = 1;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (double)activeStepFadeIn
{
  return self->_activeStepFadeIn;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (NavSignListViewControllerDelegate)signDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signDelegate);

  return (NavSignListViewControllerDelegate *)WeakRetained;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (double)cardWidth
{
  return self->_cardWidth;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (MUBlurView)graphBackgroundView
{
  return self->_graphBackgroundView;
}

- (void)setGraphBackgroundView:(id)a3
{
}

- (void)setGraphView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NavSignFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (unint64_t)activeStepIndex
{
  return self->_activeStepIndex;
}

- (unint64_t)selectedStepIndex
{
  return self->_selectedStepIndex;
}

- (BOOL)isLaneGuidanceActive
{
  return self->_laneGuidanceActive;
}

- (void)setDebugViewController:(id)a3
{
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugViewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_graphBackgroundView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_signDelegate);
  objc_storeStrong((id *)&self->_footerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphTopConstraint, 0);
  objc_storeStrong((id *)&self->_gradientViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_gradientViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_containerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_graphContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_latestLaneInfo, 0);
  objc_storeStrong((id *)&self->_latestSignGuidance, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
  objc_storeStrong((id *)&self->_vioHintLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_vioHintLabelDismissTimer, 0);

  objc_storeStrong((id *)&self->_vioHintLabel, 0);
}

@end