@interface PXContextualMemoriesTimeSetting
- (NSDate)date;
- (NSDateFormatter)dateFormatter;
- (NSString)headerTitle;
- (NSString)title;
- (PXContextualMemoriesTimeSetting)init;
- (id)_forceMiddayDateForDate:(id)a3;
- (void)resetToDefault;
- (void)setDate:(id)a3;
- (void)setDateFormatter:(id)a3;
@end

@implementation PXContextualMemoriesTimeSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (id)_forceMiddayDateForDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [v5 components:28 fromDate:v4];

  [v6 setHour:12];
  [v6 setMinute:0];
  [v6 setSecond:0];
  [v6 setNanosecond:0];
  v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v6 setTimeZone:v7];

  v8 = [v5 dateFromComponents:v6];

  return v8;
}

- (NSDate)date
{
  date = self->_date;
  if (date)
  {
    v3 = date;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9C8] date];
    v3 = [(PXContextualMemoriesTimeSetting *)self _forceMiddayDateForDate:v5];
  }
  return v3;
}

- (void)setDate:(id)a3
{
  if (self->_date != a3)
  {
    -[PXContextualMemoriesTimeSetting _forceMiddayDateForDate:](self, "_forceMiddayDateForDate:");
    id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v4;
  }
}

- (void)resetToDefault
{
  [(PXContextualMemoriesTimeSetting *)self willChangeValueForKey:@"date"];
  date = self->_date;
  self->_date = 0;

  [(PXContextualMemoriesTimeSetting *)self didChangeValueForKey:@"date"];
}

- (NSString)title
{
  v3 = [(PXContextualMemoriesTimeSetting *)self date];
  if (v3)
  {
    id v4 = [(PXContextualMemoriesTimeSetting *)self dateFormatter];
    v5 = [(PXContextualMemoriesTimeSetting *)self date];
    v6 = [v4 stringFromDate:v5];
  }
  else
  {
    v6 = &stru_1F00B0030;
  }

  return (NSString *)v6;
}

- (NSString)headerTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"Time" value:&stru_1F00B0030 table:0];

  return (NSString *)v3;
}

- (PXContextualMemoriesTimeSetting)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXContextualMemoriesTimeSetting;
  v2 = [(PXContextualMemoriesTimeSetting *)&v6 init];
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    [(NSDateFormatter *)v2->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)v2->_dateFormatter setTimeStyle:0];
  }
  return v2;
}

@end