@interface SAIntentGroupGetAppInfoResponse
+ (id)getAppInfoResponse;
- (BOOL)requiresResponse;
- (NSArray)appInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppInfo:(id)a3;
@end

@implementation SAIntentGroupGetAppInfoResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"GetAppInfoResponse";
}

+ (id)getAppInfoResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appInfo
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"appInfo", v3);
}

- (void)setAppInfo:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end