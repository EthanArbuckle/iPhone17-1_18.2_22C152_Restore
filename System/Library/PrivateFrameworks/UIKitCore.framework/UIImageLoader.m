@interface UIImageLoader
@end

@implementation UIImageLoader

void __56___UIImageLoader__loadImageWithCompletionQueue_handler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 9));
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
  _drainTrampolines(*(void **)(a1 + 32));
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_unlock(v2);
}

@end