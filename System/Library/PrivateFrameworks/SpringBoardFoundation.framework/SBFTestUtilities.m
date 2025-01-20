@interface SBFTestUtilities
+ (BOOL)isRunningXCTest;
@end

@implementation SBFTestUtilities

+ (BOOL)isRunningXCTest
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 environment];
  v4 = [v3 objectForKeyedSubscript:@"XCTestConfigurationFilePath"];
  BOOL v5 = v4 != 0;

  return v5;
}

@end