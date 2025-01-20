@interface TTRIRecurrenceChooserController
+ (int)dayFromNumber:(int64_t)a3;
- (BOOL)drawBackgroundForRow:(int64_t)a3;
- (NSDate)date;
- (TTRIRecurrenceChooserController)initWithDate:(id)a3;
- (TTRIRecurrenceChooserControllerDelegate)delegate;
- (UIColor)backgroundColor;
- (double)heightForRow:(int64_t)a3;
- (id)cellForRow:(int64_t)a3;
- (id)startDateComponents:(unint64_t)a3;
- (int64_t)frequency;
- (int64_t)numberOfRows;
- (void)notifyDelegate;
- (void)setBackgroundColor:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TTRIRecurrenceChooserController

- (TTRIRecurrenceChooserController)initWithDate:(id)a3
{
  id v4 = a3;
  v5 = [(TTRIRecurrenceChooserController *)self init];
  v6 = v5;
  if (v5) {
    [(TTRIRecurrenceChooserController *)v5 setDate:v4];
  }

  return v6;
}

+ (int)dayFromNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return dword_1B9977F60[a3 - 1];
  }
}

- (id)startDateComponents:(unint64_t)a3
{
  id v4 = [(TTRIRecurrenceChooserController *)self date];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v6 = [v5 components:a3 fromDate:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)notifyDelegate
{
  id v3 = [(TTRIRecurrenceChooserController *)self delegate];
  [v3 recurrenceChooserUpdated:self];
}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)heightForRow:(int64_t)a3
{
  return *MEMORY[0x1E4FB2F28];
}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  return 1;
}

- (TTRIRecurrenceChooserControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTRIRecurrenceChooserControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (int64_t)frequency
{
  return -1;
}

- (id)cellForRow:(int64_t)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  id v3 = [[TTRICustomRecurrenceTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];

  return v3;
}

@end