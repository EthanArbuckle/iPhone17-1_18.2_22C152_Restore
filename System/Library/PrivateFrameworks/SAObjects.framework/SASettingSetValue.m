@interface SASettingSetValue
+ (id)setValue;
- (BOOL)dryRun;
- (BOOL)failOnSiriDisconnectWarnings;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDryRun:(BOOL)a3;
- (void)setFailOnSiriDisconnectWarnings:(BOOL)a3;
@end

@implementation SASettingSetValue

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetValue";
}

+ (id)setValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)dryRun
{
  return AceObjectBoolForProperty(self, @"dryRun");
}

- (void)setDryRun:(BOOL)a3
{
}

- (BOOL)failOnSiriDisconnectWarnings
{
  return AceObjectBoolForProperty(self, @"failOnSiriDisconnectWarnings");
}

- (void)setFailOnSiriDisconnectWarnings:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end