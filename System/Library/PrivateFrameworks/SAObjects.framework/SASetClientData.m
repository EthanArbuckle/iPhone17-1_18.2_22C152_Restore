@interface SASetClientData
+ (id)setClientData;
- (BOOL)requiresResponse;
- (NSNumber)holdToTalkThresholdInMilliseconds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHoldToTalkThresholdInMilliseconds:(id)a3;
@end

@implementation SASetClientData

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetClientData";
}

+ (id)setClientData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)holdToTalkThresholdInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"holdToTalkThresholdInMilliseconds"];
}

- (void)setHoldToTalkThresholdInMilliseconds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end