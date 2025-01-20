@interface TVRUIViewControllerLog
@end

@implementation TVRUIViewControllerLog

uint64_t ___TVRUIViewControllerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "ViewController");
  uint64_t v1 = _TVRUIViewControllerLog_log;
  _TVRUIViewControllerLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end