@interface MRMediaRemoteSendShortCircutedContentItemArtworkUpdatedNotification
@end

@implementation MRMediaRemoteSendShortCircutedContentItemArtworkUpdatedNotification

void ___onQueue_MRMediaRemoteSendShortCircutedContentItemArtworkUpdatedNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) match:a3]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

@end