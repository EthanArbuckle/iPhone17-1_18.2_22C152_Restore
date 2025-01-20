@interface PKAccountAutomaticPaymentsConfigurationViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (PKAccountAutomaticPaymentsConfigurationViewController)initWithController:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_addBankAccountInformationViewController;
- (id)_amount;
- (id)_amounts;
- (id)_axIDForPaymentRowType:(int64_t)a3;
- (id)_dates;
- (id)_datesForFrequency:(int64_t)a3;
- (id)_detailTextForPaymentRowType:(int64_t)a3;
- (id)_displayStringForSelectedDate;
- (id)_footerText;
- (id)_frequencies;
- (id)_frequencyTitleForFrequency:(int64_t)a3;
- (id)_textForAmount:(id)a3;
- (id)_textForPaymentRowType:(int64_t)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)tableHeaderView;
- (id)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_frequency;
- (int64_t)_paymentRowTypeForIndexPath:(id)a3;
- (int64_t)_preset;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_performNextButtonTapped;
- (void)_updateDates;
- (void)_updateNextButtonEnabledIfNecessary;
- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4;
- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4;
- (void)addBankAccountInformationViewControllerDidFinish:(id)a3;
- (void)dealloc;
- (void)handleNextButtonTapped:(id)a3;
- (void)monthDaySelectionViewController:(id)a3 didSelectDate:(id)a4 day:(int64_t)a5;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setSelectedAmount:(id)a3;
- (void)setSelectedDate:(id)a3;
- (void)setSelectedFrequency:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountAutomaticPaymentsConfigurationViewController

- (PKAccountAutomaticPaymentsConfigurationViewController)initWithController:(id)a3
{
  id v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  v6 = [(PKSectionTableViewController *)&v55 initWithStyle:1 numberOfSections:1];
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    uint64_t v9 = [*p_controller account];
    account = v7->_account;
    v7->_account = (PKAccount *)v9;

    v11 = [(PKAccount *)v7->_account creditDetails];
    uint64_t v12 = [v11 productTimeZone];
    productTimeZone = v7->_productTimeZone;
    v7->_productTimeZone = (NSTimeZone *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v15 = [v14 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    productCalendar = v7->_productCalendar;
    v7->_productCalendar = (NSCalendar *)v15;

    [(NSCalendar *)v7->_productCalendar setTimeZone:v7->_productTimeZone];
    v7->_featureIdentifier = [*p_controller featureIdentifier];
    v17 = [(PKAccount *)v7->_account creditDetails];
    v18 = [v17 currencyCode];
    uint64_t v19 = PKMutableNumberFormatterForCurrencyCode();
    currencyFormatter = v7->_currencyFormatter;
    v7->_currencyFormatter = (NSNumberFormatter *)v19;

    [(NSNumberFormatter *)v7->_currencyFormatter setMinimumFractionDigits:0];
    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    modelDateFormatter = v7->_modelDateFormatter;
    v7->_modelDateFormatter = v21;

    [(NSDateFormatter *)v7->_modelDateFormatter setLocalizedDateFormatFromTemplate:@"yyyy-MM-dd"];
    [(NSDateFormatter *)v7->_modelDateFormatter setTimeZone:v7->_productTimeZone];
    v23 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    pickerDateFormatter = v7->_pickerDateFormatter;
    v7->_pickerDateFormatter = v23;

    [(NSDateFormatter *)v7->_pickerDateFormatter setLocalizedDateFormatFromTemplate:@"EEEE, MMMM d"];
    [(NSDateFormatter *)v7->_pickerDateFormatter setFormattingContext:2];
    [(NSDateFormatter *)v7->_pickerDateFormatter setTimeZone:v7->_productTimeZone];
    v25 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    cellDateFormatter = v7->_cellDateFormatter;
    v7->_cellDateFormatter = v25;

    [(NSDateFormatter *)v7->_cellDateFormatter setLocalizedDateFormatFromTemplate:@"MMMM d, yyyy"];
    [(NSDateFormatter *)v7->_cellDateFormatter setTimeZone:v7->_productTimeZone];
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dayNameFormatter = v7->_dayNameFormatter;
    v7->_dayNameFormatter = v27;

    [(NSDateFormatter *)v7->_dayNameFormatter setLocalizedDateFormatFromTemplate:@"EEEE"];
    [(NSDateFormatter *)v7->_dayNameFormatter setTimeZone:v7->_productTimeZone];
    v29 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    cardinalDayDateFormatter = v7->_cardinalDayDateFormatter;
    v7->_cardinalDayDateFormatter = v29;

    [(NSDateFormatter *)v7->_cardinalDayDateFormatter setTimeZone:v7->_productTimeZone];
    [(NSDateFormatter *)v7->_cardinalDayDateFormatter setLocalizedDateFormatFromTemplate:@"d"];
    v31 = PKLocalizedFeatureString();
    v32 = v31;
    if (v31) {
      LOBYTE(v31) = [v31 isEqualToString:@"1"];
    }
    v7->_useOrdinalDay = (char)v31;
    uint64_t v33 = [(PKAccountAutomaticPaymentsConfigurationViewController *)v7 _amounts];
    amounts = v7->_amounts;
    v7->_amounts = (NSArray *)v33;

    unint64_t v35 = [(NSArray *)v7->_amounts count];
    v36 = v7->_amounts;
    if (v35 < 2)
    {
      uint64_t v42 = [(NSArray *)v36 firstObject];
      selectedAmount = v7->_selectedAmount;
      v7->_selectedAmount = (NSNumber *)v42;

      selectedFrequency = v7->_selectedFrequency;
      v7->_selectedFrequency = (NSNumber *)&unk_1EF2B9C00;
    }
    else
    {
      uint64_t v37 = [(NSArray *)v36 objectAtIndex:0];
      v38 = v7->_selectedAmount;
      v7->_selectedAmount = (NSNumber *)v37;

      selectedFrequency = [(PKAccountAutomaticPaymentsConfigurationViewController *)v7 _frequencies];
      uint64_t v40 = [selectedFrequency firstObject];
      v41 = v7->_selectedFrequency;
      v7->_selectedFrequency = (NSNumber *)v40;
    }
    v44 = [[PKMonthDayCollectionViewController alloc] initWithDayDelegate:v7 timeZone:v7->_productTimeZone];
    monthDayCollectionViewController = v7->_monthDayCollectionViewController;
    v7->_monthDayCollectionViewController = v44;

    v46 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v47 = [(NSCalendar *)v7->_productCalendar component:16 fromDate:v46];
    uint64_t v48 = objc_msgSend(*p_controller, "minimumPaymentDayForPreset:", -[PKAccountAutomaticPaymentsConfigurationViewController _preset](v7, "_preset"));
    [(PKMonthDayCollectionViewController *)v7->_monthDayCollectionViewController setMinimumDayNumber:v48];
    if (v48 <= v47) {
      uint64_t v49 = v47;
    }
    else {
      uint64_t v49 = v48;
    }
    [(PKMonthDayCollectionViewController *)v7->_monthDayCollectionViewController setDayNumber:v49];
    uint64_t v50 = [(PKMonthDayCollectionViewController *)v7->_monthDayCollectionViewController selectedDate];
    selectedDate = v7->_selectedDate;
    v7->_selectedDate = (NSDate *)v50;

    [(PKAccountAutomaticPaymentsConfigurationViewController *)v7 _updateDates];
    v52 = objc_alloc_init(PKAccountAutomaticPaymentsDateFooterView);
    footerView = v7->_footerView;
    v7->_footerView = v52;

    [(PKAccountAutomaticPaymentsDateFooterView *)v7->_footerView setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
    [(PKSectionTableViewController *)v7 setSkipSetupForReadableContentGuide:1];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  [(PKSectionTableViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  [(PKSectionTableViewController *)&v24 viewDidLoad];
  v3 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableView];
  objc_super v4 = objc_alloc_init(PKFixedAmountWrapperView);
  wrapperView = self->_wrapperView;
  self->_wrapperView = v4;

  [(PKAccountAutomaticPaymentsConfigurationViewController *)self setView:self->_wrapperView];
  [(PKFixedAmountWrapperView *)self->_wrapperView setTableView:v3];
  v6 = self->_wrapperView;
  v7 = [v3 backgroundColor];
  [(PKFixedAmountWrapperView *)v6 setBackgroundColor:v7];

  v8 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  amountPicker = self->_amountPicker;
  self->_amountPicker = v8;

  [(UIPickerView *)self->_amountPicker setDelegate:self];
  NSUInteger v10 = [(NSArray *)self->_amounts indexOfObject:self->_selectedAmount];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [(UIPickerView *)self->_amountPicker selectRow:v10 inComponent:0 animated:0];
  }
  [(PKFixedAmountWrapperView *)self->_wrapperView setPickerView:self->_amountPicker];
  self->_selectedRowType = 1;
  v11 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  frequencyPicker = self->_frequencyPicker;
  self->_frequencyPicker = v11;

  [(UIPickerView *)self->_frequencyPicker setDelegate:self];
  NSUInteger v13 = [(NSArray *)self->_frequencies indexOfObject:self->_selectedFrequency];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
    [(UIPickerView *)self->_frequencyPicker selectRow:v13 inComponent:0 animated:0];
  }
  id v14 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  datePicker = self->_datePicker;
  self->_datePicker = v14;

  [(UIPickerView *)self->_datePicker setDelegate:self];
  NSUInteger v16 = [(NSArray *)self->_dates indexOfObject:self->_selectedDate];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
    [(UIPickerView *)self->_datePicker selectRow:v16 inComponent:0 animated:0];
  }
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"configurationCellReuseIdentifier"];
  double v17 = *MEMORY[0x1E4FB2F28];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setEstimatedRowHeight:60.0];
  v18 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableHeaderView];
  [v3 setTableHeaderView:v18];

  [v3 setRowHeight:v17];
  id v19 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v20 = PKLocalizedPaymentString(&cfstr_Next.isa);
  v21 = (void *)[v19 initWithTitle:v20 style:2 target:self action:sel_handleNextButtonTapped_];

  v22 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self navigationItem];
  [v22 setRightBarButtonItem:v21];

  [(PKAccountAutomaticPaymentsConfigurationViewController *)self _updateNextButtonEnabledIfNecessary];
  v23 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self view];
  [v23 setAccessibilityIdentifier:*MEMORY[0x1E4F85260]];
}

- (id)tableView
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  v3 = [(PKAccountAutomaticPaymentsConfigurationViewController *)&v5 tableView];
  if (!v3)
  {
    v3 = [(PKFixedAmountWrapperView *)self->_wrapperView tableView];
  }

  return v3;
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  [(PKAccountAutomaticPaymentsConfigurationViewController *)&v15 viewWillLayoutSubviews];
  if (self->_shouldShowCollectionView) {
    monthDayCollectionViewController = self->_monthDayCollectionViewController;
  }
  else {
    monthDayCollectionViewController = 0;
  }
  [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView setCollectionViewController:monthDayCollectionViewController];
  objc_super v4 = [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView textLabel];
  objc_super v5 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _footerText];
  [v4 setText:v5];

  v6 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableView];
  [v6 bounds];
  double v8 = v7;

  [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView frame];
  double v10 = v9;
  double v12 = v11;
  -[PKAccountAutomaticPaymentsDateFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v8, 0.0);
  -[PKAccountAutomaticPaymentsDateFooterView setFrame:](self->_footerView, "setFrame:", v10, v12, v13, v14);
  [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView layoutIfNeeded];
}

- (id)tableHeaderView
{
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    objc_super v4 = PKLocalizedFeatureString();
    objc_super v5 = PKLocalizedFeatureString();
    v6 = [PKTableHeaderView alloc];
    double v7 = -[PKTableHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v8 = self->_tableHeaderView;
    self->_tableHeaderView = v7;

    double v9 = [(PKTableHeaderView *)self->_tableHeaderView titleLabel];
    [v9 setText:v4];

    double v10 = [(PKTableHeaderView *)self->_tableHeaderView subtitleLabel];
    [v10 setText:v5];

    [(PKTableHeaderView *)self->_tableHeaderView setTopPadding:5.0];
    [(PKTableHeaderView *)self->_tableHeaderView setBottomPadding:60.0];
    double v11 = self->_tableHeaderView;
    double v12 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableView];
    [v12 bounds];
    -[PKTableHeaderView sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
    double v14 = v13;
    double v16 = v15;

    -[PKTableHeaderView setFrame:](self->_tableHeaderView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
    tableHeaderView = self->_tableHeaderView;
  }

  return tableHeaderView;
}

- (void)setSelectedFrequency:(id)a3
{
  p_selectedFrequency = &self->_selectedFrequency;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedFrequency, a3);
    NSUInteger v6 = [(NSArray *)self->_frequencies indexOfObject:*p_selectedFrequency];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIPickerView *)self->_frequencyPicker selectRow:v6 inComponent:0 animated:0];
    }
    [(PKAccountAutomaticPaymentsConfigurationViewController *)self _updateDates];
  }
}

- (id)_datesForFrequency:(int64_t)a3
{
  uint64_t v4 = 14;
  if (a3 != 5) {
    uint64_t v4 = 0;
  }
  if (a3 == 4) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  double v8 = [(NSCalendar *)self->_productCalendar components:28 fromDate:v7];
  double v9 = [(NSCalendar *)self->_productCalendar dateFromComponents:v8];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      double v11 = [v9 dateByAddingTimeInterval:(double)i * 86400.0];
      [v6 safelyAddObject:v11];
    }
  }
  double v12 = (void *)[v6 copy];

  return v12;
}

- (void)_updateDates
{
  NSInteger v3 = [(NSNumber *)self->_selectedFrequency integerValue];
  uint64_t v4 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _datesForFrequency:v3];
  dates = self->_dates;
  self->_dates = v4;

  [(UIPickerView *)self->_datePicker reloadAllComponents];
  if ((unint64_t)(v3 - 4) < 2)
  {
    NSUInteger v6 = [(NSArray *)self->_dates indexOfObject:self->_selectedDate];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(NSArray *)self->_dates lastObject];
      selectedDate = self->_selectedDate;
      self->_selectedDate = v7;

      if (!self->_selectedDate)
      {
LABEL_10:
        int64_t v14 = 0;
        goto LABEL_13;
      }
      datePicker = self->_datePicker;
      NSUInteger v10 = -[NSArray indexOfObject:](self->_dates, "indexOfObject:");
      double v11 = datePicker;
    }
    else
    {
      NSUInteger v10 = v6;
      double v11 = self->_datePicker;
    }
    [(UIPickerView *)v11 selectRow:v10 inComponent:0 animated:0];
    goto LABEL_10;
  }
  if (v3 != 6) {
    return;
  }
  monthDayCollectionViewController = self->_monthDayCollectionViewController;
  if (self->_selectedDate) {
    NSInteger v13 = -[NSCalendar component:fromDate:](self->_productCalendar, "component:fromDate:", 16);
  }
  else {
    NSInteger v13 = 0;
  }
  [(PKMonthDayCollectionViewController *)monthDayCollectionViewController setDayNumber:v13];
  double v15 = [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController selectedDate];
  double v16 = self->_selectedDate;
  self->_selectedDate = v15;

  int64_t v14 = [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController dayNumber];
LABEL_13:
  self->_scheduledDay = v14;
}

- (void)setSelectedAmount:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_selectedAmount, a3);
  NSInteger v5 = [(NSCalendar *)self->_productCalendar component:16 fromDate:self->_selectedDate];
  [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController setMinimumDayNumber:[(PKAccountAutomaticPaymentsController *)self->_controller minimumPaymentDayForPreset:[(PKAccountAutomaticPaymentsConfigurationViewController *)self _preset]]];
  [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController setDayNumber:v5];
  if ([(NSNumber *)self->_selectedAmount isEqual:&unk_1EF2B9C18])
  {
    [(PKAccountAutomaticPaymentsConfigurationViewController *)self setSelectedFrequency:&unk_1EF2B9C00];
    NSUInteger v6 = [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController selectedDate];
    selectedDate = self->_selectedDate;
    self->_selectedDate = v6;

    self->_scheduledDay = [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController dayNumber];
  }
}

- (void)setSelectedDate:(id)a3
{
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (void)monthDaySelectionViewController:(id)a3 didSelectDate:(id)a4 day:(int64_t)a5
{
  id v8 = a4;
  if (self->_shouldShowCollectionView)
  {
    id v12 = v8;
    objc_storeStrong((id *)&self->_selectedDate, a4);
    self->_scheduledDay = a5;
    double v9 = [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView textLabel];
    NSUInteger v10 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _footerText];
    [v9 setText:v10];

    double v11 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableView];
    [v11 reloadData];

    [(PKAccountAutomaticPaymentsConfigurationViewController *)self _updateNextButtonEnabledIfNecessary];
    id v8 = v12;
  }
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  NSInteger v13 = (UIPickerView *)a3;
  id v7 = [(PKFixedAmountWrapperView *)self->_wrapperView pickerView];

  id v8 = v13;
  if (v7 == v13)
  {
    if (self->_amountPicker == v13)
    {
      double v9 = [(NSArray *)self->_amounts objectAtIndexedSubscript:a4];
      [(PKAccountAutomaticPaymentsConfigurationViewController *)self setSelectedAmount:v9];
    }
    else if (self->_frequencyPicker == v13)
    {
      double v9 = [(NSArray *)self->_frequencies objectAtIndexedSubscript:a4];
      [(PKAccountAutomaticPaymentsConfigurationViewController *)self setSelectedFrequency:v9];
    }
    else
    {
      if (self->_datePicker != v13)
      {
LABEL_9:
        NSUInteger v10 = [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView textLabel];
        double v11 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _footerText];
        [v10 setText:v11];

        id v12 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableView];
        [v12 reloadData];

        [(PKAccountAutomaticPaymentsConfigurationViewController *)self _updateNextButtonEnabledIfNecessary];
        id v8 = v13;
        goto LABEL_10;
      }
      double v9 = [(NSArray *)self->_dates objectAtIndexedSubscript:a4];
      [(PKAccountAutomaticPaymentsConfigurationViewController *)self setSelectedDate:v9];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  NSInteger v5 = (UIPickerView *)a3;
  NSUInteger v6 = v5;
  id v7 = &OBJC_IVAR___PKAccountAutomaticPaymentsConfigurationViewController__amounts;
  if (self->_amountPicker == v5
    || (id v7 = &OBJC_IVAR___PKAccountAutomaticPaymentsConfigurationViewController__frequencies,
        self->_frequencyPicker == v5)
    || (id v7 = &OBJC_IVAR___PKAccountAutomaticPaymentsConfigurationViewController__dates, self->_datePicker == v5))
  {
    int64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v7) count];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = (UIPickerView *)a3;
  int64_t v8 = v7;
  if (self->_amountPicker == v7)
  {
    NSUInteger v10 = [(NSArray *)self->_amounts objectAtIndex:a4];
    uint64_t v11 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _textForAmount:v10];
  }
  else if (self->_frequencyPicker == v7)
  {
    frequenciesMap = self->_frequenciesMap;
    NSUInteger v10 = [(NSArray *)self->_frequencies objectAtIndexedSubscript:a4];
    uint64_t v11 = [(NSDictionary *)frequenciesMap objectForKeyedSubscript:v10];
  }
  else
  {
    if (self->_datePicker != v7)
    {
      double v9 = 0;
      goto LABEL_9;
    }
    NSUInteger v10 = [(NSArray *)self->_dates objectAtIndex:a4];
    uint64_t v11 = [(NSDateFormatter *)self->_pickerDateFormatter stringFromDate:v10];
  }
  double v9 = (void *)v11;

LABEL_9:

  return v9;
}

- (id)_dates
{
  dates = self->_dates;
  if (!dates)
  {
    uint64_t v4 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _datesForFrequency:[(PKAccountAutomaticPaymentsConfigurationViewController *)self _frequency]];
    NSInteger v5 = self->_dates;
    self->_dates = v4;

    dates = self->_dates;
  }

  return dates;
}

- (id)_amounts
{
  amounts = self->_amounts;
  if (!amounts)
  {
    uint64_t v4 = [(PKAccount *)self->_account creditDetails];
    NSInteger v5 = [v4 accountSummary];

    if ([(PKAccount *)self->_account isClosedAndChargedOff]) {
      [v5 currentBalance];
    }
    else {
    NSUInteger v6 = [v5 creditLimit];
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v6)
    {
      int64_t v8 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v9 = [v8 compare:v6];

      if (v9 == -1)
      {
        NSUInteger v10 = [&unk_1EF2BA320 firstObject];
        uint64_t v11 = [&unk_1EF2BA338 firstObject];
        id v12 = [&unk_1EF2BA320 objectAtIndex:1];
        if (v10)
        {
          v20 = v5;
          unint64_t v13 = 1;
          do
          {
            if ([v10 compare:v6] != -1) {
              break;
            }
            [v7 addObject:v10];
            int64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "integerValue") + objc_msgSend(v10, "integerValue"));

            if (v12 && [v14 compare:v12] != -1)
            {
              id v15 = v12;

              if ([&unk_1EF2BA320 count] <= ++v13)
              {
                id v12 = 0;
              }
              else
              {
                id v12 = [&unk_1EF2BA320 objectAtIndex:v13];
              }

              if ([&unk_1EF2BA338 count] <= v13)
              {
                int64_t v14 = v15;
              }
              else
              {
                uint64_t v16 = [&unk_1EF2BA338 objectAtIndex:v13];

                int64_t v14 = v15;
                uint64_t v11 = (void *)v16;
              }
            }
            NSUInteger v10 = v14;
          }
          while (v14);
          NSInteger v5 = v20;
        }
        [v7 addObject:v6];
      }
    }
    double v17 = (NSArray *)[v7 copy];
    v18 = self->_amounts;
    self->_amounts = v17;

    amounts = self->_amounts;
  }

  return amounts;
}

- (id)_frequencies
{
  frequencies = self->_frequencies;
  if (!frequencies)
  {
    uint64_t v4 = [(PKAccount *)self->_account scheduleRecurringPaymentsFeatureDescriptor];
    char v5 = [v4 paymentFrequencies];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ((v5 & 4) != 0 && ([(PKAccount *)self->_account isClosedAndChargedOff] & 1) == 0)
    {
      [v6 addObject:&unk_1EF2B9D20];
      int64_t v8 = PKLocalizedFeatureString();
      [v7 setObject:v8 forKeyedSubscript:&unk_1EF2B9D20];
    }
    if ((v5 & 8) != 0)
    {
      [v6 addObject:&unk_1EF2B9D38];
      uint64_t v9 = PKLocalizedFeatureString();
      [v7 setObject:v9 forKeyedSubscript:&unk_1EF2B9D38];
    }
    if ((v5 & 0x10) != 0)
    {
      [v6 addObject:&unk_1EF2B9C00];
      NSUInteger v10 = PKLocalizedFeatureString();
      [v7 setObject:v10 forKeyedSubscript:&unk_1EF2B9C00];
    }
    uint64_t v11 = (NSArray *)[v6 copy];
    id v12 = self->_frequencies;
    self->_frequencies = v11;

    unint64_t v13 = (NSDictionary *)[v7 copy];
    frequenciesMap = self->_frequenciesMap;
    self->_frequenciesMap = v13;

    frequencies = self->_frequencies;
  }

  return frequencies;
}

- (id)_frequencyTitleForFrequency:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = PKLocalizedFeatureString();
  }
  return v4;
}

- (int64_t)_preset
{
  v2 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _amount];
  if (v2) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (id)_amount
{
  selectedAmount = self->_selectedAmount;
  if (selectedAmount && ![(NSNumber *)selectedAmount isEqualToNumber:&unk_1EF2B9C18])
  {
    char v5 = (void *)MEMORY[0x1E4F28C28];
    id v6 = self->_selectedAmount;
    if (v6)
    {
      [(NSNumber *)v6 decimalValue];
    }
    else
    {
      v11[0] = 0;
      v11[1] = 0;
      int v12 = 0;
    }
    id v7 = [v5 decimalNumberWithDecimal:v11];
    int64_t v8 = [(PKAccount *)self->_account creditDetails];
    uint64_t v9 = [v8 currencyCode];
    uint64_t v4 = PKCurrencyAmountCreate(v7, v9);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_frequency
{
  return [(NSNumber *)self->_selectedFrequency integerValue];
}

- (void)_updateNextButtonEnabledIfNecessary
{
  controller = self->_controller;
  int64_t v4 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _preset];
  int64_t v5 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _frequency];
  id v6 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _amount];
  uint64_t v7 = [(PKAccountAutomaticPaymentsController *)controller canPerformScheduleAutomaticPaymentsWithPreset:v4 frequency:v5 amount:v6 paymentDate:self->_selectedDate];

  id v9 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self navigationItem];
  int64_t v8 = [v9 rightBarButtonItem];
  [v8 setEnabled:v7];
}

- (void)handleNextButtonTapped:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PKAccountAutomaticPaymentsController *)self->_controller alertControllerForScheduledDate:self->_selectedDate];
  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v7 = PKLocalizedString(&cfstr_Ok.isa);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __80__PKAccountAutomaticPaymentsConfigurationViewController_handleNextButtonTapped___block_invoke;
    int v12 = &unk_1E59CCFF0;
    objc_copyWeak(&v13, &location);
    int64_t v8 = [v6 actionWithTitle:v7 style:0 handler:&v9];
    objc_msgSend(v5, "addAction:", v8, v9, v10, v11, v12);

    [(PKAccountAutomaticPaymentsConfigurationViewController *)self presentViewController:v5 animated:1 completion:0];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKAccountAutomaticPaymentsConfigurationViewController *)self _performNextButtonTapped];
  }
}

void __80__PKAccountAutomaticPaymentsConfigurationViewController_handleNextButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _performNextButtonTapped];
    id WeakRetained = v2;
  }
}

- (void)_performNextButtonTapped
{
  int64_t v3 = [(PKAccountAutomaticPaymentsController *)self->_controller fundingSources];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentPreset:[(PKAccountAutomaticPaymentsConfigurationViewController *)self _preset]];
    controller = self->_controller;
    id v6 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _amount];
    [(PKAccountAutomaticPaymentsController *)controller setAmount:v6];

    [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentFrequency:[(PKAccountAutomaticPaymentsConfigurationViewController *)self _frequency]];
    [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentDate:self->_selectedDate];
    [(PKAccountAutomaticPaymentsController *)self->_controller setScheduledDay:self->_scheduledDay];
    [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentFrequency:[(PKAccountAutomaticPaymentsConfigurationViewController *)self _frequency]];
    uint64_t v7 = self->_controller;
    [(PKAccountAutomaticPaymentsController *)v7 performScheduleAutomaticPaymentsFromViewController:self];
  }
  else
  {
    id v9 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self navigationController];
    int64_t v8 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _addBankAccountInformationViewController];
    [v9 presentViewController:v8 animated:1 completion:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(PKAccountAutomaticPaymentsConfigurationViewController *)self _preset] == 1) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_footerView;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self tableView];
  uint64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"configurationCellReuseIdentifier" forIndexPath:v5];

  int64_t v8 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  int64_t v9 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _paymentRowTypeForIndexPath:v5];

  uint64_t v10 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _textForPaymentRowType:v9];
  [v8 setText:v10];

  uint64_t v11 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _detailTextForPaymentRowType:v9];
  [v8 setSecondaryText:v11];

  if (self->_selectedRowType == v9) {
    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else {
  int v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  id v13 = [v8 secondaryTextProperties];
  [v13 setColor:v12];
  int64_t v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v13 setFont:v14];

  id v15 = [v8 textProperties];
  uint64_t v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v15 setFont:v16];

  [v7 setMinimumHeight:60.0];
  [v7 setContentConfiguration:v8];
  [v7 setSelectionStyle:0];
  double v17 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _axIDForPaymentRowType:v9];
  [v7 setAccessibilityIdentifier:v17];

  return v7;
}

- (id)_textForPaymentRowType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = PKLocalizedFeatureString();
  }
  return v4;
}

- (id)_detailTextForPaymentRowType:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v3 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _displayStringForSelectedDate];
      break;
    case 2:
      uint64_t v3 = [(NSDictionary *)self->_frequenciesMap objectForKeyedSubscript:self->_selectedFrequency];
      break;
    case 1:
      uint64_t v3 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _textForAmount:self->_selectedAmount];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }

  return v3;
}

- (id)_axIDForPaymentRowType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    uint64_t v3 = (id *)MEMORY[0x1E4F85B28];
  }
  else {
    uint64_t v3 = (id *)qword_1E59E0390[a3 - 1];
  }
  return *v3;
}

- (id)_displayStringForSelectedDate
{
  return [(NSDateFormatter *)self->_cellDateFormatter stringFromDate:self->_selectedDate];
}

- (id)_textForAmount:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToNumber:&unk_1EF2B9C18]) {
    PKLocalizedFeatureString();
  }
  else {
  id v5 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:v4];
  }

  return v5;
}

- (int64_t)_paymentRowTypeForIndexPath:(id)a3
{
  uint64_t v4 = [a3 row];
  int64_t v5 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _preset];
  BOOL v7 = v4 == 1 && v5 == 2;
  BOOL v8 = v5 != 2 && v4 == 1;
  uint64_t v9 = 2;
  if (!v8) {
    uint64_t v9 = 0;
  }
  if (v7) {
    int64_t v10 = 3;
  }
  else {
    int64_t v10 = v9;
  }
  if (v4 == 2) {
    int64_t v10 = 3;
  }
  if (v4) {
    return v10;
  }
  else {
    return 1;
  }
}

- (id)_footerText
{
  int64_t v3 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _frequency];
  uint64_t v4 = [(NSDateFormatter *)self->_dayNameFormatter stringFromDate:self->_selectedDate];
  int64_t v5 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _displayStringForSelectedDate];
  if (v3 == 4 || v3 == 5)
  {
    BOOL v7 = PKLocalizedFeatureString();
  }
  else if (v3 == 6)
  {
    if (self->_useOrdinalDay)
    {
      id v6 = PKOrdinalStringForInteger();
    }
    else
    {
      productCalendar = self->_productCalendar;
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      int64_t v10 = [(NSCalendar *)productCalendar nextDateAfterDate:v9 matchingUnit:16 value:self->_scheduledDay options:2];

      id v6 = [(NSDateFormatter *)self->_cardinalDayDateFormatter stringFromDate:v10];
    }
    BOOL v7 = PKLocalizedFeatureString();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _paymentRowTypeForIndexPath:a4];
  int64_t v8 = v7;
  self->_shouldShowCollectionView = 0;
  switch(v7)
  {
    case 3:
      if ([(PKAccountAutomaticPaymentsConfigurationViewController *)self _frequency] == 6)
      {
        [(PKFixedAmountWrapperView *)self->_wrapperView setPickerView:0];
        self->_shouldShowCollectionView = 1;
        goto LABEL_10;
      }
      [(PKAccountAutomaticPaymentsConfigurationViewController *)self _updateDates];
      wrapperView = self->_wrapperView;
      uint64_t v9 = 1296;
      break;
    case 2:
      wrapperView = self->_wrapperView;
      uint64_t v9 = 1288;
      break;
    case 1:
      uint64_t v9 = 1280;
      wrapperView = self->_wrapperView;
      break;
    default:
      goto LABEL_10;
  }
  [(PKFixedAmountWrapperView *)wrapperView setPickerView:*(Class *)((char *)&self->super.super.super.super.super.isa + v9)];
LABEL_10:
  self->_selectedRowType = v8;
  uint64_t v11 = [(PKAccountAutomaticPaymentsDateFooterView *)self->_footerView textLabel];
  int v12 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self _footerText];
  [v11 setText:v12];

  [v6 reloadData];

  [(PKAccountAutomaticPaymentsConfigurationViewController *)self _updateNextButtonEnabledIfNecessary];
}

- (id)_addBankAccountInformationViewController
{
  int64_t v3 = [(PKAccount *)self->_account creditDetails];
  uint64_t v4 = [v3 countryCode];

  int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F84550]) initWithType:1];
  id v6 = [[PKAddBankAccountInformationViewController alloc] initWithDelegate:self bankInformation:v5 accountCountryCode:v4 featureAccount:self->_account];
  int64_t v7 = [(PKAccountAutomaticPaymentsController *)self->_controller fundingSources];
  -[PKAddBankAccountInformationViewController setOfferKeychainPreFill:](v6, "setOfferKeychainPreFill:", [v7 count] == 0);

  int64_t v8 = [[PKNavigationController alloc] initWithRootViewController:v6];
  [(PKNavigationController *)v8 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v8 setModalPresentationStyle:2];
  }

  return v8;
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __117__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __117__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(a1 + 32) + 1088);
  v3[0] = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 setFundingSources:v2];
}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  uint64_t v4 = [(PKAccountAutomaticPaymentsConfigurationViewController *)self navigationController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __106__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1088) fundingSources];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _performNextButtonTapped];
  }
}

- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didFailWithError___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  int v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __114__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didFailWithError___block_invoke(uint64_t a1)
{
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 32), [*(id *)(*(void *)(a1 + 40) + 1096) feature], 0, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
  [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_frequencyPicker, 0);
  objc_storeStrong((id *)&self->_amountPicker, 0);
  objc_storeStrong((id *)&self->_monthDayCollectionViewController, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_selectedFrequency, 0);
  objc_storeStrong((id *)&self->_selectedAmount, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_frequenciesMap, 0);
  objc_storeStrong((id *)&self->_frequencies, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_cardinalDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_dayNameFormatter, 0);
  objc_storeStrong((id *)&self->_cellDateFormatter, 0);
  objc_storeStrong((id *)&self->_pickerDateFormatter, 0);
  objc_storeStrong((id *)&self->_modelDateFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end