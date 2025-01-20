@interface NTKSignificantTimeChangeLogger
+ (id)sharedInstance;
+ (void)beginLogging;
- (NTKSignificantTimeChangeLogger)init;
- (void)_handleNotification:(id)a3;
- (void)_logNotificationReceiptWithName:(id)a3;
- (void)_startObserving;
@end

@implementation NTKSignificantTimeChangeLogger

+ (void)beginLogging
{
  id v2 = (id)[a1 sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18 != -1) {
    dispatch_once(&sharedInstance_onceToken_18, &__block_literal_global_125);
  }
  id v2 = (void *)sharedInstance___sharedInstance_5;

  return v2;
}

void __48__NTKSignificantTimeChangeLogger_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_5;
  sharedInstance___sharedInstance_5 = v0;
}

- (NTKSignificantTimeChangeLogger)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSignificantTimeChangeLogger;
  id v2 = [(NTKSignificantTimeChangeLogger *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NTKSignificantTimeChangeLogger *)v2 _startObserving];
  }
  return v3;
}

- (void)_handleNotification:(id)a3
{
  id v4 = [a3 name];
  [(NTKSignificantTimeChangeLogger *)self _logNotificationReceiptWithName:v4];
}

- (void)_logNotificationReceiptWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "SignificantTimeChangeLogger %p received notification: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_startObserving
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    __int16 v8 = self;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "SignificantTimeChangeLogger %p began logging", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handleNotification_ name:*MEMORY[0x1E4FB2708] object:0];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__handleNotification_ name:*MEMORY[0x1E4F1C2E0] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleSignificantTimeChangeNotification, @"SignificantTimeChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
}

@end