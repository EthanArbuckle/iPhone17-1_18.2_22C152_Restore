@interface MSDStoreInfoViewController
- (MSDStoreInfo)storeInfo;
- (MSDStoreInfoViewController)initWithStoreInfo:(id)a3 andDelegate:(id)a4;
- (MSDStoreInfoViewControllerDelegate)delegate;
- (id)_boldConfiguration;
- (id)_stackedCancelButton;
- (id)_stackedLabelWithTitle:(id)a3 andDescription:(id)a4;
- (id)_stackedStoreName:(id)a3 withIcon:(id)a4 andIconColor:(id)a5;
- (void)_close:(id)a3;
- (void)_confirm:(id)a3;
- (void)_showConfirmationAlert;
- (void)_showStoreConfirmationAlertWithCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStoreInfo:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MSDStoreInfoViewController

- (MSDStoreInfoViewController)initWithStoreInfo:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDStoreInfoViewController;
  v8 = [(MSDStoreInfoViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDStoreInfoViewController *)v8 setDelegate:v7];
    [(MSDStoreInfoViewController *)v9 setStoreInfo:v6];
  }

  return v9;
}

- (void)viewDidLoad
{
  v57[4] = *MEMORY[0x263EF8340];
  v55.receiver = self;
  v55.super_class = (Class)MSDStoreInfoViewController;
  [(MSDStoreInfoViewController *)&v55 viewDidLoad];
  v3 = [(MSDStoreInfoViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v5 = [(MSDStoreInfoViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = objc_alloc(MEMORY[0x263F1C9B8]);
  id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setAxis:1];
  [v7 setDistribution:3];
  objc_msgSend(v7, "setLayoutMargins:", 0.0, 20.0, 20.0, 20.0);
  [v7 setLayoutMarginsRelativeArrangement:1];
  v8 = [(MSDStoreInfoViewController *)self view];
  [v8 addSubview:v7];

  v50 = [v7 topAnchor];
  v52 = [(MSDStoreInfoViewController *)self view];
  v48 = [v52 safeAreaLayoutGuide];
  v47 = [v48 topAnchor];
  v46 = [v50 constraintEqualToAnchor:v47];
  v57[0] = v46;
  v44 = [v7 bottomAnchor];
  v45 = [(MSDStoreInfoViewController *)self view];
  v43 = [v45 safeAreaLayoutGuide];
  v42 = [v43 bottomAnchor];
  v41 = [v44 constraintEqualToAnchor:v42];
  v57[1] = v41;
  v39 = [v7 leadingAnchor];
  v40 = [(MSDStoreInfoViewController *)self view];
  v9 = [v40 safeAreaLayoutGuide];
  v10 = [v9 leadingAnchor];
  objc_super v11 = [v39 constraintEqualToAnchor:v10];
  v57[2] = v11;
  v12 = [v7 trailingAnchor];
  v13 = [(MSDStoreInfoViewController *)self view];
  v14 = [v13 safeAreaLayoutGuide];
  v15 = [v14 trailingAnchor];
  v16 = [v12 constraintEqualToAnchor:v15];
  v57[3] = v16;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:4];

  [MEMORY[0x263F08938] activateConstraints:v54];
  v53 = [(MSDStoreInfoViewController *)self _stackedCancelButton];
  objc_msgSend(v7, "addArrangedSubview:");
  v17 = [(MSDStoreInfoViewController *)self storeInfo];
  LODWORD(v14) = [v17 isHQ];

  v18 = [(MSDStoreInfoViewController *)self storeInfo];
  v19 = v18;
  if (v14)
  {
    uint64_t v20 = [v18 companyName];
    v21 = @"building.2.crop.circle.fill";
  }
  else
  {
    uint64_t v20 = [v18 storeName];
    v21 = @"mappin.circle.fill";
  }
  v49 = (void *)v20;

  v51 = [MEMORY[0x263F1C6B0] systemImageNamed:v21];
  v22 = [MEMORY[0x263F1C550] systemRedColor];
  v23 = [(MSDStoreInfoViewController *)self _stackedStoreName:v20 withIcon:v51 andIconColor:v22];
  [v7 addArrangedSubview:v23];
  v24 = +[MSDSetupUILocalization localizedStringForKey:@"APPLE_ID_TITLE"];
  v25 = [(MSDStoreInfoViewController *)self storeInfo];
  v26 = [v25 appleID];
  v27 = [(MSDStoreInfoViewController *)self _stackedLabelWithTitle:v24 andDescription:v26];

  [v7 addArrangedSubview:v27];
  v28 = +[MSDSetupUILocalization localizedStringForKey:@"ADDRESS_TITLE"];
  v29 = [(MSDStoreInfoViewController *)self storeInfo];
  v30 = [v29 fullAddress];
  v31 = [(MSDStoreInfoViewController *)self _stackedLabelWithTitle:v28 andDescription:v30];

  [v7 addArrangedSubview:v31];
  v32 = [MEMORY[0x263F1C488] buttonWithType:0];
  v33 = [(MSDStoreInfoViewController *)self _boldConfiguration];
  [v32 setConfiguration:v33];

  v34 = [MEMORY[0x263F1C550] systemBlueColor];
  [v32 setTintColor:v34];

  v35 = +[MSDSetupUILocalization localizedStringForKey:@"ASSIGN_TO_STORE_BUTTON"];
  [v32 setTitle:v35 forState:0];

  [v32 addTarget:self action:sel__confirm_ forControlEvents:64];
  v36 = [v32 heightAnchor];
  v37 = [v36 constraintEqualToConstant:50.0];
  v56 = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];

  [MEMORY[0x263F08938] activateConstraints:v38];
  [v7 addArrangedSubview:v32];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSDStoreInfoViewController;
  [(MSDStoreInfoViewController *)&v6 viewWillAppear:a3];
  v4 = [(MSDStoreInfoViewController *)self delegate];
  v5 = [(MSDStoreInfoViewController *)self storeInfo];
  [v4 viewWillAppear:self forStore:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSDStoreInfoViewController;
  [(MSDStoreInfoViewController *)&v6 viewWillDisappear:a3];
  v4 = [(MSDStoreInfoViewController *)self delegate];
  v5 = [(MSDStoreInfoViewController *)self storeInfo];
  [v4 viewWillClose:self forStore:v5];
}

- (void)_close:(id)a3
{
  id v4 = [(MSDStoreInfoViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)_confirm:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MSDStoreInfoViewController *)self storeInfo];
    objc_super v6 = [v5 appleID];
    id v7 = [(MSDStoreInfoViewController *)self storeInfo];
    int v8 = [v7 confirmStoreSelection];
    v9 = [(MSDStoreInfoViewController *)self storeInfo];
    v10 = [v9 confirmationCode];
    int v15 = 138543874;
    v16 = v6;
    __int16 v17 = 1024;
    int v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "User selected store %{public}@, confirmStoreSelection=%d, confirmationCode=%@", (uint8_t *)&v15, 0x1Cu);
  }
  objc_super v11 = [(MSDStoreInfoViewController *)self storeInfo];
  int v12 = [v11 confirmStoreSelection];

  if (v12)
  {
    v13 = [(MSDStoreInfoViewController *)self storeInfo];
    v14 = [v13 confirmationCode];
    [(MSDStoreInfoViewController *)self _showStoreConfirmationAlertWithCode:v14];
  }
  else
  {
    [(MSDStoreInfoViewController *)self _showConfirmationAlert];
  }
}

- (id)_stackedCancelButton
{
  id v3 = objc_alloc(MEMORY[0x263F1C9B8]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setAxis:1];
  [v4 setAlignment:4];
  [v4 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v4, "setDirectionalLayoutMargins:", 15.0, 0.0, 0.0, 0.0);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x263F1C488] buttonWithType:1];
  objc_super v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark"];
  [v5 setImage:v6 forState:0];
  id v7 = [MEMORY[0x263F1C550] systemGrayColor];
  [v5 setTintColor:v7];

  [v5 addTarget:self action:sel__close_ forControlEvents:64];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addArrangedSubview:v5];

  return v4;
}

- (id)_stackedStoreName:(id)a3 withIcon:(id)a4 andIconColor:(id)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  int v8 = (objc_class *)MEMORY[0x263F1C9B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  double v13 = *MEMORY[0x263F001A8];
  double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  __int16 v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], v14, v15, v16);
  [v17 setAxis:0];
  [v17 setAlignment:1];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setSpacing:10.0];
  int v18 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setTintColor:v9];

  [v18 setContentMode:1];
  __int16 v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v13, v14, v15, v16);
  [v19 setNumberOfLines:0];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 setText:v11];

  uint64_t v20 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
  [v19 setFont:v20];

  [v17 addArrangedSubview:v18];
  [v17 addArrangedSubview:v19];
  uint64_t v21 = [(MSDStoreInfoViewController *)self view];
  [v21 bounds];
  double v23 = v22 * 0.4 / 6.0;

  if (v23 > 60.0) {
    double v23 = 60.0;
  }
  v24 = [v18 heightAnchor];
  v25 = [v24 constraintEqualToConstant:v23];
  v36[0] = v25;
  v26 = [v18 widthAnchor];
  v27 = [v18 heightAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 multiplier:1.0];
  v36[1] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];

  [MEMORY[0x263F08938] activateConstraints:v29];
  v30 = [v19 centerYAnchor];
  v31 = [v18 centerYAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v35 = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];

  [MEMORY[0x263F08938] activateConstraints:v33];
  return v17;
}

- (id)_stackedLabelWithTitle:(id)a3 andDescription:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F1C9B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  double v9 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
  [v13 setAxis:1];
  [v13 setAlignment:1];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
  [v14 setNumberOfLines:0];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setText:v7];

  double v15 = [MEMORY[0x263F81708] boldSystemFontOfSize:14.0];
  [v14 setFont:v15];

  double v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
  [v16 setNumberOfLines:0];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setText:v6];

  __int16 v17 = [MEMORY[0x263F1C550] systemGrayColor];
  [v16 setTintColor:v17];

  [v16 setAdjustsFontSizeToFitWidth:1];
  [v13 addArrangedSubview:v14];
  [v13 addArrangedSubview:v16];

  return v13;
}

- (id)_boldConfiguration
{
  v2 = [MEMORY[0x263F1C490] filledButtonConfiguration];
  [v2 setButtonSize:3];
  id v3 = [v2 background];
  [v3 setCornerRadius:14.0];

  return v2;
}

- (void)_showStoreConfirmationAlertWithCode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke;
  v6[3] = &unk_264D882F0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke(uint64_t a1)
{
  v2 = [MSDCodeEntryAlertController alloc];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke_2;
  v5[3] = &unk_264D88318;
  uint64_t v3 = *(void *)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  id v4 = [(MSDCodeEntryAlertController *)v2 initWithVerificationCode:v3 completion:v5];
  [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
}

void __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v3 = [*(id *)(a1 + 32) storeInfo];
    [v4 didConfirmStoreAssignment:v3];
  }
}

- (void)_showConfirmationAlert
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) storeInfo];
  int v3 = [v2 isHQ];

  id v4 = [*(id *)(a1 + 32) storeInfo];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 companyName];
    id v7 = @"ASSIGN_TO_COMPANY_TITLE";
  }
  else
  {
    id v6 = [v4 storeName];
    id v7 = @"ASSIGN_TO_STORE_TITLE";
  }
  id v8 = +[MSDSetupUILocalization localizedStringForKey:v7 withStringArgument:v6];

  double v9 = +[MSDSetupUILocalization localizedStringForKey:@"ASSIGN_TO_STORE_BUTTON"];
  double v10 = +[MSDSetupUILocalization localizedStringForKey:@"CANCEL_OPTION"];
  double v11 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v8 message:0 preferredStyle:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke_2;
  v14[3] = &unk_264D882A0;
  v14[4] = *(void *)(a1 + 32);
  double v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v9 style:0 handler:v14];
  double v13 = [MEMORY[0x263F1C3F0] actionWithTitle:v10 style:1 handler:0];
  [v11 addAction:v12];
  [v11 addAction:v13];
  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
}

void __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) storeInfo];
  [v3 didConfirmStoreAssignment:v2];
}

- (MSDStoreInfoViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (MSDStoreInfo)storeInfo
{
  return self->_storeInfo;
}

- (void)setStoreInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end