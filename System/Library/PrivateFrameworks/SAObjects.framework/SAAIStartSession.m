@interface SAAIStartSession
+ (id)startSession;
- (BOOL)requiresResponse;
- (NSString)acousticIdSessionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAcousticIdSessionId:(id)a3;
@end

@implementation SAAIStartSession

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"StartSession";
}

+ (id)startSession
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)acousticIdSessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"acousticIdSessionId"];
}

- (void)setAcousticIdSessionId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end