@interface SALocalSearchShowLocalSearchResult
+ (id)showLocalSearchResult;
- (BOOL)requiresResponse;
- (NSData)rawData;
- (NSDate)extSessionGuidCreatedTimestamp;
- (NSString)extSessionGuid;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExtSessionGuid:(id)a3;
- (void)setExtSessionGuidCreatedTimestamp:(id)a3;
- (void)setRawData:(id)a3;
@end

@implementation SALocalSearchShowLocalSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ShowLocalSearchResult";
}

+ (id)showLocalSearchResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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

- (NSData)rawData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"rawData"];
}

- (void)setRawData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end