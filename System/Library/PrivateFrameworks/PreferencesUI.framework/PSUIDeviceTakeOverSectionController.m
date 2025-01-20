@interface PSUIDeviceTakeOverSectionController
- (BOOL)isFindMyEnabled;
- (BOOL)shouldIgnoreSecurityOptionsGroupRowSelectionFor:(id)a3;
- (BOOL)shouldIgnoreToggleGroupRowSelectionFor:(id)a3;
- (PSUIDeviceTakeOverController)dtoController;
- (PSUIDeviceTakeOverSectionController)init;
- (id)getSpecifiersForSecurityOptionsGroup:(id)a3;
- (id)getSpecifiersForToggleGroup:(id)a3;
- (id)getStatus;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)addSpecifiers:(id)a3 toExistingSpecifiers:(id)a4 atIndex:(unint64_t)a5;
- (void)disableDTO;
- (void)enableDTO;
- (void)ensureAccountSecurityIsSufficientWithCompletion:(id)a3;
- (void)openLearnMoreLink;
- (void)performPreEnableDTOChecksWithCompletion:(id)a3;
- (void)printSpecifiersDescription:(id)a3;
- (void)proceedToDisableDTO;
- (void)proceedToEnableDTO;
- (void)reloadEntirePane;
- (void)setDtoController:(id)a3;
- (void)setIsFindMyEnabled:(BOOL)a3;
- (void)setUpFindMyEnablementStatus;
- (void)showAlertForFailedToUpdateSecurityDelay;
- (void)showAlertForFindMyIsDisabledWithCompletion:(id)a3;
- (void)showDTOAlertForFailureToToggleToState:(BOOL)a3 withRatchetError:(unint64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleStatusTo:(id)a3;
- (void)toggleToStrictMode:(BOOL)a3;
- (void)updateFooterForSecurityOptionsGroupSpecifier:(id)a3;
- (void)updateFooterForToggleGroupSpecifier:(id)a3;
- (void)userUpdatedSecurityOptionTo:(id)a3;
@end

@implementation PSUIDeviceTakeOverSectionController

- (PSUIDeviceTakeOverSectionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSUIDeviceTakeOverSectionController;
  v2 = [(PSUIDeviceTakeOverSectionController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dtoController = v2->_dtoController;
    v2->_dtoController = (PSUIDeviceTakeOverController *)v3;

    [(PSUIDeviceTakeOverSectionController *)v2 setUpFindMyEnablementStatus];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (objc_class *)objc_opt_new();
    objc_super v6 = [(PSUIDeviceTakeOverSectionController *)self getSpecifiersForToggleGroup:@"DTO_TOGGLE_GROUP_ID"];
    [(PSUIDeviceTakeOverSectionController *)self addSpecifiers:v6 toExistingSpecifiers:v5 atIndex:0];
    v7 = [(PSUIDeviceTakeOverSectionController *)self getStatus];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      v9 = [(PSUIDeviceTakeOverSectionController *)self getSpecifiersForSecurityOptionsGroup:@"DTO_SECURITY_OPTIONS_GROUP_ID"];
      -[PSUIDeviceTakeOverSectionController addSpecifiers:toExistingSpecifiers:atIndex:](self, "addSpecifiers:toExistingSpecifiers:atIndex:", v9, v5, [v6 count]);
    }
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;
    v11 = v5;

    [(PSUIDeviceTakeOverSectionController *)self printSpecifiersDescription:v11];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)reloadEntirePane
{
  uint64_t v3 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Reloading the pane", v4, 2u);
  }

  [(PSUIDeviceTakeOverSectionController *)self reloadSpecifiers];
}

- (void)printSpecifiersDescription:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"DTO Summary: "];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v6)
  {
    int v8 = 0;
    goto LABEL_29;
  }
  uint64_t v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v34;
  uint64_t v31 = *MEMORY[0x263F60200];
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
      v12 = [v11 identifier];
      int v13 = [v12 isEqualToString:@"DTO_TOGGLE_GROUP_ID"];

      if (v13)
      {
        v14 = v4;
        v15 = @"| Group 1: Toggle";
LABEL_8:
        [v14 appendString:v15];
        goto LABEL_13;
      }
      v16 = [v11 identifier];
      int v17 = [v16 isEqualToString:@"DTO_TOGGLE_ID"];

      if (v17)
      {
        v18 = [(PSUIDeviceTakeOverSectionController *)self getStatus];
        [v4 appendFormat:@" -> Toggled [%@]", v18];
      }
      else
      {
        v19 = [v11 identifier];
        int v20 = [v19 isEqualToString:@"DTO_SECURITY_OPTIONS_GROUP_ID"];

        if (!v20)
        {
          v25 = [v11 identifier];
          int v26 = [v25 isEqualToString:@"DTO_SECURITY_OPTION_ALWAYS_FAMILIAR_ID"];

          if (v26)
          {
            if (v8 && [v8 isEqualToSpecifier:v11])
            {
              v14 = v4;
              v15 = @" -> i. Familiar only [Checked]";
            }
            else
            {
              v14 = v4;
              v15 = @" -> i. Familiar only";
            }
          }
          else
          {
            v27 = [v11 identifier];
            int v28 = [v27 isEqualToString:@"DTO_SECURITY_OPTION_ALWAYS_ID"];

            if (v28)
            {
              if (v8 && [v8 isEqualToSpecifier:v11])
              {
                v14 = v4;
                v15 = @" -> ii. Always [Checked]";
              }
              else
              {
                v14 = v4;
                v15 = @" -> ii. Always";
              }
            }
            else
            {
              v14 = v4;
              v15 = @" *** Unknown ***";
            }
          }
          goto LABEL_8;
        }
        v21 = NSNumber;
        v22 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
        v23 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "isStrictModeEnabled"));
        [v4 appendFormat:@"| Group 2: Options (Strict Mode = %@)", v23];

        uint64_t v24 = [v11 objectForKeyedSubscript:v31];

        int v8 = (void *)v24;
      }
LABEL_13:
      ++v10;
    }
    while (v7 != v10);
    uint64_t v29 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    uint64_t v7 = v29;
  }
  while (v29);
LABEL_29:

  v30 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_23D33A000, v30, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)addSpecifiers:(id)a3 toExistingSpecifiers:(id)a4 atIndex:(unint64_t)a5
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = [v10 count];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", a5, v8);
    [v7 insertObjects:v10 atIndexes:v9];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(PSUIDeviceTakeOverSectionController *)self indexForIndexPath:a4];
  id v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  [(PSUIDeviceTakeOverSectionController *)self userUpdatedSecurityOptionTo:v6];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PSUIDeviceTakeOverSectionController *)self specifierAtIndex:[(PSUIDeviceTakeOverSectionController *)self indexForIndexPath:v5]];
  if ([(PSUIDeviceTakeOverSectionController *)self shouldIgnoreToggleGroupRowSelectionFor:v6])
  {
    id v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      uint64_t v8 = "DTO: User tapped on Toggle row, ignoring";
      uint64_t v9 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(PSUIDeviceTakeOverSectionController *)self shouldIgnoreSecurityOptionsGroupRowSelectionFor:v6])
  {
    id v7 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      uint64_t v8 = "DTO: User tapped on already currently check marked security option, ignoring";
      uint64_t v9 = (uint8_t *)&v12;
      goto LABEL_7;
    }
LABEL_8:

    id v10 = 0;
    goto LABEL_10;
  }
  id v10 = v5;
LABEL_10:

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PSUIDeviceTakeOverSectionController;
  v4 = [(PSUIDeviceTakeOverSectionController *)&v6 tableView:a3 cellForRowAtIndexPath:a4];
  [v4 setSelectionStyle:0];
  return v4;
}

- (id)getSpecifiersForToggleGroup:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_super v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F10E0E8 target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v6 setIdentifier:v4];

  uint64_t v7 = MEMORY[0x263EFFA88];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  [(PSUIDeviceTakeOverSectionController *)self updateFooterForToggleGroupSpecifier:v6];
  [v5 addObject:v6];
  uint64_t v8 = (void *)MEMORY[0x263F5FC40];
  uint64_t v9 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_STATUS_LABEL_DESCRIPTION");
  id v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel_toggleStatusTo_ get:sel_getStatus detail:0 cell:6 edit:0];

  [v10 setIdentifier:@"DTO_TOGGLE_ID"];
  [v10 setProperty:v7 forKey:*MEMORY[0x263F5FEF8]];
  [v5 addObject:v10];

  return v5;
}

- (void)updateFooterForToggleGroupSpecifier:(id)a3
{
  id v4 = a3;
  PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_GROUP_FOOTER_DESCRIPTION");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_GROUP_FOOTER_DESCRIPTION_SUFFIX_LINK");
  objc_super v6 = [NSString stringWithFormat:@"%@ %@", v11, v5];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v4 setProperty:v8 forKey:*MEMORY[0x263F600C0]];

  [v4 setProperty:v6 forKey:*MEMORY[0x263F600E8]];
  v13.location = [v6 rangeOfString:v5];
  uint64_t v9 = NSStringFromRange(v13);
  [v4 setProperty:v9 forKey:*MEMORY[0x263F600D0]];

  id v10 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v4 setProperty:v10 forKey:*MEMORY[0x263F600E0]];

  [v4 setProperty:@"openLearnMoreLink" forKey:*MEMORY[0x263F600C8]];
}

- (id)getStatus
{
  v2 = NSNumber;
  id v3 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isRatchetEnabled"));

  return v4;
}

- (void)toggleStatusTo:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "DTO: User toggled to state [%@]", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 BOOLValue]) {
    [(PSUIDeviceTakeOverSectionController *)self proceedToEnableDTO];
  }
  else {
    [(PSUIDeviceTakeOverSectionController *)self proceedToDisableDTO];
  }
}

- (void)proceedToEnableDTO
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke;
  v2[3] = &unk_264E95548;
  v2[4] = self;
  [(PSUIDeviceTakeOverSectionController *)self performPreEnableDTOChecksWithCompletion:v2];
}

void __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Turn On Protection [Prechecks: %@]", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_90;
  v6[3] = &unk_264E956D0;
  objc_copyWeak(&v7, (id *)buf);
  char v8 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      [WeakRetained enableDTO];
    }
    else {
      [WeakRetained reloadSpecifiersPostStatusToggle];
    }
  }
  else
  {
    id v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_90_cold_1();
    }
  }
}

- (void)enableDTO
{
  id v3 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke;
  v4[3] = &unk_264E95C88;
  v4[4] = self;
  [v3 enableRatchetWithCompletion:v4];
}

void __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Turn On Protection [%@]", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke_93;
  v6[3] = &unk_264E95C60;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __48__PSUIDeviceTakeOverSectionController_enableDTO__block_invoke_93(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40) != 1) {
      objc_msgSend(WeakRetained, "showDTOAlertForFailureToToggleToState:withRatchetError:", 1);
    }
    [v3 reloadSpecifiersPostStatusToggle];
  }
  else
  {
    id v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_90_cold_1();
    }
  }
}

- (void)proceedToDisableDTO
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Turn Off Protection [Failed] - was not on!", v2, v3, v4, v5, v6);
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2;
  v3[3] = &unk_264E95C60;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(v4);
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = PSUILogForCategory(1uLL);
    uint64_t v5 = v4;
    if (v3 == 2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_2();
      }

      [WeakRetained reloadSpecifiersPostStatusToggle];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "DTO: Turn Off Protection [Proceeding]", v7, 2u);
      }

      [WeakRetained disableDTO];
    }
  }
  else
  {
    uint8_t v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_1();
    }
  }
}

- (void)disableDTO
{
  uint64_t v3 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  id v4[2] = __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke;
  v4[3] = &unk_264E95C88;
  v4[4] = self;
  [v3 disableRatchetWithCompletion:v4];
}

void __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Turn Off Protection [%@]", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke_95;
  v6[3] = &unk_264E95C60;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __49__PSUIDeviceTakeOverSectionController_disableDTO__block_invoke_95(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40) != 1) {
      objc_msgSend(WeakRetained, "showDTOAlertForFailureToToggleToState:withRatchetError:", 0);
    }
    [v3 reloadSpecifiersPostStatusToggle];
  }
  else
  {
    uint64_t v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_1();
    }
  }
}

- (BOOL)shouldIgnoreToggleGroupRowSelectionFor:(id)a3
{
  uint64_t v3 = [(PSUIDeviceTakeOverSectionController *)self getGroupSpecifierForSpecifier:a3];
  uint64_t v4 = [v3 identifier];
  char v5 = [v4 isEqualToString:@"DTO_TOGGLE_GROUP_ID"];

  return v5;
}

- (void)openLearnMoreLink
{
  uint64_t v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "DTO: User clicked on support link.", v7, 2u);
  }

  uint64_t v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = NSURL;
  char v5 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_COULD_NOT_TOGGLE_LEARN_MORE_LINK");
  uint8_t v6 = [v4 URLWithString:v5];
  [v3 openURL:v6 withCompletionHandler:&__block_literal_global_4];
}

void __56__PSUIDeviceTakeOverSectionController_openLearnMoreLink__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __56__PSUIDeviceTakeOverSectionController_openLearnMoreLink__block_invoke_cold_1();
    }
  }
}

- (void)setUpFindMyEnablementStatus
{
  objc_initWeak(&location, self);
  uint64_t v2 = [MEMORY[0x263F3CC60] sharedInstance];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke;
  v3[3] = &unk_264E95CF8;
  objc_copyWeak(&v4, &location);
  [v2 fmipStateWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint8_t v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_2(v5, v6);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setIsFindMyEnabled:a2 == 1];
    uint64_t v9 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isFindMyEnabled"));
      int v11 = 138412290;
      __int16 v12 = v10;
      _os_log_impl(&dword_23D33A000, v9, OS_LOG_TYPE_DEFAULT, "Find My Device: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_1();
    }
  }
}

- (void)ensureAccountSecurityIsSufficientWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = PSUsedByHSA2Account();
  uint64_t v6 = PSJoinedCDPCircleAccount();
  id v7 = PSUILogForCategory(1uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if v5 && (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Account security: No need to Upgrade", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = [NSNumber numberWithBool:v5];
      uint64_t v10 = [NSNumber numberWithBool:v6];
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Account security: Upgrading since HSA2 [%@] CDPCircle [%@]", buf, 0x16u);
    }
    int v11 = [MEMORY[0x263EFB210] defaultStore];
    __int16 v12 = objc_msgSend(v11, "aa_primaryAppleAccount");
    uint64_t v13 = objc_msgSend(v12, "aa_altDSID");
    if (v13)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x263F34A18]) initWithAltDSID:v13];
      [v14 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
      [v14 setDeviceToDeviceEncryptionUpgradeType:0];
      v15 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_MUST_UPGRADE_ACCOUNT_SECURITY");
      [v14 setFeatureName:v15];

      [v14 setPresentingViewController:self];
      v16 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v14];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __87__PSUIDeviceTakeOverSectionController_ensureAccountSecurityIsSufficientWithCompletion___block_invoke;
      v18[3] = &unk_264E95628;
      v19 = v4;
      [v16 performDeviceToDeviceEncryptionStateRepairWithCompletion:v18];
    }
    else
    {
      int v17 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[PSUIDeviceTakeOverSectionController ensureAccountSecurityIsSufficientWithCompletion:](v17);
      }

      [(PSUIDeviceTakeOverSectionController *)self showDTOAlertForFailureToToggleToState:1 withRatchetError:2];
      v4[2](v4, 0);
    }
  }
}

void __87__PSUIDeviceTakeOverSectionController_ensureAccountSecurityIsSufficientWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = PSUsedByHSA2Account();
  uint64_t v7 = PSJoinedCDPCircleAccount();
  BOOL v8 = PSUILogForCategory(1uLL);
  uint64_t v9 = v8;
  if v6 && (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [NSNumber numberWithBool:a2];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_23D33A000, v9, OS_LOG_TYPE_DEFAULT, "Account security: Upgrading [Success] - Repaired: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v11 = [NSNumber numberWithBool:v6];
    __int16 v12 = [NSNumber numberWithBool:v7];
    uint64_t v13 = [NSNumber numberWithBool:a2];
    v14 = [v5 description];
    int v15 = 138413058;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2112;
    int v20 = v13;
    __int16 v21 = 2112;
    __int16 v22 = v14;
    _os_log_error_impl(&dword_23D33A000, v9, OS_LOG_TYPE_ERROR, "Account security: Upgrading [Failed] since HSA2 [%@] CDPCircle [%@] - Repaired: %@ Error: %@", (uint8_t *)&v15, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPreEnableDTOChecksWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "DTO: Turn On Protection [Performing prechecks]", buf, 2u);
  }

  if ([(PSUIDeviceTakeOverSectionController *)self isFindMyEnabled])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __79__PSUIDeviceTakeOverSectionController_performPreEnableDTOChecksWithCompletion___block_invoke;
    v6[3] = &unk_264E95D20;
    id v7 = v4;
    [(PSUIDeviceTakeOverSectionController *)self ensureAccountSecurityIsSufficientWithCompletion:v6];
  }
  else
  {
    [(PSUIDeviceTakeOverSectionController *)self showAlertForFindMyIsDisabledWithCompletion:v4];
  }
}

uint64_t __79__PSUIDeviceTakeOverSectionController_performPreEnableDTOChecksWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showAlertForFindMyIsDisabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82418];
  uint64_t v6 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_MUST_TURN_ON_FIND_MY_TITLE");
  id v7 = [v5 alertControllerWithTitle:0 message:v6 preferredStyle:1];

  BOOL v8 = (void *)MEMORY[0x263F82400];
  uint64_t v9 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_OK_BUTTON");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__PSUIDeviceTakeOverSectionController_showAlertForFindMyIsDisabledWithCompletion___block_invoke;
  v14[3] = &unk_264E953F8;
  id v15 = v4;
  id v10 = v4;
  int v11 = [v8 actionWithTitle:v9 style:0 handler:v14];
  [v7 addAction:v11];

  __int16 v12 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_23D33A000, v12, OS_LOG_TYPE_DEFAULT, "Find My: Alert [Shown]", v13, 2u);
  }

  [(PSUIDeviceTakeOverSectionController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __82__PSUIDeviceTakeOverSectionController_showAlertForFindMyIsDisabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Find My: Alert [Dismissed]", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showDTOAlertForFailureToToggleToState:(BOOL)a3 withRatchetError:(unint64_t)a4
{
  BOOL v4 = a3;
  location[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x263F82418];
  if (a4 == 3)
  {
    if (PSSupportsMesa()) {
      id v7 = @"DTO_ALERT_TOUCH_ID_REQUIRED_TO_ENABLE";
    }
    else {
      id v7 = @"DTO_ALERT_FACE_ID_REQUIRED_TO_ENABLE";
    }
    BOOL v8 = PSUI_LocalizedStringForPasscodeDimpleKey(v7);
    uint64_t v9 = [v6 alertControllerWithTitle:0 message:v8 preferredStyle:1];

    objc_initWeak(location, self);
    id v10 = (void *)MEMORY[0x263F82400];
    int v11 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_COULD_NOT_TOGGLE_LEARN_MORE_BUTTON");
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke;
    v21[3] = &unk_264E95D48;
    BOOL v23 = v4;
    objc_copyWeak(&v22, location);
    __int16 v12 = [v10 actionWithTitle:v11 style:0 handler:v21];
    [v9 addAction:v12];

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    if (a3) {
      PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_COULD_NOT_TOGGLE_TO_ON_TITLE");
    }
    else {
    uint64_t v13 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_COULD_NOT_TOGGLE_TO_OFF_TITLE");
    }
    uint64_t v9 = [v6 alertControllerWithTitle:0 message:v13 preferredStyle:1];
  }
  v14 = (void *)MEMORY[0x263F82400];
  id v15 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_OK_BUTTON");
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_140;
  v19[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  BOOL v20 = v4;
  v16 = [v14 actionWithTitle:v15 style:0 handler:v19];
  [v9 addAction:v16];

  __int16 v17 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = @"Off";
    if (v4) {
      v18 = @"On";
    }
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v18;
    _os_log_impl(&dword_23D33A000, v17, OS_LOG_TYPE_DEFAULT, "DTO: Turn %@ Protection [Failed] - Alert [Shown]", (uint8_t *)location, 0xCu);
  }

  [(PSUIDeviceTakeOverSectionController *)self presentViewController:v9 animated:1 completion:0];
}

void __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"On";
    }
    else {
      uint64_t v3 = @"Off";
    }
    int v7 = 138412290;
    BOOL v8 = v3;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "DTO: Turn %@ Protection [Failed] - Alert [Dismissed - Learn More]", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained openLearnMoreLink];
  }
  else
  {
    uint64_t v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_cold_1();
    }
  }
}

void __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_140(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v3 = @"On";
    }
    else {
      uint64_t v3 = @"Off";
    }
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "DTO: Turn %@ Protection [Failed] - Alert [Dismissed]", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getSpecifiersForSecurityOptionsGroup:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x263F5FC40];
  int v7 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_SECURITY_DELAY_OPTIONS_GROUP_HEADER_DESCRIPTION");
  BOOL v8 = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:0 edit:0];

  [v8 setIdentifier:v4];
  uint64_t v9 = MEMORY[0x263EFFA88];
  [v8 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  [(PSUIDeviceTakeOverSectionController *)self updateFooterForSecurityOptionsGroupSpecifier:v8];
  [v5 addObject:v8];
  id v10 = (void *)MEMORY[0x263F5FC40];
  int v11 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_SECURITY_DELAY_OPTION_AWAY_FAMILIAR_LOCATIONS_ONLY");
  __int16 v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v12 setIdentifier:@"DTO_SECURITY_OPTION_ALWAYS_FAMILIAR_ID"];
  uint64_t v13 = *MEMORY[0x263F5FEF8];
  [v12 setProperty:v9 forKey:*MEMORY[0x263F5FEF8]];
  [v5 addObject:v12];
  v14 = (void *)MEMORY[0x263F5FC40];
  id v15 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_SECURITY_DELAY_OPTION_AWAY_ALWAYS");
  v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v16 setIdentifier:@"DTO_SECURITY_OPTION_ALWAYS_ID"];
  [v16 setProperty:v9 forKey:v13];
  [v5 addObject:v16];
  __int16 v17 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  uint64_t v18 = [v17 isStrictModeEnabled];

  __int16 v19 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = [NSNumber numberWithBool:v18];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v20;
    _os_log_impl(&dword_23D33A000, v19, OS_LOG_TYPE_DEFAULT, "DTO: Strict Mode [%@]", buf, 0xCu);
  }
  if (v18) {
    __int16 v21 = v16;
  }
  else {
    __int16 v21 = v12;
  }
  [v8 setProperty:v21 forKey:*MEMORY[0x263F60200]];

  return v5;
}

- (void)updateFooterForSecurityOptionsGroupSpecifier:(id)a3
{
  id v8 = a3;
  id v4 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_SECURITY_DELAY_OPTIONS_GROUP_FOOTER_DESCRIPTION_FAMILIAR_LOCATIONS_ONLY");
  id v5 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  int v6 = [v5 isStrictModeEnabled];

  if (v6)
  {
    uint64_t v7 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_SECURITY_DELAY_OPTIONS_GROUP_FOOTER_DESCRIPTION_ALWAYS");

    id v4 = (void *)v7;
  }
  [v8 setProperty:v4 forKey:*MEMORY[0x263F600F8]];
}

- (void)toggleToStrictMode:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke;
  v6[3] = &unk_264E95D90;
  objc_copyWeak(&v7, &location);
  [v5 toggleToStrictMode:v3 withCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2;
  v3[3] = &unk_264E956D0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      [WeakRetained reloadEntirePane];
    }
    else {
      [WeakRetained showAlertForFailedToUpdateSecurityDelay];
    }
  }
  else
  {
    id v4 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2_cold_1();
    }
  }
}

- (void)userUpdatedSecurityOptionTo:(id)a3
{
  id v4 = a3;
  char v5 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
  char v6 = [v5 isRatchetEnabled];

  if (v6)
  {
    id v7 = [v4 identifier];
    int v8 = [v7 isEqualToString:@"DTO_SECURITY_OPTION_ALWAYS_ID"];

    if (v8)
    {
      uint64_t v9 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_23D33A000, v9, OS_LOG_TYPE_DEFAULT, "DTO: User upgraded security option to Always", (uint8_t *)buf, 2u);
      }

      [(PSUIDeviceTakeOverSectionController *)self toggleToStrictMode:1];
    }
    else
    {
      int v11 = [v4 identifier];
      int v12 = [v11 isEqualToString:@"DTO_SECURITY_OPTION_ALWAYS_FAMILIAR_ID"];

      if (v12)
      {
        uint64_t v13 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_23D33A000, v13, OS_LOG_TYPE_DEFAULT, "DTO: User downgraded security option to Familiar Locations only", (uint8_t *)buf, 2u);
        }

        objc_initWeak(buf, self);
        v14 = [(PSUIDeviceTakeOverSectionController *)self dtoController];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke;
        v15[3] = &unk_264E95CB0;
        objc_copyWeak(&v16, buf);
        [v14 gateWithRatchetForOperation:10 forPresentingVC:self completion:v15];

        objc_destroyWeak(&v16);
        objc_destroyWeak(buf);
      }
    }
  }
  else
  {
    id v10 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSUIDeviceTakeOverSectionController userUpdatedSecurityOptionTo:]();
    }
  }
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    BOOL v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_156;
    block[3] = &unk_264E954A8;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    char v5 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained toggleToStrictMode:0];
    }
    else
    {
      char v6 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_2();
      }
    }
  }
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_156(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained reloadEntirePane];
  }
  else
  {
    BOOL v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_156_cold_1();
    }
  }
}

- (BOOL)shouldIgnoreSecurityOptionsGroupRowSelectionFor:(id)a3
{
  id v4 = a3;
  char v5 = [(PSUIDeviceTakeOverSectionController *)self getGroupSpecifierForSpecifier:v4];
  char v6 = [v5 identifier];
  if ([v6 isEqualToString:@"DTO_SECURITY_OPTIONS_GROUP_ID"])
  {
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F60200]];
    char v8 = [v7 isEqualToSpecifier:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)showAlertForFailedToUpdateSecurityDelay
{
  BOOL v3 = (void *)MEMORY[0x263F82418];
  id v4 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_COULD_NOT_UPDATE_SECURITY_DELAY");
  char v5 = [v3 alertControllerWithTitle:0 message:v4 preferredStyle:1];

  char v6 = (void *)MEMORY[0x263F82400];
  id v7 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_ALERT_OK_BUTTON");
  char v8 = [v6 actionWithTitle:v7 style:0 handler:&__block_literal_global_161];
  [v5 addAction:v8];

  uint64_t v9 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_23D33A000, v9, OS_LOG_TYPE_DEFAULT, "Security options: Alert [Shown]", v10, 2u);
  }

  [(PSUIDeviceTakeOverSectionController *)self presentViewController:v5 animated:1 completion:0];
}

void __78__PSUIDeviceTakeOverSectionController_showAlertForFailedToUpdateSecurityDelay__block_invoke()
{
  v0 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_23D33A000, v0, OS_LOG_TYPE_DEFAULT, "Security options: Alert [Dismissed]", v1, 2u);
  }
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
}

- (BOOL)isFindMyEnabled
{
  return self->_isFindMyEnabled;
}

- (void)setIsFindMyEnabled:(BOOL)a3
{
  self->_isFindMyEnabled = a3;
}

- (void).cxx_destruct
{
}

void __57__PSUIDeviceTakeOverSectionController_proceedToEnableDTO__block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Turn On Protection [Failed] - No instance (self)", v2, v3, v4, v5, v6);
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Turn Off Protection [Failed] - No instance (self)", v2, v3, v4, v5, v6);
}

void __58__PSUIDeviceTakeOverSectionController_proceedToDisableDTO__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Turn Off Protection [Failed] as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __56__PSUIDeviceTakeOverSectionController_openLearnMoreLink__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Failed to open support link.", v2, v3, v4, v5, v6);
}

void __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Find My Device: Failed to set property - No instance (self)", v2, v3, v4, v5, v6);
}

void __66__PSUIDeviceTakeOverSectionController_setUpFindMyEnablementStatus__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_23D33A000, a2, OS_LOG_TYPE_ERROR, "Find My Device: Failed to retrieve state: %@", (uint8_t *)&v4, 0xCu);
}

- (void)ensureAccountSecurityIsSufficientWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_23D33A000, log, OS_LOG_TYPE_ERROR, "Account security: Upgrading [Failed] - %@", (uint8_t *)&v1, 0xCu);
}

void __94__PSUIDeviceTakeOverSectionController_showDTOAlertForFailureToToggleToState_withRatchetError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Could not open Learn More - No instance (self)", v2, v3, v4, v5, v6);
}

void __58__PSUIDeviceTakeOverSectionController_toggleToStrictMode___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Unable to toggle Security Options UI - missing instance (self)", v2, v3, v4, v5, v6);
}

- (void)userUpdatedSecurityOptionTo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Will not toggle security options - DTO is off", v2, v3, v4, v5, v6);
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Not downgrading security option to Familiar Locations only as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Unable to toggle security option to non-Strict mode - missing instance (self)", v2, v3, v4, v5, v6);
}

void __67__PSUIDeviceTakeOverSectionController_userUpdatedSecurityOptionTo___block_invoke_156_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Unable to refresh Security Options UI - missing instance (self)", v2, v3, v4, v5, v6);
}

@end