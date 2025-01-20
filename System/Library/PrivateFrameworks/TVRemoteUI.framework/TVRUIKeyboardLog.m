@interface TVRUIKeyboardLog
@end

@implementation TVRUIKeyboardLog

uint64_t ___TVRUIKeyboardLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "Keyboard");
  uint64_t v1 = _TVRUIKeyboardLog_log;
  _TVRUIKeyboardLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end