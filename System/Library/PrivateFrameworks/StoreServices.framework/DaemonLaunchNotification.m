@interface DaemonLaunchNotification
@end

@implementation DaemonLaunchNotification

uint64_t ____DaemonLaunchNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDownloadsDidChange:0];
}

uint64_t ____DaemonLaunchNotification_block_invoke_0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToDaemon];
}

uint64_t ____DaemonLaunchNotification_block_invoke_1(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerAsObserver];
}

uint64_t ____DaemonLaunchNotification_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectEventConnection];
}

uint64_t ____DaemonLaunchNotification_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconnectToDaemonWithCompletionBlock:0];
}

@end