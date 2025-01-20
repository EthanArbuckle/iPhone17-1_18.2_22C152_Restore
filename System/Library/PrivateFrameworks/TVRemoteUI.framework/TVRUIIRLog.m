@interface TVRUIIRLog
@end

@implementation TVRUIIRLog

uint64_t ___TVRUIIRLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "IntelligentRouting");
  uint64_t v1 = _TVRUIIRLog_log;
  _TVRUIIRLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end