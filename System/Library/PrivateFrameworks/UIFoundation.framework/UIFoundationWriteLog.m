@interface UIFoundationWriteLog
@end

@implementation UIFoundationWriteLog

uint64_t ____UIFoundationWriteLog_block_invoke(uint64_t a1)
{
  __UIFoundationWriteLog_uifoundationLog = (uint64_t)os_log_create("com.apple.UIFoundation", *(const char **)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end