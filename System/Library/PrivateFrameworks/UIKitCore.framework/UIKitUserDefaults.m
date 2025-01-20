@interface UIKitUserDefaults
@end

@implementation UIKitUserDefaults

uint64_t ___UIKitUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
  v1 = (void *)_MergedGlobals_1291;
  _MergedGlobals_1291 = v0;

  uint64_t result = allowInternalPreferences();
  if (result)
  {
    v3 = (void *)_MergedGlobals_1291;
    uint64_t v4 = *MEMORY[0x1E4F281D8];
    return [v3 addSuiteNamed:v4];
  }
  return result;
}

@end