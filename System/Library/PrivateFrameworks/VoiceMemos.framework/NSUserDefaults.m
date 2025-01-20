@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __60__NSUserDefaults_VoiceMemosSettings__voiceMemosUserDefaults__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isRunningInVoiceMemos])
  {
    uint64_t v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.VoiceMemos"];
  }
  voiceMemosUserDefaults_voiceMemosUserDefaults = v1;
  return MEMORY[0x1F41817F8]();
}

@end