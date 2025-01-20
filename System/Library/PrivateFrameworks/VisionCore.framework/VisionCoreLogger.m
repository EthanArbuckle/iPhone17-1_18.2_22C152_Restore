@interface VisionCoreLogger
@end

@implementation VisionCoreLogger

uint64_t ___VisionCoreLogger_block_invoke()
{
  _VisionCoreLogger__visionLogger = (uint64_t)os_log_create((const char *)[@"com.apple.VisionCore" UTF8String], (const char *)objc_msgSend(@"VisionCoreLog", "UTF8String"));
  return MEMORY[0x270F9A758]();
}

@end