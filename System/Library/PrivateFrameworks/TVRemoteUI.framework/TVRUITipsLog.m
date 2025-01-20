@interface TVRUITipsLog
@end

@implementation TVRUITipsLog

uint64_t ___TVRUITipsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Tips");
  uint64_t v1 = _TVRUITipsLog_log;
  _TVRUITipsLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end