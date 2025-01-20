@interface SiriTTSTrainerGetLog
@end

@implementation SiriTTSTrainerGetLog

void __SiriTTSTrainerGetLog_block_invoke(id a1)
{
  _MergedGlobals = (uint64_t)os_log_create("com.apple.siri.tts.trainer", "default");

  _objc_release_x1();
}

@end