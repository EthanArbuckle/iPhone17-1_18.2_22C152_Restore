@interface FSEventStreamCallback
@end

@implementation FSEventStreamCallback

uint64_t ___FSEventStreamCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processEvents:*(void *)(a1 + 40)];
}

@end