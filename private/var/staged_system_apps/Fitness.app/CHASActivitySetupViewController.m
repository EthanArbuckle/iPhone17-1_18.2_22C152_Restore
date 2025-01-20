@interface CHASActivitySetupViewController
- (BOOL)_currentPageHasGoalSchedule;
- (BOOL)_isGoalSchedule:(id)a3 theSameAs:(id)a4;
- (BOOL)_isStandalonePhoneFitnessMode;
- (BOOL)_shouldShowChangeGoalFooter;
- (BOOL)shouldAccountForHeaderHeight;
- (BPSBuddyControllerDelegate)delegate;
- (CHASActivitySetupViewController)init;
- (CHASActivitySetupViewController)initWithPresentationContext:(int64_t)a3;
- (CHASActivitySetupViewController)initWithPresentationContext:(int64_t)a3 goalType:(int64_t)a4 editTodayOnly:(BOOL)a5;
- (NSNumber)recommendedMoveGoal;
- (id)_activityLevelView;
- (id)_createGoalViewWithFrame:(CGRect)a3 configuration:(id)a4;
- (id)_exerciseGoalViewConfiguration;
- (id)_exerciseQuantityForToday;
- (id)_existingActivityGoalScheduleForCurrentPage;
- (id)_formattingManager;
- (id)_moveGoalViewConfiguration;
- (id)_moveQuantityForToday;
- (id)_standGoalViewConfiguration;
- (id)_standQuantityForToday;
- (id)_unitManager;
- (id)activityLevelForSegmentedControlIndex:(int64_t)a3;
- (id)advanceGoalHeaderTitle;
- (id)continueButtonTitle;
- (id)currentExerciseGoal;
- (id)currentMoveGoal;
- (id)currentStandGoal;
- (id)healthStore;
- (id)tapToRadarMetadata;
- (int64_t)_activityGoalTypeForCurrentPage;
- (int64_t)presentationContext;
- (void)_activityLevelPresetChanged:(id)a3;
- (void)_dismiss:(id)a3;
- (void)_displayExerciseGoalViewAnimated:(BOOL)a3;
- (void)_displayStandGoalViewAnimated:(BOOL)a3;
- (void)_fetchActiveExerciseGoalSampleWithCompletion:(id)a3;
- (void)_fetchActiveMoveGoalSampleWithCompletion:(id)a3;
- (void)_fetchActiveSampleForQuantityType:(id)a3 completion:(id)a4;
- (void)_fetchActiveStandGoalSampleWithCompletion:(id)a3;
- (void)_fetchMostRecentDailyExerciseGoalSampleWithCompletion:(id)a3;
- (void)_fetchMostRecentDailyGoalSampleForQuantityType:(id)a3 completion:(id)a4;
- (void)_fetchMostRecentDailyMoveGoalSampleWithCompletion:(id)a3;
- (void)_fetchMostRecentDailyStandGoalSampleWithCompletion:(id)a3;
- (void)_fetchMostRecentGoalSchedulesWithCompletion:(id)a3;
- (void)_loadExerciseAndStandGoalViews;
- (void)_loadMoveGoalView;
- (void)_removeAdvancedView;
- (void)_removeGoalsOfType:(id)a3 after:(id)a4;
- (void)_saveGoalsAndDismiss;
- (void)_setActivityLevel:(id)a3 activityMoveMode:(int64_t)a4;
- (void)_setGoalQuantity:(id)a3 goalView:(id)a4;
- (void)_setGoalQuantityForGoalView:(id)a3;
- (void)_setGoalSchedules:(id)a3;
- (void)_showAdvancedViewForCurrentGoalPage;
- (void)_showAdvancedViewIfNeeded;
- (void)_storeGoals;
- (void)_toggleAdvancedMode;
- (void)_updateAdvanceViewButton:(id)a3;
- (void)_updateGoalSchedule;
- (void)alignGoalViews;
- (void)computeMaxYForGoalViews;
- (void)generateHeaders;
- (void)setActivityLevels:(id)a3 activityMoveMode:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setRecommendedMoveGoal:(id)a3;
- (void)tappedContinue:(id)a3;
- (void)updateContinueButton;
- (void)updateHeaderViewContent;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CHASActivitySetupViewController

- (CHASActivitySetupViewController)init
{
  return [(CHASActivitySetupViewController *)self initWithPresentationContext:0];
}

- (CHASActivitySetupViewController)initWithPresentationContext:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHASActivitySetupViewController;
  result = [(CHASActivitySetupViewController *)&v5 initWithTitle:&stru_1008D8AB8 detailText:0 icon:0];
  if (result)
  {
    result->_goalType = -1;
    result->_presentationContext = a3;
  }
  return result;
}

- (CHASActivitySetupViewController)initWithPresentationContext:(int64_t)a3 goalType:(int64_t)a4 editTodayOnly:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CHASActivitySetupViewController;
  result = [(CHASActivitySetupViewController *)&v9 initWithTitle:&stru_1008D8AB8 detailText:0 icon:0];
  if (result)
  {
    result->_goalType = a4;
    result->_editTodayOnly = a5;
    result->_presentationContext = a3;
  }
  return result;
}

- (id)advanceGoalHeaderTitle
{
  unint64_t v4 = [(CHASActivitySetupViewController *)self _activityGoalTypeForCurrentPage];
  if (v4 < 2)
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    CFStringRef v8 = @"CUSTOM_MOVE_GOAL";
  }
  else if (v4 == 2)
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    CFStringRef v8 = @"CUSTOM_EXERCISE_GOAL";
  }
  else
  {
    if (v4 != 3) {
      goto LABEL_10;
    }
    BOOL isWheelchairUser = self->_isWheelchairUser;
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    if (isWheelchairUser) {
      CFStringRef v8 = @"CUSTOM_ROLL_GOAL";
    }
    else {
      CFStringRef v8 = @"CUSTOM_STAND_GOAL";
    }
  }
  v2 = [v6 localizedStringForKey:v8 value:&stru_1008D8AB8 table:@"ActivitySetup"];

LABEL_10:

  return v2;
}

- (void)generateHeaders
{
  v3 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  unint64_t v4 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  if (self->_editTodayOnly) {
    objc_super v5 = @"_FOR_TODAY";
  }
  else {
    objc_super v5 = &stru_1008D8AB8;
  }
  v6 = v5;
  v49 = v3;
  v50 = v6;
  if (self->_recommendedMoveGoal)
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"RECOMMENDED_MOVE_GOAL" value:&stru_1008D8AB8 table:@"ActivitySetup"];

    objc_super v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"RECOMMENDED_MOVE_GOAL_DESCRIPTION" value:&stru_1008D8AB8 table:@"ActivitySetup"];
  }
  else if (self->_isTinkerPaired)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = [WeakRetained setupFlowUserInfo];
    objc_super v9 = [v12 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

    v13 = [v9 firstName];
    v14 = [v13 localizedCapitalizedString];

    v45 = +[NSString stringWithFormat:@"SET_UP_MOVE_GOAL%@", v50];
    if (v14)
    {
      uint64_t v15 = +[NSString stringWithFormat:@"DAILY_MOVE_GOAL_DESCRIPTION_FITNESS_JR_TINKER%@_%@", v50, @"%@"];
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v47 = (void *)v15;
      [v16 localizedStringForKey:v15 value:&stru_1008D8AB8 table:@"ActivitySetup"];
      v18 = v17 = v4;
      uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v14);

      unint64_t v4 = v17;
      v3 = v49;
    }
    else
    {
      uint64_t v24 = +[NSString stringWithFormat:@"DAILY_MOVE_GOAL_DESCRIPTION_FITNESS_JR_TINKER%@", v50];
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v47 = (void *)v24;
      uint64_t v10 = [v16 localizedStringForKey:v24 value:&stru_1008D8AB8 table:@"ActivitySetup"];
    }

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v25 localizedStringForKey:v45 value:&stru_1008D8AB8 table:@"ActivitySetup"];
  }
  else
  {
    objc_super v9 = +[NSString stringWithFormat:@"SET_UP_MOVE_GOAL%@", v6];
    v19 = +[NSString stringWithFormat:@"DAILY_MOVE_GOAL_DESCRIPTION%@", v50];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:v9 value:&stru_1008D8AB8 table:@"ActivitySetup"];

    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v23 = [v22 localizedStringForKey:v19 value:&stru_1008D8AB8 table:@"ActivitySetup"];

    uint64_t v8 = v21;
    uint64_t v10 = v23;
  }
  v48 = (void *)v8;
  [(NSArray *)v3 setObject:v8 atIndexedSubscript:0];
  [(NSArray *)v4 setObject:v10 atIndexedSubscript:0];
  if (self->_isTinkerPaired) {
    CFStringRef v26 = @"_FITNESS_JR_TINKER";
  }
  else {
    CFStringRef v26 = @"_FITNESS_JR";
  }
  v46 = (void *)v10;
  v42 = v4;
  if (self->_activityMoveMode != 2)
  {
    if (self->_isWheelchairUser) {
      CFStringRef v26 = @"_WHEELCHAIR";
    }
    else {
      CFStringRef v26 = &stru_1008D8AB8;
    }
  }
  v44 = +[NSString stringWithFormat:@"SET_UP_EXERCISE_GOAL%@", v50];
  v43 = +[NSString stringWithFormat:@"DAILY_EXERCISE_GOAL_DESCRIPTION%@%@", v26, v50];
  v27 = +[NSBundle bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:v44 value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [(NSArray *)v49 setObject:v28 atIndexedSubscript:1];

  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:v43 value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [(NSArray *)v42 setObject:v30 atIndexedSubscript:1];

  if (self->_isWheelchairUser) {
    v31 = @"ROLL";
  }
  else {
    v31 = @"STAND";
  }
  v32 = v31;
  v33 = +[NSString stringWithFormat:@"SET_UP_%@_GOAL%@", v32, v50];
  v34 = +[NSString stringWithFormat:@"DAILY_%@_GOAL_DESCRIPTION%@", v32, v50];

  v35 = +[NSBundle bundleForClass:objc_opt_class()];
  v36 = [v35 localizedStringForKey:v33 value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [(NSArray *)v49 setObject:v36 atIndexedSubscript:2];

  v37 = +[NSBundle bundleForClass:objc_opt_class()];
  v38 = [v37 localizedStringForKey:v34 value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [(NSArray *)v42 setObject:v38 atIndexedSubscript:2];

  pageTitles = self->_pageTitles;
  self->_pageTitles = v49;
  v40 = v49;

  pageDetailTexts = self->_pageDetailTexts;
  self->_pageDetailTexts = v42;
}

- (void)viewDidLoad
{
  v131.receiver = self;
  v131.super_class = (Class)CHASActivitySetupViewController;
  [(CHASActivitySetupViewController *)&v131 viewDidLoad];
  if (self->_presentationContext == 6)
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    unint64_t v4 = FIUIBundle();
    objc_super v5 = [v4 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_1008D8AB8 table:@"Localizable"];
    id v6 = [v3 initWithTitle:v5 style:0 target:self action:"_dismiss:"];
    v7 = [(CHASActivitySetupViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];
  }
  id v8 = objc_alloc((Class)FIActivitySettingsController);
  objc_super v9 = [(CHASActivitySetupViewController *)self healthStore];
  id v10 = [v8 initWithHealthStore:v9];

  [v10 populateExistingCharacteristics];
  self->_int64_t activityMoveMode = 1;
  self->_BOOL isWheelchairUser = [v10 wheelchairUse] == (id)2;
  healthStore = self->_healthStore;
  id v130 = 0;
  v12 = [(HKHealthStore *)healthStore _activityMoveModeWithError:&v130];
  id v13 = v130;
  if (v13 && (_HKInitializeLogging(), os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)))
  {
    sub_10071BF74();
    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
LABEL_6:
    id v14 = [v12 integerValue];
    goto LABEL_7;
  }
  v108 = [v10 dateOfBirth];
  if (!v108) {
    goto LABEL_8;
  }
  BOOL isWheelchairUser = self->_isWheelchairUser;

  if (isWheelchairUser) {
    goto LABEL_8;
  }
  v110 = [v10 dateOfBirth];
  FIAgeInYearsForDateOfBirth();

  id v14 = (id)FIDefaultActivityMoveModeWithAge();
LABEL_7:
  self->_int64_t activityMoveMode = (int64_t)v14;
LABEL_8:
  self->_isRTL = FIUILocaleIsRightToLeft();
  uint64_t v15 = [(CHASActivitySetupViewController *)self delegate];
  v16 = [v15 activePairingDevice];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    FIGetActivePairedDevice();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x2020000000;
  v20 = (id *)qword_10096B480;
  uint64_t v135 = qword_10096B480;
  if (!qword_10096B480)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    *(void *)&long long v119 = sub_100105F10;
    *((void *)&v119 + 1) = &unk_1008ABB60;
    *(void *)&long long v120 = &v132;
    sub_100105F10((uint64_t)location);
    v20 = (id *)v133[3];
  }
  _Block_object_dispose(&v132, 8);
  if (!v20)
  {
    sub_10071BE08();
    v112 = v111;
    objc_destroyWeak(0);
    objc_destroyWeak(location);
    _Unwind_Resume(v112);
  }
  v117 = v12;
  id v21 = *v20;
  v22 = [v19 valueForProperty:v21];
  self->_isTinkerPaired = [v22 BOOLValue];

  self->_currentPageIndex = 0;
  [(CHASActivitySetupViewController *)self generateHeaders];
  int64_t activityMoveMode = self->_activityMoveMode;
  [v10 biologicalSex];
  v115 = v19;
  v116 = v13;
  [v10 weight];
  if (activityMoveMode == 2) {
    uint64_t v24 = {;
  }
    v25 = +[HKUnit gramUnitWithMetricPrefix:9];
    [v24 doubleValueForUnit:v25];

    CFStringRef v26 = [v10 height];
    v27 = +[HKUnit meterUnitWithMetricPrefix:7];
    [v26 doubleValueForUnit:v27];

    v28 = [v10 dateOfBirth];
    FIAgeInYearsForDateOfBirth();

    [v10 wheelchairUse];
    FICMotionConditionForWheelchairUse();
    [(CHASActivitySetupViewController *)self _isStandalonePhoneFitnessMode];
    v29 = [(CHASActivitySetupViewController *)self _formattingManager];
    FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode();
  }
  else {
    v30 = {;
  }
    v31 = [v10 leanBodyMass];
    v32 = [v10 height];
    v33 = [v10 dateOfBirth];
    [v10 wheelchairUse];
    FIUICalculateBMR();

    [(CHASActivitySetupViewController *)self _isStandalonePhoneFitnessMode];
    v29 = [(CHASActivitySetupViewController *)self _formattingManager];
    FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode();
  uint64_t v34 = };

  v35 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v35;

  [(UIScrollView *)self->_scrollView setPagingEnabled:0];
  [(UIScrollView *)self->_scrollView setScrollEnabled:0];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setUserInteractionEnabled:1];
  [(UIScrollView *)self->_scrollView setExclusiveTouch:0];
  [(UIScrollView *)self->_scrollView setCanCancelContentTouches:1];
  v37 = [(CHASActivitySetupViewController *)self contentView];
  [v37 addSubview:self->_scrollView];

  v38 = [(CHASActivitySetupViewController *)self contentView];
  v39 = [v38 topAnchor];
  v40 = [(UIScrollView *)self->_scrollView topAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(CHASActivitySetupViewController *)self contentView];
  v43 = [v42 bottomAnchor];
  v44 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  [(CHASActivitySetupViewController *)self _loadMoveGoalView];
  v114 = (void *)v34;
  [(CHASActivitySetupViewController *)self setActivityLevels:v34 activityMoveMode:self->_activityMoveMode];
  v46 = +[_HKBehavior sharedBehavior];
  v47 = [v46 features];
  LODWORD(v44) = [v47 scheduledGoals];

  if (v44)
  {
    v48 = +[UIButtonConfiguration plainButtonConfiguration];
    v49 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleCaption1];
    v113 = +[UIImageSymbolConfiguration configurationWithFont:v49];
    v50 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", @"calendar");
    [v48 setImage:v50];

    v51 = +[NSBundle bundleForClass:objc_opt_class()];
    v52 = [v51 localizedStringForKey:@"SCHEDULE" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    [v48 setTitle:v52];

    [v48 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
    [v48 setImagePadding:3.0];
    objc_initWeak(location, self);
    v128[0] = _NSConcreteStackBlock;
    v128[1] = 3221225472;
    v128[2] = sub_1000FFC30;
    v128[3] = &unk_1008ABCC8;
    objc_copyWeak(&v129, location);
    v53 = +[UIAction actionWithHandler:v128];
    v54 = +[UIButton buttonWithConfiguration:v48 primaryAction:v53];
    advancedButton = self->_advancedButton;
    self->_advancedButton = v54;

    [(UIButton *)self->_advancedButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v56 = self->_advancedButton;
    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_1000FFC70;
    v126[3] = &unk_1008ABCF0;
    objc_copyWeak(&v127, location);
    [(UIButton *)v56 setConfigurationUpdateHandler:v126];
    if (!self->_editTodayOnly)
    {
      id v57 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_advancedButton];
      v58 = [(CHASActivitySetupViewController *)self navigationItem];
      [v58 setRightBarButtonItem:v57];
    }
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472;
    v124[2] = sub_1000FFCCC;
    v124[3] = &unk_1008ABD40;
    objc_copyWeak(&v125, location);
    [(CHASActivitySetupViewController *)self _fetchMostRecentGoalSchedulesWithCompletion:v124];
    objc_destroyWeak(&v125);
    objc_destroyWeak(&v127);

    objc_destroyWeak(&v129);
    objc_destroyWeak(location);
  }
  if (self->_recommendedMoveGoal)
  {
    if (self->_activityMoveMode == 2)
    {
      v59 = +[HKUnit minuteUnit];
    }
    else
    {
      v60 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
      v59 = [v60 userActiveEnergyBurnedUnit];
    }
    [(NSNumber *)self->_recommendedMoveGoal doubleValue];
    v61 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v59);
    [(CHASActivitySetupViewController *)self _setGoalQuantity:v61 goalView:self->_moveGoalView];
  }
  else
  {
    objc_initWeak(location, self);
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_1000FFDFC;
    v122[3] = &unk_1008ABDB8;
    objc_copyWeak(&v123, location);
    [(CHASActivitySetupViewController *)self _fetchMostRecentDailyMoveGoalSampleWithCompletion:v122];
    objc_destroyWeak(&v123);
    objc_destroyWeak(location);
  }
  [(CHASActivitySetupViewController *)self _loadExerciseAndStandGoalViews];
  v62 = [(CHASActivitySetupViewController *)self _activityLevelView];
  [(UIScrollView *)self->_scrollView addSubview:v62];
  [v62 setTranslatesAutoresizingMaskIntoConstraints:0];
  v63 = [v62 topAnchor];
  v64 = [(CHASActivitySetupViewController *)self contentView];
  v65 = [v64 topAnchor];
  *(_OWORD *)location = 0u;
  long long v119 = 0u;
  __asm { FMOV            V0.2D, #16.0 }
  long long v120 = _Q0;
  long long v121 = _Q0;
  BPSScreenValueGetRelevantValue();
  v71 = [v63 constraintEqualToAnchor:v65];
  [v71 setActive:1];

  v72 = [v62 centerXAnchor];
  v73 = [(CHASActivitySetupViewController *)self contentView];
  v74 = [v73 centerXAnchor];
  v75 = [v72 constraintEqualToAnchor:v74];
  [v75 setActive:1];

  v76 = [v62 leadingAnchor];
  v77 = [(CHASActivitySetupViewController *)self contentView];
  v78 = [v77 leadingAnchor];
  v79 = [v76 constraintEqualToAnchor:v78];
  [v79 setActive:1];

  v80 = [v62 trailingAnchor];
  v81 = [(CHASActivitySetupViewController *)self contentView];
  v82 = [v81 trailingAnchor];
  v83 = [v80 constraintEqualToAnchor:v82];
  [v83 setActive:1];

  v84 = +[OBBoldTrayButton boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v84;

  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:"tappedContinue:" forControlEvents:64];
  v86 = self->_continueButton;
  v87 = BPSPillSelectedColor();
  [(OBBoldTrayButton *)v86 setTintColor:v87];

  v88 = [(OBBoldTrayButton *)self->_continueButton configuration];
  v89 = +[ARUIMetricColors keyColors];
  v90 = [v89 nonGradientTextColor];
  [v88 setBaseForegroundColor:v90];

  v91 = [(CHASActivitySetupViewController *)self continueButtonTitle];
  [v88 setTitle:v91];

  [(OBBoldTrayButton *)self->_continueButton setConfiguration:v88];
  v92 = [(CHASActivitySetupViewController *)self buttonTray];
  [v92 addButton:self->_continueButton];

  v93 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  footerLabel = self->_footerLabel;
  self->_footerLabel = v93;

  [(UILabel *)self->_footerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_footerLabel setNumberOfLines:0];
  v95 = +[UIFont defaultFontForTextStyle:UIFontTextStyleFootnote];
  [(UILabel *)self->_footerLabel setFont:v95];

  v96 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_footerLabel setTextColor:v96];

  v97 = +[NSBundle bundleForClass:objc_opt_class()];
  v98 = [v97 localizedStringForKey:@"CHANGE_GOAL_FOOTER" value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [(UILabel *)self->_footerLabel setText:v98];

  [(UILabel *)self->_footerLabel setTextAlignment:1];
  if (self->_recommendedMoveGoal)
  {
    [(CHASActivitySetupLevelView *)self->_activityLevelView setAlpha:0.0];
    v99 = self->_continueButton;
    v100 = +[NSBundle bundleForClass:objc_opt_class()];
    v101 = [v100 localizedStringForKey:@"CHANGE_MOVE_GOAL" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    [(OBBoldTrayButton *)v99 setTitle:v101 forState:0];

    v102 = +[OBLinkTrayButton linkButton];
    notNowButton = self->_notNowButton;
    self->_notNowButton = v102;

    [(OBLinkTrayButton *)self->_notNowButton addTarget:self action:"_dismiss:" forControlEvents:64];
    v104 = self->_notNowButton;
    v105 = +[NSBundle bundleForClass:objc_opt_class()];
    v106 = [v105 localizedStringForKey:@"SKIP_LABEL" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    [(OBLinkTrayButton *)v104 setTitle:v106 forState:0];

    v107 = [(CHASActivitySetupViewController *)self buttonTray];
    [v107 addButton:self->_notNowButton];
  }
}

- (void)_updateAdvanceViewButton:(id)a3
{
  id v4 = a3;
  id v14 = [v4 configuration];
  objc_super v5 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleCaption1];
  id v6 = +[UIImageSymbolConfiguration configurationWithFont:v5];
  advancedGoalView = self->_advancedGoalView;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v9 = v8;
  if (advancedGoalView) {
    CFStringRef v10 = @"DAILY";
  }
  else {
    CFStringRef v10 = @"SCHEDULE";
  }
  if (advancedGoalView) {
    CFStringRef v11 = @"calendar.badge.ring.closed";
  }
  else {
    CFStringRef v11 = @"checklist.unchecked.note";
  }
  v12 = [v8 localizedStringForKey:v10 value:&stru_1008D8AB8 table:@"ActivitySetup"];
  [v14 setTitle:v12];

  id v13 = +[UIImage _systemImageNamed:v11 withConfiguration:v6];
  [v14 setImage:v13];

  [v4 setConfiguration:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  int64_t goalType = self->_goalType;
  if (goalType == 2)
  {
    if (self->_currentlyPresentedView != self->_standGoalView) {
      [(CHASActivitySetupViewController *)self _displayStandGoalViewAnimated:0];
    }
  }
  else if (goalType == 1 && self->_currentlyPresentedView != self->_exerciseGoalView)
  {
    [(CHASActivitySetupViewController *)self _displayExerciseGoalViewAnimated:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)CHASActivitySetupViewController;
  [(CHASActivitySetupViewController *)&v40 viewWillLayoutSubviews];
  id v3 = [(CHASActivitySetupViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  int64_t goalType = self->_goalType;
  if (goalType == 2)
  {
    scrollView = self->_scrollView;
    if (self->_isRTL)
    {
      double v8 = v5 * -2.0;
      goto LABEL_7;
    }
    double v9 = v5 + v5;
  }
  else
  {
    if (goalType != 1) {
      goto LABEL_11;
    }
    scrollView = self->_scrollView;
    if (self->_isRTL)
    {
      double v8 = -v5;
LABEL_7:
      -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, v8, 0.0);
      -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v5, 0.0, v5);
      goto LABEL_11;
    }
    double v9 = v5;
  }
  -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, v9, 0.0);
LABEL_11:
  [(CHASActivitySetupViewController *)self computeMaxYForGoalViews];
  headerHeights = self->_headerHeights;
  if (headerHeights) {
    double v11 = headerHeights[self->_currentPageIndex];
  }
  else {
    double v11 = 0.0;
  }
  [(CHASActivitySetupGoalView *)self->_moveGoalView intrinsicContentSize];
  double v13 = v12;
  __asm { FMOV            V0.2D, #16.0 }
  long long v38 = _Q0;
  long long v39 = _Q0;
  BPSScreenValueGetRelevantValue();
  double v20 = v19 + 30.0;
  [(CHASActivitySetupLevelView *)self->_activityLevelView frame];
  double v22 = v20 + v21;
  if ([(CHASActivitySetupViewController *)self shouldAccountForHeaderHeight]) {
    double v22 = v22 + self->_maxHeaderViewHeight - v11;
  }
  uint64_t v23 = [(CHASActivitySetupViewController *)self contentView];
  [v23 frame];
  double v25 = v13 + v22 + v24;
  CFStringRef v26 = [(CHASActivitySetupViewController *)self view];
  [v26 frame];
  double MidY = CGRectGetMidY(v41);

  if (v25 < MidY)
  {
    v28 = [(CHASActivitySetupViewController *)self view];
    [v28 frame];
    double v29 = CGRectGetMidY(v42);
    v30 = [(CHASActivitySetupViewController *)self contentView];
    [v30 frame];
    double v22 = v22 + v29 - (v13 + v22 + v31);
  }
  v32 = self->_scrollView;
  v33 = [(CHASActivitySetupViewController *)self view];
  [v33 bounds];
  -[UIScrollView setFrame:](v32, "setFrame:", 0.0, 0.0);

  uint64_t v34 = [(CHASActivitySetupViewController *)self contentView];
  [v34 bounds];
  double v36 = v35 * 3.0;
  [(CHASActivitySetupGoalView *)self->_moveGoalView intrinsicContentSize];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v36, v22 + v37);

  [(CHASActivitySetupViewController *)self alignGoalViews];
}

- (void)computeMaxYForGoalViews
{
  id v3 = [(CHASActivitySetupViewController *)self headerView];
  [v3 bounds];
  double v5 = v4;

  self->_headerHeights = (double *)malloc_type_malloc(0x18uLL, 0x100004000313F17uLL);
  if ([(NSArray *)self->_pageTitles count])
  {
    unint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      double v8 = [(CHASActivitySetupViewController *)self headerView];
      double v9 = [(NSArray *)self->_pageTitles objectAtIndexedSubscript:v6];
      [v8 setTitle:v9];

      CFStringRef v10 = [(CHASActivitySetupViewController *)self headerView];
      double v11 = [(NSArray *)self->_pageDetailTexts objectAtIndexedSubscript:v6];
      [v10 setDetailText:v11];

      double v12 = [(CHASActivitySetupViewController *)self headerView];
      LODWORD(v13) = 1148846080;
      LODWORD(v14) = 1112014848;
      [v12 _systemLayoutSizeFittingSize:v5 withHorizontalFittingPriority:1.79769313e308 verticalFittingPriority:v13];
      double v16 = v15;

      v17 = [(CHASActivitySetupViewController *)self headerView];
      [v17 frame];
      double v19 = v16 + v18;

      if (v19 > v7) {
        double v7 = v19;
      }
      self->_headerHeights[v6++] = v19;
    }
    while ([(NSArray *)self->_pageTitles count] > v6);
  }
  else
  {
    double v7 = 0.0;
  }
  self->_maxHeaderViewHeight = v7;
  [(CHASActivitySetupViewController *)self updateHeaderViewContent];

  [(CHASActivitySetupViewController *)self updateContinueButton];
}

- (void)updateHeaderViewContent
{
  advancedGoalView = self->_advancedGoalView;
  double v4 = [(CHASActivitySetupViewController *)self headerView];
  if (advancedGoalView) {
    [(CHASActivitySetupViewController *)self advanceGoalHeaderTitle];
  }
  else {
  double v5 = [(NSArray *)self->_pageTitles objectAtIndexedSubscript:self->_currentPageIndex];
  }
  [v4 setTitle:v5];

  id v7 = [(CHASActivitySetupViewController *)self headerView];
  unint64_t v6 = [(NSArray *)self->_pageDetailTexts objectAtIndexedSubscript:self->_currentPageIndex];
  [v7 setDetailText:v6];
}

- (id)continueButtonTitle
{
  unint64_t v4 = [(CHASActivitySetupViewController *)self _activityGoalTypeForCurrentPage];
  if (!self->_advancedGoalView)
  {
    if (v4 < 2)
    {
      if (!self->_defaultDailyMoveGoalQuantity)
      {
        unint64_t v6 = @"SET_MOVE_GOAL";
        goto LABEL_41;
      }
      if (self->_editTodayOnly) {
        CFStringRef v11 = @"_FOR_TODAY";
      }
      else {
        CFStringRef v11 = &stru_1008D8AB8;
      }
      +[NSString stringWithFormat:@"CHANGE_MOVE_GOAL%@", v11, v16];
    }
    else if (v4 == 2)
    {
      if (!self->_defaultDailyExerciseGoalQuantity)
      {
        unint64_t v6 = @"SET_EXERCISE_GOAL";
        goto LABEL_41;
      }
      if (self->_editTodayOnly) {
        CFStringRef v13 = @"_FOR_TODAY";
      }
      else {
        CFStringRef v13 = &stru_1008D8AB8;
      }
      +[NSString stringWithFormat:@"CHANGE_EXERCISE_GOAL%@", v13, v16];
    }
    else
    {
      if (v4 != 3)
      {
        unint64_t v6 = 0;
        goto LABEL_41;
      }
      if (!self->_defaultDailyStandGoalQuantity)
      {
        unint64_t v6 = @"SET_STAND_GOAL";
        goto LABEL_41;
      }
      if (self->_isWheelchairUser) {
        CFStringRef v8 = @"ROLL";
      }
      else {
        CFStringRef v8 = @"STAND";
      }
      if (self->_editTodayOnly) {
        CFStringRef v9 = @"_FOR_TODAY";
      }
      else {
        CFStringRef v9 = &stru_1008D8AB8;
      }
      +[NSString stringWithFormat:@"CHANGE_%@_GOAL%@", v8, v9];
    }
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_41:
    double v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v2 = [v14 localizedStringForKey:v6 value:&stru_1008D8AB8 table:@"ActivitySetup"];

    goto LABEL_42;
  }
  if (v4 < 2)
  {
    BOOL hasMoveGoalSchedule = self->_hasMoveGoalSchedule;
    unint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    if (hasMoveGoalSchedule) {
      CFStringRef v7 = @"CHANGE_MOVE_GOAL_SCHEDULE";
    }
    else {
      CFStringRef v7 = @"SET_MOVE_GOAL_SCHEDULE";
    }
  }
  else if (v4 == 2)
  {
    BOOL hasExerciseGoalSchedule = self->_hasExerciseGoalSchedule;
    unint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    if (hasExerciseGoalSchedule) {
      CFStringRef v7 = @"CHANGE_EXERCISE_GOAL_SCHEDULE";
    }
    else {
      CFStringRef v7 = @"SET_EXERCISE_GOAL_SCHEDULE";
    }
  }
  else
  {
    if (v4 != 3) {
      goto LABEL_43;
    }
    BOOL isWheelchairUser = self->_isWheelchairUser;
    unint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    if (isWheelchairUser) {
      CFStringRef v7 = @"CHANGE_ROLL_GOAL_SCHEDULE";
    }
    else {
      CFStringRef v7 = @"SET_STAND_GOAL_SCHEDULE";
    }
  }
  v2 = [(__CFString *)v6 localizedStringForKey:v7 value:&stru_1008D8AB8 table:@"ActivitySetup"];
LABEL_42:

LABEL_43:

  return v2;
}

- (void)updateContinueButton
{
  id v8 = [(OBBoldTrayButton *)self->_continueButton configuration];
  id v3 = [(CHASActivitySetupViewController *)self continueButtonTitle];
  [v8 setTitle:v3];

  [(OBBoldTrayButton *)self->_continueButton setConfiguration:v8];
  advancedGoalView = self->_advancedGoalView;
  BOOL v5 = advancedGoalView == 0;
  if (advancedGoalView) {
    unint64_t v6 = &selRef_tappedContinue_;
  }
  else {
    unint64_t v6 = &selRef__updateGoalSchedule;
  }
  if (v5) {
    CFStringRef v7 = &selRef_tappedContinue_;
  }
  else {
    CFStringRef v7 = &selRef__updateGoalSchedule;
  }
  [(OBBoldTrayButton *)self->_continueButton removeTarget:self action:*v6 forControlEvents:64];
  [(OBBoldTrayButton *)self->_continueButton addTarget:self action:*v7 forControlEvents:64];
}

- (BOOL)shouldAccountForHeaderHeight
{
  id v3 = [(CHASActivitySetupViewController *)self headerView];
  [v3 frame];
  double v5 = v4;
  unint64_t v6 = [(CHASActivitySetupViewController *)self headerView];
  [v6 bounds];
  double v8 = v5 + v7;
  CFStringRef v9 = [(CHASActivitySetupViewController *)self contentView];
  [v9 bounds];
  double v11 = v8 + v10;
  double v12 = [(CHASActivitySetupViewController *)self buttonTray];
  [v12 bounds];
  double v14 = v11 + v13;
  double v15 = [(CHASActivitySetupViewController *)self view];
  [v15 bounds];
  BOOL v17 = v14 < v16;

  return v17;
}

- (void)alignGoalViews
{
  id v3 = [(CHASActivitySetupViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  [(CHASActivitySetupGoalView *)self->_moveGoalView intrinsicContentSize];
  double v7 = v6;
  if (self->_isRTL) {
    double v8 = -v5;
  }
  else {
    double v8 = v5;
  }
  [(UIScrollView *)self->_scrollView bounds];
  double v10 = v9 - v7;
  -[CHASActivitySetupGoalView setFrame:](self->_moveGoalView, "setFrame:", 0.0, v9 - v7, v5, v7);
  -[CHASActivitySetupGoalView setFrame:](self->_exerciseGoalView, "setFrame:", v8, v10, v5, v7);
  standGoalView = self->_standGoalView;

  -[CHASActivitySetupGoalView setFrame:](standGoalView, "setFrame:", v8 + v8, v10, v5, v7);
}

- (void)_loadMoveGoalView
{
  moveGoalView = self->_moveGoalView;
  if (moveGoalView) {
    [(CHASActivitySetupGoalView *)moveGoalView removeFromSuperview];
  }
  id v6 = [(CHASActivitySetupViewController *)self _moveGoalViewConfiguration];
  -[CHASActivitySetupViewController _createGoalViewWithFrame:configuration:](self, "_createGoalViewWithFrame:configuration:", v6, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  double v4 = (CHASActivitySetupGoalView *)objc_claimAutoreleasedReturnValue();
  double v5 = self->_moveGoalView;
  self->_moveGoalView = v4;

  objc_storeStrong((id *)&self->_currentlyPresentedView, self->_moveGoalView);
}

- (id)_createGoalViewWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = -[CHASActivitySetupGoalView initWithFrame:configuration:]([CHASActivitySetupGoalView alloc], "initWithFrame:configuration:", v9, x, y, width, height);

  [(UIScrollView *)self->_scrollView addSubview:v10];

  return v10;
}

- (void)_removeGoalsOfType:(id)a3 after:(id)a4
{
  id v6 = a3;
  double v7 = +[NSPredicate predicateWithFormat:@"startDate > %@", a4];
  double v8 = [(CHASActivitySetupViewController *)self healthStore];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100100F84;
  v10[3] = &unk_1008ABDE0;
  id v11 = v6;
  id v9 = v6;
  [v8 deleteObjectsOfType:v9 predicate:v7 withCompletion:v10];
}

- (void)_storeGoals
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  double v4 = +[NSCalendar hk_gregorianCalendar];
  double v5 = +[NSDate date];
  id v6 = [v4 dateByAddingUnit:16 value:1 toDate:v5 options:0];
  v50 = v4;
  v51 = [v4 startOfDayForDate:v6];

  BOOL hasMoveGoalSchedule = self->_hasMoveGoalSchedule;
  double v8 = &selRef_setCenterCoordinate_;
  if (!self->_hasMoveGoalSchedule || self->_editTodayOnly)
  {
    if (self->_newDailyMoveGoal)
    {
      if (self->_activityMoveMode == 2) {
        +[HKObjectType moveMinuteGoal];
      }
      else {
      id v9 = +[HKObjectType calorieGoal];
      }
      newDailyMoveGoal = self->_newDailyMoveGoal;
      if (self->_editTodayOnly)
      {
        CFStringRef v66 = @"_HKPrivateTodayOnlyGoal";
        v67 = &__kCFBooleanTrue;
        id v11 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        double v12 = +[HKQuantitySample quantitySampleWithType:v9 quantity:newDailyMoveGoal startDate:v5 endDate:v5 metadata:v11];
      }
      else
      {
        double v12 = +[HKQuantitySample quantitySampleWithType:v9 quantity:self->_newDailyMoveGoal startDate:v5 endDate:v5 metadata:0];
      }
      [v3 addObject:v12];
      [(CHASActivitySetupViewController *)self _removeGoalsOfType:v9 after:v5];

      BOOL hasMoveGoalSchedule = self->_hasMoveGoalSchedule;
    }
    if (!hasMoveGoalSchedule && self->_editTodayOnly && self->_defaultDailyMoveGoalQuantity)
    {
      if (self->_activityMoveMode == 2) {
        +[HKObjectType moveMinuteGoal];
      }
      else {
      v48 = +[HKObjectType calorieGoal];
      }
      v49 = +[HKQuantitySample quantitySampleWithType:v48 quantity:self->_defaultDailyMoveGoalQuantity startDate:v51 endDate:v51];
      [v3 addObject:v49];
    }
  }
  BOOL hasExerciseGoalSchedule = self->_hasExerciseGoalSchedule;
  if (!self->_hasExerciseGoalSchedule || self->_editTodayOnly)
  {
    if (self->_newDailyExerciseGoal)
    {
      double v14 = +[HKObjectType exerciseGoal];
      newDailyExerciseGoal = self->_newDailyExerciseGoal;
      if (self->_editTodayOnly)
      {
        CFStringRef v64 = @"_HKPrivateTodayOnlyGoal";
        v65 = &__kCFBooleanTrue;
        double v16 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        BOOL v17 = +[HKQuantitySample quantitySampleWithType:v14 quantity:newDailyExerciseGoal startDate:v5 endDate:v5 metadata:v16];

        double v8 = &selRef_setCenterCoordinate_;
      }
      else
      {
        BOOL v17 = +[HKQuantitySample quantitySampleWithType:v14 quantity:newDailyExerciseGoal startDate:v5 endDate:v5 metadata:0];
      }

      [v3 addObject:v17];
      double v18 = +[HKObjectType exerciseGoal];
      [(CHASActivitySetupViewController *)self _removeGoalsOfType:v18 after:v5];

      BOOL hasExerciseGoalSchedule = self->_hasExerciseGoalSchedule;
    }
    if (!hasExerciseGoalSchedule
      && self->OBTableWelcomeController_opaque[*((int *)v8 + 1008)]
      && self->_defaultDailyExerciseGoalQuantity)
    {
      double v25 = +[HKObjectType exerciseGoal];
      CFStringRef v26 = +[HKQuantitySample quantitySampleWithType:v25 quantity:self->_defaultDailyExerciseGoalQuantity startDate:v51 endDate:v51];

      [v3 addObject:v26];
    }
  }
  BOOL hasStandGoalSchedule = self->_hasStandGoalSchedule;
  if (!self->_hasStandGoalSchedule || self->OBTableWelcomeController_opaque[*((int *)v8 + 1008)])
  {
    if (self->_newDailyStandGoal)
    {
      double v20 = AKAccountManager_ptr;
      double v21 = +[HKObjectType standGoal];
      newDailyStandGoal = self->_newDailyStandGoal;
      if (self->OBTableWelcomeController_opaque[*((int *)v8 + 1008)])
      {
        CFStringRef v62 = @"_HKPrivateTodayOnlyGoal";
        v63 = &__kCFBooleanTrue;
        uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        double v24 = +[HKQuantitySample quantitySampleWithType:v21 quantity:newDailyStandGoal startDate:v5 endDate:v5 metadata:v23];

        double v20 = AKAccountManager_ptr;
      }
      else
      {
        double v24 = +[HKQuantitySample quantitySampleWithType:v21 quantity:newDailyStandGoal startDate:v5 endDate:v5 metadata:0];
      }

      [v3 addObject:v24];
      v27 = [v20[135] standGoal];
      [(CHASActivitySetupViewController *)self _removeGoalsOfType:v27 after:v5];

      BOOL hasStandGoalSchedule = self->_hasStandGoalSchedule;
    }
    if (!hasStandGoalSchedule
      && self->OBTableWelcomeController_opaque[*((int *)v8 + 1008)]
      && self->_defaultDailyStandGoalQuantity)
    {
      v46 = +[HKObjectType standGoal];
      v47 = +[HKQuantitySample quantitySampleWithType:v46 quantity:self->_defaultDailyStandGoalQuantity startDate:v51 endDate:v51];

      [v3 addObject:v47];
    }
  }
  if (self->_activityMoveMode == 2)
  {
    v28 = +[NSCalendar currentCalendar];
    double v29 = +[NSDate date];
    v30 = [v28 startOfDayForDate:v29];

    double v31 = +[NSCalendar currentCalendar];
    v32 = [v31 components:_HKRequiredCalendarUnitsForCacheIndexDateComponents fromDate:v30];

    v33 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)_HKCacheIndexFromDateComponents()];
    uint64_t v34 = +[HKObjectType categoryTypeForIdentifier:_HKCategoryTypeIdentifierActivityMoveModeChange];
    double v35 = +[HKCategorySample categorySampleWithType:v34 value:2 startDate:v33 endDate:v33];
    [v3 addObject:v35];
  }
  dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
  double v37 = [(CHASActivitySetupViewController *)self healthStore];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100101874;
  v52[3] = &unk_1008ABE08;
  long long v38 = v36;
  v53 = v38;
  [v37 saveObjects:v3 withCompletion:v52];

  dispatch_time_t v39 = dispatch_time(0, 5000000000);
  intptr_t v40 = dispatch_semaphore_wait(v38, v39);
  _HKInitializeLogging();
  CGRect v41 = HKLogActivity;
  if (v40)
  {
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT)) {
      sub_10071C044(v41);
    }
  }
  else if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v42 = self->_newDailyMoveGoal;
    v43 = self->_newDailyExerciseGoal;
    v44 = self->_newDailyStandGoal;
    int64_t activityMoveMode = self->_activityMoveMode;
    *(_DWORD *)buf = 138413058;
    v55 = v42;
    __int16 v56 = 2112;
    id v57 = v43;
    __int16 v58 = 2112;
    v59 = v44;
    __int16 v60 = 2048;
    int64_t v61 = activityMoveMode;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Successfully saved first daily goals: %@, %@, and %@ with activity move mode: %ld.", buf, 0x2Au);
  }
  FIUISetNeedsActivityRingExplanation();
}

- (id)_unitManager
{
  unitManager = self->_unitManager;
  if (!unitManager)
  {
    id v4 = objc_alloc((Class)FIUIUnitManager);
    double v5 = [(CHASActivitySetupViewController *)self healthStore];
    id v6 = (FIUIUnitManager *)[v4 initWithHealthStore:v5];
    double v7 = self->_unitManager;
    self->_unitManager = v6;

    unitManager = self->_unitManager;
  }

  return unitManager;
}

- (id)_formattingManager
{
  formattingManager = self->_formattingManager;
  if (!formattingManager)
  {
    id v4 = objc_alloc((Class)FIUIFormattingManager);
    double v5 = [(CHASActivitySetupViewController *)self _unitManager];
    id v6 = (FIUIFormattingManager *)[v4 initWithUnitManager:v5];
    double v7 = self->_formattingManager;
    self->_formattingManager = v6;

    formattingManager = self->_formattingManager;
  }

  return formattingManager;
}

- (id)healthStore
{
  healthStore = self->_healthStore;
  if (!healthStore)
  {
    id v4 = [(CHASActivitySetupViewController *)self delegate];
    double v5 = [v4 activePairingDevice];

    FIUIHealthStoreForDevice();
    id v6 = (HKHealthStore *)objc_claimAutoreleasedReturnValue();
    double v7 = self->_healthStore;
    self->_healthStore = v6;

    healthStore = self->_healthStore;
  }

  return healthStore;
}

- (void)_displayExerciseGoalViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  scrollView = self->_scrollView;
  id v6 = [(CHASActivitySetupViewController *)self contentView];
  LOBYTE(scrollView) = [(UIScrollView *)scrollView isDescendantOfView:v6];

  if ((scrollView & 1) == 0)
  {
    double v7 = [(CHASActivitySetupViewController *)self contentView];
    [v7 addSubview:self->_scrollView];

    double v8 = [(CHASActivitySetupViewController *)self contentView];
    id v9 = [v8 topAnchor];
    double v10 = [(UIScrollView *)self->_scrollView topAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    double v12 = [(CHASActivitySetupViewController *)self contentView];
    double v13 = [v12 bottomAnchor];
    double v14 = [(UIScrollView *)self->_scrollView bottomAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];
  }
  double v16 = [(CHASActivitySetupViewController *)self view];
  [v16 bounds];
  double v18 = v17;

  [(CHASActivitySetupGoalView *)self->_exerciseGoalView becomeFirstResponder];
  double v19 = self->_scrollView;
  if (self->_isRTL)
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, -v18, 0.0);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v18, 0.0, v18);
  }
  else
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, v18, 0.0);
  }
  self->_currentPageIndedouble x = 1;
  [(CHASActivitySetupViewController *)self updateHeaderViewContent];
  [(CHASActivitySetupViewController *)self updateContinueButton];
  [(CHASActivitySetupLevelView *)self->_activityLevelView setHidden:1];
  int64_t activityMoveMode = self->_activityMoveMode;
  double v21 = +[HKUnit minuteUnit];
  double v22 = (uint64_t *)&_HKDefaultTinkerDailyBriskMinutesGoal;
  if (activityMoveMode != 2) {
    double v22 = (uint64_t *)&_HKDefaultDailyBriskMinutesGoal;
  }
  uint64_t v23 = +[HKQuantity quantityWithUnit:v21 doubleValue:(double)*v22];

  [(CHASActivitySetupViewController *)self _setGoalQuantity:v23 goalView:self->_exerciseGoalView];
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100101D2C;
  v24[3] = &unk_1008ABDB8;
  objc_copyWeak(&v25, &location);
  [(CHASActivitySetupViewController *)self _fetchMostRecentDailyExerciseGoalSampleWithCompletion:v24];
  objc_storeStrong((id *)&self->_currentlyPresentedView, self->_exerciseGoalView);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_displayStandGoalViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  scrollView = self->_scrollView;
  id v6 = [(CHASActivitySetupViewController *)self contentView];
  LOBYTE(scrollView) = [(UIScrollView *)scrollView isDescendantOfView:v6];

  if ((scrollView & 1) == 0)
  {
    double v7 = [(CHASActivitySetupViewController *)self contentView];
    [v7 addSubview:self->_scrollView];

    double v8 = [(CHASActivitySetupViewController *)self contentView];
    id v9 = [v8 topAnchor];
    double v10 = [(UIScrollView *)self->_scrollView topAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    double v12 = [(CHASActivitySetupViewController *)self contentView];
    double v13 = [v12 bottomAnchor];
    double v14 = [(UIScrollView *)self->_scrollView bottomAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];
  }
  double v16 = [(CHASActivitySetupViewController *)self view];
  [v16 bounds];
  double v18 = v17;

  [(CHASActivitySetupGoalView *)self->_standGoalView becomeFirstResponder];
  double v19 = self->_scrollView;
  if (self->_isRTL)
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, v18 * -2.0, 0.0);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v18 + v18, 0.0, v18);
  }
  else
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, v18 + v18, 0.0);
  }
  self->_currentPageIndedouble x = 2;
  [(CHASActivitySetupViewController *)self updateHeaderViewContent];
  [(CHASActivitySetupViewController *)self updateContinueButton];
  [(CHASActivitySetupLevelView *)self->_activityLevelView setHidden:1];
  int64_t activityMoveMode = self->_activityMoveMode;
  double v21 = +[HKUnit countUnit];
  double v22 = (uint64_t *)&_HKDefaultTinkerDailyActiveHoursGoal;
  if (activityMoveMode != 2) {
    double v22 = (uint64_t *)&_HKDefaultDailyActiveHoursGoal;
  }
  uint64_t v23 = +[HKQuantity quantityWithUnit:v21 doubleValue:(double)*v22];

  [(CHASActivitySetupViewController *)self _setGoalQuantity:v23 goalView:self->_standGoalView];
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001022AC;
  v24[3] = &unk_1008ABDB8;
  objc_copyWeak(&v25, &location);
  [(CHASActivitySetupViewController *)self _fetchMostRecentDailyStandGoalSampleWithCompletion:v24];
  objc_storeStrong((id *)&self->_currentlyPresentedView, self->_standGoalView);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_saveGoalsAndDismiss
{
  [(CHASActivitySetupViewController *)self _storeGoals];
  if (self->_isTinkerPaired)
  {
    id v3 = [objc_alloc((Class)HKSecondaryDevicePairingAgent) initWithHealthStore:self->_healthStore];
    id v4 = [(CHASActivitySetupViewController *)self delegate];
    double v5 = [v4 activePairingDevice];
    id v6 = [v5 pairingID];

    [v3 performEndToEndCloudSyncWithNRDeviceUUID:v6 syncParticipantFirst:1 completion:&stru_1008ABE48];
  }
  else
  {
    id v3 = [objc_alloc((Class)HKNanoSyncControl) initWithHealthStore:self->_healthStore];
    [v3 forceNanoSyncWithOptions:1 completion:&stru_1008ABE68];
  }

  int64_t presentationContext = self->_presentationContext;
  if (presentationContext == 4 || presentationContext == 2)
  {
    id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    FIActivityAnalyticsSubmission();
  }
  double v10 = [(CHASActivitySetupViewController *)self delegate];

  if (v10)
  {
    id v11 = [(CHASActivitySetupViewController *)self delegate];
    [v11 buddyControllerDone:self];
  }
  else
  {
    [(CHASActivitySetupViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)_isStandalonePhoneFitnessMode
{
  unint64_t presentationContext = self->_presentationContext;
  BOOL v3 = presentationContext > 6;
  uint64_t v4 = (1 << presentationContext) & 0x46;
  if (v3 || v4 == 0) {
    return 0;
  }
  id v6 = +[_HKBehavior sharedBehavior];
  unsigned __int8 v7 = [v6 isStandalonePhoneFitnessMode];

  return v7;
}

- (BOOL)_shouldShowChangeGoalFooter
{
  if (self->_presentationContext != 6) {
    return 0;
  }
  BOOL v3 = +[_HKBehavior sharedBehavior];
  BOOL v4 = ([v3 isStandalonePhoneFitnessMode] & 1) == 0 && self->_advancedGoalView == 0;

  return v4;
}

- (void)tappedContinue:(id)a3
{
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100102C2C;
  v27[3] = &unk_1008ABA78;
  v27[4] = self;
  double v5 = objc_retainBlock(v27);
  unsigned int v6 = [(CHASActivitySetupViewController *)self _currentPageHasGoalSchedule];
  if (a3 && v6 && !self->_editTodayOnly)
  {
    unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
    double v8 = [v7 localizedStringForKey:@"REMOVE_SCHEDULE_TITLE" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    double v10 = [v9 localizedStringForKey:@"REMOVE_SCHEDULE_MESSAGE" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    id v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    double v12 = +[NSBundle bundleForClass:objc_opt_class()];
    double v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    double v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&stru_1008ABEA8];

    double v15 = [(CHASActivitySetupViewController *)self _existingActivityGoalScheduleForCurrentPage];
    double v16 = +[NSBundle bundleForClass:objc_opt_class()];
    double v17 = [v16 localizedStringForKey:@"REMOVE" value:&stru_1008D8AB8 table:@"ActivitySetup"];
    double v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    double v22 = sub_100102DB8;
    uint64_t v23 = &unk_1008ABF18;
    double v24 = self;
    id v25 = v15;
    CFStringRef v26 = v5;
    id v18 = v15;
    double v19 = +[UIAlertAction actionWithTitle:v17 style:2 handler:&v20];

    [v11 addAction:v14, v20, v21, v22, v23, v24];
    [v11 addAction:v19];
    [v11 setPreferredAction:v19];
    [(CHASActivitySetupViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)_dismiss:(id)a3
{
}

- (void)_toggleAdvancedMode
{
  if (self->_advancedGoalView)
  {
    [(CHASActivitySetupViewController *)self _removeAdvancedView];
    BOOL v3 = [(CHASActivitySetupViewController *)self contentView];
    [v3 addSubview:self->_scrollView];

    BOOL v4 = [(CHASActivitySetupViewController *)self contentView];
    double v5 = [v4 topAnchor];
    unsigned int v6 = [(UIScrollView *)self->_scrollView topAnchor];
    unsigned __int8 v7 = [v5 constraintEqualToAnchor:v6];
    [v7 setActive:1];

    double v8 = [(CHASActivitySetupViewController *)self contentView];
    id v9 = [v8 bottomAnchor];
    double v10 = [(UIScrollView *)self->_scrollView bottomAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];
  }
  else
  {
    [(CHASActivitySetupViewController *)self _showAdvancedViewForCurrentGoalPage];
  }

  [(CHASActivitySetupViewController *)self updateContinueButton];
}

- (void)_showAdvancedViewIfNeeded
{
  BOOL v3 = [(CHASActivitySetupViewController *)self _existingActivityGoalScheduleForCurrentPage];
  if (v3 && !self->_editTodayOnly)
  {
    id v4 = v3;
    [(CHASActivitySetupViewController *)self _showAdvancedViewForCurrentGoalPage];
    BOOL v3 = v4;
  }
}

- (void)_removeAdvancedView
{
  [(UIView *)self->_advancedGoalView removeFromSuperview];
  advancedGoalView = self->_advancedGoalView;
  self->_advancedGoalView = 0;

  [(UIButton *)self->_advancedButton setNeedsUpdateConfiguration];
  if ([(CHASActivitySetupViewController *)self _shouldShowChangeGoalFooter])
  {
    id v4 = [(CHASActivitySetupViewController *)self buttonTray];
    [v4 addSubview:self->_footerLabel];

    double v5 = [(UILabel *)self->_footerLabel bottomAnchor];
    unsigned int v6 = [(OBBoldTrayButton *)self->_continueButton topAnchor];
    unsigned __int8 v7 = [v5 constraintEqualToAnchor:v6 constant:-15.0];
    v15[0] = v7;
    double v8 = [(UILabel *)self->_footerLabel leadingAnchor];
    id v9 = [(OBBoldTrayButton *)self->_continueButton leadingAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v15[1] = v10;
    id v11 = [(UILabel *)self->_footerLabel trailingAnchor];
    double v12 = [(OBBoldTrayButton *)self->_continueButton trailingAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v15[2] = v13;
    double v14 = +[NSArray arrayWithObjects:v15 count:3];
    +[NSLayoutConstraint activateConstraints:v14];
  }
}

- (id)_existingActivityGoalScheduleForCurrentPage
{
  int64_t v3 = [(CHASActivitySetupViewController *)self _activityGoalTypeForCurrentPage];
  goalSchedules = self->_goalSchedules;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100103350;
  v7[3] = &unk_1008ABF38;
  v7[4] = v3;
  double v5 = [(NSArray *)goalSchedules hk_firstObjectPassingTest:v7];

  return v5;
}

- (BOOL)_currentPageHasGoalSchedule
{
  unint64_t v3 = [(CHASActivitySetupViewController *)self _activityGoalTypeForCurrentPage];
  return v3 <= 3 && self->OBTableWelcomeController_opaque[*off_1008AC0A8[v3]] != 0;
}

- (int64_t)_activityGoalTypeForCurrentPage
{
  currentPageIndedouble x = self->_currentPageIndex;
  if (currentPageIndex == 1) {
    return 2;
  }
  if (currentPageIndex) {
    return 3;
  }
  return self->_activityMoveMode == 2;
}

- (void)_showAdvancedViewForCurrentGoalPage
{
  [(UIScrollView *)self->_scrollView removeFromSuperview];
  [(UILabel *)self->_footerLabel removeFromSuperview];
  id v35 = [(CHASActivitySetupViewController *)self _existingActivityGoalScheduleForCurrentPage];
  if (!v35)
  {
    unint64_t v3 = [(CHASActivitySetupViewController *)self _activityGoalTypeForCurrentPage];
    unint64_t v4 = v3;
    if (v3 < 2)
    {
      uint64_t v5 = [(CHASActivitySetupViewController *)self currentMoveGoal];
    }
    else if (v3 == 2)
    {
      uint64_t v5 = [(CHASActivitySetupViewController *)self currentExerciseGoal];
    }
    else
    {
      if (v3 != 3)
      {
        unsigned int v6 = 0;
        goto LABEL_10;
      }
      uint64_t v5 = [(CHASActivitySetupViewController *)self currentStandGoal];
    }
    unsigned int v6 = (void *)v5;
LABEL_10:
    unsigned __int8 v7 = +[NSDate date];
    double v8 = +[HKDevice localDevice];
    id v35 = +[HKActivityGoalSchedule activityGoalScheduleWithDate:v7 goalType:v4 goal:v6 device:v8 metadata:0];
  }
  id v9 = [[_TtC10FitnessApp13GoalDaysModel alloc] initWithGoalSchedule:v35];
  goalDaysModel = self->_goalDaysModel;
  self->_goalDaysModel = v9;

  currentPageIndedouble x = self->_currentPageIndex;
  if (currentPageIndex == 1)
  {
    uint64_t v12 = [(CHASActivitySetupViewController *)self _exerciseGoalViewConfiguration];
  }
  else
  {
    if (currentPageIndex) {
      [(CHASActivitySetupViewController *)self _standGoalViewConfiguration];
    }
    else {
    uint64_t v12 = [(CHASActivitySetupViewController *)self _moveGoalViewConfiguration];
    }
  }
  double v13 = (void *)v12;
  [(UIView *)self->_advancedGoalView removeFromSuperview];
  +[CHASAdvancedGoalViewFactory makeViewWithGoalSchedule:goalDaysModel:wheelchairUser:goalType:formattingManager:showFooter:](CHASAdvancedGoalViewFactory, "makeViewWithGoalSchedule:goalDaysModel:wheelchairUser:goalType:formattingManager:showFooter:", v35, self->_goalDaysModel, self->_isWheelchairUser, [v35 goalType], self->_formattingManager, -[CHASActivitySetupViewController _shouldShowChangeGoalFooter](self, "_shouldShowChangeGoalFooter"));
  double v14 = (UIView *)objc_claimAutoreleasedReturnValue();
  advancedGoalView = self->_advancedGoalView;
  self->_advancedGoalView = v14;

  double v16 = BPSSetupBackgroundColor();
  [(UIView *)self->_advancedGoalView setBackgroundColor:v16];

  [(UIView *)self->_advancedGoalView setAccessibilityViewIsModal:1];
  double v17 = [(CHASActivitySetupViewController *)self contentView];
  [v17 addSubview:self->_advancedGoalView];

  [(UIView *)self->_advancedGoalView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v18 = [(UIView *)self->_advancedGoalView topAnchor];
  double v19 = [(CHASActivitySetupViewController *)self contentView];
  double v20 = [v19 topAnchor];
  uint64_t v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  double v22 = [(UIView *)self->_advancedGoalView leadingAnchor];
  uint64_t v23 = [(CHASActivitySetupViewController *)self contentView];
  double v24 = [v23 leadingAnchor];
  id v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  CFStringRef v26 = [(UIView *)self->_advancedGoalView trailingAnchor];
  v27 = [(CHASActivitySetupViewController *)self contentView];
  v28 = [v27 trailingAnchor];
  double v29 = [v26 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = [(UIView *)self->_advancedGoalView bottomAnchor];
  double v31 = [(CHASActivitySetupViewController *)self contentView];
  v32 = [v31 bottomAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  [(UIButton *)self->_advancedButton setNeedsUpdateConfiguration];
  uint64_t v34 = [(CHASActivitySetupViewController *)self view];
  [v34 setNeedsLayout];
}

- (void)setActivityLevels:(id)a3 activityMoveMode:(int64_t)a4
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_activityLevels, a3);
  self->_int64_t activityMoveMode = a4;
  if ([(NSArray *)self->_activityLevels count])
  {
    unsigned __int8 v7 = [v8 objectAtIndexedSubscript:0];
    [(CHASActivitySetupViewController *)self _setActivityLevel:v7 activityMoveMode:a4];
  }
}

- (id)_activityLevelView
{
  activityLevelView = self->_activityLevelView;
  if (!activityLevelView)
  {
    unint64_t v4 = -[CHASActivitySetupLevelView initWithFrame:]([CHASActivitySetupLevelView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    uint64_t v5 = self->_activityLevelView;
    self->_activityLevelView = v4;

    unsigned int v6 = self->_activityLevelView;
    unsigned __int8 v7 = BPSSetupBackgroundColor();
    [(CHASActivitySetupLevelView *)v6 setBackgroundColor:v7];

    id v8 = [(CHASActivitySetupLevelView *)self->_activityLevelView segmentedControl];
    [v8 addTarget:self action:"_activityLevelPresetChanged:" forControlEvents:4096];

    activityLevelView = self->_activityLevelView;
  }

  return activityLevelView;
}

- (void)_activityLevelPresetChanged:(id)a3
{
  unint64_t v4 = [(CHASActivitySetupLevelView *)self->_activityLevelView segmentedControl];
  id v5 = [v4 selectedSegmentIndex];

  id v6 = [(CHASActivitySetupViewController *)self activityLevelForSegmentedControlIndex:v5];
  [(CHASActivitySetupViewController *)self _setActivityLevel:v6 activityMoveMode:self->_activityMoveMode];
}

- (id)activityLevelForSegmentedControlIndex:(int64_t)a3
{
  if ([(NSArray *)self->_activityLevels count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_activityLevels objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)_setActivityLevel:(id)a3 activityMoveMode:(int64_t)a4
{
}

- (id)currentMoveGoal
{
  return [(CHASActivitySetupGoalView *)self->_moveGoalView dailyGoal];
}

- (id)currentExerciseGoal
{
  return [(CHASActivitySetupGoalView *)self->_exerciseGoalView dailyGoal];
}

- (id)currentStandGoal
{
  return [(CHASActivitySetupGoalView *)self->_standGoalView dailyGoal];
}

- (id)_moveGoalViewConfiguration
{
  unint64_t v3 = objc_alloc_init(CHASActivitySetupGoalViewConfiguration);
  unint64_t v4 = +[ARUIMetricColors energyColors];
  id v5 = [v4 nonGradientTextColor];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalColor:v5];

  id v6 = [(CHASActivitySetupViewController *)self _unitManager];
  unsigned __int8 v7 = [v6 userActiveEnergyBurnedUnit];

  [(CHASActivitySetupGoalViewConfiguration *)v3 setUnit:v7];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100103CDC;
  v24[3] = &unk_1008ABF60;
  void v24[4] = self;
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalValueStringFormatter:v24];
  if (self->_activityMoveMode == 2)
  {
    id v8 = +[HKUnit minuteUnit];
    [(CHASActivitySetupGoalViewConfiguration *)v3 setUnit:v8];

    double v9 = 10.0;
    double v10 = 1000.0;
  }
  else
  {
    int IsCalorieUnit = FIUIHKUnitIsCalorieUnit();
    if (IsCalorieUnit) {
      double v9 = 10.0;
    }
    else {
      double v9 = 20.0;
    }
    if (IsCalorieUnit) {
      double v10 = 9999.0;
    }
    else {
      double v10 = 39999.0;
    }
  }
  [(CHASActivitySetupGoalViewConfiguration *)v3 setMinimumValue:v9];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setMaximumValue:v10];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setValueIncrement:v9];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100103D5C;
  v23[3] = &unk_1008ABF60;
  v23[4] = self;
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalUnitStringFormatter:v23];
  __asm { FMOV            V0.2D, #13.0 }
  long long v19 = _Q0;
  long long v20 = _Q0;
  __asm { FMOV            V0.2D, #30.0 }
  long long v21 = _Q0;
  long long v22 = _Q0;
  BPSScreenValueGetRelevantValue();
  -[CHASActivitySetupGoalViewConfiguration setUnitTextYOffset:](v3, "setUnitTextYOffset:", v19, v20, v21, v22);

  return v3;
}

- (id)_exerciseGoalViewConfiguration
{
  unint64_t v3 = objc_alloc_init(CHASActivitySetupGoalViewConfiguration);
  unint64_t v4 = +[ARUIMetricColors briskColors];
  id v5 = [v4 nonGradientTextColor];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalColor:v5];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100104018;
  v19[3] = &unk_1008ABF60;
  v19[4] = self;
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalValueStringFormatter:v19];
  id v6 = +[HKUnit minuteUnit];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setUnit:v6];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100104084;
  v18[3] = &unk_1008ABF60;
  v18[4] = self;
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalUnitStringFormatter:v18];
  __asm { FMOV            V0.2D, #13.0 }
  long long v14 = _Q0;
  long long v15 = _Q0;
  __asm { FMOV            V0.2D, #30.0 }
  long long v16 = _Q0;
  long long v17 = _Q0;
  BPSScreenValueGetRelevantValue();
  -[CHASActivitySetupGoalViewConfiguration setUnitTextYOffset:](v3, "setUnitTextYOffset:", v14, v15, v16, v17);
  [(CHASActivitySetupGoalViewConfiguration *)v3 setMinimumValue:5.0];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setMaximumValue:90.0];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setValueIncrement:5.0];

  return v3;
}

- (id)_standGoalViewConfiguration
{
  unint64_t v3 = objc_alloc_init(CHASActivitySetupGoalViewConfiguration);
  unint64_t v4 = +[ARUIMetricColors sedentaryColors];
  id v5 = [v4 nonGradientTextColor];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalColor:v5];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100104328;
  v19[3] = &unk_1008ABF60;
  v19[4] = self;
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalValueStringFormatter:v19];
  id v6 = +[HKUnit countUnit];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setUnit:v6];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100104394;
  v18[3] = &unk_1008ABF60;
  v18[4] = self;
  [(CHASActivitySetupGoalViewConfiguration *)v3 setGoalUnitStringFormatter:v18];
  __asm { FMOV            V0.2D, #13.0 }
  long long v14 = _Q0;
  long long v15 = _Q0;
  __asm { FMOV            V0.2D, #30.0 }
  long long v16 = _Q0;
  long long v17 = _Q0;
  BPSScreenValueGetRelevantValue();
  -[CHASActivitySetupGoalViewConfiguration setUnitTextYOffset:](v3, "setUnitTextYOffset:", v14, v15, v16, v17);
  [(CHASActivitySetupGoalViewConfiguration *)v3 setMinimumValue:6.0];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setMaximumValue:16.0];
  [(CHASActivitySetupGoalViewConfiguration *)v3 setValueIncrement:1.0];

  return v3;
}

- (void)_loadExerciseAndStandGoalViews
{
  id v11 = [(CHASActivitySetupViewController *)self _exerciseGoalViewConfiguration];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  -[CHASActivitySetupViewController _createGoalViewWithFrame:configuration:](self, "_createGoalViewWithFrame:configuration:", v11, CGRectZero.origin.x, y, width, height);
  id v6 = (CHASActivitySetupGoalView *)objc_claimAutoreleasedReturnValue();
  exerciseGoalView = self->_exerciseGoalView;
  self->_exerciseGoalView = v6;

  id v8 = [(CHASActivitySetupViewController *)self _standGoalViewConfiguration];
  -[CHASActivitySetupViewController _createGoalViewWithFrame:configuration:](self, "_createGoalViewWithFrame:configuration:", v8, CGRectZero.origin.x, y, width, height);
  double v9 = (CHASActivitySetupGoalView *)objc_claimAutoreleasedReturnValue();
  standGoalView = self->_standGoalView;
  self->_standGoalView = v9;
}

- (void)_setGoalQuantityForGoalView:(id)a3
{
  unint64_t v4 = (CHASActivitySetupGoalView *)a3;
  id v8 = v4;
  if (self->_moveGoalView == v4)
  {
    if (self->_hasMoveGoalSchedule)
    {
      if (!self->_editTodayOnly)
      {
        uint64_t v5 = [(CHASActivitySetupViewController *)self _moveQuantityForToday];
        goto LABEL_12;
      }
    }
    else if (!self->_editTodayOnly)
    {
      uint64_t v7 = 136;
      goto LABEL_22;
    }
    uint64_t v7 = 144;
  }
  else if (self->_exerciseGoalView == v4)
  {
    if (self->_hasExerciseGoalSchedule)
    {
      if (!self->_editTodayOnly)
      {
        uint64_t v5 = [(CHASActivitySetupViewController *)self _exerciseQuantityForToday];
        goto LABEL_12;
      }
    }
    else if (!self->_editTodayOnly)
    {
      uint64_t v7 = 152;
      goto LABEL_22;
    }
    uint64_t v7 = 160;
  }
  else
  {
    if (self->_hasStandGoalSchedule)
    {
      if (!self->_editTodayOnly)
      {
        uint64_t v5 = [(CHASActivitySetupViewController *)self _standQuantityForToday];
LABEL_12:
        id v6 = (void *)v5;
        [(CHASActivitySetupViewController *)self _setGoalQuantity:v5 goalView:v8];

        goto LABEL_23;
      }
    }
    else if (!self->_editTodayOnly)
    {
      uint64_t v7 = 168;
      goto LABEL_22;
    }
    uint64_t v7 = 176;
  }
LABEL_22:
  [(CHASActivitySetupViewController *)self _setGoalQuantity:*(void *)&self->OBTableWelcomeController_opaque[v7] goalView:v4];
LABEL_23:
}

- (void)_setGoalQuantity:(id)a3 goalView:(id)a4
{
  if (a3) {
    [a4 setGoal:];
  }
}

- (id)_moveQuantityForToday
{
  v2 = [(NSArray *)self->_goalSchedules hk_filter:&stru_1008ABFA0];
  unint64_t v3 = [v2 firstObject];

  if (v3)
  {
    unint64_t v4 = [v3 goalQuantityForToday];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_exerciseQuantityForToday
{
  v2 = [(NSArray *)self->_goalSchedules hk_filter:&stru_1008ABFC0];
  unint64_t v3 = [v2 firstObject];

  if (v3)
  {
    unint64_t v4 = [v3 goalQuantityForToday];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_standQuantityForToday
{
  v2 = [(NSArray *)self->_goalSchedules hk_filter:&stru_1008ABFE0];
  unint64_t v3 = [v2 firstObject];

  if (v3)
  {
    unint64_t v4 = [v3 goalQuantityForToday];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_fetchActiveMoveGoalSampleWithCompletion:(id)a3
{
  int64_t activityMoveMode = self->_activityMoveMode;
  id v5 = a3;
  if (activityMoveMode == 2) {
    +[HKObjectType moveMinuteGoal];
  }
  else {
  id v6 = +[HKObjectType calorieGoal];
  }
  [(CHASActivitySetupViewController *)self _fetchActiveSampleForQuantityType:v6 completion:v5];
}

- (void)_fetchActiveExerciseGoalSampleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType exerciseGoal];
  [(CHASActivitySetupViewController *)self _fetchActiveSampleForQuantityType:v5 completion:v4];
}

- (void)_fetchActiveStandGoalSampleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType standGoal];
  [(CHASActivitySetupViewController *)self _fetchActiveSampleForQuantityType:v5 completion:v4];
}

- (void)_fetchActiveSampleForQuantityType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NSDate date];
    double v9 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v8];

    double v10 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:0];
    id v11 = objc_alloc((Class)HKSampleQuery);
    long long v17 = v10;
    uint64_t v12 = +[NSArray arrayWithObjects:&v17 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100104C64;
    v14[3] = &unk_1008AC008;
    id v15 = v6;
    id v16 = v7;
    id v13 = [v11 initWithSampleType:v15 predicate:v9 limit:1 sortDescriptors:v12 resultsHandler:v14];

    [(HKHealthStore *)self->_healthStore executeQuery:v13];
  }
}

- (void)_fetchMostRecentDailyMoveGoalSampleWithCompletion:(id)a3
{
  int64_t activityMoveMode = self->_activityMoveMode;
  id v5 = a3;
  if (activityMoveMode == 2) {
    +[HKObjectType moveMinuteGoal];
  }
  else {
  id v6 = +[HKObjectType calorieGoal];
  }
  [(CHASActivitySetupViewController *)self _fetchMostRecentDailyGoalSampleForQuantityType:v6 completion:v5];
}

- (void)_fetchMostRecentDailyExerciseGoalSampleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType exerciseGoal];
  [(CHASActivitySetupViewController *)self _fetchMostRecentDailyGoalSampleForQuantityType:v5 completion:v4];
}

- (void)_fetchMostRecentDailyStandGoalSampleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType standGoal];
  [(CHASActivitySetupViewController *)self _fetchMostRecentDailyGoalSampleForQuantityType:v5 completion:v4];
}

- (void)_fetchMostRecentDailyGoalSampleForQuantityType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NSDate date];
    double v9 = +[NSPredicate predicateWithFormat:@"startDate <= %@", v8];

    double v10 = +[HKQuery predicateForObjectsWithMetadataKey:@"_HKPrivateTodayOnlyGoal" operatorType:5 value:&__kCFBooleanTrue];
    id v11 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:0];
    v21[0] = v9;
    v21[1] = v10;
    uint64_t v12 = +[NSArray arrayWithObjects:v21 count:2];
    id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

    id v14 = objc_alloc((Class)HKSampleQuery);
    long long v20 = v11;
    id v15 = +[NSArray arrayWithObjects:&v20 count:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001050E8;
    v17[3] = &unk_1008AC008;
    id v18 = v6;
    id v19 = v7;
    id v16 = [v14 initWithSampleType:v18 predicate:v13 limit:1 sortDescriptors:v15 resultsHandler:v17];

    [(HKHealthStore *)self->_healthStore executeQuery:v16];
  }
}

- (void)_fetchMostRecentGoalSchedulesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:0];
    id v6 = +[HKObjectType activityGoalScheduleType];
    id v7 = objc_alloc((Class)HKSampleQuery);
    long long v17 = v5;
    id v8 = +[NSArray arrayWithObjects:&v17 count:1];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_10010532C;
    id v14 = &unk_1008AC008;
    id v15 = v6;
    id v16 = v4;
    id v9 = v6;
    id v10 = [v7 initWithSampleType:v9 predicate:0 limit:0 sortDescriptors:v8 resultsHandler:&v11];

    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v10, v11, v12, v13, v14);
  }
}

- (void)_setGoalSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_goalSchedules, a3);
  id v5 = a3;
  self->_BOOL hasMoveGoalSchedule = 0;
  self->_BOOL hasExerciseGoalSchedule = 0;
  self->_BOOL hasStandGoalSchedule = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100105480;
  v6[3] = &unk_1008AC030;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)_updateGoalSchedule
{
  unint64_t v3 = [(GoalDaysModel *)self->_goalDaysModel goalDays];
  id v4 = +[HKActivityGoalSchedule scheduleFrom:v3 goalType:[(GoalDaysModel *)self->_goalDaysModel goalType]];

  if (!v4) {
    goto LABEL_9;
  }
  goalSchedules = self->_goalSchedules;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100105654;
  v9[3] = &unk_1008ABED0;
  id v6 = v4;
  id v10 = v6;
  id v7 = [(NSArray *)goalSchedules hk_firstObjectPassingTest:v9];
  if (!v7) {
    goto LABEL_5;
  }
  if (![(CHASActivitySetupViewController *)self _isGoalSchedule:v7 theSameAs:v6])
  {
    [(HKHealthStore *)self->_healthStore deleteObject:v7 withCompletion:&stru_1008AC050];
LABEL_5:
    [(HKHealthStore *)self->_healthStore saveObject:v6 withCompletion:&stru_1008AC070];
  }
  unint64_t v8 = (unint64_t)[v6 goalType];
  if (v8 <= 3) {
    self->OBTableWelcomeController_opaque[*off_1008AC0A8[v8]] = 1;
  }
  [(CHASActivitySetupViewController *)self tappedContinue:0];

LABEL_9:
}

- (BOOL)_isGoalSchedule:(id)a3 theSameAs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 goalType];
  if (v7 != [v6 goalType]) {
    goto LABEL_37;
  }
  unint64_t v8 = [v5 mondayGoal];
  uint64_t v9 = [v6 mondayGoal];
  if (v8 == (void *)v9)
  {
  }
  else
  {
    id v10 = (void *)v9;
    uint64_t v11 = [v6 mondayGoal];
    if (!v11) {
      goto LABEL_36;
    }
    uint64_t v12 = (void *)v11;
    id v13 = [v5 mondayGoal];
    id v14 = [v6 mondayGoal];
    unsigned int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_37;
    }
  }
  unint64_t v8 = [v5 tuesdayGoal];
  uint64_t v16 = [v6 tuesdayGoal];
  if (v8 == (void *)v16)
  {
  }
  else
  {
    id v10 = (void *)v16;
    uint64_t v17 = [v6 tuesdayGoal];
    if (!v17) {
      goto LABEL_36;
    }
    id v18 = (void *)v17;
    id v19 = [v5 tuesdayGoal];
    long long v20 = [v6 tuesdayGoal];
    unsigned int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  unint64_t v8 = [v5 wednesdayGoal];
  uint64_t v22 = [v6 wednesdayGoal];
  if (v8 == (void *)v22)
  {
  }
  else
  {
    id v10 = (void *)v22;
    uint64_t v23 = [v6 wednesdayGoal];
    if (!v23) {
      goto LABEL_36;
    }
    double v24 = (void *)v23;
    id v25 = [v5 wednesdayGoal];
    CFStringRef v26 = [v6 wednesdayGoal];
    unsigned int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_37;
    }
  }
  unint64_t v8 = [v5 thursdayGoal];
  uint64_t v28 = [v6 thursdayGoal];
  if (v8 == (void *)v28)
  {
  }
  else
  {
    id v10 = (void *)v28;
    uint64_t v29 = [v6 thursdayGoal];
    if (!v29) {
      goto LABEL_36;
    }
    v30 = (void *)v29;
    double v31 = [v5 thursdayGoal];
    v32 = [v6 thursdayGoal];
    unsigned int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_37;
    }
  }
  unint64_t v8 = [v5 fridayGoal];
  uint64_t v34 = [v6 fridayGoal];
  if (v8 == (void *)v34)
  {
  }
  else
  {
    id v10 = (void *)v34;
    uint64_t v35 = [v6 fridayGoal];
    if (!v35) {
      goto LABEL_36;
    }
    dispatch_semaphore_t v36 = (void *)v35;
    double v37 = [v5 fridayGoal];
    long long v38 = [v6 fridayGoal];
    unsigned int v39 = [v37 isEqual:v38];

    if (!v39) {
      goto LABEL_37;
    }
  }
  unint64_t v8 = [v5 saturdayGoal];
  uint64_t v40 = [v6 saturdayGoal];
  if (v8 == (void *)v40)
  {

    goto LABEL_32;
  }
  id v10 = (void *)v40;
  uint64_t v41 = [v6 saturdayGoal];
  if (!v41)
  {
LABEL_36:

    goto LABEL_37;
  }
  CGRect v42 = (void *)v41;
  v43 = [v5 saturdayGoal];
  v44 = [v6 saturdayGoal];
  unsigned int v45 = [v43 isEqual:v44];

  if (!v45) {
    goto LABEL_37;
  }
LABEL_32:
  unint64_t v8 = [v5 sundayGoal];
  uint64_t v46 = [v6 sundayGoal];
  if (v8 == (void *)v46)
  {

LABEL_40:
    BOOL v52 = 1;
    goto LABEL_38;
  }
  id v10 = (void *)v46;
  uint64_t v47 = [v6 sundayGoal];
  if (!v47) {
    goto LABEL_36;
  }
  v48 = (void *)v47;
  v49 = [v5 sundayGoal];
  v50 = [v6 sundayGoal];
  unsigned __int8 v51 = [v49 isEqual:v50];

  if (v51) {
    goto LABEL_40;
  }
LABEL_37:
  BOOL v52 = 0;
LABEL_38:

  return v52;
}

- (id)tapToRadarMetadata
{
  id v2 = [objc_alloc((Class)BPSTTRMetadata) initWithComponent:2];

  return v2;
}

- (BPSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BPSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (NSNumber)recommendedMoveGoal
{
  return self->_recommendedMoveGoal;
}

- (void)setRecommendedMoveGoal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedMoveGoal, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_newDailyStandGoal, 0);
  objc_storeStrong((id *)&self->_newDailyExerciseGoal, 0);
  objc_storeStrong((id *)&self->_pageDetailTexts, 0);
  objc_storeStrong((id *)&self->_pageTitles, 0);
  objc_storeStrong((id *)&self->_goalDaysModel, 0);
  objc_storeStrong((id *)&self->_goalSchedules, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_advancedGoalView, 0);
  objc_storeStrong((id *)&self->_advancedButton, 0);
  objc_storeStrong((id *)&self->_activeStandGoalQuantity, 0);
  objc_storeStrong((id *)&self->_defaultDailyStandGoalQuantity, 0);
  objc_storeStrong((id *)&self->_activeExerciseGoalQuantity, 0);
  objc_storeStrong((id *)&self->_defaultDailyExerciseGoalQuantity, 0);
  objc_storeStrong((id *)&self->_activeMoveGoalQuantity, 0);
  objc_storeStrong((id *)&self->_defaultDailyMoveGoalQuantity, 0);
  objc_storeStrong((id *)&self->_standGoalView, 0);
  objc_storeStrong((id *)&self->_exerciseGoalView, 0);
  objc_storeStrong((id *)&self->_moveGoalView, 0);
  objc_storeStrong((id *)&self->_currentlyPresentedView, 0);
  objc_storeStrong((id *)&self->_activityLevelView, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_newDailyMoveGoal, 0);
  objc_storeStrong((id *)&self->_activityLevels, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_unitManager, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end