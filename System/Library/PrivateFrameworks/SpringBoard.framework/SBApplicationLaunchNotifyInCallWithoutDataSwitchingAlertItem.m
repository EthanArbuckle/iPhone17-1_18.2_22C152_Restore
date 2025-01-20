@interface SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v4 = [(SBAlertItem *)self alertController];
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 localizedStringForKey:@"IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v4 setTitle:v6];

  v7 = +[SBTelephonyManager sharedTelephonyManager];
  id v8 = objc_alloc(MEMORY[0x1E4FA9558]);
  v9 = [(id)SBApp systemStatusServer];
  v36 = (void *)[v8 initWithServerHandle:v9];

  v10 = [v36 data];
  [v36 invalidate];
  v35 = v10;
  v11 = [v10 primarySIMInfo];
  v12 = [v10 secondarySIMInfo];
  int v13 = [v11 isProvidingDataConnection];
  v14 = v12;
  v34 = v12;
  if (v13) {
    v12 = v11;
  }
  else {
    v14 = v11;
  }
  v15 = NSString;
  v16 = (void *)MEMORY[0x1E4F28B50];
  id v17 = v14;
  id v18 = v12;
  v19 = [v16 mainBundle];
  v20 = [v19 localizedStringForKey:@"IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_BODY_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];
  v21 = [v18 label];

  v22 = [v17 label];

  v23 = objc_msgSend(v15, "stringWithFormat:", v20, v21, v22);
  [v4 setMessage:v23];

  v24 = (void *)MEMORY[0x1E4F42720];
  v25 = [MEMORY[0x1E4F28B50] mainBundle];
  v26 = [v25 localizedStringForKey:@"IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_ENABLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke;
  v38[3] = &unk_1E6AF48F0;
  id v39 = v7;
  v40 = self;
  id v27 = v7;
  v28 = [v24 actionWithTitle:v26 style:0 handler:v38];
  [v4 addAction:v28];

  v29 = (void *)MEMORY[0x1E4F42720];
  v30 = [MEMORY[0x1E4F28B50] mainBundle];
  v31 = [v30 localizedStringForKey:@"IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v37[3] = &unk_1E6AF4918;
  v37[4] = self;
  v32 = [v29 actionWithTitle:v31 style:1 handler:v37];
  [v4 addAction:v32];
}

uint64_t __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCellDataSwitchingEnabled:1];
  v2 = *(void **)(a1 + 40);
  return [v2 deactivateForButton];
}

uint64_t __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

@end