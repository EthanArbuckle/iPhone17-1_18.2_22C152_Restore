@interface UIEventGetForceEvent
@end

@implementation UIEventGetForceEvent

uint64_t ___UIEventGetForceEvent_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

@end