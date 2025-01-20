@interface LTOSLogSandbox
@end

@implementation LTOSLogSandbox

uint64_t ___LTOSLogSandbox_block_invoke()
{
  _LTOSLogSandbox_log = (uint64_t)os_log_create("com.apple.Translation", "Sandbox");
  return MEMORY[0x270F9A758]();
}

@end