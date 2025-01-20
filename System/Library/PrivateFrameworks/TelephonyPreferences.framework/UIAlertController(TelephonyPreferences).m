@interface UIAlertController(TelephonyPreferences)
+ (id)tps_alertControllerWithError:()TelephonyPreferences;
+ (id)tps_tapToRadarAlertControllerWithError:()TelephonyPreferences;
@end

@implementation UIAlertController(TelephonyPreferences)

+ (id)tps_alertControllerWithError:()TelephonyPreferences
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28578]];

  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:0 preferredStyle:1];
    v6 = (void *)MEMORY[0x1E4FB1410];
    v7 = +[TPSLocalizedString localizedStringForKey:@"ALERT_ACTION_TITLE_DISMISS"];
    v8 = [v6 actionWithTitle:v7 style:1 handler:0];
    [v5 addAction:v8];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tps_tapToRadarAlertControllerWithError:()TelephonyPreferences
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "tps_telephonyTapToRadarURLForError:", v3);
  if (v4)
  {
    v5 = [v3 localizedFailureReason];
    v6 = [v3 userInfo];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28578]];

    v8 = (void *)MEMORY[0x1E4FB1410];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke;
    v15[3] = &unk_1E6EB2458;
    id v16 = v4;
    v9 = [v8 actionWithTitle:@"Tap-to-Radar" style:0 handler:v15];
    v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v5 preferredStyle:1];
    [v10 addAction:v9];
    v11 = (void *)MEMORY[0x1E4FB1410];
    v12 = +[TPSLocalizedString localizedStringForKey:@"ALERT_ACTION_TITLE_DISMISS"];
    v13 = [v11 actionWithTitle:v12 style:1 handler:0];
    [v10 addAction:v13];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end