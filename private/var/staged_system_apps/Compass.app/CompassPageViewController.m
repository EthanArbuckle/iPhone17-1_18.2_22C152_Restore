@interface CompassPageViewController
+ (void)initialize;
- (BOOL)_shouldHideCoordinateLabel;
- (CLLocation)userLocation;
- (CompassPageViewController)init;
- (int64_t)preferredStatusBarStyle;
- (void)_enableIdleTimer;
- (void)_forceCalibration;
- (void)_geocodeIfNecessary;
- (void)_openMaps;
- (void)_updateCoordinateLabel;
- (void)_updateDegreesLabel:(BOOL)a3;
- (void)_updateDirectionLabel:(BOOL)a3;
- (void)_updateHeadingLabels:(BOOL)a3;
- (void)_updatePlaceLabelLayout;
- (void)_updatePlaceLabels;
- (void)activateConstraintSetForFontSize:(double)a3;
- (void)addConstraints;
- (void)configureForTestingWithOptions:(id)a3;
- (void)dealloc;
- (void)localeDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preferredFontSizeDidChange:(id)a3;
- (void)setCompassToAngle:(double)a3 force:(BOOL)a4;
- (void)setCrosshairLevelForData:(id)a3;
- (void)setSharedLocationManager:(id)a3;
- (void)setUserLocation:(id)a3;
- (void)startMotionManager;
- (void)testCleanup;
- (void)updateConsole;
- (void)updateDisplay:(id)a3;
- (void)userDefaultsChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CompassPageViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (MGGetBoolAnswer())
    {
      byte_100017BB8 = 1;
    }
    else
    {
      v2 = +[NSUserDefaults standardUserDefaults];
      byte_100017BB8 = [v2 BOOLForKey:@"DisplayAltitude"];
    }
    v3 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v5 = @"kCompassHeadingFilterKey";
    v6 = &off_100010AC0;
    v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [v3 registerDefaults:v4];
  }
}

- (CompassPageViewController)init
{
  v16.receiver = self;
  v16.super_class = (Class)CompassPageViewController;
  v2 = [(CompassPageViewController *)&v16 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 floatForKey:@"kCompassHeadingFilterKey"];
    v2->_headingFilter = v4;

    CFStringRef v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    formattedDegreeText = v2->_formattedDegreeText;
    v2->_formattedDegreeText = v5;

    v7 = +[NSUserDefaults standardUserDefaults];
    v2->_usesTrueNorth = [v7 BOOLForKey:@"kMagneticNorth"];

    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 addObserver:v2 forKeyPath:@"kMagneticNorth" options:1 context:0];

    v9 = objc_alloc_init(CompassMotionManager);
    manager = v2->_manager;
    v2->_manager = v9;

    [(CompassMotionManager *)v2->_manager setDeviceMotionUpdateInterval:0.0166666667];
    v2->_currentCompassAngle = 0.0;
    v11 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:2];
    heavyImpact = v2->_heavyImpact;
    v2->_heavyImpact = v11;

    v13 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
    lightImpact = v2->_lightImpact;
    v2->_lightImpact = v13;
  }
  return v2;
}

- (void)startMotionManager
{
  BOOL v3 = __CFADD__([(CLLocationManager *)self->_sharedLocationManager authorizationStatus] - 3, 2);
  manager = self->_manager;
  if (v3 || !self->_usesTrueNorth) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 8;
  }

  [(CompassMotionManager *)manager startDeviceMotionUpdatesUsingReferenceFrame:v6];
}

- (void)setSharedLocationManager:(id)a3
{
  if (self->_sharedLocationManager != a3) {
    objc_storeStrong((id *)&self->_sharedLocationManager, a3);
  }

  _objc_release_x1();
}

- (void)viewDidLoad
{
  v78.receiver = self;
  v78.super_class = (Class)CompassPageViewController;
  [(CompassPageViewController *)&v78 viewDidLoad];
  uint64_t v3 = sub_100001FB8();
  float v4 = sub_100001640();
  CFStringRef v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;

  v8 = -[CompassView initWithFrame:]([CompassView alloc], "initWithFrame:", 0.0, 0.0, v7, v7);
  compassView = self->_compassView;
  self->_compassView = v8;

  [(CompassView *)self->_compassView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v14 = [v10 initWithFrame:CGRectZero.origin.x, y, width, height];
  compassContainer = self->_compassContainer;
  self->_compassContainer = v14;

  objc_super v16 = +[UIColor blackColor];
  [(UIView *)self->_compassContainer setBackgroundColor:v16];

  [(UIView *)self->_compassContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_compassContainer setOpaque:1];
  LODWORD(v17) = 1148846080;
  [(UIView *)self->_compassContainer setContentCompressionResistancePriority:0 forAxis:v17];
  LODWORD(v18) = 1148846080;
  [(UIView *)self->_compassContainer setContentCompressionResistancePriority:1 forAxis:v18];
  [(UIView *)self->_compassContainer addSubview:self->_compassView];
  v19 = [(CompassPageViewController *)self view];
  [v19 addSubview:self->_compassContainer];

  v20 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  labelContainer = self->_labelContainer;
  self->_labelContainer = v20;

  v22 = +[UIColor blackColor];
  [(UIView *)self->_labelContainer setBackgroundColor:v22];

  [(UIView *)self->_labelContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_labelContainer setOpaque:1];
  [(UIView *)self->_labelContainer _setVisualAltitude:_UIVisualAltitudeFloatAboveSuperview * 1.5];
  -[UIView _setVisualAltitudeBias:](self->_labelContainer, "_setVisualAltitudeBias:", 1.0, 0.660000026);
  v23 = [(CompassPageViewController *)self view];
  [v23 addSubview:self->_labelContainer];

  v24 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  degreesLabel = self->_degreesLabel;
  self->_degreesLabel = v24;

  v26 = +[UIColor whiteColor];
  [(UILabel *)self->_degreesLabel setTextColor:v26];

  v27 = +[UIColor blackColor];
  [(UILabel *)self->_degreesLabel setBackgroundColor:v27];

  [(UILabel *)self->_degreesLabel setLineBreakMode:2];
  [(UILabel *)self->_degreesLabel setFont:v3];
  [(UILabel *)self->_degreesLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_degreesLabel setOpaque:1];
  [(UILabel *)self->_degreesLabel setHidden:1];
  LODWORD(v28) = 1148846080;
  [(UILabel *)self->_degreesLabel setContentCompressionResistancePriority:0 forAxis:v28];
  LODWORD(v29) = 1148846080;
  [(UILabel *)self->_degreesLabel setContentCompressionResistancePriority:1 forAxis:v29];
  [(UIView *)self->_labelContainer addSubview:self->_degreesLabel];
  v30 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  degreesSymbolLabel = self->_degreesSymbolLabel;
  self->_degreesSymbolLabel = v30;

  v32 = +[UIColor whiteColor];
  [(UILabel *)self->_degreesSymbolLabel setTextColor:v32];

  v33 = +[UIColor blackColor];
  [(UILabel *)self->_degreesSymbolLabel setBackgroundColor:v33];

  [(UILabel *)self->_degreesSymbolLabel setLineBreakMode:2];
  [(UILabel *)self->_degreesSymbolLabel setFont:v3];
  [(UILabel *)self->_degreesSymbolLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_degreesSymbolLabel setOpaque:1];
  [(UILabel *)self->_degreesSymbolLabel setHidden:1];
  LODWORD(v34) = 1148846080;
  [(UILabel *)self->_degreesSymbolLabel setContentCompressionResistancePriority:0 forAxis:v34];
  LODWORD(v35) = 1148846080;
  [(UILabel *)self->_degreesSymbolLabel setContentCompressionResistancePriority:1 forAxis:v35];
  [(UIView *)self->_labelContainer addSubview:self->_degreesSymbolLabel];
  v36 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  directionLabel = self->_directionLabel;
  self->_directionLabel = v36;

  v38 = +[UIColor whiteColor];
  [(UILabel *)self->_directionLabel setTextColor:v38];

  v39 = +[UIColor blackColor];
  [(UILabel *)self->_directionLabel setBackgroundColor:v39];

  v75 = (void *)v3;
  [(UILabel *)self->_directionLabel setFont:v3];
  [(UILabel *)self->_directionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_directionLabel setOpaque:1];
  [(UILabel *)self->_directionLabel setHidden:1];
  [(UILabel *)self->_directionLabel setAdjustsFontSizeToFitWidth:1];
  [(UIView *)self->_labelContainer addSubview:self->_directionLabel];
  v40 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  labelStackView = self->_labelStackView;
  self->_labelStackView = v40;

  [(UIStackView *)self->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_labelStackView setAxis:1];
  [(UIStackView *)self->_labelStackView setBaselineRelativeArrangement:1];
  [v4 _compass_scaledValueForValue:20.0];
  -[UIStackView setSpacing:](self->_labelStackView, "setSpacing:");
  [(UIStackView *)self->_labelStackView setDistribution:0];
  [(UIStackView *)self->_labelStackView setAlignment:0];
  [(UIView *)self->_labelContainer addSubview:self->_labelStackView];
  [v4 lineHeight];
  v43 = -[CompassCopyableLabel initWithFrame:]([CompassCopyableLabel alloc], "initWithFrame:", 0.0, 0.0, v7, v42);
  coordinatesLabel = self->_coordinatesLabel;
  self->_coordinatesLabel = v43;

  v45 = +[UIColor whiteColor];
  [(CompassCopyableLabel *)self->_coordinatesLabel setTextColor:v45];

  [(CompassCopyableLabel *)self->_coordinatesLabel setTextAlignment:1];
  v46 = +[UIColor blackColor];
  [(CompassCopyableLabel *)self->_coordinatesLabel setBackgroundColor:v46];

  [(CompassCopyableLabel *)self->_coordinatesLabel setFont:v4];
  [(CompassCopyableLabel *)self->_coordinatesLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CompassCopyableLabel *)self->_coordinatesLabel setOpaque:1];
  [(CompassCopyableLabel *)self->_coordinatesLabel setHidden:1];
  [(CompassCopyableLabel *)self->_coordinatesLabel setUserInteractionEnabled:1];
  id v76 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_openMaps"];
  -[CompassCopyableLabel addGestureRecognizer:](self->_coordinatesLabel, "addGestureRecognizer:");
  [(UIStackView *)self->_labelStackView addArrangedSubview:self->_coordinatesLabel];
  v47 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  placeLabel = self->_placeLabel;
  self->_placeLabel = v47;

  v49 = +[UIColor whiteColor];
  [(UILabel *)self->_placeLabel setTextColor:v49];

  [(UILabel *)self->_placeLabel setTextAlignment:1];
  v50 = +[UIColor blackColor];
  [(UILabel *)self->_placeLabel setBackgroundColor:v50];

  [(UILabel *)self->_placeLabel setFont:v4];
  [(UILabel *)self->_placeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_placeLabel setOpaque:1];
  [(UILabel *)self->_placeLabel setHidden:1];
  [(UIStackView *)self->_labelStackView addArrangedSubview:self->_placeLabel];
  v77 = v4;
  if (byte_100017BB8)
  {
    [v4 lineHeight];
    v52 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, v7, v51];
    altitudeLabel = self->_altitudeLabel;
    self->_altitudeLabel = v52;

    v54 = +[UIColor whiteColor];
    [(UILabel *)self->_altitudeLabel setTextColor:v54];

    [(UILabel *)self->_altitudeLabel setTextAlignment:1];
    v55 = +[UIColor blackColor];
    [(UILabel *)self->_altitudeLabel setBackgroundColor:v55];

    [(UILabel *)self->_altitudeLabel setFont:v4];
    [(UILabel *)self->_altitudeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_altitudeLabel setOpaque:1];
    [(UILabel *)self->_altitudeLabel setHidden:1];
    [(UIStackView *)self->_labelStackView addArrangedSubview:self->_altitudeLabel];
  }
  v56 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  compassToTopLayoutGuide = self->_compassToTopLayoutGuide;
  self->_compassToTopLayoutGuide = v56;

  v58 = [(CompassPageViewController *)self view];
  [v58 addLayoutGuide:self->_compassToTopLayoutGuide];

  v59 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  labelsToCompassLayoutGuide = self->_labelsToCompassLayoutGuide;
  self->_labelsToCompassLayoutGuide = v59;

  v61 = [(CompassPageViewController *)self view];
  [v61 addLayoutGuide:self->_labelsToCompassLayoutGuide];

  v62 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  bottomToLabelsLayoutGuide = self->_bottomToLabelsLayoutGuide;
  self->_bottomToLabelsLayoutGuide = v62;

  v64 = [(CompassPageViewController *)self view];
  [v64 addLayoutGuide:self->_bottomToLabelsLayoutGuide];

  id v65 = +[GEOPlatform sharedPlatform];
  if ([v65 isInternalInstall])
  {
    v66 = +[NSUserDefaults standardUserDefaults];
    unsigned int v67 = [v66 BOOLForKey:@"CalibrationGestureEnabled"];

    if (!v67) {
      goto LABEL_7;
    }
    id v65 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_forceCalibration"];
    [(CompassView *)self->_compassView addGestureRecognizer:v65];
  }

LABEL_7:
  v68 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v69 = [v68 BOOLForKey:@"ConsoleEnabled"];

  if (v69)
  {
    v70 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 20.0, v7, 20.0];
    consoleLabel = self->_consoleLabel;
    self->_consoleLabel = v70;

    v72 = +[UIFont systemFontOfSize:10.0];
    [(UILabel *)self->_consoleLabel setFont:v72];

    v73 = +[UIColor orangeColor];
    [(UILabel *)self->_consoleLabel setTextColor:v73];

    [(UILabel *)self->_consoleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v74 = [(CompassPageViewController *)self view];
    [v74 addSubview:self->_consoleLabel];
  }
  else
  {
    v74 = self->_consoleLabel;
    self->_consoleLabel = 0;
  }

  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    [(UILabel *)self->_degreesLabel setHidden:1];
    [(UILabel *)self->_degreesSymbolLabel setHidden:1];
    [(CompassCopyableLabel *)self->_coordinatesLabel setHidden:1];
    [(UILabel *)self->_altitudeLabel setHidden:1];
    [(UILabel *)self->_directionLabel setHidden:1];
    [(UILabel *)self->_placeLabel setHidden:1];
    [(UILabel *)self->_consoleLabel setHidden:1];
  }
  [(CompassPageViewController *)self addConstraints];
}

- (void)addConstraints
{
  if (!self->_constraints)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    constraints = self->_constraints;
    self->_constraints = v3;
  }
  CFStringRef v5 = [(UILayoutGuide *)self->_compassToTopLayoutGuide heightAnchor];
  double v6 = [(UILayoutGuide *)self->_bottomToLabelsLayoutGuide heightAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];

  LODWORD(v8) = 1144750080;
  [v7 setPriority:v8];
  v74 = self->_constraints;
  v109 = [(UIView *)self->_compassContainer leadingAnchor];
  v110 = [(CompassPageViewController *)self view];
  v108 = [v110 leadingAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v112[0] = v107;
  v105 = [(UIView *)self->_compassContainer widthAnchor];
  v106 = [(CompassPageViewController *)self view];
  v104 = [v106 widthAnchor];
  v103 = [v105 constraintEqualToAnchor:v104];
  v112[1] = v103;
  v102 = [(CompassView *)self->_compassView widthAnchor];
  v101 = [(UIView *)self->_compassContainer widthAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v112[2] = v100;
  v99 = [(CompassView *)self->_compassView topAnchor];
  v98 = [(UIView *)self->_compassContainer topAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v112[3] = v97;
  v96 = [(CompassView *)self->_compassView bottomAnchor];
  v95 = [(UIView *)self->_compassContainer bottomAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v112[4] = v94;
  v93 = [(CompassView *)self->_compassView heightAnchor];
  v92 = [(CompassView *)self->_compassView widthAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v112[5] = v91;
  v89 = [(UIView *)self->_labelContainer leadingAnchor];
  v90 = [(CompassPageViewController *)self view];
  v88 = [v90 leadingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v112[6] = v87;
  v85 = [(UIView *)self->_labelContainer widthAnchor];
  v86 = [(CompassPageViewController *)self view];
  v84 = [v86 widthAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v112[7] = v83;
  v81 = [(UILayoutGuide *)self->_compassToTopLayoutGuide topAnchor];
  v82 = [(CompassPageViewController *)self view];
  v80 = [v82 safeAreaLayoutGuide];
  v79 = [v80 topAnchor];
  objc_super v78 = [v81 constraintEqualToAnchor:v79];
  v112[8] = v78;
  v77 = [(UIView *)self->_compassContainer topAnchor];
  id v76 = [(UILayoutGuide *)self->_compassToTopLayoutGuide bottomAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v112[9] = v75;
  v73 = [(UILayoutGuide *)self->_labelsToCompassLayoutGuide topAnchor];
  v72 = [(UIView *)self->_compassContainer bottomAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v112[10] = v71;
  v70 = [(UIView *)self->_labelContainer topAnchor];
  unsigned __int8 v69 = [(UILayoutGuide *)self->_labelsToCompassLayoutGuide bottomAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v112[11] = v68;
  unsigned int v67 = [(UILayoutGuide *)self->_bottomToLabelsLayoutGuide topAnchor];
  v66 = [(UIView *)self->_labelContainer bottomAnchor];
  id v65 = [v67 constraintEqualToAnchor:v66];
  v112[12] = v65;
  v64 = [(CompassPageViewController *)self view];
  v63 = [v64 safeAreaLayoutGuide];
  v62 = [v63 bottomAnchor];
  v61 = [(UILayoutGuide *)self->_bottomToLabelsLayoutGuide bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v112[13] = v60;
  v59 = [(UILayoutGuide *)self->_compassToTopLayoutGuide heightAnchor];
  v58 = [(UILayoutGuide *)self->_labelsToCompassLayoutGuide heightAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v112[14] = v57;
  v56 = [(UILayoutGuide *)self->_bottomToLabelsLayoutGuide heightAnchor];
  v55 = [v56 constraintGreaterThanOrEqualToConstant:40.0];
  v112[15] = v55;
  v111 = v7;
  v112[16] = v7;
  v54 = [(UILabel *)self->_degreesLabel leadingAnchor];
  v53 = [(UIView *)self->_labelContainer leadingAnchor];
  v52 = [v54 constraintGreaterThanOrEqualToAnchor:v53];
  v112[17] = v52;
  double v51 = [(UILabel *)self->_degreesSymbolLabel leadingAnchor];
  v50 = [(UILabel *)self->_degreesLabel trailingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v112[18] = v49;
  v48 = [(UILabel *)self->_directionLabel leadingAnchor];
  v47 = [(UILabel *)self->_degreesSymbolLabel trailingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:15.0];
  v112[19] = v46;
  v45 = [(CompassPageViewController *)self view];
  v44 = [v45 trailingAnchor];
  v43 = [(UILabel *)self->_directionLabel trailingAnchor];
  double v42 = [v44 constraintGreaterThanOrEqualToAnchor:v43];
  v112[20] = v42;
  v41 = [(UILabel *)self->_degreesSymbolLabel centerXAnchor];
  v40 = [(UIView *)self->_labelContainer centerXAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v112[21] = v39;
  v38 = [(UILabel *)self->_degreesLabel topAnchor];
  v37 = [(UIView *)self->_labelContainer topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v112[22] = v36;
  double v35 = [(UILabel *)self->_degreesSymbolLabel firstBaselineAnchor];
  double v34 = [(UILabel *)self->_degreesLabel firstBaselineAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v112[23] = v33;
  v32 = [(UILabel *)self->_directionLabel firstBaselineAnchor];
  v31 = [(UILabel *)self->_degreesLabel firstBaselineAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v112[24] = v30;
  double v29 = [(UIStackView *)self->_labelStackView widthAnchor];
  v9 = [(UIView *)self->_labelContainer widthAnchor];
  id v10 = [v29 constraintEqualToAnchor:v9];
  v112[25] = v10;
  v11 = [(UIStackView *)self->_labelStackView topAnchor];
  v12 = [(UILabel *)self->_degreesLabel lastBaselineAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:33.0];
  v112[26] = v13;
  v14 = [(UIView *)self->_labelContainer bottomAnchor];
  v15 = [(UIStackView *)self->_labelStackView bottomAnchor];
  objc_super v16 = [v14 constraintEqualToAnchor:v15];
  v112[27] = v16;
  double v17 = +[NSArray arrayWithObjects:v112 count:28];
  [(NSMutableArray *)v74 addObjectsFromArray:v17];

  consoleLabel = self->_consoleLabel;
  if (consoleLabel)
  {
    v19 = self->_constraints;
    v20 = [(UILabel *)consoleLabel topAnchor];
    v21 = [(CompassPageViewController *)self view];
    v22 = [v21 safeAreaLayoutGuide];
    v23 = [v22 topAnchor];
    v24 = [v20 constraintEqualToAnchor:v23];
    [(NSMutableArray *)v19 addObject:v24];
  }
  v25 = [(CompassPageViewController *)self view];
  [v25 addConstraints:self->_constraints];

  v26 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v26 pointSize];
  double v28 = v27;

  [(CompassPageViewController *)self activateConstraintSetForFontSize:v28];
}

- (void)updateConsole
{
  if (!self->_consoleLabel) {
    return;
  }
  userLocation = self->_userLocation;
  if (userLocation)
  {
    [(CLLocation *)userLocation horizontalAccuracy];
    uint64_t v5 = v4;
    double v6 = [(CLLocation *)self->_userLocation timestamp];
    [v6 timeIntervalSinceNow];
    double v8 = +[NSString stringWithFormat:@"± %.2fm %.0fs", v5, -v7];
  }
  else
  {
    double v8 = @"No Location";
  }
  v9 = [(CLLocationManager *)self->_sharedLocationManager heading];

  if (v9)
  {
    id v10 = [(CLLocationManager *)self->_sharedLocationManager heading];
    uint64_t v11 = [v10 shortDescription];
LABEL_13:
    objc_super v16 = (__CFString *)v11;

    goto LABEL_14;
  }
  v12 = [(CompassMotionManager *)self->_manager deviceMotion];
  unsigned int v13 = [v12 magneticFieldCalibrationLevel];

  if (v13 != -1)
  {
    long long v20 = 0u;
    v14 = [(CompassMotionManager *)self->_manager deviceMotion];
    v15 = v14;
    if (v14) {
      [v14 magneticField];
    }
    else {
      long long v20 = 0u;
    }

    id v10 = [(CompassMotionManager *)self->_manager deviceMotion];
    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d, (%.2f, %.2f, %.2f)µT", [v10 magneticFieldCalibrationLevel], v20, 0);
    goto LABEL_13;
  }
  objc_super v16 = 0;
LABEL_14:
  double v17 = @"No Heading";
  if (v16) {
    double v17 = v16;
  }
  double v18 = v17;

  v19 = +[NSString stringWithFormat:@"%@ : %@", v18, v8];

  [(UILabel *)self->_consoleLabel setText:v19];
}

- (void)setUserLocation:(id)a3
{
  uint64_t v5 = (CLLocation *)a3;
  userLocation = self->_userLocation;
  if (userLocation != v5)
  {
    self->_userLocation = 0;
    double v7 = v5;

    objc_storeStrong((id *)&self->_userLocation, a3);
    [(CompassPageViewController *)self _updateCoordinateLabel];
    if (v7 && userLocation)
    {
      [(CompassPageViewController *)self _geocodeIfNecessary];
    }
    else
    {
      [(CompassPageViewController *)self startMotionManager];
      [(CompassPageViewController *)self _updatePlaceLabels];
    }
    uint64_t v5 = v7;
  }
}

- (void)_geocodeIfNecessary
{
  if (!self->_lastGeocodeLocation) {
    goto LABEL_4;
  }
  -[CLLocation distanceFromLocation:](self->_userLocation, "distanceFromLocation:");
  double v4 = v3;
  uint64_t v5 = [(CLLocation *)self->_userLocation timestamp];
  double v6 = [(CLLocation *)self->_lastGeocodeLocation timestamp];
  [v5 timeIntervalSinceDate:v6];
  double v8 = fabs(v7);

  if (v8 > 60.0 || v4 > 1000.0)
  {
LABEL_4:
    [(CompassPageViewController *)self _updatePlaceLabels];
  }
}

- (void)_updatePlaceLabels
{
  userLocation = self->_userLocation;
  if (userLocation)
  {
    objc_storeStrong((id *)&self->_lastGeocodeLocation, userLocation);
    id v4 = [objc_alloc((Class)GEOLocation) initWithCLLocation:self->_userLocation];
    uint64_t v5 = [v4 latLng];
    [v5 setGtLog:1];

    double v6 = +[GEOMapService sharedService];
    double v7 = +[GEOMapService sharedService];
    double v8 = [v7 defaultTraits];
    v9 = [v6 ticketForReverseGeocodeLocation:v4 traits:v8];

    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003D08;
    v11[3] = &unk_100010480;
    objc_copyWeak(&v12, &location);
    id v10 = &_dispatch_main_q;
    [v9 submitWithHandler:v11 networkActivity:0 queue:&_dispatch_main_q];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UILabel *)self->_placeLabel setText:0];
    [(CompassPageViewController *)self _updatePlaceLabelLayout];
    [(CompassPageViewController *)self _updateCoordinateLabel];
  }
}

- (void)_updatePlaceLabelLayout
{
  [(UILabel *)self->_degreesLabel setHidden:0];
  [(UILabel *)self->_degreesSymbolLabel setHidden:0];
  double v3 = [(UILabel *)self->_placeLabel text];

  if (v3) {
    BOOL v4 = !self->_hasCalibration;
  }
  else {
    BOOL v4 = 0;
  }
  [(UILabel *)self->_directionLabel setHidden:v4];
  placeLabel = self->_placeLabel;

  [(UILabel *)placeLabel setHidden:v3 == 0];
}

- (void)_updateCoordinateLabel
{
  if ([(CompassPageViewController *)self _shouldHideCoordinateLabel])
  {
    [(CompassCopyableLabel *)self->_coordinatesLabel setHidden:1];
    altitudeLabel = self->_altitudeLabel;
    [(UILabel *)altitudeLabel setHidden:1];
  }
  else
  {
    [(CLLocation *)self->_userLocation coordinate];
    double v5 = v4;
    double v7 = v6;
    CreateCoordinateComponentString(0, v4, v6);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    double v8 = CreateCoordinateComponentString(1, v5, v7);
    id v9 = objc_alloc((Class)NSString);
    id v10 = WebLocalizedString();
    id v11 = [v9 initWithFormat:v10, v23, v8, 0];

    [(CompassCopyableLabel *)self->_coordinatesLabel setText:v11];
    [(CompassCopyableLabel *)self->_coordinatesLabel setHidden:0];
    if (byte_100017BB8)
    {
      [(UILabel *)self->_altitudeLabel setHidden:0];
      [(CLLocation *)self->_userLocation altitude];
      double v13 = v12;
      [(CLLocation *)self->_userLocation verticalAccuracy];
      if (v14 <= 0.0)
      {
        [(UILabel *)self->_altitudeLabel setText:0];
      }
      else
      {
        v15 = +[NSLocale currentLocale];
        objc_super v16 = [v15 objectForKey:NSLocaleUsesMetricSystem];
        unsigned int v17 = [v16 BOOLValue];

        double v18 = v13 / 0.3048;
        if (v17) {
          double v18 = v13;
        }
        v19 = +[NSNumber numberWithInteger:10 * llround(v18 / 10.0)];
        long long v20 = +[NSNumberFormatter localizedStringFromNumber:v19 numberStyle:0];

        v21 = WebLocalizedString();
        v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v20);
        [(UILabel *)self->_altitudeLabel setText:v22];
      }
    }
  }
}

- (BOOL)_shouldHideCoordinateLabel
{
  [(CLLocation *)self->_userLocation coordinate];
  BOOL v3 = (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:") & 1) != 0|| [(CLLocation *)self->_userLocation referenceFrame] == 2;
  if (self->_userLocation) {
    return [(CLLocationManager *)self->_sharedLocationManager _limitsPrecision] | v3;
  }
  else {
    return 1;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CompassPageViewController;
  [(CompassPageViewController *)&v8 viewWillAppear:a3];
  [(CompassPageViewController *)self startMotionManager];
  [(CLLocationManager *)self->_sharedLocationManager startUpdatingHeading];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"userDefaultsChanged:" name:NSUserDefaultsDidChangeNotification object:0];

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"localeDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"preferredFontSizeDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  unsigned int v7 = [(CLLocationManager *)self->_sharedLocationManager authorizationStatus];
  if (v7)
  {
    if (v7 - 3 > 1)
    {
      [(CompassPageViewController *)self setUserLocation:0];
    }
    else
    {
      [(CLLocationManager *)self->_sharedLocationManager startUpdatingLocation];
      [(CompassPageViewController *)self _updatePlaceLabels];
    }
  }
  else
  {
    [(CLLocationManager *)self->_sharedLocationManager requestWhenInUseAuthorization];
  }
}

- (void)updateDisplay:(id)a3
{
  id v6 = [(CompassMotionManager *)self->_manager deviceMotion];
  int v4 = [v6 magneticFieldCalibrationLevel] != 0;
  int hasCalibration = self->_hasCalibration;
  if (hasCalibration != v4)
  {
    self->_int hasCalibration = v4;
    [(CompassPageViewController *)self _updatePlaceLabelLayout];
  }
  [v6 heading];
  -[CompassPageViewController setCompassToAngle:force:](self, "setCompassToAngle:force:", hasCalibration != v4);
  [v6 gravity];
  -[CompassPageViewController setCrosshairLevelForData:](self, "setCrosshairLevelForData:");
}

- (void)setCrosshairLevelForData:(id)a3
{
}

- (void)setCompassToAngle:(double)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = sub_100004F34(self->_currentCompassAngle * 3.14159265 / 180.0, a3 * 3.14159265 / 180.0) * 180.0 / 3.14159265;
  compassIdleTimer = self->_compassIdleTimer;
  if (vabdd_f64(v6, self->_currentCompassAngle) >= 2.0)
  {
    [(NSTimer *)compassIdleTimer invalidate];
    id v10 = self->_compassIdleTimer;
    self->_compassIdleTimer = 0;

    id v9 = +[UIApplication sharedApplication];
    [v9 setIdleTimerDisabled:1];
  }
  else
  {
    if (compassIdleTimer) {
      goto LABEL_6;
    }
    objc_super v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_enableIdleTimer" selector:0 userInfo:0 repeats:60.0];
    id v9 = self->_compassIdleTimer;
    self->_compassIdleTimer = v8;
  }

LABEL_6:
  double currentCompassAngle = self->_currentCompassAngle;
  if (vabdd_f64(v6, currentCompassAngle) >= 0.100000001 || v4)
  {
    self->_double previousCompassAngle = currentCompassAngle;
    long double v13 = fmod(v6 * (1.0 - self->_headingFilter) + self->_currentCompassAngle * self->_headingFilter + 360.0, 360.0);
    self->_double currentCompassAngle = v13;
    if (self->_enableHaptics)
    {
      double previousCompassAngle = self->_previousCompassAngle;
      if (previousCompassAngle >= v13) {
        double v15 = v13;
      }
      else {
        double v15 = self->_previousCompassAngle;
      }
      if (previousCompassAngle >= v13) {
        double v16 = self->_previousCompassAngle;
      }
      else {
        double v16 = v13;
      }
      if (v16 - v15 <= 180.0 && (v15 >= 180.0 || v16 <= 180.0)) {
        goto LABEL_28;
      }
      if (v13 >= previousCompassAngle) {
        double v17 = v13;
      }
      else {
        double v17 = self->_previousCompassAngle;
      }
      if (v13 >= previousCompassAngle) {
        long double v13 = self->_previousCompassAngle;
      }
      if (v17 - v13 <= 180.0)
      {
LABEL_28:
        if (v16 - v15 <= 30.0)
        {
          int v19 = 0;
          double v18 = &OBJC_IVAR___CompassPageViewController__lightImpact;
          while (1)
          {
            v19 += 30;
            if (v15 < (double)v19 && v16 > (double)v19) {
              break;
            }
            if (v19 >= 0x14A) {
              goto LABEL_31;
            }
          }
        }
        else
        {
          double v18 = &OBJC_IVAR___CompassPageViewController__lightImpact;
        }
      }
      else
      {
        double v18 = &OBJC_IVAR___CompassPageViewController__heavyImpact;
      }
      [*(id *)((char *)&self->super.super.super.isa + *v18) impactOccurred];
    }
LABEL_31:
    [(CompassView *)self->_compassView setCompassHeading:self->_currentCompassAngle];
    [(CompassPageViewController *)self _updateHeadingLabels:v4];
  }
}

- (void)_updateDirectionLabel:(BOOL)a3
{
  StringWithLocationDirection(self->_currentCompassAngle);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_directionLabel setText:v4];
}

- (void)_updateDegreesLabel:(BOOL)a3
{
  LODWORD(v3) = vcvtmd_s64_f64(self->_currentCompassAngle);
  if (self->_currentDisplayHeading == v3 && !a3) {
    return;
  }
  if (self->_hasCalibration)
  {
    self->_currentDisplayHeading = v3;
    double v6 = +[NSNumber numberWithUnsignedShort:v3];
    id v14 = [(NSMutableDictionary *)self->_formattedDegreeText objectForKeyedSubscript:v6];
    if (!v14)
    {
      unsigned int v7 = sub_1000066BC();
      objc_super v8 = +[NSNumber numberWithUnsignedShort:v3];
      id v14 = [v7 stringFromNumber:v8];

      [(NSMutableDictionary *)self->_formattedDegreeText setObject:v14 forKeyedSubscript:v6];
    }
  }
  else
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_formattedDegreeText objectForKeyedSubscript:@"uncalibrated"];
    if (v9) {
      goto LABEL_12;
    }
    long double v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"--" value:&stru_100010838 table:0];

    [(NSMutableDictionary *)self->_formattedDegreeText setObject:v14 forKeyedSubscript:@"uncalibrated"];
  }
  uint64_t v9 = (uint64_t)v14;
LABEL_12:
  id v15 = (id)v9;
  [(UILabel *)self->_degreesLabel setText:v9];
  degreesSymbolLabel = self->_degreesSymbolLabel;
  id v11 = +[NSBundle mainBundle];
  double v12 = [v11 localizedStringForKey:@"°" value:&stru_100010838 table:0];
  [(UILabel *)degreesSymbolLabel setText:v12];
}

- (void)_updateHeadingLabels:(BOOL)a3
{
  BOOL v3 = a3;
  -[CompassPageViewController _updateDegreesLabel:](self, "_updateDegreesLabel:");

  [(CompassPageViewController *)self _updateDirectionLabel:v3];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompassPageViewController;
  [(CompassPageViewController *)&v4 viewDidAppear:a3];
  self->_enableHaptics = 1;
}

- (void)activateConstraintSetForFontSize:(double)a3
{
  if (a3 <= 21.0)
  {
    altitudeLabel = self->_altitudeLabel;
  }
  else
  {
    objc_super v4 = [(CompassPageViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    unsigned int v7 = [(CompassPageViewController *)self view];
    [v7 bounds];
    double v9 = v6 / v8;

    altitudeLabel = self->_altitudeLabel;
    if (v9 >= 0.47)
    {
      double v11 = 0.0;
      goto LABEL_6;
    }
  }
  double v11 = 1.0;
LABEL_6:

  [(UILabel *)altitudeLabel setAlpha:v11];
}

- (void)preferredFontSizeDidChange:(id)a3
{
  sub_100001640();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 pointSize];
  double v5 = v4;
  [v6 _compass_scaledValueForValue:20.0];
  -[UIStackView setSpacing:](self->_labelStackView, "setSpacing:");
  [(UILabel *)self->_placeLabel setFont:v6];
  [(CompassCopyableLabel *)self->_coordinatesLabel setFont:v6];
  [(UILabel *)self->_altitudeLabel setFont:v6];
  [(CompassPageViewController *)self _updatePlaceLabelLayout];
  [(CompassPageViewController *)self activateConstraintSetForFontSize:v5];
  [(CompassView *)self->_compassView layoutSubviews];
}

- (void)localeDidChange:(id)a3
{
  [(NSMutableDictionary *)self->_formattedDegreeText removeAllObjects];
  [(CompassPageViewController *)self _updateCoordinateLabel];

  [(CompassPageViewController *)self _updateHeadingLabels:1];
}

- (void)dealloc
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"kMagneticNorth"];

  [(NSTimer *)self->_compassIdleTimer invalidate];
  compassIdleTimer = self->_compassIdleTimer;
  self->_compassIdleTimer = 0;

  [(CompassMotionManager *)self->_manager stopDeviceMotionUpdates];
  v5.receiver = self;
  v5.super_class = (Class)CompassPageViewController;
  [(CompassPageViewController *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (void)userDefaultsChanged:(id)a3
{
  double v4 = +[NSUserDefaults standardUserDefaults];
  self->_usesTrueNorth = [v4 BOOLForKey:@"kMagneticNorth"];

  [(CompassPageViewController *)self startMotionManager];
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 floatForKey:@"kCompassHeadingFilterKey"];
  self->_headingFilter = v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CompassPageViewController;
  [(CompassPageViewController *)&v6 viewWillDisappear:a3];
  self->_enableHaptics = 0;
  heavyImpact = self->_heavyImpact;
  self->_heavyImpact = 0;

  lightImpact = self->_lightImpact;
  self->_lightImpact = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CompassPageViewController;
  [(CompassPageViewController *)&v6 viewDidDisappear:a3];
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  float v5 = +[UIApplication sharedApplication];
  [v5 setIdleTimerDisabled:0];

  [(CLLocationManager *)self->_sharedLocationManager stopUpdatingHeading];
  [(CLLocationManager *)self->_sharedLocationManager stopUpdatingLocation];
}

- (void)_enableIdleTimer
{
  id v2 = +[UIApplication sharedApplication];
  [v2 setIdleTimerDisabled:0];
}

- (CLLocation)userLocation
{
  return self->_userLocation;
}

- (void)_openMaps
{
  [(CLLocation *)self->_userLocation coordinate];
  uint64_t v4 = v3;
  [(CLLocation *)self->_userLocation coordinate];
  +[NSString stringWithFormat:@"maps:ll=%f,%f&trackingMode=2", v4, v5];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v6 = +[UIApplication sharedApplication];
  unsigned int v7 = +[NSURL URLWithString:v8];
  [v6 openURL:v7 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)_forceCalibration
{
  id v2 = +[GEOPlatform sharedPlatform];
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    +[CUICalibration showCalibrationAlert];
  }
}

- (void)configureForTestingWithOptions:(id)a3
{
  manager = self->_manager;
  id v5 = a3;
  [(CompassMotionManager *)manager setConfiguredForTesting:1];
  LODWORD(manager) = [v5 shouldSetBearing];

  if (manager)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v6 = dispatch_time(0, 250000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007FC0;
    v7[3] = &unk_1000104A8;
    objc_copyWeak(&v8, &location);
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)testCleanup
{
  [(CompassMotionManager *)self->_manager setConfiguredForTesting:0];
  compassView = self->_compassView;

  [(CompassView *)compassView unsetBearing];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleLabel, 0);
  objc_storeStrong((id *)&self->_lightImpact, 0);
  objc_storeStrong((id *)&self->_heavyImpact, 0);
  objc_storeStrong((id *)&self->_sharedLocationManager, 0);
  objc_storeStrong((id *)&self->_formattedDegreeText, 0);
  objc_storeStrong((id *)&self->_compassIdleTimer, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bottomToLabelsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_labelsToCompassLayoutGuide, 0);
  objc_storeStrong((id *)&self->_compassToTopLayoutGuide, 0);
  objc_storeStrong((id *)&self->_lastGeocodeLocation, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_altitudeLabel, 0);
  objc_storeStrong((id *)&self->_placeLabel, 0);
  objc_storeStrong((id *)&self->_coordinatesLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_directionLabel, 0);
  objc_storeStrong((id *)&self->_degreesSymbolLabel, 0);
  objc_storeStrong((id *)&self->_degreesLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_compassView, 0);

  objc_storeStrong((id *)&self->_compassContainer, 0);
}

@end