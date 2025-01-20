@interface MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer
@end

@implementation MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer

void ___onQueue_MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer_block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 contentItems];
  if (v4)
  {
    v3 = [*(id *)(a1 + 32) playerPath];
    _onQueue_MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer(v4, v3);
  }
}

@end