@interface CallTimersWithSelector
@end

@implementation CallTimersWithSelector

uint64_t ___CallTimersWithSelector_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40)];
}

@end