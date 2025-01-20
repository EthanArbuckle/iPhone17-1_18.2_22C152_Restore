@interface ICAuthenticationAlert
+ (BOOL)shouldPresentSwitchToDevicePasswordPromptForAccount:(id)a3;
+ (id)aboutLockedNotesInfoAlert;
+ (id)cannotAddAttachmentsInfoAlertWithAttachmentCount:(unint64_t)a3;
+ (id)cannotLockInfoAlertWithReason:(unint64_t)a3;
+ (id)cannotSetCustomPasswordInfoAlert;
+ (id)cannotUnlockInfoAlert;
+ (id)customAccountNameForAccount:(id)a3;
+ (id)customPasswordConfirmationAlert;
+ (id)devicePasswordIncompatibleConfirmationAlertWithAccount:(id)a3 incompatibilityMessage:(id)a4;
+ (id)enableBiometricsActionAlertShownKeyWithAccount:(id)a3;
+ (id)enableBiometricsActionAlertWithAccount:(id)a3;
+ (id)enableKeychainActionAlert;
+ (id)forgotCustomPasswordSwitchAnywayConfirmationAlert;
+ (id)incorrectCustomPasswordInfoAlertWithObject:(id)a3 showHint:(BOOL)a4;
+ (id)keychainItemMissingInfoAlert;
+ (id)messageForPreventLockReason:(unint64_t)a3;
+ (id)mismatchedCustomPasswordInfoAlert;
+ (id)missingCustomPasswordInfoAlert;
+ (id)rememberCustomPasswordInfoAlertPresentedKeyForAccount:(id)a3;
+ (id)rememberCustomPasswordInfoAlertWithAccount:(id)a3;
+ (id)resetCustomPasswordConfirmationAlertWithAccount:(id)a3;
+ (id)resetCustomPasswordInfoAlertWithAccount:(id)a3;
+ (id)setDevicePasswordActionAlert;
+ (id)setDevicePasswordInfoAlert;
+ (id)signIntoCloudAccountActionAlertWithAccount:(id)a3;
+ (id)switchToDevicePasswordInSettingsInfoAlertWithAccount:(id)a3;
+ (id)switchToDevicePasswordPromptPresentedCountKeyForAccount:(id)a3;
+ (id)switchedModeInfoAlertWithAccount:(id)a3;
+ (id)switchedToCustomPasswordModeInfoAlertWithAccount:(id)a3;
+ (id)switchedToDevicePasswordModeInfoAlertWithAccount:(id)a3;
+ (id)updateDivergedCustomPasswordAttachmentsActionAlert;
+ (id)updateDivergedCustomPasswordModeActionAlertWithAccount:(id)a3 incompatibilityMessage:(id)a4;
+ (id)updateDivergedCustomPasswordNotesActionAlert;
+ (id)updateDivergedDevicePasswordModeActionAlertWithAccount:(id)a3;
+ (id)upgradeToLockNotesInfoAlert;
+ (void)markSwitchToDevicePasswordPromptPresentedForAccount:(id)a3;
+ (void)presentAlertsIfNeeded:(id)a3 window:(id)a4 completionHandler:(id)a5;
+ (void)resetPresentationsForAccount:(id)a3;
- (BOOL)actionIsDestructive;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersSheet;
- (BOOL)shouldPresent;
- (ICAuthenticationAlert)init;
- (NSString)actionTitle;
- (NSString)dismissTitle;
- (NSString)message;
- (NSString)title;
- (id)actionHandler;
- (id)description;
- (id)dismissHandler;
- (id)shouldPresentHandler;
- (unint64_t)hash;
- (void)presentInWindow:(id)a3 completionHandler:(id)a4;
- (void)setActionHandler:(id)a3;
- (void)setActionIsDestructive:(BOOL)a3;
- (void)setActionTitle:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDismissTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPrefersSheet:(BOOL)a3;
- (void)setShouldPresentHandler:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICAuthenticationAlert

- (ICAuthenticationAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICAuthenticationAlert;
  v2 = [(ICAuthenticationAlert *)&v6 init];
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = (NSString *)&stru_1F0973378;
  }
  return v3;
}

+ (id)aboutLockedNotesInfoAlert
{
  v2 = objc_alloc_init(ICAuthenticationAlert);
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked Notes" value:@"Locked Notes" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Tap the lock icon in the toolbar or lock your device to hide the contents of your locked notes." value:@"Tap the lock icon in the toolbar or lock your device to hide the contents of your locked notes." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v5];

  [(ICAuthenticationAlert *)v2 setDismissHandler:&__block_literal_global_61];
  [(ICAuthenticationAlert *)v2 setShouldPresentHandler:&__block_literal_global_27_0];
  return v2;
}

void __50__ICAuthenticationAlert_aboutLockedNotesInfoAlert__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setBool:1 forKey:@"ICNoteAddPasswordFirstTimeMessageCompletedKey"];
}

uint64_t __50__ICAuthenticationAlert_aboutLockedNotesInfoAlert__block_invoke_2()
{
  if (![MEMORY[0x1E4F83738] isRunningInApp]) {
    return 0;
  }
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"ICNoteAddPasswordFirstTimeMessageCompletedKey"] ^ 1;

  return v1;
}

+ (id)upgradeToLockNotesInfoAlert
{
  v2 = objc_alloc_init(ICAuthenticationAlert);
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Upgrade Your Notes" value:@"Upgrade Your Notes" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You’ll need to go to Notes and upgrade your notes to configure locking notes." value:@"You’ll need to go to Notes and upgrade your notes to configure locking notes." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v5];

  return v2;
}

+ (id)messageForPreventLockReason:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v5 = (void *)MEMORY[0x1E4F83770];
      objc_super v6 = @"This note is too large to lock. You need to remove or reduce attachments and other content, then try again.";
      goto LABEL_11;
    case 2uLL:
      v5 = (void *)MEMORY[0x1E4F83770];
      objc_super v6 = @"Notes with video, audio, tags, PDF, or file attachments or using features from a newer version of Notes can’t be locked.";
      goto LABEL_11;
    case 3uLL:
      v5 = (void *)MEMORY[0x1E4F83770];
      objc_super v6 = @"Notes with tags can’t be locked.";
      goto LABEL_11;
    case 4uLL:
      v5 = (void *)MEMORY[0x1E4F83770];
      objc_super v6 = @"Quick Notes can’t be locked.";
      goto LABEL_11;
    case 5uLL:
      v5 = (void *)MEMORY[0x1E4F83770];
      objc_super v6 = @"Shared notes can’t be locked.";
      goto LABEL_11;
    case 6uLL:
      v5 = (void *)MEMORY[0x1E4F83770];
      objc_super v6 = @"This account doesn’t support locked notes.";
LABEL_11:
      v7 = objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1, v3);
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)cannotLockInfoAlertWithReason:(unint64_t)a3
{
  v5 = objc_alloc_init(ICAuthenticationAlert);
  objc_super v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Can’t Lock Note" value:@"Can’t Lock Note" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setTitle:v6];

  v7 = [a1 messageForPreventLockReason:a3];
  [(ICAuthenticationAlert *)v5 setMessage:v7];

  v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setDismissTitle:v8];

  return v5;
}

+ (id)cannotAddAttachmentsInfoAlertWithAttachmentCount:(unint64_t)a3
{
  uint64_t v4 = objc_alloc_init(ICAuthenticationAlert);
  if (a3 == 1) {
    v5 = @"Can’t Add Attachment";
  }
  else {
    v5 = @"Can’t Add Attachments";
  }
  objc_super v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v4 setTitle:v6];

  v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked notes can’t contain video, audio, tags, PDF, or file attachments.", @"Locked notes can’t contain video, audio, tags, PDF, or file attachments.", 0, 1 value table allowSiri];
  [(ICAuthenticationAlert *)v4 setMessage:v7];

  v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v4 setDismissTitle:v8];

  return v4;
}

+ (id)enableBiometricsActionAlertShownKeyWithAccount:(id)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = [a3 identifier];
  v5 = [v3 stringWithFormat:@"ICAuthenticationAlertEnableBiometricActionAlertPresented-%@", v4];

  return v5;
}

+ (id)enableBiometricsActionAlertWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [a1 enableBiometricsActionAlertShownKeyWithAccount:v4];
  objc_super v6 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v6 setPrefersSheet:1];
  if ([MEMORY[0x1E4F833F0] biometricsType] == 4)
  {
    v7 = (void *)MEMORY[0x1E4F83770];
    v8 = @"Enable Optic ID for this account’s locked notes.";
  }
  else if ([MEMORY[0x1E4F833F0] biometricsType] == 2)
  {
    v7 = (void *)MEMORY[0x1E4F83770];
    v8 = @"Enable Face ID for this account’s locked notes.";
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F833F0] biometricsType];
    v7 = (void *)MEMORY[0x1E4F83770];
    if (v9 == 1) {
      v8 = @"Enable Touch ID for this account’s locked notes.";
    }
    else {
      v8 = @"Enable biometrics for this account’s locked notes.";
    }
  }
  v10 = [v7 localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v6 setTitle:v10];

  if ([MEMORY[0x1E4F833F0] biometricsType] == 4)
  {
    v11 = (void *)MEMORY[0x1E4F83770];
    v12 = @"Enable Optic ID";
  }
  else if ([MEMORY[0x1E4F833F0] biometricsType] == 2)
  {
    v11 = (void *)MEMORY[0x1E4F83770];
    v12 = @"Enable Face ID";
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F833F0] biometricsType];
    v11 = (void *)MEMORY[0x1E4F83770];
    if (v13 == 1) {
      v12 = @"Enable Touch ID";
    }
    else {
      v12 = @"Enable Biometrics";
    }
  }
  v14 = [v11 localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v6 setActionTitle:v14];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke;
  v27[3] = &unk_1E5FDD118;
  id v15 = v5;
  id v28 = v15;
  id v16 = v4;
  id v29 = v16;
  [(ICAuthenticationAlert *)v6 setActionHandler:v27];
  v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v6 setDismissTitle:v17];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_2;
  v25[3] = &unk_1E5FDD140;
  id v18 = v15;
  id v26 = v18;
  [(ICAuthenticationAlert *)v6 setDismissHandler:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_3;
  v22[3] = &unk_1E5FDD168;
  id v23 = v16;
  id v24 = v18;
  id v19 = v18;
  id v20 = v16;
  [(ICAuthenticationAlert *)v6 setShouldPresentHandler:v22];

  return v6;
}

void __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v2 setBool:1 forKey:*(void *)(a1 + 32)];

  id v3 = +[ICAuthentication shared];
  [v3 setBiometricsEnabled:1 account:*(void *)(a1 + 40)];
}

void __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v2 setBool:1 forKey:*(void *)(a1 + 32)];
}

uint64_t __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_3(uint64_t a1)
{
  if (![MEMORY[0x1E4F83738] isRunningInApp]
    || ![MEMORY[0x1E4F833F0] biometricsEnrolled])
  {
    return 0;
  }
  id v2 = [MEMORY[0x1E4F832F8] sharedState];
  if ([v2 biometricsEnabledForAccount:*(void *)(a1 + 32)])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    uint64_t v3 = [v4 BOOLForKey:*(void *)(a1 + 40)] ^ 1;
  }
  return v3;
}

+ (id)devicePasswordIncompatibleConfirmationAlertWithAccount:(id)a3 incompatibilityMessage:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a4;
  objc_super v6 = [v4 localizedFrameworkStringForKey:@"Notes locked using your device passcode are only viewable on iOS 16, iPadOS 16, and macOS 13 and later. Your devices that need upgrading:", @"Notes locked using your device passcode are only viewable on iOS 16, iPadOS 16, and macOS 13 and later. Your devices that need upgrading:", 0, 1 value table allowSiri];
  v7 = objc_alloc_init(ICAuthenticationAlert);
  v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked Notes Not Viewable on Some Devices" value:@"Locked Notes Not Viewable on Some Devices" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v7 setTitle:v8];

  uint64_t v9 = [NSString localizedStringWithFormat:@"%@\n\n%@", v6, v5];

  [(ICAuthenticationAlert *)v7 setMessage:v9];
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Continue" value:@"Continue" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v7 setActionTitle:v10];

  v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v7 setDismissTitle:v11];

  return v7;
}

+ (id)switchedToCustomPasswordModeInfoAlertWithAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  objc_super v6 = [v4 localizedFrameworkStringForKey:@"Updated to Custom Password" value:@"Updated to Custom Password" table:0 allowSiri:1];
  v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Use the password you created to manage your locked notes." value:@"Use the password you created to manage your locked notes." table:0 allowSiri:1];
  v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Use the password you created to manage locked notes in your “%@” account." value:@"Use the password you created to manage locked notes in your “%@” account." table:0 allowSiri:1];
  uint64_t v9 = [a1 customAccountNameForAccount:v5];

  v10 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v10 setTitle:v6];
  if ([v9 length])
  {
    v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v9);
    [(ICAuthenticationAlert *)v10 setMessage:v11];
  }
  else
  {
    [(ICAuthenticationAlert *)v10 setMessage:v7];
  }
  v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v10 setDismissTitle:v12];

  return v10;
}

+ (id)switchedToDevicePasswordModeInfoAlertWithAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  objc_super v6 = [v4 localizedFrameworkStringForKey:@"Use your device passcode to manage your locked notes." value:@"Use your device passcode to manage your locked notes." table:0 allowSiri:1];
  v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Use your device passcode to manage locked notes in your “%@” account." value:@"Use your device passcode to manage locked notes in your “%@” account." table:0 allowSiri:1];
  v8 = [a1 customAccountNameForAccount:v5];

  uint64_t v9 = objc_alloc_init(ICAuthenticationAlert);
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Updated to Device Passcode" value:@"Updated to Device Passcode" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setTitle:v10];

  if ([v8 length])
  {
    v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v8);
    [(ICAuthenticationAlert *)v9 setMessage:v11];
  }
  else
  {
    [(ICAuthenticationAlert *)v9 setMessage:v6];
  }
  v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setDismissTitle:v12];

  return v9;
}

+ (id)switchedModeInfoAlertWithAccount:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [v5 resolvedLockedNotesMode];
  if (v6 >= 2)
  {
    if (v6 != 2) {
      goto LABEL_6;
    }
    uint64_t v7 = [a1 switchedToDevicePasswordModeInfoAlertWithAccount:v5];
  }
  else
  {
    uint64_t v7 = [a1 switchedToCustomPasswordModeInfoAlertWithAccount:v5];
  }
  uint64_t v3 = (void *)v7;
LABEL_6:

  return v3;
}

+ (id)switchToDevicePasswordInSettingsInfoAlertWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v5 setPrefersSheet:1];
  unsigned int v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Switch at Any Time" value:@"Switch at Any Time" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setTitle:v6];

  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You can switch to using your device passcode at any time in Settings > Apps > Notes > Password." value:@"You can switch to using your device passcode at any time in Settings > Apps > Notes > Password." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setMessage:v7];

  v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setActionTitle:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__ICAuthenticationAlert_switchToDevicePasswordInSettingsInfoAlertWithAccount___block_invoke;
  v11[3] = &unk_1E5FDD190;
  id v12 = v4;
  id v13 = a1;
  id v9 = v4;
  [(ICAuthenticationAlert *)v5 setShouldPresentHandler:v11];

  return v5;
}

uint64_t __78__ICAuthenticationAlert_switchToDevicePasswordInSettingsInfoAlertWithAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) shouldPresentSwitchToDevicePasswordPromptForAccount:*(void *)(a1 + 32)] ^ 1;
}

+ (id)forgotCustomPasswordSwitchAnywayConfirmationAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v2 setPrefersSheet:1];
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Forgot Password" value:@"Forgot Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"If you forgot the password you created for notes in this account, you can still choose the Device Passcode method for future locked notes. Your currently locked notes won’t be affected and will remain locked using the current password.", @"If you forgot the password you created for notes in this account, you can still choose the Device Passcode method for future locked notes. Your currently locked notes won’t be affected and will remain locked using the current password.", 0, 1 value table allowSiri];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Switch Anyway" value:@"Switch Anyway" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setActionTitle:v5];

  unsigned int v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v6];

  return v2;
}

+ (id)switchToDevicePasswordPromptPresentedCountKeyForAccount:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = [a3 identifier];
  id v5 = [v3 stringWithFormat:@"ICAuthenticationAlertSwitchToDevicePasswordPromptPresentedCount-%@", v4];

  return v5;
}

+ (BOOL)shouldPresentSwitchToDevicePasswordPromptForAccount:(id)a3
{
  uint64_t v3 = [a1 switchToDevicePasswordPromptPresentedCountKeyForAccount:a3];
  id v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  BOOL v5 = [v4 integerForKey:v3] < 2;

  return v5;
}

+ (void)markSwitchToDevicePasswordPromptPresentedForAccount:(id)a3
{
  id v6 = [a1 switchToDevicePasswordPromptPresentedCountKeyForAccount:a3];
  uint64_t v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v4 = [v3 integerForKey:v6] + 1;

  BOOL v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v5 setInteger:v4 forKey:v6];
}

+ (id)customPasswordConfirmationAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v2 setPrefersSheet:1];
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"About Creating a Password" value:@"About Creating a Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  uint64_t v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"If you forget your password, Apple can’t reset it and your locked notes can’t be recovered.", @"If you forget your password, Apple can’t reset it and your locked notes can’t be recovered.", 0, 1 value table allowSiri];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  BOOL v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Continue" value:@"Continue" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setActionTitle:v5];

  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v6];

  return v2;
}

+ (id)rememberCustomPasswordInfoAlertPresentedKeyForAccount:(id)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = [a3 identifier];
  BOOL v5 = [v3 stringWithFormat:@"ICAuthenticationAlertSwitchToDevicePasswordPromptPresentedCount-%@", v4];

  return v5;
}

+ (id)rememberCustomPasswordInfoAlertWithAccount:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F833F0];
  id v5 = a3;
  if ([v4 biometricsType] == 4)
  {
    id v6 = (void *)MEMORY[0x1E4F83770];
    uint64_t v7 = @"Forgetting your notes password can cause you to lose access to your locked notes, even if Optic ID is enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.";
  }
  else if ([MEMORY[0x1E4F833F0] biometricsType] == 2)
  {
    id v6 = (void *)MEMORY[0x1E4F83770];
    uint64_t v7 = @"Forgetting your notes password can cause you to lose access to your locked notes, even if Face ID is enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.";
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F833F0] biometricsType];
    id v6 = (void *)MEMORY[0x1E4F83770];
    if (v8 == 1) {
      uint64_t v7 = @"Forgetting your notes password can cause you to lose access to your locked notes, even if Touch ID is enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.";
    }
    else {
      uint64_t v7 = @"Forgetting your notes password can cause you to lose access to your locked notes, even if biometrics are enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.";
    }
  }
  id v9 = [v6 localizedFrameworkStringForKey:v7 value:v7 table:0 allowSiri:1];
  if ([MEMORY[0x1E4F833F0] biometricsType] == 4)
  {
    v10 = (void *)MEMORY[0x1E4F83770];
    v11 = @"Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if Optic ID is enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.";
  }
  else if ([MEMORY[0x1E4F833F0] biometricsType] == 2)
  {
    v10 = (void *)MEMORY[0x1E4F83770];
    v11 = @"Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if Face ID is enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.";
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F833F0] biometricsType];
    v10 = (void *)MEMORY[0x1E4F83770];
    if (v12 == 1) {
      v11 = @"Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if Touch ID is enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.";
    }
    else {
      v11 = @"Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if biometrics are enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.";
    }
  }
  id v13 = [v10 localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
  v14 = [a1 customAccountNameForAccount:v5];
  id v15 = NSString;
  id v16 = [v5 identifier];

  v17 = [v15 stringWithFormat:@"ICPasswordUtilitiesAlertOfDontForgetPasswordHasShownKey_%@", v16];

  id v18 = objc_alloc_init(ICAuthenticationAlert);
  id v19 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Don’t Forget Your Notes Password" value:@"Don’t Forget Your Notes Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v18 setTitle:v19];

  if ([v14 length])
  {
    id v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v14);
    [(ICAuthenticationAlert *)v18 setMessage:v20];
  }
  else
  {
    [(ICAuthenticationAlert *)v18 setMessage:v9];
  }
  v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v18 setActionTitle:v21];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke;
  v31[3] = &unk_1E5FDD140;
  id v22 = v17;
  id v32 = v22;
  [(ICAuthenticationAlert *)v18 setActionHandler:v31];
  id v23 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Learn More" value:@"Learn More" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v18 setDismissTitle:v23];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_2;
  v29[3] = &unk_1E5FDD140;
  id v24 = v22;
  id v30 = v24;
  [(ICAuthenticationAlert *)v18 setDismissHandler:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_3;
  v27[3] = &unk_1E5FDD1B8;
  id v28 = v24;
  id v25 = v24;
  [(ICAuthenticationAlert *)v18 setShouldPresentHandler:v27];

  return v18;
}

void __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v2 setBool:1 forKey:*(void *)(a1 + 32)];
}

void __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F836E0];
  id v4 = a2;
  id v5 = [v3 sharedAppGroupDefaults];
  [v5 setBool:1 forKey:*(void *)(a1 + 32)];

  id v6 = [v4 rootViewController];

  +[ICHelp presentWithTopic:@"apdeefb92e46" presentingViewController:v6];
}

uint64_t __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v3 = [v2 BOOLForKey:*(void *)(a1 + 32)] ^ 1;

  return v3;
}

+ (id)missingCustomPasswordInfoAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Enter a Password" value:@"Enter a Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v4];

  return v2;
}

+ (id)mismatchedCustomPasswordInfoAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Passwords Don’t Match" value:@"Passwords Don’t Match" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v4];

  return v2;
}

+ (id)cannotSetCustomPasswordInfoAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Unable to Set Password" value:@"Unable to Set Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v4];

  return v2;
}

+ (id)incorrectCustomPasswordInfoAlertWithObject:(id)a3 showHint:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Please try again." value:@"Please try again." table:0 allowSiri:1];
  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Hint: %@" value:@"Hint: %@" table:0 allowSiri:1];
  uint64_t v8 = [v5 passwordHint];
  if ([v8 length])
  {
    id v9 = NSString;
    v10 = [v5 passwordHint];
    v11 = objc_msgSend(v9, "localizedStringWithFormat:", v7, v10);
  }
  else
  {
    v11 = 0;
  }

  uint64_t v12 = objc_alloc_init(ICAuthenticationAlert);
  id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"That’s not the correct password." value:@"That’s not the correct password." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v12 setTitle:v13];

  if (v4 && v11)
  {
    v14 = [NSString localizedStringWithFormat:@"%@\n\n%@", v6, v11];
    [(ICAuthenticationAlert *)v12 setMessage:v14];
  }
  else
  {
    [(ICAuthenticationAlert *)v12 setMessage:v6];
  }
  id v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v12 setDismissTitle:v15];

  return v12;
}

+ (id)updateDivergedCustomPasswordNotesActionAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password?" value:@"Update Password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  BOOL v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This note is using an old password. Would you like to update all notes using this password to use your current password?" value:@"This note is using an old password. Would you like to update all notes using this password to use your current password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password" value:@"Update Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setActionTitle:v5];

  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v6];

  return v2;
}

+ (id)updateDivergedCustomPasswordAttachmentsActionAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password?" value:@"Update Password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  BOOL v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Would you like to update all attachments using this password to match the note’s password?" value:@"Would you like to update all attachments using this password to match the note’s password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password" value:@"Update Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setActionTitle:v5];

  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v6];

  return v2;
}

+ (id)updateDivergedCustomPasswordModeActionAlertWithAccount:(id)a3 incompatibilityMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This note is using an old password. Would you like to update it to use your device passcode?" value:@"This note is using an old password. Would you like to update it to use your device passcode?" table:0 allowSiri:1];
  uint64_t v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This note is using an old password. If you update it to use your device passcode, it won’t be viewable on the following devices:", @"This note is using an old password. If you update it to use your device passcode, it won’t be viewable on the following devices:", 0, 1 value table allowSiri];
  id v9 = objc_alloc_init(ICAuthenticationAlert);
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password?" value:@"Update Password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setTitle:v10];

  if (v6)
  {
    v11 = [NSString localizedStringWithFormat:@"%@\n\n%@", v8, v6];
    [(ICAuthenticationAlert *)v9 setMessage:v11];
  }
  else
  {
    [(ICAuthenticationAlert *)v9 setMessage:v7];
  }
  uint64_t v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password" value:@"Update Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setActionTitle:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke;
  v16[3] = &unk_1E5FDD140;
  id v17 = v5;
  id v13 = v5;
  [(ICAuthenticationAlert *)v9 setActionHandler:v16];
  v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setDismissTitle:v14];

  return v9;
}

void __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[ICAuthenticationPrompt promptForChangingMode:2 account:*(void *)(a1 + 32)];
  id v5 = +[ICAuthentication shared];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke_2;
  v7[3] = &unk_1E5FDD1E0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  [v5 authenticateWithPrompt:v4 displayWindow:v6 completionHandler:v7];
}

void __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 2 && *(void *)(a1 + 32))
  {
    id v3 = +[ICLockedNotesModeMigrator sharedMigrator];
    [v3 migrateLockedNotesInAccount:*(void *)(a1 + 32) toMode:2 window:*(void *)(a1 + 40) completionHandler:0];
  }
}

+ (id)resetCustomPasswordInfoAlertWithAccount:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"This allows you to create a new password for notes you lock from now on. Notes that already have a password aren’t affected." value:@"This allows you to create a new password for notes you lock from now on. Notes that already have a password aren’t affected." table:0 allowSiri:1];
  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This allows you to create a new password for notes you lock in your “%@” account from now on. Notes that already have a password aren’t affected." value:@"This allows you to create a new password for notes you lock in your “%@” account from now on. Notes that already have a password aren’t affected." table:0 allowSiri:1];
  id v8 = [a1 customAccountNameForAccount:v5];

  id v9 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v9 setPrefersSheet:1];
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Reset Notes Password?" value:@"Reset Notes Password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setTitle:v10];

  if ([v8 length])
  {
    v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v8);
    [(ICAuthenticationAlert *)v9 setMessage:v11];
  }
  else
  {
    [(ICAuthenticationAlert *)v9 setMessage:v6];
  }
  uint64_t v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setActionTitle:v12];

  id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setDismissTitle:v13];

  return v9;
}

+ (id)resetCustomPasswordConfirmationAlertWithAccount:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F83770];
  id v5 = a3;
  id v6 = [v4 localizedFrameworkStringForKey:@"This will change the password you use for your notes from now on." value:@"This will change the password you use for your notes from now on." table:0 allowSiri:1];
  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This will change the password you use for notes in your “%@” account from now on." value:@"This will change the password you use for notes in your “%@” account from now on." table:0 allowSiri:1];
  id v8 = [a1 customAccountNameForAccount:v5];

  id v9 = objc_alloc_init(ICAuthenticationAlert);
  [(ICAuthenticationAlert *)v9 setPrefersSheet:1];
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Are you sure you want to reset your password?" value:@"Are you sure you want to reset your password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setTitle:v10];

  if ([v8 length])
  {
    v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v8);
    [(ICAuthenticationAlert *)v9 setMessage:v11];
  }
  else
  {
    [(ICAuthenticationAlert *)v9 setMessage:v6];
  }
  uint64_t v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Reset Password" value:@"Reset Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setActionTitle:v12];

  [(ICAuthenticationAlert *)v9 setActionIsDestructive:1];
  id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v9 setDismissTitle:v13];

  return v9;
}

+ (id)setDevicePasswordActionAlert
{
  id v2 = objc_alloc_init(ICAuthenticationAlert);
  id v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"No Passcode Set" value:@"No Passcode Set" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  BOOL v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must set a passcode in Settings to use it to lock notes." value:@"You must set a passcode in Settings to use it to lock notes." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Set Up Passcode" value:@"Set Up Passcode" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setActionTitle:v5];

  [(ICAuthenticationAlert *)v2 setActionHandler:&__block_literal_global_261];
  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v6];

  return v2;
}

void __53__ICAuthenticationAlert_setDevicePasswordActionAlert__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSCODE"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

+ (id)setDevicePasswordInfoAlert
{
  objc_opt_class();
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v3 = [v2 objectForKey:@"ICAuthenticationSetDevicePasswordInfoPresentedAt"];
  BOOL v4 = ICDynamicCast();

  id v5 = objc_alloc_init(ICAuthenticationAlert);
  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"No Passcode Set" value:@"No Passcode Set" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setTitle:v6];

  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Anyone that can view notes on this device can view its locked notes. Locked notes are still end-to-end encrypted.\n\nSet a passcode to protect locked notes on this device." value:@"Anyone that can view notes on this device can view its locked notes. Locked notes are still end-to-end encrypted.\n\nSet a passcode to protect locked notes on this device." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setMessage:v7];

  id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Set Up Passcode" value:@"Set Up Passcode" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setActionTitle:v8];

  [(ICAuthenticationAlert *)v5 setActionHandler:&__block_literal_global_275];
  id v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v5 setDismissTitle:v9];

  [(ICAuthenticationAlert *)v5 setDismissHandler:&__block_literal_global_277];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke_3;
  v12[3] = &unk_1E5FDD1B8;
  id v13 = v4;
  id v10 = v4;
  [(ICAuthenticationAlert *)v5 setShouldPresentHandler:v12];

  return v5;
}

void __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke()
{
  id v0 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v1 = [MEMORY[0x1E4F1C9C8] now];
  [v0 setObject:v1 forKey:@"ICAuthenticationSetDevicePasswordInfoPresentedAt"];

  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSCODE"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

void __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke_2()
{
  id v1 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v0 = [MEMORY[0x1E4F1C9C8] now];
  [v1 setObject:v0 forKey:@"ICAuthenticationSetDevicePasswordInfoPresentedAt"];
}

BOOL __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (!v1) {
    return 1;
  }
  [v1 timeIntervalSinceNow];
  return v2 <= -2592000.0;
}

+ (id)signIntoCloudAccountActionAlertWithAccount:(id)a3
{
  id v4 = a3;
  if (ICInternalSettingsIsAppleAccountBrandingEnabled()) {
    id v5 = @"To use your device’s passcode for locked notes, this device must be signed in to an Apple Account with iCloud Keychain enabled.";
  }
  else {
    id v5 = @"To use your device’s passcode for locked notes, this device must be signed in to an iCloud account with iCloud Keychain enabled.";
  }
  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an Apple Account with iCloud Keychain enabled.", @"To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an Apple Account with iCloud Keychain enabled.", 0, 1 value table allowSiri];
  id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an iCloud account with iCloud Keychain enabled.", @"To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an iCloud account with iCloud Keychain enabled.", 0, 1 value table allowSiri];
  id v9 = [a1 customAccountNameForAccount:v4];

  id v10 = objc_alloc_init(ICAuthenticationAlert);
  if (ICInternalSettingsIsAppleAccountBrandingEnabled()) {
    v11 = @"Apple Account Required";
  }
  else {
    v11 = @"iCloud Account Required";
  }
  uint64_t v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v10 setTitle:v12];

  if ([v9 length])
  {
    id v13 = NSString;
    if (ICInternalSettingsIsAppleAccountBrandingEnabled()) {
      v14 = v7;
    }
    else {
      v14 = v8;
    }
    id v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v9);
    [(ICAuthenticationAlert *)v10 setMessage:v15];
  }
  else
  {
    [(ICAuthenticationAlert *)v10 setMessage:v6];
  }
  id v16 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Go to Settings" value:@"Go to Settings" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v10 setActionTitle:v16];

  [(ICAuthenticationAlert *)v10 setActionHandler:&__block_literal_global_300];
  id v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v10 setDismissTitle:v17];

  return v10;
}

void __68__ICAuthenticationAlert_signIntoCloudAccountActionAlertWithAccount___block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

+ (id)enableKeychainActionAlert
{
  double v2 = objc_alloc_init(ICAuthenticationAlert);
  id v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Turn on iCloud Keychain" value:@"Turn on iCloud Keychain" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must turn on iCloud Keychain in Settings to use your device passcode for locked notes." value:@"You must turn on iCloud Keychain in Settings to use your device passcode for locked notes." table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Go to Settings" value:@"Go to Settings" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setActionTitle:v5];

  [(ICAuthenticationAlert *)v2 setActionHandler:&__block_literal_global_311];
  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v6];

  return v2;
}

void __50__ICAuthenticationAlert_enableKeychainActionAlert__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

+ (id)keychainItemMissingInfoAlert
{
  double v2 = objc_alloc_init(ICAuthenticationAlert);
  id v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Can’t View Note" value:@"Can’t View Note" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes can’t decrypt this note because the encryption key wasn’t found. This could be due either to it not having synced down from iCloud yet or because iCloud Keychain data was reset, and thus the key was deleted.", @"Notes can’t decrypt this note because the encryption key wasn’t found. This could be due either to it not having synced down from iCloud yet or because iCloud Keychain data was reset, and thus the key was deleted.", 0, 1 value table allowSiri];
  [(ICAuthenticationAlert *)v2 setMessage:v4];

  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v5];

  return v2;
}

+ (id)cannotUnlockInfoAlert
{
  double v2 = objc_alloc_init(ICAuthenticationAlert);
  id v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Can’t View Note" value:@"Can’t View Note" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setTitle:v3];

  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v2 setDismissTitle:v4];

  return v2;
}

+ (id)updateDivergedDevicePasswordModeActionAlertWithAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ICAuthenticationAlert);
  id v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password?" value:@"Update Password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v4 setTitle:v5];

  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"This note is using your device passcode. Would you like to update it to use this account’s custom notes password?" value:@"This note is using your device passcode. Would you like to update it to use this account’s custom notes password?" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v4 setMessage:v6];

  uint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Update Password" value:@"Update Password" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v4 setActionTitle:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke;
  v11[3] = &unk_1E5FDD140;
  id v12 = v3;
  id v8 = v3;
  [(ICAuthenticationAlert *)v4 setActionHandler:v11];
  id v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Not Now" value:@"Not Now" table:0 allowSiri:1];
  [(ICAuthenticationAlert *)v4 setDismissTitle:v9];

  return v4;
}

void __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ICAuthenticationPrompt promptForChangingMode:1 account:*(void *)(a1 + 32)];
  id v5 = +[ICAuthentication shared];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke_2;
  v7[3] = &unk_1E5FDD1E0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  [v5 authenticateWithPrompt:v4 displayWindow:v6 completionHandler:v7];
}

void __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 2 && *(void *)(a1 + 32))
  {
    id v3 = +[ICLockedNotesModeMigrator sharedMigrator];
    [v3 migrateLockedNotesInAccount:*(void *)(a1 + 32) toMode:1 window:*(void *)(a1 + 40) completionHandler:0];
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationAlert shouldPresent](self, "shouldPresent"));
  uint64_t v7 = [(ICAuthenticationAlert *)self title];
  id v8 = [(ICAuthenticationAlert *)self message];
  id v9 = [v3 stringWithFormat:@"<%@: %p, shouldPresent: %@, title: %@, message: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    id v5 = ICDynamicCast();

    LODWORD(v4) = [v5 prefersSheet];
    if (v4 != [(ICAuthenticationAlert *)self prefersSheet])
    {
      LOBYTE(v6) = 0;
LABEL_50:

      return v6;
    }
    uint64_t v7 = [v5 title];
    id v8 = [(ICAuthenticationAlert *)self title];
    if (![v7 isEqualToString:v8])
    {
      LOBYTE(v6) = 0;
LABEL_49:

      goto LABEL_50;
    }
    id v9 = [(ICAuthenticationAlert *)self message];
    uint64_t v10 = [v5 message];
    v11 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v9) {
      id v12 = 0;
    }
    else {
      id v12 = v9;
    }
    uint64_t v13 = v12;
    v33 = (void *)v10;
    if (v11 == (void *)v10) {
      v14 = 0;
    }
    else {
      v14 = (void *)v10;
    }
    unint64_t v15 = v14;
    if (v13 | v15)
    {
      id v16 = (void *)v15;
      LOBYTE(v6) = 0;
      if (!v13 || !v15) {
        goto LABEL_29;
      }
      int v17 = [(id)v13 isEqual:v15];

      if (!v17)
      {
        LOBYTE(v6) = 0;
        id v24 = v33;
LABEL_48:

        goto LABEL_49;
      }
    }
    id v32 = v9;
    uint64_t v13 = [(ICAuthenticationAlert *)self actionTitle];
    id v16 = [v5 actionTitle];
    if (v11 == (void *)v13) {
      id v18 = 0;
    }
    else {
      id v18 = (void *)v13;
    }
    uint64_t v19 = v18;
    if (v11 == v16) {
      id v20 = 0;
    }
    else {
      id v20 = v16;
    }
    unint64_t v21 = v20;
    if (v19 | v21)
    {
      id v22 = (void *)v21;
      LOBYTE(v6) = 0;
      if (!v19 || !v21)
      {
        id v24 = v33;
LABEL_46:

        id v9 = v32;
        goto LABEL_47;
      }
      LODWORD(v6) = [(id)v19 isEqual:v21];

      if (!v6)
      {
LABEL_28:
        id v9 = v32;
LABEL_29:
        id v24 = v33;
LABEL_47:

        goto LABEL_48;
      }
    }
    int v23 = [v5 actionIsDestructive];
    if (v23 != [(ICAuthenticationAlert *)self actionIsDestructive])
    {
      LOBYTE(v6) = 0;
      goto LABEL_28;
    }
    uint64_t v19 = [(ICAuthenticationAlert *)self dismissTitle];
    id v22 = [v5 dismissTitle];
    if (v11 == (void *)v19) {
      id v25 = 0;
    }
    else {
      id v25 = (void *)v19;
    }
    unint64_t v6 = v25;
    if (v11 == v22) {
      id v26 = 0;
    }
    else {
      id v26 = v22;
    }
    unint64_t v27 = v26;
    id v28 = (void *)v27;
    v31 = (void *)v6;
    if (v6 | v27)
    {
      unint64_t v29 = v6;
      LOBYTE(v6) = 0;
      if (v29)
      {
        id v24 = v33;
        if (v27) {
          LOBYTE(v6) = [v31 isEqual:v27];
        }
        goto LABEL_45;
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
    id v24 = v33;
LABEL_45:

    goto LABEL_46;
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationAlert prefersSheet](self, "prefersSheet"));
  uint64_t v19 = [v3 hash];
  id v4 = [(ICAuthenticationAlert *)self title];
  char v5 = [v4 hash];
  unint64_t v6 = [(ICAuthenticationAlert *)self message];
  [v6 hash];
  uint64_t v7 = [(ICAuthenticationAlert *)self actionTitle];
  [v7 hash];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthenticationAlert actionIsDestructive](self, "actionIsDestructive"));
  [v8 hash];
  id v9 = [(ICAuthenticationAlert *)self dismissTitle];
  [v9 hash];
  unint64_t v17 = ICHashWithHashKeys(v19, v10, v11, v12, v13, v14, v15, v16, v5);

  return v17;
}

+ (id)customAccountNameForAccount:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F83278];
  char v5 = [v3 managedObjectContext];
  unint64_t v6 = [v4 allActiveAccountsInContext:v5];
  if ((unint64_t)[v6 count] < 2)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v7 = [v3 localizedName];
    id v8 = objc_msgSend(v7, "ic_trimmedString");
  }
  return v8;
}

- (BOOL)shouldPresent
{
  id v3 = [(ICAuthenticationAlert *)self shouldPresentHandler];
  if (v3)
  {
    id v4 = [(ICAuthenticationAlert *)self shouldPresentHandler];
    char v5 = v4[2]();
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)presentInWindow:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICAuthenticationAlert *)self prefersSheet])
  {
    id v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v9 = [v8 userInterfaceIdiom] != 0;
  }
  else
  {
    BOOL v9 = 1;
  }
  uint64_t v10 = [(ICAuthenticationAlert *)self title];
  uint64_t v11 = [(ICAuthenticationAlert *)self message];
  uint64_t v12 = +[ICAlertController alertControllerWithTitle:v10 message:v11 preferredStyle:v9];

  [v12 setDismissWithoutActionBlock:v7];
  uint64_t v13 = [(ICAuthenticationAlert *)self actionTitle];

  if (v13)
  {
    if ([(ICAuthenticationAlert *)self actionIsDestructive]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v16 = [(ICAuthenticationAlert *)self actionTitle];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke;
    v34[3] = &unk_1E5FDD208;
    id v17 = v12;
    id v35 = v17;
    v36 = self;
    id v37 = v6;
    id v38 = v7;
    id v18 = [v15 actionWithTitle:v16 style:v14 handler:v34];

    [v17 addAction:v18];
  }
  uint64_t v19 = [(ICAuthenticationAlert *)self dismissTitle];

  if (v19)
  {
    id v20 = (void *)MEMORY[0x1E4FB1410];
    unint64_t v21 = [(ICAuthenticationAlert *)self dismissTitle];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke_2;
    unint64_t v29 = &unk_1E5FDD208;
    id v22 = v12;
    id v30 = v22;
    v31 = self;
    id v32 = v6;
    id v33 = v7;
    int v23 = [v20 actionWithTitle:v21 style:1 handler:&v26];

    objc_msgSend(v22, "addAction:", v23, v26, v27, v28, v29);
  }
  id v24 = [v6 rootViewController];
  id v25 = objc_msgSend(v24, "ic_topViewController");
  [v25 presentViewController:v12 animated:1 completion:0];
}

uint64_t __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidPerformAction:1];
  double v2 = [*(id *)(a1 + 40) actionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) actionHandler];
    v3[2](v3, *(void *)(a1 + 48));
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    char v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidPerformAction:1];
  double v2 = [*(id *)(a1 + 40) dismissHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) dismissHandler];
    v3[2](v3, *(void *)(a1 + 48));
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    char v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

+ (void)presentAlertsIfNeeded:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = [v8 firstObject];
  int v12 = [v11 shouldPresent];

  if (v12)
  {
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatchMainAfterDelay();
  }
  else
  {
    uint64_t v13 = [v8 firstObject];

    if (v13)
    {
      uint64_t v14 = objc_msgSend(v8, "ic_subarrayFromIndex:", 1);
      [a1 presentAlertsIfNeeded:v14 window:v9 completionHandler:v10];
    }
    else if (v10)
    {
      v10[2](v10);
    }
  }
}

void __72__ICAuthenticationAlert_presentAlertsIfNeeded_window_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) firstObject];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__ICAuthenticationAlert_presentAlertsIfNeeded_window_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5FDD230;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v2 presentInWindow:v3 completionHandler:v4];
}

void __72__ICAuthenticationAlert_presentAlertsIfNeeded_window_completionHandler___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "ic_subarrayFromIndex:", 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 presentAlertsIfNeeded:v3 window:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

+ (void)resetPresentationsForAccount:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F83278];
  id v6 = [MEMORY[0x1E4F83428] sharedContext];
  id v7 = [v6 managedObjectContext];
  uint64_t v8 = [v5 allActiveAccountsInContext:v7];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        id v15 = objc_msgSend(MEMORY[0x1E4F83330], "sharedController", (void)v25);
        [v15 clearCachedDevicesForAccount:v14];

        id v16 = [MEMORY[0x1E4F832F8] sharedState];
        [v16 setBiometricsEnabled:0 forAccount:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  id v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v17 setBool:0 forKey:@"ICNoteAddPasswordFirstTimeMessageCompletedKey"];

  id v18 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v19 = [a1 enableBiometricsActionAlertShownKeyWithAccount:v4];
  [v18 setBool:0 forKey:v19];

  id v20 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  unint64_t v21 = [a1 switchToDevicePasswordPromptPresentedCountKeyForAccount:v4];
  [v20 setInteger:0 forKey:v21];

  id v22 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  int v23 = [a1 rememberCustomPasswordInfoAlertPresentedKeyForAccount:v4];
  [v22 setBool:0 forKey:v23];

  id v24 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v24 setObject:0 forKey:@"ICAuthenticationSetDevicePasswordInfoPresentedAt"];
}

- (BOOL)prefersSheet
{
  return self->_prefersSheet;
}

- (void)setPrefersSheet:(BOOL)a3
{
  self->_prefersSheet = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (BOOL)actionIsDestructive
{
  return self->_actionIsDestructive;
}

- (void)setActionIsDestructive:(BOOL)a3
{
  self->_actionIsDestructive = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (NSString)dismissTitle
{
  return self->_dismissTitle;
}

- (void)setDismissTitle:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (id)shouldPresentHandler
{
  return self->_shouldPresentHandler;
}

- (void)setShouldPresentHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldPresentHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_dismissTitle, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end