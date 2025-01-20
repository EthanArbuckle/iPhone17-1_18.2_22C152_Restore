@interface PowerUIChargeAwarenessNotifier
+ (id)contentForType:(int)a3;
+ (id)requestForContent:(int)a3;
+ (id)sharedInstance;
- (BOOL)allowNotificationsOverride;
- (BOOL)haveShownMCL;
- (BOOL)haveShownWireless;
- (BOOL)notificationPendingMCL;
- (BOOL)notificationPendingWireless;
- (BOOL)readHaveShownMCL;
- (BOOL)readHaveShownWireless;
- (BOOL)readNotificationPendingMCL;
- (BOOL)readNotificationPendingWireless;
- (NSBundle)bundle;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUIChargeAwarenessNotifier)init;
- (UNUserNotificationCenter)unCenter;
- (_CDLocalContext)context;
- (double)firstInitDate;
- (int)registrationToken;
- (void)cancelNotificationRequestWithIdentifier:(id)a3;
- (void)displayNotificationForMCL:(BOOL)a3 forWireless:(BOOL)a4;
- (void)displayPendingMCLNotification;
- (void)displayPendingWirelessNotification;
- (void)forceDisplayMCLNotification:(id)a3;
- (void)forceDisplayWirelessChargingNotification:(id)a3;
- (void)postNotificationsIfNecessary;
- (void)readFirstInitDate;
- (void)recordHaveShownMCL;
- (void)recordHaveShownWireless;
- (void)recordNotificationPendingMCL;
- (void)recordNotificationPendingWireless;
- (void)setAllowNotificationsOverride:(BOOL)a3;
- (void)setBundle:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setFirstInitDate:(double)a3;
- (void)setHaveShownMCL:(BOOL)a3;
- (void)setHaveShownWireless:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setNotificationPendingMCL:(BOOL)a3;
- (void)setNotificationPendingWireless:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRegistrationToken:(int)a3;
- (void)setUnCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PowerUIChargeAwarenessNotifier

- (void)postNotificationsIfNecessary
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Unable to get battery properties: %d", (uint8_t *)v2, 8u);
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_35(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotificationsIfNecessary];
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_34(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_35;
  block[3] = &unk_2645A5CF0;
  id v5 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);

  return 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)displayNotificationForMCL:(BOOL)a3 forWireless:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  if ((!_os_feature_enabled_impl() || (MGGetBoolAnswer() & 1) == 0) && !self->_allowNotificationsOverride)
  {
    log = self->_log;
    BOOL v4 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Feature not enabled or not supported.", buf, 2u);
      BOOL v4 = 0;
    }
  }
  if ((!_os_feature_enabled_impl() || !MGGetBoolAnswer() || (MGGetBoolAnswer() & 1) == 0)
    && !self->_allowNotificationsOverride)
  {
    v8 = self->_log;
    BOOL v5 = 0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Feature not enabled or not supported.", buf, 2u);
      BOOL v5 = 0;
    }
  }
  if (self->_haveShownWireless)
  {
    v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    BOOL v4 = 0;
  }
  if (self->_haveShownMCL)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    BOOL v5 = 0;
  }
  if (v4 || v5)
  {
    if (v4)
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke;
      v43[3] = &unk_2645A5FA8;
      v43[4] = self;
      [(PowerUIChargeAwarenessNotifier *)self forceDisplayWirelessChargingNotification:v43];
    }
    if (v5)
    {
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_116;
      v42[3] = &unk_2645A5FA8;
      v42[4] = self;
      [(PowerUIChargeAwarenessNotifier *)self forceDisplayMCLNotification:v42];
    }
    v25 = [MEMORY[0x263EFF9A0] dictionary];
    v26 = NSNumber;
    v27 = [MEMORY[0x263EFF910] now];
    [v27 timeIntervalSinceReferenceDate];
    v29 = [v26 numberWithInt:(int)((v28 - self->_firstInitDate) / 86400.0)];
    [v25 setObject:v29 forKeyedSubscript:@"daysSinceInit"];

    v30 = @"Wireless";
    if (v4 && v5) {
      v30 = @"Both";
    }
    if (v4) {
      v31 = v30;
    }
    else {
      v31 = @"ManualChargeLimit";
    }
    [v25 setObject:v31 forKeyedSubscript:@"notificationType"];
    id v32 = v25;
    AnalyticsSendEventLazy();
    v33 = self->_log;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v32;
      _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_DEFAULT, "Sending charge awareness CA event: %@", buf, 0xCu);
    }
  }
  else
  {
    v34 = self->_log;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[PowerUIChargeAwarenessNotifier displayNotificationForMCL:forWireless:](v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }
}

- (PowerUIChargeAwarenessNotifier)init
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)PowerUIChargeAwarenessNotifier;
  v2 = [(PowerUIChargeAwarenessNotifier *)&v57 init];
  if (!v2)
  {
LABEL_43:
    v26 = v2;
    goto LABEL_44;
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.smartcharging.topoffprotection"];
  defaults = v2->_defaults;
  v2->_defaults = (NSUserDefaults *)v3;

  os_log_t v5 = os_log_create("com.apple.powerui", "chargingAwarenessNotifications");
  log = v2->_log;
  v2->_log = (OS_os_log *)v5;

  v7 = [(PowerUIChargeAwarenessNotifier *)v2 log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "ChargingAwarenessNotifier initiating...", buf, 2u);
  }

  [(PowerUIChargeAwarenessNotifier *)v2 readFirstInitDate];
  v2->_allowNotificationsOverride = 0;
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    v8 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"allowMCLOverride" inDomain:@"com.apple.smartcharging.topoffprotection"];
    v9 = v8;
    if (v8) {
      v2->_allowNotificationsOverride = [v8 BOOLValue];
    }
    uint64_t v10 = [(PowerUIChargeAwarenessNotifier *)v2 log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "... initialization allowed via override...", buf, 2u);
    }
  }
  BOOL v11 = [(PowerUIChargeAwarenessNotifier *)v2 readHaveShownMCL];
  BOOL v12 = [(PowerUIChargeAwarenessNotifier *)v2 readHaveShownWireless];
  if (v11 && v12 && !v2->_allowNotificationsOverride)
  {
    uint64_t v24 = [(PowerUIChargeAwarenessNotifier *)v2 log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = "... notifications were already shown, do not init.";
LABEL_28:
      _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    }
  }
  else
  {
    if ((MGGetBoolAnswer() & 1) != 0 || (MGGetBoolAnswer() & 1) != 0 || v2->_allowNotificationsOverride)
    {
      uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v14 = dispatch_queue_create("com.apple.powerui.chargingawarenessqueue", v13);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v14;

      uint64_t v16 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.powerui.chargeawareness"];
      unCenter = v2->_unCenter;
      v2->_unCenter = (UNUserNotificationCenter *)v16;

      [(UNUserNotificationCenter *)v2->_unCenter setDelegate:v2];
      [(UNUserNotificationCenter *)v2->_unCenter setPrivateDelegate:v2];
      [(UNUserNotificationCenter *)v2->_unCenter setWantsNotificationResponsesDelivered];
      if (!v2->_haveShownMCL
        && [(PowerUIChargeAwarenessNotifier *)v2 readNotificationPendingMCL])
      {
        uint64_t v18 = [MEMORY[0x263F68018] sharedNotifier];
        unint64_t v19 = [v18 currentState];

        uint64_t v20 = [(PowerUIChargeAwarenessNotifier *)v2 log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v59 = v19;
          _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "setup state: %lu", buf, 0xCu);
        }

        uint64_t v21 = [(PowerUIChargeAwarenessNotifier *)v2 log];
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v19 > 1)
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "MCL notification was pending, buddy complete, display now", buf, 2u);
          }

          [(PowerUIChargeAwarenessNotifier *)v2 displayPendingMCLNotification];
        }
        else
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "MCL notification pending, set up callback", buf, 2u);
          }

          uint64_t v23 = [MEMORY[0x263F68018] sharedNotifier];
          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke;
          v55[3] = &unk_2645A5CF0;
          v56 = v2;
          [v23 addStateCompletionObserver:v55 forState:2];
        }
      }
      if (!v2->_haveShownWireless
        && [(PowerUIChargeAwarenessNotifier *)v2 readNotificationPendingWireless])
      {
        v27 = [MEMORY[0x263F68018] sharedNotifier];
        unint64_t v28 = [v27 currentState];

        v29 = [(PowerUIChargeAwarenessNotifier *)v2 log];
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v28 > 1)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "wireless notification was pending, buddy complete, display now", buf, 2u);
          }

          [(PowerUIChargeAwarenessNotifier *)v2 displayPendingWirelessNotification];
        }
        else
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "wireless notification pending, set up callback", buf, 2u);
          }

          v31 = [MEMORY[0x263F68018] sharedNotifier];
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_23;
          v53[3] = &unk_2645A5CF0;
          v54 = v2;
          [v31 addStateCompletionObserver:v53 forState:2];
        }
      }
      uint64_t v32 = [MEMORY[0x263F351B8] userContext];
      context = v2->_context;
      v2->_context = (_CDLocalContext *)v32;

      v34 = (void *)MEMORY[0x263F351F8];
      uint64_t v35 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
      uint64_t v36 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
      uint64_t v37 = [MEMORY[0x263F351D0] keyPathForForegroundApp];
      uint64_t v38 = [v34 predicateForKeyPath:v35, @"(SELF.%@.value.rawExternalConnected = %@) AND NOT (SELF.%@.value = %@)", v36, MEMORY[0x263EFFA88], v37, @"com.apple.camera" withFormat];

      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_34;
      v51[3] = &unk_2645A5F80;
      uint64_t v39 = v2;
      v52 = v39;
      uint64_t v40 = (void *)MEMORY[0x223C80C20](v51);
      uint64_t v41 = [MEMORY[0x263F351E8] localWakingRegistrationWithIdentifier:@"com.apple.powerui.chargingAwarenessNotifications" contextualPredicate:v38 callback:v40];
      [(_CDLocalContext *)v2->_context registerCallback:v41];
      *(_DWORD *)buf = 0;
      v42 = v2->_queue;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_3;
      handler[3] = &unk_2645A5CA8;
      v43 = v39;
      v50 = v43;
      notify_register_dispatch("com.apple.powerui.testdisplaywireless", (int *)buf, v42, handler);
      int out_token = 0;
      v44 = v2->_queue;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_44;
      v46[3] = &unk_2645A5CA8;
      v47 = v43;
      notify_register_dispatch("com.apple.powerui.testdisplaynotifications", &out_token, v44, v46);

      goto LABEL_43;
    }
    uint64_t v24 = [(PowerUIChargeAwarenessNotifier *)v2 log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = "... features not supported, do not init.";
      goto LABEL_28;
    }
  }

  v26 = 0;
LABEL_44:

  return v26;
}

void __38__PowerUIChargeAwarenessNotifier_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2;
  block[3] = &unk_2645A5CF0;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayPendingMCLNotification];
}

void __38__PowerUIChargeAwarenessNotifier_init__block_invoke_23(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_24;
  block[3] = &unk_2645A5CF0;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_2_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayPendingWirelessNotification];
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to display wireless charging notification", v4, 2u);
  }

  return [*(id *)(a1 + 32) displayNotificationForMCL:0 forWireless:1];
}

uint64_t __38__PowerUIChargeAwarenessNotifier_init__block_invoke_44(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to display feature availability notifications", v4, 2u);
  }

  return [*(id *)(a1 + 32) postNotificationsIfNecessary];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_notifier_0;
  return v2;
}

uint64_t __48__PowerUIChargeAwarenessNotifier_sharedInstance__block_invoke()
{
  sharedInstance_notifier_0 = objc_alloc_init(PowerUIChargeAwarenessNotifier);
  return MEMORY[0x270F9A758]();
}

- (BOOL)readHaveShownWireless
{
  BOOL result = [(NSUserDefaults *)self->_defaults BOOLForKey:@"haveShownWirelessNotification"];
  self->_haveShownWireless = result;
  return result;
}

- (BOOL)readHaveShownMCL
{
  BOOL result = [(NSUserDefaults *)self->_defaults BOOLForKey:@"haveShownMCLNotification"];
  self->_haveShownMCL = result;
  return result;
}

- (void)recordHaveShownWireless
{
  self->_haveShownWireless = 1;
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"haveShownWirelessNotification"];
}

- (void)recordHaveShownMCL
{
  self->_haveShownMCL = 1;
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"haveShownMCLNotification"];
}

- (BOOL)readNotificationPendingMCL
{
  BOOL result = [(NSUserDefaults *)self->_defaults BOOLForKey:@"notificationPendingMCL"];
  self->_notificationPendingMCL = result;
  return result;
}

- (BOOL)readNotificationPendingWireless
{
  BOOL result = [(NSUserDefaults *)self->_defaults BOOLForKey:@"notificationPendingWireless"];
  self->_notificationPendingWireless = result;
  return result;
}

- (void)recordNotificationPendingMCL
{
  self->_notificationPendingMCL = 1;
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"notificationPendingMCL"];
}

- (void)recordNotificationPendingWireless
{
  self->_notificationPendingWireless = 1;
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"notificationPendingWireless"];
}

- (void)displayPendingMCLNotification
{
  [(PowerUIChargeAwarenessNotifier *)self displayNotificationForMCL:1 forWireless:0];
  self->_notificationPendingMCL = 0;
  defaults = self->_defaults;
  [(NSUserDefaults *)defaults setBool:0 forKey:@"notificationPendingMCL"];
}

- (void)displayPendingWirelessNotification
{
  [(PowerUIChargeAwarenessNotifier *)self displayNotificationForMCL:0 forWireless:1];
  self->_notificationPendingWireless = 0;
  defaults = self->_defaults;
  [(NSUserDefaults *)defaults setBool:0 forKey:@"notificationPendingWireless"];
}

- (void)readFirstInitDate
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"firstInitDate"];
  if (v3 == 0.0)
  {
    id v4 = [MEMORY[0x263EFF910] now];
    [v4 timeIntervalSinceReferenceDate];
    self->_double firstInitDate = v5;

    defaults = self->_defaults;
    double firstInitDate = self->_firstInitDate;
    [(NSUserDefaults *)defaults setDouble:@"firstInitDate" forKey:firstInitDate];
  }
  else
  {
    self->_double firstInitDate = v3;
  }
}

+ (id)contentForType:(int)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  double v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  v6 = [MEMORY[0x263F086E0] bundleWithURL:v5];
  v7 = v6;
  if (!a3)
  {
    v8 = @"bolt.fill";
    v9 = @"lotxMCLCategory";
    uint64_t v10 = @"AWARENESS_CHARGING_NOTIFICATION_LIMIT_CONTENT";
    BOOL v11 = @"AWARENESS_CHARGING_NOTIFICATION_LIMIT_TITLE";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v8 = @"wirelesscharging";
    v9 = @"lotxWirelessCategory";
    uint64_t v10 = @"AWARENESS_CHARGING_NOTIFICATION_WIRELESS_CONTENT";
    BOOL v11 = @"AWARENESS_CHARGING_NOTIFICATION_WIRELESS_TITLE";
LABEL_5:
    BOOL v12 = [v6 localizedStringForKey:v11 value:&stru_26D3439E8 table:@"Localizable-LotX"];
    [v4 setTitle:v12];

    uint64_t v13 = [v7 localizedStringForKey:v10 value:&stru_26D3439E8 table:@"Localizable-LotX"];
    [v4 setBody:v13];

    [v4 setCategoryIdentifier:v9];
    dispatch_queue_t v14 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:v8];
    [v4 setIcon:v14];

    [v4 setShouldIgnoreDowntime:1];
    [v4 setShouldIgnoreDoNotDisturb:1];
    [v4 setShouldHideDate:1];
    [v4 setShouldSuppressScreenLightUp:1];
    uint64_t v15 = [MEMORY[0x263EFF910] distantFuture];
    [v4 setExpirationDate:v15];

    [v4 setShouldDisplayActionsInline:1];
    [v4 setShouldSuppressDefaultAction:1];
    uint64_t v16 = [MEMORY[0x263EFF910] distantFuture];
    [v4 setDate:v16];

    id v17 = v4;
    goto LABEL_7;
  }
  id v17 = 0;
LABEL_7:

  return v17;
}

+ (id)requestForContent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(id)objc_opt_class() contentForType:*(void *)&a3];
  if (v4)
  {
    double v5 = NSString;
    v6 = [NSNumber numberWithInt:v3];
    v7 = [v5 stringWithFormat:@"chargingAwareness-%@", v6];

    v8 = [MEMORY[0x263F1DF48] requestWithIdentifier:v7 content:v4 trigger:0];
    [v8 setDestinations:15];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)forceDisplayMCLNotification:(id)a3
{
  id v4 = a3;
  [(PowerUIChargeAwarenessNotifier *)self cancelNotificationRequestWithIdentifier:@"chargingAwareness-0"];
  double v5 = [(id)objc_opt_class() requestForContent:0];
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Displaying MCL Notification", v7, 2u);
    }
    [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v5 withCompletionHandler:v4];
  }
}

- (void)forceDisplayWirelessChargingNotification:(id)a3
{
  id v4 = a3;
  [(PowerUIChargeAwarenessNotifier *)self cancelNotificationRequestWithIdentifier:@"chargingAwareness-1"];
  double v5 = [(id)objc_opt_class() requestForContent:1];
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Displaying Wireless Notification", v7, 2u);
    }
    [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v5 withCompletionHandler:v4];
  }
}

- (void)cancelNotificationRequestWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  unCenter = self->_unCenter;
  v11[0] = a3;
  double v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  v7 = [v5 arrayWithObjects:v11 count:1];
  [(UNUserNotificationCenter *)unCenter removeDeliveredNotificationsWithIdentifiers:v7];

  v8 = self->_unCenter;
  id v10 = v6;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  [(UNUserNotificationCenter *)v8 removePendingNotificationRequestsWithIdentifiers:v9];
}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    double v5 = v4[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else
  {
    [v4 recordHaveShownWireless];
  }
}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    double v5 = v4[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_116_cold_1((uint64_t)v3, v5);
    }
  }
  else
  {
    [v4 recordHaveShownMCL];
  }
}

id __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_136(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __62__PowerUIChargeAwarenessNotifier_postNotificationsIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayPendingMCLNotification];
}

uint64_t __62__PowerUIChargeAwarenessNotifier_postNotificationsIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayPendingWirelessNotification];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v9;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_INFO, "notification request response coming in %@ for center %@", buf, 0x16u);
  }
  BOOL v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v12;
    dispatch_queue_t v14 = [v9 actionIdentifier];
    *(_DWORD *)buf = 138412290;
    id v38 = v14;
    _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_INFO, "notification request coming in: %@", buf, 0xCu);
  }
  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  [v15 setObject:0 forKeyedSubscript:@"notificationType"];
  [v15 setObject:@"error" forKeyedSubscript:@"action"];
  uint64_t v16 = [v9 notification];
  id v17 = [v16 request];
  uint64_t v18 = [v17 content];
  unint64_t v19 = [v18 categoryIdentifier];
  char v20 = [v19 isEqualToString:@"lotxWirelessCategory"];

  if (v20)
  {
    uint64_t v21 = @"wireless";
  }
  else
  {
    BOOL v22 = [v9 notification];
    uint64_t v23 = [v22 request];
    uint64_t v24 = [v23 content];
    v25 = [v24 categoryIdentifier];
    int v26 = [v25 isEqualToString:@"lotxMCLCategory"];

    if (!v26) {
      goto LABEL_10;
    }
    uint64_t v21 = @"mcl";
  }
  [v15 setObject:v21 forKeyedSubscript:@"notificationType"];
LABEL_10:
  v27 = [v15 objectForKeyedSubscript:@"notificationType"];

  if (!v27) {
    goto LABEL_22;
  }
  unint64_t v28 = [v9 actionIdentifier];
  int v29 = [v28 isEqualToString:@"poweruiNoOp"];

  if (v29)
  {
    [v15 setObject:@"selectedOK" forKeyedSubscript:@"action"];
    BOOL v30 = [(PowerUIChargeAwarenessNotifier *)self log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v15 objectForKeyedSubscript:@"notificationType"];
      *(_DWORD *)buf = 138412290;
      id v38 = v31;
      uint64_t v32 = "User selected 'OK' on %@ notification";
LABEL_17:
      _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v33 = [v9 actionIdentifier];
  int v34 = [v33 isEqualToString:*MEMORY[0x263F1E0D0]];

  if (v34)
  {
    [v15 setObject:@"dismissed" forKeyedSubscript:@"action"];
    BOOL v30 = [(PowerUIChargeAwarenessNotifier *)self log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v15 objectForKeyedSubscript:@"notificationType"];
      *(_DWORD *)buf = 138412290;
      id v38 = v31;
      uint64_t v32 = "User dismissed %@ notification";
      goto LABEL_17;
    }
LABEL_18:
  }
  uint64_t v35 = [(PowerUIChargeAwarenessNotifier *)self log];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v15;
    _os_log_impl(&dword_22135E000, v35, OS_LOG_TYPE_DEFAULT, "Logging to CA: %@", buf, 0xCu);
  }

  id v36 = v15;
  AnalyticsSendEventLazy();

LABEL_22:
  v10[2](v10);
}

id __110__PowerUIChargeAwarenessNotifier_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_INFO, "notification request response coming in %@ for center %@", buf, 0x16u);
  }
  id v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    BOOL v11 = [v7 actionIdentifier];
    *(_DWORD *)buf = 138412290;
    id v24 = v11;
    _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_INFO, "notification request coming in: %@", buf, 0xCu);
  }
  BOOL v12 = [MEMORY[0x263EFF9A0] dictionary];
  [v12 setObject:0 forKeyedSubscript:@"notificationType"];
  [v12 setObject:@"selectedLearnMore" forKeyedSubscript:@"action"];
  uint64_t v13 = [v7 actionIdentifier];
  char v14 = [v13 isEqualToString:@"poweruiLearnMoreWireless"];

  if (v14)
  {
    uint64_t v15 = @"wireless";
  }
  else
  {
    uint64_t v16 = [v7 actionIdentifier];
    int v17 = [v16 isEqualToString:@"poweruiLearnMoreMCL"];

    if (!v17) {
      goto LABEL_10;
    }
    uint64_t v15 = @"mcl";
  }
  [v12 setObject:v15 forKeyedSubscript:@"notificationType"];
LABEL_10:
  uint64_t v18 = [v12 objectForKeyedSubscript:@"notificationType"];

  if (v18)
  {
    unint64_t v19 = [(PowerUIChargeAwarenessNotifier *)self log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = [v12 objectForKeyedSubscript:@"notificationType"];
      *(_DWORD *)buf = 138412290;
      id v24 = v20;
      _os_log_impl(&dword_22135E000, v19, OS_LOG_TYPE_DEFAULT, "User selected 'learn more' on %@ notification", buf, 0xCu);
    }
    uint64_t v21 = [(PowerUIChargeAwarenessNotifier *)self log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v12;
      _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "Logging to CA: %@", buf, 0xCu);
    }

    id v22 = v12;
    AnalyticsSendEventLazy();
  }
}

id __87__PowerUIChargeAwarenessNotifier_userNotificationCenter_didOpenApplicationForResponse___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setQueue:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (BOOL)haveShownWireless
{
  return self->_haveShownWireless;
}

- (void)setHaveShownWireless:(BOOL)a3
{
  self->_haveShownWireless = a3;
}

- (BOOL)notificationPendingWireless
{
  return self->_notificationPendingWireless;
}

- (void)setNotificationPendingWireless:(BOOL)a3
{
  self->_notificationPendingWireless = a3;
}

- (BOOL)haveShownMCL
{
  return self->_haveShownMCL;
}

- (void)setHaveShownMCL:(BOOL)a3
{
  self->_haveShownMCL = a3;
}

- (BOOL)notificationPendingMCL
{
  return self->_notificationPendingMCL;
}

- (void)setNotificationPendingMCL:(BOOL)a3
{
  self->_notificationPendingMCL = a3;
}

- (double)firstInitDate
{
  return self->_firstInitDate;
}

- (void)setFirstInitDate:(double)a3
{
  self->_double firstInitDate = a3;
}

- (BOOL)allowNotificationsOverride
{
  return self->_allowNotificationsOverride;
}

- (void)setAllowNotificationsOverride:(BOOL)a3
{
  self->_allowNotificationsOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)displayNotificationForMCL:(uint64_t)a3 forWireless:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)displayNotificationForMCL:(uint64_t)a3 forWireless:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)displayNotificationForMCL:(uint64_t)a3 forWireless:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Error showing wireless charging notification: %@", (uint8_t *)&v2, 0xCu);
}

void __72__PowerUIChargeAwarenessNotifier_displayNotificationForMCL_forWireless___block_invoke_116_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Error showing mcl charging notification: %@", (uint8_t *)&v2, 0xCu);
}

@end