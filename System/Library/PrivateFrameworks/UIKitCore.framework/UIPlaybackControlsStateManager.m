@interface UIPlaybackControlsStateManager
@end

@implementation UIPlaybackControlsStateManager

void __66___UIPlaybackControlsStateManager__beginFullscreenPlaybackSession__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] removeObject:v5];
    -[_UIPlaybackControlsStateManager _updateState](v4);
  }
}

void __67___UIPlaybackControlsStateManager__beginPresentingPlaybackControls__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] removeObject:v5];
    -[_UIPlaybackControlsStateManager _updateState](v4);
  }
}

uint64_t __47___UIPlaybackControlsStateManager__updateState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPlaybackControlsState:*(void *)(a1 + 32)];
}

@end