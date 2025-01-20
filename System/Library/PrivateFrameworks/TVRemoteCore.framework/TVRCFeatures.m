@interface TVRCFeatures
+ (BOOL)capellaEnabled;
+ (BOOL)corianderEnabled;
+ (BOOL)greymatterEnabled;
+ (BOOL)isAWDLEnabled;
+ (BOOL)isInternalInstall;
+ (BOOL)isPersistOnLockScreenEnabled;
+ (BOOL)isWakeToRemoteOnLockScreenDisabled;
+ (BOOL)legacyDevicesDisabled;
+ (BOOL)testarossaEnabled;
+ (BOOL)tvPushToTalkEnabled;
@end

@implementation TVRCFeatures

+ (BOOL)legacyDevicesDisabled
{
  return CFPreferencesGetAppBooleanValue(@"TVRemoteLegacyDevicesDisabled", @".GlobalPreferences", 0) != 0;
}

+ (BOOL)isWakeToRemoteOnLockScreenDisabled
{
  return CFPreferencesGetAppBooleanValue(@"TVRemoteWakeToRemoteOnLockScreenDisabled", @".GlobalPreferences", 0) != 0;
}

+ (BOOL)isPersistOnLockScreenEnabled
{
  return CFPreferencesGetAppBooleanValue(@"TVRemotePersistOnLockScreen", @".GlobalPreferences", 0) != 0;
}

+ (BOOL)tvPushToTalkEnabled
{
  return MEMORY[0x270ED8070]("Siri", "tv_push_to_talk");
}

+ (BOOL)isInternalInstall
{
  return MGGetBoolAnswer();
}

+ (BOOL)capellaEnabled
{
  return MEMORY[0x270ED8070]("TVRemoteCore", "Capella");
}

+ (BOOL)greymatterEnabled
{
  return MEMORY[0x270ED8070]("TVRemoteCore", "Greymatter");
}

+ (BOOL)corianderEnabled
{
  return 1;
}

+ (BOOL)testarossaEnabled
{
  return MEMORY[0x270ED8070]("TVApp", "testarossa");
}

+ (BOOL)isAWDLEnabled
{
  return CFPreferencesGetAppBooleanValue(@"TVRemoteEnableAWDL", @".GlobalPreferences", 0) != 0;
}

@end