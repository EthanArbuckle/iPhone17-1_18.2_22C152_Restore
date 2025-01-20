@interface TTRICustomRecurrenceViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)isRecurrenceRuleOrdinal:(id)a3;
- (BOOL)prohibitsHourlyRecurrence;
- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence;
- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence;
- (BOOL)prohibitsYearlyRecurrenceInterval;
- (CGSize)calculatePreferredContentSize;
- (NSArray)cachedAvailableRecurrenceFrequencies;
- (NSDate)startDate;
- (NSString)recurrenceSummaryString;
- (NSTimeZone)timeZone;
- (TTRICustomRecurrenceIntervalViewController)intervalPickerViewController;
- (TTRICustomRecurrenceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TTRICustomRecurrenceViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5;
- (TTRIRecurrenceChooserController)currentChooser;
- (TTRIRecurrenceMonthChooserController)yearlyChooser;
- (TTRIRecurrenceMonthlyChooserController)monthlyChooser;
- (TTRIRecurrenceOrdinalChooserController)yearlyOrdinalChooser;
- (TTRIRecurrenceWeekdayChooserController)weeklyChooser;
- (UIPickerView)frequencyPickerView;
- (UISwitch)yearOrdinalSwitch;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_availableRecurrenceFrequencies;
- (id)_chooserForFrequency:(int64_t)a3;
- (id)_localizedEveryStringForFrequency:(int64_t)a3 interval:(int64_t)a4;
- (id)_stringForFrequency:(int64_t)a3;
- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4;
- (id)completionBlock;
- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)recurrenceRule;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_numberOfRowsForSection:(int64_t)a3;
- (int64_t)_pickerRowForRecurrenceFrequency:(int64_t)a3;
- (int64_t)_recurrenceFrequencyForPickerRow:(int64_t)a3;
- (int64_t)_tagForIndexPath:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_collapseAllPickers;
- (void)_createChoosersAndControls;
- (void)_frequencyPickerViewUpdated;
- (void)_refreshCacheAndPickers;
- (void)_setShowingFrequencyPicker:(BOOL)a3;
- (void)_setShowingIntervalPicker:(BOOL)a3;
- (void)_toggleInlineSpinnerForTag:(int64_t)a3;
- (void)_updateCustomPickerView;
- (void)_updateFrequencyRows;
- (void)_updateIntervalPicker;
- (void)_updateRecurrenceRule;
- (void)_updateSummaryLabel;
- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4;
- (void)_yearOrdinalSwitchChanged:(id)a3;
- (void)loadView;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4;
- (void)recurrenceChooserUpdated:(id)a3;
- (void)recurrenceChooserWantsReload:(id)a3;
- (void)setCachedAvailableRecurrenceFrequencies:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentChooser:(id)a3;
- (void)setFrequencyPickerView:(id)a3;
- (void)setIntervalPickerViewController:(id)a3;
- (void)setMonthlyChooser:(id)a3;
- (void)setProhibitsHourlyRecurrence:(BOOL)a3;
- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3;
- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3;
- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3;
- (void)setRecurrenceRule:(id)a3;
- (void)setRecurrenceRule:(id)a3 shouldUpdatePickers:(BOOL)a4;
- (void)setRecurrenceSummaryString:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeeklyChooser:(id)a3;
- (void)setYearOrdinalSwitch:(id)a3;
- (void)setYearlyChooser:(id)a3;
- (void)setYearlyOrdinalChooser:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRICustomRecurrenceViewController

- (TTRICustomRecurrenceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)TTRICustomRecurrenceViewController;
  v4 = [(TTRICustomRecurrenceViewController *)&v13 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_cachedFrequency = 0;
    v4->_cachedInterval = 1;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v10 = RemindersUICoreBundleGet();
    v11 = [v10 localizedStringForKey:@"CUSTOM_RECURRENCE_LABEL" value:@"Custom" table:@"Localizable"];
    [(TTRICustomRecurrenceViewController *)v5 setTitle:v11];
  }
  return v5;
}

- (TTRICustomRecurrenceViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(TTRICustomRecurrenceViewController *)self initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_timeZone, a4);
    v12->_useClearBackground = a5;
    [(TTRICustomRecurrenceViewController *)v12 _createChoosersAndControls];
  }

  return v12;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(TTRICustomRecurrenceViewController *)self setTableView:v4];

  v5 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v5 setDelegate:self];

  uint64_t v6 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v6 setDataSource:self];

  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v7 lineHeight];
  double v9 = v8;
  id v10 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v10 setEstimatedRowHeight:v9];

  if (self->_useClearBackground)
  {
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    v12 = [(TTRICustomRecurrenceViewController *)self tableView];
    [v12 setBackgroundColor:v11];
  }
  id v13 = [(TTRICustomRecurrenceViewController *)self tableView];
  [(TTRICustomRecurrenceViewController *)self setView:v13];
}

- (CGSize)calculatePreferredContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_createChoosersAndControls
{
  double v3 = [[TTRIRecurrenceWeekdayChooserController alloc] initWithDate:self->_startDate];
  weeklyChooser = self->_weeklyChooser;
  self->_weeklyChooser = v3;

  [(TTRIRecurrenceChooserController *)self->_weeklyChooser setDelegate:self];
  v5 = [[TTRIRecurrenceMonthlyChooserController alloc] initWithDate:self->_startDate];
  monthlyChooser = self->_monthlyChooser;
  self->_monthlyChooser = v5;

  [(TTRIRecurrenceMonthlyChooserController *)self->_monthlyChooser setDelegate:self];
  v7 = [[TTRIRecurrenceMonthChooserController alloc] initWithDate:self->_startDate];
  yearlyChooser = self->_yearlyChooser;
  self->_yearlyChooser = v7;

  [(TTRIRecurrenceChooserController *)self->_yearlyChooser setDelegate:self];
  double v9 = [[TTRIRecurrenceOrdinalChooserController alloc] initWithDate:self->_startDate];
  yearlyOrdinalChooser = self->_yearlyOrdinalChooser;
  self->_yearlyOrdinalChooser = v9;

  [(TTRIRecurrenceChooserController *)self->_yearlyOrdinalChooser setDelegate:self];
  v11 = (UISwitch *)objc_opt_new();
  yearOrdinalSwitch = self->_yearOrdinalSwitch;
  self->_yearOrdinalSwitch = v11;

  [(UISwitch *)self->_yearOrdinalSwitch addTarget:self action:sel__yearOrdinalSwitchChanged_ forControlEvents:4096];
  id v13 = objc_alloc(MEMORY[0x1E4FB1A98]);
  v14 = (UIPickerView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  frequencyPickerView = self->_frequencyPickerView;
  self->_frequencyPickerView = v14;

  [(UIPickerView *)self->_frequencyPickerView setDelegate:self];
  [(UIPickerView *)self->_frequencyPickerView setDataSource:self];
  [(UIPickerView *)self->_frequencyPickerView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_initWeak(&location, self);
  v16 = [TTRICustomRecurrenceIntervalViewController alloc];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __64__TTRICustomRecurrenceViewController__createChoosersAndControls__block_invoke;
  v33 = &unk_1E61D3BB0;
  objc_copyWeak(&v34, &location);
  v17 = [(TTRICustomRecurrenceIntervalViewController *)v16 initWithSelectedInterval:1 frequency:0 changeBlock:&v30];
  intervalPickerViewController = self->_intervalPickerViewController;
  self->_intervalPickerViewController = v17;

  v19 = [TTRICustomRecurrenceTableViewCell alloc];
  v20 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:](v19, "initWithStyle:reuseIdentifier:", 1, 0, v30, v31, v32, v33);
  frequencySummaryCell = self->_frequencySummaryCell;
  self->_frequencySummaryCell = v20;

  v22 = RemindersUICoreBundleGet();
  v23 = [v22 localizedStringForKey:@"Frequency" value:@"Frequency" table:@"Localizable"];
  v24 = [(UITableViewCell *)self->_frequencySummaryCell textLabel];
  [v24 setText:v23];

  v25 = [[TTRICustomRecurrenceTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  intervalSummaryCell = self->_intervalSummaryCell;
  self->_intervalSummaryCell = &v25->super;

  if (self->_useClearBackground)
  {
    v27 = [MEMORY[0x1E4FB1618] clearColor];
    [(TTRIRecurrenceMonthlyChooserController *)self->_monthlyChooser setBackgroundColor:v27];

    v28 = [MEMORY[0x1E4FB1618] clearColor];
    [(TTRIRecurrenceChooserController *)self->_yearlyChooser setBackgroundColor:v28];

    v29 = [MEMORY[0x1E4FB1618] clearColor];
    [(TTRIRecurrenceChooserController *)self->_yearlyOrdinalChooser setBackgroundColor:v29];
  }
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __64__TTRICustomRecurrenceViewController__createChoosersAndControls__block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[123] != a2)
  {
    WeakRetained[123] = a2;
    v4 = WeakRetained;
    [WeakRetained _frequencyPickerViewUpdated];
    WeakRetained = v4;
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TTRICustomRecurrenceViewController;
  [(TTRICustomRecurrenceViewController *)&v3 viewDidLoad];
  [(TTRICustomRecurrenceViewController *)self _updateSummaryLabel];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(TTRICustomRecurrenceViewController *)self isBeingDismissed] & 1) != 0
    || [(TTRICustomRecurrenceViewController *)self isMovingFromParentViewController])
  {
    v5 = [(TTRICustomRecurrenceViewController *)self completionBlock];
    uint64_t v6 = [(TTRICustomRecurrenceViewController *)self recurrenceRule];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)TTRICustomRecurrenceViewController;
  [(TTRICustomRecurrenceViewController *)&v7 viewWillDisappear:v3];
}

- (void)setProhibitsHourlyRecurrence:(BOOL)a3
{
  if (self->_prohibitsHourlyRecurrence != a3)
  {
    self->_prohibitsHourlyRecurrence = a3;
    v4 = [(TTRICustomRecurrenceViewController *)self cachedAvailableRecurrenceFrequencies];

    if (v4)
    {
      [(TTRICustomRecurrenceViewController *)self setCachedAvailableRecurrenceFrequencies:0];
      id v5 = [(TTRICustomRecurrenceViewController *)self frequencyPickerView];
      [v5 reloadAllComponents];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(TTRICustomRecurrenceViewController *)self _numberOfRowsForSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(TTRICustomRecurrenceViewController *)self _tagForIndexPath:v5];
  switch(v6)
  {
    case 0:
    case 2:
    case 4:
    case 5:
      objc_super v7 = [[TTRICustomRecurrenceTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
      [(TTRICustomRecurrenceTableViewCell *)v7 setSelectionStyle:0];
      goto LABEL_4;
    case 1:
      objc_super v7 = self->_frequencySummaryCell;
LABEL_7:
      v17 = [(TTRICustomRecurrenceViewController *)self _stringForFrequency:self->_cachedFrequency];
      v18 = [(TTRICustomRecurrenceTableViewCell *)v7 detailTextLabel];
      goto LABEL_10;
    case 3:
      objc_super v7 = self->_intervalSummaryCell;
LABEL_9:
      v19 = [(TTRICustomRecurrenceViewController *)self _stringForFrequency:self->_cachedFrequency interval:self->_cachedInterval];
      v20 = [(TTRICustomRecurrenceTableViewCell *)v7 detailTextLabel];
      [v20 setText:v19];

      v17 = [(TTRICustomRecurrenceViewController *)self _localizedEveryStringForFrequency:self->_cachedFrequency interval:self->_cachedInterval];
      v18 = [(TTRICustomRecurrenceTableViewCell *)v7 textLabel];
LABEL_10:
      v21 = v18;
      [v18 setText:v17];

      goto LABEL_14;
    case 6:
      v22 = [(TTRICustomRecurrenceViewController *)self yearlyOrdinalChooser];
      goto LABEL_13;
    case 7:
      v22 = [(TTRICustomRecurrenceViewController *)self currentChooser];
LABEL_13:
      v17 = v22;
      objc_msgSend(v22, "cellForRow:", objc_msgSend(v5, "row"));
      objc_super v7 = (TTRICustomRecurrenceTableViewCell *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      break;
    default:
      objc_super v7 = 0;
LABEL_4:
      switch(v6)
      {
        case 1:
          goto LABEL_7;
        case 2:
          double v8 = [(TTRICustomRecurrenceTableViewCell *)v7 contentView];
          [v8 addSubview:self->_frequencyPickerView];

          double v9 = [(TTRICustomRecurrenceTableViewCell *)v7 contentView];
          id v10 = (void *)MEMORY[0x1E4F28DC8];
          v11 = _NSDictionaryOfVariableBindings(&cfstr_Frequencypicke.isa, self->_frequencyPickerView, 0);
          v12 = [v10 constraintsWithVisualFormat:@"H:|[_frequencyPickerView]|" options:0 metrics:0 views:v11];
          [v9 addConstraints:v12];

          id v13 = [(TTRICustomRecurrenceTableViewCell *)v7 contentView];
          v14 = (void *)MEMORY[0x1E4F28DC8];
          v15 = _NSDictionaryOfVariableBindings(&cfstr_Frequencypicke.isa, self->_frequencyPickerView, 0);
          v16 = [v14 constraintsWithVisualFormat:@"V:|[_frequencyPickerView]|" options:0 metrics:0 views:v15];
          [v13 addConstraints:v16];

          [(UIPickerView *)self->_frequencyPickerView selectRow:[(TTRICustomRecurrenceViewController *)self _pickerRowForRecurrenceFrequency:self->_cachedFrequency] inComponent:0 animated:0];
          break;
        case 3:
          goto LABEL_9;
        case 4:
          v27 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
          v28 = [v27 view];

          [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
          v29 = [(TTRICustomRecurrenceTableViewCell *)v7 contentView];
          [v29 addSubview:v28];

          uint64_t v30 = [(TTRICustomRecurrenceTableViewCell *)v7 contentView];
          uint64_t v31 = (void *)MEMORY[0x1E4F28DC8];
          v32 = _NSDictionaryOfVariableBindings(&cfstr_Pickerview.isa, v28, 0);
          v33 = [v31 constraintsWithVisualFormat:@"H:|[pickerView]|" options:0 metrics:0 views:v32];
          [v30 addConstraints:v33];

          id v34 = [(TTRICustomRecurrenceTableViewCell *)v7 contentView];
          v35 = (void *)MEMORY[0x1E4F28DC8];
          v36 = _NSDictionaryOfVariableBindings(&cfstr_Pickerview.isa, v28, 0);
          v37 = [v35 constraintsWithVisualFormat:@"V:|[pickerView]|" options:0 metrics:0 views:v36];
          [v34 addConstraints:v37];

          int64_t cachedFrequency = self->_cachedFrequency;
          v39 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
          [v39 setFrequency:cachedFrequency];

          int64_t cachedInterval = self->_cachedInterval;
          v41 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
          [v41 setInterval:cachedInterval];

          if ([(TTRICustomRecurrenceViewController *)self prohibitsYearlyRecurrenceInterval]&& self->_cachedFrequency == 3)
          {
            v42 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
            v43 = v42;
            uint64_t v44 = 1;
          }
          else
          {
            v42 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
            v43 = v42;
            uint64_t v44 = 0;
          }
          [v42 setMaximumInterval:v44];

          break;
        case 5:
          v24 = RemindersUICoreBundleGet();
          v25 = [v24 localizedStringForKey:@"Days of Week" value:@"Days of Week" table:@"Localizable"];
          v26 = [(TTRICustomRecurrenceTableViewCell *)v7 textLabel];
          [v26 setText:v25];

          [(TTRICustomRecurrenceTableViewCell *)v7 setAccessoryView:self->_yearOrdinalSwitch];
          break;
        default:
          goto LABEL_15;
      }
      break;
  }
LABEL_15:

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3 = self->_cachedFrequency - 1;
  if (v3 > 2) {
    return 1;
  }
  else {
    return qword_1B9977FB8[v3];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  switch([(TTRICustomRecurrenceViewController *)self _tagForIndexPath:v8])
  {
    case 0:
    case 1:
    case 3:
    case 5:
      [v7 rowHeight];
      double v4 = v9;
      break;
    case 2:
      id v10 = [(TTRICustomRecurrenceViewController *)self frequencyPickerView];
      objc_msgSend(v10, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
      double v4 = v11;
      goto LABEL_8;
    case 4:
      id v10 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
      v12 = [v10 view];
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
      double v4 = v13;

      goto LABEL_8;
    case 6:
      v14 = [(TTRICustomRecurrenceViewController *)self yearlyOrdinalChooser];
      goto LABEL_7;
    case 7:
      v14 = [(TTRICustomRecurrenceViewController *)self currentChooser];
LABEL_7:
      id v10 = v14;
      objc_msgSend(v14, "heightForRow:", objc_msgSend(v8, "row"));
      double v4 = v15;
LABEL_8:

      break;
    default:
      break;
  }

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [a3 cellForRowAtIndexPath:v5];
  if ([v6 selectionStyle]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:v8 animated:1];
  int64_t v6 = [(TTRICustomRecurrenceViewController *)self _tagForIndexPath:v8];
  if (v6 == 1 || v6 == 3)
  {
    [(TTRICustomRecurrenceViewController *)self _toggleInlineSpinnerForTag:v6];
  }
  else if (v6 == 7)
  {
    id v7 = [(TTRICustomRecurrenceViewController *)self currentChooser];
    objc_msgSend(v7, "rowTapped:", objc_msgSend(v8, "row"));
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    int64_t v6 = 0;
  }
  else
  {
    int64_t v6 = [(TTRICustomRecurrenceViewController *)self recurrenceSummaryString];
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_useClearBackground
    || [v9 section] == 1
    && ([(TTRICustomRecurrenceViewController *)self currentChooser],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_msgSend(v14, "drawBackgroundForRow:", objc_msgSend(v10, "row")),
        v14,
        (v15 & 1) == 0))
  {
    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBackgroundColor:v11];

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    double v13 = [v8 backgroundView];
    [v13 setBackgroundColor:v12];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4 = [(TTRICustomRecurrenceViewController *)self _availableRecurrenceFrequencies];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  int64_t v6 = [(TTRICustomRecurrenceViewController *)self _recurrenceFrequencyForPickerRow:a4];

  return [(TTRICustomRecurrenceViewController *)self _stringForFrequency:v6];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  int64_t v6 = [(TTRICustomRecurrenceViewController *)self _recurrenceFrequencyForPickerRow:a4];
  if (self->_cachedFrequency != v6)
  {
    self->_int64_t cachedFrequency = v6;
    [(TTRICustomRecurrenceViewController *)self _frequencyPickerViewUpdated];
    [(TTRICustomRecurrenceViewController *)self _updateIntervalPicker];
  }
}

- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    int64_t v5 = RemindersUICoreBundleGet();
    uint64_t v4 = [v5 localizedStringForKey:@"Frequency Option" value:@"Frequency Option" table:@"Localizable"];
  }

  return v4;
}

- (int64_t)_pickerRowForRecurrenceFrequency:(int64_t)a3
{
  uint64_t v4 = [(TTRICustomRecurrenceViewController *)self _availableRecurrenceFrequencies];
  int64_t v5 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v6;
  }
}

- (int64_t)_recurrenceFrequencyForPickerRow:(int64_t)a3
{
  uint64_t v4 = [(TTRICustomRecurrenceViewController *)self _availableRecurrenceFrequencies];
  int64_t v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (id)_availableRecurrenceFrequencies
{
  unint64_t v3 = [(TTRICustomRecurrenceViewController *)self cachedAvailableRecurrenceFrequencies];

  if (!v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    if (![(TTRICustomRecurrenceViewController *)self prohibitsHourlyRecurrence]) {
      [v4 addObject:&unk_1F1336438];
    }
    [v4 addObject:&unk_1F1336450];
    [v4 addObject:&unk_1F1336468];
    [v4 addObject:&unk_1F1336480];
    [v4 addObject:&unk_1F1336498];
    [(TTRICustomRecurrenceViewController *)self setCachedAvailableRecurrenceFrequencies:v4];
  }

  return [(TTRICustomRecurrenceViewController *)self cachedAvailableRecurrenceFrequencies];
}

- (void)recurrenceChooserUpdated:(id)a3
{
  [(TTRICustomRecurrenceViewController *)self _updateRecurrenceRule];

  [(TTRICustomRecurrenceViewController *)self _collapseAllPickers];
}

- (void)recurrenceChooserWantsReload:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__TTRICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke;
  v3[3] = &unk_1E61D39F0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __67__TTRICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v2 reloadSections:v1 withRowAnimation:0];
}

- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__TTRICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke;
  v4[3] = &unk_1E61D3A40;
  v4[4] = self;
  v4[5] = a4;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

void __71__TTRICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tableView];
  unint64_t v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 40) inSection:1];
  v5[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 reloadRowsAtIndexPaths:v4 withRowAnimation:0];
}

- (void)_updateRecurrenceRule
{
  int64_t cachedFrequency = self->_cachedFrequency;
  int64_t cachedInterval = self->_cachedInterval;
  id v11 = (id)objc_opt_new();
  int64_t v5 = [(TTRICustomRecurrenceViewController *)self currentChooser];
  int64_t v6 = v5;
  if (v5)
  {
    int64_t cachedFrequency = [v5 frequency];
    [v6 updateRecurrenceRuleBuilder:v11];
  }
  [v11 setFrequency:cachedFrequency];
  [v11 setInterval:cachedInterval];
  id v7 = [(TTRICustomRecurrenceViewController *)self yearlyChooser];
  if (v6 == v7)
  {
    id v8 = [(TTRICustomRecurrenceViewController *)self yearOrdinalSwitch];
    int v9 = [v8 isOn];

    if (!v9) {
      goto LABEL_7;
    }
    id v7 = [(TTRICustomRecurrenceViewController *)self yearlyOrdinalChooser];
    [v7 updateRecurrenceRuleBuilder:v11];
  }

LABEL_7:
  id v10 = objc_msgSend(v11, "recurrenceRuleWithFirstDayOfTheWeek:", -[REMRecurrenceRule firstDayOfTheWeek](self->_cachedRecurrenceRule, "firstDayOfTheWeek"));
  [(TTRICustomRecurrenceViewController *)self setRecurrenceRule:v10 shouldUpdatePickers:0];
}

- (id)recurrenceRule
{
  cachedRecurrenceRule = self->_cachedRecurrenceRule;
  if (!cachedRecurrenceRule)
  {
    [(TTRICustomRecurrenceViewController *)self _updateRecurrenceRule];
    cachedRecurrenceRule = self->_cachedRecurrenceRule;
  }

  return cachedRecurrenceRule;
}

- (void)setRecurrenceRule:(id)a3
{
}

- (void)setRecurrenceRule:(id)a3 shouldUpdatePickers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (REMRecurrenceRule *)a3;
  if (self->_cachedRecurrenceRule != v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_cachedRecurrenceRule, a3);
    id v7 = v8;
    if (v8)
    {
      [(TTRICustomRecurrenceViewController *)self _updateSummaryLabel];
      id v7 = v8;
    }
    if (v4)
    {
      [(TTRICustomRecurrenceViewController *)self _refreshCacheAndPickers];
      id v7 = v8;
    }
  }
}

- (void)_refreshCacheAndPickers
{
  self->_int64_t cachedInterval = [(REMRecurrenceRule *)self->_cachedRecurrenceRule interval];
  self->_int64_t cachedFrequency = [(REMRecurrenceRule *)self->_cachedRecurrenceRule frequency];
  uint64_t v3 = [(id)objc_opt_class() isRecurrenceRuleOrdinal:self->_cachedRecurrenceRule];
  [(TTRICustomRecurrenceViewController *)self _updateCustomPickerView];
  if ([(REMRecurrenceRule *)self->_cachedRecurrenceRule frequency] == 3)
  {
    id v4 = [(TTRICustomRecurrenceViewController *)self yearOrdinalSwitch];
    [v4 setOn:v3];
  }
}

+ (BOOL)isRecurrenceRuleOrdinal:(id)a3
{
  id v3 = a3;
  id v4 = [v3 setPositions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else if ([v3 frequency] == 2 || objc_msgSend(v3, "frequency") == 3)
  {
    id v7 = [v3 daysOfTheWeek];
    BOOL v6 = [v7 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  id v2 = [(TTRICustomRecurrenceViewController *)self monthlyChooser];
  char v3 = [v2 prohibitsMultipleDaysInMonthlyRecurrence];

  return v3;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TTRICustomRecurrenceViewController *)self monthlyChooser];
  [v4 setProhibitsMultipleDaysInMonthlyRecurrence:v3];
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  id v2 = [(TTRICustomRecurrenceViewController *)self yearlyChooser];
  char v3 = [v2 prohibitsMultipleMonthsInYearlyRecurrence];

  return v3;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TTRICustomRecurrenceViewController *)self yearlyChooser];
  [v4 setProhibitsMultipleMonthsInYearlyRecurrence:v3];
}

- (void)_updateSummaryLabel
{
  BOOL v3 = (void *)MEMORY[0x1E4F94BE0];
  id v4 = [(TTRICustomRecurrenceViewController *)self recurrenceRule];
  uint64_t v5 = [(TTRICustomRecurrenceViewController *)self startDate];
  BOOL v6 = [v3 naturalLanguageDescriptionForRecurrenceRule:v4 withStartDate:v5];
  [(TTRICustomRecurrenceViewController *)self setRecurrenceSummaryString:v6];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__TTRICustomRecurrenceViewController__updateSummaryLabel__block_invoke;
  v7[3] = &unk_1E61D39F0;
  v7[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
}

void __57__TTRICustomRecurrenceViewController__updateSummaryLabel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 reloadSections:v1 withRowAnimation:5];
}

- (void)_updateCustomPickerView
{
  BOOL v3 = [(TTRICustomRecurrenceViewController *)self currentChooser];
  uint64_t v4 = [v3 frequency];

  uint64_t v5 = [(TTRICustomRecurrenceViewController *)self _chooserForFrequency:self->_cachedFrequency];
  [(TTRICustomRecurrenceViewController *)self setCurrentChooser:v5];

  BOOL v6 = [(TTRICustomRecurrenceViewController *)self currentChooser];
  uint64_t v7 = [v6 frequency];

  id v8 = [(TTRICustomRecurrenceViewController *)self currentChooser];
  [v8 updateFromRecurrenceRule:self->_cachedRecurrenceRule];

  [(TTRICustomRecurrenceViewController *)self _updateTableSectionsFromFrequency:v4 toFrequency:v7];
}

- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4
{
  uint64_t v7 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v7 beginUpdates];

  if (a3 == 3 || a4 != 3)
  {
    if (a3 == 3 && a4 != 3)
    {
      double v13 = [(TTRICustomRecurrenceViewController *)self tableView];
      v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
      [v13 deleteSections:v14 withRowAnimation:6];

      BOOL v10 = a4 != 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = [(TTRICustomRecurrenceViewController *)self tableView];
    int v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
    [v8 insertSections:v9 withRowAnimation:6];
  }
  BOOL v10 = a4 != 0;
  if (!a3 && a4)
  {
    id v11 = [(TTRICustomRecurrenceViewController *)self tableView];
    v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v11 insertSections:v12 withRowAnimation:6];
LABEL_13:

    goto LABEL_14;
  }
LABEL_10:
  if (a3 && !a4)
  {
    id v11 = [(TTRICustomRecurrenceViewController *)self tableView];
    v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v11 deleteSections:v12 withRowAnimation:6];
    goto LABEL_13;
  }
  char v16 = !v10;
  if (a3 == a4) {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__TTRICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke;
    v17[3] = &unk_1E61D39F0;
    v17[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
  }
LABEL_14:
  char v15 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v15 endUpdates];

  [(TTRICustomRecurrenceViewController *)self calculatePreferredContentSize];
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

void __84__TTRICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v2 reloadSections:v1 withRowAnimation:0];
}

- (void)_updateFrequencyRows
{
  v8[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  if (self->_showingFrequencyPicker) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
  BOOL v6 = [(TTRICustomRecurrenceViewController *)self tableView];
  v8[0] = v3;
  v8[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v6 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
}

- (void)_frequencyPickerViewUpdated
{
  [(TTRICustomRecurrenceViewController *)self _updateCustomPickerView];
  [(TTRICustomRecurrenceViewController *)self _updateRecurrenceRule];

  [(TTRICustomRecurrenceViewController *)self _updateFrequencyRows];
}

- (void)_updateIntervalPicker
{
  int64_t cachedFrequency = self->_cachedFrequency;
  uint64_t v4 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
  [v4 setFrequency:cachedFrequency];

  int64_t cachedInterval = self->_cachedInterval;
  id v6 = [(TTRICustomRecurrenceViewController *)self intervalPickerViewController];
  [v6 setInterval:cachedInterval];
}

- (id)_chooserForFrequency:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      BOOL v3 = [(TTRICustomRecurrenceViewController *)self yearlyChooser];
      break;
    case 2:
      BOOL v3 = [(TTRICustomRecurrenceViewController *)self monthlyChooser];
      break;
    case 1:
      BOOL v3 = [(TTRICustomRecurrenceViewController *)self weeklyChooser];
      break;
    default:
      BOOL v3 = 0;
      break;
  }

  return v3;
}

- (void)_yearOrdinalSwitchChanged:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28D58];
  id v5 = a3;
  id v6 = [v4 indexPathForRow:1 inSection:2];
  int v7 = [v5 isOn];

  id v8 = [(TTRICustomRecurrenceViewController *)self tableView];
  if (v7)
  {
    v12[0] = v6;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v8 insertRowsAtIndexPaths:v9 withRowAnimation:6];

    id v8 = [(TTRICustomRecurrenceViewController *)self tableView];
    [v8 scrollToRowAtIndexPath:v6 atScrollPosition:3 animated:1];
  }
  else
  {
    id v11 = v6;
    BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v8 deleteRowsAtIndexPaths:v10 withRowAnimation:6];
  }
  [(TTRICustomRecurrenceViewController *)self _collapseAllPickers];
  [(TTRICustomRecurrenceViewController *)self _updateRecurrenceRule];
  [(TTRICustomRecurrenceViewController *)self calculatePreferredContentSize];
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)_stringForFrequency:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      BOOL v3 = CUIKStringForRepeatType();
      break;
    case 4:
      uint64_t v4 = RemindersUICoreBundleGet();
      BOOL v3 = [v4 localizedStringForKey:@"Hourly" value:@"Hourly" table:@"Localizable"];

      break;
    default:
      break;
  }

  return v3;
}

- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      id v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      int v7 = @"%d days (every)";
      goto LABEL_8;
    case 1:
      id v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      int v7 = @"%d weeks (every)";
      goto LABEL_8;
    case 2:
      id v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      int v7 = @"%d months (every)";
      goto LABEL_8;
    case 3:
      id v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      int v7 = @"%d years (every)";
      goto LABEL_8;
    case 4:
      id v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      int v7 = @"%d hours (every)";
LABEL_8:
      id v8 = [v5 localizedStringForKey:v7 value:&stru_1F130F620 table:@"PluralLocalizable"];

      break;
    default:
      id v8 = 0;
      break;
  }
  int v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, a4);

  return v9;
}

- (int64_t)_tagForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  if (v6 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      if (v5) {
        return 6;
      }
      else {
        return 5;
      }
    }
    return 0;
  }
  if (v6 == 1) {
    return 7;
  }
  if (v6) {
    return 0;
  }
  if (!v5) {
    return 1;
  }
  if (v5 == 2)
  {
    if (self->_showingIntervalPicker) {
      return 4;
    }
  }
  else if (v5 == 1 && self->_showingFrequencyPicker)
  {
    return 2;
  }
  return 3;
}

- (int64_t)_numberOfRowsForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      int v7 = [(TTRICustomRecurrenceViewController *)self yearOrdinalSwitch];
      if ([v7 isOn]) {
        int64_t v3 = 2;
      }
      else {
        int64_t v3 = 1;
      }

      return v3;
    }
    return 0;
  }
  if (a3 == 1)
  {
    id v4 = [(TTRICustomRecurrenceViewController *)self currentChooser];
    int64_t v5 = [v4 numberOfRows];

    return v5;
  }
  if (a3) {
    return 0;
  }
  return self->_showingIntervalPicker + (unint64_t)self->_showingFrequencyPicker + 2;
}

- (void)_toggleInlineSpinnerForTag:(int64_t)a3
{
  int64_t v5 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v5 beginUpdates];

  if (a3 == 3)
  {
    [(TTRICustomRecurrenceViewController *)self _setShowingIntervalPicker:!self->_showingIntervalPicker];
  }
  else if (a3 == 1)
  {
    [(TTRICustomRecurrenceViewController *)self _setShowingFrequencyPicker:!self->_showingFrequencyPicker];
  }
  uint64_t v6 = [(TTRICustomRecurrenceViewController *)self tableView];
  [v6 endUpdates];

  [(TTRICustomRecurrenceViewController *)self calculatePreferredContentSize];

  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_collapseAllPickers
{
  [(TTRICustomRecurrenceViewController *)self _setShowingFrequencyPicker:0];

  [(TTRICustomRecurrenceViewController *)self _setShowingIntervalPicker:0];
}

- (void)_setShowingFrequencyPicker:(BOOL)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_showingFrequencyPicker == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_BOOL showingFrequencyPicker = a3;
  int64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
  BOOL showingFrequencyPicker = self->_showingFrequencyPicker;
  int v7 = [(TTRICustomRecurrenceViewController *)self tableView];
  if (!showingFrequencyPicker)
  {
    id v11 = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:6];

    if (v3) {
      goto LABEL_4;
    }
LABEL_6:
    int v9 = [MEMORY[0x1E4FB1618] tableCellGrayTextColor];
    goto LABEL_7;
  }
  v12[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 insertRowsAtIndexPaths:v8 withRowAnimation:6];

  [(TTRICustomRecurrenceViewController *)self _setShowingIntervalPicker:0];
  if (!v3) {
    goto LABEL_6;
  }
LABEL_4:
  id v8 = [(TTRICustomRecurrenceViewController *)self view];
  int v9 = [v8 tintColor];
LABEL_7:
  BOOL v10 = [(UITableViewCell *)self->_frequencySummaryCell detailTextLabel];
  [v10 setTextColor:v9];

  if (v3)
  {

    int v9 = v8;
  }

  [(TTRICustomRecurrenceViewController *)self calculatePreferredContentSize];
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setShowingIntervalPicker:(BOOL)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_showingIntervalPicker == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_BOOL showingIntervalPicker = a3;
  int64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:2 inSection:0];
  BOOL showingIntervalPicker = self->_showingIntervalPicker;
  int v7 = [(TTRICustomRecurrenceViewController *)self tableView];
  if (!showingIntervalPicker)
  {
    id v11 = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:6];

    if (v3) {
      goto LABEL_4;
    }
LABEL_6:
    int v9 = [MEMORY[0x1E4FB1618] tableCellGrayTextColor];
    goto LABEL_7;
  }
  v12[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 insertRowsAtIndexPaths:v8 withRowAnimation:6];

  [(TTRICustomRecurrenceViewController *)self _setShowingFrequencyPicker:0];
  if (!v3) {
    goto LABEL_6;
  }
LABEL_4:
  id v8 = [(TTRICustomRecurrenceViewController *)self view];
  int v9 = [v8 tintColor];
LABEL_7:
  BOOL v10 = [(UITableViewCell *)self->_intervalSummaryCell detailTextLabel];
  [v10 setTextColor:v9];

  if (v3)
  {

    int v9 = v8;
  }

  [(TTRICustomRecurrenceViewController *)self calculatePreferredContentSize];
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)_localizedEveryStringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int v7 = @"Every-everyDay";
      goto LABEL_8;
    case 1:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int v7 = @"Every-everyWeek";
      goto LABEL_8;
    case 2:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int v7 = @"Every-everyMonth";
      goto LABEL_8;
    case 3:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int v7 = @"Every-everyYear";
      goto LABEL_8;
    case 4:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int v7 = @"Every-everyHour";
LABEL_8:
      id v8 = [v5 localizedStringForKey:v7 value:@"Every" table:@"PluralLocalizable"];

      break;
    default:
      id v8 = 0;
      break;
  }
  int v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, a4);

  return v9;
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return self->_prohibitsYearlyRecurrenceInterval;
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  self->_prohibitsYearlyRecurrenceInterval = a3;
}

- (BOOL)prohibitsHourlyRecurrence
{
  return self->_prohibitsHourlyRecurrence;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 1032, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setTableView:(id)a3
{
}

- (TTRIRecurrenceChooserController)currentChooser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentChooser);

  return (TTRIRecurrenceChooserController *)WeakRetained;
}

- (void)setCurrentChooser:(id)a3
{
}

- (TTRIRecurrenceWeekdayChooserController)weeklyChooser
{
  return (TTRIRecurrenceWeekdayChooserController *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setWeeklyChooser:(id)a3
{
}

- (TTRIRecurrenceMonthlyChooserController)monthlyChooser
{
  return (TTRIRecurrenceMonthlyChooserController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setMonthlyChooser:(id)a3
{
}

- (TTRIRecurrenceMonthChooserController)yearlyChooser
{
  return (TTRIRecurrenceMonthChooserController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setYearlyChooser:(id)a3
{
}

- (TTRIRecurrenceOrdinalChooserController)yearlyOrdinalChooser
{
  return (TTRIRecurrenceOrdinalChooserController *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setYearlyOrdinalChooser:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setTimeZone:(id)a3
{
}

- (UIPickerView)frequencyPickerView
{
  return (UIPickerView *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setFrequencyPickerView:(id)a3
{
}

- (TTRICustomRecurrenceIntervalViewController)intervalPickerViewController
{
  return (TTRICustomRecurrenceIntervalViewController *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setIntervalPickerViewController:(id)a3
{
}

- (UISwitch)yearOrdinalSwitch
{
  return (UISwitch *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setYearOrdinalSwitch:(id)a3
{
}

- (NSString)recurrenceSummaryString
{
  return (NSString *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setRecurrenceSummaryString:(id)a3
{
}

- (NSArray)cachedAvailableRecurrenceFrequencies
{
  return (NSArray *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setCachedAvailableRecurrenceFrequencies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableRecurrenceFrequencies, 0);
  objc_storeStrong((id *)&self->_recurrenceSummaryString, 0);
  objc_storeStrong((id *)&self->_yearOrdinalSwitch, 0);
  objc_storeStrong((id *)&self->_intervalPickerViewController, 0);
  objc_storeStrong((id *)&self->_frequencyPickerView, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_yearlyOrdinalChooser, 0);
  objc_storeStrong((id *)&self->_yearlyChooser, 0);
  objc_storeStrong((id *)&self->_monthlyChooser, 0);
  objc_storeStrong((id *)&self->_weeklyChooser, 0);
  objc_destroyWeak((id *)&self->_currentChooser);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_intervalSummaryCell, 0);
  objc_storeStrong((id *)&self->_frequencySummaryCell, 0);

  objc_storeStrong((id *)&self->_cachedRecurrenceRule, 0);
}

@end