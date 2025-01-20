@interface ICSMailConfigController
- (ICSMailConfigController)initWithAccount:(id)a3 presenter:(id)a4;
- (id)parentViewControllerForObjectModel:(id)a3;
- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4;
- (void)_cleanupLoader;
- (void)configureEmailAccount;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
- (void)presentCreateFreeEmailPromptWithCompletion:(id)a3 isForNotes:(BOOL)a4;
@end

@implementation ICSMailConfigController

- (ICSMailConfigController)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSMailConfigController;
  v9 = [(ICSMailConfigController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (void)presentCreateFreeEmailPromptWithCompletion:(id)a3 isForNotes:(BOOL)a4
{
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a3;
  id v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = v8;
  if (a4)
  {
    id v20 = [v8 localizedStringForKey:@"TURN_ON_NOTES_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    objc_super v12 = @"TURN_ON_NOTES_TITLE";
  }
  else
  {
    id v20 = [v8 localizedStringForKey:@"TURN_ON_MAIL_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    objc_super v12 = @"TURN_ON_MAIL_TITLE";
  }
  v13 = [v10 localizedStringForKey:v12 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"CREATE_EMAIL_BUTTON" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  v18 = [MEMORY[0x263F82418] alertWithTitle:v13 message:v20 cancelButtonTitle:v17 defaultButtonTitle:v15 actionHandler:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [WeakRetained presentViewController:v18 animated:0 completion:0];
}

- (void)configureEmailAccount
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke;
  aBlock[3] = &unk_2655B5688;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = [MEMORY[0x263F82438] sharedApplication];
  [v4 setNetworkActivityIndicatorVisible:1];

  uint64_t v5 = [(ACAccount *)self->_account identifier];
  if (v5
    && (v6 = (void *)v5,
        [(ACAccount *)self->_account aa_authToken],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    id v8 = [MEMORY[0x263EFB210] defaultStore];
    account = self->_account;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_4;
    v10[3] = &unk_2655B5CE0;
    v11 = v3;
    [v8 renewCredentialsForAccount:account completion:v10];
  }
  else
  {
    v3[2](v3);
  }
}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke(uint64_t a1)
{
  v2 = dispatch_queue_create("createEmailAccountQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_2;
  block[3] = &unk_2655B5688;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F259C0] urlConfiguration];
  v3 = [v2 addEmailURL];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_3;
  v6[3] = &unk_2655B5900;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (!*(void *)(*(void *)(a1 + 40) + 24))
    {
      id v2 = objc_alloc_init(MEMORY[0x263F829B8]);
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v2;

      id v5 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      [*(id *)(*(void *)(a1 + 40) + 24) setModalPresentationStyle:2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
    }
    id v7 = *(void **)(*(void *)(a1 + 40) + 32);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F63790]);
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = *(void **)(v9 + 32);
      *(void *)(v9 + 32) = v8;

      id v7 = *(void **)(*(void *)(a1 + 40) + 32);
    }
    objc_msgSend(v7, "setDelegate:");
    id v13 = (id)[objc_alloc(MEMORY[0x263F25778]) initWithURLString:*(void *)(a1 + 32) account:*(void *)(*(void *)(a1 + 40) + 8)];
    v11 = *(void **)(*(void *)(a1 + 40) + 32);
    objc_super v12 = [v13 urlRequest];
    [v11 loadXMLUIWithRequest:v12];
  }
  else
  {
    id v13 = [MEMORY[0x263F82438] sharedApplication];
    [v13 setNetworkActivityIndicatorVisible:0];
  }
}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_5;
  v2[3] = &unk_2655B5CB8;
  uint64_t v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __48__ICSMailConfigController_configureEmailAccount__block_invoke_5(uint64_t result)
{
  if (!*(void *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [MEMORY[0x263F82438] sharedApplication];
  [v8 setNetworkActivityIndicatorVisible:0];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke;
  aBlock[3] = &unk_2655B5688;
  aBlock[4] = self;
  uint64_t v9 = _Block_copy(aBlock);
  if (a5 == 2)
  {
    [v7 presentInParentViewController:self->_addEmailNavController animated:1];
    [v7 setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    v15 = [WeakRetained presentedViewController];
    addEmailNavController = self->_addEmailNavController;

    if (v15 != addEmailNavController)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_presenter);
      [v17 presentViewController:self->_addEmailNavController animated:1 completion:0];
    }
    addEmailObjectModels = self->_addEmailObjectModels;
    if (!addEmailObjectModels)
    {
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v20 = self->_addEmailObjectModels;
      self->_addEmailObjectModels = v19;

      addEmailObjectModels = self->_addEmailObjectModels;
    }
    [(NSMutableArray *)addEmailObjectModels addObject:v7];
  }
  else if (a5 == 1)
  {
    v10 = self->_account;
    [(ACAccount *)self->_account setEnabled:1 forDataclass:*MEMORY[0x263EFACB8]];
    id v11 = objc_loadWeakRetained((id *)&self->_presenter);
    [v11 reloadSpecifiers];

    objc_super v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_2;
    block[3] = &unk_2655B5750;
    v22 = v10;
    id v23 = v9;
    id v13 = v10;
    dispatch_async(v12, block);
  }
}

uint64_t __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) dismissViewControllerAnimated:1 completion:0];
}

void __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFB210] defaultStore];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_3;
  v5[3] = &unk_2655B5D08;
  id v6 = v2;
  id v3 = *(void **)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v2;
  objc_msgSend(v4, "aa_updatePropertiesForAppleAccount:completion:", v3, v5);
}

void __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_4;
  v3[3] = &unk_2655B5890;
  id v4 = *(id *)(a1 + 48);
  [v1 saveVerifiedAccount:v2 withCompletionHandler:v3];
}

void __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_5;
  block[3] = &unk_2655B5728;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setNetworkActivityIndicatorVisible:0];
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_addEmailNavController;
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  if ([a4 isEqualToString:*MEMORY[0x263F63810]])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained reloadSpecifiers];

    id v7 = objc_loadWeakRetained((id *)&self->_presenter);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__ICSMailConfigController_objectModel_pressedButton_attributes___block_invoke;
    v10[3] = &unk_2655B5688;
    void v10[4] = self;
    [v7 dismissViewControllerAnimated:1 completion:v10];

    addEmailObjectModels = self->_addEmailObjectModels;
    self->_addEmailObjectModels = 0;

    addEmailNavController = self->_addEmailNavController;
    self->_addEmailNavController = 0;

    [(ICSMailConfigController *)self _cleanupLoader];
  }
}

void __64__ICSMailConfigController_objectModel_pressedButton_attributes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    if ([v4 isMailSetupForced]) {
      [v4 cancelButtonTapped:*(void *)(a1 + 32)];
    }
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 absoluteString];
  v10 = (void *)[objc_alloc(MEMORY[0x263F25778]) initWithURLString:v9 account:self->_account];
  id v11 = [v10 urlRequest];
  objc_super v12 = (void *)[v11 mutableCopy];

  [v12 setHTTPMethod:v8];
  LODWORD(v11) = [v8 isEqualToString:@"POST"];

  if (v11)
  {
    id v13 = [v15 postbackData];
    [v12 setHTTPBody:v13];
  }
  [(RUILoader *)self->_addEmailLoader loadXMLUIWithRequest:v12];
  v14 = [MEMORY[0x263F82438] sharedApplication];
  [v14 setNetworkActivityIndicatorVisible:1];
}

- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)_cleanupLoader
{
  [(RUILoader *)self->_addEmailLoader cancel];
  [(RUILoader *)self->_addEmailLoader setDelegate:0];
  addEmailLoader = self->_addEmailLoader;
  self->_addEmailLoader = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addEmailObjectModels, 0);
  objc_storeStrong((id *)&self->_addEmailLoader, 0);
  objc_storeStrong((id *)&self->_addEmailNavController, 0);
  objc_destroyWeak((id *)&self->_presenter);

  objc_storeStrong((id *)&self->_account, 0);
}

@end