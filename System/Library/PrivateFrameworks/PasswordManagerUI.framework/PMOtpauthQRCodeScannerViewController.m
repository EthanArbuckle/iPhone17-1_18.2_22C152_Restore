@interface PMOtpauthQRCodeScannerViewController
- (PMOtpauthQRCodeScannerViewControllerDelegate)delegate;
- (int64_t)_avCaptureVideoOrientationFromUIDeviceOrientation:(int64_t)a3;
- (void)_configureCaptureSession;
- (void)_dismiss:(id)a3;
- (void)_updatePreviewLayerOrientation;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PMOtpauthQRCodeScannerViewController

- (void)viewDidLoad
{
  v32[4] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  [(PMOtpauthQRCodeScannerViewController *)&v31 viewDidLoad];
  v3 = [(PMOtpauthQRCodeScannerViewController *)self view];
  [v3 setOpaque:1];
  v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  viewfinderView = self->_viewfinderView;
  self->_viewfinderView = v4;

  [(UIView *)self->_viewfinderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_viewfinderView];
  v24 = (void *)MEMORY[0x263F08938];
  v29 = [(UIView *)self->_viewfinderView topAnchor];
  v28 = [v3 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v32[0] = v27;
  v26 = [(UIView *)self->_viewfinderView rightAnchor];
  v25 = [v3 rightAnchor];
  v6 = [v26 constraintEqualToAnchor:v25];
  v32[1] = v6;
  v7 = [(UIView *)self->_viewfinderView bottomAnchor];
  v30 = v3;
  v8 = [v3 bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v32[2] = v9;
  v10 = [(UIView *)self->_viewfinderView leftAnchor];
  v11 = [v3 leftAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v32[3] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  [v24 activateConstraints:v13];

  [(PMOtpauthQRCodeScannerViewController *)self _configureCaptureSession];
  v14 = [MEMORY[0x263EFA6B0] layerWithSession:self->_captureSession];
  previewLayer = self->_previewLayer;
  self->_previewLayer = v14;

  [(AVCaptureVideoPreviewLayer *)self->_previewLayer setVideoGravity:*MEMORY[0x263EF9C78]];
  v16 = [(UIView *)self->_viewfinderView layer];
  [v16 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");

  [(PMOtpauthQRCodeScannerViewController *)self _updatePreviewLayerOrientation];
  v17 = [(UIView *)self->_viewfinderView layer];
  [v17 addSublayer:self->_previewLayer];

  v18 = [(PMOtpauthQRCodeScannerViewController *)self navigationController];
  v19 = [v18 navigationBar];

  v20 = [v19 standardAppearance];
  [v19 setScrollEdgeAppearance:v20];

  v21 = [(PMOtpauthQRCodeScannerViewController *)self navigationItem];
  v22 = _WBSLocalizedString();
  [v21 setTitle:v22];

  v23 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismiss_];
  [v21 setRightBarButtonItem:v23];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  [(PMOtpauthQRCodeScannerViewController *)&v6 viewWillAppear:a3];
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PMOtpauthQRCodeScannerViewController_viewWillAppear___block_invoke;
  block[3] = &unk_265439F78;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __55__PMOtpauthQRCodeScannerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) startRunning];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  [(PMOtpauthQRCodeScannerViewController *)&v6 viewWillDisappear:a3];
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__PMOtpauthQRCodeScannerViewController_viewWillDisappear___block_invoke;
  block[3] = &unk_265439F78;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __58__PMOtpauthQRCodeScannerViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) stopRunning];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  [(PMOtpauthQRCodeScannerViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(UIView *)self->_viewfinderView layer];
  [v3 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PMOtpauthQRCodeScannerViewController;
  -[PMOtpauthQRCodeScannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PMOtpauthQRCodeScannerViewController *)self _updatePreviewLayerOrientation];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  objc_super v6 = objc_msgSend(a4, "firstObject", a3);
  v7 = [v6 type];
  v8 = (void *)*MEMORY[0x263EF9F40];

  if (v7 == v8)
  {
    v9 = [v6 stringValue];
    v10 = [NSURL URLWithString:v9 relativeToURL:0];
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained QRCodeScannerViewController:self didScanQRCodeWithURLValue:v10];
      }
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PMOtpauthQRCodeScannerViewController captureOutput:didOutputMetadataObjects:fromConnection:]((uint64_t)v9, v12);
      }
    }
  }
}

- (void)_dismiss:(id)a3
{
  id v4 = [(PMOtpauthQRCodeScannerViewController *)self navigationController];
  v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_configureCaptureSession
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138412290;
  objc_super v6 = v4;
  _os_log_error_impl(&dword_258906000, v3, OS_LOG_TYPE_ERROR, "Unable to create input for QR code capture device. %@", (uint8_t *)&v5, 0xCu);
}

void __64__PMOtpauthQRCodeScannerViewController__configureCaptureSession__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__PMOtpauthQRCodeScannerViewController__configureCaptureSession__block_invoke_2;
    block[3] = &unk_265439F78;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __64__PMOtpauthQRCodeScannerViewController__configureCaptureSession__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss:0];
}

- (void)_updatePreviewLayerOrientation
{
  id v3 = [MEMORY[0x263F82670] currentDevice];
  -[AVCaptureVideoPreviewLayer setOrientation:](self->_previewLayer, "setOrientation:", -[PMOtpauthQRCodeScannerViewController _avCaptureVideoOrientationFromUIDeviceOrientation:](self, "_avCaptureVideoOrientationFromUIDeviceOrientation:", [v3 orientation]));
}

- (int64_t)_avCaptureVideoOrientationFromUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3) {
    return 1;
  }
  else {
    return a3;
  }
}

- (PMOtpauthQRCodeScannerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PMOtpauthQRCodeScannerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewfinderView, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)captureOutput:(uint64_t)a1 didOutputMetadataObjects:(NSObject *)a2 fromConnection:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258906000, a2, OS_LOG_TYPE_DEBUG, "QR code does not contain a valid URL. %@", (uint8_t *)&v2, 0xCu);
}

@end