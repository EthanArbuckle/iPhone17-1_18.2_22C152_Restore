@interface SAAlarmSearch
+ (id)search;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)frequency;
- (NSNumber)enabled;
- (NSNumber)hour;
- (NSNumber)includesSleepAlarms;
- (NSNumber)minute;
- (NSString)label;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnabled:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setHour:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncludesSleepAlarms:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMinute:(id)a3;
@end

@implementation SAAlarmSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)enabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enabled"];
}

- (void)setEnabled:(id)a3
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

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)includesSleepAlarms
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"includesSleepAlarms"];
}

- (void)setIncludesSleepAlarms:(id)a3
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

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end