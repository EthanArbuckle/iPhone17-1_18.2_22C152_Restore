@interface WFEnterpriseJoinPromptOperation
+ (id)enterpriseJoinPromptOperationWithDeviceCapability:(int64_t)a3;
- (NSString)password;
- (NSString)username;
- (__SecIdentity)TLSIdentity;
@end

@implementation WFEnterpriseJoinPromptOperation

+ (id)enterpriseJoinPromptOperationWithDeviceCapability:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = WFLogForCategory(3uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v21 = 136315394;
    v22 = "+[WFEnterpriseJoinPromptOperation enterpriseJoinPromptOperationWithDeviceCapability:]";
    __int16 v23 = 2048;
    int64_t v24 = a3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: creating enterprise prompt with capability %ld", (uint8_t *)&v21, 0x16u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int IsChinaDevice = WFCapabilityIsChinaDevice();
  v8 = @"kWFLocEnterpriseJoinAlertTitle";
  if (IsChinaDevice) {
    v8 = @"kWFLocEnterpriseJoinAlertTitle_CH";
  }
  v9 = (void *)MEMORY[0x263F086E0];
  v10 = v8;
  v11 = [v9 bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:v10 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];

  [v6 setObject:v12 forKey:*MEMORY[0x263EFFFC8]];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"kWFLocEnterpriseJoinAlertBody" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v6 setObject:v14 forKey:*MEMORY[0x263EFFFD8]];

  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"kWFLocEnterpriseJoinAlertButtonOk" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v6 setObject:v16 forKey:*MEMORY[0x263F00000]];

  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"kWFLocEnterpriseJoinAlertButtonCancel" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
  [v6 setObject:v18 forKey:*MEMORY[0x263EFFFE8]];

  [v6 setObject:MEMORY[0x263EFFA88] forKey:@"SBUserNotificationDismissOnLock"];
  [v6 setObject:&stru_26D9BFD58 forKey:@"SBUserNotificationAlertMessageDelimiterKey"];
  v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:v6 timeout:0 flags:0.0];

  return v19;
}

- (NSString)password
{
  return self->password;
}

- (NSString)username
{
  return self->username;
}

- (__SecIdentity)TLSIdentity
{
  return self->TLSIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->username, 0);
  objc_storeStrong((id *)&self->password, 0);
}

@end