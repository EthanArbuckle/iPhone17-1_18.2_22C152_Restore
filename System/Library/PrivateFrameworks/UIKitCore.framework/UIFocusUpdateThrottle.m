@interface UIFocusUpdateThrottle
@end

@implementation UIFocusUpdateThrottle

uint64_t __34___UIFocusUpdateThrottle_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performScheduledUpdate];
}

uint64_t __57___UIFocusUpdateThrottle_scheduleProgrammaticFocusUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performScheduledUpdate];
}

uint64_t __31___UIFocusUpdateThrottle_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performScheduledUpdate];
}

@end