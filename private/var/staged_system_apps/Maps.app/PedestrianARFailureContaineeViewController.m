@interface PedestrianARFailureContaineeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isLandscape;
- (NSLayoutConstraint)dismissButtonHeightConstraint;
- (NSLayoutConstraint)labelContainerLeadingConstraint;
- (NSLayoutConstraint)labelContainerTrailingConstraint;
- (NSLayoutConstraint)retryButtonBottomConstraint;
- (NSLayoutConstraint)retryButtonHeightConstraint;
- (NSLayoutConstraint)titleLabelFirstBaselineConstraint;
- (NSLayoutConstraint)topContainerTopConstraint;
- (PedestrianARFailureContaineeDelegate)failureContaineeDelegate;
- (PedestrianARFailureContaineeViewController)initWithEntryPoint:(int64_t)a3;
- (UIButton)dismissButton;
- (UIButton)retryButton;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (double)heightForLayout:(unint64_t)a3;
- (int64_t)entryPoint;
- (void)_dismissButtonTapped:(id)a3;
- (void)_retryButtonTapped:(id)a3;
- (void)_updateFonts;
- (void)_updateForCurrentLayout;
- (void)dealloc;
- (void)didChangeContainerStyle:(unint64_t)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setDismissButtonHeightConstraint:(id)a3;
- (void)setEntryPoint:(int64_t)a3;
- (void)setFailureContaineeDelegate:(id)a3;
- (void)setLabelContainerLeadingConstraint:(id)a3;
- (void)setLabelContainerTrailingConstraint:(id)a3;
- (void)setRetryButton:(id)a3;
- (void)setRetryButtonBottomConstraint:(id)a3;
- (void)setRetryButtonHeightConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelFirstBaselineConstraint:(id)a3;
- (void)setTopContainerTopConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PedestrianARFailureContaineeViewController

- (PedestrianARFailureContaineeViewController)initWithEntryPoint:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PedestrianARFailureContaineeViewController;
  v4 = [(PedestrianARFailureContaineeViewController *)&v14 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = sub_100A40EF4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v16 = v4;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing with entry point: %ld", buf, 0x16u);
    }

    v4->_entryPoint = a3;
    v6 = +[MapsARSessionManager sharedManager];
    [v6 requestSessionWithOwner:v4];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v4 selector:"pedestrianARViewControllerDidDisappearNotification:" name:@"PedestrianARViewControllerDidDisappearNotification" object:0];

    v8 = [(ContaineeViewController *)v4 cardPresentationController];
    [v8 setHideGrabber:1];

    v9 = [(ContaineeViewController *)v4 cardPresentationController];
    [v9 setAllowsSwipeToDismiss:0];

    v10 = [(ContaineeViewController *)v4 cardPresentationController];
    [v10 setPresentedModally:1];

    v11 = [(ContaineeViewController *)v4 cardPresentationController];
    [v11 setTakesAvailableHeight:1];

    v12 = [(ContaineeViewController *)v4 cardPresentationController];
    [v12 setEdgeAttachedRegularHeightDimmingBehavior:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100A40EF4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4 = +[MapsARSessionManager sharedManager];
  [v4 resignSessionWithOwner:self];

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFailureContaineeViewController;
  [(PedestrianARFailureContaineeViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v171.receiver = self;
  v171.super_class = (Class)PedestrianARFailureContaineeViewController;
  [(ContaineeViewController *)&v171 viewDidLoad];
  [(PedestrianARFailureContaineeViewController *)self setOverrideUserInterfaceStyle:2];
  v3 = +[UIColor clearColor];
  v4 = [(PedestrianARFailureContaineeViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [objc_alloc((Class)MUBlurView) initWithBlurEffectStyle:19];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = +[UIColor systemBackgroundColor];
  [v5 setNonBlurredColor:v6];

  v7 = [(PedestrianARFailureContaineeViewController *)self view];
  [v7 addSubview:v5];

  v166 = [v5 leadingAnchor];
  v168 = [(PedestrianARFailureContaineeViewController *)self view];
  v161 = [v168 leadingAnchor];
  v158 = [v166 constraintEqualToAnchor:v161];
  v182[0] = v158;
  v151 = [v5 trailingAnchor];
  v154 = [(PedestrianARFailureContaineeViewController *)self view];
  v149 = [v154 trailingAnchor];
  v147 = [v151 constraintEqualToAnchor:v149];
  v182[1] = v147;
  v8 = v5;
  v165 = v5;
  v9 = [v5 topAnchor];
  v10 = [(PedestrianARFailureContaineeViewController *)self view];
  v11 = [v10 topAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v182[2] = v12;
  v13 = [v8 bottomAnchor];
  objc_super v14 = [(PedestrianARFailureContaineeViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v182[3] = v16;
  __int16 v17 = +[NSArray arrayWithObjects:v182 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  id v18 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v22 = [v18 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [(PedestrianARFailureContaineeViewController *)self view];
  [v23 addSubview:v22];

  v24 = [v22 topAnchor];
  v25 = [(PedestrianARFailureContaineeViewController *)self view];
  v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  topContainerTopConstraint = self->_topContainerTopConstraint;
  self->_topContainerTopConstraint = v27;

  v169 = [v22 leadingAnchor];
  v29 = [(PedestrianARFailureContaineeViewController *)self view];
  v30 = [v29 leadingAnchor];
  v31 = [v169 constraintEqualToAnchor:v30];
  v181[0] = v31;
  v32 = [v22 trailingAnchor];
  v33 = [(PedestrianARFailureContaineeViewController *)self view];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v36 = self->_topContainerTopConstraint;
  v181[1] = v35;
  v181[2] = v36;
  v37 = +[NSArray arrayWithObjects:v181 count:3];
  +[NSLayoutConstraint activateConstraints:v37];

  id v38 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v39) = 1148846080;
  [v38 setContentHuggingPriority:1 forAxis:v39];
  v40 = v22;
  [v22 addSubview:v38];
  v41 = [v38 leadingAnchor];
  v42 = [v22 leadingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42 constant:26.0];
  labelContainerLeadingConstraint = self->_labelContainerLeadingConstraint;
  self->_labelContainerLeadingConstraint = v43;

  v45 = [v38 trailingAnchor];
  v46 = [v22 trailingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:-26.0];
  labelContainerTrailingConstraint = self->_labelContainerTrailingConstraint;
  self->_labelContainerTrailingConstraint = v47;

  v49 = self->_labelContainerTrailingConstraint;
  v180[0] = self->_labelContainerLeadingConstraint;
  v180[1] = v49;
  v162 = [v38 topAnchor];
  v50 = [v22 topAnchor];
  v51 = [v162 constraintGreaterThanOrEqualToAnchor:v50];
  v180[2] = v51;
  v52 = v38;
  v170 = v38;
  v53 = [v38 bottomAnchor];
  v167 = v40;
  v54 = [v40 bottomAnchor];
  v55 = [v53 constraintLessThanOrEqualToAnchor:v54];
  v180[3] = v55;
  v56 = [v52 centerYAnchor];
  v57 = [v40 centerYAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  v180[4] = v58;
  v59 = +[NSArray arrayWithObjects:v180 count:5];
  +[NSLayoutConstraint activateConstraints:v59];

  v60 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v60;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  LODWORD(v62) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v62];
  v63 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v63];

  v64 = +[NSBundle mainBundle];
  v65 = [v64 localizedStringForKey:@"Pedestrian_AR_failure_title_text" value:@"localized string not found" table:0];
  [(UILabel *)self->_titleLabel setText:v65];

  [v170 addSubview:self->_titleLabel];
  v66 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v67 = [v167 topAnchor];
  v68 = [v66 constraintEqualToAnchor:v67 constant:60.0];
  titleLabelFirstBaselineConstraint = self->_titleLabelFirstBaselineConstraint;
  self->_titleLabelFirstBaselineConstraint = v68;

  v163 = [(UILabel *)self->_titleLabel leadingAnchor];
  v70 = [v170 leadingAnchor];
  v71 = [v163 constraintEqualToAnchor:v70];
  v179[0] = v71;
  v72 = [(UILabel *)self->_titleLabel trailingAnchor];
  v73 = [v170 trailingAnchor];
  v74 = [v72 constraintEqualToAnchor:v73];
  v179[1] = v74;
  v75 = [(UILabel *)self->_titleLabel topAnchor];
  v76 = [v170 topAnchor];
  v77 = [v75 constraintEqualToAnchor:v76];
  v78 = self->_titleLabelFirstBaselineConstraint;
  v179[2] = v77;
  v179[3] = v78;
  v79 = +[NSArray arrayWithObjects:v179 count:4];
  +[NSLayoutConstraint activateConstraints:v79];

  v80 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v80;

  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_descriptionLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:5];
  LODWORD(v82) = 1148846080;
  [(UILabel *)self->_descriptionLabel setContentCompressionResistancePriority:1 forAxis:v82];
  v83 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3];
  UIFontDescriptorAttributeName v177 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v175 = UIFontWeightTrait;
  v84 = +[NSNumber numberWithDouble:UIFontWeightRegular];
  v176 = v84;
  v85 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
  v178 = v85;
  v86 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
  v164 = [v83 fontDescriptorByAddingAttributes:v86];

  v87 = +[UIFont fontWithDescriptor:v164 size:0.0];
  [(UILabel *)self->_descriptionLabel setFont:v87];

  v88 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_descriptionLabel setTextColor:v88];

  v89 = +[NSBundle mainBundle];
  v90 = [v89 localizedStringForKey:@"Pedestrian_AR_failure_description_text" value:@"localized string not found" table:0];
  [(UILabel *)self->_descriptionLabel setText:v90];

  [v170 addSubview:self->_descriptionLabel];
  v155 = [(UILabel *)self->_descriptionLabel leadingAnchor];
  v152 = [v170 leadingAnchor];
  v150 = [v155 constraintEqualToAnchor:v152];
  v174[0] = v150;
  v148 = [(UILabel *)self->_descriptionLabel trailingAnchor];
  v91 = [v170 trailingAnchor];
  v92 = [v148 constraintEqualToAnchor:v91];
  v174[1] = v92;
  v93 = [(UILabel *)self->_descriptionLabel topAnchor];
  v94 = [(UILabel *)self->_titleLabel bottomAnchor];
  v95 = [v93 constraintEqualToAnchor:v94 constant:15.0];
  v174[2] = v95;
  v96 = [(UILabel *)self->_descriptionLabel bottomAnchor];
  v97 = [v170 bottomAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  v174[3] = v98;
  v99 = +[NSArray arrayWithObjects:v174 count:4];
  +[NSLayoutConstraint activateConstraints:v99];

  v100 = +[UIButton buttonWithType:1];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v100;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v102 = [(UIButton *)self->_dismissButton layer];
  [v102 setCornerRadius:12.0];

  v103 = +[UIColor systemBlueColor];
  [(UIButton *)self->_dismissButton setBackgroundColor:v103];

  v104 = self->_dismissButton;
  v105 = +[UIColor systemWhiteColor];
  [(UIButton *)v104 setTitleColor:v105 forState:0];

  v106 = self->_dismissButton;
  v107 = +[NSBundle mainBundle];
  v108 = [v107 localizedStringForKey:@"Pedestrian_AR_failure_dismiss_button_text" value:@"localized string not found" table:0];
  [(UIButton *)v106 setTitle:v108 forState:0];

  [(UIButton *)self->_dismissButton addTarget:self action:"_dismissButtonTapped:" forControlEvents:64];
  v109 = [(PedestrianARFailureContaineeViewController *)self view];
  [v109 addSubview:self->_dismissButton];

  v110 = [(UIButton *)self->_dismissButton heightAnchor];
  v111 = [v110 constraintEqualToConstant:50.0];
  dismissButtonHeightConstraint = self->_dismissButtonHeightConstraint;
  self->_dismissButtonHeightConstraint = v111;

  v159 = [(UIButton *)self->_dismissButton leadingAnchor];
  v156 = [v170 leadingAnchor];
  v113 = [v159 constraintEqualToAnchor:v156];
  v173[0] = v113;
  v114 = [(UIButton *)self->_dismissButton trailingAnchor];
  v115 = [v170 trailingAnchor];
  v116 = [v114 constraintEqualToAnchor:v115];
  v173[1] = v116;
  v117 = [(UIButton *)self->_dismissButton topAnchor];
  v118 = [v167 bottomAnchor];
  v119 = [v117 constraintEqualToAnchor:v118 constant:26.0];
  v120 = self->_dismissButtonHeightConstraint;
  v173[2] = v119;
  v173[3] = v120;
  v121 = +[NSArray arrayWithObjects:v173 count:4];
  +[NSLayoutConstraint activateConstraints:v121];

  v122 = +[UIButton buttonWithType:1];
  retryButton = self->_retryButton;
  self->_retryButton = v122;

  [(UIButton *)self->_retryButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v124 = +[UIColor clearColor];
  [(UIButton *)self->_retryButton setBackgroundColor:v124];

  v125 = self->_retryButton;
  v126 = +[UIColor systemWhiteColor];
  [(UIButton *)v125 setTitleColor:v126 forState:0];

  v127 = self->_retryButton;
  v128 = +[NSBundle mainBundle];
  v129 = [v128 localizedStringForKey:@"Pedestrian_AR_failure_retry_button_text" value:@"localized string not found" table:0];
  [(UIButton *)v127 setTitle:v129 forState:0];

  [(UIButton *)self->_retryButton addTarget:self action:"_retryButtonTapped:" forControlEvents:64];
  v130 = [(PedestrianARFailureContaineeViewController *)self view];
  [v130 addSubview:self->_retryButton];

  v131 = [(UIButton *)self->_retryButton bottomAnchor];
  v132 = [(PedestrianARFailureContaineeViewController *)self view];
  v133 = [v132 bottomAnchor];
  v134 = [v131 constraintEqualToAnchor:v133];
  retryButtonBottomConstraint = self->_retryButtonBottomConstraint;
  self->_retryButtonBottomConstraint = v134;

  v136 = [(UIButton *)self->_retryButton heightAnchor];
  v137 = [v136 constraintEqualToConstant:50.0];
  retryButtonHeightConstraint = self->_retryButtonHeightConstraint;
  self->_retryButtonHeightConstraint = v137;

  v160 = [(UIButton *)self->_retryButton leadingAnchor];
  v157 = [v170 leadingAnchor];
  v153 = [v160 constraintEqualToAnchor:v157];
  v172[0] = v153;
  v139 = [(UIButton *)self->_retryButton trailingAnchor];
  v140 = [v170 trailingAnchor];
  v141 = [v139 constraintEqualToAnchor:v140];
  v172[1] = v141;
  v142 = [(UIButton *)self->_retryButton topAnchor];
  v143 = [(UIButton *)self->_dismissButton bottomAnchor];
  v144 = [v142 constraintEqualToAnchor:v143 constant:4.0];
  v145 = self->_retryButtonBottomConstraint;
  v172[2] = v144;
  v172[3] = v145;
  v172[4] = self->_retryButtonHeightConstraint;
  v146 = +[NSArray arrayWithObjects:v172 count:5];
  +[NSLayoutConstraint activateConstraints:v146];

  [(PedestrianARFailureContaineeViewController *)self _updateForCurrentLayout];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFailureContaineeViewController;
  [(ContaineeViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v3 containerStyle];

  if (v4) {
    [(PedestrianARFailureContaineeViewController *)self _updateForCurrentLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARFailureContaineeViewController;
  [(MapsThemeViewController *)&v9 traitCollectionDidChange:v4];
  if (!v4) {
    goto LABEL_3;
  }
  objc_super v5 = [(PedestrianARFailureContaineeViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

  if (v8) {
LABEL_3:
  }
    [(PedestrianARFailureContaineeViewController *)self _updateForCurrentLayout];
}

- (void)_updateForCurrentLayout
{
  unsigned int v3 = [(PedestrianARFailureContaineeViewController *)self _isLandscape];
  id v4 = [(PedestrianARFailureContaineeViewController *)self titleLabel];
  objc_super v5 = v4;
  if (v3)
  {
    [v4 setNumberOfLines:2];

    v6 = [(PedestrianARFailureContaineeViewController *)self descriptionLabel];
    [v6 setNumberOfLines:0];

    v7 = [(PedestrianARFailureContaineeViewController *)self topContainerTopConstraint];
    [v7 setConstant:24.0];

    NSComparisonResult v8 = [(PedestrianARFailureContaineeViewController *)self titleLabelFirstBaselineConstraint];
    [v8 setActive:0];

    objc_super v9 = [(PedestrianARFailureContaineeViewController *)self labelContainerLeadingConstraint];
    [v9 setConstant:24.0];

    v10 = [(PedestrianARFailureContaineeViewController *)self labelContainerTrailingConstraint];
    [v10 setConstant:-24.0];

    v11 = [(ContaineeViewController *)self cardPresentationController];
    id v12 = [v11 containerStyle];

    v13 = [(PedestrianARFailureContaineeViewController *)self view];
    objc_super v14 = v13;
    if (v12 == (id)6)
    {
      v15 = [(PedestrianARFailureContaineeViewController *)self view];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      v24 = [(PedestrianARFailureContaineeViewController *)self view];
      v25 = [v24 window];
      [v14 convertRect:v25 toView:v17];
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;

      v34 = [(PedestrianARFailureContaineeViewController *)self view];
      v35 = [v34 window];
      [v35 frame];
      double v37 = v36;
      v66.origin.x = v27;
      v66.origin.double y = v29;
      v66.size.double width = v31;
      v66.size.double height = v33;
      double v38 = v37 - CGRectGetMaxY(v66);

      double v39 = [(PedestrianARFailureContaineeViewController *)self view];
      v40 = [v39 window];
      [v40 frame];
      double v42 = -(v41 * 0.07 - v38);
      v43 = [(PedestrianARFailureContaineeViewController *)self retryButtonBottomConstraint];
      [v43 setConstant:v42];

      v44 = sub_100A40EF4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        int v64 = 134349056;
        v65 = self;
        v45 = "[%{public}p] Laying out for landscape floating";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, v45, (uint8_t *)&v64, 0xCu);
      }
    }
    else
    {
      v60 = [v13 window];
      [v60 frame];
      double v62 = v61 * -0.07;
      v63 = [(PedestrianARFailureContaineeViewController *)self retryButtonBottomConstraint];
      [v63 setConstant:v62];

      v44 = sub_100A40EF4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        int v64 = 134349056;
        v65 = self;
        v45 = "[%{public}p] Laying out for landscape fixed";
        goto LABEL_12;
      }
    }
  }
  else
  {
    [v4 setNumberOfLines:3];

    v46 = [(PedestrianARFailureContaineeViewController *)self traitCollection];
    v47 = [v46 preferredContentSizeCategory];
    uint64_t v48 = sub_1000E93B0(v47, UIContentSizeCategoryExtraLarge);

    v49 = [(PedestrianARFailureContaineeViewController *)self descriptionLabel];
    v50 = v49;
    if (v48 == 1) {
      uint64_t v51 = 6;
    }
    else {
      uint64_t v51 = 5;
    }
    [v49 setNumberOfLines:v51];

    v52 = [(PedestrianARFailureContaineeViewController *)self topContainerTopConstraint];
    [v52 setConstant:0.0];

    v53 = [(PedestrianARFailureContaineeViewController *)self titleLabelFirstBaselineConstraint];
    [v53 setActive:1];

    v54 = [(PedestrianARFailureContaineeViewController *)self labelContainerLeadingConstraint];
    [v54 setConstant:26.0];

    v55 = [(PedestrianARFailureContaineeViewController *)self labelContainerTrailingConstraint];
    [v55 setConstant:-26.0];

    v56 = [(ContaineeViewController *)self cardPresentationController];
    [v56 bottomSafeOffset];
    double v58 = -(v57 + 10.0);
    v59 = [(PedestrianARFailureContaineeViewController *)self retryButtonBottomConstraint];
    [v59 setConstant:v58];

    v44 = sub_100A40EF4();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      int v64 = 134349056;
      v65 = self;
      v45 = "[%{public}p] Laying out for portrait";
      goto LABEL_12;
    }
  }

  [(PedestrianARFailureContaineeViewController *)self _updateFonts];
}

- (void)_updateFonts
{
  unsigned int v3 = [(PedestrianARFailureContaineeViewController *)self _isLandscape];
  UIContentSizeCategory v4 = UIContentSizeCategoryExtraExtraExtraLarge;
  if (!v3) {
    UIContentSizeCategory v4 = UIContentSizeCategoryAccessibilityLarge;
  }
  CGFloat v31 = v4;
  unsigned int v5 = [(PedestrianARFailureContaineeViewController *)self _isLandscape];
  UIContentSizeCategory v6 = UIContentSizeCategoryExtraLarge;
  if (!v5) {
    UIContentSizeCategory v6 = UIContentSizeCategoryAccessibilityLarge;
  }
  v7 = v6;
  NSComparisonResult v8 = [(PedestrianARFailureContaineeViewController *)self traitCollection];
  objc_super v9 = [v8 _maps_traitCollectionWithMaximumContentSizeCategory:v31];

  v10 = [(PedestrianARFailureContaineeViewController *)self traitCollection];
  v11 = [v10 _maps_traitCollectionWithMaximumContentSizeCategory:v7];

  id v12 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle2 weight:v9 compatibleWithTraitCollection:UIFontWeightBold];
  v13 = [(PedestrianARFailureContaineeViewController *)self titleLabel];
  [v13 setFont:v12];

  objc_super v14 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle3 weight:v11 compatibleWithTraitCollection:UIFontWeightRegular];
  v15 = [(PedestrianARFailureContaineeViewController *)self descriptionLabel];
  [v15 setFont:v14];

  double v16 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleBody weight:v11 compatibleWithTraitCollection:UIFontWeightSemibold];
  double v17 = [(PedestrianARFailureContaineeViewController *)self retryButton];
  double v18 = [v17 titleLabel];
  [v18 setFont:v16];

  [v16 lineHeight];
  double v20 = v19;
  [v16 leading];
  double v22 = v20 + v21 + 28.0;
  double v23 = [(PedestrianARFailureContaineeViewController *)self retryButtonHeightConstraint];
  [v23 setConstant:v22];

  v24 = [(PedestrianARFailureContaineeViewController *)self dismissButton];
  v25 = [v24 titleLabel];
  [v25 setFont:v16];

  [v16 lineHeight];
  double v27 = v26;
  [v16 leading];
  double v29 = v27 + v28 + 28.0;
  double v30 = [(PedestrianARFailureContaineeViewController *)self dismissButtonHeightConstraint];
  [v30 setConstant:v29];
}

- (BOOL)_isLandscape
{
  v2 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v3 = (unint64_t)[v2 containerStyle];
  unsigned int v4 = (v3 > 7) | (0x5Cu >> v3);

  return v4 & 1;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    [(PedestrianARFailureContaineeViewController *)self _updateForCurrentLayout];
    if ([(PedestrianARFailureContaineeViewController *)self _isLandscape])
    {
      unsigned int v5 = [(ContaineeViewController *)self cardPresentationController];
      [v5 availableHeight];
      double v3 = v6;
    }
    else
    {
      unsigned int v5 = [(PedestrianARFailureContaineeViewController *)self view];
      v7 = [(PedestrianARFailureContaineeViewController *)self view];
      [v7 frame];
      double v9 = v8;
      LODWORD(v8) = 1148846080;
      LODWORD(v10) = 1112014848;
      [v5 systemLayoutSizeFittingSize:v9 withHorizontalFittingPriority:UILayoutFittingCompressedSize.height verticalFittingPriority:v8 v10];
      double v3 = v11;
    }
  }
  return v3;
}

- (void)didChangeLayout:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFailureContaineeViewController;
  [(ContaineeViewController *)&v6 didChangeLayout:"didChangeLayout:"];
  unsigned int v5 = sub_100A40EF4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    double v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Did change layout to: %lu", buf, 0x16u);
  }

  [(PedestrianARFailureContaineeViewController *)self _updateForCurrentLayout];
}

- (void)didChangeContainerStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFailureContaineeViewController;
  -[ContaineeViewController didChangeContainerStyle:](&v6, "didChangeContainerStyle:");
  unsigned int v5 = sub_100A40EF4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    double v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Did change style to: %lu", buf, 0x16u);
  }

  [(PedestrianARFailureContaineeViewController *)self _updateForCurrentLayout];
}

- (void)_dismissButtonTapped:(id)a3
{
  unsigned int v4 = sub_100A40EF4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    double v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Dismiss button tapped", (uint8_t *)&v7, 0xCu);
  }

  if ([(PedestrianARFailureContaineeViewController *)self entryPoint]) {
    uint64_t v5 = 402;
  }
  else {
    uint64_t v5 = 302;
  }
  +[GEOAPPortal captureUserAction:125 target:v5 value:0];
  objc_super v6 = [(PedestrianARFailureContaineeViewController *)self failureContaineeDelegate];
  [v6 failureViewDismissButtonTapped:self];
}

- (void)_retryButtonTapped:(id)a3
{
  unsigned int v4 = sub_100A40EF4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    double v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Retry button tapped", (uint8_t *)&v7, 0xCu);
  }

  if ([(PedestrianARFailureContaineeViewController *)self entryPoint]) {
    uint64_t v5 = 402;
  }
  else {
    uint64_t v5 = 302;
  }
  +[GEOAPPortal captureUserAction:128 target:v5 value:0];
  objc_super v6 = [(PedestrianARFailureContaineeViewController *)self failureContaineeDelegate];
  [v6 failureViewRetryButtonTapped:self];
}

- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3
{
  unsigned int v4 = sub_100A40EF4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    double v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pedestrian AR was dismissed; resigning session ownership",
      (uint8_t *)&v7,
      0xCu);
  }

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"PedestrianARViewControllerDidDisappearNotification" object:0];

  objc_super v6 = +[MapsARSessionManager sharedManager];
  [v6 resignSessionWithOwner:self];
}

- (PedestrianARFailureContaineeDelegate)failureContaineeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_failureContaineeDelegate);

  return (PedestrianARFailureContaineeDelegate *)WeakRetained;
}

- (void)setFailureContaineeDelegate:(id)a3
{
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (UIButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
}

- (NSLayoutConstraint)topContainerTopConstraint
{
  return self->_topContainerTopConstraint;
}

- (void)setTopContainerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelFirstBaselineConstraint
{
  return self->_titleLabelFirstBaselineConstraint;
}

- (void)setTitleLabelFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelContainerLeadingConstraint
{
  return self->_labelContainerLeadingConstraint;
}

- (void)setLabelContainerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelContainerTrailingConstraint
{
  return self->_labelContainerTrailingConstraint;
}

- (void)setLabelContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)retryButtonBottomConstraint
{
  return self->_retryButtonBottomConstraint;
}

- (void)setRetryButtonBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)retryButtonHeightConstraint
{
  return self->_retryButtonHeightConstraint;
}

- (void)setRetryButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)dismissButtonHeightConstraint
{
  return self->_dismissButtonHeightConstraint;
}

- (void)setDismissButtonHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_failureContaineeDelegate);
}

@end