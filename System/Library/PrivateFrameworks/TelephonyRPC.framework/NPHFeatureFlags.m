@interface NPHFeatureFlags
+ (BOOL)isMessagesSADEnabled;
+ (BOOL)isSessionBasedMutingEnabled;
+ (BOOL)sensitiveContentWarningFeatureFlagEnabled;
@end

@implementation NPHFeatureFlags

+ (BOOL)sensitiveContentWarningFeatureFlagEnabled
{
  return MEMORY[0x270ED8070]("NanoContacts", "sensitiveContentWarning");
}

+ (BOOL)isSessionBasedMutingEnabled
{
  return MEMORY[0x270ED8070]("MediaExperience", "SessionBasedMuting");
}

+ (BOOL)isMessagesSADEnabled
{
  return MEMORY[0x270ED8070]("Messages", "sad");
}

@end