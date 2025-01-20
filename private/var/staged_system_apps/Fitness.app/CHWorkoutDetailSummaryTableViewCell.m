@interface CHWorkoutDetailSummaryTableViewCell
+ (double)preferredHeightForWorkout:(id)a3;
+ (id)_geocoder;
+ (id)_locationArrowImage;
- (BOOL)_workoutIsThirdParty:(id)a3;
- (CHWorkoutDetailSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CLLocation)location;
- (NSDictionary)swimDistanceByStrokeStyle;
- (void)_constrainViews;
- (void)_navigateToSeymourWorkout;
- (void)_treatAsFirstPartyWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5;
- (void)setLocation:(id)a3;
- (void)setLocation:(id)a3 completion:(id)a4;
- (void)setSwimDistanceByStrokeStyle:(id)a3;
- (void)summaryConfigureWithWorkout:(id)a3 workoutActivity:(id)a4 fitnessAppContext:(id)a5 catalogItemViewModel:(id)a6 formattingManager:(id)a7 resizeBlock:(id)a8;
@end

@implementation CHWorkoutDetailSummaryTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _goalType];
  id v5 = [v3 workoutActivityType];

  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == (id)46;
  }
  double result = 184.0;
  if (!v6) {
    return 128.0;
  }
  return result;
}

+ (id)_geocoder
{
  if (qword_10096B5E8 != -1) {
    dispatch_once(&qword_10096B5E8, &stru_1008ADDE8);
  }
  v2 = (void *)qword_10096B5E0;

  return v2;
}

+ (id)_locationArrowImage
{
  if (qword_10096B5F8 != -1) {
    dispatch_once(&qword_10096B5F8, &stru_1008ADE08);
  }
  v2 = (void *)qword_10096B5F0;

  return v2;
}

- (CHWorkoutDetailSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v63.receiver = self;
  v63.super_class = (Class)CHWorkoutDetailSummaryTableViewCell;
  id v4 = [(CHWorkoutDetailSummaryTableViewCell *)&v63 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = +[UIColor systemBackgroundColor];
    [(CHWorkoutDetailSummaryTableViewCell *)v4 setBackgroundColor:v5];

    BOOL v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    ringImageView = v4->_ringImageView;
    v4->_ringImageView = v6;

    [(UIImageView *)v4->_ringImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(CHWorkoutDetailSummaryTableViewCell *)v4 contentView];
    [v8 addSubview:v4->_ringImageView];

    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v9;

    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconImageView setUserInteractionEnabled:1];
    v11 = [(CHWorkoutDetailSummaryTableViewCell *)v4 contentView];
    [v11 addSubview:v4->_iconImageView];

    v12 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    workoutTypeIconImageView = v4->_workoutTypeIconImageView;
    v4->_workoutTypeIconImageView = v12;

    [(UIImageView *)v4->_workoutTypeIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(CHWorkoutDetailSummaryTableViewCell *)v4 contentView];
    [v14 addSubview:v4->_workoutTypeIconImageView];

    v15 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:&__NSArray0__struct];
    summaryContainer = v4->_summaryContainer;
    v4->_summaryContainer = v15;

    [(UIStackView *)v4->_summaryContainer setAxis:1];
    [(UIStackView *)v4->_summaryContainer setDistribution:3];
    [(UIStackView *)v4->_summaryContainer setAlignment:1];
    [(UIStackView *)v4->_summaryContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v17) = 1148846080;
    [(UIStackView *)v4->_summaryContainer setContentCompressionResistancePriority:1 forAxis:v17];
    v18 = [(CHWorkoutDetailSummaryTableViewCell *)v4 contentView];
    [v18 addSubview:v4->_summaryContainer];

    v19 = (UILabel *)objc_alloc_init((Class)UILabel);
    workoutTypeLabel = v4->_workoutTypeLabel;
    v4->_workoutTypeLabel = v19;

    [(UILabel *)v4->_workoutTypeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_workoutTypeLabel setNumberOfLines:0];
    [(UILabel *)v4->_workoutTypeLabel setAllowsDefaultTighteningForTruncation:1];
    v21 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_workoutTypeLabel setFont:v21];

    v22 = +[UIColor labelColor];
    [(UILabel *)v4->_workoutTypeLabel setTextColor:v22];

    LODWORD(v23) = 1148846080;
    [(UILabel *)v4->_workoutTypeLabel setContentCompressionResistancePriority:1 forAxis:v23];
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v4->_workoutTypeLabel];
    v24 = (UILabel *)objc_alloc_init((Class)UILabel);
    brandLabel = v4->_brandLabel;
    v4->_brandLabel = v24;

    [(UILabel *)v4->_brandLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_brandLabel setNumberOfLines:0];
    [(UILabel *)v4->_brandLabel setAllowsDefaultTighteningForTruncation:1];
    v26 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_brandLabel setFont:v26];

    v27 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_brandLabel setTextColor:v27];

    LODWORD(v28) = 1148846080;
    [(UILabel *)v4->_brandLabel setContentCompressionResistancePriority:1 forAxis:v28];
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v4->_brandLabel];
    v29 = (UILabel *)objc_alloc_init((Class)UILabel);
    completionLabel = v4->_completionLabel;
    v4->_completionLabel = v29;

    [(UILabel *)v4->_completionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_completionLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v4->_completionLabel setNumberOfLines:0];
    v31 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_completionLabel setFont:v31];

    v32 = +[UIColor labelColor];
    [(UILabel *)v4->_completionLabel setTextColor:v32];

    LODWORD(v33) = 1148846080;
    [(UILabel *)v4->_completionLabel setContentCompressionResistancePriority:1 forAxis:v33];
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v4->_completionLabel];
    v34 = [_CHWorkoutDetailTextSpacerView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v38 = -[_CHWorkoutDetailTextSpacerView initWithFrame:](v34, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v38];
    v39 = (UILabel *)objc_alloc_init((Class)UILabel);
    swimmingDistanceByStrokeStyleLabel = v4->_swimmingDistanceByStrokeStyleLabel;
    v4->_swimmingDistanceByStrokeStyleLabel = v39;

    [(UILabel *)v4->_swimmingDistanceByStrokeStyleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_swimmingDistanceByStrokeStyleLabel setAllowsDefaultTighteningForTruncation:1];
    v41 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_swimmingDistanceByStrokeStyleLabel setFont:v41];

    v42 = +[UIColor labelColor];
    [(UILabel *)v4->_swimmingDistanceByStrokeStyleLabel setTextColor:v42];

    [(UILabel *)v4->_swimmingDistanceByStrokeStyleLabel setNumberOfLines:0];
    LODWORD(v43) = 1148846080;
    [(UILabel *)v4->_swimmingDistanceByStrokeStyleLabel setContentCompressionResistancePriority:1 forAxis:v43];
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v4->_swimmingDistanceByStrokeStyleLabel];
    v44 = -[_CHWorkoutDetailTextSpacerView initWithFrame:]([_CHWorkoutDetailTextSpacerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v44];
    swimmingDistanceByStrokeStyleLabelTrailingSpacer = v4->_swimmingDistanceByStrokeStyleLabelTrailingSpacer;
    v4->_swimmingDistanceByStrokeStyleLabelTrailingSpacer = v44;
    v46 = v44;

    v47 = (UILabel *)objc_alloc_init((Class)UILabel);
    timeRangeLabel = v4->_timeRangeLabel;
    v4->_timeRangeLabel = v47;

    v49 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_timeRangeLabel setFont:v49];

    [(UILabel *)v4->_timeRangeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_timeRangeLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_timeRangeLabel setMinimumScaleFactor:0.8];
    v50 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_timeRangeLabel setTextColor:v50];

    LODWORD(v51) = 1148846080;
    [(UILabel *)v4->_timeRangeLabel setContentCompressionResistancePriority:1 forAxis:v51];
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v4->_timeRangeLabel];
    v52 = (UILabel *)objc_alloc_init((Class)UILabel);
    locationLabel = v4->_locationLabel;
    v4->_locationLabel = v52;

    v54 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_locationLabel setFont:v54];

    [(UILabel *)v4->_locationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v55 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_locationLabel setTextColor:v55];

    LODWORD(v56) = 1148846080;
    [(UILabel *)v4->_locationLabel setContentCompressionResistancePriority:1 forAxis:v56];
    [(UIStackView *)v4->_summaryContainer addArrangedSubview:v4->_locationLabel];
    v57 = (UIView *)objc_alloc_init((Class)UIView);
    contentViewLayoutView = v4->_contentViewLayoutView;
    v4->_contentViewLayoutView = v57;

    [(UIView *)v4->_contentViewLayoutView setTranslatesAutoresizingMaskIntoConstraints:0];
    v59 = [(CHWorkoutDetailSummaryTableViewCell *)v4 contentView];
    [v59 addSubview:v4->_contentViewLayoutView];

    id v60 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"_navigateToSeymourWorkout"];
    v61 = [(CHWorkoutDetailSummaryTableViewCell *)v4 contentView];
    [v61 addGestureRecognizer:v60];

    [(CHWorkoutDetailSummaryTableViewCell *)v4 _constrainViews];
  }
  return v4;
}

- (void)summaryConfigureWithWorkout:(id)a3 workoutActivity:(id)a4 fitnessAppContext:(id)a5 catalogItemViewModel:(id)a6 formattingManager:(id)a7 resizeBlock:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v50 = a5;
  id v48 = a6;
  id v17 = a7;
  id v49 = a8;
  objc_storeStrong((id *)&self->_currentWorkout, a3);
  objc_storeStrong((id *)&self->_currentWorkoutActivity, a4);
  objc_storeStrong((id *)&self->_fitnessAppContext, a5);
  objc_storeStrong((id *)&self->_catalogItemViewModel, a6);
  objc_storeWeak((id *)&self->_formattingManager, v17);
  v18 = [v17 formattedTypeForWorkout:v15 workoutActivity:v16 context:@"WorkoutDetailDisplayContext"];
  [(UILabel *)self->_workoutTypeLabel setAttributedText:v18];

  v19 = [v17 formattedTimeRangeForWorkout:v15 workoutActivity:v16 context:@"WorkoutDetailDisplayContext"];
  [(UILabel *)self->_timeRangeLabel setAttributedText:v19];

  uint64_t v20 = [v15 fiui_connectedGymBrandName];
  v47 = (void *)v20;
  if (v20) {
    [(UILabel *)self->_brandLabel setText:v20];
  }
  else {
    [(UIStackView *)self->_summaryContainer removeArrangedSubview:self->_brandLabel];
  }
  v21 = [v15 sourceRevision:&self->_fitnessAppContext];
  v22 = [v21 source];
  unsigned int v23 = [v22 _hasFirstPartyBundleID];

  v24 = [v15 sourceRevision];
  v25 = [v24 source];
  if ([v25 _isAppleWatch]) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = [v15 _isWatchWorkout];
  }

  v27 = [v50 seymourCatalogItemDataProvider];
  unsigned int v28 = [v27 isSeymourWorkout:v15];

  if (objc_msgSend(v15, "fiui_isConnectedGymWorkout"))
  {
    unsigned int v29 = [v17 hasConnectedGymVendorIconForWorkout:v15];
    objc_initWeak(location, self);
    if (((v29 ^ 1 | v28) & 1) == 0)
    {
      [(UIImageView *)self->_ringImageView setHidden:1];
      v30 = v48;
      [(UIImageView *)self->_workoutTypeIconImageView setHidden:1];
      [(UIImageView *)self->_iconImageView setHidden:0];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10015D670;
      v56[3] = &unk_1008AD3D8;
      v31 = &v57;
      objc_copyWeak(&v57, location);
      [v17 fetchIconImageForWorkout:v15 context:@"WorkoutDetailDisplayContext" completion:v56];
      [(UILabel *)self->_completionLabel setHidden:1];
      goto LABEL_30;
    }
  }
  else
  {
    objc_initWeak(location, self);
  }
  if (v48) {
    unsigned int v32 = v28;
  }
  else {
    unsigned int v32 = 0;
  }
  if (v32 == 1)
  {
    unsigned int v33 = [v48 isSeymourPairedWorkout];
    v30 = v48;
    [(UIImageView *)self->_workoutTypeIconImageView setHidden:1];
    [(UIImageView *)self->_ringImageView setHidden:1];
    [(UILabel *)self->_swimmingDistanceByStrokeStyleLabel setHidden:1];
    [(_CHWorkoutDetailTextSpacerView *)self->_swimmingDistanceByStrokeStyleLabelTrailingSpacer setHidden:1];
    v34 = [(UIImageView *)self->_iconImageView layer];
    [v34 setMasksToBounds:1];

    v35 = [(UIImageView *)self->_iconImageView layer];
    v36 = v35;
    double v37 = 12.0;
    if (v33) {
      double v37 = 10.0;
    }
    [v35 setCornerRadius:v37];

    v38 = [v48 title];
    [(UILabel *)self->_workoutTypeLabel setAttributedText:v38];

    v39 = [v48 subtitle];
    [(UILabel *)self->_completionLabel setAttributedText:v39];

    v40 = [*v46 seymourCatalogItemDataProvider];
    if (v33) {
      double v41 = 76.0;
    }
    else {
      double v41 = 85.0;
    }
    if (v33) {
      double v42 = 135.0;
    }
    else {
      double v42 = 85.0;
    }
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10015D6DC;
    v53[3] = &unk_1008ADE30;
    v31 = &v55;
    objc_copyWeak(&v55, location);
    id v54 = v49;
    [v40 fetchCatalogArtworkForCatalogItemViewModel:v48 imageSize:v53 completion:v42 v41];
  }
  else
  {
    v30 = v48;
    unsigned int v43 = [v15 isMultiSportWorkout] ^ 1;
    if (!v16) {
      LOBYTE(v43) = 1;
    }
    if ((v43 & 1) == 0)
    {
      v44 = [v17 defaultCircularRingImageForContext:@"WorkoutDetailDisplayContext"];
      [(UIImageView *)self->_ringImageView setImage:v44];

      [(CHWorkoutDetailSummaryTableViewCell *)self _treatAsFirstPartyWorkout:v15 workoutActivity:v16 formattingManager:v17];
      goto LABEL_31;
    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10015D780;
    v51[3] = &unk_1008AD3D8;
    v31 = &v52;
    objc_copyWeak(&v52, location);
    [v17 fetchIconImageForWorkout:v15 context:@"WorkoutDetailDisplayContext" completion:v51];
    if ((v23 & v26) == 1) {
      [(CHWorkoutDetailSummaryTableViewCell *)self _treatAsFirstPartyWorkout:v15 workoutActivity:v16 formattingManager:v17];
    }
  }
LABEL_30:
  objc_destroyWeak(v31);
LABEL_31:
  if ([v15 workoutActivityType] == (id)84) {
    [(UILabel *)self->_completionLabel setHidden:1];
  }
  v45 = [v17 locationForWorkout:v15 workoutActivity:v16];
  if (v45) {
    [(UILabel *)self->_locationLabel setText:@" "];
  }
  [(CHWorkoutDetailSummaryTableViewCell *)self setLocation:v45];
  [(CHWorkoutDetailSummaryTableViewCell *)self setLocation:v45 completion:0];
  [(CHWorkoutDetailSummaryTableViewCell *)self setNeedsLayout];

  objc_destroyWeak(location);
}

- (void)_navigateToSeymourWorkout
{
  id v3 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourCatalogItemDataProvider];
  unsigned int v4 = [v3 isSeymourWorkout:self->_currentWorkout];

  if (v4)
  {
    fitnessAppContext = self->_fitnessAppContext;
    currentWorkout = self->_currentWorkout;
    [(CHFitnessAppContext *)fitnessAppContext navigateToWorkout:currentWorkout];
  }
}

- (void)_treatAsFirstPartyWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[ARUIMetricColors metricColorsForWorkout:v8];
  uint64_t v12 = [v11 nonGradientTextColor];

  [(UIImageView *)self->_ringImageView setHidden:0];
  if (v9) {
    v13 = v9;
  }
  else {
    v13 = v8;
  }
  v75 = [v13 fiui_activityType];
  unsigned __int8 v14 = [v8 fiui_isConnectedGymWorkout];
  workoutTypeIconImageView = self->_workoutTypeIconImageView;
  v74 = (void *)v12;
  if (v14)
  {
    [(UIImageView *)workoutTypeIconImageView setHidden:1];
  }
  else
  {
    [(UIImageView *)workoutTypeIconImageView setHidden:0];
    id v16 = FIUIStaticWorkoutIconImage();
    id v17 = [v16 imageWithRenderingMode:2];

    [(UIImageView *)self->_workoutTypeIconImageView setImage:v17];
    [(UIImageView *)self->_workoutTypeIconImageView setTintColor:v12];
  }
  [(UIImageView *)self->_iconImageView setHidden:1];
  id v18 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_1008D8AB8];
  if (!v9)
  {
    v67 = (char *)[v8 _goalType] - 1;
    v72 = v10;
    v19 = [v10 fitnessUIFormattingManager];
    uint64_t v20 = [v8 displayDetail:v19];

    v73 = (__CFString *)v20;
    if (!v20)
    {
      v21 = [v10 fitnessUIFormattingManager];
      CFStringRef v76 = &stru_1008D8AB8;
      v73 = [v21 localizedGoalDescriptionForWorkout:v8 withValue:&v76 appendActivityType:0];
    }
    v22 = [(UILabel *)self->_completionLabel font];
    unsigned int v23 = [v22 fontDescriptor];
    UIFontDescriptorAttributeName v84 = UIFontDescriptorFeatureSettingsAttribute;
    v81[0] = UIFontFeatureTypeIdentifierKey;
    v81[1] = UIFontFeatureSelectorIdentifierKey;
    v82[0] = &off_1008DE838;
    v82[1] = &off_1008DE850;
    v24 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
    v83 = v24;
    v25 = +[NSArray arrayWithObjects:&v83 count:1];
    v85 = v25;
    uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];

    v69 = (void *)v26;
    v70 = v23;
    v27 = [v23 fontDescriptorByAddingAttributes:v26];
    v71 = v22;
    [v22 pointSize];
    uint64_t v28 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v27);
    unsigned int v29 = (void *)v28;
    if ((unint64_t)v67 > 2)
    {
      if (![v8 isRaceWorkout])
      {
        id v56 = objc_alloc((Class)NSAttributedString);
        v30 = v73;
        if (v73) {
          CFStringRef v57 = v73;
        }
        else {
          CFStringRef v57 = &stru_1008D8AB8;
        }
        id v42 = [v56 initWithString:v57];
        goto LABEL_29;
      }
      v66 = v27;
      v68 = v29;
      unsigned int v43 = [v72 fitnessUIFormattingManager];
      [v8 raceWorkoutDisplayDistance];
      double v45 = v44;
      v46 = [v8 fiui_activityType];
      uint64_t v47 = [v43 localizedCompactGoalDescriptionForGoalType:1 goalValue:v46 activityType:v45];

      id v48 = objc_alloc((Class)NSMutableAttributedString);
      v30 = v73;
      if (v73) {
        CFStringRef v49 = v73;
      }
      else {
        CFStringRef v49 = &stru_1008D8AB8;
      }
      id v50 = [v48 initWithString:v49];
      id v51 = [(__CFString *)v73 rangeOfString:v47];
      if (v51 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v53 = v51;
        uint64_t v54 = v52;
        NSAttributedStringKey v77 = NSFontAttributeName;
        v78 = v68;
        id v55 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        [v50 addAttributes:v55 range:v53];

        v30 = v73;
      }
      id v42 = [v50 copy];

      id v18 = (id)v47;
    }
    else
    {
      v66 = v27;
      v68 = (void *)v28;
      v30 = v73;
      uint64_t v31 = [(__CFString *)v73 localizedLowercaseString];
      unsigned int v32 = +[NSBundle mainBundle];
      unsigned int v33 = [v32 localizedStringForKey:@"WORKOUT_SUMMARY_GOAL_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
      if (v31) {
        CFStringRef v34 = (const __CFString *)v31;
      }
      else {
        CFStringRef v34 = &stru_1008D8AB8;
      }
      v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v34);

      id v36 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v35];
      id v37 = [v35 rangeOfString:v31];
      if (v37 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v39 = v37;
        uint64_t v40 = v38;
        NSAttributedStringKey v79 = NSFontAttributeName;
        v80 = v68;
        double v41 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        [v36 addAttributes:v41 range:v39];

        v30 = v73;
      }
      id v42 = [v36 copy];

      id v18 = (id)v31;
      id v9 = 0;
    }
    v27 = v66;
    unsigned int v29 = v68;
LABEL_29:

    id v18 = v42;
    id v10 = v72;
  }
  v58 = v74;
  [(UILabel *)self->_completionLabel setAttributedText:v18];
  [(UILabel *)self->_completionLabel setColor:v74];
  if ([v75 identifier] == (id)46)
  {
    v59 = [(CHWorkoutDetailSummaryTableViewCell *)self swimDistanceByStrokeStyle];

    if (v59)
    {
      if (v9)
      {
        id v60 = [v9 workoutConfiguration];
        id v61 = [v60 swimmingLocationType];
      }
      else
      {
        id v61 = [v8 fi_swimmingLocationType];
      }
      v62 = [(CHWorkoutDetailSummaryTableViewCell *)self swimDistanceByStrokeStyle];
      objc_super v63 = [v10 formattedDistanceByStrokeStyle:v62 isPoolSwim:v61 == (id)1 context:@"WorkoutDetailDisplayContext"];
      [(UILabel *)self->_swimmingDistanceByStrokeStyleLabel setAttributedText:v63];

      v64 = [(UILabel *)self->_swimmingDistanceByStrokeStyleLabel attributedText];
      id v65 = [v64 length];

      v58 = v74;
      if (v65) {
        self->_shouldShowSubtypeLabel = 1;
      }
    }
  }
  [(UILabel *)self->_swimmingDistanceByStrokeStyleLabel setHidden:!self->_shouldShowSubtypeLabel];
  [(_CHWorkoutDetailTextSpacerView *)self->_swimmingDistanceByStrokeStyleLabelTrailingSpacer setHidden:!self->_shouldShowSubtypeLabel];
}

- (void)setLocation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = [(id)objc_opt_class() _geocoder];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10015E084;
    v9[3] = &unk_1008AC518;
    v9[4] = self;
    id v10 = v6;
    [v8 reverseGeocodeLocation:v7 completionHandler:v9];
  }
}

- (void)setSwimDistanceByStrokeStyle:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, a3);
  if (self->_currentWorkout)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_formattingManager);

    if (WeakRetained)
    {
      currentWorkout = self->_currentWorkout;
      currentWorkoutActivitdouble y = self->_currentWorkoutActivity;
      fitnessAppContext = self->_fitnessAppContext;
      catalogItemViewModel = self->_catalogItemViewModel;
      id v10 = objc_loadWeakRetained((id *)&self->_formattingManager);
      [(CHWorkoutDetailSummaryTableViewCell *)self summaryConfigureWithWorkout:currentWorkout workoutActivity:currentWorkoutActivity fitnessAppContext:fitnessAppContext catalogItemViewModel:catalogItemViewModel formattingManager:v10 resizeBlock:0];
    }
  }
}

- (BOOL)_workoutIsThirdParty:(id)a3
{
  id v3 = [a3 sourceRevision];
  unsigned int v4 = [v3 source];
  char v5 = [v4 _isAppleWatch] ^ 1;

  return v5;
}

- (void)_constrainViews
{
  if (![(NSArray *)self->_addedConstraints count])
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    unsigned int v4 = [(UIImageView *)self->_ringImageView leadingAnchor];
    char v5 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    id v6 = [v5 leadingAnchor];
    v70 = [v4 constraintEqualToAnchor:v6];

    id v7 = [(UIImageView *)self->_ringImageView topAnchor];
    id v8 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    id v9 = [v8 topAnchor];
    v69 = [v7 constraintEqualToAnchor:v9 constant:14.0];

    v75[0] = v70;
    v75[1] = v69;
    id v10 = +[NSArray arrayWithObjects:v75 count:2];
    [v3 addObjectsFromArray:v10];

    id v11 = [(UIImageView *)self->_workoutTypeIconImageView centerXAnchor];
    uint64_t v12 = [(UIImageView *)self->_ringImageView centerXAnchor];
    v68 = [v11 constraintEqualToAnchor:v12];

    v13 = [(UIImageView *)self->_workoutTypeIconImageView centerYAnchor];
    unsigned __int8 v14 = [(UIImageView *)self->_ringImageView centerYAnchor];
    v67 = [v13 constraintEqualToAnchor:v14];

    v74[0] = v68;
    v74[1] = v67;
    id v15 = +[NSArray arrayWithObjects:v74 count:2];
    [v3 addObjectsFromArray:v15];

    id v16 = [(UIImageView *)self->_iconImageView leadingAnchor];
    id v17 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    id v18 = [v17 leadingAnchor];
    v66 = [v16 constraintEqualToAnchor:v18];

    v19 = [(UIImageView *)self->_iconImageView topAnchor];
    uint64_t v20 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    v21 = [v20 topAnchor];
    id v65 = [v19 constraintEqualToAnchor:v21 constant:14.0];

    v73[0] = v66;
    v73[1] = v65;
    v22 = +[NSArray arrayWithObjects:v73 count:2];
    [v3 addObjectsFromArray:v22];

    unsigned int v23 = [(UIStackView *)self->_summaryContainer leadingAnchor];
    v24 = [(UIImageView *)self->_ringImageView trailingAnchor];
    v64 = [v23 constraintEqualToAnchor:v24 constant:16.0];

    v25 = [(UIStackView *)self->_summaryContainer leadingAnchor];
    uint64_t v26 = [(UIImageView *)self->_iconImageView trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:16.0];
    id v61 = v3;
    [v3 addObject:v27];

    uint64_t v28 = [(UIStackView *)self->_summaryContainer trailingAnchor];
    unsigned int v29 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    v30 = [v29 trailingAnchor];
    objc_super v63 = [v28 constraintEqualToAnchor:v30];

    uint64_t v31 = [(UIStackView *)self->_summaryContainer topAnchor];
    unsigned int v32 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    unsigned int v33 = [v32 topAnchor];
    v62 = [v31 constraintEqualToAnchor:v33 constant:14.0];

    v72[0] = v64;
    v72[1] = v63;
    v72[2] = v62;
    CFStringRef v34 = +[NSArray arrayWithObjects:v72 count:3];
    [v3 addObjectsFromArray:v34];

    v35 = [(UIView *)self->_contentViewLayoutView widthAnchor];
    id v60 = [v35 constraintEqualToConstant:30.0];

    id v36 = [(UIView *)self->_contentViewLayoutView topAnchor];
    id v37 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    uint64_t v38 = [v37 topAnchor];
    v59 = [v36 constraintEqualToAnchor:v38 constant:14.0];

    id v39 = [(UIView *)self->_contentViewLayoutView bottomAnchor];
    uint64_t v40 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    double v41 = [v40 bottomAnchor];
    v58 = [v39 constraintEqualToAnchor:v41 constant:-14.0];

    id v42 = [(UIView *)self->_contentViewLayoutView leadingAnchor];
    unsigned int v43 = [(CHWorkoutDetailSummaryTableViewCell *)self contentView];
    double v44 = [v43 leadingAnchor];
    CFStringRef v57 = [v42 constraintEqualToAnchor:v44];

    double v45 = [(UIView *)self->_contentViewLayoutView heightAnchor];
    v46 = [(UIStackView *)self->_summaryContainer heightAnchor];
    id v56 = [v45 constraintGreaterThanOrEqualToAnchor:v46];

    uint64_t v47 = [(UIView *)self->_contentViewLayoutView heightAnchor];
    id v48 = [(UIImageView *)self->_iconImageView heightAnchor];
    CFStringRef v49 = [v47 constraintGreaterThanOrEqualToAnchor:v48];

    id v50 = [(UIView *)self->_contentViewLayoutView heightAnchor];
    id v51 = [(UIImageView *)self->_ringImageView heightAnchor];
    uint64_t v52 = [v50 constraintGreaterThanOrEqualToAnchor:v51];

    v71[0] = v60;
    v71[1] = v59;
    v71[2] = v58;
    v71[3] = v57;
    v71[4] = v56;
    v71[5] = v49;
    v71[6] = v52;
    id v53 = +[NSArray arrayWithObjects:v71 count:7];
    [v61 addObjectsFromArray:v53];

    uint64_t v54 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v61];
    addedConstraints = self->_addedConstraints;
    self->_addedConstraints = v54;

    +[NSLayoutConstraint activateConstraints:self->_addedConstraints];
  }
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSDictionary)swimDistanceByStrokeStyle
{
  return self->_swimDistanceByStrokeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_addedConstraints, 0);
  objc_storeStrong((id *)&self->_contentViewLayoutView, 0);
  objc_storeStrong((id *)&self->_swimmingDistanceByStrokeStyleLabelTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_timeRangeLabel, 0);
  objc_storeStrong((id *)&self->_swimmingDistanceByStrokeStyleLabel, 0);
  objc_storeStrong((id *)&self->_completionLabel, 0);
  objc_storeStrong((id *)&self->_brandLabel, 0);
  objc_storeStrong((id *)&self->_workoutTypeLabel, 0);
  objc_storeStrong((id *)&self->_summaryContainer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_workoutTypeIconImageView, 0);
  objc_storeStrong((id *)&self->_ringImageView, 0);
  objc_destroyWeak((id *)&self->_formattingManager);
  objc_storeStrong((id *)&self->_catalogItemViewModel, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_currentWorkoutActivity, 0);

  objc_storeStrong((id *)&self->_currentWorkout, 0);
}

@end