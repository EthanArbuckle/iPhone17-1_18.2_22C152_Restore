@interface RoutePlanningTimingViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)_shouldShowCompact;
- (BOOL)isLeavingNow;
- (BOOL)shouldShowArriveBy;
- (NSTimeZone)destinationTimeZone;
- (NSTimeZone)originTimeZone;
- (RoutePlanningTimingViewController)initWithCurrentTiming:(id)a3 shouldShowArriveBy:(BOOL)a4 pickerDelegate:(id)a5;
- (RoutePlanningTimingViewControllerDelegate)pickerDelegate;
- (id)_currentTiming;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_pressedDone;
- (void)_pressedLeaveNow;
- (void)_pressedSegmentControl;
- (void)_selectedDate;
- (void)_updateDatePicker;
- (void)_updateSegmentControl;
- (void)handleDismissAction:(id)a3;
- (void)setDestinationTimeZone:(id)a3;
- (void)setLeavingNow:(BOOL)a3;
- (void)setOriginTimeZone:(id)a3;
- (void)setShowArriveBy:(BOOL)a3;
- (void)setShowArriveBy:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RoutePlanningTimingViewController

- (RoutePlanningTimingViewController)initWithCurrentTiming:(id)a3 shouldShowArriveBy:(BOOL)a4 pickerDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RoutePlanningTimingViewController;
  v10 = [(RoutePlanningTimingViewController *)&v22 initWithNibName:0 bundle:0];
  if (v10)
  {
    v11 = [v8 arrivalDate];
    v12 = v11;
    if (!v11)
    {
      v12 = [v8 departureDate];
    }
    objc_storeStrong((id *)&v10->_originalDate, v12);
    if (!v11) {

    }
    v13 = [v8 arrivalDate];
    v10->_isLeaveAt = v13 == 0;

    uint64_t v14 = [v8 departureTimeZone];
    originTimeZone = v10->_originTimeZone;
    v10->_originTimeZone = (NSTimeZone *)v14;

    uint64_t v16 = [v8 arrivalTimeZone];
    destinationTimeZone = v10->_destinationTimeZone;
    v10->_destinationTimeZone = (NSTimeZone *)v16;

    v10->_showArriveBy = a4;
    objc_storeWeak((id *)&v10->_pickerDelegate, v9);
    v18 = [(ContaineeViewController *)v10 cardPresentationController];
    [v18 setPresentedModally:1];

    v19 = [(ContaineeViewController *)v10 cardPresentationController];
    [v19 setTakesAvailableHeight:1];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v10 selector:"_keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];
  }
  return v10;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v128.receiver = self;
  v128.super_class = (Class)RoutePlanningTimingViewController;
  [(ContaineeViewController *)&v128 viewDidLoad];
  v3 = objc_opt_new();
  v127 = objc_opt_new();
  v126 = objc_opt_new();
  v4 = [ModalCardHeaderView alloc];
  v5 = +[ModalCardHeaderConfiguration routePlanningTimingPickerConfiguration];
  v6 = [(ModalCardHeaderView *)v4 initWithConfiguration:v5];

  [(ModalCardHeaderView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ModalCardHeaderView *)v6 setUseAdaptiveFont:1];
  v7 = [(ModalCardHeaderView *)v6 leadingButton];
  id v8 = sub_100AEBD5C();
  [v7 setTitle:v8 forState:0];

  id v9 = [(ModalCardHeaderView *)v6 leadingButton];
  [v9 addTarget:self action:"handleDismissAction:" forControlEvents:64];

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"[RoutePlanning][Timing] Date & Time" value:nil table:nil];
  v12 = [(ModalCardHeaderView *)v6 titleLabel];
  [v12 setText:v11];

  v13 = [(ModalCardHeaderView *)v6 titleLabel];
  [v13 setTextAlignment:1];

  uint64_t v14 = [(ModalCardHeaderView *)v6 trailingButton];
  v15 = sub_100AEBE94();
  [v14 setTitle:v15 forState:0];

  uint64_t v16 = [(ModalCardHeaderView *)v6 trailingButton];
  [v16 addTarget:self action:"_pressedDone" forControlEvents:64];

  v17 = [(ContaineeViewController *)self headerView];
  [v17 addSubview:v6];

  v18 = [(ModalCardHeaderView *)v6 leadingAnchor];
  v19 = [(ContaineeViewController *)self headerView];
  v20 = [v19 leadingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  objc_super v22 = [(ModalCardHeaderView *)v6 trailingAnchor];
  v23 = [(ContaineeViewController *)self headerView];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v3 addObject:v25];

  v26 = [(ModalCardHeaderView *)v6 topAnchor];
  v27 = [(ContaineeViewController *)self headerView];
  v28 = [v27 topAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v3 addObject:v29];

  v30 = [(ModalCardHeaderView *)v6 bottomAnchor];
  v31 = [(ContaineeViewController *)self headerView];
  v32 = [v31 bottomAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v3 addObject:v33];

  v34 = (UIScrollView *)objc_opt_new();
  scrollView = self->_scrollView;
  self->_scrollView = v34;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  v36 = [(ContaineeViewController *)self contentView];
  [v36 addSubview:self->_scrollView];

  v37 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v38 = [(ContaineeViewController *)self contentView];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v3 addObject:v40];

  v41 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v42 = [(ContaineeViewController *)self contentView];
  v43 = [v42 trailingAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v3 addObject:v44];

  v45 = [(UIScrollView *)self->_scrollView topAnchor];
  v46 = [(ContaineeViewController *)self contentView];
  v47 = [v46 topAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  [v3 addObject:v48];

  v49 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v50 = [(ContaineeViewController *)self contentView];
  v51 = [v50 bottomAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  [v3 addObject:v52];

  v53 = +[NSBundle mainBundle];
  v54 = [v53 localizedStringForKey:@"[RoutePlanning][TimingPicker] Leave at" value:@"localized string not found" table:0];
  v129[0] = v54;
  v55 = +[NSBundle mainBundle];
  v56 = [v55 localizedStringForKey:@"[RoutePlanning][TimingPicker] Arrive by" value:@"localized string not found" table:0];
  v129[1] = v56;
  v125 = +[NSArray arrayWithObjects:v129 count:2];

  v57 = (UISegmentedControl *)[objc_alloc((Class)UISegmentedControl) initWithItems:v125];
  segmentControl = self->_segmentControl;
  self->_segmentControl = v57;

  [(UISegmentedControl *)self->_segmentControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RoutePlanningTimingViewController *)self _updateSegmentControl];
  [(UISegmentedControl *)self->_segmentControl addTarget:self action:"_pressedSegmentControl" forControlEvents:4096];
  [(UIScrollView *)self->_scrollView addSubview:self->_segmentControl];
  v59 = [(UISegmentedControl *)self->_segmentControl leadingAnchor];
  v60 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60 constant:16.0];
  [v3 addObject:v61];

  v62 = [(UISegmentedControl *)self->_segmentControl trailingAnchor];
  v63 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v64 = [v62 constraintEqualToAnchor:v63 constant:-16.0];
  [v3 addObject:v64];

  v65 = [(UISegmentedControl *)self->_segmentControl topAnchor];
  v66 = [(UIScrollView *)self->_scrollView topAnchor];
  v67 = [v65 constraintEqualToAnchor:v66 constant:16.0];
  [v127 addObject:v67];

  v68 = [(UISegmentedControl *)self->_segmentControl bottomAnchor];
  v69 = [(UIScrollView *)self->_scrollView topAnchor];
  v70 = [v68 constraintEqualToAnchor:v69 constant:0.0];
  [v126 addObject:v70];

  [(UISegmentedControl *)self->_segmentControl setSelectedSegmentIndex:!self->_isLeaveAt];
  v71 = (UIDatePicker *)objc_opt_new();
  datePicker = self->_datePicker;
  self->_datePicker = v71;

  [(UIDatePicker *)self->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIDatePicker *)self->_datePicker addTarget:self action:"_selectedDate" forControlEvents:4096];
  [(UIDatePicker *)self->_datePicker setRoundsToMinuteInterval:0];
  [(UIDatePicker *)self->_datePicker setMinuteInterval:1];
  [(UIDatePicker *)self->_datePicker setDate:self->_originalDate];
  v73 = +[NSDate _maps_maximumDateForRoutePlanning];
  [(UIDatePicker *)self->_datePicker setMaximumDate:v73];

  [(UIDatePicker *)self->_datePicker _setContinuousCornerRadius:10.0];
  v74 = [(UIDatePicker *)self->_datePicker layer];
  [v74 setMasksToBounds:1];

  [(UIScrollView *)self->_scrollView addSubview:self->_datePicker];
  v75 = [(UIDatePicker *)self->_datePicker widthAnchor];
  v76 = [(RoutePlanningTimingViewController *)self view];
  v77 = [v76 widthAnchor];
  v78 = [v75 constraintEqualToAnchor:v77 constant:-32.0];
  datePickerWidthConstraint = self->_datePickerWidthConstraint;
  self->_datePickerWidthConstraint = v78;

  v80 = [(UIDatePicker *)self->_datePicker leadingAnchor];
  v81 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v82 = [v80 constraintEqualToAnchor:v81 constant:16.0];
  [v3 addObject:v82];

  v83 = [(UIDatePicker *)self->_datePicker trailingAnchor];
  v84 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v85 = [v83 constraintLessThanOrEqualToAnchor:v84 constant:-16.0];
  [v3 addObject:v85];

  v86 = [(UIDatePicker *)self->_datePicker topAnchor];
  v87 = [(UISegmentedControl *)self->_segmentControl bottomAnchor];
  v88 = [v86 constraintEqualToAnchor:v87 constant:16.0];
  [v127 addObject:v88];

  v89 = [(UIDatePicker *)self->_datePicker topAnchor];
  v90 = [(UIScrollView *)self->_scrollView topAnchor];
  v91 = [v89 constraintEqualToAnchor:v90 constant:16.0];
  [v126 addObject:v91];

  v92 = (UIButton *)objc_opt_new();
  leaveNowButton = self->_leaveNowButton;
  self->_leaveNowButton = v92;

  [(UIButton *)self->_leaveNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_leaveNowButton addTarget:self action:"_pressedLeaveNow" forControlEvents:64];
  v94 = +[UIColor secondarySystemGroupedBackgroundColor];
  [(UIButton *)self->_leaveNowButton setBackgroundColor:v94];

  [(UIButton *)self->_leaveNowButton _setContinuousCornerRadius:10.0];
  [(UIButton *)self->_leaveNowButton setContentHorizontalAlignment:4];
  -[UIButton setTitleEdgeInsets:](self->_leaveNowButton, "setTitleEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  v95 = self->_leaveNowButton;
  v96 = +[NSBundle mainBundle];
  v97 = [v96 localizedStringForKey:@"[RoutePlanning][Timing] Leave Now" value:@"localized string not found" table:0];
  [(UIButton *)v95 setTitle:v97 forState:0];

  v98 = self->_leaveNowButton;
  v99 = +[UIColor systemBlueColor];
  [(UIButton *)v98 setTitleColor:v99 forState:0];

  v100 = self->_leaveNowButton;
  v101 = +[UIColor systemDarkGrayColor];
  [(UIButton *)v100 setTitleColor:v101 forState:2];

  [(UIScrollView *)self->_scrollView addSubview:self->_leaveNowButton];
  v102 = [(UIButton *)self->_leaveNowButton leadingAnchor];
  v103 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v104 = [v102 constraintEqualToAnchor:v103 constant:16.0];
  [v3 addObject:v104];

  v105 = [(UIButton *)self->_leaveNowButton trailingAnchor];
  v106 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v107 = [v105 constraintEqualToAnchor:v106 constant:-16.0];
  [v3 addObject:v107];

  v108 = [(UIButton *)self->_leaveNowButton topAnchor];
  v109 = [(UIDatePicker *)self->_datePicker bottomAnchor];
  v110 = [v108 constraintEqualToAnchor:v109 constant:16.0];
  [v3 addObject:v110];

  v111 = [(UIButton *)self->_leaveNowButton bottomAnchor];
  v112 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v113 = [v111 constraintEqualToAnchor:v112 constant:-16.0];
  [v3 addObject:v113];

  v114 = [(UIButton *)self->_leaveNowButton widthAnchor];
  v115 = [(RoutePlanningTimingViewController *)self view];
  v116 = [v115 widthAnchor];
  v117 = [v114 constraintEqualToAnchor:v116 constant:-32.0];
  [v3 addObject:v117];

  v118 = [(UIButton *)self->_leaveNowButton heightAnchor];
  v119 = [v118 constraintGreaterThanOrEqualToConstant:50.0];
  [v3 addObject:v119];

  v120 = (NSArray *)[v127 copy];
  constraintsShowingArriveBy = self->_constraintsShowingArriveBy;
  self->_constraintsShowingArriveBy = v120;

  v122 = (NSArray *)[v126 copy];
  constraintsHidingArriveBy = self->_constraintsHidingArriveBy;
  self->_constraintsHidingArriveBy = v122;

  [(UISegmentedControl *)self->_segmentControl setHidden:!self->_showArriveBy];
  if (self->_showArriveBy) {
    uint64_t v124 = 168;
  }
  else {
    uint64_t v124 = 176;
  }
  [v3 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.isa + v124)];
  +[NSLayoutConstraint activateConstraints:v3];
  [(RoutePlanningTimingViewController *)self _updateDatePicker];
  [(RoutePlanningTimingViewController *)self setLeavingNow:self->_originalDate == 0];
}

- (void)setShowArriveBy:(BOOL)a3
{
}

- (void)setShowArriveBy:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showArriveBy != a3)
  {
    BOOL v4 = a4;
    self->_showArriveBy = a3;
    if (!a3 && !self->_isLeaveAt)
    {
      self->_isLeaveAt = 1;
      [(RoutePlanningTimingViewController *)self _updateDatePicker];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D40834;
    v11[3] = &unk_1012E5D08;
    v11[4] = self;
    v6 = objc_retainBlock(v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D408D8;
    v10[3] = &unk_1012E7D28;
    v10[4] = self;
    v7 = objc_retainBlock(v10);
    if (v4)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100D40904;
      v8[3] = &unk_1012E5F78;
      v8[4] = self;
      id v9 = v6;
      +[UIView animateWithDuration:v8 animations:v7 completion:UINavigationControllerHideShowBarDuration];
    }
    else
    {
      ((void (*)(void *))v6[2])(v6);
      ((void (*)(void *, uint64_t))v7[2])(v7, 1);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningTimingViewController;
  [(MapsThemeViewController *)&v4 traitCollectionDidChange:a3];
  [(RoutePlanningTimingViewController *)self _updateDatePicker];
  [(RoutePlanningTimingViewController *)self _updateSegmentControl];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningTimingViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(UIDatePicker *)self->_datePicker setMinuteInterval:5];
}

- (void)_updateDatePicker
{
  unsigned int v3 = [(RoutePlanningTimingViewController *)self _shouldShowCompact];
  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  [(UIDatePicker *)self->_datePicker setPreferredDatePickerStyle:v4];
  if (v3) {
    +[UIColor clearColor];
  }
  else {
  v5 = +[UIColor secondarySystemGroupedBackgroundColor];
  }
  [(UIDatePicker *)self->_datePicker setBackgroundColor:v5];

  [(NSLayoutConstraint *)self->_datePickerWidthConstraint setActive:v3 ^ 1];
  if (self->_isLeaveAt) {
    [(RoutePlanningTimingViewController *)self originTimeZone];
  }
  else {
  id v7 = [(RoutePlanningTimingViewController *)self destinationTimeZone];
  }
  [(UIDatePicker *)self->_datePicker setTimeZone:v7];
  v6 = +[NSDate _maps_minimumDateForRoutePlanningWithTimeZone:v7];
  [(UIDatePicker *)self->_datePicker setMinimumDate:v6];
}

- (void)_updateSegmentControl
{
  unsigned int v3 = [(RoutePlanningTimingViewController *)self traitCollection];
  uint64_t v4 = [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline compatibleWithTraitCollection:v4];

  segmentControl = self->_segmentControl;
  NSAttributedStringKey v8 = NSFontAttributeName;
  id v9 = v5;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [(UISegmentedControl *)segmentControl setTitleTextAttributes:v7 forState:0];
}

- (void)setLeavingNow:(BOOL)a3
{
  if (self->_leavingNow != a3)
  {
    self->_leavingNow = a3;
    [(UIButton *)self->_leaveNowButton setEnabled:!a3];
  }
}

- (NSTimeZone)originTimeZone
{
  originTimeZone = self->_originTimeZone;
  if (!originTimeZone)
  {
    uint64_t v4 = +[NSTimeZone localTimeZone];
    v5 = self->_originTimeZone;
    self->_originTimeZone = v4;

    originTimeZone = self->_originTimeZone;
  }

  return originTimeZone;
}

- (void)setOriginTimeZone:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_originTimeZone;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_originTimeZone, a3);
      [(RoutePlanningTimingViewController *)self _updateDatePicker];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (NSTimeZone)destinationTimeZone
{
  destinationTimeZone = self->_destinationTimeZone;
  if (!destinationTimeZone)
  {
    uint64_t v4 = +[NSTimeZone localTimeZone];
    id v5 = self->_destinationTimeZone;
    self->_destinationTimeZone = v4;

    destinationTimeZone = self->_destinationTimeZone;
  }

  return destinationTimeZone;
}

- (void)setDestinationTimeZone:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_destinationTimeZone;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_destinationTimeZone, a3);
      [(RoutePlanningTimingViewController *)self _updateDatePicker];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (id)_currentTiming
{
  BOOL isLeaveAt = self->_isLeaveAt;
  uint64_t v4 = [(UIDatePicker *)self->_datePicker date];
  id v5 = [(RoutePlanningTimingViewController *)self originTimeZone];
  unint64_t v6 = [(RoutePlanningTimingViewController *)self destinationTimeZone];
  if (isLeaveAt) {
    +[RoutePlanningTiming timingWithDepartureDate:v4 departureTimeZone:v5 arrivalTimeZone:v6];
  }
  else {
  unint64_t v7 = +[RoutePlanningTiming timingWithArrivalDate:v4 departureTimeZone:v5 arrivalTimeZone:v6];
  }

  return v7;
}

- (BOOL)_shouldShowCompact
{
  v2 = [(RoutePlanningTimingViewController *)self traitCollection];
  BOOL v3 = [v2 verticalSizeClass] == (id)1;

  return v3;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v22 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];

  if (v22)
  {
    [v22 CGRectValue];
    -[UIScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", 0);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(UIScrollView *)self->_scrollView bounds];
    double Height = CGRectGetHeight(v24);
    v25.origin.double x = v6;
    v25.origin.double y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    double v14 = Height - CGRectGetMinY(v25);
    if (v14 > 0.0)
    {
      -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, v14, 0.0);
      [(UIDatePicker *)self->_datePicker frame];
      scrollView = self->_scrollView;
      double x = 0.0;
      goto LABEL_7;
    }
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", top, left, bottom, right);
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  scrollView = self->_scrollView;
LABEL_7:
  -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", x, y);
}

- (void)handleDismissAction:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 dismiss:1];
}

- (void)_pressedDone
{
  +[GEOAPPortal captureUserAction:17 target:631 value:0];
  unsigned int v3 = [(RoutePlanningTimingViewController *)self isLeavingNow];
  uint64_t v4 = [(RoutePlanningTimingViewController *)self pickerDelegate];
  if (v3) {
    +[RoutePlanningTiming leaveNowTiming];
  }
  else {
  double v5 = [(RoutePlanningTimingViewController *)self _currentTiming];
  }
  [v4 timingViewController:self didPickTiming:v5];

  id v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 dismiss:1];
}

- (void)_pressedSegmentControl
{
  BOOL v3 = [(UISegmentedControl *)self->_segmentControl selectedSegmentIndex] == 0;
  self->_BOOL isLeaveAt = v3;
  if (v3) {
    uint64_t v4 = 3028;
  }
  else {
    uint64_t v4 = 3029;
  }
  +[GEOAPPortal captureUserAction:v4 target:631 value:0];

  [(RoutePlanningTimingViewController *)self _updateDatePicker];
}

- (void)_selectedDate
{
  +[GEOAPPortal captureUserAction:3031 target:631 value:0];

  [(RoutePlanningTimingViewController *)self setLeavingNow:0];
}

- (void)_pressedLeaveNow
{
  +[GEOAPPortal captureUserAction:3030 target:631 value:0];
  [(UISegmentedControl *)self->_segmentControl setSelectedSegmentIndex:0];
  self->_BOOL isLeaveAt = 1;
  BOOL v3 = objc_opt_new();
  [(UIDatePicker *)self->_datePicker setDate:v3];

  [(RoutePlanningTimingViewController *)self setLeavingNow:1];

  [(RoutePlanningTimingViewController *)self _updateDatePicker];
}

- (RoutePlanningTimingViewControllerDelegate)pickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);

  return (RoutePlanningTimingViewControllerDelegate *)WeakRetained;
}

- (BOOL)shouldShowArriveBy
{
  return self->_showArriveBy;
}

- (BOOL)isLeavingNow
{
  return self->_leavingNow;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pickerDelegate);
  objc_storeStrong((id *)&self->_destinationTimeZone, 0);
  objc_storeStrong((id *)&self->_originTimeZone, 0);
  objc_storeStrong((id *)&self->_constraintsHidingArriveBy, 0);
  objc_storeStrong((id *)&self->_constraintsShowingArriveBy, 0);
  objc_storeStrong((id *)&self->_datePickerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leaveNowButton, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_segmentControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_originalDate, 0);
}

@end