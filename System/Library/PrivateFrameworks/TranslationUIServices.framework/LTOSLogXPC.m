@interface LTOSLogXPC
@end

@implementation LTOSLogXPC

uint64_t ___LTOSLogXPC_block_invoke()
{
  _LTOSLogXPC_log = (uint64_t)os_log_create("com.apple.Translation", "XPC");

  return MEMORY[0x270F9A758]();
}

@end