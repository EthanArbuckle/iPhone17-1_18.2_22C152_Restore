@interface UIMainBundleIdentifier
@end

@implementation UIMainBundleIdentifier

void ___UIMainBundleIdentifier_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)qword_1EB264B98;
  qword_1EB264B98 = v0;
}

@end