@interface TVRCRemoteTextInputLog
@end

@implementation TVRCRemoteTextInputLog

uint64_t ___TVRCRemoteTextInputLog_block_invoke()
{
  _TVRCRemoteTextInputLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "RemoteTextInput");

  return MEMORY[0x270F9A758]();
}

@end