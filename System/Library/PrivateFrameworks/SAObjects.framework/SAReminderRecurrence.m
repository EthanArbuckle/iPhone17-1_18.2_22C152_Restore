@interface SAReminderRecurrence
+ (id)recurrence;
- (NSArray)daysOfTheMonth;
- (NSArray)daysOfTheWeek;
- (NSArray)daysOfTheYear;
- (NSArray)monthsOfTheYear;
- (NSArray)weeksOfTheYear;
- (NSString)frequencyTimeUnit;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)interval;
- (void)setDaysOfTheMonth:(id)a3;
- (void)setDaysOfTheWeek:(id)a3;
- (void)setDaysOfTheYear:(id)a3;
- (void)setFrequencyTimeUnit:(id)a3;
- (void)setInterval:(int64_t)a3;
- (void)setMonthsOfTheYear:(id)a3;
- (void)setWeeksOfTheYear:(id)a3;
@end

@implementation SAReminderRecurrence

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"Recurrence";
}

+ (id)recurrence
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)daysOfTheMonth
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"daysOfTheMonth"];
}

- (void)setDaysOfTheMonth:(id)a3
{
}

- (NSArray)daysOfTheWeek
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"daysOfTheWeek"];
}

- (void)setDaysOfTheWeek:(id)a3
{
}

- (NSArray)daysOfTheYear
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"daysOfTheYear"];
}

- (void)setDaysOfTheYear:(id)a3
{
}

- (NSString)frequencyTimeUnit
{
  return (NSString *)[(AceObject *)self propertyForKey:@"frequencyTimeUnit"];
}

- (void)setFrequencyTimeUnit:(id)a3
{
}

- (int64_t)interval
{
  return AceObjectIntegerForProperty(self, @"interval");
}

- (void)setInterval:(int64_t)a3
{
}

- (NSArray)monthsOfTheYear
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"monthsOfTheYear"];
}

- (void)setMonthsOfTheYear:(id)a3
{
}

- (NSArray)weeksOfTheYear
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"weeksOfTheYear"];
}

- (void)setWeeksOfTheYear:(id)a3
{
}

@end