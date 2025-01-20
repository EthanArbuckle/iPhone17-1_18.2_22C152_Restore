@interface PowerUILPMNotifier
+ (id)sharedInstance;
- (PowerUILPMNotifier)init;
- (id)autoDisabledNotificationRequest;
- (void)displayAutoDisabledNotification;
- (void)displayFirstUseNotification;
- (void)removeAutoDisabledNotification;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PowerUILPMNotifier

- (PowerUILPMNotifier)init
{
  v15.receiver = self;
  v15.super_class = (Class)PowerUILPMNotifier;
  v2 = [(PowerUILPMNotifier *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.lpm.firstusenotifyqueue", 0);
    firstUseQueue = v2->_firstUseQueue;
    v2->_firstUseQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PowerUI.framework"];
    uint64_t v6 = [MEMORY[0x263F086E0] bundleWithURL:v5];
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.powerui.lowpowermode"];
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v8;

    [(UNUserNotificationCenter *)v2->_userNotificationCenter setWantsNotificationResponsesDelivered];
    [(UNUserNotificationCenter *)v2->_userNotificationCenter setDelegate:v2];
    notify_register_check("com.apple.system.lowpowermode", &v2->_bsmToken);
    int out_token = 0;
    v10 = v2->_firstUseQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __26__PowerUILPMNotifier_init__block_invoke;
    v12[3] = &unk_2645A5CA8;
    v13 = v2;
    notify_register_dispatch("com.apple.powerui.testdisplayautodisablednotification", &out_token, v10, v12);
  }
  return v2;
}

uint64_t __26__PowerUILPMNotifier_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayAutoDisabledNotification];
}

- (void)displayAutoDisabledNotification
{
  id v3 = [(PowerUILPMNotifier *)self autoDisabledNotificationRequest];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v3 withCompletionHandler:0];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_notifier;
  return v2;
}

uint64_t __36__PowerUILPMNotifier_sharedInstance__block_invoke()
{
  sharedInstance_notifier = objc_alloc_init(PowerUILPMNotifier);
  return MEMORY[0x270F9A758]();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v12 = a4;
  uint64_t v6 = (void (**)(void))a5;
  uint64_t v7 = [v12 actionIdentifier];
  if (!v7
    || (uint64_t v8 = (void *)v7,
        [v12 actionIdentifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 compare:@"reenable"],
        v9,
        v8,
        v10))
  {
    if (!v6) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v11 = [MEMORY[0x263F52788] sharedInstance];
  [v11 setPowerMode:1 fromSource:*MEMORY[0x263F52798]];

  if (v6) {
LABEL_4:
  }
    v6[2](v6);
LABEL_5:
}

- (id)autoDisabledNotificationRequest
{
  id v2 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v3 = [NSString localizedUserNotificationStringForKey:@"AUTO_DISABLE_TITLE" arguments:0];
  [v2 setTitle:v3];

  v4 = [NSString localizedUserNotificationStringForKey:@"AUTO_DISABLE_BODY" arguments:0];
  [v2 setBody:v4];

  [v2 setCategoryIdentifier:@"auto-disable"];
  v5 = [NSURL URLWithString:@"prefs:root=BATTERY_USAGE"];
  [v2 setDefaultActionURL:v5];

  uint64_t v6 = (void *)MEMORY[0x263F1DF48];
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  uint64_t v8 = [v7 UUIDString];
  v9 = [v6 requestWithIdentifier:v8 content:v2 trigger:0];

  return v9;
}

- (void)removeAutoDisabledNotification
{
  if (notify_is_valid_token(self->_bsmToken))
  {
    uint64_t state64 = 0;
    if (notify_get_state(self->_bsmToken, &state64)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = state64 == 0;
    }
    if (!v3) {
      [(UNUserNotificationCenter *)self->_userNotificationCenter removeAllDeliveredNotifications];
    }
  }
}

- (void)displayFirstUseNotification
{
  firstUseQueue = self->_firstUseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PowerUILPMNotifier_displayFirstUseNotification__block_invoke;
  block[3] = &unk_2645A5CF0;
  block[4] = self;
  dispatch_async(firstUseQueue, block);
}

void __49__PowerUILPMNotifier_displayFirstUseNotification__block_invoke(uint64_t a1)
{
  id v2 = (void *)os_transaction_create();
  CFOptionFlags v5 = 0;
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 24) localizedStringForKey:@"FIRST_NOTIFY_BODY" value:&stru_26D3439E8 table:@"PowerUI"];
  CFUserNotificationDisplayAlert(0.0, 0x40uLL, 0, 0, 0, (CFStringRef)[*(id *)(*(void *)(a1 + 32) + 24) localizedStringForKey:@"FIRST_NOTIFY_TITLE" value:&stru_26D3439E8 table:@"PowerUI"], v3, (CFStringRef)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "localizedStringForKey:value:table:", @"FIRST_NOTIFY_CONTINUE", &stru_26D3439E8, @"PowerUI"), (CFStringRef)objc_msgSend(
                   *(id *)(*(void *)(a1 + 32) + 24),
                   "localizedStringForKey:value:table:",
                   @"FIRST_NOTIFY_CANCEL",
                   &stru_26D3439E8,
                   @"PowerUI"),
    0,
    &v5);
  if (v5)
  {
    v4 = [MEMORY[0x263F52788] sharedInstance];
    [v4 setPowerMode:0 fromSource:*MEMORY[0x263F52798]];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_firstUseQueue, 0);
}

@end