@interface STRestrictionsPINController
- (BOOL)validatePIN:(id)a3;
- (id)pinInstructionsPrompt;
- (void)_setOptionsTitle:(id)a3 optionsHandler:(id)a4;
- (void)recoveryAuthenticationFailed:(id)a3;
- (void)recoveryAuthenticationSucceededForPasscode:(id)a3;
- (void)setPIN:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STRestrictionsPINController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(STRestrictionsPINController *)self specifier];
  v6 = [v5 objectForKeyedSubscript:@"PreventDismissalWhenDone"];
  -[DevicePINController setShouldDismissWhenDone:](self, "setShouldDismissWhenDone:", [v6 BOOLValue] ^ 1);

  v7 = [v5 objectForKeyedSubscript:@"PINOptionsTitle"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"PINOptionsHandler"];
  v9 = (void *)v8;
  if (v7 && v8)
  {
    v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v11 = [v10 integerForKey:@"PasscodeRecoveryAttempts"];

    if ([(DevicePINController *)self isBlocked] && v11 >= 1)
    {
      [(DevicePINController *)self unblockTime];
      double v13 = v12;
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v15 = v13 - v14;
      v16 = (void *)MEMORY[0x263EFFA20];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __46__STRestrictionsPINController_viewWillAppear___block_invoke;
      v21[3] = &unk_264768120;
      v21[4] = self;
      id v22 = v7;
      id v23 = v9;
      v17 = [v16 timerWithTimeInterval:0 repeats:v21 block:v15];
      v18 = [MEMORY[0x263EFF9F0] currentRunLoop];
      [v18 addTimer:v17 forMode:*MEMORY[0x263EFF478]];
    }
    else
    {
      [(STRestrictionsPINController *)self _setOptionsTitle:v7 optionsHandler:v9];
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STRestrictionsPINController.viewWillAppear", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)STRestrictionsPINController;
  [(DevicePINController *)&v19 viewWillAppear:v3];
}

void __46__STRestrictionsPINController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setOptionsTitle:*(void *)(a1 + 40) optionsHandler:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) pane];
  [*(id *)(a1 + 32) setPane:v2];
  objc_msgSend(v2, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", objc_msgSend(*(id *)(a1 + 32), "simplePIN"), objc_msgSend(*(id *)(a1 + 32), "requiresKeyboard"), objc_msgSend(*(id *)(a1 + 32), "isNumericPIN"), 0, 1);
}

- (void)_setOptionsTitle:(id)a3 optionsHandler:(id)a4
{
  id v6 = a4;
  [(DevicePINController *)self setPasscodeOptionsTitle:a3];
  v7 = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__STRestrictionsPINController__setOptionsTitle_optionsHandler___block_invoke;
  v10[3] = &unk_264768148;
  uint64_t v11 = v7;
  id v12 = v6;
  uint64_t v8 = v7;
  id v9 = v6;
  [(DevicePINController *)v8 setPasscodeOptionsHandler:v10];
}

uint64_t __63__STRestrictionsPINController__setOptionsTitle_optionsHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (id)pinInstructionsPrompt
{
  uint64_t v3 = *(int *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD30]);
  if (v3 <= 3
    && (objc_msgSend(NSString, "stringWithFormat:", off_264768190[v3], *(unsigned int *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD38])), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    id v6 = +[STScreenTimeSettingsUIBundle bundle];
    v7 = [v6 localizedStringForKey:v5 value:&stru_26D9391A8 table:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STRestrictionsPINController;
    v7 = [(PSRestrictionsPINController *)&v9 pinInstructionsPrompt];
  }

  return v7;
}

- (BOOL)validatePIN:(id)a3
{
  id v4 = a3;
  v5 = [(DevicePINController *)self pinDelegate];
  int v6 = [v5 validatePIN:v4 forPINController:self];

  if (v6)
  {
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v7 setInteger:0 forKey:@"PasscodeRecoveryAttempts"];
  }
  return v6;
}

- (void)setPIN:(id)a3
{
  id v7 = a3;
  id v4 = [(DevicePINController *)self pinDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(DevicePINController *)self pinDelegate];
    [v6 setPIN:v7 forPINController:self];
  }
}

- (void)recoveryAuthenticationSucceededForPasscode:(id)a3
{
  id v5 = a3;
  if ([(DevicePINController *)self isBlocked])
  {
    [(DevicePINController *)self attemptValidationWithPIN:v5];
    id v4 = [(PSDetailController *)self pane];
    [v4 showError:0 error:0 isBlocked:0 animate:0];
  }
  [(DevicePINController *)self pinEntered:v5];
}

- (void)recoveryAuthenticationFailed:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [v5 integerForKey:@"PasscodeRecoveryAttempts"];
  if ([(DevicePINController *)self isBlocked]) {
    [v5 setInteger:++v6 forKey:@"PasscodeRecoveryAttempts"];
  }
  else {
    [(DevicePINController *)self pinEntered:0];
  }
  if (v6 >= 1)
  {
    [v4 setHidden:1];
    [(DevicePINController *)self unblockTime];
    double v8 = v7;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v10 = v8 - v9;
    uint64_t v11 = (void *)MEMORY[0x263EFFA20];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__STRestrictionsPINController_recoveryAuthenticationFailed___block_invoke;
    v14[3] = &unk_264768170;
    id v15 = v4;
    id v12 = [v11 timerWithTimeInterval:0 repeats:v14 block:v10];
    double v13 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v13 addTimer:v12 forMode:*MEMORY[0x263EFF478]];
  }
}

uint64_t __60__STRestrictionsPINController_recoveryAuthenticationFailed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:0];
}

@end