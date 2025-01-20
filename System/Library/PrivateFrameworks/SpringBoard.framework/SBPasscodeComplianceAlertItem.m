@interface SBPasscodeComplianceAlertItem
- (BOOL)shouldShowInLockScreen;
- (SBPasscodeComplianceAlertItem)initWithTitle:(id)a3 message:(id)a4 continueButtonTitle:(id)a5 cancelButtonTitle:(id)a6;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBPasscodeComplianceAlertItem

- (SBPasscodeComplianceAlertItem)initWithTitle:(id)a3 message:(id)a4 continueButtonTitle:(id)a5 cancelButtonTitle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SBPasscodeComplianceAlertItem;
  v15 = [(SBAlertItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_message, a4);
    objc_storeStrong((id *)&v16->_continueButtonTitle, a5);
    objc_storeStrong((id *)&v16->_cancelButtonTitle, a6);
  }

  return v16;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  [v5 setTitle:self->_title];
  [v5 setMessage:self->_message];
  cancelButtonTitle = self->_cancelButtonTitle;
  if (cancelButtonTitle)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke;
    v11[3] = &unk_1E6AF4918;
    v11[4] = self;
    v7 = [MEMORY[0x1E4F42720] actionWithTitle:cancelButtonTitle style:1 handler:v11];
    [v5 addAction:v7];
  }
  continueButtonTitle = self->_continueButtonTitle;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v10[3] = &unk_1E6AF4918;
  v10[4] = self;
  v9 = [MEMORY[0x1E4F42720] actionWithTitle:continueButtonTitle style:0 handler:v10];
  [v5 addAction:v9];
}

uint64_t __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v2 = +[SBPasscodeController sharedInstance];
  [v2 _userWantsToComplyNow:0];

  v3 = *(void **)(a1 + 32);
  return [v3 deactivateForButton];
}

uint64_t __69__SBPasscodeComplianceAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  v2 = +[SBPasscodeController sharedInstance];
  [v2 _userWantsToComplyNow:1];

  v3 = *(void **)(a1 + 32);
  return [v3 deactivateForButton];
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_continueButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end