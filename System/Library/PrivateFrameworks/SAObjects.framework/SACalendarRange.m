@interface SACalendarRange
+ (id)calendarRange;
- (SACalendar)end;
- (SACalendar)start;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation SACalendarRange

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CalendarRange";
}

+ (id)calendarRange
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SACalendar)end
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"end");
}

- (void)setEnd:(id)a3
{
}

- (SACalendar)start
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"start");
}

- (void)setStart:(id)a3
{
}

@end