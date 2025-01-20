@interface VPScannerViewController
+ (id)instantiateViewController;
- (BOOL)_canShowWhileLocked;
- (NSString)titleMessage;
- (UIButton)cancelButton;
- (UIButton)pairManuallyButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)containerView;
- (UIView)viewfinderView;
- (VPScannerView)scannerView;
- (id)eventHandler;
- (id)scannedCodeHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)handleCancelButton:(id)a3;
- (void)handlePairManuallyButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setPairManuallyButton:(id)a3;
- (void)setScannedCodeHandler:(id)a3;
- (void)setScannerView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleMessage:(id)a3;
- (void)setViewfinderView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VPScannerViewController

+ (id)instantiateViewController
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VisualPairing"];
  v3 = [MEMORY[0x263F1C9E8] storyboardWithName:@"VPScanner_iOS" bundle:v2];
  v4 = [v3 instantiateViewControllerWithIdentifier:@"ScannerProx"];

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)VPScannerViewController;
  [(VPScannerViewController *)&v9 viewDidLoad];
  v3 = [MEMORY[0x263F1CB00] currentTraitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  if (v4 != 1)
  {
    v5 = (void *)MEMORY[0x263F08938];
    v6 = [(UIView *)self->_containerView widthAnchor];
    v7 = [v6 constraintLessThanOrEqualToConstant:400.0];
    v10[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v5 activateConstraints:v8];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)VPScannerViewController;
  [(VPScannerViewController *)&v7 viewWillAppear:v3];
  v5 = [MEMORY[0x263F1CB00] currentTraitCollection];
  [v5 displayCornerRadius];
  -[UIView _setContinuousCornerRadius:](self->_containerView, "_setContinuousCornerRadius:");

  if (self->_titleMessage) {
    -[UILabel setText:](self->_titleLabel, "setText:");
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__VPScannerViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_26484EEA0;
  v6[4] = self;
  [(VPScannerView *)self->_scannerView setScannedCodeHandler:v6];
  [(VPScannerView *)self->_scannerView start];
}

uint64_t __42__VPScannerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 984);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)VPScannerViewController;
  [(VPScannerViewController *)&v7 viewDidDisappear:v3];
  [(VPScannerView *)self->_scannerView setScannedCodeHandler:0];
  [(VPScannerView *)self->_scannerView stop];
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0;

  id scannedCodeHandler = self->_scannedCodeHandler;
  self->_id scannedCodeHandler = 0;
}

- (void)handleCancelButton:(id)a3
{
  id v5 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id eventHandler = (void (**)(id, uint64_t))self->_eventHandler;
  if (eventHandler) {
    eventHandler[2](eventHandler, 1);
  }
}

- (void)handlePairManuallyButton:(id)a3
{
  id v5 = a3;
  if (gLogCategory_SVC <= 30 && (gLogCategory_SVC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id eventHandler = (void (**)(id, uint64_t))self->_eventHandler;
  if (eventHandler) {
    eventHandler[2](eventHandler, 2);
  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (id)scannedCodeHandler
{
  return self->_scannedCodeHandler;
}

- (void)setScannedCodeHandler:(id)a3
{
}

- (NSString)titleMessage
{
  return self->_titleMessage;
}

- (void)setTitleMessage:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)pairManuallyButton
{
  return self->_pairManuallyButton;
}

- (void)setPairManuallyButton:(id)a3
{
}

- (VPScannerView)scannerView
{
  return self->_scannerView;
}

- (void)setScannerView:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)viewfinderView
{
  return self->_viewfinderView;
}

- (void)setViewfinderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_storeStrong((id *)&self->_pairManuallyButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_titleMessage, 0);
  objc_storeStrong(&self->_scannedCodeHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end