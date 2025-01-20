@interface SVXClientActivationServiceGetButtonHoldToTalkThreshold
@end

@implementation SVXClientActivationServiceGetButtonHoldToTalkThreshold

void ___SVXClientActivationServiceGetButtonHoldToTalkThreshold_block_invoke()
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  v0 = [v2 manualEndpointingThreshold];
  [v0 doubleValue];
  _SVXClientActivationServiceGetButtonHoldToTalkThreshold_threshold = v1;
}

@end