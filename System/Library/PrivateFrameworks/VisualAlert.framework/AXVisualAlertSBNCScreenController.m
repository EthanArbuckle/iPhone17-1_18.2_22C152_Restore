@interface AXVisualAlertSBNCScreenController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)turnOnScreenForNotificationRequest:(id)a3;
@end

@implementation AXVisualAlertSBNCScreenController

+ (id)safeCategoryTargetClassName
{
  return @"SBNCScreenController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)turnOnScreenForNotificationRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F22988] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    v7 = [MEMORY[0x263F22988] identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = AXColorizeFormatLog();
      id v13 = v4;
      v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, @"AXTurnedOnScreen", v13);
  v12 = +[AXVisualAlertManager sharedVisualAlertManager];
  [v12 addBulletin:v4];

  v14.receiver = self;
  v14.super_class = (Class)AXVisualAlertSBNCScreenController;
  [(AXVisualAlertSBNCScreenController *)&v14 turnOnScreenForNotificationRequest:v4];
}

@end