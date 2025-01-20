@interface SRStringFilter
@end

@implementation SRStringFilter

uint64_t __SRStringFilter_debugLog_block_invoke()
{
  SRStringFilter_debugLog_debugLog = (uint64_t)os_log_create("com.apple.SignpostSupport", "signpost_reporter_string_filter");

  return MEMORY[0x1F41817F8]();
}

@end