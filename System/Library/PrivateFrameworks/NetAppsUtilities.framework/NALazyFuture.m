@interface NALazyFuture
@end

@implementation NALazyFuture

uint64_t __39___NALazyFuture_willAddCompletionBlock__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFinished];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) started];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      v3 = *(void **)(a1 + 32);
      return [v3 setStarted:1];
    }
  }
  return result;
}

void __39___NALazyFuture_willAddCompletionBlock__block_invoke_2(uint64_t a1)
{
  v3 = [[NAPromise alloc] initWithFuture:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 32) block];
  ((void (**)(void, NAPromise *))v2)[2](v2, v3);

  [*(id *)(a1 + 32) setBlock:0];
}

@end