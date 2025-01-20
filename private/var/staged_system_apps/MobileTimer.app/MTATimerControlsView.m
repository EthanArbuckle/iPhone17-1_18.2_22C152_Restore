@interface MTATimerControlsView
+ (double)barWidthForStyle:(unint64_t)a3;
+ (double)estimatedCountdownViewHeight;
+ (double)estimatedElementSpacing;
+ (double)estimatedNonCountdownElementHeight;
+ (double)estimatedNonCountdownElementHeightWithSpacing;
+ (double)estimatedTimePickerHeight;
+ (double)estimatedTonePickerHeight;
+ (double)estimatedViewHeight;
+ (double)estimatedViewWidth;
- (BOOL)edited;
- (BOOL)isIpadAddSheet;
- (BOOL)isNewTimer;
- (BOOL)isRunningInThirdSplitView;
- (BOOL)isRunningTimer;
- (BOOL)shouldSetupConstraintsAtLayout;
- (BOOL)stateNeedsReset;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (MTALabelEditCell)editLabelCell;
- (MTATimerCollectionControlButton)pauseResumeButton;
- (MTATimerCollectionControlButton)stopButton;
- (MTATimerControlsView)initWithDelegate:(id)a3 style:(unint64_t)a4 timerControlState:(unint64_t)a5;
- (NSArray)constraints;
- (NSLayoutConstraint)tableWidthConstraint;
- (NSLayoutConstraint)timerCountdownWidthConstraint;
- (NSMutableArray)layoutGuides;
- (NSMutableArray)tableRows;
- (TimerControlsTarget)delegate;
- (double)compactSizeFont;
- (double)countDownDuration;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)currentDateProvider;
- (id)displayTitle;
- (id)getCurrentLabel;
- (id)iPadSingleCellNewTimerConstraints;
- (id)setupCollectionViewConstraints;
- (id)setupCompactNewTimerConstraints;
- (id)setupMultipleTimerConstraints;
- (id)setupSingleTimerConstraints;
- (id)styleSpecificConstraints;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)state;
- (unint64_t)style;
- (unint64_t)timerControlState;
- (void)_addLayoutGuide:(id)a3;
- (void)_configureAndAddButton:(id)a3;
- (void)applyBackgroundColor:(id)a3;
- (void)buildTableRowsWithStyle:(unint64_t)a3;
- (void)deleteRecent;
- (void)greyOutExpectedTime;
- (void)handleContentSizeChange;
- (void)handleLocaleChange;
- (void)hideExpectedTime;
- (void)layoutSubviews;
- (void)pauseResumeTimer;
- (void)pickerView:(id)a3 didChangeSelectedDuration:(double)a4;
- (void)processCountdownState:(unint64_t)a3 previousState:(unint64_t)a4 remainingTime:(double)a5 duration:(double)a6 forceRefresh:(BOOL)a7;
- (void)resetLayout;
- (void)resetLayoutGuides;
- (void)setButtonControlViewsHidden:(BOOL)a3;
- (void)setButtonSize:(unint64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setControlsViewDelegate:(id)a3;
- (void)setCountDownDuration:(double)a3;
- (void)setCurrentLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDurationTime:(double)a3 title:(id)a4;
- (void)setEditLabelCell:(id)a3;
- (void)setEdited:(BOOL)a3;
- (void)setIsNewTimer:(BOOL)a3;
- (void)setLayoutGuides:(id)a3;
- (void)setPauseResumeButton:(id)a3;
- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animate:(BOOL)a4;
- (void)setStateNeedsReset:(BOOL)a3;
- (void)setStopButton:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3 forceRefresh:(BOOL)a4;
- (void)setTableRows:(id)a3;
- (void)setTableWidthConstraint:(id)a3;
- (void)setTime:(double)a3;
- (void)setTimerControlState:(unint64_t)a3;
- (void)setTimerCountdownWidthConstraint:(id)a3;
- (void)setTimerToneName:(id)a3;
- (void)setupCellButtons;
- (void)setupConstraints;
- (void)setupTimeView;
- (void)setupTimerNameLabelForTimerStyle:(unint64_t)a3 withFontStyle:(id)a4;
- (void)showExpectedTimeWithRemainingTime:(double)a3;
- (void)startRecent;
- (void)stopTimer;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updatePauseResumeButtonWithState:(unint64_t)a3;
@end

@implementation MTATimerControlsView

- (MTATimerControlsView)initWithDelegate:(id)a3 style:(unint64_t)a4 timerControlState:(unint64_t)a5
{
  id v8 = a3;
  v75.receiver = self;
  v75.super_class = (Class)MTATimerControlsView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = -[MTATimerControlsView initWithFrame:](&v75, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v8);
    [(MTATimerControlsView *)v13 setTimerControlState:a5];
    v14 = [[MTATimerButtonsController alloc] initWithTarget:v8];
    buttonsController = v13->_buttonsController;
    v13->_buttonsController = v14;

    [(MTATimerControlsView *)v13 buildTableRowsWithStyle:a4];
    uint64_t v16 = +[NSMutableArray array];
    layoutGuides = v13->_layoutGuides;
    v13->_layoutGuides = (NSMutableArray *)v16;

    v18 = +[UIColor mtui_backgroundColor];
    [(MTATimerControlsView *)v13 setBackgroundColor:v18];

    uint64_t v19 = +[UIColor colorWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.32];
    uint64_t v20 = +[UIColor systemOrangeColor];
    id v21 = objc_alloc((Class)MTUITimerCountdownView);
    [(id)objc_opt_class() barWidthForStyle:a4];
    v22 = [v21 initWithBarColor:v20 backgroundBarColor:v19 barWidth:];
    countdownView = v13->_countdownView;
    v13->_countdownView = v22;

    [(MTATimerControlsView *)v13 addSubview:v13->_countdownView];
    [(MTUITimerCountdownView *)v13->_countdownView setTranslatesAutoresizingMaskIntoConstraints:0];
    v73 = (void *)v20;
    v74 = (void *)v19;
    if (a4 - 3 > 4) {
      v24 = (id *)&UIFontTextStyleTitle3;
    }
    else {
      v24 = (id *)*(&off_1000A1E00 + a4 - 3);
    }
    id v25 = *v24;
    [(MTATimerControlsView *)v13 setupTimerNameLabelForTimerStyle:a4 withFontStyle:v25];
    id v26 = objc_alloc((Class)MTUIGlyphTimeView);
    v27 = +[UIFont preferredFontForTextStyle:v25];
    v28 = +[UIColor mtui_secondaryTextColor];
    v29 = (MTUIGlyphTimeView *)[v26 initWithFont:v27 textColor:v28 glyphName:@"bell.fill" style:a4];
    expectedTimeView = v13->_expectedTimeView;
    v13->_expectedTimeView = v29;

    [(MTATimerControlsView *)v13 addSubview:v13->_expectedTimeView];
    [(MTUIGlyphTimeView *)v13->_expectedTimeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = -[MTATimerIntervalPickerView initWithFrame:]([MTATimerIntervalPickerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    timePicker = v13->_timePicker;
    v13->_timePicker = v31;

    [(MTATimerIntervalPickerView *)v13->_timePicker setDelegate:v13];
    [(MTATimerControlsView *)v13 addSubview:v13->_timePicker];
    v33 = +[UIColor clearColor];
    [(MTATimerIntervalPickerView *)v13->_timePicker setBackgroundColor:v33];

    [(MTATimerIntervalPickerView *)v13->_timePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [[MTATimerPickerCell alloc] initWithPicker:v13->_timePicker timeView:v13->_timeView expectedTimeView:v13->_expectedTimeView countdownView:v13->_countdownView reuseIdentifier:@"PICKER"];
    pickerCell = v13->_pickerCell;
    v13->_pickerCell = v34;

    v36 = [[MTATimerTonePickerCell alloc] initWithStyle:1 reuseIdentifier:@"TONE"];
    toneChooserCell = v13->_toneChooserCell;
    v13->_toneChooserCell = &v36->super.super;

    v38 = sub_1000456C8();
    v39 = [(UITableViewCell *)v13->_toneChooserCell textLabel];
    [v39 setFont:v38];

    v40 = [(UITableViewCell *)v13->_toneChooserCell detailTextLabel];
    [v40 setFont:v38];

    [(UITableViewCell *)v13->_toneChooserCell setAccessoryType:1];
    v41 = +[UIColor mtui_primaryTextColor];
    v42 = [(UITableViewCell *)v13->_toneChooserCell textLabel];
    [v42 setTextColor:v41];

    v43 = +[UIColor mtui_secondaryTextColor];
    v44 = [(UITableViewCell *)v13->_toneChooserCell detailTextLabel];
    [v44 setTextColor:v43];

    v45 = v13->_toneChooserCell;
    v46 = +[UIColor mtui_cellHighlightColor];
    [(UITableViewCell *)v45 setSelectedBackgroundColor:v46];

    v47 = +[NSBundle mainBundle];
    v48 = [v47 localizedStringForKey:@"WHEN_TIMER_ENDS" value:&stru_1000A2560 table:0];
    v49 = [(UITableViewCell *)v13->_toneChooserCell textLabel];
    [v49 setText:v48];

    v50 = [(UITableViewCell *)v13->_toneChooserCell textLabel];
    [v50 setAdjustsFontForContentSizeCategory:1];

    v51 = [(UITableViewCell *)v13->_toneChooserCell textLabel];
    [v51 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];

    v52 = [(UITableViewCell *)v13->_toneChooserCell detailTextLabel];
    [v52 setAdjustsFontForContentSizeCategory:1];

    v53 = [(UITableViewCell *)v13->_toneChooserCell detailTextLabel];
    [v53 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    -[UITableViewCell setSeparatorInset:](v13->_toneChooserCell, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    v57 = [MTALabelEditCell alloc];
    v58 = [(MTATimerControlsView *)v13 displayTitle];
    v59 = [(MTATimerControlsView *)v13 getCurrentLabel];
    v60 = -[MTALabelEditCell initWithDelegate:currentTitle:isEmpty:](v57, "initWithDelegate:currentTitle:isEmpty:", v8, v58, [v59 length] == 0);
    editLabelCell = v13->_editLabelCell;
    v13->_editLabelCell = v60;

    v62 = v13->_editLabelCell;
    v63 = +[UIColor mtui_buttonBackgroundColor];
    [(MTALabelEditCell *)v62 setBackgroundColor:v63];

    v64 = v13->_editLabelCell;
    v65 = sub_1000456C8();
    [(MTALabelEditCell *)v64 setFont:v65];

    v66 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, y, width, height];
    tableView = v13->_tableView;
    v13->_tableView = v66;

    [(UITableView *)v13->_tableView setDataSource:v13];
    [(UITableView *)v13->_tableView setDelegate:v13];
    [(UITableView *)v13->_tableView setScrollEnabled:0];
    [(UITableView *)v13->_tableView setLayoutMarginsFollowReadableWidth:1];
    -[UITableView setSeparatorInset:](v13->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    [(UITableView *)v13->_tableView setEstimatedRowHeight:52.0];
    [(UITableView *)v13->_tableView setRowHeight:52.0];
    [(MTATimerControlsView *)v13 addSubview:v13->_tableView];
    [(UITableView *)v13->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    v68 = [(UITableView *)v13->_tableView layer];
    [v68 setCornerRadius:10.0];

    [(MTATimerControlsView *)v13 setState:1 animate:0];
    [(MTATimerControlsView *)v13 setStyle:a4];
    [(MTATimerControlsView *)v13 setupTimeView];
    v69 = +[NSNotificationCenter defaultCenter];
    [v69 addObserver:v13 selector:"handleLocaleChange" name:NSCurrentLocaleDidChangeNotification object:0];

    uint64_t v70 = MTCurrentDateProvider();
    id currentDateProvider = v13->_currentDateProvider;
    v13->_id currentDateProvider = (id)v70;

    if (MTIdiomIpad() && a4 <= 4 && ((1 << a4) & 0x1A) != 0) {
      [(MTATimerControlsView *)v13 setupConstraints];
    }
  }
  return v13;
}

+ (double)barWidthForStyle:(unint64_t)a3
{
  double result = 8.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6) {
    return 6.0;
  }
  return result;
}

- (id)displayTitle
{
  v2 = [(MTATimerControlsView *)self getCurrentLabel];
  v3 = v2;
  if (v2 && [v2 length])
  {
    id v4 = v3;
  }
  else
  {
    v5 = +[NSBundle mainBundle];
    id v4 = [v5 localizedStringForKey:@"Timer" value:&stru_1000A2560 table:0];
  }

  return v4;
}

- (void)setControlsViewDelegate:(id)a3
{
  id v4 = a3;
  [(MTATimerControlsView *)self setDelegate:v4];
  [(MTATimerButtonsController *)self->_buttonsController setTarget:v4];
  [(MTALabelEditCell *)self->_editLabelCell setDelegate:v4];
}

- (void)buildTableRowsWithStyle:(unint64_t)a3
{
  id v4 = objc_opt_new();
  [(MTATimerControlsView *)self setTableRows:v4];

  v5 = [(MTATimerControlsView *)self tableRows];
  [v5 addObject:&off_1000A4EC8];

  id v6 = [(MTATimerControlsView *)self tableRows];
  [v6 addObject:&off_1000A4EE0];
}

- (void)applyBackgroundColor:(id)a3
{
  countdownView = self->_countdownView;
  id v5 = a3;
  [(MTUITimerCountdownView *)countdownView setBackgroundColor:v5];
  [(MTATimerPickerCell *)self->_pickerCell setBackgroundColor:v5];
  [(MTATimerIntervalPickerView *)self->_timePicker setBackgroundColor:v5];
  [(MTATimerControlsView *)self setBackgroundColor:v5];
  [(MTALabelEditCell *)self->_editLabelCell setBackgroundColor:v5];
  [(UITableView *)self->_tableView setBackgroundColor:v5];
  [(UITableViewCell *)self->_toneChooserCell setBackgroundColor:v5];
}

- (void)setupTimeView
{
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  timeView = self->_timeView;
  self->_timeView = v3;

  [(MTATimerControlsView *)self addSubview:self->_timeView];
  [(UILabel *)self->_timeView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self->_timeView;
  id v6 = +[UIColor clearColor];
  [(UILabel *)v5 setBackgroundColor:v6];

  unint64_t v7 = [(MTATimerControlsView *)self style];
  id v8 = self->_timeView;
  if (v7 == 7) {
    +[UIColor mtui_secondaryTextColor];
  }
  else {
  v9 = +[UIColor mtui_primaryTextColor];
  }
  [(UILabel *)v8 setTextColor:v9];

  [(UILabel *)self->_timeView setTextAlignment:1];
  [(UILabel *)self->_timeView setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_timeView setBaselineAdjustment:1];
  v10 = self->_timeView;

  [(UILabel *)v10 setLineBreakMode:2];
}

- (void)setupTimerNameLabelForTimerStyle:(unint64_t)a3 withFontStyle:(id)a4
{
  id v6 = a4;
  unint64_t v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  timerNameLabel = self->_timerNameLabel;
  self->_timerNameLabel = v7;

  [(MTATimerControlsView *)self addSubview:self->_timerNameLabel];
  [(UILabel *)self->_timerNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = +[UIFont preferredFontForTextStyle:v6];

  [(UILabel *)self->_timerNameLabel setFont:v9];
  v10 = self->_timerNameLabel;
  v11 = +[UIColor clearColor];
  [(UILabel *)v10 setBackgroundColor:v11];

  v12 = self->_timerNameLabel;
  v13 = +[UIColor mtui_secondaryTextColor];
  [(UILabel *)v12 setTextColor:v13];

  [(UILabel *)self->_timerNameLabel setTextAlignment:1];
  [(UILabel *)self->_timerNameLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_timerNameLabel setBaselineAdjustment:1];
  [(UILabel *)self->_timerNameLabel setLineBreakMode:2];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    [(UILabel *)self->_timerNameLabel setAdjustsFontForContentSizeCategory:1];
    v14 = self->_timerNameLabel;
    [(UILabel *)v14 setMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  }
}

- (void)handleContentSizeChange
{
  [(MTATimerButtonsController *)self->_buttonsController handleContentSizeChange];
  [(MTATimerControlsView *)self setNeedsLayout];
  [(MTATimerControlsView *)self setupConstraints];
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)resetLayout
{
  [(MTATimerControlsView *)self setupConstraints];
  [(UITableView *)self->_tableView reloadData];

  [(MTATimerControlsView *)self setNeedsLayout];
}

- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  [(MTATimerControlsView *)self processCountdownState:a5 previousState:[(MTATimerControlsView *)self state] remainingTime:v7 duration:a3 forceRefresh:a4];
  if (self->_state != a5) {
    [(MTATimerControlsView *)self setState:a5];
  }
  [(MTALabelEditCell *)self->_editLabelCell setCurrentTitle:v12];
  [(UILabel *)self->_timerNameLabel setText:v12];
}

- (void)setDurationTime:(double)a3 title:(id)a4
{
  countdownView = self->_countdownView;
  id v7 = a4;
  [(MTUITimerCountdownView *)countdownView stop];
  [(UILabel *)self->_timerNameLabel setText:v7];

  [(MTATimerControlsView *)self setTime:a3];
}

- (void)processCountdownState:(unint64_t)a3 previousState:(unint64_t)a4 remainingTime:(double)a5 duration:(double)a6 forceRefresh:(BOOL)a7
{
  BOOL v7 = a7;
  [(MTUITimerCountdownView *)self->_countdownView duration];
  double v14 = v13;
  if (a3 == a4 && v13 == a6 && !v7 && ![(MTATimerControlsView *)self stateNeedsReset]) {
    return;
  }
  [(MTUITimerCountdownView *)self->_countdownView setAnimationRemainingTime:a5 totalTime:a6];
  [(MTUITimerCountdownView *)self->_countdownView setNeedsLayout];
  if (a3 == 1)
  {
    [(MTATimerControlsView *)self hideExpectedTime];
    [(MTUITimerCountdownView *)self->_countdownView stop];
    if (a4 != 3) {
      return;
    }
    v15 = self;
    uint64_t v16 = 2;
    goto LABEL_13;
  }
  if (a3 != 3)
  {
    if (a3 != 2) {
      return;
    }
    if (a4 == 3) {
      [(MTUITimerCountdownView *)self->_countdownView pause];
    }
    [(MTATimerControlsView *)self showExpectedTimeWithRemainingTime:a5];
    [(MTATimerControlsView *)self greyOutExpectedTime];
    v15 = self;
    uint64_t v16 = 1;
LABEL_13:
    [(MTATimerControlsView *)v15 setTimerControlState:v16];
    return;
  }
  [(MTATimerControlsView *)self showExpectedTimeWithRemainingTime:a5];
  [(MTATimerControlsView *)self setTimerControlState:1];
  if (a4 == 3 && !v7)
  {
    if (v14 == a6)
    {
      if ([(MTATimerControlsView *)self stateNeedsReset])
      {
        [(MTUITimerCountdownView *)self->_countdownView start];
        [(MTATimerControlsView *)self setStateNeedsReset:0];
      }
      return;
    }
    goto LABEL_31;
  }
  if (a4 == 1 || a4 == 3)
  {
LABEL_31:
    countdownView = self->_countdownView;
LABEL_32:
    [(MTUITimerCountdownView *)countdownView start];
    return;
  }
  if (a4 != 2) {
    return;
  }
  unsigned int v17 = [(MTUITimerCountdownView *)self->_countdownView isStarted];
  countdownView = self->_countdownView;
  if (!v17) {
    goto LABEL_32;
  }

  [(MTUITimerCountdownView *)countdownView resume];
}

- (void)showExpectedTimeWithRemainingTime:(double)a3
{
  id v5 = (*((void (**)(void))self->_currentDateProvider + 2))();
  id v6 = [v5 dateByAddingTimeInterval:a3];

  BOOL v7 = +[MTDateFormatting sharedInstance];
  id v8 = +[NSTimeZone systemTimeZone];
  id v16 = 0;
  v9 = [v7 localizedTimeStringFromDate:v6 forTimeZone:v8 timeDesignator:&v16];
  id v10 = v16;

  v11 = +[MTDateFormatting sharedInstance];
  if ([v11 timeDesignatorAppearsBeforeTime]) {
    +[NSString stringWithFormat:@"%@ %@", v10, v9];
  }
  else {
  id v12 = +[NSString stringWithFormat:@"%@ %@", v9, v10];
  }
  double v13 = [(MTUIGlyphTimeView *)self->_expectedTimeView timeLabel];
  [v13 setText:v12];

  expectedTimeView = self->_expectedTimeView;
  v15 = +[UIColor mtui_secondaryTextColor];
  [(MTUIGlyphTimeView *)expectedTimeView setComponentColor:v15];

  [(MTUIGlyphTimeView *)self->_expectedTimeView setHidden:0];
}

- (void)hideExpectedTime
{
  v3 = [(MTUIGlyphTimeView *)self->_expectedTimeView timeLabel];
  [v3 setText:&stru_1000A2560];

  expectedTimeView = self->_expectedTimeView;

  [(MTUIGlyphTimeView *)expectedTimeView setHidden:1];
}

- (void)greyOutExpectedTime
{
  expectedTimeView = self->_expectedTimeView;
  id v4 = +[UIColor mtui_quaternaryColor];
  [(MTUIGlyphTimeView *)expectedTimeView setComponentColor:v4];

  id v5 = self->_expectedTimeView;

  [(MTUIGlyphTimeView *)v5 setHidden:0];
}

- (void)setTime:(double)a3
{
  FormatTime();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_timeView setText:v4];
}

- (double)countDownDuration
{
  [(MTATimerIntervalPickerView *)self->_timePicker selectedDuration];
  return result;
}

- (void)setCountDownDuration:(double)a3
{
  -[MTATimerIntervalPickerView setDuration:](self->_timePicker, "setDuration:");
  buttonsController = self->_buttonsController;

  [(MTATimerButtonsController *)buttonsController setShouldEnableStartButton:a3 != 0.0];
}

- (void)handleLocaleChange
{
  ResetTimeFormatter();

  [(MTATimerControlsView *)self setNeedsLayout];
}

- (id)getCurrentLabel
{
  return [(MTALabelEditCell *)self->_editLabelCell getCurrentLabel];
}

- (void)setCurrentLabel:(id)a3
{
}

- (void)setTimerToneName:(id)a3
{
  if (self->_toneName != a3)
  {
    id v4 = (NSString *)[a3 copy];
    toneName = self->_toneName;
    self->_toneName = v4;

    [(MTATimerControlsView *)self setNeedsLayout];
    id v6 = self->_toneName;
    id v7 = [(UITableViewCell *)self->_toneChooserCell detailTextLabel];
    [v7 setText:v6];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  timePicker = self->_timePicker;
  id v7 = a4;
  id v8 = a3;
  [(MTATimerIntervalPickerView *)timePicker endEditing:0];
  v9.receiver = self;
  v9.super_class = (Class)MTATimerControlsView;
  [(MTATimerControlsView *)&v9 touchesBegan:v8 withEvent:v7];
}

- (void)setState:(unint64_t)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  self->_state = a3;
  BOOL v7 = a3 == 1;
  -[MTATimerButtonsController setState:](self->_buttonsController, "setState:");
  if (self->_style == 6) {
    [(MTATimerControlsView *)self updatePauseResumeButtonWithState:a3];
  }
  if (v4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003DABC;
    v10[3] = &unk_1000A18F8;
    v10[4] = self;
    BOOL v11 = v7;
    +[UIView animateWithDuration:v10 animations:0.2];
  }
  else
  {
    if (a3 == 1) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    if (a3 == 1) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    [(MTATimerIntervalPickerView *)self->_timePicker setAlpha:v8];
    [(UILabel *)self->_timeView setAlpha:v9];
    [(MTUITimerCountdownView *)self->_countdownView setAlpha:v9];
    [(MTUIGlyphTimeView *)self->_expectedTimeView setAlpha:v9];
  }
  [(MTATimerPickerCell *)self->_pickerCell setState:a3 animated:v4];
}

- (void)updatePauseResumeButtonWithState:(unint64_t)a3
{
  uint64_t v5 = +[UIImageSymbolConfiguration configurationWithWeight:7];
  if (a3 == 2) {
    CFStringRef v6 = @"play.fill";
  }
  else {
    CFStringRef v6 = @"pause";
  }
  id v17 = (id)v5;
  BOOL v7 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6);
  if (a3 == 2)
  {
    double v8 = +[UIColor systemGreenColor];
    double v9 = [v8 normalShade];
    id v10 = [(MTATimerControlsView *)self pauseResumeButton];
    [v10 setBackgroundColor:v9];

    +[UIColor systemGreenColor];
  }
  else
  {
    BOOL v11 = +[UIColor systemOrangeColor];
    id v12 = [v11 normalShade];
    double v13 = [(MTATimerControlsView *)self pauseResumeButton];
    [v13 setBackgroundColor:v12];

    +[UIColor systemOrangeColor];
  double v14 = };
  v15 = [(MTATimerControlsView *)self pauseResumeButton];
  [v15 setTintColor:v14];

  id v16 = [(MTATimerControlsView *)self pauseResumeButton];
  [v16 setImage:v7 forState:0];
}

- (void)setState:(unint64_t)a3
{
}

- (BOOL)isRunningTimer
{
  return (id)[(MTATimerControlsView *)self timerControlState] == (id)1;
}

- (void)setStyle:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  unint64_t style = self->_style;
  if (style == a3 && !a4) {
    return;
  }
  if (a3 == 4 && style == 5)
  {
    self->_unint64_t style = 4;
    BOOL v7 = 1;
LABEL_18:
    -[UILabel setHidden:](self->_timerNameLabel, "setHidden:", 1, a4);
LABEL_19:
    unsigned __int8 v8 = [(MTATimerControlsView *)self isRunningTimer];
    unint64_t v9 = self->_style;
    if ((v8 & 1) != 0 || (v9 != 4 ? (BOOL v10 = v9 == 2) : (BOOL v10 = 1), v10))
    {
      if (v9 - 3 > 1)
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = MTUIIsPadIdiom();
        [(UILabel *)self->_timerNameLabel setHidden:1];
      }
      [(MTATimerControlsView *)self setButtonSize:v11];
    }
    if (v7) {
      [(MTATimerControlsView *)self setupConstraints];
    }
    [(UITableView *)self->_tableView reloadData];
    [(MTATimerControlsView *)self setNeedsLayout];
    return;
  }
  self->_unint64_t style = a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    BOOL v7 = style == 2 && a3 == 4;
    if (a3 > 4 || ((1 << a3) & 0x16) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  -[UITableView setHidden:](self->_tableView, "setHidden:", 1, a4);
  [(MTUIGlyphTimeView *)self->_expectedTimeView setHidden:self->_style == 7];
  [(UILabel *)self->_timerNameLabel setHidden:0];
  [(UILabel *)self->_timerNameLabel setNumberOfLines:2];
  [(UILabel *)self->_timerNameLabel setLineBreakMode:0];

  [(MTATimerControlsView *)self setupCellButtons];
}

- (void)setStyle:(unint64_t)a3
{
}

- (void)setupCellButtons
{
  id v47 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:17.0];
  v3 = objc_opt_new();
  [(MTATimerControlsView *)self setStopButton:v3];

  BOOL v4 = [(MTATimerControlsView *)self stopButton];
  uint64_t v5 = [v4 layer];
  [v5 setCornerRadius:20.0];

  CFStringRef v6 = [(MTATimerControlsView *)self stopButton];
  BOOL v7 = [v6 layer];
  [v7 setMasksToBounds:1];

  unsigned __int8 v8 = +[UIColor whiteColor];
  unint64_t v9 = [v8 colorWithAlphaComponent:0.1];
  BOOL v10 = [(MTATimerControlsView *)self stopButton];
  [v10 setNormalBackgroundColor:v9];

  uint64_t v11 = +[UIColor blackColor];
  id v12 = [v11 highlightedShade];
  double v13 = [(MTATimerControlsView *)self stopButton];
  [v13 setHighlightedBackgroundColor:v12];

  double v14 = +[UIColor whiteColor];
  v15 = [v14 colorWithAlphaComponent:0.1];
  id v16 = [(MTATimerControlsView *)self stopButton];
  [v16 setBackgroundColor:v15];

  id v17 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v47];
  v18 = [(MTATimerControlsView *)self stopButton];
  [v18 setImage:v17 forState:0];

  uint64_t v19 = [(MTATimerControlsView *)self stopButton];
  [(MTATimerControlsView *)self addSubview:v19];

  uint64_t v20 = objc_opt_new();
  [(MTATimerControlsView *)self setPauseResumeButton:v20];

  id v21 = [(MTATimerControlsView *)self pauseResumeButton];
  v22 = [v21 layer];
  [v22 setCornerRadius:20.0];

  v23 = [(MTATimerControlsView *)self pauseResumeButton];
  v24 = [v23 layer];
  [v24 setMasksToBounds:1];

  id v25 = [(MTATimerControlsView *)self pauseResumeButton];
  [(MTATimerControlsView *)self addSubview:v25];

  unint64_t style = self->_style;
  if (style == 7)
  {
    v37 = [(MTATimerControlsView *)self stopButton];
    [v37 addTarget:self action:"deleteRecent" forControlEvents:64];

    v38 = +[UIColor grayColor];
    v39 = [(MTATimerControlsView *)self stopButton];
    [v39 setTintColor:v38];

    v40 = [(MTATimerControlsView *)self pauseResumeButton];
    [v40 addTarget:self action:"startRecent" forControlEvents:64];

    v31 = +[UIImage systemImageNamed:@"play.fill" withConfiguration:v47];
    v41 = [(MTATimerControlsView *)self pauseResumeButton];
    [v41 setImage:v31 forState:0];

    v42 = +[UIColor systemGreenColor];
    v43 = [v42 normalShade];
    v44 = [(MTATimerControlsView *)self pauseResumeButton];
    [v44 setBackgroundColor:v43];

    uint64_t v36 = +[UIColor systemGreenColor];
  }
  else
  {
    if (style != 6) {
      goto LABEL_6;
    }
    v27 = [(MTATimerControlsView *)self stopButton];
    [v27 addTarget:self action:"stopTimer" forControlEvents:64];

    v28 = +[UIColor whiteColor];
    v29 = [(MTATimerControlsView *)self stopButton];
    [v29 setTintColor:v28];

    v30 = [(MTATimerControlsView *)self pauseResumeButton];
    [v30 addTarget:self action:"pauseResumeTimer" forControlEvents:64];

    v31 = +[UIImage systemImageNamed:@"pause" withConfiguration:v47];
    v32 = [(MTATimerControlsView *)self pauseResumeButton];
    [v32 setImage:v31 forState:0];

    v33 = +[UIColor systemOrangeColor];
    v34 = [v33 normalShade];
    v35 = [(MTATimerControlsView *)self pauseResumeButton];
    [v35 setBackgroundColor:v34];

    uint64_t v36 = +[UIColor systemOrangeColor];
  }
  v45 = (void *)v36;
  v46 = [(MTATimerControlsView *)self pauseResumeButton];
  [v46 setTintColor:v45];

LABEL_6:
}

- (void)deleteRecent
{
  v3 = [(MTATimerControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MTATimerControlsView *)self delegate];
    [v5 deleteRecent:self];
  }
}

- (void)startRecent
{
  id v3 = [(MTATimerControlsView *)self delegate];
  [v3 startTimer:self];
}

- (void)stopTimer
{
  id v3 = [(MTATimerControlsView *)self delegate];
  [v3 cancelTimer:self];
}

- (void)pauseResumeTimer
{
  id v3 = [(MTATimerControlsView *)self delegate];
  [v3 pauseResumeTimer:self];
}

- (void)_configureAndAddButton:(id)a3
{
  id v4 = a3;
  [v4 sizeToFit];
  [(MTATimerControlsView *)self addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setButtonSize:(unint64_t)a3
{
  [(MTATimerButtonsController *)self->_buttonsController setButtonSize:a3];
  id v4 = [(MTATimerButtonsController *)self->_buttonsController startStopButton];
  [(MTATimerControlsView *)self _configureAndAddButton:v4];

  id v5 = [(MTATimerButtonsController *)self->_buttonsController cancelButton];
  [(MTATimerControlsView *)self _configureAndAddButton:v5];
}

- (void)setTimerControlState:(unint64_t)a3
{
  self->_timerControlState = a3;
  if ((MTIdiomIpad() & 1) == 0)
  {
    BOOL v4 = self->_timerControlState == 0;
    [(MTATimerControlsView *)self setButtonControlViewsHidden:v4];
  }
}

- (void)setupConstraints
{
  id v3 = objc_opt_new();
  BOOL v4 = [(MTATimerControlsView *)self styleSpecificConstraints];
  id v6 = [v4 mutableCopy];

  id v5 = [(MTATimerControlsView *)self constraints];
  +[NSLayoutConstraint deactivateConstraints:v5];

  +[NSLayoutConstraint activateConstraints:v6];
  [(MTATimerControlsView *)self setConstraints:v6];
}

- (id)styleSpecificConstraints
{
  int v3 = MTIdiomIpad();
  unint64_t style = self->_style;
  if (!v3)
  {
    if (style == 2)
    {
      id v5 = [(MTATimerControlsView *)self setupCompactNewTimerConstraints];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (style - 6 >= 2)
  {
    if (style != 1)
    {
      if (style == 4) {
        [(MTATimerControlsView *)self iPadSingleCellNewTimerConstraints];
      }
      else {
      id v5 = [(MTATimerControlsView *)self setupSingleTimerConstraints];
      }
      goto LABEL_12;
    }
LABEL_9:
    id v5 = [(MTATimerControlsView *)self setupMultipleTimerConstraints];
    goto LABEL_12;
  }
  id v5 = [(MTATimerControlsView *)self setupCollectionViewConstraints];
LABEL_12:

  return v5;
}

- (id)setupMultipleTimerConstraints
{
  int v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [(MTATimerControlsView *)self addLayoutGuide:v4];
  id v5 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  id v6 = [v5 topAnchor];
  BOOL v7 = [v4 topAnchor];
  unsigned __int8 v8 = [v6 constraintEqualToAnchor:v7];
  [v3 addObject:v8];

  unint64_t v9 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  BOOL v10 = [v9 bottomAnchor];
  uint64_t v11 = [v4 bottomAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  double v13 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  double v14 = [v13 leadingAnchor];
  v15 = [v4 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v3 addObject:v16];

  id v17 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  v18 = [v17 trailingAnchor];
  uint64_t v19 = [v4 trailingAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  v188 = objc_opt_new();
  [(MTATimerControlsView *)self addLayoutGuide:"addLayoutGuide:"];
  id v21 = objc_opt_new();
  unsigned __int8 v22 = [(MTATimerControlsView *)self mtui_isRTL];
  buttonsController = self->_buttonsController;
  if (v22) {
    [(MTATimerButtonsController *)buttonsController startStopButton];
  }
  else {
  v24 = [(MTATimerButtonsController *)buttonsController cancelButton];
  }
  unsigned __int8 v25 = [(MTATimerControlsView *)self mtui_isRTL];
  id v26 = self->_buttonsController;
  if (v25) {
    [(MTATimerButtonsController *)v26 cancelButton];
  }
  else {
  v27 = [(MTATimerButtonsController *)v26 startStopButton];
  }
  if ([(MTATimerControlsView *)self isRunningTimer]
    || (double v28 = 0.0, v29 = 0.0, (id)[(MTATimerControlsView *)self timerControlState] == (id)2))
  {
    +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, [v27 buttonCircleSize]);
    double v29 = v189;
    double v28 = v191;
    [(MTATimerControlsView *)self addLayoutGuide:v21];
    v30 = [v24 topAnchor];
    v31 = [v21 topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v3 addObject:v32];

    v33 = [v27 topAnchor];
    v34 = [v21 topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v3 addObject:v35];

    uint64_t v36 = [v24 bottomAnchor];
    v37 = [v21 bottomAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v3 addObject:v38];

    v39 = [v27 bottomAnchor];
    v40 = [v21 bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v3 addObject:v41];

    v42 = [v27 widthAnchor];
    v43 = [v42 constraintEqualToConstant:v190];
    [v3 addObject:v43];

    v44 = [v27 widthAnchor];
    v45 = [v27 heightAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    [v3 addObject:v46];

    id v47 = [v24 widthAnchor];
    v48 = [v47 constraintEqualToConstant:v190];
    [v3 addObject:v48];

    v49 = [v24 widthAnchor];
    v50 = [v24 heightAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v3 addObject:v51];

    v52 = [v21 heightAnchor];
    v53 = [v52 constraintEqualToConstant:v190];
    [v3 addObject:v53];
  }
  v187 = v24;
  v54 = objc_opt_new();
  [(MTATimerControlsView *)self addLayoutGuide:v54];
  v55 = [v54 topAnchor];
  v56 = [v4 topAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  [v3 addObject:v57];

  v58 = [v54 leadingAnchor];
  v59 = [v4 leadingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v3 addObject:v60];

  v61 = [v54 trailingAnchor];
  v62 = [v4 trailingAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v3 addObject:v63];

  v64 = [(MTUITimerCountdownView *)self->_countdownView topAnchor];
  v65 = [v54 topAnchor];
  v66 = [v64 constraintEqualToAnchor:v65 constant:v28];
  [v3 addObject:v66];

  v67 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  v68 = [v54 centerXAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  [v3 addObject:v69];

  uint64_t v70 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  v71 = [(MTUITimerCountdownView *)self->_countdownView heightAnchor];
  v72 = [v70 constraintEqualToAnchor:v71];
  [v3 addObject:v72];

  v73 = [(MTUITimerCountdownView *)self->_countdownView bottomAnchor];
  v74 = [v54 bottomAnchor];
  objc_super v75 = [v73 constraintEqualToAnchor:v74];
  [v3 addObject:v75];

  [(MTUITimerCountdownView *)self->_countdownView frame];
  double v77 = v76 * v76;
  v78 = [(UILabel *)self->_timeView font];
  [v78 pointSize];
  double v80 = sqrt(v77 + v79 * v79);

  v81 = [v188 widthAnchor];
  v82 = [v81 constraintEqualToConstant:v80 * 0.8];
  [v3 addObject:v82];

  v83 = [(UILabel *)self->_timeView leftAnchor];
  v84 = [v188 leftAnchor];
  v85 = [v83 constraintEqualToAnchor:v84];
  [v3 addObject:v85];

  v86 = [(UILabel *)self->_timeView rightAnchor];
  v87 = [v188 rightAnchor];
  v88 = [v86 constraintEqualToAnchor:v87];
  [v3 addObject:v88];

  v89 = [(UILabel *)self->_timeView heightAnchor];
  v90 = [(UILabel *)self->_timeView font];
  [v90 pointSize];
  v91 = [v89 constraintEqualToConstant:];
  [v3 addObject:v91];

  [(MTATimerControlsView *)self compactSizeFont];
  v92 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  v93 = [v92 mtui_fontByAddingTimeFontAttributes];
  [(UILabel *)self->_timeView setFont:v93];

  v94 = [(MTUIGlyphTimeView *)self->_expectedTimeView topAnchor];
  v95 = [v188 topAnchor];
  v96 = [v94 constraintEqualToAnchor:v95];
  [v3 addObject:v96];

  v97 = [(MTUIGlyphTimeView *)self->_expectedTimeView bottomAnchor];
  v98 = [(UILabel *)self->_timeView topAnchor];
  v99 = [v97 constraintEqualToAnchor:v98];
  [v3 addObject:v99];

  v100 = [(MTUIGlyphTimeView *)self->_expectedTimeView centerXAnchor];
  v101 = [v188 centerXAnchor];
  v102 = [v100 constraintEqualToAnchor:v101];
  [v3 addObject:v102];

  if (MTUIIsLargeText())
  {
    v103 = [(MTUIGlyphTimeView *)self->_expectedTimeView widthAnchor];
    v104 = [v103 constraintEqualToConstant:v80 * 0.5];
    [v3 addObject:v104];
  }
  v105 = [(MTUIGlyphTimeView *)self->_expectedTimeView heightAnchor];
  v106 = [(MTUIGlyphTimeView *)self->_expectedTimeView timeLabel];
  v107 = [v106 font];
  [v107 lineHeight];
  v108 = [v105 constraintEqualToConstant:];
  [v3 addObject:v108];

  v109 = [(UILabel *)self->_timeView bottomAnchor];
  v110 = [v188 bottomAnchor];
  v111 = [v109 constraintEqualToAnchor:v110];
  [v3 addObject:v111];

  v112 = [(UILabel *)self->_timeView centerXAnchor];
  v113 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  v114 = [v112 constraintEqualToAnchor:v113];
  [v3 addObject:v114];

  v115 = [(UILabel *)self->_timeView centerYAnchor];
  v116 = [(MTUITimerCountdownView *)self->_countdownView centerYAnchor];
  v117 = [v115 constraintEqualToAnchor:v116];
  [v3 addObject:v117];

  if ([(MTATimerControlsView *)self isIpadAddSheet])
  {
    v118 = [v54 heightAnchor];
    v119 = [v118 constraintEqualToConstant:275.3];
    [v3 addObject:v119];
LABEL_16:

    goto LABEL_17;
  }
  if (![(MTATimerControlsView *)self isRunningTimer])
  {
    v118 = [v54 heightAnchor];
    v119 = +[UIScreen mainScreen];
    [v119 bounds];
    v121 = [v118 constraintEqualToConstant:v120 * 0.64];
    [v3 addObject:v121];

    goto LABEL_16;
  }
LABEL_17:
  v122 = [(MTATimerIntervalPickerView *)self->_timePicker centerYAnchor];
  v123 = [v54 centerYAnchor];
  v124 = [v122 constraintEqualToAnchor:v123 constant:-12.0];
  [v3 addObject:v124];

  v125 = [(MTATimerIntervalPickerView *)self->_timePicker heightAnchor];
  v126 = [v54 heightAnchor];
  v127 = [v125 constraintEqualToAnchor:v126];
  [v3 addObject:v127];

  v128 = [(MTATimerIntervalPickerView *)self->_timePicker widthAnchor];
  v129 = [v128 constraintEqualToConstant:320.0];
  [v3 addObject:v129];

  v130 = [(MTATimerIntervalPickerView *)self->_timePicker centerXAnchor];
  v131 = [v54 centerXAnchor];
  v132 = [v130 constraintEqualToAnchor:v131];
  [v3 addObject:v132];

  v133 = objc_opt_new();
  [(MTATimerControlsView *)self addLayoutGuide:v133];
  if ([(MTATimerControlsView *)self isRunningTimer]
    || (id)[(MTATimerControlsView *)self timerControlState] == (id)2)
  {
    v134 = [v21 topAnchor];
    v135 = [v4 topAnchor];
    v136 = [v134 constraintEqualToAnchor:v135 constant:v29];
    [v3 addObject:v136];

    v137 = [v21 leadingAnchor];
    v138 = [v4 leadingAnchor];
    v139 = [v137 constraintEqualToAnchor:v138];
    [v3 addObject:v139];

    v140 = [v21 trailingAnchor];
    v141 = [v4 trailingAnchor];
    v142 = [v140 constraintEqualToAnchor:v141];
    [v3 addObject:v142];

    v143 = [v187 leadingAnchor];
    v144 = [v21 leadingAnchor];
    v145 = [v143 constraintEqualToAnchor:v144 constant:16.0];
    [v3 addObject:v145];

    v146 = [v27 trailingAnchor];
    v147 = [v21 trailingAnchor];
    v148 = [v146 constraintEqualToAnchor:v147 constant:-16.0];
    [v3 addObject:v148];

    v149 = [v54 bottomAnchor];
    v150 = [v21 topAnchor];
    int v151 = MTUIIsLargeText();
    double v152 = 24.0;
    if (v151) {
      double v152 = 0.0;
    }
    v153 = [v149 constraintEqualToAnchor:v150 constant:v152];
    [v3 addObject:v153];

    v154 = [v133 topAnchor];
    v155 = [v21 bottomAnchor];
    uint64_t v156 = [v154 constraintEqualToAnchor:v155 constant:34.0];
  }
  else
  {
    if (![(MTATimerControlsView *)self isIpadAddSheet])
    {
      v157 = [v54 bottomAnchor];
      v158 = [v133 topAnchor];
      v159 = [v157 constraintEqualToAnchor:v158];
      [v3 addObject:v159];
    }
    v154 = [v133 bottomAnchor];
    v155 = [v4 bottomAnchor];
    uint64_t v156 = [v154 constraintLessThanOrEqualToAnchor:v155];
  }
  v160 = (void *)v156;
  [v3 addObject:v156];

  v161 = [v133 leadingAnchor];
  v162 = [v4 leadingAnchor];
  v163 = [v161 constraintEqualToAnchor:v162];
  [v3 addObject:v163];

  v164 = [v133 trailingAnchor];
  v165 = [v4 trailingAnchor];
  v166 = [v164 constraintEqualToAnchor:v165];
  [v3 addObject:v166];

  v167 = [v133 heightAnchor];
  if (MTUIIsLargeText()) {
    double v168 = 104.0;
  }
  else {
    double v168 = 52.0;
  }
  v169 = [(MTATimerControlsView *)self tableRows];
  v170 = objc_msgSend(v167, "constraintEqualToConstant:", v168 * (double)(unint64_t)objc_msgSend(v169, "count"));
  [v3 addObject:v170];

  v171 = [(UITableView *)self->_tableView topAnchor];
  v172 = [v133 topAnchor];
  v173 = [v171 constraintEqualToAnchor:v172];
  [v3 addObject:v173];

  v174 = [(UITableView *)self->_tableView trailingAnchor];
  v175 = [v133 trailingAnchor];
  v176 = [v174 constraintEqualToAnchor:v175 constant:-16.0];
  [v3 addObject:v176];

  v177 = [(UITableView *)self->_tableView leadingAnchor];
  v178 = [v133 leadingAnchor];
  v179 = [v177 constraintEqualToAnchor:v178 constant:16.0];
  [v3 addObject:v179];

  v180 = [(UITableView *)self->_tableView bottomAnchor];
  v181 = [v133 bottomAnchor];
  v182 = [v180 constraintEqualToAnchor:v181];
  [v3 addObject:v182];

  v183 = [v188 centerXAnchor];
  v184 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  v185 = [v183 constraintEqualToAnchor:v184];
  [v3 addObject:v185];

  return v3;
}

- (id)setupCompactNewTimerConstraints
{
  int v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v4 setIdentifier:@"Parent"];
  [(MTATimerControlsView *)self addLayoutGuide:v4];
  id v5 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  id v6 = [v5 topAnchor];
  BOOL v7 = [v4 topAnchor];
  unsigned __int8 v8 = [v6 constraintEqualToAnchor:v7];
  [v3 addObject:v8];

  unint64_t v9 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  BOOL v10 = [v9 bottomAnchor];
  uint64_t v11 = [v4 bottomAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  double v13 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  double v14 = [v13 leadingAnchor];
  v15 = [v4 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v3 addObject:v16];

  id v17 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  v18 = [v17 trailingAnchor];
  uint64_t v19 = [v4 trailingAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  id v21 = objc_opt_new();
  [v21 setIdentifier:@"buttonsContainer"];
  unsigned __int8 v22 = [(MTATimerControlsView *)self mtui_isRTL];
  buttonsController = self->_buttonsController;
  if (v22) {
    [(MTATimerButtonsController *)buttonsController startStopButton];
  }
  else {
  v24 = [(MTATimerButtonsController *)buttonsController cancelButton];
  }
  unsigned __int8 v25 = [(MTATimerControlsView *)self mtui_isRTL];
  id v26 = self->_buttonsController;
  if (v25) {
    [(MTATimerButtonsController *)v26 cancelButton];
  }
  else {
  v27 = [(MTATimerButtonsController *)v26 startStopButton];
  }
  +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, [v27 buttonCircleSize]);
  [(MTATimerControlsView *)self addLayoutGuide:v21];
  double v28 = [v24 topAnchor];
  double v29 = [v21 topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v3 addObject:v30];

  v31 = [v27 topAnchor];
  v32 = [v21 topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v3 addObject:v33];

  v34 = [v24 bottomAnchor];
  v35 = [v21 bottomAnchor];
  uint64_t v36 = [v34 constraintEqualToAnchor:v35];
  [v3 addObject:v36];

  v37 = [v27 bottomAnchor];
  v38 = [v21 bottomAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  [v3 addObject:v39];

  v40 = [v27 widthAnchor];
  v41 = [v40 constraintEqualToConstant:v132];
  [v3 addObject:v41];

  v131 = v27;
  v42 = [v27 widthAnchor];
  v43 = [v27 heightAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v3 addObject:v44];

  v45 = [v24 widthAnchor];
  v46 = [v45 constraintEqualToConstant:v132];
  [v3 addObject:v46];

  id v47 = [v24 widthAnchor];
  v48 = [v24 heightAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v3 addObject:v49];

  v50 = [v21 heightAnchor];
  v51 = [v50 constraintEqualToConstant:v132];
  [v3 addObject:v51];

  v52 = objc_opt_new();
  [v52 setIdentifier:@"pickerCountdownContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v52];
  v53 = [v52 topAnchor];
  v54 = [v4 topAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v3 addObject:v55];

  v56 = [v52 leadingAnchor];
  v57 = [v4 leadingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v3 addObject:v58];

  v59 = [v52 trailingAnchor];
  v60 = [v4 trailingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  [v3 addObject:v61];

  v62 = +[UIScreen mainScreen];
  [v62 bounds];
  double v64 = v63 * 0.64;

  timePicker = self->_timePicker;
  [(MTATimerControlsView *)self bounds];
  -[MTATimerIntervalPickerView sizeThatFits:](timePicker, "sizeThatFits:", v66, v67);
  BOOL v69 = v64 > v68;
  if (v64 < v68) {
    double v64 = v68;
  }
  double v70 = dbl_1000829A0[v69] * v64;
  v71 = [v52 heightAnchor];
  v72 = [v71 constraintEqualToConstant:v64];
  [v3 addObject:v72];

  v73 = [(MTATimerIntervalPickerView *)self->_timePicker topAnchor];
  v74 = [v52 topAnchor];
  objc_super v75 = [v73 constraintEqualToAnchor:v74];
  [v3 addObject:v75];

  double v76 = [(MTATimerIntervalPickerView *)self->_timePicker heightAnchor];
  double v77 = [v52 heightAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  [v3 addObject:v78];

  double v79 = [(MTATimerIntervalPickerView *)self->_timePicker widthAnchor];
  double v80 = [v79 constraintEqualToConstant:320.0];
  [v3 addObject:v80];

  v81 = [(MTATimerIntervalPickerView *)self->_timePicker centerXAnchor];
  v82 = [v52 centerXAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  [v3 addObject:v83];

  v84 = objc_opt_new();
  [v84 setIdentifier:@"tableViewContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v84];
  v85 = [v21 leadingAnchor];
  v86 = [v4 leadingAnchor];
  v87 = [v85 constraintEqualToAnchor:v86];
  [v3 addObject:v87];

  v88 = [v21 trailingAnchor];
  v89 = [v4 trailingAnchor];
  v90 = [v88 constraintEqualToAnchor:v89];
  [v3 addObject:v90];

  v91 = [v24 leadingAnchor];
  v92 = [v21 leadingAnchor];
  v93 = [v91 constraintEqualToAnchor:v92 constant:16.0];
  [v3 addObject:v93];

  v94 = [v131 trailingAnchor];
  v95 = [v21 trailingAnchor];
  v96 = [v94 constraintEqualToAnchor:v95 constant:-16.0];
  [v3 addObject:v96];

  v97 = [v52 bottomAnchor];
  v98 = [v21 topAnchor];
  int v99 = MTUIIsLargeText();
  double v100 = 0.0;
  if (!v99) {
    double v100 = v70;
  }
  v101 = [v97 constraintEqualToAnchor:v98 constant:v100];
  [v3 addObject:v101];

  v102 = [v84 topAnchor];
  v103 = [v21 bottomAnchor];
  v104 = [v102 constraintEqualToAnchor:v103 constant:34.0];
  [v3 addObject:v104];

  v105 = [v84 leadingAnchor];
  v106 = [v4 leadingAnchor];
  v107 = [v105 constraintEqualToAnchor:v106];
  [v3 addObject:v107];

  v108 = [v84 trailingAnchor];
  v109 = [v4 trailingAnchor];
  v110 = [v108 constraintEqualToAnchor:v109];
  [v3 addObject:v110];

  v111 = [v84 heightAnchor];
  if (MTUIIsLargeText()) {
    double v112 = 104.0;
  }
  else {
    double v112 = 52.0;
  }
  v113 = [(MTATimerControlsView *)self tableRows];
  v114 = objc_msgSend(v111, "constraintEqualToConstant:", v112 * (double)(unint64_t)objc_msgSend(v113, "count"));
  [v3 addObject:v114];

  v115 = [(UITableView *)self->_tableView topAnchor];
  v116 = [v84 topAnchor];
  v117 = [v115 constraintEqualToAnchor:v116];
  [v3 addObject:v117];

  v118 = [(UITableView *)self->_tableView trailingAnchor];
  v119 = [v84 trailingAnchor];
  double v120 = [v118 constraintEqualToAnchor:v119 constant:-16.0];
  [v3 addObject:v120];

  v121 = [(UITableView *)self->_tableView leadingAnchor];
  v122 = [v84 leadingAnchor];
  v123 = [v121 constraintEqualToAnchor:v122 constant:16.0];
  [v3 addObject:v123];

  v124 = [(UITableView *)self->_tableView bottomAnchor];
  v125 = [v84 bottomAnchor];
  v126 = [v124 constraintEqualToAnchor:v125];
  [v3 addObject:v126];

  v127 = [v84 bottomAnchor];
  v128 = [v4 bottomAnchor];
  v129 = [v127 constraintLessThanOrEqualToAnchor:v128];
  [v3 addObject:v129];

  return v3;
}

- (BOOL)isIpadAddSheet
{
  int v3 = MTIdiomIpad();
  if (v3) {
    LOBYTE(v3) = self->_style == 1;
  }
  return v3;
}

- (id)setupSingleTimerConstraints
{
  int v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v4 setIdentifier:@"parentContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v4];
  id v5 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  id v6 = [v5 topAnchor];
  BOOL v7 = [v4 topAnchor];
  unsigned __int8 v8 = [v6 constraintEqualToAnchor:v7];
  [v3 addObject:v8];

  unint64_t v9 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  BOOL v10 = [v9 bottomAnchor];
  uint64_t v11 = [v4 bottomAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  double v13 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  double v14 = [v13 leadingAnchor];
  v15 = [v4 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v3 addObject:v16];

  id v17 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  v18 = [v17 trailingAnchor];
  v307 = v4;
  uint64_t v19 = [v4 trailingAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  id v21 = objc_opt_new();
  [v21 setIdentifier:@"groupedTimeContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v21];
  unsigned __int8 v22 = objc_opt_new();
  [v22 setIdentifier:@"buttonsContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v22];
  unsigned __int8 v23 = [(MTATimerControlsView *)self mtui_isRTL];
  buttonsController = self->_buttonsController;
  if (v23) {
    [(MTATimerButtonsController *)buttonsController startStopButton];
  }
  else {
  unsigned __int8 v25 = [(MTATimerButtonsController *)buttonsController cancelButton];
  }
  unsigned __int8 v26 = [(MTATimerControlsView *)self mtui_isRTL];
  v27 = self->_buttonsController;
  v306 = v21;
  if (v26) {
    [(MTATimerButtonsController *)v27 cancelButton];
  }
  else {
  double v28 = [(MTATimerButtonsController *)v27 startStopButton];
  }
  +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, [v28 buttonCircleSize]);
  double v29 = [v25 topAnchor];
  v30 = [v22 topAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v3 addObject:v31];

  v32 = [v28 topAnchor];
  v33 = [v22 topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v3 addObject:v34];

  v35 = [v25 bottomAnchor];
  uint64_t v36 = [v22 bottomAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v3 addObject:v37];

  v38 = [v28 bottomAnchor];
  v39 = [v22 bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v3 addObject:v40];

  v41 = [v28 widthAnchor];
  v42 = [v41 constraintEqualToConstant:0.0];
  [v3 addObject:v42];

  v43 = [v28 widthAnchor];
  v44 = [v28 heightAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v3 addObject:v45];

  v46 = [v25 widthAnchor];
  id v47 = [v46 constraintEqualToConstant:0.0];
  [v3 addObject:v47];

  v48 = [v25 widthAnchor];
  v49 = [v25 heightAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  [v3 addObject:v50];

  v51 = [v22 heightAnchor];
  v52 = [v51 constraintEqualToConstant:0.0];
  [v3 addObject:v52];

  v305 = v22;
  if (self->_style == 3)
  {
    v53 = [v22 leadingAnchor:v28, v25];
    v54 = [v4 leadingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [v3 addObject:v55];

    v56 = [v22 trailingAnchor];
    v57 = [v4 trailingAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    [v3 addObject:v58];

    v59 = [v25 leadingAnchor];
    v60 = [v22 leadingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60 constant:16.0];
    [v3 addObject:v61];

    v62 = [v28 trailingAnchor];
    double v63 = [v22 trailingAnchor];
    double v64 = [v62 constraintEqualToAnchor:v63 constant:-16.0];
    [v3 addObject:v64];

    v65 = objc_opt_new();
    [v65 setIdentifier:@"pickerCountdownContainer"];
    [(MTATimerControlsView *)self addLayoutGuide:v65];
    if (+[MTAUtilities isLandscape])
    {
      double v66 = v28;
      double v67 = [v22 centerYAnchor];
      double v68 = [(MTATimerControlsView *)self centerYAnchor];
      BOOL v69 = [v67 constraintEqualToAnchor:v68];
      [v3 addObject:v69];

      double v70 = [v65 centerYAnchor];
      v71 = [v4 centerYAnchor];
      v72 = [v70 constraintEqualToAnchor:v71];
      [v3 addObject:v72];

      v73 = [v65 centerXAnchor];
      v74 = [v4 centerXAnchor];
      objc_super v75 = [v73 constraintEqualToAnchor:v74];
      [v3 addObject:v75];

      double v76 = [v65 heightAnchor];
      double v77 = +[UIScreen mainScreen];
      [v77 bounds];
      double v79 = [v76 constraintEqualToConstant:v78 * 0.64];

      LODWORD(v80) = 1144750080;
      [v79 setPriority:v80];
      [v3 addObject:v79];
      v81 = [v65 heightAnchor];
      v82 = [v65 widthAnchor];
      v83 = [v81 constraintEqualToAnchor:v82];
      [v3 addObject:v83];

      v84 = [v65 leadingAnchor];
      v85 = [v25 trailingAnchor];
      v86 = [v84 constraintGreaterThanOrEqualToAnchor:v85 constant:8.0];
      [v3 addObject:v86];

      v87 = [v65 trailingAnchor];
      v88 = [v66 leadingAnchor];
      v89 = [v87 constraintLessThanOrEqualToAnchor:v88 constant:8.0];
      [v3 addObject:v89];

      v90 = [(MTUITimerCountdownView *)self->_countdownView topAnchor];
      v91 = [v65 topAnchor];
      v92 = [v90 constraintEqualToAnchor:v91];
      [v3 addObject:v92];
    }
    else
    {
      v212 = [v22 topAnchor];
      v213 = [v4 topAnchor];
      v214 = [v212 constraintEqualToAnchor:v213 constant:0.0];
      [v3 addObject:v214];

      v215 = [v65 topAnchor];
      v216 = [v4 topAnchor];
      v217 = [v215 constraintEqualToAnchor:v216];
      [v3 addObject:v217];

      v218 = [v65 leadingAnchor];
      v219 = [v4 leadingAnchor];
      v220 = [v218 constraintEqualToAnchor:v219];
      [v3 addObject:v220];

      v221 = [v65 trailingAnchor];
      v222 = [v4 trailingAnchor];
      v223 = [v221 constraintEqualToAnchor:v222];
      [v3 addObject:v223];

      v224 = [v65 bottomAnchor];
      v225 = [v22 bottomAnchor];
      v226 = [v224 constraintEqualToAnchor:v225 constant:-24.0];
      [v3 addObject:v226];

      double v79 = [(MTUITimerCountdownView *)self->_countdownView topAnchor];
      v90 = [v65 topAnchor];
      v91 = [v79 constraintEqualToAnchor:v90 constant:0.0];
      [v3 addObject:v91];
    }

    v227 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
    v228 = [v65 centerXAnchor];
    v229 = [v227 constraintEqualToAnchor:v228];
    [v3 addObject:v229];

    v230 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
    v231 = [(MTUITimerCountdownView *)self->_countdownView heightAnchor];
    v232 = [v230 constraintEqualToAnchor:v231];
    [v3 addObject:v232];

    v233 = [(MTUITimerCountdownView *)self->_countdownView bottomAnchor];
    v234 = [v65 bottomAnchor];
    v235 = [v233 constraintEqualToAnchor:v234];
    [v3 addObject:v235];

    v236 = +[UIFont systemFontOfSize:130.0 weight:UIFontWeightThin];
    v237 = [v236 mtui_fontByAddingTimeFontAttributes];
    [(UILabel *)self->_timeView setFont:v237];

    [(MTUITimerCountdownView *)self->_countdownView frame];
    double v239 = v238 * v238;
    v240 = [(UILabel *)self->_timeView font];
    [v240 pointSize];
    double v242 = sqrt(v239 + v241 * v241);

    if (v242 >= 288.0) {
      double v243 = v242;
    }
    else {
      double v243 = 288.0;
    }
    v304 = v65;
    id v21 = v306;
    v244 = [v306 widthAnchor];
    v245 = [v244 constraintEqualToConstant:v243];
    [v3 addObject:v245];

    v246 = [(MTUIGlyphTimeView *)self->_expectedTimeView topAnchor];
    v247 = [v306 topAnchor];
    v248 = [v246 constraintEqualToAnchor:v247];
    [v3 addObject:v248];

    v249 = [(MTUIGlyphTimeView *)self->_expectedTimeView heightAnchor];
    v250 = [(MTUIGlyphTimeView *)self->_expectedTimeView timeLabel];
    v251 = [v250 font];
    [v251 lineHeight];
    v252 = [v249 constraintEqualToConstant:];
    [v3 addObject:v252];

    v253 = [(MTUIGlyphTimeView *)self->_expectedTimeView centerXAnchor];
    v254 = [v306 centerXAnchor];
    v255 = [v253 constraintEqualToAnchor:v254];
    [v3 addObject:v255];

    v256 = [(UILabel *)self->_timeView topAnchor];
    v257 = [(MTUIGlyphTimeView *)self->_expectedTimeView bottomAnchor];
    v258 = [v256 constraintEqualToAnchor:v257];
    [v3 addObject:v258];

    v259 = [(UILabel *)self->_timeView centerXAnchor];
    v260 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
    v261 = [v259 constraintEqualToAnchor:v260];
    [v3 addObject:v261];

    v262 = [(UILabel *)self->_timeView heightAnchor];
    v263 = [(UILabel *)self->_timeView font];
    [v263 lineHeight];
    v264 = [v262 constraintEqualToConstant:];
    [v3 addObject:v264];

    v265 = [(UILabel *)self->_timeView widthAnchor];
    v266 = [v265 constraintEqualToConstant:v242 * 0.8];
    [(MTATimerControlsView *)self setTimerCountdownWidthConstraint:v266];

    v267 = [(MTATimerControlsView *)self timerCountdownWidthConstraint];
    [v3 addObject:v267];

    v268 = [(MTATimerIntervalPickerView *)self->_timePicker centerXAnchor];
    v269 = [v304 centerXAnchor];
    v270 = [v268 constraintEqualToAnchor:v269];
    [v3 addObject:v270];

    v271 = [(MTATimerIntervalPickerView *)self->_timePicker bottomAnchor];
    v272 = [(UITableView *)self->_tableView topAnchor];
    v273 = [v271 constraintEqualToAnchor:v272 constant:-34.0];
    [v3 addObject:v273];

    v274 = [(MTATimerIntervalPickerView *)self->_timePicker heightAnchor];
    [(MTATimerIntervalPickerView *)self->_timePicker frame];
    v276 = [v274 constraintEqualToConstant:v275];
    [v3 addObject:v276];

    v277 = [(MTATimerIntervalPickerView *)self->_timePicker widthAnchor];
    [(MTATimerIntervalPickerView *)self->_timePicker frame];
    v279 = [v277 constraintEqualToConstant:v278];
    [v3 addObject:v279];

    v280 = [(UITableView *)self->_tableView topAnchor];
    v281 = [(UILabel *)self->_timeView bottomAnchor];
    v282 = [v280 constraintEqualToAnchor:v281 constant:17.0];
    [v3 addObject:v282];

    v283 = [(UITableView *)self->_tableView centerXAnchor];
    v284 = [v306 centerXAnchor];
    v285 = [v283 constraintEqualToAnchor:v284];
    [v3 addObject:v285];

    [(MTUITimerCountdownView *)self->_countdownView size];
    double v287 = sqrt(v286 * v286 * 0.5) * 0.9;
    v288 = [(UITableView *)self->_tableView widthAnchor];
    v289 = [v288 constraintEqualToConstant:fmin(v287, 332.0)];
    [(MTATimerControlsView *)self setTableWidthConstraint:v289];

    v290 = [(MTATimerControlsView *)self tableWidthConstraint];
    [v3 addObject:v290];

    v291 = [(UITableView *)self->_tableView heightAnchor];
    if (MTUIIsLargeText()) {
      double v292 = 104.0;
    }
    else {
      double v292 = 52.0;
    }
    v293 = [(MTATimerControlsView *)self tableRows];
    v294 = [v291 constraintEqualToConstant:v292 * (double)(unint64_t)[v293 count]];
    [v3 addObject:v294];

    v185 = [(UITableView *)self->_tableView bottomAnchor];
    v209 = [v306 bottomAnchor];
    v210 = [v185 constraintEqualToAnchor:v209];
    [v3 addObject:v210];
    double v190 = v4;
  }
  else
  {
    v93 = [v22 topAnchor:v28, v25];
    [v4 topAnchor];
    v95 = v94 = v28;
    v96 = [v93 constraintEqualToAnchor:v95 constant:0.0];
    [v3 addObject:v96];

    v97 = [v22 leadingAnchor];
    v98 = [v307 leadingAnchor];
    int v99 = [v97 constraintEqualToAnchor:v98];
    [v3 addObject:v99];

    double v100 = [v22 trailingAnchor];
    v101 = [v307 trailingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101];
    [v3 addObject:v102];

    v103 = [v25 leadingAnchor];
    v104 = [v22 leadingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104 constant:16.0];
    [v3 addObject:v105];

    v106 = [v94 trailingAnchor];
    v107 = [v22 trailingAnchor];
    v108 = [v106 constraintEqualToAnchor:v107 constant:-16.0];
    [v3 addObject:v108];

    v109 = objc_opt_new();
    [(MTATimerControlsView *)self addLayoutGuide:v109];
    v110 = [v109 topAnchor];
    v111 = [v307 topAnchor];
    double v112 = [v110 constraintEqualToAnchor:v111];
    [v3 addObject:v112];

    v113 = [v109 leadingAnchor];
    v114 = [v307 leadingAnchor];
    v115 = [v113 constraintEqualToAnchor:v114];
    [v3 addObject:v115];

    v116 = [v109 trailingAnchor];
    v117 = [v307 trailingAnchor];
    v118 = [v116 constraintEqualToAnchor:v117];
    [v3 addObject:v118];

    v119 = [v109 bottomAnchor];
    double v120 = [v22 topAnchor];
    int v121 = MTUIIsLargeText();
    double v122 = 24.0;
    double v123 = 0.0;
    if (v121) {
      double v122 = 0.0;
    }
    v124 = [v119 constraintEqualToAnchor:v120 constant:v122];
    [v3 addObject:v124];

    if (self->_style == 5) {
      double v123 = 12.0;
    }
    v125 = [(MTUITimerCountdownView *)self->_countdownView topAnchor];
    v126 = [v109 topAnchor];
    v127 = [v125 constraintEqualToAnchor:v126 constant:v123 + 0.0];
    [v3 addObject:v127];

    v128 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
    v129 = [v109 centerXAnchor];
    v130 = [v128 constraintEqualToAnchor:v129];
    [v3 addObject:v130];

    v131 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
    double v132 = [(MTUITimerCountdownView *)self->_countdownView heightAnchor];
    v133 = [v131 constraintEqualToAnchor:v132];
    [v3 addObject:v133];

    v134 = [(MTUITimerCountdownView *)self->_countdownView bottomAnchor];
    v135 = [v109 bottomAnchor];
    v136 = [v134 constraintEqualToAnchor:v135 constant:-v123];
    [v3 addObject:v136];

    [(MTUITimerCountdownView *)self->_countdownView frame];
    double v138 = v137 * v137;
    v139 = [(UILabel *)self->_timeView font];
    [v139 pointSize];
    double v141 = sqrt(v138 + v140 * v140);

    v142 = [v21 widthAnchor];
    v143 = [v142 constraintEqualToConstant:v141 * 0.8];
    [v3 addObject:v143];

    v144 = [(UILabel *)self->_timeView topAnchor];
    v145 = [v21 topAnchor];
    v146 = [v144 constraintEqualToAnchor:v145];
    [v3 addObject:v146];

    v147 = [(UILabel *)self->_timeView leftAnchor];
    v148 = [v21 leftAnchor];
    v149 = [v147 constraintEqualToAnchor:v148];
    [v3 addObject:v149];

    v150 = [(UILabel *)self->_timeView rightAnchor];
    int v151 = [v21 rightAnchor];
    double v152 = [v150 constraintEqualToAnchor:v151];
    [v3 addObject:v152];

    v153 = [(UILabel *)self->_timeView heightAnchor];
    v154 = [(UILabel *)self->_timeView font];
    [v154 pointSize];
    v155 = [v153 constraintEqualToConstant:];
    [v3 addObject:v155];

    [(MTATimerControlsView *)self compactSizeFont];
    uint64_t v156 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    v157 = [v156 mtui_fontByAddingTimeFontAttributes];
    [(UILabel *)self->_timeView setFont:v157];

    v158 = [(MTUIGlyphTimeView *)self->_expectedTimeView centerXAnchor];
    v159 = [(UILabel *)self->_timeView centerXAnchor];
    v160 = [v158 constraintEqualToAnchor:v159];
    [v3 addObject:v160];

    v161 = [(MTUIGlyphTimeView *)self->_expectedTimeView topAnchor];
    v162 = [(UILabel *)self->_timeView bottomAnchor];
    v163 = [v161 constraintEqualToAnchor:v162 constant:12.0];
    [v3 addObject:v163];

    if (MTUIIsLargeText())
    {
      v164 = [(MTUIGlyphTimeView *)self->_expectedTimeView widthAnchor];
      v165 = [v164 constraintEqualToConstant:v141 * 0.5];
      [v3 addObject:v165];
    }
    v166 = [(MTUIGlyphTimeView *)self->_expectedTimeView heightAnchor];
    v167 = [(MTUIGlyphTimeView *)self->_expectedTimeView timeLabel];
    double v168 = [v167 font];
    [v168 lineHeight];
    v169 = [v166 constraintEqualToConstant:];
    [v3 addObject:v169];

    v170 = [(MTUIGlyphTimeView *)self->_expectedTimeView bottomAnchor];
    v171 = [v21 bottomAnchor];
    v172 = [v170 constraintEqualToAnchor:v171];
    [v3 addObject:v172];

    v173 = [(MTATimerIntervalPickerView *)self->_timePicker centerYAnchor];
    v174 = [v109 centerYAnchor];
    v175 = [v173 constraintEqualToAnchor:v174 constant:-12.0];
    [v3 addObject:v175];

    v176 = [(MTATimerIntervalPickerView *)self->_timePicker centerXAnchor];
    v304 = v109;
    v177 = [v109 centerXAnchor];
    v178 = [v176 constraintEqualToAnchor:v177];
    [v3 addObject:v178];

    v179 = [(MTATimerIntervalPickerView *)self->_timePicker heightAnchor];
    [(MTATimerIntervalPickerView *)self->_timePicker frame];
    v181 = [v179 constraintEqualToConstant:v180];
    [v3 addObject:v181];

    v182 = [(MTATimerIntervalPickerView *)self->_timePicker widthAnchor];
    [(MTATimerIntervalPickerView *)self->_timePicker frame];
    v184 = [v182 constraintEqualToConstant:v183];
    [v3 addObject:v184];

    v185 = objc_opt_new();
    [(MTATimerControlsView *)self addLayoutGuide:v185];
    v186 = [v185 topAnchor];
    v187 = [v305 bottomAnchor];
    v188 = [v186 constraintEqualToAnchor:v187 constant:34.0];
    [v3 addObject:v188];

    double v189 = [v185 leadingAnchor];
    double v190 = v307;
    double v191 = [v307 leadingAnchor];
    v192 = [v189 constraintEqualToAnchor:v191];
    [v3 addObject:v192];

    v193 = [v185 trailingAnchor];
    v194 = [v307 trailingAnchor];
    v195 = [v193 constraintEqualToAnchor:v194];
    [v3 addObject:v195];

    v196 = [v185 heightAnchor];
    if (MTUIIsLargeText()) {
      double v197 = 104.0;
    }
    else {
      double v197 = 52.0;
    }
    v198 = [(MTATimerControlsView *)self tableRows];
    v199 = objc_msgSend(v196, "constraintEqualToConstant:", v197 * (double)(unint64_t)objc_msgSend(v198, "count"));
    [v3 addObject:v199];

    v200 = [(UITableView *)self->_tableView topAnchor];
    v201 = [v185 topAnchor];
    v202 = [v200 constraintEqualToAnchor:v201];
    [v3 addObject:v202];

    v203 = [(UITableView *)self->_tableView trailingAnchor];
    v204 = [v185 trailingAnchor];
    v205 = [v203 constraintEqualToAnchor:v204 constant:-16.0];
    [v3 addObject:v205];

    v206 = [(UITableView *)self->_tableView leadingAnchor];
    v207 = [v185 leadingAnchor];
    v208 = [v206 constraintEqualToAnchor:v207 constant:16.0];
    [v3 addObject:v208];

    v209 = [(UITableView *)self->_tableView bottomAnchor];
    v210 = [v185 bottomAnchor];
    v211 = [v209 constraintEqualToAnchor:v210];
    [v3 addObject:v211];
  }
  v295 = [v21 centerXAnchor];
  v296 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  v297 = [v295 constraintEqualToAnchor:v296];
  [v3 addObject:v297];

  v298 = [v21 centerYAnchor];
  v299 = [(MTUITimerCountdownView *)self->_countdownView centerYAnchor];
  v300 = [v298 constraintEqualToAnchor:v299];
  [v3 addObject:v300];

  return v3;
}

- (id)iPadSingleCellNewTimerConstraints
{
  int v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v4 setIdentifier:@"parentContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v4];
  id v5 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  id v6 = [v5 topAnchor];
  BOOL v7 = [v4 topAnchor];
  unsigned __int8 v8 = [v6 constraintEqualToAnchor:v7];
  [v3 addObject:v8];

  unint64_t v9 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  BOOL v10 = [v9 bottomAnchor];
  uint64_t v11 = [v4 bottomAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  double v13 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  double v14 = [v13 leadingAnchor];
  v15 = [v4 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v3 addObject:v16];

  id v17 = [(MTATimerControlsView *)self safeAreaLayoutGuide];
  v18 = [v17 trailingAnchor];
  uint64_t v19 = [v4 trailingAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  id v21 = objc_opt_new();
  [v21 setIdentifier:@"groupedTimeContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v21];
  unsigned __int8 v22 = objc_opt_new();
  [v22 setIdentifier:@"buttonsContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v22];
  unsigned __int8 v23 = [(MTATimerControlsView *)self mtui_isRTL];
  buttonsController = self->_buttonsController;
  if (v23) {
    [(MTATimerButtonsController *)buttonsController startStopButton];
  }
  else {
  unsigned __int8 v25 = [(MTATimerButtonsController *)buttonsController cancelButton];
  }
  unsigned __int8 v26 = [(MTATimerControlsView *)self mtui_isRTL];
  v27 = self->_buttonsController;
  if (v26) {
    [(MTATimerButtonsController *)v27 cancelButton];
  }
  else {
  double v28 = [(MTATimerButtonsController *)v27 startStopButton];
  }
  +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, [v28 buttonCircleSize]);
  double v29 = [v25 topAnchor];
  v30 = [v22 topAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v3 addObject:v31];

  v32 = [v28 topAnchor];
  v33 = [v22 topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v3 addObject:v34];

  v35 = [v25 bottomAnchor];
  uint64_t v36 = [v22 bottomAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v3 addObject:v37];

  v38 = [v28 bottomAnchor];
  v39 = [v22 bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v3 addObject:v40];

  v41 = [v28 widthAnchor];
  v42 = [v41 constraintEqualToConstant:0.0];
  [v3 addObject:v42];

  v43 = [v28 widthAnchor];
  v44 = [v28 heightAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v3 addObject:v45];

  v46 = [v25 widthAnchor];
  id v47 = [v46 constraintEqualToConstant:0.0];
  [v3 addObject:v47];

  v48 = [v25 widthAnchor];
  v49 = [v25 heightAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  [v3 addObject:v50];

  v51 = [v22 heightAnchor];
  v52 = [v51 constraintEqualToConstant:0.0];
  [v3 addObject:v52];

  v53 = [v22 leadingAnchor];
  v54 = [v4 leadingAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v3 addObject:v55];

  v56 = [v22 trailingAnchor];
  v57 = [v4 trailingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v3 addObject:v58];

  v196 = v25;
  v59 = [v25 leadingAnchor];
  v60 = [v22 leadingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60 constant:16.0];
  [v3 addObject:v61];

  double v197 = v28;
  v62 = [v28 trailingAnchor];
  double v63 = [v22 trailingAnchor];
  double v64 = [v62 constraintEqualToAnchor:v63 constant:-16.0];
  [v3 addObject:v64];

  v65 = objc_opt_new();
  [v65 setIdentifier:@"pickerCountdownContainer"];
  [(MTATimerControlsView *)self addLayoutGuide:v65];
  v194 = v4;
  v195 = v22;
  if (+[MTAUtilities isLandscape])
  {
    double v66 = +[UIApplication sharedApplication];
    double v67 = [v66 delegate];

    double v68 = [v22 centerYAnchor];
    [(MTATimerControlsView *)self topAnchor];
    double v70 = v69 = v4;
    [v67 visibleViewHeight];
    v72 = [v68 constraintEqualToAnchor:v70 constant:v71 * 0.5];
    [v3 addObject:v72];

    v73 = [v65 centerYAnchor];
    v74 = [v69 centerYAnchor];
    objc_super v75 = [v73 constraintEqualToAnchor:v74];
    [v3 addObject:v75];

    double v76 = [v65 centerXAnchor];
    double v77 = [v69 centerXAnchor];
    double v78 = [v76 constraintEqualToAnchor:v77];
    [v3 addObject:v78];

    double v79 = +[UIScreen mainScreen];
    [v79 bounds];
    double v81 = v80;

    v82 = +[UIScreen mainScreen];
    [v82 bounds];
    double v84 = v83;

    if (v81 >= v84) {
      double v81 = v84;
    }
    v85 = [v65 heightAnchor];
    v86 = [v85 constraintEqualToConstant:v81 * 0.64];

    LODWORD(v87) = 1144750080;
    [v86 setPriority:v87];
    [v3 addObject:v86];
    v88 = [v65 heightAnchor];
    v89 = [v65 widthAnchor];
    v90 = [v88 constraintEqualToAnchor:v89];
    [v3 addObject:v90];

    v91 = [v65 leadingAnchor];
    v92 = [v196 trailingAnchor];
    v93 = [v91 constraintGreaterThanOrEqualToAnchor:v92 constant:8.0];
    [v3 addObject:v93];

    v94 = [v65 trailingAnchor];
    v95 = [v197 leadingAnchor];
    v96 = [v94 constraintLessThanOrEqualToAnchor:v95 constant:8.0];
    [v3 addObject:v96];

    v97 = [(MTUITimerCountdownView *)self->_countdownView topAnchor];
    v98 = [v65 topAnchor];
    int v99 = [v97 constraintEqualToAnchor:v98];
    [v3 addObject:v99];
  }
  else
  {
    double v100 = [v22 topAnchor];
    v101 = [v4 topAnchor];
    [v100 constraintEqualToAnchor:v101 constant:0.0];
    v103 = v102 = v22;
    [v3 addObject:v103];

    v104 = [v65 topAnchor];
    v105 = [v4 topAnchor];
    v106 = [v104 constraintEqualToAnchor:v105];
    [v3 addObject:v106];

    v107 = [v65 leadingAnchor];
    v108 = [v4 leadingAnchor];
    v109 = [v107 constraintEqualToAnchor:v108];
    [v3 addObject:v109];

    v110 = [v65 trailingAnchor];
    v111 = [v4 trailingAnchor];
    double v112 = [v110 constraintEqualToAnchor:v111];
    [v3 addObject:v112];

    v113 = [v65 bottomAnchor];
    v114 = [v102 bottomAnchor];
    v115 = [v113 constraintEqualToAnchor:v114 constant:-24.0];
    [v3 addObject:v115];

    double v67 = [(MTUITimerCountdownView *)self->_countdownView topAnchor];
    v86 = [v65 topAnchor];
    v97 = [v67 constraintEqualToAnchor:v86 constant:0.0];
    [v3 addObject:v97];
  }

  v116 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  v117 = [v65 centerXAnchor];
  v118 = [v116 constraintEqualToAnchor:v117];
  [v3 addObject:v118];

  v119 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  double v120 = [(MTUITimerCountdownView *)self->_countdownView heightAnchor];
  int v121 = [v119 constraintEqualToAnchor:v120];
  [v3 addObject:v121];

  double v122 = [(MTUITimerCountdownView *)self->_countdownView bottomAnchor];
  double v123 = [v65 bottomAnchor];
  v124 = [v122 constraintEqualToAnchor:v123];
  [v3 addObject:v124];

  v125 = +[UIFont systemFontOfSize:130.0 weight:UIFontWeightThin];
  v126 = [v125 mtui_fontByAddingTimeFontAttributes];
  [(UILabel *)self->_timeView setFont:v126];

  [(MTUITimerCountdownView *)self->_countdownView frame];
  double v128 = v127 * v127;
  v129 = [(UILabel *)self->_timeView font];
  [v129 pointSize];
  double v131 = sqrt(v128 + v130 * v130);

  if (v131 >= 288.0) {
    double v132 = v131;
  }
  else {
    double v132 = 288.0;
  }
  v133 = [v21 widthAnchor];
  v134 = [v133 constraintEqualToConstant:v132];
  [v3 addObject:v134];

  v135 = [(MTUIGlyphTimeView *)self->_expectedTimeView topAnchor];
  v136 = [v21 topAnchor];
  double v137 = [v135 constraintEqualToAnchor:v136];
  [v3 addObject:v137];

  double v138 = [(MTUIGlyphTimeView *)self->_expectedTimeView heightAnchor];
  v139 = [(MTUIGlyphTimeView *)self->_expectedTimeView timeLabel];
  double v140 = [v139 font];
  [v140 lineHeight];
  double v141 = [v138 constraintEqualToConstant:];
  [v3 addObject:v141];

  v142 = [(MTUIGlyphTimeView *)self->_expectedTimeView centerXAnchor];
  v143 = [v21 centerXAnchor];
  v144 = [v142 constraintEqualToAnchor:v143];
  [v3 addObject:v144];

  v145 = [(UILabel *)self->_timeView topAnchor];
  v146 = [(MTUIGlyphTimeView *)self->_expectedTimeView bottomAnchor];
  v147 = [v145 constraintEqualToAnchor:v146];
  [v3 addObject:v147];

  v148 = [(UILabel *)self->_timeView centerXAnchor];
  v149 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  v150 = [v148 constraintEqualToAnchor:v149];
  [v3 addObject:v150];

  int v151 = [(UILabel *)self->_timeView heightAnchor];
  double v152 = [(UILabel *)self->_timeView font];
  [v152 lineHeight];
  v153 = [v151 constraintEqualToConstant:];
  [v3 addObject:v153];

  v154 = [(UILabel *)self->_timeView widthAnchor];
  v155 = [v154 constraintEqualToConstant:v131 * 0.8];
  [(MTATimerControlsView *)self setTimerCountdownWidthConstraint:v155];

  uint64_t v156 = [(MTATimerControlsView *)self timerCountdownWidthConstraint];
  [v3 addObject:v156];

  v157 = [(MTATimerIntervalPickerView *)self->_timePicker centerXAnchor];
  v158 = [v65 centerXAnchor];
  v159 = [v157 constraintEqualToAnchor:v158];
  [v3 addObject:v159];

  v160 = [(MTATimerIntervalPickerView *)self->_timePicker bottomAnchor];
  v161 = [(UITableView *)self->_tableView topAnchor];
  v162 = [v160 constraintEqualToAnchor:v161 constant:-34.0];
  [v3 addObject:v162];

  v163 = [(MTATimerIntervalPickerView *)self->_timePicker heightAnchor];
  [(MTATimerIntervalPickerView *)self->_timePicker frame];
  v165 = [v163 constraintEqualToConstant:v164];
  [v3 addObject:v165];

  v166 = [(MTATimerIntervalPickerView *)self->_timePicker widthAnchor];
  [(MTATimerIntervalPickerView *)self->_timePicker frame];
  double v168 = [v166 constraintEqualToConstant:v167];
  [v3 addObject:v168];

  v169 = [(UITableView *)self->_tableView topAnchor];
  v170 = [(UILabel *)self->_timeView bottomAnchor];
  v171 = [v169 constraintEqualToAnchor:v170 constant:17.0];
  [v3 addObject:v171];

  v172 = [(UITableView *)self->_tableView centerXAnchor];
  v173 = [v21 centerXAnchor];
  v174 = [v172 constraintEqualToAnchor:v173];
  [v3 addObject:v174];

  [(MTUITimerCountdownView *)self->_countdownView size];
  double v176 = sqrt(v175 * v175 * 0.5) * 0.9;
  v177 = [(UITableView *)self->_tableView widthAnchor];
  v178 = [v177 constraintEqualToConstant:fmin(v176, 332.0)];
  [(MTATimerControlsView *)self setTableWidthConstraint:v178];

  v179 = [(MTATimerControlsView *)self tableWidthConstraint];
  [v3 addObject:v179];

  double v180 = [(UITableView *)self->_tableView heightAnchor];
  if (MTUIIsLargeText()) {
    double v181 = 104.0;
  }
  else {
    double v181 = 52.0;
  }
  v182 = [(MTATimerControlsView *)self tableRows];
  double v183 = [v180 constraintEqualToConstant:v181 * (double)(unint64_t)[v182 count]];
  [v3 addObject:v183];

  v184 = [(UITableView *)self->_tableView bottomAnchor];
  v185 = [v21 bottomAnchor];
  v186 = [v184 constraintEqualToAnchor:v185];
  [v3 addObject:v186];

  v187 = [v21 centerXAnchor];
  v188 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  double v189 = [v187 constraintEqualToAnchor:v188];
  [v3 addObject:v189];

  double v190 = [v21 centerYAnchor];
  double v191 = [(MTUITimerCountdownView *)self->_countdownView centerYAnchor];
  v192 = [v190 constraintEqualToAnchor:v191];
  [v3 addObject:v192];

  return v3;
}

- (id)setupCollectionViewConstraints
{
  int v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v4 setIdentifier:@"parentContainer"];
  [(MTATimerControlsView *)self _addLayoutGuide:v4];
  id v5 = [(MTATimerControlsView *)self topAnchor];
  id v6 = [v4 topAnchor];
  BOOL v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  unsigned __int8 v8 = [(MTATimerControlsView *)self bottomAnchor];
  unint64_t v9 = [v4 bottomAnchor];
  BOOL v10 = [v8 constraintEqualToAnchor:v9];
  [v3 addObject:v10];

  uint64_t v11 = [(MTATimerControlsView *)self leadingAnchor];
  id v12 = [v4 leadingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  [v3 addObject:v13];

  double v14 = [(MTATimerControlsView *)self trailingAnchor];
  v15 = [v4 trailingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v3 addObject:v16];

  id v17 = objc_opt_new();
  [v17 setIdentifier:@"groupedTimeView"];
  [(MTATimerControlsView *)self _addLayoutGuide:v17];
  v18 = [v17 centerXAnchor];
  uint64_t v19 = [v4 centerXAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  id v21 = [v17 centerYAnchor];
  unsigned __int8 v22 = [v4 centerYAnchor];
  unsigned __int8 v23 = [v21 constraintEqualToAnchor:v22];
  [v3 addObject:v23];

  v24 = [(UILabel *)self->_timeView centerXAnchor];
  unsigned __int8 v25 = [v17 centerXAnchor];
  unsigned __int8 v26 = [v24 constraintEqualToAnchor:v25];
  [v3 addObject:v26];

  v27 = [(UILabel *)self->_timeView centerYAnchor];
  double v28 = [v17 centerYAnchor];
  double v29 = [v27 constraintEqualToAnchor:v28];
  [v3 addObject:v29];

  v30 = [v17 widthAnchor];
  v31 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v3 addObject:v32];

  v33 = [(UILabel *)self->_timeView leadingAnchor];
  v34 = [(MTUITimerCountdownView *)self->_countdownView leadingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34 constant:12.0];
  [v3 addObject:v35];

  uint64_t v36 = [(UILabel *)self->_timeView trailingAnchor];
  v37 = [(MTUITimerCountdownView *)self->_countdownView trailingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 constant:-12.0];
  [v3 addObject:v38];

  v39 = +[UIFont systemFontOfSize:64.0 weight:UIFontWeightThin];
  v40 = [v39 mtui_fontByAddingTimeFontAttributes];

  [(UILabel *)self->_timeView setFont:v40];
  v41 = [(MTUIGlyphTimeView *)self->_expectedTimeView centerXAnchor];
  v42 = [v17 centerXAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v3 addObject:v43];

  v44 = [(MTUIGlyphTimeView *)self->_expectedTimeView lastBaselineAnchor];
  v45 = [(UILabel *)self->_timeView lastBaselineAnchor];
  [v40 capHeight];
  id v47 = [v44 constraintEqualToAnchor:v45 constant:-(v46 + 20.0)];
  [v3 addObject:v47];

  v48 = [(MTUIGlyphTimeView *)self->_expectedTimeView topAnchor];
  v49 = [v17 topAnchor];
  v50 = [v48 constraintGreaterThanOrEqualToAnchor:v49];
  [v3 addObject:v50];

  v51 = [(MTUIGlyphTimeView *)self->_expectedTimeView leadingAnchor];
  v52 = [(UILabel *)self->_timeView leadingAnchor];
  v53 = [v51 constraintGreaterThanOrEqualToAnchor:v52];
  [v3 addObject:v53];

  v54 = [(MTUIGlyphTimeView *)self->_expectedTimeView trailingAnchor];
  v55 = [(UILabel *)self->_timeView trailingAnchor];
  v56 = [v54 constraintLessThanOrEqualToAnchor:v55];
  [v3 addObject:v56];

  v57 = [(UILabel *)self->_timerNameLabel centerXAnchor];
  v58 = [v17 centerXAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  [v3 addObject:v59];

  v60 = [(UILabel *)self->_timerNameLabel font];
  [v60 lineHeight];
  double v62 = v61 * 0.5;

  double v63 = [(UILabel *)self->_timerNameLabel centerYAnchor];
  double v64 = [(UILabel *)self->_timeView lastBaselineAnchor];
  v65 = [v63 constraintEqualToAnchor:v64 constant:v62 + 20.0];
  [v3 addObject:v65];

  double v66 = [(UILabel *)self->_timerNameLabel bottomAnchor];
  double v67 = [v17 bottomAnchor];
  double v68 = [v66 constraintLessThanOrEqualToAnchor:v67];
  [v3 addObject:v68];

  BOOL v69 = [(UILabel *)self->_timerNameLabel widthAnchor];
  double v70 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  double v71 = [v69 constraintEqualToAnchor:v70 multiplier:0.6];
  [v3 addObject:v71];

  v72 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  v73 = [v4 widthAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 multiplier:0.78];
  [v3 addObject:v74];

  objc_super v75 = [(MTUITimerCountdownView *)self->_countdownView heightAnchor];
  double v76 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  double v77 = [v75 constraintEqualToAnchor:v76];
  [v3 addObject:v77];

  double v78 = [(MTUITimerCountdownView *)self->_countdownView centerXAnchor];
  double v79 = [v4 centerXAnchor];
  double v80 = [v78 constraintEqualToAnchor:v79];
  [v3 addObject:v80];

  double v81 = [(MTUITimerCountdownView *)self->_countdownView centerYAnchor];
  v82 = [v4 centerYAnchor];
  double v83 = [v81 constraintEqualToAnchor:v82];
  [v3 addObject:v83];

  double v84 = [(MTUITimerCountdownView *)self->_countdownView widthAnchor];
  v85 = [(MTUITimerCountdownView *)self->_countdownView heightAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  [v3 addObject:v86];

  double v87 = [(MTUITimerCountdownView *)self->_countdownView centerYAnchor];
  v88 = [v17 centerYAnchor];
  v89 = [v87 constraintEqualToAnchor:v88];
  [v3 addObject:v89];

  v90 = [(MTATimerControlsView *)self stopButton];
  v91 = [v90 widthAnchor];
  v92 = [v91 constraintEqualToConstant:40.0];
  [v3 addObject:v92];

  v93 = [(MTATimerControlsView *)self stopButton];
  v94 = [v93 heightAnchor];
  v95 = [(MTATimerControlsView *)self stopButton];
  v96 = [v95 widthAnchor];
  v97 = [v94 constraintEqualToAnchor:v96];
  [v3 addObject:v97];

  v98 = [(MTATimerControlsView *)self stopButton];
  int v99 = [v98 leadingAnchor];
  double v100 = [v4 leadingAnchor];
  v101 = [v99 constraintEqualToAnchor:v100 constant:15.0];
  [v3 addObject:v101];

  v102 = [(MTATimerControlsView *)self stopButton];
  v103 = [v102 bottomAnchor];
  v104 = [v4 bottomAnchor];
  v105 = [v103 constraintEqualToAnchor:v104 constant:-15.0];
  [v3 addObject:v105];

  v106 = [(MTATimerControlsView *)self pauseResumeButton];
  v107 = [v106 widthAnchor];
  v108 = [v107 constraintEqualToConstant:40.0];
  [v3 addObject:v108];

  v109 = [(MTATimerControlsView *)self pauseResumeButton];
  v110 = [v109 heightAnchor];
  v111 = [(MTATimerControlsView *)self pauseResumeButton];
  double v112 = [v111 widthAnchor];
  v113 = [v110 constraintEqualToAnchor:v112];
  [v3 addObject:v113];

  v114 = [(MTATimerControlsView *)self pauseResumeButton];
  v115 = [v114 trailingAnchor];
  v116 = [v4 trailingAnchor];
  v117 = [v115 constraintEqualToAnchor:v116 constant:-15.0];
  [v3 addObject:v117];

  v118 = [(MTATimerControlsView *)self pauseResumeButton];
  v119 = [v118 bottomAnchor];
  double v120 = [v4 bottomAnchor];
  int v121 = [v119 constraintEqualToAnchor:v120 constant:-15.0];
  [v3 addObject:v121];

  return v3;
}

- (void)setButtonControlViewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MTATimerButtonsController *)self->_buttonsController cancelButton];
  [v5 setHidden:v3];

  id v6 = [(MTATimerButtonsController *)self->_buttonsController startStopButton];
  [v6 setHidden:v3];
}

- (void)resetLayoutGuides
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(MTATimerControlsView *)self layoutGuides];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MTATimerControlsView *)self removeLayoutGuide:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  unsigned __int8 v8 = [(MTATimerControlsView *)self layoutGuides];
  [v8 removeAllObjects];
}

- (void)_addLayoutGuide:(id)a3
{
  id v4 = a3;
  [(MTATimerControlsView *)self addLayoutGuide:v4];
  [(NSMutableArray *)self->_layoutGuides addObject:v4];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MTATimerControlsView;
  [(MTATimerControlsView *)&v12 layoutSubviews];
  if (MTIdiomIpad() && self->_style - 3 <= 1)
  {
    [(MTUITimerCountdownView *)self->_countdownView size];
    double v4 = fmin(sqrt(v3 * v3 * 0.5) * 0.9, 332.0);
    id v5 = [(MTATimerControlsView *)self tableWidthConstraint];
    [v5 setConstant:v4];

    [(MTUITimerCountdownView *)self->_countdownView frame];
    double v7 = v6 * v6;
    unsigned __int8 v8 = [(UILabel *)self->_timeView font];
    [v8 pointSize];
    double v10 = sqrt(v7 + v9 * v9);

    long long v11 = [(MTATimerControlsView *)self timerCountdownWidthConstraint];
    [v11 setConstant:v10 * 0.8];
  }
  else if ([(MTATimerControlsView *)self shouldSetupConstraintsAtLayout])
  {
    [(MTATimerControlsView *)self setupConstraints];
  }
}

- (BOOL)shouldSetupConstraintsAtLayout
{
  return !MTIdiomIpad() || self->_style != 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(MTATimerControlsView *)self tableRows];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(MTATimerControlsView *)self tableRows];
  id v7 = [v5 row];

  unsigned __int8 v8 = [v6 objectAtIndexedSubscript:v7];
  unsigned int v9 = [v8 unsignedIntValue];

  if (v9)
  {
    if (v9 == 1)
    {
      double v10 = sub_1000456C8();
      long long v11 = [(UITableViewCell *)self->_toneChooserCell textLabel];
      [v11 setFont:v10];

      objc_super v12 = [(UITableViewCell *)self->_toneChooserCell textLabel];
      [v12 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];

      double v13 = +[UIColor mtui_primaryTextColor];
      double v14 = [(UITableViewCell *)self->_toneChooserCell textLabel];
      [v14 setTextColor:v13];

      v15 = +[NSBundle mainBundle];
      id v16 = [v15 localizedStringForKey:@"WHEN_TIMER_ENDS" value:&stru_1000A2560 table:0];
      id v17 = [(UITableViewCell *)self->_toneChooserCell textLabel];
      [v17 setText:v16];

      v18 = [(UITableViewCell *)self->_toneChooserCell detailTextLabel];
      [v18 setFont:v10];

      uint64_t v19 = [(UITableViewCell *)self->_toneChooserCell detailTextLabel];
      [v19 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];

      uint64_t v20 = +[UIColor mtui_secondaryTextColor];
      id v21 = [(UITableViewCell *)self->_toneChooserCell detailTextLabel];
      [v21 setTextColor:v20];

      toneName = self->_toneName;
      unsigned __int8 v23 = [(UITableViewCell *)self->_toneChooserCell detailTextLabel];
      [v23 setText:toneName];

      -[UITableViewCell setLayoutMargins:](self->_toneChooserCell, "setLayoutMargins:", 0.0, 16.0, 0.0, 0.0);
      v24 = self->_toneChooserCell;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    editLabelCell = self->_editLabelCell;
    unsigned __int8 v26 = sub_1000456C8();
    [(MTALabelEditCell *)editLabelCell setFont:v26];

    v24 = self->_editLabelCell;
  }

  return v24;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(MTATimerControlsView *)self tableRows];
  unsigned __int8 v8 = [v7 objectAtIndexedSubscript:[v6 row]];
  unsigned int v9 = [v8 unsignedIntValue];

  if (v9 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    long long v11 = [v12 cellForRowAtIndexPath:v6];
    [WeakRetained showSoundPicker:v11];

    [v12 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MTATimerControlsView *)self tableRows];
  id v7 = [v5 row];

  unsigned __int8 v8 = [v6 objectAtIndexedSubscript:v7];
  LODWORD(v7) = [v8 unsignedIntValue];

  return v7 == 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  int v4 = MTUIIsLargeText();
  double result = 52.0;
  if (v4) {
    return 104.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIView);
  [v4 bounds];
  double v7 = v6;

  id v8 = [v5 initWithFrame:0.0, 0.0, v7, 1.0];
  unsigned int v9 = +[UIColor mtui_backgroundColor];
  [v8 setBackgroundColor:v9];

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 1.0;
}

- (void)pickerView:(id)a3 didChangeSelectedDuration:(double)a4
{
  [(MTATimerControlsView *)self setEdited:1];
  [(MTATimerButtonsController *)self->_buttonsController setShouldEnableStartButton:a4 != 0.0];
  double v6 = [(MTATimerControlsView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MTATimerControlsView *)self delegate];
    [v8 timePickerDidSelectDuration:a4];
  }
}

- (BOOL)isRunningInThirdSplitView
{
  v2 = [(MTATimerControlsView *)self window];
  [v2 size];
  double v4 = v3;

  id v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;

  return v4 < v7 * 0.5;
}

- (double)compactSizeFont
{
  unsigned int v2 = [(MTATimerControlsView *)self isRunningInThirdSplitView];
  double v3 = (double *)&unk_100082AF0;
  if (!v2) {
    double v3 = (double *)&qword_100082AF8;
  }
  return *v3;
}

+ (double)estimatedViewWidth
{
  return 0.0;
}

+ (double)estimatedViewHeight
{
  if (!MTUIIsPadIdiom())
  {
    double v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v10 = v9;
    [a1 estimatedNonCountdownElementHeight];
    double v8 = v11 + v10 * 0.64;
LABEL_6:

    return v8;
  }
  unsigned int v3 = +[MTAUtilities isLandscape];
  double v4 = +[UIScreen mainScreen];
  [v4 bounds];
  if (!v3)
  {
    double v12 = 0.542 * v5;
    double v13 = +[UIScreen mainScreen];
    [v13 bounds];
    double v8 = fmin(v12, CGRectGetWidth(v15)) + 24.0;

    goto LABEL_6;
  }
  double v6 = v5 * 0.5;

  [a1 estimatedCountdownViewHeight];
  return v6 + v7 / 3.0;
}

+ (double)estimatedCountdownViewHeight
{
  unsigned int v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3 * 0.64;

  return v4;
}

+ (double)estimatedNonCountdownElementHeight
{
  [a1 estimatedTonePickerHeight];
  return v2 + 84.0;
}

+ (double)estimatedNonCountdownElementHeightWithSpacing
{
  [a1 estimatedNonCountdownElementHeight];
  double v4 = v3;
  [a1 estimatedElementSpacing];
  return v4 + v5;
}

+ (double)estimatedElementSpacing
{
  return 48.0;
}

+ (double)estimatedTonePickerHeight
{
  int v2 = MTUIIsLargeText();
  double result = 104.0;
  if (v2) {
    return 208.0;
  }
  return result;
}

+ (double)estimatedTimePickerHeight
{
  return 275.3;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)timerControlState
{
  return self->_timerControlState;
}

- (BOOL)isNewTimer
{
  return self->_isNewTimer;
}

- (void)setIsNewTimer:(BOOL)a3
{
  self->_isNewTimer = a3;
}

- (BOOL)edited
{
  return self->_edited;
}

- (void)setEdited:(BOOL)a3
{
  self->_edited = a3;
}

- (BOOL)stateNeedsReset
{
  return self->_stateNeedsReset;
}

- (void)setStateNeedsReset:(BOOL)a3
{
  self->_stateNeedsReset = a3;
}

- (MTALabelEditCell)editLabelCell
{
  return self->_editLabelCell;
}

- (void)setEditLabelCell:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSMutableArray)tableRows
{
  return self->_tableRows;
}

- (void)setTableRows:(id)a3
{
}

- (NSMutableArray)layoutGuides
{
  return self->_layoutGuides;
}

- (void)setLayoutGuides:(id)a3
{
}

- (TimerControlsTarget)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TimerControlsTarget *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSLayoutConstraint)tableWidthConstraint
{
  return self->_tableWidthConstraint;
}

- (void)setTableWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)timerCountdownWidthConstraint
{
  return self->_timerCountdownWidthConstraint;
}

- (void)setTimerCountdownWidthConstraint:(id)a3
{
}

- (MTATimerCollectionControlButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
}

- (MTATimerCollectionControlButton)pauseResumeButton
{
  return self->_pauseResumeButton;
}

- (void)setPauseResumeButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseResumeButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_timerCountdownWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tableWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_tableRows, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_editLabelCell, 0);
  objc_storeStrong((id *)&self->_buttonsController, 0);
  objc_storeStrong((id *)&self->_toneName, 0);
  objc_storeStrong((id *)&self->_toneChooserCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_pickerCell, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_expectedTimeView, 0);
  objc_storeStrong((id *)&self->_timerNameLabel, 0);

  objc_storeStrong((id *)&self->_timeView, 0);
}

@end