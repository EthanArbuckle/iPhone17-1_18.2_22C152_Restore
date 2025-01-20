@interface TVRUIPrewarmLog
@end

@implementation TVRUIPrewarmLog

uint64_t ___TVRUIPrewarmLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Prewarm");
  uint64_t v1 = _TVRUIPrewarmLog_log;
  _TVRUIPrewarmLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end