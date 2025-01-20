@interface AXVisualAlertSBNCSoundController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)playSoundAndReadOutForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)stopSoundForNotificationRequest:(id)a3;
@end

@implementation AXVisualAlertSBNCSoundController

+ (id)safeCategoryTargetClassName
{
  return @"SBNCSoundController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCSoundController", @"playSoundAndReadOutForNotificationRequest:presentingDestination:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCSoundController", @"stopSoundForNotificationRequest:", "v", "@", 0);
}

- (void)playSoundAndReadOutForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXVisualAlertSBNCSoundController;
  [(AXVisualAlertSBNCSoundController *)&v8 playSoundAndReadOutForNotificationRequest:v6 presentingDestination:a4];
  id v7 = v6;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __100__AXVisualAlertSBNCSoundController_playSoundAndReadOutForNotificationRequest_presentingDestination___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) sectionIdentifier];
  id v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    v5 = [MEMORY[0x263F22988] identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      objc_super v8 = AXColorizeFormatLog();
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v24 = *(void *)(a1 + 32);
      v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  v10 = +[AXVisualAlertManager sharedVisualAlertManager];
  v11 = [v10 existingBulletinForBulletin:*(void *)(a1 + 32)];

  if ([v11 _accessibilityBoolValueForKey:@"AXTurnedOnScreen"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"com.apple.springboard.SBDismissOnlyAlertItem"])
      {
        v12 = [MEMORY[0x263F22988] sharedInstance];
        char v13 = [v12 ignoreLogging];

        if ((v13 & 1) == 0)
        {
          v14 = [MEMORY[0x263F22988] identifier];
          v15 = AXLoggerForFacility();

          os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v15, v16))
          {
            v17 = AXColorizeFormatLog();
            v18 = _AXStringForArgs();
            if (os_log_type_enabled(v15, v16))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v18;
LABEL_18:
              _os_log_impl(&dword_22D39A000, v15, v16, "%{public}@", buf, 0xCu);
              goto LABEL_19;
            }
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
      else if ([v2 isEqualToString:@"com.apple.MobileSMS"])
      {
        [(id)_VisualAlertManager _handleVisualAlertForIncomingMessage];
      }
      else if ([v2 isEqualToString:@"com.apple.mobiletimer"])
      {
        [(id)_VisualAlertManager _handleBeginVisualAlertForAlarmWithSound:1];
      }
      else if (([v2 isEqualToString:@"com.apple.mobilephone"] & 1) == 0 {
             && ([v2 isEqualToString:@"com.apple.facetime"] & 1) == 0)
      }
      {
        [(id)_VisualAlertManager _handleVisualAlertForRegularNotification:v2];
      }
    }
  }
  else
  {
    v19 = [MEMORY[0x263F22988] sharedInstance];
    char v20 = [v19 ignoreLogging];

    if ((v20 & 1) == 0)
    {
      v21 = [MEMORY[0x263F22988] identifier];
      v15 = AXLoggerForFacility();

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = AXColorizeFormatLog();
        v18 = _AXStringForArgs();
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          goto LABEL_18;
        }
LABEL_19:
      }
LABEL_20:
    }
  }
  v22 = +[AXVisualAlertManager sharedVisualAlertManager];
  [v22 removeBulletin:*(void *)(a1 + 32)];
}

- (void)stopSoundForNotificationRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AXVisualAlertSBNCSoundController;
  id v4 = a3;
  [(AXVisualAlertSBNCSoundController *)&v13 stopSoundForNotificationRequest:v4];
  v5 = [v4 sectionIdentifier];

  id v6 = [MEMORY[0x263F22988] sharedInstance];
  char v7 = [v6 ignoreLogging];

  if ((v7 & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x263F22988] identifier];
    v9 = AXLoggerForFacility();

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = AXColorizeFormatLog();
      sel_getName(a2);
      v12 = _AXStringForArgs();
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_22D39A000, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v5 isEqualToString:@"com.apple.mobiletimer"])
  {
    [(id)_VisualAlertManager _handleEndVisualAlertForAlarm];
  }
}

@end