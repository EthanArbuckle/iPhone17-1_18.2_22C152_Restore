@interface LTOSLogLID
@end

@implementation LTOSLogLID

uint64_t ___LTOSLogLID_block_invoke()
{
  _LTOSLogLID_log = (uint64_t)os_log_create("com.apple.Translation", "LID");
  return MEMORY[0x270F9A758]();
}

@end