@interface AXVisualAlertSBUIFlashlightController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_turnPowerOff;
- (void)_turnPowerOn;
- (void)setLevel:(unint64_t)a3;
@end

@implementation AXVisualAlertSBUIFlashlightController

+ (id)safeCategoryTargetClassName
{
  return @"SBUIFlashlightController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIFlashlightController", @"_turnPowerOff", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIFlashlightController", @"_turnPowerOn", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIFlashlightController", @"setLevel:", "v", "Q", 0);
}

- (void)setLevel:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AXVisualAlertSBUIFlashlightController;
  -[AXVisualAlertSBUIFlashlightController setLevel:](&v16, sel_setLevel_);
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
      unint64_t v15 = a3;
      v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  v12 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v15);
  v13 = v12;
  if (a3) {
    v14 = @"AXVisualAlertManagerControlCenterTorchWasEnabledNotification";
  }
  else {
    v14 = @"AXVisualAlertManagerControlCenterTorchWasDisabledNotification";
  }
  [v12 postNotificationName:v14 object:self];
}

- (void)_turnPowerOff
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)AXVisualAlertSBUIFlashlightController;
  [(AXVisualAlertSBUIFlashlightController *)&v11 _turnPowerOff];
  id v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"AXVisualAlertManagerControlCenterTorchWasDisabledNotification" object:self];
}

- (void)_turnPowerOn
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)AXVisualAlertSBUIFlashlightController;
  [(AXVisualAlertSBUIFlashlightController *)&v11 _turnPowerOn];
  id v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"AXVisualAlertManagerControlCenterTorchWasEnabledNotification" object:self];
}

@end