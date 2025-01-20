@interface SAAlarmAlarmModification
+ (id)alarmModification;
- (NSArray)addedFrequency;
- (NSArray)removedFrequency;
- (NSNumber)enabled;
- (NSNumber)hour;
- (NSNumber)minute;
- (NSString)label;
- (NSURL)alarmId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddedFrequency:(id)a3;
- (void)setAlarmId:(id)a3;
- (void)setEnabled:(id)a3;
- (void)setHour:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMinute:(id)a3;
- (void)setRemovedFrequency:(id)a3;
@end

@implementation SAAlarmAlarmModification

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"AlarmModification";
}

+ (id)alarmModification
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)addedFrequency
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"addedFrequency"];
}

- (void)setAddedFrequency:(id)a3
{
}

- (NSURL)alarmId
{
  return (NSURL *)AceObjectURLForProperty(self, @"alarmId");
}

- (void)setAlarmId:(id)a3
{
}

- (NSNumber)enabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enabled"];
}

- (void)setEnabled:(id)a3
{
}

- (NSNumber)hour
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"hour"];
}

- (void)setHour:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSNumber)minute
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"minute"];
}

- (void)setMinute:(id)a3
{
}

- (NSArray)removedFrequency
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"removedFrequency"];
}

- (void)setRemovedFrequency:(id)a3
{
}

@end