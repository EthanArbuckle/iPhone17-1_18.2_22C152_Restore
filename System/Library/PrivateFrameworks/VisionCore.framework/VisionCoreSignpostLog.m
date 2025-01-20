@interface VisionCoreSignpostLog
@end

@implementation VisionCoreSignpostLog

uint64_t ___VisionCoreSignpostLog_block_invoke()
{
  _VisionCoreSignpostLog____VisionCoreSignpostLog = (uint64_t)os_log_create("com.apple.VisionCore", "signposts");
  return MEMORY[0x270F9A758]();
}

@end