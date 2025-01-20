@interface TRIIntegrationTestingDefaultsOverrides
+ (BOOL)shouldUseIntegrationTestLogger;
+ (id)integrationTestLoggerDefaultsName;
@end

@implementation TRIIntegrationTestingDefaultsOverrides

+ (BOOL)shouldUseIntegrationTestLogger
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"com.apple.triald.use-integration-test-logger"];
  if (v3) {
    char v4 = [v2 BOOLForKey:@"com.apple.triald.use-integration-test-logger"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)integrationTestLoggerDefaultsName
{
  return @"com.apple.triald.use-integration-test-logger";
}

@end