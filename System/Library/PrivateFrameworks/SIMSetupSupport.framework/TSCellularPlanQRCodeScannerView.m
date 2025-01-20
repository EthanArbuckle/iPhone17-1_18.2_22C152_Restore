@interface TSCellularPlanQRCodeScannerView
- (AVCaptureMetadataOutputObjectsDelegate)delegate;
- (AVCaptureVideoPreviewLayer)previewLayer;
- (BOOL)canUseCamera;
- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)a3;
- (TSCellularPlanQRCodeScannerView)initWithDelegate:(id)a3;
- (id)getAVCaptureMetadataOutput;
- (void)_changeCameraConfiguration;
- (void)_handleRuntimeError:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setupCameraSession;
- (void)startRunning;
- (void)stopRunning;
- (void)updateRectOfInterest;
@end

@implementation TSCellularPlanQRCodeScannerView

- (TSCellularPlanQRCodeScannerView)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanQRCodeScannerView;
  result = -[TSCellularPlanQRCodeScannerView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (result) {
    result->_delegate = (AVCaptureMetadataOutputObjectsDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  metadataQueue = self->_metadataQueue;
  self->_metadataQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanQRCodeScannerView;
  [(TSCellularPlanQRCodeScannerView *)&v5 dealloc];
}

- (void)setupCameraSession
{
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanQRCodeScannerView;
  [(TSCellularPlanQRCodeScannerView *)&v4 layoutSubviews];
  v3 = [(AVCaptureVideoPreviewLayer *)self->_previewLayer superlayer];
  [v3 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");
  [(TSCellularPlanQRCodeScannerView *)self updateRectOfInterest];
}

- (void)startRunning
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleRuntimeError_ name:*MEMORY[0x263EF9798] object:0];

  if (self->_canUseCamera)
  {
    objc_initWeak(&location, self);
    metadataQueue = self->_metadataQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__TSCellularPlanQRCodeScannerView_startRunning__block_invoke;
    v5[3] = &unk_264827A20;
    objc_copyWeak(&v6, &location);
    dispatch_async(metadataQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __47__TSCellularPlanQRCodeScannerView_startRunning__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _changeCameraConfiguration];
    [v2[51] startRunning];
    WeakRetained = v2;
  }
}

- (void)stopRunning
{
  if (self->_canUseCamera)
  {
    objc_initWeak(&location, self);
    metadataQueue = self->_metadataQueue;
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    v7 = __46__TSCellularPlanQRCodeScannerView_stopRunning__block_invoke;
    v8 = &unk_264827A20;
    objc_copyWeak(&v9, &location);
    dispatch_async(metadataQueue, &v5);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_super v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v5, v6, v7, v8);
  [v4 removeObserver:self name:*MEMORY[0x263EF9798] object:0];
}

void __46__TSCellularPlanQRCodeScannerView_stopRunning__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[51] stopRunning];
    WeakRetained = v2;
  }
}

- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)a3
{
  -[AVCaptureVideoPreviewLayer pointForCaptureDevicePointOfInterest:](self->_previewLayer, "pointForCaptureDevicePointOfInterest:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_handleRuntimeError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[TSCellularPlanQRCodeScannerView _handleRuntimeError:](v4, v5);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke;
  block[3] = &unk_2648279D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_2;
  v3[3] = &unk_2648279D0;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_3;
  v2[3] = &unk_2648280A0;
  v2[4] = v4;
  return [MEMORY[0x263F82E00] animateWithDuration:v3 animations:v2 completion:0.25];
}

uint64_t __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __55__TSCellularPlanQRCodeScannerView__handleRuntimeError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 408);
  *(void *)(v2 + 408) = 0;

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 432);
  return [v4 removeFromSuperlayer];
}

- (void)_changeCameraConfiguration
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v3 = [(AVCaptureDeviceInput *)self->_deviceInput device];
  id v5 = 0;
  [v3 lockForConfiguration:&v5];
  id v4 = v5;
  if ([v3 isFocusModeSupported:2])
  {
    objc_msgSend(v3, "setFocusPointOfInterest:", 0.5, 0.5);
    [v3 setFocusMode:2];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 isAutoFocusRangeRestrictionSupported])
  {
    [v3 setAutoFocusRangeRestriction:1];
  }
  if ([v3 isWhiteBalanceModeSupported:2]) {
    [v3 setWhiteBalanceMode:2];
  }
  if ([v3 isExposureModeSupported:2])
  {
    objc_msgSend(v3, "setExposurePointOfInterest:", 0.5, 0.5);
    [v3 setExposureMode:2];
  }
  [v3 unlockForConfiguration];
  [MEMORY[0x263F158F8] commit];
}

- (id)getAVCaptureMetadataOutput
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(AVCaptureSession *)self->_captureSession outputs];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateRectOfInterest
{
  id v3 = [(TSCellularPlanQRCodeScannerView *)self getAVCaptureMetadataOutput];
  if (v3)
  {
    id v9 = v3;
    [(AVCaptureVideoPreviewLayer *)self->_previewLayer frame];
    double v5 = v4;
    [(AVCaptureVideoPreviewLayer *)self->_previewLayer frame];
    -[AVCaptureVideoPreviewLayer metadataOutputRectOfInterestForRect:](self->_previewLayer, "metadataOutputRectOfInterestForRect:", 10.0, 10.0, v5 + -20.0, v6 + -20.0);
    id v3 = v9;
    if (v8 != 0.0 && v7 != 0.0)
    {
      objc_msgSend(v9, "setRectOfInterest:");
      id v3 = v9;
    }
  }
}

- (void)setOrientation:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    int64_t v7 = a3;
    __int16 v8 = 2080;
    id v9 = "-[TSCellularPlanQRCodeScannerView setOrientation:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "Set new orientation:%ld @%s", (uint8_t *)&v6, 0x16u);
  }

  [(AVCaptureVideoPreviewLayer *)self->_previewLayer setOrientation:a3];
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (BOOL)canUseCamera
{
  return self->_canUseCamera;
}

- (AVCaptureMetadataOutputObjectsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AVCaptureMetadataOutputObjectsDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)_handleRuntimeError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [a1 userInfo];
  int v4 = 138412546;
  double v5 = v3;
  __int16 v6 = 2080;
  int64_t v7 = "-[TSCellularPlanQRCodeScannerView _handleRuntimeError:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Capture failed because of runtime error (%@) @%s", (uint8_t *)&v4, 0x16u);
}

@end