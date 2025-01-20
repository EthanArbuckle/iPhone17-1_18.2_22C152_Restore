@interface SAAlarmSleepAlarm
- (NSNumber)bedtimeHour;
- (NSNumber)bedtimeMinute;
- (NSNumber)isFiringNext;
- (NSNumber)isOverride;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBedtimeHour:(id)a3;
- (void)setBedtimeMinute:(id)a3;
- (void)setIsFiringNext:(id)a3;
- (void)setIsOverride:(id)a3;
@end

@implementation SAAlarmSleepAlarm

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"SleepAlarm";
}

- (NSNumber)bedtimeHour
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"bedtimeHour"];
}

- (void)setBedtimeHour:(id)a3
{
}

- (NSNumber)bedtimeMinute
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"bedtimeMinute"];
}

- (void)setBedtimeMinute:(id)a3
{
}

- (NSNumber)isFiringNext
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isFiringNext"];
}

- (void)setIsFiringNext:(id)a3
{
}

- (NSNumber)isOverride
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isOverride"];
}

- (void)setIsOverride:(id)a3
{
}

@end