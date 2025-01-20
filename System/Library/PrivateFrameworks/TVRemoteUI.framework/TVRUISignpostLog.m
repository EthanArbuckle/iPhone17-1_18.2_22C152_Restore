@interface TVRUISignpostLog
@end

@implementation TVRUISignpostLog

uint64_t ___TVRUISignpostLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Signpost");
  uint64_t v1 = _TVRUISignpostLog_log;
  _TVRUISignpostLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end