@interface LoadIconForAppID
@end

@implementation LoadIconForAppID

intptr_t ___LoadIconForAppID_block_invoke(uint64_t a1, CGImageRef image)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGImageRetain(image);
  v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

@end