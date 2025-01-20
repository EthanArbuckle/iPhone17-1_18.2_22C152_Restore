@interface AFCCoordinateFileActivity
@end

@implementation AFCCoordinateFileActivity

void ____AFCCoordinateFileActivity_block_invoke(uint64_t a1, int a2, const void *a3, void *aBlock)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = _Block_copy(aBlock);
  if (a3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFRetain(a3);
  }
  if (!dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48)))
  {
    _Block_release(*(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
    (*((void (**)(void *))aBlock + 2))(aBlock);
    if (a3) {
      CFRelease(a3);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  v7 = *(NSObject **)(a1 + 48);

  dispatch_release(v7);
}

@end