@interface SCLSettingsViewModel
- (BOOL)isEnabled;
- (NSArray)historyItems;
- (NSArray)timeIntervals;
- (SCLRecurrenceSchedule)customSchedule;
- (SCLSettingsViewModel)init;
- (int64_t)repeatSchedule;
- (unint64_t)scheduleType;
- (void)setCustomSchedule:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHistoryItems:(id)a3;
- (void)setRepeatSchedule:(int64_t)a3;
- (void)setScheduleType:(unint64_t)a3;
- (void)setTimeIntervals:(id)a3;
@end

@implementation SCLSettingsViewModel

- (SCLSettingsViewModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)SCLSettingsViewModel;
  v2 = [(SCLSettingsViewModel *)&v10 init];
  v3 = v2;
  if (v2)
  {
    historyItems = v2->_historyItems;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_historyItems = (NSArray *)MEMORY[0x263EFFA68];

    timeIntervals = v3->_timeIntervals;
    v3->_timeIntervals = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F66F60]) initWithRecurrences:v5];
    customSchedule = v3->_customSchedule;
    v3->_customSchedule = (SCLRecurrenceSchedule *)v7;
  }
  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (int64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void)setRepeatSchedule:(int64_t)a3
{
  self->_repeatSchedule = a3;
}

- (NSArray)timeIntervals
{
  return self->_timeIntervals;
}

- (void)setTimeIntervals:(id)a3
{
}

- (SCLRecurrenceSchedule)customSchedule
{
  return self->_customSchedule;
}

- (void)setCustomSchedule:(id)a3
{
}

- (NSArray)historyItems
{
  return self->_historyItems;
}

- (void)setHistoryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItems, 0);
  objc_storeStrong((id *)&self->_customSchedule, 0);

  objc_storeStrong((id *)&self->_timeIntervals, 0);
}

@end