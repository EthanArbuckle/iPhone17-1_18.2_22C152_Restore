@interface TVRUIViewServiceLog
@end

@implementation TVRUIViewServiceLog

uint64_t ___TVRUIViewServiceLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "ViewService");
  uint64_t v1 = _TVRUIViewServiceLog_log;
  _TVRUIViewServiceLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end