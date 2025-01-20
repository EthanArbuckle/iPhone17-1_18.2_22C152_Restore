@interface WFCarPlayDisablePromptOperation
+ (id)carPlayDisablePromptOperation;
@end

@implementation WFCarPlayDisablePromptOperation

+ (id)carPlayDisablePromptOperation
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"kWFLocCCDisableCarPlayAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v2 setObject:v4 forKey:*MEMORY[0x263EFFFC8]];

  WFCurrentDeviceCapability();
  LODWORD(v3) = WFCapabilityIsChinaDevice();
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v3) {
    v7 = @"kWFLocCCDisableCarPlayAlertMessageCH";
  }
  else {
    v7 = @"kWFLocCCDisableCarPlayAlertMessage";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v2 setObject:v8 forKey:*MEMORY[0x263EFFFD8]];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"kWFLocCCDisableCarPlayAlertCancelButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v2 setObject:v10 forKey:*MEMORY[0x263EFFFE8]];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"kWFLocCCDisableCarPlayAlertDisconnectButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v2 setObject:v12 forKey:*MEMORY[0x263F00000]];

  uint64_t v13 = MEMORY[0x263EFFA88];
  [v2 setObject:MEMORY[0x263EFFA88] forKey:@"SBUserNotificationDismissOnLock"];
  [v2 setObject:&stru_26D9BFD58 forKey:@"SBUserNotificationAlertMessageDelimiterKey"];
  [v2 setObject:v13 forKey:*MEMORY[0x263EFFFE0]];
  [v2 setObject:v13 forKey:@"SBUserNotificationForcesModalAlertAppearance"];
  [v2 setObject:v13 forKey:@"SBUserNotificationDisplayActionButtonOnLockScreen"];
  v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:v2 timeout:0.0];

  return v14;
}

@end