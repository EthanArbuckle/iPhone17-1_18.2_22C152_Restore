@interface NavVoiceVolumeViewController
- (BOOL)_canShowWhileLocked;
- (NavVoiceVolumeControlContaineeViewControllerDelegate)voiceVolumeControlDelegate;
- (NavVoiceVolumeViewController)initWithDelegate:(id)a3;
- (double)heightForLayout:(unint64_t)a3;
- (id)_effectiveTraitCollection;
- (id)_maximumContentSizeCategory;
- (id)contentView;
- (id)headerView;
- (int64_t)currentSelectionForAudioControlView:(id)a3;
- (void)_updateFonts;
- (void)audioControlView:(id)a3 didSelectAudioType:(int64_t)a4;
- (void)dealloc;
- (void)dismissAfterDelay;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NavVoiceVolumeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavVoiceVolumeViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NavVoiceVolumeViewController;
  v5 = [(NavVoiceVolumeViewController *)&v13 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setBlurInCardView:0];

    v8 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v9 = [(ContaineeViewController *)v6 cardPresentationController];
    [v9 setCardColor:v8];

    objc_storeWeak((id *)&v6->_voiceVolumeControlDelegate, v4);
  }
  uint64_t v10 = _GEOConfigAddBlockListenerForKey();
  id geoConfigListener = v6->_geoConfigListener;
  v6->_id geoConfigListener = (id)v10;

  return v6;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  id geoConfigListener = self->_geoConfigListener;
  self->_id geoConfigListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)NavVoiceVolumeViewController;
  [(NavVoiceVolumeViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v106.receiver = self;
  v106.super_class = (Class)NavVoiceVolumeViewController;
  [(ContaineeViewController *)&v106 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setEdgeAttachedRegularHeightDimmingBehavior:2];

  objc_super v4 = (ContainerHeaderView *)objc_opt_new();
  trayHeader = self->_trayHeader;
  self->_trayHeader = v4;

  [(ContainerHeaderView *)self->_trayHeader setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_trayHeader setDelegate:self];
  [(ContainerHeaderView *)self->_trayHeader setHairLineAlpha:0.0];
  [(ContainerHeaderView *)self->_trayHeader setHeaderSize:2];
  v6 = [(NavVoiceVolumeViewController *)self view];
  [v6 addSubview:self->_trayHeader];

  v7 = (UILabel *)objc_opt_new();
  [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v7 setNumberOfLines:1];
  LODWORD(v8) = 1148846080;
  [(UILabel *)v7 setContentHuggingPriority:1 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [(UILabel *)v7 setContentCompressionResistancePriority:1 forAxis:v9];
  uint64_t v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Voice Volume [Nav, Tray]", @"localized string not found", 0 value table];
  [(UILabel *)v7 setText:v11];

  [(UILabel *)v7 setAccessibilityIdentifier:@"HeaderLabel"];
  v12 = objc_opt_new();
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 addSubview:v7];
  objc_super v13 = (UILayoutGuide *)objc_opt_new();
  [v12 addLayoutGuide:v13];
  labelGrowLayoutGuide = self->_labelGrowLayoutGuide;
  self->_labelGrowLayoutGuide = v13;
  v15 = v13;

  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;
  v17 = v7;

  [(ContainerHeaderView *)self->_trayHeader setTitleView:v12];
  v18 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v18;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView setAccessibilityIdentifier:@"NavVoiceVolumeContent"];
  v20 = [(NavVoiceVolumeViewController *)self view];
  [v20 addSubview:self->_contentView];

  v21 = [[VoiceVolumeControlView alloc] initWithDelegate:self];
  [(VoiceVolumeControlView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  controlView = self->_controlView;
  self->_controlView = v21;
  v23 = v21;

  v24 = [(NavVoiceVolumeViewController *)self contentView];
  [v24 addSubview:v23];

  v104 = [(ContainerHeaderView *)self->_trayHeader topAnchor];
  v105 = [(NavVoiceVolumeViewController *)self view];
  v103 = [v105 topAnchor];
  v102 = [v104 constraintEqualToAnchor:v103];
  v107[0] = v102;
  v100 = [(ContainerHeaderView *)self->_trayHeader leadingAnchor];
  v101 = [(NavVoiceVolumeViewController *)self view];
  v99 = [v101 leadingAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v107[1] = v98;
  v96 = [(ContainerHeaderView *)self->_trayHeader trailingAnchor];
  v97 = [(NavVoiceVolumeViewController *)self view];
  v95 = [v97 trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v107[2] = v94;
  v92 = [(UIView *)self->_contentView leadingAnchor];
  v93 = [(NavVoiceVolumeViewController *)self view];
  v91 = [v93 leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v107[3] = v90;
  v88 = [(UIView *)self->_contentView trailingAnchor];
  v89 = [(NavVoiceVolumeViewController *)self view];
  v87 = [v89 trailingAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v107[4] = v86;
  v85 = [(UIView *)self->_contentView topAnchor];
  v84 = [(ContainerHeaderView *)self->_trayHeader bottomAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v107[5] = v83;
  v81 = [(UIView *)self->_contentView bottomAnchor];
  v82 = [(NavVoiceVolumeViewController *)self view];
  v80 = [v82 bottomAnchor];
  LODWORD(v25) = 1144750080;
  v79 = [v81 constraintEqualToAnchor:v80 constant:-32.0 priority:v25];
  v107[6] = v79;
  v77 = [(VoiceVolumeControlView *)self->_controlView bottomAnchor];
  v78 = [(NavVoiceVolumeViewController *)self view];
  v76 = [v78 bottomAnchor];
  LODWORD(v26) = 1148846080;
  v75 = [v77 constraintLessThanOrEqualToAnchor:v76 constant:0.0 priority:v26];
  v107[7] = v75;
  v74 = [v12 heightAnchor];
  v72 = [v74 constraintEqualToConstant:82.0];
  v107[8] = v72;
  v71 = [v12 leadingAnchor];
  v70 = [(ContainerHeaderView *)self->_trayHeader leadingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v107[9] = v69;
  v68 = [v12 topAnchor];
  v67 = [(ContainerHeaderView *)self->_trayHeader topAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v107[10] = v66;
  v65 = [(UILabel *)v17 leadingAnchor];
  v64 = [v12 leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:16.0];
  v107[11] = v63;
  v62 = [(UILabel *)v17 topAnchor];
  v73 = v12;
  v61 = [v12 topAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:16.0];
  v107[12] = v60;
  v59 = [(UILabel *)v17 bottomAnchor];
  v27 = v15;
  v58 = [(UILayoutGuide *)v15 topAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v107[13] = v57;
  v56 = [(UILayoutGuide *)v15 leadingAnchor];
  v43 = v17;
  v55 = [(UILabel *)v17 leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v107[14] = v54;
  v53 = [(UILayoutGuide *)v15 widthAnchor];
  v52 = [(UILabel *)v17 widthAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v107[15] = v51;
  v50 = [(UILayoutGuide *)v15 bottomAnchor];
  v49 = [v12 bottomAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v107[16] = v48;
  v47 = [(UILayoutGuide *)v15 heightAnchor];
  LODWORD(v28) = 1144750080;
  v46 = [v47 constraintEqualToConstant:16.0 priority:v28];
  v107[17] = v46;
  v45 = [(UILayoutGuide *)v15 heightAnchor];
  v44 = [v45 constraintGreaterThanOrEqualToConstant:0.0];
  v107[18] = v44;
  v29 = v23;
  v42 = [(VoiceVolumeControlView *)v23 topAnchor];
  v41 = [(UIView *)self->_contentView topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v107[19] = v40;
  v39 = [(VoiceVolumeControlView *)v23 bottomAnchor];
  v38 = [(UIView *)self->_contentView bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v107[20] = v37;
  v30 = [(VoiceVolumeControlView *)v23 centerXAnchor];
  v31 = [(UIView *)self->_contentView centerXAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v107[21] = v32;
  v33 = [(VoiceVolumeControlView *)v23 leftAnchor];
  v34 = [(UIView *)self->_contentView leftAnchor];
  v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34 constant:16.0];
  v107[22] = v35;
  v36 = +[NSArray arrayWithObjects:v107 count:23];
  +[NSLayoutConstraint activateConstraints:v36];

  [(NavVoiceVolumeViewController *)self _updateFonts];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavVoiceVolumeViewController;
  [(ContaineeViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setHideGrabber:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavVoiceVolumeViewController;
  [(NavVoiceVolumeViewController *)&v5 viewDidAppear:a3];
  [(NavVoiceVolumeViewController *)self dismissAfterDelay];
  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 updateHeightForCurrentLayout];
}

- (void)audioControlView:(id)a3 didSelectAudioType:(int64_t)a4
{
  v6 = sub_10000AF10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User setting volume %d", (uint8_t *)v8, 8u);
  }

  GEOConfigSetSyncInteger();
  v7 = [(NavVoiceVolumeViewController *)self voiceVolumeControlDelegate];
  [v7 voiceVolumeViewController:self selectedVoiceVolumeOption:a4];

  [(NavVoiceVolumeViewController *)self dismissAfterDelay];
}

- (int64_t)currentSelectionForAudioControlView:(id)a3
{
  return GEOConfigGetInteger();
}

- (void)dismissAfterDelay
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C5F750;
  v6[3] = &unk_1012E7638;
  objc_copyWeak(&v7, &location);
  objc_super v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:10.0];
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)headerView
{
  return self->_trayHeader;
}

- (id)contentView
{
  return self->_contentView;
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 2)
  {
    [(ContaineeViewController *)self headerHeight];
    double v8 = v9 + 150.0;
    goto LABEL_5;
  }
  double v4 = -1.0;
  if (a3 == 1)
  {
    [(ContaineeViewController *)self headerHeight];
    double v6 = v5;
    [(UILayoutGuide *)self->_labelGrowLayoutGuide layoutFrame];
    double v8 = v6 - v7;
LABEL_5:
    uint64_t v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 bottomSafeOffset];
    double v4 = v8 + v11;
  }
  return v4;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = [(NavVoiceVolumeViewController *)self voiceVolumeControlDelegate];
  [v5 dismissVoiceVolumeControlViewController:self];
}

- (void)headerViewTapped:(id)a3
{
  double v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  double v6 = [(ContaineeViewController *)self cardPresentationController];
  id v8 = v6;
  if (v5 == (id)1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 wantsLayout:v7];
}

- (void)_updateFonts
{
  id v4 = [(NavVoiceVolumeViewController *)self _effectiveTraitCollection];
  id v3 = +[UIFont system28BoldCompatibleWithTraitCollection:v4];
  [(UILabel *)self->_titleLabel setFont:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NavVoiceVolumeViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = [(NavVoiceVolumeViewController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(NavVoiceVolumeViewController *)self _updateFonts];
  }
}

- (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (id)_effectiveTraitCollection
{
  id v3 = [(NavVoiceVolumeViewController *)self traitCollection];
  id v4 = [(NavVoiceVolumeViewController *)self _maximumContentSizeCategory];
  id v5 = [v3 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:v4];

  return v5;
}

- (NavVoiceVolumeControlContaineeViewControllerDelegate)voiceVolumeControlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceVolumeControlDelegate);

  return (NavVoiceVolumeControlContaineeViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceVolumeControlDelegate);
  objc_storeStrong(&self->_geoConfigListener, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_labelGrowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_controlView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_trayHeader, 0);
}

@end