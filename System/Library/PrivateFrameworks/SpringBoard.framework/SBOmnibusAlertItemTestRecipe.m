@interface SBOmnibusAlertItemTestRecipe
- (id)_anyAppIcon;
- (id)_anySUDescriptor;
- (id)_anyUserInstalledAppIcon;
- (id)_mapsApp;
- (id)_nextAlertItemToTest;
- (id)title;
- (void)_dismissCurrentItem;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBOmnibusAlertItemTestRecipe

- (id)title
{
  return @"SpringBoard SBAlertItem Tour";
}

- (void)_dismissCurrentItem
{
  [(SBAlertItem *)self->_item deactivateForReason:4];
  item = self->_item;
  self->_item = 0;
}

- (void)handleVolumeIncrease
{
  while (!self->_item)
  {
    v3 = [(SBOmnibusAlertItemTestRecipe *)self _nextAlertItemToTest];
    item = self->_item;
    self->_item = v3;

    if (![(SBAlertItem *)self->_item shouldShowInLockScreen])
    {
      v5 = +[SBLockStateAggregator sharedInstance];
      int v6 = [v5 hasAnyLockState];

      if (v6) {
        [(SBOmnibusAlertItemTestRecipe *)self _dismissCurrentItem];
      }
    }
  }
  id v7 = +[SBAlertItemsController sharedInstance];
  [v7 activateAlertItem:self->_item];
}

- (void)handleVolumeDecrease
{
  if (self->_item) {
    [(SBOmnibusAlertItemTestRecipe *)self _dismissCurrentItem];
  }
}

- (id)_anyAppIcon
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = +[SBIconController sharedInstance];
  v3 = [v2 model];
  v4 = [v3 leafIcons];

  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isApplicationIcon])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_anyUserInstalledAppIcon
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = +[SBIconController sharedInstance];
  v3 = [v2 model];
  v4 = [v3 leafIcons];

  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isApplicationIcon])
        {
          v9 = [v8 application];
          int v10 = [v9 isSystemApplication];

          if (!v10)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)_anySUDescriptor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA56D8]);
  return v2;
}

- (id)_mapsApp
{
  id v2 = +[SBApplicationController sharedInstance];
  v3 = [v2 applicationWithBundleIdentifier:@"com.apple.Maps"];

  return v3;
}

- (id)_nextAlertItemToTest
{
  uint64_t v2 = _nextAlertItemToTest_alertItemIndex_0++;
  uint64_t v3 = v2 % 35;
  switch(v2 % 35)
  {
    case 0:
      long long v11 = [[SBLowPowerAlertItem alloc] initWithLevel:5];
      goto LABEL_54;
    case 1:
      long long v11 = [[SBActivationFailedAlertItem alloc] initWithFailureCount:5 slot:1];
      goto LABEL_54;
    case 2:
      long long v12 = SBAppDeniedAlertItem;
      goto LABEL_13;
    case 3:
      long long v12 = SBAppProfileExpiredAlertItem;
      goto LABEL_13;
    case 4:
      long long v12 = SBAppProfileNotTrustedAlertItem;
LABEL_13:
      id v13 = [v12 alloc];
      long long v14 = [(SBOmnibusAlertItemTestRecipe *)self _mapsApp];
      uint64_t v15 = [v13 initWithApp:v14];
      goto LABEL_56;
    case 5:
      v16 = [SBBuddyLockScreenDismissOnlyAlertItem alloc];
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v5 localizedStringForKey:@"ACTIVATION_REQUIRED" value:@"Activation Required" table:@"SpringBoard"];
      uint64_t v17 = [(SBDismissOnlyAlertItem *)v16 initWithTitle:v7 body:0];
      goto LABEL_32;
    case 6:
      id v5 = [(id)*MEMORY[0x1E4F43630] performSelector:sel__settingLanguageStringForNewLanguage];
      v18 = SBBuddyLockScreenDismissOnlyAlertItem;
      goto LABEL_22;
    case 7:
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v19 localizedStringForKey:@"CARRIER_DEBUGGING_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

      v21 = [MEMORY[0x1E4F28B50] mainBundle];
      v22 = [v21 localizedStringForKey:@"CARRIER_DEBUGGING_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

      v23 = @"SBCarrierDebuggingAlert";
      goto LABEL_37;
    case 8:
    case 9:
      id v5 = [(id)SBApp telephonyStateProvider];
      if ([v5 isSIMPresentForSlot:1]) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 2;
      }
      id v7 = [v5 carrierBundleInfoForSlot:v6];
      v8 = [v7 carrierName];
      if (v3 == 8) {
        v9 = [[SBDataPlanCompletionAlertItem alloc] initWithCarrierName:v8 newAccount:1];
      }
      else {
        v9 = [[SBDataPlanFailureAlertItem alloc] initWithAccountURL:0 carrierName:v8 newAccount:1];
      }
      int v10 = (SBUnsupportedURLAlertItem *)v9;

      goto LABEL_61;
    case 10:
      v24 = [SBDismissOnlyAlertItem alloc];
      v25 = @"Download Error";
      v26 = @"Some kind of download error";
      goto LABEL_58;
    case 11:
      v27 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v27 localizedStringForKey:@"WAITING_FOR_ACTIVATION_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

      v28 = [MEMORY[0x1E4F28B50] mainBundle];
      v22 = [v28 localizedStringForKey:@"WAITING_FOR_ACTIVATION_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

      v29 = (objc_class *)SBDismissOnlyAlertItem;
      goto LABEL_38;
    case 12:
      v30 = [MEMORY[0x1E4F28B50] mainBundle];
      v31 = v30;
      v32 = @"PHONE_ACTIVATED";
      goto LABEL_21;
    case 13:
      v30 = [MEMORY[0x1E4F28B50] mainBundle];
      v31 = v30;
      v32 = @"UNSUPPORTED_CHARGING_ACCESSORY";
LABEL_21:
      id v5 = [v30 localizedStringForKey:v32 value:&stru_1F3084718 table:@"SpringBoard"];

      v18 = SBDismissOnlyAlertItem;
LABEL_22:
      uint64_t v33 = [[v18 alloc] initWithTitle:v5 body:0];
      goto LABEL_30;
    case 14:
      v34 = [MEMORY[0x1E4F28B50] mainBundle];
      v35 = v34;
      v36 = @"RESTRICTED_URL_TITLE";
      goto LABEL_25;
    case 15:
      v34 = [MEMORY[0x1E4F28B50] mainBundle];
      v35 = v34;
      v36 = @"UNHANDLED_URL_BODY";
LABEL_25:
      id v5 = [v34 localizedStringForKey:v36 value:&stru_1F3084718 table:@"SpringBoard"];

      v37 = NSString;
      v38 = [MEMORY[0x1E4F28B50] mainBundle];
      v39 = [v38 localizedStringForKey:@"RESTRICTED_URL_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
      v40 = objc_msgSend(v37, "stringWithFormat:", v39, @"http://www.apple.com");

      int v10 = [(SBDismissOnlyAlertItem *)[SBUnsupportedURLAlertItem alloc] initWithTitle:v5 body:v40];
      goto LABEL_62;
    case 16:
      v41 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v41 localizedStringForKey:@"REORDER_INFO_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

      v42 = [MEMORY[0x1E4F28B50] mainBundle];
      v22 = [v42 localizedStringForKey:@"REORDER_INFO_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

      v23 = @"SBHomeScreenNagAlert";
      goto LABEL_37;
    case 17:
      id v5 = [(SBOmnibusAlertItemTestRecipe *)self _mapsApp];
      v43 = SBApplicationLaunchNotifyInCallAlertItem;
      goto LABEL_29;
    case 18:
      id v5 = [(SBOmnibusAlertItemTestRecipe *)self _mapsApp];
      v43 = SBApplicationLaunchNotifyAirplaneModeAlertItem;
LABEL_29:
      uint64_t v33 = [[v43 alloc] initWithApplication:v5];
LABEL_30:
      int v10 = (SBUnsupportedURLAlertItem *)v33;
      goto LABEL_62;
    case 19:
      v44 = [SBPasscodeComplianceAlertItem alloc];
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v5 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
      uint64_t v17 = [(SBPasscodeComplianceAlertItem *)v44 initWithTitle:@"Non-compliant passcode!" message:@"Which is bad!" continueButtonTitle:v7 cancelButtonTitle:0];
LABEL_32:
      int v10 = (SBUnsupportedURLAlertItem *)v17;
LABEL_61:

      goto LABEL_62;
    case 20:
      v45 = [SBPasscodeComplianceAlertItem alloc];
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v46 = [v5 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
      v47 = [MEMORY[0x1E4F28B50] mainBundle];
      v48 = [v47 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_LATER" value:&stru_1F3084718 table:@"SpringBoard"];
      v49 = @"Which is bad, but whatevs?";
      goto LABEL_35;
    case 21:
      v45 = [SBPasscodeComplianceAlertItem alloc];
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v46 = [v5 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
      v47 = [MEMORY[0x1E4F28B50] mainBundle];
      v48 = [v47 localizedStringForKey:@"PASSCODE_REMINDER_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];
      v49 = @"Which is bad, so cancel!";
LABEL_35:
      int v10 = [(SBPasscodeComplianceAlertItem *)v45 initWithTitle:@"Non-compliant passcode!" message:v49 continueButtonTitle:v46 cancelButtonTitle:v48];

LABEL_62:
      break;
    case 22:
      v50 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v50 localizedStringForKey:@"REORDER_INFO_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

      v51 = [MEMORY[0x1E4F28B50] mainBundle];
      v22 = [v51 localizedStringForKey:@"REORDER_INFO_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

      v23 = @"SBReorderInfoAlert";
LABEL_37:
      v29 = NSClassFromString(&v23->isa);
LABEL_38:
      int v10 = (SBUnsupportedURLAlertItem *)[[v29 alloc] initWithTitle:v20 body:v22];

      break;
    case 23:
      long long v11 = objc_alloc_init(SBRestoreFailureAlertItem);
      goto LABEL_54;
    case 24:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 0;
      goto LABEL_47;
    case 25:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 0;
      goto LABEL_49;
    case 26:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 0;
      goto LABEL_51;
    case 27:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 1;
      goto LABEL_47;
    case 28:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 1;
      goto LABEL_49;
    case 29:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 1;
      goto LABEL_51;
    case 30:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 2;
LABEL_47:
      uint64_t v54 = 0;
      uint64_t v55 = 1;
      goto LABEL_53;
    case 31:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 2;
LABEL_49:
      uint64_t v54 = 1;
      goto LABEL_52;
    case 32:
      v52 = [SBPasscodeAlertItem alloc];
      uint64_t v53 = 2;
LABEL_51:
      uint64_t v54 = 2;
LABEL_52:
      uint64_t v55 = 0xFFFFFFFFLL;
LABEL_53:
      long long v11 = [(SBPasscodeAlertItem *)v52 initWithPasscodeMode:v53 unlockScreenType:v54 simplePasscodeType:v55];
      goto LABEL_54;
    case 33:
      v56 = [SBApplication32BitDeprecationAlertItem alloc];
      long long v14 = [(SBOmnibusAlertItemTestRecipe *)self _mapsApp];
      uint64_t v15 = [(SBApplication32BitDeprecationAlertItem *)v56 initWithApplication:v14];
LABEL_56:
      int v10 = (SBUnsupportedURLAlertItem *)v15;

      break;
    case 34:
      v24 = [SBDismissOnlyAlertItem alloc];
      v25 = @"All Done";
      v26 = @"Bye bye now.";
LABEL_58:
      long long v11 = [(SBDismissOnlyAlertItem *)v24 initWithTitle:v25 body:v26];
LABEL_54:
      int v10 = (SBUnsupportedURLAlertItem *)v11;
      break;
    default:
      int v10 = 0;
      break;
  }
  return v10;
}

- (void).cxx_destruct
{
}

@end