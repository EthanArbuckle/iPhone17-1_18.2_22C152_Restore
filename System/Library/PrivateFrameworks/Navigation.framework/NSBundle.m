@interface NSBundle
@end

@implementation NSBundle

void __49__NSBundle_MNExtras___navigation_isRunningInSiri__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  _MergedGlobals_29 = [v0 isEqualToString:@"com.apple.siri"];
}

uint64_t __54__NSBundle_MNExtras___navigation_implementsSiriMethod__block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  byte_1EB59C121 = result & 1;
  return result;
}

uint64_t __39__NSBundle_MNExtras___navigationBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Navigation"];
  uint64_t v1 = qword_1EB59C138;
  qword_1EB59C138 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end