@interface PNPSignpostLog
@end

@implementation PNPSignpostLog

uint64_t ___PNPSignpostLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.pencilpairingui", "signposts");
  uint64_t v1 = _PNPSignpostLog____PNPSignpostLog;
  _PNPSignpostLog____PNPSignpostLog = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end