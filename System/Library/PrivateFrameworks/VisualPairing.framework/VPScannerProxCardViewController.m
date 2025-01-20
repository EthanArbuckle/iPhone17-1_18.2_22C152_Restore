@interface VPScannerProxCardViewController
- (BOOL)_canShowWhileLocked;
- (VPScannerView)scannerView;
- (id)scannedCodeHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)setScannedCodeHandler:(id)a3;
- (void)setScannerView:(id)a3;
- (void)start;
- (void)stop;
- (void)viewDidLoad;
@end

@implementation VPScannerProxCardViewController

- (void)viewDidLoad
{
  v26[4] = *MEMORY[0x263EF8340];
  if (gLogCategory_SPVC <= 30 && (gLogCategory_SPVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v25.receiver = self;
  v25.super_class = (Class)VPScannerProxCardViewController;
  [(VPScannerProxCardViewController *)&v25 viewDidLoad];
  v3 = [[VPScannerView alloc] initAsProxCard];
  scannerView = self->_scannerView;
  self->_scannerView = v3;

  v5 = [(VPScannerProxCardViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:1];

  [(VPScannerView *)self->_scannerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(VPScannerProxCardViewController *)self view];
  [v6 addSubview:self->_scannerView];

  v17 = (void *)MEMORY[0x263F08938];
  v23 = [(VPScannerView *)self->_scannerView topAnchor];
  v24 = [(VPScannerProxCardViewController *)self view];
  v22 = [v24 topAnchor];
  v21 = [v23 constraintLessThanOrEqualToAnchor:v22];
  v26[0] = v21;
  v19 = [(VPScannerView *)self->_scannerView bottomAnchor];
  v20 = [(VPScannerProxCardViewController *)self view];
  v18 = [v20 bottomAnchor];
  v16 = [v19 constraintGreaterThanOrEqualToAnchor:v18];
  v26[1] = v16;
  v15 = [(VPScannerView *)self->_scannerView leftAnchor];
  v7 = [(VPScannerProxCardViewController *)self view];
  v8 = [v7 leftAnchor];
  v9 = [v15 constraintEqualToAnchor:v8];
  v26[2] = v9;
  v10 = [(VPScannerView *)self->_scannerView rightAnchor];
  v11 = [(VPScannerProxCardViewController *)self view];
  v12 = [v11 rightAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v26[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
  [v17 activateConstraints:v14];

  [(VPScannerView *)self->_scannerView setNeedsLayout];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)start
{
  if (gLogCategory_SPVC <= 30 && (gLogCategory_SPVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__VPScannerProxCardViewController_start__block_invoke;
  v3[3] = &unk_26484EEA0;
  v3[4] = self;
  [(VPScannerView *)self->_scannerView setScannedCodeHandler:v3];
  [(VPScannerView *)self->_scannerView start];
}

uint64_t __40__VPScannerProxCardViewController_start__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 976);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stop
{
  if (gLogCategory_SPVC <= 30 && (gLogCategory_SPVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(VPScannerView *)self->_scannerView setScannedCodeHandler:0];
  scannerView = self->_scannerView;
  [(VPScannerView *)scannerView stop];
}

- (id)scannedCodeHandler
{
  return self->_scannedCodeHandler;
}

- (void)setScannedCodeHandler:(id)a3
{
}

- (VPScannerView)scannerView
{
  return self->_scannerView;
}

- (void)setScannerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_storeStrong(&self->_scannedCodeHandler, 0);
}

@end