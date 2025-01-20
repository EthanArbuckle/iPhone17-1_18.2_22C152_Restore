@interface MockDateProvider
+ (id)mockDate;
- (NSDate)overrideDate;
- (id)date;
- (void)setOverrideDate:(id)a3;
@end

@implementation MockDateProvider

- (id)date
{
  v2 = [(MockDateProvider *)self overrideDate];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() mockDate];
  }
  v5 = v4;

  return v5;
}

+ (id)mockDate
{
  v2 = objc_opt_new();
  [v2 setYear:2023];
  [v2 setMonth:9];
  [v2 setDay:20];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 dateFromComponents:v2];

  return v4;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end