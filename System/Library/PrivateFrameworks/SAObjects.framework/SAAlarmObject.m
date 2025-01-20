@interface SAAlarmObject
+ (id)object;
- (NSArray)frequency;
- (NSNumber)enabled;
- (NSNumber)firing;
- (NSNumber)hour;
- (NSNumber)minute;
- (NSNumber)relativeOffsetMinutes;
- (NSString)label;
- (SADataSourceInfo)dataSourceInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDataSourceInfo:(id)a3;
- (void)setEnabled:(id)a3;
- (void)setFiring:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setHour:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMinute:(id)a3;
- (void)setRelativeOffsetMinutes:(id)a3;
@end

@implementation SAAlarmObject

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADataSourceInfo)dataSourceInfo
{
  return (SADataSourceInfo *)AceObjectAceObjectForProperty(self, @"dataSourceInfo");
}

- (void)setDataSourceInfo:(id)a3
{
}

- (NSNumber)enabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enabled"];
}

- (void)setEnabled:(id)a3
{
}

- (NSNumber)firing
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"firing"];
}

- (void)setFiring:(id)a3
{
}

- (NSArray)frequency
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"frequency"];
}

- (void)setFrequency:(id)a3
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

- (NSNumber)relativeOffsetMinutes
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"relativeOffsetMinutes"];
}

- (void)setRelativeOffsetMinutes:(id)a3
{
}

@end