@interface SFSiriController
+ (BOOL)hasUserSeenAnnounceCallsOptOutScreen;
+ (BOOL)hasUserSeenAnnounceMessagesOptOutScreen;
+ (BOOL)hasUserSeenAnnounceNotificationsOptOutScreen;
+ (BOOL)isAnnounceEnabledForHeadphones;
+ (BOOL)isAnnounceMessagesEnabled;
+ (BOOL)isAnnounceMessagesSupported;
+ (BOOL)isAnnounceSupported;
+ (BOOL)isCurrentLocaleSupported;
+ (BOOL)isHeySiriEnabled;
+ (BOOL)isSiriAllowedWhileLocked;
+ (BOOL)isSiriEnabled;
+ (BOOL)shouldPromptForAnnounceCallsForProductID:(unsigned int)a3 supportsInEarDetection:(BOOL)a4 isUpsellFlow:(BOOL)a5;
+ (BOOL)shouldPromptForAnnounceMessagesForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4;
+ (BOOL)shouldPromptForAnnounceNotificationsForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4;
+ (int64_t)announceCallsState;
+ (void)setAnnounceCallsState:(int64_t)a3;
+ (void)setAnnounceMessagesEnabled:(BOOL)a3;
+ (void)setHasUserSeenAnnounceCallsOptOutScreen:(BOOL)a3;
+ (void)setHasUserSeenAnnounceMessagesOptOutScreen:(BOOL)a3;
+ (void)setHasUserSeenAnnounceNotificationsOptOutScreen:(BOOL)a3;
@end

@implementation SFSiriController

+ (BOOL)isSiriEnabled
{
  v2 = [(Class)getAFPreferencesClass[0]() sharedPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

+ (BOOL)isHeySiriEnabled
{
  CFStringGetTypeID();

  v2 = [(Class)getVTPreferencesClass[0]() sharedPreferences];
  char v3 = [(Class)getAFPreferencesClass[0]() sharedPreferences];
  char v4 = 0;
  if ([v3 assistantIsEnabled]) {
    char v4 = [v2 voiceTriggerEnabled];
  }

  return v4;
}

+ (BOOL)isSiriAllowedWhileLocked
{
  v2 = [(Class)getAFPreferencesClass[0]() sharedPreferences];
  char v3 = [v2 disableAssistantWhilePasscodeLocked] ^ 1;

  return v3;
}

+ (BOOL)isCurrentLocaleSupported
{
  v2 = [(Class)getAFPreferencesClass[0]() sharedPreferences];
  char v3 = [v2 isCurrentLocaleNativelySupported];

  return v3;
}

+ (BOOL)hasUserSeenAnnounceMessagesOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted] == 3;
}

+ (void)setHasUserSeenAnnounceMessagesOptOutScreen:(BOOL)a3
{
  if (a3) {
    +[SFDefaults setSiriNotificationsPrompted:3];
  }
}

+ (BOOL)hasUserSeenAnnounceCallsOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted] == 4;
}

+ (void)setHasUserSeenAnnounceCallsOptOutScreen:(BOOL)a3
{
  if (a3) {
    +[SFDefaults setSiriNotificationsPrompted:4];
  }
}

+ (BOOL)isAnnounceMessagesEnabled
{
  v2 = [(Class)getUNNotificationSettingsCenterClass[0]() currentNotificationSettingsCenter];
  char v3 = [v2 notificationSystemSettings];
  BOOL v4 = [v3 announcementSetting] == 2;

  return v4;
}

+ (void)setAnnounceMessagesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(Class)getUNNotificationSettingsCenterClass[0]() currentNotificationSettingsCenter];
  BOOL v4 = [v8 notificationSystemSettings];
  v5 = v4;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if ([v4 announcementSetting] != v6)
  {
    id v7 = objc_alloc_init((Class)getUNMutableNotificationSystemSettingsClass[0]());
    [v7 setAnnouncementSetting:v6];
    objc_msgSend(v7, "setShowPreviewsSetting:", objc_msgSend(v5, "showPreviewsSetting"));
    [v8 setNotificationSystemSettings:v7];
  }
}

+ (BOOL)isAnnounceMessagesSupported
{
  v2 = [(Class)getUNNotificationSettingsCenterClass[0]() currentNotificationSettingsCenter];
  BOOL v3 = [v2 notificationSystemSettings];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = [v3 announcementSetting] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isAnnounceEnabledForHeadphones
{
  v2 = [(Class)getUNNotificationSettingsCenterClass[0]() currentNotificationSettingsCenter];
  BOOL v3 = [v2 notificationSystemSettings];
  uint64_t v4 = [v3 announcementHeadphonesSetting];

  return v4 == 2;
}

+ (BOOL)isAnnounceSupported
{
  v2 = [(Class)getUNNotificationSettingsCenterClass[0]() currentNotificationSettingsCenter];
  BOOL v3 = [v2 notificationSystemSettings];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = [v3 announcementSetting] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)hasUserSeenAnnounceNotificationsOptOutScreen
{
  return +[SFDefaults hasSeenAnnounceNotifications];
}

+ (void)setHasUserSeenAnnounceNotificationsOptOutScreen:(BOOL)a3
{
}

+ (int64_t)announceCallsState
{
  id v2 = objc_alloc_init((Class)getTUUserConfigurationClass[0]());
  unint64_t v3 = [v2 announceCalls];
  if (v3 >= 4)
  {
    if (gLogCategory_SFSiriController <= 90
      && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unint64_t v3 = 0;
  }

  return v3;
}

+ (void)setAnnounceCallsState:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)getTUUserConfigurationClass[0]());
  int64_t v5 = a3;
  id v7 = v4;
  if ((unint64_t)a3 >= 4)
  {
    if (gLogCategory_SFSiriController > 90)
    {
      int64_t v5 = 0;
    }
    else
    {
      if (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize())
      {
        int64_t v6 = a3;
        LogPrintF();
      }
      int64_t v5 = 0;
      id v4 = v7;
    }
  }
  objc_msgSend(v4, "setAnnounceCalls:", v5, v6);
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

+ (BOOL)shouldPromptForAnnounceMessagesForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  BOOL v4 = a3 - 8194 > 0xE || ((1 << (a3 - 2)) & 0x409B) == 0;
  if (!v4
    || (BOOL v7 = a4,
        v9 = [[SFHeadphoneProduct alloc] initWithProductID:*(void *)&a3], BOOL v10 = [(SFHeadphoneProduct *)v9 hasW1Chip], v9, v10))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  if (v7
    && (([a1 hasUserSeenAnnounceMessagesOptOutScreen] & 1) != 0
     || [a1 hasUserSeenAnnounceCallsOptOutScreen]))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_7:
    LogPrintF();
    return 0;
  }
  char v11 = [a1 isSiriAllowedWhileLocked];
  if ([a1 isAnnounceMessagesSupported]) {
    int v12 = [a1 isAnnounceMessagesEnabled] ^ 1;
  }
  else {
    LOBYTE(v12) = 0;
  }
  if (v7) {
    char v5 = v11 & v12;
  }
  else {
    char v5 = v12;
  }
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

+ (BOOL)shouldPromptForAnnounceCallsForProductID:(unsigned int)a3 supportsInEarDetection:(BOOL)a4 isUpsellFlow:(BOOL)a5
{
  BOOL v5 = a3 - 8194 > 0xE || ((1 << (a3 - 2)) & 0x409B) == 0;
  if (!v5
    || (BOOL v8 = a5,
        char v11 = [[SFHeadphoneProduct alloc] initWithProductID:*(void *)&a3], v12 = [(SFHeadphoneProduct *)v11 hasW1Chip], v11, v12))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  if (!a4)
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_7:
    LogPrintF();
    return 0;
  }
  if (!SFIsAnnounceCallsEnabled()) {
    return 0;
  }
  if (v8 && [a1 hasUserSeenAnnounceCallsOptOutScreen])
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  char v13 = [a1 isSiriAllowedWhileLocked];
  uint64_t v14 = [a1 announceCallsState];
  if (v14) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v13;
  }
  if (v8) {
    BOOL v6 = v15;
  }
  else {
    BOOL v6 = v14 == 0;
  }
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v6;
}

+ (BOOL)shouldPromptForAnnounceNotificationsForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  BOOL v4 = a3 - 8194 > 0xE || ((1 << (a3 - 2)) & 0x409B) == 0;
  if (!v4
    || (BOOL v7 = a4,
        v9 = [[SFHeadphoneProduct alloc] initWithProductID:*(void *)&a3], BOOL v10 = [(SFHeadphoneProduct *)v9 hasW1Chip], v9, v10))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  if (v7 && [a1 hasUserSeenAnnounceNotificationsOptOutScreen])
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_7:
    LogPrintF();
    return 0;
  }
  char v11 = [a1 isSiriAllowedWhileLocked];
  if ([a1 isAnnounceSupported]) {
    int v12 = [a1 isAnnounceEnabledForHeadphones] ^ 1;
  }
  else {
    LOBYTE(v12) = 0;
  }
  if (v7) {
    BOOL v5 = v11;
  }
  else {
    BOOL v5 = v12;
  }
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

@end