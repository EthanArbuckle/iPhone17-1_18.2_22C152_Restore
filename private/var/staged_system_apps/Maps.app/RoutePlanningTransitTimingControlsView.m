@interface RoutePlanningTransitTimingControlsView
- (BOOL)showsSchedulingButtons;
- (RoutePlanningTiming)selectedTiming;
- (RoutePlanningTransitTimingControlsView)initWithFrame:(CGRect)a3;
- (id)_horizontalStackViewWithViews:(id)a3 spacing:(double)a4;
- (id)changeHandler;
- (id)layoutHandler;
- (void)_computeSelectedTiming;
- (void)_notifyDidUpdateTiming;
- (void)_planningTypeDidChange:(id)a3;
- (void)_selectedDateDidChange;
- (void)_setDatePickerBoundaries;
- (void)_setDatePickerDate;
- (void)_setupInitialConstraints;
- (void)_toggleChanged:(id)a3;
- (void)reset;
- (void)setChangeHandler:(id)a3;
- (void)setLayoutHandler:(id)a3;
- (void)setSelectedTiming:(id)a3;
- (void)setShowPlanningControls:(BOOL)a3;
- (void)setShowSchedulingButtons:(BOOL)a3;
@end

@implementation RoutePlanningTransitTimingControlsView

- (RoutePlanningTransitTimingControlsView)initWithFrame:(CGRect)a3
{
  v67.receiver = self;
  v67.super_class = (Class)RoutePlanningTransitTimingControlsView;
  v3 = -[RoutePlanningTransitTimingControlsView initWithFrame:](&v67, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(RoutePlanningTransitTimingControlsView *)v3 setAccessibilityIdentifier:v5];

    v6 = +[NSBundle mainBundle];
    v66 = [v6 localizedStringForKey:@"Leave Now [Route Planning, Transit, Catalyst", @"localized string not found", 0 value table];

    v7 = +[NSBundle mainBundle];
    v65 = [v7 localizedStringForKey:@"Plan [Route Planning, Transit, Catalyst", @"localized string not found", 0 value table];

    id v8 = objc_alloc((Class)UISegmentedControl);
    v73[0] = v66;
    v73[1] = v65;
    v9 = +[NSArray arrayWithObjects:v73 count:2];
    v10 = (UISegmentedControl *)[v8 initWithItems:v9];
    timingTypeControl = v3->_timingTypeControl;
    v3->_timingTypeControl = v10;

    [(UISegmentedControl *)v3->_timingTypeControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UISegmentedControl *)v3->_timingTypeControl setSelectedSegmentIndex:0];
    [(UISegmentedControl *)v3->_timingTypeControl addTarget:v3 action:"_planningTypeDidChange:" forControlEvents:4096];
    [(UISegmentedControl *)v3->_timingTypeControl setAccessibilityIdentifier:@"TimingTypeSegmentedControl"];
    [(RoutePlanningTransitTimingControlsView *)v3 addSubview:v3->_timingTypeControl];
    id v12 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v16 = [v12 initWithFrame:CGRectZero.origin.x, y, width, height];
    planningControlsView = v3->_planningControlsView;
    v3->_planningControlsView = v16;

    [(UIView *)v3->_planningControlsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_planningControlsView setAlpha:0.0];
    [(UIView *)v3->_planningControlsView setAccessibilityIdentifier:@"PlanningControls"];
    [(RoutePlanningTransitTimingControlsView *)v3 addSubview:v3->_planningControlsView];
    id v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"Leave [Route Planning, Transit, Catalyst, Radio Button]", @"localized string not found", 0 value table];
    [v18 setText:v20];

    v21 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v22 = v18;
    [v18 setFont:v21];

    [v18 setAccessibilityIdentifier:@"LeaveAtLabel"];
    v64 = +[NSUUID UUID];
    uint64_t v23 = +[MapsRadioButton buttonWithGroupIdentifier:v64];
    leaveAtButton = v3->_leaveAtButton;
    v3->_leaveAtButton = (MapsRadioButton *)v23;

    [(MapsRadioButton *)v3->_leaveAtButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsRadioButton *)v3->_leaveAtButton setSelected:1];
    [(MapsRadioButton *)v3->_leaveAtButton setControlSize:1];
    [(MapsRadioButton *)v3->_leaveAtButton setAccessibilityIdentifier:@"LeaveAtButton"];
    [(MapsRadioButton *)v3->_leaveAtButton setAssociatedLabel:v18];
    [(MapsRadioButton *)v3->_leaveAtButton addTarget:v3 action:"_toggleChanged:" forControlEvents:4096];
    id v25 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"Arrive [Route Planning, Transit, Catalyst, Radio Button]", @"localized string not found", 0 value table];
    [v25 setText:v27];

    v28 = [v18 font];
    [v25 setFont:v28];

    [v25 setAccessibilityIdentifier:@"ArriveByLabel"];
    uint64_t v29 = +[MapsRadioButton buttonWithGroupIdentifier:v64];
    arriveByButton = v3->_arriveByButton;
    v3->_arriveByButton = (MapsRadioButton *)v29;

    [(MapsRadioButton *)v3->_arriveByButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsRadioButton *)v3->_arriveByButton setControlSize:1];
    [(MapsRadioButton *)v3->_arriveByButton setAccessibilityIdentifier:@"ArriveByButton"];
    v63 = v25;
    [(MapsRadioButton *)v3->_arriveByButton setAssociatedLabel:v25];
    [(MapsRadioButton *)v3->_arriveByButton addTarget:v3 action:"_toggleChanged:" forControlEvents:4096];
    v72[0] = v3->_leaveAtButton;
    v72[1] = v18;
    v31 = +[NSArray arrayWithObjects:v72 count:2];
    uint64_t v32 = [(RoutePlanningTransitTimingControlsView *)v3 _horizontalStackViewWithViews:v31 spacing:5.0];
    leaveAtStackView = v3->_leaveAtStackView;
    v3->_leaveAtStackView = (UIStackView *)v32;

    [(UIStackView *)v3->_leaveAtStackView setAccessibilityIdentifier:@"LeaveAtStackView"];
    v71[0] = v3->_arriveByButton;
    v71[1] = v25;
    v34 = +[NSArray arrayWithObjects:v71 count:2];
    uint64_t v35 = [(RoutePlanningTransitTimingControlsView *)v3 _horizontalStackViewWithViews:v34 spacing:5.0];
    arriveByStackView = v3->_arriveByStackView;
    v3->_arriveByStackView = (UIStackView *)v35;

    [(UIStackView *)v3->_arriveByStackView setAccessibilityIdentifier:@"ArriveByStackView"];
    v70[0] = v3->_leaveAtStackView;
    v70[1] = v3->_arriveByStackView;
    v37 = +[NSArray arrayWithObjects:v70 count:2];
    uint64_t v38 = [(RoutePlanningTransitTimingControlsView *)v3 _horizontalStackViewWithViews:v37 spacing:20.0];
    radioButtonStackView = v3->_radioButtonStackView;
    v3->_radioButtonStackView = (UIStackView *)v38;

    [(UIStackView *)v3->_radioButtonStackView setAccessibilityIdentifier:@"RadioButtonStackView"];
    [(UIView *)v3->_planningControlsView addSubview:v3->_radioButtonStackView];
    v40 = [objc_alloc((Class)UIDatePicker) initWithFrame:CGRectZero.origin.x, y, width, height];
    datePicker = v3->_datePicker;
    v3->_datePicker = v40;

    [(UIDatePicker *)v3->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v3->_datePicker setDatePickerMode:1];
    [(UIDatePicker *)v3->_datePicker setAccessibilityIdentifier:@"DatePicker"];
    [(UIDatePicker *)v3->_datePicker addTarget:v3 action:"_selectedDateDidChange" forControlEvents:4096];
    id v42 = objc_alloc((Class)UIImageView);
    v43 = +[UIImageSymbolConfiguration configurationWithPointSize:16.0];
    v44 = +[UIImage systemImageNamed:@"calendar" withConfiguration:v43];
    v45 = [v44 imageWithRenderingMode:2];
    id v46 = [v42 initWithImage:v45];

    [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
    v47 = +[UIColor secondaryLabelColor];
    [v46 setTintColor:v47];

    [v46 setAccessibilityIdentifier:@"DateImageView"];
    v48 = [objc_alloc((Class)UIDatePicker) initWithFrame:CGRectZero.origin.x, y, width, height];
    timePicker = v3->_timePicker;
    v3->_timePicker = v48;

    [(UIDatePicker *)v3->_timePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v3->_timePicker setDatePickerMode:0];
    [(UIDatePicker *)v3->_timePicker setAccessibilityIdentifier:@"TimePicker"];
    [(UIDatePicker *)v3->_timePicker addTarget:v3 action:"_selectedDateDidChange" forControlEvents:4096];
    id v50 = objc_alloc((Class)UIImageView);
    v51 = +[UIImageSymbolConfiguration configurationWithPointSize:16.0];
    v52 = +[UIImage systemImageNamed:@"clock" withConfiguration:v51];
    v53 = [v52 imageWithRenderingMode:2];
    id v54 = [v50 initWithImage:v53];

    [v54 setTranslatesAutoresizingMaskIntoConstraints:0];
    v55 = +[UIColor secondaryLabelColor];
    [v54 setTintColor:v55];

    [v54 setAccessibilityIdentifier:@"TimeImageView"];
    v69[0] = v46;
    v69[1] = v3->_datePicker;
    v56 = +[NSArray arrayWithObjects:v69 count:2];
    uint64_t v57 = [(RoutePlanningTransitTimingControlsView *)v3 _horizontalStackViewWithViews:v56 spacing:4.0];
    datePickerStackView = v3->_datePickerStackView;
    v3->_datePickerStackView = (UIStackView *)v57;

    v68[0] = v54;
    v68[1] = v3->_timePicker;
    v59 = +[NSArray arrayWithObjects:v68 count:2];
    uint64_t v60 = [(RoutePlanningTransitTimingControlsView *)v3 _horizontalStackViewWithViews:v59 spacing:4.0];
    timePickerStackView = v3->_timePickerStackView;
    v3->_timePickerStackView = (UIStackView *)v60;

    [(UIView *)v3->_planningControlsView addSubview:v3->_datePickerStackView];
    [(UIView *)v3->_planningControlsView addSubview:v3->_timePickerStackView];
    v3->_showSchedulingButtons = 1;
    [(RoutePlanningTransitTimingControlsView *)v3 sendSubviewToBack:v3->_planningControlsView];
    [(RoutePlanningTransitTimingControlsView *)v3 _setupInitialConstraints];
    [(RoutePlanningTransitTimingControlsView *)v3 reset];
  }
  return v3;
}

- (id)_horizontalStackViewWithViews:(id)a3 spacing:(double)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v5];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setSpacing:a4];
  [v6 setAxis:0];
  [v6 setDistribution:0];
  [v6 setAlignment:3];

  return v6;
}

- (void)_setupInitialConstraints
{
  id v61 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v60 = [(UISegmentedControl *)self->_timingTypeControl topAnchor];
  v59 = [(RoutePlanningTransitTimingControlsView *)self topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v62[0] = v58;
  uint64_t v57 = [(UISegmentedControl *)self->_timingTypeControl leadingAnchor];
  v56 = [(RoutePlanningTransitTimingControlsView *)self leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v62[1] = v55;
  id v54 = [(RoutePlanningTransitTimingControlsView *)self trailingAnchor];
  v53 = [(UISegmentedControl *)self->_timingTypeControl trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v62[2] = v52;
  v51 = [(UIView *)self->_planningControlsView topAnchor];
  id v50 = [(UISegmentedControl *)self->_timingTypeControl bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:12.0];
  v62[3] = v49;
  v48 = [(UIView *)self->_planningControlsView leadingAnchor];
  v47 = [(RoutePlanningTransitTimingControlsView *)self leadingAnchor];
  id v46 = [v48 constraintEqualToAnchor:v47];
  v62[4] = v46;
  v45 = [(RoutePlanningTransitTimingControlsView *)self trailingAnchor];
  v44 = [(UIView *)self->_planningControlsView trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v62[5] = v43;
  id v42 = [(MapsRadioButton *)self->_leaveAtButton heightAnchor];
  v41 = [(MapsRadioButton *)self->_arriveByButton heightAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v62[6] = v40;
  v39 = [(UIStackView *)self->_radioButtonStackView topAnchor];
  uint64_t v38 = [(UIView *)self->_planningControlsView topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v62[7] = v37;
  v36 = [(UIStackView *)self->_radioButtonStackView leadingAnchor];
  uint64_t v35 = [(UIView *)self->_planningControlsView leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v62[8] = v34;
  v33 = [(UIView *)self->_planningControlsView trailingAnchor];
  uint64_t v32 = [(UIStackView *)self->_radioButtonStackView trailingAnchor];
  v31 = [v33 constraintGreaterThanOrEqualToAnchor:v32];
  v62[9] = v31;
  v30 = [(UIStackView *)self->_datePickerStackView topAnchor];
  uint64_t v29 = [(UIStackView *)self->_radioButtonStackView bottomAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:12.0];
  v62[10] = v28;
  v27 = [(UIStackView *)self->_datePickerStackView leadingAnchor];
  v26 = [(UIView *)self->_planningControlsView leadingAnchor];
  id v25 = [v27 constraintEqualToAnchor:v26];
  v62[11] = v25;
  v24 = [(UIStackView *)self->_timePickerStackView topAnchor];
  uint64_t v23 = [(UIStackView *)self->_datePickerStackView topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v62[12] = v22;
  v21 = [(UIStackView *)self->_timePickerStackView leadingAnchor];
  v3 = [(UIStackView *)self->_datePickerStackView trailingAnchor];
  v4 = [v21 constraintEqualToAnchor:v3 constant:14.0];
  v62[13] = v4;
  id v5 = [(UIView *)self->_planningControlsView trailingAnchor];
  id v6 = [(UIStackView *)self->_timePickerStackView trailingAnchor];
  v7 = [v5 constraintGreaterThanOrEqualToAnchor:v6];
  v62[14] = v7;
  id v8 = [(UIView *)self->_planningControlsView bottomAnchor];
  v9 = [(UIStackView *)self->_datePickerStackView bottomAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v62[15] = v10;
  v11 = +[NSArray arrayWithObjects:v62 count:16];
  [v61 addObjectsFromArray:v11];

  id v12 = [(RoutePlanningTransitTimingControlsView *)self bottomAnchor];
  v13 = [(UISegmentedControl *)self->_timingTypeControl bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  planningControlsHidingConstraint = self->_planningControlsHidingConstraint;
  self->_planningControlsHidingConstraint = v14;

  v16 = [(RoutePlanningTransitTimingControlsView *)self bottomAnchor];
  v17 = [(UIView *)self->_planningControlsView bottomAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];
  planningControlsShowingConstraint = self->_planningControlsShowingConstraint;
  self->_planningControlsShowingConstraint = v18;

  if (self->_showPlanningControls) {
    uint64_t v20 = 40;
  }
  else {
    uint64_t v20 = 32;
  }
  [v61 addObject:*(Class *)((char *)&self->super.super.super.isa + v20)];
  +[NSLayoutConstraint activateConstraints:v61];
}

- (void)reset
{
  id v3 = +[RoutePlanningTiming timingWithDepartureDate:0 departureTimeZone:0 arrivalTimeZone:0];
  [(RoutePlanningTransitTimingControlsView *)self setSelectedTiming:v3];
}

- (void)setSelectedTiming:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_selectedTiming;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedTiming, a3);
      if (v7)
      {
        [(id)v7 timepoint];
        [(MapsRadioButton *)self->_leaveAtButton setSelected:v12 == 0];
        [(id)v7 timepoint];
        [(MapsRadioButton *)self->_arriveByButton setSelected:v11 == 1];
        [(RoutePlanningTransitTimingControlsView *)self _setDatePickerDate];
        [(RoutePlanningTransitTimingControlsView *)self _setDatePickerBoundaries];
        -[UISegmentedControl setSelectedSegmentIndex:](self->_timingTypeControl, "setSelectedSegmentIndex:", [(id)v7 isDepartNow] ^ 1);
        uint64_t v9 = [(id)v7 isDepartNow] ^ 1;
        v10 = self;
      }
      else
      {
        [(MapsRadioButton *)self->_leaveAtButton setSelected:1];
        [(RoutePlanningTransitTimingControlsView *)self _setDatePickerDate];
        [(RoutePlanningTransitTimingControlsView *)self _setDatePickerBoundaries];
        [(UISegmentedControl *)self->_timingTypeControl setSelectedSegmentIndex:0];
        v10 = self;
        uint64_t v9 = 0;
      }
      [(RoutePlanningTransitTimingControlsView *)v10 setShowPlanningControls:v9];
    }
  }
}

- (void)_notifyDidUpdateTiming
{
  id v3 = sub_1005768D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    selectedTiming = self->_selectedTiming;
    int v7 = 138412290;
    unsigned __int8 v8 = selectedTiming;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Notify selected timing is %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(RoutePlanningTransitTimingControlsView *)self changeHandler];

  if (v5)
  {
    unint64_t v6 = [(RoutePlanningTransitTimingControlsView *)self changeHandler];
    ((void (**)(void, RoutePlanningTiming *))v6)[2](v6, self->_selectedTiming);
  }
}

- (void)setShowPlanningControls:(BOOL)a3
{
  if (self->_showPlanningControls != a3)
  {
    BOOL v3 = a3;
    self->_showPlanningControls = a3;
    [(UIView *)self->_planningControlsView setAlpha:(double)a3];
    [(NSLayoutConstraint *)self->_planningControlsShowingConstraint setActive:v3];
    [(NSLayoutConstraint *)self->_planningControlsHidingConstraint setActive:v3 ^ 1];
    [(RoutePlanningTransitTimingControlsView *)self invalidateIntrinsicContentSize];
    id v5 = [(RoutePlanningTransitTimingControlsView *)self layoutHandler];

    if (v5)
    {
      unint64_t v6 = [(RoutePlanningTransitTimingControlsView *)self layoutHandler];
      v6[2](v6, v3);
    }
  }
}

- (void)setShowSchedulingButtons:(BOOL)a3
{
  self->_showSchedulingButtons = a3;
  [(UIStackView *)self->_radioButtonStackView setHidden:!a3];
}

- (void)_planningTypeDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 selectedSegmentIndex])
  {
    id v5 = [(UIDatePicker *)self->_datePicker date];
    unint64_t v6 = [(RoutePlanningTiming *)self->_selectedTiming departureTimeZone];
    int v7 = [(RoutePlanningTiming *)self->_selectedTiming arrivalTimeZone];
    unsigned __int8 v8 = +[RoutePlanningTiming timingWithDepartureDate:v5 departureTimeZone:v6 arrivalTimeZone:v7];
    selectedTiming = self->_selectedTiming;
    self->_selectedTiming = v8;
  }
  else
  {
    v10 = [(RoutePlanningTiming *)self->_selectedTiming departureTimeZone];
    int v11 = [(RoutePlanningTiming *)self->_selectedTiming arrivalTimeZone];
    int v12 = +[RoutePlanningTiming timingWithDepartureDate:0 departureTimeZone:v10 arrivalTimeZone:v11];
    v13 = self->_selectedTiming;
    self->_selectedTiming = v12;

    id v5 = +[MKMapService sharedService];
    [v5 captureUserAction:3030 onTarget:631 eventValue:0];
  }

  [(MapsRadioButton *)self->_leaveAtButton setSelected:1];
  [(RoutePlanningTransitTimingControlsView *)self _setDatePickerDate];
  [(RoutePlanningTransitTimingControlsView *)self _setDatePickerBoundaries];
  id v14 = [v4 selectedSegmentIndex];

  [(RoutePlanningTransitTimingControlsView *)self setShowPlanningControls:v14 != 0];

  [(RoutePlanningTransitTimingControlsView *)self _notifyDidUpdateTiming];
}

- (void)_toggleChanged:(id)a3
{
  id v4 = (MapsRadioButton *)a3;
  [(RoutePlanningTransitTimingControlsView *)self _setDatePickerBoundaries];
  [(RoutePlanningTransitTimingControlsView *)self _computeSelectedTiming];
  [(RoutePlanningTransitTimingControlsView *)self _setDatePickerDate];
  leaveAtButton = self->_leaveAtButton;

  if (leaveAtButton == v4) {
    uint64_t v6 = 3028;
  }
  else {
    uint64_t v6 = 3029;
  }
  int v7 = +[MKMapService sharedService];
  [v7 captureUserAction:v6 onTarget:631 eventValue:0];

  [(RoutePlanningTransitTimingControlsView *)self _notifyDidUpdateTiming];
}

- (void)_computeSelectedTiming
{
  BOOL v3 = +[NSCalendar currentCalendar];
  id v4 = [(UIDatePicker *)self->_datePicker date];
  id v5 = [v3 components:28 fromDate:v4];

  uint64_t v6 = [(UIDatePicker *)self->_timePicker date];
  int v7 = [v3 components:96 fromDate:v6];

  unsigned __int8 v8 = [v3 dateFromComponents:v5];
  uint64_t v9 = [v3 dateByAddingComponents:v7 toDate:v8 options:0];

  v10 = sub_1005768D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Computed date is %@", (uint8_t *)&v16, 0xCu);
  }

  unsigned int v11 = [(MapsRadioButton *)self->_leaveAtButton isSelected];
  int v12 = [(RoutePlanningTiming *)self->_selectedTiming departureTimeZone];
  v13 = [(RoutePlanningTiming *)self->_selectedTiming arrivalTimeZone];
  if (v11) {
    +[RoutePlanningTiming timingWithDepartureDate:v9 departureTimeZone:v12 arrivalTimeZone:v13];
  }
  else {
  id v14 = +[RoutePlanningTiming timingWithArrivalDate:v9 departureTimeZone:v12 arrivalTimeZone:v13];
  }
  selectedTiming = self->_selectedTiming;
  self->_selectedTiming = v14;
}

- (void)_selectedDateDidChange
{
  [(RoutePlanningTransitTimingControlsView *)self _computeSelectedTiming];
  if (sub_1000BBB44(self) == 5) {
    [(RoutePlanningTransitTimingControlsView *)self _setDatePickerDate];
  }
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:3031 onTarget:631 eventValue:0];

  [(RoutePlanningTransitTimingControlsView *)self _notifyDidUpdateTiming];
}

- (void)_setDatePickerDate
{
  unsigned int v3 = [(MapsRadioButton *)self->_leaveAtButton isSelected];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  timePicker = self->_timePicker;
  v19[0] = self->_datePicker;
  v19[1] = timePicker;
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2, 0);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v11 = [(RoutePlanningTransitTimingControlsView *)self selectedTiming];
        int v12 = v11;
        if (v3) {
          [v11 departureDate];
        }
        else {
        v13 = [v11 arrivalDate];
        }
        if (v13)
        {
          [v10 setDate:v13];
        }
        else
        {
          id v14 = objc_opt_new();
          [v10 setDate:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_setDatePickerBoundaries
{
  unsigned int v3 = [(MapsRadioButton *)self->_leaveAtButton isSelected];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  timePicker = self->_timePicker;
  v23[0] = self->_datePicker;
  v23[1] = timePicker;
  id obj = +[NSArray arrayWithObjects:v23 count:2];
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v10 = [(RoutePlanningTransitTimingControlsView *)self selectedTiming];
        unsigned int v11 = v10;
        if (v3) {
          [v10 departureTimeZone];
        }
        else {
        int v12 = [v10 arrivalTimeZone];
        }
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = +[NSTimeZone localTimeZone];
        }
        long long v15 = v14;

        [v9 setTimeZone:v15];
        long long v16 = +[NSDate _maps_minimumDateForRoutePlanningWithTimeZone:v15];
        [v9 setMinimumDate:v16];

        long long v17 = +[NSDate _maps_maximumDateForRoutePlanning];
        [v9 setMaximumDate:v17];
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

- (RoutePlanningTiming)selectedTiming
{
  return self->_selectedTiming;
}

- (BOOL)showsSchedulingButtons
{
  return self->_showSchedulingButtons;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (id)layoutHandler
{
  return self->_layoutHandler;
}

- (void)setLayoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutHandler, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_selectedTiming, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_timePickerStackView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_datePickerStackView, 0);
  objc_storeStrong((id *)&self->_arriveByButton, 0);
  objc_storeStrong((id *)&self->_arriveByStackView, 0);
  objc_storeStrong((id *)&self->_leaveAtButton, 0);
  objc_storeStrong((id *)&self->_leaveAtStackView, 0);
  objc_storeStrong((id *)&self->_radioButtonStackView, 0);
  objc_storeStrong((id *)&self->_planningControlsShowingConstraint, 0);
  objc_storeStrong((id *)&self->_planningControlsHidingConstraint, 0);
  objc_storeStrong((id *)&self->_planningControlsView, 0);

  objc_storeStrong((id *)&self->_timingTypeControl, 0);
}

@end