@interface VPScannerView
- (BOOL)fillLayerBoundsWithVideo;
- (NSDate)firstCapturedFrameDate;
- (NSDate)firstScannedCodeDate;
- (NSDate)startDate;
- (NSError)latestError;
- (VPScannerView)initWithCoder:(id)a3;
- (VPScannerView)initWithFrame:(CGRect)a3;
- (double)viewFinderDiameter;
- (id)_setupCapture;
- (id)_setupDevice:(id)a3;
- (id)initAsProxCard;
- (id)scannedCodeHandler;
- (int64_t)autoFocusRangeRestriction;
- (int64_t)focusMode;
- (unint64_t)extractedCodeLength;
- (unint64_t)readerResetCount;
- (void)_handleCaptureSessionInterrupted:(id)a3;
- (void)_handleCaptureSessionInterruptionEnded:(id)a3;
- (void)_handleCaptureSessionRuntimeError:(id)a3;
- (void)_handleCaptureSessionStarted:(id)a3;
- (void)_handleCaptureSessionStopped:(id)a3;
- (void)_initCommon;
- (void)_postMetricAndResetAnalyticsState;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)layoutSubviews;
- (void)setAutoFocusRangeRestriction:(int64_t)a3;
- (void)setExtractedCodeLength:(unint64_t)a3;
- (void)setFillLayerBoundsWithVideo:(BOOL)a3;
- (void)setFirstCapturedFrameDate:(id)a3;
- (void)setFirstScannedCodeDate:(id)a3;
- (void)setFocusMode:(int64_t)a3;
- (void)setLatestError:(id)a3;
- (void)setReaderResetCount:(unint64_t)a3;
- (void)setScannedCodeHandler:(id)a3;
- (void)setStartDate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation VPScannerView

- (VPScannerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VPScannerView;
  v3 = -[VPScannerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VPScannerView *)v3 _initCommon];
  }
  return v4;
}

- (VPScannerView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VPScannerView;
  v5 = [(VPScannerView *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5) {
    [(VPScannerView *)v5 _initCommon];
  }

  return v6;
}

- (id)initAsProxCard
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9.receiver = self;
  v9.super_class = (Class)VPScannerView;
  objc_super v6 = -[VPScannerView initWithFrame:](&v9, sel_initWithFrame_, v2, v3, v4, v5);
  v7 = v6;
  if (v6)
  {
    v6->_isProxCardType = 1;
    v6->_fillLayerBoundsWithVideo = 1;
    [(VPScannerView *)v6 _initCommon];
  }
  return v7;
}

- (void)_initCommon
{
  self->_autoFocusRangeRestriction = 1;
  self->_focusMode = 2;
  if (!self->_isProxCardType)
  {
    double v3 = [MEMORY[0x263F15880] layer];
    viewfinderRevealLayer = self->_viewfinderRevealLayer;
    self->_viewfinderRevealLayer = v3;

    id v8 = [MEMORY[0x263F1C550] blackColor];
    -[CAShapeLayer setFillColor:](self->_viewfinderRevealLayer, "setFillColor:", [v8 CGColor]);

    LODWORD(v5) = 0.5;
    [(CAShapeLayer *)self->_viewfinderRevealLayer setOpacity:v5];
    id v9 = [(VPScannerView *)self layer];
    [v9 insertSublayer:self->_viewfinderRevealLayer atIndex:0];

    objc_super v6 = [MEMORY[0x263F15880] layer];
    viewfinderBorderLayer = self->_viewfinderBorderLayer;
    self->_viewfinderBorderLayer = v6;

    id v10 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](self->_viewfinderBorderLayer, "setFillColor:", [v10 CGColor]);

    id v11 = [MEMORY[0x263F1C550] tableCellBlueTextColor];
    -[CAShapeLayer setStrokeColor:](self->_viewfinderBorderLayer, "setStrokeColor:", [v11 CGColor]);

    id v12 = [(VPScannerView *)self layer];
    [v12 insertSublayer:self->_viewfinderBorderLayer atIndex:1];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)VPScannerView;
  [(VPScannerView *)&v11 layoutSubviews];
  double v3 = [(VPScannerView *)self layer];
  [v3 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](self->_avPreviewLayer, "setFrame:");

  if (!self->_isProxCardType)
  {
    [(VPScannerView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    id v8 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:");
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", (v5 + -200.0) * 0.5, (v7 + -200.0) * 0.5, 200.0, 200.0, 100.0);
    id v9 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](self->_viewfinderBorderLayer, "setPath:", [v9 CGPath]);
    [v8 appendPath:v9];
    [v8 setUsesEvenOddFillRule:1];
    id v10 = v8;
    -[CAShapeLayer setPath:](self->_viewfinderRevealLayer, "setPath:", [v10 CGPath]);
    [(CAShapeLayer *)self->_viewfinderRevealLayer setFillRule:*MEMORY[0x263F15AC0]];
  }
}

- (void)start
{
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  double v3 = [MEMORY[0x263EFF910] date];
  [(VPScannerView *)self setStartDate:v3];

  id v4 = [(VPScannerView *)self _setupCapture];
  if (v4)
  {
    -[VPScannerView setLatestError:](self, "setLatestError:");
  }
  else
  {
    self->_scanning = 1;
    self->_readerResetTicks = SecondsToUpTicks();
    [(AVCaptureSession *)self->_avCaptureSession startRunning];
  }
}

- (void)stop
{
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(VPScannerView *)self _postMetricAndResetAnalyticsState];
  self->_scanning = 0;
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263EF9700] object:0];
  [v6 removeObserver:self name:*MEMORY[0x263EF9708] object:0];
  [v6 removeObserver:self name:*MEMORY[0x263EF9798] object:0];
  [v6 removeObserver:self name:*MEMORY[0x263EF97A0] object:0];
  [v6 removeObserver:self name:*MEMORY[0x263EF9718] object:0];
  [(AVCaptureVideoPreviewLayer *)self->_avPreviewLayer removeFromSuperlayer];
  avPreviewLayer = self->_avPreviewLayer;
  self->_avPreviewLayer = 0;

  [(AVCaptureSession *)self->_avCaptureSession stopRunning];
  avCaptureSession = self->_avCaptureSession;
  self->_avCaptureSession = 0;

  avCaptureDevice = self->_avCaptureDevice;
  self->_avCaptureDevice = 0;
}

- (double)viewFinderDiameter
{
  return 200.0;
}

- (id)_setupCapture
{
  v35[1] = *MEMORY[0x263EF8340];
  if (self->_avCaptureSession)
  {
    id v2 = 0;
    goto LABEL_27;
  }
  id v4 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x263EFA638]);
  avCaptureSession = self->_avCaptureSession;
  self->_avCaptureSession = v4;

  if (self->_avCaptureSession)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__handleCaptureSessionStarted_ name:*MEMORY[0x263EF9700] object:self->_avCaptureSession];
    [v6 addObserver:self selector:sel__handleCaptureSessionStopped_ name:*MEMORY[0x263EF9708] object:self->_avCaptureSession];
    [v6 addObserver:self selector:sel__handleCaptureSessionRuntimeError_ name:*MEMORY[0x263EF9798] object:self->_avCaptureSession];
    [v6 addObserver:self selector:sel__handleCaptureSessionInterrupted_ name:*MEMORY[0x263EF97A0] object:self->_avCaptureSession];
    [v6 addObserver:self selector:sel__handleCaptureSessionInterruptionEnded_ name:*MEMORY[0x263EF9718] object:self->_avCaptureSession];
    [(AVCaptureSession *)self->_avCaptureSession beginConfiguration];
    double v7 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9D48]];
    avCaptureDevice = self->_avCaptureDevice;
    self->_avCaptureDevice = v7;

    if (self->_avCaptureDevice)
    {
      uint64_t v9 = -[VPScannerView _setupDevice:](self, "_setupDevice:");
      if (v9)
      {
        v32 = 0;
      }
      else
      {
        id v10 = self->_avCaptureDevice;
        id v33 = 0;
        objc_super v11 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v10 error:&v33];
        id v12 = v33;
        if (v11)
        {
          [(AVCaptureSession *)self->_avCaptureSession addInput:v11];
          id v13 = objc_alloc_init(MEMORY[0x263EFA6A0]);
          if (v13)
          {
            v14 = v13;
            [v13 setAlwaysDiscardsLateVideoFrames:1];
            uint64_t v34 = *MEMORY[0x263F04180];
            v35[0] = &unk_26DD194A0;
            v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
            [v14 setVideoSettings:v15];

            avCaptureQueue = self->_avCaptureQueue;
            if (!avCaptureQueue)
            {
              v17 = (OS_dispatch_queue *)dispatch_queue_create("VPScannerCapture", 0);
              v18 = self->_avCaptureQueue;
              self->_avCaptureQueue = v17;

              avCaptureQueue = self->_avCaptureQueue;
            }
            [v14 setSampleBufferDelegate:self queue:avCaptureQueue];
            [(AVCaptureSession *)self->_avCaptureSession addOutput:v14];
            uint64_t v19 = *MEMORY[0x263EF9738];
            if ([(AVCaptureSession *)self->_avCaptureSession canSetSessionPreset:*MEMORY[0x263EF9738]])
            {
              uint64_t v20 = v19;
            }
            else
            {
              uint64_t v20 = *MEMORY[0x263EF9778];
            }
            [(AVCaptureSession *)self->_avCaptureSession setSessionPreset:v20];
            [(AVCaptureSession *)self->_avCaptureSession commitConfiguration];
            v21 = [MEMORY[0x263EFA6B0] layerWithSession:self->_avCaptureSession];
            avPreviewLayer = self->_avPreviewLayer;
            self->_avPreviewLayer = v21;

            BOOL v23 = [(VPScannerView *)self fillLayerBoundsWithVideo];
            v24 = (void *)MEMORY[0x263EF9C78];
            if (!v23) {
              v24 = (void *)MEMORY[0x263EF9C70];
            }
            [(AVCaptureVideoPreviewLayer *)self->_avPreviewLayer setVideoGravity:*v24];
            v25 = [(VPScannerView *)self layer];
            [v25 bounds];
            -[AVCaptureVideoPreviewLayer setFrame:](self->_avPreviewLayer, "setFrame:");

            v26 = [(VPScannerView *)self layer];
            [v26 insertSublayer:self->_avPreviewLayer atIndex:0];

            v27 = [(AVCaptureVideoPreviewLayer *)self->_avPreviewLayer connection];
            if ([v27 isVideoOrientationSupported])
            {
              uint64_t v28 = [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
              if ((unint64_t)(v28 - 2) >= 3) {
                uint64_t v29 = 1;
              }
              else {
                uint64_t v29 = v28;
              }
              v30 = v27;
              [v27 setVideoOrientation:v29];
            }
            else
            {
              v30 = v27;
            }
            goto LABEL_21;
          }
          v32 = v11;
        }
        else
        {
          v32 = 0;
        }
        uint64_t v9 = (uint64_t)v12;
      }
    }
    else
    {
      v32 = 0;
      uint64_t v9 = NSErrorWithOSStatusF();
    }
    objc_super v11 = v32;
    v30 = 0;
    v14 = 0;
    id v12 = (id)v9;
    [(AVCaptureSession *)self->_avCaptureSession commitConfiguration];
  }
  else
  {
    v30 = 0;
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = 0;
    objc_super v11 = 0;
    v14 = 0;
  }
LABEL_21:
  if (v12 && gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = v12;

LABEL_27:
  return v2;
}

- (id)_setupDevice:(id)a3
{
  id v4 = a3;
  avCaptureDevice = self->_avCaptureDevice;
  id v8 = 0;
  [(AVCaptureDevice *)avCaptureDevice lockForConfiguration:&v8];
  id v6 = v8;
  if (v6)
  {
    if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if ([v4 isFocusModeSupported:self->_focusMode])
    {
      objc_msgSend(v4, "setFocusPointOfInterest:", 0.5, 0.5);
      [v4 setFocusMode:self->_focusMode];
    }
    if ([v4 isAutoFocusRangeRestrictionSupported]) {
      [v4 setAutoFocusRangeRestriction:self->_autoFocusRangeRestriction];
    }
    if ([v4 isWhiteBalanceModeSupported:2]) {
      [v4 setWhiteBalanceMode:2];
    }
    if ([v4 isExposureModeSupported:2])
    {
      objc_msgSend(v4, "setExposurePointOfInterest:", 0.5, 0.5);
      [v4 setExposureMode:2];
    }
    [(AVCaptureDevice *)self->_avCaptureDevice unlockForConfiguration];
  }

  return v6;
}

- (void)_handleCaptureSessionStarted:(id)a3
{
  id v3 = a3;
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_handleCaptureSessionStopped:(id)a3
{
  id v3 = a3;
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_handleCaptureSessionRuntimeError:(id)a3
{
  id v4 = [a3 userInfo];
  CFErrorGetTypeID();
  CFDictionaryGetTypedValue();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  -[VPScannerView setLatestError:](self, "setLatestError:", v6, v5);
}

- (void)_handleCaptureSessionInterrupted:(id)a3
{
  id v9 = [a3 userInfo];
  uint64_t Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((unint64_t)(Int64Ranged - 1) > 4) {
    id v5 = "?";
  }
  else {
    id v5 = off_26484EF10[Int64Ranged - 1];
  }
  uint64_t v7 = Int64Ranged;
  id v8 = v5;
  id v6 = NSErrorWithOSStatusF();
  -[VPScannerView setLatestError:](self, "setLatestError:", v6, v7, v8);
}

- (void)_handleCaptureSessionInterruptionEnded:(id)a3
{
  id v3 = a3;
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_postMetricAndResetAnalyticsState
{
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  id v4 = [v3 processName];
  [v28 setObject:v4 forKeyedSubscript:@"processName"];

  id v5 = [NSNumber numberWithInteger:self->_focusMode];
  [v28 setObject:v5 forKeyedSubscript:@"focusMode"];

  id v6 = [NSNumber numberWithInteger:self->_autoFocusRangeRestriction];
  [v28 setObject:v6 forKeyedSubscript:@"autoFocusRangeRestriction"];

  uint64_t v7 = [(VPScannerView *)self startDate];
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF910] date];
    id v9 = NSNumber;
    [v8 timeIntervalSinceDate:v7];
    id v10 = objc_msgSend(v9, "numberWithDouble:");
    [v28 setObject:v10 forKeyedSubscript:@"sessionDurationSeconds"];

    objc_super v11 = [(VPScannerView *)self firstCapturedFrameDate];
    id v12 = v11;
    if (v11)
    {
      id v13 = NSNumber;
      [v11 timeIntervalSinceDate:v7];
      v14 = objc_msgSend(v13, "numberWithDouble:");
      [v28 setObject:v14 forKeyedSubscript:@"secondsToFirstFrame"];
    }
    v15 = [(VPScannerView *)self firstScannedCodeDate];
    v16 = v15;
    if (v15)
    {
      v17 = NSNumber;
      [v15 timeIntervalSinceDate:v7];
      v18 = objc_msgSend(v17, "numberWithDouble:");
      [v28 setObject:v18 forKeyedSubscript:@"secondsToFirstCode"];
    }
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[VPScannerView extractedCodeLength](self, "extractedCodeLength"));
    [v28 setObject:v19 forKeyedSubscript:@"extractedCodeLength"];

    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VPScannerView readerResetCount](self, "readerResetCount"));
    [v28 setObject:v20 forKeyedSubscript:@"readerResetCount"];

    v21 = [NSNumber numberWithUnsignedLong:self->_readerWidth];
    [v28 setObject:v21 forKeyedSubscript:@"readerWidth"];

    v22 = [NSNumber numberWithUnsignedLong:self->_readerHeight];
    [v28 setObject:v22 forKeyedSubscript:@"readerHeight"];

    BOOL v23 = [NSNumber numberWithUnsignedLong:self->_readerRowBytes];
    [v28 setObject:v23 forKeyedSubscript:@"readerRowBytes"];
  }
  v24 = [(VPScannerView *)self latestError];
  v25 = v24;
  if (v24)
  {
    v26 = [v24 localizedDescription];
    [v28 setObject:v26 forKeyedSubscript:@"latestError"];
  }
  AnalyticsSendEvent();
  if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize()))
  {
    id v27 = v28;
    LogPrintF();
  }
  -[VPScannerView setLatestError:](self, "setLatestError:", 0, v27);
  [(VPScannerView *)self setStartDate:0];
  [(VPScannerView *)self setFirstCapturedFrameDate:0];
  [(VPScannerView *)self setFirstScannedCodeDate:0];
  [(VPScannerView *)self setReaderResetCount:0];
  [(VPScannerView *)self setExtractedCodeLength:0];
  [(VPScannerView *)self setLatestError:0];
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v30 = a3;
  id v29 = a5;
  if (!self->_scanning) {
    goto LABEL_36;
  }
  id v8 = [(VPScannerView *)self firstCapturedFrameDate];

  if (!v8)
  {
    id v9 = [MEMORY[0x263EFF910] date];
    [(VPScannerView *)self setFirstCapturedFrameDate:v9];
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  objc_super v11 = ImageBuffer;
  if (!ImageBuffer)
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize()) {
      goto LABEL_54;
    }
LABEL_45:
    LogPrintF();
LABEL_54:
    id v28 = NSErrorWithOSStatusF();
    [(VPScannerView *)self setLatestError:v28];
LABEL_22:

    goto LABEL_36;
  }
  if (!CVPixelBufferIsPlanar(ImageBuffer))
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize()) {
      goto LABEL_54;
    }
    goto LABEL_45;
  }
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v11, 1uLL);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v11, 1uLL);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v11, 1uLL);
  unsigned int v15 = BytesPerRowOfPlane;
  if (!self->_reader
    || WidthOfPlane != self->_readerWidth
    || HeightOfPlane != self->_readerHeight
    || BytesPerRowOfPlane != self->_readerRowBytes)
  {
    if (gLogCategory_SV <= 30 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    reader = self->_reader;
    if (reader)
    {
      HCImagePerspectiveReader::~HCImagePerspectiveReader(reader);
      MEMORY[0x22A6A4700](v17, 0x1030C4065FB1DD3, v18, v19, v20);
    }
    operator new();
  }
  uint64_t v21 = mach_absolute_time();
  unint64_t v22 = v21;
  if (self->_readerLastProgress > 0.0 && v21 - self->_readerLastWatermarkTicks >= self->_readerResetTicks)
  {
    if (gLogCategory_SV <= 20 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    HCImagePerspectiveReader::Reset(self->_reader);
  }
  if (CVPixelBufferLockBaseAddress(v11, 1uLL))
  {
    if (gLogCategory_SV > 60 || gLogCategory_SV == -1 && !_LogCategory_Initialize()) {
      goto LABEL_54;
    }
    goto LABEL_45;
  }
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v11, 1uLL);
  int v24 = HCImagePerspectiveReader::ProcessUVFrame((uint64_t)self->_reader, (uint64_t)BaseAddressOfPlane, HeightOfPlane, WidthOfPlane, v15, (uint64_t)v31);
  CVPixelBufferUnlockBaseAddress(v11, 1uLL);
  if (v24)
  {
    if (gLogCategory_SV <= 60 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v28 = NSErrorWithOSStatusF();
    [(VPScannerView *)self setLatestError:v28];
    goto LABEL_22;
  }
  if (v31[0])
  {
    self->_readerLastWatermarkTicks = v22;
    v25 = self->_reader;
    float v26 = (float)*(unsigned int *)(*((void *)v25->var5 + 1) + 4) / (float)**((unsigned int **)v25->var5 + 1);
    if (v26 != self->_readerLastProgress)
    {
      if (gLogCategory_SV <= 10 && (gLogCategory_SV != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_readerLastProgress = v26;
      v25 = self->_reader;
    }
    var6 = v25->var6;
    if (var6)
    {
      objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", var6, strnlen(v25->var6, 0x6EuLL), 4);
      HCImagePerspectiveReader::Reset(self->_reader);
    }
  }
LABEL_36:
}

uint64_t __68__VPScannerView_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 536);
  if (v1) {
    return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)(*(void *)(result + 32) + 536), *(void *)(result + 40));
  }
  return result;
}

- (int64_t)autoFocusRangeRestriction
{
  return self->_autoFocusRangeRestriction;
}

- (void)setAutoFocusRangeRestriction:(int64_t)a3
{
  self->_autoFocusRangeRestriction = a3;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(int64_t)a3
{
  self->_focusMode = a3;
}

- (id)scannedCodeHandler
{
  return self->_scannedCodeHandler;
}

- (void)setScannedCodeHandler:(id)a3
{
}

- (BOOL)fillLayerBoundsWithVideo
{
  return self->_fillLayerBoundsWithVideo;
}

- (void)setFillLayerBoundsWithVideo:(BOOL)a3
{
  self->_fillLayerBoundsWithVideo = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 544, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)firstScannedCodeDate
{
  return (NSDate *)objc_getProperty(self, a2, 552, 1);
}

- (void)setFirstScannedCodeDate:(id)a3
{
}

- (NSDate)firstCapturedFrameDate
{
  return (NSDate *)objc_getProperty(self, a2, 560, 1);
}

- (void)setFirstCapturedFrameDate:(id)a3
{
}

- (unint64_t)readerResetCount
{
  return self->_readerResetCount;
}

- (void)setReaderResetCount:(unint64_t)a3
{
  self->_readerResetCount = a3;
}

- (unint64_t)extractedCodeLength
{
  return self->_extractedCodeLength;
}

- (void)setExtractedCodeLength:(unint64_t)a3
{
  self->_extractedCodeLength = a3;
}

- (NSError)latestError
{
  return (NSError *)objc_getProperty(self, a2, 584, 1);
}

- (void)setLatestError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_firstCapturedFrameDate, 0);
  objc_storeStrong((id *)&self->_firstScannedCodeDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_scannedCodeHandler, 0);
  objc_storeStrong((id *)&self->_viewfinderRevealLayer, 0);
  objc_storeStrong((id *)&self->_viewfinderBorderLayer, 0);
  objc_storeStrong((id *)&self->_avPreviewLayer, 0);
  objc_storeStrong((id *)&self->_avCaptureSession, 0);
  objc_storeStrong((id *)&self->_avCaptureQueue, 0);
  objc_storeStrong((id *)&self->_avCaptureDevice, 0);
}

@end