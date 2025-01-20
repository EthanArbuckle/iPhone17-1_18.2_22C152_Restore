@interface TTRICustomRecurrenceIntervalViewController
- (BOOL)maximumInterval;
- (TTRICustomRecurrenceIntervalViewController)initWithSelectedInterval:(int64_t)a3 frequency:(int64_t)a4 changeBlock:(id)a5;
- (id)_pickerViewFrequencyTitleForUnit:(int64_t)a3;
- (id)changeBlock;
- (id)pickerView;
- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)frequency;
- (int64_t)interval;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)loadView;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setChangeBlock:(id)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setInterval:(int64_t)a3;
- (void)setMaximumInterval:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TTRICustomRecurrenceIntervalViewController

- (TTRICustomRecurrenceIntervalViewController)initWithSelectedInterval:(int64_t)a3 frequency:(int64_t)a4 changeBlock:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TTRICustomRecurrenceIntervalViewController;
  v9 = [(TTRICustomRecurrenceIntervalViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    v9->_frequency = a4;
    v9->_interval = a3;
    v11 = _Block_copy(v8);
    id changeBlock = v10->_changeBlock;
    v10->_id changeBlock = v11;
  }
  return v10;
}

- (void)loadView
{
  id v3 = [(TTRICustomRecurrenceIntervalViewController *)self pickerView];
  [(TTRICustomRecurrenceIntervalViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TTRICustomRecurrenceIntervalViewController;
  [(TTRICustomRecurrenceIntervalViewController *)&v4 viewDidLoad];
  id v3 = [(TTRICustomRecurrenceIntervalViewController *)self pickerView];
  [v3 _setHostsLayoutEngine:0];
}

- (id)pickerView
{
  pickerView = self->_pickerView;
  if (!pickerView)
  {
    objc_super v4 = (UIPickerView *)objc_opt_new();
    v5 = self->_pickerView;
    self->_pickerView = v4;

    [(UIPickerView *)self->_pickerView setDelegate:self];
    [(UIPickerView *)self->_pickerView setDataSource:self];
    pickerView = self->_pickerView;
  }

  return pickerView;
}

- (void)setFrequency:(int64_t)a3
{
  if (self->_frequency != a3)
  {
    self->_frequency = a3;
    [(UIPickerView *)self->_pickerView reloadComponent:1];
  }
}

- (void)setInterval:(int64_t)a3
{
  if (self->_interval != a3)
  {
    self->_interval = a3;
    [(UIPickerView *)self->_pickerView selectRow:a3 - 1 inComponent:0 animated:0];
  }
}

- (void)setMaximumInterval:(BOOL)a3
{
  if (self->_maximumInterval != a3)
  {
    self->_BOOL maximumInterval = a3;
    int64_t v4 = [(TTRICustomRecurrenceIntervalViewController *)self interval];
    [(UIPickerView *)self->_pickerView reloadComponent:0];
    if ([(TTRICustomRecurrenceIntervalViewController *)self interval] <= self->_maximumInterval) {
      BOOL maximumInterval = v4;
    }
    else {
      BOOL maximumInterval = self->_maximumInterval;
    }
    [(TTRICustomRecurrenceIntervalViewController *)self setInterval:maximumInterval];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  if ([(TTRICustomRecurrenceIntervalViewController *)self maximumInterval]) {
    return [(TTRICustomRecurrenceIntervalViewController *)self maximumInterval];
  }
  return 999;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  if (a5 == 1)
  {
    uint64_t v9 = -[TTRICustomRecurrenceIntervalViewController _pickerViewFrequencyTitleForUnit:](self, "_pickerViewFrequencyTitleForUnit:", [v7 selectedRowInComponent:0] + 1);
    goto LABEL_5;
  }
  if (!a5)
  {
    uint64_t v9 = CUIKLocalizedStringForInteger();
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v10 = a3;
  uint64_t v7 = [v10 selectedRowInComponent:1];
  uint64_t v8 = [v10 selectedRowInComponent:0] + 1;
  uint64_t v9 = [(TTRICustomRecurrenceIntervalViewController *)self changeBlock];
  v9[2](v9, v8, v7);

  if (!a5) {
    [v10 reloadComponent:1];
  }
}

- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = RemindersUICoreBundleGet();
    v11 = [v7 localizedStringForKey:@"Unit" value:@"Unit" table:@"Localizable"];
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v7 = [(TTRICustomRecurrenceIntervalViewController *)self _pickerViewFrequencyTitleForUnit:2];
    uint64_t v8 = NSString;
    uint64_t v9 = RemindersUICoreBundleGet();
    id v10 = [v9 localizedStringForKey:@"Number of %@" value:@"Number of %@" table:@"Localizable"];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);

LABEL_5:
    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)_pickerViewFrequencyTitleForUnit:(int64_t)a3
{
  switch(self->_frequency)
  {
    case 0:
      int64_t v4 = NSString;
      v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"CUSTOM_RECURRENCE_INTERVAL_LABEL_DAYS";
      uint64_t v8 = @"Days";
      goto LABEL_7;
    case 1:
      int64_t v4 = NSString;
      v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"CUSTOM_RECURRENCE_INTERVAL_LABEL_WEEKS";
      uint64_t v8 = @"Weeks";
      goto LABEL_7;
    case 2:
      int64_t v4 = NSString;
      v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"CUSTOM_RECURRENCE_INTERVAL_LABEL_MONTHS";
      uint64_t v8 = @"Months";
      goto LABEL_7;
    case 3:
      int64_t v4 = NSString;
      v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"CUSTOM_RECURRENCE_INTERVAL_LABEL_YEARS";
      uint64_t v8 = @"Years";
      goto LABEL_7;
    case 4:
      int64_t v4 = NSString;
      v5 = RemindersUICoreBundleGet();
      id v6 = v5;
      uint64_t v7 = @"CUSTOM_RECURRENCE_INTERVAL_LABEL_HOURS";
      uint64_t v8 = @"Hours";
LABEL_7:
      uint64_t v9 = [v5 localizedStringForKey:v7 value:v8 table:@"PluralLocalizable"];
      a3 = objc_msgSend(v4, "localizedStringWithFormat:", v9, a3);

      break;
    default:
      break;
  }

  return (id)a3;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (int64_t)interval
{
  return self->_interval;
}

- (BOOL)maximumInterval
{
  return self->_maximumInterval;
}

- (id)changeBlock
{
  return objc_getProperty(self, a2, 1008, 1);
}

- (void)setChangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeBlock, 0);

  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end