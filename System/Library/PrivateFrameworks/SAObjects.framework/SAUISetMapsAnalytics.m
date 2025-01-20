@interface SAUISetMapsAnalytics
- (BOOL)requiresResponse;
- (NSDate)extSessionGuidCreatedTimestamp;
- (NSString)extSessionGuid;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExtSessionGuid:(id)a3;
- (void)setExtSessionGuidCreatedTimestamp:(id)a3;
@end

@implementation SAUISetMapsAnalytics

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SetMapsAnalytics";
}

- (NSString)extSessionGuid
{
  return (NSString *)[(AceObject *)self propertyForKey:@"extSessionGuid"];
}

- (void)setExtSessionGuid:(id)a3
{
}

- (NSDate)extSessionGuidCreatedTimestamp
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"extSessionGuidCreatedTimestamp"];
}

- (void)setExtSessionGuidCreatedTimestamp:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end