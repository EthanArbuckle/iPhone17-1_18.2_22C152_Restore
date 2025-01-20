@interface TVRUIVolumeControllerLog
@end

@implementation TVRUIVolumeControllerLog

uint64_t ___TVRUIVolumeControllerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "VolumeController");
  uint64_t v1 = _TVRUIVolumeControllerLog_log;
  _TVRUIVolumeControllerLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end