@interface TTRICustomRecurrenceEditorViewController
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
- (TTRICustomRecurrenceEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TTRICustomRecurrenceEditorViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5;
- (TTRIRecurrenceChooserController)currentChooser;
- (TTRIRecurrenceMonthChooserController)yearlyChooser;
- (TTRIRecurrenceMonthlyChooserController)monthlyChooser;
- (TTRIRecurrenceOrdinalChooserController)yearlyOrdinalChooser;
- (TTRIRecurrenceWeekdayChooserController)weeklyChooser;
- (UISwitch)yearOrdinalSwitch;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_availableRecurrenceFrequencies;
- (id)_chooserForFrequency:(int64_t)a3;
- (id)_localizedEveryStringForFrequency:(int64_t)a3 interval:(int64_t)a4;
- (id)_stringForFrequency:(int64_t)a3;
- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4;
- (id)completionBlock;
- (id)frequencyTypeMenu;
- (id)recurrenceRule;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_numberOfRowsForSection:(int64_t)a3;
- (int64_t)_tagForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_createChoosersAndControls;
- (void)_frequencyUpdated;
- (void)_refreshCacheAndPickers;
- (void)_updateCustomPickerView;
- (void)_updateFrequencyRows;
- (void)_updateRecurrenceRule;
- (void)_updateRecurrenceRuleWithoutBatching;
- (void)_updateSummaryLabel;
- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4;
- (void)_yearOrdinalSwitchChanged:(id)a3;
- (void)didSelectFrequencyType:(int64_t)a3;
- (void)didSelectIntervalType:(int64_t)a3;
- (void)intervalChooserDidUpdateValue:(int64_t)a3;
- (void)loadView;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)queuePreferredContentSizeRefresh;
- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4;
- (void)recurrenceChooserWantsReload:(id)a3;
- (void)resetBackgroundColor;
- (void)setCachedAvailableRecurrenceFrequencies:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentChooser:(id)a3;
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
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TTRICustomRecurrenceEditorViewController

- (TTRICustomRecurrenceEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)TTRICustomRecurrenceEditorViewController;
  v4 = [(TTRICustomRecurrenceEditorViewController *)&v13 initWithNibName:a3 bundle:a4];
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
    [(TTRICustomRecurrenceEditorViewController *)v5 setTitle:v11];
  }
  return v5;
}

- (TTRICustomRecurrenceEditorViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(TTRICustomRecurrenceEditorViewController *)self initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_timeZone, a4);
    v12->_useClearBackground = a5;
    [(TTRICustomRecurrenceEditorViewController *)v12 _createChoosersAndControls];
  }

  return v12;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(TTRICustomRecurrenceEditorViewController *)self setTableView:v4];

  v5 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v5 setDelegate:self];

  uint64_t v6 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v6 setDataSource:self];

  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v7 lineHeight];
  double v9 = v8;
  id v10 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v10 setEstimatedRowHeight:v9];

  if (self->_useClearBackground)
  {
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    v12 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
    [v12 setBackgroundColor:v11];
  }
  id v13 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [(TTRICustomRecurrenceEditorViewController *)self setView:v13];
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)TTRICustomRecurrenceEditorViewController;
  [(TTRICustomRecurrenceEditorViewController *)&v6 viewDidLoad];
  [(TTRICustomRecurrenceEditorViewController *)self resetBackgroundColor];
  v7[0] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__TTRICustomRecurrenceEditorViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_1E61D39C8;
  v5[4] = self;
  id v4 = (id)[(TTRICustomRecurrenceEditorViewController *)self registerForTraitChanges:v3 withHandler:v5];
}

uint64_t __55__TTRICustomRecurrenceEditorViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetBackgroundColor];
}

- (void)queuePreferredContentSizeRefresh
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__TTRICustomRecurrenceEditorViewController_queuePreferredContentSizeRefresh__block_invoke;
  block[3] = &unk_1E61D39F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__TTRICustomRecurrenceEditorViewController_queuePreferredContentSizeRefresh__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) calculatePreferredContentSize];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setPreferredContentSize:");
}

- (CGSize)calculatePreferredContentSize
{
  v2 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v2 contentSize];
  double v4 = v3;

  double v5 = 320.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)resetBackgroundColor
{
  if (-[TTRICustomRecurrenceEditorViewController isPresentedInsidePopover](self, "isPresentedInsidePopover")&& (-[TTRICustomRecurrenceEditorViewController traitCollection](self, "traitCollection"), double v3 = objc_claimAutoreleasedReturnValue(), v4 = [v3 userInterfaceStyle], v3, v4 < 2))
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  id v7 = (id)v5;
  double v6 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v6 setBackgroundColor:v7];
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
  uint64_t v5 = [[TTRIRecurrenceMonthlyChooserController alloc] initWithDate:self->_startDate];
  monthlyChooser = self->_monthlyChooser;
  self->_monthlyChooser = v5;

  [(TTRIRecurrenceMonthlyChooserController *)self->_monthlyChooser setDelegate:self];
  id v7 = [[TTRIRecurrenceMonthChooserController alloc] initWithDate:self->_startDate];
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
  id v13 = [TTRICustomRecurrenceEditorTableViewCell alloc];
  double v14 = *MEMORY[0x1E4F1DB28];
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v18 = -[TTRICustomRecurrenceEditorTableViewCell initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
  frequencySummaryCell = self->_frequencySummaryCell;
  self->_frequencySummaryCell = v18;

  v20 = self->_frequencySummaryCell;
  v21 = RemindersUICoreBundleGet();
  v22 = [v21 localizedStringForKey:@"Frequency" value:@"Frequency" table:@"Localizable"];
  [(TTRIPopupMenuTableViewCell *)v20 setTitle:v22];

  v23 = self->_frequencySummaryCell;
  v24 = [(TTRICustomRecurrenceEditorViewController *)self frequencyTypeMenu];
  [(TTRIPopupMenuTableViewCell *)v23 setPopupMenu:v24];

  v25 = self->_frequencySummaryCell;
  v26 = [(TTRICustomRecurrenceEditorViewController *)self _stringForFrequency:self->_cachedFrequency];
  [(TTRIPopupMenuTableViewCell *)v25 setAccessoryTitle:v26];

  v27 = -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell initWithFrame:]([TTRICustomRecurrenceEditorIntervalChooserTableViewCell alloc], "initWithFrame:", v14, v15, v16, v17);
  intervalSummaryCell = self->_intervalSummaryCell;
  self->_intervalSummaryCell = v27;

  [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self->_intervalSummaryCell setIntervalValue:1];
  [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self->_intervalSummaryCell setDelegate:self];
  if (self->_useClearBackground)
  {
    v29 = [MEMORY[0x1E4FB1618] clearColor];
    [(TTRIRecurrenceMonthlyChooserController *)self->_monthlyChooser setBackgroundColor:v29];

    v30 = [MEMORY[0x1E4FB1618] clearColor];
    [(TTRIRecurrenceChooserController *)self->_yearlyChooser setBackgroundColor:v30];

    id v31 = [MEMORY[0x1E4FB1618] clearColor];
    [(TTRIRecurrenceChooserController *)self->_yearlyOrdinalChooser setBackgroundColor:v31];
  }
}

- (void)intervalChooserDidUpdateValue:(int64_t)a3
{
  self->_cachedInterval = a3;
  [(TTRICustomRecurrenceEditorViewController *)self _frequencyUpdated];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TTRICustomRecurrenceEditorViewController;
  [(TTRICustomRecurrenceEditorViewController *)&v5 viewWillAppear:a3];
  [(TTRICustomRecurrenceEditorViewController *)self queuePreferredContentSizeRefresh];
  unint64_t v4 = [(TTRICustomRecurrenceEditorViewController *)self presentationController];
  [v4 setDelegate:self];
}

- (void)setProhibitsHourlyRecurrence:(BOOL)a3
{
  if (self->_prohibitsHourlyRecurrence != a3)
  {
    self->_prohibitsHourlyRecurrence = a3;
    unint64_t v4 = [(TTRICustomRecurrenceEditorViewController *)self cachedAvailableRecurrenceFrequencies];

    if (v4)
    {
      [(TTRICustomRecurrenceEditorViewController *)self setCachedAvailableRecurrenceFrequencies:0];
      [(TTRICustomRecurrenceEditorViewController *)self _frequencyUpdated];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(TTRICustomRecurrenceEditorViewController *)self _numberOfRowsForSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(TTRICustomRecurrenceEditorViewController *)self _tagForIndexPath:v5];
  switch(v6)
  {
    case 0:
    case 3:
      id v7 = [TTRICustomRecurrenceEditorTableViewCell alloc];
      double v8 = -[TTRICustomRecurrenceEditorTableViewCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)v8 setSelectionStyle:0];
      goto LABEL_4;
    case 1:
      double v8 = self->_frequencySummaryCell;
      goto LABEL_9;
    case 2:
      double v8 = self->_intervalSummaryCell;
      goto LABEL_15;
    case 4:
      v11 = [(TTRICustomRecurrenceEditorViewController *)self yearlyOrdinalChooser];
      goto LABEL_13;
    case 5:
      v11 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
LABEL_13:
      id v10 = v11;
      objc_msgSend(v11, "cellForRow:", objc_msgSend(v5, "row"));
      double v8 = (TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    default:
      double v8 = 0;
LABEL_4:
      if (v6 == 3)
      {
        v12 = RemindersUICoreBundleGet();
        id v13 = [v12 localizedStringForKey:@"Days of Week" value:@"Days of Week" table:@"Localizable"];
        objc_opt_class();
        double v14 = REMDynamicCast();
        double v15 = [v14 titleLabel];
        [v15 setText:v13];

        [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)v8 setAccessoryView:self->_yearOrdinalSwitch];
      }
      else
      {
        if (v6 == 2)
        {
LABEL_15:
          intervalSummaryCell = self->_intervalSummaryCell;
          double v17 = [(TTRICustomRecurrenceEditorViewController *)self _stringForFrequency:self->_cachedFrequency interval:self->_cachedInterval];
          [(TTRIPopupMenuTableViewCell *)intervalSummaryCell setAccessoryTitle:v17];

          v18 = self->_intervalSummaryCell;
          id v10 = [(TTRICustomRecurrenceEditorViewController *)self _localizedEveryStringForFrequency:self->_cachedFrequency interval:self->_cachedInterval];
          [(TTRIPopupMenuTableViewCell *)v18 setTitle:v10];
        }
        else
        {
          if (v6 != 1) {
            goto LABEL_17;
          }
LABEL_9:
          frequencySummaryCell = self->_frequencySummaryCell;
          id v10 = [(TTRICustomRecurrenceEditorViewController *)self _stringForFrequency:self->_cachedFrequency];
          [(TTRIPopupMenuTableViewCell *)frequencySummaryCell setAccessoryTitle:v10];
        }
LABEL_16:
      }
LABEL_17:

      return v8;
  }
}

- (void)didSelectFrequencyType:(int64_t)a3
{
  if (self->_cachedFrequency != a3)
  {
    self->_cachedFrequency = a3;
    [(TTRICustomRecurrenceEditorViewController *)self _frequencyUpdated];
  }
}

- (void)didSelectIntervalType:(int64_t)a3
{
  if (self->_cachedInterval != a3)
  {
    self->_cachedInterval = a3;
    [(TTRICustomRecurrenceEditorViewController *)self _frequencyUpdated];
  }
}

- (id)frequencyTypeMenu
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = [(TTRICustomRecurrenceEditorViewController *)self _availableRecurrenceFrequencies];
  objc_initWeak(&location, self);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        int64_t v8 = (int)[*(id *)(*((void *)&v17 + 1) + 8 * i) intValue];
        double v9 = [(TTRICustomRecurrenceEditorViewController *)self _stringForFrequency:v8];
        id v10 = (void *)MEMORY[0x1E4FB13F0];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __61__TTRICustomRecurrenceEditorViewController_frequencyTypeMenu__block_invoke;
        v15[3] = &unk_1E61D3A18;
        objc_copyWeak(v16, &location);
        v16[1] = (id)v8;
        v11 = [v10 actionWithTitle:v9 image:0 identifier:0 handler:v15];
        [v11 setState:self->_cachedFrequency == v8];
        [v3 addObject:v11];

        objc_destroyWeak(v16);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  v12 = [MEMORY[0x1E4FB1970] menuWithChildren:v3];
  objc_destroyWeak(&location);

  return v12;
}

void __61__TTRICustomRecurrenceEditorViewController_frequencyTypeMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained didSelectFrequencyType:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3 = self->_cachedFrequency - 1;
  if (v3 > 2) {
    return 1;
  }
  else {
    return qword_1B9977EC8[v3];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [(TTRICustomRecurrenceEditorViewController *)self _tagForIndexPath:v8];
  if (v9 >= 4)
  {
    if (v9 == 5)
    {
      v11 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
    }
    else
    {
      if (v9 != 4) {
        goto LABEL_8;
      }
      v11 = [(TTRICustomRecurrenceEditorViewController *)self yearlyOrdinalChooser];
    }
    v12 = v11;
    objc_msgSend(v11, "heightForRow:", objc_msgSend(v8, "row"));
    double v4 = v13;

    goto LABEL_8;
  }
  [v7 rowHeight];
  double v4 = v10;
LABEL_8:

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 cellForRowAtIndexPath:v5];
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
  id v7 = a4;
  [a3 deselectRowAtIndexPath:v7 animated:1];
  if ([(TTRICustomRecurrenceEditorViewController *)self _tagForIndexPath:v7] == 5)
  {
    uint64_t v6 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
    objc_msgSend(v6, "rowTapped:", objc_msgSend(v7, "row"));
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(TTRICustomRecurrenceEditorViewController *)self recurrenceSummaryString];
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  if (self->_useClearBackground
    || [v9 section] == 1
    && ([(TTRICustomRecurrenceEditorViewController *)self currentChooser],
        double v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_msgSend(v14, "drawBackgroundForRow:", objc_msgSend(v10, "row")),
        v14,
        (v15 & 1) == 0))
  {
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBackgroundColor:v11];

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    double v13 = [v8 backgroundView];
    [v13 setBackgroundColor:v12];
  }
}

- (id)_availableRecurrenceFrequencies
{
  unint64_t v3 = [(TTRICustomRecurrenceEditorViewController *)self cachedAvailableRecurrenceFrequencies];

  if (!v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    if (![(TTRICustomRecurrenceEditorViewController *)self prohibitsHourlyRecurrence]) {
      [v4 addObject:&unk_1F1336240];
    }
    [v4 addObject:&unk_1F1336258];
    [v4 addObject:&unk_1F1336270];
    [v4 addObject:&unk_1F1336288];
    [v4 addObject:&unk_1F13362A0];
    [(TTRICustomRecurrenceEditorViewController *)self setCachedAvailableRecurrenceFrequencies:v4];
  }

  return [(TTRICustomRecurrenceEditorViewController *)self cachedAvailableRecurrenceFrequencies];
}

- (void)recurrenceChooserWantsReload:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__TTRICustomRecurrenceEditorViewController_recurrenceChooserWantsReload___block_invoke;
  v3[3] = &unk_1E61D39F0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __73__TTRICustomRecurrenceEditorViewController_recurrenceChooserWantsReload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v2 reloadSections:v1 withRowAnimation:0];
}

- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__TTRICustomRecurrenceEditorViewController_recurrenceChooser_wantsRowReload___block_invoke;
  v4[3] = &unk_1E61D3A40;
  v4[4] = self;
  v4[5] = a4;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

void __77__TTRICustomRecurrenceEditorViewController_recurrenceChooser_wantsRowReload___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tableView];
  unint64_t v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 40) inSection:1];
  v5[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 reloadRowsAtIndexPaths:v4 withRowAnimation:0];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v5 = [(TTRICustomRecurrenceEditorViewController *)self completionBlock];
  uint64_t v4 = [(TTRICustomRecurrenceEditorViewController *)self recurrenceRule];
  v5[2](v5, v4);
}

- (void)_updateRecurrenceRule
{
  unint64_t v3 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke;
  v5[3] = &unk_1E61D39F0;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke_2;
  v4[3] = &unk_1E61D3A68;
  v4[4] = self;
  [v3 performBatchUpdates:v5 completion:v4];
}

uint64_t __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecurrenceRuleWithoutBatching];
}

uint64_t __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) queuePreferredContentSizeRefresh];
}

- (void)_updateRecurrenceRuleWithoutBatching
{
  int64_t cachedFrequency = self->_cachedFrequency;
  int64_t cachedInterval = self->_cachedInterval;
  id v11 = (id)objc_opt_new();
  uint64_t v5 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
  uint64_t v6 = v5;
  if (v5)
  {
    int64_t cachedFrequency = [v5 frequency];
    [v6 updateRecurrenceRuleBuilder:v11];
  }
  [v11 setFrequency:cachedFrequency];
  [v11 setInterval:cachedInterval];
  id v7 = [(TTRICustomRecurrenceEditorViewController *)self yearlyChooser];
  if (v6 == v7)
  {
    id v8 = [(TTRICustomRecurrenceEditorViewController *)self yearOrdinalSwitch];
    int v9 = [v8 isOn];

    if (!v9) {
      goto LABEL_7;
    }
    id v7 = [(TTRICustomRecurrenceEditorViewController *)self yearlyOrdinalChooser];
    [v7 updateRecurrenceRuleBuilder:v11];
  }

LABEL_7:
  double v10 = objc_msgSend(v11, "recurrenceRuleWithFirstDayOfTheWeek:", -[REMRecurrenceRule firstDayOfTheWeek](self->_cachedRecurrenceRule, "firstDayOfTheWeek"));
  [(TTRICustomRecurrenceEditorViewController *)self setRecurrenceRule:v10 shouldUpdatePickers:0];
}

- (id)recurrenceRule
{
  cachedRecurrenceRule = self->_cachedRecurrenceRule;
  if (!cachedRecurrenceRule)
  {
    [(TTRICustomRecurrenceEditorViewController *)self _updateRecurrenceRule];
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
      [(TTRICustomRecurrenceEditorViewController *)self _updateSummaryLabel];
      id v7 = v8;
    }
    if (v4)
    {
      [(TTRICustomRecurrenceEditorViewController *)self _refreshCacheAndPickers];
      id v7 = v8;
    }
  }
}

- (void)_refreshCacheAndPickers
{
  self->_int64_t cachedInterval = [(REMRecurrenceRule *)self->_cachedRecurrenceRule interval];
  self->_int64_t cachedFrequency = [(REMRecurrenceRule *)self->_cachedRecurrenceRule frequency];
  uint64_t v3 = [(id)objc_opt_class() isRecurrenceRuleOrdinal:self->_cachedRecurrenceRule];
  [(TTRICustomRecurrenceEditorViewController *)self _frequencyUpdated];
  if ([(REMRecurrenceRule *)self->_cachedRecurrenceRule frequency] == 3)
  {
    id v4 = [(TTRICustomRecurrenceEditorViewController *)self yearOrdinalSwitch];
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
  id v2 = [(TTRICustomRecurrenceEditorViewController *)self monthlyChooser];
  char v3 = [v2 prohibitsMultipleDaysInMonthlyRecurrence];

  return v3;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TTRICustomRecurrenceEditorViewController *)self monthlyChooser];
  [v4 setProhibitsMultipleDaysInMonthlyRecurrence:v3];
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  id v2 = [(TTRICustomRecurrenceEditorViewController *)self yearlyChooser];
  char v3 = [v2 prohibitsMultipleMonthsInYearlyRecurrence];

  return v3;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TTRICustomRecurrenceEditorViewController *)self yearlyChooser];
  [v4 setProhibitsMultipleMonthsInYearlyRecurrence:v3];
}

- (void)_updateSummaryLabel
{
  BOOL v3 = (void *)MEMORY[0x1E4F94BE0];
  id v4 = [(TTRICustomRecurrenceEditorViewController *)self recurrenceRule];
  uint64_t v5 = [(TTRICustomRecurrenceEditorViewController *)self startDate];
  BOOL v6 = [v3 naturalLanguageDescriptionForRecurrenceRule:v4 withStartDate:v5];
  [(TTRICustomRecurrenceEditorViewController *)self setRecurrenceSummaryString:v6];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke;
  block[3] = &unk_1E61D39F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke_2;
  v2[3] = &unk_1E61D39F0;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 reloadSections:v1 withRowAnimation:5];
}

- (void)_updateCustomPickerView
{
  BOOL v3 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
  uint64_t v4 = [v3 frequency];

  uint64_t v5 = [(TTRICustomRecurrenceEditorViewController *)self _chooserForFrequency:self->_cachedFrequency];
  [(TTRICustomRecurrenceEditorViewController *)self setCurrentChooser:v5];

  BOOL v6 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
  uint64_t v7 = [v6 frequency];

  id v8 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
  [v8 updateFromRecurrenceRule:self->_cachedRecurrenceRule];

  [(TTRICustomRecurrenceEditorViewController *)self _updateTableSectionsFromFrequency:v4 toFrequency:v7];
}

- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4
{
  uint64_t v7 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v7 beginUpdates];

  if (a3 == 3 || a4 != 3)
  {
    if (a3 == 3 && a4 != 3)
    {
      double v13 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
      double v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
      [v13 deleteSections:v14 withRowAnimation:6];

      BOOL v10 = a4 != 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
    int v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
    [v8 insertSections:v9 withRowAnimation:6];
  }
  BOOL v10 = a4 != 0;
  if (!a3 && a4)
  {
    id v11 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
    v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v11 insertSections:v12 withRowAnimation:6];
LABEL_13:

    goto LABEL_14;
  }
LABEL_10:
  if (a3 && !a4)
  {
    id v11 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
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
    v17[2] = __90__TTRICustomRecurrenceEditorViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke;
    v17[3] = &unk_1E61D39F0;
    v17[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
  }
LABEL_14:
  char v15 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  [v15 endUpdates];
}

void __90__TTRICustomRecurrenceEditorViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v2 reloadSections:v1 withRowAnimation:0];
}

- (void)_updateFrequencyRows
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
  uint64_t v5 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  v7[0] = v3;
  v7[1] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v5 reloadRowsAtIndexPaths:v6 withRowAnimation:5];
}

- (void)_frequencyUpdated
{
  [(TTRICustomRecurrenceEditorViewController *)self _updateCustomPickerView];
  [(TTRICustomRecurrenceEditorViewController *)self _updateRecurrenceRule];
  [(TTRICustomRecurrenceEditorViewController *)self _updateFrequencyRows];
  frequencySummaryCell = self->_frequencySummaryCell;
  uint64_t v4 = [(TTRICustomRecurrenceEditorViewController *)self frequencyTypeMenu];
  [(TTRIPopupMenuTableViewCell *)frequencySummaryCell setPopupMenu:v4];

  uint64_t v5 = self->_frequencySummaryCell;
  BOOL v6 = [(TTRICustomRecurrenceEditorViewController *)self _stringForFrequency:self->_cachedFrequency];
  [(TTRIPopupMenuTableViewCell *)v5 setAccessoryTitle:v6];

  [(TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)self->_intervalSummaryCell setIntervalValue:self->_cachedInterval];

  [(TTRICustomRecurrenceEditorViewController *)self queuePreferredContentSizeRefresh];
}

- (id)_chooserForFrequency:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      BOOL v3 = [(TTRICustomRecurrenceEditorViewController *)self yearlyChooser];
      break;
    case 2:
      BOOL v3 = [(TTRICustomRecurrenceEditorViewController *)self monthlyChooser];
      break;
    case 1:
      BOOL v3 = [(TTRICustomRecurrenceEditorViewController *)self weeklyChooser];
      break;
    default:
      BOOL v3 = 0;
      break;
  }

  return v3;
}

- (void)_yearOrdinalSwitchChanged:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  void v15[4] = __Block_byref_object_dispose_;
  id v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(TTRICustomRecurrenceEditorViewController *)self tableView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke;
  v8[3] = &unk_1E61D3A90;
  id v11 = v15;
  id v6 = v4;
  v12 = v13;
  id v9 = v6;
  BOOL v10 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke_2;
  void v7[3] = &unk_1E61D3AB8;
  v7[5] = v15;
  v7[6] = v13;
  v7[4] = self;
  [v5 performBatchUpdates:v8 completion:v7];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

uint64_t __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(a1 + 32) isOn])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v5 = [*(id *)(a1 + 40) tableView];
    v9[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v5 insertRowsAtIndexPaths:v6 withRowAnimation:6];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) tableView];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [v5 deleteRowsAtIndexPaths:v6 withRowAnimation:6];
  }

  return [*(id *)(a1 + 40) _updateRecurrenceRuleWithoutBatching];
}

uint64_t __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = [*(id *)(a1 + 32) tableView];
    [v2 scrollToRowAtIndexPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) atScrollPosition:3 animated:1];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 queuePreferredContentSizeRefresh];
}

- (id)_stringForFrequency:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t v3 = CUIKStringForRepeatType();
      break;
    case 4:
      id v4 = RemindersUICoreBundleGet();
      uint64_t v3 = [v4 localizedStringForKey:@"Hourly" value:@"Hourly" table:@"Localizable"];

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
      uint64_t v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"days (every)";
      goto LABEL_8;
    case 1:
      uint64_t v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"weeks (every)";
      goto LABEL_8;
    case 2:
      uint64_t v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"months (every)";
      goto LABEL_8;
    case 3:
      uint64_t v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"years (every)";
      goto LABEL_8;
    case 4:
      uint64_t v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"hours (every)";
LABEL_8:
      uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1F130F620 table:@"PluralLocalizable"];

      break;
    default:
      uint64_t v8 = 0;
      break;
  }
  id v9 = objc_msgSend(NSString, "stringWithFormat:", v8, a4);

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
        return 4;
      }
      else {
        return self->_cachedFrequency;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    int64_t v7 = 1;
    if (v5) {
      int64_t v7 = 2;
    }
    if (v6) {
      int64_t v7 = 0;
    }
    if (v6 == 1) {
      return 5;
    }
    else {
      return v7;
    }
  }
}

- (int64_t)_numberOfRowsForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      int64_t v7 = [(TTRICustomRecurrenceEditorViewController *)self yearOrdinalSwitch];
      if ([v7 isOn]) {
        int64_t v3 = 2;
      }
      else {
        int64_t v3 = 1;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (a3 == 1)
    {
      id v4 = [(TTRICustomRecurrenceEditorViewController *)self currentChooser];
      int64_t v5 = [v4 numberOfRows];

      return v5;
    }
    if (a3) {
      return 0;
    }
    else {
      return 2;
    }
  }
  return v3;
}

- (id)_localizedEveryStringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int64_t v7 = @"Every-everyDay";
      goto LABEL_8;
    case 1:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int64_t v7 = @"Every-everyWeek";
      goto LABEL_8;
    case 2:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int64_t v7 = @"Every-everyMonth";
      goto LABEL_8;
    case 3:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int64_t v7 = @"Every-everyYear";
      goto LABEL_8;
    case 4:
      int64_t v5 = RemindersUICoreBundleGet();
      uint64_t v6 = v5;
      int64_t v7 = @"Every-everyHour";
LABEL_8:
      uint64_t v8 = [v5 localizedStringForKey:v7 value:@"Every" table:@"PluralLocalizable"];

      break;
    default:
      uint64_t v8 = 0;
      break;
  }
  id v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, a4);

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
  return objc_getProperty(self, a2, 1024, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1032, 1);
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
  return (TTRIRecurrenceWeekdayChooserController *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setWeeklyChooser:(id)a3
{
}

- (TTRIRecurrenceMonthlyChooserController)monthlyChooser
{
  return (TTRIRecurrenceMonthlyChooserController *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setMonthlyChooser:(id)a3
{
}

- (TTRIRecurrenceMonthChooserController)yearlyChooser
{
  return (TTRIRecurrenceMonthChooserController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setYearlyChooser:(id)a3
{
}

- (TTRIRecurrenceOrdinalChooserController)yearlyOrdinalChooser
{
  return (TTRIRecurrenceOrdinalChooserController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setYearlyOrdinalChooser:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setTimeZone:(id)a3
{
}

- (UISwitch)yearOrdinalSwitch
{
  return (UISwitch *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setYearOrdinalSwitch:(id)a3
{
}

- (NSString)recurrenceSummaryString
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setRecurrenceSummaryString:(id)a3
{
}

- (NSArray)cachedAvailableRecurrenceFrequencies
{
  return (NSArray *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setCachedAvailableRecurrenceFrequencies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableRecurrenceFrequencies, 0);
  objc_storeStrong((id *)&self->_recurrenceSummaryString, 0);
  objc_storeStrong((id *)&self->_yearOrdinalSwitch, 0);
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