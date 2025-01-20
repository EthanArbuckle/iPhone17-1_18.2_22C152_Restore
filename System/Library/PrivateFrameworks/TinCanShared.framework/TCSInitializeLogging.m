@interface TCSInitializeLogging
@end

@implementation TCSInitializeLogging

uint64_t ___TCSInitializeLogging_block_invoke()
{
  TCSLogDefault = (uint64_t)os_log_create((const char *)[@"com.apple.tincan" UTF8String], "default");
  return MEMORY[0x270F9A758]();
}

@end