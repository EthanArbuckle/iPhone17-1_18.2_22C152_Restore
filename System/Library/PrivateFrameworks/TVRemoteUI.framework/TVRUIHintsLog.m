@interface TVRUIHintsLog
@end

@implementation TVRUIHintsLog

uint64_t ___TVRUIHintsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Hints");
  uint64_t v1 = _TVRUIHintsLog_log;
  _TVRUIHintsLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end