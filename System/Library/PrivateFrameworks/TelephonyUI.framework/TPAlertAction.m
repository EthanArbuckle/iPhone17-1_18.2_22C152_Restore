@interface TPAlertAction
+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
+ (id)actionWithType:(unint64_t)a3;
+ (id)preferencesURLForClassName:(id)a3;
- (id)handler;
- (void)setHandler:(id)a3;
@end

@implementation TPAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TPAlertAction;
  id v7 = a5;
  v8 = objc_msgSendSuper2(&v10, sel_actionWithTitle_style_handler_, a3, a4, v7);
  objc_msgSend(v8, "setHandler:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)actionWithType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = TelephonyUIBundle();
      v4 = [v3 localizedStringForKey:@"ALERT_ACTION_TITLE_CANCEL" value:&stru_1F1E807C8 table:@"General"];
      v8 = v4;
      uint64_t v9 = 1;
      objc_super v10 = 0;
      goto LABEL_8;
    case 2uLL:
      v3 = TelephonyUIBundle();
      v4 = [v3 localizedStringForKey:@"ALERT_ACTION_TITLE_DISABLE_AIRPLANE_MODE" value:&stru_1F1E807C8 table:@"General"];
      objc_super v10 = &__block_literal_global;
      goto LABEL_7;
    case 3uLL:
      v3 = TelephonyUIBundle();
      v4 = [v3 localizedStringForKey:@"ALERT_ACTION_TITLE_CELLULAR_SETTINGS" value:&stru_1F1E807C8 table:@"General"];
      objc_super v10 = &__block_literal_global_22;
LABEL_7:
      v8 = v4;
      uint64_t v9 = 0;
LABEL_8:
      id v7 = +[TPAlertAction actionWithTitle:v8 style:v9 handler:v10];
      goto LABEL_11;
    case 4uLL:
    case 6uLL:
      v3 = TelephonyUIBundle();
      v4 = TUStringKeyForNetwork();
      v5 = [v3 localizedStringForKey:v4 value:&stru_1F1E807C8 table:@"General"];
      v6 = &__block_literal_global_40;
      goto LABEL_10;
    case 5uLL:
      v3 = TelephonyUIBundle();
      v4 = TUStringKeyForNetwork();
      v5 = [v3 localizedStringForKey:v4 value:&stru_1F1E807C8 table:@"General"];
      v6 = &__block_literal_global_51;
LABEL_10:
      id v7 = +[TPAlertAction actionWithTitle:v5 style:0 handler:v6];

LABEL_11:
      break;
    default:
      id v7 = 0;
      break;
  }
  return v7;
}

void __32__TPAlertAction_actionWithType___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  [v0 setAirplaneMode:0];
}

void __32__TPAlertAction_actionWithType___block_invoke_2()
{
  id v0 = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
  if (MGGetBoolAnswer())
  {
    v1 = [MEMORY[0x1E4F6C378] sharedInstance];
    int v2 = [v1 isDataSwitchEnabled];
    v3 = [MEMORY[0x1E4F61740] sharedInstance];
    v4 = TUPreferredFaceTimeBundleIdentifier();
    int v5 = [v3 nonWifiAvailableForBundleId:v4];

    v6 = @"prefs:root=MOBILE_DATA_SETTINGS_ID&path=WIRELESS_APP_DATA_USAGE_ID";
    if (v5) {
      v6 = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
    }
    if (v2) {
      id v0 = v6;
    }
  }
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v0];
  if (v7)
  {
    id v9 = v7;
    v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v8 openSensitiveURL:v9 withOptions:0];

    id v7 = v9;
  }
}

void __32__TPAlertAction_actionWithType___block_invoke_3()
{
  id v0 = @"prefs:root=WIFI";
  if (MGGetBoolAnswer())
  {
    v1 = [MEMORY[0x1E4F6C378] sharedInstance];
    int v2 = [v1 isWiFiEnabled];
    v3 = [MEMORY[0x1E4F61740] sharedInstance];
    v4 = TUPreferredFaceTimeBundleIdentifier();
    int v5 = [v3 wifiAllowedForBundleId:v4];

    v6 = @"prefs:root=WIFI&path=WIRELESS_APP_DATA_USAGE_ID";
    if (v5) {
      v6 = @"prefs:root=WIFI";
    }
    if (v2) {
      id v0 = v6;
    }
  }
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v0];
  if (v7)
  {
    id v9 = v7;
    v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v8 openSensitiveURL:v9 withOptions:0];

    id v7 = v9;
  }
}

void __32__TPAlertAction_actionWithType___block_invoke_4()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Phone&path=com.apple.settings.WiFiCallingSettingsBundle"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

+ (id)preferencesURLForClassName:(id)a3
{
  v3 = (void *)CUTWeakLinkClass();
  if (v3)
  {
    v3 = [v3 preferencesURL];
  }
  return v3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end