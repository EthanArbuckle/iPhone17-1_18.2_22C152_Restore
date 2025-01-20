@interface BYLoggingEnabled
@end

@implementation BYLoggingEnabled

uint64_t ___BYLoggingEnabled_block_invoke()
{
  int out_token = 0;
  notify_register_dispatch("BYLoggingLevelDidChangeNotification", &out_token, MEMORY[0x1E4F14428], &__block_literal_global_13_0);
  uint64_t result = _checkLoggingEnabled();
  _BYLoggingEnabled_shouldLog = result;
  return result;
}

uint64_t ___BYLoggingEnabled_block_invoke_2()
{
  uint64_t result = _checkLoggingEnabled();
  _BYLoggingEnabled_shouldLog = result;
  return result;
}

@end