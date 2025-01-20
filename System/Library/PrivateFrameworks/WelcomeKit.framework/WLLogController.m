@interface WLLogController
+ (id)sharedLogger;
- (BOOL)_loggingEnabled;
- (WLLogController)init;
- (void)_reloadLogPreferences;
- (void)logMessageFromAddress:(void *)a3 withLevel:(unint64_t)a4 format:(id)a5 args:(char *)a6;
@end

@implementation WLLogController

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedLogger_instance;

  return v2;
}

uint64_t __31__WLLogController_sharedLogger__block_invoke()
{
  v0 = objc_alloc_init(WLLogController);
  sharedLogger_instance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

- (WLLogController)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLLogController;
  v2 = [(WLLogController *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_loggingUserDefaultsChangedNotificationHandler, @"com.apple.welcomekit.log.defaultschange", 0, CFNotificationSuspensionBehaviorCoalesce);
    [(WLLogController *)v2 _reloadLogPreferences];
    v4 = v2;
  }

  return v2;
}

- (BOOL)_loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)_reloadLogPreferences
{
  if (+[WLInternal isInternal])
  {
    self->_loggingEnabled = 1;
  }
  else
  {
    id v5 = (id)CFPreferencesCopyAppValue(@"LogToFile", @"com.apple.welcomekit");
    v3 = (void *)CFPreferencesCopyAppValue(@"LogToSyslog", @"com.apple.welcomekit");
    if ([v5 BOOLValue]) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 BOOLValue];
    }
    self->_loggingEnabled = v4;
  }
}

- (void)logMessageFromAddress:(void *)a3 withLevel:(unint64_t)a4 format:(id)a5 args:(char *)a6
{
  id v7 = a5;
  if (self->_loggingEnabled)
  {
    if (logMessageFromAddress_withLevel_format_args__onceToken != -1) {
      dispatch_once(&logMessageFromAddress_withLevel_format_args__onceToken, &__block_literal_global_13);
    }
    os_log_shim_with_CFString();
  }

  MEMORY[0x270F9A790]();
}

void __63__WLLogController_logMessageFromAddress_withLevel_format_args___block_invoke()
{
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_15);
  }
}

uint64_t __63__WLLogController_logMessageFromAddress_withLevel_format_args___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.welcomekit", "core");
  logMessageFromAddress_withLevel_format_args__log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

@end