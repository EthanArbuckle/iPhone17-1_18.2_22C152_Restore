@interface SACreateSessionInfoResponse
+ (id)createSessionInfoResponse;
- (BOOL)requiresResponse;
- (NSData)sessionInfo;
- (NSNumber)validityDuration;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSessionInfo:(id)a3;
- (void)setValidityDuration:(id)a3;
@end

@implementation SACreateSessionInfoResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CreateSessionInfoResponse";
}

+ (id)createSessionInfoResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)sessionInfo
{
  return (NSData *)[(AceObject *)self propertyForKey:@"sessionInfo"];
}

- (void)setSessionInfo:(id)a3
{
}

- (NSNumber)validityDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"validityDuration"];
}

- (void)setValidityDuration:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end