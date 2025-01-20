@interface OBWelcomeController(Spinner)
- (void)_hideButtonTraySpinner;
- (void)_prepareSpinner;
- (void)_showButtonTraySpinnerWithBusyText:()Spinner;
- (void)_updateBusyText:()Spinner;
- (void)_updateTrayButtonText:()Spinner;
@end

@implementation OBWelcomeController(Spinner)

- (void)_prepareSpinner
{
  v2 = [a1 spinnerContainer];

  if (!v2)
  {
    v3 = [MEMORY[0x263F5B8D0] linkButton];
    [a1 setSpinnerContainer:v3];

    v4 = [a1 spinnerContainer];
    [v4 setTitle:@" " forState:0];

    v5 = [[SSSpinner alloc] initWithText:@" "];
    [a1 setSpinner:v5];

    v6 = [a1 spinner];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [a1 spinnerContainer];
    v8 = [a1 spinner];
    [v7 addSubview:v8];

    v9 = [a1 spinner];
    v10 = [v9 centerXAnchor];
    v11 = [a1 spinnerContainer];
    v12 = [v11 centerXAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    id v18 = [a1 spinner];
    v14 = [v18 centerYAnchor];
    v15 = [a1 spinnerContainer];
    v16 = [v15 centerYAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];
  }
}

- (void)_showButtonTraySpinnerWithBusyText:()Spinner
{
  id v4 = a3;
  char v5 = [a1 animating];
  [a1 setAnimating:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__OBWelcomeController_Spinner___showButtonTraySpinnerWithBusyText___block_invoke;
  block[3] = &unk_264827B58;
  char v9 = v5;
  block[4] = a1;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_hideButtonTraySpinner
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__OBWelcomeController_Spinner___hideButtonTraySpinner__block_invoke;
  block[3] = &unk_2648279D0;
  block[4] = a1;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_updateTrayButtonText:()Spinner
{
  id v12 = a3;
  id v4 = [v12 userInfo];

  if (v4)
  {
    char v5 = [v12 userInfo];
    id v6 = [v5 objectForKey:@"InstallStateKey"];

    if (v6)
    {
      int v7 = [v6 isEqualToString:@"PostInstall"];
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v9 = v8;
      if (v7) {
        v10 = @"CONTINUE_BUTTON_STATE_POST_INSTALLING";
      }
      else {
        v10 = @"CONTINUE_BUTTON_STATE_INSTALLING";
      }
      v11 = [v8 localizedStringForKey:v10 value:&stru_26DBE8E78 table:@"Localizable"];
      [a1 _updateBusyText:v11];
    }
  }
}

- (void)_updateBusyText:()Spinner
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = objc_msgSend(a1, "buttonTray", 0);
  id v6 = [v5 buttons];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 updateBusyText:v4];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v6 = [a1 spinner];
  [v6 updateText:v4];
LABEL_11:
}

@end