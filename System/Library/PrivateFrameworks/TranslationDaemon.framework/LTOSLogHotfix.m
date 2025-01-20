@interface LTOSLogHotfix
@end

@implementation LTOSLogHotfix

uint64_t ___LTOSLogHotfix_block_invoke()
{
  _LTOSLogHotfix_log = (uint64_t)os_log_create("com.apple.Translation", "Hotfix");
  return MEMORY[0x270F9A758]();
}

@end