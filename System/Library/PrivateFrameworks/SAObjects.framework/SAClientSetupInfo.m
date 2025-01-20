@interface SAClientSetupInfo
+ (id)clientSetupInfo;
- (BOOL)delay;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (double)threshold;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDelay:(BOOL)a3;
- (void)setThreshold:(double)a3;
@end

@implementation SAClientSetupInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ClientSetupInfo";
}

+ (id)clientSetupInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)delay
{
  return AceObjectBoolForProperty(self, @"delay");
}

- (void)setDelay:(BOOL)a3
{
}

- (double)threshold
{
  return AceObjectDoubleForProperty(self, @"threshold");
}

- (void)setThreshold:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end