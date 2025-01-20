@interface UIKitUserDefaults
@end

@implementation UIKitUserDefaults

uint64_t ___UIKitUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
  uint64_t v1 = _UIKitUserDefaults_result;
  _UIKitUserDefaults_result = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end