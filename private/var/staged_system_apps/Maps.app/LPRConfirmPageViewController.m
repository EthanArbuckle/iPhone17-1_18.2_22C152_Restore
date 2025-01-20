@interface LPRConfirmPageViewController
- (LPRConfirmPageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5 vehicleTypeTitle:(id)a6;
- (NSString)vehicleTypeTitle;
- (VGVehicle)vehicle;
- (void)doneButtonPressed;
- (void)nextButtonPressed;
- (void)setVehicle:(id)a3;
- (void)setVehicleTypeTitle:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LPRConfirmPageViewController

- (LPRConfirmPageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5 vehicleTypeTitle:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)LPRConfirmPageViewController;
  v13 = [(LPRConfirmPageViewController *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(LPRConfirmPageViewController *)v13 setVehicle:v10];
    [(LPRConfirmPageViewController *)v14 setVehicleTypeTitle:v12];
    v14->_scenario = a3;
    objc_storeWeak((id *)&v14->_delegate, v11);
  }

  return v14;
}

- (void)viewDidLoad
{
  v174.receiver = self;
  v174.super_class = (Class)LPRConfirmPageViewController;
  [(LPRConfirmPageViewController *)&v174 viewDidLoad];
  v3 = [(LPRConfirmPageViewController *)self view];
  [v3 setAccessibilityIdentifier:@"LPRConfirmPageView"];

  v4 = +[UIColor systemBackgroundColor];
  v5 = [(LPRConfirmPageViewController *)self view];
  [v5 setBackgroundColor:v4];

  int64_t scenario = self->_scenario;
  id v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = +[NSBundle mainBundle];
  v9 = v8;
  if (scenario) {
    CFStringRef v10 = @"[LPR Onboarding] done";
  }
  else {
    CFStringRef v10 = @"[LPR Onboarding] next page";
  }
  if (scenario) {
    id v11 = &selRef_doneButtonPressed;
  }
  else {
    id v11 = &selRef_nextButtonPressed;
  }
  id v12 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
  id v168 = [v7 initWithTitle:v12 style:0 target:self action:*v11];

  v13 = [(LPRConfirmPageViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v168];

  v14 = [(LPRConfirmPageViewController *)self navigationItem];
  v15 = [v14 rightBarButtonItem];
  [v15 setAccessibilityIdentifier:@"RightBarButtonItem"];

  objc_super v16 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v16;

  [(UIScrollView *)self->_scrollView setAccessibilityIdentifier:@"ScrollView"];
  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setClipsToBounds:1];
  [(UIScrollView *)self->_scrollView setScrollEnabled:1];
  v18 = [(LPRConfirmPageViewController *)self view];
  [v18 addSubview:self->_scrollView];

  v19 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v19;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView addSubview:self->_containerView];
  v21 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v21 setAccessibilityIdentifier:@"TitleLabel"];
  [(MapsThemeLabel *)v21 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v21 setNumberOfLines:0];
  [(MapsThemeLabel *)v21 setTextAlignment:1];
  [(MapsThemeLabel *)v21 setLineBreakMode:0];
  v22 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
  v23 = [v22 fontDescriptorWithSymbolicTraits:2];
  v24 = +[UIFont fontWithDescriptor:v23 size:0.0];
  v172 = v21;
  [(MapsThemeLabel *)v21 setFont:v24];

  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"[LPR Onboarding confirm title]" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v21 setText:v26];

  [(UIView *)self->_containerView addSubview:v21];
  v27 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v27 setAccessibilityIdentifier:@"DescriptionLabel"];
  [(MapsThemeLabel *)v27 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v27 setNumberOfLines:0];
  [(MapsThemeLabel *)v27 setTextAlignment:1];
  [(MapsThemeLabel *)v27 setLineBreakMode:0];
  v28 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];

  v29 = [v28 fontDescriptorWithSymbolicTraits:2];
  v30 = +[UIFont fontWithDescriptor:v29 size:0.0];
  v171 = v27;
  [(MapsThemeLabel *)v27 setFont:v30];

  v31 = +[NSBundle mainBundle];
  v32 = [v31 localizedStringForKey:@"[LPR Onboarding confirm description" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v27 setText:v32];

  [(UIView *)self->_containerView addSubview:v27];
  v33 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v33 setAccessibilityIdentifier:@"PlateLabel"];
  [(MapsThemeLabel *)v33 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v33 setNumberOfLines:0];
  [(MapsThemeLabel *)v33 setTextAlignment:1];
  [(MapsThemeLabel *)v33 setLineBreakMode:4];
  [(MapsThemeLabel *)v33 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v33 setMinimumScaleFactor:0.699999988];
  v34 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:");

  v35 = [v34 fontDescriptorWithSymbolicTraits:2];
  v36 = +[UIFont fontWithDescriptor:v35 size:0.0];
  [(MapsThemeLabel *)v33 setFont:v36];

  v37 = +[NSBundle mainBundle];
  v38 = [v37 localizedStringForKey:@"[LPR Onboarding confirm plate number" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v33 setText:v38];

  LODWORD(v39) = 1148846080;
  [(MapsThemeLabel *)v33 setContentHuggingPriority:0 forAxis:v39];
  v169 = v33;
  [(UIView *)self->_containerView addSubview:v33];
  v40 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v40 setAccessibilityIdentifier:@"LicensePlateLabel"];
  [(MapsThemeLabel *)v40 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v40 setTextAlignment:0];
  [(MapsThemeLabel *)v40 setLineBreakMode:4];
  [(MapsThemeLabel *)v40 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v40 setMinimumScaleFactor:0.699999988];
  v41 = [v34 fontDescriptorWithSymbolicTraits:2];
  v42 = +[UIFont fontWithDescriptor:v41 size:0.0];
  [(MapsThemeLabel *)v40 setFont:v42];

  v43 = [(LPRConfirmPageViewController *)self vehicle];
  v44 = [v43 licensePlate];
  [(MapsThemeLabel *)v40 setText:v44];

  LODWORD(v45) = 1148846080;
  [(MapsThemeLabel *)v40 setContentHuggingPriority:0 forAxis:v45];
  [(UIView *)self->_containerView addSubview:v40];
  v46 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v46 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v46 setAccessibilityIdentifier:@"PowerLabel"];
  [(MapsThemeLabel *)v46 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v46 setNumberOfLines:2];
  [(MapsThemeLabel *)v46 setTextAlignment:1];
  [(MapsThemeLabel *)v46 setLineBreakMode:4];
  [(MapsThemeLabel *)v46 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v33 setMinimumScaleFactor:0.699999988];
  v167 = v34;
  v47 = [v34 fontDescriptorWithSymbolicTraits:2];
  v48 = +[UIFont fontWithDescriptor:v47 size:0.0];
  v170 = v46;
  [(MapsThemeLabel *)v46 setFont:v48];

  v49 = +[NSBundle mainBundle];
  v50 = [v49 localizedStringForKey:@"[LPR Onboarding confirm power type" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v46 setText:v50];

  [(UIView *)self->_containerView addSubview:v46];
  v51 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v51 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v51 setAccessibilityIdentifier:@"PowerValue"];
  [(MapsThemeLabel *)v51 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v51 setNumberOfLines:0];
  [(MapsThemeLabel *)v51 setTextAlignment:4];
  [(MapsThemeLabel *)v51 setLineBreakMode:4];
  [(MapsThemeLabel *)v51 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v51 setMinimumScaleFactor:0.699999988];
  v52 = [v34 fontDescriptorWithSymbolicTraits:2];
  v53 = +[UIFont fontWithDescriptor:v52 size:0.0];
  [(MapsThemeLabel *)v51 setFont:v53];

  v54 = [(LPRConfirmPageViewController *)self vehicleTypeTitle];
  [(MapsThemeLabel *)v51 setText:v54];

  v55 = v51;
  [(UIView *)self->_containerView addSubview:v51];
  v56 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v56 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v56 setAccessibilityIdentifier:@"PrivacyLabel"];
  [(MapsThemeLabel *)v56 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v56 setNumberOfLines:0];
  [(MapsThemeLabel *)v56 setTextAlignment:0];
  [(MapsThemeLabel *)v56 setLineBreakMode:0];
  v57 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(MapsThemeLabel *)v56 setFont:v57];

  v58 = +[UIColor secondaryLabelColor];
  [(MapsThemeLabel *)v56 setTextColor:v58];

  v59 = +[NSBundle mainBundle];
  v60 = [v59 localizedStringForKey:@"[LPR Onboarding] Add License Plate privacy" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v56 setText:v60];

  [(UIView *)self->_containerView addSubview:v56];
  v173 = [(LPRConfirmPageViewController *)self view];
  v165 = [(UIScrollView *)self->_scrollView topAnchor];
  v166 = [(LPRConfirmPageViewController *)self view];
  v164 = [v166 topAnchor];
  v163 = [v165 constraintEqualToAnchor:v164];
  v175[0] = v163;
  v161 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v162 = [(LPRConfirmPageViewController *)self view];
  v160 = [v162 leadingAnchor];
  v159 = [v161 constraintEqualToAnchor:v160];
  v175[1] = v159;
  v157 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v158 = [(LPRConfirmPageViewController *)self view];
  v156 = [v158 trailingAnchor];
  v155 = [v157 constraintEqualToAnchor:v156];
  v175[2] = v155;
  v154 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v152 = [v154 widthAnchor];
  v153 = [(LPRConfirmPageViewController *)self view];
  v151 = [v153 widthAnchor];
  v150 = [v152 constraintEqualToAnchor:v151];
  v175[3] = v150;
  v148 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v149 = [(LPRConfirmPageViewController *)self view];
  v147 = [v149 bottomAnchor];
  v146 = [v148 constraintEqualToAnchor:v147];
  v175[4] = v146;
  v145 = [(UIView *)self->_containerView topAnchor];
  v144 = [(UIScrollView *)self->_scrollView topAnchor];
  v143 = [v145 constraintEqualToAnchor:v144];
  v175[5] = v143;
  v142 = [(UIView *)self->_containerView leadingAnchor];
  v141 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v140 = [v142 constraintEqualToAnchor:v141];
  v175[6] = v140;
  v139 = [(UIView *)self->_containerView trailingAnchor];
  v138 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v137 = [v139 constraintEqualToAnchor:v138];
  v175[7] = v137;
  v136 = [(UIView *)self->_containerView bottomAnchor];
  v135 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v134 = [v136 constraintEqualToAnchor:v135];
  v175[8] = v134;
  v132 = [(MapsThemeLabel *)v172 topAnchor];
  v133 = [(UIView *)self->_containerView safeAreaLayoutGuide];
  v131 = [v133 topAnchor];
  v130 = [v132 constraintEqualToAnchor:v131 constant:40.0];
  v175[9] = v130;
  v129 = [(MapsThemeLabel *)v172 centerXAnchor];
  v128 = [(UIView *)self->_containerView centerXAnchor];
  v126 = [v129 constraintEqualToAnchor:v128];
  v175[10] = v126;
  v125 = [(MapsThemeLabel *)v172 widthAnchor];
  v124 = [(UIView *)self->_containerView widthAnchor];
  v123 = [v125 constraintEqualToAnchor:v124 multiplier:0.899999976];
  v175[11] = v123;
  v122 = [(MapsThemeLabel *)v171 topAnchor];
  v121 = [(MapsThemeLabel *)v172 bottomAnchor];
  v120 = [v122 constraintEqualToAnchor:v121 constant:10.0];
  v175[12] = v120;
  v119 = [(MapsThemeLabel *)v171 centerXAnchor];
  v118 = [(MapsThemeLabel *)v172 centerXAnchor];
  v117 = [v119 constraintEqualToAnchor:v118];
  v175[13] = v117;
  v116 = [(MapsThemeLabel *)v171 widthAnchor];
  v114 = [(UIView *)self->_containerView widthAnchor];
  v113 = [v116 constraintEqualToAnchor:v114 multiplier:0.899999976];
  v175[14] = v113;
  v112 = [(MapsThemeLabel *)v33 topAnchor];
  v111 = [(MapsThemeLabel *)v171 bottomAnchor];
  v110 = [v112 constraintEqualToAnchor:v111 constant:55.0];
  v175[15] = v110;
  v61 = v33;
  v109 = [(MapsThemeLabel *)v33 leadingAnchor];
  v108 = [(UIView *)self->_containerView leadingAnchor];
  v106 = [v109 constraintEqualToAnchor:v108 constant:18.0];
  v175[16] = v106;
  v105 = [(MapsThemeLabel *)v33 trailingAnchor];
  v104 = [(MapsThemeLabel *)v40 leadingAnchor];
  v103 = [v105 constraintLessThanOrEqualToAnchor:v104];
  v175[17] = v103;
  v102 = [(MapsThemeLabel *)v40 leadingAnchor];
  v101 = [(UIView *)self->_containerView centerXAnchor];
  v100 = [v102 constraintEqualToAnchor:v101 constant:-15.0];
  v175[18] = v100;
  v127 = v40;
  v99 = [(MapsThemeLabel *)v40 centerYAnchor];
  v98 = [(MapsThemeLabel *)v33 centerYAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v175[19] = v97;
  v96 = [(MapsThemeLabel *)v40 trailingAnchor];
  v95 = [(UIView *)self->_containerView trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95 constant:-15.0];
  v175[20] = v94;
  v93 = [(MapsThemeLabel *)v46 topAnchor];
  v92 = [(MapsThemeLabel *)v33 bottomAnchor];
  v91 = [v93 constraintEqualToAnchor:v92 constant:40.0];
  v175[21] = v91;
  v90 = [(MapsThemeLabel *)v46 leadingAnchor];
  v89 = [(MapsThemeLabel *)v33 leadingAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v175[22] = v88;
  v87 = [(MapsThemeLabel *)v46 trailingAnchor];
  v86 = [(MapsThemeLabel *)v55 leadingAnchor];
  v85 = [v87 constraintLessThanOrEqualToAnchor:v86];
  v175[23] = v85;
  v84 = [(MapsThemeLabel *)v55 leadingAnchor];
  v83 = [(UIView *)self->_containerView centerXAnchor];
  v82 = [v84 constraintEqualToAnchor:v83 constant:-15.0];
  v175[24] = v82;
  v115 = v55;
  v81 = [(MapsThemeLabel *)v55 centerYAnchor];
  v80 = [(MapsThemeLabel *)v46 centerYAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v175[25] = v79;
  v78 = [(MapsThemeLabel *)v55 trailingAnchor];
  v77 = [(UIView *)self->_containerView trailingAnchor];
  v76 = [v78 constraintEqualToAnchor:v77 constant:-15.0];
  v175[26] = v76;
  v75 = [(MapsThemeLabel *)v56 topAnchor];
  v74 = [(MapsThemeLabel *)v46 bottomAnchor];
  v73 = [v75 constraintEqualToAnchor:v74 constant:40.0];
  v175[27] = v73;
  v62 = v56;
  v63 = [(MapsThemeLabel *)v56 leadingAnchor];
  v64 = [(MapsThemeLabel *)v61 leadingAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  v175[28] = v65;
  v107 = v56;
  v66 = [(MapsThemeLabel *)v56 widthAnchor];
  v67 = [(UIView *)self->_containerView widthAnchor];
  v68 = [v66 constraintEqualToAnchor:v67 multiplier:0.899999976];
  v175[29] = v68;
  v69 = [(MapsThemeLabel *)v62 bottomAnchor];
  v70 = [(UIView *)self->_containerView bottomAnchor];
  v71 = [v69 constraintEqualToAnchor:v70 constant:-15.0];
  v175[30] = v71;
  v72 = +[NSArray arrayWithObjects:v175 count:31];
  [v173 addConstraints:v72];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPRConfirmPageViewController;
  -[LPRConfirmPageViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(LPRConfirmPageViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    id v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPRConfirmPageViewController;
  [(LPRConfirmPageViewController *)&v7 viewWillDisappear:a3];
  v4 = [(LPRConfirmPageViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)doneButtonPressed
{
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:41 onTarget:660 eventValue:0];

  int64_t scenario = self->_scenario;
  id v5 = sub_1000519B4();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (scenario == 1)
  {
    if (v6)
    {
      int64_t v7 = self->_scenario;
      int v12 = 134217984;
      int64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "LPR onboarding: doneButtonPressed scenario: %ld, will add vehicle", (uint8_t *)&v12, 0xCu);
    }

    v8 = +[VGVirtualGarageService sharedService];
    [v8 virtualGarageAddVehicle:self->_vehicle];
  }
  else
  {
    if (v6)
    {
      int64_t v9 = self->_scenario;
      int v12 = 134217984;
      int64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "LPR onboarding: doneButtonPressed scenario: %ld, will add vehicle", (uint8_t *)&v12, 0xCu);
    }

    v8 = +[VGVirtualGarageService sharedService];
    [v8 virtualGarageSaveVehicle:self->_vehicle];
  }

  CFStringRef v10 = +[VGVirtualGarageService sharedService];
  [v10 virtualGarageSelectVehicle:self->_vehicle];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didFinishConfiguringLPRForVehicle:self->_vehicle];
}

- (void)nextButtonPressed
{
  BOOL v3 = sub_1000519B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t scenario = self->_scenario;
    int v12 = 134217984;
    int64_t v13 = scenario;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "LPR onboarding: nextButtonPressed scenario: %ld, will add vehicle", (uint8_t *)&v12, 0xCu);
  }

  id v5 = +[VGVirtualGarageService sharedService];
  [v5 virtualGarageAddVehicle:self->_vehicle];

  BOOL v6 = +[VGVirtualGarageService sharedService];
  [v6 virtualGarageSelectVehicle:self->_vehicle];

  int64_t v7 = [LPRCustomizeInterstitialViewController alloc];
  v8 = [(LPRConfirmPageViewController *)self vehicle];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CFStringRef v10 = [(LPRCustomizeInterstitialViewController *)v7 initWithVehicle:v8 delegate:WeakRetained];

  id v11 = [(LPRConfirmPageViewController *)self navigationController];
  [v11 pushViewController:v10 animated:1];
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
}

- (NSString)vehicleTypeTitle
{
  return self->_vehicleTypeTitle;
}

- (void)setVehicleTypeTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeTitle, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end