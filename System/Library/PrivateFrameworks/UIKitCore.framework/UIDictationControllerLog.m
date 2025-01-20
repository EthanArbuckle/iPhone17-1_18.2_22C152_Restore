@interface UIDictationControllerLog
@end

@implementation UIDictationControllerLog

void ___UIDictationControllerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "Dictation");
  v1 = (void *)_UIDictationControllerLog_log;
  _UIDictationControllerLog_log = (uint64_t)v0;
}

@end