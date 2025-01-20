@interface WFDefaultLog
@end

@implementation WFDefaultLog

os_log_t ____WFDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.webcontentfilter", "default");
  __WFDefaultLog_log = (uint64_t)result;
  return result;
}

@end