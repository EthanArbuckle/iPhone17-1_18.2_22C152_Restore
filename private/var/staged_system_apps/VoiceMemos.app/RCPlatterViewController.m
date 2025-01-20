@interface RCPlatterViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_platterStateNeedsMinimalCheckmarkView;
- (BOOL)preventsInteractiveDismissal;
- (NSDictionary)stateAndLayoutModeToConstraints;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)elementIdentifier;
- (RCActivityWaveformDataProvider)waveformDataProvider;
- (RCActivityWaveformProcessor)activityWaveformProcessor;
- (RCPlatterCheckmarkView)minimalCheckmarkView;
- (RCPlatterLeadingWaveformView)leadingPlatterWaveformView;
- (RCPlatterMinimalAndromedaWaveformView)minimalAndromedaPlatterWaveformView;
- (RCPlatterMinimalViewContainer)minimalViewContainer;
- (RCPlatterMinimalWaveformView)minimalPlatterWaveformView;
- (RCPlatterTimeView)timeView;
- (RCPlatterViewController)initWithPresentationStyle:(unint64_t)a3;
- (RCPlatterViewControllerDelegate)delegate;
- (RCTimeController)activeTimeController;
- (UIColor)keyColor;
- (id)_constraintsForCollapsedModeWithState:(unint64_t)a3;
- (id)_constraintsForExpandedModeInBanner;
- (id)_constraintsForExpandedModeInDynamicIsland;
- (id)_constraintsForExpandedModeWithPresentationStyle:(unint64_t)a3;
- (id)_constraintsForMinimalModeCheckmarkState;
- (id)_constraintsForMinimalModeWaveformState;
- (id)_constraintsForMinimalModeWithState:(unint64_t)a3;
- (id)_createConstraintsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4;
- (id)_minimalModeBaseConstraintsWithHeight:(double)a3;
- (id)_timelinesForDateInterval:(id)a3;
- (id)constraintsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)platterLayoutModeForSystemApertureLayoutMode:(int64_t)a3;
- (unint64_t)platterState;
- (unint64_t)presentationBehaviors;
- (unint64_t)presentationStyle;
- (void)_addViewsAsSubviewsIfNeeded;
- (void)_setPriorityToDefaultHighForConstraints:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateMinimalViewContainer;
- (void)_updatePlatterViewElementStateForLayoutMode:(unint64_t)a3;
- (void)_updateTime:(double)a3;
- (void)_updateTimeViewElementStateForLayoutMode:(unint64_t)a3;
- (void)_updateViewHiddenStateForLayoutMode:(unint64_t)a3;
- (void)_updateViewsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4;
- (void)accessibilityValueDidChange;
- (void)activateConstraints:(id)a3;
- (void)didTapStopRecordingButton;
- (void)displayRecordingSavedStatusMessage;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setActiveTimeController:(id)a3;
- (void)setActivityWaveformProcessor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeadingPlatterWaveformView:(id)a3;
- (void)setMinimalAndromedaPlatterWaveformView:(id)a3;
- (void)setMinimalCheckmarkView:(id)a3;
- (void)setMinimalPlatterWaveformView:(id)a3;
- (void)setMinimalViewContainer:(id)a3;
- (void)setPlatterState:(unint64_t)a3;
- (void)setPresentationStyle:(unint64_t)a3;
- (void)setStateAndLayoutModeToConstraints:(id)a3;
- (void)setTimeView:(id)a3;
- (void)setWaveformDataProvider:(id)a3;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation RCPlatterViewController

- (RCPlatterViewController)initWithPresentationStyle:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCPlatterViewController;
  v4 = [(RCPlatterViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4) {
    [(RCPlatterViewController *)v4 setPresentationStyle:a3];
  }
  return v5;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)RCPlatterViewController;
  [(RCPlatterViewController *)&v31 viewDidLoad];
  [(RCPlatterViewController *)self setActiveLayoutMode:0];
  [(RCPlatterViewController *)self setPlatterState:0];
  v3 = [(RCPlatterViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [RCActivityWaveformDataProvider alloc];
  v5 = [(RCPlatterViewController *)self activityWaveformProcessor];
  v6 = [(RCActivityWaveformDataProvider *)v4 initWithWaveformProcessor:v5];
  [(RCPlatterViewController *)self setWaveformDataProvider:v6];

  objc_super v7 = [RCPlatterLeadingWaveformView alloc];
  v8 = [(RCPlatterViewController *)self waveformDataProvider];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = -[RCPlatterWaveformView initWithFrame:dataProvider:](v7, "initWithFrame:dataProvider:", v8, CGRectZero.origin.x, y, width, height);
  [(RCPlatterViewController *)self setLeadingPlatterWaveformView:v12];

  v13 = [(RCPlatterViewController *)self leadingPlatterWaveformView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [RCPlatterMinimalWaveformView alloc];
  v15 = [(RCPlatterViewController *)self waveformDataProvider];
  v16 = -[RCPlatterWaveformView initWithFrame:dataProvider:](v14, "initWithFrame:dataProvider:", v15, CGRectZero.origin.x, y, width, height);
  [(RCPlatterViewController *)self setMinimalPlatterWaveformView:v16];

  v17 = -[RCPlatterWaveformView initWithFrame:dataProvider:]([RCPlatterMinimalAndromedaWaveformView alloc], "initWithFrame:dataProvider:", 0, CGRectZero.origin.x, y, width, height);
  [(RCPlatterViewController *)self setMinimalAndromedaPlatterWaveformView:v17];

  v18 = [RCPlatterMinimalViewContainer alloc];
  v19 = [(RCPlatterViewController *)self minimalPlatterWaveformView];
  v20 = -[RCPlatterMinimalViewContainer initWithFrame:childView:](v18, "initWithFrame:childView:", v19, CGRectZero.origin.x, y, width, height);
  [(RCPlatterViewController *)self setMinimalViewContainer:v20];

  v21 = [(RCPlatterViewController *)self minimalViewContainer];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [[RCPlatterTimeView alloc] initWithPresentationStyle:self->_presentationStyle];
  [(RCPlatterViewController *)self setTimeView:v22];

  v23 = [(RCPlatterViewController *)self timeView];
  [v23 setDelegate:self];

  v24 = [(RCPlatterViewController *)self timeView];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = -[RCPlatterCheckmarkView initWithFrame:]([RCPlatterCheckmarkView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(RCPlatterViewController *)self setMinimalCheckmarkView:v25];

  v26 = [(RCPlatterViewController *)self minimalCheckmarkView];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [WeakRetained currentTime];
  -[RCPlatterViewController _updateTime:](self, "_updateTime:");

  v28 = self;
  v32 = v28;
  v29 = +[NSArray arrayWithObjects:&v32 count:1];
  id v30 = [(RCPlatterViewController *)self registerForTraitChanges:v29 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCPlatterViewController;
  [(RCPlatterViewController *)&v4 viewWillAppear:a3];
  if ((id)[(RCPlatterViewController *)self presentationStyle] == (id)1) {
    [(RCPlatterViewController *)self _updateViewsForLayoutMode:3 platterState:[(RCPlatterViewController *)self platterState]];
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v11 = a4;
  v5 = [(RCPlatterViewController *)self traitCollection];
  id v6 = [v5 _backlightLuminance];
  id v7 = [v11 _backlightLuminance];

  if (v6 != v7)
  {
    v8 = [(RCPlatterViewController *)self traitCollection];
    unsigned int v9 = [v8 isInAndromeda];

    if (v9 != [v11 isInAndromeda]) {
      [(RCPlatterViewController *)self _updateMinimalViewContainer];
    }
    v10 = [(RCPlatterViewController *)self delegate];
    [v10 backlightLuminanceDidChangeForPlatterViewController:self];
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(RCPlatterViewController *)self activeLayoutMode];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C9E8C;
  v7[3] = &unk_100223260;
  v7[4] = self;
  v7[5] = [(RCPlatterViewController *)self platterLayoutModeForSystemApertureLayoutMode:v5];
  v7[6] = [(RCPlatterViewController *)self platterState];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C9E9C;
  v6[3] = &unk_100223528;
  v6[4] = self;
  v6[5] = v5;
  [v4 animateAlongsideTransition:v7 completion:v6];
}

- (void)_updateViewsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4
{
  -[RCPlatterViewController constraintsForLayoutMode:platterState:](self, "constraintsForLayoutMode:platterState:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(RCPlatterViewController *)self _addViewsAsSubviewsIfNeeded];
  [(RCPlatterViewController *)self _updateMinimalViewContainer];
  [(RCPlatterViewController *)self _updateViewHiddenStateForLayoutMode:a3];
  [(RCPlatterViewController *)self _updateTimeViewElementStateForLayoutMode:a3];
  [(RCPlatterViewController *)self _updatePlatterViewElementStateForLayoutMode:a3];
  [(RCPlatterViewController *)self activateConstraints:v10];
  if (a4 == 1)
  {
    id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
    v8 = [v7 platterWaveformStatusMessageSliceColor];

    unsigned int v9 = [(RCPlatterViewController *)self leadingPlatterWaveformView];
    [v9 setSliceColor:v8];
  }
}

- (void)setActiveTimeController:(id)a3
{
  p_activeTimeController = &self->_activeTimeController;
  id v5 = a3;
  objc_storeWeak((id *)p_activeTimeController, v5);
  [v5 currentTime];
  double v7 = v6;

  [(RCPlatterViewController *)self _updateTime:v7];
}

- (void)setActivityWaveformProcessor:(id)a3
{
}

- (void)displayRecordingSavedStatusMessage
{
  [(RCPlatterViewController *)self setPlatterState:1];
  if ((id)[(RCPlatterViewController *)self presentationStyle] == (id)1)
  {
    unint64_t v3 = [(RCPlatterViewController *)self platterState];
    [(RCPlatterViewController *)self _updateViewsForLayoutMode:3 platterState:v3];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CA184;
    block[3] = &unk_100221278;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateTimeViewElementStateForLayoutMode:(unint64_t)a3
{
  if ([(RCPlatterViewController *)self platterState])
  {
    if ((id)[(RCPlatterViewController *)self platterState] != (id)1) {
      return;
    }
    id v5 = [(RCPlatterViewController *)self timeView];
    id v7 = v5;
    uint64_t v6 = 2;
  }
  else
  {
    id v5 = [(RCPlatterViewController *)self timeView];
    id v7 = v5;
    uint64_t v6 = a3 == 3;
  }
  [v5 setState:v6];
}

- (void)_updatePlatterViewElementStateForLayoutMode:(unint64_t)a3
{
  BOOL v3 = a3 == 3;
  id v4 = [(RCPlatterViewController *)self leadingPlatterWaveformView];
  [v4 setStyle:v3];
}

- (void)_addViewsAsSubviewsIfNeeded
{
  BOOL v3 = [(RCPlatterViewController *)self leadingPlatterWaveformView];
  id v4 = [v3 superview];

  if (!v4)
  {
    id v5 = [(RCPlatterViewController *)self view];
    uint64_t v6 = [(RCPlatterViewController *)self leadingPlatterWaveformView];
    [v5 addSubview:v6];
  }
  id v7 = [(RCPlatterViewController *)self timeView];
  v8 = [v7 superview];

  if (!v8)
  {
    unsigned int v9 = [(RCPlatterViewController *)self view];
    id v10 = [(RCPlatterViewController *)self timeView];
    [v9 addSubview:v10];
  }
  id v11 = [(RCPlatterViewController *)self minimalViewContainer];
  v12 = [v11 superview];

  if (!v12)
  {
    id v14 = [(RCPlatterViewController *)self view];
    v13 = [(RCPlatterViewController *)self minimalViewContainer];
    [v14 addSubview:v13];
  }
}

- (void)_updateViewHiddenStateForLayoutMode:(unint64_t)a3
{
  id v5 = [(RCPlatterViewController *)self leadingView];
  uint64_t v6 = v5;
  if (a3 == 1)
  {
    [v5 setHidden:1];

    id v7 = [(RCPlatterViewController *)self trailingView];
    [v7 setHidden:1];

    v8 = [(RCPlatterViewController *)self minimalView];
    id v11 = v8;
    uint64_t v9 = 0;
  }
  else
  {
    [v5 setHidden:0];

    id v10 = [(RCPlatterViewController *)self trailingView];
    [v10 setHidden:0];

    v8 = [(RCPlatterViewController *)self minimalView];
    id v11 = v8;
    uint64_t v9 = 1;
  }
  [v8 setHidden:v9];
}

- (void)_updateMinimalViewContainer
{
  if ([(RCPlatterViewController *)self _platterStateNeedsMinimalCheckmarkView])
  {
    id v7 = [(RCPlatterViewController *)self minimalViewContainer];
    uint64_t v3 = [(RCPlatterViewController *)self minimalCheckmarkView];
  }
  else
  {
    id v4 = [(RCPlatterViewController *)self traitCollection];
    unsigned int v5 = [v4 isInAndromeda];

    id v7 = [(RCPlatterViewController *)self minimalViewContainer];
    if (v5) {
      [(RCPlatterViewController *)self minimalAndromedaPlatterWaveformView];
    }
    else {
    uint64_t v3 = [(RCPlatterViewController *)self minimalPlatterWaveformView];
    }
  }
  uint64_t v6 = (void *)v3;
  [v7 setChildView:v3];
}

- (void)activateConstraints:(id)a3
{
  p_activeConstraints = &self->_activeConstraints;
  id v5 = a3;
  if ((-[NSArray isEqual:](*p_activeConstraints, "isEqual:") & 1) == 0)
  {
    +[NSLayoutConstraint deactivateConstraints:*p_activeConstraints];
    objc_storeStrong((id *)p_activeConstraints, a3);
    +[NSLayoutConstraint activateConstraints:*p_activeConstraints];
  }
}

- (id)constraintsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4
{
  uint64_t v6 = [(RCPlatterViewController *)self stateAndLayoutModeToConstraints];
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a3];
  id v10 = [v8 objectForKeyedSubscript:v9];

  return v10;
}

- (NSDictionary)stateAndLayoutModeToConstraints
{
  stateAndLayoutModeToConstraints = self->_stateAndLayoutModeToConstraints;
  if (!stateAndLayoutModeToConstraints)
  {
    id v4 = +[NSMutableDictionary dictionary];
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      v8 = +[NSMutableDictionary dictionary];
      for (uint64_t i = 0; i != 4; ++i)
      {
        id v10 = [(RCPlatterViewController *)self _createConstraintsForLayoutMode:i platterState:v5];
        id v11 = +[NSNumber numberWithUnsignedInteger:i];
        [v8 setObject:v10 forKey:v11];
      }
      v12 = +[NSNumber numberWithUnsignedInteger:v5];
      [v4 setObject:v8 forKey:v12];

      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
    v13 = (NSDictionary *)[v4 copy];
    id v14 = self->_stateAndLayoutModeToConstraints;
    self->_stateAndLayoutModeToConstraints = v13;

    stateAndLayoutModeToConstraints = self->_stateAndLayoutModeToConstraints;
  }

  return stateAndLayoutModeToConstraints;
}

- (id)_createConstraintsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v5 = [(RCPlatterViewController *)self _constraintsForMinimalModeWithState:a4];
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = [(RCPlatterViewController *)self _constraintsForCollapsedModeWithState:a4];
      goto LABEL_7;
    case 3uLL:
      uint64_t v5 = [(RCPlatterViewController *)self _constraintsForExpandedModeWithPresentationStyle:[(RCPlatterViewController *)self presentationStyle]];
LABEL_7:
      char v6 = (void *)v5;
      goto LABEL_9;
  }
  v17 = [(RCPlatterViewController *)self leadingView];
  char v7 = [v17 leadingAnchor];
  v8 = [(RCPlatterViewController *)self view];
  uint64_t v9 = [v8 leadingAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9];
  v18[0] = v10;
  id v11 = [(RCPlatterViewController *)self trailingView];
  v12 = [v11 trailingAnchor];
  v13 = [(RCPlatterViewController *)self view];
  id v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v18[1] = v15;
  char v6 = +[NSArray arrayWithObjects:v18 count:2];

LABEL_9:

  return v6;
}

- (id)_constraintsForCollapsedModeWithState:(unint64_t)a3
{
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 platterCompactLeadingViewHeightMultiplier];
  double v6 = v5;
  v34 = v4;
  [v4 platterWaveformWidthCompact];
  double v8 = v7;
  objc_super v31 = [(RCPlatterViewController *)self leadingView];
  v29 = [v31 leadingAnchor];
  id v30 = [(RCPlatterViewController *)self view];
  v28 = [v30 SBUISA_systemApertureLegibleContentLayoutMarginsGuide];
  v27 = [v28 leadingAnchor];
  uint64_t v9 = [v29 constraintEqualToAnchor:v27];
  v35[0] = v9;
  id v10 = [(RCPlatterViewController *)self leadingView];
  id v11 = [v10 heightAnchor];
  v12 = [(RCPlatterViewController *)self view];
  v13 = [v12 heightAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13 multiplier:v6];
  v35[1] = v14;
  v15 = [(RCPlatterViewController *)self leadingView];
  v16 = [v15 widthAnchor];
  v17 = [v16 constraintEqualToConstant:v8];
  v35[2] = v17;
  v33 = +[NSArray arrayWithObjects:v35 count:3];

  v18 = +[NSMutableArray array];
  if (a3)
  {
    v19 = [(RCPlatterViewController *)self timeView];
    v20 = [v19 trailingCustomConcentricLayoutAnchor];
    v21 = [(RCPlatterViewController *)self view];
    v22 = [v21 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
    [v22 centerXAnchor];
  }
  else
  {
    v19 = [(RCPlatterViewController *)self trailingView];
    v20 = [v19 trailingAnchor];
    v21 = [(RCPlatterViewController *)self view];
    v22 = [v21 SBUISA_systemApertureLegibleContentLayoutMarginsGuide];
    [v22 trailingAnchor];
  v23 = };
  v24 = [v20 constraintEqualToAnchor:v23];
  [v18 addObject:v24];

  v25 = [v33 arrayByAddingObjectsFromArray:v18];
  [(RCPlatterViewController *)self _setPriorityToDefaultHighForConstraints:v25];

  return v25;
}

- (id)_constraintsForExpandedModeWithPresentationStyle:(unint64_t)a3
{
  if (a3 == 1) {
    [(RCPlatterViewController *)self _constraintsForExpandedModeInBanner];
  }
  else {
  uint64_t v3 = [(RCPlatterViewController *)self _constraintsForExpandedModeInDynamicIsland];
  }

  return v3;
}

- (id)_constraintsForExpandedModeInDynamicIsland
{
  v65 = +[RCRecorderStyleProvider sharedStyleProvider];
  v61 = [(RCPlatterViewController *)self view];
  v55 = [v61 widthAnchor];
  v58 = [(RCPlatterViewController *)self view];
  v52 = [v58 window];
  uint64_t v3 = [v52 widthAnchor];
  id v4 = [v55 constraintEqualToAnchor:v3];
  v68[0] = v4;
  double v5 = [(RCPlatterViewController *)self view];
  double v6 = [v5 bottomAnchor];
  double v7 = [(RCPlatterViewController *)self view];
  double v8 = [v7 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
  uint64_t v9 = [v8 bottomAnchor];
  id v10 = [v6 constraintEqualToAnchor:v9];
  v68[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v68 count:2];
  v64 = +[NSMutableArray arrayWithArray:v11];

  [v65 platterCustomLeadingViewLeadingPadding];
  double v13 = v12;
  [v65 platterCustomLeadingViewHeightMultiplier];
  double v15 = v14;
  v62 = [(RCPlatterViewController *)self leadingView];
  v56 = [v62 leadingAnchor];
  v59 = [(RCPlatterViewController *)self view];
  v53 = [v59 leadingAnchor];
  v50 = [v56 constraintEqualToAnchor:v53 constant:v13];
  v67[0] = v50;
  v49 = [(RCPlatterViewController *)self leadingView];
  v47 = [v49 heightAnchor];
  v48 = [(RCPlatterViewController *)self view];
  v46 = [v48 heightAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 multiplier:v15];
  v67[1] = v45;
  v44 = [(RCPlatterViewController *)self leadingView];
  v42 = [v44 centerYAnchor];
  v43 = [(RCPlatterViewController *)self trailingView];
  v16 = [v43 centerYAnchor];
  v17 = [v42 constraintEqualToAnchor:v16];
  v67[2] = v17;
  v18 = [(RCPlatterViewController *)self leadingView];
  v19 = [v18 trailingAnchor];
  v20 = [(RCPlatterViewController *)self view];
  v21 = [v20 SBUISA_systemApertureObstructedAreaLayoutGuide];
  v22 = [v21 centerXAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  v67[3] = v23;
  v24 = +[NSArray arrayWithObjects:v67 count:4];
  [v64 addObjectsFromArray:v24];

  v63 = [(RCPlatterViewController *)self timeView];
  v57 = [v63 trailingCustomConcentricLayoutAnchor];
  v60 = [(RCPlatterViewController *)self view];
  v54 = [v60 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
  v51 = [v54 centerXAnchor];
  v25 = [v57 constraintEqualToAnchor:v51];
  v66[0] = v25;
  v26 = [(RCPlatterViewController *)self trailingView];
  v27 = [v26 centerYAnchor];
  v28 = [(RCPlatterViewController *)self view];
  v29 = [v28 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
  id v30 = [v29 centerYAnchor];
  objc_super v31 = [v27 constraintEqualToAnchor:v30];
  v66[1] = v31;
  v32 = +[NSArray arrayWithObjects:v66 count:2];
  [v64 addObjectsFromArray:v32];

  [(RCPlatterViewController *)self _setPriorityToDefaultHighForConstraints:v64];
  [v65 platterCustomLeadingViewToTrailingViewMinimumPadding];
  double v34 = v33;
  v35 = [(RCPlatterViewController *)self leadingView];
  v36 = [v35 trailingAnchor];
  v37 = [(RCPlatterViewController *)self trailingView];
  v38 = [v37 leadingAnchor];
  v39 = [v36 constraintLessThanOrEqualToAnchor:v38 constant:v34];

  LODWORD(v40) = 1148846080;
  [v39 setPriority:v40];
  [v64 addObject:v39];

  return v64;
}

- (id)_constraintsForExpandedModeInBanner
{
  v48 = +[RCRecorderStyleProvider sharedStyleProvider];
  v49 = +[NSMutableArray array];
  [v48 platterCustomLeadingViewLeadingPadding];
  double v4 = v3;
  [v48 platterCustomLeadingViewHeightMultiplier];
  double v6 = v5;
  v46 = [(RCPlatterViewController *)self leadingView];
  v42 = [v46 leadingAnchor];
  v44 = [(RCPlatterViewController *)self view];
  v41 = [v44 leadingAnchor];
  double v40 = [v42 constraintEqualToAnchor:v41 constant:v4];
  v51[0] = v40;
  v39 = [(RCPlatterViewController *)self leadingView];
  v37 = [v39 heightAnchor];
  v38 = [(RCPlatterViewController *)self view];
  v36 = [v38 heightAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 multiplier:v6];
  v51[1] = v35;
  double v34 = [(RCPlatterViewController *)self leadingView];
  double v33 = [v34 centerYAnchor];
  double v7 = [(RCPlatterViewController *)self trailingView];
  double v8 = [v7 centerYAnchor];
  uint64_t v9 = [v33 constraintEqualToAnchor:v8];
  v51[2] = v9;
  id v10 = [(RCPlatterViewController *)self leadingView];
  id v11 = [v10 trailingAnchor];
  double v12 = [(RCPlatterViewController *)self view];
  double v13 = [v12 centerXAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13];
  v51[3] = v14;
  double v15 = +[NSArray arrayWithObjects:v51 count:4];
  [v49 addObjectsFromArray:v15];

  v47 = [(RCPlatterViewController *)self timeView];
  v43 = [v47 trailingAnchor];
  v45 = [(RCPlatterViewController *)self view];
  v16 = [v45 trailingAnchor];
  v17 = [v43 constraintEqualToAnchor:v16 constant:-v4];
  v50[0] = v17;
  v18 = [(RCPlatterViewController *)self trailingView];
  v19 = [v18 centerYAnchor];
  v20 = [(RCPlatterViewController *)self view];
  v21 = [v20 centerYAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v50[1] = v22;
  v23 = +[NSArray arrayWithObjects:v50 count:2];
  [v49 addObjectsFromArray:v23];

  [(RCPlatterViewController *)self _setPriorityToDefaultHighForConstraints:v49];
  [v48 platterCustomLeadingViewToTrailingViewMinimumPadding];
  double v25 = v24;
  v26 = [(RCPlatterViewController *)self leadingView];
  v27 = [v26 trailingAnchor];
  v28 = [(RCPlatterViewController *)self trailingView];
  v29 = [v28 leadingAnchor];
  id v30 = [v27 constraintLessThanOrEqualToAnchor:v29 constant:v25];

  LODWORD(v31) = 1148846080;
  [v30 setPriority:v31];
  [v49 addObject:v30];

  return v49;
}

- (id)_constraintsForMinimalModeWithState:(unint64_t)a3
{
  if (a3 == 1) {
    [(RCPlatterViewController *)self _constraintsForMinimalModeCheckmarkState];
  }
  else {
  double v3 = [(RCPlatterViewController *)self _constraintsForMinimalModeWaveformState];
  }

  return v3;
}

- (id)_constraintsForMinimalModeWaveformState
{
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 platterMinimalWaveformViewHeight];
  double v5 = v4;

  return [(RCPlatterViewController *)self _minimalModeBaseConstraintsWithHeight:v5];
}

- (id)_constraintsForMinimalModeCheckmarkState
{
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 platterCheckmarkHeightMultiplier];
  double v5 = v4;
  double v6 = [(RCPlatterViewController *)self view];
  double v7 = [v6 SBUISA_systemApertureObstructedAreaLayoutGuide];
  [v7 layoutFrame];
  double v9 = v5 * v8;

  id v10 = [(RCPlatterViewController *)self _minimalModeBaseConstraintsWithHeight:v9];
  [v3 platterMinimalViewWidth];
  double v12 = v11;
  double v13 = [(RCPlatterViewController *)self minimalCheckmarkView];
  double v14 = [v13 widthAnchor];
  double v15 = [v14 constraintEqualToConstant:v12];
  v19 = v15;
  v16 = +[NSArray arrayWithObjects:&v19 count:1];

  [(RCPlatterViewController *)self _setPriorityToDefaultHighForConstraints:v16];
  v17 = [v10 arrayByAddingObjectsFromArray:v16];

  return v17;
}

- (id)_minimalModeBaseConstraintsWithHeight:(double)a3
{
  v21 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v21 platterMinimalViewWidth];
  double v6 = v5;
  v20 = [(RCPlatterViewController *)self minimalViewContainer];
  v19 = [v20 heightAnchor];
  v18 = [v19 constraintEqualToConstant:a3];
  v22[0] = v18;
  v17 = [(RCPlatterViewController *)self minimalViewContainer];
  double v7 = [v17 widthAnchor];
  double v8 = [v7 constraintEqualToConstant:v6];
  v22[1] = v8;
  double v9 = [(RCPlatterViewController *)self minimalViewContainer];
  id v10 = [v9 centerXAnchor];
  double v11 = [(RCPlatterViewController *)self view];
  double v12 = [v11 centerXAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  v22[2] = v13;
  double v14 = +[NSArray arrayWithObjects:v22 count:3];
  double v15 = +[NSMutableArray arrayWithArray:v14];

  [(RCPlatterViewController *)self _setPriorityToDefaultHighForConstraints:v15];

  return v15;
}

- (void)_setPriorityToDefaultHighForConstraints:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        LODWORD(v5) = 1144750080;
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setPriority:v5];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_platterStateNeedsMinimalCheckmarkView
{
  return (id)[(RCPlatterViewController *)self platterState] == (id)1;
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  if (objc_msgSend(a3, "timeControllerState", a4, a5) == (id)2)
  {
    [(RCPlatterViewController *)self _updateTime:a4];
  }
}

- (void)_updateTime:(double)a3
{
  double v5 = [(RCPlatterViewController *)self timeView];
  [v5 updateTime:a3];

  id v6 = [(RCPlatterViewController *)self leadingPlatterWaveformView];
  [v6 updateSliceFramesForRecordingTime:a3];

  uint64_t v7 = [(RCPlatterViewController *)self minimalPlatterWaveformView];
  [v7 updateSliceFramesForRecordingTime:a3];

  id v8 = [(RCPlatterViewController *)self minimalAndromedaPlatterWaveformView];
  [v8 updateSliceFramesForRecordingTime:a3];
}

- (void)didTapStopRecordingButton
{
  id v3 = [(RCPlatterViewController *)self delegate];
  [v3 stopCapturingForPlatterViewController:self];
}

- (void)accessibilityValueDidChange
{
  if ((id)[(RCPlatterViewController *)self activeLayoutMode] != (id)1
    && [(RCPlatterViewController *)self activeLayoutMode])
  {
    id v3 = [(RCPlatterViewController *)self systemApertureElementContext];
    [v3 setElementNeedsUpdate];
  }
}

- (int64_t)contentRole
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  if ((id)[(RCPlatterViewController *)self platterState] == (id)1) {
    return 3;
  }
  else {
    return 4;
  }
}

- (NSSet)backgroundActivitiesToSuppress
{
  return +[NSSet setWithObject:STBackgroundActivityIdentifierRecording];
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (NSString)elementIdentifier
{
  return (NSString *)SBUISystemApertureElementIdentifierVoiceMemos;
}

- (UIColor)keyColor
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 platterKeyColor];

  return (UIColor *)v3;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (id)_timelinesForDateInterval:(id)a3
{
  return +[RCTimelineGenerator emptyTimelineWithIdentifier:@"RCJindoAlwaysOnIdentifier"];
}

- (unint64_t)platterLayoutModeForSystemApertureLayoutMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

- (int64_t)activeLayoutMode
{
  return self->activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->activeLayoutMode = a3;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (RCPlatterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCPlatterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)platterState
{
  return self->_platterState;
}

- (void)setPlatterState:(unint64_t)a3
{
  self->_platterState = a3;
}

- (RCTimeController)activeTimeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);

  return (RCTimeController *)WeakRetained;
}

- (RCActivityWaveformProcessor)activityWaveformProcessor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityWaveformProcessor);

  return (RCActivityWaveformProcessor *)WeakRetained;
}

- (RCActivityWaveformDataProvider)waveformDataProvider
{
  return self->_waveformDataProvider;
}

- (void)setWaveformDataProvider:(id)a3
{
}

- (RCPlatterTimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
}

- (RCPlatterLeadingWaveformView)leadingPlatterWaveformView
{
  return self->_leadingPlatterWaveformView;
}

- (void)setLeadingPlatterWaveformView:(id)a3
{
}

- (RCPlatterMinimalWaveformView)minimalPlatterWaveformView
{
  return self->_minimalPlatterWaveformView;
}

- (void)setMinimalPlatterWaveformView:(id)a3
{
}

- (RCPlatterMinimalAndromedaWaveformView)minimalAndromedaPlatterWaveformView
{
  return self->_minimalAndromedaPlatterWaveformView;
}

- (void)setMinimalAndromedaPlatterWaveformView:(id)a3
{
}

- (RCPlatterCheckmarkView)minimalCheckmarkView
{
  return self->_minimalCheckmarkView;
}

- (void)setMinimalCheckmarkView:(id)a3
{
}

- (RCPlatterMinimalViewContainer)minimalViewContainer
{
  return self->_minimalViewContainer;
}

- (void)setMinimalViewContainer:(id)a3
{
}

- (void)setStateAndLayoutModeToConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateAndLayoutModeToConstraints, 0);
  objc_storeStrong((id *)&self->_minimalViewContainer, 0);
  objc_storeStrong((id *)&self->_minimalCheckmarkView, 0);
  objc_storeStrong((id *)&self->_minimalAndromedaPlatterWaveformView, 0);
  objc_storeStrong((id *)&self->_minimalPlatterWaveformView, 0);
  objc_storeStrong((id *)&self->_leadingPlatterWaveformView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_waveformDataProvider, 0);
  objc_destroyWeak((id *)&self->_activityWaveformProcessor);
  objc_destroyWeak((id *)&self->_activeTimeController);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_activeConstraints, 0);
}

@end