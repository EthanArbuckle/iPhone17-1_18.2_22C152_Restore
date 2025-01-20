@interface UIKitUserDefaults
@end

@implementation UIKitUserDefaults

uint64_t ____UIKitUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
  uint64_t v1 = qword_1EC05EFB0;
  qword_1EC05EFB0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end