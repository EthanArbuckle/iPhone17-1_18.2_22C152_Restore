@interface UIDocumentLog
@end

@implementation UIDocumentLog

void ___UIDocumentLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIDocumentLog");
  v1 = (void *)_MergedGlobals_1020;
  _MergedGlobals_1020 = (uint64_t)v0;
}

@end