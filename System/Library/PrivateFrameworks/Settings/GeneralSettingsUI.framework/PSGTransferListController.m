@interface PSGTransferListController
- (FLFollowUpActionHandler)prebuddyActionHandler;
- (id)specifiers;
- (void)beginPrebuddy:(id)a3;
- (void)deviceFullErase:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)presentExitBuddyWithUpsellTradeIn:(BOOL)a3 withCompletion:(id)a4;
- (void)setPrebuddyActionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation PSGTransferListController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PSGTransferListController;
  [(PSGTransferListController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"PreBuddyText" target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v6 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v7 = [MEMORY[0x263F53C50] sharedConnection];
    int v8 = [v7 effectiveBoolValueForSetting:*MEMORY[0x263F53710]];

    id v9 = objc_alloc_init(MEMORY[0x263EFB210]);
    v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    int v11 = PSUsedByManagedAccount();
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = PSG_LocalizedStringForReset(@"GET_STARTED");
    v14 = [v12 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v14 setProperty:@"prebuddyBegin" forKey:*MEMORY[0x263F60138]];
    [v14 setObject:&unk_26F103B50 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
    [v14 setButtonAction:sel_beginPrebuddy_];
    BOOL v15 = v8 == 2 && v10 == 0;
    if (v15 || v11) {
      [v14 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
    [v5 addObject:v6];
    [v5 addObject:v14];
    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)beginPrebuddy:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F559E0], "sharedManager", a3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__PSGTransferListController_beginPrebuddy___block_invoke;
  v5[3] = &unk_264E8CE80;
  v5[4] = self;
  [v4 followupAction:v5];
}

void __43__PSGTransferListController_beginPrebuddy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _PSGLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23D28D000, v4, OS_LOG_TYPE_DEFAULT, "Initializing followup object", (uint8_t *)buf, 2u);
  }

  id v5 = objc_alloc(MEMORY[0x263F353C8]);
  v6 = [MEMORY[0x263F559E0] baseFollowupItem];
  v7 = (void *)[v5 initWithItem:v6];

  objc_initWeak(buf, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__PSGTransferListController_beginPrebuddy___block_invoke_22;
  v10[3] = &unk_264E8CE30;
  objc_copyWeak(&v11, buf);
  [v7 setExtensionRequestedViewControllerPresentation:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__PSGTransferListController_beginPrebuddy___block_invoke_2;
  v8[3] = &unk_264E8CE58;
  objc_copyWeak(&v9, buf);
  v8[4] = *(void *)(a1 + 32);
  [v7 handleExtensionBasedAction:v3 completionWithUserInfo:v8];
  [*(id *)(a1 + 32) setPrebuddyActionHandler:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __43__PSGTransferListController_beginPrebuddy___block_invoke_22(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentViewController:v3 animated:1 completion:0];
}

void __43__PSGTransferListController_beginPrebuddy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _PSGLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "followup handler completion block", buf, 2u);
  }

  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F559C8]];

  int v7 = [v6 BOOLValue];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (v7)
  {
    v10 = _PSGLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "followup handler finished", v17, 2u);
    }

    id v11 = [*(id *)(a1 + 32) navigationController];
    v12 = [v11 navigationController];

    v13 = [v12 viewControllers];
    v14 = [v13 firstObject];
    BOOL v15 = [v14 table];
    [v15 _scrollToTopIfPossible:0];

    id v16 = (id)[v12 popToRootViewControllerAnimated:1];
  }
  else
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
  [v9 setPrebuddyActionHandler:0];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 objectForKeyedSubscript:@"path"];
  if ([v8 length])
  {
    if (([v8 isEqualToString:@"exitBuddy"] & 1) != 0
      || [v8 isEqualToString:@"exitBuddyUpSellTradeIn"])
    {
      -[PSGTransferListController presentExitBuddyWithUpsellTradeIn:withCompletion:](self, "presentExitBuddyWithUpsellTradeIn:withCompletion:", [v8 isEqualToString:@"exitBuddyUpSellTradeIn"], v7);
    }
    else
    {
      -[PSGTransferListController handleURL:withCompletion:](&v10, sel_handleURL_withCompletion_, v6, v7, v9.receiver, v9.super_class, self, PSGTransferListController);
    }
  }
  else
  {
    -[PSGTransferListController handleURL:withCompletion:](&v9, sel_handleURL_withCompletion_, v6, v7, self, PSGTransferListController, v10.receiver, v10.super_class);
  }
}

- (void)deviceFullErase:(id)a3
{
}

- (void)presentExitBuddyWithUpsellTradeIn:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x263F3A3B0];
  id v7 = a4;
  id v8 = [v6 defaultConfiguration];
  [v8 setUpsellTradeIn:v4];
  [MEMORY[0x263F3A3B8] presentUsingParentViewController:self configuration:v8 completion:v7];
}

- (FLFollowUpActionHandler)prebuddyActionHandler
{
  return self->_prebuddyActionHandler;
}

- (void)setPrebuddyActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end