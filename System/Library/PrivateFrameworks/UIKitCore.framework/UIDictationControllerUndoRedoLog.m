@interface UIDictationControllerUndoRedoLog
@end

@implementation UIDictationControllerUndoRedoLog

void ___UIDictationControllerUndoRedoLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "DictationUndoRedo");
  v1 = (void *)_UIDictationControllerUndoRedoLog_log;
  _UIDictationControllerUndoRedoLog_log = (uint64_t)v0;
}

@end