@interface MXSourceUtilitiesLog
@end

@implementation MXSourceUtilitiesLog

uint64_t ___MXSourceUtilitiesLog_block_invoke()
{
  _MXSourceUtilitiesLog_log = (uint64_t)os_log_create("com.apple.metrickit.sourceutilities", "");

  return MEMORY[0x270F9A758]();
}

@end