@interface LTOSLogTTS
@end

@implementation LTOSLogTTS

uint64_t ___LTOSLogTTS_block_invoke()
{
  _LTOSLogTTS_log = (uint64_t)os_log_create("com.apple.Translation", "TTS");
  return MEMORY[0x270F9A758]();
}

@end