@interface UIDictationConnectionLog
@end

@implementation UIDictationConnectionLog

void ___UIDictationConnectionLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "DictationConnection");
  v1 = (void *)_UIDictationConnectionLog_log;
  _UIDictationConnectionLog_log = (uint64_t)v0;
}

@end