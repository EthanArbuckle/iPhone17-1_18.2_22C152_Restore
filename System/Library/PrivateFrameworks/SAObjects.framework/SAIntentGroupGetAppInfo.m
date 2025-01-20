@interface SAIntentGroupGetAppInfo
+ (id)getAppInfo;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)shouldSearchLocallyOnly;
- (NSArray)appIdentifyingInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppIdentifyingInfo:(id)a3;
- (void)setShouldSearchLocallyOnly:(BOOL)a3;
@end

@implementation SAIntentGroupGetAppInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"GetAppInfo";
}

+ (id)getAppInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appIdentifyingInfo
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"appIdentifyingInfo", v3);
}

- (void)setAppIdentifyingInfo:(id)a3
{
}

- (BOOL)shouldSearchLocallyOnly
{
  return AceObjectBoolForProperty(self, @"shouldSearchLocallyOnly");
}

- (void)setShouldSearchLocallyOnly:(BOOL)a3
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