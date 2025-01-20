@interface LPROnboardingAddLicensePlatePageViewController
- (BOOL)plateIsValid:(id)a3;
- (GEOLPRRegion)currentRegion;
- (GEOLPRRoot)lprRules;
- (LPROnboardingAddLicensePlatePageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5 region:(id)a6 lprRules:(id)a7 powerTypes:(id)a8;
- (NSArray)powerTypesKey;
- (NSMutableDictionary)powerTypes;
- (NSString)regionCode;
- (UIButton)powerButton;
- (UIPickerView)powerPicker;
- (UITextField)licensePlateTextField;
- (VGVehicle)vehicle;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (id)_powerTitleAtRow:(int64_t)a3;
- (id)licensePlateRules;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (unint64_t)selectedPowerType;
- (void)_didEditTextField:(id)a3;
- (void)handleSingleTap:(id)a3;
- (void)nextButtonPressed;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setCurrentRegion:(id)a3;
- (void)setLicensePlateTextField:(id)a3;
- (void)setLprRules:(id)a3;
- (void)setPowerButton:(id)a3;
- (void)setPowerPicker:(id)a3;
- (void)setPowerTypes:(id)a3;
- (void)setPowerTypesKey:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setSelectedPowerType:(unint64_t)a3;
- (void)setVehicle:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation LPROnboardingAddLicensePlatePageViewController

- (LPROnboardingAddLicensePlatePageViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5 region:(id)a6 lprRules:(id)a7 powerTypes:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  v19 = [(LPROnboardingAddLicensePlatePageViewController *)&v26 init];
  v20 = v19;
  if (v19)
  {
    [(LPROnboardingAddLicensePlatePageViewController *)v19 setVehicle:v14];
    v21 = [v16 info];
    v22 = [v21 licensePlateTemplate];
    v23 = [v22 stringByReplacingOccurrencesOfString:@" " withString:&stru_101324E70];
    [(LPROnboardingAddLicensePlatePageViewController *)v20 setRegionCode:v23];

    [(LPROnboardingAddLicensePlatePageViewController *)v20 setCurrentRegion:v16];
    [(LPROnboardingAddLicensePlatePageViewController *)v20 setLprRules:v17];
    [(LPROnboardingAddLicensePlatePageViewController *)v20 setPowerTypes:v18];
    v20->_scenario = a3;
    objc_storeWeak((id *)&v20->_delegate, v15);
    v24 = +[VGVirtualGarageService sharedService];
    [v24 registerObserver:v20];
  }
  return v20;
}

- (void)viewDidLoad
{
  v245.receiver = self;
  v245.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  [(LPROnboardingAddLicensePlatePageViewController *)&v245 viewDidLoad];
  v3 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  [v3 setAccessibilityIdentifier:@"LPROnboardingAddLicensePlatePageView"];

  v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setAccessibilityIdentifier:@"ScrollView"];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setClipsToBounds:1];
  [(UIScrollView *)self->_scrollView setScrollEnabled:1];
  [(UIScrollView *)self->_scrollView setKeyboardDismissMode:1];
  v6 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  [v6 addSubview:self->_scrollView];

  v7 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v7;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView addSubview:self->_containerView];
  id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleSingleTap:"];
  [v9 setCancelsTouchesInView:0];
  id v124 = v9;
  [(UIView *)self->_containerView addGestureRecognizer:v9];
  v10 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypes];
  v11 = [v10 allKeys];
  [(LPROnboardingAddLicensePlatePageViewController *)self setPowerTypesKey:v11];

  id v12 = objc_alloc_init((Class)UIPickerView);
  [(LPROnboardingAddLicensePlatePageViewController *)self setPowerPicker:v12];

  v13 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  [v13 setAccessibilityIdentifier:@"PowerPicker"];

  id v14 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  [v14 setDataSource:self];

  id v15 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  [v15 setDelegate:self];

  id v16 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v17 = self->_containerView;
  id v18 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  [(UIView *)v17 addSubview:v18];

  v19 = +[UIColor systemBackgroundColor];
  v20 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  [v20 setBackgroundColor:v19];

  v21 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v21 setAccessibilityIdentifier:@"TitleLabel"];
  [(MapsThemeLabel *)v21 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v21 setNumberOfLines:2];
  [(MapsThemeLabel *)v21 setTextAlignment:1];
  [(MapsThemeLabel *)v21 setLineBreakMode:0];
  [(MapsThemeLabel *)v21 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v21 setMinimumScaleFactor:0.5];
  v22 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
  v23 = [v22 fontDescriptorWithSymbolicTraits:2];
  v24 = +[UIFont fontWithDescriptor:v23 size:0.0];
  [(MapsThemeLabel *)v21 setFont:v24];

  v25 = +[NSBundle mainBundle];
  objc_super v26 = [v25 localizedStringForKey:@"[LPR Onboarding] Add License Plate" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v21 setText:v26];

  v243 = v21;
  [(UIView *)self->_containerView addSubview:v21];
  v27 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v27 setAccessibilityIdentifier:@"DescriptionLabel"];
  [(MapsThemeLabel *)v27 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v27 setNumberOfLines:2];
  [(MapsThemeLabel *)v27 setTextAlignment:1];
  [(MapsThemeLabel *)v27 setLineBreakMode:0];
  v28 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];

  v29 = [v28 fontDescriptorWithSymbolicTraits:2];
  v30 = +[UIFont fontWithDescriptor:v29 size:0.0];
  [(MapsThemeLabel *)v27 setFont:v30];

  v31 = +[NSBundle mainBundle];
  v32 = [v31 localizedStringForKey:@"[LPR] Onboarding" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v27 setText:v32];

  v242 = v27;
  [(UIView *)self->_containerView addSubview:v27];
  v33 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v33 setAccessibilityIdentifier:@"PlateLabel"];
  [(MapsThemeLabel *)v33 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v33 setNumberOfLines:2];
  [(MapsThemeLabel *)v33 setTextAlignment:1];
  [(MapsThemeLabel *)v33 setLineBreakMode:4];
  [(MapsThemeLabel *)v33 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v33 setMinimumScaleFactor:0.699999988];
  v34 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:");

  v35 = [v34 fontDescriptorWithSymbolicTraits:2];
  v36 = +[UIFont fontWithDescriptor:v35 size:0.0];
  [(MapsThemeLabel *)v33 setFont:v36];

  v37 = +[NSBundle mainBundle];
  v38 = [v37 localizedStringForKey:@"Plate Number" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v33 setText:v38];

  LODWORD(v39) = 1148846080;
  [(MapsThemeLabel *)v33 setContentHuggingPriority:0 forAxis:v39];
  v241 = v33;
  [(UIView *)self->_containerView addSubview:v33];
  v40 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v40 setAccessibilityIdentifier:@"PlateRegionLabel"];
  [(MapsThemeLabel *)v40 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v40 setNumberOfLines:2];
  [(MapsThemeLabel *)v40 setTextAlignment:1];
  [(MapsThemeLabel *)v40 setLineBreakMode:0];
  v41 = [v34 fontDescriptorWithSymbolicTraits:2];
  v42 = +[UIFont fontWithDescriptor:v41 size:0.0];
  [(MapsThemeLabel *)v40 setFont:v42];

  v43 = [(LPROnboardingAddLicensePlatePageViewController *)self regionCode];
  [(MapsThemeLabel *)v40 setText:v43];

  LODWORD(v44) = 1148846080;
  [(MapsThemeLabel *)v40 setContentHuggingPriority:0 forAxis:v44];
  LODWORD(v45) = 1148846080;
  [(MapsThemeLabel *)v40 setContentCompressionResistancePriority:0 forAxis:v45];
  v240 = v40;
  [(UIView *)self->_containerView addSubview:v40];
  id v46 = objc_alloc_init((Class)UITextField);
  [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v46 setAccessibilityIdentifier:@"LicensePlateTextField"];
  [v46 setAdjustsFontForContentSizeCategory:1];
  [v46 setDelegate:self];
  v47 = +[NSBundle mainBundle];
  v48 = [v47 localizedStringForKey:@"[LPR Onboarding] plate number text" value:@"localized string not found" table:0];
  [v46 setPlaceholder:v48];

  [v46 setAutocorrectionType:1];
  v49 = [v34 fontDescriptorWithSymbolicTraits:2];
  v50 = +[UIFont fontWithDescriptor:v49 size:0.0];
  [v46 setFont:v50];

  [v46 setAutocapitalizationType:3];
  v51 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
  v52 = [v51 licensePlate];
  v53 = [(LPROnboardingAddLicensePlatePageViewController *)self regionCode];
  v54 = [v52 stringByReplacingOccurrencesOfString:v53 withString:&stru_101324E70];
  [v46 setText:v54];

  [v46 addTarget:self action:"_didEditTextField:" forControlEvents:0x20000];
  [(UIView *)self->_containerView addSubview:v46];
  v239 = v46;
  [(LPROnboardingAddLicensePlatePageViewController *)self setLicensePlateTextField:v46];
  v55 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v55 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v55 setAccessibilityIdentifier:@"PowerLabel"];
  [(MapsThemeLabel *)v55 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v55 setNumberOfLines:2];
  [(MapsThemeLabel *)v55 setTextAlignment:1];
  [(MapsThemeLabel *)v55 setLineBreakMode:4];
  [(MapsThemeLabel *)v55 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v55 setMinimumScaleFactor:0.699999988];
  v56 = [v34 fontDescriptorWithSymbolicTraits:2];
  v57 = +[UIFont fontWithDescriptor:v56 size:0.0];
  [(MapsThemeLabel *)v55 setFont:v57];

  v58 = +[NSBundle mainBundle];
  v59 = [v58 localizedStringForKey:@"[LPR Onboarding] power type" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v55 setText:v59];

  v238 = v55;
  [(UIView *)self->_containerView addSubview:v55];
  v60 = +[MapsThemeButton buttonWithType:1];
  [v60 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v60 setAccessibilityIdentifier:@"PowerButton"];
  v61 = [v60 titleLabel];
  [v61 setAdjustsFontForContentSizeCategory:1];

  v62 = [(LPROnboardingAddLicensePlatePageViewController *)self _powerTitleAtRow:0];
  [v60 setTitle:v62 forState:0];

  v123 = v34;
  v63 = [v34 fontDescriptorWithSymbolicTraits:2];
  v64 = +[UIFont fontWithDescriptor:v63 size:0.0];
  v65 = [v60 titleLabel];
  [v65 setFont:v64];

  [v60 _accessibilitySetInterfaceStyleIntent:1];
  v66 = [v60 layer];
  [v66 setCornerRadius:8.0];

  [v60 setContentHorizontalAlignment:4];
  v67 = [v60 titleLabel];
  [v67 setMinimumScaleFactor:0.5];

  v68 = [v60 titleLabel];
  [v68 setAdjustsFontSizeToFitWidth:1];

  [(LPROnboardingAddLicensePlatePageViewController *)self setPowerButton:v60];
  v237 = v60;
  [(UIView *)self->_containerView addSubview:v60];
  v69 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v69 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v69 setAccessibilityIdentifier:@"PrivacyLabel"];
  [(MapsThemeLabel *)v69 setAdjustsFontForContentSizeCategory:1];
  [(MapsThemeLabel *)v69 setNumberOfLines:0];
  [(MapsThemeLabel *)v69 setTextAlignment:0];
  v70 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(MapsThemeLabel *)v69 setFont:v70];

  v71 = [(MapsThemeLabel *)v69 font];
  [v71 pointSize];
  if (10.0 / v72 > 1.0)
  {
    [(MapsThemeLabel *)v69 setMinimumScaleFactor:1.0];
  }
  else
  {
    v73 = [(MapsThemeLabel *)v69 font];
    [v73 pointSize];
    [(MapsThemeLabel *)v69 setMinimumScaleFactor:10.0 / v74];
  }
  [(MapsThemeLabel *)v69 setAdjustsFontSizeToFitWidth:1];
  v75 = +[UIColor secondaryLabelColor];
  [(MapsThemeLabel *)v69 setTextColor:v75];

  v76 = +[NSBundle mainBundle];
  v77 = [v76 localizedStringForKey:@"[LPR Onboarding] Add License Plate privacy" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v69 setText:v77];

  [(UIView *)self->_containerView addSubview:v69];
  id v78 = objc_alloc((Class)UIBarButtonItem);
  v79 = +[NSBundle mainBundle];
  v80 = [v79 localizedStringForKey:@"Next" value:@"localized string not found" table:0];
  id v81 = [v78 initWithTitle:v80 style:0 target:self action:"nextButtonPressed"];
  v82 = [(LPROnboardingAddLicensePlatePageViewController *)self navigationItem];
  [v82 setRightBarButtonItem:v81];

  v83 = [(LPROnboardingAddLicensePlatePageViewController *)self navigationItem];
  v84 = [v83 rightBarButtonItem];
  [v84 setAccessibilityIdentifier:@"RightBarButtonItem"];

  v85 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
  v86 = [v85 licensePlate];
  BOOL v87 = [v86 length] != 0;
  v88 = [(LPROnboardingAddLicensePlatePageViewController *)self navigationItem];
  v89 = [v88 rightBarButtonItem];
  [v89 setEnabled:v87];

  v236 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  v233 = [(UIScrollView *)self->_scrollView topAnchor];
  v234 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  v232 = [v234 topAnchor];
  v231 = [v233 constraintEqualToAnchor:v232];
  v246[0] = v231;
  v229 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v230 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  v228 = [v230 leadingAnchor];
  v227 = [v229 constraintEqualToAnchor:v228];
  v246[1] = v227;
  v225 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v226 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  v224 = [v226 trailingAnchor];
  v223 = [v225 constraintEqualToAnchor:v224];
  v246[2] = v223;
  v222 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v220 = [v222 widthAnchor];
  v221 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  v219 = [v221 widthAnchor];
  v218 = [v220 constraintEqualToAnchor:v219];
  v246[3] = v218;
  v216 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v217 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  v215 = [v217 bottomAnchor];
  v214 = [v216 constraintEqualToAnchor:v215];
  v246[4] = v214;
  v213 = [(UIView *)self->_containerView topAnchor];
  v212 = [(UIScrollView *)self->_scrollView topAnchor];
  v211 = [v213 constraintEqualToAnchor:v212];
  v246[5] = v211;
  v210 = [(UIView *)self->_containerView leadingAnchor];
  v209 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v208 = [v210 constraintEqualToAnchor:v209];
  v246[6] = v208;
  v207 = [(UIView *)self->_containerView trailingAnchor];
  v206 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v205 = [v207 constraintEqualToAnchor:v206];
  v246[7] = v205;
  v204 = [(UIView *)self->_containerView bottomAnchor];
  v203 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v202 = [v204 constraintEqualToAnchor:v203];
  v246[8] = v202;
  v200 = [(MapsThemeLabel *)v243 topAnchor];
  v201 = [(UIView *)self->_containerView safeAreaLayoutGuide];
  v199 = [v201 topAnchor];
  v198 = [v200 constraintEqualToAnchor:v199 constant:25.0];
  v246[9] = v198;
  v197 = [(MapsThemeLabel *)v243 centerXAnchor];
  v196 = [(UIView *)self->_containerView centerXAnchor];
  v195 = [v197 constraintEqualToAnchor:v196];
  v246[10] = v195;
  v194 = [(MapsThemeLabel *)v243 widthAnchor];
  v193 = [(UIView *)self->_containerView widthAnchor];
  v192 = [v194 constraintEqualToAnchor:v193 multiplier:0.899999976];
  v246[11] = v192;
  v191 = [(MapsThemeLabel *)v242 topAnchor];
  v190 = [(MapsThemeLabel *)v243 bottomAnchor];
  v189 = [v191 constraintEqualToAnchor:v190 constant:15.0];
  v246[12] = v189;
  v188 = [(MapsThemeLabel *)v242 centerXAnchor];
  v187 = [(MapsThemeLabel *)v243 centerXAnchor];
  v186 = [v188 constraintEqualToAnchor:v187];
  v246[13] = v186;
  v185 = [(MapsThemeLabel *)v242 widthAnchor];
  v184 = [(UIView *)self->_containerView widthAnchor];
  v183 = [v185 constraintEqualToAnchor:v184 multiplier:0.899999976];
  v246[14] = v183;
  v182 = [(MapsThemeLabel *)v241 topAnchor];
  v181 = [(MapsThemeLabel *)v242 bottomAnchor];
  v180 = [v182 constraintEqualToAnchor:v181 constant:45.0];
  v246[15] = v180;
  v179 = [(MapsThemeLabel *)v241 leadingAnchor];
  v178 = [(UIView *)self->_containerView leadingAnchor];
  v177 = [v179 constraintEqualToAnchor:v178 constant:15.0];
  v246[16] = v177;
  v176 = [(MapsThemeLabel *)v241 trailingAnchor];
  v175 = [(MapsThemeLabel *)v240 leadingAnchor];
  v174 = [v176 constraintLessThanOrEqualToAnchor:v175 constant:-2.0];
  v246[17] = v174;
  v173 = [(MapsThemeLabel *)v240 leadingAnchor];
  v172 = [(UIView *)self->_containerView centerXAnchor];
  v171 = [v173 constraintEqualToAnchor:v172 constant:-15.0];
  v246[18] = v171;
  v170 = [(MapsThemeLabel *)v240 centerYAnchor];
  v169 = [(MapsThemeLabel *)v241 centerYAnchor];
  v168 = [v170 constraintEqualToAnchor:v169];
  v246[19] = v168;
  v167 = [v239 leadingAnchor];
  v166 = [(MapsThemeLabel *)v240 trailingAnchor];
  v165 = [v167 constraintEqualToAnchor:v166 constant:15.0];
  v246[20] = v165;
  v164 = [v239 centerYAnchor];
  v163 = [(MapsThemeLabel *)v241 centerYAnchor];
  v162 = [v164 constraintEqualToAnchor:v163];
  v246[21] = v162;
  v161 = [v239 trailingAnchor];
  v160 = [(UIView *)self->_containerView trailingAnchor];
  v159 = [v161 constraintEqualToAnchor:v160 constant:-15.0];
  v246[22] = v159;
  v158 = [(MapsThemeLabel *)v238 topAnchor];
  v157 = [(MapsThemeLabel *)v241 bottomAnchor];
  v156 = [v158 constraintEqualToAnchor:v157 constant:25.0];
  v246[23] = v156;
  v155 = [(MapsThemeLabel *)v238 leadingAnchor];
  v154 = [(MapsThemeLabel *)v241 leadingAnchor];
  v153 = [v155 constraintEqualToAnchor:v154];
  v246[24] = v153;
  v152 = [(MapsThemeLabel *)v238 trailingAnchor];
  v151 = [v237 leadingAnchor];
  v150 = [v152 constraintLessThanOrEqualToAnchor:v151];
  v246[25] = v150;
  v149 = [v237 leadingAnchor];
  v148 = [(UIView *)self->_containerView centerXAnchor];
  v147 = [v149 constraintEqualToAnchor:v148 constant:-15.0];
  v246[26] = v147;
  v146 = [v237 centerYAnchor];
  v145 = [(MapsThemeLabel *)v238 centerYAnchor];
  v144 = [v146 constraintEqualToAnchor:v145];
  v246[27] = v144;
  v143 = [v237 trailingAnchor];
  v142 = [(UIView *)self->_containerView trailingAnchor];
  v141 = [v143 constraintEqualToAnchor:v142 constant:-15.0];
  v246[28] = v141;
  v140 = [(MapsThemeLabel *)v69 topAnchor];
  v139 = [(MapsThemeLabel *)v238 bottomAnchor];
  v138 = [v140 constraintEqualToAnchor:v139 constant:25.0];
  v246[29] = v138;
  v90 = v69;
  v137 = [(MapsThemeLabel *)v69 leadingAnchor];
  v136 = [(MapsThemeLabel *)v241 leadingAnchor];
  v135 = [v137 constraintEqualToAnchor:v136];
  v246[30] = v135;
  v134 = [(MapsThemeLabel *)v69 widthAnchor];
  v133 = [(UIView *)self->_containerView widthAnchor];
  v132 = [v134 constraintEqualToAnchor:v133 multiplier:0.899999976];
  v246[31] = v132;
  v131 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  v130 = [v131 widthAnchor];
  v129 = [(UIView *)self->_containerView widthAnchor];
  v128 = [v130 constraintEqualToAnchor:v129];
  v246[32] = v128;
  v127 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  v126 = [v127 heightAnchor];
  v125 = [v126 constraintEqualToConstant:170.0];
  v246[33] = v125;
  v91 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  v92 = [v91 bottomAnchor];
  v93 = [(UIView *)self->_containerView bottomAnchor];
  v94 = [v92 constraintEqualToAnchor:v93];
  v246[34] = v94;
  v95 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
  v96 = [v95 topAnchor];
  v235 = v90;
  v97 = [(MapsThemeLabel *)v90 bottomAnchor];
  v98 = [v96 constraintGreaterThanOrEqualToAnchor:v97];
  v246[35] = v98;
  v99 = +[NSArray arrayWithObjects:v246 count:36];
  [v236 addConstraints:v99];

  v100 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
  v101 = [v100 lprPowerType];

  v102 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
  v103 = v102;
  if (v101)
  {
    uint64_t v104 = (uint64_t)[v102 count];

    if (v104 >= 1)
    {
      uint64_t v105 = 0;
      do
      {
        v106 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
        uint64_t v107 = [v106 lprPowerType];
        if (v107)
        {
          v108 = (void *)v107;
          v109 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
          v110 = [v109 lprPowerType];
          v111 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
          v112 = [v111 objectAtIndexedSubscript:v105];
          unsigned __int8 v113 = [v110 isEqualToString:v112];

          if (v113)
          {
            v122 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
            [v122 selectRow:v105 inComponent:0 animated:1];

            v103 = [(LPROnboardingAddLicensePlatePageViewController *)self powerPicker];
            [(LPROnboardingAddLicensePlatePageViewController *)self pickerView:v103 didSelectRow:v105 inComponent:0];
            goto LABEL_16;
          }
        }
        else
        {
        }
        ++v105;
        v114 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
        id v115 = [v114 count];
      }
      while (v105 < (uint64_t)v115);
    }
    v116 = sub_1000519B4();
    v117 = v124;
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "Failed to match current power type onto new region. Will fallback to the first available power type", buf, 2u);
    }

    v103 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
    v118 = [v103 firstObject];
    v119 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
    [v119 setLprPowerType:v118];
  }
  else
  {
    v120 = [v102 firstObject];
    v121 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
    [v121 setLprPowerType:v120];

LABEL_16:
    v117 = v124;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  -[LPROnboardingAddLicensePlatePageViewController viewWillAppear:](&v10, "viewWillAppear:");
  v5 = [(LPROnboardingAddLicensePlatePageViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
  id v9 = [(LPROnboardingAddLicensePlatePageViewController *)self licensePlateTextField];
  [v9 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPROnboardingAddLicensePlatePageViewController;
  [(LPROnboardingAddLicensePlatePageViewController *)&v7 viewWillDisappear:a3];
  v4 = [(LPROnboardingAddLicensePlatePageViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)handleSingleTap:(id)a3
{
  id v3 = [(LPROnboardingAddLicensePlatePageViewController *)self view];
  [v3 endEditing:1];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  v4 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return [(LPROnboardingAddLicensePlatePageViewController *)self _powerTitleAtRow:a4];
}

- (id)_powerTitleAtRow:(int64_t)a3
{
  id v5 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypes];
  id v6 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
  objc_super v7 = [v6 objectAtIndexedSubscript:a3];
  v8 = [v5 objectForKey:v7];

  id v9 = [v8 titles];
  objc_super v10 = +[GEOLocalizedString bestStringForCurrentLocale:v9 fallbackToFirstAvailable:0];

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_101324E70;
  }
  id v12 = v11;

  return v12;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v8 = a6;
  id v9 = v8;
  if (!v8)
  {
    id v9 = objc_alloc_init((Class)UILabel);
    objc_super v10 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium];
    [v9 setFont:v10];

    [v9 setTextAlignment:1];
  }
  v11 = [(LPROnboardingAddLicensePlatePageViewController *)self _powerTitleAtRow:a4];
  [v9 setText:v11];

  return v9;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 50.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  objc_super v7 = [(LPROnboardingAddLicensePlatePageViewController *)self powerButton];
  id v8 = [(LPROnboardingAddLicensePlatePageViewController *)self _powerTitleAtRow:a4];
  [v7 setTitle:v8 forState:0];

  id v9 = [(LPROnboardingAddLicensePlatePageViewController *)self powerButton];
  [v9 sizeToFit];

  id v12 = [(LPROnboardingAddLicensePlatePageViewController *)self powerTypesKey];
  objc_super v10 = [v12 objectAtIndexedSubscript:a4];
  v11 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
  [v11 setLprPowerType:v10];
}

- (void)_didEditTextField:(id)a3
{
  id v7 = [a3 text];
  BOOL v4 = [v7 length] != 0;
  id v5 = [(LPROnboardingAddLicensePlatePageViewController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:v4];
}

- (id)licensePlateRules
{
  id v3 = [(LPROnboardingAddLicensePlatePageViewController *)self currentRegion];
  BOOL v4 = [v3 info];
  id v5 = [v4 licensePlateValidationRules];

  if (v5)
  {
    id v6 = [(LPROnboardingAddLicensePlatePageViewController *)self currentRegion];
    id v7 = [v6 info];
    id v8 = [v7 licensePlateValidationRules];
  }
  else
  {
    id v9 = [(LPROnboardingAddLicensePlatePageViewController *)self lprRules];
    id v6 = [v9 regions];

    id v7 = [v6 firstObject];
    objc_super v10 = [v7 info];
    id v8 = [v10 licensePlateValidationRules];
  }

  return v8;
}

- (BOOL)plateIsValid:(id)a3
{
  id v4 = a3;
  v33 = self;
  id v5 = [(LPROnboardingAddLicensePlatePageViewController *)self licensePlateRules];
  id v6 = v5;
  if (v5)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v8)
    {
      id v9 = v8;
      v31 = v6;
      id v32 = v7;
      uint64_t v10 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v13 = [v4 length];
          if ((unint64_t)v13 >= [v12 minLength]
            && (unint64_t)v13 <= [v12 maxLength])
          {
            id v14 = [v12 regularExpression];
            id v34 = 0;
            id v15 = +[NSRegularExpression regularExpressionWithPattern:v14 options:1 error:&v34];
            id v16 = v34;

            if (objc_msgSend(v15, "numberOfMatchesInString:options:range:", v4, 0, 0, v13))
            {
              id v17 = [v12 validCharacters];

              if (v17)
              {
                id v18 = [v12 validCharacters];
                v19 = [(LPROnboardingAddLicensePlatePageViewController *)v33 regionCode];
                v20 = +[NSString stringWithFormat:@"%@%@", v18, v19];

                v21 = +[NSCharacterSet characterSetWithCharactersInString:v20];
                v22 = [v21 invertedSet];

                id v23 = [v4 rangeOfCharacterFromSet:v22];
                if (v23 != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  BOOL v29 = 0;
                  goto LABEL_22;
                }
              }
              uint64_t v24 = [v12 impliedPowerTypeKeys];
              if (!v24) {
                goto LABEL_19;
              }
              v25 = (void *)v24;
              objc_super v26 = [(LPROnboardingAddLicensePlatePageViewController *)v33 vehicle];
              v27 = [v26 lprPowerType];
              unsigned __int8 v28 = [v25 containsObject:v27];

              if (v28)
              {
LABEL_19:
                BOOL v29 = 1;
LABEL_22:

                id v6 = v31;
                id v7 = v32;
                goto LABEL_23;
              }
            }

            id v7 = v32;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v29 = 0;
      id v6 = v31;
    }
    else
    {
      BOOL v29 = 0;
    }
LABEL_23:
  }
  else
  {
    BOOL v29 = 1;
  }

  return v29;
}

- (void)nextButtonPressed
{
  id v3 = [(LPROnboardingAddLicensePlatePageViewController *)self regionCode];
  id v4 = [(LPROnboardingAddLicensePlatePageViewController *)self licensePlateTextField];
  id v5 = [v4 text];
  id v6 = [v5 uppercaseString];
  id v21 = +[NSString stringWithFormat:@"%@%@", v3, v6];

  if ([(LPROnboardingAddLicensePlatePageViewController *)self plateIsValid:v21])
  {
    id v7 = [(LPROnboardingAddLicensePlatePageViewController *)self vehicle];
    [v7 setLicensePlate:v21];

    self->_isAddingVehicle = self->_scenario == 0;
    self->_isSubmittingLicensePlate = 1;
    id v8 = [LPRConfirmPageViewController alloc];
    int64_t scenario = self->_scenario;
    vehicle = self->_vehicle;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = [(LPROnboardingAddLicensePlatePageViewController *)self powerButton];
    id v13 = [v12 titleLabel];
    id v14 = [v13 text];
    id v15 = [(LPRConfirmPageViewController *)v8 initWithScenario:scenario vehicle:vehicle delegate:WeakRetained vehicleTypeTitle:v14];

    id v16 = [(LPROnboardingAddLicensePlatePageViewController *)self navigationController];
    [v16 pushViewController:v15 animated:1];
  }
  else
  {
    id v15 = +[NSBundle mainBundle];
    id v16 = [(LPRConfirmPageViewController *)v15 localizedStringForKey:@"[LPR Onboarding] error message title" value:@"localized string not found" table:0];
    id v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"[LPR Onboarding] error message body" value:@"localized string not found" table:0];
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"[LPR Onboarding] error confirmation" value:@"localized string not found" table:0];
    [(LPROnboardingAddLicensePlatePageViewController *)self _maps_presentSimpleAlertWithTitle:v16 message:v18 dismissalActionTitle:v20];
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v12 = a3;
  if (self->_isAddingVehicle)
  {
    id v4 = +[MKMapService sharedService];
    id v5 = [v12 vehicles];
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    id v7 = [v6 stringValue];
    [v4 captureUserAction:2107 onTarget:660 eventValue:v7];

    self->_isAddingVehicle = 0;
  }
  if (self->_isSubmittingLicensePlate)
  {
    id v8 = +[MKMapService sharedService];
    id v9 = [v12 vehicles];
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
    v11 = [v10 stringValue];
    [v8 captureUserAction:2114 onTarget:660 eventValue:v11];

    self->_isSubmittingLicensePlate = 0;
  }
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (NSMutableDictionary)powerTypes
{
  return self->_powerTypes;
}

- (void)setPowerTypes:(id)a3
{
}

- (NSArray)powerTypesKey
{
  return self->_powerTypesKey;
}

- (void)setPowerTypesKey:(id)a3
{
}

- (UIPickerView)powerPicker
{
  return self->_powerPicker;
}

- (void)setPowerPicker:(id)a3
{
}

- (UIButton)powerButton
{
  return self->_powerButton;
}

- (void)setPowerButton:(id)a3
{
}

- (UITextField)licensePlateTextField
{
  return self->_licensePlateTextField;
}

- (void)setLicensePlateTextField:(id)a3
{
}

- (unint64_t)selectedPowerType
{
  return self->_selectedPowerType;
}

- (void)setSelectedPowerType:(unint64_t)a3
{
  self->_selectedPowerType = a3;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
}

- (GEOLPRRegion)currentRegion
{
  return self->_currentRegion;
}

- (void)setCurrentRegion:(id)a3
{
}

- (GEOLPRRoot)lprRules
{
  return self->_lprRules;
}

- (void)setLprRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lprRules, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_licensePlateTextField, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_powerPicker, 0);
  objc_storeStrong((id *)&self->_powerTypesKey, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end