@interface SVXSessionCreateSpeechRecordingAlertPolicy
@end

@implementation SVXSessionCreateSpeechRecordingAlertPolicy

void ___SVXSessionCreateSpeechRecordingAlertPolicy_block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F28680];
  id v3 = a2;
  id v4 = (id)[v2 newWithBuilder:&__block_literal_global_744];
  [v3 setStartingAlertBehavior:v4];
}

uint64_t ___SVXSessionCreateSpeechRecordingAlertPolicy_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBeepSoundID:5];
}

@end