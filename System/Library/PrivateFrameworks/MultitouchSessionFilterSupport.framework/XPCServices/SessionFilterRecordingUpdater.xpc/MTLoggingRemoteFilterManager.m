@interface MTLoggingRemoteFilterManager
@end

@implementation MTLoggingRemoteFilterManager

void __MTLoggingRemoteFilterManager_block_invoke(id a1)
{
  MTLoggingRemoteFilterManager::__logObj = (uint64_t)os_log_create("com.apple.Multitouch.SessionFilter", "RemoteFilterManager");

  _objc_release_x1();
}

@end