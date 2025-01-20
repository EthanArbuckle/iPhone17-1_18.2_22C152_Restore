@interface VKSignpostLog
@end

@implementation VKSignpostLog

void ___VKSignpostLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.VisionKit", "signposts");
  v1 = (void *)_VKSignpostLog____VKSignpostLog;
  _VKSignpostLog____VKSignpostLog = (uint64_t)v0;
}

@end