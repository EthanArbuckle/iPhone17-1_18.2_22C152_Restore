@interface _RESignificantTimeChangeNotifier
+ (id)sharedInstance;
- (_RESignificantTimeChangeNotifier)init;
- (void)_notify;
- (void)dealloc;
@end

@implementation _RESignificantTimeChangeNotifier

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_Notifier;
  return v2;
}

- (_RESignificantTimeChangeNotifier)init
{
  v18.receiver = self;
  v18.super_class = (Class)_RESignificantTimeChangeNotifier;
  v2 = [(_RESignificantTimeChangeNotifier *)&v18 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __40___RESignificantTimeChangeNotifier_init__block_invoke;
    v15 = &unk_2644BC638;
    objc_copyWeak(&v16, &location);
    uint64_t v5 = +[REUpNextScheduler schedulerWithQueue:v3 delay:&v12 updateBlock:0.05];
    scheduler = v2->_scheduler;
    v2->_scheduler = (REUpNextScheduler *)v5;

    v7 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v12, v13, v14, v15);
    [v7 addObserver:v2->_scheduler selector:sel_schedule name:*MEMORY[0x263EFF3C8] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2->_scheduler selector:sel_schedule name:*MEMORY[0x263EFF5C8] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2->_scheduler selector:sel_schedule name:*MEMORY[0x263EFF5D0] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2->_scheduler, (CFNotificationCallback)_significantTimeChangeForScheduler, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_scheduler];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self->_scheduler, @"SignificantTimeChangeNotification", 0);
  v5.receiver = self;
  v5.super_class = (Class)_RESignificantTimeChangeNotifier;
  [(_RESignificantTimeChangeNotifier *)&v5 dealloc];
}

- (void)_notify
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"RESignificantTimeChangeNotification" object:0];
}

- (void).cxx_destruct
{
}

@end