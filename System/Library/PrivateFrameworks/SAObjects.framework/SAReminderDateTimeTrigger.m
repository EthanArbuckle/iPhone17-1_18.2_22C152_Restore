@interface SAReminderDateTimeTrigger
+ (id)dateTimeTrigger;
- (NSDate)date;
- (NSString)timeZoneId;
- (SAReminderDateTimeTriggerOffset)offset;
- (SAReminderDateTimeTriggerOffset)relativeTimeOffset;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDate:(id)a3;
- (void)setOffset:(id)a3;
- (void)setRelativeTimeOffset:(id)a3;
- (void)setTimeZoneId:(id)a3;
@end

@implementation SAReminderDateTimeTrigger

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"DateTimeTrigger";
}

+ (id)dateTimeTrigger
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)date
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"date"];
}

- (void)setDate:(id)a3
{
}

- (SAReminderDateTimeTriggerOffset)offset
{
  return (SAReminderDateTimeTriggerOffset *)AceObjectAceObjectForProperty(self, @"offset");
}

- (void)setOffset:(id)a3
{
}

- (SAReminderDateTimeTriggerOffset)relativeTimeOffset
{
  return (SAReminderDateTimeTriggerOffset *)AceObjectAceObjectForProperty(self, @"relativeTimeOffset");
}

- (void)setRelativeTimeOffset:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
{
}

@end