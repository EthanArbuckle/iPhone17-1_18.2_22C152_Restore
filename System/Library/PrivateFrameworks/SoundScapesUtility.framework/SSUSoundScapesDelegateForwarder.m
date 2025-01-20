@interface SSUSoundScapesDelegateForwarder
@end

@implementation SSUSoundScapesDelegateForwarder

uint64_t __61___SSUSoundScapesDelegateForwarder_mediaPickerConfirmChoices__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaPickerDidSelectPlaybackArchive:*(void *)(*(void *)(a1 + 32) + 8) withError:*(void *)(*(void *)(a1 + 32) + 16)];

  v3 = *(void **)(a1 + 32);

  return [v3 cleanup];
}

uint64_t __66___SSUSoundScapesDelegateForwarder_selectedSoundScapes_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNavigationItem];
}

uint64_t __50___SSUSoundScapesDelegateForwarder_requestDismiss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaPickerCancelled];

  v3 = *(void **)(a1 + 32);

  return [v3 cleanup];
}

void __43___SSUSoundScapesDelegateForwarder_cleanup__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) connection];
  [v1 invalidate];
}

@end