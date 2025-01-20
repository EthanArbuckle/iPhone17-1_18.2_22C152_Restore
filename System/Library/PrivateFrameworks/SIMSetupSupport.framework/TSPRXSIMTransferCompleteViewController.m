@interface TSPRXSIMTransferCompleteViewController
- (TSPRXSIMTransferCompleteViewController)init;
- (TSSIMSetupFlowDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation TSPRXSIMTransferCompleteViewController

- (TSPRXSIMTransferCompleteViewController)init
{
  v49[5] = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)TSPRXSIMTransferCompleteViewController;
  v2 = [(TSPRXSIMTransferCompleteViewController *)&v48 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"PRXCARD_SOURCE_COMPLETE_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSPRXSIMTransferCompleteViewController *)v2 setTitle:v4];

    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"PRXCARD_SOURCE_COMPLETE_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSPRXSIMTransferCompleteViewController *)v2 setSubtitle:v6];

    v44 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle"];
    v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v44];
    v8 = [MEMORY[0x263F825C8] systemBlueColor];
    [v7 setTintColor:v8];

    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(TSPRXSIMTransferCompleteViewController *)v2 contentView];
    [v9 addSubview:v7];

    objc_initWeak(&location, v2);
    v10 = (void *)MEMORY[0x263F62360];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __46__TSPRXSIMTransferCompleteViewController_init__block_invoke;
    v45[3] = &unk_264827C58;
    objc_copyWeak(&v46, &location);
    v43 = [v10 actionWithTitle:v12 style:0 handler:v45];

    id v13 = (id)[(TSPRXSIMTransferCompleteViewController *)v2 addAction:v43];
    v14 = [(TSPRXSIMTransferCompleteViewController *)v2 contentView];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    if (v16 >= v18) {
      double v16 = v18;
    }
    v30 = (void *)MEMORY[0x263F08938];
    v40 = [v7 topAnchor];
    v42 = [(TSPRXSIMTransferCompleteViewController *)v2 contentView];
    v41 = [v42 mainContentGuide];
    v39 = [v41 topAnchor];
    v38 = [v40 constraintGreaterThanOrEqualToAnchor:v39];
    v49[0] = v38;
    v35 = [v7 centerXAnchor];
    v37 = [(TSPRXSIMTransferCompleteViewController *)v2 contentView];
    v36 = [v37 mainContentGuide];
    v34 = [v36 centerXAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v49[1] = v33;
    v31 = [v7 centerYAnchor];
    v32 = [(TSPRXSIMTransferCompleteViewController *)v2 contentView];
    v19 = [v32 mainContentGuide];
    v20 = [v19 centerYAnchor];
    v21 = [v31 constraintEqualToAnchor:v20];
    v49[2] = v21;
    v22 = [v7 widthAnchor];
    double v23 = v16 * 0.275;
    v24 = [v22 constraintEqualToConstant:v23];
    v49[3] = v24;
    v25 = [v7 heightAnchor];
    v26 = [v25 constraintEqualToConstant:v23];
    v49[4] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:5];
    [v30 activateConstraints:v27];

    v28 = v2;
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __46__TSPRXSIMTransferCompleteViewController_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 viewControllerDidComplete:v3];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end