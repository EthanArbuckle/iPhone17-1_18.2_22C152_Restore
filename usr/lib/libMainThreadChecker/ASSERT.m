@interface ASSERT
@end

@implementation ASSERT

void ____ASSERT_API_MUST_BE_CALLED_FROM_MAIN_THREAD_FAILED___block_invoke(id a1)
{
  __ASSERT_API_MUST_BE_CALLED_FROM_MAIN_THREAD_FAILED___log = (uint64_t)os_log_create("com.apple.MainThreadChecker", "reports");
}

@end