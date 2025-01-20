@interface SACalendarRecurrence
+ (id)recurrence;
- (NSDate)endDate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)frequency;
- (int64_t)endCount;
- (int64_t)interval;
- (void)setEndCount:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setFrequency:(int)a3;
- (void)setInterval:(int64_t)a3;
@end

@implementation SACalendarRecurrence

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
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

- (int64_t)endCount
{
  return AceObjectIntegerForProperty(self, @"endCount");
}

- (void)setEndCount:(int64_t)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (int)frequency
{
  id v2 = [(AceObject *)self propertyForKey:@"frequency"];
  int v3 = SACalendarRecurrenceFrequencyForString(v2);

  return v3;
}

- (void)setFrequency:(int)a3
{
  stringForSACalendarRecurrenceFrequency(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"frequency", v4);
}

- (int64_t)interval
{
  return AceObjectIntegerForProperty(self, @"interval");
}

- (void)setInterval:(int64_t)a3
{
}

@end