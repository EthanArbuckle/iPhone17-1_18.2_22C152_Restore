@interface UIActiveTimer
@end

@implementation UIActiveTimer

uint64_t __49___UIActiveTimer_initWithDuration_updateHandler___block_invoke(uint64_t a1)
{
  CFTimeInterval v2 = (CACurrentMediaTime() - *(double *)(a1 + 48)) / *(double *)(a1 + 56);
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 40) + 16))(v2);
  if (v2 >= 1.0)
  {
    v4 = *(void **)(a1 + 32);
    return [v4 invalidate];
  }
  return result;
}

uint64_t __49___UIActiveTimer_initWithDuration_updateHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(1.0);
}

@end