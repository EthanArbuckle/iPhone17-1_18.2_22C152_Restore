@interface UISCreateLoggerIfNeeded
@end

@implementation UISCreateLoggerIfNeeded

uint64_t ___UISCreateLoggerIfNeeded_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = os_log_create("com.apple.uikitservices.servicefacilities", *(const char **)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

@end