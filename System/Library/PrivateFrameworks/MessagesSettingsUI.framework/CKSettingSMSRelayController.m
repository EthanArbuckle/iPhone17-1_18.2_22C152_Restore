@interface CKSettingSMSRelayController
+ (BOOL)deviceIsAuthorized:(id)a3;
+ (BOOL)isDeviceUsingMiCWithIdentifier:(id)a3;
+ (BOOL)shouldShowSMSRelaySettings;
+ (id)authorizedSMSRelayDevices;
+ (id)micSMSRelayDevices;
+ (unint64_t)numberOfActiveDevices;
- (BOOL)isDeviceUsingMiCWithIdentifier:(id)a3;
- (BOOL)isMiCEnabled;
- (CKSettingSMSRelayController)initWithNibName:(id)a3 bundle:(id)a4;
- (IDSService)relayService;
- (id)_footerSpecifierForSMSRelayGroup;
- (id)_headerSpecifierForMicGroup;
- (id)_headerSpecifierForNonMicGroupDisplayingHeader:(BOOL)a3;
- (id)_specifiersForDevices:(id)a3 cellType:(int64_t)a4 get:(SEL)a5;
- (id)getDeviceActive:(id)a3;
- (id)getDeviceOn;
- (id)specifiers;
- (void)dealloc;
- (void)emitNavigationEvent;
- (void)setDeviceActive:(id)a3 specifier:(id)a4;
- (void)setRelayService:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CKSettingSMSRelayController

- (CKSettingSMSRelayController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKSettingSMSRelayController;
  v4 = [(CKSettingSMSRelayController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F4A0C0]);
    v6 = (void *)[v5 initWithService:*MEMORY[0x263F49FB0]];
    [(CKSettingSMSRelayController *)v4 setRelayService:v6];

    v7 = [(CKSettingSMSRelayController *)v4 relayService];
    [v7 addDelegate:v4 queue:MEMORY[0x263EF83A0]];

    v8 = [MEMORY[0x263F4A568] sharedInstance];
    [v8 blockUntilConnected];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_SMSRelayActiveDevicesChanged, @"com.apple.sms.smsRelayDevices.changed", v4, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.sms.smsRelayDevices.changed", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKSettingSMSRelayController;
  [(CKSettingSMSRelayController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingSMSRelayController;
  [(CKSettingSMSRelayController *)&v5 viewDidLoad];
  v3 = CommunicationsSetupUIBundle();
  objc_super v4 = [v3 localizedStringForKey:@"SMS_RELAY" value:@"SMS_RELAY" table:@"Messages"];

  [(CKSettingSMSRelayController *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingSMSRelayController;
  [(CKSettingSMSRelayController *)&v4 viewDidAppear:a3];
  [(CKSettingSMSRelayController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps"];
  objc_super v4 = [v3 URLByAppendingPathComponent:@"com.apple.MobileSMS"];

  objc_super v5 = [v4 URLByAppendingPathComponent:@"SMS_RELAY_DEVICES"];

  id v6 = objc_alloc(MEMORY[0x263F08DB0]);
  v7 = [MEMORY[0x263EFF960] currentLocale];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  v10 = (void *)[v6 initWithKey:@"Messages" table:0 locale:v7 bundleURL:v9];

  id v11 = objc_alloc(MEMORY[0x263F08DB0]);
  v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 bundleURL];
  v15 = (void *)[v11 initWithKey:@"Text Message Forwarding" table:0 locale:v12 bundleURL:v14];

  v17[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(CKSettingSMSRelayController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.MobileSMS" title:v10 localizedNavigationComponents:v16 deepLink:v5];
}

- (BOOL)isMiCEnabled
{
  if (_os_feature_enabled_impl())
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CloudKitSyncingEnabled", @"com.apple.madrid", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v3 = AppIntegerValue == 1;
    }
    else {
      BOOL v3 = 0;
    }
    LOBYTE(v4) = v3;
  }
  else
  {
    int v4 = IMOSLoggingEnabled();
    if (v4)
    {
      objc_super v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2561DD000, v5, OS_LOG_TYPE_INFO, "Auto SMS forwarding disabled, proceeding as if MiC is disabled.", buf, 2u);
      }

      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (id)specifiers
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v34 = (int)*MEMORY[0x263F5FDB8];
    BOOL v5 = [(CKSettingSMSRelayController *)self isMiCEnabled];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = @"NO";
        if (v5) {
          v7 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v47 = v7;
        _os_log_impl(&dword_2561DD000, v6, OS_LOG_TYPE_INFO, "Is Messages in iCloud enabled on this device? {%@}", buf, 0xCu);
      }
    }
    id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v5)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v10 = [(CKSettingSMSRelayController *)self relayService];
      id v11 = [v10 devices];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (([v15 isWatch] & 1) == 0)
            {
              v16 = [v15 uniqueID];
              BOOL v17 = [(CKSettingSMSRelayController *)self isDeviceUsingMiCWithIdentifier:v16];

              if (v17) {
                v18 = v8;
              }
              else {
                v18 = v9;
              }
              [v18 addObject:v15];
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v12);
      }

      if ([v8 count])
      {
        v19 = [(CKSettingSMSRelayController *)self _headerSpecifierForMicGroup];
        v20 = [(CKSettingSMSRelayController *)self _specifiersForDevices:v8 cellType:-1 get:sel_getDeviceOn];
        [v35 addObject:v19];
        [v35 addObjectsFromArray:v20];
      }
      if ([v9 count])
      {
        v21 = -[CKSettingSMSRelayController _headerSpecifierForNonMicGroupDisplayingHeader:](self, "_headerSpecifierForNonMicGroupDisplayingHeader:", [v8 count] != 0);
        [v35 addObject:v21];
        v22 = [(CKSettingSMSRelayController *)self _specifiersForDevices:v9 cellType:6 get:sel_getDeviceActive_];
        [v35 addObjectsFromArray:v22];
      }
      v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v35];
      v24 = *(Class *)((char *)&self->super.super.super.super.super.isa + v34);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v34) = v23;
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v25 = [(CKSettingSMSRelayController *)self relayService];
      v26 = [v25 devices];

      uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v26);
            }
            v30 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (([v30 isWatch] & 1) == 0) {
              [v8 addObject:v30];
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v27);
      }

      id v9 = [(CKSettingSMSRelayController *)self _specifiersForDevices:v8 cellType:6 get:sel_getDeviceActive_];
      v24 = [(CKSettingSMSRelayController *)self _footerSpecifierForSMSRelayGroup];
      [v35 addObject:v24];
      [v35 addObjectsFromArray:v9];
      v31 = [MEMORY[0x263EFF8C0] arrayWithArray:v35];
      v32 = *(Class *)((char *)&self->super.super.super.super.super.isa + v34);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v34) = v31;
    }
    id v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v34);
  }
  return v3;
}

- (id)_headerSpecifierForMicGroup
{
  v2 = CommunicationsSetupUIBundle();
  id v3 = [v2 localizedStringForKey:@"SMS_RELAY_MIC_DEVICES_FOOTER" value:@"SMS_RELAY_MIC_DEVICES_FOOTER" table:@"Messages"];

  int v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MOC_SMS_REALY_GROUP"];
  [v4 setProperty:v3 forKey:*MEMORY[0x263F600F8]];

  return v4;
}

- (id)_headerSpecifierForNonMicGroupDisplayingHeader:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MOC_NON_SMS_REALY_GROUP"];
  }
  else {
  id v3 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  }
  int v4 = CommunicationsSetupUIBundle();
  BOOL v5 = [v4 localizedStringForKey:@"SMS_RELAY_MIC_OTHER_DEVICES_FOOTER" value:@"SMS_RELAY_MIC_OTHER_DEVICES_FOOTER" table:@"Messages"];

  [v3 setProperty:v5 forKey:*MEMORY[0x263F600F8]];
  return v3;
}

- (id)_footerSpecifierForSMSRelayGroup
{
  v2 = CommunicationsSetupUIBundle();
  id v3 = [v2 localizedStringForKey:@"SMS_RELAY_DEVICES_HEADER" value:@"SMS_RELAY_DEVICES_HEADER" table:@"Messages"];

  int v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v4 setProperty:v3 forKey:*MEMORY[0x263F600F8]];

  return v4;
}

- (id)_specifiersForDevices:(id)a3 cellType:(int64_t)a4 get:(SEL)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 name];
        uint64_t v13 = (void *)MEMORY[0x263F4A818];
        v14 = [v11 modelIdentifier];
        v15 = [v13 marketingNameForModel:v14];

        v16 = [NSString stringWithFormat:@"%@ (%@)", v12, v15];
        BOOL v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v16 target:self set:sel_setDeviceActive_specifier_ get:a5 detail:0 cell:a4 edit:0];
        v18 = [v11 uniqueID];
        [v17 setIdentifier:v18];

        [v6 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)getDeviceActive:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 identifier];
  uint64_t v5 = [(id)objc_opt_class() deviceIsAuthorized:v4];
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2561DD000, v7, OS_LOG_TYPE_INFO, "Device {%@} has SMS Forwarding enabled.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2561DD000, v7, OS_LOG_TYPE_INFO, "Device {%@} has SMS Forwarding disabled.", (uint8_t *)&v10, 0xCu);
    }
  }

LABEL_10:
  uint64_t v8 = [NSNumber numberWithBool:v5];

  return v8;
}

- (id)getDeviceOn
{
  v2 = CommunicationsSetupUIBundle();
  id v3 = [v2 localizedStringForKey:@"SMS_RELAY_ON" value:@"SMS_RELAY_ON" table:@"Messages"];

  return v3;
}

- (void)setDeviceActive:(id)a3 specifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F4A610] smsService];
  uint64_t v8 = IMPreferredAccountForService();

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = @"YES";
      if (!v8) {
        int v10 = @"NO";
      }
      int v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_2561DD000, v9, OS_LOG_TYPE_INFO, "Has smsAccount? {%@}", (uint8_t *)&v18, 0xCu);
    }
  }
  int v11 = [v5 BOOLValue];
  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v6 identifier];
        int v18 = 138412290;
        v19 = v14;
        _os_log_impl(&dword_2561DD000, v13, OS_LOG_TYPE_INFO, "Enrolling device in SMS relay. specifier_identifier={%@}", (uint8_t *)&v18, 0xCu);
      }
    }
    v15 = [v6 identifier];
    [v8 enrollDeviceInSMSRelay:v15];
  }
  else
  {
    if (v12)
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = [v6 identifier];
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_2561DD000, v16, OS_LOG_TYPE_INFO, "Unenrolling device in SMS relay. specifier_identifier={%@}", (uint8_t *)&v18, 0xCu);
      }
    }
    v15 = [v6 identifier];
    [v8 unEnrollDeviceInSMSRelay:v15];
  }
}

- (BOOL)isDeviceUsingMiCWithIdentifier:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() isDeviceUsingMiCWithIdentifier:v3];

  return v4;
}

+ (id)authorizedSMSRelayDevices
{
  v2 = (void *)CFPreferencesCopyAppValue(@"allowed", @"com.apple.sms");
  return v2;
}

+ (BOOL)deviceIsAuthorized:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[CKSettingSMSRelayController authorizedSMSRelayDevices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqualToString:", v3, (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)micSMSRelayDevices
{
  v2 = (void *)CFPreferencesCopyAppValue(@"mic", @"com.apple.sms");
  return v2;
}

+ (BOOL)isDeviceUsingMiCWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[CKSettingSMSRelayController micSMSRelayDevices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqualToString:", v3, (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (unint64_t)numberOfActiveDevices
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A0C0]);
  id v3 = (void *)[v2 initWithService:*MEMORY[0x263F49FB0]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(v3, "devices", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 uniqueID];
        if (+[CKSettingSMSRelayController deviceIsAuthorized:v11])
        {
          int v12 = [v10 isWatch];

          v7 += v12 ^ 1u;
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldShowSMSRelaySettings
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A0C0]);
  id v3 = (void *)[v2 initWithService:*MEMORY[0x263F49FB0]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "devices", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) isWatch] ^ 1;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
    LOBYTE(v5) = v6 != 0;
  }

  return v5;
}

- (IDSService)relayService
{
  return self->_relayService;
}

- (void)setRelayService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end