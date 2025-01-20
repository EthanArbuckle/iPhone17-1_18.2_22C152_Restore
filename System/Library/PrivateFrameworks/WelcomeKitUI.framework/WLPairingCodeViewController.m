@interface WLPairingCodeViewController
- (BOOL)showCancelButton;
- (WLPairingCodeViewController)initWithPairingCode:(id)a3 wifiPSK:(id)a4 ssid:(id)a5 welcomeController:(id)a6;
- (id)cancellationBlock;
- (id)getLocalImportOptionsHandler;
- (id)importLocalContentHandler;
- (id)stashDataLocallyHandler;
- (id)viewWillDisappearBlock;
- (id)viewWillDismissBlock;
- (void)_appleInternalOptionsTapped:(id)a3;
- (void)_importLocalContent;
- (void)_setStashDataLocally:(BOOL)a3;
- (void)cancel;
- (void)setCancellationBlock:(id)a3;
- (void)setGetLocalImportOptionsHandler:(id)a3;
- (void)setImportLocalContentHandler:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setStashDataLocallyHandler:(id)a3;
- (void)setViewWillDisappearBlock:(id)a3;
- (void)setViewWillDismissBlock:(id)a3;
- (void)showActivityIndicatorView;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WLPairingCodeViewController

- (WLPairingCodeViewController)initWithPairingCode:(id)a3 wifiPSK:(id)a4 ssid:(id)a5 welcomeController:(id)a6
{
  v62[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v60 = a5;
  id v59 = a6;
  v12 = WLLocalizedString();
  v13 = WLLocalizedString();
  v14 = (void *)MEMORY[0x263F827E8];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v14 imageNamed:@"MoveToiOS" inBundle:v15];
  v61.receiver = self;
  v61.super_class = (Class)WLPairingCodeViewController;
  v17 = [(WLPairingCodeViewController *)&v61 initWithTitle:v12 detailText:v13 icon:v16 contentLayout:2];

  if (v17)
  {
    id v58 = v11;
    objc_storeStrong((id *)&v17->_wifiPSK, a4);
    objc_storeStrong((id *)&v17->_ssid, a5);
    v18 = v17;
    objc_storeStrong((id *)&v17->_welcomeController, a6);
    v19 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v10];
    if ([v10 length] != 1)
    {
      uint64_t v20 = 0;
      uint64_t v21 = *MEMORY[0x263F82288];
      unint64_t v22 = 1;
      do
      {
        unint64_t v23 = v20 + 1;
        if (3 * (v22 / 3) - 1 == v20) {
          double v24 = 20.0;
        }
        else {
          double v24 = 5.0;
        }
        v25 = [NSNumber numberWithDouble:v24];
        objc_msgSend(v19, "addAttribute:value:range:", v21, v25, v20, 1);

        ++v22;
        ++v20;
      }
      while (v23 < [v10 length] - 1);
    }
    id v26 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v26 setAttributedText:v19];
    [v26 setNumberOfLines:0];
    v27 = [MEMORY[0x263F825C8] labelColor];
    [v26 setTextColor:v27];

    v28 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v26 setBackgroundColor:v28];

    v29 = [MEMORY[0x263F82760] monospacedSystemFontOfSize:32.0 weight:*MEMORY[0x263F83638]];
    [v26 setFont:v29];

    [v26 setTextAlignment:1];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v26 setAccessibilityIdentifier:@"PairingCode"];
    v30 = v18;
    v31 = [(WLPairingCodeViewController *)v18 contentView];
    [v31 addSubview:v26];

    v49 = (void *)MEMORY[0x263F08938];
    v56 = [v26 leadingAnchor];
    v57 = [(WLPairingCodeViewController *)v18 contentView];
    v55 = [v57 leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v62[0] = v54;
    v52 = [v26 trailingAnchor];
    v53 = [(WLPairingCodeViewController *)v18 contentView];
    v51 = [v53 trailingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v62[1] = v50;
    v47 = [v26 bottomAnchor];
    v48 = [(WLPairingCodeViewController *)v18 contentView];
    v46 = [v48 bottomAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v62[2] = v45;
    v32 = [v26 lastBaselineAnchor];
    v33 = [(WLPairingCodeViewController *)v18 contentView];
    v34 = [v33 topAnchor];
    v35 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v36 = [v35 userInterfaceIdiom];
    double v37 = 96.0;
    if (v36 == 1) {
      double v37 = 106.0;
    }
    v38 = [v32 constraintEqualToAnchor:v34 constant:v37];
    v62[3] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:4];
    [v49 activateConstraints:v39];

    v40 = [v26 centerXAnchor];
    v41 = [(WLPairingCodeViewController *)v30 contentView];
    v42 = [v41 centerXAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v17 = v30;
    id v11 = v58;
  }

  return v17;
}

- (void)_appleInternalOptionsTapped:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F862A0], "isInternal", a3))
  {
    v4 = [(WLPairingCodeViewController *)self getLocalImportOptionsHandler];

    if (v4)
    {
      [(OBLinkTrayButton *)self->_appleInternalOptionsButton setEnabled:0];
      v5 = [(WLPairingCodeViewController *)self getLocalImportOptionsHandler];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke;
      v6[3] = &unk_2648707B8;
      v6[4] = self;
      ((void (**)(void, void *))v5)[2](v5, v6);
    }
  }
}

void __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke(uint64_t a1, char a2, char a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_2;
  v3[3] = &unk_264870790;
  v3[4] = *(void *)(a1 + 32);
  char v4 = a3;
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82418];
  v3 = [NSString stringWithFormat:@"SSID: %@\nPSK: %@", *(void *)(*(void *)(a1 + 32) + 1192), *(void *)(*(void *)(a1 + 32) + 1184)];
  char v4 = [v2 alertControllerWithTitle:@"WiFi Info" message:v3 preferredStyle:1];

  char v5 = [MEMORY[0x263F82400] actionWithTitle:@"OK" style:0 handler:0];
  [v4 addAction:v5];

  v6 = (void *)MEMORY[0x263F82400];
  if (*(unsigned char *)(a1 + 40))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_3;
    v13[3] = &unk_264870768;
    v13[4] = *(void *)(a1 + 32);
    v7 = @"Don't Build Local Content";
    v8 = v13;
LABEL_5:
    id v10 = [v6 actionWithTitle:v7 style:0 handler:v8];
    [v4 addAction:v10];

    goto LABEL_6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_4;
  v12[3] = &unk_264870768;
  v12[4] = *(void *)(a1 + 32);
  v9 = [MEMORY[0x263F82400] actionWithTitle:@"Build Local Content" style:0 handler:v12];
  [v4 addAction:v9];

  if (*(unsigned char *)(a1 + 41))
  {
    v6 = (void *)MEMORY[0x263F82400];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_5;
    v11[3] = &unk_264870768;
    v11[4] = *(void *)(a1 + 32);
    v7 = @"Import Local Content";
    v8 = v11;
    goto LABEL_5;
  }
LABEL_6:
  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
}

uint64_t __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStashDataLocally:0];
}

uint64_t __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStashDataLocally:1];
}

uint64_t __59__WLPairingCodeViewController__appleInternalOptionsTapped___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _importLocalContent];
}

- (void)_setStashDataLocally:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(WLPairingCodeViewController *)self stashDataLocallyHandler];

  if (v5)
  {
    v6 = [(WLPairingCodeViewController *)self stashDataLocallyHandler];
    v6[2](v6, v3);
  }
}

- (void)_importLocalContent
{
  BOOL v3 = [(WLPairingCodeViewController *)self importLocalContentHandler];

  if (v3)
  {
    char v4 = [(WLPairingCodeViewController *)self importLocalContentHandler];
    v4[2]();
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WLPairingCodeViewController;
  [(WLOnboardingViewController *)&v5 viewDidLoad];
  if (self->_showCancelButton)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    char v4 = [(OBBaseWelcomeController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
}

- (void)cancel
{
  if (self->_cancellationBlock)
  {
    objc_initWeak(&location, self);
    cancellationBlock = (void (**)(id, void *))self->_cancellationBlock;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__WLPairingCodeViewController_cancel__block_invoke;
    v6[3] = &unk_2648707E0;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(WLPairingCodeViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

void __37__WLPairingCodeViewController_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showActivityIndicatorView];
}

- (void)showActivityIndicatorView
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v5 startAnimating];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v5];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WLPairingCodeViewController;
  [(WLPairingCodeViewController *)&v10 viewWillDisappear:a3];
  id v4 = [(WLPairingCodeViewController *)self viewWillDisappearBlock];

  if (v4)
  {
    id v5 = [(WLPairingCodeViewController *)self viewWillDisappearBlock];
    v5[2]();
  }
  v6 = [(WLPairingCodeViewController *)self navigationController];
  id v7 = [v6 transitionCoordinator];
  v8 = [v7 viewControllerForKey:*MEMORY[0x263F83C00]];

  if (v8 == self
    && (([(WLPairingCodeViewController *)self isMovingFromParentViewController] & 1) != 0
     || [(WLPairingCodeViewController *)self isBeingDismissed]))
  {
    viewWillDismissBlock = (void (**)(void))self->_viewWillDismissBlock;
    if (viewWillDismissBlock) {
      viewWillDismissBlock[2]();
    }
  }
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (id)viewWillDisappearBlock
{
  return self->_viewWillDisappearBlock;
}

- (void)setViewWillDisappearBlock:(id)a3
{
}

- (id)getLocalImportOptionsHandler
{
  return self->_getLocalImportOptionsHandler;
}

- (void)setGetLocalImportOptionsHandler:(id)a3
{
}

- (id)stashDataLocallyHandler
{
  return self->_stashDataLocallyHandler;
}

- (void)setStashDataLocallyHandler:(id)a3
{
}

- (id)importLocalContentHandler
{
  return self->_importLocalContentHandler;
}

- (void)setImportLocalContentHandler:(id)a3
{
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
}

- (id)viewWillDismissBlock
{
  return self->_viewWillDismissBlock;
}

- (void)setViewWillDismissBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDismissBlock, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
  objc_storeStrong(&self->_importLocalContentHandler, 0);
  objc_storeStrong(&self->_stashDataLocallyHandler, 0);
  objc_storeStrong(&self->_getLocalImportOptionsHandler, 0);
  objc_storeStrong(&self->_viewWillDisappearBlock, 0);
  objc_storeStrong((id *)&self->_appleInternalOptionsButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_wifiPSK, 0);
}

@end