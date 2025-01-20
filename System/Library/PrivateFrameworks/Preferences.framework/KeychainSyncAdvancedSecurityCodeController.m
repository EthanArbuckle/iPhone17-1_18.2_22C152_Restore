@interface KeychainSyncAdvancedSecurityCodeController
- (BOOL)showsDisableRecoveryOption;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_finishedWithSpecifier:(id)a3;
- (void)nextPressed;
- (void)setShowsDisableRecoveryOption:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation KeychainSyncAdvancedSecurityCodeController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
  [(PSListController *)&v7 viewDidLoad];
  v3 = +[PSKeychainSyncManager sharedManager];
  char v4 = [v3 isRunningInBuddy];

  if ((v4 & 1) == 0)
  {
    v5 = [(KeychainSyncAdvancedSecurityCodeController *)self navigationItem];
    v6 = PS_LocalizedStringForKeychainSync(@"ADVANCED_SECURITY_OPTIONS");
    [v5 setTitle:v6];
  }
}

- (id)specifiers
{
  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    v19.receiver = self;
    v19.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
    char v4 = [(PSKeychainSyncViewController *)&v19 specifiers];
    v5 = [(PSKeychainSyncViewController *)self groupSpecifier];
    [v5 setProperty:MEMORY[0x1E4F1CC38] forKey:@"isRadioGroup"];

    v6 = +[PSKeychainSyncManager sharedManager];
    int v7 = [v6 isRunningInBuddy];

    if (v7)
    {
      v8 = [(PSKeychainSyncViewController *)self headerView];
      v9 = PS_LocalizedStringForKeychainSync(@"ADVANCED_SECURITY_CODE_OPTIONS");
      [v8 setTitleText:v9];
    }
    v10 = PS_LocalizedStringForKeychainSync(@"CREATE_COMPLEX_CODE");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v11 setProperty:&unk_1EFB74240 forKey:@"securityCodeChoice"];
    [v11 setProperty:&unk_1EFB74228 forKey:@"accessory"];
    [v4 addObject:v11];
    v12 = PS_LocalizedStringForKeychainSync(@"CREATE_RANDOM_CODE");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v13 setProperty:&unk_1EFB74258 forKey:@"securityCodeChoice"];
    [v13 setProperty:&unk_1EFB74228 forKey:@"accessory"];
    [v4 addObject:v13];
    if (self->_showsDisableRecoveryOption)
    {
      v14 = PS_LocalizedStringForKeychainSync(@"DONT_CREATE_SECURITY_CODE");
      v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v15 setProperty:&unk_1EFB74270 forKey:@"securityCodeChoice"];
      [v15 setProperty:&unk_1EFB74228 forKey:@"accessory"];
      [v4 addObject:v15];
      v16 = [(PSKeychainSyncViewController *)self groupSpecifier];
      v17 = PS_LocalizedStringForKeychainSync(@"DISABLE_RECOVERY_DETAILS");
      [v16 setProperty:v17 forKey:@"footerText"];
    }
    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

- (void)_finishedWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"securityCodeChoice"];
  int v6 = [v5 intValue];

  if (v6 == 3)
  {
    int v7 = (void *)MEMORY[0x1E4F42728];
    v8 = PS_LocalizedStringForKeychainSync(@"DONT_CREATE_SECURITY_CODE_QUESTION");
    v9 = PS_LocalizedStringForKeychainSync(@"DISABLE_RECOVERY_DESCRIPTION");
    v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    v11 = (void *)MEMORY[0x1E4F42720];
    v12 = PS_LocalizedStringForKeychainSync(@"GO_BACK");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke;
    v19[3] = &unk_1E5C5DAE8;
    v19[4] = self;
    v13 = [v11 actionWithTitle:v12 style:1 handler:v19];
    [v10 addAction:v13];

    v14 = (void *)MEMORY[0x1E4F42720];
    v15 = PS_LocalizedStringForKeychainSync(@"SKIP_CODE");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke_2;
    v18[3] = &unk_1E5C5DAE8;
    v18[4] = self;
    v16 = [v14 actionWithTitle:v15 style:0 handler:v18];
    [v10 addAction:v16];

    [(KeychainSyncAdvancedSecurityCodeController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v10 = [(PSKeychainSyncViewController *)self delegate];
    v17 = [v4 propertyForKey:@"securityCodeChoice"];
    [v10 keychainSyncController:self didFinishWithResult:v17 error:0];
  }
}

void __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) table];
  v2 = [*(id *)(a1 + 32) table];
  v3 = [v2 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v3 animated:1];
}

void __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 keychainSyncController:*(void *)(a1 + 32) didFinishWithResult:&unk_1EFB74270 error:0];

  id v5 = [*(id *)(a1 + 32) table];
  v3 = [*(id *)(a1 + 32) table];
  id v4 = [v3 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v4 animated:1];
}

- (void)nextPressed
{
  v3 = [(PSKeychainSyncViewController *)self groupSpecifier];
  id v4 = [v3 propertyForKey:@"radioGroupCheckedSpecifier"];

  [(KeychainSyncAdvancedSecurityCodeController *)self _finishedWithSpecifier:v4];
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v4 = +[PSKeychainSyncManager sharedManager];
  char v5 = [v4 isRunningInBuddy] ^ 1;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:a4]];
  [(KeychainSyncAdvancedSecurityCodeController *)self _finishedWithSpecifier:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:v7]];
  v23.receiver = self;
  v23.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
  v9 = [(PSListController *)&v23 tableView:v6 cellForRowAtIndexPath:v7];

  v10 = [v9 textLabel];
  [v10 setNumberOfLines:0];

  v11 = [v9 textLabel];
  [v11 setLineBreakMode:0];

  v12 = [v9 textLabel];
  v13 = [MEMORY[0x1E4F428B8] clearColor];
  [v12 setBackgroundColor:v13];

  v14 = [v8 propertyForKey:@"accessory"];
  objc_msgSend(v9, "setAccessoryType:", (int)objc_msgSend(v14, "intValue"));

  if (self->_cellTextWidth == 0.0)
  {
    v15 = [v9 layoutManager];
    v16 = [(KeychainSyncAdvancedSecurityCodeController *)self view];
    [v16 frame];
    [v15 textRectForCell:v9 rowWidth:1 forSizing:CGRectGetWidth(v25)];
    double v18 = v17;

    self->_cellTextWidth = v18;
    objc_super v19 = [v9 textLabel];
    v20 = [v19 font];
    cellFont = self->_cellFont;
    self->_cellFont = v20;

    [v6 reloadData];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_cellTextWidth > 0.0 && self->_cellFont)
  {
    v8 = +[PSKeychainSyncManager sharedManager];
    int v9 = [v8 isRunningInBuddy];

    v10 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:v7]];
    v11 = [v10 name];
    double cellTextWidth = self->_cellTextWidth;
    cellFont = self->_cellFont;
    uint64_t v25 = *MEMORY[0x1E4F42508];
    v26[0] = cellFont;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v14, 0, cellTextWidth, 1.79769313e308);
    double v16 = v15;

    double v17 = 12.0;
    if (v9) {
      double v17 = 20.0;
    }
    double v18 = 45.0;
    if (v9) {
      double v18 = 60.0;
    }
    float v19 = v16 + v17 * 2.0;
    double v20 = floorf(v19);
    if (v18 >= v20) {
      double v21 = v18;
    }
    else {
      double v21 = v20;
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
    [(PSListController *)&v24 tableView:v6 heightForRowAtIndexPath:v7];
    double v21 = v22;
  }

  return v21;
}

- (BOOL)showsDisableRecoveryOption
{
  return self->_showsDisableRecoveryOption;
}

- (void)setShowsDisableRecoveryOption:(BOOL)a3
{
  self->_showsDisableRecoveryOption = a3;
}

- (void).cxx_destruct
{
}

@end