@interface NSDate
- (id)startDayOfWeek;
- (int64_t)daysToDate:(id)a3;
@end

@implementation NSDate

- (id)startDayOfWeek
{
  id v3 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v4 = [v3 components:8196 fromDate:self];
  [v4 setWeekday:1];

  return [v3 dateFromComponents:v4];
}

- (int64_t)daysToDate:(id)a3
{
  uint64_t v3 = [(NSDateComponents *)[+[NSCalendar currentCalendar] components:16 fromDate:self toDate:a3 options:0] day];
  if (v3 >= 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = -v3;
  }
  return v4 + 1;
}

@end