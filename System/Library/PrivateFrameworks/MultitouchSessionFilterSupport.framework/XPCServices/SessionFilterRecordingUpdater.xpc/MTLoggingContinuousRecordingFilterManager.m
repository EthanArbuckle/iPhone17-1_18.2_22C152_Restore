@interface MTLoggingContinuousRecordingFilterManager
@end

@implementation MTLoggingContinuousRecordingFilterManager

void __MTLoggingContinuousRecordingFilterManager_block_invoke(id a1)
{
  MTLoggingContinuousRecordingFilterManager::__logObj = (uint64_t)os_log_create("com.apple.Multitouch.SessionFilter", "ContinuousRecordingFilterManager");

  _objc_release_x1();
}

@end