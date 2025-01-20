@interface SBTestableAlertItemTestRecipe
+ (id)nameForCase:(int64_t)a3;
+ (id)testCases;
+ (id)testCasesGrouped;
- (NSArray)recipesToTest;
- (id)_anyAppIcon;
- (id)_anySUDescriptor;
- (id)_anyUserInstalledAppIcon;
- (id)_mapsApp;
- (id)_nextAlertItemToTest;
- (id)alertForIndex:(int64_t)a3;
- (id)dataPlanAlertItemForCase:(int64_t)a3;
- (id)title;
- (void)_dismissCurrentItem;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)setRecipesToTest:(id)a3;
@end

@implementation SBTestableAlertItemTestRecipe

- (id)title
{
  return @"Test SpringBoard SBAlertItems";
}

+ (id)testCases
{
  v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:52];
  for (uint64_t i = 0; i != 52; ++i)
  {
    v4 = [NSNumber numberWithInteger:i];
    [v2 addObject:v4];
  }
  v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];

  return v5;
}

+ (id)testCasesGrouped
{
  v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:52];
  for (uint64_t i = 0; i != 52; ++i)
  {
    v4 = [NSNumber numberWithInteger:i];
    [v2 addObject:v4];
  }
  v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];

  return v5;
}

+ (id)nameForCase:(int64_t)a3
{
  if ((unint64_t)a3 > 0x32) {
    return @"Not a Real Test";
  }
  else {
    return off_1E6B00048[a3];
  }
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
    v3 = [(SBTestableAlertItemTestRecipe *)self _nextAlertItemToTest];
    item = self->_item;
    self->_item = v3;

    if (![(SBAlertItem *)self->_item shouldShowInLockScreen])
    {
      v5 = +[SBLockStateAggregator sharedInstance];
      int v6 = [v5 hasAnyLockState];

      if (v6) {
        [(SBTestableAlertItemTestRecipe *)self _dismissCurrentItem];
      }
    }
  }
  id v7 = +[SBAlertItemsController sharedInstance];
  [v7 activateAlertItem:self->_item];
}

- (void)handleVolumeDecrease
{
  if (self->_item) {
    [(SBTestableAlertItemTestRecipe *)self _dismissCurrentItem];
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
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
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
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 application];
        long long v10 = v9;
        if (v9 && ![v9 isSystemApplication])
        {
          id v5 = v8;

          goto LABEL_12;
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

- (id)dataPlanAlertItemForCase:(int64_t)a3
{
  v4 = [(id)SBApp telephonyStateProvider];
  if ([v4 isSIMPresentForSlot:1]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = [v4 carrierBundleInfoForSlot:v5];
  id v7 = [v6 carrierName];
  switch(a3)
  {
    case 24:
      v8 = [SBDataPlanActivationAlertItem alloc];
      uint64_t v9 = 0;
      goto LABEL_8;
    case 25:
      v8 = [SBDataPlanActivationAlertItem alloc];
      uint64_t v9 = 1;
LABEL_8:
      uint64_t v11 = 0;
      goto LABEL_12;
    case 26:
      v8 = [SBDataPlanActivationAlertItem alloc];
      uint64_t v9 = 0;
      goto LABEL_11;
    case 27:
      v8 = [SBDataPlanActivationAlertItem alloc];
      uint64_t v9 = 1;
LABEL_11:
      uint64_t v11 = 1;
LABEL_12:
      long long v12 = [(SBDataPlanActivationAlertItem *)v8 initWithAccountURL:0 newAccount:v9 promptToDisable:v11];
      goto LABEL_15;
    case 28:
      long long v12 = [[SBDataPlanCompletionAlertItem alloc] initWithCarrierName:v7 newAccount:1];
      goto LABEL_15;
    case 29:
      long long v12 = [[SBDataPlanFailureAlertItem alloc] initWithAccountURL:0 carrierName:v7 newAccount:1];
LABEL_15:
      long long v10 = v12;
      break;
    case 30:
      long long v13 = [SBDataPlanUsageAlertItem alloc];
      LODWORD(v14) = 0.5;
      long long v15 = [NSNumber numberWithFloat:v14];
      uint64_t v16 = [(SBDataPlanUsageAlertItem *)v13 initWithAccountURL:0 usage:v15];
      goto LABEL_18;
    case 31:
      uint64_t v17 = [SBDataPlanExpirationAlertItem alloc];
      long long v15 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v16 = [(SBDataPlanExpirationAlertItem *)v17 initWithAccountURL:0 expirationDate:v15];
LABEL_18:
      long long v10 = (void *)v16;

      break;
    default:
      long long v10 = 0;
      break;
  }

  return v10;
}

- (id)_nextAlertItemToTest
{
  int64_t v3 = [(NSArray *)self->_recipesToTest count];
  if (v3)
  {
    recipesToTest = self->_recipesToTest;
    uint64_t v5 = _nextAlertItemToTest_alertItemIndex++;
    uint64_t v6 = [(NSArray *)recipesToTest objectAtIndex:v5 % v3];
    uint64_t v7 = [v6 integerValue];
  }
  else
  {
    uint64_t v8 = _nextAlertItemToTest_alertItemIndex++;
    uint64_t v7 = v8 % 52;
  }
  return [(SBTestableAlertItemTestRecipe *)self alertForIndex:v7];
}

- (id)alertForIndex:(int64_t)a3
{
  int64_t v3 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v6 = [SBBuddyLockScreenDismissOnlyAlertItem alloc];
      uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v8 = [v7 localizedStringForKey:@"ACTIVATION_REQUIRED" value:@"Activation Required" table:@"SpringBoard"];
      uint64_t v9 = [(SBDismissOnlyAlertItem *)v6 initWithTitle:v8 body:0];
      goto LABEL_37;
    case 1:
      uint64_t v7 = [(id)*MEMORY[0x1E4F43630] performSelector:sel__settingLanguageStringForNewLanguage];
      long long v10 = SBBuddyLockScreenDismissOnlyAlertItem;
      goto LABEL_18;
    case 2:
      uint64_t v11 = [SBActivationFailedAlertItem alloc];
      uint64_t v12 = 1;
      goto LABEL_7;
    case 3:
      uint64_t v11 = [SBActivationFailedAlertItem alloc];
      uint64_t v12 = 5;
LABEL_7:
      uint64_t v5 = [(SBActivationFailedAlertItem *)v11 initWithFailureCount:v12 slot:1];
      goto LABEL_57;
    case 4:
      uint64_t v5 = [[SBLowPowerAlertItem alloc] initWithLevel:5];
      goto LABEL_57;
    case 5:
      uint64_t v5 = [[SBBluetoothAccessoryLowPowerAlertItem alloc] initWithAccessory:@" Pencil" batteryLevel:5];
      goto LABEL_57;
    case 6:
      uint64_t v7 = [(SBTestableAlertItemTestRecipe *)self _mapsApp];
      long long v13 = SBApplicationLaunchNotifyInCallAlertItem;
      goto LABEL_12;
    case 7:
      uint64_t v7 = [(SBTestableAlertItemTestRecipe *)self _mapsApp];
      long long v13 = SBApplicationLaunchNotifyAirplaneModeAlertItem;
LABEL_12:
      uint64_t v14 = [[v13 alloc] initWithApplication:v7];
      goto LABEL_31;
    case 8:
      long long v15 = [SBDismissOnlyAlertItem alloc];
      uint64_t v16 = @"Download Error";
      uint64_t v17 = @"Some kind of download error";
      goto LABEL_62;
    case 9:
      v18 = [MEMORY[0x1E4F28B50] mainBundle];
      v19 = [v18 localizedStringForKey:@"WAITING_FOR_ACTIVATION_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

      v20 = [MEMORY[0x1E4F28B50] mainBundle];
      v21 = [v20 localizedStringForKey:@"WAITING_FOR_ACTIVATION_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

      v22 = (objc_class *)SBDismissOnlyAlertItem;
      goto LABEL_20;
    case 10:
      v23 = [MEMORY[0x1E4F28B50] mainBundle];
      v24 = v23;
      v25 = @"PHONE_ACTIVATED";
      goto LABEL_17;
    case 11:
      v23 = [MEMORY[0x1E4F28B50] mainBundle];
      v24 = v23;
      v25 = @"UNSUPPORTED_CHARGING_ACCESSORY";
LABEL_17:
      uint64_t v7 = [v23 localizedStringForKey:v25 value:&stru_1F3084718 table:@"SpringBoard"];

      long long v10 = SBDismissOnlyAlertItem;
LABEL_18:
      uint64_t v14 = [[v10 alloc] initWithTitle:v7 body:0];
      goto LABEL_31;
    case 12:
      v26 = [MEMORY[0x1E4F28B50] mainBundle];
      v19 = [v26 localizedStringForKey:@"CARRIER_DEBUGGING_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

      v27 = [MEMORY[0x1E4F28B50] mainBundle];
      v21 = [v27 localizedStringForKey:@"CARRIER_DEBUGGING_BODY" value:&stru_1F3084718 table:@"SpringBoard"];

      v22 = NSClassFromString(&cfstr_Sbcarrierdebug.isa);
LABEL_20:
      int64_t v3 = (SBUnsupportedURLAlertItem *)[[v22 alloc] initWithTitle:v19 body:v21];

      break;
    case 13:
      v28 = NSClassFromString(&cfstr_Sbreorderinfoa.isa);
      goto LABEL_33;
    case 14:
      v28 = (objc_class *)SBRestoreFailureAlertItem;
      goto LABEL_33;
    case 15:
      v29 = [MEMORY[0x1E4F28B50] mainBundle];
      v30 = v29;
      v31 = @"RESTRICTED_URL_TITLE";
      goto LABEL_25;
    case 16:
      v29 = [MEMORY[0x1E4F28B50] mainBundle];
      v30 = v29;
      v31 = @"UNHANDLED_URL_BODY";
LABEL_25:
      uint64_t v7 = [v29 localizedStringForKey:v31 value:&stru_1F3084718 table:@"SpringBoard"];

      v32 = NSString;
      v33 = [MEMORY[0x1E4F28B50] mainBundle];
      v34 = [v33 localizedStringForKey:@"RESTRICTED_URL_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
      v35 = objc_msgSend(v32, "stringWithFormat:", v34, @"http://www.apple.com");

      int64_t v3 = [(SBDismissOnlyAlertItem *)[SBUnsupportedURLAlertItem alloc] initWithTitle:v7 body:v35];
      goto LABEL_42;
    case 17:
      v36 = SBAppProfileExpiredAlertItem;
      goto LABEL_30;
    case 18:
      v36 = SBAppDeniedAlertItem;
      goto LABEL_30;
    case 19:
      v36 = SBAppProfileNotTrustedAlertItem;
      goto LABEL_30;
    case 20:
      v36 = SBAppFreeDevProfileNotTrustedAlertItem;
LABEL_30:
      id v37 = [v36 alloc];
      uint64_t v7 = [(SBTestableAlertItemTestRecipe *)self _mapsApp];
      uint64_t v14 = [v37 initWithApp:v7];
LABEL_31:
      int64_t v3 = (SBUnsupportedURLAlertItem *)v14;
      goto LABEL_42;
    case 21:
      v28 = (objc_class *)SBInsecureDrawingAlertItem;
LABEL_33:
      uint64_t v5 = (SBLowPowerAlertItem *)objc_alloc_init(v28);
      goto LABEL_57;
    case 22:
      v38 = [SBFairPlayFamilyLeaveAlertItem alloc];
      uint64_t v7 = +[SBApplicationController sharedInstance];
      uint64_t v8 = [v7 musicApplication];
      v39 = [v8 info];
      int64_t v3 = [(SBFairPlayFamilyLeaveAlertItem *)v38 initWithAppInfo:v39];

      goto LABEL_38;
    case 23:
      v40 = [SBVPPAppRequiresHealingAlertItem alloc];
      uint64_t v7 = +[SBApplicationController sharedInstance];
      uint64_t v8 = [v7 cameraApplication];
      uint64_t v9 = [(SBVPPAppRequiresHealingAlertItem *)v40 initWithApplication:v8];
      goto LABEL_37;
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
      -[SBTestableAlertItemTestRecipe dataPlanAlertItemForCase:](self, "dataPlanAlertItemForCase:");
      uint64_t v5 = (SBLowPowerAlertItem *)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 32:
      v41 = [SBPasscodeComplianceAlertItem alloc];
      uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v8 = [v7 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
      uint64_t v9 = [(SBPasscodeComplianceAlertItem *)v41 initWithTitle:@"Non-compliant passcode!" message:@"Which is bad!" continueButtonTitle:v8 cancelButtonTitle:0];
LABEL_37:
      int64_t v3 = (SBUnsupportedURLAlertItem *)v9;
LABEL_38:

      goto LABEL_42;
    case 33:
      v42 = [SBPasscodeComplianceAlertItem alloc];
      uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
      v43 = [v7 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
      v44 = [MEMORY[0x1E4F28B50] mainBundle];
      v45 = [v44 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_LATER" value:&stru_1F3084718 table:@"SpringBoard"];
      v46 = @"Which is bad, but whatevs?";
      goto LABEL_41;
    case 34:
      v42 = [SBPasscodeComplianceAlertItem alloc];
      uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
      v43 = [v7 localizedStringForKey:@"NON_COMPLIANT_PASSCODE_CONTINUE" value:&stru_1F3084718 table:@"SpringBoard"];
      v44 = [MEMORY[0x1E4F28B50] mainBundle];
      v45 = [v44 localizedStringForKey:@"PASSCODE_REMINDER_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];
      v46 = @"Which is bad, so cancel!";
LABEL_41:
      int64_t v3 = [(SBPasscodeComplianceAlertItem *)v42 initWithTitle:@"Non-compliant passcode!" message:v46 continueButtonTitle:v43 cancelButtonTitle:v45];

LABEL_42:
      break;
    case 35:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 0;
      goto LABEL_50;
    case 36:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 0;
      goto LABEL_52;
    case 37:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 0;
      goto LABEL_54;
    case 38:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 1;
      goto LABEL_50;
    case 39:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 1;
      goto LABEL_52;
    case 40:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 1;
      goto LABEL_54;
    case 41:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 2;
LABEL_50:
      uint64_t v49 = 0;
      uint64_t v50 = 1;
      goto LABEL_56;
    case 42:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 2;
LABEL_52:
      uint64_t v49 = 1;
      goto LABEL_55;
    case 43:
      v47 = [SBPasscodeAlertItem alloc];
      uint64_t v48 = 2;
LABEL_54:
      uint64_t v49 = 2;
LABEL_55:
      uint64_t v50 = 0xFFFFFFFFLL;
LABEL_56:
      uint64_t v5 = [(SBPasscodeAlertItem *)v47 initWithPasscodeMode:v48 unlockScreenType:v49 simplePasscodeType:v50];
      goto LABEL_57;
    case 51:
      long long v15 = [SBDismissOnlyAlertItem alloc];
      uint64_t v16 = @"All Done";
      uint64_t v17 = @"Bye bye now.";
LABEL_62:
      uint64_t v5 = [(SBDismissOnlyAlertItem *)v15 initWithTitle:v16 body:v17];
LABEL_57:
      int64_t v3 = (SBUnsupportedURLAlertItem *)v5;
      break;
    default:
      break;
  }
  return v3;
}

- (NSArray)recipesToTest
{
  return self->_recipesToTest;
}

- (void)setRecipesToTest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipesToTest, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end