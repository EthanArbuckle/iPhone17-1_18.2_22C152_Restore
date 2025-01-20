@interface PSGTransferOrResetController
- (PSGResetOrEraseListController)_resetOrEraseListController;
- (PSGTransferListController)_transferListController;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)set_resetOrEraseListController:(id)a3;
- (void)set_transferListController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PSGTransferOrResetController

- (void)viewDidLoad
{
  v71[7] = *MEMORY[0x263EF8340];
  v70.receiver = self;
  v70.super_class = (Class)PSGTransferOrResetController;
  [(PSGTransferOrResetController *)&v70 viewDidLoad];
  v3 = PSG_LocalizedStringForGeneral(@"TRANSFER_OR_RESET_TITLE");
  [(PSGTransferOrResetController *)self setTitle:v3];

  v4 = objc_alloc_init(PSGTransferListController);
  transferListController = self->__transferListController;
  self->__transferListController = v4;

  v6 = [(PSGTransferOrResetController *)self _transferListController];
  v7 = [v6 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(PSGTransferOrResetController *)self _transferListController];
  [(PSGTransferOrResetController *)self addChildViewController:v8];

  v9 = [(PSGTransferOrResetController *)self view];
  v10 = [(PSGTransferOrResetController *)self _transferListController];
  v11 = [v10 view];
  [v9 addSubview:v11];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PSGTransferOrResetController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_264E8C8A0;
  aBlock[4] = self;
  id v33 = _Block_copy(aBlock);
  v12 = objc_alloc_init(PSGResetOrEraseListController);
  resetOrEraseListController = self->__resetOrEraseListController;
  self->__resetOrEraseListController = v12;

  v14 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  v15 = [v14 view];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  [(PSGTransferOrResetController *)self addChildViewController:v16];

  v17 = [(PSGTransferOrResetController *)self view];
  v18 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  v19 = [v18 view];
  [v17 addSubview:v19];

  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __43__PSGTransferOrResetController_viewDidLoad__block_invoke_2;
  v68[3] = &unk_264E8C8A0;
  v68[4] = self;
  v32 = (void (**)(void))_Block_copy(v68);
  v31 = (void *)MEMORY[0x263F08938];
  v67 = [(PSGTransferOrResetController *)self _transferListController];
  v66 = [v67 view];
  v64 = [v66 topAnchor];
  v65 = [(PSGTransferOrResetController *)self view];
  v63 = [v65 topAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v71[0] = v62;
  v61 = [(PSGTransferOrResetController *)self _transferListController];
  v60 = [v61 view];
  v58 = [v60 leadingAnchor];
  v59 = [(PSGTransferOrResetController *)self view];
  v57 = [v59 leadingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v71[1] = v56;
  v55 = [(PSGTransferOrResetController *)self _transferListController];
  v54 = [v55 view];
  v51 = [v54 trailingAnchor];
  v53 = [(PSGTransferOrResetController *)self view];
  v52 = [v53 trailingAnchor];
  v50 = [v51 constraintEqualToAnchor:v52];
  v71[2] = v50;
  v49 = [(PSGTransferOrResetController *)self _transferListController];
  v48 = [v49 view];
  v45 = [v48 bottomAnchor];
  v47 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  v46 = [v47 view];
  v44 = [v46 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v71[3] = v43;
  v42 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  v41 = [v42 view];
  v39 = [v41 leadingAnchor];
  v40 = [(PSGTransferOrResetController *)self view];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v71[4] = v37;
  v36 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  v35 = [v36 view];
  v34 = [v35 trailingAnchor];
  v20 = [(PSGTransferOrResetController *)self view];
  v21 = [v20 trailingAnchor];
  v22 = [v34 constraintEqualToAnchor:v21];
  v71[5] = v22;
  v23 = [(PSGTransferOrResetController *)self _resetOrEraseListController];
  v24 = [v23 view];
  v25 = [v24 bottomAnchor];
  v26 = [(PSGTransferOrResetController *)self view];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v71[6] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:7];
  [v31 activateConstraints:v29];

  if (v32) {
    v32[2](v32);
  }

  v30 = v33;
  if (v33)
  {
    (*((void (**)(void))v33 + 2))();
    v30 = v33;
  }
}

void __43__PSGTransferOrResetController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _transferListController];
  [v2 didMoveToParentViewController:*(void *)(a1 + 32)];
}

void __43__PSGTransferOrResetController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resetOrEraseListController];
  [v2 didMoveToParentViewController:*(void *)(a1 + 32)];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)PSGTransferOrResetController;
  [(PSGTransferOrResetController *)&v14 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Reset"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = PSG_BundleForGeneralSettingsUIFramework();
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"TRANSFER_OR_RESET_TITLE" table:@"General" locale:v6 bundleURL:v8];

  v10 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v10, "sf_isiPad")) {
    v11 = @"com.apple.graphic-icon.transfer-or-reset-ipad";
  }
  else {
    v11 = @"com.apple.graphic-icon.transfer-or-reset-iphone";
  }
  v12 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v15[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(PSGTransferOrResetController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:v11 title:v9 localizedNavigationComponents:v13 deepLink:v4];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PSGTransferOrResetController *)self _transferListController];
  [v8 handleURL:v7 withCompletion:v6];
}

- (PSGTransferListController)_transferListController
{
  return self->__transferListController;
}

- (void)set_transferListController:(id)a3
{
}

- (PSGResetOrEraseListController)_resetOrEraseListController
{
  return self->__resetOrEraseListController;
}

- (void)set_resetOrEraseListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resetOrEraseListController, 0);
  objc_storeStrong((id *)&self->__transferListController, 0);
}

@end