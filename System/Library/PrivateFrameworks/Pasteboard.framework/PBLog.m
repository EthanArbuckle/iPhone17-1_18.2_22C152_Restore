@interface PBLog
@end

@implementation PBLog

uint64_t ___PBLog_block_invoke()
{
  _PBLog_log = (uint64_t)os_log_create("com.apple.Pasteboard", "Pasteboard");
  return MEMORY[0x1F41817F8]();
}

@end