@interface TVRUIButtonLog
@end

@implementation TVRUIButtonLog

uint64_t ___TVRUIButtonLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Buttons");
  uint64_t v1 = _TVRUIButtonLog_log;
  _TVRUIButtonLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end