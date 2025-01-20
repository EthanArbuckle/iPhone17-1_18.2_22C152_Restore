@interface SBActivationFailedAlertItem
- (BOOL)suppressForKeynote;
- (SBActivationFailedAlertItem)initWithFailureCount:(int)a3 slot:(int64_t)a4;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBActivationFailedAlertItem

- (SBActivationFailedAlertItem)initWithFailureCount:(int)a3 slot:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBActivationFailedAlertItem;
  v6 = [(SBAlertItem *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_slot = a4;
    v8 = [(id)SBApp telephonyStateProvider];
    v9 = [v8 carrierBundleInfoForSlot:v7->_slot];

    if ([v9 isReinitiatingActivationDisabled])
    {
      v7->_showSupportNumber = 1;
    }
    else
    {
      v7->_showRetryButton = 1;
      if (a3 >= 2)
      {
        v7->_showSupportNumber = 1;
        if (a3 != 2) {
          v7->_showRetryButton = 0;
        }
      }
    }
  }
  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"ACTIVATION_FAILED_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 localizedStringForKey:@"ACTIVATION_FAILED_BODY" value:@"Contact your carrier if this problem continues to occur." table:@"SpringBoard"];

  if (self->_showSupportNumber)
  {
    v10 = [(id)SBApp telephonyStateProvider];
    objc_super v11 = [v10 carrierBundleInfoForSlot:self->_slot];

    v12 = [v11 customerServicePhoneNumber];
    if (v12)
    {
      v13 = NSString;
      v14 = [MEMORY[0x1E4F28B50] mainBundle];
      v15 = [v14 localizedStringForKey:@"ACTIVATION_FAILED_BODY_SUPPORT" value:@"Contact your carrier at %@ from another phone if this problem continues to occur." table:@"SpringBoard"];
      v16 = UIFormattedPhoneNumberFromString();
      objc_msgSend(v13, "stringWithFormat:", v15, v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = v9;
    }
  }
  else
  {
    id v17 = v9;
  }
  [v5 setMessage:v17];
  BOOL showRetryButton = self->_showRetryButton;
  v19 = (void *)MEMORY[0x1E4F42720];
  v20 = [MEMORY[0x1E4F28B50] mainBundle];
  v21 = v20;
  if (showRetryButton)
  {
    v22 = [v20 localizedStringForKey:@"ACTIVATION_FAILED_IGNORE_BUTTON" value:&stru_1F3084718 table:@"SpringBoard"];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke;
    v32[3] = &unk_1E6AF4918;
    v32[4] = self;
    v23 = [v19 actionWithTitle:v22 style:1 handler:v32];
    [v5 addAction:v23];

    v24 = (void *)MEMORY[0x1E4F42720];
    v25 = [MEMORY[0x1E4F28B50] mainBundle];
    v26 = [v25 localizedStringForKey:@"ACTIVATION_FAILED_RETRY_BUTTON" value:&stru_1F3084718 table:@"SpringBoard"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v31[3] = &unk_1E6AF4918;
    v31[4] = self;
    v27 = [v24 actionWithTitle:v26 style:0 handler:v31];
    [v5 addAction:v27];
  }
  else
  {
    v28 = [v20 localizedStringForKey:@"DISMISS_ALERT" value:&stru_1F3084718 table:@"SpringBoard"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_3;
    v30[3] = &unk_1E6AF4918;
    v30[4] = self;
    v29 = [v19 actionWithTitle:v28 style:1 handler:v30];
    [v5 addAction:v29];
  }
}

uint64_t __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

uint64_t __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  CTStartOTASP();
  v2 = *(void **)(a1 + 32);
  return [v2 deactivateForButton];
}

uint64_t __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)suppressForKeynote
{
  return 1;
}

@end