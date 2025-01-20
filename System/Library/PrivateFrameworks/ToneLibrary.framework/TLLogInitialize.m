@interface TLLogInitialize
@end

@implementation TLLogInitialize

os_log_t ___TLLogInitialize_block_invoke()
{
  _TLLogGeneralHandle = (uint64_t)os_log_create("com.apple.ToneLibrary", "General");
  _TLLogPlaybackHandle = (uint64_t)os_log_create("com.apple.ToneLibrary", "Playback");
  _TLLogToneManagementHandle = (uint64_t)os_log_create("com.apple.ToneLibrary", "ToneManagement");
  os_log_t result = os_log_create("com.apple.ToneLibrary", "VibrationManagement");
  _TLLogVibrationManagementHandle = (uint64_t)result;
  return result;
}

@end