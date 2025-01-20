@interface PowerUINotificationManager
+ (id)chargeLimitRecommendationContentWithLimit:(unint64_t)a3;
+ (id)chargeLimitRecommendationRequestWithLimit:(unint64_t)a3;
+ (id)fullChargeDeadlineStringFromDate:(id)a3;
+ (id)obcEngagedContentWithDeadline:(id)a3 toppingOff:(BOOL)a4;
+ (id)obcEngagedRequestWithDeadline:(id)a3 isToppingOff:(BOOL)a4;
+ (id)pausedNotificationContentFromDate:(id)a3 bundle:(id)a4;
+ (id)sharedInstance;
- (BOOL)immediateCharge;
- (BOOL)internalCECNotificationsDisabled;
- (NSString)lastScheduledFullChargeNotificationID;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUINotificationManager)init;
- (UNUserNotificationCenter)unCenter;
- (id)contentForInternalDurationPredictionWithDuration:(double)a3 withConfidence:(double)a4;
- (id)currentOBCEngagedNotification;
- (id)getDeliveredNotifications;
- (id)postCECEngagedNotificationWithDate:(id)a3;
- (id)postCECFirstTimeNotification;
- (id)postChargeLimitRecommendationWithLimit:(unint64_t)a3;
- (id)postInternalCECNotificationWithID:(id)a3 chargingStatus:(BOOL)a4 information:(id)a5 shouldReplace:(BOOL)a6;
- (id)postInternalChargingIntelligenceNotificationWithChargingStatus:(BOOL)a3 information:(id)a4 url:(id)a5 validUntil:(id)a6;
- (id)postNotificationWithRequest:(id)a3;
- (id)postOBCEngagedNotificationWithDate:(id)a3;
- (id)postOBCEngagedTopOffNotificationWithDate:(id)a3;
- (id)ttrURLforLocationFailure;
- (void)cancelNotificationRequestWithIdentifier:(id)a3;
- (void)currentOBCEngagedNotification;
- (void)getDeliveredNotifications;
- (void)handleLocationFailures:(id)a3;
- (void)postInternalCECNotificationForChargingDates:(id)a3;
- (void)postInternalChargeDurationNotificationWithDuration:(double)a3 withConfidence:(double)a4;
- (void)postInternalLocationFailureNotification;
- (void)postInternalNotificationAtDate:(id)a3 withTitle:(id)a4 withTextContent:(id)a5 icon:(id)a6 url:(id)a7 expirationDate:(id)a8;
- (void)removeAllNotifications;
- (void)removeCECNotifications;
- (void)removeCECPausedNotification;
- (void)resetAll;
- (void)setDefaults:(id)a3;
- (void)setImmediateCharge:(BOOL)a3;
- (void)setLastScheduledFullChargeNotificationID:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUnCenter:(id)a3;
- (void)updateOBCEngagedNotificationWithDate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PowerUINotificationManager

- (PowerUINotificationManager)init
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)PowerUINotificationManager;
  v2 = [(PowerUINotificationManager *)&v22 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.smartcharging", "NotificationManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.notification"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.powerui.notificationmanager.queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = [(NSUserDefaults *)v2->_defaults objectForKey:@"immediateCharge"];
    v11 = v10;
    if (v10)
    {
      v2->_BOOL immediateCharge = [v10 BOOLValue];
      v12 = v2->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL immediateCharge = v2->_immediateCharge;
        *(_DWORD *)buf = 67109120;
        BOOL v24 = immediateCharge;
        _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Setting immediateCharge to %d", buf, 8u);
      }
    }
    v14 = v2->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = v2->_immediateCharge;
      *(_DWORD *)buf = 67109120;
      BOOL v24 = v15;
      _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "ImmediateCharge %d", buf, 8u);
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.powerui.smartcharging"];
    unCenter = v2->_unCenter;
    v2->_unCenter = (UNUserNotificationCenter *)v16;

    [(UNUserNotificationCenter *)v2->_unCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_unCenter setWantsNotificationResponsesDelivered];
    v18 = v2->_unCenter;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __34__PowerUINotificationManager_init__block_invoke;
    v20[3] = &unk_2645A5E98;
    v21 = v2;
    [(UNUserNotificationCenter *)v18 getDeliveredNotificationsWithCompletionHandler:v20];
  }
  return v2;
}

void __34__PowerUINotificationManager_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_queue_t v8 = [*(id *)(*((void *)&v17 + 1) + 8 * v7) request];
        v9 = [v8 content];
        v10 = [v9 categoryIdentifier];
        int v11 = [v10 isEqual:@"fullChargeCategory"];

        if (v11)
        {
          v12 = [v8 identifier];
          char v13 = [v12 isEqual:*(void *)(*(void *)(a1 + 32) + 48)];

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [v8 identifier];
            uint64_t v15 = *(void *)(a1 + 32);
            uint64_t v16 = *(void **)(v15 + 48);
            *(void *)(v15 + 48) = v14;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (id)currentOBCEngagedNotification
{
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__1;
  long long v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  unCenter = self->_unCenter;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __59__PowerUINotificationManager_currentOBCEngagedNotification__block_invoke;
  char v13 = &unk_2645A5EC0;
  uint64_t v15 = &v16;
  uint64_t v5 = v3;
  uint64_t v14 = v5;
  [(UNUserNotificationCenter *)unCenter getDeliveredNotificationsWithCompletionHandler:&v10];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    uint64_t v7 = [(PowerUINotificationManager *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PowerUINotificationManager currentOBCEngagedNotification]();
    }

    id v8 = 0;
  }
  else
  {
    id v8 = (id)v17[5];
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __59__PowerUINotificationManager_currentOBCEngagedNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v13 = a1;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 request];
        uint64_t v10 = [v9 content];
        uint64_t v11 = [v10 categoryIdentifier];
        int v12 = [v11 isEqual:@"fullChargeCategory"];

        if (v12)
        {
          a1 = v13;
          objc_storeStrong((id *)(*(void *)(*(void *)(v13 + 40) + 8) + 40), v8);

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      a1 = v13;
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

void __44__PowerUINotificationManager_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance)
  {
    sharedInstance_instance = objc_alloc_init(PowerUINotificationManager);
    MEMORY[0x270F9A758]();
  }
}

+ (id)fullChargeDeadlineStringFromDate:(id)a3
{
  uint64_t v3 = fullChargeDeadlineStringFromDate__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&fullChargeDeadlineStringFromDate__onceToken, &__block_literal_global_30);
  }
  uint64_t v5 = [MEMORY[0x263EFF960] currentLocale];
  [(id)fullChargeDeadlineStringFromDate__formatter setLocale:v5];

  uint64_t v6 = [(id)fullChargeDeadlineStringFromDate__formatter stringFromDate:v4];

  return v6;
}

uint64_t __63__PowerUINotificationManager_fullChargeDeadlineStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)fullChargeDeadlineStringFromDate__formatter;
  fullChargeDeadlineStringFromDate__formatter = (uint64_t)v0;

  [(id)fullChargeDeadlineStringFromDate__formatter setDateStyle:0];
  v2 = (void *)fullChargeDeadlineStringFromDate__formatter;
  return [v2 setTimeStyle:1];
}

- (void)updateOBCEngagedNotificationWithDate:(id)a3
{
  uint64_t v4 = +[PowerUINotificationManager obcEngagedContentWithDeadline:a3 toppingOff:0];
  if (v4) {
    [(UNUserNotificationCenter *)self->_unCenter replaceContentForRequestWithIdentifier:self->_lastScheduledFullChargeNotificationID replacementContent:v4 completionHandler:0];
  }
  MEMORY[0x270F9A758]();
}

- (id)postOBCEngagedNotificationWithDate:(id)a3
{
  uint64_t v4 = +[PowerUINotificationManager obcEngagedRequestWithDeadline:a3 isToppingOff:0];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v4 withCompletionHandler:0];
  uint64_t v5 = [v4 identifier];

  return v5;
}

- (id)postOBCEngagedTopOffNotificationWithDate:(id)a3
{
  uint64_t v4 = +[PowerUINotificationManager obcEngagedRequestWithDeadline:a3 isToppingOff:1];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v4 withCompletionHandler:0];
  uint64_t v5 = [v4 identifier];

  return v5;
}

- (id)postNotificationWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__1;
  uint64_t v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  unCenter = self->_unCenter;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__PowerUINotificationManager_postNotificationWithRequest___block_invoke;
  v8[3] = &unk_2645A5EE8;
  v8[4] = &v9;
  [(UNUserNotificationCenter *)unCenter addNotificationRequest:v4 withCompletionHandler:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__PowerUINotificationManager_postNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)getDeliveredNotifications
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__1;
  long long v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  unCenter = self->_unCenter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__PowerUINotificationManager_getDeliveredNotifications__block_invoke;
  v9[3] = &unk_2645A5EC0;
  uint64_t v11 = &v12;
  id v5 = v3;
  uint64_t v10 = v5;
  [(UNUserNotificationCenter *)unCenter getDeliveredNotificationsWithCompletionHandler:v9];
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v5, v6) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT)) {
    -[PowerUINotificationManager getDeliveredNotifications]();
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__PowerUINotificationManager_getDeliveredNotifications__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeAllNotifications
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Removing all notifications", buf, 2u);
  }
  unCenter = self->_unCenter;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__PowerUINotificationManager_removeAllNotifications__block_invoke;
  v5[3] = &unk_2645A5E98;
  v5[4] = self;
  [(UNUserNotificationCenter *)unCenter getDeliveredNotificationsWithCompletionHandler:v5];
  [(UNUserNotificationCenter *)self->_unCenter removeAllDeliveredNotifications];
  [(PowerUINotificationManager *)self resetAll];
}

void __52__PowerUINotificationManager_removeAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = v8;
          uint64_t v11 = [v9 request];
          uint64_t v12 = [v11 identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v12;
          _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }
}

+ (id)pausedNotificationContentFromDate:(id)a3 bundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PowerUINotificationManager fullChargeDeadlineStringFromDate:v6];
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v9 = [v8 components:32 fromDate:v6];

  if ([v9 hour] == 1)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = @"OBC_CHARGING_PAUSED_BODY_TIME_SINGULAR";
LABEL_8:
    long long v14 = [v5 localizedStringForKey:v11 value:&stru_26D3439E8 table:@"Localizable"];
    id v17 = objc_msgSend(v10, "stringWithFormat:", v14, v7);
    goto LABEL_11;
  }
  if ([v9 hour] != 13)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = @"OBC_CHARGING_PAUSED_BODY_TIME_PLURAL";
    goto LABEL_8;
  }
  uint64_t v12 = (void *)MEMORY[0x263F08790];
  long long v13 = [MEMORY[0x263EFF960] currentLocale];
  long long v14 = [v12 dateFormatFromTemplate:@"j" options:0 locale:v13];

  if (([v14 containsString:@"H"] & 1) != 0
    || [v14 containsString:@"k"])
  {
    long long v15 = NSString;
    long long v16 = @"OBC_CHARGING_PAUSED_BODY_TIME_PLURAL";
  }
  else
  {
    long long v15 = NSString;
    long long v16 = @"OBC_CHARGING_PAUSED_BODY_TIME_SINGULAR";
  }
  uint64_t v18 = [v5 localizedStringForKey:v16 value:&stru_26D3439E8 table:@"Localizable"];
  id v17 = objc_msgSend(v15, "stringWithFormat:", v18, v7);

LABEL_11:
  uint64_t v19 = objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\.\\.$", @".", 1024, 0, objc_msgSend(v17, "length"));

  return v19;
}

+ (id)obcEngagedContentWithDeadline:(id)a3 toppingOff:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  if (v5)
  {
    id v7 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
    id v8 = [MEMORY[0x263F086E0] bundleWithURL:v7];
    uint64_t v9 = [v8 localizedStringForKey:@"OBC_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
    [v6 setTitle:v9];

    uint64_t v10 = +[PowerUINotificationManager pausedNotificationContentFromDate:v5 bundle:v8];
    [v6 setBody:v10];

    if (v4) {
      uint64_t v11 = @"chargingToFullCategory";
    }
    else {
      uint64_t v11 = @"fullChargeCategory";
    }
    [v6 setCategoryIdentifier:v11];
    [v6 setShouldIgnoreDowntime:1];
    [v6 setShouldIgnoreDoNotDisturb:1];
    [v6 setShouldHideDate:1];
    [v6 setShouldSuppressScreenLightUp:1];
    uint64_t v12 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
    [v6 setIcon:v12];

    [v6 setExpirationDate:v5];
    id v13 = v6;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)obcEngagedRequestWithDeadline:(id)a3 isToppingOff:(BOOL)a4
{
  BOOL v4 = +[PowerUINotificationManager obcEngagedContentWithDeadline:a3 toppingOff:a4];
  if (v4)
  {
    id v5 = NSString;
    id v6 = [MEMORY[0x263EFF910] date];
    id v7 = [v5 stringWithFormat:@"chargingRequest-%@", v6];

    id v8 = [MEMORY[0x263F1DF48] requestWithIdentifier:v7 content:v4 trigger:0];
    [v8 setDestinations:2];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)resetAll
{
  self->_BOOL immediateCharge = 0;
  lastScheduledFullChargeNotificationID = self->_lastScheduledFullChargeNotificationID;
  self->_lastScheduledFullChargeNotificationID = 0;

  defaults = self->_defaults;
  [(NSUserDefaults *)defaults removeObjectForKey:@"immediateCharge"];
}

+ (id)chargeLimitRecommendationContentWithLimit:(unint64_t)a3
{
  BOOL v4 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  id v5 = [MEMORY[0x263F086E0] bundleWithURL:v4];
  id v6 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v7 = [v5 localizedStringForKey:@"CHARGE_LIMIT_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
  [v6 setTitle:v7];

  [v6 setCategoryIdentifier:@"chargeRecommendationCategory"];
  [v6 setShouldIgnoreDowntime:1];
  [v6 setShouldIgnoreDoNotDisturb:1];
  [v6 setShouldHideDate:1];
  [v6 setShouldSuppressScreenLightUp:1];
  id v8 = [MEMORY[0x263F1DF40] iconNamed:@"battery-rcl"];
  [v6 setIcon:v8];

  [v6 setShouldBackgroundDefaultAction:1];
  uint64_t v9 = [NSURL URLWithString:@"prefs:root=BATTERY_USAGE&path=CHARGING_TITLE"];
  [v6 setDefaultActionURL:v9];

  uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:172800.0];
  [v6 setExpirationDate:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
  [v11 setLocale:v12];

  [v11 setNumberStyle:3];
  [v11 setMaximumFractionDigits:0];
  [v11 setMultiplier:&unk_26D385240];
  id v13 = NSString;
  long long v14 = [v5 localizedStringForKey:@"CHARGE_LIMIT_RECOMMENDATION" value:&stru_26D3439E8 table:@"Localizable"];
  long long v15 = [NSNumber numberWithUnsignedInteger:a3];
  long long v16 = [v11 stringFromNumber:v15];
  id v17 = objc_msgSend(v13, "stringWithFormat:", v14, v16);
  [v6 setBody:v17];

  return v6;
}

+ (id)chargeLimitRecommendationRequestWithLimit:(unint64_t)a3
{
  id v3 = +[PowerUINotificationManager chargeLimitRecommendationContentWithLimit:a3];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"recommendedLimitRequest" content:v3 trigger:0];
    [v4 setDestinations:2];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)postChargeLimitRecommendationWithLimit:(unint64_t)a3
{
  BOOL v4 = +[PowerUINotificationManager chargeLimitRecommendationRequestWithLimit:a3];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v4 withCompletionHandler:0];
  id v5 = [v4 identifier];

  return v5;
}

- (id)postCECEngagedNotificationWithDate:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Posting CEC Engaged notification", v17, 2u);
  }
  id v6 = +[PowerUISmartChargeUtilities roundedDateFromDate:v4];
  id v7 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v8 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  uint64_t v9 = [MEMORY[0x263F086E0] bundleWithURL:v8];
  uint64_t v10 = [v9 localizedStringForKey:@"CEC_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
  [v7 setTitle:v10];

  id v11 = +[PowerUINotificationManager pausedNotificationContentFromDate:v6 bundle:v9];
  [v7 setBody:v11];

  [v7 setShouldIgnoreDowntime:1];
  [v7 setShouldIgnoreDoNotDisturb:1];
  [v7 setShouldHideDate:1];
  [v7 setShouldSuppressScreenLightUp:1];
  [v7 setCategoryIdentifier:@"cecEngagedCategory"];
  uint64_t v12 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
  [v7 setIcon:v12];

  id v13 = [NSURL URLWithString:@"prefs:root=BATTERY_USAGE"];
  [v7 setDefaultActionURL:v13];

  [v7 setShouldPreventNotificationDismissalAfterDefaultAction:1];
  [v7 setExpirationDate:v6];
  long long v14 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"cec-pausedCharging" content:v7 trigger:0];
  [v14 setDestinations:2];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v14 withCompletionHandler:0];
  long long v15 = [v14 identifier];

  return v15;
}

- (id)postCECFirstTimeNotification
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Posting First time notification", buf, 2u);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
  id v6 = [MEMORY[0x263F086E0] bundleWithURL:v5];
  id v7 = [v6 localizedStringForKey:@"CEC_FEATURE_TITLE" value:&stru_26D3439E8 table:@"Localizable"];
  [v4 setTitle:v7];

  id v8 = [v6 localizedStringForKey:@"CEC_FEATURE_FIRST_TIME" value:&stru_26D3439E8 table:@"Localizable"];
  [v4 setBody:v8];

  [v4 setShouldIgnoreDowntime:1];
  [v4 setShouldIgnoreDoNotDisturb:1];
  [v4 setShouldHideDate:1];
  [v4 setShouldSuppressScreenLightUp:1];
  uint64_t v9 = [NSURL URLWithString:@"prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH"];
  [v4 setDefaultActionURL:v9];

  [v4 setShouldPreventNotificationDismissalAfterDefaultAction:1];
  [v4 setCategoryIdentifier:@"cecFirstTimeCategory"];
  uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:28800.0];
  [v4 setExpirationDate:v10];

  id v11 = NSString;
  uint64_t v12 = [MEMORY[0x263EFF910] date];
  id v13 = [v11 stringWithFormat:@"cec-FirstTime-%@", v12];

  long long v14 = [MEMORY[0x263F1DF48] requestWithIdentifier:v13 content:v4 trigger:0];
  [v14 setDestinations:2];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v14 withCompletionHandler:0];
  long long v15 = [v14 identifier];

  return v15;
}

- (void)removeCECPausedNotification
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Timeout waiting for delivered notification", v2, v3, v4, v5, v6);
}

void __57__PowerUINotificationManager_removeCECPausedNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v23;
    *(void *)&long long v4 = 138412290;
    long long v20 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "request", v20);
        uint64_t v10 = [v9 content];
        id v11 = [v10 categoryIdentifier];
        int v12 = [v11 isEqual:@"cecEngagedCategory"];

        if (v12)
        {
          id v13 = *(NSObject **)(*(void *)(a1 + 32) + 16);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v14 = v13;
            long long v15 = [v8 request];
            long long v16 = [v15 identifier];
            *(_DWORD *)buf = v20;
            v27 = v16;
            _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);
          }
          id v17 = *(void **)(a1 + 40);
          uint64_t v18 = [v8 request];
          uint64_t v19 = [v18 identifier];
          [v17 addObject:v19];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removeCECNotifications
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Timeout waiting for delivered notifications", v2, v3, v4, v5, v6);
}

void __52__PowerUINotificationManager_removeCECNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a2;
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v4 = *(void *)v29;
    uint64_t v5 = @"cecEngagedCategory";
    *(void *)&long long v3 = 138412290;
    long long v23 = v3;
    uint64_t v24 = *(void *)v29;
    uint64_t v25 = a1;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "request", v23);
        uint64_t v9 = [v8 content];
        uint64_t v10 = [v9 categoryIdentifier];
        if ([v10 isEqual:v5])
        {
        }
        else
        {
          id v11 = [v7 request];
          [v11 content];
          id v13 = v12 = v5;
          long long v14 = [v13 categoryIdentifier];
          int v15 = [v14 isEqual:@"cecFirstTimeCategory"];

          uint64_t v5 = v12;
          uint64_t v4 = v24;
          a1 = v25;

          if (!v15) {
            continue;
          }
        }
        long long v16 = *(NSObject **)(*(void *)(a1 + 32) + 16);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          uint64_t v18 = [v7 request];
          uint64_t v19 = [v18 identifier];
          *(_DWORD *)buf = v23;
          v33 = v19;
          _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);
        }
        long long v20 = *(void **)(a1 + 40);
        id v21 = [v7 request];
        long long v22 = [v21 identifier];
        [v20 addObject:v22];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v12 = log;
    id v13 = [v9 actionIdentifier];
    int v21 = 138412290;
    long long v22 = v13;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_INFO, "notification request coming in: %@", (uint8_t *)&v21, 0xCu);
  }
  long long v14 = [v9 actionIdentifier];
  int v15 = [v14 isEqualToString:@"fullCharge"];

  if (v15)
  {
    long long v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "User requested immediate charge.", (uint8_t *)&v21, 2u);
    }
    id v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL immediateCharge = self->_immediateCharge;
      int v21 = 67109120;
      LODWORD(v22) = immediateCharge;
      _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "ImmediateCharge %d", (uint8_t *)&v21, 8u);
    }
    self->_BOOL immediateCharge = 1;
    [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"immediateCharge"];
  }
  [(PowerUINotificationManager *)self handleLocationFailures:v9];
  uint64_t v19 = +[PowerUICECManager manager];
  [v19 handleNotificationResponse:v9];

  long long v20 = +[PowerUISmartChargeManager manager];
  [v20 handleNotificationResponse:v9];

  v10[2](v10);
}

- (BOOL)internalCECNotificationsDisabled
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.cec"];
  long long v3 = [v2 objectForKey:@"testDisableInternalNotifications"];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)postInternalCECNotificationForChargingDates:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(PowerUINotificationManager *)self internalCECNotificationsDisabled]
    && [v4 count])
  {
    long long v28 = self;
    id v5 = objc_alloc_init(MEMORY[0x263F1DEF0]);
    uint8_t v6 = [NSString localizedUserNotificationStringForKey:@"[CEC INTERNAL]" arguments:0];
    uint64_t v27 = v5;
    [v5 setTitle:v6];

    id v7 = [v4 objectAtIndexedSubscript:0];
    id v8 = [v4 objectAtIndexedSubscript:0];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v29 = v4;
    id obj = v4;
    uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v34)
    {
      int v9 = 0;
      uint64_t v32 = *(void *)v36;
      uint64_t v10 = @"Cleaner Electricity windows: ";
      do
      {
        uint64_t v11 = 0;
        int v30 = v9;
        uint64_t v31 = v9 + 1;
        int v12 = v8;
        do
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
          [v13 timeIntervalSinceDate:v12];
          if (v14 > 900.0 || v31 + v11 == [obj count])
          {
            int v15 = [MEMORY[0x263F08790] localizedStringFromDate:v7 dateStyle:0 timeStyle:1];
            long long v16 = (void *)MEMORY[0x263F08790];
            id v17 = [MEMORY[0x263EFF910] dateWithTimeInterval:v12 sinceDate:900.0];
            uint64_t v18 = [v16 localizedStringFromDate:v17 dateStyle:0 timeStyle:1];

            uint64_t v19 = [NSString stringWithFormat:@"%@-%@", v15, v18];
            uint64_t v20 = [NSString stringWithFormat:@"%@ %@", v10, v19];

            id v21 = v13;
            uint64_t v10 = (__CFString *)v20;
            id v7 = v21;
          }
          id v8 = v13;

          ++v11;
          int v12 = v8;
        }
        while (v34 != v11);
        int v9 = v34 + v30;
        uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v34);
    }
    else
    {
      uint64_t v10 = @"Cleaner Electricity windows: ";
    }

    [v27 setBody:v10];
    long long v22 = (void *)MEMORY[0x263F1DF40];
    uint64_t v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v24 = [v23 pathForResource:@"leaf.circle@2x" ofType:@"png"];
    uint64_t v25 = [v22 iconAtPath:v24];
    [v27 setIcon:v25];

    [v27 setShouldIgnoreDoNotDisturb:1];
    [v27 setCategoryIdentifier:@"cecEngagedCategory"];
    v26 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"emissionChargingDates" content:v27 trigger:0];
    [(UNUserNotificationCenter *)v28->_unCenter addNotificationRequest:v26 withCompletionHandler:0];

    id v4 = v29;
  }
}

- (void)postInternalNotificationAtDate:(id)a3 withTitle:(id)a4 withTextContent:(id)a5 icon:(id)a6 url:(id)a7 expirationDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    id v29 = self;
    id v20 = objc_alloc_init(MEMORY[0x263F1DEF0]);
    [v20 setCategoryIdentifier:@"powerUIInternal"];
    id v21 = [NSString localizedUserNotificationStringForKey:v15 arguments:0];
    [v20 setTitle:v21];

    [v20 setBody:v16];
    if (v17) {
      [v20 setIcon:v17];
    }
    if (v19) {
      [v20 setExpirationDate:v19];
    }
    if (v18) {
      [v20 setDefaultActionURL:v18];
    }
    [v14 timeIntervalSinceNow];
    if (v22 <= 0.0)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x263F1DFA8];
      [v14 timeIntervalSinceNow];
      uint64_t v24 = objc_msgSend(v23, "triggerWithTimeInterval:repeats:", 0);
    }
    uint64_t v25 = NSString;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    uint64_t v27 = objc_msgSend(v25, "stringWithFormat:", @"com.apple.powerui-internal-notification:%lf", v26);
    long long v28 = [MEMORY[0x263F1DF48] requestWithIdentifier:v27 content:v20 trigger:v24];
    [v28 setDestinations:15];
    [(UNUserNotificationCenter *)v29->_unCenter addNotificationRequest:v28 withCompletionHandler:0];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT))
  {
    -[PowerUINotificationManager postInternalNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:]();
  }
}

- (id)postInternalCECNotificationWithID:(id)a3 chargingStatus:(BOOL)a4 information:(id)a5 shouldReplace:(BOOL)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if ([(PowerUINotificationManager *)self internalCECNotificationsDisabled])
  {
    int v12 = 0;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263F1DEF0]);
    id v14 = @"Charging On Hold";
    if (v8) {
      id v14 = @"Charging Now";
    }
    id v15 = [NSString stringWithFormat:@"%@ %@", @"[CEC Internal]", v14];
    [v13 setBody:v11];
    id v16 = [NSString localizedUserNotificationStringForKey:v15 arguments:0];
    [v13 setTitle:v16];

    id v17 = (void *)MEMORY[0x263F1DF40];
    id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v19 = [v18 pathForResource:@"leaf.circle@2x" ofType:@"png"];
    id v20 = [v17 iconAtPath:v19];
    [v13 setIcon:v20];

    [v13 setShouldIgnoreDoNotDisturb:1];
    [v13 setCategoryIdentifier:@"cecEngagedCategory"];
    if (v8) {
      [v13 setAccessoryImageName:@"bolt.fill"];
    }
    if (!a6)
    {
      id v21 = NSString;
      double v22 = [MEMORY[0x263EFF910] date];
      uint64_t v23 = [v21 stringWithFormat:@"%@-%@", v10, v22];

      id v10 = (id)v23;
    }
    uint64_t v24 = [MEMORY[0x263F1DF48] requestWithIdentifier:v10 content:v13 trigger:0];
    [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v24 withCompletionHandler:0];
    int v12 = [v24 identifier];
  }
  return v12;
}

- (id)contentForInternalDurationPredictionWithDuration:(double)a3 withConfidence:(double)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  BOOL v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  int v9 = [MEMORY[0x263F08790] localizedStringFromDate:v8 dateStyle:1 timeStyle:1];
  id v10 = [NSString stringWithFormat:@"[Internal]\nPredicted to be plugged in for %d hours and %d minutes - plugout at %@ with confidence %.2f", ((int)a3 / 3600), (int)(((__int16)((34953 * ((int)a3 % 3600)) >> 16) >> 5)+ ((((int)a3 % 3600 + ((-30583 * ((int)a3 % 3600)) >> 16)) & 0x8000) >> 15)), v9, *(void *)&a4];
  id v11 = +[PowerUISmartChargeUtilities batteryLevelHistogramAroundTime:0 withDelta:7200.0 withOffset:7200.0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v11;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Histogram at plugin: %@", buf, 0xCu);
  }
  id v13 = [v11 objectForKeyedSubscript:&unk_26D385258];
  [v13 doubleValue];
  double v15 = v14;

  if (v15 <= 0.1)
  {
    id v17 = [v11 objectForKeyedSubscript:&unk_26D385270];
    [v17 doubleValue];
    double v19 = v18;

    if (v19 <= 0.4) {
      goto LABEL_8;
    }
    id v16 = @"\nThis could be treated as a long charge.";
  }
  else
  {
    id v16 = @"\nThis could be treated as an emergency charge.";
  }
  uint64_t v20 = [v10 stringByAppendingString:v16];

  id v10 = (void *)v20;
LABEL_8:
  id v21 = @"Medium Length Charge Session Predicted";
  if (a3 > 19800.0) {
    id v21 = @"Long Charge Session Predicted";
  }
  if (a3 < 5400.0) {
    id v21 = @"Short Charge Session Predicted";
  }
  double v22 = [NSString stringWithFormat:@"%@", v21];
  [v7 setBody:v10];
  uint64_t v23 = [NSString localizedUserNotificationStringForKey:v22 arguments:0];
  [v7 setTitle:v23];

  [v7 setShouldIgnoreDowntime:1];
  [v7 setShouldIgnoreDoNotDisturb:1];
  [v7 setShouldHideDate:0];
  [v7 setShouldSuppressScreenLightUp:1];
  [v7 setCategoryIdentifier:@"chargingIntelligence"];
  [v7 setExpirationDate:v8];
  uint64_t v24 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
  [v7 setIcon:v24];

  return v7;
}

- (void)postInternalChargeDurationNotificationWithDuration:(double)a3 withConfidence:(double)a4
{
  uint64_t v5 = [(PowerUINotificationManager *)self contentForInternalDurationPredictionWithDuration:a3 withConfidence:a4];
  if (v5)
  {
    uint8_t v6 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"charging-intelligence-notification" content:v5 trigger:0];
    if (v6)
    {
      [(PowerUINotificationManager *)self cancelNotificationRequestWithIdentifier:@"charging-intelligence-notification"];
      [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v6 withCompletionHandler:0];
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)postInternalChargingIntelligenceNotificationWithChargingStatus:(BOOL)a3 information:(id)a4 url:(id)a5 validUntil:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  [(PowerUINotificationManager *)self cancelNotificationRequestWithIdentifier:@"charging-intelligence-notification"];
  id v12 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v13 = [NSString stringWithFormat:@"%@\n%@", @"[Charging Intelligence Internal]", &stru_26D3439E8];
  [v12 setBody:v11];

  double v14 = [NSString localizedUserNotificationStringForKey:v13 arguments:0];
  [v12 setTitle:v14];

  [v12 setShouldIgnoreDowntime:1];
  [v12 setShouldIgnoreDoNotDisturb:1];
  [v12 setShouldHideDate:0];
  [v12 setShouldSuppressScreenLightUp:1];
  [v12 setCategoryIdentifier:@"chargingIntelligence"];
  [v12 setExpirationDate:v10];

  double v15 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
  [v12 setIcon:v15];

  if (v9) {
    [v12 setDefaultActionURL:v9];
  }
  id v16 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"charging-intelligence-notification" content:v12 trigger:0];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v16 withCompletionHandler:0];
  id v17 = [v16 identifier];

  return v17;
}

- (void)handleLocationFailures:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 notification];
  uint8_t v6 = [v5 request];
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:@"com.apple.powerui.note.location"];

  if (!v8) {
    goto LABEL_10;
  }
  id v9 = [v4 actionIdentifier];
  if ([v9 isEqualToString:@"yesAction"])
  {

LABEL_5:
    id v12 = [v4 actionIdentifier];
    int v13 = [v12 isEqualToString:@"noAction"];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      double v15 = &stru_26D3439E8;
      if (v13) {
        double v15 = @" not";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v15;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_INFO, "User has%@ charged here before.", buf, 0xCu);
    }
    v20[5] = MEMORY[0x263EF8330];
    v20[6] = 3221225472;
    v20[7] = __53__PowerUINotificationManager_handleLocationFailures___block_invoke;
    v20[8] = &__block_descriptor_33_e19___NSDictionary_8__0l;
    char v21 = v13;
    AnalyticsSendEventLazy();
    goto LABEL_10;
  }
  id v10 = [v4 actionIdentifier];
  int v11 = [v10 isEqualToString:@"noAction"];

  if (v11) {
    goto LABEL_5;
  }
  id v16 = [v4 actionIdentifier];
  int v17 = [v16 isEqualToString:@"poweruiTTR"];

  if (v17)
  {
    double v18 = [MEMORY[0x263F01880] defaultWorkspace];
    double v19 = [(PowerUINotificationManager *)self ttrURLforLocationFailure];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2;
    v20[3] = &unk_2645A5F58;
    void v20[4] = self;
    [v18 openURL:v19 configuration:0 completionHandler:v20];
  }
LABEL_10:
}

id __53__PowerUINotificationManager_handleLocationFailures___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"Correct";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

void __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
}

- (id)ttrURLforLocationFailure
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v3 = [NSString stringWithFormat:@"tap-to-radar://new?Title=OBC Location Error&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=If you have charged here in the past, could you describe how recently and general frequency of charge sessions that are at least one hour long?"];
  id v4 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  id v6 = [NSURL URLWithString:v5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (void)postInternalLocationFailureNotification
{
  id v6 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v6 setTitle:@"Have you charged here in the last month?"];
  [v6 setBody:@"Help your fellow engineers! Please long-press this notification and consider filing a radar (or select 'Yes') if you've charged at this (physical) location in the last month for at least an hour, or 'No' if this is the first time or you typically charge here very briefly."];
  [v6 setShouldIgnoreDowntime:1];
  [v6 setShouldIgnoreDoNotDisturb:1];
  [v6 setShouldHideDate:0];
  [v6 setShouldSuppressScreenLightUp:0];
  [v6 setCategoryIdentifier:@"yesNoCategory"];
  long long v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:28800.0];
  [v6 setExpirationDate:v3];

  id v4 = [MEMORY[0x263F1DF40] iconForSystemImageNamed:@"bolt.fill"];
  [v6 setIcon:v4];

  id v5 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"com.apple.powerui.note.location" content:v6 trigger:0];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v5 withCompletionHandler:0];
}

- (void)cancelNotificationRequestWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  unCenter = self->_unCenter;
  v11[0] = a3;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:v11 count:1];
  [(UNUserNotificationCenter *)unCenter removeDeliveredNotificationsWithIdentifiers:v7];

  int v8 = self->_unCenter;
  id v10 = v6;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  [(UNUserNotificationCenter *)v8 removePendingNotificationRequestsWithIdentifiers:v9];
}

- (BOOL)immediateCharge
{
  return self->_immediateCharge;
}

- (void)setImmediateCharge:(BOOL)a3
{
  self->_BOOL immediateCharge = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
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

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
}

- (NSString)lastScheduledFullChargeNotificationID
{
  return self->_lastScheduledFullChargeNotificationID;
}

- (void)setLastScheduledFullChargeNotificationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScheduledFullChargeNotificationID, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)currentOBCEngagedNotification
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "UIKit Error: Timeout on delivered notifications", v2, v3, v4, v5, v6);
}

- (void)getDeliveredNotifications
{
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_22135E000, v0, OS_LOG_TYPE_FAULT, "Error: Timeout occurred to obtain delivered notifications", v1, 2u);
}

- (void)postInternalNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_22135E000, v0, OS_LOG_TYPE_FAULT, "Internal method called on non-internal build", v1, 2u);
}

void __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Error when opening TTR URL: %@", (uint8_t *)&v2, 0xCu);
}

@end