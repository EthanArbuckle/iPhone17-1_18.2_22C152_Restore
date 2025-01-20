@interface NAFutureAddCompletionBlock
@end

@implementation NAFutureAddCompletionBlock

uint64_t ___NAFutureAddCompletionBlock_block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end