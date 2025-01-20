@interface VSFeatureFlags
+ (BOOL)isLowPowerDeviceNeuralEnabled;
+ (BOOL)isTrialEnabled;
+ (BOOL)lowInactiveMemory;
+ (BOOL)useSiriTTSService;
+ (BOOL)useSiriTTSServiceV2;
@end

@implementation VSFeatureFlags

+ (BOOL)lowInactiveMemory
{
  return MEMORY[0x270ED8070]("VoiceServices", "lowInactiveMemory");
}

+ (BOOL)useSiriTTSServiceV2
{
  return MEMORY[0x270ED8070]("VoiceServices", "use_SiriTTSServiceV2");
}

+ (BOOL)useSiriTTSService
{
  return MEMORY[0x270ED8070]("VoiceServices", "use_SiriTTSService");
}

+ (BOOL)isLowPowerDeviceNeuralEnabled
{
  return MEMORY[0x270ED8070]("VoiceServices", "lowPowerDeviceNeural");
}

+ (BOOL)isTrialEnabled
{
  return 1;
}

@end