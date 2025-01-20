@interface PedestrianARRaiseToEnterTeachableMomentContaineeViewController
+ (BOOL)hasShownTeachableMoment;
+ (void)setShownTeachableMoment:(BOOL)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isDarkMode;
- (MapsLoopingVideoPlayerView)playerView;
- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)init;
- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)initWithCoder:(id)a3;
- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)closeButton;
- (UILabel)titleLabel;
- (UIView)animationContainer;
- (double)heightForLayout:(unint64_t)a3;
- (id)_videoNameForCurrentState;
- (int64_t)floatingControlsOptions;
- (void)_updateForCurrentState;
- (void)dealloc;
- (void)setAnimationContainer:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation PedestrianARRaiseToEnterTeachableMomentContaineeViewController

- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  result = (PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (PedestrianARRaiseToEnterTeachableMomentContaineeViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  v2 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)&v9 initWithNibName:0 bundle:0];
  if (v2)
  {
    id v3 = sub_100D3AECC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v4 = [(ContaineeViewController *)v2 cardPresentationController];
    [v4 setHideGrabber:1];

    id v5 = [(ContaineeViewController *)v2 cardPresentationController];
    [v5 setAllowsSwipeToDismiss:0];

    id v6 = [(ContaineeViewController *)v2 cardPresentationController];
    [v6 setPresentedModally:1];

    v7 = [(ContaineeViewController *)v2 cardPresentationController];
    [v7 setTakesAvailableHeight:1];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = sub_100D3AECC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v116.receiver = self;
  v116.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  [(ContaineeViewController *)&v116 viewDidLoad];
  id v3 = [(ContaineeViewController *)self headerView];
  [v3 removeFromSuperview];

  objc_super v4 = [(ContaineeViewController *)self contentView];
  id v5 = [v4 topAnchor];
  id v6 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self view];
  v7 = [v6 topAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  v121 = v8;
  objc_super v9 = +[NSArray arrayWithObjects:&v121 count:1];
  +[NSLayoutConstraint activateConstraints:v9];

  v10 = +[UIColor colorNamed:@"TeachableMomentCardBackgoundColor"];
  v11 = [(ContaineeViewController *)self contentView];
  [v11 setBackgroundColor:v10];

  id v12 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v16 = [v12 initWithFrame:CGRectZero.origin.x, y, width, height];
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v19];
  [(UILabel *)self->_titleLabel setNumberOfLines:4];
  v20 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v20];

  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"Pedestrian_AR_raise_to_enter_teachable_moment_card_title_text" value:@"localized string not found" table:0];
  [(UILabel *)self->_titleLabel setText:v22];

  v23 = [(ContaineeViewController *)self contentView];
  [v23 addSubview:self->_titleLabel];

  if (+[VLFDeviceInfo isNotchDevice]) {
    double v24 = 56.0;
  }
  else {
    double v24 = 50.0;
  }
  v105 = [(UILabel *)*p_titleLabel leadingAnchor];
  v109 = [(ContaineeViewController *)self contentView];
  v101 = [v109 leadingAnchor];
  v97 = [v105 constraintEqualToAnchor:v101 constant:30.0];
  v120[0] = v97;
  v93 = [(UILabel *)*p_titleLabel trailingAnchor];
  v25 = [(ContaineeViewController *)self contentView];
  v26 = [v25 trailingAnchor];
  v27 = [v93 constraintEqualToAnchor:v26 constant:-27.0];
  v120[1] = v27;
  v28 = [(UILabel *)*p_titleLabel firstBaselineAnchor];
  v29 = [(ContaineeViewController *)self contentView];
  v30 = [v29 topAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:v24];
  v120[2] = v31;
  v32 = +[NSArray arrayWithObjects:v120 count:3];
  +[NSLayoutConstraint activateConstraints:v32];

  v33 = (UIView *)objc_alloc_init((Class)UIView);
  animationContainer = self->_animationContainer;
  self->_animationContainer = v33;

  [(UIView *)self->_animationContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [(ContaineeViewController *)self contentView];
  [v35 addSubview:self->_animationContainer];

  v106 = [(UIView *)self->_animationContainer leadingAnchor];
  v110 = [(ContaineeViewController *)self contentView];
  v102 = [v110 leadingAnchor];
  v98 = [v106 constraintEqualToAnchor:v102];
  v119[0] = v98;
  v90 = [(UIView *)self->_animationContainer trailingAnchor];
  v94 = [(ContaineeViewController *)self contentView];
  v87 = [v94 trailingAnchor];
  v36 = [v90 constraintEqualToAnchor:v87];
  v119[1] = v36;
  v37 = [(UIView *)self->_animationContainer topAnchor];
  v38 = [(UILabel *)*p_titleLabel bottomAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  v119[2] = v39;
  v40 = [(UIView *)self->_animationContainer heightAnchor];
  v41 = [(UIView *)self->_animationContainer widthAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 multiplier:0.720000029 constant:0.0];
  v119[3] = v42;
  v43 = +[NSArray arrayWithObjects:v119 count:4];
  +[NSLayoutConstraint activateConstraints:v43];

  v44 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  playerView = self->_playerView;
  self->_playerView = v44;

  [(MapsLoopingVideoPlayerView *)self->_playerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_animationContainer addSubview:self->_playerView];
  v111 = [(MapsLoopingVideoPlayerView *)self->_playerView leadingAnchor];
  v107 = [(UIView *)self->_animationContainer leadingAnchor];
  v103 = [v111 constraintEqualToAnchor:v107];
  v118[0] = v103;
  v99 = [(MapsLoopingVideoPlayerView *)self->_playerView trailingAnchor];
  v95 = [(UIView *)self->_animationContainer trailingAnchor];
  v91 = [v99 constraintEqualToAnchor:v95];
  v118[1] = v91;
  v88 = [(MapsLoopingVideoPlayerView *)self->_playerView topAnchor];
  v85 = [(UIView *)self->_animationContainer topAnchor];
  v83 = [v88 constraintGreaterThanOrEqualToAnchor:v85];
  v118[2] = v83;
  v81 = [(MapsLoopingVideoPlayerView *)self->_playerView bottomAnchor];
  v46 = [(UIView *)self->_animationContainer bottomAnchor];
  v47 = [v81 constraintLessThanOrEqualToAnchor:v46];
  v118[3] = v47;
  v48 = [(MapsLoopingVideoPlayerView *)self->_playerView centerYAnchor];
  v49 = [(UIView *)self->_animationContainer centerYAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v118[4] = v50;
  v51 = [(MapsLoopingVideoPlayerView *)self->_playerView heightAnchor];
  v52 = [(MapsLoopingVideoPlayerView *)self->_playerView widthAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 multiplier:0.580817044 constant:0.0];
  v118[5] = v53;
  v54 = +[NSArray arrayWithObjects:v118 count:6];
  +[NSLayoutConstraint activateConstraints:v54];

  objc_initWeak(&location, self);
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_100D3BCB0;
  v113[3] = &unk_1012E8CD0;
  objc_copyWeak(&v114, &location);
  v55 = +[UIAction actionWithHandler:v113];
  v56 = +[UIButton buttonWithType:1 primaryAction:v55];
  closeButton = self->_closeButton;
  self->_closeButton = v56;

  [(UIButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v58) = 1148846080;
  [(UIButton *)self->_closeButton setContentCompressionResistancePriority:1 forAxis:v58];
  v59 = [(UIButton *)self->_closeButton layer];
  [v59 setCornerRadius:12.0];

  v60 = +[UIColor systemBlueColor];
  [(UIButton *)self->_closeButton setBackgroundColor:v60];

  v61 = self->_closeButton;
  v62 = +[NSBundle mainBundle];
  v63 = [v62 localizedStringForKey:@"Pedestrian_AR_raise_to_enter_teachable_moment_card_ok_button_text" value:@"localized string not found" table:0];
  [(UIButton *)v61 setTitle:v63 forState:0];

  v64 = self->_closeButton;
  v65 = +[UIColor systemWhiteColor];
  [(UIButton *)v64 setTitleColor:v65 forState:0];

  v66 = [(ContaineeViewController *)self contentView];
  [v66 addSubview:self->_closeButton];

  v108 = [(UIButton *)self->_closeButton leadingAnchor];
  v112 = [(ContaineeViewController *)self contentView];
  v104 = [v112 leadingAnchor];
  v100 = [v108 constraintEqualToAnchor:v104 constant:24.0];
  v117[0] = v100;
  v92 = [(UIButton *)self->_closeButton trailingAnchor];
  v96 = [(ContaineeViewController *)self contentView];
  v89 = [v96 trailingAnchor];
  v86 = [v92 constraintEqualToAnchor:v89 constant:-24.0];
  v117[1] = v86;
  v84 = [(UIButton *)self->_closeButton topAnchor];
  v82 = [(UIView *)self->_animationContainer bottomAnchor];
  v80 = [v84 constraintEqualToAnchor:v82];
  v117[2] = v80;
  v79 = [(UIButton *)self->_closeButton heightAnchor];
  v78 = [v79 constraintEqualToConstant:50.0];
  v117[3] = v78;
  v77 = [(UIButton *)self->_closeButton bottomAnchor];
  v67 = [(ContaineeViewController *)self contentView];
  v68 = [v67 safeAreaLayoutGuide];
  v69 = [v68 bottomAnchor];
  LODWORD(v70) = 1148829696;
  v71 = [v77 constraintEqualToAnchor:v69 constant:-10.0 priority:v70];
  v117[4] = v71;
  v72 = [(UIButton *)self->_closeButton bottomAnchor];
  v73 = [(ContaineeViewController *)self contentView];
  v74 = [v73 bottomAnchor];
  v75 = [v72 constraintLessThanOrEqualToAnchor:v74 constant:-24.0];
  v117[5] = v75;
  v76 = +[NSArray arrayWithObjects:v117 count:6];
  +[NSLayoutConstraint activateConstraints:v76];

  [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self _updateForCurrentState];
  objc_destroyWeak(&v114);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  id v6 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self _updateForCurrentState];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  -[PedestrianARRaiseToEnterTeachableMomentContaineeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3);
  if (v4) {
    [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self _updateForCurrentState];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARRaiseToEnterTeachableMomentContaineeViewController;
  [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)&v3 viewDidAppear:a3];
  [(id)objc_opt_class() setShownTeachableMoment:1];
  +[GEOAPPortal captureUserAction:21 target:15 value:0];
}

+ (BOOL)hasShownTeachableMoment
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kHasShownPedestrianARRaiseToEnterTeachableMomentKey"];

  return v3;
}

+ (void)setShownTeachableMoment:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100D3AECC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = @"NO";
    if (v3) {
      objc_super v6 = @"YES";
    }
    id v7 = v6;
    int v10 = 134349314;
    id v11 = a1;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Setting hasShownTeachableMoment flag: %@", (uint8_t *)&v10, 0x16u);
  }
  objc_super v8 = +[NSUserDefaults standardUserDefaults];
  objc_super v9 = v8;
  if (v3) {
    [v8 setBool:1 forKey:@"kHasShownPedestrianARRaiseToEnterTeachableMomentKey"];
  }
  else {
    [v8 removeObjectForKey:@"kHasShownPedestrianARRaiseToEnterTeachableMomentKey"];
  }
}

- (BOOL)_isDarkMode
{
  v2 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (id)_videoNameForCurrentState
{
  unsigned int v2 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self _isDarkMode];
  unsigned __int8 v3 = +[VLFDeviceInfo isIslandDevice];
  if (v2)
  {
    if (v3) {
      return @"PedestrianAR_raise_to_enter_island_dark";
    }
    unsigned int v5 = +[VLFDeviceInfo isNotchDevice];
    CFStringRef v6 = @"PedestrianAR_raise_to_enter_notchless_dark";
    CFStringRef v7 = @"PedestrianAR_raise_to_enter_notch_dark";
  }
  else
  {
    if (v3) {
      return @"PedestrianAR_raise_to_enter_island_light";
    }
    unsigned int v5 = +[VLFDeviceInfo isNotchDevice];
    CFStringRef v6 = @"PedestrianAR_raise_to_enter_notchless_light";
    CFStringRef v7 = @"PedestrianAR_raise_to_enter_notch_light";
  }
  if (v5) {
    return (id)v7;
  }
  else {
    return (id)v6;
  }
}

- (void)_updateForCurrentState
{
  unsigned __int8 v3 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self _videoNameForCurrentState];
  BOOL v4 = sub_100D3AECC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating video: %@", buf, 0x16u);
  }

  id v5 = [objc_alloc((Class)NSDataAsset) initWithName:v3];
  CFStringRef v6 = [v5 data];
  v18[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v18[1] = AVAssetReferenceRestrictionsKey;
  v19[0] = &__kCFBooleanFalse;
  v19[1] = &off_1013AB7D0;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  objc_super v8 = +[AVAsset assetWithData:v6 contentType:AVFileTypeAppleM4V options:v7];

  objc_super v9 = +[AVPlayerItem playerItemWithAsset:v8];
  int v10 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self playerView];
  [v10 replaceCurrentItemWithPlayerItem:v9 preserveCurrentTimestamp:1];

  id v11 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self traitCollection];
  __int16 v12 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle1 weight:v11 compatibleWithTraitCollection:UIFontWeightBold];
  v13 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self titleLabel];
  [v13 setFont:v12];

  v14 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self traitCollection];
  v15 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleBody weight:v14 compatibleWithTraitCollection:UIFontWeightSemibold];
  v16 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self closeButton];
  v17 = [v16 titleLabel];
  [v17 setFont:v15];
}

- (int64_t)floatingControlsOptions
{
  return 267;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  if (a3 > 7 || ((1 << a3) & 0xA3) == 0)
  {
    BOOL v4 = sub_100D3AECC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134349056;
      CFStringRef v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Layout changed to landscape; dismissing",
        (uint8_t *)&v5,
        0xCu);
    }

    [(ContaineeViewController *)self handleDismissAction:0];
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    int v5 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self view];
    CFStringRef v6 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self view];
    [v6 frame];
    double v8 = v7;
    LODWORD(v7) = 1148846080;
    LODWORD(v9) = 1112014848;
    [v5 systemLayoutSizeFittingSize:v8 withHorizontalFittingPriority:UILayoutFittingCompressedSize.height verticalFittingPriority:v7, v9];
    double v3 = v10;

    id v11 = [(PedestrianARRaiseToEnterTeachableMomentContaineeViewController *)self view];
    [v11 safeAreaInsets];
    double v13 = v12;

    if (v13 == 0.0)
    {
      v14 = [(ContaineeViewController *)self cardPresentationController];
      [v14 bottomSafeOffset];
      double v3 = v3 + v15;
    }
  }
  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)animationContainer
{
  return self->_animationContainer;
}

- (void)setAnimationContainer:(id)a3
{
}

- (MapsLoopingVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_animationContainer, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end