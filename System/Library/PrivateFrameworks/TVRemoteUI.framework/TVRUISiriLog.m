@interface TVRUISiriLog
@end

@implementation TVRUISiriLog

uint64_t ___TVRUISiriLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Siri");
  uint64_t v1 = _TVRUISiriLog_log;
  _TVRUISiriLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end