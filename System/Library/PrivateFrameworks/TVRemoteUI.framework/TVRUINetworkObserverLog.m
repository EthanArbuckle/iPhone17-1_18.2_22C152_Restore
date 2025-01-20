@interface TVRUINetworkObserverLog
@end

@implementation TVRUINetworkObserverLog

uint64_t ___TVRUINetworkObserverLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "NetworkObserver");
  uint64_t v1 = _TVRUINetworkObserverLog_log;
  _TVRUINetworkObserverLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end