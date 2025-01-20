@interface MXMGetLog
@end

@implementation MXMGetLog

uint64_t ___MXMGetLog_block_invoke()
{
  _MXMGetLog__defaultLogger = (uint64_t)os_log_create("com.apple.metricmeasurement", "Default");
  return MEMORY[0x270F9A758]();
}

@end