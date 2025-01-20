@interface FMDPreferencesMgr
+ (BOOL)accessibilityFontSizeEnabled;
+ (BOOL)disableIntents;
+ (BOOL)disablePush;
+ (BOOL)dontUseSLC;
+ (BOOL)importedAosnotifydData;
+ (BOOL)locateNotificationsEnabled;
+ (BOOL)needsLostModeExitAuth;
+ (BOOL)notifyOnShutdownSoon;
+ (BOOL)overriddenTrackNotifyEnabled;
+ (BOOL)simulateLocateNotification;
+ (BOOL)simulateWipe;
+ (BOOL)userTestApplication;
+ (id)deviceInfoOverrides;
+ (id)errorForMarkAsMissing;
+ (id)errorForUnregister;
+ (id)hostportOverride;
+ (id)httpRequestHeaders;
+ (id)lastLaunchVersion;
+ (id)locationDeviceInfoOverrides;
+ (id)lostModeExitAuthForPairedDeviceID;
+ (id)lostModeInfo;
+ (id)overriddenBuildVersion;
+ (id)overriddenOSVersion;
+ (id)playSoundInfo;
+ (id)protocolSchemeOverride;
+ (id)pushAccountsData;
+ (id)trackingInfoForType:(id)a3;
+ (id)wipeInfo;
+ (int64_t)wipeDelay;
+ (int64_t)wipeState;
+ (void)cleanAccountKeys;
+ (void)removeNeedsLostModeExitAuth;
+ (void)setClientLostModeInfo:(id)a3;
+ (void)setFMIPWipeLostModeInfo:(id)a3;
+ (void)setImportedAosnotifydData:(BOOL)a3;
+ (void)setLastLaunchVersion:(id)a3;
+ (void)setLostModeExitAuthForPairedDeviceID:(id)a3;
+ (void)setLostModeInfo:(id)a3;
+ (void)setNeedsLostModeExitAuth:(BOOL)a3;
+ (void)setPlaySoundInfo:(id)a3;
+ (void)setPushAccountsData:(id)a3;
+ (void)setTrackingInfo:(id)a3 forType:(id)a4;
+ (void)setWipeInfo:(id)a3;
+ (void)setWipeState:(int64_t)a3;
@end

@implementation FMDPreferencesMgr

+ (BOOL)simulateWipe
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D698 inDomain:kFMDPrefDomain];
}

+ (BOOL)simulateLocateNotification
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D6C0 inDomain:kFMDPrefDomain];
}

+ (BOOL)locateNotificationsEnabled
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D6C8 inDomain:kFMDPrefDomain];
}

+ (id)httpRequestHeaders
{
  return +[FMPreferencesUtil dictionaryForKey:off_10031D648 inDomain:kFMDPrefDomain];
}

+ (BOOL)userTestApplication
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D650 inDomain:kFMDPrefDomain];
}

+ (id)hostportOverride
{
  return +[FMPreferencesUtil stringForKey:off_10031D658 inDomain:kFMDPrefDomain];
}

+ (id)protocolSchemeOverride
{
  return +[FMPreferencesUtil stringForKey:off_10031D660 inDomain:kFMDPrefDomain];
}

+ (id)deviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:off_10031D668 inDomain:kFMDPrefDomain];
}

+ (id)locationDeviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:off_10031D670 inDomain:kFMDPrefDomain];
}

+ (id)overriddenOSVersion
{
  return +[FMPreferencesUtil stringForKey:off_10031D678 inDomain:kFMDPrefDomain];
}

+ (id)overriddenBuildVersion
{
  return +[FMPreferencesUtil stringForKey:off_10031D680 inDomain:kFMDPrefDomain];
}

+ (BOOL)overriddenTrackNotifyEnabled
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D690 inDomain:kFMDPrefDomain];
}

+ (BOOL)dontUseSLC
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D688 inDomain:kFMDPrefDomain];
}

+ (id)errorForUnregister
{
  return +[FMPreferencesUtil stringForKey:off_10031D6A0 inDomain:kFMDPrefDomain];
}

+ (id)errorForMarkAsMissing
{
  return +[FMPreferencesUtil stringForKey:off_10031D6A8 inDomain:kFMDPrefDomain];
}

+ (int64_t)wipeDelay
{
  return (int64_t)+[FMPreferencesUtil integerForKey:off_10031D6B0 inDomain:kFMDPrefDomain];
}

+ (BOOL)notifyOnShutdownSoon
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D6B8 inDomain:kFMDPrefDomain];
}

+ (BOOL)disableIntents
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D6D8 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (BOOL)disablePush
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D6E0 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (BOOL)accessibilityFontSizeEnabled
{
  v2 = +[FMPreferencesUtil stringForKey:off_10031D720 inDomain:off_10031D718];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 rangeOfString:@"Accessibility"] != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (int64_t)wipeState
{
  return (int64_t)+[FMPreferencesUtil integerForKey:off_10031D6E8 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setWipeState:(int64_t)a3
{
}

+ (id)wipeInfo
{
  return +[FMPreferencesUtil dictionaryForKey:off_10031D6F0 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setWipeInfo:(id)a3
{
}

+ (id)lostModeInfo
{
  return +[FMPreferencesUtil dictionaryForKey:@"FMIPLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];
}

+ (void)setLostModeInfo:(id)a3
{
  id v3 = a3;
  _CFPreferencesSetDaemonCacheEnabled();
  +[FMPreferencesUtil setDictionary:v3 forKey:@"FMIPLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];

  _CFPreferencesSetDaemonCacheEnabled();
}

+ (id)playSoundInfo
{
  return +[FMPreferencesUtil dictionaryForKey:@"FMIPPlaySoundInfo" inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setPlaySoundInfo:(id)a3
{
}

+ (id)trackingInfoForType:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"%@%@", off_10031D700, a3];
  BOOL v4 = +[FMPreferencesUtil dictionaryForKey:v3 inDomain:kFMDNotBackedUpPrefDomain];

  return v4;
}

+ (void)setTrackingInfo:(id)a3 forType:(id)a4
{
  v5 = off_10031D700;
  id v6 = a3;
  id v7 = +[NSString stringWithFormat:@"%@%@", v5, a4];
  +[FMPreferencesUtil setDictionary:v6 forKey:v7 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setFMIPWipeLostModeInfo:(id)a3
{
  uint64_t v3 = kFMDPostWipePrefDomain;
  id v4 = a3;
  +[FMPreferencesUtil synchronizeDomain:v3];
  id v7 = +[FMPreferencesUtil dictionaryForKey:@"FMIPWipeLostModeInfo" inDomain:kFMDPostWipePrefDomain];
  +[FMPreferencesUtil setDictionary:v4 forKey:@"FMIPWipeLostModeInfo" inDomain:kFMDPostWipePrefDomain];

  v5 = v7;
  if (!v4 && v7)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
    v5 = v7;
  }
}

+ (void)setClientLostModeInfo:(id)a3
{
}

+ (id)pushAccountsData
{
  return +[FMPreferencesUtil arrayForKey:off_10031D6F8 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setPushAccountsData:(id)a3
{
}

+ (id)lastLaunchVersion
{
  return +[FMPreferencesUtil stringForKey:off_10031D708 inDomain:kFMDPrefDomain];
}

+ (void)setLastLaunchVersion:(id)a3
{
}

+ (BOOL)importedAosnotifydData
{
  return +[FMPreferencesUtil BOOLForKey:off_10031D710 inDomain:kFMDPrefDomain];
}

+ (void)setImportedAosnotifydData:(BOOL)a3
{
}

+ (BOOL)needsLostModeExitAuth
{
  return +[FMPreferencesUtil BOOLForKey:@"needsLostModeExitAuth" inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setNeedsLostModeExitAuth:(BOOL)a3
{
}

+ (id)lostModeExitAuthForPairedDeviceID
{
  return +[FMPreferencesUtil stringForKey:off_10031D6D0 inDomain:kFMDNotBackedUpPrefDomain];
}

+ (void)setLostModeExitAuthForPairedDeviceID:(id)a3
{
}

+ (void)removeNeedsLostModeExitAuth
{
}

+ (void)cleanAccountKeys
{
}

@end