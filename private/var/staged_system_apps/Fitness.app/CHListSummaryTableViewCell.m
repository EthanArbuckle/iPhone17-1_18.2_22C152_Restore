@interface CHListSummaryTableViewCell
+ (BOOL)mostRecentWorkout:(id)a3 supportsMetric:(unint64_t)a4;
+ (double)heightForAllWorkoutSummary;
+ (double)heightForMindfulnessSessions;
+ (double)heightForWorkoutActivityTypeKey:(id)a3 statistics:(id)a4;
- (CHListSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CHMindfulnessSessionsStatistics)mindfulnessSessionsStatistics;
- (CHWorkoutTypeKey)activityTypeKey;
- (FIUIFormattingManager)formattingManager;
- (FIUIWorkoutStatistics)workoutStatistics;
- (NSArray)stackedLabels;
- (unint64_t)summaryType;
- (void)_layoutLabels;
- (void)_updateUI;
- (void)_updateUIForMindfulnessSessions;
- (void)_updateUIForWorkout;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActivityTypeKey:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setIsForAllWorkouts:(BOOL)a3;
- (void)setMindfulnessSessionsStatistics:(id)a3;
- (void)setMindfulnessSessionsStatistics:(id)a3 formattingManager:(id)a4;
- (void)setSummaryType:(unint64_t)a3;
- (void)setWorkoutStatistics:(id)a3;
- (void)setWorkoutStatistics:(id)a3 activityTypeKey:(id)a4 formattingManager:(id)a5;
@end

@implementation CHListSummaryTableViewCell

+ (double)heightForAllWorkoutSummary
{
  return 114.0;
}

+ (double)heightForWorkoutActivityTypeKey:(id)a3 statistics:(id)a4
{
  id v5 = a4;
  id v6 = [a3 activityType];
  if (v6 == (id)_HKWorkoutActivityTypeNone)
  {
    double v7 = 124.0;
  }
  else
  {
    v8 = objc_opt_class();
    v9 = [v5 mostRecentWorkout];
    unsigned int v10 = [v8 mostRecentWorkout:v9 supportsMetric:1];

    v11 = objc_opt_class();
    v12 = [v5 mostRecentWorkout];
    LODWORD(v11) = [v11 mostRecentWorkout:v12 supportsMetric:8];

    double v13 = 146.0;
    if (v11) {
      double v13 = 168.0;
    }
    if (v10) {
      double v7 = v13;
    }
    else {
      double v7 = 124.0;
    }
  }

  return v7;
}

+ (double)heightForMindfulnessSessions
{
  return 69.0;
}

- (CHListSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v48.receiver = self;
  v48.super_class = (Class)CHListSummaryTableViewCell;
  v4 = [(CHListSummaryTableViewCell *)&v48 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = +[UIColor systemBackgroundColor];
    [(CHListSummaryTableViewCell *)v4 setBackgroundColor:v5];

    v4->_summaryType = 0;
    v4->_isForAllWorkouts = 0;
    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    unsigned int v10 = (UILabel *)[v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    totalHeaderLabel = v4->_totalHeaderLabel;
    v4->_totalHeaderLabel = v10;

    v12 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_totalHeaderLabel setTextColor:v12];

    double v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"WORKOUT_MONTH_HEADER_TOTAL" value:&stru_1008D8AB8 table:@"Localizable"];
    [(UILabel *)v4->_totalHeaderLabel setText:v14];

    v15 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v15 addSubview:v4->_totalHeaderLabel];

    v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    averageHeaderLabel = v4->_averageHeaderLabel;
    v4->_averageHeaderLabel = v16;

    v18 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_averageHeaderLabel setTextColor:v18];

    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"WORKOUT_MONTH_HEADER_AVERAGE" value:&stru_1008D8AB8 table:@"Localizable"];
    [(UILabel *)v4->_averageHeaderLabel setText:v20];

    v21 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v21 addSubview:v4->_averageHeaderLabel];

    v22 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    numberOfWorkoutsLabel = v4->_numberOfWorkoutsLabel;
    v4->_numberOfWorkoutsLabel = v22;

    v24 = +[UIColor secondaryLabelColor];
    [(_CHWorkoutSummaryTabbedLabelContainer *)v4->_numberOfWorkoutsLabel setTextColor:v24];

    v25 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v25 addSubview:v4->_numberOfWorkoutsLabel];

    v26 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    activeEnergyLabel = v4->_activeEnergyLabel;
    v4->_activeEnergyLabel = v26;

    v28 = +[ARUIMetricColors energyColors];
    v29 = [v28 nonGradientTextColor];
    [(_CHWorkoutSummaryTabbedLabelContainer *)v4->_activeEnergyLabel setTextColor:v29];

    v30 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v30 addSubview:v4->_activeEnergyLabel];

    v31 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = v31;

    v33 = +[ARUIMetricColors elapsedTimeColors];
    v34 = [v33 nonGradientTextColor];
    [(_CHWorkoutSummaryTabbedLabelContainer *)v4->_durationLabel setTextColor:v34];

    v35 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v35 addSubview:v4->_durationLabel];

    v36 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    distanceLabel = v4->_distanceLabel;
    v4->_distanceLabel = v36;

    v38 = +[ARUIMetricColors distanceColors];
    v39 = [v38 nonGradientTextColor];
    [(_CHWorkoutSummaryTabbedLabelContainer *)v4->_distanceLabel setTextColor:v39];

    v40 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v40 addSubview:v4->_distanceLabel];

    v41 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    paceLabel = v4->_paceLabel;
    v4->_paceLabel = v41;

    v43 = +[ARUIMetricColors paceColors];
    v44 = [v43 nonGradientTextColor];
    [(_CHWorkoutSummaryTabbedLabelContainer *)v4->_paceLabel setTextColor:v44];

    v45 = [(CHListSummaryTableViewCell *)v4 contentView];
    [v45 addSubview:v4->_paceLabel];

    v46 = +[NSNotificationCenter defaultCenter];
    [v46 addObserver:v4 selector:"_updateUI" name:kFIUIFitnessUnitPreferencesDidChangeNotification object:0];
  }
  return v4;
}

- (void)setIsForAllWorkouts:(BOOL)a3
{
  self->_isForAllWorkouts = a3;
  [(CHListSummaryTableViewCell *)self _updateUI];
}

- (void)setWorkoutStatistics:(id)a3 activityTypeKey:(id)a4 formattingManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CHListSummaryTableViewCell *)self setSummaryType:0];
  [(CHListSummaryTableViewCell *)self setWorkoutStatistics:v10];

  [(CHListSummaryTableViewCell *)self setMindfulnessSessionsStatistics:0];
  [(CHListSummaryTableViewCell *)self setActivityTypeKey:v9];

  [(CHListSummaryTableViewCell *)self setFormattingManager:v8];

  [(CHListSummaryTableViewCell *)self _updateUI];
}

- (void)setMindfulnessSessionsStatistics:(id)a3 formattingManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CHListSummaryTableViewCell *)self setSummaryType:1];
  [(CHListSummaryTableViewCell *)self setWorkoutStatistics:0];
  [(CHListSummaryTableViewCell *)self setMindfulnessSessionsStatistics:v7];

  id v8 = +[CHWorkoutTypeKey emptyKey];
  [(CHListSummaryTableViewCell *)self setActivityTypeKey:v8];

  [(CHListSummaryTableViewCell *)self setFormattingManager:v6];

  [(CHListSummaryTableViewCell *)self _updateUI];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CHListSummaryTableViewCell;
  [(CHListSummaryTableViewCell *)&v4 prepareForReuse];
  [(CHListSummaryTableViewCell *)self _setShouldHaveFullLengthBottomSeparator:1];
  v3 = [(CHListSummaryTableViewCell *)self stackedLabels];
  [v3 makeObjectsPerformSelector:"setText:" withObject:0];
}

- (NSArray)stackedLabels
{
  activeEnergyLabel = self->_activeEnergyLabel;
  v6[0] = self->_numberOfWorkoutsLabel;
  v6[1] = activeEnergyLabel;
  distanceLabel = self->_distanceLabel;
  v6[2] = self->_durationLabel;
  v6[3] = distanceLabel;
  v6[4] = self->_paceLabel;
  objc_super v4 = +[NSArray arrayWithObjects:v6 count:5];

  return (NSArray *)v4;
}

- (void)_updateUI
{
  unint64_t v3 = [(CHListSummaryTableViewCell *)self summaryType];
  if (v3 == 1)
  {
    [(CHListSummaryTableViewCell *)self _updateUIForMindfulnessSessions];
  }
  else if (!v3)
  {
    [(CHListSummaryTableViewCell *)self _updateUIForWorkout];
  }
}

- (void)_updateUIForWorkout
{
  unint64_t v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"WORKOUT_MONTH_SUMMARY_WORKOUTS_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];

  [(UILabel *)self->_totalHeaderLabel setHidden:0];
  [(UILabel *)self->_averageHeaderLabel setHidden:0];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setHidden:0];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel setHidden:1];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel setHidden:1];
  if ((id)[(CHWorkoutTypeKey *)self->_activityTypeKey activityType] == (id)37)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"WORKOUT_MONTH_SUMMARY_WORKOUTS_RUNS";
  }
  else if ((id)[(CHWorkoutTypeKey *)self->_activityTypeKey activityType] == (id)52)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"WORKOUT_MONTH_SUMMARY_WORKOUTS_WALKS";
  }
  else if ((id)[(CHWorkoutTypeKey *)self->_activityTypeKey activityType] == (id)24)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"WORKOUT_MONTH_SUMMARY_WORKOUTS_HIKES";
  }
  else
  {
    if ((id)[(CHWorkoutTypeKey *)self->_activityTypeKey activityType] != (id)13) {
      goto LABEL_10;
    }
    id v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"WORKOUT_MONTH_SUMMARY_WORKOUTS_RIDES";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1008D8AB8 table:@"Localizable"];

  objc_super v4 = (void *)v8;
LABEL_10:
  if (self->_isForAllWorkouts)
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
  }
  else
  {
    v11 = objc_opt_class();
    v12 = [(FIUIWorkoutStatistics *)self->_workoutStatistics mostRecentWorkout];
    unsigned int v9 = [v11 mostRecentWorkout:v12 supportsMetric:1];

    double v13 = objc_opt_class();
    v14 = [(FIUIWorkoutStatistics *)self->_workoutStatistics mostRecentWorkout];
    unsigned int v10 = [v13 mostRecentWorkout:v14 supportsMetric:8];
  }
  unint64_t v15 = [(CHWorkoutTypeKey *)self->_activityTypeKey activityType];
  BOOL v16 = [(CHWorkoutTypeKey *)self->_activityTypeKey isIndoor];
  v67 = HKMetadataKeySwimmingLocationType;
  v17 = +[NSNumber numberWithInteger:[(CHWorkoutTypeKey *)self->_activityTypeKey swimLocationType]];
  v68 = v17;
  v18 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  v19 = +[FIUIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:v15 isIndoor:v16 metadata:v18];

  uint64_t v20 = FIUIDistanceTypeForActivityType();
  if (v9)
  {
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel setHidden:0];
    v21 = [(CHListSummaryTableViewCell *)self workoutStatistics];
    v22 = [(CHListSummaryTableViewCell *)self formattingManager];
    v65 = [v21 formattedDistanceWithFormattingManager:v22 distanceType:v20 amountType:0];

    v23 = [(CHListSummaryTableViewCell *)self workoutStatistics];
    v24 = [(CHListSummaryTableViewCell *)self formattingManager];
    v66 = [v23 formattedDistanceWithFormattingManager:v24 distanceType:v20 amountType:1];
  }
  else
  {
    v65 = 0;
    v66 = 0;
  }
  v25 = v4;
  if (v10)
  {
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel setHidden:0];
    v26 = [(CHListSummaryTableViewCell *)self workoutStatistics];
    v27 = [(CHListSummaryTableViewCell *)self formattingManager];
    v64 = [v26 formattedPaceWithFormattingManager:v27 distanceType:v20];

    uint64_t v28 = FIUIPaceFormatForWorkoutActivityType();
    v29 = +[NSBundle mainBundle];
    v30 = v29;
    if (v28 == 4) {
      CFStringRef v31 = @"WORKOUT_MONTH_SUMMARY_AVG_SPEED_TITLE";
    }
    else {
      CFStringRef v31 = @"WORKOUT_MONTH_SUMMARY_AVG_PACE_TITLE";
    }
    v32 = [v29 localizedStringForKey:v31 value:&stru_1008D8AB8 table:@"Localizable"];
  }
  else
  {
    v64 = 0;
    v32 = 0;
  }
  if ((id)[(CHWorkoutTypeKey *)self->_activityTypeKey activityType] == (id)84
    && ![(CHWorkoutTypeKey *)self->_activityTypeKey isIndoor])
  {
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setHidden:1];
    v33 = +[NSBundle mainBundle];
    uint64_t v34 = [v33 localizedStringForKey:@"WORKOUT_UNDERWATER" value:&stru_1008D8AB8 table:@"Localizable"];

    v25 = (void *)v34;
  }
  if (self->_isForAllWorkouts)
  {
    v35 = +[NSBundle mainBundle];
    uint64_t v36 = [v35 localizedStringForKey:@"WORKOUT_MONTH_SUMMARY_WORKOUTS_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];

    [(UILabel *)self->_totalHeaderLabel setHidden:0];
    [(UILabel *)self->_averageHeaderLabel setHidden:0];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setHidden:0];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel setHidden:1];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel setHidden:1];
    v25 = (void *)v36;
  }
  v37 = [(CHListSummaryTableViewCell *)self workoutStatistics];
  v38 = [v37 simpleWorkoutCount];

  v39 = v25;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel setTitleText:v25];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel setTotalText:v38];
  v40 = +[NSBundle mainBundle];
  v41 = [v40 localizedStringForKey:@"WORKOUT_MONTH_SUMMARY_TIME_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_durationLabel setTitleText:v41];

  v42 = [(CHListSummaryTableViewCell *)self workoutStatistics];
  v43 = [(CHListSummaryTableViewCell *)self formattingManager];
  v44 = [v42 formattedTotalWorkoutDurationWithFormattingManager:v43];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_durationLabel setTotalText:v44];

  v45 = [(CHListSummaryTableViewCell *)self workoutStatistics];
  v46 = [(CHListSummaryTableViewCell *)self formattingManager];
  v47 = [v45 formattedAverageWorkoutDurationWithFormattingManager:v46];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_durationLabel setAverageText:v47];

  objc_super v48 = [(CHListSummaryTableViewCell *)self workoutStatistics];
  v49 = [v48 totalActiveEnergyBurn];
  v50 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
  v51 = [v50 userActiveEnergyBurnedUnit];
  [v49 doubleValueForUnit:v51];
  double v53 = v52;

  if (v53 <= 2.22044605e-16)
  {
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setHidden:1];
  }
  else
  {
    v54 = [(CHListSummaryTableViewCell *)self formattingManager];
    v55 = [v54 localizedLongActiveEnergyUnitString];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setTitleText:v55];

    v56 = [(CHListSummaryTableViewCell *)self workoutStatistics];
    v57 = [(CHListSummaryTableViewCell *)self formattingManager];
    v58 = [v56 formattedTotalActiveEnergyBurnWithFormattingManager:v57];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setTotalText:v58];

    v59 = [(CHListSummaryTableViewCell *)self workoutStatistics];
    v60 = [(CHListSummaryTableViewCell *)self formattingManager];
    v61 = [v59 formattedAverageActiveEnergyBurnWithFormattingManager:v60];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_activeEnergyLabel setAverageText:v61];
  }
  if (([(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel isHidden] & 1) == 0)
  {
    v62 = +[NSBundle mainBundle];
    v63 = [v62 localizedStringForKey:@"WORKOUT_MONTH_SUMMARY_DISTANCE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel setTitleText:v63];

    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel setTotalText:v65];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_distanceLabel setAverageText:v66];
  }
  if (([(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel isHidden] & 1) == 0)
  {
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel setTitleText:v32];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel setTotalText:0];
    [(_CHWorkoutSummaryTabbedLabelContainer *)self->_paceLabel setAverageText:v64];
  }
  [(CHListSummaryTableViewCell *)self setNeedsLayout];
}

+ (BOOL)mostRecentWorkout:(id)a3 supportsMetric:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 fiui_activityType];
  if (objc_msgSend(v6, "bridge_isDownhillSnowSport"))
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v8 = [v6 identifier];
    if (a4 == 8 && v8 == (id)46)
    {
      unsigned __int8 v7 = 0;
    }
    else
    {
      id v9 = [objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider) initWithMetricsVersion:[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:v5] activityType:v6 activityMoveMode:[v5 _activityMoveMode] deviceSupportsElevationMetrics:1 deviceSupportsGroundElevationMetrics:1];
      unsigned __int8 v7 = [v9 isMetricTypeSupported:a4 isMachineWorkout:0 activityType:v6];
    }
  }

  return v7;
}

- (void)_updateUIForMindfulnessSessions
{
  [(UILabel *)self->_totalHeaderLabel setHidden:1];
  [(UILabel *)self->_averageHeaderLabel setHidden:1];
  unint64_t v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"MINDFULNESS_SESSIONS" value:&stru_1008D8AB8 table:@"Localizable"];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel setTitleText:v4];

  id v5 = [(CHListSummaryTableViewCell *)self mindfulnessSessionsStatistics];
  id v6 = [v5 formattedSessionCount];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel setTotalText:v6];

  unsigned __int8 v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"TOTAL_TIME" value:&stru_1008D8AB8 table:@"Localizable"];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_durationLabel setTitleText:v8];

  id v11 = [(CHListSummaryTableViewCell *)self mindfulnessSessionsStatistics];
  id v9 = [(CHListSummaryTableViewCell *)self formattingManager];
  unsigned int v10 = [v11 formattedTotalDurationWithFormattingManager:v9];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_durationLabel setTotalText:v10];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CHListSummaryTableViewCell;
  [(CHListSummaryTableViewCell *)&v5 layoutSubviews];
  [(CHListSummaryTableViewCell *)self _layoutLabels];
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:0] == (id)1)
  {
    averageHeaderLabel = self->_averageHeaderLabel;
    v6[0] = self->_totalHeaderLabel;
    v6[1] = averageHeaderLabel;
    objc_super v4 = +[NSArray arrayWithObjects:v6 count:2];
    [(CHListSummaryTableViewCell *)self ch_transformViewsForRightToLeftLanguages:v4];
  }
}

- (void)_layoutLabels
{
  if ([(UILabel *)self->_totalHeaderLabel isHidden])
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v7 = 20.0;
  }
  else
  {
    [(UILabel *)self->_totalHeaderLabel sizeToFit];
    id v8 = [(UILabel *)self->_totalHeaderLabel font];
    [v8 _scaledValueForValue:10.0];

    id v9 = +[UIScreen mainScreen];
    UIRoundToScreenScale();
    double y = v10;

    double x = sub_10017851C() + 16.0 + 4.0;
    [(UILabel *)self->_totalHeaderLabel bounds];
    double width = CGRectGetWidth(v55);
    [(UILabel *)self->_totalHeaderLabel bounds];
    double height = CGRectGetHeight(v56);
    double v7 = 28.0;
  }
  -[UILabel setFrame:](self->_totalHeaderLabel, "setFrame:", x, y, width, height);
  [(UILabel *)self->_averageHeaderLabel sizeToFit];
  id v11 = [(UILabel *)self->_averageHeaderLabel font];
  [v11 _scaledValueForValue:10.0];

  v12 = +[UIScreen mainScreen];
  UIRoundToScreenScale();
  double v14 = v13;

  double v15 = sub_10017851C() * 2.0 + 16.0 + 4.0;
  [(UILabel *)self->_averageHeaderLabel bounds];
  double v16 = CGRectGetWidth(v57);
  [(UILabel *)self->_averageHeaderLabel bounds];
  -[UILabel setFrame:](self->_averageHeaderLabel, "setFrame:", v15, v14, v16, CGRectGetHeight(v58));
  v17 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
  [v17 _scaledValueForValue:v7];
  v18 = +[UIScreen mainScreen];
  UIRoundToScreenScale();
  double v20 = v19;

  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel sizeToFit];
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel frame];
  double v22 = v21;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel frame];
  double v24 = v23;
  [(_CHWorkoutSummaryTabbedLabelContainer *)self->_numberOfWorkoutsLabel _firstBaselineOffsetFromTop];
  double v26 = v20 - v25;
  [(UILabel *)self->_totalHeaderLabel frame];
  double v27 = v26 + CGRectGetMinY(v59);
  [(UILabel *)self->_totalHeaderLabel _firstBaselineOffsetFromTop];
  -[_CHWorkoutSummaryTabbedLabelContainer setFrame:](self->_numberOfWorkoutsLabel, "setFrame:", 16.0, v27 + v28, v22, v24);
  [v17 _scaledValueForValue:20.0];
  v29 = +[UIScreen mainScreen];
  UIRoundToScreenScale();
  double v31 = v30;

  activeEnergyLabel = self->_activeEnergyLabel;
  v54[0] = self->_durationLabel;
  v54[1] = activeEnergyLabel;
  paceLabel = self->_paceLabel;
  v54[2] = self->_distanceLabel;
  v54[3] = paceLabel;
  uint64_t v34 = +[NSArray arrayWithObjects:v54 count:4];
  v35 = self->_numberOfWorkoutsLabel;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v36 = v34;
  id v37 = [v36 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v50;
    do
    {
      v40 = 0;
      v41 = v35;
      do
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(v36);
        }
        v42 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v40);
        [v42 sizeToFit:v49];
        [v42 frame];
        double v43 = CGRectGetWidth(v60);
        [v42 frame];
        double v44 = CGRectGetHeight(v61);
        [v42 _firstBaselineOffsetFromTop];
        double v46 = v31 - v45;
        [(_CHWorkoutSummaryTabbedLabelContainer *)v41 frame];
        double v47 = v46 + CGRectGetMinY(v62);
        [(_CHWorkoutSummaryTabbedLabelContainer *)v41 _firstBaselineOffsetFromTop];
        [v42 setFrame:CGRectMake(16.0, v47 + v48, v43, v44)];
        v35 = v42;

        v40 = (char *)v40 + 1;
        v41 = v35;
      }
      while (v38 != v40);
      id v38 = [v36 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v38);
  }
}

- (FIUIWorkoutStatistics)workoutStatistics
{
  return self->_workoutStatistics;
}

- (void)setWorkoutStatistics:(id)a3
{
}

- (CHMindfulnessSessionsStatistics)mindfulnessSessionsStatistics
{
  return self->_mindfulnessSessionsStatistics;
}

- (void)setMindfulnessSessionsStatistics:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (CHWorkoutTypeKey)activityTypeKey
{
  return self->_activityTypeKey;
}

- (void)setActivityTypeKey:(id)a3
{
}

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (void)setSummaryType:(unint64_t)a3
{
  self->_summaryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeKey, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_mindfulnessSessionsStatistics, 0);
  objc_storeStrong((id *)&self->_workoutStatistics, 0);
  objc_storeStrong((id *)&self->_paceLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_activeEnergyLabel, 0);
  objc_storeStrong((id *)&self->_numberOfWorkoutsLabel, 0);
  objc_storeStrong((id *)&self->_averageHeaderLabel, 0);

  objc_storeStrong((id *)&self->_totalHeaderLabel, 0);
}

@end