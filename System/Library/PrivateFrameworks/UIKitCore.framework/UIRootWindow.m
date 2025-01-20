@interface UIRootWindow
@end

@implementation UIRootWindow

void __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C108260]();
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_visibilityLock_enqueueUpdateIfNecessary_body");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke_2;
  block[3] = &unk_1E52D9900;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

@end