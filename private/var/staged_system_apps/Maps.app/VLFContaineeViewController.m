@interface VLFContaineeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsLongPressToMarkLocation;
- (BOOL)allowsQuickActionMenuInMap;
- (BOOL)isFailureVisible;
- (ContainerHeaderView)titleHeaderView;
- (NSLayoutConstraint)failureViewBottomConstraint;
- (NSLayoutConstraint)instructionViewFirstBaselineConstraint;
- (NSLayoutConstraint)instructionViewLeadingConstraint;
- (NSLayoutConstraint)instructionViewTopConstraint;
- (NSLayoutConstraint)instructionViewTrailingConstraint;
- (NSLayoutConstraint)scanningAnimationViewBottomConstraint;
- (NSLayoutConstraint)scanningAnimationViewFlexibleTopConstraintPortrait;
- (NSLayoutConstraint)scanningAnimationViewTopConstraintPortrait;
- (UIView)scanningContainerView;
- (VLFContaineeViewController)init;
- (VLFContaineeViewController)initWithCoder:(id)a3;
- (VLFContaineeViewController)initWithEntryPoint:(int64_t)a3;
- (VLFContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VLFFailureView)failureView;
- (VLFScanningAnimationView)scanningAnimationView;
- (VLFScanningInstructionView)instructionView;
- (VLFScanningStateManager)stateManager;
- (VLFSession)vlfSession;
- (double)heightForLayout:(unint64_t)a3;
- (int64_t)floatingControlsOptions;
- (unint64_t)defaultLayoutForContainerStyle:(unint64_t)a3 traitCollection:(id)a4;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (void)VLFSessionLocalizationFailedWithError:(id)a3;
- (void)VLFSessionLocalizationSucceeded;
- (void)_hideFailureWithCompletion:(id)a3;
- (void)_presentInternalErrorAlert:(id)a3 onViewController:(id)a4;
- (void)_retryVLFSession;
- (void)_showFailure;
- (void)_startVLFSession;
- (void)_updateBackgroundColor;
- (void)_updateForCurrentState;
- (void)_updateForLayout:(unint64_t)a3;
- (void)dealloc;
- (void)didChangeLayout:(unint64_t)a3;
- (void)failureViewDismissButtonTapped:(id)a3;
- (void)failureViewRetryButtonTapped:(id)a3;
- (void)handleDismissAction:(id)a3;
- (void)handleVLFPuckTapped;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)scanningStateManager:(id)a3 didChangeState:(int64_t)a4;
- (void)setFailureView:(id)a3;
- (void)setFailureViewBottomConstraint:(id)a3;
- (void)setInstructionView:(id)a3;
- (void)setInstructionViewFirstBaselineConstraint:(id)a3;
- (void)setInstructionViewLeadingConstraint:(id)a3;
- (void)setInstructionViewTopConstraint:(id)a3;
- (void)setInstructionViewTrailingConstraint:(id)a3;
- (void)setIsFailureVisible:(BOOL)a3;
- (void)setScanningAnimationView:(id)a3;
- (void)setScanningAnimationViewBottomConstraint:(id)a3;
- (void)setScanningAnimationViewFlexibleTopConstraintPortrait:(id)a3;
- (void)setScanningAnimationViewTopConstraintPortrait:(id)a3;
- (void)setScanningContainerView:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setVlfSession:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation VLFContaineeViewController

- (VLFContaineeViewController)init
{
  result = (VLFContaineeViewController *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (VLFContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (VLFContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (VLFContaineeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  result = (VLFContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (VLFContaineeViewController)initWithEntryPoint:(int64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VLFContaineeViewController;
  v4 = [(VLFContaineeViewController *)&v24 initWithNibName:0 bundle:0];
  if (v4)
  {
    id v5 = [[ContainerHeaderView alloc] initWithCardButtonType:0];
    titleHeaderView = v4->_titleHeaderView;
    v4->_titleHeaderView = v5;

    [(ContainerHeaderView *)v4->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)v4->_titleHeaderView setPreservesSuperviewLayoutMargins:1];
    [(ContainerHeaderView *)v4->_titleHeaderView setHairLineAlpha:0.0];
    [(ContainerHeaderView *)v4->_titleHeaderView setHeaderSize:1];
    [(ContainerHeaderView *)v4->_titleHeaderView setDelegate:v4];
    id v7 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    scanningContainerView = v4->_scanningContainerView;
    v4->_scanningContainerView = v11;

    [(UIView *)v4->_scanningContainerView setUserInteractionEnabled:0];
    [(UIView *)v4->_scanningContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [[VLFScanningInstructionView alloc] initWithLayout:2];
    instructionView = v4->_instructionView;
    v4->_instructionView = v13;

    [(VLFScanningInstructionView *)v4->_instructionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = -[VLFScanningAnimationView initWithFrame:]([VLFScanningAnimationView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    scanningAnimationView = v4->_scanningAnimationView;
    v4->_scanningAnimationView = v15;

    [(VLFScanningAnimationView *)v4->_scanningAnimationView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = -[VLFFailureView initWithFrame:]([VLFFailureView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    failureView = v4->_failureView;
    v4->_failureView = v17;

    [(VLFFailureView *)v4->_failureView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VLFFailureView *)v4->_failureView setAlpha:0.0];
    [(VLFFailureView *)v4->_failureView setDelegate:v4];
    v19 = [(ContaineeViewController *)v4 cardPresentationController];
    [v19 setHideGrabber:1];

    v20 = [(ContaineeViewController *)v4 cardPresentationController];
    [v20 setAllowsSwipeToDismiss:0];

    v21 = [[VLFSession alloc] initWithMode:1];
    vlfSession = v4->_vlfSession;
    v4->_vlfSession = v21;

    [(VLFSession *)v4->_vlfSession setEntryPoint:a3];
    [(VLFSession *)v4->_vlfSession setDelegate:v4];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [(VLFContaineeViewController *)self vlfSession];
  [v3 stop];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:off_1015F7850 object:self];

  v5.receiver = self;
  v5.super_class = (Class)VLFContaineeViewController;
  [(VLFContaineeViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v103.receiver = self;
  v103.super_class = (Class)VLFContaineeViewController;
  [(ContaineeViewController *)&v103 viewDidLoad];
  [(VLFContaineeViewController *)self _updateBackgroundColor];
  id v3 = [(VLFContaineeViewController *)self view];
  v4 = [v3 layer];
  [v4 setMaskedCorners:3];

  objc_super v5 = [(VLFContaineeViewController *)self view];
  id v6 = [v5 layer];
  [v6 setMasksToBounds:1];

  v102 = +[NSMutableArray array];
  id v7 = [(VLFContaineeViewController *)self view];
  [v7 addSubview:self->_titleHeaderView];

  v96 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v100 = [(VLFContaineeViewController *)self view];
  v93 = [v100 leadingAnchor];
  v90 = [v96 constraintEqualToAnchor:v93];
  v108[0] = v90;
  v8 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v9 = [(VLFContaineeViewController *)self view];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v108[1] = v11;
  v12 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v13 = [(VLFContaineeViewController *)self view];
  v14 = [v13 topAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v108[2] = v15;
  v16 = +[NSArray arrayWithObjects:v108 count:3];
  [v102 addObjectsFromArray:v16];

  v17 = [(VLFContaineeViewController *)self view];
  [v17 addSubview:self->_scanningContainerView];

  v97 = [(UIView *)self->_scanningContainerView leadingAnchor];
  v101 = [(VLFContaineeViewController *)self view];
  v94 = [v101 leadingAnchor];
  v91 = [v97 constraintEqualToAnchor:v94];
  v107[0] = v91;
  v86 = [(UIView *)self->_scanningContainerView trailingAnchor];
  v88 = [(VLFContaineeViewController *)self view];
  v84 = [v88 trailingAnchor];
  v83 = [v86 constraintEqualToAnchor:v84];
  v107[1] = v83;
  v82 = [(UIView *)self->_scanningContainerView topAnchor];
  v18 = [(VLFContaineeViewController *)self view];
  v19 = [v18 topAnchor];
  v20 = [v82 constraintEqualToAnchor:v19];
  v107[2] = v20;
  v21 = [(UIView *)self->_scanningContainerView bottomAnchor];
  v22 = [(VLFContaineeViewController *)self view];
  v23 = [v22 bottomAnchor];
  objc_super v24 = [v21 constraintEqualToAnchor:v23];
  v107[3] = v24;
  v25 = +[NSArray arrayWithObjects:v107 count:4];
  [v102 addObjectsFromArray:v25];

  [(UIView *)self->_scanningContainerView addSubview:self->_instructionView];
  v26 = [(VLFScanningInstructionView *)self->_instructionView leadingAnchor];
  v27 = [(UIView *)self->_scanningContainerView leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:28.0];
  instructionViewLeadingConstraint = self->_instructionViewLeadingConstraint;
  self->_instructionViewLeadingConstraint = v28;

  v30 = [(VLFScanningInstructionView *)self->_instructionView trailingAnchor];
  v31 = [(UIView *)self->_scanningContainerView trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:-52.0];
  instructionViewTrailingConstraint = self->_instructionViewTrailingConstraint;
  self->_instructionViewTrailingConstraint = v32;

  v34 = [(VLFScanningInstructionView *)self->_instructionView firstBaselineAnchor];
  v35 = [(UIView *)self->_scanningContainerView topAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:48.0];
  instructionViewFirstBaselineConstraint = self->_instructionViewFirstBaselineConstraint;
  self->_instructionViewFirstBaselineConstraint = v36;

  v38 = [(VLFScanningInstructionView *)self->_instructionView topAnchor];
  v39 = [(UIView *)self->_scanningContainerView topAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:21.0];
  instructionViewTopConstraint = self->_instructionViewTopConstraint;
  self->_instructionViewTopConstraint = v40;

  v42 = self->_instructionViewTrailingConstraint;
  v106[0] = self->_instructionViewLeadingConstraint;
  v106[1] = v42;
  v106[2] = self->_instructionViewFirstBaselineConstraint;
  v43 = +[NSArray arrayWithObjects:v106 count:3];
  [v102 addObjectsFromArray:v43];

  [(UIView *)self->_scanningContainerView addSubview:self->_scanningAnimationView];
  v44 = [(VLFScanningAnimationView *)self->_scanningAnimationView topAnchor];
  v45 = [(VLFScanningInstructionView *)self->_instructionView lastBaselineAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  scanningAnimationViewTopConstraintPortrait = self->_scanningAnimationViewTopConstraintPortrait;
  self->_scanningAnimationViewTopConstraintPortrait = v46;

  v48 = [(VLFScanningAnimationView *)self->_scanningAnimationView topAnchor];
  v49 = [(VLFScanningInstructionView *)self->_instructionView lastBaselineAnchor];
  v50 = [v48 constraintGreaterThanOrEqualToAnchor:v49];
  scanningAnimationViewFlexibleTopConstraintPortrait = self->_scanningAnimationViewFlexibleTopConstraintPortrait;
  self->_scanningAnimationViewFlexibleTopConstraintPortrait = v50;

  v52 = [(VLFScanningAnimationView *)self->_scanningAnimationView bottomAnchor];
  v53 = [(UIView *)self->_scanningContainerView bottomAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  scanningAnimationViewBottomConstraint = self->_scanningAnimationViewBottomConstraint;
  self->_scanningAnimationViewBottomConstraint = v54;

  v98 = [(VLFScanningAnimationView *)self->_scanningAnimationView leadingAnchor];
  v56 = [(UIView *)self->_scanningContainerView leadingAnchor];
  v57 = [v98 constraintEqualToAnchor:v56];
  v105[0] = v57;
  v58 = [(VLFScanningAnimationView *)self->_scanningAnimationView trailingAnchor];
  v59 = [(UIView *)self->_scanningContainerView trailingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  v61 = self->_scanningAnimationViewTopConstraintPortrait;
  v105[1] = v60;
  v105[2] = v61;
  v105[3] = self->_scanningAnimationViewBottomConstraint;
  v62 = [(VLFScanningAnimationView *)self->_scanningAnimationView heightAnchor];
  v63 = [(VLFScanningAnimationView *)self->_scanningAnimationView widthAnchor];
  v64 = [v62 constraintEqualToAnchor:v63 multiplier:0.565333307 constant:0.0];
  v105[4] = v64;
  v65 = +[NSArray arrayWithObjects:v105 count:5];
  [v102 addObjectsFromArray:v65];

  v66 = [(VLFContaineeViewController *)self view];
  [v66 addSubview:self->_failureView];

  v67 = [(VLFFailureView *)self->_failureView bottomAnchor];
  v68 = [(VLFContaineeViewController *)self view];
  v69 = [v68 bottomAnchor];
  v70 = [v67 constraintEqualToAnchor:v69];
  failureViewBottomConstraint = self->_failureViewBottomConstraint;
  self->_failureViewBottomConstraint = v70;

  v95 = [(VLFFailureView *)self->_failureView leadingAnchor];
  v99 = [(VLFContaineeViewController *)self view];
  v92 = [v99 leadingAnchor];
  v89 = [v95 constraintEqualToAnchor:v92];
  v104[0] = v89;
  v85 = [(VLFFailureView *)self->_failureView trailingAnchor];
  v87 = [(VLFContaineeViewController *)self view];
  v72 = [v87 trailingAnchor];
  v73 = [v85 constraintEqualToAnchor:v72];
  v104[1] = v73;
  v74 = [(VLFFailureView *)self->_failureView topAnchor];
  v75 = [(VLFContaineeViewController *)self view];
  v76 = [v75 topAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];
  v78 = self->_failureViewBottomConstraint;
  v104[2] = v77;
  v104[3] = v78;
  v79 = +[NSArray arrayWithObjects:v104 count:4];
  [v102 addObjectsFromArray:v79];

  +[NSLayoutConstraint activateConstraints:v102];
  v80 = [(VLFScanningInstructionView *)self->_instructionView fontProvider];
  [v80 addFontObserver:self->_failureView];

  v81 = [(VLFContaineeViewController *)self view];
  [v81 layoutIfNeeded];
}

- (void)willResignCurrent:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VLFContaineeViewController;
  [(ContaineeViewController *)&v8 willResignCurrent:a3];
  v4 = sub_100D2EC1C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will resign current", v7, 2u);
  }

  [(VLFContaineeViewController *)self setStateManager:0];
  objc_super v5 = [(VLFContaineeViewController *)self vlfSession];
  [v5 stop];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:off_1015F7850 object:self];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VLFContaineeViewController;
  [(ContaineeViewController *)&v7 willBecomeCurrent:a3];
  v4 = sub_100D2EC1C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will become current", v6, 2u);
  }

  [(VLFContaineeViewController *)self _startVLFSession];
  [(VLFContaineeViewController *)self _updateForCurrentState];
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:off_1015F7858 object:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VLFContaineeViewController;
  [(VLFContaineeViewController *)&v8 viewDidDisappear:a3];
  v4 = [(VLFContaineeViewController *)self instructionView];
  objc_super v5 = [v4 layer];
  [v5 removeAllAnimations];

  id v6 = [(VLFContaineeViewController *)self scanningAnimationView];
  objc_super v7 = [v6 layer];
  [v7 removeAllAnimations];

  [(VLFContaineeViewController *)self _hideFailureWithCompletion:0];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VLFContaineeViewController;
  [(ContaineeViewController *)&v6 viewDidLayoutSubviews];
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v3 containeeLayout];

  if (v4)
  {
    objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
    -[VLFContaineeViewController _updateForLayout:](self, "_updateForLayout:", [v5 containeeLayout]);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VLFContaineeViewController;
  [(MapsThemeViewController *)&v14 traitCollectionDidChange:v4];
  [(VLFContaineeViewController *)self _updateBackgroundColor];
  if (v4)
  {
    objc_super v5 = [(VLFContaineeViewController *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    objc_super v7 = [v4 preferredContentSizeCategory];
    NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

    if (v8)
    {
      v9 = [(ContaineeViewController *)self cardPresentationController];
      id v10 = [v9 containeeLayout];

      if (v10)
      {
        v11 = [(ContaineeViewController *)self cardPresentationController];
        -[VLFContaineeViewController _updateForLayout:](self, "_updateForLayout:", [v11 containeeLayout]);
      }
      v12 = [(VLFContaineeViewController *)self view];
      [v12 layoutIfNeeded];

      v13 = [(ContaineeViewController *)self cardPresentationController];
      [v13 updateHeightForCurrentLayout];
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v5 = -1.0;
  if (a3 == 4 || a3 == 2)
  {
    [(VLFContaineeViewController *)self _updateForLayout:a3];
    if (a3 == 2)
    {
      unsigned int v8 = [(VLFContaineeViewController *)self isFailureVisible];
      v9 = &UILayoutFittingCompressedSize;
      if (!v8) {
        v9 = &UILayoutFittingExpandedSize;
      }
      double height = v9->height;
      objc_super v6 = [(VLFContaineeViewController *)self view];
      v11 = [(VLFContaineeViewController *)self view];
      [v11 frame];
      double v13 = v12;
      LODWORD(v12) = 1148846080;
      LODWORD(v14) = 1112014848;
      [v6 systemLayoutSizeFittingSize:v13 withHorizontalFittingPriority:height verticalFittingPriority:v12 v14];
      double v5 = v15;

      goto LABEL_9;
    }
    if (a3 == 4)
    {
      objc_super v6 = [(ContaineeViewController *)self cardPresentationController];
      [v6 availableHeight];
      double v5 = v7;
LABEL_9:
    }
  }
  return v5;
}

- (void)didChangeLayout:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VLFContaineeViewController;
  [(ContaineeViewController *)&v6 didChangeLayout:"didChangeLayout:"];
  double v5 = sub_100D2EC1C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did change layout to: %lu", buf, 0xCu);
  }

  [(VLFContaineeViewController *)self _updateForLayout:a3];
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:off_1015F7870 object:self];

  v6.receiver = self;
  v6.super_class = (Class)VLFContaineeViewController;
  [(ContaineeViewController *)&v6 handleDismissAction:v4];
}

- (void)handleVLFPuckTapped
{
  id v3 = [(VLFContaineeViewController *)self vlfSession];
  unsigned int v4 = [v3 isRunning];

  if (v4)
  {
    v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315906;
      double v13 = "-[VLFContaineeViewController handleVLFPuckTapped]";
      __int16 v14 = 2080;
      double v15 = "VLFContaineeViewController.m";
      __int16 v16 = 1024;
      int v17 = 313;
      __int16 v18 = 2080;
      v19 = "!self.vlfSession.isRunning";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[NSThread callStackSymbols];
        int v12 = 138412290;
        double v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  double v5 = [(VLFContaineeViewController *)self vlfSession];
  unsigned int v6 = [v5 isRunning];

  double v7 = sub_100D2EC1C();
  unint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "VLF puck was tapped while a VLF session is running. This should never happen.", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "VLF puck was tapped; retrying VLF",
        (uint8_t *)&v12,
        2u);
    }

    [(VLFContaineeViewController *)self _retryVLFSession];
  }
}

- (int64_t)floatingControlsOptions
{
  return 0;
}

- (void)_updateBackgroundColor
{
  id v3 = [(VLFContaineeViewController *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    +[UIColor secondarySystemBackgroundColor];
  }
  else {
  id v6 = +[UIColor systemWhiteColor];
  }
  double v5 = [(VLFContaineeViewController *)self view];
  [v5 setBackgroundColor:v6];
}

- (void)_startVLFSession
{
  id v3 = sub_100D2EC1C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting VLF session", v9, 2u);
  }

  id v4 = [(VLFContaineeViewController *)self vlfSession];
  [v4 start];

  double v5 = [VLFScanningStateManager alloc];
  id v6 = [(VLFContaineeViewController *)self vlfSession];
  double v7 = [v6 session];
  unint64_t v8 = [(VLFScanningStateManager *)v5 initWithSession:v7 delegate:self];
  [(VLFContaineeViewController *)self setStateManager:v8];
}

- (void)_retryVLFSession
{
  id v3 = [(VLFContaineeViewController *)self instructionView];
  [v3 setCurrentScanningState:1];

  id v4 = [(VLFContaineeViewController *)self scanningAnimationView];
  [v4 setCurrentScanningState:1];

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:off_1015F7868 object:self];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100D2F66C;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  [(VLFContaineeViewController *)self _hideFailureWithCompletion:v6];
}

- (void)_updateForCurrentState
{
  id v3 = sub_100D2EC1C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(VLFContaineeViewController *)self stateManager];
    double v5 = (char *)[v4 currentState];
    if ((unint64_t)(v5 - 2) > 3) {
      CFStringRef v6 = @"VLFScanningStateInitializing";
    }
    else {
      CFStringRef v6 = off_1013226F8[(void)(v5 - 2)];
    }
    int v13 = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating for current state: %@", (uint8_t *)&v13, 0xCu);
  }
  double v7 = [(VLFContaineeViewController *)self stateManager];
  id v8 = [v7 currentState];
  v9 = [(VLFContaineeViewController *)self instructionView];
  [v9 setCurrentScanningState:v8];

  id v10 = [(VLFContaineeViewController *)self stateManager];
  id v11 = [v10 currentState];
  int v12 = [(VLFContaineeViewController *)self scanningAnimationView];
  [v12 setCurrentScanningState:v11];
}

- (void)_updateForLayout:(unint64_t)a3
{
  if (a3 == 4)
  {
    __int16 v18 = [(VLFContaineeViewController *)self instructionViewLeadingConstraint];
    [v18 setConstant:24.0];

    v19 = [(VLFContaineeViewController *)self instructionViewTrailingConstraint];
    [v19 setConstant:-48.0];

    v20 = [(VLFContaineeViewController *)self scanningAnimationViewFlexibleTopConstraintPortrait];
    [v20 setActive:0];

    v21 = [(VLFContaineeViewController *)self scanningAnimationViewTopConstraintPortrait];
    [v21 setActive:0];

    v22 = [(ContaineeViewController *)self cardPresentationController];
    id v23 = [v22 containerStyle];

    if (v23 == (id)6)
    {
      objc_super v24 = [(VLFContaineeViewController *)self view];
      v25 = [v24 window];
      [v25 frame];
      double v27 = v26 * -0.08;
      v28 = [(VLFContaineeViewController *)self scanningAnimationViewBottomConstraint];
      [v28 setConstant:v27];

      v29 = [(VLFContaineeViewController *)self view];
      v30 = [(VLFContaineeViewController *)self view];
      [v30 bounds];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v39 = [(VLFContaineeViewController *)self view];
      v40 = [v39 window];
      [v29 convertRect:v40 toView:v32];
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;

      v49 = [(VLFContaineeViewController *)self view];
      v50 = [v49 window];
      [v50 frame];
      double v52 = v51;
      v93.origin.x = v42;
      v93.origin.double y = v44;
      v93.size.double width = v46;
      v93.size.double height = v48;
      double v53 = v52 - CGRectGetMaxY(v93);

      v54 = [(VLFContaineeViewController *)self view];
      v55 = [v54 window];
      [v55 frame];
      double v57 = -(v56 * 0.07 - v53);
    }
    else
    {
      v72 = [(ContaineeViewController *)self cardPresentationController];
      [v72 bottomSafeOffset];
      double v74 = v73;
      v75 = [(VLFContaineeViewController *)self view];
      v76 = [v75 window];
      [v76 frame];
      double v78 = -(v74 + v77 * 0.08);
      v79 = [(VLFContaineeViewController *)self scanningAnimationViewBottomConstraint];
      [v79 setConstant:v78];

      v54 = [(VLFContaineeViewController *)self view];
      v55 = [v54 window];
      [v55 frame];
      double v57 = v80 * -0.07;
    }
    v81 = [(VLFContaineeViewController *)self failureViewBottomConstraint];
    [v81 setConstant:v57];

    v82 = [(VLFContaineeViewController *)self instructionViewFirstBaselineConstraint];
    [v82 setActive:0];

    v69 = [(VLFContaineeViewController *)self instructionViewTopConstraint];
    v70 = v69;
    double v71 = 22.0;
    goto LABEL_17;
  }
  if (a3 == 2)
  {
    double v5 = [(VLFContaineeViewController *)self instructionViewLeadingConstraint];
    [v5 setConstant:28.0];

    CFStringRef v6 = [(VLFContaineeViewController *)self instructionViewTrailingConstraint];
    [v6 setConstant:-52.0];

    uint64_t v7 = [(VLFContaineeViewController *)self isFailureVisible] ^ 1;
    id v8 = [(VLFContaineeViewController *)self scanningAnimationViewTopConstraintPortrait];
    [v8 setActive:v7];

    BOOL v9 = [(VLFContaineeViewController *)self isFailureVisible];
    id v10 = [(VLFContaineeViewController *)self scanningAnimationViewFlexibleTopConstraintPortrait];
    [v10 setActive:v9];

    id v11 = [(ContaineeViewController *)self cardPresentationController];
    [v11 bottomSafeOffset];
    double v13 = v12;

    if (v13 <= 0.0)
    {
      CFStringRef v14 = [(VLFContaineeViewController *)self scanningAnimationViewBottomConstraint];
      [v14 setConstant:-10.0];
    }
    else
    {
      CFStringRef v14 = [(ContaineeViewController *)self cardPresentationController];
      [v14 bottomSafeOffset];
      double v16 = -v15;
      int v17 = [(VLFContaineeViewController *)self scanningAnimationViewBottomConstraint];
      [v17 setConstant:v16];
    }
    v61 = [(ContaineeViewController *)self cardPresentationController];
    [v61 bottomSafeOffset];
    double v63 = -(v62 + 10.0);
    v64 = [(VLFContaineeViewController *)self failureViewBottomConstraint];
    [v64 setConstant:v63];

    v65 = [(VLFContaineeViewController *)self traitCollection];
    v66 = [v65 preferredContentSizeCategory];
    NSComparisonResult v67 = UIContentSizeCategoryCompareToCategory(v66, UIContentSizeCategoryLarge);

    if (v67 != NSOrderedDescending)
    {
      v84 = [(VLFContaineeViewController *)self instructionViewTopConstraint];
      [v84 setActive:0];

      v83 = [(VLFContaineeViewController *)self instructionViewFirstBaselineConstraint];
      goto LABEL_19;
    }
    v68 = [(VLFContaineeViewController *)self instructionViewFirstBaselineConstraint];
    [v68 setActive:0];

    v69 = [(VLFContaineeViewController *)self instructionViewTopConstraint];
    v70 = v69;
    double v71 = 21.0;
LABEL_17:
    [v69 setConstant:v71];

    v83 = [(VLFContaineeViewController *)self instructionViewTopConstraint];
LABEL_19:
    v59 = v83;
    [v83 setActive:1];
LABEL_20:

    goto LABEL_21;
  }
  v58 = sub_1005762E4();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    int v87 = 136315650;
    v88 = "-[VLFContaineeViewController _updateForLayout:]";
    __int16 v89 = 2080;
    v90 = "VLFContaineeViewController.m";
    __int16 v91 = 1024;
    int v92 = 420;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v87, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v59 = sub_1005762E4();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = +[NSThread callStackSymbols];
      int v87 = 138412290;
      v88 = v60;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v87, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_21:
  v85 = [(VLFContaineeViewController *)self instructionView];
  [v85 setCurrentLayout:a3];

  v86 = [(VLFContaineeViewController *)self failureView];
  [v86 setCurrentLayout:a3];
}

- (void)_showFailure
{
  id v3 = sub_100D2EC1C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Showing failure UI", buf, 2u);
  }

  [(VLFContaineeViewController *)self setIsFailureVisible:1];
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"VLFSessionScanningAnimationSlowDownKey"];

  double v6 = 0.3;
  if (v5) {
    double v6 = 5.0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100D2FF74;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  +[UIView animateKeyframesWithDuration:4 delay:v7 options:0 animations:v6 completion:0.0];
}

- (void)_hideFailureWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100D2EC1C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Hiding failure UI", buf, 2u);
  }

  [(VLFContaineeViewController *)self setIsFailureVisible:0];
  double v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"VLFSessionScanningAnimationSlowDownKey"];

  if (v7) {
    double v8 = 5.0;
  }
  else {
    double v8 = 0.3;
  }
  id v11 = v4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100D3035C;
  v12[3] = &unk_1012E5D08;
  v12[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D305BC;
  v10[3] = &unk_1012EAFC0;
  id v9 = v4;
  +[UIView animateKeyframesWithDuration:4 delay:v12 options:v10 animations:v8 completion:0.0];
}

- (void)_presentInternalErrorAlert:(id)a3 onViewController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 domain];
  unsigned int v8 = [v7 isEqualToString:ARErrorDomain];

  if (v8) {
    CFStringRef v9 = @"VLF+ localization failed due to an ARKit error: %@";
  }
  else {
    CFStringRef v9 = @"VLF+ localization failed due to an unknown error: %@";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = +[UIAlertController alertControllerWithTitle:@"Localization failed [Internal Only]" message:v12 preferredStyle:1];
  id v11 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
  [v10 addAction:v11];

  [v5 presentViewController:v10 animated:1 completion:0];
}

- (BOOL)allowsLongPressToMarkLocation
{
  return 0;
}

- (BOOL)allowsQuickActionMenuInMap
{
  return 0;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = sub_100D2EC1C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Header button tapped; dismissing ourselves",
      v7,
      2u);
  }

  [(VLFContaineeViewController *)self handleDismissAction:v5];
}

- (unint64_t)defaultLayoutForContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  if (a3 > 7) {
    return 4;
  }
  else {
    return qword_100F73F60[a3];
  }
}

- (void)VLFSessionLocalizationSucceeded
{
  id v3 = sub_100D2EC1C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Localization succeeded; dismissing ourselves",
      v5,
      2u);
  }

  id v4 = +[VLFSessionUsageTracker sharedInstance];
  [v4 registerLocalizationSuccess];

  [(VLFContaineeViewController *)self handleDismissAction:0];
}

- (void)VLFSessionLocalizationFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_100D2EC1C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Localization failed with error %@", (uint8_t *)&v16, 0xCu);
  }

  id v6 = [v4 domain];
  unsigned int v7 = [v6 isEqualToString:@"com.apple.Maps.VLFSession"];

  if (!v7)
  {
    id v11 = +[GEOPlatform sharedPlatform];
    unsigned int v12 = [v11 isInternalInstall];

    if (v12)
    {
      double v13 = sub_100D2EC1C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Showing internal-only failure alert which displays more info about what went wrong", (uint8_t *)&v16, 2u);
      }

      [(VLFContaineeViewController *)self _presentInternalErrorAlert:v4 onViewController:self];
    }
    uint64_t v14 = 130;
    goto LABEL_16;
  }
  id v8 = [v4 code];
  CFStringRef v9 = sub_100D2EC1C();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8 != (id)2)
  {
    if (v10)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Localization timed out; showing failure UI",
        (uint8_t *)&v16,
        2u);
    }

    uint64_t v14 = 2160;
LABEL_16:
    +[GEOAPPortal captureUserAction:v14 target:669 value:0];
    double v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:off_1015F7860 object:self];

    [(VLFContaineeViewController *)self _showFailure];
    goto LABEL_17;
  }
  if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "User canceled; dismissing ourselves",
      (uint8_t *)&v16,
      2u);
  }

  +[GEOAPPortal captureUserAction:131 target:669 value:0];
  [(VLFContaineeViewController *)self handleDismissAction:0];
LABEL_17:
}

- (void)scanningStateManager:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = sub_100D2EC1C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 2) > 3) {
      CFStringRef v7 = @"VLFScanningStateInitializing";
    }
    else {
      CFStringRef v7 = off_1013226F8[a4 - 2];
    }
    int v8 = 138412290;
    CFStringRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "State manager updated its state to %@", (uint8_t *)&v8, 0xCu);
  }

  [(VLFContaineeViewController *)self _updateForCurrentState];
}

- (void)failureViewDismissButtonTapped:(id)a3
{
  id v4 = sub_100D2EC1C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Failure view dismiss button tapped; dismissing ourselves",
      v5,
      2u);
  }

  [(VLFContaineeViewController *)self handleDismissAction:0];
}

- (void)failureViewRetryButtonTapped:(id)a3
{
  id v4 = sub_100D2EC1C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Failure view retry button tapped", v5, 2u);
  }

  [(VLFContaineeViewController *)self _retryVLFSession];
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (VLFSession)vlfSession
{
  return self->_vlfSession;
}

- (void)setVlfSession:(id)a3
{
}

- (VLFScanningStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (BOOL)isFailureVisible
{
  return self->_isFailureVisible;
}

- (void)setIsFailureVisible:(BOOL)a3
{
  self->_isFailureVisible = a3;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UIView)scanningContainerView
{
  return self->_scanningContainerView;
}

- (void)setScanningContainerView:(id)a3
{
}

- (VLFScanningInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
}

- (NSLayoutConstraint)instructionViewLeadingConstraint
{
  return self->_instructionViewLeadingConstraint;
}

- (void)setInstructionViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)instructionViewTrailingConstraint
{
  return self->_instructionViewTrailingConstraint;
}

- (void)setInstructionViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)instructionViewFirstBaselineConstraint
{
  return self->_instructionViewFirstBaselineConstraint;
}

- (void)setInstructionViewFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)instructionViewTopConstraint
{
  return self->_instructionViewTopConstraint;
}

- (void)setInstructionViewTopConstraint:(id)a3
{
}

- (VLFScanningAnimationView)scanningAnimationView
{
  return self->_scanningAnimationView;
}

- (void)setScanningAnimationView:(id)a3
{
}

- (NSLayoutConstraint)scanningAnimationViewFlexibleTopConstraintPortrait
{
  return self->_scanningAnimationViewFlexibleTopConstraintPortrait;
}

- (void)setScanningAnimationViewFlexibleTopConstraintPortrait:(id)a3
{
}

- (NSLayoutConstraint)scanningAnimationViewTopConstraintPortrait
{
  return self->_scanningAnimationViewTopConstraintPortrait;
}

- (void)setScanningAnimationViewTopConstraintPortrait:(id)a3
{
}

- (NSLayoutConstraint)scanningAnimationViewBottomConstraint
{
  return self->_scanningAnimationViewBottomConstraint;
}

- (void)setScanningAnimationViewBottomConstraint:(id)a3
{
}

- (VLFFailureView)failureView
{
  return self->_failureView;
}

- (void)setFailureView:(id)a3
{
}

- (NSLayoutConstraint)failureViewBottomConstraint
{
  return self->_failureViewBottomConstraint;
}

- (void)setFailureViewBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_failureView, 0);
  objc_storeStrong((id *)&self->_scanningAnimationViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scanningAnimationViewTopConstraintPortrait, 0);
  objc_storeStrong((id *)&self->_scanningAnimationViewFlexibleTopConstraintPortrait, 0);
  objc_storeStrong((id *)&self->_scanningAnimationView, 0);
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_instructionViewFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_instructionViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_scanningContainerView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);

  objc_storeStrong((id *)&self->_vlfSession, 0);
}

@end