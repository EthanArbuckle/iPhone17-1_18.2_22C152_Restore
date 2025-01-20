@interface CACAssertionFailed
@end

@implementation CACAssertionFailed

intptr_t ___CACAssertionFailed_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end