@interface LTOSLogSignpost
@end

@implementation LTOSLogSignpost

uint64_t ___LTOSLogSignpost_block_invoke()
{
  _LTOSLogSignpost_log = (uint64_t)os_log_create("com.apple.Translation", "Signpost");

  return MEMORY[0x270F9A758]();
}

@end