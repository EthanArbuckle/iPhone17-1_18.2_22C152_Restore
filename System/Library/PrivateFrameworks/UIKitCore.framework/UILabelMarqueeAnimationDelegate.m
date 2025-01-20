@interface UILabelMarqueeAnimationDelegate
@end

@implementation UILabelMarqueeAnimationDelegate

void __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9))
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = _UILabelMarqueeEndedNotification;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v2 postNotificationName:v3 object:WeakRetained userInfo:0];

    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    objc_setAssociatedObject(v5, &__marqueeAnimationDelegateKey, 0, (void *)1);
  }
}

void __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained setMarqueeRunning:0];
}

@end