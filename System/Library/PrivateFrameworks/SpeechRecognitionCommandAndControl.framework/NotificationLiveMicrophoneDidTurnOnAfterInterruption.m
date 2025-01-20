@interface NotificationLiveMicrophoneDidTurnOnAfterInterruption
@end

@implementation NotificationLiveMicrophoneDidTurnOnAfterInterruption

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke()
{
  id v14 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
  v0 = objc_opt_new();
  v1 = +[CACLocaleUtilities localizedUIStringForKey:@"UserNotification.ListeningInterruptionEnded.TelephonyTitle"];
  [v0 setTitle:v1];

  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  int v3 = [v2 assistantIsEnabled];

  v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v5 = [v4 _telephonyRequiresAirPods];

  v6 = @"UserNotification.ListeningInterruptionEnded.TelephonyEnableSiriUseAirPods";
  if (v3) {
    v6 = @"UserNotification.ListeningInterruptionEnded.TelephonyUseAirPods";
  }
  if (v5) {
    v7 = v6;
  }
  else {
    v7 = @"UserNotification.ListeningInterruptionEnded.TelephonyEnableSiri";
  }
  v8 = +[CACLocaleUtilities localizedUIStringForKey:v7];
  [v0 setBody:v8];

  v9 = [NSURL URLWithString:@"prefs:root=SIRI_AND_SEARCH"];
  [v0 setDefaultActionURL:v9];
  v10 = (void *)MEMORY[0x263F1DF48];
  v11 = [MEMORY[0x263F08C38] UUID];
  v12 = [v11 UUIDString];
  v13 = [v10 requestWithIdentifier:v12 content:v0 trigger:0];

  [v14 addNotificationRequest:v13 withCompletionHandler:&__block_literal_global_1642];
}

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = CACLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_2_cold_1();
    }
  }
}

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_1643()
{
  id v1 = +[CACDisplayManager sharedManager];
  v0 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ListeningInterruptionEnded"];
  [v1 displayMessageString:v0 type:0];
}

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_238377000, v0, OS_LOG_TYPE_DEBUG, "Error sending local notification: %@", v1, 0xCu);
}

@end