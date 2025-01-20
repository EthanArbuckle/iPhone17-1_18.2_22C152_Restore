@interface TSTransferQRCodeViewController
- (TSSIMSetupFlowDelegate)delegate;
- (TSTransferQRCodeViewController)initWithTransferCredentials:(id)a3 carrierName:(id)a4;
- (void)_userDidTapCancel;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TSTransferQRCodeViewController

- (TSTransferQRCodeViewController)initWithTransferCredentials:(id)a3 carrierName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"TRANSFER_ESIM_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  v11 = [MEMORY[0x263F827E8] systemImageNamed:@"qrcode"];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TRANSFER_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];
  v18.receiver = self;
  v18.super_class = (Class)TSTransferQRCodeViewController;
  v14 = [(TSTransferQRCodeViewController *)&v18 initWithTitle:v13 detailText:v10 icon:v11];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_transferCredentials, a3);
    objc_storeStrong((id *)&v14->_carrierName, a4);
    uint64_t v15 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v14 action:sel__userDidTapCancel];
    cancelButton = v14->_cancelButton;
    v14->_cancelButton = (UIBarButtonItem *)v15;
  }
  return v14;
}

- (void)viewDidLoad
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)TSTransferQRCodeViewController;
  [(TSOBWelcomeController *)&v37 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSTransferQRCodeViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [(OBBaseWelcomeController *)self navigationItem];
  [v6 setLeftBarButtonItem:self->_cancelButton];

  id v7 = [(NSString *)self->_transferCredentials qrCode];
  id v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    transferCredentials = self->_transferCredentials;
    *(_DWORD *)buf = 138412546;
    v39 = transferCredentials;
    __int16 v40 = 2080;
    v41 = "-[TSTransferQRCodeViewController viewDidLoad]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "generate CIImage with transferCredentials: %@ @%s", buf, 0x16u);
  }

  id v10 = objc_alloc(MEMORY[0x263F82828]);
  v11 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCIImage:v7];
  v12 = (void *)[v10 initWithImage:v11];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(TSTransferQRCodeViewController *)self view];
  [v13 addSubview:v12];

  v14 = objc_opt_new();
  if ([(NSString *)self->_carrierName length])
  {
    uint64_t v15 = NSString;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"%@_CELLULAR_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_super v18 = objc_msgSend(v15, "stringWithFormat:", v17, self->_carrierName);
    [v14 setText:v18];
  }
  else
  {
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CELLULAR_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];
    [v14 setText:v17];
  }

  [v14 setNumberOfLines:0];
  [v14 setAdjustsFontSizeToFitWidth:1];
  [v14 setLineBreakMode:0];
  [v14 setTextAlignment:1];
  v19 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
  [v14 setFont:v19];

  v20 = [MEMORY[0x263F825C8] systemGrayColor];
  [v14 setTextColor:v20];

  objc_msgSend(v14, "setFrame:", 0.0, 0.0, 40.0, 20.0);
  v21 = [(TSTransferQRCodeViewController *)self view];
  [v21 addSubview:v14];

  [v14 setIsAccessibilityElement:1];
  v22 = [v14 text];
  [v14 setAccessibilityLabel:v22];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [v12 centerXAnchor];
  v24 = [(TSTransferQRCodeViewController *)self view];
  v25 = [v24 centerXAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [v12 topAnchor];
  v28 = [(TSTransferQRCodeViewController *)self contentView];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [v14 topAnchor];
  v32 = [v12 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:15.0];
  [v33 setActive:1];

  v34 = [v14 centerXAnchor];
  v35 = [v12 centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];
}

- (void)_userDidTapCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_transferCredentials, 0);
}

@end