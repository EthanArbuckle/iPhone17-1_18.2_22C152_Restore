@interface CKSharedSettingsHelper
+ (BOOL)currentMessageAutoKeepForType;
+ (id)currentKeepMessages;
+ (id)sharedInstance;
+ (int)currentMessageAutoKeepOptionForType;
- (BOOL)_isProximityMonitoringSupported;
- (BOOL)_sharedWithYouEnabled;
- (BOOL)areReadReceiptsEnabled;
- (BOOL)getRaiseToListenEnabled;
- (BOOL)hasPhoneNumber;
- (BOOL)isCheckInAllowedInRegion;
- (BOOL)isRaiseGestureSupported;
- (BOOL)isSMSDevice;
- (BOOL)shouldShowCheckInLocationHistorySettings;
- (BOOL)shouldShowContactPhotoSettings;
- (BOOL)shouldShowMMS;
- (BOOL)shouldShowSMSRelaySettings;
- (BOOL)shouldShowSatelliteDemoModeButton;
- (BOOL)shouldShowSharedWithYouSettings;
- (PSSystemPolicyForApp)systemPolicy;
- (id)_syncManager;
- (id)getAudioMessageAutoKeep;
- (id)getSMSRelayDevicesSummary;
- (id)getSharedWithYouForSpecifier:(id)a3;
- (id)iMessageAppsViewController;
- (id)sharedWithYouSettingsSpecifierIdentifiers;
- (id)sharedWithYouViewController;
- (id)smsRelayDevicesController;
- (id)systemPolicySpecifiers;
- (void)satelliteDemoModeTapped;
- (void)setAudioMessageAutoKeep:(id)a3;
- (void)setConversationListFilteringEnabled:(BOOL)a3;
- (void)setRaiseToListenEnabled:(BOOL)a3;
- (void)setReadReceiptsEnabled:(BOOL)a3;
- (void)setSystemPolicy:(id)a3;
- (void)shouldShowSatelliteDemoModeButton;
@end

@implementation CKSharedSettingsHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __40__CKSharedSettingsHelper_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(CKSharedSettingsHelper);
  return MEMORY[0x270F9A758]();
}

- (PSSystemPolicyForApp)systemPolicy
{
  systemPolicy = self->_systemPolicy;
  if (!systemPolicy)
  {
    v4 = (PSSystemPolicyForApp *)[objc_alloc(MEMORY[0x263F5FC98]) initWithBundleIdentifier:@"com.apple.MobileSMS"];
    v5 = self->_systemPolicy;
    self->_systemPolicy = v4;

    systemPolicy = self->_systemPolicy;
  }
  return systemPolicy;
}

- (BOOL)isSMSDevice
{
  v2 = [MEMORY[0x263F3BB18] sharedInstance];
  char v3 = [v2 supportsSMS];

  return v3;
}

- (void)setReadReceiptsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = MEMORY[0x25A2A3250](@"com.apple.madrid", @"GlobalReadReceiptVersionID");
  id v10 = v5;
  if (v5) {
    uint64_t v6 = [v5 integerValue] + 1;
  }
  else {
    uint64_t v6 = 1;
  }
  CFPreferencesSetAppValue(@"GlobalReadReceiptVersionID", (CFPropertyListRef)[NSNumber numberWithInteger:v6], @"com.apple.madrid");
  CFPreferencesSetAppValue(@"ReadReceiptsEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.madrid");
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.ReadReceiptsEnabled.changed", 0, 0, 1u);
  notify_post((const char *)@"com.apple.MobileSMS.ReadReceiptsEnabled.shouldUpdateDevices");
  if (PSIsNanoMirroringDomain())
  {
    v8 = [(CKSharedSettingsHelper *)self _syncManager];
    v9 = [MEMORY[0x263EFFA08] setWithObject:@"ReadReceiptsEnabled"];
    [v8 synchronizeUserDefaultsDomain:@"com.apple.madrid" keys:v9];
  }
}

- (BOOL)areReadReceiptsEnabled
{
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ReadReceiptsEnabled", @"com.apple.madrid", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)setConversationListFilteringEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltration", (CFPropertyListRef)[NSNumber numberWithBool:a3], @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltrationForcedOn", (CFPropertyListRef)*MEMORY[0x263EFFB38], @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"MessageFilteringSettingsConfirmed", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltration.changed", 0, 0, 1u);
  v5 = (void (*)(void))MEMORY[0x25A2A32E0]("CKResetBlackholeEnabledCache", @"ChatKit");
  if (v5) {
    v5();
  }
  id v7 = [(CKSharedSettingsHelper *)self _syncManager];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"IncomingMessageAlertFiltration", @"IncomingMessageAlertFiltrationForcedOn", @"MessageFilteringSettingsConfirmed", 0);
  [v7 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v6];
}

- (BOOL)getRaiseToListenEnabled
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL result = CFPreferencesGetAppBooleanValue(@"RaiseToListenEnabled", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat) {
    return [(CKSharedSettingsHelper *)self isRaiseGestureSupported];
  }
  return result;
}

- (void)setRaiseToListenEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"RaiseToListenEnabled", (CFPropertyListRef)[NSNumber numberWithBool:a3], @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.RaiseToListenEnabled.changed", 0, 0, 1u);
}

- (BOOL)isRaiseGestureSupported
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CKSharedSettingsHelper_isRaiseGestureSupported__block_invoke;
  block[3] = &unk_2653F52A8;
  block[4] = self;
  if (isRaiseGestureSupported_once[0] != -1) {
    dispatch_once(isRaiseGestureSupported_once, block);
  }
  return isRaiseGestureSupported_isRaiseGestureSupported;
}

uint64_t __49__CKSharedSettingsHelper_isRaiseGestureSupported__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F01750] isGestureServiceAvailable];
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) _isProximityMonitoringSupported];
  }
  isRaiseGestureSupported_isRaiseGestureSupported = result;
  return result;
}

- (BOOL)_isProximityMonitoringSupported
{
  return MEMORY[0x270F95FB8](@"proximity-sensor", a2);
}

+ (id)currentKeepMessages
{
  return +[CKKeepMessagesPreferenceManager keepMessagesPreference];
}

+ (BOOL)currentMessageAutoKeepForType
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AutomaticallySaveAudioMessagesEnabled", @"com.apple.imessage", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (int)currentMessageAutoKeepOptionForType
{
  if (![(id)objc_opt_class() currentMessageAutoKeepForType]) {
    return 0;
  }
  v2 = [(id)objc_opt_class() currentKeepMessages];
  if ([v2 integerValue] == 30)
  {
    int v3 = 1;
  }
  else if ([v2 integerValue] == 365)
  {
    int v3 = 2;
  }
  else
  {
    int v3 = 3;
  }

  return v3;
}

- (id)getAudioMessageAutoKeep
{
  CFPreferencesSynchronize(@"com.apple.imessage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  v2 = NSNumber;
  uint64_t v3 = [(id)objc_opt_class() currentMessageAutoKeepOptionForType];
  return (id)[v2 numberWithUnsignedInt:v3];
}

- (void)setAudioMessageAutoKeep:(id)a3
{
  if ([a3 integerValue]) {
    v4 = (const void *)MEMORY[0x263EFFA88];
  }
  else {
    v4 = (const void *)MEMORY[0x263EFFA80];
  }
  CFPreferencesSetAppValue(@"AutomaticallySaveAudioMessagesEnabled", v4, @"com.apple.imessage");
  CFPreferencesSynchronize(@"com.apple.imessage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v6 = [(CKSharedSettingsHelper *)self _syncManager];
  v5 = [MEMORY[0x263EFFA08] setWithObject:@"AutomaticallySaveAudioMessagesEnabled"];
  [v6 synchronizeUserDefaultsDomain:@"com.apple.imessage" keys:v5];
}

- (BOOL)shouldShowMMS
{
  v2 = [MEMORY[0x263F4AF48] sharedInstance];
  uint64_t v3 = [v2 ctSubscriptionInfo];
  v4 = objc_msgSend(v3, "__im_subscriptionsWithMMSSupport");

  LOBYTE(v2) = [v4 count] != 0;
  return (char)v2;
}

- (BOOL)shouldShowCheckInLocationHistorySettings
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    if (!CFEqual(v3, @"iPhone"))
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = 138412290;
          v9 = v4;
          _os_log_impl(&dword_2561DD000, v7, OS_LOG_TYPE_INFO, "Check In not supported for device type: %@", (uint8_t *)&v8, 0xCu);
        }
      }
      CFRelease(v4);
      return 0;
    }
    CFRelease(v4);
  }
  if (![(CKSharedSettingsHelper *)self isCheckInAllowedInRegion])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_2561DD000, v6, OS_LOG_TYPE_INFO, "Check In not supported in region", (uint8_t *)&v8, 2u);
      }
      goto LABEL_21;
    }
    return 0;
  }
  if (([MEMORY[0x263F669F0] hasUserCompletedOnboarding] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_2561DD000, v6, OS_LOG_TYPE_INFO, "Check In onboarding not completed", (uint8_t *)&v8, 2u);
      }
LABEL_21:

      return 0;
    }
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)isCheckInAllowedInRegion
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F62D20] currentEstimates];
  if (![v2 count])
  {
    id v3 = [MEMORY[0x263F62D20] lastKnownEstimates];

    if (![v3 count])
    {
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2561DD000, v16, OS_LOG_TYPE_INFO, "Unable to determine Check In availability", buf, 2u);
        }
      }
      BOOL v13 = 1;
      goto LABEL_23;
    }
    v2 = v3;
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v2;
      _os_log_impl(&dword_2561DD000, v4, OS_LOG_TYPE_INFO, "Current regulatory domain: %@", buf, 0xCu);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v2;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x25A2A3520](v5);
        v11 = objc_msgSend(v9, "countryCode", (void)v17);
        int v12 = [v11 isEqualToString:@"KR"];

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v9;
              _os_log_impl(&dword_2561DD000, v14, OS_LOG_TYPE_INFO, "Check In not available in regulatory domain: %@", buf, 0xCu);
            }
          }
          BOOL v13 = 0;
          goto LABEL_22;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_22:

LABEL_23:
  return v13;
}

- (id)_syncManager
{
  v2 = (objc_class *)MEMORY[0x25A2A32D0](@"NPSManager", @"NanoPreferencesSync");
  if (v2) {
    v2 = (objc_class *)objc_alloc_init(v2);
  }
  return v2;
}

- (void)satelliteDemoModeTapped
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2561DD000, v2, OS_LOG_TYPE_INFO, "Pressed satellite demo mode", v6, 2u);
    }
  }
  id v3 = objc_alloc_init(MEMORY[0x263F02CE8]);
  [v3 setReason:8];
  [v3 setMetadata:&unk_2704C92A0];
  id v4 = objc_alloc(MEMORY[0x263F02D30]);
  uint64_t v5 = (void *)[v4 initWithQueue:MEMORY[0x263EF83A0]];
  [v5 requestStewieWithContext:v3 completion:&__block_literal_global_169];
}

void __49__CKSharedSettingsHelper_satelliteDemoModeTapped__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __49__CKSharedSettingsHelper_satelliteDemoModeTapped__block_invoke_cold_1(v2, v3);
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_5;
    }
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2561DD000, v3, OS_LOG_TYPE_INFO, "Presenting Satellite Demo app", v4, 2u);
    }
  }

LABEL_5:
}

- (BOOL)shouldShowSatelliteDemoModeButton
{
  id v2 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v3 = [v2 isCarrierPigeonEnabled];

  if (v3)
  {
    id v4 = [MEMORY[0x263F4A548] sharedInstance];
    [v4 startMonitor];

    uint64_t v5 = [MEMORY[0x263F4A548] sharedInstance];
    uint64_t v6 = [v5 getState];

    if (objc_opt_respondsToSelector())
    {
      if (([v6 isDemoAllowedForService:16] & 1) == 0
        && ([v6 isDemoAllowedForService:32] & 1) == 0)
      {
        goto LABEL_14;
      }
      if (objc_opt_respondsToSelector())
      {
        if (([v6 isPermittedAtCurrentLocation:16] & 1) != 0
          || ([v6 isPermittedAtCurrentLocation:32] & 1) != 0)
        {
          LOBYTE(v3) = 1;
LABEL_15:

          return v3;
        }
LABEL_14:
        LOBYTE(v3) = 0;
        goto LABEL_15;
      }
      uint64_t v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CKSharedSettingsHelper shouldShowSatelliteDemoModeButton](v7);
      }
    }
    else
    {
      uint64_t v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CKSharedSettingsHelper shouldShowSatelliteDemoModeButton](v7);
      }
    }

    goto LABEL_14;
  }
  return v3;
}

- (BOOL)shouldShowSMSRelaySettings
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F3BB18] sharedInstance];
  char v4 = [v3 supportsSMS];

  BOOL v5 = [(CKSharedSettingsHelper *)self hasPhoneNumber];
  BOOL v6 = +[CKSettingSMSRelayController shouldShowSMSRelaySettings];
  uint64_t v7 = [MEMORY[0x263F4A520] sharedInstance];
  uint64_t v8 = [MEMORY[0x263F4A610] iMessageService];
  v9 = [v7 activeAccountsForService:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "accountType", (void)v17) == 1)
        {
          BOOL v15 = v5 & v4 & v6;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)hasPhoneNumber
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F02D30]);
  int v3 = (void *)[v2 initWithQueue:MEMORY[0x263EF83A0]];
  id v20 = 0;
  char v4 = [v3 getSubscriptionInfoWithError:&v20];
  id v5 = v20;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v6 = objc_msgSend(v4, "subscriptions", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 labelID];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v10 phoneNumber];
          uint64_t v14 = [v13 length];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)getSMSRelayDevicesSummary
{
  unint64_t v2 = +[CKSettingSMSRelayController numberOfActiveDevices];
  int v3 = (void *)v2;
  if (v2)
  {
    if (v2 == 1)
    {
      char v4 = [MEMORY[0x263F086E0] mainBundle];
      id v5 = v4;
      BOOL v6 = @"SMS_RELAY_SINGLE_DEVICE_LABEL";
    }
    else
    {
      char v4 = [MEMORY[0x263F086E0] mainBundle];
      id v5 = v4;
      BOOL v6 = @"SMS_RELAY_MULTIPLE_DEVICES_LABEL";
    }
    uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_2704C4418 table:0];

    int v3 = [NSString stringWithFormat:@"%@%d", v7, v3];
  }
  return v3;
}

- (id)smsRelayDevicesController
{
  unint64_t v2 = objc_alloc_init(CKSettingSMSRelayController);
  return v2;
}

- (id)iMessageAppsViewController
{
  unint64_t v2 = objc_alloc_init(CKSettingsiMessageAppManager);
  int v3 = [[CKSettingsiMessageAppsViewController alloc] initWithAppManager:v2];

  return v3;
}

- (id)sharedWithYouSettingsSpecifierIdentifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"SHARED_WITH_YOU_GROUP";
  v4[1] = @"SHARED_WITH_YOU_BUTTON";
  unint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (BOOL)shouldShowSharedWithYouSettings
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

- (id)getSharedWithYouForSpecifier:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", a3);
  id v5 = [v4 localizedStringForKey:@"GENERAL_ON" value:&stru_2704C4418 table:0];

  BOOL v6 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"GENERAL_OFF" value:&stru_2704C4418 table:0];

  if ([(CKSharedSettingsHelper *)self _sharedWithYouEnabled]) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)_sharedWithYouEnabled
{
  if ([MEMORY[0x263F4AF78] deviceIsLockedDown]) {
    return 0;
  }
  int v3 = [MEMORY[0x263F4AF68] sharedInstance];
  char v4 = [v3 getBoolFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouEnabled"];

  return v4;
}

- (id)sharedWithYouViewController
{
  unint64_t v2 = objc_alloc_init(CKSettingsSharedWithYouController);
  return v2;
}

- (id)systemPolicySpecifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v2 = [(CKSharedSettingsHelper *)self systemPolicy];
  int v3 = [v2 specifiersForPolicyOptions:0x400800001 force:0];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "cellType", (void)v13))
        {
          uint64_t v11 = [[_TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier alloc] initWithSpecifier:v10];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)shouldShowContactPhotoSettings
{
  unint64_t v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 1;
  }
  id v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 _referenceBounds];
  double v7 = v6;

  return v7 > 320.0;
}

- (void)setSystemPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

void __49__CKSharedSettingsHelper_satelliteDemoModeTapped__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2561DD000, a2, OS_LOG_TYPE_ERROR, "Request Satellite Demo error: %@", (uint8_t *)&v4, 0xCu);
}

- (void)shouldShowSatelliteDemoModeButton
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2561DD000, log, OS_LOG_TYPE_ERROR, "Unable to check if demo mode is allowed", v1, 2u);
}

@end