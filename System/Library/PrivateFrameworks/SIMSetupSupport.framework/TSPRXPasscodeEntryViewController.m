@interface TSPRXPasscodeEntryViewController
- (SSProximityDevice)btDevice;
- (TSPRXPasscodeEntryViewController)initWithBtDevice:(id)a3 passcodeType:(int)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (void)_handlePINCodeUpdate:(id)a3;
- (void)retry;
- (void)setBtDevice:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TSPRXPasscodeEntryViewController

- (TSPRXPasscodeEntryViewController)initWithBtDevice:(id)a3 passcodeType:(int)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TSPRXPasscodeEntryViewController;
  v8 = [(TSPRXPasscodeEntryViewController *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_btDevice, a3);
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"PRXCARD_AUTHENTICATION_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSPRXPasscodeEntryViewController *)v9 setTitle:v11];

    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"PRXCARD_AUTHENTICATION_SUBTITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    [(TSPRXPasscodeEntryViewController *)v9 setSubtitle:v13];

    [(TSPRXPasscodeEntryViewController *)v9 setDismissalType:3];
    [(PRXPasscodeEntryViewController *)v9 setNumberOfDigits:6];
    char v14 = a4 + 1;
    if ((a4 + 1) <= 0xA)
    {
      if (((1 << v14) & 0x7C1) != 0)
      {
        v15 = _TSLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[TSPRXPasscodeEntryViewController initWithBtDevice:passcodeType:](a4, v15);
        }

        goto LABEL_12;
      }
      if (((1 << v14) & 0x24) != 0)
      {
        v16 = v9;
        uint64_t v17 = 4;
LABEL_11:
        [(PRXPasscodeEntryViewController *)v16 setNumberOfDigits:v17];
        goto LABEL_12;
      }
      if (a4 == 3)
      {
        v16 = v9;
        uint64_t v17 = 8;
        goto LABEL_11;
      }
    }
LABEL_12:
    objc_initWeak(&location, v9);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__TSPRXPasscodeEntryViewController_initWithBtDevice_passcodeType___block_invoke;
    v19[3] = &unk_264828238;
    objc_copyWeak(&v20, &location);
    [(PRXPasscodeEntryViewController *)v9 setTextEntryCompletionHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__TSPRXPasscodeEntryViewController_initWithBtDevice_passcodeType___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePINCodeUpdate:v3];
}

- (void)retry
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__TSPRXPasscodeEntryViewController_retry__block_invoke;
  block[3] = &unk_2648279D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__TSPRXPasscodeEntryViewController_retry__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) passcodeEntryView];
  [v1 setText:&stru_26DBE8E78];
}

- (void)_handlePINCodeUpdate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2080;
    v9 = "-[TSPRXPasscodeEntryViewController _handlePINCodeUpdate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "auth code = %@ @%s", (uint8_t *)&v6, 0x16u);
  }

  [(SSProximityDevice *)self->_btDevice verifyPIN:v4];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSProximityDevice)btDevice
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setBtDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithBtDevice:(int)a1 passcodeType:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  id v4 = "-[TSPRXPasscodeEntryViewController initWithBtDevice:passcodeType:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]unsupported passcode type : %d @%s", (uint8_t *)v2, 0x12u);
}

@end