@interface DownloadMonitorChanged
@end

@implementation DownloadMonitorChanged

uint64_t ____DownloadMonitorChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadForChangeNotification];
}

@end